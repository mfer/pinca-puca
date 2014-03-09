all: Shifter

Shifter:
	iverilog src/Shifter.v tb/tb_Shifter.v -o bin/Shifter
	vvp bin/Shifter

clean:
	rm -rf bin
