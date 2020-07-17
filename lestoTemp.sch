EESchema Schematic File Version 4
EELAYER 30 0
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
L Device:R R5
U 1 1 5EDCF6F0
P 6350 2950
F 0 "R5" H 6450 3000 50  0000 L CNN
F 1 "1K" H 6450 2950 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 6280 2950 50  0001 C CNN
F 3 "~" H 6350 2950 50  0001 C CNN
	1    6350 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5EDCFCC2
P 5300 2950
F 0 "R4" H 5400 3000 50  0000 L CNN
F 1 "10K" H 5400 2950 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 5230 2950 50  0001 C CNN
F 3 "~" H 5300 2950 50  0001 C CNN
	1    5300 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3300 5500 3450
Wire Wire Line
	5500 3800 5500 3750
$Comp
L power:GND #PWR0101
U 1 1 5EDD39F4
P 1950 4100
F 0 "#PWR0101" H 1950 3850 50  0001 C CNN
F 1 "GND" H 2000 3900 50  0000 C CNN
F 2 "" H 1950 4100 50  0001 C CNN
F 3 "" H 1950 4100 50  0001 C CNN
	1    1950 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0102
U 1 1 5EDD41E2
P 1950 2500
F 0 "#PWR0102" H 1950 2350 50  0001 C CNN
F 1 "+3.3V" H 2000 2700 50  0000 C CNN
F 2 "" H 1950 2500 50  0001 C CNN
F 3 "" H 1950 2500 50  0001 C CNN
	1    1950 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5EDD8EF0
P 7200 3450
F 0 "R6" H 7300 3500 50  0000 L CNN
F 1 "1K" H 7300 3450 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 7130 3450 50  0001 C CNN
F 3 "~" H 7200 3450 50  0001 C CNN
	1    7200 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3600 7200 3700
Wire Wire Line
	2650 3100 2650 3000
Wire Wire Line
	2650 3000 2850 3000
Wire Wire Line
	2750 3300 2750 3100
Wire Wire Line
	2750 3100 2850 3100
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 5EDE582E
P 3050 3100
F 0 "J1" H 3000 2950 50  0000 R CNN
F 1 "PRG" H 3000 3050 50  0000 R CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x04_P1.00mm_Vertical" H 3050 3100 50  0001 C CNN
F 3 "~" H 3050 3100 50  0001 C CNN
	1    3050 3100
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 5EDEFD4D
P 4150 2950
F 0 "R2" H 4250 3000 50  0000 L CNN
F 1 "33K" H 4250 2950 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 4080 2950 50  0001 C CNN
F 3 "~" H 4150 2950 50  0001 C CNN
	1    4150 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5EDF0391
P 4150 3950
F 0 "R3" H 4250 4000 50  0000 L CNN
F 1 "10K" H 4250 3950 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 4080 3950 50  0001 C CNN
F 3 "~" H 4150 3950 50  0001 C CNN
	1    4150 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3100 4150 3200
$Comp
L power:+3.3V #PWR0103
U 1 1 5EE09923
P 4150 2700
F 0 "#PWR0103" H 4150 2550 50  0001 C CNN
F 1 "+3.3V" H 4200 2900 50  0000 C CNN
F 2 "" H 4150 2700 50  0001 C CNN
F 3 "" H 4150 2700 50  0001 C CNN
	1    4150 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 2800 4150 2700
Text GLabel 2650 3800 2    50   Output ~ 0
GPIO16
Wire Wire Line
	2550 3800 2650 3800
Wire Wire Line
	4150 4200 4150 4100
Text GLabel 1250 3200 0    50   Input ~ 0
ADC
$Comp
L Device:C C1
U 1 1 5EDCF230
P 5500 3600
F 0 "C1" H 5650 3650 50  0000 L CNN
F 1 "100nF" H 5650 3600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5538 3450 50  0001 C CNN
F 3 "~" H 5500 3600 50  0001 C CNN
	1    5500 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3200 1350 3200
