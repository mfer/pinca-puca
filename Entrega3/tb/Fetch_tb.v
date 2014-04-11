`include "Fetch.v"

module Fetch_tb();

	reg 		clock;
	reg		reset;
	//execute
	reg		ex_if_stall;
	//Decode
	wire	[31:0]	if_id_nextpc;
	wire	[31:0]	if_id_instruc;
	reg		id_if_selpcsource;
	reg	[31:0]	id_if_rega;
	reg	[31:0]	id_if_pcimd2ext;
	reg	[31:0]	id_if_pcindex;
	reg	[1:0]	id_if_selpctype;
	//memory controller
	wire		if_mc_en;
	wire	[31:0]	if_mc_addr;
	reg	[31:0]	mc_if_data;

	//Registers
	parameter	begin_time = 0;
	parameter	clock_time = 10;	
	parameter 	stall_time = 100;//stall 5 ciclos
	parameter	selpcsource_time = 200;//id_if_selpcsource 5 ciclos
	parameter	stall_time_2 = 300; //stall no meio da execução
	parameter	selpcsource_time_2 = 400; // retoma após o stall
	parameter	final_reset_time = 500;
	parameter 	finishtime = 600;//reset 5 ciclos

	initial begin
	
		$dumpfile ("Fetch.vcd");
		$dumpvars;
	
		clock <= 1'b1;
		reset <= 1'b0; 
		id_if_selpctype = 2'b11;// ao somar 1 vai para 00: id_if_pcimd2ext
		 
		forever begin

			#clock_time clock = ~clock;

		end
	
	end

	initial
		#finishtime $finish;	


	always @(posedge clock) begin
		
		case ($time) 

			begin_time :reset <= 0'b0;
			stall_time: begin
			
				reset <= 1'b1;
				ex_if_stall <= 1'b1;

			    end

			selpcsource_time: begin
				
				ex_if_stall <= 1'b0;
				id_if_selpcsource = 1'b1;

			end

			stall_time_2: ex_if_stall <= 1'b1;

			selpcsource_time_2: begin

				ex_if_stall <= 1'b0;
				id_if_selpcsource <= 1'b1;
			
			end

			final_reset_time: reset <= 1'b0;	
	
		endcase

		if( ($time >= stall_time) && ($time < selpcsource_time) ) begin //reset acaba aqui, começa com stall(algo que não vai ocorrer)
			
			mc_if_data <= $random;
	
		end
			
		else if( ($time >= selpcsource_time) && ($time < stall_time_2) ) begin //stall após reset acaba aqui
			
			id_if_rega <= 4*$time;
			id_if_pcimd2ext <= 8*$time;
			id_if_pcindex <= 16*$time;			
			id_if_selpctype <= id_if_selpctype + 1'b1;// começa com 00 01 10 11  pcimd2ext	rega	pcindex 32'd64;
		
		end

		else if ( ($time >= stall_time_2) && ($time < selpcsource_time_2))begin //fetch das instruções acaba aqui, stall de novo
			
			mc_if_data <= $random;

		end

		else if ( ( $time >= selpcsource_time_2) && ($time < final_reset_time))begin//stall acaba, volta a fazer o fetch
			
			id_if_selpcsource <= 1'b1;
			id_if_selpctype <= id_if_selpctype + 1'b1;
			id_if_rega <= 4*$time;
			id_if_pcimd2ext <= 8*$time;
			id_if_pcindex <= 16 * $time;			
		
		
		end
		
		$display ("Time = %d / Reset = %d /  ex_if_stall = %d / if_id_nextpc = %d /",  $time, reset,  ex_if_stall, if_id_nextpc);
		$display("if_id_instru = %d / id_if_selpcsource = %d  / id_if_rega = %d " ,  if_id_instruc, id_if_selpcsource, id_if_rega);
		$display("id_if_pcimd2ext = %d / id_if_pc_index = %d / id_if_selpctype = %d", id_if_pcimd2ext, id_if_pcindex, id_if_selpctype);
		$display("if_mc_en = %d / if_mc_addr = %d / mc_if_data = %d \n	 ",if_mc_en, if_mc_addr, mc_if_data); 

	end
		Fetch dut (.clock(clock), .reset(reset), .ex_if_stall(ex_if_stall), .if_id_nextpc(if_id_nextpc),
		.if_id_instruc(if_id_instruc), .id_if_selpcsource(id_if_selpc_source), .id_if_rega(id_if_rega),
		.id_if_pcimd2ext(id_if_pcimd2ext), .id_if_pcindex(id_if_pcindex), .id_if_selpctype(id_if_selpctype), .if_mc_en(if_mc_en),
		.if_mc_addr(if_mc_addr), .mc_if_data(mc_if_data) );


endmodule
