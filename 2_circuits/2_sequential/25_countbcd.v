module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    bcd c1(
        .clk(clk),
        .reset(reset),
        .enable(1'b1),
        .q(q[3:0])
    );
    
    bcd c10(
        .clk(clk),
        .reset(reset),
        .enable(q[3:0]==9),
        .q(q[7:4])
    );
    
    bcd c100(
        .clk(clk),
        .reset(reset),
        .enable(q[3:0]==9 && q[7:4]==9),
        .q(q[11:8])
    );
    
    bcd c1000(
        .clk(clk),
        .reset(reset),
        .enable(q[11:8]==9 && q[3:0]==9 && q[7:4]==9),
        .q(q[15:12])
    );
    
    assign	ena = {q[11:8]==9 && q[3:0]==9 && q[7:4]==9, q[3:0]==9 && q[7:4]==9, q[3:0]==9};
    
endmodule

module bcd(input clk, input reset, input enable, output [3:0]	q);
    always@(posedge clk) begin
        if(reset)
            q <= 4'd0;
        else if(enable) begin
            if(q == 9)
                q <= 4'd0;
            else
                q <= q + 1'b1;
        end
    end
    
endmodule
