`timescale 1ns / 10ps
module neg_tb;
	reg [31:0] Ra;
	wire [31:0] Rz;
	
	neg_32 neg_32_instance(Ra, Rz);
	
	initial
		begin
			Ra <= 2;
			
		end

endmodule