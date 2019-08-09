module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //

    muxdff a3(KEY[0], KEY[3], SW[3], KEY[1], KEY[2], LEDR[3]);
    muxdff a2(KEY[0], LEDR[3], SW[2], KEY[1], KEY[2], LEDR[2]);
    muxdff a1(KEY[0], LEDR[2], SW[1], KEY[1], KEY[2], LEDR[1]);
    muxdff a0(KEY[0], LEDR[1], SW[0], KEY[1], KEY[2], LEDR[0]);
    
endmodule

module muxdff (
    input clk,
    input w, R, E, L,
    output Q
);
    
    wire D;
    assign	D = L?R:(E?w:Q);
    always@(posedge clk) begin
       	Q <= D; 
    end

endmodule
