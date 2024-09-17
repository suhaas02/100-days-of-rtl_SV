module piso(input clock, rst, load, input [3:0] din, output reg dout); 
    reg [3:0]temp; 
    always@(posedge clock)
        begin 
            if(rst)
                dout <= 0; 
            else if(load) begin 
                temp <= din; 
                dout <= dout; 
            end
            else 
                begin 
                    dout <= temp[0]; 
                    temp <= {1'b0, temp[3:1]}; 
                end 
        end 
endmodule 