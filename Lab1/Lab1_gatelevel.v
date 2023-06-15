module Lab1_gatelevel(F, A, B, C, D);

	output F;
	input A, B, C, D;
	wire nC, nB, o1_o, o2_o, o3_o, a1_o, a2_o;

	not N1(nC, C);
	not N2(nB, B);

	or O1(o1_o, A, B);
	or O2(o2_o, nC, D);
	or O3(o3_o, A, C);

	and A1(a1_o, o1_o, o2_o);
	and A2(a2_o, o3_o, nB);

	or O4(F, a1_o, a2_o);

endmodule