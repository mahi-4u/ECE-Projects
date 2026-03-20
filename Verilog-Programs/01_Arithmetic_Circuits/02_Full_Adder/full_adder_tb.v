module fulladd_tb(
    );
    reg a,b,cin;
    wire s,cout;
    fulladd uut(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
    initial
    begin
    a=0;b=0;cin=0;
    #100 a=0;b=1;cin=0;
    #100 a=1;b=0;cin=0;
    #100 a=1;b=0;cin=0;
    #100 a=1;b=1;cin=0;
    $display("a=%b,b=%b,cin=%b,s=%b,cout=%b",a,b,cin,s,cout);
    end
endmodule
