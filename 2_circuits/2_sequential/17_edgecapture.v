module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] d_last1, d_last2;
    
    always@(posedge clk) begin
       d_last1 <= in; 
    end
    assign d_last2 = ~in & d_last1;
    
    always@(posedge clk)
        begin
            if(reset)
                out <= 32'b0;
            else begin
                for(int i=0; i<32; i=i+1) begin
                    if(d_last2[i])
                        out[i] <= 1'b1;
                end
			end
        end
            
endmodule
