EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:buri-bus
LIBS:arduino
LIBS:buri-bus-monitor-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Buri-Bus P1
U 1 1 56910AF0
P 9750 2250
F 0 "P1" H 9400 750 60  0000 L TNN
F 1 "Buri-Bus" H 9400 3750 60  0000 L BNN
F 2 "buri-bus-monitor:buri-bus-male" H 8850 2450 60  0001 C CNN
F 3 "" H 8850 2450 60  0000 C CNN
	1    9750 2250
	1    0    0    -1  
$EndComp
$Comp
L arduino_mini U8
U 1 1 56910C3E
P 7600 4650
F 0 "U8" H 7600 4700 70  0000 C CNN
F 1 "Arduino Nano" H 8050 3300 70  0000 L BNN
F 2 "buri-bus-monitor:arduino_mini" H 7600 4600 60  0001 C CNN
F 3 "" H 7600 4650 60  0000 C CNN
	1    7600 4650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 56910DA4
P 7600 6300
F 0 "#PWR01" H 7600 6050 50  0001 C CNN
F 1 "GND" H 7600 6150 50  0000 C CNN
F 2 "" H 7600 6300 50  0000 C CNN
F 3 "" H 7600 6300 50  0000 C CNN
	1    7600 6300
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR02
U 1 1 56910DBC
P 9000 3000
F 0 "#PWR02" H 9000 2850 50  0001 C CNN
F 1 "+5V" H 9000 3140 50  0000 C CNN
F 2 "" H 9000 3000 50  0000 C CNN
F 3 "" H 9000 3000 50  0000 C CNN
	1    9000 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 56910E32
P 9000 3600
F 0 "#PWR03" H 9000 3350 50  0001 C CNN
F 1 "GND" H 9000 3450 50  0000 C CNN
F 2 "" H 9000 3600 50  0000 C CNN
F 3 "" H 9000 3600 50  0000 C CNN
	1    9000 3600
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 56910E43
P 7600 3400
F 0 "#PWR04" H 7600 3250 50  0001 C CNN
F 1 "+5V" H 7600 3540 50  0000 C CNN
F 2 "" H 7600 3400 50  0000 C CNN
F 3 "" H 7600 3400 50  0000 C CNN
	1    7600 3400
	1    0    0    -1  
$EndComp
NoConn ~ 7750 3500
NoConn ~ 7450 3500
NoConn ~ 6900 4250
NoConn ~ 9200 3400
NoConn ~ 9200 3200
NoConn ~ 9200 3300
Text Label 8800 1200 0    60   ~ 0
D3
Text Label 8800 1100 0    60   ~ 0
D2
Text Label 8800 1000 0    60   ~ 0
D1
Text Label 8800 900  0    60   ~ 0
D0
Text Label 8800 1600 0    60   ~ 0
D7
Text Label 8800 1500 0    60   ~ 0
D6
Text Label 8800 1400 0    60   ~ 0
D5
Text Label 8800 1300 0    60   ~ 0
D4
$Comp
L 74LS299 U5
U 1 1 5691112E
P 4650 4000
F 0 "U5" H 4650 4100 50  0000 C CNN
F 1 "74LS299" H 4650 4300 50  0000 C CNN
F 2 "" H 4650 4000 50  0000 C CNN
F 3 "" H 4650 4000 50  0000 C CNN
	1    4650 4000
	1    0    0    -1  
$EndComp
$Comp
L 74LS299 U6
U 1 1 569111E0
P 4650 5500
F 0 "U6" H 4650 5600 50  0000 C CNN
F 1 "74LS299" H 4650 5800 50  0000 C CNN
F 2 "" H 4650 5500 50  0000 C CNN
F 3 "" H 4650 5500 50  0000 C CNN
	1    4650 5500
	1    0    0    -1  
$EndComp
Text Label 5750 4100 2    60   ~ 0
A3
Text Label 5750 4000 2    60   ~ 0
A2
Text Label 5750 3900 2    60   ~ 0
A1
Text Label 5750 3800 2    60   ~ 0
A0
Text Label 5750 4500 2    60   ~ 0
A7
Text Label 5750 4400 2    60   ~ 0
A6
Text Label 5750 4300 2    60   ~ 0
A5
Text Label 5750 4200 2    60   ~ 0
A4
Text Label 5750 5600 2    60   ~ 0
A11
Text Label 5750 5500 2    60   ~ 0
A10
Text Label 5750 5400 2    60   ~ 0
A9
Text Label 5750 5300 2    60   ~ 0
A8
Text Label 5750 6000 2    60   ~ 0
A15
Text Label 5750 5900 2    60   ~ 0
A14
Text Label 5750 5800 2    60   ~ 0
A13
Text Label 5750 5700 2    60   ~ 0
A12
Text Label 5750 7100 2    60   ~ 0
A19
Text Label 5750 7000 2    60   ~ 0
A18
Text Label 5750 6900 2    60   ~ 0
A17
Text Label 5750 6800 2    60   ~ 0
A16
Text Label 5750 7500 2    60   ~ 0
A23
Text Label 5750 7400 2    60   ~ 0
A22
Text Label 5750 7300 2    60   ~ 0
A21
Text Label 5750 7200 2    60   ~ 0
A20
Text Label 3550 3800 0    60   ~ 0
AS0
Text Label 3550 3900 0    60   ~ 0
AS1
Text Label 3550 5300 0    60   ~ 0
AS0
Text Label 3550 5400 0    60   ~ 0
AS1
Text Label 3550 6800 0    60   ~ 0
AS0
Text Label 3550 6900 0    60   ~ 0
AS1
$Comp
L +5V #PWR05
U 1 1 5691175C
P 4350 3450
F 0 "#PWR05" H 4350 3300 50  0001 C CNN
F 1 "+5V" H 4350 3590 50  0000 C CNN
F 2 "" H 4350 3450 50  0000 C CNN
F 3 "" H 4350 3450 50  0000 C CNN
	1    4350 3450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR06
