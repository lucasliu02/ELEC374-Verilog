`timescale 1ns / 10ps
module not_tb;
	reg [31:0] Ra;
	wire [31:0] Rz;
	
	not_32 not_32_instance(Ra, Rz);
	
	initial
		begin
			Ra <= 2;
			
		end

endmodule