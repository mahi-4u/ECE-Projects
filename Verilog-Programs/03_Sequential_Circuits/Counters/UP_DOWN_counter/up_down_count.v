//Author:mahesh
//here is my code for both up and down counting
module up_down_count(
    input clk, clr,
    input mode,          // 1 = up, 0 = down
    input load,          // load enable
    input [3:0] din,     // data input
    output reg [3:0] q
);

always @(posedge clk or posedge clr)
begin
    if (clr)
        q <= 4'b0000;
    else if (load)
        q <= din;              // Load user value
    else if (mode)
        q <= q + 1;            // Count up
    else
        q <= q - 1;            // Count down
end
endmodule