$Comp
L power:+3.3V #PWR0104
U 1 1 5EE2D21A
P 5300 2700
F 0 "#PWR0104" H 5300 2550 50  0001 C CNN
F 1 "+3.3V" H 5350 2900 50  0000 C CNN
F 2 "" H 5300 2700 50  0001 C CNN
F 3 "" H 5300 2700 50  0001 C CNN
	1    5300 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2800 5300 2700
Wire Wire Line
	5100 3800 5300 3800
$Comp
L power:GND #PWR0105
U 1 1 5EE31664
P 5300 3900
F 0 "#PWR0105" H 5300 3650 50  0001 C CNN
F 1 "GND" H 5350 3700 50  0000 C CNN
F 2 "" H 5300 3900 50  0001 C CNN
F 3 "" H 5300 3900 50  0001 C CNN
	1    5300 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3900 5300 3800
Connection ~ 5300 3800
Wire Wire Line
	5300 3800 5500 3800
Wire Wire Line
	5100 3300 5300 3300
Wire Wire Line
	5300 3300 5300 3200
Connection ~ 5300 3300
Wire Wire Line
	5300 3300 5500 3300
Text GLabel 5400 3200 2    50   Output ~ 0
RESET
Wire Wire Line
	5400 3200 5300 3200
Connection ~ 5300 3200
Wire Wire Line
	5300 3200 5300 3100
Text GLabel 1250 2800 0    50   Input ~ 0
RESET
Text GLabel 1250 3000 0    50   Input ~ 0
ENABLE
Wire Wire Line
	1250 2800 1350 2800
Wire Wire Line
	1250 3000 1350 3000
Text GLabel 6350 3200 3    50   Output ~ 0
ENABLE
$Comp
L power:+3.3V #PWR0106
U 1 1 5EE517D3
P 6350 2700
F 0 "#PWR0106" H 6350 2550 50  0001 C CNN
F 1 "+3.3V" H 6400 2900 50  0000 C CNN
F 2 "" H 6350 2700 50  0001 C CNN
F 3 "" H 6350 2700 50  0001 C CNN
	1    6350 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3100 6350 3200
Wire Wire Line
	6350 2700 6350 2800
Wire Wire Line
	7200 3700 7300 3700
$Comp
L power:GND #PWR0107
U 1 1 5EE6906D
P 7300 3800
F 0 "#PWR0107" H 7300 3550 50  0001 C CNN
F 1 "GND" H 7350 3600 50  0000 C CNN
F 2 "" H 7300 3800 50  0001 C CNN
F 3 "" H 7300 3800 50  0001 C CNN
	1    7300 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 3800 7300 3700
Connection ~ 7300 3700
Wire Wire Line
	7300 3700 7400 3700
Text GLabel 7400 2800 1    50   Output ~ 0
GPIO0
Text GLabel 7200 3200 1    50   Output ~ 0
GPIO15
Wire Wire Line
	7200 3300 7200 3200
Text GLabel 2650 3700 2    50   Output ~ 0
GPIO15
Text GLabel 2650 2800 2    50   Output ~ 0
GPIO0
Wire Wire Line
	2550 2800 2650 2800
Wire Wire Line
	2550 3700 2650 3700
Wire Wire Line
	2550 2900 2850 2900
Wire Wire Line
	2550 3100 2650 3100
Wire Wire Line
	2550 3200 2850 3200
Wire Wire Line
	2750 3300 2550 3300
$Comp
L RF_Module:ESP-12E U1
U 1 1 5EDCC649
P 1950 3400
F 0 "U1" H 1500 4250 50  0000 C CNN
F 1 "ESP-12E" H 1600 4150 50  0000 C CNN
F 2 "RF_Module:ESP-12E" H 1950 3400 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 1600 3500 50  0001 C CNN
	1    1950 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 2600 1950 2500
Text GLabel 2650 3400 2    50   BiDi ~ 0
GPIO12
Wire Wire Line
	2550 3400 2650 3400
Text GLabel 9200 3000 2    50   BiDi ~ 0
GPIO12
$Comp
L Sensor:DHT11 U2
U 1 1 5EE931F1
P 8700 3000
F 0 "U2" H 8400 3350 50  0000 C CNN
F 1 "DHT11" H 8450 3250 50  0000 C CNN
F 2 "Sensor:Aosong_DHT11_5.5x12.0_P2.54mm" H 8700 2600 50  0001 C CNN
F 3 "http://akizukidenshi.com/download/ds/aosong/DHT11.pdf" H 8850 3250 50  0001 C CNN
	1    8700 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0108
