module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

    parameter A=2'b01, B=2'b10;
    reg	[1:0] state, next_state;

    always@(*) begin
        case({state,x})
            {A, 1'b0}:	next_state = A;
            {A, 1'b1}:	next_state = B;
            {B, 1'b0}:	next_state = B;
            {B, 1'b1}:	next_state = B;
            default:	next_state = A;
        endcase
    end
    
    always@(posedge clk or posedge areset) begin
        if(areset)
            state <= A;
        else
            state <= next_state;
    end
    
    assign	z = (state==A)&(x) || (state==B)&(~x);
    
endmodule
