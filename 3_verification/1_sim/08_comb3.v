module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = a&c | a&(~c)&d | (~a)&b&c | (~a)&b&(~c)&d; // Fix me

endmodule
