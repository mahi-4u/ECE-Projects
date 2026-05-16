//Author:mahesh
module full_rca1tb(
    );
    reg  [3:0] a;
    reg  [3:0] b;
    reg        cin;
    wire [3:0] s;
    wire       cout;

    // DUT (Device Under Test)
    full_rca1 uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    initial begin
        // Monitor values
        $monitor("TIME=%0t | a=%b (%0d) b=%b (%0d) cin=%b || s=%b (%0d) cout=%b",
                  $time, a, a, b, b, cin, s, s, cout);

        // Test cases
        a = 4'd0;  b = 4'd0;  cin = 0;  #10;
        a = 4'd3;  b = 4'd2;  cin = 0;  #10;
        a = 4'd7;  b = 4'd8;  cin = 0;  #10;
        a = 4'd15; b = 4'd1;  cin = 0;  #10;
        a = 4'd15; b = 4'd15; cin = 0;  #10;
        a = 4'd15; b = 4'd15; cin = 1;  #10;
        a = 4'd9;  b = 4'd6;  cin = 1;  #10;

        // Finish simulation
       
    end
endmodule
