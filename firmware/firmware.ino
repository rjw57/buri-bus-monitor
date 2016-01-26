// Firmware for monitor board
#include <SPI.h>
#include <stdint.h>

#include "DebouncedSwitch/debounced_switch.h"
#include "EdgeTrigger/edge_trigger.h"

#include "mx7219.h"
#include "pins.h"
#include "serialcli.h"
#include "serialstatemachine.h"

const int SPI_SPEED = 10000000;

struct BusState {
    uint32_t    address;
    byte        data;
    union {
        struct {
            unsigned sync : 1;
            unsigned nmibar : 1;
            unsigned irqbar : 1;
            unsigned ioselbar : 1;
            unsigned rdy : 1;
            unsigned vpbar : 1;
            unsigned mlbar : 1;
            unsigned unused1 : 1;
        } flags;
        byte val;
    }           ro_control;
    union {
        struct {
            unsigned be : 1;
            unsigned rstbar : 1;
            unsigned r_wbar : 1;
            unsigned phi2 : 1;
        } flags;
        byte val;
    }           rw_control;
};

struct SwitchState {
    union {
        struct {
            unsigned deposit_next : 1;
            unsigned deposit : 1;
            unsigned examine_next : 1;
            unsigned examine : 1;
            unsigned instuction_step : 1;
            unsigned cycle_step : 1;
            unsigned halt : 1;
            unsigned reset : 1;

            unsigned address : 24;
        } flags;
        struct {
            byte ctrl, a0_7, a8_15, a16_24;
        } vals;
    };
};

BusState bus_state;
SwitchState panel_switches;
SerialState serial_state;

DebouncedSwitch halt_switch, cycle_switch, instr_switch;
EdgeTrigger cycle_trigger, instr_trigger;

static void init_display();
static void update_display();
static void poll_serial();
static void update_bus();
static byte dpy_transfer(byte mx7219_reg, byte mx7219_val, byte key_out = 0);

void setup() {
    // Reset while setting up other pins.
    pinMode(PIN_RSTBAR, OUTPUT);
    digitalWrite(PIN_RSTBAR, LOW);

    // Start serial port and print banner.
    Serial.begin(9600);
    Serial.println("Buri microcomputer system monitor.");
    Serial.println("https://github.com/rjw57/buri-6502-hardware\n");
    serial_state = startSerialPrompt();

    // Set up other pin modes.
    pinMode(PIN_PHI2, INPUT);
    pinMode(PIN_R_WBAR, INPUT);
    pinMode(PIN_BE, INPUT);

    pinMode(PIN_HALT, OUTPUT);
    pinMode(PIN_STEP, OUTPUT);

    pinMode(PIN_DPYSSBAR, OUTPUT);
    pinMode(PIN_BUSSSBAR, OUTPUT);
    pinMode(PIN_ADLOAD, OUTPUT);
    pinMode(PIN_DOEBAR, OUTPUT);
    pinMode(PIN_AOEBAR, OUTPUT);

    pinMode(PIN_MOSI, OUTPUT);
    pinMode(PIN_MISO, INPUT);
    pinMode(PIN_SCK, OUTPUT);

    // Ensure we're not halting processor.
    digitalWrite(PIN_HALT, LOW);
    digitalWrite(PIN_STEP, LOW);

    // De-select all SPI peripherals
    digitalWrite(PIN_BUSSSBAR, HIGH);
    digitalWrite(PIN_DPYSSBAR, HIGH);

    // Make sure we're not asserting the bus
    digitalWrite(PIN_ADLOAD, LOW);
    digitalWrite(PIN_DOEBAR, HIGH);
    digitalWrite(PIN_AOEBAR, HIGH);

    init_display();

    // Release reset
    pinMode(PIN_RSTBAR, INPUT);
}

void loop() {
    update_bus();
    update_display();

    if(panel_switches.flags.reset) {
        digitalWrite(PIN_RSTBAR, LOW);
        pinMode(PIN_RSTBAR, OUTPUT);
    } else {
        pinMode(PIN_RSTBAR, INPUT);
    }

    halt_switch.poll(panel_switches.flags.halt == HIGH);
    cycle_switch.poll(panel_switches.flags.cycle_step);
    cycle_trigger.update(cycle_switch.state());
    instr_switch.poll(panel_switches.flags.instuction_step);
    instr_trigger.update(instr_switch.state());

    digitalWrite(PIN_HALT, halt_switch.state() ? HIGH : LOW);

    if(cycle_trigger.triggered()) {
        if(halt_switch.state()) {
            digitalWrite(PIN_STEP, HIGH);
            digitalWrite(PIN_STEP, LOW);
        }
        cycle_trigger.clear();
    }

    if(instr_trigger.triggered()) {
        if(halt_switch.state()) {
            do {
                digitalWrite(PIN_STEP, HIGH);
                digitalWrite(PIN_STEP, LOW);
                update_bus();
            } while(!bus_state.ro_control.flags.sync);
        }
        instr_trigger.clear();
    }

    /*
    Serial.print("D: "); Serial.print(bus_state.data, HEX);
    Serial.print(" A: "); Serial.print(bus_state.address, HEX);
    Serial.print(" C: "); Serial.print(bus_state.ro_control.val, BIN);
    Serial.println("");
    */

    // CLI
    poll_serial();
}

