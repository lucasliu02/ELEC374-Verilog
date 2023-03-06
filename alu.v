module alu(
	input [31:0] Ra, Rb,
	input [4:0] opcode,
	output reg [63:0] Rc
);

	parameter ADD = 5'b00011, SUB = 5'b00100, AND = 5'b00101, OR = 5'b00110, SHR = 5'b00111, SHRA = 5'b01000, SHL = 5'b01001, ROR = 5'b01010, ROL = 5'b01011,
					MUL = 5'b01111, DIV = 5'b10000, NEG = 5'b10001, NOT = 5'b10010;
	
	wire [31:0] add_s, sub_d, and_out, or_out, shr_out, shra_out, shl_out, ror_out, rol_out, neg_out, not_out;
	wire add_c, sub_c;
	wire [63:0] mul_out, div_out;
	
	add32 add32_instance(Ra, Rb, {1'd0}, add_s, add_c);
	sub32 sub32_instance(Ra, Rb, sub_d, sub_c);
	and32 and32_instance(Ra, Rb, and_out);
	or32 or32_instance(Ra, Rb, or_out);
	shr32 shr32_instance(Ra, Rb, shr_out);
	shra32 shra32_instance(Ra, Rb, shra_out);
	shl32 shl32_instance(Ra, Rb, shl_out);
	ror32 ror32_instance(Ra, Rb[4:0], ror_out);
	rol32 rol32_instance(Ra, Rb[4:0], rol_out);
	mul32 mul32_instance(Ra, Rb, mul_out);
	div32 div32_instance(Ra, Rb, div_out);
	neg32 neg32_instance(Rb, neg_out);
	not32 not32_instance(Rb, not_out);
	
	always@(*)
	begin
		case(opcode)
			ADD : begin
				Rc[31:0] <= add_s[31:0];
				//Rc[63:32] <= 32'b0;
				Rc[63:32] <= {31'b0, add_c};
			end
			
			SUB : begin
				Rc[31:0] <= sub_d[31:0];
				Rc[63:32] <= {31'b0, sub_c};
			end
			
			AND : begin
				Rc[31:0] <= and_out[31:0];
				Rc[63:32] <= 32'b0;
			end
			
			OR : begin
				Rc[31:0] <= or_out[31:0];
				Rc[63:32] <= 32'b0;
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
			
			default : begin
				Rc <= 64'b0;
			end
		endcase
	end
endmodule
