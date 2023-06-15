module t_Lab3_PE_Dff_gatelevel;

	wire	Q, Qb;
	reg		D, CLK;

	Lab3_PE_Dff_gatelevel M(D, CLK, Q, Qb);

	initial	begin
		$dumpfile("gtk_Dff.vcd");
		$dumpvars;
		CLK = 0;
		forever	#20	CLK = ~CLK;
	end

	initial	fork
		#0		D = 1;
		#25		D = 0;
		#65		D = 1;
		#88		D = 0;
		#122	D = 1;
		#195	D = 0;
	join

	initial #210 $finish;

endmodule

/*

cd C:\Users\aikub\Desktop\Lab3
iverilog -o Dff.vvp t_Lab3_PE_Dff_gatelevel.v Lab3_SbRb_Latch_gatelevel.v Lab3_PE_Dff_gatelevel.v
vvp Dff.vvp
gtkwave gtk_Dff.vcd

*/