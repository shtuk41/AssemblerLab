.global _start
_start:
    mov r0, #4
    bl fib
    1: b 1b

.global fib
fib:
	mov r1, #1
   	mov r2, #1
	
    mov r3, #1
    cmp r0, #0
	beq done
    
    mov r3, #1
    cmp r0, #1
    beq done
    
    mov r3, #1
    cmp r0, #2
	beq done
    
    subs r0, #1

recurse:
	adds r3, r2, r1
    
    bcs overflow 
    
    mov r1, r2
    mov r2, r3
   
    subs r0, #1
    beq done
    b recurse

    
done:
	mov r0, r3
	bx lr	
    
overflow:
	mov r0, #0
    bx lr
	