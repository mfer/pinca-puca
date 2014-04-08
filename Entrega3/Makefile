# sudolshw@gmail.com
init:
	mkdir -p bin vcd log

#--------------------------------------------------------------------------------#

Control: init
	iverilog src/Control.v -o bin/Control

tb_Control: init
	iverilog src/Control.v tb/tb_Control_dev.v -o bin/tb_Control_dev
	
#--------------------------------------------------------------------------------#

clean:
	rm -rf bin vcd log
