//Author:mahesh
module traffic_tb();

reg clk, rst;
wire [1:0] hwy, cntry;

// Instantiate DUT
Traffic_light uut (
    .clk(clk),
    .rst(rst),
    .hwy(hwy),
    .cntry(cntry)
);

// Clock generation (10 time units period)
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Monitor signals
initial begin
    $monitor("time=%0t rst=%b hwy=%b cntry=%b",
              $time, rst, hwy, cntry);
end

// Stimulus
initial begin
    rst = 1;
    #10;
    rst = 0;

    // Run simulation long enough to see all states
    //#500;
end

endmodule
