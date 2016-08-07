// Update control lines based on global state

#pragma once
#ifndef GUARD_CONTROL_H
#define GUARD_CONTROL_H

#include <Arduino.h> // for byte

struct ControlBusState {
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

// Set up pin modes and global state for control loop. Claims the bus.
void controlSetup();

// Return non-zero iff bus is claimed
int controlIsClaimed();

// Return non-zero iff processor halted
int controlIsHalted();

// Set halt state. Non-zero => halted
void controlSetHalt(int halt);

// Claim bus and halt processor
void controlClaim();

// Release bus and resume processor
void controlRelease();

// When claimed, single cycle processor.
void controlCycle();

// Read current bus state. Sets bus shift registers to set_state.
// IMPORTANT: The data bus is asserted if the set state has R/~W LOW. It is
// input only if R/~W is HIGH. The asserting (if appropriate) and then sampling
// of the data, address and read-only control buses happens *after* the setting
// (if any) of the read-write control bus values BE, ~RST, PHI2 and R/~W.
ControlBusState controlUpdateBus(ControlBusState set_state);

// Read byte from address
byte controlRead(uint32_t address);

// Write byte to address
void controlWrite(uint32_t address, uint8_t value);

#endif // GUARD_CONTROL_H
