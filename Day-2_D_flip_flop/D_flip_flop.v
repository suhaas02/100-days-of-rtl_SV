module d_flip_flop(din, clock, q, qn); 
    input din, clock;
    output reg q, qn; 

    always@(posedge clock)
        begin 
            q = din; 
            qn = ~q; 
        end
endmodule 