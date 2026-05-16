//Author:mahesh
module top_module(
    input  [399:0] a, b,
    input          cin,
    output         cout,
    output [399:0] sum
);

    // carry[0]   = input carry
    // carry[1]   = carry from digit 0
    // ...
    // carry[100] = final carry out
    wire [100:0] carry;

    // Connect external carry-in to the first BCD adder
    assign carry[0] = cin;

    // Final carry-out from the last BCD adder
    assign cout = carry[100];

    // Create 100 BCD adders.
    // Each BCD adder adds one decimal digit (4 bits).
    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : bcd_adder_instances
            bcd_fadd digit_adder (
                .a   (a[4*i+3 : 4*i]),   // Select digit i from input a
                .b   (b[4*i+3 : 4*i]),   // Select digit i from input b
                .cin (carry[i]),         // Carry from previous digit
                .cout(carry[i+1]),       // Carry to next digit
                .sum (sum[4*i+3 : 4*i])  // Sum of digit i
            );
        end
    endgenerate

endmodule


/*

======================== BCD ADDER NOTES ========================

1. What is BCD?
   - BCD = Binary Coded Decimal.
   - Each decimal digit (0 to 9) is stored using 4 bits.

   Decimal : BCD
       0   : 0000
       1   : 0001
       2   : 0010
       ...
       9   : 1001

2. What is bcd_fadd?
   - A provided module that adds:
       * One 4-bit BCD digit a
       * One 4-bit BCD digit b
       * Carry-in cin
   - Produces:
       * 4-bit BCD sum
       * Carry-out cout

3. Example:
      5 + 7 = 12

      a    = 0101 (5)
      b    = 0111 (7)
      cin  = 0

      sum  = 0010 (2)
      cout = 1

   Result represents decimal 12.

4. Why 400-bit inputs?
   - Each decimal digit uses 4 bits.
   - 100 digits × 4 bits = 400 bits.

5. Digit positions:
   - a[3:0]       = digit 0 (least significant digit)
   - a[7:4]       = digit 1
   - a[11:8]      = digit 2
   - ...
   - a[399:396]   = digit 99

6. Carry chain:
   - carry[0] = external cin
   - carry[1] = carry from digit 0
   - ...
   - carry[100] = final carry-out

=================================================================


====================== GENERATE BLOCK NOTES ======================

1. Purpose:
   - Used to create multiple copies of the same hardware.

2. In this problem:
   - We need 100 copies of bcd_fadd.

3. Syntax:

   genvar i;
   generate
       for (i = 0; i < N; i = i + 1) begin : block_name
           // module instantiation
       end
   endgenerate

4. Important points:
   - generate is a compile-time loop used to replicate hardware.
   - genvar is used only in generate loops.
   - genvar exists only during compilation.
   - genvar is not hardware.

5. Compiler creates:
   - bcd_adder_instances[0].digit_adder
   - bcd_adder_instances[1].digit_adder
   - ...
   - bcd_adder_instances[99].digit_adder

6. Each generated block is one separate BCD adder.

=================================================================

*/
