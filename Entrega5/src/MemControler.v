module MemControler(
		input	 		clock, 
		input 			reset, 

		//Fetch 
		input 			if_mc_en,
		input 		[17:0] 	if_mc_addr, 
		output reg	[31:0]	mc_if_data, 

		//Memory 
		input 			mem_mc_rw, 
		input 			mem_mc_en, 
		input 		[17:0]	mem_mc_addr, 
		inout		[31:0]	mem_mc_data, 

		//Ram 
		output 		[17:0]	mc_ram_addr, 
		output 			mc_ram_wre, 
		inout   	[15:0]	mc_ram_data

);

		reg  counter = 1'b0;
		reg	[15:0] 	ram_data;
		reg 	[31:0]  mem_data;

	assign mc_ram_wre = ((!mem_mc_en & if_mc_en) | !mem_mc_rw);
	assign mc_ram_data = ( !reset ) ? 16'h0000  : (mem_mc_rw && !(mem_mc_en)) ? ram_data : 16'hzzzz;
	assign mem_mc_data = (!reset) ? 32'h0000_0000 : (!mem_mc_rw && !(mem_mc_en)) ? mem_data : 32'hzzzz_zzzz;
	assign mc_ram_addr = (mem_mc_en && !counter) ? mem_mc_addr >> 1 : (mem_mc_en && counter) ?( ( mc_ram_addr >> 1) + 1)  :  (!mem_mc_en && !counter) ? if_mc_addr >> 1  : (!mem_mc_en && !counter) ? (if_mc_addr >> 1 + 1) : 18'hxxxxx;

	always @(posedge clock or  negedge reset) begin
		if(reset == 1'b0)begin
			mc_if_data <= 32'h00000000;
			//mc_ram_addr <= 16'h0000;		
		end
		else begin
			if (mem_mc_en) begin 
				if (mem_mc_rw == 1'b1)begin // write on memory
					//escrita em dois estágios
					if (counter == 1'b0) begin
						ram_data <= mem_mc_data[31:16];
					end				
					else begin
						ram_data <= mem_mc_data [15:0];
					end		
				end
			 	else if (mem_mc_rw == 1'b0) begin
					if(counter == 1'b0) begin	
						mem_data[31:16] <= mc_ram_data; 
					end
					else begin		
						mem_data[15:0] <= mc_ram_data;
					end
				end
			end
			else if ( mem_mc_en == 1'b0 && if_mc_en == 1'b1) begin //fetch time
				if (counter == 1'b0)begin 
					//mc_ram_addr <=  if_mc_addr>>1 ;
					mc_if_data[31:16] <= mc_ram_data;//parte mais significativa
				end
				else begin 
					//mc_ram_addr <= (if_mc_addr>>1) + 1;
					mc_if_data [15:0] <= mc_ram_data;//parte menos significativa
				end 			
			end	
			counter <= counter + 1'b1;	
		end
	end

endmodule
