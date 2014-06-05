module Fetch (clock, reset, ex_if_stall, if_id_nextpc, if_id_instruc, id_if_selpcsource, id_if_rega, id_if_pcimd2ext, id_if_pcindex, id_if_selpctype, if_mc_en, if_mc_addr, mc_if_data);

	input clock;
	input reset;
	reg [31:0] pc;
	reg [31:0] pc_anterior;

	//Execute
	input ex_if_stall;

	//Decode
	output reg [31:0] if_id_nextpc;
	output reg [31:0] if_id_instruc;
	input id_if_selpcsource;
	input [31:0] id_if_rega;
	input [31:0] id_if_pcimd2ext;
	input [31:0] id_if_pcindex;
	input [1:0] id_if_selpctype;

	//Controle da memória
	output reg if_mc_en;
	output [17:0] if_mc_addr;
	input [31:0] mc_if_data;

assign if_mc_addr = pc;

always @(posedge clock or negedge reset)begin

	if(reset == 1'b0 )begin

	pc <= 32'b0;
	pc_anterior <= 32'b0;
	if_mc_en <= 1'b0;
	if_id_nextpc <= 32'b0;
	if_id_instruc <= 32'b0;


	end

	else if (ex_if_stall ==  1'b1)begin

		if_id_instruc <=32'd0;//nop 32'd0
		if_id_nextpc <= pc_anterior;//pc anterior atribuido ao if_id_nextpc


	end

	else begin

		if_mc_en <= 1'b0;
		pc_anterior <= pc;
		if_id_nextpc<=pc;

	  	case(id_if_selpcsource)

			1'b0: pc<= pc + 4;
			1'b1: begin
				case(id_if_selpctype)

				2'b00: pc <= id_if_pcimd2ext;
				2'b01: pc <= id_if_rega;
				2'b10: pc <= id_if_pcindex;
				2'b11: pc <= 32'd64;

				endcase
			end
		endcase
	end

end

endmodule
