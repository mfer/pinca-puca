/* sudolshw@gmail.com */

module Mips_tb();

    wire [17:0] addr;
    wire [15:0] data;
    wire wre;
    wire oute;
    wire hb_mask;
    wire lb_mask;
    wire chip_en;

    reg clock, reset;
    parameter begin_time = 0;
    parameter clock_time = 10;
    parameter reset_time = 20;
    parameter load_data_into_ram_time = 40;
    parameter print_ram_time = 140;
    parameter print2_ram_time = 160;
    parameter finishtime = 400;
    parameter row = 128;
    parameter pos = 16;

    reg [pos-1:0] data_read [0:row-1];

    initial begin
        $dumpfile ("../vcd/Mips_tb.vcd");
        $dumpvars;
        clock <= 1'b1;
        reset <= 1'b0;
        forever begin
            #clock_time clock = ~clock;
        end
    end

    initial $readmemh("../tb/testall.hex", data_read);
    integer ram_counter=-1;
    reg addr_counter = 0;
    reg wre_control = 1'b0;
    reg hb_mask_control = 1'b0;
    reg chip_en_control = 1'b0;
    reg lb_mask_control = 1'b0;

    initial
        #finishtime $finish;

    always @(posedge clock or negedge reset )begin
        $display ("----------------------------------------------------------------");
        $display ("Time = %d Reset = %d",  $time, reset);

        case ($time)
            begin_time: reset <= 1'b0;
            reset_time:  begin
                $display ("reseting...");
                reset <= 1'b0;
            end
            load_data_into_ram_time:  begin
                $display ("loading...");

                wre_control = 1'b1;
                chip_en_control = 1'b1;

                repeat (row) begin
                    hb_mask_control = 1'b1;
                    lb_mask_control = 1'b0;
                    ram_counter = ram_counter + 1;
                    addr_counter = addr_counter + 1;
                    //$display ("first half");
                    //$display("%d:%h",ram_counter,data_read[ram_counter]);

                    hb_mask_control = 1'b0;
                    lb_mask_control = 1'b1;
                    ram_counter = ram_counter + 1;
                    addr_counter = addr_counter + 1;
                    //$display ("second half");
                    //$display("%d:%h",ram_counter,data_read[ram_counter]);
                end

                wre_control = 1'b0;
                chip_en_control = 1'b0;
            end
            print_ram_time:  begin
                chip_en_control = 1'b0;
            end
            print2_ram_time:  begin
                chip_en_control = 1'b0;
            end
        endcase
    end

    Ram RAM(
        .addr(addr),
        .data(data),
        .wre(wre_control),
        .oute(oute),
        .hb_mask(hb_mask_control),
        .lb_mask(lb_mask_control),
        .chip_en(chip_en_control)
    );

    Mips MIPS (
        .clock(clock),
        .reset(reset),
        .addr(addr),
        .data(data),
        .wre(wre),
        .oute(oute),
        .hb_mask(hb_mask),
        .lb_mask(lb_mask),
        .chip_en(chip_en)
    );

endmodule
