//Author:mahesh
//you can find three models of code
module eight_three_encoder(
input [0:7]i,
output a,b,c
    );
// GATE LEVEL MODELLING
or (a,i[4],i[5],i[6],i[7]);
or (b,i[2],i[3],i[6],i[7]);
or (c,i[1],i[3],i[5],i[7]);

/* DATAFLOW MODELLING
assign a=i[4]|i[5]|i[6]|i[7];
assign b=i[2]|i[3]|i[6]|i[7];
assign c=i[1]|i[3]|i[5]|i[7];
*/
/*BEHAVIOURAL MODELLING

always @(*)
begin
case({i})
8'b10000000:begin a=0;b=0;c=0; end
8'b01000000:begin a=0;b=0;c=1; end
8'b00100000:begin a=0;b=1;c=0; end
8'b00010000:begin a=0;b=1;c=1; end
8'b00001000:begin a=1;b=0;c=0; end
8'b00000100:begin a=1;b=0;c=1; end
8'b00000010:begin a=1;b=1;c=0; end
8'b00000001:begin a=1;b=1;c=1; end
endcase
end*/
endmodule
