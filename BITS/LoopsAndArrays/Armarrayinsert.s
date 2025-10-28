.data 
// Leave some space for the expanded array
Array: .word 1, 2, 3, 4, 0xff, 0xff

.text
.global _start
_start:
    ldr r0, =Array
    ldr r1, =4
    ldr r2, =2
    ldr r3, =123
    bl array_insert
    1: b 1b    // Done

array_insert:
	push {r4,r5}


insert:
	ldr r4, [r0, r2, lsl #2]
    str r3, [r0, r2, lsl #2]
    mov r3, r4
    add r2, r2, #1
    cmp r2, r1
    bgt done
    b insert

done:
	pop {r5, r4}
    bx lr
