//Author:mahesh
module t_ff_tb();

reg t, clk, clr;
wire q,qbar;
t_ff uut (
    .t(t),
    .clk(clk),
    .clr(clr),
    .q(q),
    .qbar(qbar)
);
always #5 clk = ~clk;

initial
begin
  $monitor("Time=%0t | T=%b CLR=%b | Q=%b Qbar=%b",
              $time, t, clr, q, qbar);
    clk = 0; clr = 1; t = 0;
    #10 clr = 0;
    #50 t = 1;
    #50 t = 0;
    #50 t = 1;
    #50 t = 0;

end
endmodule
