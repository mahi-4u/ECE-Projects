//AUthor:mahesh
//you can find three models of code
module four_two_encoder(
input a,b,c,d,
output x,y
    );
    //GATE LEVEL MODELLING
or(x,c,d);
or(y,b,d);

/*DATAFLOW MODELLING);
assign x=c|d;
assign y=b|d;*/

/*Behavioural
always @(*)
begin
case({a,b,c,d})
4'b1000:begin x=0;y=0; end
4'b0100:begin x=0;y=1; end
4'b0010:begin x=1;y=0; end
4'b0001:begin x=1;y=1; end
endcase
end*/
endmodule
