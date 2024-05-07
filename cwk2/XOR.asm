// XOR.asm
// Performs a bitwise XOR between two values in RAM[3] and RAM[4], storing the result in RAM[5]

@R3
D=M      // Load RAM[3] into D
@RAM[4]
D=D^M    // XOR with RAM[4]
@RAM[5]
M=D      // Store result in RAM[5]

(END)
@END
0;JMP    // Halt program