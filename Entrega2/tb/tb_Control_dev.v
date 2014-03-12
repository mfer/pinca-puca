/* sudolshw@gmail.com */

module tb_Control_dev;
	reg[5:0] op;
	reg[5:0] fn;
	wire[2:0] selwsource;
	wire[1:0] selregdest;
	wire writereg;
	wire writeov;
	wire selimregb;
	wire selalushift;
	wire[2:0] aluop;
	wire[1:0] shiftop;
	wire readmem;
	wire writemem;
	wire[1:0] selbrjumpz;
	wire[1:0] selpctype;
	wire[2:0] compop;
	wire unsig;

	Control c000000(op,fn,selwsource,selregdest,writereg,writeov,selimregb,selalushift,aluop,shiftop,readmem,writemem,selbrjumpz,selpctype,compop,unsig);

	always #2 fn = 6'b000000;

	initial begin
		//SLLV,SRLV,SRAV,JR,ADD,ADDU,SUB,SUBU,AND,OR,XOR,NOR
		op = 6'b000000;
		#2

		//J,BEQ,BNE,BLEZ,BGTZ
	    op = 6'b000010;
		#2
	    op = 6'b000100;
		#2
	    op = 6'b000101;
		#2
	    op = 6'b000110;
		#2
		op = 6'b000111;
		#2

		//ADDi,ADDIU,ANDI,ORI,XORI
	    op = 6'b001000;
		#2
	    op = 6'b001001;
		#2
	    op = 6'b001100;
		#2
	    op = 6'b001101;
		#2
		op = 6'b001110;
		#2

		//LW,SW
	    op = 6'b100011;
		#2
	    op = 6'b101011;
		#2

		#2 $finish;
	end
endmodule