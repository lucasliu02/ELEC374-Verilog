module div32(
	input signed [31:0] dividend,
	input signed [31:0] divisor,
	output reg [63:0] z
);
	reg signed [31:0] quotient;
	reg signed [31:0] remainder;

	always@(*)
	begin
		remainder = dividend % divisor;
		quotient = (dividend - remainder) / divisor;
		if(remainder < 0) remainder = ~remainder + 1;
		z = {remainder, quotient};		// store remainder in high 32 bits, quotient in low 32 bits
	end
endmodule
