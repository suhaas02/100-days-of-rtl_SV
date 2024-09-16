module sync_counter_tb(); 
    reg clock, load, mode, rst; 
    reg [3:0] din; 
    wire [3:0] dout; 

    sync_counter DUT(clock, load, mode, rst, din, dout);

    initial 
        begin 
            clock = 0; 
            forever #5 clock = ~clock; 
        end 

    initial 
        begin 
            @(negedge clock) rst = 1; 
            @(negedge clock) rst = 0; 
            //@(negedge clock); 
            load = 1; 
            din = 4'b0110; 
            @(negedge clock) load = 0; 
            mode = 1; 

            repeat(10)
                @(negedge clock); 
            @(negedge clock); 
                mode = 0; 
            repeat(10)
                @(negedge clock); 
            $finish; 
				end

    initial $monitor("clock = %d, load = %d, mode = %d, rst = %0d, din = %d, dout = %d", clock, load, mode, rst, din, dout); 
endmodule 