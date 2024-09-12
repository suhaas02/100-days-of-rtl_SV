module bidirectional_shift_register_tb(); 
    reg din, mode, rst, clock; 
    wire [7:0] dout; 

    bidirectional_shift_register #(8) DUT(din, mode, clock, rst, dout); 

    initial 
        begin 
            clock = 0; 
            forever #5 clock = ~clock; 
        end 

    initial 
        begin 
            @(posedge clock) rst = 1; 
            @(posedge clock) rst = 0; 

            @(posedge clock); 
            din = 1; 
            mode = 1; 

            @(posedge clock); 
            din = 0; 
            mode = 1; 

            @(posedge clock); 
            din = 1; 
            mode = 1; 

            @(posedge clock); 
            din = 1; 
            mode = 1; 

            @(posedge clock); 
            din = 0; 
            mode = 0;

            @(posedge clock); 
            din = 0; 
            mode = 0;

            @(posedge clock); 
            din = 1; 
            mode = 0;

            @(posedge clock); 
            din = 1; 
            mode = 0;
				@(posedge clock); 
            $finish; 
        end 

    initial $monitor("din = %d, mode = %d, rst = %d, clock = %d, dout = %b", din, mode, rst, clock, dout);    
endmodule