U 1 1 56911884
P 4350 4950
F 0 "#PWR06" H 4350 4800 50  0001 C CNN
F 1 "+5V" H 4350 5090 50  0000 C CNN
F 2 "" H 4350 4950 50  0000 C CNN
F 3 "" H 4350 4950 50  0000 C CNN
	1    4350 4950
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR07
U 1 1 569118BC
P 4350 6450
F 0 "#PWR07" H 4350 6300 50  0001 C CNN
F 1 "+5V" H 4350 6590 50  0000 C CNN
F 2 "" H 4350 6450 50  0000 C CNN
F 3 "" H 4350 6450 50  0000 C CNN
	1    4350 6450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 56911956
P 4300 6050
F 0 "#PWR08" H 4300 5800 50  0001 C CNN
F 1 "GND" H 4300 5900 50  0000 C CNN
F 2 "" H 4300 6050 50  0000 C CNN
F 3 "" H 4300 6050 50  0000 C CNN
	1    4300 6050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 569119AC
P 4300 7550
F 0 "#PWR09" H 4300 7300 50  0001 C CNN
F 1 "GND" H 4300 7400 50  0000 C CNN
F 2 "" H 4300 7550 50  0000 C CNN
F 3 "" H 4300 7550 50  0000 C CNN
	1    4300 7550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 569119E9
P 4300 4550
F 0 "#PWR010" H 4300 4300 50  0001 C CNN
F 1 "GND" H 4300 4400 50  0000 C CNN
F 2 "" H 4300 4550 50  0000 C CNN
F 3 "" H 4300 4550 50  0000 C CNN
	1    4300 4550
	1    0    0    -1  
$EndComp
NoConn ~ 5350 6500
NoConn ~ 5350 5000
$Comp
L GND #PWR011
U 1 1 56911B8E
P 3950 3600
F 0 "#PWR011" H 3950 3350 50  0001 C CNN
F 1 "GND" H 3950 3450 50  0000 C CNN
F 2 "" H 3950 3600 50  0000 C CNN
F 3 "" H 3950 3600 50  0000 C CNN
	1    3950 3600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 56911BB4
P 3950 5100
F 0 "#PWR012" H 3950 4850 50  0001 C CNN
F 1 "GND" H 3950 4950 50  0000 C CNN
F 2 "" H 3950 5100 50  0000 C CNN
F 3 "" H 3950 5100 50  0000 C CNN
	1    3950 5100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 56911BCE
P 3950 6600
F 0 "#PWR013" H 3950 6350 50  0001 C CNN
F 1 "GND" H 3950 6450 50  0000 C CNN
F 2 "" H 3950 6600 50  0000 C CNN
F 3 "" H 3950 6600 50  0000 C CNN
	1    3950 6600
	1    0    0    -1  
$EndComp
Text Label 3550 4350 0    60   ~ 0
SCLK
Text Label 3550 5850 0    60   ~ 0
SCLK
Text Label 3550 7350 0    60   ~ 0
SCLK
Text Label 3550 7500 0    60   ~ 0
~RST
Text Label 3550 6000 0    60   ~ 0
~RST
Text Label 3550 4500 0    60   ~ 0
~RST
$Comp
L GND #PWR014
U 1 1 56911E60
P 3950 5700
F 0 "#PWR014" H 3950 5450 50  0001 C CNN
F 1 "GND" H 3950 5550 50  0000 C CNN
F 2 "" H 3950 5700 50  0000 C CNN
F 3 "" H 3950 5700 50  0000 C CNN
	1    3950 5700
	0    1    1    0   
$EndComp
$Comp
L GND #PWR015
U 1 1 56911E7A
P 3950 7200
F 0 "#PWR015" H 3950 6950 50  0001 C CNN
F 1 "GND" H 3950 7050 50  0000 C CNN
F 2 "" H 3950 7200 50  0000 C CNN
F 3 "" H 3950 7200 50  0000 C CNN
	1    3950 7200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR016
U 1 1 56911E99
P 3950 4200
F 0 "#PWR016" H 3950 3950 50  0001 C CNN
F 1 "GND" H 3950 4050 50  0000 C CNN
F 2 "" H 3950 4200 50  0000 C CNN
F 3 "" H 3950 4200 50  0000 C CNN
	1    3950 4200
	0    1    1    0   
