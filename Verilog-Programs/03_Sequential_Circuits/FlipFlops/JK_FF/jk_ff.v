//Author:mahesh
//here is my all three models of code for jk flipflop
module jk_ff(
    input   j,k,clk,clr,
    output  reg q,qbar
);
/*wire nand1_out; // output from nand1
wire nand2_out; // output from nand2
gatelevel
nand n1 (nand1_out, j, clk);
nand n2 (nand2_out, k,clk);
nand n3 (q, qbar, nand1_out);
nand n4 (qbar, q, nand2_out);*/

/* DATAFLOW MODELLING
assign q =clr? 1'b0:( clk? ((q & (~k))+ ((~q) & j)) : q);
assign qbar = ~q;*/
// 3️⃣ BEHAVIORAL MODEL

always @(posedge clk or posedge clr)
begin
    if (clr)
        q <= 1'b0;
    else
    begin
        case ({j,k})
            2'b00: q <= q;        // Hold
            2'b01: q <= 1'b0;     // Reset
            2'b10: q <= 1'b1;     // Set
            2'b11: q <= ~q;       // Toggle
        endcase
    end
end

always @(*)
    qbar = ~q;

endmodule
