module seq_detector(clk,rst,seq_in,seq_out);
input clk,rst,seq_in;
output seq_out;

parameter S0 = 3'b000,
	  S1 = 3'b001,
	  S2 = 3'b010,
	  S3 = 3'b011,
	  S4 = 3'b100;

reg[2:0]state,next_state;


always@(posedge clk or negedge rst)
begin
	if(rst)
		state <= S0;
	else
		state <= next_state;
end


always@(*)
begin
	case(state)
		S0:begin
			if(seq_in == 0)
				next_state = S0;
			else
				next_state = S1;
		end

		S1:begin
			if(seq_in == 0)
				next_state = S2;
			else
				next_state = S1;
		end

		S2:begin
			if(seq_in == 0)
				next_state = S0;
			else
				next_state = S3;
		end

		S3:begin
			if(seq_in == 0)
				next_state = S2;
			else
				next_state = S4;
		end

		S4:begin
			if(seq_in == 0)
				next_state = S0;
			else
				next_state = S1;
		end
	endcase
end

assign seq_out = (state == S4);

endmodule












