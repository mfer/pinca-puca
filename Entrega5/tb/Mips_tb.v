/* sudolshw@gmail.com */

module Mips_tb();
	reg			clk;
    reg         rst;
	wire [17:0] addr;
	wire [15:0] data;
	wire wre;
	wire oute;
	wire hb_mask;
	wire lb_mask;
	wire chip_en;

    parameter clock_time = 10;
    parameter finish_time = 100;
    parameter NMEM = 68;   // 262144
    parameter IM_DATA = "../tb/testall.hex";
    integer i;

	initial begin
        $readmemh(IM_DATA, RAM.memory, 0, NMEM);
    	$dumpfile("../vcd/Mips_tb.vcd");
		$dumpvars(0, Mips_tb);
        for (i=0; i<NMEM;i=i+1) begin
    		$dumpvars(0, Mips_tb.RAM.memory[i]);
        end

        clk <= 1'b1;
        rst <= 1'b0;
        #10

        rst <= 1'b1;
        forever begin
            #clock_time clk = ~clk;
        end
        $monitor ("addr %h, data %h, MIPS.addr %h, wre %h, oute %h, hb_mask %h, lb_mask %h, chip_en %h",
                   addr,    data,    MIPS.addr,    wre,    oute,    hb_mask,    lb_mask,    chip_en);
	end

    initial
        #finish_time $finish;

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
        .reset(rst),
        .addr(addr),
        .data(data),
        .wre(wre),
        .oute(oute),
        .hb_mask(hb_mask),
        .lb_mask(lb_mask),
        .chip_en(chip_en)
    );
endmodule
