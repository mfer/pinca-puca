module Top(SW,KEY, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);

	input	[16:0]	SW; // 7:0 - A; 15:8- B; 16- unsig
	output [7:0]	HEX0;
	output [7:0]	HEX1;
 	output [7:0]	HEX2;
	output [7:0]	HEX3;	
	output [7:0]	HEX4;
	output [7:0]	HEX5;
	output [7:0] 	HEX6;
	output [7:0] 	HEX7;
	output	[0:0]	LEDR;
	input	[3:1]	KEY;

	parameter extensor_positive = 24'b000000000000000000000000;
	
	wire	[31:0]	aluout;
	wire compout;		
	
	Alu  A(.a({SW[7:0], extensor}), 
	       .b({SW[15:8], extensor}), 
			 .aluout(aluout), .unsig (SW[16]), 
			 .op (KEY), .compout(compout),.overflow (LEDR) );
	
	OutConverter H0 (.aluout(aluout[3:0]),    .dhex(HEX0));
	OutConverter H1 (.aluout(aluout[7:4]),    .dhex(HEX1));
	OutConverter H2 (.aluout(aluout[11:8]),   .dhex(HEX2));
	OutConverter H3 (.aluout(aluout[15:12]),  .dhex(HEX3));
	OutConverter H4 (.aluout(aluout[19:16]),  .dhex(HEX4));
	OutConverter H5 (.aluout(aluout[23:20]), .dhex(HEX5)); 
	OutConverter H6 (.aluout(aluout[27:24]), .dhex(HEX6));
	OutConverter H7 (.aluout(aluout[31:28]), .dhex(HEX7));
endmodule
