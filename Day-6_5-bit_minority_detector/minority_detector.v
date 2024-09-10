//Here i considered output as 1 if the number of 1's and 0's are same in the bit stream 
//if number of 0's are more than 1's , then the output will be 1;  
module minority_detector(input [n - 1:0] din, input clock, output dout); 
    parameter n = 5;
    integer i; 
    integer count; 
    always@(posedge clock)
        begin 
				count = 0; 
            for(i = 0; i < n; i = i + 1)
                begin 
						$display(din[i]);
                    if(din[i] == 0)
                        count = count + 1; 
                    else
                        count = count - 1; 
                end
            // if(count >= 0)
            //     dout <= 1; 
            // else    
            //     dout <= 0; 
        end 
    initial 
	 $monitor(count);
    assign dout = (count >= 0) ? 1 : 0; 
endmodule 