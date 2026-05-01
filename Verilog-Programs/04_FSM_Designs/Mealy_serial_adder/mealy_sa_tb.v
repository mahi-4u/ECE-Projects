//Author:mahesh
module serial_add_mealy_tb();

reg clk;
reg rst;
reg a;
reg b;
wire sum;

serial_mealy uut (
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .sum(sum)
);

// Clock generation
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin
    $monitor("time=%0t rst=%b a=%b b=%b carry(ps)=%b sum=%b",
              $time, rst, a, b, uut.ps, sum);

    rst = 1;
    a = 0;
    b = 0;

    @(posedge clk);
    rst = 0;

  @(posedge clk) begin a=0; b=0; end
    @(posedge clk) begin a=1; b=0; end
    @(posedge clk) begin a=0; b=1; end
  @(posedge clk) begin a=1; b=1; end
  #20 $finish;
end

endmodule
