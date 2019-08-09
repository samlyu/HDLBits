module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] result
);
    wire mid,bot;
    wire [31:0] bsub;
    assign	bsub = b^{32{sub}};
    add16 a1(a[15:0], bsub[15:0], sub, result[15:0], mid);
    add16 a2(a[31:16], bsub[31:16], mid, result[31:16], bot);
    
endmodule
