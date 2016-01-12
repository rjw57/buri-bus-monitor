# Customise these on command line to use a different arduino IDE install
ARDUINO_ROOT?=
ARDUINO?=$(ARDUINO_ROOT)/arduino

# Customise this on command line to pass extra flags to arduino IDE. For
# example, one may wish to specify the serial port via "--port /dev/ttyUSB0".
ARDUINO_FLAGS?=

ifeq ($(ARDUINO_ROOT),)
$(error "ARDUINO_ROOT is empty. Specify on command line.")
endif

ARDUINO_FQBN?=arduino:avr:nano:cpu=atmega328
FIRMWARE_SKETCH:=firmware.ino
ARDUINO_ALL_FLAGS:=--board "$(ARDUINO_FQBN)" $(ARDUINO_FLAGS)

all: verify

verify:
	$(ARDUINO) --verify "$(FIRMWARE_SKETCH)" $(ARDUINO_ALL_FLAGS)

upload:
	$(ARDUINO) --upload "$(FIRMWARE_SKETCH)" $(ARDUINO_ALL_FLAGS)

.PHONY: all verify upload
