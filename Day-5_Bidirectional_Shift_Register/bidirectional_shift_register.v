module bidirectional_shift_register(input din, 
                                    input mode, 
                                    input clock,
                                    input rst,
                                    output reg [size - 1:0] dout); 
    parameter size = 8;    
    //mode = 0 -> left, mode = 1 -> right shift 
    always@(posedge clock)  
        begin 
            if(rst)
                dout <= 0; 
            // else if(mode == 1)
            //     dout <= {din, dout[size - 1 : 1]};
            // else if(mode == 0)
            //     dout <= {dout[size - 2 : 1], din}; 
            else 
                begin 
                    case(mode)
                        0: dout <= {dout[size - 2 : 1], din}; 
                        1: dout <= {din, dout[size - 1 : 1]};
                    endcase 
                end 

        end 

endmodule 