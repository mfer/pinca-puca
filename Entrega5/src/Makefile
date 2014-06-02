# sudolshw@gmail.com
init:
	mkdir -p ../bin ../vcd ../log

#--------------------------------------------------------------------------------#

Mips: init
	iverilog Mips.v -o ../bin/Mips

tb_Mips: init
	iverilog Mips.v ../tb/Mips_tb.v ../tb/im.v -o ../bin/tb_Mips
	
tb_Mips_run: tb_Mips
	../bin/tb_Mips

tb_Mips_vvp: tb_Mips
	vvp ../bin/tb_Mips > ../log/tb_Mips
	
#--------------------------------------------------------------------------------#
clean:
	rm -rf ../bin ../vcd ../log
