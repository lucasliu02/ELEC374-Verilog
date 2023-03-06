module neg32(
	input wire [31:0] Rb,
	output wire [31:0] Rz
	);
	
	/*wire [31:0] temp; 
	wire cout;
	not32 not_op(Ra,temp);
	add32 add_op(temp, 32'd1, 1'd0, Rz, cout);*/
	
	assign Rz = ~Rb + 1;
	
endmodule
