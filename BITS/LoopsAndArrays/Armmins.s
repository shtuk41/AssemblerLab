// A test case to test your function with
Array: .word 1, -2, -3, 5

.global _start
_start:
    ldr r0, =1 
    ldr r1, =Array
    bl min
    b _start        // End of testing code

// Return minimum element of signed array
min:
	push {r4}
	mov r2, #1
    ldr r3, [r1]
    cmp r2, r0
    beq done

proc:
	ldr r4, [r1, r2, lsl #2]
    cmp r4, r3
	bgt next
    mov r3, r4
    
    
next:    
    add r2, r2, #1
    cmp r2, r0
    bge done
    b proc
    
done:
	pop {r4}
    mov r0, r3
    bx lr
	