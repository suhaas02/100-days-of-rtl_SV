module synchronous_fifo_tb(); 
    reg clock, rst, mode; 
    reg [7:0] din; 
    wire [7:0] dout; 
    wire full, empty; 

    synchronous_fifo DUT(clock, rst, mode, din, dout, full, empty); 
    initial 
        begin 
            clock = 1'b0; 
            forever #5 clock = ~clock; 
        end 
    
    initial 
        begin 
            @(negedge clock) rst = 1'b1; 
            @(negedge clock) rst = 1'b0; 
            @(negedge clock) mode = 1'b0; 
            repeat(10)
                @(negedge clock) din = {$random} % 50; 
            @(negedge clock) mode = 1'b1; 
            repeat(10)
                @(negedge clock); 
            #10 $finish; 
        end 
endmodule 