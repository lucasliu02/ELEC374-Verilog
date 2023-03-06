module ror32(input wire [31:0] data_in, input wire [4:0] num_rotates, output reg [31:0] data_out);
	always@(*)
	begin
		case(num_rotates)
			5'd31: 	data_out <= {data_in[30:0], data_in[31]};
			5'd30: 	data_out <= {data_in[29:0], data_in[31:30]};
			5'd29: 	data_out <= {data_in[28:0], data_in[31:29]};
			5'd28: 	data_out <= {data_in[27:0], data_in[31:28]};
			5'd27: 	data_out <= {data_in[26:0], data_in[31:27]};
			5'd26: 	data_out <= {data_in[25:0], data_in[31:26]};
			5'd25: 	data_out <= {data_in[24:0], data_in[31:25]};
			5'd24: 	data_out <= {data_in[23:0], data_in[31:24]};
			5'd23: 	data_out <= {data_in[22:0], data_in[31:23]};
			5'd22: 	data_out <= {data_in[21:0], data_in[31:22]};
			5'd21: 	data_out <= {data_in[20:0], data_in[31:21]};
			5'd20: 	data_out <= {data_in[19:0], data_in[31:20]};
			5'd19: 	data_out <= {data_in[18:0], data_in[31:19]};
			5'd18: 	data_out <= {data_in[17:0], data_in[31:18]};
			5'd17: 	data_out <= {data_in[16:0], data_in[31:17]};
			5'd16:  data_out <= {data_in[15:0], data_in[31:16]};
			5'd15:  data_out <= {data_in[14:0], data_in[31:15]};
			5'd14:  data_out <= {data_in[13:0], data_in[31:14]};
			5'd13:  data_out <= {data_in[12:0], data_in[31:13]};
			5'd12:  data_out <= {data_in[11:0],data_in[31:12]};
			5'd11:  data_out <= {data_in[10:0],data_in[31:11]};
			5'd10:  data_out <= {data_in[9:0], data_in[31:10]};
			5'd9:   data_out <= {data_in[8:0], data_in[31:9]};
			5'd8:   data_out <= {data_in[7:0], data_in[31:8]};
			5'd7:   data_out <= {data_in[6:0], data_in[31:7]};
			5'd6:   data_out <= {data_in[5:0], data_in[31:6]};
			5'd5:   data_out <= {data_in[4:0], data_in[31:5]};
			5'd4:   data_out <= {data_in[3:0], data_in[31:4]};
			5'd3:   data_out <= {data_in[2:0], data_in[31:3]};
			5'd2:	data_out <= {data_in[1:0], data_in[31:2]};
			5'd1:	data_out <= {data_in[0], data_in[31:1]};
			default: data_out <= data_in;
		endcase
	end   
endmodule 