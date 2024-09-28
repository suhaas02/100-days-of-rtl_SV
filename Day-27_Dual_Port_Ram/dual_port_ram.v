//synchronous dual port ram 
module dual_port_ram(input [7:0] din, 
                     input [3:0] addr,
                     input clock,  
                     input wr_enb, rd_enb, rst, 
                     output reg [7:0] dout); 
    reg [7:0] mem[15:0]; 
    integer i; 
    always@(posedge clock)
        begin 
            if(rst)
                begin 
                    for(i = 0; i <= 15; i = i + 1)
                        begin 
                            mem[i] <= 8'd0; 
                        end 
                end 
            else if(wr_enb == 1)
                mem[addr] <= din; 
            else
                mem[addr] <= mem[addr];
        end

    always@(posedge clock)
        begin 
            if(rst)
                dout <= 4'd0; 
            else if(rd_enb == 1)
                dout <= mem[addr]; 
            else
                dout <= dout;
        end
endmodule 