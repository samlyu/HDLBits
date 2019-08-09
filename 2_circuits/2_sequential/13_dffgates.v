module top_module (
    input clk,
    input x,
    output z
); 

    wire D0, D1, D2;
    reg	Q0, Q1, Q2;
    assign	D0 = x^Q0;
    assign	D1 = x&(~Q1);
    assign	D2 = x|(~Q2);
    always@(posedge clk)  begin
       	Q0 <= D0;
        Q1 <= D1;
        Q2 <= D2;
    end
    assign	z = ~(Q0|Q1|Q2);
    
endmodule
