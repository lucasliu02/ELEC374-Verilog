module mul32(
	input signed [31:0] m,			// multiplicant
	input signed [31:0] q,			// multiplier
	output reg signed [63:0] p		// product
);
	
	wire signed [31:0] m_inv = ~m + 1;				// negative multiplicant
	wire signed [32:0] q_extended = {q, 1'b0};	// multiplier with implied 0 to right of least significant bit for Booth algoirthm
	reg signed [32:0] q_booth;							// records the product of multiplicant and Booth-recoded multiplier per iteration
	reg signed [63:0] q_booth_shifted;				// q_booth but accounts for required left shifting as algorithm moves up significant bits
	reg signed [63:0] sum;								// records the sum of all q_booth_shifted values
	integer i;
	
	always@(*)
	begin
		q_booth_shifted = 0;
		sum = 0;
		
		for(i = 0; i < 31; i = i+2)
		begin
			case({q_extended[i+2], q_extended[i+1], q_extended[i]})
				3'b001, 3'b010 : 	q_booth = {1'b0, m}; 		// 1*M
				3'b011 			: 	q_booth = {m, 1'b0}; 		// 2*M
				3'b100 			: 	q_booth = {m_inv, 1'b0}; 	// -2*M
				3'b101, 3'b110 :	q_booth = {1'b1, m_inv};	// -1*M
				default 			: 	q_booth = 0;					// 0*M
			endcase
			q_booth_shifted = q_booth <<< i;	// bitshift operator allowed?
			sum = sum + q_booth_shifted;
		end
		p = sum;
	end
endmodule
