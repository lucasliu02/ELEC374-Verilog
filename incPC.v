module incPC(
	input clk,
	input IncPC,
	input PCen,
	input [31:0] PCin,
	output reg [31:0] PCout
);

	always@(posedge clk)
	begin
		if(IncPC && PCen)
			PCout <= PCout + 1;
		else if(PCen)
			PCout <= PCin;
	end
endmodule
