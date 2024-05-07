// XOR.asm
// Performs a bitwise XOR between two values in RAM[3] and RAM[4], storing the result in RAM[5]

@R3
D=M      // Load RAM[3] into D
@R4
A=M
D=D^A    // XOR with RAM[4]
@R5
M=D      // Store result in RAM[5]

(END)
@END
0;JMP    // Halt program