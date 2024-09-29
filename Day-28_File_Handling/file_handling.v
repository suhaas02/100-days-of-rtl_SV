module file_handling(); 
    integer channel_1; 
    integer i; 
    reg [7:0] mem [7:0]; 
    initial 
        begin 
            $readmemb("data_in.txt", mem);

            channel_1 = $fopen("data_out.txt");
            for(i = 0; i < 8; i = i + 1)
                begin 
                    // $readmemb("data_in.txt", )
                    $fdisplay(channel_1, "mem[%0d] = %b", i, mem[i]); 
                end 
            $fclose(channel_1); 
        end 

endmodule 