module minority_detector_tb(); 
    wire dout;
     
    reg clock; 
    reg [4 : 0] din; 
    initial begin 
        clock = 0; 
        forever #10 clock = ~clock; 
    end

    minority_detector #(5)  DUT (din, clock, dout);

    initial 
        begin 
            //n = 6; 
            din = 11101; 
            #20; 

           // DUT.n = 8; 
            din = 01010;

        end 
    
    initial $monitor("din = %b, dout = %b", din, dout); 
    initial #50 $finish; 
endmodule 