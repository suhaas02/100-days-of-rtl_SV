//4:1 multiplixer using tristate buffer; 


module multiplexer_using_tristate_buffer(input [3:0] din, input [1:0] sel, output y); 
    wire [3:0] temp; 
    decoder_2_4 DEC(sel, temp); 
    tristate_buffer b0(din[0], temp[0], y);
    tristate_buffer b1(din[1], temp[1], y);
    tristate_buffer b2(din[2], temp[2], y);
    tristate_buffer b3(din[3], temp[3], y);
endmodule 