module jk_flip_flop_tb(); 
    reg j, k, clock; 
    wire q, qn; 
    jk_flip_flop DUT(j, k, clock, q, qn); 
    initial 
        begin 
            clock = 0; 
            forever #10 clock = ~clock; 
        end 

    initial 
        begin 
            #10; 
            {j, k} = 2'b00; 
            #10; 
            {j, k} = 2'b01; 
            #10; 
            {j, k} = 2'b10; 
            #10; 
            {j, k} = 2'b11; 
            #10; 
            {j, k} = 2'b00; 
            #10; 
            {j, k} = 2'b01; 
            #10; 
            $finish; 
        end 
    
    initial $monitor("j = %d, k = %d, clock = %d, q = %d, qn = %d", j, k, clock, q, qn);
endmodule 