`include "Control.v"
`include "Comparator.v"

module Decode(
	input		clock,
	input		reset,

	//FETCH

	inout	[31:0]	if_id_instruc,
	inout	[31:0]	if_id_nextpc,
	output 		id_if_selpcsource,
	output	[31:0]	id_if_rega,
	output	[31:0]	id_if_pcimd2ext,
	output	[31:0]	id_if_pcindex,
	output	[1:0]	id_if_selpctype,

	//EXECUTE

	output 	reg		id_ex_selalushift,
	output 	reg		id_ex_selimregb,
	output	reg	[2:0]	id_ex_aluop,
	output	reg		id_ex_unsig,
	output	reg	[1:0]	id_ex_shiftop,
	output 		[4:0] 	id_ex_shiftamt,
	output 		[31:0] 	id_ex_rega,
	output	reg 		id_ex_readmem,
	output 	reg 		id_ex_writemem,
	output 		[31:0]	id_ex_regb,
	output reg 	[31:0] 	id_ex_imedext,
	output reg 		id_ex_selwsource,
	output reg 	[4:0] 	id_ex_regdest,
	output reg 		id_ex_writereg,
	output reg 		id_ex_writeov,
	//Registers
	output 		[4:0] 	id_reg_addra,
	output 		[4:0] 	id_reg_addrb,
	inout 		[31:0] 	reg_id_dataa,
	inout 		[31:0] 	reg_id_datab,
	input 		[31:0] 	reg_id_ass_dataa,
	input 		[31:0] 	reg_id_ass_datab
);
	//Additional Variables;
	wire 	[1:0] 	selbrjumpz;//Control Output;
        wire		compout;
	reg	[15:0]	bit_extension = 15'b0;
	wire	[1:0]	selregdest;
	wire	[2:0]	compop;
	wire 		ex_if_stall;
	wire		ex_mem_readmem;
	wire 		ex_mem_writemem;
	wire	[31:0] 	ex_mem_regb;
	wire 		ex_mem_selwsource;
	wire 	[4:0] 	ex_mem_regdest;
	wire 		ex_mem_writereg;
	wire 	[31:0] 	ex_mem_wbvalue;
	wire		if_mc_en;
	wire	[17:0]  if_mc_addr;
	wire	[31:0]  mc_if_data;
	wire		enc;
	wire	[4:0]	addrc;
	wire	[31:0]	datac;
	wire	[2:0]	selwsource_helper;
	wire		writereg;
	wire		writeov;
	wire	[2:0]	aluop;
	wire	[1:0]	shiftop;
	wire		readmem;
	wire		writemem;
	wire		unsig;

	wire rgb;
	wire alushift;

	assign id_if_rega =reg_id_ass_dataa;
	assign id_ex_regb = reg_id_datab;
    assign id_if_pcimd2ext = if_id_nextpc + {{16{if_id_instruc[15]}},if_id_instruc[15:0]}<<2'b10;
	assign id_if_pcindex = {if_id_nextpc[31:28],if_id_instruc[25:0]<<2'b10};
	assign id_ex_rega = reg_id_dataa;
	assign id_reg_addra = if_id_instruc[25:21];
	assign id_reg_addrb = if_id_instruc[20:16];
	assign id_ex_shiftamt = reg_id_dataa;
	assign id_if_selpcsource = (selbrjumpz== 2'b10) ? compout : (selbrjumpz == 2'b01) ? 1'b1 : 1'b0;


always @(posedge clock or negedge reset)begin

	if (reset == 1'b0)begin //registradores vão para 0

		id_ex_selalushift <= 1'b0;
		id_ex_selimregb	<= 1'b0;
		id_ex_aluop <= 2'b00;
		id_ex_unsig <= 1'b0;
		id_ex_shiftop <=1'b0;
		id_ex_readmem	<= 1'b0;
		id_ex_writemem <=1'b0;
		id_ex_imedext<= 'b0;
		id_ex_selwsource <=1'b0;
		id_ex_regdest	<= 5'b00000;
		id_ex_writereg	<= 1'b0;
		id_ex_writeov	<= 1'b0;
	end

	else begin

		case (selregdest[0])

			1'b1:id_ex_regdest <= if_id_instruc[15:11];
			1'b0:id_ex_regdest <= if_id_instruc[20:16];

		endcase

		id_ex_selimregb <= rgb;
		id_ex_selalushift <= alushift;

		id_ex_imedext <= {if_id_instruc [15:0], bit_extension};
		id_ex_selwsource <= selwsource_helper[0];
		id_ex_writereg <= writereg;
		id_ex_writeov <= writeov;
		id_ex_aluop <= aluop;
		id_ex_shiftop <= shiftop;
		id_ex_readmem <= readmem;
		id_ex_writemem <= writemem;
		id_ex_unsig <= unsig;
	end
end

	Control ControlModule (.op(if_id_instruc [31:26]), .fn(if_id_instruc[5:0]), .selwsource(selwsource_helper), .selregdest(selregdest), .writereg(writereg), .writeov(writeov), .selimregb(rgb), .selalushift(alushift), .aluop(), .shiftop(), .readmem(), .writemem(), .selbrjumpz(), .selpctype(), .compop(), .unsig());

	Comparator ComparatorModule (.a(reg_id_ass_dataa), .b(reg_id_ass_datab), .op(compop), .compout(compout));

	Fetch FetchModule (.clock(clock), .reset(reset), .ex_if_stall(ex_if_stall), .if_id_nextpc(if_id_nextpc), .if_id_instruc(if_id_instruc), .id_if_selpcsource(id_if_selpcsource), .id_if_rega(id_if_rega), .id_if_pcimd2ext(id_if_pcimd2ext), .id_if_pcindex(id_if_pcindex), .id_if_selpctype(id_if_selpctype), .if_mc_en(if_mc_en), .if_mc_addr(if_mc_addr), .mc_if_data(mc_if_data));

	Registers RegisterModule (.clock(clock), .reset(reset), .addra(id_reg_addra), .addrb(id_reg_addrb), .enc(enc), .addrc(addrc), .datac(datac), .dataa(reg_id_dataa), .datab(reg_id_datab));

	Execute ExecuteModule(.clock(clock), .reset(reset), .id_ex_selalushift(id_ex_selalushift), .id_ex_selimregb(id_ex_selimregb), .id_ex_aluop(id_ex_aluop), .id_ex_unsig(id_ex_unsig), .id_ex_shiftop(id_ex_shiftop), .id_ex_shiftamt(id_ex_shiftamt), .id_ex_rega(id_ex_rega), .id_ex_readmem(id_ex_readmem), .id_ex_writemem(id_ex_writemem), .id_ex_regb(id_ex_regb), .id_ex_imedext(id_ex_imedext), .id_ex_selwsource(id_ex_selwsource), .id_ex_regdest(id_ex_regdest),.id_ex_writereg(id_ex_writereg), .id_ex_writeov(id_ex_writeovi), .ex_if_stall(ex_if_stall), .ex_mem_readmem(ex_mem_readmem), .ex_mem_writemem(ex_mem_writemem),.ex_mem_regb(ex_mem_regb), .ex_mem_selwsource(ex_mem_selwsource), .ex_mem_regdest(ex_mem_regdest), .ex_mem_writereg(ex_mem_writereg), .ex_mem_wbvalue(ex_mem_wbvalue));


endmodule
