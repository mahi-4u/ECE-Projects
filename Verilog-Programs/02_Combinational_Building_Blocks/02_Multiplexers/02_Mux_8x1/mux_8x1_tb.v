//Author:mahesh
//you can find three models of code here
module eight_one_muxtb(
    );
reg [7:0]i;
reg [2:0]s;
wire out;
eight_one_mux uut(.i(i),.s(s),.out(out));
initial
begin
i[0]=0;i[1]=1;i[2]=0;i[3]=1;i[4]=0;i[5]=0;i[6]=0;i[7]=1;
s[2]=0;s[1]=0;s[0]=0;
#100 s[2]=0;s[1]=0;s[0]=1;
#100 s[2]=0;s[1]=1;s[0]=0;
#100 s[2]=0;s[1]=1;s[0]=1;
#100 s[2]=1;s[1]=0;s[0]=0;
#100 s[2]=1;s[1]=0;s[0]=1;
#100 s[2]=1;s[1]=1;s[0]=0;
#100 s[2]=1;s[1]=1;s[0]=1;
end

endmodule
