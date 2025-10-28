.data
A: .word B
B: .word C
C: .word 0
.text
.global _start
    ldr r0, =A
    bl listlen
1:  b 1b  // done

.global listlen
listlen:
	cmp r0, #0
    beq done0
    
    mov r2, r0
	mov r3, #1 //counter
    
next:
	ldr r1, [r2]
    cmp r1, #0
    beq done
    add r3, #1
   	mov r2, r1 
    b next
   
done0:
	mov r3, #0
    
done:
	mov r0, r3
	bx lr
	