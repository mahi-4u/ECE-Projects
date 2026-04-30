//Author:mahesh
//here is acode for only upcounting
module up_count(
    input clk, clr,
    output reg [3:0] q
);

always @(posedge clk or posedge clr)
begin
    if (clr)
        q <= 4'b0000;
    else
        q <= q + 1;
end
endmodule
