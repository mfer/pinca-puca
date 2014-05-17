module Registers(clock, reset, addra, dataa, addrb, datab, enc, addrc, datac);

//-------------------------------------inputs----------------------
	input		clock;
	input		reset;
	input	[4:0]	addra;
	input	[4:0]	addrb;
	input 		enc;
	input	[4:0]	addrc;
	input	[31:0]	datac;
	
//-----------------------------------outputs-----------------------

	output  [31:0]	dataa;
	output  [31:0]	datab;
	output 	[31:0]  ass_dataa;	// entrega 5
	output	[31:0]	ass_datab;	// entrega 5
//---------------------------------registers-----------------------

	reg  	[31:0]	dataa;
	reg  	[31:0]	datab;
	reg	[31:0]	registers [31:0];

//------------------------------auxiliares-------------------------


	parameter	number_of_registers = 32;
//-----------------------REGISTERS BANKS---------------------------


	
always @(posedge clock) begin

	dataa <= registers[addra];
	datab <= registers[addrb];
	
		

end

always @(posedge clock )begin

	if (enc == 1'b1)begin

		registers [addrc] <= datac;

	end

end

// entrega 5
always @(addra) begin 
	
	registers [ass_dataa] <= registers [dataa];
	
end

// entrega 5
always @(addrb) begin

	registers [ass_datab] <= registers [datab];
	
end

genvar counter;
generate

 
	for (counter = 0; counter < number_of_registers ; counter = counter + 1)begin: RST
	
		always @(negedge clock  &&  reset) begin
		
			registers [counter] <= 32'b0;

		end

	end

endgenerate
endmodule
