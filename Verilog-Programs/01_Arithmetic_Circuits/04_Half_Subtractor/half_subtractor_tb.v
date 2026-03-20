module half_subtb(
    );
    reg a,b;
    wire d,bout;
    half_sub uut(.a(a),.b(b),.d(d),.bout(bout));
    initial
    begin
    a=0;b=0;
    #100 a=0;b=1;
    #100 a=1;b=0;
    #100 a=1;b=1;
    end
endmodule
