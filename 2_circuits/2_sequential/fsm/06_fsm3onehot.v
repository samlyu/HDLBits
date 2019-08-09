module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //

    parameter A=4'd0, B=4'd1, C=4'd2, D=4'd3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = state[A]&(~in) | state[C]&(~in);
    assign next_state[B] = state[A]&(in) | state[B]&(in) | state[D]&(in);
    assign next_state[C] = state[B]&(~in) | state[D]&(~in);
    assign next_state[D] = state[C]&(in);

    // Output logic: 
    assign out = (state[D]);

endmodule
