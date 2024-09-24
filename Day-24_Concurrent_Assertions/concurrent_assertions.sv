module concurrent_assertions;
    bit a, b; 
    bit clock; 

    always #10 clock = ~clock; 

    initial 
        begin 
            for(int i = 0; i < 15; i++)
                begin 
                    @(posedge clock); 
                    a <= $urandom; 
                    b <= $urandom; 
                end 
        end 

    assert property (@(posedge clock) !(a && b)); 

    initial 
        begin 
            $dumpfile("dump.vcd"); 
            $dumpvars; 
        end 
endmodule 