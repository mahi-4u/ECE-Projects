module Bi_BCD_tb(
    );
reg [3:0]B;
wire [4:0]R;
Bi_to_BCD uut(.B(B),.R(R));
initial
begin
B=4'b0000;
#20 B=4'b0010;
#20 B=4'b1100;
#20 B=4'b1101;
#20 B=4'b1110;
#20 B=4'b1111;
end

endmodule
