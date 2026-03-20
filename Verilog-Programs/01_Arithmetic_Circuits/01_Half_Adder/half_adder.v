//Author:mahesh
//halfadder using three models of code
module half_add(
    input a,
    input b,
    output s,
    output c
    );
    //assign s=a^b;//dataflow
    //assign c=a&b;
    /*always@(*)
    begin
    s=a^b;
    c=a&b;
    end*/ //behavioural
    xor (s,a,b);//gatelevel
    and (c,a,b);
endmodule
