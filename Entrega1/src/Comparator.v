module Comparator (a, b, op, compout);

	input 	[31:0]		a;
	input 	[31:0]	 	b;
	input 	[2:0] 		op;
	output 			compout;
	reg compout;

	always @(op or a or b)
	begin
		case (op)
			3'b000	: assign compout = a==b;
			3'b001	: assign compout = a>=b;
			3'b010	: assign compout = a<=b;
			3'b011	: assign compout = a>b;
			3'b100	: assign compout = a<b;
			3'b101	: assign compout = a!=b;
			//Caso não haja opcode compout será zero
			default	: assign compout = 1'b0;
		endcase
	end
endmodule
