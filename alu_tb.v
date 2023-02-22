`timescale 1ns/10ps
module alu_tb;
	
	reg [31:0] A, B;
	reg [4:0] opcode;
	wire [31:0] Zhigh, Zlow;
	
	parameter ADD = 5'b00011, SUB = 5'b00100, AND = 5'b00101, OR = 5'b00110, SHR = 5'b00111,
					SHRA = 5'b01000, SHL = 5'b01001, ROR = 5'b01010, ROL = 5'b01011, ADDI = 5'b01100,
					ANDI = 5'b01101, ORI = 5'b01110, MUL = 5'b01111, DIV = 5'b10000, NEG = 5'b10001, NOT = 5'b10010;

	alu alu_instance(A, B, opcode, Zhigh, Zlow);

	initial
	begin
		opcode <= AND;
		A <= 32'hFB92;
		B <= 32'h268C;
		#50 opcode <= OR;
	end
endmodule
