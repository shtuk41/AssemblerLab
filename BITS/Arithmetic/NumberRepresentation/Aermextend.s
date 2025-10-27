// A test case to test your function with
.global _start
_start:
    ldr r0, =2       // 2 = sign extend 8->32
    ldr r1, =0xf0    // The number to extend
    bl extend
    b _start        // End of testing code

// A function to extend. Only this part will be tested.
extend:
	cmp r0, #0
    beq zeroextend8
    cmp r0, #1
    beq zeroextend16
    cmp r0, #2
    beq signextend8
    b signextend16
    
    
    
    
zeroextend8: //0
	and r0, r1, #0x000000ff
    b done

zeroextend16: //1
	ldr r0, =0x0000ffff
    and r0, r0, r1
	b done
    
signextend8: //2
	tst r1, #0x80
	bne ex8
	b zeroextend8

ex8:
	ldr r0, =0xffffff00
    orr r0, r0, r1
	b done

signextend16: //3
	ldr r0, =0x8000
	tst r1, r0
	bne ex16
	b zeroextend16
    
ex16:
	ldr r0, =0xffff0000
    orr r0, r0, r1
	b done

done:
	bx lr