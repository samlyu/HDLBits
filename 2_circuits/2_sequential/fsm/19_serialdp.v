module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Modify FSM and datapath from Fsm_serialdata
    parameter idle = 4'd0, start = 4'd1, trans0 = 4'd2, trans1 = 4'd3, trans2 = 4'd4, trans3 = 4'd5;
    parameter trans4 = 4'd6, trans5 = 4'd7, trans6 = 4'd8, trans7 = 4'd9, stop = 4'd10, error = 4'd11, pari = 4'd12;
    reg [3:0]   state, next_state;
    reg [8:0]   data;
    
    always@(*) begin
        case(state)
            idle: begin
                if(~in)
                    next_state = start;
                else
                    next_state = idle;
            end
            start:  next_state = trans0;
            trans0: next_state = trans1;
            trans1: next_state = trans2;
            trans2: next_state = trans3;
            trans3: next_state = trans4;
            trans4: next_state = trans5;
            trans5: next_state = trans6;
            trans6: next_state = trans7;
            trans7: next_state = pari;
            pari: begin
                if(in && ^data==1'b1)
                    next_state = stop;
                else
                    next_state = error;
            end
            stop: begin
                if(in)
                    next_state = idle;
                else
                    next_state = start;
            end
            error: begin
                if(in)
                    next_state = idle;
                else
                    next_state = error;
            end
        endcase
    end
    
    always@(posedge clk) begin
        if(reset)
            state <= idle;
        else
            state <= next_state;
    end
    
    assign  done = (state == stop);

    always@(posedge clk) begin
        if(reset)
            data <= 9'd0;
        else begin
            if(next_state == trans0 || next_state == trans1 || next_state == trans2 || next_state == trans3 || next_state == trans4 || next_state == trans5 || next_state == trans6 || next_state == trans7)
                data <= {in, data[8:1]}; // LSB first
            else if(next_state == stop || next_state == pari)
                data <= data;
            else
                data <= 9'd0;
        end
    end
    
    assign  out_byte = (state == stop)?data[7:0]:8'd0;
    
endmodule
