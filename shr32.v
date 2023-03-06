module shr32(
	input wire [31:0] data_in,
	input wire [31:0] num_shifts,
	output wire [31:0] data_out
);
	assign data_out[31:0] = data_in >> num_shifts;
	
endmodule
