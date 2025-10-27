.global _start
_start:
	ldr r0, =4
	bl mask
1:	b 1b    // Done

mask:
	mov r1, #0
    
process:    
    cmp r0, #0
   	beq done
    lsl r1, r1, #1
   	orr r1, r1, #1
    sub r0, r0, #1
    b process
   
done:
	mov r0, r1
    bx lr
	