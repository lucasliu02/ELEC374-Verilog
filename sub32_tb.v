`timescale 1ns/10ps
module sub32_tb;
	reg signed [31:0] Ra, Rb;
	wire signed [31:0] diff;
	
	sub32 sub32_instance(Ra, Rb, diff);
	
	initial
	begin
		Ra <= 32'd52;
		Rb <= 32'd12;
		
		#50
		
		Ra <= 32'd52;
		Rb <= -32'd12;
		
		#50
		
		Ra <= -32'd52;
		Rb <= 32'd12;
		
		#50
		
		Ra <= -32'd52;
		Rb <= -32'd12;
	end
endmodule
