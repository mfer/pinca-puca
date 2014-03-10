module tb_Alu;

reg 	[31:0]		a;
reg 	[31:0]	 	b;
reg 	[2:0]		op;
reg 			unsig;
wire 			compout;
wire	overflow;
wire[31:0] aluout;

//op=000 a&&b
//op=001 a||b
//op=010 a+b
//op=100 a nor b
//op=101 a xor b
//op=110 a-b

Alu dut (a, b, aluout, op, unsig, compout, overflow);

initial
	begin
	$dumpfile("vcd/Alu.vcd");
	$dumpvars;
	//a && b
	a = 32'b00000000000000000000000000000000;
	b = 32'b00000000000000000000000000000000;
	unsig = 2'b0;
	op=3'b000; 
	#10
	$display("%b",aluout);
	$display("%b",overflow);
	#10
	//a && b
	a = 32'b00000000000000000000000000000001;
	b = 32'b00000000000000000000000000000001;
	unsig = 2'b0;
	op=3'b000;
	#10
	$display("%b",aluout);
	$display("%b",overflow);
	#10
	//a || b
	a = 32'b00000000000000000000000000000000;
	b = 32'b00000000000000000000000000000001;
	unsig = 2'b0;
	op=3'b001;
	#10
	$display("%b",aluout);
	$display("%b",overflow);
	#10
	//a || b
	a = 32'b00000000000000000000000000000000;
	b = 32'b00000000000000000000000000000000;
	unsig = 2'b0;
	op=3'b001;
	#10
	$display("%b",aluout);
	$display("%b",overflow);
	#10
	//a + b
	a = 32'b00000000000000000000000000000000;
	b = 32'b00000000000000000000000000000000;
	unsig = 2'b0;
	op=3'b010;
	#10
	$display("%b",aluout);
	$display("%b",overflow);
	//a + b
	a = 32'b10000000000000000000000000000000;
	b = 32'b10000000000000000000000000000000;
	unsig = 2'b0;
	op=3'b010;
	#10
	$display("%b",aluout);
	$display("%b",overflow);
	//a + b
	a = 32'b00000000000000000000000000000001;
	b = 32'b00000000000000000000000000000001;
	unsig = 2'b0;
	op=3'b010;
	#10
	$display("%b",aluout);
	$display("%b",overflow);
	//a nor b
	a = 32'b00000000000000000000000000000001;
	b = 32'b00000000000000000000000000000001;
	unsig = 2'b0;
	op=3'b100;
	#10
	$display("%b",aluout);
	$display("%b",overflow);
	//a nor b
	a = 32'b00000000000000000000000000000000;
	b = 32'b00000000000000000000000000000000;
	unsig = 2'b0;
	op=3'b100;
	#10
	$display("%b",aluout);
	$display("%b",overflow);
	//a xnor b
	a = 32'b00000000000000000000000000000001;
	b = 32'b00000000000000000000000000000001;
	unsig = 2'b0;
	op=3'b101;
	#10
	$display("%b",aluout);
	$display("%b",overflow);
	//a xnor b
	a = 32'b00000000000000000000000000000001;
	b = 32'b00000000000000000000000000000000;
	unsig = 2'b0;
	op=3'b101;
	#10
	$display("%b",aluout);
	$display("%b",overflow);
	//a - b
	a = 32'b00000000000000000000000000000001;
	b = 32'b00000000000000000000000000000001;
	unsig = 2'b0;
	op=3'b110;
	#10
	$display("%b",aluout);
	$display("%b",overflow);
	//a - b
	a = 32'b00000000000000000000000000000000;
	b = 32'b00000000000000000000000000000001;
	unsig = 2'b0;
	op=3'b110;
	#10
	$display("%b",aluout);
	$display("%b",overflow);
	$finish;
	end
endmodule
