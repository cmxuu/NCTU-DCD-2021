module Lab3_SbRb_Latch_gatelevel(input Sb, Rb, output Q, Qb);

	nand	#5	LS(Q, Sb, Qb);
	nand	#5	LR(Qb, Rb, Q);

endmodule