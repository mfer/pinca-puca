# sudolshw@gmail.com
init:
	mkdir -p ../bin ../vcd ../log

#--------------------------------------------------------------------------------#

Mips: init
	iverilog Mips.v -o ../bin/Mips

tb_Mips: init
	iverilog Mips.v ../tb/Mips_tb.v -o ../bin/Mips_tb
	
tb_Mips_run: tb_Mips
	../bin/Mips_tb
	
#--------------------------------------------------------------------------------#
clean:
	rm -rf ../bin ../vcd ../log
