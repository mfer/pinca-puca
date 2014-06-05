module MemControler(
		input	 			clock, 
		input 			reset, 
		//Fetch 
		input 			if_mc_en,
		input	[17:0] 	if_mc_addr, 
		output[31:0]	mc_if_data, 
		//Memory 
		input 			mem_mc_rw, 
		input 			mem_mc_en, 
		input [17:0]	mem_mc_addr, 
		inout	[31:0]	mem_mc_data, 
		//Ram 
		output [17:0]	mc_ram_addr, 
		output 			mc_ram_wre, 
		inout  [15:0]	mc_ram_data
);
	Ram ram_module ( .addr(mc_ram_addr), .data(mc_ram_data), .wre(mc_ram_wre), 
		.oute(mem_mc_rw), .hb_mask(counter),.lb_mask(!counter),.chip_en(mem_mc_en));
		
	reg   counter = 1'b0;
	reg 	[31:0]  mem_data;
	reg 	[31:0]	ram_data;
	reg	[15:0]	if_data;
		
	assign mc_ram_wre = ((!mem_mc_en & if_mc_en) | !mem_mc_rw);
	
	assign mc_ram_data = ((mem_mc_rw && mem_mc_en) && !counter) ? 
	  ram_data[31:16] : ((mem_mc_rw && mem_mc_en) && counter) ? 
	  ram_data[15:0] : 16'hzzzz;//data written from memory
	
	assign mem_mc_data = (!mem_mc_rw && mem_mc_en) ? 
	  {mem_data,mc_ram_data} : //data read from ram
	    32'hzzzz_zzzz;
	
	assign mc_ram_addr = (mem_mc_en) ? ((mem_mc_addr >> 1) + counter) :
	   (!mem_mc_en && if_mc_en) ? ((if_mc_addr >> 1) + counter) : 
	      18'h00000;//Addres determination
	
	assign mc_if_data[31:16] = if_data;
	assign mc_if_data[15:0] =  (!mem_mc_en && if_mc_en && counter) ? mc_ram_data : 16'h0000;
	//data read from ram on fetch.
	
	always @(posedge clock or  negedge reset) begin		
	
		if(reset == 1'b0)begin

			counter <= 1'b0;
			mem_data <= 32'h0000_0000;
			ram_data <= 32'h0000_0000;
			if_data <= 16'h0000;
			
		end

		else begin				

			if (mem_mc_en == 1'b1) begin 
	
				if(mem_mc_rw == 1'b1)begin
				
						ram_data <= mem_mc_data;
				
				end
				
				else if (mem_mc_rw == 1'b0 && counter == 1'b0) begin

					mem_data <= mc_ram_data; //goes to mem_mc_data
					
				end
			end
			
			else if ( mem_mc_en == 1'b0 && if_mc_en == 1'b1 && counter == 1'b0) begin //fetch time
					
					if_data <= mc_ram_data;//parte mais significativa
		
			end	
			
			counter <= ~counter;
				
		end
	end
endmodule