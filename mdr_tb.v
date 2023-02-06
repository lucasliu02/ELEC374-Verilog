`timescale 1ns/10ps
module mdr_tb;
	// mdmux
	reg [31:0] BusMuxOut;
	reg [31:0] Mdatain;
	reg Read;
	wire [31:0] mdmux_out;
	// mdr
	reg clk;
	reg clr;
	reg en;
	wire [31:0] q;
	
	mdr mdr_unit_instance(
		BusMuxOut,
		Mdatain,
		Read,
		mdmux_out,
		clk,
		clr,
		en,
		q
	);
	
	initial
	begin
		clk = 0;
		clr <= 0;
		en <= 1;
		BusMuxOut <= 32'h001B;
		Mdatain <= 32'hFFCA;
		Read <= 0;
		forever #20 clk = ~clk;
	end
	
	initial
	begin
		#50 BusMuxOut <= 32'h0011;
		#50 BusMuxOut <= 32'h001C;
		#50 BusMuxOut <= 32'h020D;
		#50 Read <= 1;
	end
	
endmodule