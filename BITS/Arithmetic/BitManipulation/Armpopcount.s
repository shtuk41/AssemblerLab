// A test case to test your function with
.global _start
_start:
    mov r0, #5
    bl popcount
    1: b 1b    // Done

// Only your function (starting at popcount) is judged. The test code above is not executed.
popcount:
	mov r1, #0
    
process:    
	tst r0, #1
	bne increment
    b shift
       
done:   
	mov r0, r1
	bx lr

increment:    
	add r1, r1, #1
    
shift:
	lsrs r0, r0, #1
    beq done
    b process	

	