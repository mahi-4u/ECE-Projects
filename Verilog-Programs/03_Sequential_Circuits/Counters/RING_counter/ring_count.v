//Author:mahesh
//here is my code for the ring counter
module ring_counter(
    input clk, clr,
    output reg [3:0] q
);

always @(posedge clk or posedge clr)
begin
    if (clr)
        q <= 4'b0001;
    else
    begin
        q[3] <= q[0];
        q[2] <= q[3];
        q[1] <= q[2];
        q[0] <= q[1];
    end
end

endmodule
