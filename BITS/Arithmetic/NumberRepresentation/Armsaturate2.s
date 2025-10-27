// A test case to test your function with
.global _start
_start:
    ldr r0, =0xffff0003    // First parameter is always in r0
    bl saturate
    b _start        // End of testing code

saturate:
    cmp r0, #127
    bgt pos_sat
    cmp r0, #-128
    blt neg_sat
    ldr r1, =0x000000ff
    and r0,r0,r1
    bx lr

pos_sat:
    mov r0, #0x0000007F
    bx lr

neg_sat:
    mov r0, #0x00000080
    bx lr