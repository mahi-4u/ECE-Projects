module four_one_mux_tb();
reg [3:0]i;
reg [1:0]s;
wire out;
four_one_mux uut(i,s,out);
initial
begin
i[0]=1;i[1]=0;i[2]=0;i[3]=0;
s[1]=0;s[0]=0;
#100 s[1]=0;s[0]=1;
#100 s[1]=1;s[0]=0;
#100 s[1]=1;s[0]=1;
end
endmodule
