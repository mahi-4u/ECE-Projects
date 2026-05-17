//Author:mahesh
//this one is similar to the previous Q59,the change is extending it to 100 bits
/*
===============================================================================
HDLBits: Gates and Vectors (100-bit version)
===============================================================================

Problem:
--------
Given a 100-bit input vector:

    in[99:0]

Generate three outputs that compare each bit with its neighbour.

------------------------------------------------------------------------------
1. out_both[98:0]
------------------------------------------------------------------------------
Each bit is 1 when both the bit and its left neighbour are 1.

    out_both[0]  = in[0]  & in[1]
    out_both[1]  = in[1]  & in[2]
    ...
    out_both[98] = in[98] & in[99]

------------------------------------------------------------------------------
2. out_any[99:1]
------------------------------------------------------------------------------
Each bit is 1 when either the bit or its right neighbour is 1.

    out_any[1]  = in[1]  | in[0]
    out_any[2]  = in[2]  | in[1]
    ...
    out_any[99] = in[99] | in[98]

------------------------------------------------------------------------------
3. out_different[99:0]
------------------------------------------------------------------------------
Each bit is 1 when the bit is different from its left neighbour.

Wrap-around is used for bit 99:
    Left neighbour of in[99] is in[0].

    out_different[0]  = in[0]  ^ in[1]
    out_different[1]  = in[1]  ^ in[2]
    ...
    out_different[98] = in[98] ^ in[99]
    out_different[99] = in[99] ^ in[0]

===============================================================================
Version 1: Vector Operations (Recommended)
===============================================================================
*/

module top_module(
    input  [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different
);

    // Compare each bit with its left neighbour using AND.
    assign out_both = in[98:0] & in[99:1];

    // Compare each bit with its right neighbour using OR.
    assign out_any = in[99:1] | in[98:0];

    // Compare each bit with its left neighbour using XOR.
    // For in[99], the left neighbour is in[0].
    assign out_different = in ^ {in[0], in[99:1]};

endmodule


/*

===============================================================================
Summary
===============================================================================

Recommended solution:
    assign out_both      = in[98:0] & in[99:1];
    assign out_any       = in[99:1] | in[98:0];
    assign out_different = in ^ {in[0], in[99:1]};

Concepts used:
    - Vector slicing
    - Bitwise AND, OR, XOR
    - Concatenation
    - Wrap-around comparison
This is exactly the same idea as the 4-bit version, only extended to 100 bits.
===============================================================================
*/
