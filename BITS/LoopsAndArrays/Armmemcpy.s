.data
.word 0x9999
Dest: .word 0, 0, 0, 0, 0xaaaa
Src: .word 1, 2, 3, 4, 0xbbbb

.text
.global _start
_start:
    ldr r0, =Dest
    ldr r1, =Src
    ldr r2, =16
    bl memcpy
    1: b 1b    // Done

.global memcpy
memcpy:
	push {r4}

	cmp r2, #0
    beq done
    
    mov r3, #0
    
copy:
	ldrb r4, [r1, r3]
    strb r4, [r0, r3]
    add r3, r3, #1
    cmp r3, r2
    blt copy
    
done:
	pop {r4}
	bx lr
    
	