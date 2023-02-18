`timescale 1ns / 10ps
module rol_tb;
	reg [31:0] data_in;
	reg [31:0] num_rotates;
	wire [31:0] data_out;
	
	rol_32 rol_32_instance(data_in, num_rotates, data_out);
	
	initial
		begin
			data_in <= 32'hA7;
			num_rotates <= 3;
			
		end

endmodule