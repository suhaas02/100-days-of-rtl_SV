module t_ff_tb(); 
    reg clock, din, reset; 
    wire q; 

    initial 
        begin 
            clock = 0; 
            forever #5 clock = ~clock;
        end 

    t_ff DUT(clock, din, reset, q);

    initial 
        begin 
			//	q = 0; 
            @(negedge clock) reset = 1; 
            @(negedge clock) reset = 0; 
            
            @(negedge clock) din = 0; 
            //#15; 
            @(negedge clock) din = 1; 
            //#15; 
            @(negedge clock)din = 1; 
            #15; 
            $finish; 
        end 

endmodule 