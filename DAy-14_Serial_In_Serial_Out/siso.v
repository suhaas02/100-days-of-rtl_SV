module dff(input clock, din, output reg dout); 
    always@(posedge clock)
        begin 
            dout <= din; 
        end 
endmodule 

module siso(input clock, din, output dout); 
    wire w1, w2, w3; 

    dff d0(clock, din, w1); 
    dff d1(clock, w1, w2); 
    dff d2(clock, w2, w3); 
    dff d3(clock, w3, dout); 
endmodule 