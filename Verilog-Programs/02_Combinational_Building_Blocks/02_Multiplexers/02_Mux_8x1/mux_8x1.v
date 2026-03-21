//Author:mahesh
//you can find three models of code here
module eight_one_mux(
input [7:0]i,
input [2:0]s,
output out
);
/*gatelevel
wire sn2,sn0,sn1,y0,y1,y2,y3,y4,y5,y6,y7;
not (sn0,s[0]);
not (sn1,s[1]);
not (sn2,s[2]);
and (y0,i[0],sn2,sn1,sn0);
and (y1,i[1],sn2,sn1,s[0]);
and (y2,i[2],sn2,s[1],sn0);
and (y3,i[3],sn2,s[1],s[0]);
and (y4,i[4],s[2],sn1,sn0);
and (y5,i[5],s[2],sn1,s[0]);
and (y6,i[6],s[2],s[1],sn0);
and (y7,i[7],s[2],s[1],s[0]);
or (out,y0,y1,y2,y3,y4,y5,y6,y7);*/

//DATAFLOW MODELLING
assign out=((~s[2])&(~s[1])&(~s[0])&i[0])|((~s[2])&(~s[1])&s[0]&i[1])|((~s[2])&s[1]&(~s[0])&i[2])|(~s[2]&s[1]&s[0]&i[3])|(s[2]&(~s[1])&(~s[0])&i[4])|(s[2]&(~s[1])&s[0]&i[5])|(s[2]&s[1]&(~s[0])&i[6])|(s[2]&s[1]&s[0]&i[7]);

/*BEHAVIOURAL
always @(*)
begin
case({s[2],s[1],s[0]})
3'd0:out=i[0];
3'd1:out=i[1];
3'd2:out=i[2];
3'd3:out=i[3];
3'd4:out=i[4];
3'd5:out=i[5];
3'd6:out=i[6];
3'd7:out=i[7];
endcase
end*/
endmodule
