`timescale 1ns/10ps
module enc_32_to_5_tb;

	// simulate input signals in phase 1
	// generate input signals in phase 2 and 3
	reg R0out;
	reg R1out;
	reg R2out;
	reg R3out;
	reg R4out;
	reg R5out;
	reg R6out;
	reg R7out;
	reg R8out;
	reg R9out;
	reg R10out;
	reg R11out;
	reg R12out;
	reg R13out;
	reg R14out;
	reg R15out;
	reg HIout;
	reg LOout;
	reg Zhighout;
	reg Zlowout;
	reg PCout;
	reg MDRout;
	reg In_Portout;
	reg Cout;
	wire [4:0] select;
	
	enc_32_to_5 enc_32_to_5_instance(
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
		In_Portout,
		Cout,
		select
	);
	
	initial
	begin
		R15out <= 1;			// select <= 5'd15	(0b01111)
		# 50 HIout <= 1;		// HIout has higher priority
		# 50 R15out <= 0;		// select <= 5'd16	(0b10000)
		# 50 HIout <= 0;		// select <= 5'd31	(0b11111)
		# 50 R1out <= 1;		// select <= 5'd1		(0b00001)
		
		// signal <= 32'hFFFFFF;
		// #50 signal <= 32'h100000;
		// #50 signal <= 32'h000001;
	end
endmodule
