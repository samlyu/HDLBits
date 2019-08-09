module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

    parameter qa0=2'd0, qa1=2'd1, qb0=2'd2, qb1=2'd3;
    reg	[1:0]	state, next_state;
    
    always@(*) begin
        case({state, x})
            {qa0, 1'b0}:	next_state = qa0;
            {qa0, 1'b1}:	next_state = qb1;
            {qa1, 1'b0}:	next_state = qa0;
            {qa1, 1'b1}:	next_state = qb1;
            {qb0, 1'b0}:	next_state = qb1;
            {qb0, 1'b1}:	next_state = qb0;
            {qb1, 1'b0}:	next_state = qb1;
            {qb1, 1'b1}:	next_state = qb0;
        endcase
    end
    
    always@(posedge clk or posedge areset) begin
        if(areset)
            state <= qa0;
        else
            state <= next_state;
    end
    
    assign	z = (state == qa1 || state == qb1);
    
endmodule
