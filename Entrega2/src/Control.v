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

	always @ (op)
	casex(op)
	  6'b000000 : begin // SLLV,SRLV,SRAV,JR,ADD,ADDU,SUB,SUBU,AND,OR,XOR,NOR
	              $display("@%0dns SLLV,SRLV,SRAV,JR,ADD,ADDU,SUB,SUBU,AND,OR,XOR,NOR op %b",$time,op);
	            end
	  6'b000010 : begin // J
	              $display("@%0dns J, op %b",$time,op);
	            end
	  6'b000100 : begin // BEQ	              
	              $display("@%0dns BEQ, op %b",$time,op);
	            end
	  6'b000101 : begin // BNE
	              $display("@%0dns BNE, op %b",$time,op);
	            end
	  6'b000110 : begin // BLEZ
	              $display("@%0dns BLEZ, op %b",$time,op);
	            end
	  6'b000111 : begin // BGTZ
	              $display("@%0dns BGTZ, op %b",$time,op);
	            end
	  6'b001000 : begin // ADDI
	              $display("@%0dns ADDI, op %b",$time,op);
	            end
	  6'b001001 : begin // ADDIU
	              $display("@%0dns ADDIU, op %b",$time,op);
	            end
	  6'b001100 : begin // ANDI
	              $display("@%0dns ANDI, op %b",$time,op);
	            end
	  6'b001101 : begin // ORI
	              $display("@%0dns ORI, op %b",$time,op);
	            end
	  6'b001110 : begin // XORI
	              $display("@%0dns XORI, op %b",$time,op);
	            end
	  6'b100011 : begin // LW
	              $display("@%0dns LW, op %b",$time,op);
	            end
	  6'b101011 : begin // SW
	              $display("@%0dns SW, op %b",$time,op);
	            end

	  default : begin
	              $display("@%0dns default is selected, op %b",$time,op);
	            end
	endcase 

endmodule