//Author:mahesh
module d_ff_tb();

reg d, clk, clr;
wire q,qbar;
d_ff uut (
    .d(d),
    .clk(clk),
    .clr(clr),
    .q(q),
    .qbar(qbar)
);
always #10 clk = ~clk;

initial
begin
  $monitor("Time=%0t | D=%b CLR=%b | Q=%b Qbar=%b",
              $time, d, clr, q, qbar);
    clk = 0; clr = 1; d = 0;

    #10 clr = 0;

    #50 d = 1;
    #50 d = 0;
    #50 d = 1;
    #50 d = 0;
end

endmodule
