//Author:mahesh
//here is my code for moore serial adder
module serial_add_moore(
    input a, b, clk, rst,
    output reg sum, cout
);

parameter s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;

reg [1:0] ps, ns;

// State register
always @(posedge clk or posedge rst)
begin
    if (rst)
        ps <= s0;
    else
        ps <= ns;
end

// Next-state logic
always @(*)
begin
    case (ps)

        // carry = 0
        s0, s1: begin
            if (a==0 && b==0) ns = s0;  // sum=0 carry=0
            else if (a==0 && b==1) ns = s1; // sum=1 carry=0
            else if (a==1 && b==0) ns = s1; // sum=1 carry=0
            else ns = s2; // sum=0 carry=1
        end

        // carry = 1
        s2, s3: begin
            if (a==0 && b==0) ns = s1;  // sum=1 carry=0
            else if (a==0 && b==1) ns = s2; // sum=0 carry=1
            else if (a==1 && b==0) ns = s2; // sum=0 carry=1
            else ns = s3; // sum=1 carry=1
        end

        default: ns = s0;

    endcase
end

// Output logic
always @(*)
begin
    case(ps)
        s0: begin sum=0; cout=0; end
        s1: begin sum=1; cout=0; end
        s2: begin sum=0; cout=1; end
        s3: begin sum=1; cout=1; end
        default: begin sum=0; cout=0; end
    endcase
end

endmodule
