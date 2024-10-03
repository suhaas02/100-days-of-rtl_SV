module decoder2_4(input [1:0] din, output reg [3:0] dout); 
    always@(*)
        begin 
            case(din)
                2'd0 : dout <= 4'b0001; 
                2'd1 : dout <= 4'b0010; 
                2'd2 : dout <= 4'b0100; 
                2'd3 : dout <= 4'b1000; 
            endcase
        end 
endmodule 