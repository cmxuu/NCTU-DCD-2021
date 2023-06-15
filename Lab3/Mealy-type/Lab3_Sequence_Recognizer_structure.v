module Lab3_Sequence_Recognizer_structure (input x, clock, reset, output z);

	wire A, B, C;
	wire DA, DB, DC;

	assign DA = ((~C) & x) | (B & C & (~x));
	assign DB = (A & (~C) & (~x)) | (B & (~C) & (~x)) | (C & x);
	assign DC = (~x);

	assign z = (B & (~C) & (~x)) | (A & C & x);

	D_flip_flop_AR MA(A, DA, clock, reset);
	D_flip_flop_AR MB(B, DB, clock, reset);
	D_flip_flop_AR MC(C, DC, clock, reset);

endmodule