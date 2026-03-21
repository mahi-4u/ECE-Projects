//Author:mahesh
//you can find three models of code
module three_eight_decoder(
input a0,a1,a2,
output [7:0]D );
    //GATE LEVEL MODELLING
wire an0,an1,an2;
not (an0,a0);
not (an1,a1);
not (an2,a2);
and (D[0],an0,an1,an2);
and (D[1],an0,an1,a2);
and (D[2],an0,a1,an2);
and (D[3],an0,a1,a2);
and (D[4],a0,an1,an2);
and (D[5],a0,an1,a2);
and (D[6],a0,a1,an2);
and (D[7],a0,a1,a2);

/*DATAFLOW MODELLING
assign D[0]=(~a0)&(~a1)&(~a2);
assign D[1]=(~a0)&(~a1)&a2;
assign D[2]=(~a0)&a1&(~a2);
assign D[3]=(~a0)&a1&a2;
assign D[4]=a0&(~a1)&(~a2);
assign D[5]=a0&(~a1)&a2;
assign D[6]=a0&a1&(~a2);
assign D[7]=a0&a1&a2;*/
/*behavioural
always@(*)
begin
D[0]=(~a0)&(~a1)&(~a2);
D[1]=(~a0)&(~a1)&a2;
D[2]=(~a0)&a1&(~a2);
D[3]=(~a0)&a1&a2;
D[4]=a0&(~a1)&(~a2);
D[5]=a0&(~a1)&a2;
D[6]=a0&a1&(~a2);
D[7]=a0&a1&a2;
end*/
endmodule
