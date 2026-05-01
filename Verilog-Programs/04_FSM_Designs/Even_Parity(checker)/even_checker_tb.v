//Author:mahesh
module parity_even_tb();

reg x, clk, rst;
wire z;

parity_even uut (
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

// Stimulus
initial begin
    $monitor("time=%0t rst=%b x=%b ps=%b z=%b",
              $time, rst, x, uut.ps, z);

    // Initialize
    rst = 1;
    x   = 0;

    // Apply reset
    @(posedge clk);
    #1 rst = 0;

    // Apply inputs (after clock edge to avoid race)
    @(posedge clk); #1 x = 0;
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 0;
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 0;
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 0;
    @(posedge clk); #1 x = 1;

    // Finish simulation
    @(posedge clk);
    #5 $finish;
end

endmodule
