`timescale 1ns / 10ps
module shra_tb;
	reg [31:0] data_in;
	reg [31:0] num_shifts;
	wire [31:0] data_out;
	
	shra_32 shra_32_instance(data_in, num_shifts, data_out);
	
	initial
		begin
			data_in <= 32'hA7;
			num_shifts <= 3;
			
		end

endmodule