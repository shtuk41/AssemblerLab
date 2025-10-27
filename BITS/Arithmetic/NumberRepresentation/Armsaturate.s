// A test case to test your function with
.global _start
_start:
    ldr r0, =0x12345    // First parameter is always in r0
    bl saturate
    b _start        // End of testing code

// Convert unsigned 32 bit to 16 bit, with saturation
saturate:
	ldr r1, =0xffff0000
    and r1, r1, r0
    cmp r1, #0
    bne clamp
	b done
    
    
clamp:
	ldr r1, =0x0000ffff
    mov r0, r1
    
done:
	bx lr
	