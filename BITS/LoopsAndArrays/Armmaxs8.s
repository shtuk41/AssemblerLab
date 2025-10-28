// A test case to test your function with
.data
Array: .byte 1, -2, -3

.text
.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl max
    b _start        // End of testing code

// Return maximum element of unsigned array
max:
	push {r4}

	mov r2, #0
    ldrsb r3, [r1, r2]
    b next

proc:
	ldrsb r4, [r1, r2]
	cmp r4, r3
    blt next
    mov r3, r4

next:
    add r2, r2, #1
    cmp r2, r0
    blt proc
	
done:
	mov r0, r3
    pop {r4}
	bx lr
	