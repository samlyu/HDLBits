module top_module (
	input set,
	input reset,
	output reg q
);

	// Two NOR gates
	// wire qn = ~( ~(reset | qn)  |  set );
	// assign q = ~qn;

	// set has priority. If set=0, then see if user wants to reset.
	assign q = set ? 1'b1 : (reset ? 1'b0 : q);
	
	// If statements in a procedural block. Recall: If a variable isn't assigned
	// a value, then a latch is inferred to keep its value unchanged.
	/*
	always @(*) begin
		if (set) q = 1;
		else if (reset) q = 0;
	end
	*/
	
	// Case statement in a procedural block (combinational always block)
	// This *should* work, but it looks like Quartus synthesizes this particular circuit incorrectly...
	/*
	always @(*) begin
		case ({reset, set}) 
			2'b01: q = 1;
			2'b10: q = 0;
			2'b11: q = 1;
		endcase
	end
	*/
	
endmodule

/*
module top_module (
    input set,
    input reset,
    output q  ); 

    wire d;
    assign	d = q;
    always@(*) begin
        case({reset, set})
            2'b00:	q = d;
            2'b01:	q = 1'b1;
            2'b11:	q = 1'b1;
            2'b10:	q = 1'b0;
        endcase
    end
endmodule
*/
