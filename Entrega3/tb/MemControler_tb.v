/* sudolshw@gmail.com */

module MemControler_tb();

	Ram dut(mc_ram_addr, mc_ram_data, mc_ram_wre, ~mc_ram_wre, zero, zero, zero);

	parameter finishtime=5;
	integer INB,INA, fromA, fromB, quantA, quantB, stepA, stepB;
	reg expected000,expected001,expected010,expected011,expected100,expected101,expectedDEF;
	reg [31:0] inA,inB;
	parameter op000 = 3'b000; //a==b

	wire mcout000;

	MemControler mc(clock, reset, if_mc_en, if_mc_addr, mc_if_data, mem_mc_rw, mem_mc_en, mem_mc_addr, mem_mc_data, mc_ram_addr, mc_ram_wre, mc_ram_data);

	initial begin
//		$monitor ("tempo = %d", $time);
	    if (! $value$plusargs("fromA=%d", fromA)) begin
	        $display("Informe +fromA=<valor>");
	        $finish;
	    end
	    if (! $value$plusargs("fromB=%d", fromB)) begin
	        $display("Informe +fromB=<valor>");
	        $finish;
	    end
	    if (! $value$plusargs("quantA=%d", quantA)) begin
	        $display("Informe +quantA=<valor>");
	        $finish;
	    end
	    if (! $value$plusargs("quantB=%d", quantB)) begin
	        $display("Informe +quantB=<valor>");
	        $finish;
	    end
	    if (! $value$plusargs("stepA=%d", stepA)) begin
	        $display("Informe +stepA=<valor>");
	        $finish;
	    end
	    if (! $value$plusargs("stepB=%d", stepB)) begin
	        $display("Informe +stepB=<valor>");
	        $finish;
	    end

		inA=fromA;
		inB=fromB;
		expected000=inA==inB;

	end
	initial begin
//		$dumpfile("vcd/Comparator.vcd");
//		$dumpvars;
		$display ("fromA= %d, fromB= %d",fromA, fromB);
		$display ("quantA= %d, quantB= %d",quantA, quantB);
		$display ("stepA= %d, stepB= %d",stepA, stepB);

		for(INA=1; INA<=quantA; INA=INA+1)begin
			#(`DELAY/5)
//			$display ("inA= %d, inB= %d",inA, inB);
			for(INB=1; INB<=quantB; INB=INB+1)begin
				#(`DELAY/5)

				expected000 = inA == inB;
				//$display ("compout000= %b, expected= %b",compout000,expected000);
				if (mcout000 != expected000) $display ("FAIL000: %b != %b",compout000,expected000);

				#`DELAY inB = inB + stepB;
			end
			#`DELAY inA = inA + stepA;
		end

		$display ("toA= %d, toB= %d",inA, inB);
		#finishtime
		$display ("Tempo Total - %d",$time);
		$finish;
	end

endmodule
