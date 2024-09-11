module t_ff(input clock, din, reset, output reg q); 
    always@(posedge clock)
        begin 
            if(reset)
                q <= 0; 
            else if(din == 1)
                q <= ~q;
            else
                q <= q;  
        end 
endmodule