module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=2'd0, B=2'd1, C=2'd2, D=2'd3;

    // State transition logic: next_state = f(state, in)
    always@(*) begin
        case({state, in})
            {A, 1'b0}: next_state = A;
            {A, 1'b1}: next_state = B;
            {B, 1'b0}: next_state = C;
            {B, 1'b1}: next_state = B;
            {C, 1'b0}: next_state = A;
            {C, 1'b1}: next_state = D;
            {D, 1'b0}: next_state = C;
            {D, 1'b1}: next_state = B;
        endcase
    end
    
    
    // Output logic:  out = f(state) for a Moore state machine
    assign out = (state == D);
    
endmodule
