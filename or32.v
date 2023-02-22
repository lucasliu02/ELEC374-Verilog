module or32(
	input [31:0] A, B,
	output [31:0] Z
);

	assign Z = A | B;

endmodule
