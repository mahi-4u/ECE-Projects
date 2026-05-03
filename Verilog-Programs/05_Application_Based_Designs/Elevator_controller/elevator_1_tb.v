//Author:mahesh
module elevator_tb();

reg clk, rst, start;
reg [1:0] target;
wire [1:0] floor;
wire door, dir;

elevator_design uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .target(target),
    .floor(floor),
    .door(door),
    .dir(dir)
);
//clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("time=%0t start=%b target=%d floor=%d dir=%b door=%b",
              $time, start, target, floor, dir, door);

    rst = 1; start = 0; target = 0;
    @(posedge clk); #1 rst = 0;

    // Go to floor 2
    @(posedge clk); #1 target = 2; start = 1;
    @(posedge clk); #1 start = 0;

    repeat(30) @(posedge clk);

    // Go to floor 0
    @(posedge clk); #1 target = 0; start = 1;
    @(posedge clk); #1 start = 0;

    repeat(30) @(posedge clk);

    // Same floor request
    @(posedge clk); #1 target = 0; start = 1;
    @(posedge clk); #1 start = 0;

    repeat(20) @(posedge clk);

    $finish;
end

endmodule
