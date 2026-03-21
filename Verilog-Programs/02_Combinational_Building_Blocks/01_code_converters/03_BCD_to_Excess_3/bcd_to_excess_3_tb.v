module BCD_XS_tb(
    );
reg [3:0]B;
wire [3:0]E;
BCD_to_XS uut(B,E);
initial
begin
B=4'b0000;
#100 B=4'b0001;
#100 B=4'b0010;
#100 B=4'b0100;
#100 B=4'b1000;
#100 B=4'b1010;
#100 B=4'b1111;
end
endmodule
