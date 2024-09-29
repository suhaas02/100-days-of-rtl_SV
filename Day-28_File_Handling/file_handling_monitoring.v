module file_handling_monitoring(); 
    integer channel_1; 
    reg [2:0]a; 
	 reg [2:0]b; 
    initial 
        begin 
            repeat(10) begin 
                {a, b} = {$random} % 200;
                #5; 
            end  
        end 

    initial 
        begin 
            channel_1 = $fopen("fileout.txt");
				repeat(10) begin 
            $fmonitor(channel_1, $time, "a = %0b, b = %0b", a, b); 
            #5; 
                end 
            $fclose(channel_1); 
            #80 $finish; 
        end 
endmodule 