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

	always @(op or a or b)
	begin
		case (op)
			3'b000	: assign aluout = a&b;
			3'b001	: assign aluout = a|b;
			3'b010	: begin
						assign aluout = ($signed(a)+$signed(b));
						if (($signed(a)>=0)&&($signed(b)>=0)&&($signed(aluout)<0))
						begin
							assign overflow = 1;
						end						
						else
						begin
							if (($signed(a)<0)&&($signed(b)<0)&&($signed(aluout)>=0))
							begin							
								assign overflow = 1;
							end
							else
							begin
								assign overflow = 0;
							end
						end
					end
			3'b100	: assign aluout = ~(a|b);
			3'b101	: assign aluout = a^b;
			3'b110	: begin
						assign aluout = ($signed(a)-$signed(b));
						if (($signed(a)>=0)&&($signed(b)<0)&&($signed($signed(a)+$signed(b))<0))
						begin
							assign overflow = 1;
						end						
						else
						begin
							if (($signed(a)<0)&&($signed(b)>=0)&&($signed($signed(a)+$signed(b))>=0))
							begin							
								assign overflow = 1;
							end
							else
							begin
								assign overflow = 0;
							end
						end
					end
			default	: assign aluout = aluout; //tratar exceção 
		endcase
	end
	
	always @(a or b or unsig)
	begin
		if (unsig == 0)
		begin
			if (a<b)
			begin
				compout = 1;
			end
			else
			begin
				compout = 0;
			end
		end
		if (unsig == 1)
		begin
			if ($signed(a)<$signed(b))
			begin
				compout = 1;
			end
			else
			begin
				compout = 0;
			end
		end
	end
endmodule
