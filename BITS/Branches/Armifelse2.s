// Some testing code
// You may uncomment these during testing
// add_a: bx lr
// add_b: bx lr
// add_c: bx lr
// add_d: bx lr
// add_e: bx lr
// done: bx lr

.global _start
_start:
	ldr r0, =5    // First function parameter is always passed through r0.
	bl build
	1: b 1b    // Done

build:
	// Because there are nested function calls, lr needs to be saved and restored.
	push {lr}

	// Your code here
    tst r0, #1
    bne a
    b test_b
    
a:
	bl add_a
    b call_done
    
test_b:    
    tst r0, #2
    bne b
    b test_c

b:    
  	bl add_b 
    b call_done
    
test_c:
    tst r0, #4
    bne c
    b test_d
c: 
	bl add_c
    b call_done
    
test_d:    
    tst r0, #8
    bne d
    b test_e
d:
	bl add_d
    b call_done

test_e:
    tst r0, #16
    bne e
    b call_done
e:
	bl add_e
    
call_done:    
    bl done
    

	// Restore lr and return.
	pop {pc}
	
	