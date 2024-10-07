module dff(input clock, rst, din, output reg dout); 
    always@(posedge clock)
        begin 
            if(rst)
                dout <= 0; 
            else 
                dout <= din; 
        end 
endmodule 