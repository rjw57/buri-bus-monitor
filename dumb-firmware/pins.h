// Mapping from pin names -> numbers
#pragma once
#ifndef GUARD_PINS_H__
#define GUARD_PINS_H__

// Direct observation/assertion of control lines.
const int PIN_PHI2      = 2;
const int PIN_R_WBAR    = 3;
const int PIN_RSTBAR    = 4;
const int PIN_BE        = 5;

// Halt and single-cycle step.
const int PIN_HALT      = 6;
const int PIN_STEP      = 7;

// Display select
const int PIN_DPYSSBAR  = 9;

// Bus select and control
const int PIN_BUSSSBAR  = 10;
const int PIN_ADLOAD    = A0;
const int PIN_DOEBAR    = A1;
const int PIN_AOEBAR    = A2;

// SPI
const int PIN_MOSI      = 11;
const int PIN_MISO      = 12;
const int PIN_SCK       = 13;

#endif // GUARD_PINS_H__
