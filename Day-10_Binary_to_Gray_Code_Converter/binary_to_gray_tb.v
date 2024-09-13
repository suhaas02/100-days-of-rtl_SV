module binary_to_gray_tb(); 
    reg [3:0] din; 
    reg rst; 
    wire [3:0] dout; 

    binary_to_gray DUT(rst, din, dout);
     
    initial 
        begin 
            rst = 1; 
            #5; 
            rst = 0; 
            #5; 
            din = 4'b0011; 
            #5; 
            din = 4'b1011; 
            #5; 
            din = 4'b1111; 
            #5; 
            $finish; 
        end 
endmodule 