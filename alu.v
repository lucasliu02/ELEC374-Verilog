module alu(
	input clk, clr, IncPC,
	input [31:0] Ra, Rb, Ry,
	input [4:0] opcode,
	output reg [63:0] Rc
);

	parameter ADD = 5'b00011, SUB = 5'b00100, AND = 5'b00101, OR = 5'b00110, SHR = 5'b00111, SHRA = 5'b01000, SHL = 5'b01001, ROR = 5'b01010, ROL = 5'b01011,
					MUL = 5'b01111, DIV = 5'b10000, NEG = 5'b10001, NOT = 5'b10010;
	
	wire [31:0] add_s, add_c, sub_d, sub_c, and_out, or_out, shr_out, shra_out, shl_out, ror_out, rol_out, neg_out, not_out;
	wire [63:0] mul_out, div_out;
	
	add_32 add32_instance(Ra, Rb, {1'd0}, add_s, add_c);
	sub32 sub32_instance(Ra, Rb, sub_d);
	and_32 and32_instance(Ra, Rb, and_out);
	or_32 or32_instance(Ra, Rb, or_out);
	shr_32 shr32_instance(Ra, Rb, shr_out);
	shra_32 shra32_instance(Ra, Rb, shra_out);
	shl_32 shl32_instance(Ra, Rb, shl_out);
	ror_32 ror32_instance(Ra, Rb, ror_out);
	rol_32 rol32_instance(Ra, Rb, rol_out);
	mul32 mul32_instance(Ra, Rb, mul_out);
	div32 div32_instance(Ra, Rb, div_out);
	neg_32 neg32_instance(Ra, neg_out);
	not_32 not32_instance(Ra, not_out);
	
	always@(*)
	begin
		case(opcode)
			ADD : begin
				Rc[31:0] <= add_s[31:0];
				Rc[63:32] <= 32'b0;
			end
			
			SUB : begin
				Rc[31:0] <= sub_d[31:0];
				Rc[63:32] <= 32'b0;
			end
			
			AND : begin
				Rc[31:0] <= and_out[31:0];
				Rc[63:0] <= 32'b0;
			end
			
			OR : begin
				Rc[31:0] <= or_out[31:0];
				Rc[63:0] <= 32'b0;
			end
			
			SHR : begin
				Rc[31:0] <= shr_out[31:0];
				Rc[63:32] <= 32'b0;
			end
			
			SHRA : begin
				Rc[31:0] <= shra_out[31:0];
				Rc[63:32] <= 32'b0;
			end
			
			SHL : begin
				Rc[31:0] <= shl_out[31:0];
				Rc[63:32] <= 32'b0;
			end
			
			ROR : begin
				Rc[31:0] <= ror_out[31:0];
				Rc[63:32] <= 32'b0;
			end
			
			ROL : begin
				Rc[31:0] <= rol_out[31:0];
				Rc[63:32] <= 32'b0;
			end
			
			MUL : begin
				Rc <= mul_out;
			end
			
			DIV : begin
				Rc <= div_out;
			end
			
			NEG : begin
				Rc[31:0] <= neg_out[31:0];
				Rc[63:32] <= 32'b0;
			end
			
			NOT : begin
				Rc[31:0] <= not_out[31:0];
				Rc[63:32] <= 32'b0;
			end
			
		endcase
	end
	
endmodule
