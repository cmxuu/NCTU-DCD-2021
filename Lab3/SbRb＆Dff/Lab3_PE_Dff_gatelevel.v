module Lab3_PE_Dff_gatelevel(input D, clock, output Q, Qb);
	
	wire	w1, w2, w3, w4;

	nand	#5	N1(w1, w4, w2);
	nand	#5	N2(w2, w1, clock);
	nand	#5	N3(w3, w2, clock, w4);
	nand	#5	N4(w4, w3, D);
	Lab3_SbRb_Latch_gatelevel	SbRb(w2, w3, Q, Qb);

endmodule