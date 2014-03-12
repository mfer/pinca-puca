# sudolshw@gmail.com

all: init tb_Shifter_check

#--------------------------------------------------------------------------------#

init:
	mkdir -p bin vcd log

#--------------------------------------------------------------------------------#

Shifter: init
	iverilog src/Shifter.v -o bin/Shifter

tb_Shifter: init
	iverilog src/Shifter.v tb/globals.vh tb/tb_Shifter.v -o bin/tb_Shifter

tb_Shifter_vvp: tb_Shifter
	vvp bin/tb_Shifter +from=2147483648 +quant=16384 +step=16384 > log/tb_Shifter
	vvp bin/tb_Shifter +from=0 +quant=16384 +step=16384 >> log/tb_Shifter

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
	vvp bin/tb_Comparator +fromA=2147483648 +stepA=16384 +fromB=2147483648 +stepB=16384 > log/tb_Comparator
	vvp bin/tb_Comparator +fromA=0 +stepA=16384 +fromB=0 +stepB=16384 >> log/tb_Comparator

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