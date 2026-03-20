//Author:mahesh
//2 bit multiplier using Behavioural modelling
module multipliers(
input [1:0]a,b,
output  [3:0]product);
wire t1, t2, t3,t4;
and a1(product[0],a[0],b[0]);
and a2(t1,a[1],b[0]);
and a3(t2,a[0],b[1]);
and a4(t3,a[1],b[1]);
ha ha0(t1,t2,product[1],t4);
ha hal(t3,t4,product[2],product[3]);
endmodule
//Added Source File
module ha(a,b,s,co);
input a,b;
output s,co;
xor x1(s,a,b);
and a1(co,a,b);
/*always @(*) begin
product = a*b;
end*/

//2-bit multiplier using dataflow modelling
//assign product =a*b;
endmodule

