`timescale 1ns/10ps
module div32_tb;
	reg signed [31:0] dividend, divisor;
	wire [63:0] z;
	
	div32 div32_instance(dividend, divisor, z);
	
	initial
	begin
		dividend <= 32'd50;
		divisor <= 32'd25;
		// remainder = 0
		// quotient = 2 = 0x0010
		
		#50
		
		dividend <= 32'd429;
		divisor <= 32'd26;
		// remainder = 13 = 0x00001101
		// quotient = 16 = 0x00010000
		
		#50
		
		dividend <= -32'd429;
		divisor <= 32'd26;
		// remainder = 13 = 0x1101
		// quotient = -16 = 0x11110000
		
		#50
		
		dividend <= 32'd50;
		divisor <= -32'd24;
		// remainder = 2 = 0x0010
		// quotient = -2 = 0x1110
	end
endmodule
