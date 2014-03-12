/* sudolshw@gmail.com */

module Control
(
	input[5:0] op,
	input[5:0] fn,
	output[2:0] selwsource,
	output[1:0] selregdest,
	output writereg,
	output writeov,
	output selimregb,
	output selalushift,
	output[2:0] aluop,
	output[1:0] shiftop,
	output readmem,
	output writemem,	
	output[1:0] selbrjumpz,
	output[1:0] selpctype,
	output[2:0] compop,
	output unsig
);

	always @ (op or fn)
	casex(op)
	  4'b1zzx : begin // Don't care  2:0 bits
	              
	              $display("@%0dns 4'b1zzx is selected, op %b",$time,op);
	            end
	  4'b01?? : begin // bit 1:0 is don't care
	              
	              $display("@%0dns 4'b01?? is selected, op %b",$time,op);
	            end
	  4'b001? : begin // bit 0 is don't care
	              
	              $display("@%0dns 4'b001? is selected, op %b",$time,op);
	            end
	  default : begin
	              $display("@%0dns default is selected, op %b",$time,op);
	            end
	endcase 

endmodule