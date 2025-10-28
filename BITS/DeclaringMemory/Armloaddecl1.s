// Declare something
.data
.align 2
Data: 
.word 0x00000000
.word 0x1234
.align 0
.hword 0x5678
.byte 0x00
.byte 0x90

.text
.global _start
_start:
    ldr r0, =Data
    ldr r1, [r0, #4]
    ldrh r2, [r0, #8]
    ldrb r3, [r0, #11]
    1: b 1b    // Done
	
	