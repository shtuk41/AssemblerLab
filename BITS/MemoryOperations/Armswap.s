Data: .word 0x123, 0x124, 0x125
.global _start
_start:
    ldr r0, =Data
    ldr r1, =0
    ldr r2, =2
    bl swap
    1: b 1b    // Done

swap:
// Swap two array elements
    lsl r1, r1, #2
    lsl r2, r2, #2
    add r1, r0, r1
    add r2, r0, r2
    
    ldr r3, [r2]
    ldr r0, [r1]
    str r3, [r1]
    str r0, [r2]
    
    bx lr
	
	