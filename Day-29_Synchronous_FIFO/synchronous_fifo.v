module synchronous_fifo(input clock, rst, mode, input [7:0] din, output reg [7:0] dout, output full, empty); 
    reg [7:0] mem[15:0]; 
    integer i; 
    reg [3:0] wr_ptr; 
    reg [3:0] rd_ptr; 
    //mode = 0 -> write operation 
    //mode = 1 -> read operation 
    assign full = (wr_ptr == 4'd15 && rd_ptr == 1'b0) ? 1'b1 : 1'd0; 
    assign empty = (wr_ptr == rd_ptr) ? 1'b1 : 1'b0; 
    always@(posedge clock)
        begin 
            if(rst) begin 
                for(i = 0; i < 16; i = i + 1)
                    mem[i] <= 8'd0; 
                wr_ptr <= 0; 
            end 
            else if(mode == 0 && !full) begin 
                mem[wr_ptr] <= din; 
                wr_ptr <= wr_ptr + 1'b1; 
            end 
            else
                wr_ptr <= wr_ptr; 

        end 

    always@(posedge clock)
        begin 
            if(rst) begin 
                dout <= 8'd0; 
                rd_ptr <= 0; 
            end 
            else if(mode && !empty) begin 
                dout <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 1'b1; 
            end 
            else
                rd_ptr <= rd_ptr; 

        end 
endmodule 