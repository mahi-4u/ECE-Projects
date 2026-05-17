//Author:mahesh
/*
Problem Statement:
------------------
When an incoming call arrives (ring = 1), the phone should do ONLY ONE action:

1. If vibrate_mode = 0  --> Turn ON the ringer.
2. If vibrate_mode = 1  --> Turn ON the vibration motor.

If ring = 0, both outputs must be 0.

Key Idea:
---------
- ringer = ring AND (NOT vibrate_mode)
- motor  = ring AND vibrate_mode

===============================================================================
VERSION 1: Simple Logic Expressions (Recommended)
===============================================================================
*/

module top_module(
    input  ring,
    input  vibrate_mode,
    output ringer,
    output motor
);

    // Ring only when there is a call and vibrate mode is OFF.
    assign ringer = ring & ~vibrate_mode;

    // Vibrate only when there is a call and vibrate mode is ON.
    assign motor  = ring & vibrate_mode;

endmodule


/*
===============================================================================
VERSION 2: Using Conditional (Ternary) Operator
===============================================================================
Your Solution:
--------------
assign ringer = ring ? (vibrate_mode ? 0 : 1) : 0;
assign motor  = ring ? (vibrate_mode ? 1 : 0) : 0;

This produces exactly the same result as Version 1.

===============================================================================
Alternative Module (Do not compile together with top_module above)
===============================================================================

module top_module(
    input  ring,
    input  vibrate_mode,
    output ringer,
    output motor
);

    assign ringer = ring ? (vibrate_mode ? 1'b0 : 1'b1) : 1'b0;
    assign motor  = ring ? (vibrate_mode ? 1'b1 : 1'b0) : 1'b0;

endmodule

===============================================================================
Conclusion:
-----------
Both versions are correct.

Version 1:
    assign ringer = ring & ~vibrate_mode;
    assign motor  = ring &  vibrate_mode;

Version 2:
    Uses nested ternary operators.

Version 1 is shorter and easier to read.
===============================================================================
*/
