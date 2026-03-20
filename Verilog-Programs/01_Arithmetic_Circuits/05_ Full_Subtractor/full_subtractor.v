//Author:mahesh
//fullsub using all three models of code
module full_sub(
    input a,
    input b,
    input cin,
    output  d,
    output  bout
    );
    /*Data Flow Modeling
assign d=a^b^cin;
assign bout=(~a&b) | (~(a^b) & cin);*/
/*Behavioral Modeling
always @(*) 
begin
d= a^b^cin;
bout=(~a&b)| (~(a^b) & cin);
end*/
//Structural Modeling
wire t1, abar,t1bar, t2,t3;
xor x1(t1,a,b);
xor x2(d,t1,cin);
not n1(abar,a);
not n2(t1bar,t1);
and a1(t2,abar,b);
and a2(t3,t1bar,cin);
or o1(bout, t2,t3);
    
endmodule
