module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always@(posedge clk) begin
        if(reset)
            q <= 4'd0;
        else if(slowena && q < 9)
            q <= q + 1'b1;
        else if(slowena && q == 9)
            q <= 4'd0;
    end
    
endmodule
