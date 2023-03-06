module neg32(
	input wire [31:0] Rb,
	output wire [31:0] Rz
	);
	
	assign Rz = ~Rb + 1;
	
endmodule
