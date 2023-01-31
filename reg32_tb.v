`timescale 1ns/10ps
module reg32_tb;
	
	reg clk, clr, en;
	reg[31:0] d;
	wire[31:0] q;
	
	reg32 reg32_instance(clk, clr, en, d, q);
	
	initial
	begin
		clk = 0;
		clr <= 0;
		en <= 1;
		forever #20 clk = ~clk;
	end
	
	initial
	begin
		#10 d <= 32'h005C;	// d = q = 0b01011100
		#20 en <= 0;			// q will not be set to value of d
		#50 d <= 32'hFB02;	// d = 0b1111101100000010
		#50 clr <= 1;			// q = 0
	end
	
endmodule
			