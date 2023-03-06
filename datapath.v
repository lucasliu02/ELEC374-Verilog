module datapath(
	input clk, clr,
	input R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, // enables for general registers
	input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, // selects for 32:5 enc
	input HIin, LOin, Zhighin, Zlowin, PCin, MDRin, IRin, Yin, MARin,	// enables for special registers
	input HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Cout, // selects for 32:5 enc
	input [31:0] IRout, MARout, // data
	
	input IncPC, // increment pc signal
	input Read, // select Mdatain or BusMuxIn for MDMux
	input [31:0] Mdatain, // mdr unit input from memory chip (simulated in Phase 1)
	input [4:0] ALUopcode,
	
	output [63:0] RCout
);
	wire [4:0] BusSelect;
	wire [31:0] MDMux_out;
	wire [31:0] BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3, BusMuxIn_R4, BusMuxIn_R5, BusMuxIn_R6, BusMuxIn_R7;
	wire [31:0] BusMuxIn_R8, BusMuxIn_R9, BusMuxIn_R10, BusMuxIn_R11, BusMuxIn_R12, BusMuxIn_R13, BusMuxIn_R14, BusMuxIn_R15;
	wire [31:0]	BusMuxIn_PC, BusMuxIn_Zhigh, BusMuxIn_Zlow, BusMuxIn_HI, BusMuxIn_LO, BusMuxIn_MDR, BusMuxIn_InPort, BusMuxIn_C;
	wire [31:0] Yout, BusMuxOut;
	
	// general purpose registers
	reg32 R0(clk, clr, R0in, BusMuxOut, BusMuxIn_R0);
	reg32 R1(clk, clr, R1in, BusMuxOut, BusMuxIn_R1);
	reg32 R2(clk, clr, R2in, BusMuxOut, BusMuxIn_R2);
	reg32 R3(clk, clr, R3in, BusMuxOut, BusMuxIn_R3);
	reg32 R4(clk, clr, R4in, BusMuxOut, BusMuxIn_R4);
	reg32 R5(clk, clr, R5in, BusMuxOut, BusMuxIn_R5);
	reg32 R6(clk, clr, R6in, BusMuxOut, BusMuxIn_R6);
	reg32 R7(clk, clr, R7in, BusMuxOut, BusMuxIn_R7);
	reg32 R8(clk, clr, R8in, BusMuxOut, BusMuxIn_R8);
	reg32 R9(clk, clr, R9in, BusMuxOut, BusMuxIn_R9);
	reg32 R10(clk, clr, R10in, BusMuxOut, BusMuxIn_R10);
	reg32 R11(clk, clr, R11in, BusMuxOut, BusMuxIn_R11);
	reg32 R12(clk, clr, R12in, BusMuxOut, BusMuxIn_R12);
	reg32 R13(clk, clr, R13in, BusMuxOut, BusMuxIn_R13);
	reg32 R14(clk, clr, R14in, BusMuxOut, BusMuxIn_R14);
	reg32 R15(clk, clr, R15in, BusMuxOut, BusMuxIn_R15);
	
	// special registers
	incPC PC(clk, IncPC, PCin, BusMuxOut, BusMuxIn_PC);
	reg32 IR(clk, clr, IRin, BusMuxOut, IRout);
	reg32 Y(clk, clr, Yin, BusMuxOut, Yout);
	reg32 Zhigh(clk, clr, Zhighin, RCout[63:32], BusMuxIn_Zhigh);
	reg32 Zlow(clk, clr, Zlowin, RCout[31:0], BusMuxIn_Zlow);
	reg32 MAR(clk, clr, MARin, BusMuxOut, MARout);
	reg32 HI(clk, clr, HIin, BusMuxOut, BusMuxIn_HI);
	reg32 LO(clk, clr, LOin, BusMuxOut, BusMuxIn_LO);
	
	// mdr unit
	mdmux mdmux_unit(BusMuxOut, Mdatain, Read, MDMux_out);
	reg32 mdr(clk, clr, MDRin, MDMux_out, BusMuxIn_MDR);
	
	// 32:1 mux (bus)
	mux_32_to_1 mux32_1(
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
		BusMuxIn_InPort,
		BusMuxIn_C,
		BusSelect,
		BusMuxOut
	);
	
	// 32:5 enc (bus)
	enc_32_to_5 enc32_5(
		R0out,
		R1out,
		R2out,
		R3out,
		R4out,
		R5out,
		R6out,
		R7out,
		R8out,
		R9out,
		R10out,
		R11out,
		R12out,
		R13out,
		R14out,
		R15out,
		HIout,
		LOout,
		Zhighout,
		Zlowout,
		PCout,
		MDRout,
		InPortout,
		Cout,
		BusSelect
	);
	
	// alu
	alu alu_unit(
		.Ra(Yout),
		.Rb(BusMuxOut),
		.opcode(ALUopcode),
		.Rc(RCout)
	);
	
endmodule
