module Bi_Grey_tb();
reg [3:0] B;
wire [3:0]G;
Bi_Grey_convert uut(.B(B),.G(G));
initial
begin
B=4'b0000;
#100 B=4'b1001;
#100 B=4'b1010;
end 
endmodule
