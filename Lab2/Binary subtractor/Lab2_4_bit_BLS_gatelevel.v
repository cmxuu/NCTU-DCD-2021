module Lab2_4_bit_BLS_gatelevel (input [3:0] X, Y, input Bin, output Bout, output [3:0] Diff);
	
	wire [3:0] nX, nP;
	wire [3:0] P, G, B;
	wire [9:0] w;

	// not X
	not N1(nX[0], X[0]);
	not N2(nX[1], X[1]);
	not N3(nX[2], X[2]);
	not N4(nX[3], X[3]);

	// P = X xor Y
	xor	#(4) X1(P[0], X[0], Y[0]);
	xor #(4) X2(P[1], X[1], Y[1]);
	xor #(4) X3(P[2], X[2], Y[2]);
	xor #(4) X4(P[3], X[3], Y[3]);

	// not P
	not N5(nP[0], P[0]);
	not N6(nP[1], P[1]);
	not N7(nP[2], P[2]);
	not N8(nP[3], P[3]);

	// G = X' and Y
	and #(2) A1(G[0], nX[0], Y[0]);
	and #(2) A2(G[1], nX[1], Y[1]);
	and #(2) A3(G[2], nX[2], Y[2]);
	and #(2) A4(G[3], nX[3], Y[3]);

	// 
	and #(2) G0(w[0], nP[0], Bin);
	and #(2) G1(w[1], nP[1], G[0]);
	and #(2) G2(w[2], nP[1], nP[0], Bin);
	and #(2) G3(w[3], nP[2], G[1]);
	and #(2) G4(w[4], nP[2], nP[1], G[0]);
	and #(2) G5(w[5], nP[2], nP[1], nP[0], Bin);
	and #(2) G6(w[6], nP[3], G[2]);
	and #(2) G7(w[7], nP[3], nP[2], G[1]);
	and #(2) G8(w[8], nP[3], nP[2], nP[1], G[0]);
	and #(2) G9(w[9], nP[3], nP[2], nP[1], nP[0], Bin);

	// B
	or	#(2) O1(B[1], G[0], w[0]);
	or	#(2) O2(B[2], G[1], w[1], w[2]);
	or	#(2) O3(B[3], G[2], w[3], w[4], w[5]);
	or	#(2) O4(Bout, G[3], w[6], w[7], w[8], w[9]);

	// D
	xor #(4) X5(Diff[0],P[0],Bin);
	xor #(4) X6(Diff[1],P[1],B[1]);
	xor #(4) X7(Diff[2],P[2],B[2]);
	xor #(4) X8(Diff[3],P[3],B[3]);

endmodule