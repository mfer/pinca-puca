module Control(
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
									selwsource <= 3'b000;
									selregdest <= 2'b01; // RD
									writereg <= 1'b1;
									writeov <= 1'b1;
									selimregb <= 1'b0;
									selalushift <= 1'b1;
									aluop <= 3'bxxx;
									shiftop <= 2'b10; // left lógico
									readmem <= 1'b0;
									writemem <= 1'b0;
									selbrjumpz <= 2'b00;
									selpctype <= 2'bxx;
									compop <= 3'bxxx;
									unsig <= 1'bx;
								end
						6'b000110 : begin // SRLV,
									$display("@%0dns SRLV, op %b",$time,op);
									selwsource <= 3'b000;
									selregdest <= 2'b01; // RD
									writereg <= 1'b1;
									writeov <= 1'b1;
									selimregb <= 1'b0;
									selalushift <= 1'b1;
									aluop <= 3'bxxx;
									shiftop <= 2'b00; // right lógico
									readmem <= 1'b0;
									writemem <= 1'b0;
									selbrjumpz <= 2'b00;
									selpctype <= 2'bxx;
									compop <= 3'bxxx;
									unsig <= 1'bx;
								end
						6'b000111 : begin // SRAV,
									$display("@%0dns SRAV, op %b",$time,op);
									selwsource <= 3'b000;
									selregdest <= 2'b01; // RD
									writereg <= 1'b1;
									writeov <= 1'b1;
									selimregb <= 1'b0;
									selalushift <= 1'b1;
									aluop <= 3'bxxx;
									shiftop <= 2'b01; // right aritm
									readmem <= 1'b0;
									writemem <= 1'b0;
									selbrjumpz <= 2'b00;
									selpctype <= 2'bxx;
									compop <= 3'bxxx;
									unsig <= 1'bx;
								end
						6'b001000 : begin // JR,
									$display("@%0dns JR, op %b",$time,op);
									selwsource <= 3'bxxx;
									selregdest <= 2'bxx; // Nenhum
									writereg <= 1'b0;
									writeov <= 1'bx;
									selimregb <= 1'bx;
									selalushift <= 1'bx;
									aluop <= 3'bxxx;
									shiftop <= 2'bxx; // nenhum
									readmem <= 1'b0;
									writemem <= 1'b0;
									selbrjumpz <= 2'b01;
									selpctype <= 2'b01; //RS
									compop <= 3'bxxx;
									unsig <= 1'bx;
								end
						6'b100000 : begin // ADD,
									$display("@%0dns ADD, op %b",$time,op);
									selwsource <= 3'b000;
									selregdest <= 2'b01; // RD
									writereg <= 1'b1;
									writeov <= 1'b1;
									selimregb <= 1'b0;
									selalushift <= 1'b0;
									aluop <= 3'b010; //Soma
									shiftop <= 2'bxx; // nenhum
									readmem <= 1'b0;
									writemem <= 1'b0;
									selbrjumpz <= 2'b00;
									selpctype <= 2'bxx; //PC
									compop <= 3'bxxx;
									unsig <= 1'b0;
								end
						6'b100001 : begin // ADDU,
									$display("@%0dns ADDU, op %b",$time,op);
									selwsource <= 3'b000;
									selregdest <= 2'b01; // RD
									writereg <= 1'b1;
									writeov <= 1'b1;
									selimregb <= 1'b0;
									selalushift <= 1'b0;
									aluop <= 3'b010; //soma
									shiftop <= 2'bxx; // nenhum
									readmem <= 1'b0;
									writemem <= 1'b0;
									selbrjumpz <= 2'b00;
									selpctype <= 2'bxx; //PC
									compop <= 3'bxxx;
									unsig <= 1'b1;
								end
						6'b100010 : begin // SUB,
									$display("@%0dns SUB, op %b",$time,op);
									selwsource <= 3'b000;
									selregdest <= 2'b01; // RD
									writereg <= 1'b1;
									writeov <= 1'b0;
									selimregb <= 1'b0;
									selalushift <= 1'b0;
									aluop <= 3'b110; // subtração
									shiftop <= 2'bxx; // nenhum
									readmem <= 1'b0;
									writemem <= 1'b0;
									selbrjumpz <= 2'b00;
									selpctype <= 2'bxx; //PC
									compop <= 3'bxxx; // nenhum
									unsig <= 1'bx;
								end
						6'b100011 : begin // SUBU,
									$display("@%0dns SUBU, op %b",$time,op);
									selwsource <= 3'b000;
									selregdest <= 2'b01; // RD
									writereg <= 1'b1;
									writeov <= 1'b1;
									selimregb <= 1'b0;
									selalushift <= 1'b0;
									aluop <= 3'b110; // subtração
									shiftop <= 2'bxx; // nenhum
									readmem <= 1'b0;
									writemem <= 1'b0;
									selbrjumpz <= 2'b00;
									selpctype <= 2'bxx; //PC
									compop <= 3'bxxx; // nenhum
									unsig <= 1'b1;
								end
						6'b100100 : begin // AND,
									$display("@%0dns AND, op %b",$time,op);
									selwsource <= 3'b000;
									selregdest <= 2'b01; // RD
									writereg <= 1'b1;
									writeov <= 1'b1;
									selimregb <= 1'b0;
									selalushift <= 1'b0;
									aluop <= 3'b000; // and lógico
									shiftop <= 2'bxx; // nenhum
									readmem <= 1'b0;
									writemem <= 1'b0;
									selbrjumpz <= 2'b00;
									selpctype <= 2'bxx; //PC
									compop <= 3'bxxx; // nenhum
									unsig <= 1'bx;
								end
						6'b100101 : begin // OR,
									$display("@%0dns OR, op %b",$time,op);
									selwsource <= 3'b000;
									selregdest <= 2'b01; // RD
									writereg <= 1'b1;
									writeov <= 1'b1;
									selimregb <= 1'b0;
									selalushift <= 1'b0;
									aluop <= 3'b001; // or lógico
									shiftop <= 2'bxx; // nenhum
									readmem <= 1'b0;
									writemem <= 1'b0;
									selbrjumpz <= 2'b00;
									selpctype <= 2'bxx; //PC
									compop <= 3'bxxx; // nenhum
									unsig <= 1'bx;
								end
						6'b100110 : begin // XOR,
									$display("@%0dns XOR, op %b",$time,op);
									selwsource <= 3'b000;
									selregdest <= 2'b01; // RD
									writereg <= 1'b1;
									writeov <= 1'b1;
									selimregb <= 1'b0;
									selalushift <= 1'b0;
									aluop <= 3'b101; // xor lógico
									shiftop <= 2'bxx; // nenhum
									readmem <= 1'b0;
									writemem <= 1'b0;
									selbrjumpz <= 2'b00;
									selpctype <= 2'bxx; //PC
									compop <= 3'bxxx; // nenhum
									unsig <= 1'bx;
								end
						6'b100111 : begin // NOR
									$display("@%0dns NOR, op %b",$time,op);
									selwsource <= 3'b000;
									selregdest <= 2'b01; // RD
									writereg <= 1'b1;
									writeov <= 1'b1;
									selimregb <= 1'b0;
									selalushift <= 1'b0;
									aluop <= 3'b100; // nor lógico
									shiftop <= 2'bxx; // nenhum
									readmem <= 1'b0;
									writemem <= 1'b0;
									selbrjumpz <= 2'b00;
									selpctype <= 2'bxx; //PC
									compop <= 3'bxxx; // nenhum
									unsig <= 1'bx;
								end
						default : begin 
									$display(" default");
									selwsource <= 3'b000;
									selregdest <= 2'b00;
									writereg <= 1'b0;
									writeov <= 1'b0;
									selimregb <= 1'b0;
									selalushift <= 1'b0;
									aluop <= 3'b000; 
									shiftop <= 2'b00;
									readmem <= 1'b0;
									writemem <= 1'b0;
									selbrjumpz <= 2'b00;
									selpctype <= 2'b00;
									compop <= 3'b000; 
									unsig <= 1'b0;
								end
					endcase

					end
			6'b000010 : begin // J
						$display("@%0dns J, op %b",$time,op);
						selwsource <= 3'bxxx;
						selregdest <= 2'bxx; // nenhum
						writereg <= 1'b0;
						writeov <= 1'bx;
						selimregb <= 1'bx;
						selalushift <= 1'bx;
						aluop <= 3'bxxx; //nenhum
						shiftop <= 2'bxx; // nenhum
						readmem <= 1'b0;
						writemem <= 1'b0;
						selbrjumpz <= 2'b01;
						selpctype <= 2'b10; //index
						compop <= 3'bxxx;
						unsig <= 1'bx;
					end
			6'b000100 : begin // BEQ
						$display("@%0dns BEQ, op %b",$time,op);
						selwsource <= 3'bxxx;
						selregdest <= 2'bxx; // nenhum
						writereg <= 1'b0;
						writeov <= 1'bx;
						selimregb <= 1'bx;
						selalushift <= 1'bx;
						aluop <= 3'bxxx; // nenhum
						shiftop <= 2'bxx; // nenhum
						readmem <= 1'b0;
						writemem <= 1'b0;
						selbrjumpz <= 2'b10;
						selpctype <= 2'b00; // pc + lm
						compop <= 3'b000; // =
						unsig <= 1'b0;
					end
			6'b000101 : begin // BNE
						$display("@%0dns BEQ, op %b",$time,op);
						selwsource <= 3'bxxx;
						selregdest <= 2'bxx; // nenhum
						writereg <= 1'b0;
						writeov <= 1'bx;
						selimregb <= 1'bx;
						selalushift <= 1'bx;
						aluop <= 3'bxxx; // nenhum
						shiftop <= 2'bxx; // nenhum
						readmem <= 1'b0;
						writemem <= 1'b0;
						selbrjumpz <= 2'b10;
						selpctype <= 2'b00; // pc + lm
						compop <= 3'b101; // !=
						unsig <= 1'b0;
					end
			6'b000110 : begin // BLEZ
						$display("@%0dns BLEZ, op %b",$time,op);
						selwsource <= 3'bxxx;
						selregdest <= 2'bxx; // nenhum
						writereg <= 1'b0;
						writeov <= 1'bx;
						selimregb <= 1'bx;
						selalushift <= 1'bx;
						aluop <= 3'bxxx; // nenhum
						shiftop <= 2'bxx; // nenhum
						readmem <= 1'b0;
						writemem <= 1'b0;
						selbrjumpz <= 2'b10;
						selpctype <= 2'b00; // pc + lm
						compop <= 3'b010; // <= 0
						unsig <= 1'b0;
					end
			6'b000111 : begin // BGTZ
						$display("@%0dns BGTZ, op %b",$time,op);
						selwsource <= 3'bxxx;
						selregdest <= 2'bxx; // nenhum
						writereg <= 1'b0;
						writeov <= 1'bx;
						selimregb <= 1'bx;
						selalushift <= 1'bx;
						aluop <= 3'bxxx; // nenhum
						shiftop <= 2'bxx; // nenhum
						readmem <= 1'b0;
						writemem <= 1'b0;
						selbrjumpz <= 2'b10;
						selpctype <= 2'b00; // pc + lm
						compop <= 3'b011; // > 0
						unsig <= 1'b0;
					end
			6'b001000 : begin // ADDI
						$display("@%0dns ADDI, op %b",$time,op);
						selwsource <= 3'b000;
						selregdest <= 2'b00; // RT
						writereg <= 1'b1;
						writeov <= 1'b0;
						selimregb <= 1'b1;
						selalushift <= 1'b0;
						aluop <= 3'b010; //Soma
						shiftop <= 2'bxx; // Nenhum
						readmem <= 1'b0;
						writemem <= 1'b0;
						selbrjumpz <= 2'b00;
						selpctype <= 2'bxx; // PC
						compop <= 3'bxxx;
						unsig <= 1'b0;
					end
			6'b001001 : begin // ADDIU
						$display("@%0dns ADDIU, op %b",$time,op);
						selwsource <= 3'b000;
						selregdest <= 2'b00; // RT
						writereg <= 1'b1;
						writeov <= 1'b1;
						selimregb <= 1'b1;
						selalushift <= 1'b0;
						aluop <= 3'b010; //Soma
						shiftop <= 2'bxx; // Nenhum
						readmem <= 1'b0;
						writemem <= 1'b0;
						selbrjumpz <= 2'b00;
						selpctype <= 2'bxx; // PC
						compop <= 3'bxxx;
						unsig <= 1'b1;
					end
			6'b001100 : begin // ANDI
						$display("@%0dns ANDI, op %b",$time,op);
						selwsource <= 3'b000;
						selregdest <= 2'b00; // RT
						writereg <= 1'b1;
						writeov <= 1'b1;
						selimregb <= 1'b1;
						selalushift <= 1'b0;
						aluop <= 3'b000; // And lógico
						shiftop <= 2'bxx; // Nenhum
						readmem <= 1'b0;
						writemem <= 1'b0;
						selbrjumpz <= 2'b00;
						selpctype <= 2'bxx; // PC
						compop <= 3'bxxx;
						unsig <= 1'bx;
					end
			6'b001101 : begin // ORI
						$display("@%0dns ORI, op %b",$time,op);
						selwsource <= 3'b000;
						selregdest <= 2'b00; // RT
						writereg <= 1'b1;
						writeov <= 1'b1;
						selimregb <= 1'b1;
						selalushift <= 1'b0;
						aluop <= 3'b001; // or lógico
						shiftop <= 2'bxx; // Nenhum
						readmem <= 1'b0;
						writemem <= 1'b0;
						selbrjumpz <= 2'b00;
						selpctype <= 2'bxx; // PC
						compop <= 3'bxxx;
						unsig <= 1'bx;
					end
			6'b001110 : begin // XORI
						$display("@%0dns XORI, op %b",$time,op);
						selwsource <= 3'b000;
						selregdest <= 2'b00; // RT
						writereg <= 1'b1;
						writeov <= 1'b1;
						selimregb <= 1'b1;
						selalushift <= 1'b0;
						aluop <= 3'b101; // xor lógico
						shiftop <= 2'bxx; // Nenhum
						readmem <= 1'b0;
						writemem <= 1'b0;
						selbrjumpz <= 2'b00;
						selpctype <= 2'bxx; // PC
						compop <= 3'bxxx;
						unsig <= 1'bx;
					end
			6'b100011 : begin // LW
						$display("@%0dns LW, op %b",$time,op);
						selwsource <= 3'b001;
						selregdest <= 2'b00; // RT
						writereg <= 1'b1;
						writeov <= 1'b1;
						selimregb <= 1'b1;
						selalushift <= 1'b0;
						aluop <= 3'b010; // soma
						shiftop <= 2'bxx; // nenhum
						readmem <= 1'b1;
						writemem <= 1'b0;
						selbrjumpz <= 2'b00;
						selpctype <= 2'bxx; // PC
						compop <= 3'bxxx;
						unsig <= 1'b0;
					end
			6'b101011 : begin // SW
						$display("@%0dns SW, op %b",$time,op);
						selwsource <= 3'bxxx;
						selregdest <= 2'bxx; // nenhum
						writereg <= 1'b0;
						writeov <= 1'bx;
						selimregb <= 1'b1;
						selalushift <= 1'b0;
						aluop <= 3'b010; // soma
						shiftop <= 2'bxx; // nenhum
						readmem <= 1'b0;
						writemem <= 1'b1;
						selbrjumpz <= 2'b00;
						selpctype <= 2'bxx; // PC
						compop <= 3'bxxx;
						unsig <= 1'b0;
					end

			default : begin 
						$display(" default");
						selwsource <= 3'b000;
						selregdest <= 2'b00; 
						writereg <= 1'b0;
						writeov <= 1'b0;
						selimregb <= 1'b0;
						selalushift <= 1'b0;
						aluop <= 3'b000;
						shiftop <= 2'b00;
						readmem <= 1'b0;
						writemem <= 1'b0;
						selbrjumpz <= 2'b00;
						selpctype <= 2'b00;
						compop <= 3'b000;
						unsig <= 1'b0;
				end

		  default : begin
				$display("@%0dns default is selected, op %b",$time,op);
				//não fazer nada torna esse cara um latch
				//e atribuir o valor de antes um fio....
				end
		endcase

endmodule
