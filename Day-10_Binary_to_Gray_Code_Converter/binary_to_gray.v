module binary_to_gray(input rst, input [3:0] din, output reg [3:0] dout);
	integer i; 
    initial 
        begin 
            if(rst)
                dout = 4'd0; 
        end
    always@(*)
        begin 
            // dout = 4'd0; 
            dout[3] = din[3];
            for(i = 2; i >=0; i = i - 1)
                begin 
                    dout[i] = dout[i + 1] ^ din[i]; 
                end
        end  
endmodule 