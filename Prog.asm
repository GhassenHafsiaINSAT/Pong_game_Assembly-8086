STACK SEGMENT PARA STACK 
	DB 64 DUP (' ') ; DB stands for define byte, we fill the stack with 64 spaces .  
STACK ENDS ; S is for the SEGMENT

DATA SEGMENT PARA 'DATA'
	BALL_X DW 0Ah ; X position of the ball, DW stands for define word 16 bits
	BALL_Y DW 0Ah ; Y position of the ball 
DATA ENDS 

CODE SEGMENT PARA 'CODE' 
	MAIN PROC FAR ; FAR means that the call is far, it crosses segment boundaries.
	ASSUME CS:CODE,DS:DATA,SS:STACK ; assume as code, data and stack segments the respective registers.  
	PUSH DS 						; push the DS segment to the stack
	SUB AX,AX						; clean the AX register	
	PUSH AX							; push the AX register to the stack 
	MOV AX,DATA						; save on the AX register the content of the DATA segment 
	MOV DS,AX 						; save the DS segment the content of AX register   
	POP AX							; release the top item of the stack to the AX register  
		
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
		MOV CX,BALL_X ; Set the column (X).
		MOV DX,BALL_Y ; set the line (Y).
		INT 10h ; execute the configuration.  
		
		RET ; RET is the return, the exit of the procedure.  
	MAIN ENDP ; P is for procedure.  
	
CODE ENDS 
END