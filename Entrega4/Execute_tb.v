module Execute_tb;
	reg clock;
	reg reset;
	
	//Decode
	reg id_ex_selalushift;
	reg id_ex_selimregb;
	reg [2:0] id_ex_aluop;
	reg id_ex_unsig;
	reg [1:0] id_ex_shiftop;
	reg [4:0] id_ex_shiftamt;
	reg [31:0] id_ex_rega;
	reg id_ex_readmem;
	reg id_ex_writemem;
	reg [31:0]id_ex_regb;
	reg [31:0]id_ex_imedext;
	reg id_ex_selwsource;
	reg [4:0] id_ex_regdest;
	reg id_ex_writereg;
	reg id_ex_writeov;
	
	//Fetch
	wire ex_if_stall;
	
	//Memory
	wire ex_mem_readmem;
	wire ex_mem_writemem;
	wire [31:0]ex_mem_regb;
	wire ex_mem_selwsource;
	wire [4:0] ex_mem_regdest;
	wire ex_mem_writereg;
	wire [31:0] ex_mem_wbvalue;

	Execute dut (clock, reset, id_ex_selalushift, id_ex_selimregb, id_ex_aluop,
				 id_ex_unsig, id_ex_shiftop, id_ex_shiftamt, id_ex_rega, id_ex_readmem,
				 id_ex_writemem, id_ex_regb, id_ex_imedext, id_ex_selwsource, id_ex_regdest,
				 id_ex_writereg, id_ex_writeov, ex_if_stall, ex_mem_readmem, ex_mem_writemem,
				 ex_mem_regb, ex_mem_selwsource, ex_mem_regdest, ex_mem_writereg, ex_mem_wbvalue);
		
	initial begin
		clock =0;
		id_ex_selalushift = 1;
		id_ex_selimregb = 0; 
		id_ex_shiftop = 2'b10;
		id_ex_shiftamt = 5'b00001;
		id_ex_rega = 32'b_10;
		id_ex_readmem = 0;
		id_ex_writemem = 0;
		id_ex_regb = 31;
		id_ex_imedext = 16'b0;
		id_ex_selwsource = 0;
		id_ex_writereg = 1;
		id_ex_writeov = 1;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("SLLV\nex_if_stall: Valor esperado: 1 Valor Real: %b\n", ex_if_stall);
		$display("ex_mem_readmem: Valor Esperado: %b Valor Real: %b\n", id_ex_readmem, ex_mem_readmem);
		$display("ex_mem_writemem: Valor Esperado: %b Valor Real: %b\n", id_ex_writemem, ex_mem_writemem);
		$display("ex_mem_regb: Valor Esperado: %b Valor Real: %b\n",id_ex_regb, ex_mem_regb);
		$display("ex_mem_selwsource: Valor Esperado: 0 Valor Real: %b\n", ex_mem_selwsource);
		$display("ex_mem_regdest: Valor Real: %b\n", ex_mem_regdest);
		$display("ex_mem_writereg: Valor Esperado: 1 Valor Real: %b\n", ex_mem_writereg);
		$display("ex_mem_wbvalue: Valor Real: %b\n", ex_mem_wbvalue);
		
		id_ex_rega = 32'b_10;
		id_ex_readmem = 0;
		id_ex_writemem = 0;
		id_ex_regb = 31;
		id_ex_imedext = 8;
		id_ex_writereg = 0;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("JR\nex_if_stall: Valor esperado: 0 Valor Real: %b\n", ex_if_stall);
		$display("ex_mem_readmem: Valor Esperado: %b Valor Real: %b\n", id_ex_readmem, ex_mem_readmem);
		$display("ex_mem_writemem: Valor Esperado: %b Valor Real: %b\n", id_ex_writemem, ex_mem_writemem);
		$display("ex_mem_regb: Valor Esperado: %b Valor Real: %b\n",id_ex_regb, ex_mem_regb);
		$display("ex_mem_selwsource: Valor Esperado: x Valor Real: %b\n", ex_mem_selwsource);
		$display("ex_mem_regdest: Valor Real: %b\n", ex_mem_regdest);
		$display("ex_mem_writereg: Valor Esperado: 0 Valor Real: %b\n", ex_mem_writereg);
		$display("ex_mem_wbvalue: Valor Real: %b\n", ex_mem_wbvalue);
		
		id_ex_selalushift = 0;
		id_ex_selimregb = 0; 
		id_ex_aluop = 3'b010;
		id_ex_unsig = 0;
		id_ex_shiftamt = 5'b00001;
		id_ex_rega = 32'b_10;
		id_ex_readmem = 0;
		id_ex_writemem = 0;
		id_ex_regb = 31;
		id_ex_imedext = 16'b0;
		id_ex_selwsource = 0;
		id_ex_writereg = 1;
		id_ex_writeov = 0;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("ADD\nex_if_stall: Valor esperado: 0 Valor Real: %b\n", ex_if_stall);
		$display("ex_mem_readmem: Valor Esperado: %b Valor Real: %b\n", id_ex_readmem, ex_mem_readmem);
		$display("ex_mem_writemem: Valor Esperado: %b Valor Real: %b\n", id_ex_writemem, ex_mem_writemem);
		$display("ex_mem_regb: Valor Esperado: %b Valor Real: %b\n",id_ex_regb, ex_mem_regb);
		$display("ex_mem_selwsource: Valor Esperado: 0 Valor Real: %b\n", ex_mem_selwsource);
		$display("ex_mem_regdest: Valor Real: %b\n", ex_mem_regdest);
		$display("ex_mem_writereg: Valor Real: %b\n", ex_mem_writereg);
		$display("ex_mem_wbvalue: Valor Real: %b\n", ex_mem_wbvalue);
		
		id_ex_rega = 8;
		id_ex_readmem = 0;
		id_ex_writemem = 0;
		id_ex_regb = 31;
		id_ex_imedext = 8;
		id_ex_writereg = 0;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("J\nex_if_stall: Valor esperado: 0 Valor Real: %b\n", ex_if_stall);
		$display("ex_mem_readmem: Valor Esperado: %b Valor Real: %b\n", id_ex_readmem, ex_mem_readmem);
		$display("ex_mem_writemem: Valor Esperado: %b Valor Real: %b\n", id_ex_writemem, ex_mem_writemem);
		$display("ex_mem_regb: Valor Esperado: %b Valor Real: %b\n",id_ex_regb, ex_mem_regb);
		$display("ex_mem_selwsource: Valor Esperado: x Valor Real: %b\n", ex_mem_selwsource);
		$display("ex_mem_regdest: Valor Real: %b\n", ex_mem_regdest);
		$display("ex_mem_writereg: Valor Esperado: 0 Valor Real: %b\n", ex_mem_writereg);
		$display("ex_mem_wbvalue: Valor Real: %b\n", ex_mem_wbvalue);
		
		id_ex_unsig = 0;
		id_ex_shiftamt = 5'b00001;
		id_ex_rega = 32'b_10;
		id_ex_readmem = 0;
		id_ex_writemem = 0;
		id_ex_regb = 31;
		id_ex_imedext = 16'b0;
		id_ex_writereg = 0;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("BEQ\nex_if_stall: Valor esperado: 0 Valor Real: %b\n", ex_if_stall);
		$display("ex_mem_readmem: Valor Esperado: %b Valor Real: %b\n", id_ex_readmem, ex_mem_readmem);
		$display("ex_mem_writemem: Valor Esperado: %b Valor Real: %b\n", id_ex_writemem, ex_mem_writemem);
		$display("ex_mem_regb: Valor Esperado: %b Valor Real: %b\n",id_ex_regb, ex_mem_regb);
		$display("ex_mem_selwsource: Valor Esperado: x Valor Real: %b\n", ex_mem_selwsource);
		$display("ex_mem_regdest: Valor Real: %b\n", ex_mem_regdest);
		$display("ex_mem_writereg: Valor Real: %b\n", ex_mem_writereg);
		$display("ex_mem_wbvalue: Valor Real: %b\n", ex_mem_wbvalue);
		
		id_ex_unsig = 0;
		id_ex_shiftamt = 5'b00001;
		id_ex_rega = 32'b_10;
		id_ex_readmem = 0;
		id_ex_writemem = 0;
		id_ex_regb = 31;
		id_ex_imedext = 16'b0;
		id_ex_writereg = 0;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("BGTZ\nex_if_stall: Valor esperado: 0 Valor Real: %b\n", ex_if_stall);
		$display("ex_mem_readmem: Valor Esperado: %b Valor Real: %b\n", id_ex_readmem, ex_mem_readmem);
		$display("ex_mem_writemem: Valor Esperado: %b Valor Real: %b\n", id_ex_writemem, ex_mem_writemem);
		$display("ex_mem_regb: Valor Esperado: %b Valor Real: %b\n",id_ex_regb, ex_mem_regb);
		$display("ex_mem_selwsource: Valor Esperado: x Valor Real: %b\n", ex_mem_selwsource);
		$display("ex_mem_regdest: Valor Real: %b\n", ex_mem_regdest);
		$display("ex_mem_writereg: VAlor Esperado: 0 Valor Real: %b\n", ex_mem_writereg);
		$display("ex_mem_wbvalue: Valor Real: %b\n", ex_mem_wbvalue);
		
		id_ex_aluop = 3'b010;
		id_ex_unsig = 0;
		id_ex_shiftamt = 5'b00001;
		id_ex_rega = 32'b_10;
		id_ex_readmem = 0;
		id_ex_writemem = 0;
		id_ex_regb = 31;
		id_ex_imedext = 16'b0;
		id_ex_writereg = 0;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("ADDI\nex_if_stall: Valor esperado: 0 Valor Real: %b\n", ex_if_stall);
		$display("ex_mem_readmem: Valor Esperado: %b Valor Real: %b\n", id_ex_readmem, ex_mem_readmem);
		$display("ex_mem_writemem: Valor Esperado: %b Valor Real: %b\n", id_ex_writemem, ex_mem_writemem);
		$display("ex_mem_regb: Valor Esperado: %b Valor Real: %b\n",id_ex_regb, ex_mem_regb);
		$display("ex_mem_selwsource: Valor Esperado: x Valor Real: %b\n", ex_mem_selwsource);
		$display("ex_mem_regdest: Valor Real: %b\n", ex_mem_regdest);
		$display("ex_mem_writereg: Valor Esperado 0 Valor Real: %b\n", ex_mem_writereg);
		$display("ex_mem_wbvalue: Valor Real: %b\n", ex_mem_wbvalue);
		
		id_ex_selalushift = 0;
		id_ex_selimregb = 1; 
		id_ex_aluop = 3'b010;
		id_ex_unsig = 0;
		id_ex_shiftamt = 5'b00001;
		id_ex_rega = 32'b_10;
		id_ex_selwsource = 1;
		id_ex_readmem = 1;
		id_ex_writemem = 0;
		id_ex_regb = 31;
		id_ex_imedext = 16'b0;
		id_ex_writereg = 1;
		id_ex_writeov = 1;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("LW\nex_if_stall: Valor esperado: 1 Valor Real: %b\n", ex_if_stall);
		$display("ex_mem_readmem: Valor Esperado: %b Valor Real: %b\n", id_ex_readmem, ex_mem_readmem);
		$display("ex_mem_writemem: Valor Esperado: %b Valor Real: %b\n", id_ex_writemem, ex_mem_writemem);
		$display("ex_mem_regb: Valor Esperado: %b Valor Real: %b\n",id_ex_regb, ex_mem_regb);
		$display("ex_mem_selwsource: Valor Esperado: 1 Valor Real: %b\n", ex_mem_selwsource);
		$display("ex_mem_regdest: Valor Real: %b\n", ex_mem_regdest);
		$display("ex_mem_writereg: Valor Esperado 1 Valor Real: %b\n", ex_mem_writereg);
		$display("ex_mem_wbvalue: Valor Real: %b\n", ex_mem_wbvalue);
		
		id_ex_selalushift = 0;
		id_ex_selimregb = 1; 
		id_ex_aluop = 3'b010;
		id_ex_unsig = 0;
		id_ex_shiftamt = 5'b00001;
		id_ex_rega = 32'b_10;
		id_ex_readmem = 0;
		id_ex_writemem = 1;
		id_ex_regb = 31;
		id_ex_imedext = 16'b0;
		id_ex_writereg = 0;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("LW\nex_if_stall: Valor esperado: 1 Valor Real: %b\n", ex_if_stall);
		$display("ex_mem_readmem: Valor Esperado: %b Valor Real: %b\n", id_ex_readmem, ex_mem_readmem);
		$display("ex_mem_writemem: Valor Esperado: %b Valor Real: %b\n", id_ex_writemem, ex_mem_writemem);
		$display("ex_mem_regb: Valor Esperado: %b Valor Real: %b\n",id_ex_regb, ex_mem_regb);
		$display("ex_mem_selwsource: Valor Esperado: x Valor Real: %b\n", ex_mem_selwsource);
		$display("ex_mem_regdest: Valor Real: %b\n", ex_mem_regdest);
		$display("ex_mem_writereg: Valor Esperado 0 Valor Real: %b\n", ex_mem_writereg);
		$display("ex_mem_wbvalue: Valor Real: %b\n", ex_mem_wbvalue);
		
		
		$finish;
		
	end
endmodule