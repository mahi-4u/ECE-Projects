//Author:mahesh
//you can find three models of code here
module four_one_mux(
input [3:0]i,
input [1:0]s,
output out
);
/*gatelevel
wire sn0,sn1,y0,y1,y2,y3;
not (sn1,s[1]);
not (sn0,s[0]);
and (y0,i[0],sn1,sn0);
and (y1,i[1],sn1,s[0]);
and (y2,i[2],s[1],sn0);
and (y3,i[3],s[1],s[0]);
or (out,y0,y1,y2,y3);*/

// DATAFLOW MODELLING
assign out=((~s[1])&(~s[0])&i[0])|((~s[1])&s[0]&i[1])|(s[1]&(~s[0])&i[2])|(s[1]&s[0]&i[3]);

/*BEHAVIOURAL
always @(*)
begin
case({s[1],s[0]})
2'd0:out=i[0];
2'd1:out=i[1];
2'd2:out=i[2];
2'd3:out=i[3];
endcase
end*/
endmodule
