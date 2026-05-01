//Author:mahesh
module traffic_tb();    

reg x, clk, rst;    
wire [1:0] hwy, cntry;    

Traffic_light uut (
    .x(x),
    .clk(clk),
    .rst(rst),
    .hwy(hwy),
    .cntry(cntry)
);    

// Clock generation
initial begin    
    clk = 0;    
    forever #5 clk = ~clk;    
end    

// Stimulus
initial begin    
    $monitor("time=%0t rst=%b x=%b hwy=%b cntry=%b",
              $time, rst, x, hwy, cntry);

    x = 0; 
    rst = 1;    

    @(posedge clk);
    rst = 0;    

    @(posedge clk) x = 0;    
    @(posedge clk) x = 1;    
    @(posedge clk) x = 0;    
    @(posedge clk) x = 0;    
    @(posedge clk) x = 1;    
    @(posedge clk) x = 0;    

end    

endmodule
