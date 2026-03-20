module multipliers_tb(

    );
    // Test bench for 2-bit multiplication
reg [1:0]a;
reg [1:0]b;
wire [3:0]product;
multipliers uut(
.a(a),
.b(b),
.product(product)
);
// clock generation
//stimulus
initial begin
a= 2'b10;
b= 2'b01;
#10 a=2'b10;b=2'b10;
//Apply stimulus
#10 a= 2'b11; b= 2'b10;
// End simulation

end
// Monitor
always @(a or b)
$display("$time=%0t: a=%b b=%b product=%b",$time,a,b,product);

endmodule
