`timescale 1ns/10ps
module mdmux_tb;

	reg [31:0] BusMuxOut;
	reg [31:0] Mdatain;
	reg Read;
	wire [31:0] mdmux_out;
	
	mdmux mdmux_instance(
		BusMuxOut,
		Mdatain,
		Read,
		mdmux_out
	);
	
	initial
	begin
		BusMuxOut <= 32'h001B;
		Mdatain <= 32'hFFCA;
		Read <= 0;
	end
endmodule
