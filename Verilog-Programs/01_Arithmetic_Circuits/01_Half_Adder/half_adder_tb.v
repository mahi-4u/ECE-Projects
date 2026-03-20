module half_add_tb(
    );
    reg a,b;
    wire s,c;
    half_add uut(.a(a),.b(b),.s(s),.c(c));
    initial
    begin
    a=0;b=0;
    #100 a=0;b=1;
    #100 a=1;b=0;
    #100 a=1;b=1;
    $display("a=%b,b=%b,s=%b,c=%b",a,b,s,c);
    end
endmodule
