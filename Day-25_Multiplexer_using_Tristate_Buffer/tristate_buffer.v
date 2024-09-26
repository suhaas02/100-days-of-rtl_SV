module tristate_buffer(input din, ctrl, output dout);
    assign dout = (ctrl) ? din : 1'bz; 
endmodule 