module johnson_counter_tb(); 
    reg clock, clear;
    reg [3:0] seq;  
    wire [3:0] dout; 

    johnson_counter DUT(clock, clear, seq, dout);
    initial 
        begin 
            clock = 1'b0; 
            forever #5 clock = ~clock; 
        end 

    initial 
        begin 
            @(negedge clock) clear = 1'b1; 
            @(negedge clock) clear = 1'b0;
            @(negedge clock) seq = 4'b0110; 
				@(negedge clock) seq = 4'd0; 
            repeat(10)
                @(negedge clock); 

            @(negedge clock) $finish; 
        end   
endmodule 