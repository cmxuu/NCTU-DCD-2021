module Lab2_4_bit_BLS_behavioral (input [3:0] X, Y, input Bin, output reg Bout, output reg [3:0] Diff);
	
	reg [3:0] P, G;
	reg [3:0] B;

	always @(*)
	  begin

	  	// P
		P[0] = X[0] ^ Y[0];
		P[1] = X[1] ^ Y[1];
		P[2] = X[2] ^ Y[2];
		P[3] = X[3] ^ Y[3];

		// G
		G[0] = (~X[0]) & Y[0];
		G[1] = (~X[1]) & Y[1];
		G[2] = (~X[2]) & Y[2];
		G[3] = (~X[3]) & Y[3];
		
		// B
		B[1] = G[0] | ((~P[0]) & Bin);
		B[2] = G[1] | ((~P[1]) & G[0]) | ((~P[1]) & (~P[0]) & Bin);
		B[3] = G[2] | ((~P[2]) & G[1]) | ((~P[2]) & (~P[1]) & G[0]) | ((~P[2]) & (~P[1]) & (~P[0]) & Bin);
		Bout = G[3] | ((~P[3]) & G[2]) | ((~P[3]) & (~P[2]) & G[1]) | ((~P[3]) & (~P[2]) & (~P[1]) & G[0]) | ((~P[3]) & (~P[2]) & (~P[1]) & (~P[0]) & Bin); 

		// D
		Diff[0] = P[0] ^ Bin;
		Diff[1] = P[1] ^ B[1];
		Diff[2] = P[2] ^ B[2];
		Diff[3] = P[3] ^ B[3];
	  
	  end

endmodule