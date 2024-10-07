module sipo_using_generate(input din, clock, rst, output [31:0] dout); 
    dff d1(clock, rst, din, dout[0]); 
    genvar i; 
    generate
        for(i = 1; i < 32; i = i + 1)
            begin : sipo_gen
                dff d0(clock, rst, dout[i - 1], dout[i]); 
            end 
    endgenerate
endmodule 