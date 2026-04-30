//Author:mahesh
module up_count_tb();
reg clk, clr;
wire [3:0] q;

up_count uut(clk, clr, q);

always #5 clk = ~clk;

initial
begin
  $monitor("time=%0t | clk=%0b | q=%0b",$time,clk,q);
    clk = 0; clr = 1;
    #10 clr = 0;

    #100 $finish;
end
endmodule
