//Author:mahesh
//you can find three models of code
module Bi_Grey_convert(
output [3:0]G,
input [3:0]B
    );
/*GATE LEVEL MODELLING
buf(G[3],B[3]);
xor A(G[2],B[3],B[2]);
xor C(G[1],B[2],B[1]);
xor D(G[0],B[1],B[0]);*/

//DATAFLOW MODELLING
assign G[3]=B[3];
assign G[2]=B[3]^B[2];
assign G[1]=B[2]^B[1];
assign G[0]=B[1]^B[0];

 /*BEHAVIOURAL MODELLING

always @(*)
begin
G[3]=B[3];
G[2]=B[3]^B[2];
G[1]=B[2]^B[1];
G[0]=B[1]^B[0];
end
*/
endmodule
