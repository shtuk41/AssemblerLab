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
	
	bl max
	1: b 1b  // done

.global max
max:
	push {r4}
    
    mov r4, #0
    cmp r0, #0
    beq done
    
    mov r4, r1
    subs r0, #1
    beq done
    
    cmp r4, r2
    movlt r4, r2
    
n1:
	subs r0, #1
    beq done
	cmp r4, r3
    movlt r4, r2
    
    mov r1, #4
    
repeat:
	subs r0, #1
    beq done
    
    ldr r2, [sp, r1]
    add r1, r1, #4
    cmp r4, r2
    movlt r4, r2
    b repeat
    
done:
	mov r0, r4
    pop {r4}
	bx lr
	
	