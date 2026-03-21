//Author:mahesh
//you can find three models of code
module BCD_to_XS(
input [3:0]B,
output [3:0]E
    );
/*GATE LEVEL MODELLING
wire Bn0,Bn1,Bn2,Bn3;
wire [9:1]t;
not (Bno,B[0]);
not (Bn1,B[1]);
not (Bn2,B[2]);
not (Bn3,B[3]);
and (t[1],B[2],B[1]);
and (t[2],B[2],B[0]);
and (t[4],Bn2,B[1]);
and (t[5],Bn2,B[0]);
and (t[7],B[2],Bn0,Bn1);
and (t[8],B[1],B[0]);
and (t[9],Bn0,Bn1);
buf (E[0],Bn0);
or (t[3],t[1],t[2]);
or (E[3],t[3],B[3]);
or (t[6],t[4],t[5]);
or (E[2],t[6],t[7]);
or (E[1],t[8],t[9]);*/

//dataflow
assign E[3]=B[3]|(B[2]&B[1])|(B[2]&B[0]);
assign E[2]=((~B[2])&B[1])|((~B[2])&B[0])|(B[2]&(~B[1])&(~B[0]));
assign E[1]=(B[1]&B[0])|((~B[1])&(~B[0]));
assign E[0]=~B[0];


/*Behavioural
always @(*)
begin
E[3]=B[3]|(B[2]&B[1])|(B[2]&B[0]);
E[2]=((~B[2])&B[1])|((~B[2])&B[0])|(B[2]&(~B[1])&(~B[0]));
E[1]=(B[1]&B[0])|((~B[1])&(~B[0]));
E[0]=~B[0];
end*/

endmodule
