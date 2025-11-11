.global _start
_start:
	ldr sp, =0x40000000	// Initial sp
	mov r0, #6
	mov r1, #1
	mov r2, #2
    mov r3, #3
    
    mov r4, #4
    push {r4}
    mov r4, #5
    push {r4}
    mov r4, #6
    push {r4}
	
	bl sum
	1: b 1b  // done

.global sum
sum:
	push {r4}
    mov r4, #0

    cmp r0, #0
    beq done
    
    add r4, r1
    subs r0, #1
    beq done
    
    add r4, r2
    subs r0, #1
    beq done
    
    add r4, r3
    subs r0, #1
    beq done

	mov r1, #4

repeat:

	ldr r2, [sp, r1]
	add r4, r2
    add r1, r1, #4
    subs r0, #1
    bne repeat
    
done:
	mov r0, r4
	pop {r4}

	bx lr
    
	
	