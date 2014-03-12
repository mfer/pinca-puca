/* sudolshw@gmail.com */

module tb_Control;
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

	always #2 fn = $random;

	initial begin
	  op = 0;
	  #2 op = 4'b101x;
	  #2 op = 4'b0101;
	  #2 op = 4'b0010;
	  #2 op = 4'b0000;
	  #2 $finish;
	end
endmodule