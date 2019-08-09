`timescale 1ps/1ps
module top_module ( );

    reg clk;
    initial begin
       #0 clk = 0; 
    end
    
    always begin
       #5 clk = ~clk; 
    end
    
    dut dut1(clk);
    
endmodule
