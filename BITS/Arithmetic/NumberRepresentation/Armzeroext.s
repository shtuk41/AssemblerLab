// A test case to test your function with
.global _start
_start:
    ldr r0, =0xf0    // First parameter is always in r0
    bl zeroext
    b _start        // End of testing code

// A function to zero extend. Only this part will be tested.
zeroext:

	and r0, r0, #0x000000ff
    bx lr
	
	