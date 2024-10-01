module n_bit_comparator(input [n - 1:0] a, b, input rst, output reg gr, ls, eq); 
    parameter n = 4; 
    always@(*)
        begin 
            if(rst)
                begin 
                    gr <= 0; 
                    ls <= 0; 
                    eq <= 0; 
                end 
            else if(a > b)
                begin 
                    gr <= 1; 
                    ls <= 0; 
                    eq <= 0;
                end 
            else if(a < b)
                begin 
                    gr <= 0; 
                    ls <= 1; 
                    eq <= 0; 
                end 
            else    
                begin 
                    gr <= 0; 
                    ls <= 0; 
                    eq <= 1; 
                end 
        end 
endmodule 