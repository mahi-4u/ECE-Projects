//Author:mahesh
module vending_tb;

reg clk, rst;
reg [1:0] coin;

wire choco;
wire change;
wire [1:0] change_amt;

// DUT
vending_mech uut (
    .clk(clk),
    .rst(rst),
    .coin(coin),
    .choco(choco),
    .change(change),
    .change_amt(change_amt)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    coin = 2'b00;
    rst = 1;

    // Reset
    @(posedge clk);
    rst = 0;

    // ---------------------------
    // Test 1: 5 + 5 + 5
    // ---------------------------
    @(posedge clk) coin = 2'b01;  // 5
    @(posedge clk) coin = 2'b00;

    @(posedge clk) coin = 2'b01;  // 10
    @(posedge clk) coin = 2'b00;

    @(posedge clk) coin = 2'b01;  // 15 → choco
    @(posedge clk) coin = 2'b00;

    // ---------------------------
    // Test 2: 10 + 10
    // ---------------------------
    @(posedge clk) coin = 2'b10;  // 10
    @(posedge clk) coin = 2'b00;

    @(posedge clk) coin = 2'b10;  // 20 → choco + change
    @(posedge clk) coin = 2'b00;

    // ---------------------------
    // Test 3: 5 + 10
    // ---------------------------
    @(posedge clk) coin = 2'b01;  // 5
    @(posedge clk) coin = 2'b00;

    @(posedge clk) coin = 2'b10;  // 15 → choco
    @(posedge clk) coin = 2'b00;

    // ---------------------------
    // Test 4: 10 + 5
    // ---------------------------
    @(posedge clk) coin = 2'b10;  // 10
    @(posedge clk) coin = 2'b00;

    @(posedge clk) coin = 2'b01;  // 15 → choco
    @(posedge clk) coin = 2'b00;

    // Finish
    @(posedge clk);
    $finish;
end

// Monitor
initial begin
    $monitor("Time=%0t coin=%b choco=%b change=%b change_amt=%b",
              $time, coin, choco, change, change_amt);
end

endmodule
