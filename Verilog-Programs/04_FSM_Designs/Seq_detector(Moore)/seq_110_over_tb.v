//Author:mahesh
module moore_110_tb();

reg x, clk, rst;
wire z;

moore_110 uut (.x(x), .clk(clk), .rst(rst), .z(z));

// clock
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

    // test: 110110
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 0;
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 1;
    @(posedge clk); #1 x = 0;

    @(posedge clk);
    #5 $finish;
end

endmodule
