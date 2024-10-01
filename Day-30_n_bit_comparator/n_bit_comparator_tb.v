module n_bit_comparator_tb(); 
    reg [3:0] a, b; 
	 reg rst; 
    wire gr, ls, eq; 
    integer i; 
    n_bit_comparator #(4) DUT(a, b, rst,  gr, ls, eq);

     initial 
        begin 
            #5 rst = 1; 
            #5 rst = 0; 
            for(i = 0; i < 256; i = i + 1)
                begin 
                    #5; 
                    a = {$random} % 50; 
                    b = {$random} % 50; 
                end 
            #10 $finish; 
        end 
endmodule   