//Author:mahesh
//you can find three models of code
module one_eight_demux(
input d,s0,s1,s2,
output [7:0]y);
//gatelevel
wire sn0,sn1,sn2;
not (sn0,s0);
not (sn1,s1);
not (sn2,s2);
and (y[0],sn0,sn1,sn2,d);
and (y[1],sn0,sn1,s2,d);
and (y[2],sn0,s1,sn2,d);
and (y[3],sn0,s1,s2,d);
and (y[4],s0,sn1,sn2,d);
and (y[5],s0,sn1,s2,d);
and (y[6],s0,s1,sn2,d);
and (y[7],s0,s1,s2,d);

/*DATAFLOW MODELLING

assign y[0]=(~s0)&(~s1)&(~s2)&d;
assign y[1]=(~s0)&(~s1)&s2&d;
assign y[2]=(~s0)&s1&(~s2)&d;
assign y[3]=(~s0)&s1&s2&d;
assign y[4]=s0&(~s1)&(~s2)&d;
assign y[5]=s0&(~s1)&s2&d;
assign y[6]=s0&s1&(~s2)&d;
assign y[7]=s0&s1&s2&d;*/

/*behavioural
always@(*)
begin
 y[0]=(~s0)&(~s1)&(~s2)&d;
 y[1]=(~s0)&(~s1)&s2&d;
 y[2]=(~s0)&s1&(~s2)&d;
 y[3]=(~s0)&s1&s2&d;
 y[4]=s0&(~s1)&(~s2)&d;
 y[5]=s0&(~s1)&s2&d;
 y[6]=s0&s1&(~s2)&d;
 y[7]=s0&s1&s2&d;
end*/

endmodule
