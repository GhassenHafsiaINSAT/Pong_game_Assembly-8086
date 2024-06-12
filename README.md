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
- **STACK**(second occurrence): Indicates this semgent is used for stack.

```assembly
STACK ENDS
```
- **STACK ENDS:** Marks the end of the stack segment. 
