module sipo(input din, clock, output reg [n - 1:0] qout);
    parameter n = 4; 
    always@(posedge clock)
        begin 
            qout <= {din, qout[n - 1:1]}; 
        end 
endmodule 