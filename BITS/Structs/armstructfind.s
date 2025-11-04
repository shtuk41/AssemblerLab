// Some input data and testing code
.data
ProdList: 
.word 0x1000, 0x80000000
.word 0x1001, 11	// 11 is the maximum profit. Product_id=0x1001
.word 0x1002, 9

ProdInfo:
.word 0x1000, 0x200
.word 0x1001, 0x210	// Product_id 0x1001 has name 0x210. Return 0x210.
.word 0x1002, 0x220


.text
.global _start
_start:
	ldr r0, =ProdList
	ldr r1, =3
	ldr r2, =ProdInfo
	ldr r3, =3	
	bl find
	
	1: b 1b  // done

// Your function starts here:
find:
	push {r4, r5, r6,r7}
    
    mov r4, #0
    ldr r5, [r0]
	add r0, r0, #4
	ldr r6, [r0]
    
    add r4, r4, #1
    cmp r4, r1
    bge finish_look

look:
   	add r0, r0, #8
    ldr r7, [r0]
    cmp r7, r6 
    bgt update
inc_counter:
	add r4, r4, #1
    cmp r4, r1
    bge finish_look
	b look

update:
	sub r0, r0, #4
    ldr r5, [r0]
    mov r6, r7 
    add r0, r0, #4
    b inc_counter

finish_look:    
    mov r4, #0
    ldr r6, [r2]
    mov r7, #0

search:
    cmp r4, r3
    bge done
    
    cmp r5, r6 
    beq found
    
    add r2, #8
    ldr r6, [r2]
    
    add r4, #1
    b search

found:
	add r2, #4
    ldr r7, [r2]

done:
	mov r0, r7
	pop {r4, r5, r6, r7}
    bx lr
	