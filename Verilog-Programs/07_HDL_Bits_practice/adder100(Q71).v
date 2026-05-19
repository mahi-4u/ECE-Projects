//Author:mahesh
/*
===============================================================================
HDLBits: 100-Bit Binary Adder
===============================================================================

Problem:
--------
Add two 100-bit numbers and an input carry.

Inputs:
    a[99:0]
    b[99:0]
    cin

Outputs:
    sum[99:0]
    cout

The addition performed is:

    a + b + cin

Since adding two 100-bit numbers can produce a 101-bit result,
the result is split as:

    {cout, sum}

where:
    cout = Most significant bit (final carry-out)
    sum  = Lower 100 bits

===============================================================================
Version 1: Recommended Solution
===============================================================================
*/

module top_module(
    input  [99:0] a,
    input  [99:0] b,
    input         cin,
    output        cout,
    output [99:0] sum
);

    // Add two 100-bit numbers and carry-in.
    // The 101-bit result is split into:
    //   cout -> final carry
    //   sum  -> lower 100 bits
    assign {cout, sum} = a + b + cin;

endmodule


/*
===============================================================================
How It Works
===============================================================================

The expression:

    a + b + cin

produces a 101-bit result.

The concatenation:

    {cout, sum}

splits that result as:

    result[100]   -> cout
    result[99:0]  -> sum

Examples:
---------
1) 5 + 3 + 0 = 8
       cout = 0
       sum  = 8

===============================================================================
Summary
===============================================================================

Recommended solution:
    assign {cout, sum} = a + b + cin;

Concepts used:
    - Arithmetic addition
    - Concatenation
    - Automatic width extension

This is the cleanest and shortest solution for a wide binary adder.
===============================================================================
*/
