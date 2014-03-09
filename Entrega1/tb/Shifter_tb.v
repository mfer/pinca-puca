module Shifter_tb;

reg [31:0] in;
reg [1:0] shiftop;
reg [4:0] shiftamt;
wire [31:0] result;


//shiftop = 00 shift lógico para direita
//shiftop = 01 shift aritmético para direita
//shiftop = 10 shift lógico para esquerda

Shifter teste(in,shiftop,shiftamt, result);

initial
	begin
	$dumpfile("Shifter.vcd");
	$dumpvars;
	in=32'b00000000000000000000000000000001;
	shiftop=2'b00;
	shiftamt=4'b0001;
	#10
	$display("%b",result);
	in=32'b00000000000000000000000000000001;
	shiftop=2'b00;
	shiftamt=4'b0010;
	#10
	$display("%b",result);
	in=32'b00000000000000000000000000000001;
	shiftop=2'b00;
	shiftamt=4'b0011;
	#10
	$display("%b",result);
	in=32'b00000000000000000000000000000001;
	shiftop=2'b01;
	shiftamt=4'b0001;
	#10
	$display("%b",result);
	in=32'b00000000000000000000000000000001;
	shiftop=2'b01;
	shiftamt=4'b0010;
	#10
	$display("%b",result);
	in=32'b00000000000000000000000000000001;
	shiftop=2'b01;
	shiftamt=4'b0011;
	#10
	$display("%b",result);
	in=32'b00000000000000000000000000000001;
	shiftop=2'b10;
	shiftamt=4'b0001;
	#10
	$display("%b",result);
	in=32'b00000000000000000000000000000001;
	shiftop=2'b10;
	shiftamt=4'b0010;
	#10
	$display("%b",result);
	in=32'b00000000000000000000000000000001;
	shiftop=2'b10;
	shiftamt=4'b0011;
	#10
	$display("%b",result);
	$finish;
	end
endmodule
