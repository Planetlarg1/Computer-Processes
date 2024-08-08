// XOR.asm
// Performs a bitwise XOR between two values in RAM[3] and RAM[4], storing the result in RAM[5]
// XOR(a,b)=(a AND NOT(b)) OR (NOT(a) AND b)

// Load values from RAM[3] and RAM[4]
@3
D = M          // D = RAM[3]
@R13
M = D          // Store RAM[3] in R13 (temporary register)

@4
D = M          // D = RAM[4]
@R14
M = D          // Store RAM[4] in R14 (temporary register)

// Perform XOR operation
// Compute (RAM[3] AND NOT(RAM[4]))
@R14
D = !M         // D = !RAM[4]
@R13
D = D & M      // D = RAM[3] & !RAM[4]

// Store intermediate result in R15
@R15
M = D          // R15 = RAM[3] & !RAM[4]

// Compute (NOT(RAM[3]) AND RAM[4])
@R13
D = !M         // D = !RAM[3]
@R14
D = D & M      // D = !RAM[3] & RAM[4]

// Combine intermediate results to get XOR result
@R15
D = D | M      // D = (RAM[3] & !RAM[4]) | (!RAM[3] & RAM[4])

// Store the result in RAM[5]
@5
M = D          // RAM[5] = XOR result

// End program
(END)
@END
0;JMP