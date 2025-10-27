.global _start
_start:
    mov r0, #10
    bl abs
    1: b 1b    // Done

.global abs
abs:
	tst r0, #(1<<31)
    bne reverse
    bx lr
    
reverse:    
	mvn r0, r0
    add r0, r0, #1
    bx lr
	
	