module Lab2_4_bit_BLS_dataflow (input [3:0] X, Y, input Bin, output Bout, output [3:0] Diff);

	wire [3:0] P, G;
	wire [3:0] B;

	// P
	assign  P[0] = X[0] ^ Y[0];
	assign  P[1] = X[1] ^ Y[1];
	assign  P[2] = X[2] ^ Y[2];
	assign  P[3] = X[3] ^ Y[3];

	// G
	assign  G[0] = (~X[0]) & Y[0];
	assign  G[1] = (~X[1]) & Y[1];
	assign  G[2] = (~X[2]) & Y[2];
	assign  G[3] = (~X[3]) & Y[3];

	// D
	assign  Diff[0] = P[0] ^ Bin;
	assign  Diff[1] = P[1] ^ B[1];
	assign  Diff[2] = P[2] ^ B[2];
	assign  Diff[3] = P[3] ^ B[3];

	// B
	assign  B[1] = G[0] | ((~P[0]) & Bin);
	assign  B[2] = G[1] | ((~P[1]) & G[0]) | ((~P[1]) & (~P[0]) & Bin);
	assign  B[3] = G[2] | ((~P[2]) & G[1]) | ((~P[2]) & (~P[1]) & G[0]) | ((~P[2]) & (~P[1]) & (~P[0]) & Bin);
	assign  Bout = G[3] | ((~P[3]) & G[2]) | ((~P[3]) & (~P[2]) & G[1]) | ((~P[3]) & (~P[2]) & (~P[1]) & G[0]) | ((~P[3]) & (~P[2]) & (~P[1]) & (~P[0]) & Bin); 

endmodule