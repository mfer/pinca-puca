module Memory_tb;
	reg clock;
	reg reset;
	
	//Execute
	reg ex_mem_readmem;
	reg ex_mem_writemem;
	reg [31:0] ex_mem_regb;
	reg ex_mem_selwsource;
	reg [4:0] ex_mem_regdest;
	reg ex_mem_writereg;
	reg [31:0] ex_mem_wbvalue;

	//Memory Controller
	wire mem_mc_rw;
	wire mem_mc_en;
	wire [17:0] mem_mc_addr;
	wire [31:0] mem_mc_data;
	
	//Writeback
	wire [4:0] mem_wb_regdest;
	wire mem_wb_writereg;
	wire [31:0]mem_wb_wbvalue;
	
	Memory dut(clock, reset, ex_mem_readmem, ex_mem_writemem, ex_mem_regb,
				ex_mem_selwsource, ex_mem_regdest, ex_mem_writereg, ex_mem_wbvalue,
				mem_mc_rw, mem_mc_en, mem_mc_addr, mem_mc_data, mem_wb_regdest, 
				mem_wb_writereg, mem_wb_wbvalue);
	
	assign mem_mc_data = 8;
	
	initial begin
		clock = 0;
		
		ex_mem_readmem = 0;
		ex_mem_writemem = 0;
		ex_mem_regb = 9;
		ex_mem_selwsource = 0;
		ex_mem_regdest = 64;
		ex_mem_writereg = 1;
		ex_mem_wbvalue = 8;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("SLLV\nmem_mc_rw: Valor esperado: 0 Valor Real: %b\n", mem_mc_rw);
		$display("mem_mc_en: Valor Esperado: 0 Valor Real: %b\n", mem_mc_en);
		$display("mem_mc_addr: Valor Esperado: %b Valor Real: %b\n", ex_mem_wbvalue [17:0], mem_mc_addr);
		$display("mem_wb_regdest: Valor Esperado: %b Valor Real: %b\n",ex_mem_regb, mem_wb_regdest);
		$display("mem_wb_writereg: Valor Esperado: 1 Valor Real: %b\n", mem_wb_writereg);
		$display("mem_wb_wbvalue: Valor esperado %b Valor Real: %b\n", ex_mem_wbvalue, mem_wb_wbvalue);
		
		ex_mem_readmem = 0;
		ex_mem_writemem = 0;
		ex_mem_regb = 9;
		ex_mem_regdest = 64;
		ex_mem_writereg = 0;
		ex_mem_wbvalue = 8;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("JR\nmem_mc_rw: Valor esperado: 0 Valor Real: %b\n", mem_mc_rw);
		$display("mem_mc_en: Valor Esperado: 0 Valor Real: %b\n", mem_mc_en);
		$display("mem_mc_addr: Valor Esperado: %b Valor Real: %b\n", ex_mem_wbvalue [17:0], mem_mc_addr);
		$display("mem_wb_regdest: Valor Esperado: %b Valor Real: %b\n",ex_mem_regb, mem_wb_regdest);
		$display("mem_wb_writereg: Valor Esperado: 0 Valor Real: %b\n", mem_wb_writereg);
		$display("mem_wb_wbvalue: Valor esperado %b Valor Real: %b\n", ex_mem_selwsource, mem_wb_wbvalue);
		
		ex_mem_readmem = 0;
		ex_mem_writemem = 0;
		ex_mem_selwsource = 0;
		ex_mem_regb = 9;
		ex_mem_regdest = 64;
		ex_mem_writereg = 0;
		ex_mem_wbvalue = 8;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("ADD\nmem_mc_rw: Valor esperado: 0 Valor Real: %b\n", mem_mc_rw);
		$display("mem_mc_en: Valor Esperado: 0 Valor Real: %b\n", mem_mc_en);
		$display("mem_mc_addr: Valor Esperado: %b Valor Real: %b\n", ex_mem_wbvalue [17:0], mem_mc_addr);
		$display("mem_wb_regdest: Valor Esperado: %b Valor Real: %b\n",ex_mem_regb, mem_wb_regdest);
		$display("mem_wb_writereg: Valor Esperado: 0 Valor Real: %b\n", mem_wb_writereg);
		$display("mem_wb_wbvalue: Valor esperado %b Valor Real: %b\n", ex_mem_wbvalue, mem_wb_wbvalue);
		
		ex_mem_readmem = 0;
		ex_mem_writemem = 0;
		ex_mem_regb = 9;
		ex_mem_regdest = 64;
		ex_mem_writereg = 0;
		ex_mem_wbvalue = 8;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("J\nmem_mc_rw: Valor esperado: 0 Valor Real: %b\n", mem_mc_rw);
		$display("mem_mc_en: Valor Esperado: 0 Valor Real: %b\n", mem_mc_en);
		$display("mem_mc_addr: Valor Esperado: %b Valor Real: %b\n", ex_mem_wbvalue [17:0], mem_mc_addr);
		$display("mem_wb_regdest: Valor Esperado: %b Valor Real: %b\n",ex_mem_regb, mem_wb_regdest);
		$display("mem_wb_writereg: Valor Esperado: 0 Valor Real: %b\n", mem_wb_writereg);
		$display("mem_wb_wbvalue: Valor esperado %b Valor Real: %b\n", ex_mem_selwsource, mem_wb_wbvalue);
		
		ex_mem_readmem = 0;
		ex_mem_writemem = 0;
		ex_mem_regb = 9;
		ex_mem_regdest = 64;
		ex_mem_writereg = 0;
		ex_mem_wbvalue = 8;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("BEQ\nmem_mc_rw: Valor esperado: 0 Valor Real: %b\n", mem_mc_rw);
		$display("mem_mc_en: Valor Esperado: 0 Valor Real: %b\n", mem_mc_en);
		$display("mem_mc_addr: Valor Esperado: %b Valor Real: %b\n", ex_mem_wbvalue [17:0], mem_mc_addr);
		$display("mem_wb_regdest: Valor Esperado: %b Valor Real: %b\n",ex_mem_regb, mem_wb_regdest);
		$display("mem_wb_writereg: Valor Esperado: 0 Valor Real: %b\n", mem_wb_writereg);
		$display("mem_wb_wbvalue: Valor esperado %b Valor Real: %b\n", ex_mem_selwsource, mem_wb_wbvalue);
		
		ex_mem_readmem = 0;
		ex_mem_writemem = 0;
		ex_mem_regb = 9;
		ex_mem_regdest = 64;
		ex_mem_writereg = 0;
		ex_mem_wbvalue = 8;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("BGTZ\nmem_mc_rw: Valor esperado: 0 Valor Real: %b\n", mem_mc_rw);
		$display("mem_mc_en: Valor Esperado: 0 Valor Real: %b\n", mem_mc_en);
		$display("mem_mc_addr: Valor Esperado: %b Valor Real: %b\n", ex_mem_wbvalue [17:0], mem_mc_addr);
		$display("mem_wb_regdest: Valor Esperado: %b Valor Real: %b\n",ex_mem_regb, mem_wb_regdest);
		$display("mem_wb_writereg: Valor Esperado: 0 Valor Real: %b\n", mem_wb_writereg);
		$display("mem_wb_wbvalue: Valor esperado %b Valor Real: %b\n", ex_mem_selwsource, mem_wb_wbvalue);
		
		ex_mem_readmem = 0;
		ex_mem_writemem = 0;
		ex_mem_regb = 9;
		ex_mem_regdest = 64;
		ex_mem_writereg = 1;
		ex_mem_wbvalue = 8;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("ADDI\nmem_mc_rw: Valor esperado: 0 Valor Real: %b\n", mem_mc_rw);
		$display("mem_mc_en: Valor Esperado: 0 Valor Real: %b\n", mem_mc_en);
		$display("mem_mc_addr: Valor Esperado: %b Valor Real: %b\n", ex_mem_wbvalue [17:0], mem_mc_addr);
		$display("mem_wb_regdest: Valor Esperado: %b Valor Real: %b\n",ex_mem_regb, mem_wb_regdest);
		$display("mem_wb_writereg: Valor Esperado: 1 Valor Real: %b\n", mem_wb_writereg);
		$display("mem_wb_wbvalue: Valor esperado %b Valor Real: %b\n", ex_mem_selwsource, mem_wb_wbvalue);
		
		ex_mem_readmem = 1;
		ex_mem_writemem = 0;
		ex_mem_selwsource = 1;
		ex_mem_regb = 9;
		ex_mem_regdest = 64;
		ex_mem_writereg = 1;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("LW\nmem_mc_rw: Valor esperado: 0 Valor Real: %b\n", mem_mc_rw);
		$display("mem_mc_en: Valor Esperado: 1 Valor Real: %b\n", mem_mc_en);
		$display("mem_mc_addr: Valor Esperado: %b Valor Real: %b\n", ex_mem_wbvalue [17:0], mem_mc_addr);
		$display("mem_wb_regdest: Valor Esperado: %b Valor Real: %b\n",ex_mem_regb, mem_wb_regdest);
		$display("mem_wb_writereg: Valor Esperado: 1 Valor Real: %b\n", mem_wb_writereg);
		$display("mem_wb_wbvalue: Valor esperado %b Valor Real: %b\n", mem_mc_data, mem_wb_wbvalue);
		
		ex_mem_readmem = 0;
		ex_mem_writemem = 1;
		ex_mem_regb = 9;
		ex_mem_regdest = 64;
		ex_mem_writereg = 0;
		clock = ~clock;
		clock = ~clock;
		#10
		$display("SW\nmem_mc_rw: Valor esperado: 1 Valor Real: %b\n", mem_mc_rw);
		$display("mem_mc_en: Valor Esperado: 1 Valor Real: %b\n", mem_mc_en);
		$display("mem_mc_addr: Valor Esperado: %b Valor Real: %b\n", ex_mem_wbvalue [17:0], mem_mc_addr);
		$display("mem_wb_regdest: Valor Esperado: %b Valor Real: %b\n",ex_mem_regb, mem_wb_regdest);
		$display("mem_wb_writereg: Valor Esperado: 0 Valor Real: %b\n", mem_wb_writereg);
		$display("mem_wb_wbvalue: Valor esperado %b Valor Real: %b\n", mem_mc_data, mem_wb_wbvalue);
		
		$finish;
	end
endmodule