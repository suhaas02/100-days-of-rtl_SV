module multiplexer_using_tristate_buffer_tb(); 
    reg [3:0] din; 
    reg [1:0] sel; 
    wire y; 

    multiplexer_using_tristate_buffer DUT(din, sel, y); 
    integer i; 
    initial 
        begin 
            #5; 
            for(i = 0; i < 32; i = i + 1) begin 
                {din, sel} = i; 
                #5; 
            end 
				#15 $finish; 
        end 
endmodule 