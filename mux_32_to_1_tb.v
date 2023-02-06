// untested due to IO error in 32:1 mux

`timescale 1ns/10ps
module mux_32_to_1_tb;
	
	reg [31:0] BusMuxIn_R0;
	reg [31:0] BusMuxIn_R1;
	reg [31:0] BusMuxIn_R2;
	reg [31:0] BusMuxIn_R3;
	reg [31:0] BusMuxIn_R4;
	reg [31:0] BusMuxIn_R5;
	reg [31:0] BusMuxIn_R6;
	reg [31:0] BusMuxIn_R7;
	reg [31:0] BusMuxIn_R8;
	reg [31:0] BusMuxIn_R9;
	reg [31:0] BusMuxIn_R10;
	reg [31:0] BusMuxIn_R11;
	reg [31:0] BusMuxIn_R12;
	reg [31:0] BusMuxIn_R13;
	reg [31:0] BusMuxIn_R14;
	reg [31:0] BusMuxIn_R15;
	reg [31:0] BusMuxIn_HI;
	reg [31:0] BusMuxIn_LO;
	reg [31:0] BusMuxIn_Zhigh;
	reg [31:0] BusMuxIn_Zlow;
	reg [31:0] BusMuxIn_PC;
	reg [31:0] BusMuxIn_MDR;
	reg [31:0] BusMuxIn_In_Port;
	reg [31:0] C_sign_extended;
	
	reg [4:0] select;
	wire [31:0] BusMuxOut;
	
	mux_32_to_1 mux_32_to_1_instance(
		BusMuxIn_R0,
		BusMuxIn_R1,
		BusMuxIn_R2,
		BusMuxIn_R3,
		BusMuxIn_R4,
		BusMuxIn_R5,
		BusMuxIn_R6,
		BusMuxIn_R7,
		BusMuxIn_R8,
		BusMuxIn_R9,
		BusMuxIn_R10,
		BusMuxIn_R11,
		BusMuxIn_R12,
		BusMuxIn_R13,
		BusMuxIn_R14,
		BusMuxIn_R15,
		BusMuxIn_HI,
		BusMuxIn_LO,
		BusMuxIn_Zhigh,
		BusMuxIn_Zlow,
		BusMuxIn_PC,
		BusMuxIn_MDR,
		BusMuxIn_In_Port,
		C_sign_extended,
		select,
		BusMuxOut
	);
	
	initial
	begin
		BusMuxIn_R0 <= 32'h0;
		BusMuxIn_R3 <= 32'h8;
		BusMuxIn_HI <= 32'h10000;
		BusMuxIn_In_Port <= 32'h400000;
		#50 select <= 5'd3;	// R3
		#50 select <= 5'd0;	// R0
		#50 select <= 5'd22;	// In.Port
		#50 select <= 5'd16;	// HI
	end	
endmodule
