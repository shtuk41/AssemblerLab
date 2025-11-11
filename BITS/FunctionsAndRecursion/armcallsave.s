.global _start
	ldr sp, =0x40000000
	mov r0, #10
	mov r1, #10
	mov r2, #20
	mov r3, #30
	bl call1234
	1: b 1b

	//secret:  // For debugging, uncomment this label
             // Don't submit with this label though, or you will get a duplicate label error.
		mov r0, #10
		bx lr

.global call1234
call1234:
	push {r4, r5, lr}
    mov r5, #0
    
    mov r4,r0 
    
  	push {r1, r2, r3}
    
    mov r0, #1
    mov r1, #2
    mov r2, #3
    mov r3, #4
    
    bl secret

	pop {r1, r2, r3}

    cmp r0, r4
	bne f2
    add r5, r5, #1

f2:
	cmp r0, r1
    bne f3
    add r5, r5, #1

f3:
	cmp r0, r2
    bne f4
    add r5, r5, #1

f4:
	cmp r0, r3
    bne finish
    add r5, r5, #1
    
finish:
	mov r0, r5
    
    pop {r4, r5, lr}
    
    bx lr
    
    
	