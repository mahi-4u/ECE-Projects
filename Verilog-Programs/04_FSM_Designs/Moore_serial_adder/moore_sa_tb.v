//Author:mahesh
module serial_add_moore_tb();

reg a, b, clk, rst;
wire sum, cout;

// Instantiate DUT
serial_add_moore uut(
    .sum(sum),
    .cout(cout),
    .a(a),
    .b(b),
    .clk(clk),
    .rst(rst)
);

// Clock generation (10 time unit period)
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial begin
    $monitor("time=%0t rst=%b a=%b b=%b ps=%b sum=%b cout=%b",
              $time, rst, a, b, uut.ps, sum, cout);

    // Initialize
    rst = 1;
    a = 0;
    b = 0;

    // Apply reset
    @(posedge clk);
    rst = 0;

    // Apply inputs (bit by bit serially)
    @(posedge clk); a = 0; b = 0;
    @(posedge clk); a = 1; b = 0;
    @(posedge clk); a = 0; b = 1;
    @(posedge clk); a = 1; b = 1;

    // Extra clocks to observe Moore outputs delay
    @(posedge clk);
    @(posedge clk);

    $finish;
end

endmodule
