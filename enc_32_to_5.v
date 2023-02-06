module enc_32_to_5(
	input R0out,
	input R1out,
	input R2out,
	input R3out,
	input R4out,
	input R5out,
	input R6out,
	input R7out,
	input R8out,
	input R9out,
	input R10out,
	input R11out,
	input R12out,
	input R13out,
	input R14out,
	input R15out,
	input HIout,
	input LOout,
	input Zhighout,
	input Zlowout,
	input PCout,
	input MDRout,
	input In_Portout,
	input Cout,
	output reg [4:0] select
);

// by TA suggestion:
// change signal to individual 1-bit signals
// i.e.
	// input R0out,
	// input R1out,
	// ...
	// input Cout
// and change to priority encoder (multiple signals may be high at once)
//----------------- but what should the priority be? ------------------------

	always@(*)
	begin
		if(R0out) select <= 5'd0; else
		if(R1out) select <= 5'd1; else
		if(R2out) select <= 5'd2; else
		if(R3out) select <= 5'd3; else
		if(R4out) select <= 5'd4; else
		if(R5out) select <= 5'd5; else
		if(R6out) select <= 5'd6; else
		if(R7out) select <= 5'd7; else
		if(R8out) select <= 5'd8; else
		if(R9out) select <= 5'd9; else
		if(R10out) select <= 5'd10; else
		if(R11out) select <= 5'd11; else
		if(R12out) select <= 5'd12; else
		if(R13out) select <= 5'd13; else
		if(R14out) select <= 5'd14; else
		if(R15out) select <= 5'd15; else
		if(HIout) select <= 5'd16; else
		if(LOout) select <= 5'd17; else
		if(Zhighout) select <= 5'd18; else
		if(Zlowout) select <= 5'd19; else
		if(PCout) select <= 5'd20; else
		if(MDRout) select <= 5'd21; else
		if(In_Portout) select <= 5'd22; else
		if(Cout) select <= 5'd23; else
		select <= 5'd31;
	
//		case(signal)
//			32'h000001 : select <= 5'd0;		// R0out
//			32'h000002 : select <= 5'd1;		// R1out
//			32'h000004 : select <= 5'd2;		// R2out
//			32'h000008 : select <= 5'd3;		// R3out
//			32'h000010 : select <= 5'd4;		// R4out
//			32'h000020 : select <= 5'd5;		// R5out
//			32'h000040 : select <= 5'd6;		// R6out
//			32'h000080 : select <= 5'd7;		// R7out
//			32'h000100 : select <= 5'd8;		// R8out
//			32'h000200 : select <= 5'd9;		// R9out
//			32'h000400 : select <= 5'd10;		// R10out
//			32'h000800 : select <= 5'd11;		// R11out
//			32'h001000 : select <= 5'd12;		// R12out
//			32'h002000 : select <= 5'd13;		// R13out
//			32'h004000 : select <= 5'd14;		// R14out
//			32'h008000 : select <= 5'd15;		// R15out
//			32'h010000 : select <= 5'd16;		// HIout
//			32'h020000 : select <= 5'd17;		// LOout
//			32'h040000 : select <= 5'd18;		// Zhighout
//			32'h080000 : select <= 5'd19;		// Zlowout
//			32'h100000 : select <= 5'd20;		// PCout
//			32'h200000 : select <= 5'd21;		// MDRout
//			32'h400000 : select <= 5'd22;		// In.Portout
//			32'h800000 : select <= 5'd23;		// Cout
//			default : select <= 5'd31;
//		endcase
	end
endmodule
