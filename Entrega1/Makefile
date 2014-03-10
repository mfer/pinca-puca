all: Shifter-Seq Comparator

Shifter-Seq:
	iverilog src/Shifter.v tb/globals.vh tb/tb_Shifter.v -o bin/Shifter
	vvp bin/Shifter +from=2147483648 +to=0 > log/Shifter_Seq
	vvp bin/Shifter +from=0 +to=2147483647 >> log/Shifter_Seq 

Shifter-Par:
	iverilog src/Shifter.v tb/globals.vh tb/tb_Shifter.v -o bin/Shifter
	./vvp_Shifter.sh

Comparator:
	iverilog src/Comparator.v tb/globals.vh  tb/tb_Comparator.v -o bin/Comparator
	vvp bin/Comparator

clean:
	rm -rf bin vcd log