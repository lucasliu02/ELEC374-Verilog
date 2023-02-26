`timescale 1ns/10ps
module alu_tb;
	reg clk, clr, IncPC;
	reg [31:0] Ra, Rb, Ry;
	reg [4:0] opcode;
	wire [63:0] Rc;
	
	parameter ADD = 5'b00011, SUB = 5'b00100, AND = 5'b00101, OR = 5'b00110, SHR = 5'b00111, SHRA = 5'b01000, SHL = 5'b01001, ROR = 5'b01010, ROL = 5'b01011,
					MUL = 5'b01111, DIV = 5'b10000, NEG = 5'b10001, NOT = 5'b10010;
	
	alu alu_instance(clk, clr, IncPC, Ra, Rb, Ry, opcode, Rc);
	
	initial
	begin
		Ra <= 32'd15;
		Rb <= 32'd2;
		opcode <= ADD;
		#25 opcode <= SUB;
		#25 opcode <= AND;
		#25 opcode <= OR;
		#25 opcode <= SHR;
		#25 opcode <= SHRA;
		#25 opcode <= SHL;
		#25 opcode <= ROR;
		#25 opcode <= ROL;
		#25 opcode <= MUL;
		#25 opcode <= DIV;
		#25 opcode <= NEG;
		#25 opcode <= NOT;
	end
endmodule
