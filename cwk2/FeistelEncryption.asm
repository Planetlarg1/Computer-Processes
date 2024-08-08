// FeistelEncryption.asm
// Implements the 16-bit Feistel cipher with 4 rounds

// Load the initial key K0
@1
D=M
@R1
M=D          // Store K0 in R1

// Load the 16-bit plaintext
@2
D=M
@R2
M=D          // Store plaintext in R2

// Split plaintext into L0 and R0
@R2
D=M
@R3
M=D          // R0 = R3
@R2
D=D>>8
@R4
M=D          // L0 = R4

// Generate keys K1, K2, K3 from K0
// K1 = rotate K0 left by 1
@R1
D=M
D=D<<1
@256
D=D&A
@R5
M=D          // K1 = R5

// K2 = rotate K0 left by 2
@R1
D=M
D=D<<2
@256
D=D&A
@R6
M=D          // K2 = R6

// K3 = rotate K0 left by 3
@R1
D=M
D=D<<3
@256
D=D&A
@R7
M=D          // K3 = R7

// Feistel Round 1
// L1 = R0, R1 = L0 ⊕ F(R0, K0)
@R3
D=M
@R8
M=D          // L1 = R0 = R8

@R3
D=M
@R1
D=D^M
@R4
D=D^M
@R9
M=D          // R1 = L0 ⊕ F(R0, K0) = R9

// Feistel Round 2
// L2 = R1, R2 = L1 ⊕ F(R1, K1)
@R9
D=M
@R10
M=D          // L2 = R1 = R10

@R9
D=M
@R5
D=D^M
@R8
D=D^M
@R11
M=D          // R2 = L1 ⊕ F(R1, K1) = R11

// Feistel Round 3
// L3 = R2, R3 = L2 ⊕ F(R2, K2)
@R11
D=M
@R12
M=D          // L3 = R2 = R12

@R11
D=M
@R6
D=D^M
@R10
D=D^M
@R13
M=D          // R3 = L2 ⊕ F(R2, K2) = R13

// Feistel Round 4
// L4 = R3, R4 = L3 ⊕ F(R3, K3)
@R13
D=M
@R14
M=D          // L4 = R3 = R14

@R13
D=M
@R7
D=D^M
@R12
D=D^M
@R15
M=D          // R4 = L3 ⊕ F(R3, K3) = R15

// Combine L4 and R4 to form ciphertext
@R14
D=M
D=D<<8
@R15
D=D+M
@0
M=D          // Store ciphertext in RAM[0]

// End program
(END)
@END
0;JMP
