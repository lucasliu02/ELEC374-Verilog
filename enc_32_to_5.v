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
	end
endmodule
