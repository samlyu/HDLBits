module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
    // method 01
    assign	s = a+b;
    assign	overflow = (a[7]==b[7] && a[7]!=s[7]);

    // method 02
    //assign	overflow = (~a[7])&(~b[7])&(c) | a[7]&b[7]&(~c);
    
    // method 03
    //wire [6:0]	dumb;
    //wire		c2, c;
    //assign	{c2,s} = a + b;
    //assign	{c, dumb} = a[6:0] + b[6:0];
    //assign	overflow = c2 ^ c;
    
endmodule
