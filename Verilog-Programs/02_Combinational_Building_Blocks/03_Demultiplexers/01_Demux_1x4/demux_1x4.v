//Author:mahesh
//you can find three models of code
module one_four_demux(
output [3:0]y,
input i,s1,s0);
/*gatelevel
wire sn1,sn0;
not (sn1,s1);
not (sn0,s0);
and (y[0],sn1,sn0,i);
and (y[1],sn1,s0,i);
and (y[2],s1,sn0,i);
and (y[3],s1,s0,i);
*/
//DATAFLOW MODELLING

assign y[0]=~s1&~s0&i;
assign y[1]=~s1&s0&i;
assign y[2]=s1&~s0&i;
assign y[3]=s1&s0&i;

/*BEHAVIOURAL MODELLING
always @(*)
begin
case({s1,s0})
2'd0:y[0]=i;
2'd1:y[1]=i;
2'd2:y[2]=i;
2'd3:y[3]=i;
endcase
end
*/
endmodule
