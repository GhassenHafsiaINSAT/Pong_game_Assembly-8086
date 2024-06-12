STACK SEGMENT PARA STACK 
	DB 64 DUP (' ') ; DB stands for define byte, we fill the stack with 64 spaces .  
STACK ENDS ; S is for the SEGMENT

DATA SEGMENT PARA 'DATA'
DATA ENDS 

CODE SEGMENT PARA 'CODE' 
	MAIN PROC FAR ; FAR means that the call is far, it crosses segment boundaries.
	
		MOV AH,00h ; Set the configuration to video mode.  
		MOV AL,13h ; Choose the video mode.    
		INT 10h ; Execute the configuration.

		MOV AH,0Bh ; Set the configuration 
		MOV BH,00h ; to the background color.
		MOV BL,00h ; set black as background color.
		INT 10h ; Execute the configuration.

		MOV AH,0Ch ; set the configuration to writing a pixel.
		MOV AL,0Fh ; Choose white as color.
		MOV BH,00h ; choose the page number.
		MOV CX,0Ah ; Set the column (X).
		MOV DX,0Ah ; set the line (Y).
		INT 10h ; execute the configuration.  
		
		RET ; RET is the return, the exit of the procedure.  
	MAIN ENDP ; P is for procedure.  
	
CODE ENDS 
END