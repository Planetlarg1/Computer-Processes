// Rotate.asm
// Rotates the bits of a 16-bit number left a specified amount of times

// Initialize
@3
D = M          // D = RAM[3] (original number)
@13
M = D          // Store original number in R13

@4
D = M          // D = RAM[4] (number of rotations)
@14
M = D          // Store number of rotations in R14

(LOOP)
    // Check if number of rotations is 0
    @14
    D = M
    @END
    D;JEQ      // If number of rotations is 0, end the loop

    // Perform one bit rotation left
    @13
    D = M      // D = original number
    @32768
    D = D & A  // D = RAM[3] & 1000000000000000 (extract the MSB)
    @NO_MSB
    D;JEQ      // If MSB is 0, jump to NO_MSB

    // Shift left and set LSB to 1
    @13
    D = M      // D = original number
    D = D + D  // Perform left shift by 1
    D = D + 1  // Set the LSB to 1
    @STORE
    0;JMP

(NO_MSB)
    // Shift left without setting LSB to 1
    @13
    D = M      // D = original number
    D = D + D  // Perform left shift by 1

(STORE)
    @13
    M = D      // Store the result back in R13

(DECREMENT)
    // Decrement the number of rotations
    @14
    M = M - 1

    // Repeat the loop
    @LOOP
    0;JMP

(END)
    // Store the final result in RAM[5]
    @13
    D = M
    @5
    M = D

    // End program
    (HALT)
    @HALT
    0;JMP