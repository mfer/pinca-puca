# sudolshw@gmail.com
init:
	mkdir -p bin vcd log

#--------------------------------------------------------------------------------#

Alu:
	iverilog src/Alu.v tb/tb_Alu.v -o bin/tb_Alu
	
#--------------------------------------------------------------------------------#
	
Shifter: init
	iverilog src/Shifter.v -o bin/Shifter

tb_Shifter: init
	iverilog src/Shifter.v tb/globals.vh tb/tb_Shifter.v -o bin/tb_Shifter

tb_Shifter_vvp: tb_Shifter
	vvp bin/tb_Shifter +from=2147483648 +quant=65536 +step=32768 > log/tb_Shifter
	vvp bin/tb_Shifter +from=0 +quant=65536 +step=32768 >> log/tb_Shifter

#se houverem erros eles serao expostos na tela. antes rodar: make tb_Shifter_vvp
tb_Shifter_check: 
	sh/./find.sh FAIL log/tb_Shifter

tb_Shifter_par: tb_Shifter
	sh/./tb_Shifter_par.sh bin/tb_Shifter log/tb_Shifter_par

#se houverem erros eles serao expostos na tela. antes rodar: make tb_Shifter_par
tb_Shifter_par_check:
	sh/./find.sh FAIL log/tb_Shifter_par

#--------------------------------------------------------------------------------#

Comparator:
	iverilog src/Comparator.v -o bin/Comparator

tb_Comparator: init
	iverilog src/Comparator.v tb/globals.vh tb/tb_Comparator.v -o bin/tb_Comparator

tb_Comparator_vvp: tb_Comparator
	vvp bin/tb_Comparator +fromA=2147483648 +quantA=1024 +stepA=2097152 +fromB=2147483648 +quantB=1024 +stepB=2097152 > log/tb_Comparator
	vvp bin/tb_Comparator +fromA=0 +quantA=1024 +stepA=2097152 +fromB=0 +quantB=1024 +stepB=2097152 >> log/tb_Comparator

#se houverem erros eles serao expostos na tela. antes rodar: make tb_Comparator_vvp
tb_Comparator_check: 
	sh/./find.sh FAIL log/tb_Comparator

tb_Comparator_par: tb_Comparator
	sh/./tb_Comparator_par.sh bin/tb_Comparator log/tb_Comparator_par

#se houverem erros eles serao expostos na tela. antes rodar: make tb_Comparator_par
tb_Comparator_par_check:
	sh/./find.sh FAIL log/tb_Comparator_par

#--------------------------------------------------------------------------------#

clean:
	rm -rf bin vcd log
