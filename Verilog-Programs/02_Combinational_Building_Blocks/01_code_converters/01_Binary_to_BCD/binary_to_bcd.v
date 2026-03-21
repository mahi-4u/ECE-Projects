//Author:mahesh
//you can find three models of code
module Bi_to_BCD(
output reg [4:0]R,
input [3:0]B
    );
/*GATE LEVEL MODELLING
wire w,x,y,z,a,c,d,e,f,g,h,k,l,m;
not(w,B[0]);
not(x,B[1]);
not(y,B[2]);
not(z,B[3]);
and(a,B[1],z);
and(c,B[3],B[2],x);
and(d,z,B[2]);
and(e,B[2],B[1]);
and(f,B[3],y,x);
and(g,B[3],B[2]);
and(h,B[3],B[1]);
or(k,a,c);
or(l,d,e);
or(m,g,h);
buf(R[0],B[0]);
buf(R[1],k);
buf(R[2],l);
buf(R[3],f);
buf(R[4],m);*/

/*dataflow
wire w,x,y,z;
assign w=~B[0];
assign x=~B[1];
assign y=~B[2];
assign z=~B[3];
assign R[0]=B[0];
assign R[1]=(z&B[1])|(B[3]&B[2]&x);
assign R[2]=(z&B[2])|(B[2]&B[1]);
assign R[3]=(B[3]&y&x);
assign R[4]=(B[3]&B[2])|(B[3]&B[1]);*/

//Behavioural
always @(*)
begin
R[0]=B[0];
R[1]=(((~B[3])&B[1])|(B[3]&B[2]&(~B[1])));
R[2]=((~B[3])&B[2])|(B[2]&B[1]);
R[3]=(B[3]&(~B[2])&(~B[1]));
R[4]=(B[3]&B[2])|(B[3]&B[1]);
end
endmodule