$EndComp
Text Label 3550 4100 0    60   ~ 0
~AOE
Text Label 3550 5600 0    60   ~ 0
~AOE
Text Label 3550 7100 0    60   ~ 0
~AOE
Text Label 10700 1200 2    60   ~ 0
A3
Text Label 10700 1100 2    60   ~ 0
A2
Text Label 10700 1000 2    60   ~ 0
A1
Text Label 10700 900  2    60   ~ 0
A0
Text Label 10700 1600 2    60   ~ 0
A7
Text Label 10700 1500 2    60   ~ 0
A6
Text Label 10700 1400 2    60   ~ 0
A5
Text Label 10700 1300 2    60   ~ 0
A4
Text Label 10700 2100 2    60   ~ 0
A11
Text Label 10700 2000 2    60   ~ 0
A10
Text Label 10700 1900 2    60   ~ 0
A9
Text Label 10700 1800 2    60   ~ 0
A8
Text Label 10700 2500 2    60   ~ 0
A15
Text Label 10700 2400 2    60   ~ 0
A14
Text Label 10700 2300 2    60   ~ 0
A13
Text Label 10700 2200 2    60   ~ 0
A12
Text Label 10700 3000 2    60   ~ 0
A19
Text Label 10700 2900 2    60   ~ 0
A18
Text Label 10700 2800 2    60   ~ 0
A17
Text Label 10700 2700 2    60   ~ 0
A16
Text Label 10700 3400 2    60   ~ 0
A23
Text Label 10700 3300 2    60   ~ 0
A22
Text Label 10700 3200 2    60   ~ 0
A21
Text Label 10700 3100 2    60   ~ 0
A20
$Comp
L 74LS299 U2
U 1 1 569123BB
P 2150 4000
F 0 "U2" H 2150 4100 50  0000 C CNN
F 1 "74LS299" H 2150 4300 50  0000 C CNN
F 2 "" H 2150 4000 50  0000 C CNN
F 3 "" H 2150 4000 50  0000 C CNN
	1    2150 4000
	1    0    0    -1  
$EndComp
Text Label 1050 3500 0    60   ~ 0
MOSI
Text Label 1050 3800 0    60   ~ 0
DS0
Text Label 1050 3900 0    60   ~ 0
DS1
$Comp
L +5V #PWR017
U 1 1 569123CC
P 1850 3450
F 0 "#PWR017" H 1850 3300 50  0001 C CNN
F 1 "+5V" H 1850 3590 50  0000 C CNN
F 2 "" H 1850 3450 50  0000 C CNN
F 3 "" H 1850 3450 50  0000 C CNN
	1    1850 3450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 569123D2
P 1800 4550
F 0 "#PWR018" H 1800 4300 50  0001 C CNN
F 1 "GND" H 1800 4400 50  0000 C CNN
F 2 "" H 1800 4550 50  0000 C CNN
F 3 "" H 1800 4550 50  0000 C CNN
	1    1800 4550
	1    0    0    -1  
$EndComp
NoConn ~ 2850 3500
$Comp
L GND #PWR019
U 1 1 569123D9
P 1450 3600
F 0 "#PWR019" H 1450 3350 50  0001 C CNN
F 1 "GND" H 1450 3450 50  0000 C CNN
F 2 "" H 1450 3600 50  0000 C CNN
F 3 "" H 1450 3600 50  0000 C CNN
	1    1450 3600
	1    0    0    -1  
$EndComp
Text Label 1050 4350 0    60   ~ 0
SCLK
Text Label 1050 4500 0    60   ~ 0
~RST
$Comp
L GND #PWR020
U 1 1 569123F0
P 1450 4200
F 0 "#PWR020" H 1450 3950 50  0001 C CNN
F 1 "GND" H 1450 4050 50  0000 C CNN
F 2 "" H 1450 4200 50  0000 C CNN
F 3 "" H 1450 4200 50  0000 C CNN
	1    1450 4200
	0    1    1    0   
$EndComp
Text Label 1050 4100 0    60   ~ 0
~DOE
Text Label 3250 4100 2    60   ~ 0
D3
Text Label 3250 4000 2    60   ~ 0
D2
Text Label 3250 3900 2    60   ~ 0
D1
Text Label 3250 3800 2    60   ~ 0
D0
Text Label 3250 4500 2    60   ~ 0
D7
Text Label 3250 4400 2    60   ~ 0
D6
Text Label 3250 4300 2    60   ~ 0
D5
Text Label 3250 4200 2    60   ~ 0
D4
NoConn ~ 5350 3500
Text Label 5750 6600 2    60   ~ 0
MISO
$Comp
L 74LS299 U7
U 1 1 5691124A
P 4650 7000
F 0 "U7" H 4650 7100 50  0000 C CNN
F 1 "74LS299" H 4650 7300 50  0000 C CNN
F 2 "" H 4650 7000 50  0000 C CNN
F 3 "" H 4650 7000 50  0000 C CNN
	1    4650 7000
	1    0    0    -1  
$EndComp
Text Label 8700 4700 2    60   ~ 0
DS1
Text Label 8700 4950 2    60   ~ 0
DS0
Text Label 8700 4600 2    60   ~ 0
~DOE
Text Label 11000 6300 2    60   ~ 0
~DOE
Text Label 11000 5900 2    60   ~ 0
~AOE
$Comp
L +5V #PWR021
U 1 1 56912A85
P 10300 5850
F 0 "#PWR021" H 10300 5700 50  0001 C CNN
F 1 "+5V" H 10300 5990 50  0000 C CNN
F 2 "" H 10300 5850 50  0000 C CNN
F 3 "" H 10300 5850 50  0000 C CNN
	1    10300 5850
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 56912AA4
P 10550 5900
F 0 "R3" V 10630 5900 50  0000 C CNN
F 1 "3K3" V 10550 5900 50  0000 C CNN
F 2 "" V 10480 5900 50  0000 C CNN
F 3 "" H 10550 5900 50  0000 C CNN
	1    10550 5900
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR022
U 1 1 56913256
P 10300 6250
F 0 "#PWR022" H 10300 6100 50  0001 C CNN
F 1 "+5V" H 10300 6390 50  0000 C CNN
F 2 "" H 10300 6250 50  0000 C CNN
F 3 "" H 10300 6250 50  0000 C CNN
	1    10300 6250
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5691325C
P 10550 6300
F 0 "R4" V 10630 6300 50  0000 C CNN
F 1 "3K3" V 10550 6300 50  0000 C CNN
F 2 "" V 10480 6300 50  0000 C CNN
F 3 "" H 10550 6300 50  0000 C CNN
	1    10550 6300
	0    1    1    0   
