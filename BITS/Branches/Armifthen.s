// You may uncomment these during testing
// add_a: ret
// add_b: ret
// add_c: ret
// add_d: ret
// add_e: ret
// done: ret

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
    
test_b:    
    tst r0, #2
    bne b
    b test_c

b:    
  	bl add_b  
    
test_c:
    tst r0, #4
    bne c
    b test_d
c: 
	bl add_c
    
test_d:    
    tst r0, #8
    bne d
    b test_e
d:
	bl add_d

test_e:
    tst r0, #16
    bne e
    b call_done
e:
	bl add_e
    
call_done:    
    bl done
    
    

	// ARM: Return by popping lr directly into pc
	pop {pc}
	
	