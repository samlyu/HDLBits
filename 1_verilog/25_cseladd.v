module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire sel, bot2, bot3;
    wire [15:0]	sum2, sum3;
    add16 a1(a[15:0], b[15:0], 1'b0, sum[15:0], sel);
    add16 a2(a[31:16], b[31:16], 1'b0, sum2, bot2);
    add16 a3(a[31:16], b[31:16], 1'b1, sum3, bot3);
    assign	sum[31:16] = sel?sum3:sum2;
endmodule
