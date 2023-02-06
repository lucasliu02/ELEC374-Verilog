module mdr(
	// mdmux
	input [31:0] BusMuxOut,
	input [31:0] Mdatain,
	input Read,
	output [31:0] MDMux_out,
	
	// mdr
	input clk,
	input clr,	// using active high
	input en,
	// input d = MDMux_out
	output [31:0] q
);
	mdmux mdmux_instance(
		BusMuxOut,
		Mdatain,
		Read,
		MDMux_out
	);
	
	reg32 mdr_instance(
		clk,
		clr,
		en,
		MDMux_out,
		q
	);

endmodule
