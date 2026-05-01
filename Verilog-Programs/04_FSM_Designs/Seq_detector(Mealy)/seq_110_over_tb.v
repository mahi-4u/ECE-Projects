//Author:mahesh
module seq_over_tb();

reg x, clk, rst;
wire z;

seq_over uut (.x(x), .clk(clk), .rst(rst), .z(z));

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("time=%0t rst=%b x=%b ps=%b z=%b",
              $time, rst, x, uut.ps, z);

    rst = 1;
    x   = 0;

    @(posedge clk);
    #1 rst = 0;

    // Input sequence: 110110 (overlapping should detect twice)
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 0;  // first detection

    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 0;  // second detection (OVERLAP)

    @(posedge clk); #1 x = 1;

    @(posedge clk);
    #5 $finish;
end

endmodule
