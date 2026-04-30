//Author:mahesh
//here is my behavioural code for piso register
module piso_register(
    input clk, clr, load,
    input [3:0] din,
    output reg sout
);

reg [3:0] q;

always @(posedge clk or posedge clr)
begin
    if (clr)
    begin
        q <= 4'b0000;
        sout <= 0;
    end
    else if (load)
        q <= din;
    else
    begin
        sout <= q[0];
        q[0] <= q[1];
        q[1] <= q[2];
        q[2] <= q[3];
        q[3] <= 0;
    end
end

endmodule
