@Implements a switch_check subroutine that returns 1 if switch in
@register R0 is on, and returns 1 if it is off
.EQU SWITCH_BASE, 0xff200040

.global _start
_start:
	mov r0, #4
	bl switch_check
	b exit

switch_check:	//Returns 1 if switch in R0 is on, 0 if off
	ldr r5,=SWITCH_BASE
	ldr r1,[r5]
	mov r2, #1
	lsl r2, r2, r0
	and r1, r2, r1
	lsr r1, r1, r0
	mov r0, r1
	bx lr
	
exit:
	
	