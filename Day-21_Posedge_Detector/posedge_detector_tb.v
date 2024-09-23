module posedge_detector_tb(); 
    reg clock, din; 
    wire y; 

    posedge_detector DUT(clock, din, y); 
    initial 
        begin 
            clock = 1'b0; 
            forever #5 clock = ~clock; 
        end 

    initial 
        begin 
            @(negedge clock) din = 1'b0;
            @(negedge clock) din = 1'b0;
            @(negedge clock) din = 1'b1;
            @(negedge clock) din = 1'b1;
            @(negedge clock) din = 1'b0;
            @(negedge clock) din = 1'b0; 
            @(negedge clock) din = 1'b0;
            @(negedge clock) din = 1'b1;
            @(negedge clock) din = 1'b0;
            @(negedge clock) $finish; 
        end 
endmodule 