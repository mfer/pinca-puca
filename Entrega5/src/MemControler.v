`include "Ram.v"
module MemControler(clock, reset, if_mc_en, if_mc_addr, mc_if_data, mem_mc_rw, mem_mc_en, mem_mc_addr, mem_mc_data, mc_ram_addr, mc_ram_wre, mc_ram_data);
	input clock;
	input reset;

	// Fecth
	input if_mc_en;
	input [17:0] if_mc_addr;
	output [31:0] mc_if_data;

	// Memory
	input mem_mc_rw;
	input mem_mc_en;
	input [17:0] mem_mc_addr; // entrega 5: alteração nao foi necessária
	inout [31:0] mem_mc_data;

	// Ram
	// Endereço em que o acesso será feito.
	output [17:0] mc_ram_addr;
	output mc_ram_wre;

	// Metade do dado a ser lido/enviado na RAM.
	inout [15:0] mc_ram_data;

	// Auxilares
	reg zero = 0;
	reg [17:0] ram_addr;
	reg [15:0] data1;
	reg [31:0] data2;
	reg [31:0] data3;
	integer cont;

	Ram dut(mc_ram_addr, mc_ram_data, mc_ram_wre, ~mc_ram_wre, zero, zero, zero);

	assign mc_ram_wre = !((!mem_mc_en & if_mc_en) | (!mem_mc_rw));
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
			// Se for uma operação de leitura.
//			if(mc_ram_wre) begin 	ENTREGA 5 FICA ASSIM:
			if(mc_ram_wre) begin
				// Quem vai ler é o estágio de leitura.
				if(mem_mc_en) begin
					// Convertendo para ser lido pela FPGA.
					ram_addr <= (mem_mc_addr >>1);
					data2[31:16] <= data1;
					ram_addr<= ram_addr +1;

					//Como dar um clock entre essas instruções????
					data2[15:0]<= data1;
				end
				// Quem vai ler é o estágio de fetch.
				else begin
					ram_addr <= (if_mc_addr >> 1);
					data3[31:16] <= data1;
					ram_addr<= ram_addr +1;
					//Como dar um clock entre essas instruções????
					data3[15:0] <= data1;
				end
			end
			else begin
				ram_addr <= (mem_mc_addr >> 1);
				data1 <= data2[31:16];
				ram_addr<= ram_addr +1;
				//Como dar um clock entre essas instruções????
				data1 <= data2[15:0];
			end
		end
	end

endmodule