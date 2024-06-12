# Assembly-8086

## Historical Overview 
- The first released IBM personal computer **IBM pc**, used Intel 8088 processor, which is a variant of the **8086 architecture**.
  
- **DOS** or **MS-DOS** (Miscrosoft Disk Operating System), is the standard operating system for IBM PCs.
  
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
## Initialization and Segment Setup
```assembly
ASSUME CS:CODE, DS:DATA, SS:STACK
```
- This line specifies the segment registers that are assumed to point to different segments of memory, so the memory accesses is correctly interpreted and the segments override in the program.
 

## Most commonly used Interrupts in DOS programming 
1. **INT 21h** (DOS Services):
   
	- It includes file operations (opening, reading, writing, ...), input/output, process control.
3. **INT 10h** (Video Services):
	- It controles video display output, including video modes, changing cursor position and setting screen colors.
4. **INT 16h** (Keyboard services):
	- It handles keyboard input, detecting key status (pressed/released) and controlling keyboard LEDs.
5. **INT 13h** (Disk services):
   - It allows access to disk drives for reading, writing and controlling disk operations. 
6. **INT 14h** (Real-Time Clock Services):
   - It allows access to real-time clock and performing time-related operations such as reading system time and date.
     
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
## Jumps  
```assembly
JMP target_label 
```
- Jump to a specified label.

### Conditional Jumps 
```assembly 
CMP AX, BX
JE equal_label
```
- Jump to a specified label if a flag is raised after a comparaison process for example.
  
	- JE (Jump if Equal)
   	- JNE (Jump if Not Equal)
   	- JNLE (Jump if Not Less or Equal)
   	- JNGE (Jump if Not Greater or Equal)
   	- JNL (Jump if Not Less)
