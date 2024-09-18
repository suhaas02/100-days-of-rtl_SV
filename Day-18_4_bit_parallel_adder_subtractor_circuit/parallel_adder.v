//we can make a adder and subtractor circuit through full adder; 
module full_adder(input a, b, cin, output cout, sum); 
    assign sum = a ^ b ^ cin; 
    assign cout = a & b + b & cin + cin & a;
endmodule 
module parallel_adder_subtractor(input [3:0] a, b, input cin_mode, output [3:0] sum, output cout); 
    //if mode == 0 -> sum = a + b + 0; 
    //if mode == 1 -> sum = a - b = a + 1's comp(b) + 1;
    wire [3:0] bxor; 
    wire w1, w2, w3; 
    //assign cin = (mode) ? 1'b1 : 1'b0; 
    assign bxor[0] = b[0] ^ cin_mode; 
    assign bxor[1] = b[1] ^ cin_mode;
    assign bxor[2] = b[2] ^ cin_mode;
    assign bxor[3] = b[3] ^ cin_mode;

    full_adder fa0(a[0], bxor[0], cin_mode, w1, sum[0]);
    full_adder fa1(a[1], bxor[1], w1, w2, sum[1]); 
    full_adder fa2(a[2], bxor[2], w2, w3, sum[2]); 
    full_adder fa3(a[3], bxor[3], w3, cout, sum[3]); 
endmodule 