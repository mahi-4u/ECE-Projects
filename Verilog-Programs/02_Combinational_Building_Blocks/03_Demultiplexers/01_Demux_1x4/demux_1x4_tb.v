module one_four_demuxtb(
    );
reg i,s1,s0;
wire [3:0]y;
one_four_demux uut(y,i,s1,s0);
initial
begin
i=1;
s1=0;s0=0;
#50 s1=0;s0=1;
#50 s1=1;s0=0;
#50 s1=1;s0=1;
end
endmodule
