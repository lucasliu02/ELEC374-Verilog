module mdmux(
	input [31:0] BusMuxOut,
	input [31:0] Mdatain,
	input Read,
	output reg [31:0] MDMux_out
);

	always@(*)
	begin
		if(Read)
			MDMux_out <= Mdatain;
		else
			MDMux_out <= BusMuxOut;
	end
endmodule
