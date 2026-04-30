//Author:mahesh
module ring_count_tb();

reg clk, clr;
wire [3:0] q;

ring_counter uut(clk, clr, q);

// Clock generation
always #5 clk = ~clk;

initial begin
    $monitor("time=%0t | clk=%0b | q=%04b", $time, clk, q);

    clk = 0;
    clr = 1;

    // Release reset at clock edge
    @(posedge clk);
    clr = 0;

    // Run long enough to see multiple rotations
    repeat(10) @(posedge clk);

    $finish;
end

endmodule
