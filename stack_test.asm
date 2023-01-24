;/********************************************************************************
;* stack_test.asm: Test code for verification of stack implementation by
;*                 several subroutine calls. This code should only be used for
;*                 simulation, otherwise a delay is needed for the led blink
;*                 sequence in the subroutine led_blink.
;********************************************************************************/

; Macro definitions:
.EQU LED1 = PORTB0     ; Led 1 at PIN 8 (PORTB0).
.EQU LED2 = PORTB1     ; Led 1 at PIN 8 (PORTB0).
.EQU LED3 = PORTB2     ; Led 1 at PIN 8 (PORTB0).
.EQU RESET_vect = 0x00 ; Reset vector, start address for the program.

;/********************************************************************************
;* .CSEG: Program memory, storage space for the machine code.
;********************************************************************************/
.CSEG

;/********************************************************************************
;* RESET_vect: Reset vector and start address for the program. A jump is made
;*             to the main subroutine in order to start the program.
;********************************************************************************/
.ORG RESET_vect
   RJMP main

;/********************************************************************************
;* main: Initiates the system at start. The program is kept running as long
;*       as voltage is supplied. The leds connected to PORTB0 - PORTB2 are
;*       blinkning continuously. Values for enabling each LED is stored in
;*       CPU registers R16 - R18 for direct write to data register PORTB.
;********************************************************************************/
main:
   CALL setup
main_loop:
   CALL led_blink
   RJMP main_loop

;/********************************************************************************
;* led_blink: Blinks the leds in a loop continuously.
;********************************************************************************/
led_blink:
   OUT PORTB, R16
   OUT PORTB, R17
   OUT PORTB, R18
   OUT PORTB, R19
   RET

;/********************************************************************************
;* setup: Initiates the system in terms of I/O ports and content in CPU registers.
;********************************************************************************/
setup:
   CALL init_ports
   CALL init_registers
   RET

;/********************************************************************************
;* init_ports: Sets leds to outputs by setting corresponding bits in data
;*             direction register DDRB.
;********************************************************************************/
init_ports:
   LDI R16, (1 << LED1) | (1 << LED2) | (1 << LED3)
   OUT DDRB, R16
   RET

;/********************************************************************************
;* init_registers: Storing values for enabling each led LED1 - LED3 in CPU
;*                 registers R16 - R18 for direct write to data register PORTB.
;********************************************************************************/
init_registers:
   LDI R16, (1 << LED1)
   LDI R17, (1 << LED2)
   LDI R18, (1 << LED3)
   RET
