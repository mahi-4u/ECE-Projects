//Author:mahesh
module full_half_add(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );
    wire x,y,z;
    half ha1(.s(x),.c(y),.a(a),.b(b));
    half ha2(.s(sum),.c(z),.a(x),.b(cin));
    or (cout,y,z);
endmodule
module half(output s,output c,input a,input b);
assign s=a^b;
assign c=a&b;
endmodule
