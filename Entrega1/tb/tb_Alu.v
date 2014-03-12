/*Teste operação de soma da Alu*/
module tb_Alu ();
	
	/*---------------------------------------	Alu Regs	----------------------------*/
	
	reg 	[31:0] 	a,b;
	reg	[2:0]  	op [5:0] ;
	reg		unsig;
	reg		clk;//clock para facilitar a criação dos testbenchs;
	reg	[32:0]	overflow_checker[1:0]; /*checar overflow das operações unsigneds*/	
	
	
	
	/*--------------------------------------- 		Op	----------------------------*/
	
	//op=000 a&&b 
	//op=001 a||b 
	//op=010 a+b  ****teste
	//op=100 a nor b
	//op=101 a xor b
	//op=110 a-b

	/*---------------------------------------	Alu Wires	---------------------------*/
	wire 		compout;
	wire	[5:0]	overflow;
	wire	[31:0]	aluout	[5:0];
	
	/*-----	Parameters Declaration : initialt time 0, delay of 5 and finishes at 500  ---------*/
	 
	parameter initialtime = 0;
	parameter delay = 5;
	parameter finishtime = 200;
		
	

	initial begin
	
		$dumpfile ("alu.vcd");
		$dumpvars;

		#initialtime
		clk 	<= 	1'b1;
		unsig 	<=	1'b1;	//signed operation
		op[0]	=	3'b000;
		op[1]	=	3'b001;
		op[2] 	=	3'b010;
		op[3]	=	3'b100;
		op[4]	=	3'b101;
		op[5] 	= 	3'b110;	
		
	end	
initial 
		#finishtime $finish;
		
always begin

	#delay clk = ~clk;

end
/*-------------------------------------------------------------------------setting variables-----------------------------------------------------------*/
always @(posedge clk) begin

	b <= $random;
	a <= $random;/*adder*/
	unsig <= ~unsig;
	
	$display ("time:%d,clk: %b, unsig: %b ,compout: %b", $time, clk, unsig, compout);
	
	if (unsig == 1) begin
	
		$display ("Input A: %b(%d), Input B: %b(%d) ", a,$signed(a),b,$signed(b));
	
	end
	
	else begin
	
		$display ("Input A: %b(%d), Input B: %b(%d) ", a,a,b,b);
	
	end


/*   --------------------------------------------------------------------- And--------------------------------------------------------------------------*/	

	
		$display ("And: %b ", op[0]);
			
		$display  ("aluout_and: %b",aluout[0]);/*soma e subtração, checando com binarios */



/*   --------------------------------------------------------------------- Or--------------------------------------------------------------------------*/	

	
		$display ("Or: %b ",op[1]);
	
		$display  ("aluout_or: %b",aluout[1]);/*soma e subtração, checando com binarios */

	

/*   --------------------------------------------------------------------- ADDER --------------------------------------------------------------------------*/	

		
		$display ("Adder: %b",op[2]);
		/* -------------------------------------------------------------Números sem sinais----------------------------------------------------------------*/
		if (unsig == 0 ) begin

		
				overflow_checker[0] = a+b;/*vetor de 33 bits, verifica se houve overflow com os valores unsigneds*/
		
			if ($signed (overflow_checker[0]) < 0 ) begin
		
				$display ("overflow_checker: %d we had overflow", overflow_checker[0]);
			
			end
			
			else begin
			
				$display ("no overflow");
				
			end
		
			$display  ("aluout_adder_unsigned: %b(%d),  overflow: %b ", aluout[2],aluout[2] ,overflow[2]);

		end
		
		/* -------------------------------------------------------------Números com sinais----------------------------------------------------------------*/
		else begin
	
			if ( ($signed(a) >= 0 && $signed (b) >= 0 && $signed (aluout[2]) < 0) ||  ( $signed(a) < 0  && $signed(b) < 0 && $signed(aluout[2]) >= 0) ) begin
		
				$display ("we had overflow ");
		
			end
		
			else begin
			
				$display ("no overflow");
			
			end
			
			$display  ("aluout_adder_signed: %b(%d), overflow: %b ", $signed(aluout[2]), $signed(aluout[2]),overflow[2]);/*soma e subtração, checando com binarios */
		
		end

	

/*   --------------------------------------------------------------------- Nor--------------------------------------------------------------------------*/	

	
		$display ("Nor: %b",op[3]);
	
		$display  (" aluout_nor: %b", aluout[3] );/*soma e subtração, checando com binarios */

	

/*   --------------------------------------------------------------------- Xor--------------------------------------------------------------------------*/

	
		$display ("Xor: %b ",op[4]);
	
		$display  (" aluout_xor: %b",aluout[4] );/*soma e subtração, checando com binarios */



/*   --------------------------------------------------------------------- Sub--------------------------------------------------------------------------*/

	
		$display ("Sub: %b",op[5]);
	/* -------------------------------------------------------------Números sem sinais----------------------------------------------------------------*/
		if (unsig == 0 ) begin

			overflow_checker[1] = a-b;/*vetor de 33 bits, verifica se houve overflow com os valores unsigneds*/
		
			if ($signed (overflow_checker[1]) < 0 ) begin
		
				$display ("overflow_checker: %d we had overflow", $signed(overflow_checker[1]) );
			
			end
			
			else begin
			
				$display ("no overflow");
				
			end
		
			$display  ("aluout_sub_unsigned: %b(%d), overflow: %b ",aluout[5],aluout[5] ,overflow[5]);/*soma e subtração, checando com binarios */
		
		end
		
		/* -------------------------------------------------------------Números com sinais----------------------------------------------------------------*/
		else begin
				
			$display ("signed number");
			
			if ( ($signed(a) >= 0 && $signed (b) < 0 && $signed (aluout[5]) < 0) ||  ( $signed(a) < 0  && $signed(b) >= 0 && $signed(aluout[5]) >= 0) ) begin
		
				$display ("we had overflow");
		
			end
		
			else begin
			
				$display ("no overflow");
			
			end
			
			$display  ("aluout_sub_signed: %b(%d), overflow: %b ", $signed(aluout[5]), $signed(aluout[5]), overflow[5]);/*soma e subtração, checando com binarios */		
			
		end
		
		$display ("----------------------------------------------*************Next Numbers*************------------------------------------------------");
		

end	

		Alu A_N_D (.a(a), .b(b), .aluout(aluout[0]), .op(op[0]), .unsig(unsig), .compout(compout), .overflow(overflow[0]));
		Alu O_R (.a(a), .b(b), .aluout(aluout[1]), .op(op[1]), .unsig(unsig), .compout(compout), .overflow(overflow[1]));
		Alu A_D_D (.a(a), .b(b), .aluout(aluout[2]), .op(op[2]), .unsig(unsig), .compout(compout), .overflow(overflow[2]));
		Alu N_O_R (.a(a), .b(b), .aluout(aluout[3]), .op(op[3]), .unsig(unsig), .compout(compout), .overflow(overflow[3]));
		Alu X_O_R (.a(a), .b(b), .aluout(aluout[4]), .op(op[4]), .unsig(unsig), .compout(compout), .overflow(overflow[4]));
		Alu S_U_B (.a(a), .b(b), .aluout(aluout[5]), .op(op[5]), .unsig(unsig), .compout(compout), .overflow(overflow[5]));
endmodule

