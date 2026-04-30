//Author:mahesh
//here is my 3 models of code for t flipflop
module t_ff(
    input t,clk,clr,
    output reg q,qbar
);
/*
wire j, k,j1,k1;

assign j = t;
assign k = t;

nand (j1, j, clk);
nand (k1, k, clk);
nand (q, j1, qbar);
nand (qbar, k1, q);*/

/*dataflow
assign q = clr ? 1'b0 :
           (clk ? (t ? ~q : q) : q);

assign qbar = ~q;
*/


//behaviuoral
always @(posedge clk or posedge clr)
begin
    if (clr)
        q <= 1'b0;
    else
    begin
        if (t)
            q <= ~q;   // Toggle
        else
            q <= q;    // Hold
    end
end

always @(*)
    qbar = ~q;

endmodule
