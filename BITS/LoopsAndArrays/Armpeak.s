// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl peak
    b _start        // End of testing code

// Return the difference between max and min array elements
peak:
	//r2 counter, r3, min, r4 max, r1
	push {r4, r5}
    mov r2, #1
    ldr r3, [r1]
    ldr r4, [r1], #4
    
    
checkmin:
	cmp r2, r0
    bge done
	ldr r5, [r1], #4
    cmp r5, r3
	bgt checkmax
    mov r3, r5

checkmax:
	cmp r5, r4
    blt next
    mov r4, r5

next:
 	add r2, r2, #1   
    b checkmin
    
done:
	sub r0, r4, r3
	pop {r5, r4}
    bx lr
	