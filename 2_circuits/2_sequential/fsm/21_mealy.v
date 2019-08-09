module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 

    parameter idle=2'd0, one=2'd1, two=2'd2, three=2'd3;
    reg	[1:0]	state, next_state;
    
    always@(*) begin
        case({state, x})
            {idle, 1'b0}:	next_state = idle;
            {idle, 1'b1}:	next_state = one;
            {one, 1'b0}:	next_state = two;
            {one, 1'b1}:	next_state = one;
            {two, 1'b0}:	next_state = idle;
            {two, 1'b1}:	next_state = three;
            {three, 1'b0}:	next_state = two;
            {three, 1'b1}:	next_state = one;
        endcase
    end
    
    always@(posedge clk or negedge aresetn) begin
        if(~aresetn)
            state <= idle;
        else
            state <= next_state;
    end
    
    assign	z = (state == two && x == 1'b1);
    
endmodule
