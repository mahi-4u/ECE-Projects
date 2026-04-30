//Author:mahesh
module pipo_tb();
reg clk,clr;
reg [3:0]din;
wire [3:0]q;
pipo_register uut(clk,clr,din,q);
always #5 clk=~clk;
initial
begin
$monitor("time=%0t| clk=%0b | pin =%0b | pout=%0b",$time,clk,din,q);
clk=0;clr=1;
#5 clr=0;
din=4'b0000;
#100 din=4'b1111;


end
endmodule
