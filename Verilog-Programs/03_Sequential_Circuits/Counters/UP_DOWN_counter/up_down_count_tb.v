//Author:mahesh
module up_down_count_tb();
reg clk, clr, mode, load;
reg [3:0] din;
wire [3:0] q;

up_down_count uut(clk, clr, mode, load, din, q);

always #5 clk = ~clk;

initial
begin
$monitor("time=%0t | clk=%0b | q=%0b",$time,clk,q);
    clk = 0; clr = 1; load = 0; mode = 1; din = 4'b0000;

    #10 clr = 0;

    // Load custom value
    #10 din = 4'b1010; load = 1;
    #10 load = 0;

    // Count Up
    #40 mode = 1;

    // Count Down
    #40 mode = 0;

    #50 $finish;
end
endmodule
