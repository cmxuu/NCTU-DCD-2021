module t_Lab2_encoder_5bit;

	wire [2:0]	A1, A2, A3;
	wire 		V1, V2, V3;
	reg	 [0:4]	D;

	Lab2_encoder_5bit_gate_level M1(D, A1, V1);
	Lab2_encoder_5bit_dataflow M2(D, A2, V2);
	Lab2_encoder_5bit_behavior M3(D, A3, V3);

	initial	begin
		$dumpfile("gtk_encoder_5bit.vcd");
		$dumpvars;
		D = 5'b00000;
		#10 D = 5'b00001;
		#10 D = 5'b00011;
		#10 D = 5'b00110;
		#10 D = 5'b01001;
		#10 D = 5'b01101;
		#10 D = 5'b10110;
		#10 D = 5'b11010;
	end
	initial #80 $finish;

endmodule

/*

cd C:\Users\aikub\Desktop\Lab2_0812203
iverilog –o t_encoder.vvp t_Lab2_encoder_5bit.v Lab2_encoder_5bit_gate_level.v Lab2_encoder_5bit_dataflow.v Lab2_encoder_5bit_behavior.v
vvp t_encoder.vvp
gtkwave gtk_encoder_5bit.vcd

*/