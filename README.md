# PONG Game in Assembly
## Overview
- This Project is a simple implementation of the classic Pong game.  

- It is designe to help you learn and practice several key concepts in low-level programming and graphics.  
- This code was inspired by **Programming Dimensions**'s tutorials.  
## Key Learning Points 
- **Graphic Modes**: Setting video modes for graphical output.
  
- **Drawing Objects**: Drawing pixels and shapes on the screen using assmebly language.
- **Managing Time**: Using system time for game loops and event timing.
- **Collision detection**: Implementing bounding boxes for collision detection between game objects.
- **Displaying text**: Outputting text on the screen.
- **ASCII Conversion**: Converting numerical values to ASCII characters for display.
- **Detecting key presses**: Implementing keyboard input handling for player controls.    
## Setting up you environment 
1. **Install DOSBox**
   
2. **Install an 8086 Assembler**
3. **Install Notepad++**

## How to Run the Game 
1. **Open DOSBox.**

2. **Mount the directory containing you project files**
```assembly
mount c path_to_your_project_directory
```
3. **Change the mounted directory**
```assembly
C:
```
4. **Assemble the source code using the assembler** 
```assembly
masm Prog.asm 
```
5. **Link the Object file to create an executable**
```assembly
link Prog
```
6. **Run the executable**
```assembly
Prog
```

## Game Controls 
- **Player 1**
  
    - Move Up: 'z'
    - Move Down: 's'
- **Player 2**
    - Move Up: 'o'
    - Move Down: 'l'
## Code Structure 
- **Data Segment**: Defines all the variables and constants used in the game.
  
- **Code Segment**: Contains all the procedures for game logic, including initializing the game, drawing the screen, moving objects, detecting collisions and handling user input.  

## Technical details
### AABB Collision Detection

- **Axis-Aligned Bounding Box (AABB) collision detection** is a fundamental concept in game development, particularly for simple 2D games like **Pong**.
  
- An **AABB** is a rectangular box aligned with the coordinate axes, and **checking for collisions** involves determining if a **point** (representing, for example, a corner of another object) **lies within this box**.

### AABB Collision Detection Formula

- To determine if a point $\(P\)$ with coordinates $\((P_x, P_y)\)$ is inside an AABB defined by its minimum coordinates $\( (B_{\text{minX}}, B_{\text{minY}}) \)$ and maximum coordinates $\( (B_{\text{maxX}}, B_{\text{maxY}}) \)$, use the following formula:

$$
f(P, B) = (P_x \geq B_{\text{minX}} \land P_x \leq B_{\text{maxX}}) \land (P_y \geq B_{\text{minY}} \land P_y \leq B_{\text{maxY}}))
$$
