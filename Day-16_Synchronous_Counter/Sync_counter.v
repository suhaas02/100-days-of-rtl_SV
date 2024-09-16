module sync_counter(input clock, load, mode, rst, input [3:0] din, output reg [3:0] dout);
    always@(posedge clock)
        begin 
            if(rst)
                dout <= 0; 
            else if(load == 1)
                dout <= din; 
            else
                begin 
                        if(mode == 1)
                            dout <= dout + 1; 
                        else
                            dout <= dout - 1; 
                end  

        end 
endmodule 