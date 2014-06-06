module MemControler_tb;

	reg clock;
	reg reset;
	
	// Fetch
	reg 			if_mc_en;
	reg 		[17:0] 	if_mc_addr; 
	wire	[31:0]	mc_if_data; 

	//Memory 
	reg 			mem_mc_rw; 
	reg 			mem_mc_en; 
	reg 		[17:0]	mem_mc_addr; 
	wire		[31:0]	mem_mc_data; 
	

	//Ram 
	wire 		[17:0]	mc_ram_addr; 
	wire 			mc_ram_wre; 
	wire   	[15:0]	mc_ram_data;
	

	
	MemControler MC(clock, reset, if_mc_en, if_mc_addr, mc_if_data, mem_mc_rw, mem_mc_en, mem_mc_addr, mem_mc_data, mc_ram_addr, mc_ram_wre, mc_ram_data);
	
	initial begin
		clock = 0;
		if_mc_en = 1;
		clock = ~clock;
		clock = ~clock;
	end
endmodule