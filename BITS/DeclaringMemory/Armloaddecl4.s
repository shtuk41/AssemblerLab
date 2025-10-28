// Declare something
.data
Data:       .word Ptr1
			.byte 0
            .byte 0
            .byte 0
Ptr1: 		.byte 0
		    .word Ptr2
            .byte 0
			.byte 0
Ptr2: 		.byte 0
			.byte 0
            .word Data
            
			
			

      

.text
.global _start
_start:
	ldr r2, =Data
	ldr r3, [r2]
	ldr r4, [r3, #1]
	ldr r5, [r4, #2]
    1: b 1b    // Done
	
	