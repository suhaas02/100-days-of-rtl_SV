module n_bit_up_down_counter_tb(); 
    reg clock, rst, load, mode; 
    reg [3:0] din; 
    wire [3:0] dout; 

    n_bit_up_down_counter DUT(clock, rst, mode, load, din, dout); 

    initial 
        begin 
            clock = 1'b0; 
            forever #5 clock = ~clock; 
        end 

    initial 
        begin 
            @(negedge clock) rst = 1'b1; 
            @(negedge clock) rst = 1'b0; 
            @(negedge clock) load = 1'b1; 
            din = 4'b1001; 
            @(negedge clock) load = 1'b0; 
            mode = 1'b1; 
            repeat(10)
                @(negedge clock); 

            @(negedge clock) mode = 1'b0; 
            repeat(10)
                @(negedge clock); 
				@(negedge clock) $finish; 
        end 
endmodule             