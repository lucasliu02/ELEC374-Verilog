`timescale 1ns/10ps
module mul32_tb;

	reg signed [31:0] m, q;
	wire signed [63:0] p;
	
	mul32 mul32_instance(m, q, p);
	
	initial
	begin
		m <= 32'd13;
		q <= 32'd6;
		// p = 78
		
		#50
		
		m <= 32'd13;
		q <= -32'd6;
		// p = -78
		
		#50
		
		m <= 32'hFA26; // 64038
		q <= 32'h02BC;	// 700
		// p = 44826600
	end
endmodule
