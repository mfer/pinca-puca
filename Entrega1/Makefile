all: Shifter Comparator

Shifter:
	iverilog src/Shifter.v tb/globals.vh tb/tb_Shifter.v -o bin/tb_Shifter
	#vvp bin/tb_Shifter +from=2147483648 +to=0 +step=16384 > log/Shifter_Seq
	#vvp bin/tb_Shifter +from=0 +to=2147483647 +step=262144 >> log/Shifter_Seq
	#grep 'FAIL' log/Shifter_Seq

Shifter-Par:
	iverilog src/Shifter.v tb/globals.vh tb/tb_Shifter.v -o bin/tb_Shifter-Par
	./vvp_Shifter-Par.sh

Comparator:
	iverilog src/Comparator.v tb/globals.vh  tb/tb_Comparator.v -o bin/Comparator
	vvp bin/Comparator

clean:
	rm -rf bin vcd log