//Author:mahesh
//here is my code for odd parity checking
module parity_odd_mealy(
    output reg z,
    input x, clk, rst
);

parameter EVEN = 0, ODD = 1;
reg ps, ns;

// State register
always @(posedge clk or posedge rst) begin
    if (rst)
        ps <= EVEN;
    else
        ps <= ns;
end

// Next state + Output logic (Mealy)
always @(*) begin
    case (ps)
        EVEN: begin
            z  = (x == 1) ? 1 : 0;   // flipped
            ns = (x == 1) ? ODD : EVEN;
        end
        ODD: begin
            z  = (x == 0) ? 1 : 0;   // flipped
            ns = (x == 1) ? EVEN : ODD;
        end
        default: begin
            z  = 0;
            ns = EVEN;
        end
    endcase
end

endmodule
