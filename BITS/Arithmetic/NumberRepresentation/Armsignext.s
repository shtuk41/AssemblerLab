// A test case to test your function with
.global _start
_start:
    mov r0, #0xf0    // First parameter is always in r0
    bl signext
    b _start         // End of testing code

// A function to sign extend. Only this part will be tested.
signext:
	tst r0, #0x80
    bne negative
    and r0, r0, #0x000000ff
    bx lr
    
negative:   
	ldr r1, =#0xffffff00
    orr r0, r0, r1
    bx lr
	