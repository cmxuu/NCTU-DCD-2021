`include "Lab1_UDP.v"
module Lab1_gatelevel_UDP(F, A, B, C, D);

	output F;
	input A, B, C, D;
	wire nB, nC, T, o1_o, a1_o;

	not N1(nC, C);
	not N2(nB, B);

	Lab1_UDP M1(T, A, B, nC, D);

	or O1(o1_o, A, C);
	and A1(a1_o, o1_o, nB);

	or O2(F, T, a1_o);

endmodule