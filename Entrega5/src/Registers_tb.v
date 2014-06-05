module Registers_tb(); 
	//--------------Entradas-----------------
    reg clock;
    reg reset;
    reg enc;
    reg [4:0] addra;
    reg [4:0] addrb;
    reg [4:0] addrc;
    reg [31:0] datac;
    //-------------------------------------
    
    //------------Saídas-------------------
    wire [31:0] dataa;
    wire [31:0] ass_dataa;
    wire [31:0] datab;
    wire [31:0] ass_datab;
    
    //-------------------------------------
    
    //------------------------------------
    Registers dut(clock,
		  reset,
		  addra,
		  dataa,
		  ass_dataa,
		  addrb,
		  datab,
		  ass_datab,
		  enc,
		  addrc,
		  datac);
	parameter delay=10;
	integer i;
	//-------------------------------------
  
	initial begin
		$dumpfile ("Registers.vcd");
		$dumpvars;
		clock=0;
		
		addra=1;
		addrb=1;
		//Testando se o Reset funciona
		reset=1;
		#delay;
		$display("Teste do Reset\n");
		for(i=0; i<32; i=i+1)begin
			addra=i;
			addrb=i;
			$display("Oi Registrador Ass A: %b\nRegistrador Ass B: %b\nEndereço: %d\n",ass_dataa,ass_datab,i);
			$display("Oi Registrador A: %b\nRegistrador B: %b\nEndereço: %d\n",dataa,datab,i);
			#delay;
			
			//Subindo o clock
			clock=~clock;
			
			#delay;
			//Descendo o clock para entrar no for novamente
			clock=~clock;
			
			$display("\n\nRegistrador A: %b\nRegistrador B: %b\nEndereço: %d\n",dataa,datab,);
			$display("Registrador Ass A: %b\nRegistrador Ass B: %b\nEndereço: %d\n",ass_dataa,ass_datab);
		end
		
		reset=0;
		
		//Testando se escreve com enc=0
		enc=0;
		#delay;
		$display("Teste se escreve com enc=0\n");
		for(i=0; i<32; i=i+1)begin
			addrc=i;
			addra=i;
			datac=$random;
			#delay;
			
			//Subindo o clock
			clock=~clock;
			
			#delay;
			//Descendo o clock para entrar no for novamente
			clock=~clock;
			
			$display("Foi pedido para escrever: %d no enrereço: %d e o que tem e: %d\n",datac,i,dataa);
		end
		
		//Testando se escreve com enc=1
		enc=1;
		#delay;
		$display("Teste se escreve com enc=1\n");
		for(i=0; i<32; i=i+1)begin
			addrc=i;
			#delay;
			datac=$random;
			#delay;
			$display("Registrador Ass A: %b\nRegistrador Ass B: %b\nEndereço: %d\n",ass_dataa,ass_datab,i);
			//Subindo o clock
			clock=~clock;
			#delay;
			//Descendo o clock para entrar no for novamente
			clock=~clock;
			
			addra=i;
			//Subindo o clock
			clock=~clock;
			#delay;
			//Descendo o clock para entrar no for novamente
			clock=~clock;
			$display("Foi pedido para escrever: %d no enrereço: %d e o que tem e: %d\n",datac,i,dataa);
		end
		
		$display("Testando se ass_dataa e ass_datab sao assincronos\n");
		addrc = 9;
		#5;
		datac=99;
		clock=~clock;
		clock=~clock;
		#5;
		addra = 9;
		
		#5;
		$display("ass_dataa: %d ass_datab: %d Endereço: %d\n",ass_dataa,datac,addrc);
		$finish;
    end
endmodule