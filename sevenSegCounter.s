.global _start
_start:
	//Create address 0xff20020 in register r5
	mov r5, #0xff
	lsl r5, r5, #24
	mov r6, #0x20
	lsl r6, r6, #16
	add r5, r5, r6
	mov r6, #0x20
	add r5, r5, r6	
	//Address to 7-seg display now in r5
	
	mov r1, #0x6
	str r1, [r5]
	
	mov r1, #0x5b
	str r1, [r5]
	
	mov r1, #0x4f
	str r1, [r5]
	
	
	
	

	
	