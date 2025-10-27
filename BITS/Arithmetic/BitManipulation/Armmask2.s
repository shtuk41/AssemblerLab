.global _start
_start:
	ldr r0, =4
	ldr r1, =2
	bl mask
1:	b 1b    // Done

mask:
	mov r2, #0

process:
	cmp r0, #0
    beq special
    
normal:
	sub r3, r0, r1
    cmp r3, #0
    beq done
    sub r0, r0, #1
    mov r3, #1
    lsl  r3, r3, r0
	orr r2, r2, r3
    b normal

special:    
	  
    cmp r1, #0
    beq done
    lsl r1, #1
    orr r1, r1, #1
    sub r1, r1, #1
    b special

done:
	mov r0, r2
    bx lr
	