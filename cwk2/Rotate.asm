// Rotate.asm
// Rotates the bits of a 16-bit number left a specified amount of times

@R3
D=M      // Load original number into D
@R4
D=D+A    // Add number of rotations to original number
@R4
D=D-A    // Subtract original number from total (for loop counter)
@R5
M=D      // Store number of rotations in RAM[5] for loop counter

(LOOP)
@R4
D=M      // Load loop counter into D
@END_LOOP
D;JEQ    // If D=0, exit loop
@R3
D=M      // Load RAM[3] into D
@R5
D=D<<1   // 1 bit left shift
@R5
M=D      // Store shifted number in RAM[5]
@R3
D=M      // Load RAM[3] into D
@32768   // Load 2^15 (MSB)
D=A
@R5
D=D&A    // Check if MSB is set
@END_LOOP
D;JNE    // If MSB is set, jump to END_LOOP
@1
D=A
@R5
M=D      // Set LSB to 1
(END_LOOP)
@R4
M=M-1    // Decrement loop counter
@LOOP
0;JMP    // Loop back to LOOP

(END)
@END
0;JMP    // Halt program