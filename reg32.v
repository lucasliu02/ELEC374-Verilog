module reg32(
	input clk,
	input clr,	// using active high
	input en,
	input [31:0] d,
	output reg [31:0] q
);

	always@(posedge clk)
	begin
		if(clr)
			q = 32'b0;
		else if(en)
			q = d;
	end
endmodule
