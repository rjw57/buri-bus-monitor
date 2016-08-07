// Firmware for monitor board
//
// Dumb terminal interface. This provides a simple serial interface to reading
// and writing from/to the Búri bus.
//
// Protocol:
//
// Commands are read from serial port until terminating LF. Responses to
// commands are lines transmitted with LF with a single "." showing end of
// response. Non ending lines are of the form "[IWE]:<msg>".
//
// Commands:
//
// s - dump bus state as space separated address, data, claimed
// claim - claim bus from processor (BE -> LOW)
// release - release bus to processor (BE -> HIGH)
// aXXXXXX - set address for next data write if bus owned
// wdXX - if bus owned, clear R/~W assert data, set R/~W, un assert data
// aXXXXXX - if bus owned set address bus to hex value
#include <SPI.h>
#include <stdint.h>

#include "control.h"
#include "globals.h"
#include "pins.h"
#include "serialcli.h"

SerialState serial_state;

void setup() {
    // Start serial port and print banner.
    Serial.begin(115200);
    Serial.setTimeout(100000);
    Serial.println("I:Buri microcomputer system monitor.");
    Serial.println("I:https://github.com/rjw57/buri-bus-monitor");
    serial_state = startSerialPrompt();

    // De-select all other SPI peripherals
    digitalWrite(PIN_DPYSSBAR, HIGH);

    // Set up bus control peripheral and claim the bus
    controlSetup();
    controlClaim();
}

void loop() {
    if(Serial.available()) {
        int b = Serial.read();
        if(b != -1) {
            serial_state = serial_state.next(static_cast<byte>(b));
        }
    }

#if 0
    // Get next command from serial
    String cmd = Serial.readStringUntil('\n');

    if(cmd.startsWith("a")) {
        // assert address value
        bus_state.address = strtoul(cmd.substring(1).c_str(), NULL, 16);
        update_bus(false);
        Serial.print("I:OK, address = ");
        Serial.println(bus_state.address, HEX);
    } else if(cmd.startsWith("wa")) {
        // assert address value
        write_address = strtoul(cmd.substring(2).c_str(), NULL, 16);
        Serial.print("I:OK, write address = ");
        Serial.println(write_address, HEX);
    } else if(cmd.startsWith("wd")) {
        // set data value
        uint8_t to_write = strtoul(cmd.substring(2).c_str(), NULL, 16);
        if(!owning_bus) {
            Serial.println("E:not owner");
        } else {
            bus_state.address = write_address;
            update_bus(true);
            update_bus(true);
            for(int i=0; (i<5000) && (bus_state.data != to_write); ++i) {
                digitalWrite(PIN_R_WBAR, LOW);
                digitalWrite(PIN_DOEBAR, LOW);
                bus_state.address = write_address;
                bus_state.data = to_write;
                update_bus(true);
                update_bus(true);
                digitalWrite(PIN_R_WBAR, HIGH);
                digitalWrite(PIN_DOEBAR, HIGH);
                bus_state.address = write_address;
                update_bus(true);
                update_bus(true);
            }
            write_address++;
            Serial.println("I:OK");
        }
    } else if(cmd.equals("s")) {
        // read state of bus
        update_bus(true);
        Serial.print(bus_state.address, HEX);
        Serial.print(" ");
        Serial.print(bus_state.data, HEX);
        Serial.println();
    } else if(cmd.equals("claim")) {
        // claim the bus
        claim_bus();
        update_bus(false);
        Serial.println("I:claimed");
    } else if(cmd.equals("release")) {
        // un-claim the bus
        release_bus();
        update_bus(false);
        Serial.println("I:releases");
    }

    // Always send end of transmission byte
    Serial.println("EOL");
#endif
}

#if 0
static void update_bus(bool do_load) {
    BusState new_state = bus_state;

    SPI.beginTransaction(SPISettings(SPI_SPEED, MSBFIRST, SPI_MODE0));

    // Load Addr and Data busses into shift reg.
    digitalWrite(PIN_ADLOAD, HIGH);
    digitalWrite(PIN_BUSSSBAR, LOW);
    // "transfer" a byte to ensure at least one SCK +ve going edge. The Data
    // and Address buses are sampled at this point.
    SPI.transfer(0);
    digitalWrite(PIN_BUSSSBAR, HIGH);
    digitalWrite(PIN_ADLOAD, LOW);

    // Exchange bytes over SPI. Control bus is sampled at this point.
    digitalWrite(PIN_BUSSSBAR, LOW);
    new_state.ro_control.val = SPI.transfer(0) & 0b1111111;
    new_state.data = SPI.transfer(bus_state.data);

    uint32_t prev_addr = bus_state.address;
    new_state.address = 0;
    new_state.address |=
        ((uint32_t)(SPI.transfer((prev_addr >> 16) & 0xff))) << 16;
    new_state.address |=
        ((uint32_t)(SPI.transfer((prev_addr >> 8) & 0xff))) << 8;
    new_state.address |=
        (uint32_t)(SPI.transfer(prev_addr & 0xff));

    // Transfer contents of Address and Data shift reg to output.
    digitalWrite(PIN_ADLOAD, HIGH);
    SPI.transfer(0); // Another "fake" transfer to cause a clock edge
    digitalWrite(PIN_ADLOAD, LOW);

    digitalWrite(PIN_BUSSSBAR, HIGH);
    SPI.endTransaction();

    // Read pins
    new_state.rw_control.flags.be = (digitalRead(PIN_BE) == HIGH) ? 1 : 0;
    new_state.rw_control.flags.rstbar = (digitalRead(PIN_RSTBAR) == HIGH) ? 1 : 0;
    new_state.rw_control.flags.r_wbar = (digitalRead(PIN_R_WBAR) == HIGH) ? 1 : 0;
    new_state.rw_control.flags.phi2 = (digitalRead(PIN_PHI2) == HIGH) ? 1 : 0;

    if(do_load) { bus_state = new_state; }
}
#endif
