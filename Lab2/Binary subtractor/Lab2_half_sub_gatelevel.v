module Lab2_half_sub_gatelevel(input x, y, output B, D);

	nor 	 nX(not_x, x);
	xor	#(4) G1(D, x, y);
	and #(2) G2(B, not_x, y);

endmodule