module sub32(
	input signed [31:0] Ra, Rb,
	output reg signed [31:0] diff
);

	always@(*)
	begin
		diff <= Ra - Rb;
	end

endmodule
