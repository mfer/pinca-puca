module OutConverter(input [3:0] aluout, output reg [6:0] dhex);

	always @(*)begin
		case (aluout)

			1'h0:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b0;

				end
			1'h1:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b0;

				end
			1'h2:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b1;

				end
			1'h3:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b1;

				end
			1'h4:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b1;

				end
			1'h5:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b1;

				end
			1'h6:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b1;

				end
			1'h7:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b0;

				end

			1'h8:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b1;

				end

			1'h9:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b0;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b1;

				end
		
			1'hA:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b1;

				end
			1'hB:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b1;

				end

			1'hC:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b1;

				end

			1'hD:begin

					dhex[0] <= 1'b0;
					dhex[1] <= 1'b1;
					dhex[2] <= 1'b1;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b0;
					dhex[6] <= 1'b1;

				end

			1'hE:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b1;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b1;

				end

			1'hF:begin

					dhex[0] <= 1'b1;
					dhex[1] <= 1'b0;
					dhex[2] <= 1'b0;
					dhex[3] <= 1'b0;
					dhex[4] <= 1'b1;
					dhex[5] <= 1'b1;
					dhex[6] <= 1'b1;

				end
		endcase
	end
endmodule
