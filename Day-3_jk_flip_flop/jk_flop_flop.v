module jk_flip_flop(j, k, clock, q, qn); 
    input j, k, clock; 
    output reg q, qn; 

    always@(posedge clock)
        begin 
            case({j, k})
                2'b00: begin 
                            q <= q;     
                            //qn <= qn;
                      end
                2'b01: begin 
                            q <= 1; 
                            //qn <= 0; 
                        end 
                2'b10: begin 
                            q <= 0; 
                            //qn <= 1; 
                        end 
                2'b11: begin 
                            q <= ~q; 
                            //qn <= ~qn; 
                        end
            endcase
		qn = ~q; 
        end  
endmodule   