module and32(
	input[31:0] Ra,
	input [31:0] Rb,
	output reg [31:0] Rz
);
	
	always@(Ra or Rb)
	begin
		Rz <= Ra & Rb;
	end
endmodule
