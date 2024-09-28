module dual_port_ram_tb(); 
    reg [7:0] din; 
    reg [3:0] addr; 
    reg clock, rst, wr_enb, rd_enb; 
    wire [7:0] dout; 

    dual_port_ram DUT(din, addr, clock, wr_enb, rd_enb, rst, dout); 
    integer i; 
    initial 
        begin 
            clock = 0; 
            forever #5 clock = ~clock; 
        end 

    initial 
        begin 
            @(negedge clock) rst = 1'b1; 
            @(negedge clock) rst = 1'b0; 
            addr = 4'd0; 
            @(negedge clock) wr_enb = 1'b1; 
            for(i = 0; i < 16; i = i + 1)
                begin 
                    addr = addr + 1; 
                    @(negedge clock) din = {$random} % 50;
                end 
            @(negedge clock) wr_enb = 1'b0; 
            addr = 0; 
            @(negedge clock) rd_enb = 1'b1; 

            for(i = 0; i < 16; i = i + 1)
                begin 
                    @(negedge clock) addr = i;
                end 

            #20 $finish; 
        end 
endmodule 