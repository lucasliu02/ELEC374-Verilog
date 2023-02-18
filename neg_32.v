`timescale 1ns / 1ps

module neg_32(
	input wire [31:0] Ra,
	output wire [31:0] Rz
	);
	
	wire [31:0] temp; 
	wire cout;
	not_32 not_op(Ra,temp);
	add_32 add_op(temp, 32'd1, 1'd0, Rz, cout);
	
endmodule