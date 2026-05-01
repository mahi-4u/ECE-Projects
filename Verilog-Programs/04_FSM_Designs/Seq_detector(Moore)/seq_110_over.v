//Author:mahesh
//here is my code for the moore model of overlap sequence detecting for 110
module moore_110(
    input x, clk, rst,
    output reg z
);

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10,
          S3 = 2'b11;

reg [1:0] ps, ns;

// state register
always @(posedge clk or posedge rst) begin
    if (rst)
        ps <= S0;
    else
        ps <= ns;
end

// next state logic
always @(*) begin
    case(ps)
        S0: ns = x ? S1 : S0;

        S1: ns = x ? S2 : S0;

        S2: ns = x ? S2 : S3;

        S3: ns = x ? S1 : S0;

        default: ns = S0;
    endcase
end

// Moore output
always @(*) begin
    z = (ps == S3);
end

endmodule
