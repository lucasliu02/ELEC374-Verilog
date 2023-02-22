`timescale 1ns/10ps
module sub32_tb;
	reg signed [31:0] a, b;
	wire signed [31:0] z;
	
	sub32 sub32_instance(a, b, z);
	
	initial
	begin
		a <= 32'd52;
		b <= 32'd12;
		
		#50
		
		a <= 32'd52;
		b <= -32'd12;
		
		#50
		
		a <= -32'd52;
		b <= 32'd12;
		
		#50
		
		a <= -32'd52;
		b <= -32'd12;
	end
endmodule
