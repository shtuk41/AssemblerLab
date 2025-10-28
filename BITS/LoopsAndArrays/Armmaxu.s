// A test case to test your function with
Array: .word 8, 12, 7

.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl max
    b _start        // End of testing code

// Return maximum element of unsigned array
max:
	push {r4}
	mov r2, #1
    ldr r3, [r1], #4
    cmp r2, r0
    beq done

proc:
	ldr r4, [r1], #4
    cmp r4, r3
	blo next
    mov r3, r4
    
    
next:    
    add r2, r2, #1
    cmp r2, r0
    bge done
    b proc
    
done:
    mov r0, r3
    pop {r4}
    bx lr

	
	