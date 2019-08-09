module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter LEFT=1'b0, RIGHT=1'b1;
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case({state, bump_left, bump_right})
            {LEFT, 2'b00}:	next_state = LEFT;
            {LEFT, 2'b01}:	next_state = LEFT;
            {LEFT, 2'b10}:	next_state = RIGHT;
            {LEFT, 2'b11}:	next_state = RIGHT;
            {RIGHT, 2'b00}:	next_state = RIGHT;
            {RIGHT, 2'b01}:	next_state = LEFT;
            {RIGHT, 2'b10}:	next_state = RIGHT;
            {RIGHT, 2'b11}:	next_state = LEFT;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state <= LEFT;
        else
            state <= next_state;
    end

    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);

endmodule
