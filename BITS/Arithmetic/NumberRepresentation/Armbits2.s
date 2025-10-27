// A test case to test your function with
.global _start
_start:
    ldr r0, =0xfffffff1
    bl bits
    b _start        // End of testing code

// Return minimum number of bits to represent first parameter
bits:
	tst r0, #0x80000000
	beq positive

	mvn r0, r0
   
positive:
	clz r1, r0
    rsb r0, r1, #32
    add r0, r0, #1
    bx lr    

	