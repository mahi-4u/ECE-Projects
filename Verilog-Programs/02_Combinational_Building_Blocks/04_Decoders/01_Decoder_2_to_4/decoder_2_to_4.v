//Author:mahesh
//you can find three models of code here
module two_four_decoder(
input a0,a1,
output [3:0]D);
/*GATE LEVEL MODELLING
wire an0,an1;
not (an0,a0);
not (an1,a1);
and (D[0],an0,an1);
and (D[1],an0,a1);
and (D[2],a0,an1);
and (D[3],a0,a1);*/

//DATAFLOW MODELLING
assign D[0]=(~a0)&(~a1);
assign D[1]=(~a0)&a1;
assign D[2]=a0&(~a1);
assign D[3]=a0&a1;

/*Behavioural MODELLING
always@(*)
begin
D[0]=(~a0)&(~a1);
D[1]=(~a0)&a1;
D[2]=a0&(~a1);
D[3]=a0&a1;
end*/
   
endmodule
