// safe to delete?
module datapath_old(
	//input clk, clr,
	//output [31:0] busContents
	input [31:0] PCout, Zlow_out, R2out, R3out,
	input MDRselect,
	input MARen, Zlow_en, PCen, MDRen, IRen, Yen,
	input IncPC, Read,
	input [4:0] opcode,
	input [15:0] en,
	input clk, 
	input [31:0] Mdatain,
	input [31:0] MDRout, R1out,
	input [31:0] busContents
);
	
	wire clr;
	// registers
//	wire IncPC, PCen;
//	wire [15:0] en;
	wire /*IRen, Yen,*/ Zhigh_en, /*Zlow_en, MARen,*/ HIen, LOen;
	wire [31:0] R0out, /*R1out, R2out, R3out,*/ R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
	wire [31:0] /*PCout,*/ IRout, Yout, Zhigh_out, /*Zlow_out,*/ MARout, HIout, LOout;
	
	wire [63:0] Cout;
	
	// mdr unit
//	wire [31:0] Mdatain;
//	wire Read, MDRen;
	wire [31:0] MDMux_out;
//	wire [31:0] MDRout;
	
	// 32:1 mux
	wire [31:0] InPortout;
	wire [31:0] C_sign_extended;
	wire [4:0] select;
	
	// 32:5 encoder
	wire R0select, R1select, R2select, R3select, R4select, R5select, R6select, R7select, R8select, R9select, R10select, R11select, R12select, R13select, R14select, R15select;
	wire HIselect, LOselect, Zhigh_select, Zlow_select, PCselect, /*MDRselect,*/ InPort_select, Cout_select;
	
//	wire [4:0] opcode;

	reg32 R0(clk, clr, en[0], busContents, R0out);
	reg32 R1(clk, clr, en[1], busContents, R1out);
	reg32 R2(clk, clr, en[2], busContents, R2out);
	reg32 R3(clk, clr, en[3], busContents, R3out);
	reg32 R4(clk, clr, en[4], busContents, R4out);
	reg32 R5(clk, clr, en[5], busContents, R5out);
	reg32 R6(clk, clr, en[6], busContents, R6out);
	reg32 R7(clk, clr, en[7], busContents, R7out);
	reg32 R8(clk, clr, en[8], busContents, R8out);
	reg32 R9(clk, clr, en[9], busContents, R9out);
	reg32 R10(clk, clr, en[10], busContents, R10out);
	reg32 R11(clk, clr, en[11], busContents, R11out);
	reg32 R12(clk, clr, en[12], busContents, R12out);
	reg32 R13(clk, clr, en[13], busContents, R13out);
	reg32 R14(clk, clr, en[14], busContents, R14out);
	reg32 R15(clk, clr, en[15], busContents, R15out);
	
	incPC PC(clk, IncPC, PCen, busContents, PCout);
	reg32 IR(clk, clr, IRen, busContents, IRout);
	reg32 Y(clk, clr, Yen, busContents, Yout);
	reg32 Zhigh(clk, clr, Zhigh_en, Cout[63:32], Zhigh_out);
	reg32 Zlow(clk, clr, Zlow_en, Cout[31:0], Zlow_out);
	reg32 MAR(clk, clr, MARen, busContents, MARout);
	reg32 HI(clk, clr, HIen, busContents, HIout);
	reg32 LO(clk, clr, LOen, busContents, LOout);
	
	//mdr mdr_unit(busContents, Mdatain, Read, MDMux_out, clk, clr, MDRen, MDRout);
	
	mdmux mdmux_unit(busContents, Mdatain, Read, MDMux_out);
	reg32 mdr(clk, clr, MDRen, MDMux_out, MDRout);
	
	mux_32_to_1 mux32_1(
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
		Zhigh_out,
		Zlow_out,
		PCout,
		MDRout,
		InPortout,
		C_sign_extended,
		select,
		busContents
	);
	
	enc_32_to_5 enc32_5(
		R0select, 
		R1select, 
		R2select, 
		R3select, 
		R4select, 
		R5select, 
		R6select, 
		R7select, 
		R8select, 
		R9select, 
		R10select, 
		R11select, 
		R12select, 
		R13select, 
		R14select, 
		R15select,
		HIselect, 
		LOselect, 
		Zhigh_select, 
		Zlow_select, 
		PCselect, 
		MDRselect, 
		InPort_select, 
		Cout_select,
		select
	);
	
	/*alu the_alu(
		.clk(clk),
		.clr(clr),
		.IncPC(IncPC),
		.Ra(busContents),
		.Rb(busContents),
		.Ry(Yout),
		.opcode(opcode),
		.Rc(Cout)
	);*/

endmodule
	