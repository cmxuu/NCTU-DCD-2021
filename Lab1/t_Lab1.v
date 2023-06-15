module t_Lab1();

	wire F1, F2, F3;
	reg A, B, C, D;

	Lab1_gatelevel M1(F1, A, B, C, D);
	Lab1_dataflow M2(F2, A, B, C, D);
	Lab1_gatelevel_UDP M3(F3, A, B, C, D);

	initial	begin
		$dumpfile("gtk_Lab1.vcd");
		$dumpvars;
		A=1'b0; B=1'b0; C=1'b0; D=1'b0;			//0
		#100 A=1'b0; B=1'b0; C=1'b0; D=1'b1;	//1
		#100 A=1'b0; B=1'b0; C=1'b1; D=1'b0;	//2
		#100 A=1'b0; B=1'b0; C=1'b1; D=1'b1;	//3
		#100 A=1'b0; B=1'b1; C=1'b0; D=1'b0;	//4
		#100 A=1'b0; B=1'b1; C=1'b0; D=1'b1;	//5
		#100 A=1'b0; B=1'b1; C=1'b1; D=1'b0;	//6
		#100 A=1'b0; B=1'b1; C=1'b1; D=1'b1;	//7
		#100 A=1'b1; B=1'b0; C=1'b0; D=1'b0;	//8
		#100 A=1'b1; B=1'b0; C=1'b0; D=1'b1;	//9
		#100 A=1'b1; B=1'b0; C=1'b1; D=1'b0;	//10
		#100 A=1'b1; B=1'b0; C=1'b1; D=1'b1;	//11
		#100 A=1'b1; B=1'b1; C=1'b0; D=1'b0;	//12
		#100 A=1'b1; B=1'b1; C=1'b0; D=1'b1;	//13
		#100 A=1'b1; B=1'b1; C=1'b1; D=1'b0;	//14
		#100 A=1'b0; B=1'b1; C=1'b1; D=1'b1;	//15
	end
	initial #1600 $finish;

endmodule

/*

cd C:\Users\aikub\Desktop\Lab1_0812203
iverilog –o t_Lab1.vvp t_Lab1.v Lab1_gatelevel.v Lab1_dataflow.v Lab1_gatelevel_UDP.v
vvp t_Lab1.vvp
gtkwave gtk_Lab1.vcd

*/