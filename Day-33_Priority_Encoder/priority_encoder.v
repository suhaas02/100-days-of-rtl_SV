module priority_encoder(input [n - 1 : 0] din, input reset, output reg [nout - 1:0] dout); 
    parameter n = 4;
    parameter nout = $clog(n) ; 
    always@(*)
        begin 
            if(reset)
                dout = 0; 
            else begin
                dout = dout; 
            end
        end 
    always@(din)
        begin  
                casex(din)
                    1xxx : dout = 2'd3;
                    /*n'b01xx : dout = nout'd2;
                    n'b001x : dout = nout'd1;
                    n'b0001 : dout = nout'd0;*/
                    default : dout = 2'bxx; 
                endcase
        end 
endmodule 