//Author:mahesh
/*
===============================================================================
HDLBits: 256-to-1 Multiplexer
===============================================================================

Problem:
--------
Select one bit from a 256-bit input vector.

Inputs:
    in[255:0]  - 256 input bits
    sel[7:0]   - Select signal

Output:
    out        - Selected bit

How It Works:
-------------
- sel is used as an index.
- out = in[sel]

Examples:
---------
sel = 8'd0     -> out = in[0]
sel = 8'd5     -> out = in[5]
sel = 8'd100   -> out = in[100]
sel = 8'd255   -> out = in[255]

Why 8 Bits for sel?
-------------------
2^8 = 256, so an 8-bit select signal can choose any one of 256 bits.

===============================================================================
Version 1: Recommended Solution
===============================================================================
*/

module top_module(
    input  [255:0] in,
    input  [7:0] sel,
    output out
);

    // Select the bit at position sel.
    assign out = in[sel];

endmodule


/*
===============================================================================
Version 2: Equivalent case statement
===============================================================================

module top_module(
    input [255:0] in,
    input [7:0] sel,
    output reg out
);

    always @(*) begin
        case (sel)
            8'd0   : out = in[0];
            8'd1   : out = in[1];
            ...
            8'd255 : out = in[255];
        endcase
    end

endmodule

===============================================================================
Summary
===============================================================================

Recommended:
    assign out = in[sel];

Key Concept:
    Verilog allows a vector to be indexed by another signal.

This is the cleanest and shortest implementation.
===============================================================================
*/
