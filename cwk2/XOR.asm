// XOR.asm
// Performs a bitwise XOR between two values in RAM[3] and RAM[4], storing the result in RAM[5]

@3
D=M      // Load RAM[3] into D
@4
A=M
D=D^M    // XOR with RAM[4]
@5
M=D      // Store result in RAM[5]

(END)
@END
0;JMP    // Halt program