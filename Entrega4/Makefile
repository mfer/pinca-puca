# sudolshw@gmail.com
init:
	mkdir -p bin vcd log

#--------------------------------------------------------------------------------#

Execute: init
	iverilog src/Execute.v -o bin/Execute ../Entrega1/src/Alu.v ../Entrega1/src/Shifter.v

tb_Execute: init
	iverilog src/Execute.v tb/Execute_tb.v -o bin/Execute_tb
	
#--------------------------------------------------------------------------------#

Decode: init
	iverilog src/Decode.v -o bin/Decode

tb_Decode: init
	iverilog src/Decode.v tb/Decode_tb.v tb/Ram.v -o bin/Decode_tb

tb_Decode_run: tb_Decode
	./bin/Decode_tb
	
#--------------------------------------------------------------------------------#
clean:
	rm -rf bin vcd log
