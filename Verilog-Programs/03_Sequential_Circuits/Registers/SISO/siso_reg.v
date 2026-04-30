//Author:mahesh
//here is behavioral code for siso register
module siso_register(
    input clk, clr,
    input sin,
    output reg sout
);

reg [3:0] q;

always @(posedge clk or posedge clr)
begin
    if (clr)
        q<= 4'b0000;
    else
        begin
        q[3]<=sin;
        q[2]<=q[3];
        q[1]<=q[2];
        q[0]<=q[1];
        sout<=q[0];
        end
end
endmodule
