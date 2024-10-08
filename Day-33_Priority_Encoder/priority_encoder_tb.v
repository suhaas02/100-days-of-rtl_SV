module priority_encoder_tb(); 
    reg [3:0] din, reset; 
    wire [1:0] dout; 

    priority_encoder DUT(din, reset, dout); 
    integer i; 
    initial 
        begin 
            #5 reset = 1; 
            #5 reset = 0; 
            for(i = 0; i < 16; i = i + 1)
                begin 
                    #5 din = i; 
                end 
            $finish; 
        end 
endmodule 