//Author:mahesh
module sipo_tb();

reg clk, clr, sin;
wire [3:0] q;

sipo_register uut(clk, clr, sin, q);

always #5 clk = ~clk;

initial begin
$monitor("time=%0t| clk=%0b | sin =%0b | pout=%0b",$time,clk,sin,q);
    clk = 0; clr = 1; sin = 0;
    #10 clr = 0;

    #10 sin = 1;
    #10 sin = 0;
    #10 sin = 1;
    #10 sin = 1;
end

endmodule
