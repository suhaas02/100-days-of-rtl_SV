module sipo_using_generate_tb(); 
    reg din, clock, rst; 
    wire [31:0] dout; 

    sipo_using_generate DUT(din, clock, rst, dout);

    initial     
        begin 
            clock = 0; 
            forever #5 clock = ~clock; 
        end 

    initial     
        begin 
            @(negedge clock) rst = 1; 
            @(negedge clock) rst = 0; 
            repeat(40)
                begin 
                    @(negedge clock) din = {$random} % 2; 
                end 
            $finish; 
        end 
endmodule 