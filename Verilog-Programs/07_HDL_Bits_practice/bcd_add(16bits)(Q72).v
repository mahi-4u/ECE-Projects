//Author:mahesh
/*
===============================================================================
HDLBits: 4-Digit BCD Ripple Carry Adder
===============================================================================

Problem:
--------
A module named "bcd_fadd" is already provided.

bcd_fadd adds:
    - two BCD digits
    - one carry input

and produces:
    - BCD sum
    - carry output

Module already given:

module bcd_fadd (
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output       cout,
    output [3:0] sum
);

Task:
-----
Instantiate 4 copies of bcd_fadd to build a 4-digit BCD ripple-carry adder.

Inputs:
    a[15:0]
    b[15:0]
    cin

Outputs:
    sum[15:0]
    cout

Each 4-bit group represents ONE decimal digit in BCD format.

===============================================================================
Version 1: Manual Instantiation Method
===============================================================================
*/

module top_module (
    input  [15:0] a,
    input  [15:0] b,
    input         cin,
    output        cout,
    output [15:0] sum
);

    // Internal carry signals
    wire c1, c2, c3;

    // BCD digit 0
    bcd_fadd fa0 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(c1),
        .sum(sum[3:0])
    );

    // BCD digit 1
    bcd_fadd fa1 (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(c1),
        .cout(c2),
        .sum(sum[7:4])
    );

    // BCD digit 2
    bcd_fadd fa2 (
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(c2),
        .cout(c3),
        .sum(sum[11:8])
    );

    // BCD digit 3
    bcd_fadd fa3 (
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(c3),
        .cout(cout),
        .sum(sum[15:12])
    );

endmodule


/*
===============================================================================
How This Works
===============================================================================

Each bcd_fadd adds ONE decimal digit.

Bit ranges:
------------
Digit 0 -> a[3:0]     and b[3:0]
Digit 1 -> a[7:4]     and b[7:4]
Digit 2 -> a[11:8]    and b[11:8]
Digit 3 -> a[15:12]   and b[15:12]

Carry Flow:
------------
cin -> fa0 -> c1 -> fa1 -> c2 -> fa2 -> c3 -> fa3 -> cout

This is called:
    Ripple Carry BCD Adder

===============================================================================
Version 2: Generate Loop Method
===============================================================================

module top_module (
    input  [15:0] a,
    input  [15:0] b,
    input         cin,
    output        cout,
    output [15:0] sum
);

    // Internal carry chain
    wire [4:0] carry;

    // Initial carry input
    assign carry[0] = cin;

    // Final carry output
    assign cout = carry[4];

    genvar i;

    generate
        for(i = 0; i < 4; i = i + 1) begin : adder

            bcd_fadd fa (
                .a(a[4*i+3 : 4*i]),
                .b(b[4*i+3 : 4*i]),
                .cin(carry[i]),
                .cout(carry[i+1]),
                .sum(sum[4*i+3 : 4*i])
            );

        end
    endgenerate

endmodule

===============================================================================
Generate Block Notes
===============================================================================

1. generate block:
   - Used to create multiple hardware instances automatically.
   - Useful for repetitive hardware structures.

2. genvar:
   - Special variable used only inside generate loops.
   - Exists only during compilation.
   - Not actual hardware.

3. In this example:
   - 4 copies of bcd_fadd are created automatically.

4. Generated instances:
   adder[0].fa
   adder[1].fa
   adder[2].fa
   adder[3].fa

5. Carry chain:
   carry[0] = cin
   carry[1] = carry from digit 0
   carry[2] = carry from digit 1
   carry[3] = carry from digit 2
   carry[4] = final cout

===============================================================================
Important Concept
===============================================================================

BCD addition is DIFFERENT from normal binary addition.

Example:
--------
BCD:
    9 + 1

Binary:
    1001 + 0001 = 1010

But:
    1010 = decimal 10

This is NOT a valid single BCD digit.

BCD digits must stay between:
    0000 to 1001
    (0 to 9)

So bcd_fadd internally performs correction logic.

Because of this, the following is NOT valid for BCD:

    assign {cout,sum} = a + b + cin;

That works only for normal binary adders.

===============================================================================
Summary
===============================================================================

Methods Learned:
----------------
1. Manual module instantiation
2. Generate loop instantiation

Concepts Used:
--------------
- BCD addition
- Ripple carry
- Module instantiation
- generate block
- genvar
- Carry propagation

===============================================================================
*/
