module Alu (
	input 	[31:0]		a,
	input 	[31:0]	 	b,
	output 	[31:0]		aluout,
	input 	[2:0]		op,
	input 			unsig,
	output 			compout,
	output 			overflow
);

	reg compout;
	reg overflow;
	reg [31:0] aluout;

	always @(op or a or b or unsig)
	begin
		case (op)
			3'b000	: aluout <= a&b;
			3'b001	: aluout <= a|b;
			3'b010	: begin
						aluout <= ($signed(a)+$signed(b));
						if (($signed(a)>=0)&&($signed(b)>=0)&&($signed(aluout)<0))
						begin
							overflow <= 1;
						end						
						else
						begin
							if (($signed(a)<0)&&($signed(b)<0)&&($signed(aluout)>=0))
							begin							
								overflow <= 1;
							end
							else
							begin
								overflow <= 0;
							end
						end
					end
			3'b100	: aluout <= ~(a|b);
			3'b101	: aluout <= a^b;
			3'b110	: begin
						aluout <= ($signed(a)-$signed(b));
						if (($signed(a)>=0)&&($signed(b)<0)&&($signed($signed(a)+$signed(b))<0))
						begin
							overflow <= 1;
						end						
						else
						begin
							if (($signed(a)<0)&&($signed(b)>=0)&&($signed($signed(a)+$signed(b))>=0))
							begin							
								overflow <= 1;
							end
							else
							begin
								overflow <= 0;
							end
						end
					end
			default	: aluout <= aluout; //tratar exceção 
		endcase
		if (unsig == 0)
		begin
			if (a<b)
			begin
				compout <= 1;
			end
			else
			begin
				compout <= 0;
			end
		end
		if (unsig == 1)
		begin
			if ($signed(a)<$signed(b))
			begin
				compout <= 1;
			end
			else
			begin
				compout <= 0;
			end
		end
	end
endmodule
