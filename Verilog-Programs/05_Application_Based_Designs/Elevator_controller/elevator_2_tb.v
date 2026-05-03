//Author:mahesh
module elevator_tb();

reg clk, rst;
reg [2:0] req_in;
wire [1:0] floor;
wire door, dir;

elevator_design uut (
    .clk(clk),
    .rst(rst),
    .req_in(req_in),
    .floor(floor),
    .door(door),
    .dir(dir)
);

// clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("time=%0t req=%b floor=%d dir=%b door=%b",
              $time, req_in, floor, dir, door);

    rst = 1; req_in = 0;
    @(posedge clk); #1 rst = 0;

    // Case 1: multiple requests
    @(posedge clk); #1 req_in = 3'b110; // floors 1 & 2
    @(posedge clk); #1 req_in = 0;

    repeat(80) @(posedge clk);

    // Case 2: mixed direction
    @(posedge clk); #1 req_in = 3'b101; // floor 0 & 2
    @(posedge clk); #1 req_in = 0;

    repeat(80) @(posedge clk);
    repeat(80) @(posedge clk);
    
   

    $finish;
end

endmodule
