.EQU SEVEN_SEG_ADDR, 0xff200020
@Bit pattern for 7-segment display: (dp)gfedcba

.global _start
_start:
	ldr r5, =SEVEN_SEG_ADDR
	ldr r6, =led_patterns
	mov r3, #10  //Max value of counter
	mov r4, #0	//Loop counter
	mov r2, #0	//Offset for array
loop:
	ldr r1, [r6,r2] 
	str r1, [r5]
	add r2, #4
	add r4, #1
	cmp r4, r3
	blt loop
		

.data
.align 4
led_patterns: .word 0b00111111, 0b00000110, 0b01011011, 0b01001111, 0b01100110, 0b01101101, 0b01111101, 0b00000111, 0b01111111, 0b01101111  

	