module Top(KEY, SW , SRAM_ADDR, SRAM_WE_N, SRAM_DQ, 
	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, 
	SRAM_OE_N,SRAM_UB_N, SRAM_LB_N, SRAM_CE_N);
	
	//inputs
	input	[1:1] 		KEY;
	input	[17:0]	SW;	
	input				SRAM_WE_N;
	
	//outputs
	output [19:0]	SRAM_ADDR;
	output			SRAM_DQ;
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
	  	
	//wires
	wire			nothing;
	wire	[31:0] 	mc_if_data;
	
	assign SRAM_ADDR[19:18] = 2'b00;
	assign SRAM_OE_N = 1'b0; 
	assign SRAM_UB_N = 1'b0; 
	assign SRAM_LB_N = 1'b0; 
	assign SRAM_CE_N = 1'b0;
	
	MemControler DE2_MControle( 
		.clock(KEY[1]), .reset(SW[17]), .if_mc_en(1'b1), .if_mc_addr({1'b0,SW[16:0]}<<2), 
		.mc_if_data(mc_if_data), .mem_mc_rw(1'b0), .mem_mc_en(1'b0), .mem_mc_addr(18'h00000), 
		.mem_mc_data(nothing), .mc_ram_addr(SRAM_ADDR[17:0]), .mc_ram_wre(SRAM_WE_N), .mc_ram_data(SRAM_DQ));
	
	OutConverter H0 (.hex_digit(mc_if_data[3:0]),    .seg(HEX0));
	OutConverter H1 (.hex_digit(mc_if_data[7:4]),    .seg(HEX1));
	OutConverter H2 (.hex_digit(mc_if_data[11:8]),   .seg(HEX2));
	OutConverter H3 (.hex_digit(mc_if_data[15:12]),  .seg(HEX3));
	OutConverter H4 (.hex_digit(mc_if_data[19:16]),  .seg(HEX4));
	OutConverter H5 (.hex_digit(mc_if_data[23:20]), .seg(HEX5)); 
	OutConverter H6 (.hex_digit(mc_if_data[27:24]), .seg(HEX6));
	OutConverter H7 (.hex_digit(mc_if_data[31:28]), .seg(HEX7));

endmodule
