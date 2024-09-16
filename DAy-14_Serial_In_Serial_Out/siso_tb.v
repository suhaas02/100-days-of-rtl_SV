module siso_tb(); 
    reg clock, din; 
    wire dout; 

    siso DUT(clock, din, dout);
    initial 
        begin 
            clock = 0; 
            forever #5 clock = ~clock; 
        end 

    initial 
        begin 
            @(posedge clock) din = 1; 
            @(posedge clock) din = 1; 
            @(posedge clock) din = 1; 
            @(posedge clock) din = 0;
            @(posedge clock) din = 1; 
            @(posedge clock) din = 0;
            @(posedge clock) din = 0;
            @(posedge clock) din = 1;
			@(posedge clock);
            @(posedge clock);
            @(posedge clock);
            @(posedge clock);
            @(posedge clock);
            @(posedge clock); 
            @(posedge clock);
            @(posedge clock) $finish;  
        end   
endmodule 