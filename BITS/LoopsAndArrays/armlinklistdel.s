.data
A: .word B
D: .word 0
C: .word D
B: .word C
.text
.global _start
_start:
    ldr r0, =A
    bl listdel
    1: b 1b   // done

.global listdel
listdel:
	cmp r0, #0
    beq ret0

    ldr r2, [r0]

	cmp r2, #0
    beq ret0
    
	ldr r3, [r2]
    str r3, [r0]
    
    mov r0, r2
	bx lr    
   
ret0:
	mov r0, #0
    bx lr
    
	