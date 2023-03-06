module sub32(
	input [31:0] Ra, Rb,
	output [31:0] diff,
	output carry
);

	wire [31:0] Rb_neg = ~Rb + 1;
	add32 add32_instance(Ra, Rb_neg, {1'd0}, diff, carry);

endmodule
