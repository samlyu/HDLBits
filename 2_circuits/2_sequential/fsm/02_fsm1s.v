// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

	parameter A=0, B=1;
	reg state;
	reg next;
    
    always@(*) begin
		case (state)
			A: next = in ? A : B;
			B: next = in ? B : A;
		endcase
    end
    
    always @(posedge clk) begin
		if (reset) state <= B;		// Reset to state B
        else state <= next;			// Otherwise, cause the state to transition
	end
    
	assign out = (state==B);
    
endmodule
