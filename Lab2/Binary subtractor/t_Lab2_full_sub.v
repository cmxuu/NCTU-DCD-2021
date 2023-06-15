module t_Lab2_full_sub;
	
	wire 	B, D;
	reg		[2:0] XYZ;

	Lab2_full_sub FS(XYZ[2], XYZ[1], XYZ[0], B, D);

	initial	begin
		$dumpfile("gtk_full_sub.vcd");
		$dumpvars;
		XYZ = 3'b000;
		repeat (7) #20 XYZ = XYZ + 1'b1;
	end
	initial #160 $finish;

endmodule

/*

cd C:\Users\aikub\Desktop\Lab2_0812203
iverilog –o t_full_sub.vvp t_Lab2_full_sub.v Lab2_full_sub.v
vvp t_full_sub.vvp
gtkwave gtk_full_sub.vcd

*/