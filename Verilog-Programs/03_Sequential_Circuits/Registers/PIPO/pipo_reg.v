//Author:mahesh
//here is my behavioural code for the pipo register
module pipo_register(
    input clk, clr,
    input [3:0] din,
    output reg [3:0] q
);

always @(posedge clk or posedge clr)
begin
    if (clr)
        q <= 4'b0000;
    else
        q <= din;
end

endmodule