$EndComp
Text Label 8800 1900 0    60   ~ 0
BE
Text Label 8800 1800 0    60   ~ 0
RDY
Text Label 8800 2500 0    60   ~ 0
R~W
Text Label 8800 2200 0    60   ~ 0
SYNC
Text Label 8800 2800 0    60   ~ 0
~RST
Text Label 8800 2700 0    60   ~ 0
PHI2
Text Label 8800 2600 0    60   ~ 0
~IOSEL
Text Label 8700 5150 2    60   ~ 0
STEP
Text Label 8700 5050 2    60   ~ 0
HALT
$Comp
L 74HC74 U4
U 2 1 5691392F
P 7100 2000
F 0 "U4" H 7250 2300 50  0000 C CNN
F 1 "74HC74" H 7400 1705 50  0000 C CNN
F 2 "" H 7100 2000 50  0000 C CNN
F 3 "" H 7100 2000 50  0000 C CNN
	2    7100 2000
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR023
U 1 1 56913A42
P 6900 1750
F 0 "#PWR023" H 6900 1600 50  0001 C CNN
F 1 "+5V" H 6900 1890 50  0000 C CNN
F 2 "" H 6900 1750 50  0000 C CNN
F 3 "" H 6900 1750 50  0000 C CNN
	1    6900 1750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 56913A68
P 6900 2250
F 0 "#PWR024" H 6900 2000 50  0001 C CNN
F 1 "GND" H 6900 2100 50  0000 C CNN
F 2 "" H 6900 2250 50  0000 C CNN
F 3 "" H 6900 2250 50  0000 C CNN
	1    6900 2250
	1    0    0    -1  
$EndComp
Text Label 6800 1350 0    60   ~ 0
HALT
Text Label 8000 1800 2    60   ~ 0
RDY
$Comp
L 74HC04 U1
U 4 1 56913D64
P 5950 2000
F 0 "U1" H 6100 2100 50  0000 C CNN
F 1 "74HC04" H 6150 1900 50  0000 C CNN
F 2 "" H 5950 2000 50  0000 C CNN
F 3 "" H 5950 2000 50  0000 C CNN
	4    5950 2000
	1    0    0    -1  
$EndComp
$Comp
L 74HC00 U3
U 2 1 56913DE7
P 4800 1350
F 0 "U3" H 4800 1400 50  0000 C CNN
F 1 "74HC00" H 4800 1250 50  0000 C CNN
F 2 "" H 4800 1350 50  0000 C CNN
F 3 "" H 4800 1350 50  0000 C CNN
	2    4800 1350
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR025
U 1 1 56913E6F
P 5900 1900
F 0 "#PWR025" H 5900 1750 50  0001 C CNN
F 1 "+5V" H 5900 2040 50  0000 C CNN
F 2 "" H 5900 1900 50  0000 C CNN
F 3 "" H 5900 1900 50  0000 C CNN
	1    5900 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 56913EA6
P 5900 2100
F 0 "#PWR026" H 5900 1850 50  0001 C CNN
F 1 "GND" H 5900 1950 50  0000 C CNN
F 2 "" H 5900 2100 50  0000 C CNN
F 3 "" H 5900 2100 50  0000 C CNN
	1    5900 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR027
U 1 1 56913EF3
P 4600 1550
F 0 "#PWR027" H 4600 1300 50  0001 C CNN
F 1 "GND" H 4600 1400 50  0000 C CNN
F 2 "" H 4600 1550 50  0000 C CNN
F 3 "" H 4600 1550 50  0000 C CNN
	1    4600 1550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR028
U 1 1 56913F2A
P 4600 1150
F 0 "#PWR028" H 4600 1000 50  0001 C CNN
F 1 "+5V" H 4600 1290 50  0000 C CNN
F 2 "" H 4600 1150 50  0000 C CNN
F 3 "" H 4600 1150 50  0000 C CNN
	1    4600 1150
	1    0    0    -1  
$EndComp
Text Label 5200 2000 0    60   ~ 0
PHI2
$Comp
L 74HC04 U1
U 3 1 5691412E
P 5950 1350
F 0 "U1" H 6100 1450 50  0000 C CNN
F 1 "74HC04" H 6150 1250 50  0000 C CNN
F 2 "" H 5950 1350 50  0000 C CNN
F 3 "" H 5950 1350 50  0000 C CNN
	3    5950 1350
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR029
U 1 1 56914134
P 5900 1250
F 0 "#PWR029" H 5900 1100 50  0001 C CNN
F 1 "+5V" H 5900 1390 50  0000 C CNN
F 2 "" H 5900 1250 50  0000 C CNN
F 3 "" H 5900 1250 50  0000 C CNN
	1    5900 1250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 5691413A
P 5900 1450
F 0 "#PWR030" H 5900 1200 50  0001 C CNN
F 1 "GND" H 5900 1300 50  0000 C CNN
F 2 "" H 5900 1450 50  0000 C CNN
F 3 "" H 5900 1450 50  0000 C CNN
	1    5900 1450
	1    0    0    -1  
