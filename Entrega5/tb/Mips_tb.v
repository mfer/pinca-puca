/* sudolshw@gmail.com */

module Mips_tb();

	parameter N = 35;
	integer i = 0;
	reg			clk;

	wire [17:0] addr;
	wire [15:0]	data;
	wire wre;
	wire oute;
	wire hb_mask;
	wire lb_mask;
	wire chip_en;

    /*
     * Given a 32-bit address the data is latched and driven
     * on the rising edge of the clock.
     *
     * Currently it supports 7 address bits resulting in
     * 128 bytes of memory.  The lowest two bits are assumed
     * to be byte indexes and ignored.  Bits 8 down to 2
     * are used to construct the address.
     *
     * The memory is initialized using the Verilog $readmemh
     * (read memory in hex format, ascii) operation. 
     * The file to read from can be configured using .IM_DATA
     * parameter and it defaults to "../tb/testall.hex".
     * The number of memory records can be specified using the
     * .NMEM parameter.  This should be the same as the number
     * of lines in the file (wc -l ../tb/testall.hex).
     *  
     */
	parameter NMEM = 68;   // Number of memory entries, not the same as the memory size
	parameter IM_DATA = "../tb/testall.hex";  // file to read data from
	initial begin
		$readmemh(IM_DATA, RAM.memory, 0, NMEM);
	end

    reg [17:0] addr_aux;
    assign RAM.addr = addr_aux;

    Ram RAM(
        .addr(addr),
        .data(data),
        .wre(wre),
        .oute(oute),
        .hb_mask(hb_mask),
        .lb_mask(lb_mask),
        .chip_en(chip_en)
    );

    Mips MIPS (
        .clock(clk),
        .reset(reset),
        .addr(addr),
        .data(data),
        .wre(wre),
        .oute(oute),
        .hb_mask(hb_mask),
        .lb_mask(lb_mask),
        .chip_en(chip_en)
    );

	always begin
		clk <= ~clk;
		#5;
	end

	initial begin
		$dumpfile("../vcd/Mips_tb.vcd");
		$dumpvars(0, Mips_tb);

		addr_aux <= 18'b0;
		clk <= 1'b0;
		#5;

		$display("addr, data, wre, oute, hb_mask, lb_mask, chip_en");
		$monitor("%x, %x, %x, %x, %x, %x, %x, %x",
					RAM.addr, data, wre, oute,
					hb_mask, lb_mask, chip_en);
		for (i = 0; i < N + 5; i = i + 1) begin
			@(posedge clk);
		end

		for (i = 0; i < NMEM; i = i + 1) begin
            $display("%d:%h-%b",i,RAM.memory[i],addr_aux);
		end

		$finish;
	end

endmodule
