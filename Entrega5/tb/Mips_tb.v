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
    parameter first_instruction_time = 40;
    parameter secon_instruction_time = 80;
    parameter third_instruction_time = 120;
    parameter fourt_instruction_time = 160;
    parameter fifth_instruction_time = 200;
    parameter sixth_instruction_time = 240;
    parameter seven_instruction_time = 280;
    parameter eight_instruction_time = 320;
    parameter finishtime = 400;
    parameter row = 8;
    parameter pos = 32;

    reg [pos-1:0] data_read [0:row-1];

    initial begin
        $dumpfile ("../vcd/Mips.vcd");
        $dumpvars;
        clock <= 1'b1;
        reset <= 1'b0;
        forever begin
            #clock_time clock = ~clock;
        end
    end

    initial $readmemh("../tb/testall.hex", data_read);
    integer instruction;
    reg addr_counter = 32'h00400000;
//TODO    wre = 1'b1;

    initial
        #finishtime $finish;

    always @(posedge clock or negedge reset )begin
        $display ("----------------------------------------------------------------");
        $display ("Time = %d Reset = %d",  $time, reset);

        data_read[instruction] <= data;
        addr_counter <= addr;

        case ($time)
            begin_time: reset <= 1'b0;
            reset_time:  begin
                $display ("reseting...");
                reset <= 1'b0;
            end
            first_instruction_time:  begin
                $display ("from the very first time...");
                instruction = 0;
                $display("%d:%h",instruction,data_read[instruction]);
            end
            secon_instruction_time:  begin
                $display ("second instruction...");
                instruction = instruction + 1;
                addr_counter = addr_counter + 32'h00000004;
                $display("%d:%h",instruction,data_read[instruction]);
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
