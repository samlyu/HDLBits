module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);

/*    always@(*) begin
        
        case({state, in})
            //0
            {10'b1, 1'b0}:			next_state = 10'b1;
            {10'b1, 1'b1}:			next_state = 10'b10;
            //1
            {10'b10, 1'b0}:			next_state = 10'b1;
            {10'b10, 1'b1}:			next_state = 10'b100;
            //2
            {10'b100, 1'b0}:			next_state = 10'b1;
            {10'b100, 1'b1}:			next_state = 10'b1000;
            //3
            {10'b1000, 1'b0}:		next_state = 10'b1;
            {10'b1000, 1'b1}:		next_state = 10'b10000;
            //4
            {10'b10000, 1'b0}:		next_state = 10'b1;
            {10'b10000, 1'b1}:		next_state = 10'b100000;
            //5
            {10'b100000, 1'b0}:		next_state = 10'b100000000;
            {10'b100000, 1'b1}:		next_state = 10'b1000000;
            //6
            {10'b1000000, 1'b0}:		next_state = 10'b1000000000;
            {10'b1000000, 1'b1}:		next_state = 10'b10000000;
            //7
            {10'b10000000, 1'b0}:	next_state = 10'b1;
            {10'b10000000, 1'b1}:	next_state = 10'b10000000;
            //8
            {10'b100000000, 1'b0}:	next_state = 10'b1;
            {10'b100000000, 1'b1}:	next_state = 10'b10;
            //9
            {10'b1000000000, 1'b0}:	next_state = 10'b1;
            {10'b1000000000, 1'b1}:	next_state = 10'b10;
            default: 				next_state = 10'b0;
        endcase
        
    end
    */
    
    assign next_state[0] = state[0]&(~in) | state[1]&(~in) | state[2]&(~in) | state[3]&(~in) | state[4]&(~in) | state[7]&(~in) | state[8]&(~in) | state[9]&(~in);
    assign next_state[1] = state[0]&in | state[8]&in | state[9]&in;
    assign next_state[2] = state[1]&in;
    assign next_state[3] = state[2]&in;
    assign next_state[4] = state[3]&in;
    assign next_state[5] = state[4]&in;
    assign next_state[6] = state[5]&in;
    assign next_state[7] = state[6]&in | state[7]&in;
    assign next_state[8] = state[5]&(~in);
    assign next_state[9] = state[6]&(~in);
    
    assign	out1 = state[8] | state[9];
    assign	out2 = state[7] | state[9];
    
endmodule
