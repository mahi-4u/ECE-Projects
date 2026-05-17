/* Author:mahesh
here i uploaded all possible versions of code that works well according to the theme
===============================================================================
HDLBits: Popcount3
===============================================================================

Problem:
--------
Count the number of 1's in a 3-bit input vector.

Input:
    in[2:0]

Output:
    out[1:0] = Number of 1's in the input

Examples:
---------
in = 000 -> out = 0
in = 001 -> out = 1
in = 010 -> out = 1
in = 011 -> out = 2
in = 100 -> out = 1
in = 101 -> out = 2
in = 110 -> out = 2
in = 111 -> out = 3

===============================================================================
Version 1: Using Addition Operator (Shortest and Recommended)
===============================================================================
*/

module top_module(
    input  [2:0] in,
    output [1:0] out
);

    // Each bit is either 0 or 1.
    // Adding all bits gives the population count.
    assign out = in[0] + in[1] + in[2];

endmodule


/*
===============================================================================
Version 2: Using always block with for loop
===============================================================================

module top_module(
    input [2:0] in,
    output reg [1:0] out
);

    integer i;

    always @(*) begin
        out = 2'b00;

        for (i = 0; i < 3; i = i + 1) begin
            if (in[i])
                out = out + 1'b1;
        end
    end

endmodule
*/


/*
===============================================================================
Version 3: Using case statement (Truth Table)
===============================================================================

module top_module(
    input [2:0] in,
    output reg [1:0] out
);

    always @(*) begin
        case (in)
            3'b000: out = 2'd0;
            3'b001: out = 2'd1;
            3'b010: out = 2'd1;
            3'b011: out = 2'd2;
            3'b100: out = 2'd1;
            3'b101: out = 2'd2;
            3'b110: out = 2'd2;
            3'b111: out = 2'd3;
        endcase
    end

endmodule
*/


/*
===============================================================================
Version 4: Using Boolean Expressions
===============================================================================

module top_module(
    input [2:0] in,
    output [1:0] out
);

    // out[0] = 1 when number of 1's is odd
    assign out[0] = in[0] ^ in[1] ^ in[2];

    // out[1] = 1 when at least two inputs are 1
    assign out[1] = (in[0] & in[1]) |
                    (in[0] & in[2]) |
                    (in[1] & in[2]);

endmodule
*/


/*
===============================================================================
Summary
===============================================================================

1. Addition:
       assign out = in[0] + in[1] + in[2];

2. always + for loop:
       Count bits one by one.

3. case statement:
       Use the complete truth table.

4. Boolean expressions:
       Implement logic equations directly.

All versions are correct and produce the same output.
===============================================================================
*/
