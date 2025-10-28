.data
.byte 0    // Strings aren't word-aligned
MyString: .string "Hello World"

.text
.global _start
_start:
    ldr r0, =MyString
    bl strtolower
    1: b 1b

.global strtolower
strtolower:
	mov r1, #0
    
change:
	ldrb r2, [r0, r1]
    cmp r2, #0x00
    beq done
    
    cmp r2, #0x41
    blt next
   
   	cmp r2, #0x5a
    bgt next
    
    add r2, r2, #0x20
    strb r2, [r0, r1]

	
next:
	add r1, r1, #1
    b change
    
done:
	bx lr
	
	