/*
===============================================================================
HDLBits: Single-Digit BCD Adder (4-Bit BCD Adder)
===============================================================================

Concept:
--------
A BCD (Binary-Coded Decimal) digit uses 4 bits to represent
decimal numbers from 0 to 9.

Valid BCD values:
    0000 -> 0
    0001 -> 1
    ...
    1001 -> 9

Invalid BCD values:
    1010 -> 10
    ...
    1111 -> 15

A BCD adder:
------------
1. Adds two BCD digits and carry-in.
2. Checks if result is greater than 9.
3. If result > 9:
       Add correction value 6 (0110).
4. Produces:
       - valid BCD sum
       - carry output

===============================================================================
Version 1: Behavioral BCD Adder (Without assign)
===============================================================================
*/

module bcd_fadd(
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output reg       cout,
    output reg [3:0] sum
);

    // Temporary variable stores 5-bit result
    reg [4:0] temp;

    always @(*) begin

        // Step 1:
        // Normal binary addition
        temp = a + b + cin;

        // Step 2:
        // BCD correction
        if (temp > 5'd9) begin

            // Add 6 for valid BCD correction
            temp = temp + 5'd6;

            // Generate carry
            cout = 1'b1;
        end
        else begin

            // No carry needed
            cout = 1'b0;
        end

        // Final BCD sum
        sum = temp[3:0];

    end

endmodule


/*
===============================================================================
Example 1
===============================================================================

Input:
    a   = 4
    b   = 3
    cin = 0

Binary addition:
    4 + 3 = 7

Result:
    sum  = 0111
    cout = 0

No correction needed.

===============================================================================
Example 2
===============================================================================

Input:
    a   = 9
    b   = 1
    cin = 0

Binary addition:
    1001 + 0001 = 1010 (decimal 10)

But 1010 is NOT a valid BCD digit.

So add correction:
    1010 + 0110 = 1_0000

Final:
    sum  = 0000
    cout = 1

Correct BCD representation of decimal 10.

===============================================================================
Version 2: Same BCD Adder Using assign Statements
===============================================================================

module bcd_fadd(
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output       cout,
    output [3:0] sum
);

    wire [4:0] temp;
    wire [4:0] corrected;

    // Normal addition
    assign temp = a + b + cin;

    // Check for invalid BCD result
    assign corrected = (temp > 9) ? (temp + 6) : temp;

    // Outputs
    assign sum  = corrected[3:0];
    assign cout = corrected[4];

endmodule

Key idea:
    BCD addition is NOT the same as normal binary addition.

===============================================================================
*/
