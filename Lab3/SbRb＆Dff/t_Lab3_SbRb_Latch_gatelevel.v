module t_Lab3_SbRb_Latch_gatelevel;

	wire	Q, Qb;
	reg		Sb, Rb;

	Lab3_SbRb_Latch_gatelevel M(Sb, Rb, Q, Qb);

	initial begin
		$dumpfile("gtk_SbRb.vcd");
		$dumpvars;
		Sb = 0;	Rb = 1;
		#30		Sb = 1;	Rb = 1;
		#30		Sb = 1;	Rb = 0;
		#30		Sb = 1;	Rb = 1;
		#30		Sb = 0;	Rb = 0;
		#30		Sb = 1;	Rb = 1;
		#30		Sb = 0;	Rb = 1;
	end
	initial #210 $finish;

endmodule

/*

cd C:\Users\aikub\Desktop\Lab3
iverilog -o SbRb.vvp t_Lab3_SbRb_Latch_gatelevel.v Lab3_SbRb_Latch_gatelevel.v
vvp SbRb.vvp
gtkwave gtk_SbRb.vcd

*/