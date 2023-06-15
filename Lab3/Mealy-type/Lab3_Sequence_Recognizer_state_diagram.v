module Lab3_Sequence_Recognizer_state_diagram (input x, clock, reset, output z);
	
	reg			z;
	reg	[2:0]	state, next;
	parameter	S0 = 3'b000, S1 = 3'b001, S2 = 3'b010,
				S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;

	always @(posedge clock or negedge reset) begin
		if (reset == 0) state <= S0;
		else state <= next;
	end

	always @(state, x) begin
		case(state)
			S0:	if(x) next <= S4;	else next <= S1;
			S1:	if(x) next <= S2;	else next <= S1;
			S2:	if(x) next <= S4;	else next <= S3;
			S3:	if(x) next <= S2;	else next <= S5;
			S4:	if(x) next <= S4;	else next <= S3;
			S5:	if(x) next <= S2;	else next <= S1;
		endcase
	end

	always @(state, x) begin
		case(state) 
			S2:	z = (x == 0);
			S5: z = (x == 1);
			default: z = 0;
		endcase
	end

endmodule