module OutConverter(input [3:0] aluout, output reg [6:0] dhex);

	always @(*)begin
		case (aluout)

			4'b0000:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b1;

				end
			4'b0001:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b1;

				end
			4'b0010:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b0;

				end
			4'b0011:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b0;

				end
			4'b0100:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b0;

				end
			4'b0101:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b0;

				end
			4'b0110:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b0;

				end
			4'b0111:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b1;

				end

			4'b1000:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b0;

				end

			4'b1001:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b0;

				end
		
			4'b1010:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b0;

				end
			4'b1011:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b0;

				end

			4'b1100:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b1;

				end

			4'b1101:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b0;

				end

			4'b1110:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b0;

				end

			4'b1111:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b0;

				end
		endcase
	end
endmodule
