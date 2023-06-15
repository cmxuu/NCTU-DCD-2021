module D_flip_flop_AR(Q, D, clk, rst);

	output Q;
	input D, clk, rst;
	reg Q;

	always @(posedge clk or negedge rst)
		if (!rst) Q <= 1'b0;
		else Q <= D;

endmodule