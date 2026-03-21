module two_four_decodertb(
    );
    reg a0,a1;
    wire [3:0]D;
two_four_decoder uut(a0,a1,D);
initial
begin
a0=0;a1=0;
#100 a0=1;a1=0;
#100 a0=0;a1=1;
#100 a0=1;a1=1;
end
endmodule
