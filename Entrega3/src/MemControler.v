`include "Ram.v"
//busca de instruções --> BuscInstr
module MemControler(clock, reset, if_mc_en, if_mc_addr, mc_if_data, mem_mc_rw, mem_mc_en, mem_mc_addr, mem_mc_data, mc_ram_addr, mc_ram_wre, mc_ram_data);
	input clock; //acesso a ram na subida
	input reset; // coloca todos os regs em 0 na descida
	
	// Fetch
	input if_mc_en; //indica qual estágio de BuscInstr
	input [17:0] if_mc_addr; //endereço acessado pelo estágio de BuscInstr
	output [31:0] mc_if_data; //dado completo lido da RAM a ser enviado para a unidade de BuscInstr
	
	// Memory
	input mem_mc_rw; //indica quando instrução no estágio de memória escreve na RAM
	input mem_mc_en; //indica quando instrução no estágio de memória acessa a RAM. 
			// esse acesso tem prioridade sobre acessos feitos pelo estágio de BuscInstr
			//deve estar em zero, mesmo com if_mc_en igual a 1
	input [17:0] mem_mc_addr; //endereço acessado pelo estágio de Memória
	inout [31:0] mem_mc_data; //dado completo 1)lido da RAM --> a ser enviado para estágio de Memória
				//2) recebido do estágio de Memória --> a ser escrito na RAM
	
	// Ram
	output [17:0] mc_ram_addr; //endereço da ram no qual o acesso será feito. (ver detalhe sobre addr/2)
	output mc_ram_wre;//quando em 0 indica que a operação na RAM será de escrita
			//operação só é de escrita quando: ((!mem_mc_en & if_mc_en) | !mem_mc_rw)
	
	
	inout [15:0] mc_ram_data; //metade do dado a ser lido/enviado na RAM.
	
	// Auxilares
	reg menos_significativo;
	reg mais_significativo;
	
	Ram dut(mc_ram_addr, mc_ram_data, mc_ram_wre, mem_mc_en,mais_significativo, menos_significativo, if_mc_en);
	
assign mc_ram_wre = ((!mem_mc_en & if_mc_en) | (!mem_mc_rw));



always @(posedge clock or negedge reset)begin
	if (reset == 1'b0){
		//coloca todos os regs em 0 na descida
	}

	if (mc_ram_wre == 0'b0){
		//indica que a operação na RAM será de escrita
	}  

	menos_significativo <= 1'b0;
	mais_significativo <= 1'b0;
end

endmodule
