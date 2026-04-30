//Author:mahesh
module sr_ff_tb();
reg s, r, clk, clr;
wire q, qbar;

sr_ff uut (
    .s(s),
    .r(r),
    .clk(clk),
    .clr(clr),
    .q(q),
    .qbar(qbar)
);

always #5 clk = ~clk;  // Clock generation

initial 
begin
$monitor("Time=%0t | S=%b R=%b CLR=%b | Q=%b Qbar=%b",
              $time, s, r, clr, q, qbar);
    clk = 0; clr = 1; s = 0; r = 0;
    #10 clr = 0;

    #10 s = 1; r = 0;   // Set
    #10 s = 0; r = 1;   // Reset
    #10 s = 0; r = 0;   // Hold
    #10 s = 1; r = 1;   // Invalid
    
end

endmodule
