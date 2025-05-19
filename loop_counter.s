.EQU SEVEN_SEG_ADDR, 0xff200020
@Bit pattern for 7-segment display: (dp)gfedcba

.global _start
_start:
	ldr r5, =SEVEN_SEG_ADDR
	ldr r6, =led_patterns
	mov r3, #10  //Max value of counter
loop:
	mov r4, #0	//Loop counter
	mov r2, #0	//Offset for array

counter_loop:
	ldr r1, [r6,r2] //Get next 7-seg pattern
	str r1, [r5] //Set 7-seg display to pattern
	add r2, #4 //Update 7-seg pattern array offset
	add r4, #1 //Update loop counter
	cmp r4, r3 //Check if looped through all counter values
	blt counter_loop
	
	mov r4,#0
	reverse_count_loop:
	SUB r2, #4 //Update 7-seg pattern array offset
	LDR r1, [r6,r2] //Get next 7-seg pattern
	STR r1, [r5] //Set 7-seg display to pattern
	ADD r4, #1 //Update loop counter
	CMP r4, r3 //Check if looped through all counter values
	BLT reverse_count_loop
	
	b loop
		

.data
.align 4
led_patterns: 	.word 0b00111111 
				.word 0b00000110
				.word 0b01011011
				.word 0b01001111
				.word 0b01100110
				.word 0b01101101
				.word 0b01111101
				.word 0b00000111
				.word 0b01111111
				.word 0b01101111  

	