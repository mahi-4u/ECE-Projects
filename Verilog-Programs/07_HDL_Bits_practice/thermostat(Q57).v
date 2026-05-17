//Author:mahesh
//here you can find two versions that helps you to solve the problem
/*Concept:
--------
mode = 1 -> Heating mode
mode = 0 -> Cooling mode

Heating mode:
    if too_cold = 1 -> heater = 1

Cooling mode:
    if too_hot = 1 -> aircon = 1

Fan turns ON when:
    - heater is ON, or
    - aircon is ON, or
    - fan_on = 1
*/


// ============================================================================
// Version 1: Simple logic expressions (recommended)
// ============================================================================

module top_module(
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
);

    assign heater = mode & too_cold;
    assign aircon = ~mode & too_hot;
    assign fan    = heater | aircon | fan_on;

endmodule


/*
===============================================================================
Version 2: Using ternary operator

Syntax:
    condition ? true_value : false_value;

Your solution:
    assign heater = mode ? (too_cold ? 1'b1 : 1'b0) : 1'b0;
    assign aircon = mode ? 1'b0 : (too_hot ? 1'b1 : 1'b0);
    assign fan    = (heater == 1'b1) |
                    (aircon == 1'b1) |
                    (fan_on ? 1'b1 : 1'b0);

Both versions are functionally the same.
===============================================================================
*/
