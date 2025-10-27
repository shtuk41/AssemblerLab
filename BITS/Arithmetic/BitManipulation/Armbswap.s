// A test case to test your function with
.global _start
_start:
    ldr r0, =0x11223344
    bl bswap
    b _start        // End of testing code

// Byte swap
bswap:
	lsr r1, r0, #24
    lsl r2, r0, #24
    orr r1, r1, r2
    and r2, r0, #0x00ff0000
    lsr r2, r2, #8
    orr r1, r1, r2
    and r2, r0, #0x0000ff00
    lsl r2, r2, #8
    orr r1, r1, r2
    mov r0, r1
    bx lr
    
	