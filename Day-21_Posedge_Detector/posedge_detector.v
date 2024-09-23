module posedge_detector(input clock, din, output y); 
    reg dout; 
    always@(posedge clock)
        begin 
            dout <= din; 
        end 
    assign y = ~dout & din; 

endmodule 