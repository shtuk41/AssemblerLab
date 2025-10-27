.global _start
_start:
    mov r0, #1
    bl odd
    1: b 1b    // Done

.global odd
odd:
	tst r0, #1
    bne oddf
    mov r0, #0
	bx lr
    
oddf:
	mov r0, #1
    bx lr
    
	
	