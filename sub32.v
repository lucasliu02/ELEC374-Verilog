module sub32(
	input signed [31:0] a, b,
	output reg signed [31:0] z
);

	always@(*)
	begin
		z <= a - b;
	end

endmodule
