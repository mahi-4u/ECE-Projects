//Author:mahesh
//here is my code for a simple vending machine which takes rs.5 & rs.10 as inputs 
and gives chocolate as output for rs.15
  
  module vending_mech(
input clk,rst,
input [1:0]coin,
output reg choco,
output reg change,
output reg [1:0] change_amt
);

parameter s0=2'b00,s5=2'b01,s10=2'b10,s15=2'b11;

reg [1:0]ps,ns;

// State register
always@(posedge clk or posedge rst)
begin
    if(rst)
        ps <= s0;
    else
        ps <= ns;
end

// Next state logic
always@(ps or coin)
begin
    case(ps)

    s0: begin
        if(coin==2'b01)
            ns=s5;
        else if(coin==2'b10)
            ns=s10;
        else
            ns=s0;
    end

    s5: begin
        if(coin==2'b01)
            ns=s10;
        else if(coin==2'b10)
            ns=s15;
        else
            ns=s5;
    end

    s10: begin
        if(coin==2'b01)
            ns=s15;        // 10 + 5 = 15
        else if(coin==2'b10)
            ns=s15;        // 10 + 10 = 20
        else
            ns=s10;
    end

    s15: ns=s0;

    default: ns=s0;

    endcase
end

//  Improved output logic (pulse-based + change handling)
always@(ps or ns or coin)
begin
    // default outputs
    choco = 1'b0;
    change = 1'b0;
    change_amt = 2'b00;

    // detect transition into s15
    if (ns == s15 && ps != s15) begin
        choco = 1'b1;

        // ₹20 case → give change
        if (ps == s10 && coin == 2'b10) begin
            change = 1'b1;
            change_amt = 2'b01; // return ₹5
        end
    end
end

endmodule