$EndComp
$Comp
L 74HC00 U3
U 1 1 56914463
P 2700 2000
F 0 "U3" H 2700 2050 50  0000 C CNN
F 1 "74HC00" H 2700 1900 50  0000 C CNN
F 2 "" H 2700 2000 50  0000 C CNN
F 3 "" H 2700 2000 50  0000 C CNN
	1    2700 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR031
U 1 1 56914469
P 2500 2200
F 0 "#PWR031" H 2500 1950 50  0001 C CNN
F 1 "GND" H 2500 2050 50  0000 C CNN
F 2 "" H 2500 2200 50  0000 C CNN
F 3 "" H 2500 2200 50  0000 C CNN
	1    2500 2200
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR032
U 1 1 5691446F
P 2500 1800
F 0 "#PWR032" H 2500 1650 50  0001 C CNN
F 1 "+5V" H 2500 1940 50  0000 C CNN
F 2 "" H 2500 1800 50  0000 C CNN
F 3 "" H 2500 1800 50  0000 C CNN
	1    2500 1800
	1    0    0    -1  
$EndComp
$Comp
L 74HC04 U1
U 2 1 569144E4
P 1450 2300
F 0 "U1" H 1600 2400 50  0000 C CNN
F 1 "74HC04" H 1650 2200 50  0000 C CNN
F 2 "" H 1450 2300 50  0000 C CNN
F 3 "" H 1450 2300 50  0000 C CNN
	2    1450 2300
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR033
U 1 1 569144EA
P 1400 2200
F 0 "#PWR033" H 1400 2050 50  0001 C CNN
F 1 "+5V" H 1400 2340 50  0000 C CNN
F 2 "" H 1400 2200 50  0000 C CNN
F 3 "" H 1400 2200 50  0000 C CNN
	1    1400 2200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR034
U 1 1 569144F0
P 1400 2400
F 0 "#PWR034" H 1400 2150 50  0001 C CNN
F 1 "GND" H 1400 2250 50  0000 C CNN
F 2 "" H 1400 2400 50  0000 C CNN
F 3 "" H 1400 2400 50  0000 C CNN
	1    1400 2400
	1    0    0    -1  
$EndComp
$Comp
L 74HC74 U4
U 1 1 569148EB
P 3400 1250
F 0 "U4" H 3550 1550 50  0000 C CNN
F 1 "74HC74" H 3700 955 50  0000 C CNN
F 2 "" H 3400 1250 50  0000 C CNN
F 3 "" H 3400 1250 50  0000 C CNN
	1    3400 1250
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR035
U 1 1 569148F1
P 3200 1000
F 0 "#PWR035" H 3200 850 50  0001 C CNN
F 1 "+5V" H 3200 1140 50  0000 C CNN
F 2 "" H 3200 1000 50  0000 C CNN
F 3 "" H 3200 1000 50  0000 C CNN
	1    3200 1000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR036
U 1 1 569148F7
P 3200 1500
F 0 "#PWR036" H 3200 1250 50  0001 C CNN
F 1 "GND" H 3200 1350 50  0000 C CNN
F 2 "" H 3200 1500 50  0000 C CNN
F 3 "" H 3200 1500 50  0000 C CNN
	1    3200 1500
	1    0    0    -1  
$EndComp
Text Label 3900 1250 0    60   ~ 0
STEP
NoConn ~ 4000 1050
$Comp
L GND #PWR037
U 1 1 56914E77
P 2700 1350
F 0 "#PWR037" H 2700 1100 50  0001 C CNN
F 1 "GND" H 2700 1200 50  0000 C CNN
F 2 "" H 2700 1350 50  0000 C CNN
F 3 "" H 2700 1350 50  0000 C CNN
	1    2700 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR038
U 1 1 56914F45
P 7100 2650
F 0 "#PWR038" H 7100 2400 50  0001 C CNN
F 1 "GND" H 7100 2500 50  0000 C CNN
F 2 "" H 7100 2650 50  0000 C CNN
F 3 "" H 7100 2650 50  0000 C CNN
	1    7100 2650
	1    0    0    -1  
$EndComp
$Comp
L 74HC04 U1
U 1 1 56915451
P 1450 1700
F 0 "U1" H 1600 1800 50  0000 C CNN
F 1 "74HC04" H 1650 1600 50  0000 C CNN
F 2 "" H 1450 1700 50  0000 C CNN
F 3 "" H 1450 1700 50  0000 C CNN
	1    1450 1700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR039
U 1 1 56915457
P 1400 1600
F 0 "#PWR039" H 1400 1450 50  0001 C CNN
F 1 "+5V" H 1400 1740 50  0000 C CNN
F 2 "" H 1400 1600 50  0000 C CNN
F 3 "" H 1400 1600 50  0000 C CNN
	1    1400 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR040
U 1 1 5691545D
P 1400 1800
F 0 "#PWR040" H 1400 1550 50  0001 C CNN
F 1 "GND" H 1400 1650 50  0000 C CNN
F 2 "" H 1400 1800 50  0000 C CNN
F 3 "" H 1400 1800 50  0000 C CNN
	1    1400 1800
	1    0    0    -1  
