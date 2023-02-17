`timescale 1ns / 10ps
module shr_tb;
	reg [31:0] data_in;
	reg [31:0] num_shifts;
	wire [31:0] data_out;
	
	shr_32 shr_32_instance(data_in, num_shifts, data_out);
	
	initial
		begin
			data_in <= 100;
			num_shifts <= 3;
			
		end

endmodule