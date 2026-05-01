//Author:mahesh
//here is mealy overlap code detecting the sequence 110
module seq_over(
    input x, clk, rst,
    output reg z
);

parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;
reg [1:0] ps, ns;

// State register
always @(posedge clk or posedge rst) begin
    if (rst)
        ps <= s0;
    else
        ps <= ns;
end

// Next state + output logic (Mealy)
always @(*) begin
    case(ps)
        s0: begin
            ns = x ? s1 : s0;
            z  = 0;
        end

        s1: begin
            ns = x ? s2 : s0;
            z  = 0;
        end

        s2: begin
            ns = x ? s2 : s0;
            z  = x ? 0 : 1;   // detect 110
        end

        default: begin
            ns = s0;
            z  = 0;
        end
    endcase
end

endmodule