$EndComp
Text Label 700  1700 0    60   ~ 0
STEP
Text Label 10100 6300 2    60   ~ 0
HALT
Text Label 10100 5900 2    60   ~ 0
STEP
$Comp
L +5V #PWR041
U 1 1 56916790
P 9400 5850
F 0 "#PWR041" H 9400 5700 50  0001 C CNN
F 1 "+5V" H 9400 5990 50  0000 C CNN
F 2 "" H 9400 5850 50  0000 C CNN
F 3 "" H 9400 5850 50  0000 C CNN
	1    9400 5850
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 56916796
P 9650 5900
F 0 "R1" V 9730 5900 50  0000 C CNN
F 1 "3K3" V 9650 5900 50  0000 C CNN
F 2 "" V 9580 5900 50  0000 C CNN
F 3 "" H 9650 5900 50  0000 C CNN
	1    9650 5900
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR042
U 1 1 5691679C
P 9400 6250
F 0 "#PWR042" H 9400 6100 50  0001 C CNN
F 1 "+5V" H 9400 6390 50  0000 C CNN
F 2 "" H 9400 6250 50  0000 C CNN
F 3 "" H 9400 6250 50  0000 C CNN
	1    9400 6250
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 569167A2
P 9650 6300
F 0 "R2" V 9730 6300 50  0000 C CNN
F 1 "3K3" V 9650 6300 50  0000 C CNN
F 2 "" V 9580 6300 50  0000 C CNN
F 3 "" H 9650 6300 50  0000 C CNN
	1    9650 6300
	0    1    1    0   
$EndComp
NoConn ~ 6900 5050
NoConn ~ 6900 5150
Text Label 8700 4400 2    60   ~ 0
AS1
Text Label 8700 4500 2    60   ~ 0
AS0
Text Label 8700 4300 2    60   ~ 0
~AOE
Text Label 8700 4100 2    60   ~ 0
MISO
Text Label 8700 4200 2    60   ~ 0
MOSI
Text Label 8700 4000 2    60   ~ 0
SCLK
Text Label 6500 4550 0    60   ~ 0
BE
Text Label 6500 4450 0    60   ~ 0
RDY
Text Label 6500 4650 0    60   ~ 0
SYNC
Text Label 8700 5450 2    60   ~ 0
R~W
Text Label 8700 5350 2    60   ~ 0
~RST
Text Label 8700 5250 2    60   ~ 0
~IRQ
NoConn ~ 6900 4850
NoConn ~ 6900 4950
$Comp
L C_Small C6
U 1 1 56919544
P 2400 7350
F 0 "C6" H 2410 7420 50  0000 L CNN
F 1 "100n" H 2410 7270 50  0000 L CNN
F 2 "" H 2400 7350 50  0000 C CNN
F 3 "" H 2400 7350 50  0000 C CNN
	1    2400 7350
	1    0    0    -1  
$EndComp
$Comp
L C_Small C5
U 1 1 569196BC
P 2100 7350
F 0 "C5" H 2110 7420 50  0000 L CNN
F 1 "100n" H 2110 7270 50  0000 L CNN
F 2 "" H 2100 7350 50  0000 C CNN
F 3 "" H 2100 7350 50  0000 C CNN
	1    2100 7350
	1    0    0    -1  
$EndComp
$Comp
L C_Small C4
U 1 1 56919734
P 1800 7350
F 0 "C4" H 1810 7420 50  0000 L CNN
F 1 "100n" H 1810 7270 50  0000 L CNN
F 2 "" H 1800 7350 50  0000 C CNN
F 3 "" H 1800 7350 50  0000 C CNN
	1    1800 7350
	1    0    0    -1  
$EndComp
$Comp
L C_Small C3
U 1 1 5691973A
P 1500 7350
F 0 "C3" H 1510 7420 50  0000 L CNN
F 1 "100n" H 1510 7270 50  0000 L CNN
F 2 "" H 1500 7350 50  0000 C CNN
F 3 "" H 1500 7350 50  0000 C CNN
	1    1500 7350
	1    0    0    -1  
$EndComp
$Comp
L C_Small C2
U 1 1 56919840
P 1200 7350
F 0 "C2" H 1210 7420 50  0000 L CNN
F 1 "100n" H 1210 7270 50  0000 L CNN
F 2 "" H 1200 7350 50  0000 C CNN
F 3 "" H 1200 7350 50  0000 C CNN
	1    1200 7350
	1    0    0    -1  
$EndComp
$Comp
L C_Small C1
U 1 1 56919846
P 900 7350
F 0 "C1" H 910 7420 50  0000 L CNN
F 1 "100n" H 910 7270 50  0000 L CNN
F 2 "" H 900 7350 50  0000 C CNN
F 3 "" H 900 7350 50  0000 C CNN
	1    900  7350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR043
U 1 1 56919AB0
P 700 7550
F 0 "#PWR043" H 700 7300 50  0001 C CNN
F 1 "GND" H 700 7400 50  0000 C CNN
F 2 "" H 700 7550 50  0000 C CNN
F 3 "" H 700 7550 50  0000 C CNN
	1    700  7550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR044
U 1 1 56919B03
P 700 7150
F 0 "#PWR044" H 700 7000 50  0001 C CNN
F 1 "+5V" H 700 7290 50  0000 C CNN
F 2 "" H 700 7150 50  0000 C CNN
F 3 "" H 700 7150 50  0000 C CNN
	1    700  7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 6200 7600 6300
Wire Wire Line
	7600 3400 7600 3500
Wire Wire Line
	9000 3000 9200 3000
Wire Wire Line
	9150 3000 9150 3100
Wire Wire Line
	9150 3100 9200 3100
Connection ~ 9150 3000
Wire Wire Line
	9000 3600 9200 3600
Wire Wire Line
	9200 3500 9150 3500
Wire Wire Line
	9150 3500 9150 3600
Connection ~ 9150 3600
Wire Wire Line
	9200 1200 8800 1200
Wire Wire Line
	9200 1100 8800 1100
Wire Wire Line
	9200 1000 8800 1000
Wire Wire Line
	9200 900  8800 900 