static byte dpy_transfer(byte mx7219_reg, byte mx7219_val, byte key_out) {
    byte key_state;
    SPI.beginTransaction(SPISettings(SPI_SPEED, MSBFIRST, SPI_MODE0));
    digitalWrite(PIN_DPYSSBAR, LOW);
    key_state = SPI.transfer(0);
    SPI.transfer(key_out);
    SPI.transfer(mx7219_reg);
    SPI.transfer(mx7219_val);
    digitalWrite(PIN_DPYSSBAR, HIGH);
    SPI.endTransaction();
    return key_state;
}

static void init_display() {
    dpy_transfer(MX7219_DECODE_MODE, 0x00); // No decode
    dpy_transfer(MX7219_INTENSITY, 0xFF);   // Maximum intensity
    dpy_transfer(MX7219_SCN_LIMIT, 0x05);   // Scan digits 0-5
    dpy_transfer(MX7219_DPLY_TEST, 0x00);   // Display test off
    dpy_transfer(MX7219_SHUTDOWN, 0x01);    // Normal operation

    // Switch on all lights.
    for(int i=0; i<=5; ++i) {
        dpy_transfer(MX7219_DIGIT_0 + i, 0xff);
    }
}

static void update_display() {
    byte digit4 = 0, digit5 = 0;

    dpy_transfer(MX7219_DIGIT_0 + 0, bus_state.data, 0x1);
    panel_switches.vals.a0_7 = 
        dpy_transfer(MX7219_DIGIT_0 + 1, bus_state.address & 0xff, 0x2);
    panel_switches.vals.a8_15 = 
        dpy_transfer(MX7219_DIGIT_0 + 2, (bus_state.address >> 8) & 0xff, 0x4);
    panel_switches.vals.a16_24 = 
        dpy_transfer(MX7219_DIGIT_0 + 3, (bus_state.address >> 16) & 0xff, 0x8);

    digit4 |= bus_state.ro_control.flags.rdy ? (1 << 0) : 0;
    digit4 |= bus_state.ro_control.flags.irqbar ? (1 << 1) : 0;
    digit4 |= bus_state.ro_control.flags.nmibar ? (1 << 2) : 0;
    digit4 |= bus_state.ro_control.flags.sync ? (1 << 3) : 0;
    digit4 |= bus_state.rw_control.flags.r_wbar ? (1 << 4) : 0;
    digit4 |= bus_state.rw_control.flags.phi2 ? (1 << 5) : 0;
    digit4 |= bus_state.rw_control.flags.rstbar ? (1 << 6) : 0;
    digit4 |= bus_state.rw_control.flags.be ? (1 << 7) : 0;

    digit5 |= bus_state.ro_control.flags.ioselbar ? (1 << 7) : 0;

    panel_switches.vals.ctrl = 
        dpy_transfer(MX7219_DIGIT_0 + 4, digit4);
    dpy_transfer(MX7219_DIGIT_0 + 5, digit5);
}

static void update_bus() {
    SPI.beginTransaction(SPISettings(SPI_SPEED, MSBFIRST, SPI_MODE0));

    // Load Addr and Data busses into shift reg.
    digitalWrite(PIN_ADLOAD, HIGH);
    digitalWrite(PIN_BUSSSBAR, LOW);
    // "transfer" a byte to ensure at least one SCK +ve going edge. The Data and
    // Address buses are sampled at this point.
    SPI.transfer(0);
    digitalWrite(PIN_BUSSSBAR, HIGH);
    digitalWrite(PIN_ADLOAD, LOW);

    // Exchange bytes over SPI. Control bus is sampled at this point.
    digitalWrite(PIN_BUSSSBAR, LOW);
    bus_state.ro_control.val = SPI.transfer(0) & 0b1111111;
    bus_state.data = SPI.transfer(bus_state.data);

    uint32_t prev_addr = bus_state.address;
    bus_state.address = 0;
    bus_state.address |=
        ((uint32_t)(SPI.transfer((prev_addr >> 16) & 0xff))) << 16;
    bus_state.address |=
        ((uint32_t)(SPI.transfer((prev_addr >> 8) & 0xff))) << 8;
    bus_state.address |=
        (uint32_t)(SPI.transfer(prev_addr & 0xff));

    // Transfer contents of Address and Data shift reg to output.
    digitalWrite(PIN_ADLOAD, HIGH);
    SPI.transfer(0); // Another "fake" transfer to cause a clock edge
    digitalWrite(PIN_ADLOAD, LOW);

    digitalWrite(PIN_BUSSSBAR, HIGH);
    SPI.endTransaction();

    // Read pins
    bus_state.rw_control.flags.be = (digitalRead(PIN_BE) == HIGH) ? 1 : 0;
    bus_state.rw_control.flags.rstbar = (digitalRead(PIN_RSTBAR) == HIGH) ? 1 : 0;
    bus_state.rw_control.flags.r_wbar = (digitalRead(PIN_R_WBAR) == HIGH) ? 1 : 0;
    bus_state.rw_control.flags.phi2 = (digitalRead(PIN_PHI2) == HIGH) ? 1 : 0;
}

static void poll_serial() {
    while(Serial.available() > 0) {
        serial_state = serial_state.next(Serial.read());
    }
}
