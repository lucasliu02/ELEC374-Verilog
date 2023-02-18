`timescale 1ns / 10ps
module shl_tb;
	reg [31:0] data_in;
	reg [31:0] num_shifts;
	wire [31:0] data_out;
	
	shl_32 shl_32_instance(data_in, num_shifts, data_out);
	
	initial
		begin
			data_in <= 32'hA7;
			num_shifts <= 3;
			
		end

endmodule