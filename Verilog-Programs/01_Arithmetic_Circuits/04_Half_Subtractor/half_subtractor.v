//Author:mahesh
//halfsub using three models of code
module half_sub(
    input a,
    input b,
    output d,
    output bout
    );
    //wire abar;
    assign d = a ^ b ;//dataflow
    assign bout = ~a & b;
    /*xor (d,a,b);//gatelevel
    not(abar,a);
    and (bout,abar,b);*/
    /*always@(*)//behavioural
    begin
    d=a^b;
    bout= ~a & b;
    end*/
endmodule
