module Registers(clock, reset, addra, dataa, ass_dataa, addrb, datab, ass_datab, enc, addrc, datac, addrout, regout);

//-------------------------------------inputs----------------------
	input		clock;
	input		reset;
	input	[4:0]	addra;
	input	[4:0]	addrb;
	input 		enc;
	input	[4:0]	addrc;
	input	[31:0]	datac;
	input 	[4:0]		addrout;

//-----------------------------------outputs-----------------------

	output reg  [31:0]	dataa;
	output reg  [31:0]	datab;
	output reg  [31:0]	ass_dataa;
	output reg  [31:0]	ass_datab;
	output 		[31:0]	regout;

//---------------------------------registers-----------------------

	reg	[31:0]	registers [31:0];

//------------------------------auxiliares-------------------------


	parameter	number_of_registers = 32;
//-----------------------REGISTERS BANKS---------------------------


assign regout = registers[addrout];

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

	ass_dataa <= registers [addra];

end

// entrega 5
always @(addrb) begin

	ass_datab <= registers [addrb];

end

/*genvar counter;
generate


	for (counter = 0; counter < number_of_registers ; counter = counter + 1)begin: RST

		always @(negedge clock  &&  reset) begin

			registers [counter] <= 32'b0;

		end

	end

endgenerate*/
endmodule
