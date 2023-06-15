module t_Lab2_4_bit_sub;

	wire [3:0]	Diff0, Diff1, Diff2, Diff3;
	wire		Bout0, Bout1, Bout2, Bout3;
	reg  [3:0]	X, Y;
	reg			Bin;

	Lab2_4_bit_RBS M0(X, Y, Bin, Bout0, Diff0);
	Lab2_4_bit_BLS_gatelevel M1(X, Y, Bin, Bout1, Diff1);
	Lab2_4_bit_BLS_dataflow M2(X, Y, Bin, Bout2, Diff2);
	Lab2_4_bit_BLS_behavioral M3(X, Y, Bin, Bout3, Diff3);

	initial	begin
		$dumpfile("gtk_4_bit_sub.vcd");
		$dumpvars;
		X=4'b1111; Y=4'b1111; Bin=1;
		#100 X=4'b0001; Y=4'b1101; Bin=0;
		#100 X=4'b0101; Y=4'b0101; Bin=0;
		#100 X=4'b1100; Y=4'b0011; Bin=1;
		#100 X=4'b1000; Y=4'b0111; Bin=0;
		#100 X=4'b0000; Y=4'b1111; Bin=1;
		#100 X=4'b0110; Y=4'b0001; Bin=0;
		#100 X=4'b1100; Y=4'b1000; Bin=1;
	end
	initial #800 $finish;

endmodule

/*

cd C:\Users\aikub\Desktop\Lab2_0812203
iverilog –o t_4_bit_sub.vvp t_Lab2_4_bit_sub.v Lab2_4_bit_RBS.v Lab2_4_bit_BLS_gatelevel.v Lab2_4_bit_BLS_dataflow.v Lab2_4_bit_BLS_behavioral.v
vvp t_4_bit_sub.vvp
gtkwave gtk_4_bit_sub.vcd

*/