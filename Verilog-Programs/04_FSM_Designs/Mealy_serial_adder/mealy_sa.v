//Author:mahesh
//here is my mealy serial adder code
module serial_mealy (
    input clk,
    input rst,
    input a,
    input b,
    output reg sum
);

parameter x = 0, y = 1;
reg ps, ns;

// State logic
always @(posedge clk or posedge rst)
begin
    if (rst)
        ps <= x;
    else
        ps <= ns;
end

// Combined next-state and output logic
always @(*)
begin
    case (ps)
        x: begin
            ns  = a ? (b ? y : x) : (b ? x : x);
            sum = a ? (b ? 0 : 1) : (b ? 1 : 0);
        end

        y: begin
            ns  = a ? (b ? y : y) : (b ? y : x);
            sum = a ? (b ? 1 : 0) : (b ? 0 : 1);
        end

        default: begin
            ns  = x;
            sum = 0;
        end
    endcase
end

endmodule
