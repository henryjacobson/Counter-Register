module counter3(input clock, input clear, input inc, output[31:0] value);
	reg[31:0] value;
	
	always @(negedge clock, posedge clear)
	begin
		if(clear)
			value = 0;
		else if(inc)
			value = value + 3;
	end
endmodule

module testCounter();
	reg clock, clear, inc;
	wire[31:0] value;
	counter3 counter(clock, clear, inc, value);
	
	initial begin
		$monitor("%d clock = %b, clear = %b, inc = %b, value = %d",
			$time, clock, clear, inc, value);
		#10 clock = 0; clear = 1; inc = 0;
		#10 clock = 1; clear = 0; inc = 1;
		#10 clock = 0; clear = 0; inc = 1;
		#10 clock = 1; clear = 0; inc = 1;
		#10 clock = 0; clear = 0; inc = 1;
		#10 clock = 1; clear = 0; inc = 1;
		#10 clock = 0; clear = 0; inc = 1;
		#10 clock = 0; clear = 1; inc = 0;
		#10 clock = 1; clear = 0; inc = 0;
		#10 clock = 0; clear = 0; inc = 0;
		#10 clock = 1; clear = 0; inc = 0;
		#10 clock = 0; clear = 0; inc = 0;
		#10 clock = 0; clear = 1; inc = 0;
		#10 $finish;
	end
endmodule