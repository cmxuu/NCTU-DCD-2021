module t_Lab3_Sequence_Recognizer;

	wire	z1, z2;
	reg 	x, clk, rst;

	Lab3_Sequence_Recognizer_state_diagram	M1(x, clk, rst, z1);
	Lab3_Sequence_Recognizer_structure		M2(x, clk, rst, z2);

	// 0-1 V
	// 0-4 V
	// 1-1 V
	// 1-2 V
	// 2-4 V
	// 2-3 V
	// 3-2 V
	// 3-5 V
	// 4-4 V
	// 4-3 V
	// 5-2 V
	// 5-1 V

	// 0-1-1-2-4-4-3-5-2-3-2-3-5-1 >> 0-4
	//  0-0-1-1-1-0-0-1-0-1-0-0-0  >>  1  

	initial begin
		$dumpfile("gtk_Seq.vcd");
		$dumpvars;
		rst = 0;
		#10		rst = 1;
		#130	rst = 0;
		#5		rst = 1;
	end

	initial begin
		clk = 0;
		#10	clk = 1;
		forever	#5	clk = ~clk;
	end

	initial begin
		x = 0;
		#5	x = 0;
		#10 x = 0;
		#10 x = 1;
		#10 x = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 0;
		#10 x = 0;
		#20 x = 1;
	end

	initial #180 $finish;

endmodule

/*

cd C:\Users\aikub\Desktop\Lab3
iverilog -o seq.vvp t_Lab3_Sequence_Recognizer.v Lab3_Sequence_Recognizer_state_diagram.v Lab3_Sequence_Recognizer_structure.v D_ff_AR.v
vvp seq.vvp
gtkwave gtk_Seq.vcd

*/