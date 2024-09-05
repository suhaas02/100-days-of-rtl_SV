module buffer_register_tb(); 
    reg mode, clock, din_temp; 
    reg [3:0] din; 
    wire [3:0] dout; 

    buffer_register DUT (mode, clock, din_temp, din, dout);
    initial begin
		clock = 0; 
    forever #10 clock = ~clock; 
	end
	
    initial 
        begin 
            mode = 1; 
            din_temp = 1; 
            din = 4'b1101; 

            #15; 
            mode = 0; 
            din_temp = 0; 
        end

    initial #50 $finish; 
    initial $monitor("clock = %d, mode = %d, din_temp = %d, din = %d, dout = %d", clock, mode, din_temp, din, dout); 

endmodule  