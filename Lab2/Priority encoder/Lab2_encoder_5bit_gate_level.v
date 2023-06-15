module Lab2_encoder_5bit_gate_level (input [0:4] D, output [2:0] A, output V);
	
	wire [0:4] nD;
	wire [4:0] w;

	not N0(nD[0], D[0]);
	not N1(nD[1], D[1]);
	not N2(nD[2], D[2]);
	not N3(nD[3], D[3]);

	// A2
	and A2_1(A[2], nD[0], nD[1], nD[2], nD[3]);

	// A1
	and A1_1(w[0], nD[0], nD[1], D[2]);
	and A1_2(w[1], nD[0], nD[1], D[3]);
	or O1_1(A[1], w[0], w[1]);

	// A0
	and A0_1(w[2], nD[0], D[1]);
	and A0_2(w[3], nD[0], nD[2], D[3]);
	or O2_1(A[0], w[2], w[3]);

	// V
	or OV(V, D[0], D[1], D[2], D[3], D[4]);

endmodule