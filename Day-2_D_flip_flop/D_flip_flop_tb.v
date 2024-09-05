module d_flip_flop_tb(); 
    reg clock, din; 
    wire q, qn; 
	integer i; 
    d_flip_flop DUT(din, clock, q, qn);
    initial 
        begin 
            clock = 0; 
            forever #10 clock = ~clock; 
        end 

    initial 
        begin
				//i = 2; 
            for(i = 0; i < 2; i = i + 1)
                begin  
                    din = 0; 
                    #5; 
                    din = 1; 
                    #10; 
                    din = 0;  
						  $monitor("din: %d", din); 
                end
        end 
    initial #100 $finish; 
endmodule