module fulladd(
    input a,
    input b,
    input cin,
    output  s,
    output  cout
    );
    wire a1,a2,r1;
   //assign s=a^b^cin; //dataflow
   //assign cout=(a&b)|(cin&(a|b));
   /*always@(*) //behavioural
   begin
   s=a^b^cin;
   cout=(a&b)|(cin&(a|b));
   end*/
   xor (s,a,b,cin); //gatelevel
   and (a1,a,b);
   or (r1,a,b);
   and (a2,cin,r1);
   or (cout,a1,a2);
endmodule
