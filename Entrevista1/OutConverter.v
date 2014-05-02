 module OutConverter(aluout, HEX);

	input 	[3:0]	aluout;
	output	[6:0]	HEX;

	case (aluout) begin

		1'h0:begin

				HEX[0] <= 1'b1;
				HEX[1] <= 1'b1;
				HEX[2] <= 1'b1;
				HEX[3] <= 1'b1;
				HEX[4] <= 1'b1;
				HEX[5] <= 1'b1;
				HEX[6] <= 1'b0;

			end
		1'h1:begin

				HEX[0] <= 1'b0;
				HEX[1] <= 1'b1;
				HEX[2] <= 1'b1;
				HEX[3] <= 1'b0;
				HEX[4] <= 1'b0;
				HEX[5] <= 1'b0;
				HEX[6] <= 1'b0;

			end
		1'h2:begin

				HEX[0] <= 1'b1;
				HEX[1] <= 1'b1;
				HEX[2] <= 1'b0;
				HEX[3] <= 1'b1;
				HEX[4] <= 1'b1;
				HEX[5] <= 1'b0;
				HEX[6] <= 1'b1;

			end
		1'h3:begin

				HEX[0] <= 1'b1;
				HEX[1] <= 1'b1;
				HEX[2] <= 1'b1;
				HEX[3] <= 1'b1;
				HEX[4] <= 1'b0;
				HEX[5] <= 1'b0;
				HEX[6] <= 1'b1;

			end
		1'h4:begin

				HEX[0] <= 1'b0;
				HEX[1] <= 1'b1;
				HEX[2] <= 1'b1;
				HEX[3] <= 1'b0;
				HEX[4] <= 1'b0;
				HEX[5] <= 1'b1;
				HEX[6] <= 1'b1;

			end
		1'h5:begin

				HEX[0] <= 1'b1;
				HEX[1] <= 1'b0;
				HEX[2] <= 1'b1;
				HEX[3] <= 1'b1;
				HEX[4] <= 1'b0;
				HEX[5] <= 1'b1;
				HEX[6] <= 1'b1;

			end
		1'h6:begin

				HEX[0] <= 1'b1;
				HEX[1] <= 1'b0;
				HEX[2] <= 1'b1;
				HEX[3] <= 1'b1;
				HEX[4] <= 1'b1;
				HEX[5] <= 1'b1;
				HEX[6] <= 1'b1;

			end
		1'h7:begin

				HEX[0] <= 1'b1;
				HEX[1] <= 1'b1;
				HEX[2] <= 1'b1;
				HEX[3] <= 1'b0;
				HEX[4] <= 1'b0;
				HEX[5] <= 1'b0;
				HEX[6] <= 1'b0;

			end

		1'h8:begin

				HEX[0] <= 1'b1;
				HEX[1] <= 1'b1;
				HEX[2] <= 1'b1;
				HEX[3] <= 1'b1;
				HEX[4] <= 1'b1;
				HEX[5] <= 1'b1;
				HEX[6] <= 1'b1;

			end

		1'h9:begin

				HEX[0] <= 1'b1;
				HEX[1] <= 1'b1;
				HEX[2] <= 1'b1;
				HEX[3] <= 1'b1;
				HEX[4] <= 1'b0;
				HEX[5] <= 1'b1;
				HEX[6] <= 1'b1;

			end
	
		1'hA:begin

				HEX[0] <= 1'b1;
				HEX[1] <= 1'b1;
				HEX[2] <= 1'b1;
				HEX[3] <= 1'b0;
				HEX[4] <= 1'b1;
				HEX[5] <= 1'b1;
				HEX[6] <= 1'b1;

			end
		1'hB:begin

				HEX[0] <= 1'b0;
				HEX[1] <= 1'b0;
				HEX[2] <= 1'b1;
				HEX[3] <= 1'b0;
				HEX[4] <= 1'b1;
				HEX[5] <= 1'b1;
				HEX[6] <= 1'b1;

			end

		1'hC:begin

				HEX[0] <= 1'b0;
				HEX[1] <= 1'b1;
				HEX[2] <= 1'b0;
				HEX[3] <= 1'b1;
				HEX[4] <= 1'b1;
				HEX[5] <= 1'b1;
				HEX[6] <= 1'b1;

			end

		1'hD:

				HEX[0] <= 1'b0;
				HEX[1] <= 1'b1;
				HEX[2] <= 1'b1;
				HEX[3] <= 1'b1;
				HEX[4] <= 1'b1;
				HEX[5] <= 1'b0;
				HEX[6] <= 1'b1;

			end

		1'hE:

				HEX[0] <= 1'b1;
				HEX[1] <= 1'b0;
				HEX[2] <= 1'b0;
				HEX[3] <= 1'b1;
				HEX[4] <= 1'b1;
				HEX[5] <= 1'b1;
				HEX[6] <= 1'b1;

			end

		1'hE:

				HEX[0] <= 1'b1;
				HEX[1] <= 1'b0;
				HEX[2] <= 1'b0;
				HEX[3] <= 1'b0;
				HEX[4] <= 1'b1;
				HEX[5] <= 1'b1;
				HEX[6] <= 1'b1;

			end
endcase

endmodule
