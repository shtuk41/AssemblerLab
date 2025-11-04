// Some input data and testing code
.data
ProdList: 
.word 0x1000, 10
.word 0x1003, 11
.word 0x1002, 9
.word 0x1001, 11


.text
.global _start
_start:
	ldr r0, =ProdList
	ldr r1, =4
	bl sort
	
	1: b 1b  // done

// Your function starts here:
sort:
	push {r4, r5, r6, r7, r8}
	mov r2, #1	//r2 is i
    
while_less_r1:    
    cmp r2, r1
    bge done
    
    add r3, r0, r2, lsl #3  //r0 + (r2 << 3), r3 points to the pair at r2
    ldr r4, [r3, #4]  		//r3 is value at r2
    ldr r3, [r3]
    
    sub r7, r2, #1		      //r7 is j
    
check_j:
	cmp r7, #0
    blt insert_key_pair
    
check_key:
	add r5, r0, r7, lsl #3	//r5 points to the pair at r4
    ldr r6, [r5, #4]  //r7 is value at r4
    ldr r5, [r5]
    cmp r6, r4				
    blt insert_pair
    bne profit_not_equal
    cmp r3, r5 //if equal
    blo insert_pair
    
profit_not_equal:    
    b insert_key_pair
   
insert_pair:
	add r8, r7, #1
    add r8, r0, r8, lsl #3
    str r5, [r8]
    add r8, #4
    str r6, [r8]
    sub r7, #1
    b check_j
    
insert_key_pair:
	add r8, r7, #1
    add r8, r0, r8, lsl #3
    str r3, [r8]
    add r8, #4
    str r4, [r8]
    add r2, r2, #1
    b while_less_r1

done:
	pop {r4, r5, r6, r7,r8}
	bx lr
