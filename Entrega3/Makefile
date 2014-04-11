# sudolshw@gmail.com
init:
	mkdir -p bin vcd log

#--------------------------------------------------------------------------------#

Fetch: init
	iverilog src/Fetch.v -o bin/Fetch

tb_Fetch: init
	iverilog src/Fetch.v tb/Fetch_tb.v -o bin/Fetch_tb
	
#--------------------------------------------------------------------------------#

MemControler: init
	iverilog src/MemControler.v -o bin/MemControler

tb_MemControler: init
	iverilog src/MemControler.v tb/MemControler_tb.v tb/Ram.v -o bin/MemControler_tb
	
#--------------------------------------------------------------------------------#
clean:
	rm -rf bin vcd log
