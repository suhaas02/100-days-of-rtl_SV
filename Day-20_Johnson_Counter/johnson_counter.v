//d flip flop with preset and clear
module dff(input din, clock, preset, clear, output reg dout); 
    always@(posedge clock)
        begin 
            if(preset)
                dout <= 1'b1; 
            else if(clear)
                dout <= 1'b0;
            else
                dout <= din; 
        end 
    // assign qb = ~q; 
endmodule 

module johnson_counter #(parameter n = 4) (input clock, clear,input [n - 1:0]seq, output reg [n - 1 : 0]dout); 
    // wire w0; 
    // not a(w0, dout[0]);
	// assign w0 = ~dout[0]; 
    // dff d3(w0, clock, seq[3], clear, dout[3]);
    // dff d2(dout[3], clock, seq[2], clear, dout[2]); 
    // dff d1(dout[2], clock, seq[1], clear, dout[1]); 
    // dff d0(dout[1], clock, seq[0], clear, dout[0]); 
    reg temp; 
    always@(posedge clock)
        begin 
            
            /*if(clear)
                dout <= 4'd0; 
            temp <= ~dout[0]; 
            if(seq != 4'd0)
                dout <= seq; 
            dout <= {temp, dout[3:1]}; 
        end*/
		  if(clear)
				dout <= 4'd0;
			else if(seq)
					dout <= seq;
				else
						dout<= {~dout[0],dout[3:1]};
				end
endmodule 