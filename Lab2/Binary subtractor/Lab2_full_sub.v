`include "Lab2_half_sub_gatelevel.v"
module Lab2_full_sub(input x, y, z, output B, D);

	wire B1, B2, D1;

	Lab2_half_sub_gatelevel HS1(x, y, B1, D1);
	Lab2_half_sub_gatelevel HS2(D1, z, B2, D);
	or #(2) G1(B, B1, B2);

endmodule