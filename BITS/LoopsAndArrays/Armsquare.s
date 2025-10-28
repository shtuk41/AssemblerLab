.data
Img: .skip 640*480*2
.text

.global _start
_start:
    ldr r0, =Img    // Image
    ldr r1, =1    // left
    ldr r2, =0    // top
    ldr r3, =3    // size
    bl square
    1: b 1b    // Done

square:
	 push {r4,r5,r6}
	 
     add r1, r1, r1
     add r1, r1, r0
     mov r4, #1280
     mul r2, r2, r4
     add r1, r1, r2
     mov r4, #0xffff
     mov r5, #0
     
start_line: 
	 cmp r5, r3
     bge done
	 mov r2, #0      

     
drawline:
	add r6, r2, r2
	strh r4, [r1, r6]
    add r2, r2, #1
    cmp r2, r3
	blt drawline
	add r5, #1
    add r1, r1, #1280
    b start_line
   
done:
	pop {r4,r5,r6}
	bx lr
