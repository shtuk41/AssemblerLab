// Some testing code
// You may uncomment these during testing, but comment them out before submitting
// odd: bx lr
// even: bx lr

.global _start
_start:
	ldr r0, =1    // First function parameter is always passed through r0.
	bl oddeven
	1: b 1b    // Done

oddeven:
	// Because there are nested function calls, lr needs to be saved and restored.
	push {lr}

	// Your code here
    tst r0, #1
    beq call_even
    
call_odd:
	bl odd
	b end_if

call_even:
	bl even
    b end_if
    
end_if:    

// Restore lr and return. (This can be shortened to pop {pc} )
	pop {lr}
	bx lr
	
	