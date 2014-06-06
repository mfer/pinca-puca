module Shifter(
	input [31:0] in,
	input [1:0] shiftop,
	input [4:0] shiftamt,
	output reg [31:0] result
);
	always @(in or shiftamt or shiftop)
			begin
				case(shiftop)
					2'b00 : result <= in >> shiftamt;
					2'b01 : result <= in >>> shiftamt;
					2'b10 : result <= in << shiftamt;
					default : result <= 32'b0;
				endcase
			end
endmodule
