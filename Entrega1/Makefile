all: Shifter Comparator

Shifter:
	iverilog src/Shifter.v tb/globals.vh tb/tb_Shifter.v -o bin/Shifter
	./vvp_Shifter.sh

Comparator:
	iverilog src/Comparator.v tb/globals.vh  tb/tb_Comparator.v -o bin/Comparator
	vvp bin/Comparator

clean:
	rm -rf bin vcd log