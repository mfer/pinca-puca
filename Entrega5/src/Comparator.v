module Comparator (
	input 	[31:0]		a,
	input 	[31:0]	 	b,
	input 	[2:0] 		op,
	output  reg			compout
);
	always @(op or a or b)
	begin
		case (op)
			3'b000	:compout <= ( a==b );
			3'b001	:compout <= ( a >= b );
			3'b010	:compout <= (a <= b);
			3'b011	:compout <= (a > b);
			3'b100	:compout <= (a < b);
			3'b101	:compout <= (a != b);
			//Caso não haja opcode compout será zero
			default	: compout = 1'b0;
		endcase
	end
endmodule
