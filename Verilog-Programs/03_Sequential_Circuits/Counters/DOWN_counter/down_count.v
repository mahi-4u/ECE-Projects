//Author:mahesh
//here is my code for only downcounting
module down_count(
    input clk, clr,
    output reg [3:0] q
);

always @(posedge clk or posedge clr)
begin
    if (clr)
        q <= 4'b1111;
    else
        q <= q - 1;
end
endmodule
