//sudolshw@gmail.com

/*
*   Implementa o estágio de execução responsável por receber
*   do estágio de decodificação os operandos e a operação 
*   a ser realizada. O resultado é passado para o estágio de memória
*   Depende da Alu e do Shifter.
*/

module Execute (
    //operações do estágio de busca na subida do clock
	input	            clock,

    //coloca todos os registradores em 0 na borda de descida
    input               reset,

    /****Decode****/

    //seleciona entre o resultado da Alu ou do Shifter
    input               id_ex_selalushift,

    //define o que será conectado na porta b da Alu
    //1: id_ex_imedext deve ser conectado
    //0: id_ex_regb deve ser conectado
    input               id_ex_selimregb,

    //deve ser conectado na porta op da Alu    
    input       [2:0]   id_ex_aluop,

    //deve ser conectado na porta unsig da Alu
    input               id_ex_unsig,

    //deve ser conectado na porta shiftop do Shifter
    input       [1:0]   id_ex_shiftop,

    //deve ser conectado na porta shiftamt do Shifter
    input       [4:0]   id_ex_shiftamt,

    //deve ser conectado na porta a da Alu
    input       [31:0]  id_ex_rega,

    //indica que a instrução fará uma leitura
    input               id_ex_readmem,

    //indica que a instrução fará uma escrita
    input               id_ex_writemem,

    //deve ser conectado na porta in do Shifter
    input       [31:0]  id_ex_regb,

    //contem o valor imediato para instruções que operam imediatos
    input       [31:0]  id_ex_imedext,

    //sinais a serem repassados para o estágio de memória
    input               id_ex_selwsource,
    input       [4:0]   id_ex_regdest,

    //indica escrita no banco de registradores
    input               id_ex_writereg,

    //indica escrita no banco de registradores 
    //mesmo com overflow na Alu
    input               id_ex_writeov,

    /****Fetch****/

    //indica que um stall deve ser inserido, setar em  1..
    //..se id_ex_readmem==1 ou id_ex_writemem==1
    output reg          id_if_stall,

    /****Memory****/

    //recebem o id_ex_<correspondente>
    output reg          id_mem_readmem,
    output reg          id_mem_writemem,
    output reg  [31:0]  id_mem_regb,
    output reg          id_mem_selwsource,
    output reg  [4:0]   id_mem_regdest,

    //recebe (!aluov | id_ex_writeov) & id_ex_writereg
    output reg          id_mem_writereg,

    //recebe a saida do shifter caso id_ex_selalushift==1
    //senão recebe a saída da Alu
    output reg  [31:0]  id_mem_wbvalue,
);
    Alu ALU(...);
    Shifter SHIFTER(...);

endmodule
