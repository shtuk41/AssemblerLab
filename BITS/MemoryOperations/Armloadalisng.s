.data
Pointer: .word 1234
.text
.global _start
_start:
    ldr r0, =Pointer
    bl load
    1: b 1b    // Done

.global load
load:
	ldrb r1,[r0]
    ldrb r2, [r0, #1]
    lsl r2, r2, #8
    orr r1, r1, r2
   
    ldrb r2, [r0, #2]
    lsl r2, r2, #16
    orr r1, r1, r2
    
    ldrb r2, [r0, #3]
    lsl r2, r2, #24
    orr r1, r1, r2
	    
	mov r0, r1
    
    bx lr
    

	
	
	