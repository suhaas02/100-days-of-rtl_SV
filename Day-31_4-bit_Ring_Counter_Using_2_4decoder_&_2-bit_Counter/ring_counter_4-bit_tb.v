module ring_counter_4_bit_tb(); 
    reg rst, clock;
    wire [3:0] dout; 

    ring_counter_4_bit DUT(rst, clock, dout); 

    initial 
        begin 
            clock = 0; 
            forever #5 clock = ~clock; 
        end 

    initial 
        begin 
            @(negedge clock) rst = 1; 
            @(negedge clock) rst = 0; 
            repeat(10)
                @(negedge clock); 
            $finish; 
        end 
endmodule 