`timescale 1ns / 10ps
module ror_tb;
	reg [31:0] data_in;
	reg [31:0] num_rotates;
	wire [31:0] data_out;
	
	ror_32 ror_32_instance(data_in, num_rotates, data_out);
	
	initial
		begin
			data_in <= 32'hA7;
			num_rotates <= 3;
			
		end

endmodule