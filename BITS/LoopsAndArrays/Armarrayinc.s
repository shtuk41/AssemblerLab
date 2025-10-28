.data 
Array: .word 1, 2, 3, 4

.text
.global _start
_start:
    ldr r0, =Array
    mov r1, #4
    bl array_inc
    1: b 1b    // Done

.global array_inc
array_inc:
    cmp r1, #0
    beq done
	mov r2, #0
	ldr r3, [r0]
    add r3, #1
    str r3, [r0], #4

increment:
	add r2, #1
	cmp r2, r1
    beq done
    
    ldr r3, [r0]
    add r3, #1
    str r3, [r0], #4
    
    b increment
	
done:
	bx lr
    