module OutConverter(input [3:0] hexout, output reg [6:0] dhex);

	always @(*)begin
		case (hexout)

			4'b0000:begin

					dhex <= 7'b1000_000;
					
				end
			4'b0001:begin

					dhex <= 7'b1111_001;

				end
			4'b0010:begin
		
					dhex <= 7'b0100_100;

				end
			4'b0011:begin
				
					dhex <=  7'b0110_000;
					

				end
			4'b0100:begin
					
					dhex <=  7'b0011_001;
				
				end
			4'b0101:begin

					dhex <=  7'b0010_010;
					
				end
			4'b0110:begin

					dhex <= 7'b0000_010;

				end
			4'b0111:begin

					dhex <= 7'b1111_000;
					

				end

			4'b1000:begin
			
					dhex <=  7'b000_000;

				end

			4'b1001:begin
		
					dhex <=  7'b0010_000;		

				end
		
			4'b1010:begin

					dhex <=  7'b0001_000;
					
				end
			4'b1011:begin

					dhex <=  7'b0000_011;

				end

			4'b1100:begin

					dhex <= 7'b1000_110;

				end

			4'b1101:begin

					dhex <= 7'b0100_001;

				end

			4'b1110:begin
	
					dhex <= 7'b0000_110;

				end

			4'b1111:begin
	
					dhex <= 7'b0001_110;

				end
		endcase
	end
endmodule
