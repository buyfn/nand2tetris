// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(RESET)
	@SCREEN
	D=A
	@p
	M=D
	@color
(LOOP)
	@p
	D=M
	@24576
	D=D-A
	@RESET
	D;JGT
	@p
	A=M
	@KBD
	D=M
	@WHITE
	D;JEQ
(BLACK)
	@color
	M=-1
	@FILL
	0;JMP
(WHITE)
	@color
	M=0
(FILL)
	@color
	D=M
	@p
	A=M
	M=D
	@p
	M=M+1
	@LOOP
	0;JMP
