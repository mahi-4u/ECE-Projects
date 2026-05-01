//Author:mahesh
//here is my code for a simple two junctioned road operating traffic light controller
//this uses counter logic to apply delays between state transitions.
module Traffic_light(
input clk, rst,
output reg [1:0] hwy, cntry
);

// STATES
parameter a=2'd0, b=2'd1, c=2'd2, d=2'd3;

// LIGHTS
parameter g=2'd0, y=2'd1, r=2'd2;

reg [1:0] ps, ns;
reg [5:0] counter;

// STATE REGISTER
always @(posedge clk or posedge rst)
begin
    if(rst)
        ps <= a;
    else
        ps <= ns;
end

// OUTPUT LOGIC
always @(ps)
begin
    case(ps)
        a: begin hwy = g; cntry = r; end
        b: begin hwy = y; cntry = r; end
        c: begin hwy = r; cntry = g; end
        d: begin hwy = r; cntry = y; end
        default: begin hwy = g; cntry = r; end
    endcase
end

// NEXT STATE LOGIC
always @(ps or counter)
begin
    case(ps)
        a: ns = (counter == 30) ? b : a;
        b: ns = (counter == 5)  ? c : b;
        c: ns = (counter == 30) ? d : c;
        d: ns = (counter == 5)  ? a : d;
        default: ns = a;
    endcase
end

// COUNTER LOGIC
always @(posedge clk or posedge rst)
begin
    if(rst)
        counter <= 0;
    else if(ps != ns)
        counter <= 0;
    else
        counter <= counter + 1;
end

endmodule
