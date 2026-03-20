module full_halfadd_tb(

    );
    reg a,b,cin;
    wire sum,cout;
    full_half_add uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
    initial
    begin
    a=0;b=0;cin=0;
    #100 a=0;b=1;cin=0;
    #100 a=1;b=0;cin=0;
    #100 a=1;b=0;cin=0;
    #100 a=1;b=1;cin=0;
    $display("a=%b,b=%b,cin=%b,sum=%b,,cout=%b",a,b,cin,sum,cout);
    end

endmodule
