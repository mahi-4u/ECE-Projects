module four_two_encodertb( );
reg a,b,c,d;
wire x,y;
four_two_encoder uut(a,b,c,d,x,y);
initial
begin
    a=1;b=0;c=0;d=0;
#100a=0;b=1;c=0;d=0;
#100a=0;b=0;c=1;d=0;
#100a=0;b=0;c=0;d=1;
end
endmodule
