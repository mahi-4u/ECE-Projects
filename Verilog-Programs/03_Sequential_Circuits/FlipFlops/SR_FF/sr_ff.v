//Author:mahesh
//here is my three models of code or sr flipflop
module sr_ff(
input s,r,clk,clr,
output reg q, qbar
    );

/*GATE LEVEL MODELLING
wire nand1_out; // output of nand1
wire nand2_out; // output of nand2
nand (nand1_out,clk,s);
nand (nand2_out,clk,r);
nand (q,nand1_out,qbar);
nand (qbar,nand2_out,q);*/
/* DATAFLOW MODELLING
assign q = clr? 1'b0:(clk? (s | ((~r) & q)) : q);
assign qbar = ~q;*/

// 3️⃣ BEHAVIORAL MODEL

always @(posedge clk or posedge clr)
begin
    if (clr)
        q <= 1'b0;
    else
    begin
        case ({s,r})
            2'b00: q <= q;        // Hold
            2'b01: q <= 1'b0;     // Reset
            2'b10: q <= 1'b1;     // Set
            2'b11: q <= 1'bx;     // Invalid
        endcase
    end
end

always @(*)
    qbar = ~q;
endmodule
