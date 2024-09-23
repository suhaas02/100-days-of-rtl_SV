module top; 
    bit clock, a, b; 

    initial 
        begin 
            forever #5 clock = ~clock; 
        end 
    
    initial 
        begin 
            a = 1'b1; 
            b= 0; 
            a = 0; 
            #5 a = 1; 
            #5 b = 1; 
          	#5;
            #5 a = 0; 
            #5 b = 0; 
            #10 $finish; 
        end 

  always@(posedge clock) begin 
        assert(a & b); 
  end
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule     