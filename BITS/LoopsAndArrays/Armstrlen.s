.data
MyString: .string "Hello World"

.text
.global _start
_start:
    ldr r0, =MyString
    bl strlen
    1: b 1b

.global strlen
strlen:
	mov r1, #0
	
count:    
    ldrb r2, [r0, r1]
    cmp r2, #0x00
    beq done
    add r1, #1
    b count
    
done:
	mov r0, r1
    bx lr
    
    
	