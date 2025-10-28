// Insert declarations here
.data
.align 2

Node21:
	.word 0
    .word 0
	.word 21

Node20:
	.word 0
    .word 0
	.word 20 

Node11:
	.word Node20
    .word Node21
	.word 11 

Node10:
	.word 0
    .word 0
	.word 10 
    
Root:
	.word Node10
    .word Node11
	.word 0 
    

    

    
   
	
	