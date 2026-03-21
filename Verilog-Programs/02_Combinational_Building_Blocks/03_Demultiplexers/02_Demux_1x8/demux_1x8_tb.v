module one_eight_demuxtb(
    );
  reg d,s0,s1,s2;
  wire [7:0]y;
one_eight_demux uut(d,s0,s1,s2,y);
initial
begin
d=1;s0=0;s1=0;s2=0;
#100 s0=0;s1=0;s2=1;
#100 s0=0;s1=1;s2=0;
#100 s0=0;s1=1;s2=1;
#100 s0=1;s1=0;s2=0;
#100 s0=1;s1=0;s2=1;
#100 s0=1;s1=1;s2=0;
#100 s0=1;s1=1;s2=1;

end
endmodule
