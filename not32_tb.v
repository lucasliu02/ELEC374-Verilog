`timescale 1ns/10ps
module not32_tb;
	reg clk, clr;
	reg R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in; // enables for general registers
	reg R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out; // selects for 32:5 enc
	reg HIin, LOin, Zhighin, Zlowin, PCin, MDRin, IRin, Yin, MARin;	// enables for special registers
	reg HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Cout; // selects for 32:5 enc
	reg [31:0] IRout, MARout; // data
	
	reg IncPC; // increment pc signal
	reg Read; // for mdmux
	reg [31:0] Mdatain/*, MDMux_out*/; // mdr unit data
	reg [4:0] ALUopcode;
	wire [63:0] RCout;
	
	parameter	Default = 4'b0000, Reg_load1a= 4'b0001, Reg_load1b= 4'b0010,
					Reg_load2a= 4'b0011, Reg_load2b = 4'b0100, Reg_load3a = 4'b0101,
					Reg_load3b = 4'b0110, T0= 4'b0111, T1= 4'b1000,T2= 4'b1001, T3= 4'b1010, T4= 4'b1011;
					
	reg	[3:0] Present_state = Default;
	
	initial clr = 0;
	
	datapath DUT(
		clk, clr,
		R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
		R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
		HIin, LOin, Zhighin, Zlowin, PCin, MDRin, IRin, Yin, MARin,
		HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Cout,
		IRout, /*Yout,*/ MARout,
		IncPC,
		Read,
		Mdatain, //MDMux_out,
		//BusMuxOut,
		ALUopcode,
		//BusSelect,
		RCout
	);
	
	initial
	begin
		clk = 0;
		forever #10 clk = ~clk;
	end
	
	always@(posedge clk)
	begin
		case(Present_state)
			Default			:	#40 Present_state = Reg_load1a;
			Reg_load1a		:	#40 Present_state = Reg_load1b;
			Reg_load1b		:	#40 Present_state = Reg_load2a;
			Reg_load2a		:	#40 Present_state = Reg_load2b;
			Reg_load2b		:	#40 Present_state = Reg_load3a;
			Reg_load3a		:	#40 Present_state = Reg_load3b;
			Reg_load3b		:	#40 Present_state = T0;
			T0					:	#40 Present_state = T1;
			T1					:	#40 Present_state = T2;
			T2					:	#40 Present_state = T3;
			T3					:	#40 Present_state = T4;
		endcase
	end
	
	always@(Present_state)
	begin
		case(Present_state)
			Default : begin			// initialize signals
				PCout <= 0; Zlowout <= 0; Zhighout <= 0; MDRout <= 0;
				R0out <= 0; R1out <= 0; MARin <= 0; Zhighin <= 0; Zlowin <= 0;
				PCin <= 0; MDRin <= 0; IRin <= 0; Yin <= 0;
				IncPC <= 0; Read <= 0; ALUopcode <= 0;
				R0in <= 0; R1in <= 0; Mdatain <= 32'h00000000;
			end
			
			Reg_load1a : begin
				Mdatain <= 32'h00000012;
				Read = 0; MDRin = 0;				// first zeroes for completeness
				#10 Read <= 1; MDRin <= 1;
				#15 Read <= 0; MDRin <= 0;
			end
			
			Reg_load1b : begin					// initialize R0 with the value $12
				#10 MDRout <= 1; R0in <= 1;
				#15 MDRout <= 0; R0in <= 0;
			end
			
			Reg_load2a : begin
				Mdatain <= 32'h00000014;
				#10 Read <= 1; MDRin <= 1;
				#15 Read <= 0; MDRin <= 0;
			end
			
			Reg_load2b : begin					// initialize R1 with the value $14
				#10 MDRout <= 1; R1in <= 1;
				#15 MDRout <= 0; R1in <= 0;
			end
			
			Reg_load3a : begin
				Mdatain <= 32'h00000018;
				#10 Read <= 1; MDRin <= 1;
				#15 Read <= 0; MDRin <= 0;
			end
			
/*			Reg_load3b : begin					// initialize R0 with the value $18
				#10 MDRout <= 1; R0in <= 1;
				#15 MDRout <= 0; R0in <= 0;
			end
			
			T0 : begin
				PCout <= 1; MARin <= 1; IncPC <= 1; Zhighin <= 1; Zlowin <= 1;
				#10 PCout <= 0; MARin <= 0; IncPC <= 0; Zhighin <= 0; Zlowin <= 0;
			end
*/			
			T1 : begin
				#10 Zlowout <= 1; PCin <= 1; Read <= 1; MDRin <= 1;
				Mdatain <= 32'h90080000;	// opcode for "not R0, R1"
				#15 Zlowout <= 0; PCin <= 0; Read <= 0; MDRin <= 0;
			end
			
			T2 : begin
				#10 MDRout <= 1; IRin <= 1;
				#15 MDRout <= 0; IRout <= 0;
			end
			
			T3 : begin
				#10 R1out <= 1; ALUopcode <= 5'b10010; Zhighin <= 1; Zlowin <= 1;
				#15 R1out <= 0; Zhighin <= 0; Zlowin <= 0;
			end
			
			T4 : begin
				#10 Zlowout <= 1; R0in <= 1;
				#15 Zlowout <= 0; R0in <= 0;
			end
		endcase
	end
endmodule
