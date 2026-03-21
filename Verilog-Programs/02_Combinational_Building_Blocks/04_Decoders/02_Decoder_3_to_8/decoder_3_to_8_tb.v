module three_eight_decodertb();
reg a0,a1,a2;
wire [7:0]D;
three_eight_decoder uut(a0,a1,a2,D);
initial
begin
a0=0;a1=0;a2=0;
#100 a0=0;a1=0;a2=1;
#100 a0=0;a1=1;a2=0;
#100 a0=0;a1=1;a2=1;
#100 a0=1;a1=0;a2=0;
#100 a0=1;a1=0;a2=1;
#100 a0=1;a1=1;a2=0;
#100 a0=1;a1=1;a2=1;
end 
endmodule
