STACK SEGMENT PARA STACK 
	DB 64 DUP (' ') ; DB stands for define byte, we fill the stack with 64 spaces .  
STACK ENDS ; S is for the SEGMENT

DATA SEGMENT PARA 'DATA'

	WINDOW_WIDTH DW 140h
	WINDOW_Height DW 0C8h
	WINDOW_Bounce DW 6 ; variable to check the collision early 
	TIME_AUX DB 0 ; variable used when checking of the time has changed
	
	BALL_ORIGINAL_X DW 6Eh
	BALL_ORIGINAL_Y DW 64h
	BALL_X DW 0A0h ; X position of the ball, DW stands for define word 16 bits
	BALL_Y DW 04h ; Y position of the ball 
	BALL_SIZE DW 04h ; size of the ball 4 pixels in this example
	BALL_Velocity_X DW 05h
	BALL_Velocity_Y DW 02h
	
	PADDLE_LEFT_X DW 0Ah
	PADDLE_LEFT_Y DW 0Ah
	
	PADDLE_WIDTH DW 05h
	PADDLE_HEIGHT DW 1Fh
	
	PADDLE_RIGHT_X DW 130h
	PADDLE_RIGHT_Y DW 0Ah

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
		
		CALL CLEAR_SCREEN
		CHECK_TIME:
			
			MOV AH,2Ch ; get the system time 
			INT 21h    ; return: CH=hour, CL=minute, DH=second, DL=1/100 seconds 
			CMP DL,TIME_AUX 
			JE CHECK_TIME
			
			MOV TIME_AUX,DL
			
			CALL CLEAR_SCREEN
			CALL MOVE_BALL
			CALL DRAW_BALL
			CALL DRAW_PADDLES
			JMP CHECK_TIME
			
		RET ; RET is the return, the exit of the procedure.  
	MAIN ENDP ; P is for procedure.  
	
	DRAW_BALL PROC NEAR ; near is to say it belongs to the same code segment so the main procedure can call it.  
		MOV CX,BALL_X ; Set the initial column (X).
		MOV DX,BALL_Y ; set the initial line (Y).
		
		DRAW_BALL_HORIZENTAL: 
			MOV AH,0Ch ; set the configuration to writing a pixel.
			MOV AL,0Fh ; Choose white as color.
			MOV BH,00h ; choose the page number.
			INT 10h ; execute the configuration.
			
			INC CX	; CX = CX + 1, advance to the next column  
			MOV AX,CX  
			SUB AX,BALL_X
			CMP AX,BALL_SIZE
			JNG DRAW_BALL_HORIZENTAL
			
			MOV CX,BALL_X
			INC DX ; advance to the next line.  
			
			MOV AX,DX 
			SUB AX,BALL_Y
			CMP AX,BALL_SIZE
			JNG DRAW_BALL_HORIZENTAL 	
		RET
	DRAW_BALL ENDP
	
	CLEAR_SCREEN PROC NEAR
		MOV AH,00h ; Set the configuration to video mode.  
		MOV AL,13h ; Choose the video mode.    
		INT 10h ; Execute the configuration.

		MOV AH,0Bh ; Set the configuration 
		MOV BH,00h ; to the background color.
		MOV BL,00h ; set black as background color.
		INT 10h ; Execute the configuration.  
		RET
	CLEAR_SCREEN ENDP
	
	MOVE_BALL PROC NEAR
		
		MOV AX,BALL_Velocity_X
		ADD BALL_X,AX			; move the ball vetically
		
		MOV AX,WINDOW_Bounce
		CMP BALL_X,AX
		JL RESET_POSITION
		
		MOV AX,WINDOW_WIDTH
		SUB AX,BALL_SIZE	
		SUB AX,WINDOW_Bounce	
		CMP BALL_X,AX
		JG RESET_POSITION
		
		
		
		MOV AX,BALL_Velocity_Y 
		ADD BALL_Y,AX			; move the ball vetically
		
		MOV AX,WINDOW_Bounce
		CMP BALL_Y,AX
		JL NEG_VELOCITY_Y
		
		MOV AX,WINDOW_Height
		SUB AX,BALL_SIZE	
		SUB AX,WINDOW_Bounce	
		CMP BALL_Y,AX
		JG NEG_VELOCITY_Y
		
		RET
		
		RESET_POSITION: 
			CALL RESET_BALL_POSITION
			RET
		NEG_VELOCITY_Y: 
			NEG BALL_Velocity_Y
			RET	
	MOVE_BALL ENDP
	
	RESET_BALL_POSITION PROC NEAR
		MOV AX,BALL_ORIGINAL_X
		MOV BALL_X,AX
		
		MOV AX,BALL_ORIGINAL_Y
		MOV BALL_Y,AX
		RET	
	RESET_BALL_POSITION ENDP 
	
	DRAW_PADDLES PROC NEAR 
		MOV CX,PADDLE_LEFT_X
		MOV DX,PADDLE_LEFT_Y
		
		DRAW_PADDLE_LEFT_HORIZENTAL: 
			MOV AH,0Ch ; set the configuration to writing a pixel.
			MOV AL,0Fh ; Choose white as color.
			MOV BH,00h ; choose the page number.
			INT 10h ; execute the configuration.
			
			INC CX	; CX = CX + 1, advance to the next column  
			MOV AX,CX  
			SUB AX,PADDLE_LEFT_X
			CMP AX,PADDLE_WIDTH
			JNG DRAW_PADDLE_LEFT_HORIZENTAL	
			
			MOV CX,PADDLE_LEFT_X
			INC DX ; advance to the next line.  
			
			MOV AX,DX 
			SUB AX,PADDLE_LEFT_Y
			CMP AX,PADDLE_HEIGHT
			JNG DRAW_PADDLE_LEFT_HORIZENTAL 	
			
		MOV CX,PADDLE_RIGHT_X
		MOV DX,PADDLE_RIGHT_Y
		
		DRAW_PADDLE_RIGHT_HORIZENTAL: 
			MOV AH,0Ch ; set the configuration to writing a pixel.
			MOV AL,0Fh ; Choose white as color.
			MOV BH,00h ; choose the page number.
			INT 10h ; execute the configuration.
			
			INC CX	; CX = CX + 1, advance to the next column  
			MOV AX,CX  
			SUB AX,PADDLE_RIGHT_X
			CMP AX,PADDLE_WIDTH
			JNG DRAW_PADDLE_RIGHT_HORIZENTAL	
			
			MOV CX,PADDLE_RIGHT_X
			INC DX ; advance to the next line.  
			
			MOV AX,DX 
			SUB AX,PADDLE_RIGHT_Y
			CMP AX,PADDLE_HEIGHT
			JNG DRAW_PADDLE_RIGHT_HORIZENTAL			
			
		RET
	DRAW_PADDLES ENDP
	
	
CODE ENDS 
END