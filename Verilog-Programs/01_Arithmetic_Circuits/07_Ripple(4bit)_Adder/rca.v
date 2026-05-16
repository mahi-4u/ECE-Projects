//Author:mahesh
//here is my code for 4 bit ripple carry adder in three  models of code
module full_rca1(
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output [3:0] s,
    output       cout
);
assign {cout,s}=a+b+cin;//dataflow
/*behavioural
always@(*)
begin
{cout,s}=a+b+cin;
end*/
/*gatelevel
    wire [2:0] c;

    fadd fa0(.su(s[0]), .co(c[0]), .a(a[0]), .b(b[0]), .cin(cin));
    fadd fa1(.su(s[1]), .co(c[1]), .a(a[1]), .b(b[1]), .cin(c[0]));
    fadd fa2(.su(s[2]), .co(c[2]), .a(a[2]), .b(b[2]), .cin(c[1]));
    fadd fa3(.su(s[3]), .co(cout), .a(a[3]), .b(b[3]), .cin(c[2]));

endmodule*/

/*
module fadd(
    output su,
    output co,
    input  a,
    input  b,
    input  cin
);
    assign su = a ^ b ^ cin;
    assign co = (a & b) | (cin & (a | b));

endmodule
*/
endmodule
