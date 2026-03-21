//AUthor:mahesh
//you can find three models of code
module four_two_encoder(
    input a, b, c, d,
    output x, y
);
    wire a1, bbar;

    // GATE LEVEL MODELLING
    or (x, a, b);
    not (bbar, b);
    and (a1, bbar, c);
    or (y, a, a1);

    /* DATAFLOW MODELLING
    assign x = a | b;
    assign y = a | (~b & c);
    */

    /* BEHAVIOURAL
    reg x, y;
    always @(*) begin
        case ({a,b,c,d})
            4'b1000: begin x=1; y=1; end
            4'b0100: begin x=1; y=0; end
            4'b0010: begin x=0; y=1; end
            4'b0001: begin x=0; y=0; end
            default: begin x=0; y=0; end
        endcase
    end
    */

endmodule
