`include "Ram.v"
module MemControler(clock, reset, if_mc_en, if_mc_addr, mc_if_data, mem_mc_rw, mem_mc_en, mem_mc_addr, mem_mc_data, mc_ram_addr, mc_ram_wre, mc_ram_data);
	input clock; //acesso a ram na subida
	input reset; // coloca todos os regs em 0 na descida
	
	// Fetch
	input if_mc_en; //
	input [17:0] if_mc_addr;
	output [31:0] mc_if_data;
	
	// Memory
	input mem_mc_rw;
	input mem_mc_en;
	input [17:0] mem_mc_addr;
	inout [31:0] mem_mc_data;
	
	// Ram
	// Endereço em que o acesso será feito.
	output [17:0] mc_ram_addr;
	output mc_ram_wre;
	
	// Metade do dado a ser lido/enviado na RAM.
	inout [15:0] mc_ram_data;
	
	// Auxilares
	reg menos_significativo;
	reg mais_significativo;
	
	Ram dut(mc_ram_addr, mc_ram_data, mc_ram_wre, mem_mc_en,mais_significativo, menos_significativo, if_mc_en);
	
assign mc_ram_wre = ((!mem_mc_en & if_mc_en) | (!mem_mc_rw));



always @(posedge clock or negedge reset)begin
	if (reset == 1'b0){
		//coloca todos os regs em 0 na descida
	} 
	menos_significativo <= 1'b0;
	mais_significativo <= 1'b0;
end

endmodule
