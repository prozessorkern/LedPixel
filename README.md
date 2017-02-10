# LedPixel
Small devices to drive up to 10W RGB LEDs by DMX

## there might be several versions of the pcb (and Firmware)
* a dev board version with an ATmega8 with USB Bootloader, a dip Switch and some additional Interfaces
* a stripped Version with an ATmega8 without USB, dip Switch and Interfaces, just a DMX Interface to control the LED and Solder Jumper to set a permanent address
* a board for an external LED
* a RGBW version with 4 LED Drivers an a STM32 Controller with 16 bit PWM, an faster RS485 than DMX and an additional SPI Interface for addressing multiple devices