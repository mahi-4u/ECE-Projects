//Author:mahesh
//here is my code for the 2 junctioned traffic controller using input signal based on 
//people present at country side road.without delays

module Traffic_light(input x,clk,rst,
output reg[1:0]hwy,cntry
);
parameter a=3'd0,b=3'd1,c=3'd2,d=3'd3,e=3'd4;
reg[2:0]ps,ns;
parameter g=2'd0,y=2'd1,r=2'd2;
  always@(posedge clk or posedge rst)
begin
if(rst)
ps<=a;
else
ps<=ns;
end
always@(ps)
begin
hwy=g;
cntry=r;
case(ps)
b:hwy=y;
c:hwy=r;
d:begin
    hwy=r;
    cntry=g;end
e:begin
hwy=r;
cntry=y;
end
default:begin
hwy=g;
cntry=r;
end
endcase
end
always@(ps or x)
case(ps)
a:ns=x?b:a;
b: ns=c;
c: ns=d;
d:ns=x?d:e;
e: ns=a;
default:ns=a;
endcase
 endmodule
