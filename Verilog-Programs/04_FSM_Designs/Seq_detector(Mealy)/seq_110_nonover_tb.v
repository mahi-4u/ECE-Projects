//Author:mahesh
module seq_nonover_tb();

reg x, clk, rst;
wire z;

seq_nonover uut (.z(z), .x(x), .clk(clk), .rst(rst));

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("time=%0t rst=%b x=%b ps=%b z=%b", 
              $time, rst, x, uut.ps, z);

    rst = 1; 
    x = 0;

    @(posedge clk);
    #1 rst = 0;

    @(posedge clk); #1 x = 0;
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 0;
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 0;  // 110 detected here
    @(posedge clk); #1 x = 1;

    @(posedge clk);
    #5 $finish;
end

endmodule
