primitive Lab1_UDP(T, A, B, C, D);

	output T;
	input A, B, C, D;

	table

	 // A B C D : T;
		0 0 0 0 : 0;
 		0 0 0 1 : 0;
 		0 0 1 0 : 0;
 		0 0 1 1 : 0;
 		0 1 0 0 : 0;
 		0 1 0 1 : 1;
 		0 1 1 0 : 1;
 		0 1 1 1 : 1;
 		1 0 0 0 : 0;
 		1 0 0 1 : 1;
 		1 0 1 0 : 1;
 		1 0 1 1 : 1;
 		1 1 0 0 : 0;
 		1 1 0 1 : 1;
 		1 1 1 0 : 1;
 		1 1 1 1 : 1;

	endtable

endprimitive