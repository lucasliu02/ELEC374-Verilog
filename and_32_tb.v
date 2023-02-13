`timescale 1ns / 10ps
module and_32_tb;
	reg [31:0] Ra;
	reg [31:0] Rb;
	wire [31:0] Rz;
	
	and_32 and_32_instance(Ra, Rb, Rz);
	
	initial
		begin
			Ra <= 2;
			Rb <= 3;
			
		end

endmodule