module single_port_ram(input [7:0] din, 
                       input [2:0] addr, 
                       input clock, 
                       input rst, 
                       input mode, 
                       output reg [7:0] dout);
    reg [7:0] mem[7:0]; 
    integer i; 
    //mode == 0 -> write operation; 
    //mode == 1 -> read operation 
    always@(posedge clock)
        begin 
            if(rst)
                begin 
                    for(i = 0; i < 8; i = i + 1)
                        begin 
                            mem[i] <= 8'd0; 
                        end
                end 
            else if(mode)
                dout <= mem[addr]; 
            else if(mode == 0)
                mem[addr] <= din;
        end 
endmodule 