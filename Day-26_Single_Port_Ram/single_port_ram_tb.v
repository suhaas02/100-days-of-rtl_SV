module single_port_ram_tb(); 
    reg [7:0] din; 
    reg [2:0] addr; 
    reg clock, rst, mode; 
    wire [7:0] dout;
    integer i; 
    single_port_ram DUT(din, addr, clock, rst, mode, dout);

    initial 
        begin 
            clock = 1'b0; 
            forever #5 clock = ~clock; 
        end 

    initial 
        begin 
            @(negedge clock) rst = 1'b1; 
            @(negedge clock) rst = 1'b0; 
            for(i = 0; i < 16; i = i + 1)
                begin 

                    @(negedge clock) {mode, addr} = i; 
                    if(mode == 0)
                        din = {$random} % 50; 
                end 
            #10 $finish; 
        end 
    
endmodule 