STACK SEGMENT PARA STACK 
	DB 64 DUP (' ') ; DB stands for define byte, we fill the stack with 64 spaces .  
STACK ENDS ; S is for the SEGMENT

DATA SEGMENT PARA 'DATA'
DATA ENDS 

CODE SEGMENT PARA 'CODE' 
	MAIN PROC FAR 
	
		MOV DL,'A'
		MOV AH,6h
		INT 21h ; interruption by calling the 21 service.  
		
		RET ; RET is the return, the exit of the procedure.  
	MAIN ENDP ; P is for procedure.  
	
CODE ENDS 
END