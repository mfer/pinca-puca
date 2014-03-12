`include "Alu.v"

module tb_Alu ();
	
	
	/*Teste da operação and da alu*/
	/*---------------------------------------	Alu Regs	----------------------------*/
	reg 	[31:0] 	a,b;
	reg	[2:0]  	op; 
	reg		unsig;
	reg		clk;//clock para facilitar a criação dos testbenchs;
	
		
	/*--------------------------------------- 		Op	----------------------------*/
	
	//op=000 a&&b
	//op=001 a||b  ****teste
	//op=010 a+b
	//op=100 a nor b
	//op=101 a xor b
	//op=110 a-b

	/*---------------------------------------	Alu Wires	---------------------------*/
	wire 		compout, overflow;
	wire	[31:0]	aluout;
	
	
	/*-----	Parameters Declaration : initialt time 0, delay of 5 and finishes at 500  ---------*/
	 
	parameter initialtime = 0;
	parameter delay = 5;
	parameter finishtime = 350;
		
	

	initial begin
	
		$dumpfile ("aluor.vcd");
		$dumpvars; 	
		
	  //começa o teste com 0 + 0
	  
		#initialtime
		clk 	<= 	1'b1;
		op  	<= 	3'b001;		
	
	
	end

	initial 
		#finishtime $finish;
	always begin
 
		#delay clk = ~clk;

	end
	
	
	always @(posedge clk) begin
	
		
		a <=   $random;
		b <=   $random;
		
		
		$display  ("time: %d,clock: %b, op: %b \n,a: %b, b: %b,aluout:%b \n , compout: %b ",$time, clk,op, a, b, aluout, compout);
		
	end
			
		Alu Al1 (.a(a), .b(b), .aluout(aluout), .op(op), .unsig(unsig), .compout(compout), .overflow(overflow));
	
				  
endmodule

