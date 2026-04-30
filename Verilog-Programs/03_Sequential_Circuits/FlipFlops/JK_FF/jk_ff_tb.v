//Author:mahesh
module jk_ff_tb();

reg j, k, clk, clr;
wire q, qbar;

jk_ff uut (
    .j(j),
    .k(k),
    .clk(clk),
    .clr(clr),
    .q(q),
    .qbar(qbar)
);

always #5 clk = ~clk;

initial begin
 $monitor("Time=%0t | J=%b K=%b CLR=%b | Q=%b Qbar=%b",
              $time, j, k, clr, q, qbar);
    clk = 0; clr = 1; j = 0; k = 0;
    #10 clr = 0;

    #10 j = 1; k = 0;  // Set
    #10 j = 0; k = 1;  // Reset
    #10 j = 1; k = 1;  // Toggle
    
end
endmodule
