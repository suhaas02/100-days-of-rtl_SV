//Buffer register is nothing but Parallel in Parallel out along with load and shift functionality

//if mode == 0 -> register shifts data by 1 bit; 
//if mode == 1 -> register acts like a buffer

module buffer_register(input mode, clock, din_temp, input [3:0] din, output reg [3:0] dout);
    always@(posedge clock)
        begin 
            if(mode == 0)
                dout <= {din_temp, din[3:1]};
            else if(mode == 1)
                dout <= din; 
        end 
endmodule 
