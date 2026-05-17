//Author:mahesh
/*
===============================================================================
HDLBits: Gates and Vectors
===============================================================================

Problem:
--------
Given a 4-bit input vector:

    in[3:0]

Generate three outputs that compare each bit with its neighbour.

----------------------------------------------------------------------------
1. out_both[2:0]
----------------------------------------------------------------------------
Each bit is 1 when both the bit and its left neighbour are 1.

    out_both[0] = in[0] & in[1]
    out_both[1] = in[1] & in[2]
    out_both[2] = in[2] & in[3]

----------------------------------------------------------------------------
2. out_any[3:1]
----------------------------------------------------------------------------
Each bit is 1 when either the bit or its right neighbour is 1.

    out_any[1] = in[1] | in[0]
    out_any[2] = in[2] | in[1]
    out_any[3] = in[3] | in[2]

----------------------------------------------------------------------------
3. out_different[3:0]
----------------------------------------------------------------------------
Each bit is 1 when the bit is different from its left neighbour.

Wrap-around is used for bit 3:
    Left neighbour of in[3] is in[0].

    out_different[0] = in[0] ^ in[1]
    out_different[1] = in[1] ^ in[2]
    out_different[2] = in[2] ^ in[3]
    out_different[3] = in[3] ^ in[0]

===============================================================================
Version 1: Vector Operations (Recommended)
===============================================================================
*/

module top_module(
    input  [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different
);

    // Compare each bit with its left neighbour using AND.
    assign out_both = in[2:0] & in[3:1];

    // Compare each bit with its right neighbour using OR.
    assign out_any = in[3:1] | in[2:0];

    // Compare each bit with its left neighbour using XOR.
    // For in[3], the left neighbour is in[0].
    assign out_different = in ^ {in[0], in[3:1]};

endmodule


/*

===============================================================================
Version 2: Explicit Bit-by-Bit Assignments
===============================================================================

module top_module(
    input  [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different
);

    assign out_both[0] = in[0] & in[1];
    assign out_both[1] = in[1] & in[2];
    assign out_both[2] = in[2] & in[3];

    assign out_any[1] = in[1] | in[0];
    assign out_any[2] = in[2] | in[1];
    assign out_any[3] = in[3] | in[2];

    assign out_different[0] = in[0] ^ in[1];
    assign out_different[1] = in[1] ^ in[2];
    assign out_different[2] = in[2] ^ in[3];
    assign out_different[3] = in[3] ^ in[0];

endmodule
===============================================================================
Summary
===============================================================================

Recommended solution:
    assign out_both      = in[2:0] & in[3:1];
    assign out_any       = in[3:1] | in[2:0];
    assign out_different = in ^ {in[0], in[3:1]};

Concepts used:
    - Vector slicing
    - Bitwise AND, OR, XOR
    - Concatenation
    - Wrap-around comparison

===============================================================================
*/
