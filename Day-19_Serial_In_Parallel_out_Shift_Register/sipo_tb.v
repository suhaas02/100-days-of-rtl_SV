module sipo_tb(); 
    reg clock, din; 
    wire [3:0] qout; 

    sipo #(4) DUT(din, clock, qout); 
    initial 
        begin 
            clock = 1'b0; 
            forever #5 clock = ~clock; 
        end 

    initial 
        begin 
            @(negedge clock) din = 1'b0;
            @(negedge clock) din = 1'b0;
            @(negedge clock) din = 1'b1;
            @(negedge clock) din = 1'b1;
            @(negedge clock) din = 1'b1;
            @(negedge clock) din = 1'b1;
            @(negedge clock) din = 1'b1;
            @(negedge clock) din = 1'b1; 
            @(negedge clock) din = 1'b0;
            @(negedge clock) din = 1'b0;
            @(negedge clock) din = 1'b0;
            @(negedge clock) din = 1'b0;
            @(negedge clock) din = 1'b0;
            @(negedge clock) din = 1'b0;
				@(negedge clock) $finish; 
        end 
		  
		  
endmodule 