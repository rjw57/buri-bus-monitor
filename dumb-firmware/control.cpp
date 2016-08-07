#include <Arduino.h>
#include <SPI.h>

#include "control.h"
#include "pins.h"

const int SPI_SPEED = 10000000;

static bool is_bus_claimed = false;

// State we wish to set bus to.
ControlBusState assert_state;

void controlSetup() {
    // Reset while setting up other pins.
    pinMode(PIN_RSTBAR, OUTPUT);
    digitalWrite(PIN_RSTBAR, LOW);

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

    // Deselect BUS SPI peripheral
    digitalWrite(PIN_BUSSSBAR, HIGH);

    // Make sure we're not asserting the bus
    digitalWrite(PIN_ADLOAD, LOW);
    digitalWrite(PIN_DOEBAR, HIGH);
    digitalWrite(PIN_AOEBAR, HIGH);

    // Claim the bus
    controlClaim();

    // Release reset
    pinMode(PIN_RSTBAR, INPUT);
}

int controlIsClaimed() {
    return is_bus_claimed ? 1 : 0;
}

int controlIsHalted() {
    return (digitalRead(PIN_HALT) == HIGH) ? 1 : 0;
}

void controlSetHalt(int halt) {
    digitalWrite(PIN_HALT, halt ? HIGH : LOW);
}

static int prev_halt = 0;

void controlClaim() {
    prev_halt = controlIsHalted();
    controlSetHalt(1);
    digitalWrite(PIN_BE, LOW);
    digitalWrite(PIN_R_WBAR, HIGH);
    pinMode(PIN_R_WBAR, OUTPUT);
    pinMode(PIN_BE, OUTPUT);
    digitalWrite(PIN_AOEBAR, LOW); // start asserting address
    is_bus_claimed = true;
}

void controlRelease() {
    pinMode(PIN_BE, INPUT);
    pinMode(PIN_R_WBAR, INPUT);
    digitalWrite(PIN_AOEBAR, HIGH);
    digitalWrite(PIN_DOEBAR, HIGH);
    is_bus_claimed = false;
    controlSetHalt(prev_halt);
}

void controlCycle() {
    // Pulse step
    digitalWrite(PIN_STEP, HIGH);
    digitalWrite(PIN_STEP, LOW);
}

byte controlRead(uint32_t address) {
    assert_state.address = address;
    controlUpdateBus(assert_state);
    delay(1);
    ControlBusState read_state = controlUpdateBus(assert_state);
    return read_state.data;
}

void controlWrite(uint32_t address, uint8_t value) {
    assert_state.address = address;
    assert_state.data = value;
    controlUpdateBus(assert_state);
    delay(1);

    if(is_bus_claimed) {
        // Assert data
        digitalWrite(PIN_DOEBAR, LOW);

        // Clear R/~W
        digitalWrite(PIN_R_WBAR, LOW);

        delay(1);

        // Set R/~W
        digitalWrite(PIN_R_WBAR, HIGH);

        delay(1);

        // Stop asserting
        digitalWrite(PIN_DOEBAR, HIGH);
    }
}

ControlBusState controlUpdateBus(ControlBusState set_state) {
    ControlBusState read_state;

    SPI.beginTransaction(SPISettings(SPI_SPEED, MSBFIRST, SPI_MODE0));

    // Load current Addr and Data bus values into shift reg.
    digitalWrite(PIN_ADLOAD, HIGH);
    digitalWrite(PIN_BUSSSBAR, LOW);

    // "transfer" a byte to ensure at least one SCK +ve going edge. The Data
    // and Address buses are sampled at this point.
    SPI.transfer(0);
    digitalWrite(PIN_BUSSSBAR, HIGH);
    digitalWrite(PIN_ADLOAD, LOW);

    if(is_bus_claimed) {
        digitalWrite(PIN_AOEBAR, HIGH);
    }

    // Exchange bytes over SPI. Control bus is sampled at this point.
    digitalWrite(PIN_BUSSSBAR, LOW);
    read_state.ro_control.val = SPI.transfer(0) & 0b1111111;
    read_state.data = SPI.transfer(set_state.data);

    uint32_t prev_addr = set_state.address;
    read_state.address = 0;
    read_state.address |=
        ((uint32_t)(SPI.transfer((prev_addr >> 16) & 0xff))) << 16;
    read_state.address |=
        ((uint32_t)(SPI.transfer((prev_addr >> 8) & 0xff))) << 8;
    read_state.address |=
        (uint32_t)(SPI.transfer(prev_addr & 0xff));

    digitalWrite(PIN_BUSSSBAR, HIGH);
    SPI.endTransaction();

    if(is_bus_claimed) {
        digitalWrite(PIN_AOEBAR, LOW);
    }

    // Read pins
    read_state.rw_control.flags.be =
        (digitalRead(PIN_BE) == HIGH) ? 1 : 0;
    read_state.rw_control.flags.rstbar =
        (digitalRead(PIN_RSTBAR) == HIGH) ? 1 : 0;
    read_state.rw_control.flags.r_wbar =
        (digitalRead(PIN_R_WBAR) == HIGH) ? 1 : 0;
    read_state.rw_control.flags.phi2 =
        (digitalRead(PIN_PHI2) == HIGH) ? 1 : 0;

    return read_state;
}
