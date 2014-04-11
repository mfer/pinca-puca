/* sudolshw@gmail.com */

module MemControler_tb();
    reg clock, reset, if_mc_en; //input -> reg
    reg [17:0] if_mc_addr;
    wire [31:0] mc_if_data; //output -> wire
    reg mem_mc_rw, mem_mc_en;
    reg [17:0] mem_mc_addr;
    inout [31:0] mem_mc_data; //inout -> ?
    wire [17:0] mc_ram_addr;
    wire mc_ram_wre;
    inout [15:0] mc_ram_data;

	parameter begin_time = 0;
	parameter clock_time = 10;
	parameter write_time_case1 = 100; //!mem_mc_en & if_mc_en
	parameter write_time_case2 = 200; //!mem_mc_rw
	parameter finishtime = 600;//reset 5 ciclos

	initial begin
		$dumpfile ("MemControler.vcd");
		$dumpvars;
		clock <= 1'b1;
		reset <= 1'b0; 
		forever begin
			#clock_time clock = ~clock;
		end
	end

	initial
		#finishtime $finish;

    always @(posedge clock or negedge reset )begin
        $display ("----------------------------------------------------------------");
		case ($time) 
			begin_time: reset <= 0'b0;
			write_time_case1: begin //!mem_mc_en & if_mc_en
                $display ("write_time_case1");
                mem_mc_en <= 0'b0;
                if_mc_en <= 1'b0;
            end
            write_time_case2: begin //!mem_mc_rw
                $display ("write_time_case2");
                mem_mc_rw <= 0'b0;
            end
			1: begin
				reset <= 1'b1;
		    end
		endcase		
		$display ("Time = %d Reset = %d mc_if_data = %d",  $time, reset, mc_if_data);
		$display ("if_mc_en = %d if_mc_addr = %d", if_mc_en, if_mc_addr); 
		$display ("mem_mc_rw = %d mem_mc_en = %d",mem_mc_rw, mem_mc_en);
		$display ("mem_mc_addr = %d mem_mc_data = %d",mem_mc_addr, mem_mc_data);
		$display ("mc_ram_addr = %d mc_ram_wre = %d mc_ram_data = %d", mc_ram_addr, mc_ram_wre, mc_ram_data);
	end

	MemControler dut (.clock(clock), .reset(reset), 
            .if_mc_en(if_mc_en), .if_mc_addr(if_mc_addr), .mc_if_data(mc_if_data), 
            .mem_mc_rw(mem_mc_rw), .mem_mc_en(mem_mc_en), .mem_mc_addr(mem_mc_addr), .mem_mc_data(mem_mc_data), 
            .mc_ram_addr(mc_ram_addr), .mc_ram_wre(mc_ram_wre), .mc_ram_data(mc_ram_data));

endmodule
