`include "Alu.v"

/*Teste operação de soma da Alu*/
module tb_Alu ();
	
	integer counter = 1'd0;
	
	/*---------------------------------------	Alu Regs	----------------------------*/
	reg 	[31:0] 	a,b;
	reg	[2:0]  	op; 
	reg		unsig;
	reg		clk;//clock para facilitar a criação dos testbenchs;
	reg	[32:0]	overflow_checker; /*checar overflow das operações unsigneds*/	
	
	/*--------------------------------------- 		Op	----------------------------*/
	
	//op=000 a&&b 
	//op=001 a||b 
	//op=010 a+b  ****teste
	//op=100 a nor b
	//op=101 a xor b
	//op=110 a-b

	/*---------------------------------------	Alu Wires	---------------------------*/
	wire 		compout, overflow;
	wire	[31:0]	aluout;
	
	
	/*-----	Parameters Declaration : initialt time 0, delay of 5 and finishes at 500  ---------*/
	 
	parameter initialtime = 0;
	parameter delay = 5;
	parameter finishtime = 355;
		
	

	initial begin
	
		$dumpfile ("aluadder.vcd");
		$dumpvars;
		
		
		
	  
		#initialtime
		clk 	<= 	1'b1;
		op  	<= 	3'b010;
		unsig 	<=	1'b1;	//signed operation
		
		/*   -------------------------------------------------------TESTES----------------------------------------------
	
		Adder: Total de 35 testes.
		
		teste 1 a 5:
		
		signed sem overflow.
		
		teste 6 a 10
		
		signed com overflow (a >=0, b >= 0 e aluout < 0);
		
		teste 10 a 15:
		
		signed com overflow ( a < 0, b < 0 e aluout >=0 );
		
		teste 15 a 20:
		
		unsigned sem overflow
		
		teste 21 a 25 
		
		unsigned com overflow ( aluout < 0 bit 1 armazendo no 33 registrador de overflow_checker )
	
		teste 25 a 35
		
		teste randômico

	
		signed range: 2^31-1 = (2147483647)   a - (2^31) = (-2147483648).
		
		   $time 0 a 90 signed
		  $time 0 a 50 operações sem overflow
		  $time 60 a 100 operações com overflow a, b >=0 e aluout <0
		  $time 110 a 150  operações com overflow a, b <=0 e aluout > 0
		  
		  $time 160 a 250 unsigned
		  
		  $time 160 a 200 operações sem overflow
		  $time 200 a 250operações com overflow a, b >=0 e aluout <0
		  
		  $time 260 a 350 valores randômicos*/
		
		
		//signed sem overflow.
		#10

		 a = 32'b00110110101101001111000110100100;
		 b = 32'b00110011111010110111000101100101;
		
		
		#10	
		a = 32'b11110111010111111111000111100111;
		b = 32'b00110101101111101111000111100111;

		
		#10
				
		 a = 32'b00110101111101101111000111100111;
		 b = 32'b11110101101110111011000111100111;
		
		#10
		a = 32'b10110011011111011111000111100111;
		b = 32'b10010101101111011111000111100111;

		#10
		a = 32'b10110101111111111111000111100111;
		b = 32'b00011000101111010001000111100111;
		
	 	//signed com overflow (a >=0, b >= 0 e aluout < 0);
	 	#10
		a = 32'b01111010111101110111100110000101;
		b = 32'b01111011101110111101100001100101;

		
		#10
		
		a = 32'b01111010101110101011000010000101;
		b = 32'b01111011001101111011001101100101;

		
		#10
		a = 32'b01111010101010101011000101100001;
		b = 32'b01111100001101011011011001100101;
		
		#10
		a = 32'b01111010001001000010110101100001;
		b = 32'b01110101001101011011011011100101;
		
		#10
		
		a = 32'b01111100101010000010111100101101;
		b = 32'b01101010001110101101101100010110;
		
		//signed com overflow ( a < 0, b < 0 e aluout >=0 );
		#10
		a = 32'b10111111111111111111111111111111;//overflow mais do que garantido //
		b = 32'b10111111111111111111111111111111;

		#10
		a = 32'b10110101011111100000001111110111;
		b = 32'b10110110101011011111100110010011;
		
		#10
		a = 32'b10110010111100101110111110101011;
		b = 32'b10010011001100110011000010001000;
		
		#10
		a = 32'b10101010111101110101100110010011;
		b = 32'b10111100110011101011110101011001;

		#10
		a = 32'b10101111011001100111101011011110;
		b = 32'b10111100101101011011011111101011;
		
		/*unsigned sem overflow*/
		
		#10
		a = 32'b11101111011001100111101011011110;
		b = 32'b00001100101101011011011111101011;

		#10
		a = 32'b01001010111101110101100110010011;
		b = 32'b10101100110011101011110101011001;

		#10
		a = 32'b00010010111100101110111110101011;
		b = 32'b11010011001100110011000010001000;

		#10
		a = 32'b10111011111001111001111111111111;
		b = 32'b00011011001111111111100111111111;
		
		#10
		a = 32'd0;/*somando zeros com uns*/
		b = 32'b01111111111111111111111111111111;
		
		/*overflow: a >= 0, b >= 0 e aluout < 0*/

		#10
		a = 32'b11100111010011100010111101111101;
		b = 32'b01011010010011011011001101111010;
		
		#10
		a = 32'b11100001011011100000000111111111;
		b = 32'b01110110101011011011100110011011;
		
		#10
		a = 32'b01110011010011100111011110010011;
		b = 32'b11010011001100110011000011000110;

		#10
		a = 32'b01101010111101110101100011001011;
		b = 32'b11111100110011101011111010101001;

		#10
		a = 32'b11101111011001100111110101101110;
		b = 32'b01111100101100101101101111110011;

	end

	initial 
		#finishtime $finish;
		
always begin

	#delay clk = ~clk;

end
	
	
	
always @(posedge clk) begin
		

		if ($time == 160)begin
		
			unsig = ~unsig;
			
		end
		
		if ($time > 260)begin
		
			unsig <= $random;
			a <= $random;
			b <= $random;
			
		end
  

	
		/* -------------------------------------------------------------Números sem sinais----------------------------------------------------------------*/
		if (unsig == 0 ) begin
	
			$display ("unsigned number");
		
				overflow_checker = a+b;/*vetor de 33 bits, verifica se houve overflow com os valores unsigneds*/
		
			if ($signed (overflow_checker) < 0 ) begin
		
				$display ("overflow_checker: %d we had overflow", overflow_checker);
			
			end
			
			else begin
			
				$display ("no overflow");
				
			end
		
			$display  ("time:%d,clk: %b,op: %b,a: %b, b: %b, aluout: %b, unsig: %b ,compout: %b, overflow: %b ",$time, clk,op, a, b, aluout,unsig, compout,overflow);/*soma e subtração, checando com binarios */
		
			$display  ("a: %d, b: %d, aluout: %d", a, b, aluout);/*soma e subtração, checando com decimais */
		
		end
		
		/* -------------------------------------------------------------Números com sinais----------------------------------------------------------------*/
		else begin
				
			$display ("signed number");
			
			if ( ($signed(a) >= 0 && $signed (b) >= 0 && $signed (aluout) < 0) ||  ( $signed(a) < 0  && $signed(b) < 0 && $signed(aluout) >= 0) ) begin
		
				$display ("we had overflow ");
		
			end
		
			else begin
			
				$display ("no overflow");
			
			end
			
			$display  ("time:%d,clk: %b,op: %b,a: %b, b: %b, aluout: %b, unsig: %b ,compout: %b, overflow: %b ",$time, clk,op,a, b, aluout,unsig, compout,overflow);/*soma e subtração, checando com binarios */
		
			$display  ("a: %d, b: %d, aluout: %d", $signed (a), $signed (b), $signed (aluout) );/*soma e subtração, checando com decimais */
			
		end
		
		$display ("************************-----------------------------***************************----------------------******************************");

end	
		Alu Al1 (.a(a), .b(b), .aluout(aluout), .op(op), .unsig(unsig), .compout(compout), .overflow(overflow));
	
				  
endmodule

