/* sudolshw@gmail.com */

module Control
(
	input[5:0] op,
	input[5:0] fn,
	output reg [2:0] selwsource,
	output reg [1:0] selregdest,
	output reg  writereg,
	output reg  writeov,
	output reg  selimregb,
	output reg  selalushift,
	output reg [2:0] aluop,
	output reg [1:0] shiftop,
	output reg  readmem,
	output reg  writemem,
	output reg [1:0] selbrjumpz,
	output reg [1:0] selpctype,
	output reg [2:0] compop,
	output reg  unsig
);

	always @ (op or fn)
		casex(op)
			6'b000000 : begin // SLLV,SRLV,SRAV,JR,ADD,ADDU,SUB,SUBU,AND,OR,XOR,NOR
						//$display("@%0dns SLLV,SRLV,SRAV,JR,ADD,ADDU,SUB,SUBU,AND,OR,XOR,NOR op %b",$time,op);
					casex(fn)
						6'b000100 : begin // SLLV,
									$display("@%0dns SLLV, op %b",$time,op);
									assign selwsource= 3'b000;
									assign selregdest= 2'b01; // RD
									assign writereg= 1'b1;
									assign writeov= 1'b1;
									assign selimregb= 1'b0;
									assign selalushift= 1'b1;
									assign aluop= 3'bxxx;
									assign shiftop= 2'b10; // left lógico
									assign readmem= 1'b0;
									assign writemem= 1'b0;
									assign selbrjumpz= 2'b00;
									assign selpctype= 2'bxx;
									assign compop= 3'bxxx;
									assign unsig= 1'bx;
								end
						6'b000110 : begin // SRLV,
									$display("@%0dns SRLV, op %b",$time,op);
									assign selwsource= 3'b000;
									assign selregdest= 2'b01; // RD
									assign writereg= 1'b1;
									assign writeov= 1'b1;
									assign selimregb= 1'b0;
									assign selalushift= 1'b1;
									assign aluop= 3'bxxx;
									assign shiftop= 2'b00; // right lógico
									assign readmem= 1'b0;
									assign writemem= 1'b0;
									assign selbrjumpz= 2'b00;
									assign selpctype= 2'bxx;
									assign compop= 3'bxxx;
									assign unsig= 1'bx;
								end
						6'b000111 : begin // SRAV,
									$display("@%0dns SRAV, op %b",$time,op);
									assign selwsource= 3'b000;
									assign selregdest= 2'b01; // RD
									assign writereg= 1'b1;
									assign writeov= 1'b1;
									assign selimregb= 1'b0;
									assign selalushift= 1'b1;
									assign aluop= 3'bxxx;
									assign shiftop= 2'b01; // right aritm
									assign readmem= 1'b0;
									assign writemem= 1'b0;
									assign selbrjumpz= 2'b00;
									assign selpctype= 2'bxx;
									assign compop= 3'bxxx;
									assign unsig= 1'bx;
								end
						6'b001000 : begin // JR,
									$display("@%0dns JR, op %b",$time,op);
									assign selwsource= 3'bxxx;
									assign selregdest= 2'bxx; // Nenhum
									assign writereg= 1'b0;
									assign writeov= 1'bx;
									assign selimregb= 1'bx;
									assign selalushift= 1'bx;
									assign aluop= 3'bxxx;
									assign shiftop= 2'bxx // nenhum
									assign readmem= 1'b0;
									assign writemem= 1'b0;
									assign selbrjumpz= 2'b01;
									assign selpctype= 2'b01; //RS
									assign compop= 3'bxxx;
									assign unsig= 1'bx;
								end
						6'b100000 : begin // ADD,
									$display("@%0dns ADD, op %b",$time,op);
									assign selwsource= 3'b000;
									assign selregdest= 2'b01; // RD
									assign writereg= 1'b1;
									assign writeov= 1'b1;
									assign selimregb= 1'b0;
									assign selalushift= 1'b0;
									assign aluop= 3'b010; //Soma
									assign shiftop= 2'bxx; // nenhum
									assign readmem= 1'b0;
									assign writemem= 1'b0;
									assign selbrjumpz= 2'b00;
									assign selpctype= 2'bxx; //PC
									assign compop= 3'bxxx;
									assign unsig= 1'b0;
								end
						6'b100001 : begin // ADDU,
									$display("@%0dns ADDU, op %b",$time,op);
									assign selwsource= 3'b000;
									assign selregdest= 2'b01; // RD
									assign writereg= 1'b1;
									assign writeov= 1'b1;
									assign selimregb= 1'b0;
									assign selalushift= 1'b0;
									assign aluop= 3'b010; /soma
									assign shiftop= 2'bxx; // nenhum
									assign readmem= 1'b0;
									assign writemem= 1'b0;
									assign selbrjumpz= 2'b00;
									assign selpctype= 2'bxx; //PC
									assign compop= 3'bxxx;
									assign unsig= 1'b1;
								end
						6'b100010 : begin // SUB,
									$display("@%0dns SUB, op %b",$time,op);
									assign selwsource= 3'b000;
									assign selregdest= 2'b01; // RD
									assign writereg= 1'b1;
									assign writeov= 1'b0;
									assign selimregb= 1'b0;
									assign selalushift= 1'b0;
									assign aluop= 3'b110; // subtração
									assign shiftop= 2'bxx; // nenhum
									assign readmem= 1'b0;
									assign writemem= 1'b0;
									assign selbrjumpz= 2'b00;
									assign selpctype= 2'bxx; //PC
									assign compop= 3'bxxx; // nenhum
									assign unsig= 1'bx;
								end
						6'b100011 : begin // SUBU,
									$display("@%0dns SUBU, op %b",$time,op);
									assign selwsource= 3'b000;
									assign selregdest= 2'b01; // RD
									assign writereg= 1'b1;
									assign writeov= 1'b1;
									assign selimregb= 1'b0;
									assign selalushift= 1'b0;
									assign aluop= 3'b110; // subtração
									assign shiftop= 2'bxx; // nenhum
									assign readmem= 1'b0;
									assign writemem= 1'b0;
									assign selbrjumpz= 2'b00;
									assign selpctype= 2'bxx; //PC
									assign compop= 3'bxxx; // nenhum
									assign unsig= 1'b1;
								end
						6'b100100 : begin // AND,
									$display("@%0dns AND, op %b",$time,op);
									assign selwsource= 3'b000;
									assign selregdest= 2'b01; // RD
									assign writereg= 1'b1;
									assign writeov= 1'b1;
									assign selimregb= 1'b0;
									assign selalushift= 1'b0;
									assign aluop= 3'b000; // and lógico
									assign shiftop= 2'bxx; // nenhum
									assign readmem= 1'b0;
									assign writemem= 1'b0;
									assign selbrjumpz= 2'b00;
									assign selpctype= 2'bxx; //PC
									assign compop= 3'bxxx; // nenhum
									assign unsig= 1'bx;
								end
						6'b100101 : begin // OR,
									$display("@%0dns OR, op %b",$time,op);
									assign selwsource= 3'b000;
									assign selregdest= 2'b01; // RD
									assign writereg= 1'b1;
									assign writeov= 1'b0;
									assign selimregb= 1'b0;
									assign selalushift= 1'b0;
									assign aluop= 3'b110; // subtração
									assign shiftop= 2'bxx; // nenhum
									assign readmem= 1'b0;
									assign writemem= 1'b0;
									assign selbrjumpz= 2'b00;
									assign selpctype= 2'bxx; //PC
									assign compop= 3'bxxx; // nenhum
									assign unsig= 1'bx;
								end
						6'b100110 : begin // XOR,
									$display("@%0dns XOR, op %b",$time,op);
									assign selwsource= 3'b000;
									assign selregdest= 2'b01; // RD
									assign writereg= 1'b1;
									assign writeov= 1'b0;
									assign selimregb= 1'b0;
									assign selalushift= 1'b0;
									assign aluop= 3'b110; // subtração
									assign shiftop= 2'bxx; // nenhum
									assign readmem= 1'b0;
									assign writemem= 1'b0;
									assign selbrjumpz= 2'b00;
									assign selpctype= 2'bxx; //PC
									assign compop= 3'bxxx; // nenhum
									assign unsig= 1'bx;
								end
						6'b100111 : begin // NOR
									$display("@%0dns NOR, op %b",$time,op);
									assign selwsource= 3'b000;
									assign selregdest= 2'b01; // RD
									assign writereg= 1'b1;
									assign writeov= 1'b0;
									assign selimregb= 1'b0;
									assign selalushift= 1'b0;
									assign aluop= 3'b110; // subtração
									assign shiftop= 2'bxx; // nenhum
									assign readmem= 1'b0;
									assign writemem= 1'b0;
									assign selbrjumpz= 2'b00;
									assign selpctype= 2'bxx; //PC
									assign compop= 3'bxxx; // nenhum
									assign unsig= 1'bx;
								end
					endcase

					end
			6'b000010 : begin // J
						$display("@%0dns J, op %b",$time,op);
						assign selwsource= 3'b000;
						assign selregdest= 2'b01; // RD
						assign writereg= 1'b1;
						assign writeov= 1'b1;
						assign selimregb= 1'b0;
						assign selalushift= 1'b1;
						assign aluop= 3'bxxx;
						assign shiftop= 2'b10; // left lógico
						assign readmem= 1'b0;
						assign writemem= 1'b0;
						assign selbrjumpz= 2'b10;
						assign selpctype= 2'bxx;
						assign compop= 3'bxxx;
						assign unsig= 1'bx;
					end
			6'b000100 : begin // BEQ
						$display("@%0dns BEQ, op %b",$time,op);
						assign selwsource= 3'b000;
						assign selregdest= 2'b01; // RD
						assign writereg= 1'b1;
						assign writeov= 1'b1;
						assign selimregb= 1'b0;
						assign selalushift= 1'b1;
						assign aluop= 3'bxxx;
						assign shiftop= 2'b10; // left lógico
						assign readmem= 1'b0;
						assign writemem= 1'b0;
						assign selbrjumpz= 2'b10;
						assign selpctype= 2'bxx;
						assign compop= 3'bxxx;
						assign unsig= 1'bx;
					end
			6'b000101 : begin // BNE
						$display("@%0dns BNE, op %b",$time,op);
						assign selwsource= 3'b000;
						assign selregdest= 2'b01; // RD
						assign writereg= 1'b1;
						assign writeov= 1'b1;
						assign selimregb= 1'b0;
						assign selalushift= 1'b1;
						assign aluop= 3'bxxx;
						assign shiftop= 2'b10; // left lógico
						assign readmem= 1'b0;
						assign writemem= 1'b0;
						assign selbrjumpz= 2'b10;
						assign selpctype= 2'bxx;
						assign compop= 3'bxxx;
						assign unsig= 1'bx;
					end
			6'b000110 : begin // BLEZ
						$display("@%0dns BLEZ, op %b",$time,op);
						assign selwsource= 3'b000;
						assign selregdest= 2'b01; // RD
						assign writereg= 1'b1;
						assign writeov= 1'b1;
						assign selimregb= 1'b0;
						assign selalushift= 1'b1;
						assign aluop= 3'bxxx;
						assign shiftop= 2'b10; // left lógico
						assign readmem= 1'b0;
						assign writemem= 1'b0;
						assign selbrjumpz= 2'b10;
						assign selpctype= 2'bxx;
						assign compop= 3'bxxx;
						assign unsig= 1'bx;
					end
			6'b000111 : begin // BGTZ
						$display("@%0dns BGTZ, op %b",$time,op);
						assign selwsource= 3'b000;
						assign selregdest= 2'b01; // RD
						assign writereg= 1'b1;
						assign writeov= 1'b1;
						assign selimregb= 1'b0;
						assign selalushift= 1'b1;
						assign aluop= 3'bxxx;
						assign shiftop= 2'b10; // left lógico
						assign readmem= 1'b0;
						assign writemem= 1'b0;
						assign selbrjumpz= 2'b10;
						assign selpctype= 2'bxx;
						assign compop= 3'bxxx;
						assign unsig= 1'bx;
					end
			6'b001000 : begin // ADDI
						$display("@%0dns ADDI, op %b",$time,op);
						assign selwsource= 3'b000;
						assign selregdest= 2'b01; // RD
						assign writereg= 1'b1;
						assign writeov= 1'b1;
						assign selimregb= 1'b0;
						assign selalushift= 1'b1;
						assign aluop= 3'bxxx;
						assign shiftop= 2'b10; // left lógico
						assign readmem= 1'b0;
						assign writemem= 1'b0;
						assign selbrjumpz= 2'b10;
						assign selpctype= 2'bxx;
						assign compop= 3'bxxx;
						assign unsig= 1'bx;
					end
			6'b001001 : begin // ADDIU
						$display("@%0dns ADDIU, op %b",$time,op);
						assign selwsource= 3'b000;
						assign selregdest= 2'b01; // RD
						assign writereg= 1'b1;
						assign writeov= 1'b1;
						assign selimregb= 1'b0;
						assign selalushift= 1'b1;
						assign aluop= 3'bxxx;
						assign shiftop= 2'b10; // left lógico
						assign readmem= 1'b0;
						assign writemem= 1'b0;
						assign selbrjumpz= 2'b10;
						assign selpctype= 2'bxx;
						assign compop= 3'bxxx;
						assign unsig= 1'bx;
					end
			6'b001100 : begin // ANDI
						$display("@%0dns ANDI, op %b",$time,op);
						assign selwsource= 3'b000;
						assign selregdest= 2'b01; // RD
						assign writereg= 1'b1;
						assign writeov= 1'b1;
						assign selimregb= 1'b0;
						assign selalushift= 1'b1;
						assign aluop= 3'bxxx;
						assign shiftop= 2'b10; // left lógico
						assign readmem= 1'b0;
						assign writemem= 1'b0;
						assign selbrjumpz= 2'b10;
						assign selpctype= 2'bxx;
						assign compop= 3'bxxx;
						assign unsig= 1'bx;
					end
			6'b001101 : begin // ORI
						$display("@%0dns ORI, op %b",$time,op);
						assign selwsource= 3'b000;
						assign selregdest= 2'b01; // RD
						assign writereg= 1'b1;
						assign writeov= 1'b1;
						assign selimregb= 1'b0;
						assign selalushift= 1'b1;
						assign aluop= 3'bxxx;
						assign shiftop= 2'b10; // left lógico
						assign readmem= 1'b0;
						assign writemem= 1'b0;
						assign selbrjumpz= 2'b10;
						assign selpctype= 2'bxx;
						assign compop= 3'bxxx;
						assign unsig= 1'bx;
					end
			6'b001110 : begin // XORI
						$display("@%0dns XORI, op %b",$time,op);
						assign selwsource= 3'b000;
						assign selregdest= 2'b01; // RD
						assign writereg= 1'b1;
						assign writeov= 1'b1;
						assign selimregb= 1'b0;
						assign selalushift= 1'b1;
						assign aluop= 3'bxxx;
						assign shiftop= 2'b10; // left lógico
						assign readmem= 1'b0;
						assign writemem= 1'b0;
						assign selbrjumpz= 2'b10;
						assign selpctype= 2'bxx;
						assign compop= 3'bxxx;
						assign unsig= 1'bx;
					end
			6'b100011 : begin // LW
						$display("@%0dns LW, op %b",$time,op);
						assign selwsource= 3'b000;
						assign selregdest= 2'b01; // RD
						assign writereg= 1'b1;
						assign writeov= 1'b1;
						assign selimregb= 1'b0;
						assign selalushift= 1'b1;
						assign aluop= 3'bxxx;
						assign shiftop= 2'b10; // left lógico
						assign readmem= 1'b0;
						assign writemem= 1'b0;
						assign selbrjumpz= 2'b10;
						assign selpctype= 2'bxx;
						assign compop= 3'bxxx;
						assign unsig= 1'bx;
					end
			6'b101011 : begin // SW
						$display("@%0dns SW, op %b",$time,op);
						assign selwsource= 3'bxxx;
						assign selregdest= 2'bxx; // RD
						assign writereg= 1'b0;
						assign writeov= 1'bx;
						assign selimregb= 1'b1;
						assign selalushift= 1'b0;
						assign aluop= 3'b010;
						assign shiftop= 2'bxx; // left lógico
						assign readmem= 1'b0;
						assign writemem= 1'b1;
						assign selbrjumpz= 2'b00;
						assign selpctype= 2'bxx;
						assign compop= 3'bxxx;
						assign unsig= 1'b0;
					end

		  default : begin
						$display("@%0dns default is selected, op %b",$time,op);
						assign selwsource= 3'b000;
						assign selregdest= 2'b01; // RD
						assign writereg= 1'b1;
						assign writeov= 1'b1;
						assign selimregb= 1'b0;
						assign selalushift= 1'b1;
						assign aluop= 3'bxxx;
						assign shiftop= 2'b10; // left lógico
						assign readmem= 1'b0;
						assign writemem= 1'b0;
						assign selbrjumpz= 2'b10;
						assign selpctype= 2'bxx;
						assign compop= 3'bxxx;
						assign unsig = 1'bx;
					end
		endcase

endmodule