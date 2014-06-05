
module Decode_tb;

reg clock;
reg reset;

// Fecth

wire [31:0]if_id_instruc;
wire [31:0]if_id_nextpc;
wire id_if_selpcsource;
wire [31:0]id_if_rega;
wire [31:0]id_if_pcimd2ext;
wire [31:0]id_if_pcindex;
wire [1:0]id_if_selpctype;

// Execute
wire id_ex_selalushift;
wire id_ex_selimregb;
wire [2:0]id_ex_aluop;
wire id_ex_unsig;
wire [1:0]id_ex_shiftop;
wire [4:0]id_ex_shiftamt;
wire [31:0]id_ex_rega;
wire id_ex_readmem;
wire id_ex_writemem;
wire [31:0]id_ex_regb;
wire [31:0]id_ex_imedext;
wire id_ex_selwsource;
wire [4:0]id_ex_regdest;
wire id_ex_writereg;
wire id_ex_writeov;

// Registers

wire [4:0]id_reg_addra;
wire [4:0]id_reg_addrb;
wire [31:0]reg_id_dataa;
wire [31:0]reg_id_datab;
reg [31:0]reg_id_ass_dataa;
reg [31:0]reg_id_ass_datab;

Decode dut (clock, reset, if_id_instruc, if_id_nextpc, id_if_selpcsource,
			id_if_rega, id_if_pcimd2ext, id_if_pcindex, id_if_selpctype,
			id_ex_selalushift, id_ex_selimregb, id_ex_aluop, id_ex_unsig,
			id_ex_shiftop, id_ex_shiftamt, id_ex_rega, id_ex_readmem,
			id_ex_writemem, id_ex_regb, id_ex_imedext, id_ex_selwsource,
			id_ex_regdest, id_ex_writereg, id_ex_writeov, id_reg_addra,
			id_reg_addrb, reg_id_dataa, reg_id_datab,reg_id_ass_dataa,reg_id_ass_datab
);

reg  a;
reg b;
reg c;
reg d;

assign if_id_instruc = a;
assign if_id_nextpc = b;
assign reg_id_dataa = c;
assign reg_id_datab = d;

