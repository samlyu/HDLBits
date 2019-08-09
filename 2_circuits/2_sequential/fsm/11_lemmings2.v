module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter left=2'd0, right=2'd1, falll=2'd2, fallr=2'd3;
    reg [1:0]	state, next_state;
    
    always@(*) begin
        case(state)
            left: begin
                if(~ground) 		next_state = falll;
                else if(bump_left)	next_state = right;
                else				next_state = left;
            end
            right: begin
                if(~ground)			next_state = fallr;
                else if(bump_right)	next_state = left;
                else				next_state = right;
            end
            falll: begin
                if(ground)	next_state = left;
                else		next_state = falll;
            end
            fallr: begin
                if(ground)	next_state = right;
                else		next_state = fallr;
            end
        endcase
    end
    
    always@(posedge clk or posedge areset) begin
        if(areset)
            state <= left;
        else
            state <= next_state;
    end
    
    assign	walk_left = (state == left);
    assign	walk_right = (state == right);
    assign	aaah = (state == falll || state == fallr);
    
endmodule
