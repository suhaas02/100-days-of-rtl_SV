module parallel_adder_subtractor_tb(); 
    reg [3:0] a, b;
    reg cin_mode; 
    wire [3:0] sum; 
    wire cout; 

    parallel_adder_subtractor DUT(a, b, cin_mode, sum, cout);

    initial 
        begin 
            #5;
            a = 4'b1100; 
            b = 4'b0101; 
            cin_mode = 0; 

            #10; 
            cin_mode = 1; 

            #10; 
            a = 4'b0111; 
            b = 4'b1111; 
            cin_mode = 0; 

            #10; 
            cin_mode = 1; 
            #10; 
            $finish; 
        end
    initial $monitor("a = %b, b = %b, cin_mode = %b, sum = %b, cout = %b", a, b, cin_mode, sum, cout);
endmodule 