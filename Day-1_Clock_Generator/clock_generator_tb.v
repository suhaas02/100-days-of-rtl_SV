module clock_generator_tb();
    reg clock; 
    clock_generator DUT(clock);

  	  	
	// initial begin
  	// 	$dumpfile("dump.vcd");
    //   	$dumpvars(1);
  	// 	//#10000 
  	// 	//$finish;
	// end
    initial clock = 0;
    always #10 clock = ~clock;
            
       
  	initial #100 $finish; 
endmodule  