U 1 1 5EE99F5E
P 8700 2500
F 0 "#PWR0108" H 8700 2350 50  0001 C CNN
F 1 "+3.3V" H 8750 2700 50  0000 C CNN
F 2 "" H 8700 2500 50  0001 C CNN
F 3 "" H 8700 2500 50  0001 C CNN
	1    8700 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5EE9B0F5
P 8700 3500
F 0 "#PWR0109" H 8700 3250 50  0001 C CNN
F 1 "GND" H 8750 3300 50  0000 C CNN
F 2 "" H 8700 3500 50  0001 C CNN
F 3 "" H 8700 3500 50  0001 C CNN
	1    8700 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5EE9D24C
P 9750 3000
F 0 "C2" H 9900 3050 50  0000 L CNN
F 1 "100nF" H 9900 3000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9788 2850 50  0001 C CNN
F 3 "~" H 9750 3000 50  0001 C CNN
	1    9750 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5EEB110E
P 9100 2800
F 0 "R7" H 9200 2850 50  0000 L CNN
F 1 "4.7K" H 9200 2800 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 9030 2800 50  0001 C CNN
F 3 "~" H 9100 2800 50  0001 C CNN
	1    9100 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3400 8700 3500
Wire Wire Line
	8700 2500 8700 2600
Wire Wire Line
	8700 2600 9100 2600
Connection ~ 8700 2600
Wire Wire Line
	8700 2600 8700 2700
Wire Wire Line
	9750 2600 9750 2850
Wire Wire Line
	8700 3300 8700 3400
Connection ~ 8700 3400
Wire Wire Line
	9750 3150 9750 3400
Wire Wire Line
	8700 3400 9750 3400
Wire Wire Line
	9000 3000 9100 3000
Wire Wire Line
	9100 3000 9100 2950
Connection ~ 9100 3000
Wire Wire Line
	9100 3000 9200 3000
Wire Wire Line
	9100 2650 9100 2600
Connection ~ 9100 2600
Wire Wire Line
	9100 2600 9750 2600
Text GLabel 1350 2400 1    50   Input ~ 0
GPIO16
$Comp
L power:GND #PWR0110
U 1 1 5EE0FFEB
P 4150 4200
F 0 "#PWR0110" H 4150 3950 50  0001 C CNN
F 1 "GND" H 4200 4000 50  0000 C CNN
F 2 "" H 4150 4200 50  0001 C CNN
F 3 "" H 4150 4200 50  0001 C CNN
	1    4150 4200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5EEE8772
P 4250 5150
F 0 "J2" V 4300 5200 50  0000 L CNN
F 1 "PWR" V 4400 5200 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x02_P1.00mm_Vertical" H 4250 5150 50  0001 C CNN
F 3 "~" H 4250 5150 50  0001 C CNN
	1    4250 5150
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0111
U 1 1 5EEEA5BD
P 4150 5450
F 0 "#PWR0111" H 4150 5300 50  0001 C CNN
F 1 "+3.3V" H 4200 5650 50  0000 C CNN
F 2 "" H 4150 5450 50  0001 C CNN
F 3 "" H 4150 5450 50  0001 C CNN
	1    4150 5450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5EEEC870
P 4250 5450
F 0 "#PWR0112" H 4250 5200 50  0001 C CNN
F 1 "GND" H 4300 5250 50  0000 C CNN
F 2 "" H 4250 5450 50  0001 C CNN
F 3 "" H 4250 5450 50  0001 C CNN
	1    4250 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 5350 4150 5450
Wire Wire Line
	4250 5350 4250 5450
Wire Notes Line
	3350 2300 3350 4500
Wire Notes Line
	4850 2300 4850 4500
Wire Notes Line
	6100 2300 6100 4500
Wire Notes Line
	6900 2300 6900 4500
Wire Notes Line
	8100 2300 8100 4500
Wire Notes Line
	3350 4900 5550 4900
