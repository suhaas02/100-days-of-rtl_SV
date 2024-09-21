module n_bit_up_down_counter(input clock, rst, mode, load, input [n - 1:0] din, output reg [n - 1:0] dout);
    parameter n = 4; 
    always@(posedge clock)  
        begin 
            if(rst)
                dout <= 4'd0; 
            else if(load)
                dout <= din; 
            else 
                begin 
                    //mode == 1, up counter; 
                    if(mode)
                        dout <= dout + 1'b1; 
                    else
                        dout <= dout - 1'b1; 
                end 
        end 

endmodule 