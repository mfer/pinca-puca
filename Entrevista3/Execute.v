module Execute (   
	input clock, 
	input reset, 
	//Decode 
	input id_ex_selalushift, 
	input id_ex_selimregb, 
	input [2:0] id_ex_aluop, 
	input id_ex_unsig, 
	input [1:0] id_ex_shiftop, 
	input [4:0] id_ex_shiftamt, 
	input [31:0] id_ex_rega, 
	input id_ex_readmem,
	input id_ex_writemem, 
	input [31:0] id_ex_regb, 
	input [31:0] id_ex_imedext, 
	input id_ex_selwsource, 
	input [4:0] id_ex_regdest, 
	input id_ex_writereg, 
	input id_ex_writeov, 
	//Fetch output 
	output reg ex_if_stall, 
	//Memory 
	output reg ex_mem_readmem, 
	output reg ex_mem_writemem, 
	output reg [31:0] ex_mem_regb, 
	output reg ex_mem_selwsource, 
	output reg [4:0] ex_mem_regdest, 
	output reg ex_mem_writereg,
	output reg [31:0] ex_mem_wbvalue );
	
 	//auxiliares
	wire 	[31:0] 	result;
	wire	[31:0] 	aluout;
	wire		compout;	
	reg	[31:0] 	b;
	wire		aluov;
    
    always @(posedge clock or negedge reset )begin
        
    	 if (~reset) begin
		//passa o valor dos registradores para 0    	 	 
            ex_if_stall <= 1'b0;
            ex_mem_readmem <= 1'b0;
            ex_mem_regb <='b0;
            ex_mem_selwsource <= 1'b0;
            ex_mem_regdest <= 5'b00000;
            ex_mem_writereg <= 1'b0;
            ex_mem_wbvalue <= 1'b0;
            
        end
        else begin
        
        	if(id_ex_readmem || id_ex_writemem)begin 
        		// se ocorrer escrita na memória devemos realizar um stall;
        		ex_if_stall <= 1'b1;
        		
        	end
        	
        	else begin
        		
        		ex_if_stall <= 1'b0;
        		
		end
		//assinalando os valores de acordo com a tabela passada
		ex_mem_readmem <= id_ex_readmem;
		ex_mem_writemem <= id_ex_writemem;
		ex_mem_regb <= id_ex_regb;
		ex_mem_selwsource <= id_ex_selwsource;
		ex_mem_regdest <= id_ex_regdest;
		ex_mem_writereg <= ((!aluov | id_ex_writeov) & id_ex_writereg);
		
		case (id_ex_selalushift)
		
			1'b1: ex_mem_wbvalue <=result;
			default: ex_mem_wbvalue <= aluout;
		endcase
		// definindo o que colocaremos na porta b da alu.
		case (id_ex_selimregb)

			1'b1: b <= id_ex_imedext;
			default: b <= id_ex_regb;
		
		endcase

        end
    end

    Alu ALU (.a(id_ex_rega), .b(b), .aluout(aluout), .op(id_ex_aluop), .unsig(id_ex_unsig), .compout(compout), .overflow(aluov));
    Shifter SHIFTER(.in(id_ex_regb), .shiftop(id_ex_shiftop), .shiftamt(id_ex_shiftamt), .result(result));
endmodule
