//Author:mahesh
module siso_tb();

reg clk, clr, sin;
wire sout;

siso_register uut(clk, clr, sin, sout);

always #5 clk = ~clk;

initial begin
    clk = 0; clr = 1; sin = 0;
    #10 clr = 0;

    #10 sin = 1;
    #10 sin = 0;
    #10 sin = 1;
    #10 sin = 1;
end

endmodule
