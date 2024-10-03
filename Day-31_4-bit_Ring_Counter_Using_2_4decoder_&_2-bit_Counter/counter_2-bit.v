module counter_2_bit(input rst, clock, output reg[1:0] dout); 
    always@(posedge clock)
        begin 
            if(rst)
                dout <= 2'b0; 
            else 
                dout <= dout + 1'b1; 
        end 
endmodule 