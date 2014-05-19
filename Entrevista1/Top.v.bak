//made by douglas
// depende de Entrega1/src/Alu.v e OutConverter.v

module Top(SW,KEY, LEDR, HEXO, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);

	input	[16:0]	SW; // 7:0 - A; 15:8- B; 16- unsig
	output	[7:0]	HEX0;
	output	[7:0]	HEX1;
 	output	[7:0]	HEX2;
	output	[7:0]	HEX3;	
	output	[7:0]	HEX4;
	output	[7:0]	HEX5;
	output 	[7:0] 	HEX6;
	output	[7:0] 	HEX7;
	output	[0:0]	LEDR;
	input	[3:1]	KEY;


	reg	[23:0]	extensor = 23'b000000000000000000000000;
	reg	[31:0]	aluout;	
		

	Alu  A(.a({SW[7:0], extensor}), .b {SW[15:8], extensor}, .aluout(aluout), .unsig (SW[16]), .overflow (LEDR), .op (KEY) , .compout);
	
	OutConverter H0 (.aluout(aluout[3:0], .DHEX(HEX0));
	OutConverter H1 (.aluout(aluout[7:4], .DHEX(HEX1));
	OutConverter H2 (.aluout(aluout[11:8], DHEX (HEX2));
	OutConverter H3 (.aluout(aluout[15:12],DHEX (HEX3));
	OutConverter H4	(.aluout(aluout[19:16],DHEX (HEX4));
	OutConverter H5 (.aluout(aluout[23:20]),DHEX(HEX5)); 
	OutConverter H6 (.aluout(aluout[27:24]), DHEX(HEX6));
	OutConverter H7 (.aluout(aluout[31:28]), DHEX(HEX7));

endmodule
