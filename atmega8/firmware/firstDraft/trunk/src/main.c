/*
 * main.c
 *
 * Created: 23.04.2017
 *  Author: Prozessorkern
 * 
 * receives a DMX Stream over UART and controls a RGB LED via soft PWM
 *
 */ 
/*
PORTB:

PB0: USB -
PB1: USB +
PB2: LED_R
PB3: LED_G
PB4: LED_B
PB5: NC

PORTC:

PC0: Dip 0
PC1: Dip 1
PC2: Dip 2
PC3: Dip 3
PC4: Dip 4
PC5: Dip 5

PORTD:

PD0: DMX Receive
PD1: DMX Send
PD2: GPIO1
PD3: GPIO2
PD4: Dip 6
PD5: Dip 7
PD6: Bootloader
PD7: DMX_DIR

*/

#define F_CPU 16000000
#define MAX_BRIGHTNES 200

#include <avr/io.h>
#include <util/delay.h>  
#include <avr/interrupt.h> 
#include <stdlib.h>


unsigned char volatile channel[3] = {0,0,0};

int main(void)
{	
	int current_byte = 2;
	char current_bit = -1;
	int adress;
	int status = 0;


	DDRB = 0b00011100;
	PORTB = 0b000000000;
	DDRC = 0x00;
	PORTC = 0xFF;
	DDRD = 0b10000010;
	PORTD = 0b00110000;
	
	/*! - enable UART reception */
	UBRRL  = ((F_CPU/4000000)-1);						//250kbaud, 8N2
	UCSRC  = (1<<URSEL)|(3<<UCSZ0)|(1<<USBS);

	UCSRB  = (1<<RXEN);
	
	/*! - configure timer1 */
	TCCR1B = (1<<WGM12)|(1<<CS10);
	OCR1A = 150;
	TIMSK |= (1<<OCIE1A);
	
	/*! - calculate DMX address */
	adress = 256 - (PINC + ((PIND<<2)&0b11000000));

	/*! - reset counter 1 */
	TCNT1 = 0;
	
	/*! - enable interrupts for soft - pwm */
	sei();
	
    while(1)
    {
		/*! - wait for incominc UART Frame (DMX) */
		while(!(UCSRA & (1<<RXC)))
		{
			asm volatile("nop");
		}
		/*! - get status and data from UART controler */
		status = UCSRA;
		current_bit = UDR;
			
		/*! - check for UART framing error ==> DMX pause detected */
		if((status & (1<<FE))){
			current_byte = 1;
			UCSRA &= ~(1<<FE);
		}
		
		/*! - check for first DMX Byte ==> allways 0 */
		else if(current_byte == 1){	
			/* no error */
			if(current_bit == 0)
			{
				current_byte = 2;
			}
			/* error */
			else
			{
				current_byte = -2;
			}	
		}
		
		/*! - check if received DMX date has our address */
		else if(current_byte >= adress && current_byte <=(adress+2)){
			
			/*! - copy data */
			channel[current_byte - adress] = current_bit;
			current_byte ++;
				
		}
		
		/*! - not our address */
		else if(current_byte > 0 && current_byte <= 255)
		{
			current_byte ++;
		}
		
		/*! - DMX address exceeded range ==> stop reception until pause is received */
		else
		{
			current_byte = -2;
		}
		
		/*! - delete UART status */
		UCSRA = 0;
    }
}

/* Timer interrupt handler for soft pwm */
ISR(TIMER1_COMPA_vect){
	
	static char counter = 0;

	/*! - overflow detected */
	if(counter > 254){
		/*! - reset counter and set outputs if active */
		counter = 0;
		PORTB &= ~((1<<PB2)&(1<<PB3)&(1<<PB4));
		
		if(channel[0] > 0) PORTB |= (1<<PB4);
		if(channel[1] > 0) PORTB |= (1<<PB3);
		if(channel[2] > 0) PORTB |= (1<<PB2);
		
	}
	else{
		/*! - increment counter */
		counter ++;
		
		/*! - reset outputs if nessesary*/
		if(channel[0] < counter) PORTB &= ~(1<<PB4);
		if(channel[1] < counter) PORTB &= ~(1<<PB3);
		if(channel[2] < counter) PORTB &= ~(1<<PB2);
	}

}