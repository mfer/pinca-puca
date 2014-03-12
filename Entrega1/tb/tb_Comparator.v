/* sudolshw@gmail.com */

module tb_Comparator;
	parameter finishtime=5;
	integer INB,INA, fromA, fromB, stepA, stepB;
	reg expected000,expected001,expected010,expected011,expected100,expected101,expectedDEF;
	reg [31:0] inA,inB;
	parameter op000 = 3'b000; //a==b
	parameter op001 = 3'b001; //a>=b
	parameter op010 = 3'b010; //a<=b
	parameter op011 = 3'b011; //a>b
	parameter op100 = 3'b100; //a<b
	parameter op101 = 3'b101; //a!=b
	parameter opDEF = 3'bxxx; //1'b0    1'bxxx é a forma de dizer que é descohecido

	wire compout000,compout001,compout010,compout011,compout100,compout101,compoutDEF;

	Comparator c000(inA,inB,op000,compout000);
	Comparator c001(inA,inB,op001,compout001);
	Comparator c010(inA,inB,op010,compout010);
	Comparator c011(inA,inB,op011,compout011);
	Comparator c100(inA,inB,op100,compout100);
	Comparator c101(inA,inB,op101,compout101);
	Comparator cDEF(inA,inB,opDEF,compoutDEF);

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
	    if (! $value$plusargs("stepA=%d", stepA)) begin
	        $display("Informe +stepA=<valor>");
	        $finish;
	    end
	    if (! $value$plusargs("stepB=%d", stepB)) begin
	        $display("Informe +stepB=<valor>");
	        $finish;
	    end

		inA=fromA;
		inB=fromA;
		expected000=inA==inB;
		expected001=inA>=inB;
		expected010=inA<=inB;
		expected011=inA>inB;
		expected100=inA<inB;
		expected101=inA!=inB;
		expectedDEF=1'b0;

	end
	initial begin
//		$dumpfile("vcd/Comparator.vcd");
//		$dumpvars;
		$display ("fromA= %d, fromB= %d",fromA, fromB);
		$display ("stepA= %d",stepA);
		$display ("stepB= %d",stepB);

		for(INA=1; INA<=stepA*stepA; INA=INA+1)begin
			#(`DELAY/5)
//			$display ("inA= %d, inB= %d",inA, inB);
			for(INB=1; INB<stepB*stepB; INB=INB+1)begin
				#(`DELAY/5)

				expected000 = inA == inB;
				//$display ("compout000= %b, expected= %b",compout000,expected000);
				if (compout000 != expected000) $display ("FAIL000: %b != %b",compout000,expected000);

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