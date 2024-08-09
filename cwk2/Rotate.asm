// Rotate.asm
// Rotates a 16-bit number stored in RAM[3] left by the number of positions in RAM[4]
// Result is stored in RAM[5]

@3
D=M        // D = RAM[3]
@5
M=D        // Copy original number to result
@4
D=M        // D = number of rotations
@COUNT
M=D        // COUNT = RAM[4]

(LOOP)
@COUNT     // Load the address of COUNT
D=M
@END       // If COUNT == 0, exit the loop
D;JEQ      

// Extract the MSB
@5
D=M        // D = RAM[5] (current result)
@32768     // Load 32768 (binary: 1000 0000 0000 0000)
D=D&A      // D = D AND 32768 (extract MSB)
@MSB       // Save the MSB in a temporary location
M=D        

// Shift each bit left manually
@5
D=M        // D = RAM[5] (current result)
@16384     // Load 16384 (binary: 0100 0000 0000 0000)
A=D&A      // 14 -> 15
D=D+A
@8192      // Load 8192 (binary: 0010 0000 0000 0000)
A=D&A      // 13 -> 14
D=D+A
@4096      // Load 4096 (binary: 0001 0000 0000 0000)
A=D&A      // 12 -> 13
D=D+A
@2048      // Load 2048 (binary: 0000 1000 0000 0000)
A=D&A      // 11 -> 12
D=D+A
@1024      // Load 1024 (binary: 0000 0100 0000 0000)
A=D&A      // 10 -> 11
D=D+A
@512       // Load 512 (binary: 0000 0010 0000 0000)
A=D&A      // 9 -> 10
D=D+A
@256       // Load 256 (binary: 0000 0001 0000 0000)
A=D&A      // 8 -> 9
D=D+A
@128       // Load 128 (binary: 0000 0000 1000 0000)
A=D&A      // 7 -> 8
D=D+A
@64        // Load 64 (binary: 0000 0000 0100 0000)
A=D&A      // 6 -> 7
D=D+A
@32        // Load 32 (binary: 0000 0000 0010 0000)
A=D&A      // 5 -> 6
D=D+A
@16        // Load 16 (binary: 0000 0000 0001 0000)
A=D&A      // 4 -> 5
D=D+A
@8         // Load 8 (binary: 0000 0000 0000 1000)
A=D&A      // 3 -> 4
D=D+A
@4         // Load 4 (binary: 0000 0000 0000 0100)
A=D&A      // 2 -> 3
D=D+A
@2         // Load 2 (binary: 0000 0000 0000 0010)
A=D&A      // 1 -> 2
D=D+A
@1         // Load 1 (binary: 0000 0000 0000 0001)
A=D&A      // 0 -> 1
D=D+A
@5         // Load the address of RAM[5]
M=D        // Store the shifted value back in RAM[5]

// Wrap MSB to LSB if needed
@MSb
D=M
@NO_WRAP   // If MSB is 0, skip wrapping
D;JEQ      
@5
M=M+1      // Add 1 to wrap MSB to LSB

(NO_WRAP)  
@COUNT     // Decrement the loop counter
M=M-1      // COUNT = COUNT - 1
@LOOP      // Repeat the loop
0;JMP      

(END)      // End of the program
@END
0;JMP      

(MSB)      // Temporary storage for MSB
@0
M=0

(COUNT)    // Counter for number of rotations
@0
M=0
