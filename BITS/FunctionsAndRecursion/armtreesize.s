.data
A: .word B, C
B: .word 0, 0
C: .word 0, 0

.text
.global _start

_start:
    ldr r0, =A
    bl size
    1: b 1b

.global size
size:
	mov r1, #1
	mov r2, #1
    push {r0}
    
    b next
    
left:
	cmp r3, #0
	beq right
	add r2, r2, #1
    push {r3}
    add r1, r1, #1
    
right:    
    ldr r3, [r0, #4]
	cmp r3, #0
    beq next 
    add r2, r2, #1
    push {r3}
    add r1, r1, #1

next:
	cmp r1, #0
	beq done
	
    sub r1, r1, #1
	pop {r0}
	ldr r3, [r0]
    b left
    
done:
    mov r0, r2
	bx lr
    


	