Wire Wire Line
	9200 1600 8800 1600
Wire Wire Line
	9200 1500 8800 1500
Wire Wire Line
	9200 1400 8800 1400
Wire Wire Line
	9200 1300 8800 1300
Wire Wire Line
	5350 4100 5750 4100
Wire Wire Line
	5350 4000 5750 4000
Wire Wire Line
	5350 3900 5750 3900
Wire Wire Line
	5350 3800 5750 3800
Wire Wire Line
	5350 4500 5750 4500
Wire Wire Line
	5350 4400 5750 4400
Wire Wire Line
	5350 4300 5750 4300
Wire Wire Line
	5350 4200 5750 4200
Wire Wire Line
	5350 5600 5750 5600
Wire Wire Line
	5350 5500 5750 5500
Wire Wire Line
	5350 5400 5750 5400
Wire Wire Line
	5350 5300 5750 5300
Wire Wire Line
	5350 6000 5750 6000
Wire Wire Line
	5350 5900 5750 5900
Wire Wire Line
	5350 5800 5750 5800
Wire Wire Line
	5350 5700 5750 5700
Wire Wire Line
	5350 7100 5750 7100
Wire Wire Line
	5350 7000 5750 7000
Wire Wire Line
	5350 6900 5750 6900
Wire Wire Line
	5350 6800 5750 6800
Wire Wire Line
	5350 7500 5750 7500
Wire Wire Line
	5350 7400 5750 7400
Wire Wire Line
	5350 7300 5750 7300
Wire Wire Line
	5350 7200 5750 7200
Wire Wire Line
	3400 3500 3950 3500
Wire Wire Line
	3950 3800 3550 3800
Wire Wire Line
	3950 3900 3550 3900
Wire Wire Line
	3950 5300 3550 5300
Wire Wire Line
	3950 5400 3550 5400
Wire Wire Line
	3950 6800 3550 6800
Wire Wire Line
	3950 6900 3550 6900
Wire Wire Line
	5350 3600 5850 3600
Wire Wire Line
	5850 3600 5850 4750
Wire Wire Line
	5850 4750 3850 4750
Wire Wire Line
	3850 4750 3850 5000
Wire Wire Line
	3850 5000 3950 5000
Wire Wire Line
	5350 5100 5850 5100
Wire Wire Line
	5850 5100 5850 6250
Wire Wire Line
	5850 6250 3850 6250
Wire Wire Line
	3850 6250 3850 6500
Wire Wire Line
	3850 6500 3950 6500
Wire Wire Line
	3950 4350 3550 4350
Wire Wire Line
	3950 5850 3550 5850
Wire Wire Line
	3950 7350 3550 7350
Wire Wire Line
	3950 7500 3550 7500
Wire Wire Line
	3950 6000 3550 6000
Wire Wire Line
	3950 4500 3550 4500
Wire Wire Line
	3950 4100 3550 4100
Wire Wire Line
	3950 5600 3550 5600
Wire Wire Line
	3950 7100 3550 7100
Wire Wire Line
	10300 1200 10700 1200
Wire Wire Line
	10300 1100 10700 1100
Wire Wire Line
	10300 1000 10700 1000
Wire Wire Line
	10300 900  10700 900 
Wire Wire Line
	10300 1600 10700 1600
Wire Wire Line
	10300 1500 10700 1500
Wire Wire Line
	10300 1400 10700 1400
Wire Wire Line
	10300 1300 10700 1300
Wire Wire Line
	10300 2100 10700 2100
Wire Wire Line
	10300 2000 10700 2000
Wire Wire Line
	10300 1900 10700 1900
Wire Wire Line
	10300 1800 10700 1800
Wire Wire Line
	10300 2500 10700 2500
Wire Wire Line
	10300 2400 10700 2400
Wire Wire Line
	10300 2300 10700 2300
Wire Wire Line
	10300 2200 10700 2200
Wire Wire Line
	10300 3000 10700 3000
Wire Wire Line
	10300 2900 10700 2900
Wire Wire Line
	10300 2800 10700 2800
Wire Wire Line
	10300 2700 10700 2700
Wire Wire Line
	10300 3400 10700 3400
Wire Wire Line
	10300 3300 10700 3300
Wire Wire Line
	10300 3200 10700 3200
Wire Wire Line
	10300 3100 10700 3100
Wire Wire Line
	1450 3500 1050 3500
Wire Wire Line
	1450 3800 1050 3800
Wire Wire Line
	1450 3900 1050 3900
Wire Wire Line
	1450 4350 1050 4350
Wire Wire Line
	1450 4500 1050 4500
Wire Wire Line
	1450 4100 1050 4100
Wire Wire Line
	2850 4100 3250 4100
Wire Wire Line
	2850 4000 3250 4000
Wire Wire Line
	2850 3900 3250 3900
Wire Wire Line
	2850 3800 3250 3800
Wire Wire Line
	2850 4500 3250 4500
Wire Wire Line
	2850 4400 3250 4400
Wire Wire Line
	2850 4300 3250 4300
Wire Wire Line
	2850 4200 3250 4200
Wire Wire Line
	2850 3600 3400 3600
Wire Wire Line
	5350 6600 5750 6600
Wire Wire Line
	3400 3600 3400 3500
Wire Wire Line
	8300 4700 8700 4700
Wire Wire Line
	8300 4950 8700 4950
Wire Wire Line
	8300 4600 8700 4600
Wire Wire Line
	10700 6300 11000 6300
Wire Wire Line
	10700 5900 11000 5900
