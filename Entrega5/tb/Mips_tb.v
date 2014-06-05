/* sudolshw@gmail.com */

module Mips_tb();
	reg			clk;
    reg         rst;
	reg [17:0] addr;
	wire [15:0] data;
	reg wre;
	reg oute;
	reg hb_mask;
	reg lb_mask;
	reg chip_en;

    parameter begin_time = 0;
    parameter clock_time = 10;
    parameter addr0_time = 20;
    parameter addr1_time = 40;
    parameter addr2_time = 60;
    parameter finish_time = 400;

    parameter NMEM = 68;   // 262144
    parameter IM_DATA = "../tb/testall.hex";
    initial begin
        $readmemh(IM_DATA, RAM.memory, 0, NMEM);
    end

	initial begin
		$dumpfile("../vcd/Mips_tb.vcd");
		$dumpvars(0, Mips_tb);
        clk <= 1'b1;
        rst <= 1'b0;
        forever begin
            #clock_time clk = ~clk;
        end
	end

    initial
        #finish_time $finish;

    always @(posedge clk or negedge rst )begin
        $display ("----------------------------------------------------------------");
        $display ("Time = %d Reset = %d",  $time, rst);

        case ($time)
            begin_time:  begin
                $display ("reseting...");
                rst <= 1'b0;
            end
            addr0_time:  begin
                $display ("addr...");
                addr <= 18'h00000;
            end
            addr1_time:  begin
                $display ("addr1...");
                $display ("%h",addr);
                rst <= 1'b0;
            end
            addr2_time:  begin
                $display ("addr2... MIPS.addr");
                //$display ("%h:%h",MIPS.addr,MIPS.data[]);
                rst <= 1'b0;
            end
        endcase
    end

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
        .addr(RAM.addr),
        .data(RAM.data),
        .wre(RAM.wre),
        .oute(RAM.oute),
        .hb_mask(RAM.hb_mask),
        .lb_mask(RAM.lb_mask),
        .chip_en(RAM.chip_en)
    );
endmodule
