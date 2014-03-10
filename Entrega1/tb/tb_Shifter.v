module tb_Shifter;
	parameter finishtime=5;
	integer AMT,IN, from, to;
	reg [31:0] expected00,expected01,expected10;

	reg [31:0] in;
	reg [1:0] shiftop;
	reg [4:0] shiftamt;
	wire [31:0] result00,result01,result10;

	Shifter s00(in,2'b00,shiftamt,result00);
	Shifter s01(in,2'b01,shiftamt,result01);
	Shifter s10(in,2'b10,shiftamt,result10);
	//shiftop = 00 shift lógico para direita
	//shiftop = 01 shift aritmético para direita
	//shiftop = 10 shift lógico para esquerda

	initial begin // initialize all variables
//		$monitor ("time = %d", $time);
	    if (! $value$plusargs("from=%d", from)) begin
	        $display("ERROR: please specify +from=<value> to start.");
	        $finish;
	    end

	    if (! $value$plusargs("to=%d", to)) begin
	        $display("ERROR: please specify +to=<value> to start.");
	        $finish;
	    end
		in=from;
		expected00=in;
		expected01=in;
		expected10=in;
	    shiftamt=4'b0000;
	end

	initial begin
//		$dumpfile("vcd/Shifter.vcd");
//		$dumpvars;

		$display ("from= %d",from);
		$display ("to= %d",to);
		for(IN=from; IN<=to; IN=IN+1)begin
			#(`DELAY/5)
			if (in % 65536 == 0) $display ("in= %b", in);
			for(AMT=0; AMT<16; AMT=AMT+1)begin
				#(`DELAY/5)
//				$display ("shiftamt= %b",shiftamt);

				expected00 = in >> shiftamt;
//				$display ("result00=%b,expected00=%b",result00,expected00);
				if (result00 != expected00) $display ("FAIL00: %b != %b",result00,expected00);

				expected01 = in >>> shiftamt;
//				$display ("result01=%b,expected01=%b",result01,expected01);
				if (result01 != expected01) $display ("FAIL01: %b != %b",result01,expected01);

				expected10 = in << shiftamt;
//				$display ("result10=%b,expected10=%b",result10,expected10);
				if (result10 != expected10) $display ("FAIL10: %b != %b",result10,expected10);

				#`DELAY shiftamt = shiftamt + 1;
			end
			#`DELAY in = in + 1;
		end

		#finishtime
		$display ("Tempo Total - %d",$time);
		$finish;
	end
endmodule