# Assembly-8086
## Defining Segments in Assembly Language: Code, Data and Stack 

- **In Assembly language, memory is divided into segments**.
  
- **Segment** is a block of memory used to store related types of information.
  
- **Commun Segments** include: 
	- **Code Segment** : It holds the executable intructions of a program.
    
	- **Data Segment** : It is used to define and initialize variables.
   
	- **Stack Segment** : It Manages program stack (function calls and local variables).  
 
```assembly
STACK SEGMENT PARA STACK
```

- **STACK** (first occurrence): The name of the segment.
  
- **PARA:** Specifies that this segment should be aligned on a paragraph boundary.
- **STACK** (second occurrence): Indicates this semgent is used for stack.

```assembly
STACK ENDS
```
- **STACK ENDS:** Marks the end of the stack segment.


## Setting the Background

- We will use `INT 10h` interruption.
  
- We can set the **configuration of video mode**, by choosing the `AL` register's content.
- For our project, I used 320*200 256 color graphics (MCGA,VGA) configuration  
```assembly
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
```
![image](https://github.com/GhassenHafsiaINSAT/Assembly-8086/assets/110825502/c4206e09-e6f2-413c-9455-4fa3e1285b60)
