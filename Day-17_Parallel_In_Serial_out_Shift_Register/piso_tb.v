module piso_tb(); 
    reg clock, rst, load; 
    reg [3:0] din;
    wire dout; 

    piso DUT(clock, rst, load, din, dout);

    initial 
        begin 
            clock = 0; 
            forever #5 clock = ~clock; 
        end 

    initial 
        begin 
            @(negedge clock) rst = 1; 
            @(negedge clock) rst = 0; 
            load = 1; 
            din = 4'b0101; 
            @(negedge clock) load = 0; 
            repeat(5)
                @(negedge clock);
            load = 1; 
            din = 4'b1110; 
            @(negedge clock) load = 0; 
            repeat(5)
                @(negedge clock);
					 
				$finish; 
        end  

endmodule 