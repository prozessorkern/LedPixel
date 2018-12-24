EESchema Schematic File Version 4
LIBS:led_pixel_stm32f030_cree-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title "Led Pixel Backplane connection"
Date "2017-06-18"
Rev "1.1"
Comp "shimatta"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 4000 3600 0    60   ~ 0
RS485_P
Text Label 4000 3700 0    60   ~ 0
RS485_N
Text Label 4000 3200 0    60   ~ 0
DAISY_R_TO_L
Text Label 3850 3400 0    60   ~ 0
DAISY_IN
Text Label 4850 3400 2    60   ~ 0
DAISY_OUT
Text Label 4000 3100 0    60   ~ 0
BUS_RESET
Text Label 4000 3300 0    60   ~ 0
DAISY_CLK
Text Notes 6100 3050 0    60   ~ 0
Place both pin headers on the same height\nthey have to be 1,27mm away from the edge of the pcb\nthe connections between 2 pcbs is done using standard 2,54mm jumpers
Text HLabel 1250 1050 0    60   Output ~ 0
POWER_IN
Text HLabel 1250 1150 0    60   Output ~ 0
POWER_GND
Text HLabel 1250 1650 0    60   Output ~ 0
DAISY_IN
Text HLabel 1250 1750 0    60   Input ~ 0
DAISY_OUT
Text HLabel 1250 2050 0    60   Output ~ 0
RS485_N
Text HLabel 1250 1950 0    60   Output ~ 0
RS485_P
Text HLabel 1250 2150 0    60   Output ~ 0
BUS_RESET
Text HLabel 1250 1850 0    60   Output ~ 0
DAISY_CLK
Text HLabel 1250 2450 0    60   Output ~ 0
+5V_IN
Text HLabel 1250 2550 0    60   Output ~ 0
GND_IN
Text Label 4000 3500 0    60   ~ 0
GND_IN
Text Label 4000 3800 0    60   ~ 0
+5V_IN
Text Label 4000 1750 0    60   ~ 0
POWER_IN
Text Label 4000 1850 0    60   ~ 0
POWER_GND_IN
Text Label 1400 1050 0    60   ~ 0
POWER_IN
Text Label 1400 1150 0    60   ~ 0
POWER_GND_IN
Text Label 1400 2450 0    60   ~ 0
+5V_IN
Text Label 1400 2550 0    60   ~ 0
GND_IN
Text Label 1400 1650 0    60   ~ 0
DAISY_IN
Text Label 1400 1750 0    60   ~ 0
DAISY_OUT
Text Label 1400 2150 0    60   ~ 0
BUS_RESET
Text Label 1400 1950 0    60   ~ 0
RS485_P
Text Label 1400 2050 0    60   ~ 0
RS485_N
Text Label 1400 1850 0    60   ~ 0
DAISY_CLK
Wire Wire Line
	3600 1750 4000 1750
Wire Wire Line
	3600 1850 4000 1850
Wire Wire Line
	3600 3500 5100 3500
Wire Wire Line
	3600 3800 5100 3800
Wire Wire Line
	3600 3700 5100 3700
Wire Wire Line
	5100 3600 3600 3600
Wire Wire Line
	5100 3100 3600 3100
Wire Wire Line
	3600 3200 5100 3200
Wire Wire Line
	1400 1050 1250 1050
Wire Wire Line
	1400 1150 1250 1150
Wire Wire Line
	1400 1650 1250 1650
Wire Wire Line
	1400 1750 1250 1750
Wire Wire Line
	1400 1850 1250 1850
Wire Wire Line
	1400 1950 1250 1950
Wire Wire Line
	1400 2050 1250 2050
Wire Wire Line
	1400 2150 1250 2150
Wire Wire Line
	1400 2450 1250 2450
Wire Wire Line
	1400 2550 1250 2550
Wire Wire Line
	3850 3400 3600 3400
Wire Wire Line
	4850 3400 5100 3400
Wire Wire Line
	3600 3300 5100 3300
$Comp
L conn:Conn_01x08 J2
U 1 1 5C206064
P 3400 3500
F 0 "J2" H 3318 2875 50  0000 C CNN
F 1 "Conn_01x08" H 3318 2966 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 3400 3500 50  0001 C CNN
F 3 "~" H 3400 3500 50  0001 C CNN
	1    3400 3500
	-1   0    0    1   
$EndComp
$Comp
L conn:Conn_01x08 J3
U 1 1 5C207429
P 5300 3500
F 0 "J3" H 5218 2875 50  0000 C CNN
F 1 "Conn_01x08" H 5218 2966 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 5300 3500 50  0001 C CNN
F 3 "~" H 5300 3500 50  0001 C CNN
	1    5300 3500
	1    0    0    1   
$EndComp
$Comp
L conn:Screw_Terminal_01x02 J1
U 1 1 5C218612
P 3400 1750
F 0 "J1" H 3318 1967 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 3318 1876 50  0000 C CNN
F 2 "Connectors:AK300-2" H 3400 1750 50  0001 C CNN
F 3 "~" H 3400 1750 50  0001 C CNN
	1    3400 1750
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
