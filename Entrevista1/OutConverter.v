 module OutConverter(aluout, DHEX);

	input 	[3:0]	aluout;
	output	[6:0]	DHEX;

	case (aluout) begin

		1'h0:begin

				DHEX[0] <= 1'b1;
				DHEX[1] <= 1'b1;
				DHEX[2] <= 1'b1;
				DHEX[3] <= 1'b1;
				DHEX[4] <= 1'b1;
				DHEX[5] <= 1'b1;
				DHEX[6] <= 1'b0;

			end
		1'h1:begin

				DHEX[0] <= 1'b0;
				DHEX[1] <= 1'b1;
				DHEX[2] <= 1'b1;
				DHEX[3] <= 1'b0;
				DHEX[4] <= 1'b0;
				DHEX[5] <= 1'b0;
				DHEX[6] <= 1'b0;

			end
		1'h2:begin

				DHEX[0] <= 1'b1;
				DHEX[1] <= 1'b1;
				DHEX[2] <= 1'b0;
				DHEX[3] <= 1'b1;
				DHEX[4] <= 1'b1;
				DHEX[5] <= 1'b0;
				DHEX[6] <= 1'b1;

			end
		1'h3:begin

				DHEX[0] <= 1'b1;
				DHEX[1] <= 1'b1;
				DHEX[2] <= 1'b1;
				DHEX[3] <= 1'b1;
				DHEX[4] <= 1'b0;
				DHEX[5] <= 1'b0;
				DHEX[6] <= 1'b1;

			end
		1'h4:begin

				DHEX[0] <= 1'b0;
				DHEX[1] <= 1'b1;
				DHEX[2] <= 1'b1;
				DHEX[3] <= 1'b0;
				DHEX[4] <= 1'b0;
				DHEX[5] <= 1'b1;
				DHEX[6] <= 1'b1;

			end
		1'h5:begin

				DHEX[0] <= 1'b1;
				DHEX[1] <= 1'b0;
				DHEX[2] <= 1'b1;
				DHEX[3] <= 1'b1;
				DHEX[4] <= 1'b0;
				DHEX[5] <= 1'b1;
				DHEX[6] <= 1'b1;

			end
		1'h6:begin

				DHEX[0] <= 1'b1;
				DHEX[1] <= 1'b0;
				DHEX[2] <= 1'b1;
				DHEX[3] <= 1'b1;
				DHEX[4] <= 1'b1;
				DHEX[5] <= 1'b1;
				DHEX[6] <= 1'b1;

			end
		1'h7:begin

				DHEX[0] <= 1'b1;
				DHEX[1] <= 1'b1;
				DHEX[2] <= 1'b1;
				DHEX[3] <= 1'b0;
				DHEX[4] <= 1'b0;
				DHEX[5] <= 1'b0;
				DHEX[6] <= 1'b0;

			end

		1'h8:begin

				DHEX[0] <= 1'b1;
				DHEX[1] <= 1'b1;
				DHEX[2] <= 1'b1;
				DHEX[3] <= 1'b1;
				DHEX[4] <= 1'b1;
				DHEX[5] <= 1'b1;
				DHEX[6] <= 1'b1;

			end

		1'h9:begin

				DHEX[0] <= 1'b1;
				DHEX[1] <= 1'b1;
				DHEX[2] <= 1'b1;
				DHEX[3] <= 1'b1;
				DHEX[4] <= 1'b0;
				DHEX[5] <= 1'b1;
				DHEX[6] <= 1'b1;

			end
	
		1'hA:begin

				DHEX[0] <= 1'b1;
				DHEX[1] <= 1'b1;
				DHEX[2] <= 1'b1;
				DHEX[3] <= 1'b0;
				DHEX[4] <= 1'b1;
				DHEX[5] <= 1'b1;
				DHEX[6] <= 1'b1;

			end
		1'hB:begin

				DHEX[0] <= 1'b0;
				DHEX[1] <= 1'b0;
				DHEX[2] <= 1'b1;
				DHEX[3] <= 1'b0;
				DHEX[4] <= 1'b1;
				DHEX[5] <= 1'b1;
				DHEX[6] <= 1'b1;

			end

		1'hC:begin

				DHEX[0] <= 1'b0;
				DHEX[1] <= 1'b1;
				DHEX[2] <= 1'b0;
				DHEX[3] <= 1'b1;
				DHEX[4] <= 1'b1;
				DHEX[5] <= 1'b1;
				DHEX[6] <= 1'b1;

			end

		1'hD:

				DHEX[0] <= 1'b0;
				DHEX[1] <= 1'b1;
				DHEX[2] <= 1'b1;
				DHEX[3] <= 1'b1;
				DHEX[4] <= 1'b1;
				DHEX[5] <= 1'b0;
				DHEX[6] <= 1'b1;

			end

		1'hE:

				DHEX[0] <= 1'b1;
				DHEX[1] <= 1'b0;
				DHEX[2] <= 1'b0;
				DHEX[3] <= 1'b1;
				DHEX[4] <= 1'b1;
				DHEX[5] <= 1'b1;
				DHEX[6] <= 1'b1;

			end

		1'hF:

				DHEX[0] <= 1'b1;
				DHEX[1] <= 1'b0;
				DHEX[2] <= 1'b0;
				DHEX[3] <= 1'b0;
				DHEX[4] <= 1'b1;
				DHEX[5] <= 1'b1;
				DHEX[6] <= 1'b1;

			end
endcase

endmodule
