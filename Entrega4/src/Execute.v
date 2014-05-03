//sudolshw@gmail.com

/*
*   Implementa o estágio de execução responsável por receber
*   do estágio de decodificação os operandos e a operação 
*   a ser realizada. O resultado é passado para o estágio de memória
*   Depende da Alu e do Shifter.
*      iverilog src/Execute.v -o bin/Execute ../Entrega1/src/Alu.v ../Entrega1/src/Shifter.v
*/

module Execute (    clock,     reset,   id_ex_selalushift,  id_ex_selimregb, 
    id_ex_aluop,    id_ex_unsig,        id_ex_shiftop,      id_ex_shiftamt,
    id_ex_rega,     id_ex_readmem,      id_ex_writemem,     id_ex_regb,
    id_ex_imedext,  id_ex_selwsource,   id_ex_regdest,      id_ex_writereg,
    id_ex_writeov,  id_if_stall,        id_mem_readmem,     id_mem_writemem,
    id_mem_regb,    id_mem_selwsource,  id_mem_regdest,     id_mem_writereg,
    id_mem_wbvalue );
    //operações do estágio de busca na subida do clock
	input	            clock;
    //coloca todos os registradores em 0 na borda de descida
    input               reset;
    /****Decode****/
    //seleciona entre o resultado da Alu ou do Shifter
    input               id_ex_selalushift;
    //define o que será conectado na porta b da Alu
    //1: id_ex_imedext deve ser conectado
    //0: id_ex_regb deve ser conectado
    input               id_ex_selimregb;
    //deve ser conectado na porta op da Alu    
    input       [2:0]   id_ex_aluop;
    //deve ser conectado na porta unsig da Alu
    input               id_ex_unsig;
    //deve ser conectado na porta shiftop do Shifter
    input       [1:0]   id_ex_shiftop;
    //deve ser conectado na porta shiftamt do Shifter
    input       [4:0]   id_ex_shiftamt;
    //deve ser conectado na porta a da Alu
    input       [31:0]  id_ex_rega;
    //indica que a instrução fará uma leitura
    input               id_ex_readmem;
    //indica que a instrução fará uma escrita
    input               id_ex_writemem;
    //deve ser conectado na porta in do Shifter
    input       [31:0]  id_ex_regb;
    //contem o valor imediato para instruções que operam imediatos
    input       [31:0]  id_ex_imedext;

    //sinais a serem repassados para o estágio de memória
    input               id_ex_selwsource;
    input       [4:0]   id_ex_regdest;
    //indica escrita no banco de registradores
    input               id_ex_writereg;

    //indica escrita no banco de registradores 
    //mesmo com overflow na Alu
    input               id_ex_writeov;

    /****Fetch****/
    //indica que um stall deve ser inserido, setar em  1..
    //..se id_ex_readmem==1 ou id_ex_writemem==1
    output reg          ex_if_stall;

    /****Memory****/
    //recebem o id_ex_<correspondente>
    output reg          ex_mem_readmem;
    output reg          ex_mem_writemem;
    output reg  [31:0]  ex_mem_regb;
    output reg          ex_mem_selwsource;
    output reg  [4:0]   ex_mem_regdest;
    //recebe (!aluov | id_ex_writeov) & id_ex_writereg
    output reg          ex_mem_writereg;
    //recebe a saida do shifter caso id_ex_selalushift==1
    //senão recebe a saída da Alu
    output reg  [31:0]  ex_mem_wbvalue;

    /****Alu****/
    reg     [31:0]      b;
    wire  [31:0]      aluout;
    wire          compout; //esse sinal é irrelevante nesse trabalho
    wire          aluov;

    /****Shifter****/
    output [31:0] result;


    always @(posedge clock or negedge reset )begin
        if (~reset) begin
            //zerar todos os registradores na descida
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
