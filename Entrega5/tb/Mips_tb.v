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
    parameter ram_time = 40;
    parameter finishtime = 300;
    parameter row = 8;
    parameter pos = 16;

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

    initial $readmemh("../data/vectors.txt", data_read);
    integer i,j, cont;

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
            ram_time:  begin
                $display ("ram time...");
                cont = 0;
                for (i=0; i < row; i=i+1) begin
                    $display("%d:%h",i,data_read[i]);
                    //data_read[i]<= data[cont];

                end
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
