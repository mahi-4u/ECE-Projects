//Author:mahesh
//here is my all three models of code for the d flipflop
module d_ff(
    input  d,clk,clr,
    output q,qbar
);

wire dbar, s, r;

not  (dbar, d);
nand (s, d, clk);
nand (r, dbar, clk);

nand (q, s, qbar);
nand (qbar, r, q);


/*dataflow


assign q = clr ? 1'b0 :
           (clk ? d : q);

assign qbar = ~q;
*/


/*behaviuoral
always @(posedge clk or posedge clr)
begin
    if (clr)
        q <= 1'b0;
    else
        q <= d;
end

always @(*)
    qbar = ~q;*/
endmodule
