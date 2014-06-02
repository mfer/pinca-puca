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


	reg  [31:0] pc;
	initial begin
		pc <= 32'd0;
	end
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
	parameter NMEM = 34;   // Number of memory entries, not the same as the memory size
	parameter IM_DATA = "../tb/testall.hex";  // file to read data from
	reg [31:0] mem [0:NMEM];  // 32-bit memory with NMEM entries
	initial begin
		$readmemh(IM_DATA, mem, 0, NMEM-1);
	end
	assign data = mem[pc[8:2]][31:0];

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

		clk <= 1'b0;

		$display("addr, data, wre, oute, hb_mask, lb_mask, chip_en");
		$monitor("%x, %x, %x, %x, %x, %x, %x",
					addr, data, wre, oute,
					hb_mask, lb_mask, chip_en);
		for (i = 0; i < N + 5; i = i + 1) begin
			@(posedge clk);
		end

		for (i = 0; i < NMEM; i = i + 1) begin
            $display("%d:%h",i,mem[i]);
		end

		$finish;
	end

endmodule