initial
	begin
	//$display("%b\n",.op(if_id_instruc [31:26]));
	clock = 0;
	reset = 1;
	clock =~clock;
	clock=~clock;
	reset =0;
	clock =~clock;
	clock=~clock;
	// TESTA SHIFT 1 Shift Logico Left R1 R2 R1 Shift de 1
	a= 32'b00000000001000100000100000000100;
	c = 8;
	d = 2;
	b = 4;
	clock = ~clock;
	clock = ~clock;
	#10
	$display("SLVL:\nid_if_selpcsource: Valor Esperado: 0 Valor Real: %b\n",id_if_selpcsource);
	$display("id_if_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_ass_dataa,id_if_rega);
	$display("reg_id_dataa: %d reg_id_datab: %d\n",reg_id_dataa,reg_id_datab);
	$display("reg_id_ass_dataa: Valor Esperado: %d Valor Real: %d\n reg_id_ass_datab: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,reg_id_ass_dataa,reg_id_datab,reg_id_ass_datab);
	$display("id_if_pcimd2ext: %b\n",id_if_pcimd2ext);
	$display("id_if_pcindex: %b\n",id_if_pcindex);
	$display("id_if_selpctype: Valor Esperado: XX Valor Real: %b\n",id_if_selpctype);
	$display("id_ex_selalushift: Valor Esperado: 1 Valor Real: %b\n",id_ex_selalushift);
	$display("id_ex_selimregb: Valor Esperado: 0 Valor Real: %b\n",id_ex_selimregb);
	$display("id_ex_aluop: Valor Esperado: XXX Valor Real: %b\n",id_ex_aluop);
	$display("id_ex_unsig: Valor Esperado: X Valor Real: %b\n",id_ex_unsig);
	$display("id_ex_shiftop: Valor Esperado: 10 Valor Real: %b\n",id_ex_shiftop);
	$display("id_ex_shiftamt: Valor Esperado: %d Valor Real: %d\n",id_reg_addra,id_ex_shiftamt);
	$display("id_ex_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,id_ex_rega);
	$display("id_ex_readmem: Valor Esperado: 0 Valor Real: %b\n",id_ex_readmem);
	$display("id_ex_writemem:  Valor Esperado: 0 Valor Real: %b\n",id_ex_writemem);
	$display("id_ex_regb: Valor Esperado: %d Valor Real: %d\n",reg_id_datab,id_ex_regb);
	$display("id_ex_imedext: Valor Esperado: 00000000000000000000100000000100 Valor Real: %b\n",id_ex_imedext);
	$display("id_ex_selwsource: Valor Esperado: 0 Valor Real: %b\n",id_ex_selwsource);
	$display("id_ex_regdest: Valor Esperado: 00001 Valor Real %b\n",id_ex_regdest);
	$display("id_ex_writereg: Valor Esperado: 1 Valor Real: %b\n",id_ex_writereg);
	$display("id_ex_writeov: Valor Esperado: 1 Valor Real: %b\n",id_ex_writeov);
	$display("id_reg_addra: Valor Esperado: 00001 Valor Real: %b\n",id_reg_addra);
	$display("id_reg_addrb: Valor Esperado: 00010 Valor Real: %b\n",id_reg_addrb);

	// TESTA JR 1 R1 R3 R31 de 1
	a= 32'b00000000001000100001111111001000;
	c = 8;
	d = 2;
	b = 4;
	clock = ~clock;
	clock = ~clock;
	#10
	$display("JR:\nid_if_selpcsource: Valor Esperado: 1 Valor Real: %b\n",id_if_selpcsource);
	$display("id_if_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_ass_dataa,id_if_rega);
	$display("reg_id_dataa: %d reg_id_datab: %d\n",reg_id_dataa,reg_id_datab);
	$display("reg_id_ass_dataa: Valor Esperado: %d Valor Real: %d\n reg_id_ass_datab: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,reg_id_ass_dataa,reg_id_datab,reg_id_ass_datab);
	$display("id_if_pcimd2ext: %b\n",id_if_pcimd2ext);
	$display("id_if_pcindex: %b\n",id_if_pcindex);
	$display("id_if_selpctype: Valor Esperado: 01 Valor Real: %b\n",id_if_selpctype);
	$display("id_ex_selalushift: Valor Esperado: X Valor Real: %b\n",id_ex_selalushift);
	$display("id_ex_selimregb: Valor Esperado: X Valor Real: %b\n",id_ex_selimregb);
	$display("id_ex_aluop: Valor Esperado: XXX Valor Real: %b\n",id_ex_aluop);
	$display("id_ex_unsig: Valor Esperado: X Valor Real: %b\n",id_ex_unsig);
	$display("id_ex_shiftop: Valor Esperado: XX Valor Real: %b\n",id_ex_shiftop);
	$display("id_ex_shiftamt: Valor Esperado: 11111 Valor Real: %d\n",id_ex_shiftamt);
	$display("id_ex_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,id_ex_rega);
	$display("id_ex_readmem: Valor Esperado: 0 Valor Real: %b\n",id_ex_readmem);
	$display("id_ex_writemem:  Valor Esperado: 0 Valor Real: %b\n",id_ex_writemem);
	$display("id_ex_regb: Valor Esperado: %d Valor Real: %d\n",reg_id_datab,id_ex_regb);
	$display("id_ex_imedext: Valor Esperado: 00000000000000000001111111001000 Valor Real: %b\n",id_ex_imedext);
	$display("id_ex_selwsource: Valor Esperado: X Valor Real: %b\n",id_ex_selwsource);
	$display("id_ex_regdest: Valor Esperado: 00011 Valor Real %b\n",id_ex_regdest);
	$display("id_ex_writereg: Valor Esperado: 0 Valor Real: %b\n",id_ex_writereg);
	$display("id_ex_writeov: Valor Esperado: X Valor Real: %b\n",id_ex_writeov);
	$display("id_reg_addra: Valor Esperado: 00001 Valor Real: %b\n",id_reg_addra);
	$display("id_reg_addrb: Valor Esperado: 00010 Valor Real: %b\n",id_reg_addrb);
	
	// 1 add R1 R3 R31 
	a= 32'b00000000001000100001111111100000;
	c = 8;
	d = 2;
	b = 4;
	clock = ~clock;
	clock = ~clock;
	#10
	$display("ADD:\nid_if_selpcsource: Valor Esperado: 0 Valor Real: %b\n",id_if_selpcsource);
	$display("id_if_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_ass_dataa,id_if_rega);
	$display("reg_id_dataa: %d reg_id_datab: %d\n",reg_id_dataa,reg_id_datab);
	$display("reg_id_ass_dataa: Valor Esperado: %d Valor Real: %d\n reg_id_ass_datab: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,reg_id_ass_dataa,reg_id_datab,reg_id_ass_datab);
	$display("id_if_pcimd2ext: %b\n",id_if_pcimd2ext);
	$display("id_if_pcindex: %b\n",id_if_pcindex);
	$display("id_if_selpctype: Valor Esperado: XX Valor Real: %b\n",id_if_selpctype);
	$display("id_ex_selalushift: Valor Esperado: 0 Valor Real: %b\n",id_ex_selalushift);
	$display("id_ex_selimregb: Valor Esperado: 0 Valor Real: %b\n",id_ex_selimregb);
	$display("id_ex_aluop: Valor Esperado: 010 Valor Real: %b\n",id_ex_aluop);
	$display("id_ex_unsig: Valor Esperado: 0 Valor Real: %b\n",id_ex_unsig);
	$display("id_ex_shiftop: Valor Esperado: XX Valor Real: %b\n",id_ex_shiftop);
	$display("id_ex_shiftamt: Valor Esperado: 11111 Valor Real: %d\n",id_ex_shiftamt);
	$display("id_ex_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,id_ex_rega);
	$display("id_ex_readmem: Valor Esperado: 0 Valor Real: %b\n",id_ex_readmem);
	$display("id_ex_writemem:  Valor Esperado: 0 Valor Real: %b\n",id_ex_writemem);
	$display("id_ex_regb: Valor Esperado: %d Valor Real: %d\n",reg_id_datab,id_ex_regb);
	$display("id_ex_imedext: Valor Esperado: 00000000000000000001111111100000 Valor Real: %b\n",id_ex_imedext);
	$display("id_ex_selwsource: Valor Esperado: 0 Valor Real: %b\n",id_ex_selwsource);
	$display("id_ex_regdest: Valor Esperado: 00011 Valor Real %b\n",id_ex_regdest);
	$display("id_ex_writereg: Valor Esperado: 1 Valor Real: %b\n",id_ex_writereg);
	$display("id_ex_writeov: Valor Esperado: 0 Valor Real: %b\n",id_ex_writeov);
	$display("id_reg_addra: Valor Esperado: 00001 Valor Real: %b\n",id_reg_addra);
	$display("id_reg_addrb: Valor Esperado: 00010 Valor Real: %b\n",id_reg_addrb);

	// 1 jump 0
	a= 32'b00001000000000000000000000000001;
	c = 8;
	d = 2;
	b = 4;
	clock = ~clock;
	clock = ~clock;
	#10
	$display("JUMP:\nid_if_selpcsource: Valor Esperado: 1 Valor Real: %b\n",id_if_selpcsource);
	$display("id_if_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_ass_dataa,id_if_rega);
	$display("reg_id_dataa: %d reg_id_datab: %d\n",reg_id_dataa,reg_id_datab);
	$display("reg_id_ass_dataa: Valor Esperado: %d Valor Real: %d\n reg_id_ass_datab: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,reg_id_ass_dataa,reg_id_datab,reg_id_ass_datab);
	$display("id_if_pcimd2ext: %b\n",id_if_pcimd2ext);
	$display("id_if_pcindex: %b\n",id_if_pcindex);
	$display("id_if_selpctype: Valor Esperado: 10 Valor Real: %b\n",id_if_selpctype);
	$display("id_ex_selalushift: Valor Esperado: X Valor Real: %b\n",id_ex_selalushift);
	$display("id_ex_selimregb: Valor Esperado: X Valor Real: %b\n",id_ex_selimregb);
	$display("id_ex_aluop: Valor Esperado: XXX Valor Real: %b\n",id_ex_aluop);
	$display("id_ex_unsig: Valor Esperado: X Valor Real: %b\n",id_ex_unsig);
	$display("id_ex_shiftop: Valor Esperado: XX Valor Real: %b\n",id_ex_shiftop);
	$display("id_ex_shiftamt: Valor Esperado: 00000 Valor Real: %d\n",id_ex_shiftamt);
	$display("id_ex_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,id_ex_rega);
	$display("id_ex_readmem: Valor Esperado: 0 Valor Real: %b\n",id_ex_readmem);
	$display("id_ex_writemem:  Valor Esperado: 0 Valor Real: %b\n",id_ex_writemem);
	$display("id_ex_regb: Valor Esperado: %d Valor Real: %d\n",reg_id_datab,id_ex_regb);
	$display("id_ex_imedext: Valor Esperado: 00000000000000000000000000000001 Valor Real: %b\n",id_ex_imedext);
	$display("id_ex_selwsource: Valor Esperado: X Valor Real: %b\n",id_ex_selwsource);
	$display("id_ex_regdest: Valor Esperado: 00000 Valor Real %b\n",id_ex_regdest);
	$display("id_ex_writereg: Valor Esperado: 0 Valor Real: %b\n",id_ex_writereg);
	$display("id_ex_writeov: Valor Esperado: X Valor Real: %b\n",id_ex_writeov);
	$display("id_reg_addra: Valor Esperado: 00000 Valor Real: %b\n",id_reg_addra);
	$display("id_reg_addrb: Valor Esperado: 00000 Valor Real: %b\n",id_reg_addrb);


	// 1 beq R1 R3 0
	a= 32'b00000000001000100000000000000001;
	c = 8;
	d = 2;
	b = 4;
	clock = ~clock;
	clock = ~clock;
	$display("BEQ:\nid_if_selpcsource:  Valor Real %b\n",id_if_selpcsource);
	$display("id_if_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_ass_dataa,id_if_rega);
	$display("reg_id_dataa: %d reg_id_datab: %d\n",reg_id_dataa,reg_id_datab);
	$display("reg_id_ass_dataa: Valor Esperado: %d Valor Real: %d\n reg_id_ass_datab: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,reg_id_ass_dataa,reg_id_datab,reg_id_ass_datab);
	$display("id_if_pcimd2ext: %b\n",id_if_pcimd2ext);
	$display("id_if_pcindex: %b\n",id_if_pcindex);
	$display("id_if_selpctype: Valor Esperado: 00 Valor Real: %b\n",id_if_selpctype);
	$display("id_ex_selalushift: Valor Esperado: X Valor Real: %b\n",id_ex_selalushift);
	$display("id_ex_selimregb: Valor Esperado: X Valor Real: %b\n",id_ex_selimregb);
	$display("id_ex_aluop: Valor Esperado: XXX Valor Real: %b\n",id_ex_aluop);
	$display("id_ex_unsig: Valor Esperado: 0 Valor Real: %b\n",id_ex_unsig);
	$display("id_ex_shiftop: Valor Esperado: XX Valor Real: %b\n",id_ex_shiftop);
	$display("id_ex_shiftamt: Valor Esperado: 00000 Valor Real: %d\n",id_ex_shiftamt);
	$display("id_ex_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,id_ex_rega);
	$display("id_ex_readmem: Valor Esperado: 0 Valor Real: %b\n",id_ex_readmem);
	$display("id_ex_writemem:  Valor Esperado: 0 Valor Real: %b\n",id_ex_writemem);
	$display("id_ex_regb: Valor Esperado: %d Valor Real: %d\n",reg_id_datab,id_ex_regb);
	$display("id_ex_imedext: Valor Esperado: 00000000000000000000000000000001 Valor Real: %b\n",id_ex_imedext);
	$display("id_ex_selwsource: Valor Esperado: X Valor Real: %b\n",id_ex_selwsource);
	$display("id_ex_regdest: Valor Esperado: 00000 Valor Real %b\n",id_ex_regdest);
	$display("id_ex_writereg: Valor Esperado: 0 Valor Real: %b\n",id_ex_writereg);
	$display("id_ex_writeov: Valor Esperado: X Valor Real: %b\n",id_ex_writeov);
	$display("id_reg_addra: Valor Esperado: 00001 Valor Real: %b\n",id_reg_addra);
	$display("id_reg_addrb: Valor Esperado: 00010 Valor Real: %b\n",id_reg_addrb);
	
	// 1 bgtz R1 0
	a= 32'b00011100001000000000000000000000;
	c = 8;
	d = 2;
	b = 4;
	clock = ~clock;
	clock = ~clock;
	#10
	$display("BGTZ:\nid_if_selpcsource: %b\n",id_if_selpcsource);
	$display("id_if_rega: %b\n",id_if_rega);
	$display("id_if_pcimd2ext: %b\n",id_if_pcimd2ext);
	$display("id_if_pcindex: %b\n",id_if_pcindex);
	$display("id_if_selpctype: %b\n",id_if_selpctype);
	$display("id_ex_selalushift: %b\n",id_ex_selalushift);
	$display("id_ex_selimregb: %b\n",id_ex_selimregb);
	$display("id_ex_aluop: %b\n",id_ex_aluop);
	$display("id_ex_unsig: %b\n",id_ex_unsig);
	$display("id_ex_shiftop: %b\n",id_ex_shiftop);
	$display("id_ex_shiftamt: %b\n",id_ex_shiftamt);
	$display("id_ex_rega: %b\n",id_ex_rega);
	$display("id_ex_readmem: %b\n",id_ex_readmem);
	$display("id_ex_writemem: %b\n",id_ex_writemem);
	$display("id_ex_regb: %b\n",id_ex_regb);
	$display("id_ex_imedext: %b\n",id_ex_imedext);
	$display("id_ex_selwsource: %b\n",id_ex_selwsource);
	$display("id_ex_regdest: %b\n",id_ex_regdest);
	$display("id_ex_writereg: %b\n",id_ex_writereg);
	$display("id_ex_writeov'': %b\n",id_ex_writeov);
	$display("id_reg_addra: %b\n",id_reg_addra);
	$display("id_reg_addrb: %b\n",id_reg_addrb);

	// addi R1 0 Shift de 1
	a= 32'b00100000001000100000000000000001;
	c = 8;
	d = 2;
	b = 4;
	clock = ~clock;
	clock = ~clock;
	#10
	$display("ADDI:\nid_if_selpcsource: Valor Esperado 0 %b\n",id_if_selpcsource);
	$display("id_if_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_ass_dataa,id_if_rega);
	$display("reg_id_dataa: %d reg_id_datab: %d\n",reg_id_dataa,reg_id_datab);
	$display("reg_id_ass_dataa: Valor Esperado: %d Valor Real: %d\n reg_id_ass_datab: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,reg_id_ass_dataa,reg_id_datab,reg_id_ass_datab);
	$display("id_if_pcimd2ext: %b\n",id_if_pcimd2ext);
	$display("id_if_pcindex: %b\n",id_if_pcindex);
	$display("id_if_selpctype: Valor Esperado: xx Valor Real: %b\n",id_if_selpctype);
	$display("id_ex_selalushift: Valor Esperado: 0 Valor Real: %b\n",id_ex_selalushift);
	$display("id_ex_selimregb: Valor Esperado: 1 Valor Real: %b\n",id_ex_selimregb);
	$display("id_ex_aluop: Valor Esperado: 010 Valor Real: %b\n",id_ex_aluop);
	$display("id_ex_unsig: Valor Esperado: 0 Valor Real: %b\n",id_ex_unsig);
	$display("id_ex_shiftop: Valor Esperado: XX Valor Real: %b\n",id_ex_shiftop);
	$display("id_ex_shiftamt: Valor Esperado: 00000 Valor Real: %d\n",id_ex_shiftamt);
	$display("id_ex_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,id_ex_rega);
	$display("id_ex_readmem: Valor Esperado: 0 Valor Real: %b\n",id_ex_readmem);
	$display("id_ex_writemem:  Valor Esperado: 0 Valor Real: %b\n",id_ex_writemem);
	$display("id_ex_regb: Valor Esperado: %d Valor Real: %d\n",reg_id_datab,id_ex_regb);
	$display("id_ex_imedext: Valor Esperado: 00000000000000000000000000000001 Valor Real: %b\n",id_ex_imedext);
	$display("id_ex_selwsource: Valor Esperado: 0 Valor Real: %b\n",id_ex_selwsource);
	$display("id_ex_regdest: Valor Esperado: 00000 Valor Real %b\n",id_ex_regdest);
	$display("id_ex_writereg: Valor Esperado: 1 Valor Real: %b\n",id_ex_writereg);
	$display("id_ex_writeov: Valor Esperado: 0 Valor Real: %b\n",id_ex_writeov);
	$display("id_reg_addra: Valor Esperado: 00001 Valor Real: %b\n",id_reg_addra);
	$display("id_reg_addrb: Valor Esperado: 00010 Valor Real: %b\n",id_reg_addrb);

	// lw r1 r2 0
	a= 32'b10001100001000100000000000000010;
	c = 8;
	d = 2;
	b = 4;
	clock = ~clock;
	clock = ~clock;
	#10
	$display("LOAD:\nid_if_selpcsource: Valor Esperado: 0 Valor Real: %b\n",id_if_selpcsource);
	$display("id_if_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_ass_dataa,id_if_rega);
	$display("reg_id_dataa: %d reg_id_datab: %d\n",reg_id_dataa,reg_id_datab);
	$display("reg_id_ass_dataa: Valor Esperado: %d Valor Real: %d\n reg_id_ass_datab: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,reg_id_ass_dataa,reg_id_datab,reg_id_ass_datab);
	$display("id_if_pcimd2ext: %b\n",id_if_pcimd2ext);
	$display("id_if_pcindex: %b\n",id_if_pcindex);
	$display("id_if_selpctype: Valor Esperado: xx Valor Real: %b\n",id_if_selpctype);
	$display("id_ex_selalushift: Valor Esperado: 0 Valor Real: %b\n",id_ex_selalushift);
	$display("id_ex_selimregb: Valor Esperado: 1 Valor Real: %b\n",id_ex_selimregb);
	$display("id_ex_aluop: Valor Esperado: 010 Valor Real: %b\n",id_ex_aluop);
	$display("id_ex_unsig: Valor Esperado: 0 Valor Real: %b\n",id_ex_unsig);
	$display("id_ex_shiftop: Valor Esperado: XX Valor Real: %b\n",id_ex_shiftop);
	$display("id_ex_shiftamt: Valor Esperado: 00000 Valor Real: %d\n",id_ex_shiftamt);
	$display("id_ex_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,id_ex_rega);
	$display("id_ex_readmem: Valor Esperado: 1Valor Real: %b\n",id_ex_readmem);
	$display("id_ex_writemem:  Valor Esperado: 0 Valor Real: %b\n",id_ex_writemem);
	$display("id_ex_regb: Valor Esperado: %d Valor Real: %d\n",reg_id_datab,id_ex_regb);
	$display("id_ex_imedext: Valor Esperado: 00000000000000000000000000000001 Valor Real: %b\n",id_ex_imedext);
	$display("id_ex_selwsource: Valor Esperado: 1 Valor Real: %b\n",id_ex_selwsource);
	$display("id_ex_regdest: Valor Esperado: 00000 Valor Real %b\n",id_ex_regdest);
	$display("id_ex_writereg: Valor Esperado: 1 Valor Real: %b\n",id_ex_writereg);
	$display("id_ex_writeov: Valor Esperado: 1 Valor Real: %b\n",id_ex_writeov);
	$display("id_reg_addra: Valor Esperado: 00001 Valor Real: %b\n",id_reg_addra);
	$display("id_reg_addrb: Valor Esperado: 00010 Valor Real: %b\n",id_reg_addrb);
	
	// sw r1 r2 0
	a= 32'b10101100001000100000000000000001;
	c = 8;
	d = 2;
	b = 4;
	clock = ~clock;
	clock = ~clock;
	#10
	$display("STORE:\nid_if_selpcsource: Valor Esperado: 0 Valor Real: %b\n",id_if_selpcsource);
	$display("id_if_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_ass_dataa,id_if_rega);
	$display("reg_id_dataa: %d reg_id_datab: %d\n",reg_id_dataa,reg_id_datab);
	$display("reg_id_ass_dataa: Valor Esperado: %d Valor Real: %d\n reg_id_ass_datab: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,reg_id_ass_dataa,reg_id_datab,reg_id_ass_datab);
	$display("id_if_pcimd2ext: %b\n",id_if_pcimd2ext);
	$display("id_if_pcindex: %b\n",id_if_pcindex);
	$display("id_if_selpctype: Valor Esperado: xx Valor Real: %b\n",id_if_selpctype);
	$display("id_ex_selalushift: Valor Esperado: 0 Valor Real: %b\n",id_ex_selalushift);
	$display("id_ex_selimregb: Valor Esperado: 1 Valor Real: %b\n",id_ex_selimregb);
	$display("id_ex_aluop: Valor Esperado: 010 Valor Real: %b\n",id_ex_aluop);
	$display("id_ex_unsig: Valor Esperado: 0 Valor Real: %b\n",id_ex_unsig);
	$display("id_ex_shiftop: Valor Esperado: XX Valor Real: %b\n",id_ex_shiftop);
	$display("id_ex_shiftamt: Valor Esperado: 00000 Valor Real: %d\n",id_ex_shiftamt);
	$display("id_ex_rega: Valor Esperado: %d Valor Real: %d\n",reg_id_dataa,id_ex_rega);
	$display("id_ex_readmem: Valor Esperado: 0 Valor Real: %b\n",id_ex_readmem);
	$display("id_ex_writemem:  Valor Esperado: 1 Valor Real: %b\n",id_ex_writemem);
	$display("id_ex_regb: Valor Esperado: %d Valor Real: %d\n",reg_id_datab,id_ex_regb);
	$display("id_ex_imedext: Valor Esperado: 00000000000000000000000000000001 Valor Real: %b\n",id_ex_imedext);
	$display("id_ex_selwsource: Valor Esperado: x Valor Real: %b\n",id_ex_selwsource);
	$display("id_ex_regdest: Valor Esperado: 00000 Valor Real %b\n",id_ex_regdest);
	$display("id_ex_writereg: Valor Esperado: 0 Valor Real: %b\n",id_ex_writereg);
	$display("id_ex_writeov: Valor Esperado: x Valor Real: %b\n",id_ex_writeov);
	$display("id_reg_addra: Valor Esperado: 00001 Valor Real: %b\n",id_reg_addra);
	$display("id_reg_addrb: Valor Esperado: 00010 Valor Real: %b\n",id_reg_addrb);
	$finish;
	end
endmodule