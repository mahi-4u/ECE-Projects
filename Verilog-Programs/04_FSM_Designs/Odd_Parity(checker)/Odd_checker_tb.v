//Author:mahesh
module parity_odd_tb();

reg x, clk, rst;
wire z;

parity_odd uut (
    .x(x),
    .clk(clk),
    .rst(rst),
    .z(z)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("time=%0t rst=%b x=%b ps=%b z=%b",
              $time, rst, x, uut.ps, z);

    // Initialize
    rst = 1;
    x   = 0;

    // Apply reset
    @(posedge clk);
    #1 rst = 0;

    // Apply inputs (after clock edge → important for Mealy)
    @(posedge clk); #1 x = 0;
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 0;
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 0;
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 0;
    @(posedge clk); #1 x = 1;

    // End simulation
    @(posedge clk);
    #5 $finish;
end

endmodule
