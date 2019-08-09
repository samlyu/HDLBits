module top_module (
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
