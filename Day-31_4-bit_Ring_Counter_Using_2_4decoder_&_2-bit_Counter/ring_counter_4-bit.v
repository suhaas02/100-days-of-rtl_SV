module ring_counter_4_bit(input rst, clock, output [3:0] dout); 
    wire [1:0] w; 
    counter_2_bit INST1(rst, clock, w); 
    decoder2_4 INST2(w, dout); 
endmodule 