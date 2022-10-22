.global _start
_start:
	.EQU led_base, 0xff200000
	ldr r5, =led_base
	mov r1, #0
counter_loop:
	str r1, [r5]
	add r1, #1
	cmp r1,#100
	BNE counter_loop