Text Notes 3650 2200 0    50   ~ 0
battery voltage check
Text Notes 5100 2200 0    50   ~ 0
reset
Text Notes 6250 2200 0    50   ~ 0
enable
Text Notes 7100 2200 0    50   ~ 0
progam
Text Notes 8400 2200 0    50   ~ 0
sensor
Text Notes 3600 5100 0    50   ~ 0
power
$Comp
L Sensor:BME280 U3
U 1 1 5EF13A73
P 9050 4700
F 0 "U3" H 8600 4750 50  0000 R CNN
F 1 "BME280" H 8600 4700 50  0000 R CNN
F 2 "Package_LGA:Bosch_LGA-8_2.5x2.5mm_P0.65mm_ClockwisePinNumbering" H 10550 4250 50  0001 C CNN
F 3 "https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BME280-DS002.pdf" H 9050 4500 50  0001 C CNN
	1    9050 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 5300 9050 5300
Text GLabel 1250 3800 0    50   Input ~ 0
SDO
Text GLabel 1250 3500 0    50   Input ~ 0
SDI
Text GLabel 1250 3900 0    50   Input ~ 0
CLK
Text GLabel 1250 3400 0    50   Input ~ 0
CS
Text GLabel 9750 4800 2    50   Input ~ 0
SDO
Text GLabel 9750 4400 2    50   Input ~ 0
SDI
Text GLabel 9750 4600 2    50   Input ~ 0
CLK
Text GLabel 9750 5000 2    50   Input ~ 0
CS
Wire Wire Line
	1250 3900 1350 3900
Wire Wire Line
	1350 3800 1250 3800
Wire Wire Line
	1250 3500 1350 3500
Wire Wire Line
	1350 3400 1250 3400
Wire Wire Line
	9650 4400 9750 4400
Wire Wire Line
	9650 4600 9750 4600
Wire Wire Line
	9650 4800 9750 4800
Wire Wire Line
	9650 5000 9750 5000
$Comp
L power:+3.3V #PWR0113
U 1 1 5EF375E9
P 9050 4100
F 0 "#PWR0113" H 9050 3950 50  0001 C CNN
F 1 "+3.3V" H 9100 4300 50  0000 C CNN
F 2 "" H 9050 4100 50  0001 C CNN
F 3 "" H 9050 4100 50  0001 C CNN
	1    9050 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5EF375EF
P 9050 5300
F 0 "#PWR0114" H 9050 5050 50  0001 C CNN
F 1 "GND" H 9100 5100 50  0000 C CNN
F 2 "" H 9050 5300 50  0001 C CNN
F 3 "" H 9050 5300 50  0001 C CNN
	1    9050 5300
	1    0    0    -1  
$EndComp
Connection ~ 9050 5300
Wire Wire Line
	9050 5300 9150 5300
$Comp
L Device:C C3
U 1 1 5EF42454
P 9900 5700
F 0 "C3" H 9550 5750 50  0000 L CNN
F 1 "100nf" H 9550 5700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9938 5550 50  0001 C CNN
F 3 "~" H 9900 5700 50  0001 C CNN
	1    9900 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5EF455C3
P 10100 5700
F 0 "C4" H 10250 5750 50  0000 L CNN
F 1 "100nf" H 10250 5700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 10138 5550 50  0001 C CNN
F 3 "~" H 10100 5700 50  0001 C CNN
	1    10100 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 4100 9050 4100
Wire Wire Line
	9150 4100 9050 4100
Connection ~ 9050 4100
$Comp
L power:+3.3V #PWR0115
U 1 1 5EF6E6E7
P 10000 5450
F 0 "#PWR0115" H 10000 5300 50  0001 C CNN
F 1 "+3.3V" H 10050 5650 50  0000 C CNN
F 2 "" H 10000 5450 50  0001 C CNN
F 3 "" H 10000 5450 50  0001 C CNN
	1    10000 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5EF728F7
P 10000 5950
F 0 "#PWR0116" H 10000 5700 50  0001 C CNN
F 1 "GND" H 10050 5750 50  0000 C CNN
F 2 "" H 10000 5950 50  0001 C CNN
F 3 "" H 10000 5950 50  0001 C CNN
	1    10000 5950
	1    0    0    -1  
