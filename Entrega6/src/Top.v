module Top(KEY, SW , SRAM_ADDR, SRAM_WE_N, SRAM_DQ, 
	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, 
	SRAM_OE_N,SRAM_UB_N, SRAM_LB_N, SRAM_CE_N);
	
	//inputs	
	input	[1:1] 		KEY;
	input	[17:0]	SW;	
	input				SRAM_WE_N;
	
	//outputs
	output [19:0]	SRAM_ADDR;
	output [31:0]	SRAM_DQ;
	output			SRAM_OE_N;
	output 			SRAM_UB_N; 
	output			SRAM_LB_N;
	output			SRAM_CE_N;
	output [7:0]	HEX0;
	output [7:0]	HEX1;
 	output [7:0]	HEX2;
	output [7:0]	HEX3;	
	output [7:0]	HEX4;
	output [7:0]	HEX5;
	output [7:0] 	HEX6;
	output [7:0] 	HEX7;
	  	
	Mips(.clock(KEY[1]), .reset(SW[17]), .addr(SRAM_ADDR), .data(SRAM_DQ), .wre(SRAM_WE_N),
	.oute(SRAM_OE_N), .hb_mask(SRAM_UB_N), .lb_mask(SRAM_LB_N), .chip_en(SRAM_CE_N));
	
	OutConverter H0 (.hex_digit(SRAM_DQ[3:0]),    .seg(HEX0));
	OutConverter H1 (.hex_digit(SRAM_DQ[7:4]),    .seg(HEX1));
	OutConverter H2 (.hex_digit(SRAM_DQ[11:8]),   .seg(HEX2));
	OutConverter H3 (.hex_digit(SRAM_DQ[15:12]),  .seg(HEX3));
	OutConverter H4 (.hex_digit(SRAM_DQ[19:16]),  .seg(HEX4));
	OutConverter H5 (.hex_digit(SRAM_DQ[23:20]), .seg(HEX5)); 
	OutConverter H6 (.hex_digit(SRAM_DQ[27:24]), .seg(HEX6));
	OutConverter H7 (.hex_digit(SRAM_DQ[31:28]), .seg(HEX7));

endmodule
