//Author:mahesh
/*
===============================================================================
HDLBits: 256-to-1 4-Bit Multiplexer
===============================================================================

Problem:
--------
You are given:
    in[1023:0]  -> 256 groups of 4 bits each
    sel[7:0]    -> Selects one group
    out[3:0]    -> Selected 4-bit output

Group Mapping:
--------------
sel = 0   -> out = in[3:0]
sel = 1   -> out = in[7:4]
sel = 2   -> out = in[11:8]
...
sel = 255 -> out = in[1023:1020]

===============================================================================
Version 1: Recommended Solution (Indexed Part Select)
===============================================================================
*/

module top_module(
    input  [1023:0] in,
    input  [7:0] sel,
    output [3:0] out
);

    // Start at bit sel*4 and select 4 bits.
    assign out = in[sel*4 +: 4];

endmodule


/*
===============================================================================
How It Works
===============================================================================

Syntax:
    vector[start +: width]

Meaning:
    - Start from bit position "start"
    - Select "width" bits upward

In this problem:
    start = sel * 4
    width = 4

Examples:
    sel = 0   -> in[0   +: 4] = in[3:0]
    sel = 1   -> in[4   +: 4] = in[7:4]
    sel = 2   -> in[8   +: 4] = in[11:8]
    sel = 255 -> in[1020+: 4] = in[1023:1020]

===============================================================================
Version 2: Using Concatenation
===============================================================================

module top_module(
    input  [1023:0] in,
    input  [7:0] sel,
    output [3:0] out
);

    assign out = {
        in[sel*4 + 3],
        in[sel*4 + 2],
        in[sel*4 + 1],
        in[sel*4 + 0]
    };

endmodule

===============================================================================
Version 3: Using -: Syntax
===============================================================================

module top_module(
    input  [1023:0] in,
    input  [7:0] sel,
    output [3:0] out
);

    assign out = in[sel*4 + 3 -: 4];

endmodule

===============================================================================
Summary
===============================================================================

Recommended:
    assign out = in[sel*4 +: 4];

Other equivalent forms:
    assign out = in[sel*4 + 3 -: 4];

    assign out = {
        in[sel*4+3],
        in[sel*4+2],
        in[sel*4+1],
        in[sel*4]
    };

All three versions are functionally identical.
===============================================================================
*/