Wire Wire Line
	10300 5900 10400 5900
Wire Wire Line
	10300 5850 10300 5900
Wire Wire Line
	10300 6300 10400 6300
Wire Wire Line
	10300 6250 10300 6300
Wire Wire Line
	9200 1900 8800 1900
Wire Wire Line
	9200 1800 8800 1800
Wire Wire Line
	9200 2500 8800 2500
Wire Wire Line
	9200 2200 8800 2200
Wire Wire Line
	9200 2800 8800 2800
Wire Wire Line
	9200 2700 8800 2700
Wire Wire Line
	9200 2600 8800 2600
Wire Wire Line
	8300 5150 8700 5150
Wire Wire Line
	8300 5050 8700 5050
Wire Wire Line
	6800 1350 7100 1350
Wire Wire Line
	7100 1350 7100 1450
Wire Wire Line
	8000 1800 7700 1800
Wire Wire Line
	6400 2000 6500 2000
Wire Wire Line
	5200 2000 5500 2000
Wire Wire Line
	6400 1350 6450 1350
Wire Wire Line
	6450 1350 6450 1800
Wire Wire Line
	6450 1800 6500 1800
Wire Wire Line
	5400 1350 5500 1350
Wire Wire Line
	3900 1250 4200 1250
Wire Wire Line
	4000 1450 4200 1450
Wire Wire Line
	2800 1050 2700 1050
Wire Wire Line
	2700 1050 2700 1350
Wire Wire Line
	2700 1250 2800 1250
Connection ~ 2700 1250
Wire Wire Line
	7100 2550 7100 2650
Wire Wire Line
	7700 2200 8100 2200
Wire Wire Line
	8100 600  8100 2900
Wire Wire Line
	8100 600  3400 600 
Wire Wire Line
	3400 600  3400 700 
Wire Wire Line
	3400 1800 3400 2000
Wire Wire Line
	3400 2000 3300 2000
Wire Wire Line
	2100 2100 2000 2100
Wire Wire Line
	2000 2100 2000 2300
Wire Wire Line
	2000 2300 1900 2300
Wire Wire Line
	2100 1900 2000 1900
Wire Wire Line
	2000 1900 2000 1700
Wire Wire Line
	2000 1700 1900 1700
Wire Wire Line
	700  1700 1000 1700
Wire Wire Line
	1000 2300 900  2300
Wire Wire Line
	900  2300 900  2900
Wire Wire Line
	900  2900 8100 2900
Connection ~ 8100 2200
Wire Wire Line
	9800 6300 10100 6300
Wire Wire Line
	9800 5900 10100 5900
Wire Wire Line
	9400 5900 9500 5900
Wire Wire Line
	9400 5850 9400 5900
Wire Wire Line
	9400 6300 9500 6300
Wire Wire Line
	9400 6250 9400 6300
Wire Wire Line
	8300 4400 8700 4400
Wire Wire Line
	8300 4500 8700 4500
Wire Wire Line
	8300 4300 8700 4300
Wire Wire Line
	8300 4100 8700 4100
Wire Wire Line
	8300 4200 8700 4200
Wire Wire Line
	8300 4000 8700 4000
Wire Wire Line
	6900 4550 6500 4550
Wire Wire Line
	6900 4450 6500 4450
Wire Wire Line
	6900 4650 6500 4650
Wire Wire Line
	8300 5450 8700 5450
Wire Wire Line
	8300 5350 8700 5350
Wire Wire Line
	8300 5250 8700 5250
Wire Wire Line
	700  7150 700  7200
Wire Wire Line
	700  7200 2400 7200
Wire Wire Line
	2400 7200 2400 7250
Wire Wire Line
	700  7550 700  7500
Wire Wire Line
	700  7500 2400 7500
Wire Wire Line
	2400 7500 2400 7450
Wire Wire Line
	2100 7450 2100 7500
Connection ~ 2100 7500
Wire Wire Line
	1800 7450 1800 7500
Connection ~ 1800 7500
Wire Wire Line
	1500 7450 1500 7500
Connection ~ 1500 7500
Wire Wire Line
	1200 7450 1200 7500
Connection ~ 1200 7500
Wire Wire Line
	900  7450 900  7500
Connection ~ 900  7500
Wire Wire Line
	900  7250 900  7200
Connection ~ 900  7200
Wire Wire Line
	1200 7250 1200 7200
Connection ~ 1200 7200
Wire Wire Line
	1500 7250 1500 7200
Connection ~ 1500 7200
Wire Wire Line
	1800 7250 1800 7200
Connection ~ 1800 7200
Wire Wire Line
	2100 7250 2100 7200
Connection ~ 2100 7200
$Comp
L +5V #PWR045
U 1 1 5691B29D
P 6850 5900
F 0 "#PWR045" H 6850 5750 50  0001 C CNN
F 1 "+5V" H 6850 6040 50  0000 C CNN
F 2 "" H 6850 5900 50  0000 C CNN
F 3 "" H 6850 5900 50  0000 C CNN
	1    6850 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 5900 6850 5950
Wire Wire Line
	6850 5950 6900 5950
Wire Wire Line
	9200 2400 8800 2400
Text Label 8800 2400 0    60   ~ 0
~IRQ
Wire Wire Line
	9200 2300 8800 2300
Text Label 8800 2300 0    60   ~ 0
~NMI
Wire Wire Line
	6900 4750 6500 4750
Text Label 6500 4750 0    60   ~ 0
~NMI
NoConn ~ 9200 2000
NoConn ~ 9200 2100
$EndSCHEMATC
