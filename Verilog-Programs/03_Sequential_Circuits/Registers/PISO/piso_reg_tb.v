//Author:mahesh
module piso_tb();

reg clk, clr, load;
reg [3:0] din;
wire sout;

piso_register uut(clk, clr, load, din, sout);

always #5 clk = ~clk;

initial begin
$monitor("time=%0t| clk=%0b | pin =%0b | sout=%0b",$time,clk,din,sout);
    clk = 0; clr = 1; load = 0;
    #10 clr = 0;

    din = 4'b1011;
    load = 1;
    #10 load = 0;
end

endmodule
