.global _start
_start:
	ldr r0, =4
	bl pow2
1:	b 1b    // Done

pow2:
	sub r1, r0, #1
    and r0, r0, r1
    cmp r0, #0
    beq powerof2
    mov r0, #0
    bx lr
    
powerof2:
	mov r0, #1
    bx lr
	
	