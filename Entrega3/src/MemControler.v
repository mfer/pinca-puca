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
			//operação só é de leitura quando: ((!mem_mc_en & if_mc_en) | !mem_mc_rw)
	
	
	inout [15:0] mc_ram_data; //metade do dado a ser lido/enviado na RAM.
	
	// Auxilares
	reg zero = 0;
	reg [17:0] ram_addr;
	reg [15:0] data1;
	reg [31:0] data2;
	reg [31:0] data3;
	reg conta_clock=1;
	integer cont;

assign mc_ram_wre = ((!mem_mc_en & if_mc_en) | (!mem_mc_rw));	

assign mc_ram_addr = ram_addr;

assign mc_ram_data = data1;

assign mem_mc_data = data2;

assign mc_if_data = data3;

// Reset assíncrono
always @(posedge clock or negedge reset )begin
	if(~reset) begin
		for( cont = 0; cont < 17; cont = cont +1) begin
			ram_addr[cont] = 18'b0;
		end
		for(cont =0; cont < 15; cont = cont+1) begin
			data1[cont] = 16'b0;
		end
		for(cont =0; cont < 31; cont = cont+1) begin
			data2[cont] = 32'b0;
			data3[cont] = 32'b0;
		end
	end
	else begin
		// Se for uma operação de escrita.
		if(mc_ram_wre) begin
			// Quem vai ler é o estágio de escrita.
			if(mem_mc_en) begin
				if(conta_clock) begin
					// Convertendo para ser lido pela FPGA.
					ram_addr <= (mem_mc_addr >>1);
					data2[31:16] <= data1;
					ram_addr<= ram_addr +1;
					conta_clock <= ~conta_clock;
				end
				else begin
					// Dando um clock entre as instruções.
					data2[15:0]<= data1;
					conta_clock <= ~conta_clock;
				end
			end
			// Quem vai ler é o estágio de fetch.
			else begin
				if(conta_clock) begin
					ram_addr <= (if_mc_addr >> 1);
					data3[31:16] <= data1;
					ram_addr<= ram_addr +1;
					conta_clock <= ~conta_clock;
				end
				else begin
					// Dando um clock entre as instruções.
					data3[15:0] <= data1;
					conta_clock <= ~conta_clock;
				end
			end
		end
		else begin
			if(conta_clock) begin
				ram_addr <= (mem_mc_addr >> 1);
				data1 <= data2[31:16];
				ram_addr<= ram_addr +1;
				conta_clock <= ~conta_clock;
			end
			else begin
				// Dando um clock entre as instruções.
				data1 <= data2[15:0];
				conta_clock <= ~conta_clock;
			end
		end
	end
end

endmodule