$EndComp
NoConn ~ 1350 3600
NoConn ~ 1350 3700
NoConn ~ 2550 3500
NoConn ~ 2550 3000
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5EFA4ADB
P 4900 3600
F 0 "J3" H 5000 3800 50  0000 C CNN
F 1 "RST" H 5000 3700 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x02_P1.00mm_Vertical" H 4900 3600 50  0001 C CNN
F 3 "~" H 4900 3600 50  0001 C CNN
	1    4900 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5EFA7646
P 7600 3150
F 0 "J4" H 7550 3000 50  0000 R CNN
F 1 "PRG" H 7550 3100 50  0000 R CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x02_P1.00mm_Vertical" H 7600 3150 50  0001 C CNN
F 3 "~" H 7600 3150 50  0001 C CNN
	1    7600 3150
	-1   0    0    1   
$EndComp
Wire Wire Line
	7400 2800 7400 3050
Wire Wire Line
	7400 3150 7400 3700
Wire Wire Line
	5100 3300 5100 3600
Wire Wire Line
	5100 3700 5100 3800
$Comp
L Mechanical:MountingHole H1
U 1 1 5EFDCA38
P 1250 5050
F 0 "H1" H 1350 5100 50  0000 L CNN
F 1 "MountingHole" H 1350 5050 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 1250 5050 50  0001 C CNN
F 3 "~" H 1250 5050 50  0001 C CNN
	1    1250 5050
	1    0    0    -1  
$EndComp
Connection ~ 1350 2800
Text GLabel 2650 3600 2    50   Output ~ 0
GPIO14
Wire Wire Line
	2550 3600 2650 3600
Wire Wire Line
	9900 5850 10000 5850
Wire Wire Line
	9900 5550 10000 5550
Wire Wire Line
	10000 5550 10000 5450
Connection ~ 10000 5550
Wire Wire Line
	10000 5550 10100 5550
Wire Wire Line
	10000 5850 10000 5950
Connection ~ 10000 5850
Wire Wire Line
	10000 5850 10100 5850
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5F02A8E2
P 1150 2500
F 0 "J5" H 950 2600 50  0000 L CNN
F 1 "SLP" H 950 2500 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x02_P1.00mm_Vertical" H 1150 2500 50  0001 C CNN
F 3 "~" H 1150 2500 50  0001 C CNN
	1    1150 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 2600 1350 2800
Wire Wire Line
	1350 2500 1350 2400
$Comp
L Mechanical:MountingHole H2
U 1 1 5F046D8D
P 1250 5300
F 0 "H2" H 1350 5350 50  0000 L CNN
F 1 "MountingHole" H 1350 5300 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 1250 5300 50  0001 C CNN
F 3 "~" H 1250 5300 50  0001 C CNN
	1    1250 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3700 4150 3800
Wire Wire Line
	4150 3600 4150 3700
Connection ~ 4150 3700
Wire Wire Line
	4400 3700 4150 3700
Text GLabel 3850 3900 3    50   Output ~ 0
GPIO14
Wire Wire Line
	3850 3900 3850 3800
Wire Wire Line
	3850 3500 3850 3400
$Comp
L Device:R R1
U 1 1 5EDF1A6D
P 3850 3650
F 0 "R1" H 3950 3700 50  0000 L CNN
F 1 "1K" H 3950 3650 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 3780 3650 50  0001 C CNN
F 3 "~" H 3850 3650 50  0001 C CNN
	1    3850 3650
	-1   0    0    1   
$EndComp
Text GLabel 4400 3700 2    50   Output ~ 0
ADC
$Comp
L Device:Q_NPN_BEC Q1
U 1 1 5EDE920C
P 4050 3400
F 0 "Q1" H 4250 3450 50  0000 L CNN
F 1 "Q_NPN_BCE" H 4250 3400 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4250 3500 50  0001 C CNN
F 3 "~" H 4050 3400 50  0001 C CNN
F 4 "SS8550" H 4050 3400 50  0001 C CNN "LCSC"
	1    4050 3400
	1    0    0    -1  
$EndComp
$EndSCHEMATC