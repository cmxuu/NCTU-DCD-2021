module t_Lab2_half_sub;
	
	wire	B, D;
	reg		[1:0] XY;

	Lab2_half_sub_gatelevel M1(XY[1], XY[0], B, D);

	initial	begin
		$dumpfile("gtk_half_sub.vcd");
		$dumpvars;
		XY = 2'b00;
		repeat (3) #10 XY = XY + 1'b1;
	end
	initial #40 $finish;

endmodule

/*

cd C:\Users\aikub\Desktop\Lab2_0812203
iverilog –o t_half_sub.vvp t_Lab2_half_sub.v Lab2_half_sub_gatelevel.v
vvp t_half_sub.vvp
gtkwave gtk_half_sub.vcd

*/