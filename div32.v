module div32(
	input [31:0] dividend, divisor,
	output reg [63:0] z
);
	
	reg [64:0] AQ;
	integer i;
	
	always@(*)
	begin
		AQ[64:0] = {33'b0, dividend[31:0]};
		
		for(i = 0; i < 32; i = i+1)
		begin
			AQ = AQ << 1;
			// if A >= 0, A-M, else A+M
			if(AQ[64] == 0)
				AQ[64:32] = AQ[64:32] - divisor;
			else
				AQ[64:32] = AQ[64:32] + divisor;
			
			// set q0 (0 if A < 0, 1 if A > 0)
			if(AQ[64] == 0)
				AQ[0] = 1;
			else
				AQ[0] = 0;
		end
		
		if(AQ[64] == 1)
			AQ[64:32] = AQ[64:32] + divisor;
		
		z = AQ[63:0];
	end
	
	
endmodule
