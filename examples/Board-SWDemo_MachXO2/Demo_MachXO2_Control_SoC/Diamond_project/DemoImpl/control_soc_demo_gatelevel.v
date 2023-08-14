// Verilog netlist produced by program LST :  version Diamond_1.4_Production (65)
// Netlist written on Mon Oct 24 18:01:01 2011

//
// Verilog Description of module control_soc_demo
//

module control_soc_demo (xin, xout, rst_n, sw, led, uart_rx, uart_tx, 
            spi_sclk, spi_csn, spi_mosi, spi_miso, scl, sda, analog_cmp_n, 
            analog_cmp_p, analog_out, audio_pwm_out, clk, clk_pll, 
            lock_pll) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(46[8:24])
    input xin;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(48[11:14])
    output xout;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(49[11:15])
    input rst_n;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(51[17:22])
    input [3:0]sw;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(52[17:19])
    output [3:0]led;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(53[17:20])
    input uart_rx;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(55[17:24])
    output uart_tx;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(56[17:24])
    output spi_sclk;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(58[17:25])
    output spi_csn;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(59[17:24])
    output spi_mosi;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(60[17:25])
    input spi_miso;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(61[17:25])
    inout scl;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(63[17:20])
    inout sda;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(64[17:20])
    input analog_cmp_n;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(66[11:23])
    input analog_cmp_p;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(67[11:23])
    output analog_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(68[11:21])
    output audio_pwm_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(70[11:24])
    output clk /* synthesis syn_keep=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(71[11:14])
    output clk_pll;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(72[17:24])
    output lock_pll;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(73[17:25])
    
    wire rst;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(95[6:18])
    wire lm8_rst;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(96[6:13])
    wire lm8_rstn;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(97[6:25])
    wire wb_rst;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(98[6:12])
    wire [7:0]data_in;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(101[12:19])
    wire [23:0]addr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(102[19:23])
    wire [7:0]data_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(103[12:20])
    wire wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(104[6:8])
    wire rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(105[6:8])
    wire io_rdy;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(106[6:12])
    wire [19:0]wb_addr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(109[32:39])
    wire [7:0]wb_data_from_master;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(110[12:31])
    wire wb_cyc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(111[6:12])
    wire wb_sel;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(112[6:12])
    wire wb_we;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(113[6:11])
    wire [15:0]wb_ack;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(116[13:19])
    wire [15:0]wb_stb;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(117[13:19])
    wire [127:0]wb_dat_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(118[14:22])
    wire analog_cmp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(139[6:16])
    
    assign clk_pll = audio_pwm_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(72[17:24])
    assign lock_pll = audio_pwm_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(73[17:25])
    not (rst, rst_n) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(95[12:18])
    not (lm8_rstn, lm8_rst) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(97[17:25])
    ILVDS i0 (.A(analog_cmp_p), .AN(analog_cmp_n), .Z(analog_cmp));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(140[7:64])
    assign audio_pwm_out = 1'b0;
    bufif1 (scl, 1'bx, audio_pwm_out) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(162[9:12])
    bufif1 (sda, 1'bx, audio_pwm_out) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(163[9:12])
    not (xout, xin) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(171[16:20])
    OSCH OSCH_inst (.OSC(clk), .STDBY(audio_pwm_out));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(175[6:54])
    defparam OSCH_inst.NOM_FREQ = "2.08";
    reset_gen reset_gen_inst (.clk(clk), .rst_in(rst), .rst1_out(wb_rst), 
            .rst2_out(lm8_rst));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(238[11] 243[2])
    led_sw_wb led_sw_inst (.clk_i(clk), .rst_i(wb_rst), .dat_i({wb_data_from_master}), 
            .sw({audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            sw}), .stb_i(wb_stb[4]), .we_i(wb_we), .cyc_i(wb_cyc), .dat_o({wb_dat_i[39:32]}), 
            .led({Open_0, Open_1, Open_2, Open_3, led}), .ack_o(wb_ack[4]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(248[11] 259[2])
    \lm8_wb(LM8_ADDR_W=24,NUM_DECODE=4)  lm8_wb_inst (.clk_i(clk), .rst_i(wb_rst), 
            .wb_ack_i({audio_pwm_out, wb_ack[14], audio_pwm_out, audio_pwm_out, 
            wb_ack[11:10], audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, wb_ack[4], audio_pwm_out, 
            audio_pwm_out, wb_ack[1:0]}), .wb_dat_i({audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, wb_dat_i[119:112], audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, wb_dat_i[95:80], 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            wb_dat_i[39:32], audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, wb_dat_i[15:0]}), .wb_stb_o({Open_4, wb_stb[14], 
            Open_5, Open_6, wb_stb[11:10], Open_7, Open_8, Open_9, 
            Open_10, Open_11, wb_stb[4], Open_12, Open_13, wb_stb[1:0]}), 
            .wb_we_o(wb_we), .wb_sel_o(wb_sel), .wb_cyc_o(wb_cyc), .wb_dat_o({wb_data_from_master}), 
            .wb_adr_o({Open_14, Open_15, Open_16, Open_17, Open_18, 
            Open_19, Open_20, Open_21, Open_22, Open_23, wb_addr[9:0]}), 
            .lm8_addr({addr}), .lm8_ext_io_rd(rd), .lm8_ext_io_wr(wr), 
            .lm8_ext_io_din({data_in}), .lm8_ext_io_dout({data_out}), .lm8_io_ready(io_rdy));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(267[4] 284[2])
    \isp8(FAMILY_NAME="XO2",PROM_FILE="prom_init.hex",PORT_AW=8,EXT_AW=24,PROM_AW=10,PROM_AD=1024,REGISTERS_16=0,PGM_STACK_AW=4,PGM_STACK_AD=16)  lm8_inst (.clk(clk), 
            .rst_n(lm8_rstn), .ext_io_din({data_in}), .ext_io_ready(io_rdy), 
            .intr(audio_pwm_out), .ext_addr({addr}), .ext_io_dout({data_out}), 
            .ext_io_wr(wr), .ext_io_rd(rd));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(299[1] 311[2])
    \uart_core(CLK_IN_MHZ=24,BAUD_RATE=115200,ADDRWIDTH=3,DATAWIDTH=8,FIFO=0)  UART_INST (.RESET(wb_rst), 
            .CLK(clk), .UART_ADR_I({wb_addr[7:0]}), .UART_DAT_I({audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, audio_pwm_out, wb_data_from_master}), 
            .UART_DAT_O({Open_24, Open_25, Open_26, Open_27, Open_28, 
            Open_29, Open_30, Open_31, wb_dat_i[7:0]}), .UART_STB_I(wb_stb[0]), 
            .UART_CYC_I(wb_cyc), .UART_WE_I(wb_we), .UART_SEL_I({audio_pwm_out, 
            audio_pwm_out, audio_pwm_out, wb_sel}), .UART_CTI_I({audio_pwm_out, 
            audio_pwm_out, audio_pwm_out}), .UART_BTE_I({audio_pwm_out, 
            audio_pwm_out}), .UART_ACK_O(wb_ack[0]), .SIN(uart_rx), .SOUT(uart_tx));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(320[1] 338[2])
    adc_wb adc_wb_inst (.clk_i(clk), .stb_i(wb_stb[1]), .dat_o({wb_dat_i[15:8]}), 
           .ack_o(wb_ack[1]), .analog_cmp(analog_cmp), .analog_out(analog_out));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(342[8] 353[2])
    rom_ebr_wb STRING_TABLE_INST (.wb_clk_i(clk), .wb_rst_i(wb_rst), .wb_adr_i({wb_addr[9:0]}), 
            .wb_dat_o({wb_dat_i[119:112]}), .wb_stb_i(wb_stb[14]), .wb_we_i(wb_we), 
            .wb_ack_o(wb_ack[14]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(358[12] 366[2])
    \spi(SHIFT_DIRECTION=0,CLOCK_PHASE=0,CLOCK_POLARITY=0,CLOCK_SEL=1,MASTER=1,SLAVE_NUMBER=1,DATA_LENGTH=8,DELAY_TIME=2,CLKCNT_WIDTH=5,INTERVAL_LENGTH=2)  SPI_INST (.SPI_ADR_I({wb_addr[7:0]}), 
            .SPI_DAT_I({wb_data_from_master}), .SPI_WE_I(wb_we), .SPI_CYC_I(wb_cyc), 
            .SPI_STB_I(wb_stb[10]), .SPI_SEL_I({audio_pwm_out, audio_pwm_out, 
            audio_pwm_out, wb_sel}), .SPI_CTI_I({audio_pwm_out, audio_pwm_out, 
            audio_pwm_out}), .SPI_BTE_I({audio_pwm_out, audio_pwm_out}), 
            .SPI_LOCK_I(audio_pwm_out), .SPI_DAT_O({wb_dat_i[87:80]}), .SPI_ACK_O(wb_ack[10]), 
            .MISO_MASTER(spi_miso), .MOSI_MASTER(spi_mosi), .SS_N_MASTER({spi_csn}), 
            .SCLK_MASTER(spi_sclk), .MOSI_SLAVE(audio_pwm_out), .SS_N_SLAVE(1'b1), 
            .SCLK_SLAVE(audio_pwm_out), .CLK_I(clk), .RST_I(wb_rst));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(381[1] 407[5])
    \uptime_wb(CLK_FREQ=24180000,CLK_IN_HZ=25)  TIME_INST (.clk_i(clk), .rst_i(rst), 
            .wb_adr_i({wb_addr[1:0]}), .wb_dat_o({wb_dat_i[95:88]}), .wb_cyc_i(wb_cyc), 
            .wb_stb_i(wb_stb[11]), .wb_we_i(wb_we), .wb_ack_o(wb_ack[11]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(413[5] 422[5])
    
endmodule

//
// Verilog Description of module ILVDS
// module not written out since it is a black-box. 
//


//
// Verilog Description of module \OSCH(NOM_FREQ="24.18") 
// module not written out since it is a black-box. 
//


//
// Verilog Description of module reset_gen
//

module reset_gen (clk, rst_in, rst1_out, rst2_out) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/reset_gen.v(46[8:17])
    input clk;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/reset_gen.v(47[10:13])
    input rst_in;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/reset_gen.v(48[10:16])
    output rst1_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/reset_gen.v(49[10:18])
    output rst2_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/reset_gen.v(50[10:18])
    
    wire [3:0]reset_counter;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/reset_gen.v(59[22:35])
    wire [3:0]n6;
    wire [3:0]n11;
    
    wire n21, n23;
    
    add_4u_4u add_4 (.cin(1'b0), .a({reset_counter}), .b({4'b0001}), .o({n6}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/reset_gen.v(69[24:41])
    mux_4 mux_5 (.d0({reset_counter}), .d1({n6}), .cond(n23), .o({n11}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/reset_gen.v(68[5] 70[8])
    LessThan_4u_4u LessThan_7 (.cin(1'b0), .a({reset_counter}), .b({4'b1000}), 
            .o(n21));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/reset_gen.v(79[9:33])
    VERIFIC_DFFRS rst2_out_15 (.d(n23), .clk(clk), .s(rst_in), .r(1'b0), 
            .q(rst2_out));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/reset_gen.v(92[8] 99[6])
    LessThan_4u_4u LessThan_9 (.cin(1'b0), .a({reset_counter}), .b({4'b1111}), 
            .o(n23));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/reset_gen.v(93[9:33])
    wide_dffrs_4 reset_counter_c (.d({n11}), .set({4'b0000}), .reset({rst_in, 
            rst_in, rst_in, rst_in}), .clock(clk), .q({reset_counter}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/reset_gen.v(67[8] 71[6])
    VERIFIC_DFFRS rst1_out_14 (.d(n21), .clk(clk), .s(rst_in), .r(1'b0), 
            .q(rst1_out));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/reset_gen.v(78[8] 85[6])
    
endmodule

//
// Verilog Description of OPERATOR add_4u_4u
//

module add_4u_4u (cin, a, b, o, cout);
    input cin;
    input [3:0]a;
    input [3:0]b;
    output [3:0]o;
    output cout;
    
    
    wire n2, n4, n6;
    
    VERIFIC_FADD i1 (.cin(cin), .a(a[0]), .b(b[0]), .o(o[0]), .cout(n2));
    VERIFIC_FADD i2 (.cin(n2), .a(a[1]), .b(b[1]), .o(o[1]), .cout(n4));
    VERIFIC_FADD i3 (.cin(n4), .a(a[2]), .b(b[2]), .o(o[2]), .cout(n6));
    VERIFIC_FADD i4 (.cin(n6), .a(a[3]), .b(b[3]), .o(o[3]), .cout(cout));
    
endmodule

//
// Verilog Description of OPERATOR mux_4
//

module mux_4 (d0, d1, cond, o);
    input [3:0]d0;
    input [3:0]d1;
    input cond;
    output [3:0]o;
    
    
    assign o[0] = cond ? d1[0] : d0[0];
    assign o[1] = cond ? d1[1] : d0[1];
    assign o[2] = cond ? d1[2] : d0[2];
    assign o[3] = cond ? d1[3] : d0[3];
    
endmodule

//
// Verilog Description of OPERATOR LessThan_4u_4u
//

module LessThan_4u_4u (cin, a, b, o);
    input cin;
    input [3:0]a;
    input [3:0]b;
    output o;
    
    
    wire n1, n2, n3, n4, n5, n6, n7;
    
    xor (n1, a[0], b[0]) ;
    assign n2 = n1 ? b[0] : cin;
    xor (n3, a[1], b[1]) ;
    assign n4 = n3 ? b[1] : n2;
    xor (n5, a[2], b[2]) ;
    assign n6 = n5 ? b[2] : n4;
    xor (n7, a[3], b[3]) ;
    assign o = n7 ? b[3] : n6;
    
endmodule

//
// Verilog Description of OPERATOR wide_dffrs_4
//

module wide_dffrs_4 (d, set, reset, clock, q);
    input [3:0]d;
    input [3:0]set;
    input [3:0]reset;
    input clock;
    output [3:0]q;
    
    
    VERIFIC_DFFRS i1 (.d(d[0]), .clk(clock), .s(set[0]), .r(reset[0]), 
            .q(q[0]));
    VERIFIC_DFFRS i2 (.d(d[1]), .clk(clock), .s(set[1]), .r(reset[1]), 
            .q(q[1]));
    VERIFIC_DFFRS i3 (.d(d[2]), .clk(clock), .s(set[2]), .r(reset[2]), 
            .q(q[2]));
    VERIFIC_DFFRS i4 (.d(d[3]), .clk(clock), .s(set[3]), .r(reset[3]), 
            .q(q[3]));
    
endmodule

//
// Verilog Description of module led_sw_wb
//

module led_sw_wb (clk_i, rst_i, dat_i, sw, stb_i, we_i, cyc_i, 
            dat_o, led, ack_o) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(46[8:17])
    input clk_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(47[9:14])
    input rst_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(48[9:14])
    input [7:0]dat_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(49[15:20])
    input [7:0]sw;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(50[15:17])
    input stb_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(51[9:14])
    input we_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(52[9:13])
    input cyc_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(53[9:14])
    output [7:0]dat_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(54[16:21])
    output [7:0]led;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(55[20:23])
    output ack_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(56[10:15])
    
    
    wire n4, n5;
    wire [7:0]n6;
    
    assign dat_o[7] = sw[7];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(50[15:17])
    assign dat_o[6] = sw[6];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(50[15:17])
    assign dat_o[5] = sw[5];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(50[15:17])
    assign dat_o[4] = sw[4];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(50[15:17])
    assign dat_o[3] = sw[3];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(50[15:17])
    assign dat_o[2] = sw[2];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(50[15:17])
    assign dat_o[1] = sw[1];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(50[15:17])
    assign dat_o[0] = sw[0];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(50[15:17])
    assign ack_o = stb_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(51[9:14])
    and (n4, ack_o, cyc_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(62[12:26])
    and (n5, n4, we_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(62[12:34])
    mux_8 mux_5 (.d0({led}), .d1({dat_i}), .cond(n5), .o({n6}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(62[8] 63[18])
    wide_dffrs_8 led_c1 (.d({n6}), .set({8'b00000000}), .reset({rst_i, 
            rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, rst_i}), 
            .clock(clk_i), .q({led}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/led_sw_wb.v(62[8] 63[18])
    
endmodule

//
// Verilog Description of OPERATOR mux_8
//

module mux_8 (d0, d1, cond, o);
    input [7:0]d0;
    input [7:0]d1;
    input cond;
    output [7:0]o;
    
    
    assign o[0] = cond ? d1[0] : d0[0];
    assign o[1] = cond ? d1[1] : d0[1];
    assign o[2] = cond ? d1[2] : d0[2];
    assign o[3] = cond ? d1[3] : d0[3];
    assign o[4] = cond ? d1[4] : d0[4];
    assign o[5] = cond ? d1[5] : d0[5];
    assign o[6] = cond ? d1[6] : d0[6];
    assign o[7] = cond ? d1[7] : d0[7];
    
endmodule

//
// Verilog Description of OPERATOR wide_dffrs_8
//

module wide_dffrs_8 (d, set, reset, clock, q);
    input [7:0]d;
    input [7:0]set;
    input [7:0]reset;
    input clock;
    output [7:0]q;
    
    
    VERIFIC_DFFRS i1 (.d(d[0]), .clk(clock), .s(set[0]), .r(reset[0]), 
            .q(q[0]));
    VERIFIC_DFFRS i2 (.d(d[1]), .clk(clock), .s(set[1]), .r(reset[1]), 
            .q(q[1]));
    VERIFIC_DFFRS i3 (.d(d[2]), .clk(clock), .s(set[2]), .r(reset[2]), 
            .q(q[2]));
    VERIFIC_DFFRS i4 (.d(d[3]), .clk(clock), .s(set[3]), .r(reset[3]), 
            .q(q[3]));
    VERIFIC_DFFRS i5 (.d(d[4]), .clk(clock), .s(set[4]), .r(reset[4]), 
            .q(q[4]));
    VERIFIC_DFFRS i6 (.d(d[5]), .clk(clock), .s(set[5]), .r(reset[5]), 
            .q(q[5]));
    VERIFIC_DFFRS i7 (.d(d[6]), .clk(clock), .s(set[6]), .r(reset[6]), 
            .q(q[6]));
    VERIFIC_DFFRS i8 (.d(d[7]), .clk(clock), .s(set[7]), .r(reset[7]), 
            .q(q[7]));
    
endmodule

//
// Verilog Description of module \lm8_wb(LM8_ADDR_W=24,NUM_DECODE=4) 
//

module \lm8_wb(LM8_ADDR_W=24,NUM_DECODE=4)  (clk_i, rst_i, wb_ack_i, wb_dat_i, 
            wb_stb_o, wb_we_o, wb_sel_o, wb_cyc_o, wb_dat_o, wb_adr_o, 
            lm8_addr, lm8_ext_io_rd, lm8_ext_io_wr, lm8_ext_io_din, 
            lm8_ext_io_dout, lm8_io_ready) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(47[8:14])
    input clk_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(57[28:33])
    input rst_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(58[28:33])
    input [15:0]wb_ack_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(60[28:36])
    input [127:0]wb_dat_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(61[28:36])
    output [15:0]wb_stb_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(62[28:36])
    output wb_we_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(63[28:35])
    output wb_sel_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(64[28:36])
    output wb_cyc_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(65[28:36])
    output [7:0]wb_dat_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(66[28:36])
    output [19:0]wb_adr_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(67[28:36])
    input [23:0]lm8_addr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    input lm8_ext_io_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(71[28:41])
    input lm8_ext_io_wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(72[28:41])
    output [7:0]lm8_ext_io_din;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(73[28:42])
    input [7:0]lm8_ext_io_dout;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(74[28:43])
    output lm8_io_ready;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(75[28:40])
    
    wire ack_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(78[8:15])
    wire wb_stb_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(79[8:18])
    wire [127:0]data_mux;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(81[27:35])
    
    wire n4, n7, n12;
    wire [7:0]n160;
    
    assign wb_cyc_o = wb_sel_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(65[28:36])
    assign wb_adr_o[19] = lm8_addr[19];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[18] = lm8_addr[18];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[17] = lm8_addr[17];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[16] = lm8_addr[16];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[15] = lm8_addr[15];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[14] = lm8_addr[14];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[13] = lm8_addr[13];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[12] = lm8_addr[12];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[11] = lm8_addr[11];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[10] = lm8_addr[10];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[9] = lm8_addr[9];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[8] = lm8_addr[8];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[7] = lm8_addr[7];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[6] = lm8_addr[6];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[5] = lm8_addr[5];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[4] = lm8_addr[4];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[3] = lm8_addr[3];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[2] = lm8_addr[2];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[1] = lm8_addr[1];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_adr_o[0] = lm8_addr[0];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(70[28:36])
    assign wb_dat_o[7] = lm8_ext_io_dout[7];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(74[28:43])
    assign wb_dat_o[6] = lm8_ext_io_dout[6];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(74[28:43])
    assign wb_dat_o[5] = lm8_ext_io_dout[5];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(74[28:43])
    assign wb_dat_o[4] = lm8_ext_io_dout[4];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(74[28:43])
    assign wb_dat_o[3] = lm8_ext_io_dout[3];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(74[28:43])
    assign wb_dat_o[2] = lm8_ext_io_dout[2];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(74[28:43])
    assign wb_dat_o[1] = lm8_ext_io_dout[1];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(74[28:43])
    assign wb_dat_o[0] = lm8_ext_io_dout[0];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(74[28:43])
    assign n4 = rst_i ? 1'b0 : lm8_io_ready;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(91[10] 93[8])
    wide_dffrs_8 lm8_ext_io_din_c2 (.d({n160}), .set({8'b00000000}), .reset({8'b00000000}), 
            .clock(clk_i), .q({lm8_ext_io_din}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(128[9] 135[6])
    or (wb_sel_o, lm8_ext_io_rd, lm8_ext_io_wr) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(101[23:55])
    not (n7, ack_reg) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(101[59:67])
    and (wb_stb_int, wb_sel_o, n7) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(101[23:67])
    LessThan_16u_16u LessThan_8 (.cin(1'b0), .a({16'b0000000000000000}), 
            .b({wb_ack_i}), .o(lm8_io_ready));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(108[25:39])
    not (n12, lm8_ext_io_rd) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(114[21:35])
    and (wb_we_o, n12, lm8_ext_io_wr) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(114[21:52])
    shift_right_128u_7u shift_right_13 (.cin(1'b0), .a({wb_dat_i}), .amount({lm8_addr[23:20], 
            3'b000}), .o({Open_32, Open_33, Open_34, Open_35, Open_36, 
            Open_37, Open_38, Open_39, Open_40, Open_41, Open_42, 
            Open_43, Open_44, Open_45, Open_46, Open_47, Open_48, 
            Open_49, Open_50, Open_51, Open_52, Open_53, Open_54, 
            Open_55, Open_56, Open_57, Open_58, Open_59, Open_60, 
            Open_61, Open_62, Open_63, Open_64, Open_65, Open_66, 
            Open_67, Open_68, Open_69, Open_70, Open_71, Open_72, 
            Open_73, Open_74, Open_75, Open_76, Open_77, Open_78, 
            Open_79, Open_80, Open_81, Open_82, Open_83, Open_84, 
            Open_85, Open_86, Open_87, Open_88, Open_89, Open_90, 
            Open_91, Open_92, Open_93, Open_94, Open_95, Open_96, 
            Open_97, Open_98, Open_99, Open_100, Open_101, Open_102, 
            Open_103, Open_104, Open_105, Open_106, Open_107, Open_108, 
            Open_109, Open_110, Open_111, Open_112, Open_113, Open_114, 
            Open_115, Open_116, Open_117, Open_118, Open_119, Open_120, 
            Open_121, Open_122, Open_123, Open_124, Open_125, Open_126, 
            Open_127, Open_128, Open_129, Open_130, Open_131, Open_132, 
            Open_133, Open_134, Open_135, Open_136, Open_137, Open_138, 
            Open_139, Open_140, Open_141, Open_142, Open_143, Open_144, 
            Open_145, Open_146, Open_147, Open_148, Open_149, Open_150, 
            Open_151, data_mux[7:0]}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(120[21:48])
    shift_left_16u_4u shift_left_14 (.cin(1'b0), .a({15'b000000000000000, 
            wb_stb_int}), .amount({lm8_addr[23:20]}), .o({wb_stb_o}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(123[21:46])
    mux_8 mux_15 (.d0({data_mux[7:0]}), .d1({8'b00000000}), .cond(rst_i), 
          .o({n160}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(132[10] 134[8])
    VERIFIC_DFFRS ack_reg_18 (.d(n4), .clk(clk_i), .s(1'b0), .r(1'b0), 
            .q(ack_reg));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(87[9] 94[6])
    
endmodule

//
// Verilog Description of OPERATOR LessThan_16u_16u
//

module LessThan_16u_16u (cin, a, b, o);
    input cin;
    input [15:0]a;
    input [15:0]b;
    output o;
    
    
    wire n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, 
        n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, 
        n22, n23, n24, n25, n26, n27, n28, n29, n30, n31;
    
    xor (n1, a[0], b[0]) ;
    assign n2 = n1 ? b[0] : cin;
    xor (n3, a[1], b[1]) ;
    assign n4 = n3 ? b[1] : n2;
    xor (n5, a[2], b[2]) ;
    assign n6 = n5 ? b[2] : n4;
    xor (n7, a[3], b[3]) ;
    assign n8 = n7 ? b[3] : n6;
    xor (n9, a[4], b[4]) ;
    assign n10 = n9 ? b[4] : n8;
    xor (n11, a[5], b[5]) ;
    assign n12 = n11 ? b[5] : n10;
    xor (n13, a[6], b[6]) ;
    assign n14 = n13 ? b[6] : n12;
    xor (n15, a[7], b[7]) ;
    assign n16 = n15 ? b[7] : n14;
    xor (n17, a[8], b[8]) ;
    assign n18 = n17 ? b[8] : n16;
    xor (n19, a[9], b[9]) ;
    assign n20 = n19 ? b[9] : n18;
    xor (n21, a[10], b[10]) ;
    assign n22 = n21 ? b[10] : n20;
    xor (n23, a[11], b[11]) ;
    assign n24 = n23 ? b[11] : n22;
    xor (n25, a[12], b[12]) ;
    assign n26 = n25 ? b[12] : n24;
    xor (n27, a[13], b[13]) ;
    assign n28 = n27 ? b[13] : n26;
    xor (n29, a[14], b[14]) ;
    assign n30 = n29 ? b[14] : n28;
    xor (n31, a[15], b[15]) ;
    assign o = n31 ? b[15] : n30;
    
endmodule

//
// Verilog Description of OPERATOR shift_right_128u_7u
//

module shift_right_128u_7u (cin, a, amount, o);
    input cin;
    input [127:0]a;
    input [6:0]amount;
    output [127:0]o;
    
    
    wire n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, 
        n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, 
        n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, 
        n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, 
        n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, 
        n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, 
        n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, 
        n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, 
        n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, 
        n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, 
        n102, n103, n104, n105, n106, n107, n108, n109, n110, 
        n111, n112, n113, n114, n115, n116, n117, n118, n119, 
        n120, n121, n122, n123, n124, n125, n126, n127, n128, 
        n129, n130, n131, n132, n133, n134, n135, n136, n137, 
        n138, n139, n140, n141, n142, n143, n144, n145, n146, 
        n147, n148, n149, n150, n151, n152, n153, n154, n155, 
        n156, n157, n158, n159, n160, n161, n162, n163, n164, 
        n165, n166, n167, n168, n169, n170, n171, n172, n173, 
        n174, n175, n176, n177, n178, n179, n180, n181, n182, 
        n183, n184, n185, n186, n187, n188, n189, n190, n191, 
        n192, n193, n194, n195, n196, n197, n198, n199, n200, 
        n201, n202, n203, n204, n205, n206, n207, n208, n209, 
        n210, n211, n212, n213, n214, n215, n216, n217, n218, 
        n219, n220, n221, n222, n223, n224, n225, n226, n227, 
        n228, n229, n230, n231, n232, n233, n234, n235, n236, 
        n237, n238, n239, n240, n241, n242, n243, n244, n245, 
        n246, n247, n248, n249, n250, n251, n252, n253, n254, 
        n255, n256, n257, n258, n259, n260, n261, n262, n263, 
        n264, n265, n266, n267, n268, n269, n270, n271, n272, 
        n273, n274, n275, n276, n277, n278, n279, n280, n281, 
        n282, n283, n284, n285, n286, n287, n288, n289, n290, 
        n291, n292, n293, n294, n295, n296, n297, n298, n299, 
        n300, n301, n302, n303, n304, n305, n306, n307, n308, 
        n309, n310, n311, n312, n313, n314, n315, n316, n317, 
        n318, n319, n320, n321, n322, n323, n324, n325, n326, 
        n327, n328, n329, n330, n331, n332, n333, n334, n335, 
        n336, n337, n338, n339, n340, n341, n342, n343, n344, 
        n345, n346, n347, n348, n349, n350, n351, n352, n353, 
        n354, n355, n356, n357, n358, n359, n360, n361, n362, 
        n363, n364, n365, n366, n367, n368, n369, n370, n371, 
        n372, n373, n374, n375, n376, n377, n378, n379, n380, 
        n381, n382, n383, n384, n385, n386, n387, n388, n389, 
        n390, n391, n392, n393, n394, n395, n396, n397, n398, 
        n399, n400, n401, n402, n403, n404, n405, n406, n407, 
        n408, n409, n410, n411, n412, n413, n414, n415, n416, 
        n417, n418, n419, n420, n421, n422, n423, n424, n425, 
        n426, n427, n428, n429, n430, n431, n432, n433, n434, 
        n435, n436, n437, n438, n439, n440, n441, n442, n443, 
        n444, n445, n446, n447, n448, n449, n450, n451, n452, 
        n453, n454, n455, n456, n457, n458, n459, n460, n461, 
        n462, n463, n464, n465, n466, n467, n468, n469, n470, 
        n471, n472, n473, n474, n475, n476, n477, n478, n479, 
        n480, n481, n482, n483, n484, n485, n486, n487, n488, 
        n489, n490, n491, n492, n493, n494, n495, n496, n497, 
        n498, n499, n500, n501, n502, n503, n504, n505, n506, 
        n507, n508, n509, n510, n511, n512, n513, n514, n515, 
        n516, n517, n518, n519, n520, n521, n522, n523, n524, 
        n525, n526, n527, n528, n529, n530, n531, n532, n533, 
        n534, n535, n536, n537, n538, n539, n540, n541, n542, 
        n543, n544, n545, n546, n547, n548, n549, n550, n551, 
        n552, n553, n554, n555, n556, n557, n558, n559, n560, 
        n561, n562, n563, n564, n565, n566, n567, n568, n569, 
        n570, n571, n572, n573, n574, n575, n576, n577, n578, 
        n579, n580, n581, n582, n583, n584, n585, n586, n587, 
        n588, n589, n590, n591, n592, n593, n594, n595, n596, 
        n597, n598, n599, n600, n601, n602, n603, n604, n605, 
        n606, n607, n608, n609, n610, n611, n612, n613, n614, 
        n615, n616, n617, n618, n619, n620, n621, n622, n623, 
        n624, n625, n626, n627, n628, n629, n630, n631, n632, 
        n633, n634, n635, n636, n637, n638, n639, n640, n641, 
        n642, n643, n644, n645, n646, n647, n648, n649, n650, 
        n651, n652, n653, n654, n655, n656, n657, n658, n659, 
        n660, n661, n662, n663, n664, n665, n666, n667, n668, 
        n669, n670, n671, n672, n673, n674, n675, n676, n677, 
        n678, n679, n680, n681, n682, n683, n684, n685, n686, 
        n687, n688, n689, n690, n691, n692, n693, n694, n695, 
        n696, n697, n698, n699, n700, n701, n702, n703, n704, 
        n705, n706, n707, n708, n709, n710, n711, n712, n713, 
        n714, n715, n716, n717, n718, n719, n720, n721, n722, 
        n723, n724, n725, n726, n727, n728, n729, n730, n731, 
        n732, n733, n734, n735, n736, n737, n738, n739, n740, 
        n741, n742, n743, n744, n745, n746, n747, n748, n749, 
        n750, n751, n752, n753, n754, n755, n756, n757, n758, 
        n759, n760, n761, n762, n763, n764, n765, n766, n767, 
        n768;
    
    assign n1 = amount[0] ? a[1] : a[0];
    assign n2 = amount[0] ? a[2] : a[1];
    assign n3 = amount[0] ? a[3] : a[2];
    assign n4 = amount[0] ? a[4] : a[3];
    assign n5 = amount[0] ? a[5] : a[4];
    assign n6 = amount[0] ? a[6] : a[5];
    assign n7 = amount[0] ? a[7] : a[6];
    assign n8 = amount[0] ? a[8] : a[7];
    assign n9 = amount[0] ? a[9] : a[8];
    assign n10 = amount[0] ? a[10] : a[9];
    assign n11 = amount[0] ? a[11] : a[10];
    assign n12 = amount[0] ? a[12] : a[11];
    assign n13 = amount[0] ? a[13] : a[12];
    assign n14 = amount[0] ? a[14] : a[13];
    assign n15 = amount[0] ? a[15] : a[14];
    assign n16 = amount[0] ? a[16] : a[15];
    assign n17 = amount[0] ? a[17] : a[16];
    assign n18 = amount[0] ? a[18] : a[17];
    assign n19 = amount[0] ? a[19] : a[18];
    assign n20 = amount[0] ? a[20] : a[19];
    assign n21 = amount[0] ? a[21] : a[20];
    assign n22 = amount[0] ? a[22] : a[21];
    assign n23 = amount[0] ? a[23] : a[22];
    assign n24 = amount[0] ? a[24] : a[23];
    assign n25 = amount[0] ? a[25] : a[24];
    assign n26 = amount[0] ? a[26] : a[25];
    assign n27 = amount[0] ? a[27] : a[26];
    assign n28 = amount[0] ? a[28] : a[27];
    assign n29 = amount[0] ? a[29] : a[28];
    assign n30 = amount[0] ? a[30] : a[29];
    assign n31 = amount[0] ? a[31] : a[30];
    assign n32 = amount[0] ? a[32] : a[31];
    assign n33 = amount[0] ? a[33] : a[32];
    assign n34 = amount[0] ? a[34] : a[33];
    assign n35 = amount[0] ? a[35] : a[34];
    assign n36 = amount[0] ? a[36] : a[35];
    assign n37 = amount[0] ? a[37] : a[36];
    assign n38 = amount[0] ? a[38] : a[37];
    assign n39 = amount[0] ? a[39] : a[38];
    assign n40 = amount[0] ? a[40] : a[39];
    assign n41 = amount[0] ? a[41] : a[40];
    assign n42 = amount[0] ? a[42] : a[41];
    assign n43 = amount[0] ? a[43] : a[42];
    assign n44 = amount[0] ? a[44] : a[43];
    assign n45 = amount[0] ? a[45] : a[44];
    assign n46 = amount[0] ? a[46] : a[45];
    assign n47 = amount[0] ? a[47] : a[46];
    assign n48 = amount[0] ? a[48] : a[47];
    assign n49 = amount[0] ? a[49] : a[48];
    assign n50 = amount[0] ? a[50] : a[49];
    assign n51 = amount[0] ? a[51] : a[50];
    assign n52 = amount[0] ? a[52] : a[51];
    assign n53 = amount[0] ? a[53] : a[52];
    assign n54 = amount[0] ? a[54] : a[53];
    assign n55 = amount[0] ? a[55] : a[54];
    assign n56 = amount[0] ? a[56] : a[55];
    assign n57 = amount[0] ? a[57] : a[56];
    assign n58 = amount[0] ? a[58] : a[57];
    assign n59 = amount[0] ? a[59] : a[58];
    assign n60 = amount[0] ? a[60] : a[59];
    assign n61 = amount[0] ? a[61] : a[60];
    assign n62 = amount[0] ? a[62] : a[61];
    assign n63 = amount[0] ? a[63] : a[62];
    assign n64 = amount[0] ? a[64] : a[63];
    assign n65 = amount[0] ? a[65] : a[64];
    assign n66 = amount[0] ? a[66] : a[65];
    assign n67 = amount[0] ? a[67] : a[66];
    assign n68 = amount[0] ? a[68] : a[67];
    assign n69 = amount[0] ? a[69] : a[68];
    assign n70 = amount[0] ? a[70] : a[69];
    assign n71 = amount[0] ? a[71] : a[70];
    assign n72 = amount[0] ? a[72] : a[71];
    assign n73 = amount[0] ? a[73] : a[72];
    assign n74 = amount[0] ? a[74] : a[73];
    assign n75 = amount[0] ? a[75] : a[74];
    assign n76 = amount[0] ? a[76] : a[75];
    assign n77 = amount[0] ? a[77] : a[76];
    assign n78 = amount[0] ? a[78] : a[77];
    assign n79 = amount[0] ? a[79] : a[78];
    assign n80 = amount[0] ? a[80] : a[79];
    assign n81 = amount[0] ? a[81] : a[80];
    assign n82 = amount[0] ? a[82] : a[81];
    assign n83 = amount[0] ? a[83] : a[82];
    assign n84 = amount[0] ? a[84] : a[83];
    assign n85 = amount[0] ? a[85] : a[84];
    assign n86 = amount[0] ? a[86] : a[85];
    assign n87 = amount[0] ? a[87] : a[86];
    assign n88 = amount[0] ? a[88] : a[87];
    assign n89 = amount[0] ? a[89] : a[88];
    assign n90 = amount[0] ? a[90] : a[89];
    assign n91 = amount[0] ? a[91] : a[90];
    assign n92 = amount[0] ? a[92] : a[91];
    assign n93 = amount[0] ? a[93] : a[92];
    assign n94 = amount[0] ? a[94] : a[93];
    assign n95 = amount[0] ? a[95] : a[94];
    assign n96 = amount[0] ? a[96] : a[95];
    assign n97 = amount[0] ? a[97] : a[96];
    assign n98 = amount[0] ? a[98] : a[97];
    assign n99 = amount[0] ? a[99] : a[98];
    assign n100 = amount[0] ? a[100] : a[99];
    assign n101 = amount[0] ? a[101] : a[100];
    assign n102 = amount[0] ? a[102] : a[101];
    assign n103 = amount[0] ? a[103] : a[102];
    assign n104 = amount[0] ? a[104] : a[103];
    assign n105 = amount[0] ? a[105] : a[104];
    assign n106 = amount[0] ? a[106] : a[105];
    assign n107 = amount[0] ? a[107] : a[106];
    assign n108 = amount[0] ? a[108] : a[107];
    assign n109 = amount[0] ? a[109] : a[108];
    assign n110 = amount[0] ? a[110] : a[109];
    assign n111 = amount[0] ? a[111] : a[110];
    assign n112 = amount[0] ? a[112] : a[111];
    assign n113 = amount[0] ? a[113] : a[112];
    assign n114 = amount[0] ? a[114] : a[113];
    assign n115 = amount[0] ? a[115] : a[114];
    assign n116 = amount[0] ? a[116] : a[115];
    assign n117 = amount[0] ? a[117] : a[116];
    assign n118 = amount[0] ? a[118] : a[117];
    assign n119 = amount[0] ? a[119] : a[118];
    assign n120 = amount[0] ? a[120] : a[119];
    assign n121 = amount[0] ? a[121] : a[120];
    assign n122 = amount[0] ? a[122] : a[121];
    assign n123 = amount[0] ? a[123] : a[122];
    assign n124 = amount[0] ? a[124] : a[123];
    assign n125 = amount[0] ? a[125] : a[124];
    assign n126 = amount[0] ? a[126] : a[125];
    assign n127 = amount[0] ? a[127] : a[126];
    assign n128 = amount[0] ? cin : a[127];
    assign n129 = amount[1] ? n3 : n1;
    assign n130 = amount[1] ? n4 : n2;
    assign n131 = amount[1] ? n5 : n3;
    assign n132 = amount[1] ? n6 : n4;
    assign n133 = amount[1] ? n7 : n5;
    assign n134 = amount[1] ? n8 : n6;
    assign n135 = amount[1] ? n9 : n7;
    assign n136 = amount[1] ? n10 : n8;
    assign n137 = amount[1] ? n11 : n9;
    assign n138 = amount[1] ? n12 : n10;
    assign n139 = amount[1] ? n13 : n11;
    assign n140 = amount[1] ? n14 : n12;
    assign n141 = amount[1] ? n15 : n13;
    assign n142 = amount[1] ? n16 : n14;
    assign n143 = amount[1] ? n17 : n15;
    assign n144 = amount[1] ? n18 : n16;
    assign n145 = amount[1] ? n19 : n17;
    assign n146 = amount[1] ? n20 : n18;
    assign n147 = amount[1] ? n21 : n19;
    assign n148 = amount[1] ? n22 : n20;
    assign n149 = amount[1] ? n23 : n21;
    assign n150 = amount[1] ? n24 : n22;
    assign n151 = amount[1] ? n25 : n23;
    assign n152 = amount[1] ? n26 : n24;
    assign n153 = amount[1] ? n27 : n25;
    assign n154 = amount[1] ? n28 : n26;
    assign n155 = amount[1] ? n29 : n27;
    assign n156 = amount[1] ? n30 : n28;
    assign n157 = amount[1] ? n31 : n29;
    assign n158 = amount[1] ? n32 : n30;
    assign n159 = amount[1] ? n33 : n31;
    assign n160 = amount[1] ? n34 : n32;
    assign n161 = amount[1] ? n35 : n33;
    assign n162 = amount[1] ? n36 : n34;
    assign n163 = amount[1] ? n37 : n35;
    assign n164 = amount[1] ? n38 : n36;
    assign n165 = amount[1] ? n39 : n37;
    assign n166 = amount[1] ? n40 : n38;
    assign n167 = amount[1] ? n41 : n39;
    assign n168 = amount[1] ? n42 : n40;
    assign n169 = amount[1] ? n43 : n41;
    assign n170 = amount[1] ? n44 : n42;
    assign n171 = amount[1] ? n45 : n43;
    assign n172 = amount[1] ? n46 : n44;
    assign n173 = amount[1] ? n47 : n45;
    assign n174 = amount[1] ? n48 : n46;
    assign n175 = amount[1] ? n49 : n47;
    assign n176 = amount[1] ? n50 : n48;
    assign n177 = amount[1] ? n51 : n49;
    assign n178 = amount[1] ? n52 : n50;
    assign n179 = amount[1] ? n53 : n51;
    assign n180 = amount[1] ? n54 : n52;
    assign n181 = amount[1] ? n55 : n53;
    assign n182 = amount[1] ? n56 : n54;
    assign n183 = amount[1] ? n57 : n55;
    assign n184 = amount[1] ? n58 : n56;
    assign n185 = amount[1] ? n59 : n57;
    assign n186 = amount[1] ? n60 : n58;
    assign n187 = amount[1] ? n61 : n59;
    assign n188 = amount[1] ? n62 : n60;
    assign n189 = amount[1] ? n63 : n61;
    assign n190 = amount[1] ? n64 : n62;
    assign n191 = amount[1] ? n65 : n63;
    assign n192 = amount[1] ? n66 : n64;
    assign n193 = amount[1] ? n67 : n65;
    assign n194 = amount[1] ? n68 : n66;
    assign n195 = amount[1] ? n69 : n67;
    assign n196 = amount[1] ? n70 : n68;
    assign n197 = amount[1] ? n71 : n69;
    assign n198 = amount[1] ? n72 : n70;
    assign n199 = amount[1] ? n73 : n71;
    assign n200 = amount[1] ? n74 : n72;
    assign n201 = amount[1] ? n75 : n73;
    assign n202 = amount[1] ? n76 : n74;
    assign n203 = amount[1] ? n77 : n75;
    assign n204 = amount[1] ? n78 : n76;
    assign n205 = amount[1] ? n79 : n77;
    assign n206 = amount[1] ? n80 : n78;
    assign n207 = amount[1] ? n81 : n79;
    assign n208 = amount[1] ? n82 : n80;
    assign n209 = amount[1] ? n83 : n81;
    assign n210 = amount[1] ? n84 : n82;
    assign n211 = amount[1] ? n85 : n83;
    assign n212 = amount[1] ? n86 : n84;
    assign n213 = amount[1] ? n87 : n85;
    assign n214 = amount[1] ? n88 : n86;
    assign n215 = amount[1] ? n89 : n87;
    assign n216 = amount[1] ? n90 : n88;
    assign n217 = amount[1] ? n91 : n89;
    assign n218 = amount[1] ? n92 : n90;
    assign n219 = amount[1] ? n93 : n91;
    assign n220 = amount[1] ? n94 : n92;
    assign n221 = amount[1] ? n95 : n93;
    assign n222 = amount[1] ? n96 : n94;
    assign n223 = amount[1] ? n97 : n95;
    assign n224 = amount[1] ? n98 : n96;
    assign n225 = amount[1] ? n99 : n97;
    assign n226 = amount[1] ? n100 : n98;
    assign n227 = amount[1] ? n101 : n99;
    assign n228 = amount[1] ? n102 : n100;
    assign n229 = amount[1] ? n103 : n101;
    assign n230 = amount[1] ? n104 : n102;
    assign n231 = amount[1] ? n105 : n103;
    assign n232 = amount[1] ? n106 : n104;
    assign n233 = amount[1] ? n107 : n105;
    assign n234 = amount[1] ? n108 : n106;
    assign n235 = amount[1] ? n109 : n107;
    assign n236 = amount[1] ? n110 : n108;
    assign n237 = amount[1] ? n111 : n109;
    assign n238 = amount[1] ? n112 : n110;
    assign n239 = amount[1] ? n113 : n111;
    assign n240 = amount[1] ? n114 : n112;
    assign n241 = amount[1] ? n115 : n113;
    assign n242 = amount[1] ? n116 : n114;
    assign n243 = amount[1] ? n117 : n115;
    assign n244 = amount[1] ? n118 : n116;
    assign n245 = amount[1] ? n119 : n117;
    assign n246 = amount[1] ? n120 : n118;
    assign n247 = amount[1] ? n121 : n119;
    assign n248 = amount[1] ? n122 : n120;
    assign n249 = amount[1] ? n123 : n121;
    assign n250 = amount[1] ? n124 : n122;
    assign n251 = amount[1] ? n125 : n123;
    assign n252 = amount[1] ? n126 : n124;
    assign n253 = amount[1] ? n127 : n125;
    assign n254 = amount[1] ? n128 : n126;
    assign n255 = amount[1] ? cin : n127;
    assign n256 = amount[1] ? cin : n128;
    assign n257 = amount[2] ? n133 : n129;
    assign n258 = amount[2] ? n134 : n130;
    assign n259 = amount[2] ? n135 : n131;
    assign n260 = amount[2] ? n136 : n132;
    assign n261 = amount[2] ? n137 : n133;
    assign n262 = amount[2] ? n138 : n134;
    assign n263 = amount[2] ? n139 : n135;
    assign n264 = amount[2] ? n140 : n136;
    assign n265 = amount[2] ? n141 : n137;
    assign n266 = amount[2] ? n142 : n138;
    assign n267 = amount[2] ? n143 : n139;
    assign n268 = amount[2] ? n144 : n140;
    assign n269 = amount[2] ? n145 : n141;
    assign n270 = amount[2] ? n146 : n142;
    assign n271 = amount[2] ? n147 : n143;
    assign n272 = amount[2] ? n148 : n144;
    assign n273 = amount[2] ? n149 : n145;
    assign n274 = amount[2] ? n150 : n146;
    assign n275 = amount[2] ? n151 : n147;
    assign n276 = amount[2] ? n152 : n148;
    assign n277 = amount[2] ? n153 : n149;
    assign n278 = amount[2] ? n154 : n150;
    assign n279 = amount[2] ? n155 : n151;
    assign n280 = amount[2] ? n156 : n152;
    assign n281 = amount[2] ? n157 : n153;
    assign n282 = amount[2] ? n158 : n154;
    assign n283 = amount[2] ? n159 : n155;
    assign n284 = amount[2] ? n160 : n156;
    assign n285 = amount[2] ? n161 : n157;
    assign n286 = amount[2] ? n162 : n158;
    assign n287 = amount[2] ? n163 : n159;
    assign n288 = amount[2] ? n164 : n160;
    assign n289 = amount[2] ? n165 : n161;
    assign n290 = amount[2] ? n166 : n162;
    assign n291 = amount[2] ? n167 : n163;
    assign n292 = amount[2] ? n168 : n164;
    assign n293 = amount[2] ? n169 : n165;
    assign n294 = amount[2] ? n170 : n166;
    assign n295 = amount[2] ? n171 : n167;
    assign n296 = amount[2] ? n172 : n168;
    assign n297 = amount[2] ? n173 : n169;
    assign n298 = amount[2] ? n174 : n170;
    assign n299 = amount[2] ? n175 : n171;
    assign n300 = amount[2] ? n176 : n172;
    assign n301 = amount[2] ? n177 : n173;
    assign n302 = amount[2] ? n178 : n174;
    assign n303 = amount[2] ? n179 : n175;
    assign n304 = amount[2] ? n180 : n176;
    assign n305 = amount[2] ? n181 : n177;
    assign n306 = amount[2] ? n182 : n178;
    assign n307 = amount[2] ? n183 : n179;
    assign n308 = amount[2] ? n184 : n180;
    assign n309 = amount[2] ? n185 : n181;
    assign n310 = amount[2] ? n186 : n182;
    assign n311 = amount[2] ? n187 : n183;
    assign n312 = amount[2] ? n188 : n184;
    assign n313 = amount[2] ? n189 : n185;
    assign n314 = amount[2] ? n190 : n186;
    assign n315 = amount[2] ? n191 : n187;
    assign n316 = amount[2] ? n192 : n188;
    assign n317 = amount[2] ? n193 : n189;
    assign n318 = amount[2] ? n194 : n190;
    assign n319 = amount[2] ? n195 : n191;
    assign n320 = amount[2] ? n196 : n192;
    assign n321 = amount[2] ? n197 : n193;
    assign n322 = amount[2] ? n198 : n194;
    assign n323 = amount[2] ? n199 : n195;
    assign n324 = amount[2] ? n200 : n196;
    assign n325 = amount[2] ? n201 : n197;
    assign n326 = amount[2] ? n202 : n198;
    assign n327 = amount[2] ? n203 : n199;
    assign n328 = amount[2] ? n204 : n200;
    assign n329 = amount[2] ? n205 : n201;
    assign n330 = amount[2] ? n206 : n202;
    assign n331 = amount[2] ? n207 : n203;
    assign n332 = amount[2] ? n208 : n204;
    assign n333 = amount[2] ? n209 : n205;
    assign n334 = amount[2] ? n210 : n206;
    assign n335 = amount[2] ? n211 : n207;
    assign n336 = amount[2] ? n212 : n208;
    assign n337 = amount[2] ? n213 : n209;
    assign n338 = amount[2] ? n214 : n210;
    assign n339 = amount[2] ? n215 : n211;
    assign n340 = amount[2] ? n216 : n212;
    assign n341 = amount[2] ? n217 : n213;
    assign n342 = amount[2] ? n218 : n214;
    assign n343 = amount[2] ? n219 : n215;
    assign n344 = amount[2] ? n220 : n216;
    assign n345 = amount[2] ? n221 : n217;
    assign n346 = amount[2] ? n222 : n218;
    assign n347 = amount[2] ? n223 : n219;
    assign n348 = amount[2] ? n224 : n220;
    assign n349 = amount[2] ? n225 : n221;
    assign n350 = amount[2] ? n226 : n222;
    assign n351 = amount[2] ? n227 : n223;
    assign n352 = amount[2] ? n228 : n224;
    assign n353 = amount[2] ? n229 : n225;
    assign n354 = amount[2] ? n230 : n226;
    assign n355 = amount[2] ? n231 : n227;
    assign n356 = amount[2] ? n232 : n228;
    assign n357 = amount[2] ? n233 : n229;
    assign n358 = amount[2] ? n234 : n230;
    assign n359 = amount[2] ? n235 : n231;
    assign n360 = amount[2] ? n236 : n232;
    assign n361 = amount[2] ? n237 : n233;
    assign n362 = amount[2] ? n238 : n234;
    assign n363 = amount[2] ? n239 : n235;
    assign n364 = amount[2] ? n240 : n236;
    assign n365 = amount[2] ? n241 : n237;
    assign n366 = amount[2] ? n242 : n238;
    assign n367 = amount[2] ? n243 : n239;
    assign n368 = amount[2] ? n244 : n240;
    assign n369 = amount[2] ? n245 : n241;
    assign n370 = amount[2] ? n246 : n242;
    assign n371 = amount[2] ? n247 : n243;
    assign n372 = amount[2] ? n248 : n244;
    assign n373 = amount[2] ? n249 : n245;
    assign n374 = amount[2] ? n250 : n246;
    assign n375 = amount[2] ? n251 : n247;
    assign n376 = amount[2] ? n252 : n248;
    assign n377 = amount[2] ? n253 : n249;
    assign n378 = amount[2] ? n254 : n250;
    assign n379 = amount[2] ? n255 : n251;
    assign n380 = amount[2] ? n256 : n252;
    assign n381 = amount[2] ? cin : n253;
    assign n382 = amount[2] ? cin : n254;
    assign n383 = amount[2] ? cin : n255;
    assign n384 = amount[2] ? cin : n256;
    assign n385 = amount[3] ? n265 : n257;
    assign n386 = amount[3] ? n266 : n258;
    assign n387 = amount[3] ? n267 : n259;
    assign n388 = amount[3] ? n268 : n260;
    assign n389 = amount[3] ? n269 : n261;
    assign n390 = amount[3] ? n270 : n262;
    assign n391 = amount[3] ? n271 : n263;
    assign n392 = amount[3] ? n272 : n264;
    assign n393 = amount[3] ? n273 : n265;
    assign n394 = amount[3] ? n274 : n266;
    assign n395 = amount[3] ? n275 : n267;
    assign n396 = amount[3] ? n276 : n268;
    assign n397 = amount[3] ? n277 : n269;
    assign n398 = amount[3] ? n278 : n270;
    assign n399 = amount[3] ? n279 : n271;
    assign n400 = amount[3] ? n280 : n272;
    assign n401 = amount[3] ? n281 : n273;
    assign n402 = amount[3] ? n282 : n274;
    assign n403 = amount[3] ? n283 : n275;
    assign n404 = amount[3] ? n284 : n276;
    assign n405 = amount[3] ? n285 : n277;
    assign n406 = amount[3] ? n286 : n278;
    assign n407 = amount[3] ? n287 : n279;
    assign n408 = amount[3] ? n288 : n280;
    assign n409 = amount[3] ? n289 : n281;
    assign n410 = amount[3] ? n290 : n282;
    assign n411 = amount[3] ? n291 : n283;
    assign n412 = amount[3] ? n292 : n284;
    assign n413 = amount[3] ? n293 : n285;
    assign n414 = amount[3] ? n294 : n286;
    assign n415 = amount[3] ? n295 : n287;
    assign n416 = amount[3] ? n296 : n288;
    assign n417 = amount[3] ? n297 : n289;
    assign n418 = amount[3] ? n298 : n290;
    assign n419 = amount[3] ? n299 : n291;
    assign n420 = amount[3] ? n300 : n292;
    assign n421 = amount[3] ? n301 : n293;
    assign n422 = amount[3] ? n302 : n294;
    assign n423 = amount[3] ? n303 : n295;
    assign n424 = amount[3] ? n304 : n296;
    assign n425 = amount[3] ? n305 : n297;
    assign n426 = amount[3] ? n306 : n298;
    assign n427 = amount[3] ? n307 : n299;
    assign n428 = amount[3] ? n308 : n300;
    assign n429 = amount[3] ? n309 : n301;
    assign n430 = amount[3] ? n310 : n302;
    assign n431 = amount[3] ? n311 : n303;
    assign n432 = amount[3] ? n312 : n304;
    assign n433 = amount[3] ? n313 : n305;
    assign n434 = amount[3] ? n314 : n306;
    assign n435 = amount[3] ? n315 : n307;
    assign n436 = amount[3] ? n316 : n308;
    assign n437 = amount[3] ? n317 : n309;
    assign n438 = amount[3] ? n318 : n310;
    assign n439 = amount[3] ? n319 : n311;
    assign n440 = amount[3] ? n320 : n312;
    assign n441 = amount[3] ? n321 : n313;
    assign n442 = amount[3] ? n322 : n314;
    assign n443 = amount[3] ? n323 : n315;
    assign n444 = amount[3] ? n324 : n316;
    assign n445 = amount[3] ? n325 : n317;
    assign n446 = amount[3] ? n326 : n318;
    assign n447 = amount[3] ? n327 : n319;
    assign n448 = amount[3] ? n328 : n320;
    assign n449 = amount[3] ? n329 : n321;
    assign n450 = amount[3] ? n330 : n322;
    assign n451 = amount[3] ? n331 : n323;
    assign n452 = amount[3] ? n332 : n324;
    assign n453 = amount[3] ? n333 : n325;
    assign n454 = amount[3] ? n334 : n326;
    assign n455 = amount[3] ? n335 : n327;
    assign n456 = amount[3] ? n336 : n328;
    assign n457 = amount[3] ? n337 : n329;
    assign n458 = amount[3] ? n338 : n330;
    assign n459 = amount[3] ? n339 : n331;
    assign n460 = amount[3] ? n340 : n332;
    assign n461 = amount[3] ? n341 : n333;
    assign n462 = amount[3] ? n342 : n334;
    assign n463 = amount[3] ? n343 : n335;
    assign n464 = amount[3] ? n344 : n336;
    assign n465 = amount[3] ? n345 : n337;
    assign n466 = amount[3] ? n346 : n338;
    assign n467 = amount[3] ? n347 : n339;
    assign n468 = amount[3] ? n348 : n340;
    assign n469 = amount[3] ? n349 : n341;
    assign n470 = amount[3] ? n350 : n342;
    assign n471 = amount[3] ? n351 : n343;
    assign n472 = amount[3] ? n352 : n344;
    assign n473 = amount[3] ? n353 : n345;
    assign n474 = amount[3] ? n354 : n346;
    assign n475 = amount[3] ? n355 : n347;
    assign n476 = amount[3] ? n356 : n348;
    assign n477 = amount[3] ? n357 : n349;
    assign n478 = amount[3] ? n358 : n350;
    assign n479 = amount[3] ? n359 : n351;
    assign n480 = amount[3] ? n360 : n352;
    assign n481 = amount[3] ? n361 : n353;
    assign n482 = amount[3] ? n362 : n354;
    assign n483 = amount[3] ? n363 : n355;
    assign n484 = amount[3] ? n364 : n356;
    assign n485 = amount[3] ? n365 : n357;
    assign n486 = amount[3] ? n366 : n358;
    assign n487 = amount[3] ? n367 : n359;
    assign n488 = amount[3] ? n368 : n360;
    assign n489 = amount[3] ? n369 : n361;
    assign n490 = amount[3] ? n370 : n362;
    assign n491 = amount[3] ? n371 : n363;
    assign n492 = amount[3] ? n372 : n364;
    assign n493 = amount[3] ? n373 : n365;
    assign n494 = amount[3] ? n374 : n366;
    assign n495 = amount[3] ? n375 : n367;
    assign n496 = amount[3] ? n376 : n368;
    assign n497 = amount[3] ? n377 : n369;
    assign n498 = amount[3] ? n378 : n370;
    assign n499 = amount[3] ? n379 : n371;
    assign n500 = amount[3] ? n380 : n372;
    assign n501 = amount[3] ? n381 : n373;
    assign n502 = amount[3] ? n382 : n374;
    assign n503 = amount[3] ? n383 : n375;
    assign n504 = amount[3] ? n384 : n376;
    assign n505 = amount[3] ? cin : n377;
    assign n506 = amount[3] ? cin : n378;
    assign n507 = amount[3] ? cin : n379;
    assign n508 = amount[3] ? cin : n380;
    assign n509 = amount[3] ? cin : n381;
    assign n510 = amount[3] ? cin : n382;
    assign n511 = amount[3] ? cin : n383;
    assign n512 = amount[3] ? cin : n384;
    assign n513 = amount[4] ? n401 : n385;
    assign n514 = amount[4] ? n402 : n386;
    assign n515 = amount[4] ? n403 : n387;
    assign n516 = amount[4] ? n404 : n388;
    assign n517 = amount[4] ? n405 : n389;
    assign n518 = amount[4] ? n406 : n390;
    assign n519 = amount[4] ? n407 : n391;
    assign n520 = amount[4] ? n408 : n392;
    assign n521 = amount[4] ? n409 : n393;
    assign n522 = amount[4] ? n410 : n394;
    assign n523 = amount[4] ? n411 : n395;
    assign n524 = amount[4] ? n412 : n396;
    assign n525 = amount[4] ? n413 : n397;
    assign n526 = amount[4] ? n414 : n398;
    assign n527 = amount[4] ? n415 : n399;
    assign n528 = amount[4] ? n416 : n400;
    assign n529 = amount[4] ? n417 : n401;
    assign n530 = amount[4] ? n418 : n402;
    assign n531 = amount[4] ? n419 : n403;
    assign n532 = amount[4] ? n420 : n404;
    assign n533 = amount[4] ? n421 : n405;
    assign n534 = amount[4] ? n422 : n406;
    assign n535 = amount[4] ? n423 : n407;
    assign n536 = amount[4] ? n424 : n408;
    assign n537 = amount[4] ? n425 : n409;
    assign n538 = amount[4] ? n426 : n410;
    assign n539 = amount[4] ? n427 : n411;
    assign n540 = amount[4] ? n428 : n412;
    assign n541 = amount[4] ? n429 : n413;
    assign n542 = amount[4] ? n430 : n414;
    assign n543 = amount[4] ? n431 : n415;
    assign n544 = amount[4] ? n432 : n416;
    assign n545 = amount[4] ? n433 : n417;
    assign n546 = amount[4] ? n434 : n418;
    assign n547 = amount[4] ? n435 : n419;
    assign n548 = amount[4] ? n436 : n420;
    assign n549 = amount[4] ? n437 : n421;
    assign n550 = amount[4] ? n438 : n422;
    assign n551 = amount[4] ? n439 : n423;
    assign n552 = amount[4] ? n440 : n424;
    assign n553 = amount[4] ? n441 : n425;
    assign n554 = amount[4] ? n442 : n426;
    assign n555 = amount[4] ? n443 : n427;
    assign n556 = amount[4] ? n444 : n428;
    assign n557 = amount[4] ? n445 : n429;
    assign n558 = amount[4] ? n446 : n430;
    assign n559 = amount[4] ? n447 : n431;
    assign n560 = amount[4] ? n448 : n432;
    assign n561 = amount[4] ? n449 : n433;
    assign n562 = amount[4] ? n450 : n434;
    assign n563 = amount[4] ? n451 : n435;
    assign n564 = amount[4] ? n452 : n436;
    assign n565 = amount[4] ? n453 : n437;
    assign n566 = amount[4] ? n454 : n438;
    assign n567 = amount[4] ? n455 : n439;
    assign n568 = amount[4] ? n456 : n440;
    assign n569 = amount[4] ? n457 : n441;
    assign n570 = amount[4] ? n458 : n442;
    assign n571 = amount[4] ? n459 : n443;
    assign n572 = amount[4] ? n460 : n444;
    assign n573 = amount[4] ? n461 : n445;
    assign n574 = amount[4] ? n462 : n446;
    assign n575 = amount[4] ? n463 : n447;
    assign n576 = amount[4] ? n464 : n448;
    assign n577 = amount[4] ? n465 : n449;
    assign n578 = amount[4] ? n466 : n450;
    assign n579 = amount[4] ? n467 : n451;
    assign n580 = amount[4] ? n468 : n452;
    assign n581 = amount[4] ? n469 : n453;
    assign n582 = amount[4] ? n470 : n454;
    assign n583 = amount[4] ? n471 : n455;
    assign n584 = amount[4] ? n472 : n456;
    assign n585 = amount[4] ? n473 : n457;
    assign n586 = amount[4] ? n474 : n458;
    assign n587 = amount[4] ? n475 : n459;
    assign n588 = amount[4] ? n476 : n460;
    assign n589 = amount[4] ? n477 : n461;
    assign n590 = amount[4] ? n478 : n462;
    assign n591 = amount[4] ? n479 : n463;
    assign n592 = amount[4] ? n480 : n464;
    assign n593 = amount[4] ? n481 : n465;
    assign n594 = amount[4] ? n482 : n466;
    assign n595 = amount[4] ? n483 : n467;
    assign n596 = amount[4] ? n484 : n468;
    assign n597 = amount[4] ? n485 : n469;
    assign n598 = amount[4] ? n486 : n470;
    assign n599 = amount[4] ? n487 : n471;
    assign n600 = amount[4] ? n488 : n472;
    assign n601 = amount[4] ? n489 : n473;
    assign n602 = amount[4] ? n490 : n474;
    assign n603 = amount[4] ? n491 : n475;
    assign n604 = amount[4] ? n492 : n476;
    assign n605 = amount[4] ? n493 : n477;
    assign n606 = amount[4] ? n494 : n478;
    assign n607 = amount[4] ? n495 : n479;
    assign n608 = amount[4] ? n496 : n480;
    assign n609 = amount[4] ? n497 : n481;
    assign n610 = amount[4] ? n498 : n482;
    assign n611 = amount[4] ? n499 : n483;
    assign n612 = amount[4] ? n500 : n484;
    assign n613 = amount[4] ? n501 : n485;
    assign n614 = amount[4] ? n502 : n486;
    assign n615 = amount[4] ? n503 : n487;
    assign n616 = amount[4] ? n504 : n488;
    assign n617 = amount[4] ? n505 : n489;
    assign n618 = amount[4] ? n506 : n490;
    assign n619 = amount[4] ? n507 : n491;
    assign n620 = amount[4] ? n508 : n492;
    assign n621 = amount[4] ? n509 : n493;
    assign n622 = amount[4] ? n510 : n494;
    assign n623 = amount[4] ? n511 : n495;
    assign n624 = amount[4] ? n512 : n496;
    assign n625 = amount[4] ? cin : n497;
    assign n626 = amount[4] ? cin : n498;
    assign n627 = amount[4] ? cin : n499;
    assign n628 = amount[4] ? cin : n500;
    assign n629 = amount[4] ? cin : n501;
    assign n630 = amount[4] ? cin : n502;
    assign n631 = amount[4] ? cin : n503;
    assign n632 = amount[4] ? cin : n504;
    assign n633 = amount[4] ? cin : n505;
    assign n634 = amount[4] ? cin : n506;
    assign n635 = amount[4] ? cin : n507;
    assign n636 = amount[4] ? cin : n508;
    assign n637 = amount[4] ? cin : n509;
    assign n638 = amount[4] ? cin : n510;
    assign n639 = amount[4] ? cin : n511;
    assign n640 = amount[4] ? cin : n512;
    assign n641 = amount[5] ? n545 : n513;
    assign n642 = amount[5] ? n546 : n514;
    assign n643 = amount[5] ? n547 : n515;
    assign n644 = amount[5] ? n548 : n516;
    assign n645 = amount[5] ? n549 : n517;
    assign n646 = amount[5] ? n550 : n518;
    assign n647 = amount[5] ? n551 : n519;
    assign n648 = amount[5] ? n552 : n520;
    assign n649 = amount[5] ? n553 : n521;
    assign n650 = amount[5] ? n554 : n522;
    assign n651 = amount[5] ? n555 : n523;
    assign n652 = amount[5] ? n556 : n524;
    assign n653 = amount[5] ? n557 : n525;
    assign n654 = amount[5] ? n558 : n526;
    assign n655 = amount[5] ? n559 : n527;
    assign n656 = amount[5] ? n560 : n528;
    assign n657 = amount[5] ? n561 : n529;
    assign n658 = amount[5] ? n562 : n530;
    assign n659 = amount[5] ? n563 : n531;
    assign n660 = amount[5] ? n564 : n532;
    assign n661 = amount[5] ? n565 : n533;
    assign n662 = amount[5] ? n566 : n534;
    assign n663 = amount[5] ? n567 : n535;
    assign n664 = amount[5] ? n568 : n536;
    assign n665 = amount[5] ? n569 : n537;
    assign n666 = amount[5] ? n570 : n538;
    assign n667 = amount[5] ? n571 : n539;
    assign n668 = amount[5] ? n572 : n540;
    assign n669 = amount[5] ? n573 : n541;
    assign n670 = amount[5] ? n574 : n542;
    assign n671 = amount[5] ? n575 : n543;
    assign n672 = amount[5] ? n576 : n544;
    assign n673 = amount[5] ? n577 : n545;
    assign n674 = amount[5] ? n578 : n546;
    assign n675 = amount[5] ? n579 : n547;
    assign n676 = amount[5] ? n580 : n548;
    assign n677 = amount[5] ? n581 : n549;
    assign n678 = amount[5] ? n582 : n550;
    assign n679 = amount[5] ? n583 : n551;
    assign n680 = amount[5] ? n584 : n552;
    assign n681 = amount[5] ? n585 : n553;
    assign n682 = amount[5] ? n586 : n554;
    assign n683 = amount[5] ? n587 : n555;
    assign n684 = amount[5] ? n588 : n556;
    assign n685 = amount[5] ? n589 : n557;
    assign n686 = amount[5] ? n590 : n558;
    assign n687 = amount[5] ? n591 : n559;
    assign n688 = amount[5] ? n592 : n560;
    assign n689 = amount[5] ? n593 : n561;
    assign n690 = amount[5] ? n594 : n562;
    assign n691 = amount[5] ? n595 : n563;
    assign n692 = amount[5] ? n596 : n564;
    assign n693 = amount[5] ? n597 : n565;
    assign n694 = amount[5] ? n598 : n566;
    assign n695 = amount[5] ? n599 : n567;
    assign n696 = amount[5] ? n600 : n568;
    assign n697 = amount[5] ? n601 : n569;
    assign n698 = amount[5] ? n602 : n570;
    assign n699 = amount[5] ? n603 : n571;
    assign n700 = amount[5] ? n604 : n572;
    assign n701 = amount[5] ? n605 : n573;
    assign n702 = amount[5] ? n606 : n574;
    assign n703 = amount[5] ? n607 : n575;
    assign n704 = amount[5] ? n608 : n576;
    assign n705 = amount[5] ? n609 : n577;
    assign n706 = amount[5] ? n610 : n578;
    assign n707 = amount[5] ? n611 : n579;
    assign n708 = amount[5] ? n612 : n580;
    assign n709 = amount[5] ? n613 : n581;
    assign n710 = amount[5] ? n614 : n582;
    assign n711 = amount[5] ? n615 : n583;
    assign n712 = amount[5] ? n616 : n584;
    assign n713 = amount[5] ? n617 : n585;
    assign n714 = amount[5] ? n618 : n586;
    assign n715 = amount[5] ? n619 : n587;
    assign n716 = amount[5] ? n620 : n588;
    assign n717 = amount[5] ? n621 : n589;
    assign n718 = amount[5] ? n622 : n590;
    assign n719 = amount[5] ? n623 : n591;
    assign n720 = amount[5] ? n624 : n592;
    assign n721 = amount[5] ? n625 : n593;
    assign n722 = amount[5] ? n626 : n594;
    assign n723 = amount[5] ? n627 : n595;
    assign n724 = amount[5] ? n628 : n596;
    assign n725 = amount[5] ? n629 : n597;
    assign n726 = amount[5] ? n630 : n598;
    assign n727 = amount[5] ? n631 : n599;
    assign n728 = amount[5] ? n632 : n600;
    assign n729 = amount[5] ? n633 : n601;
    assign n730 = amount[5] ? n634 : n602;
    assign n731 = amount[5] ? n635 : n603;
    assign n732 = amount[5] ? n636 : n604;
    assign n733 = amount[5] ? n637 : n605;
    assign n734 = amount[5] ? n638 : n606;
    assign n735 = amount[5] ? n639 : n607;
    assign n736 = amount[5] ? n640 : n608;
    assign n737 = amount[5] ? cin : n609;
    assign n738 = amount[5] ? cin : n610;
    assign n739 = amount[5] ? cin : n611;
    assign n740 = amount[5] ? cin : n612;
    assign n741 = amount[5] ? cin : n613;
    assign n742 = amount[5] ? cin : n614;
    assign n743 = amount[5] ? cin : n615;
    assign n744 = amount[5] ? cin : n616;
    assign n745 = amount[5] ? cin : n617;
    assign n746 = amount[5] ? cin : n618;
    assign n747 = amount[5] ? cin : n619;
    assign n748 = amount[5] ? cin : n620;
    assign n749 = amount[5] ? cin : n621;
    assign n750 = amount[5] ? cin : n622;
    assign n751 = amount[5] ? cin : n623;
    assign n752 = amount[5] ? cin : n624;
    assign n753 = amount[5] ? cin : n625;
    assign n754 = amount[5] ? cin : n626;
    assign n755 = amount[5] ? cin : n627;
    assign n756 = amount[5] ? cin : n628;
    assign n757 = amount[5] ? cin : n629;
    assign n758 = amount[5] ? cin : n630;
    assign n759 = amount[5] ? cin : n631;
    assign n760 = amount[5] ? cin : n632;
    assign n761 = amount[5] ? cin : n633;
    assign n762 = amount[5] ? cin : n634;
    assign n763 = amount[5] ? cin : n635;
    assign n764 = amount[5] ? cin : n636;
    assign n765 = amount[5] ? cin : n637;
    assign n766 = amount[5] ? cin : n638;
    assign n767 = amount[5] ? cin : n639;
    assign n768 = amount[5] ? cin : n640;
    assign o[0] = amount[6] ? n705 : n641;
    assign o[1] = amount[6] ? n706 : n642;
    assign o[2] = amount[6] ? n707 : n643;
    assign o[3] = amount[6] ? n708 : n644;
    assign o[4] = amount[6] ? n709 : n645;
    assign o[5] = amount[6] ? n710 : n646;
    assign o[6] = amount[6] ? n711 : n647;
    assign o[7] = amount[6] ? n712 : n648;
    assign o[8] = amount[6] ? n713 : n649;
    assign o[9] = amount[6] ? n714 : n650;
    assign o[10] = amount[6] ? n715 : n651;
    assign o[11] = amount[6] ? n716 : n652;
    assign o[12] = amount[6] ? n717 : n653;
    assign o[13] = amount[6] ? n718 : n654;
    assign o[14] = amount[6] ? n719 : n655;
    assign o[15] = amount[6] ? n720 : n656;
    assign o[16] = amount[6] ? n721 : n657;
    assign o[17] = amount[6] ? n722 : n658;
    assign o[18] = amount[6] ? n723 : n659;
    assign o[19] = amount[6] ? n724 : n660;
    assign o[20] = amount[6] ? n725 : n661;
    assign o[21] = amount[6] ? n726 : n662;
    assign o[22] = amount[6] ? n727 : n663;
    assign o[23] = amount[6] ? n728 : n664;
    assign o[24] = amount[6] ? n729 : n665;
    assign o[25] = amount[6] ? n730 : n666;
    assign o[26] = amount[6] ? n731 : n667;
    assign o[27] = amount[6] ? n732 : n668;
    assign o[28] = amount[6] ? n733 : n669;
    assign o[29] = amount[6] ? n734 : n670;
    assign o[30] = amount[6] ? n735 : n671;
    assign o[31] = amount[6] ? n736 : n672;
    assign o[32] = amount[6] ? n737 : n673;
    assign o[33] = amount[6] ? n738 : n674;
    assign o[34] = amount[6] ? n739 : n675;
    assign o[35] = amount[6] ? n740 : n676;
    assign o[36] = amount[6] ? n741 : n677;
    assign o[37] = amount[6] ? n742 : n678;
    assign o[38] = amount[6] ? n743 : n679;
    assign o[39] = amount[6] ? n744 : n680;
    assign o[40] = amount[6] ? n745 : n681;
    assign o[41] = amount[6] ? n746 : n682;
    assign o[42] = amount[6] ? n747 : n683;
    assign o[43] = amount[6] ? n748 : n684;
    assign o[44] = amount[6] ? n749 : n685;
    assign o[45] = amount[6] ? n750 : n686;
    assign o[46] = amount[6] ? n751 : n687;
    assign o[47] = amount[6] ? n752 : n688;
    assign o[48] = amount[6] ? n753 : n689;
    assign o[49] = amount[6] ? n754 : n690;
    assign o[50] = amount[6] ? n755 : n691;
    assign o[51] = amount[6] ? n756 : n692;
    assign o[52] = amount[6] ? n757 : n693;
    assign o[53] = amount[6] ? n758 : n694;
    assign o[54] = amount[6] ? n759 : n695;
    assign o[55] = amount[6] ? n760 : n696;
    assign o[56] = amount[6] ? n761 : n697;
    assign o[57] = amount[6] ? n762 : n698;
    assign o[58] = amount[6] ? n763 : n699;
    assign o[59] = amount[6] ? n764 : n700;
    assign o[60] = amount[6] ? n765 : n701;
    assign o[61] = amount[6] ? n766 : n702;
    assign o[62] = amount[6] ? n767 : n703;
    assign o[63] = amount[6] ? n768 : n704;
    assign o[64] = amount[6] ? cin : n705;
    assign o[65] = amount[6] ? cin : n706;
    assign o[66] = amount[6] ? cin : n707;
    assign o[67] = amount[6] ? cin : n708;
    assign o[68] = amount[6] ? cin : n709;
    assign o[69] = amount[6] ? cin : n710;
    assign o[70] = amount[6] ? cin : n711;
    assign o[71] = amount[6] ? cin : n712;
    assign o[72] = amount[6] ? cin : n713;
    assign o[73] = amount[6] ? cin : n714;
    assign o[74] = amount[6] ? cin : n715;
    assign o[75] = amount[6] ? cin : n716;
    assign o[76] = amount[6] ? cin : n717;
    assign o[77] = amount[6] ? cin : n718;
    assign o[78] = amount[6] ? cin : n719;
    assign o[79] = amount[6] ? cin : n720;
    assign o[80] = amount[6] ? cin : n721;
    assign o[81] = amount[6] ? cin : n722;
    assign o[82] = amount[6] ? cin : n723;
    assign o[83] = amount[6] ? cin : n724;
    assign o[84] = amount[6] ? cin : n725;
    assign o[85] = amount[6] ? cin : n726;
    assign o[86] = amount[6] ? cin : n727;
    assign o[87] = amount[6] ? cin : n728;
    assign o[88] = amount[6] ? cin : n729;
    assign o[89] = amount[6] ? cin : n730;
    assign o[90] = amount[6] ? cin : n731;
    assign o[91] = amount[6] ? cin : n732;
    assign o[92] = amount[6] ? cin : n733;
    assign o[93] = amount[6] ? cin : n734;
    assign o[94] = amount[6] ? cin : n735;
    assign o[95] = amount[6] ? cin : n736;
    assign o[96] = amount[6] ? cin : n737;
    assign o[97] = amount[6] ? cin : n738;
    assign o[98] = amount[6] ? cin : n739;
    assign o[99] = amount[6] ? cin : n740;
    assign o[100] = amount[6] ? cin : n741;
    assign o[101] = amount[6] ? cin : n742;
    assign o[102] = amount[6] ? cin : n743;
    assign o[103] = amount[6] ? cin : n744;
    assign o[104] = amount[6] ? cin : n745;
    assign o[105] = amount[6] ? cin : n746;
    assign o[106] = amount[6] ? cin : n747;
    assign o[107] = amount[6] ? cin : n748;
    assign o[108] = amount[6] ? cin : n749;
    assign o[109] = amount[6] ? cin : n750;
    assign o[110] = amount[6] ? cin : n751;
    assign o[111] = amount[6] ? cin : n752;
    assign o[112] = amount[6] ? cin : n753;
    assign o[113] = amount[6] ? cin : n754;
    assign o[114] = amount[6] ? cin : n755;
    assign o[115] = amount[6] ? cin : n756;
    assign o[116] = amount[6] ? cin : n757;
    assign o[117] = amount[6] ? cin : n758;
    assign o[118] = amount[6] ? cin : n759;
    assign o[119] = amount[6] ? cin : n760;
    assign o[120] = amount[6] ? cin : n761;
    assign o[121] = amount[6] ? cin : n762;
    assign o[122] = amount[6] ? cin : n763;
    assign o[123] = amount[6] ? cin : n764;
    assign o[124] = amount[6] ? cin : n765;
    assign o[125] = amount[6] ? cin : n766;
    assign o[126] = amount[6] ? cin : n767;
    assign o[127] = amount[6] ? cin : n768;
    
endmodule

//
// Verilog Description of OPERATOR shift_left_16u_4u
//

module shift_left_16u_4u (cin, a, amount, o);
    input cin;
    input [15:0]a;
    input [3:0]amount;
    output [15:0]o;
    
    
    wire n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, 
        n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, 
        n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, 
        n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, 
        n42, n43, n44, n45, n46, n47, n48;
    
    assign n1 = amount[0] ? a[14] : a[15];
    assign n2 = amount[0] ? a[13] : a[14];
    assign n3 = amount[0] ? a[12] : a[13];
    assign n4 = amount[0] ? a[11] : a[12];
    assign n5 = amount[0] ? a[10] : a[11];
    assign n6 = amount[0] ? a[9] : a[10];
    assign n7 = amount[0] ? a[8] : a[9];
    assign n8 = amount[0] ? a[7] : a[8];
    assign n9 = amount[0] ? a[6] : a[7];
    assign n10 = amount[0] ? a[5] : a[6];
    assign n11 = amount[0] ? a[4] : a[5];
    assign n12 = amount[0] ? a[3] : a[4];
    assign n13 = amount[0] ? a[2] : a[3];
    assign n14 = amount[0] ? a[1] : a[2];
    assign n15 = amount[0] ? a[0] : a[1];
    assign n16 = amount[0] ? cin : a[0];
    assign n17 = amount[1] ? n3 : n1;
    assign n18 = amount[1] ? n4 : n2;
    assign n19 = amount[1] ? n5 : n3;
    assign n20 = amount[1] ? n6 : n4;
    assign n21 = amount[1] ? n7 : n5;
    assign n22 = amount[1] ? n8 : n6;
    assign n23 = amount[1] ? n9 : n7;
    assign n24 = amount[1] ? n10 : n8;
    assign n25 = amount[1] ? n11 : n9;
    assign n26 = amount[1] ? n12 : n10;
    assign n27 = amount[1] ? n13 : n11;
    assign n28 = amount[1] ? n14 : n12;
    assign n29 = amount[1] ? n15 : n13;
    assign n30 = amount[1] ? n16 : n14;
    assign n31 = amount[1] ? cin : n15;
    assign n32 = amount[1] ? cin : n16;
    assign n33 = amount[2] ? n21 : n17;
    assign n34 = amount[2] ? n22 : n18;
    assign n35 = amount[2] ? n23 : n19;
    assign n36 = amount[2] ? n24 : n20;
    assign n37 = amount[2] ? n25 : n21;
    assign n38 = amount[2] ? n26 : n22;
    assign n39 = amount[2] ? n27 : n23;
    assign n40 = amount[2] ? n28 : n24;
    assign n41 = amount[2] ? n29 : n25;
    assign n42 = amount[2] ? n30 : n26;
    assign n43 = amount[2] ? n31 : n27;
    assign n44 = amount[2] ? n32 : n28;
    assign n45 = amount[2] ? cin : n29;
    assign n46 = amount[2] ? cin : n30;
    assign n47 = amount[2] ? cin : n31;
    assign n48 = amount[2] ? cin : n32;
    assign o[15] = amount[3] ? n41 : n33;
    assign o[14] = amount[3] ? n42 : n34;
    assign o[13] = amount[3] ? n43 : n35;
    assign o[12] = amount[3] ? n44 : n36;
    assign o[11] = amount[3] ? n45 : n37;
    assign o[10] = amount[3] ? n46 : n38;
    assign o[9] = amount[3] ? n47 : n39;
    assign o[8] = amount[3] ? n48 : n40;
    assign o[7] = amount[3] ? cin : n41;
    assign o[6] = amount[3] ? cin : n42;
    assign o[5] = amount[3] ? cin : n43;
    assign o[4] = amount[3] ? cin : n44;
    assign o[3] = amount[3] ? cin : n45;
    assign o[2] = amount[3] ? cin : n46;
    assign o[1] = amount[3] ? cin : n47;
    assign o[0] = amount[3] ? cin : n48;
    
endmodule

//
// Verilog Description of module \isp8(FAMILY_NAME="XO2",PROM_FILE="prom_init.hex",PORT_AW=8,EXT_AW=24,PROM_AW=10,PROM_AD=1024,REGISTERS_16=0,PGM_STACK_AW=4,PGM_STACK_AD=16) 
//

module \isp8(FAMILY_NAME="XO2",PROM_FILE="prom_init.hex",PORT_AW=8,EXT_AW=24,PROM_AW=10,PROM_AD=1024,REGISTERS_16=0,PGM_STACK_AW=4,PGM_STACK_AD=16)  (clk, 
            rst_n, ext_io_din, ext_io_ready, intr, ext_addr, ext_addr_cyc, 
            ext_io_dout, ext_io_wr, ext_io_rd, intr_ack) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(46[8:12])
    input clk;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(69[21:24])
    input rst_n;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(70[21:26])
    input [7:0]ext_io_din;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(72[21:31])
    input ext_io_ready;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(71[21:33])
    input intr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(73[21:25])
    output [23:0]ext_addr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(75[21:29])
    output ext_addr_cyc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(76[21:33])
    output [7:0]ext_io_dout;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(77[21:32])
    output ext_io_wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(78[21:30])
    output ext_io_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(79[21:30])
    output intr_ack;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(80[21:29])
    
    wire [7:0]ext_mem_din;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(85[21:32])
    wire ext_mem_wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(86[21:31])
    wire ext_mem_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(87[21:31])
    
    wire n4, n5;
    
    \isp8_core(FAMILY_NAME="XO2",PROM_FILE="prom_init.hex",PORT_AW=8,EXT_AW=24,PROM_AW=10,PROM_AD=1024,REGISTERS_16=0,PGM_STACK_AW=4,PGM_STACK_AD=16)  u1_isp8 (.clk(clk), 
            .rst_n(rst_n), .ext_mem_din({ext_mem_din}), .ext_mem_ready(n5), 
            .ext_io_din({ext_io_din}), .intr(intr), .ext_addr({ext_addr}), 
            .ext_addr_cyc(ext_addr_cyc), .ext_dout({ext_io_dout}), .ext_mem_wr(ext_mem_wr), 
            .ext_mem_rd(ext_mem_rd), .ext_io_wr(ext_io_wr), .ext_io_rd(ext_io_rd), 
            .intr_ack(intr_ack));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(103[18] 119[19])
    or (n4, ext_io_ready, ext_mem_wr) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(109[35:61])
    or (n5, n4, ext_mem_rd) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(109[35:75])
    pmi_distributed_spram U2_scratchpad (.Address({ext_addr[4:0]}), .Data({ext_io_dout}), 
            .Clock(clk), .ClockEn(1'b1), .WE(ext_mem_wr), .Reset(1'b0), 
            .Q({ext_mem_din}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(130[22] 139[20])
    defparam U2_scratchpad.pmi_addr_depth = 32;
    defparam U2_scratchpad.pmi_addr_width = 5;
    defparam U2_scratchpad.pmi_data_width = 8;
    defparam U2_scratchpad.pmi_regmode = "reg";
    defparam U2_scratchpad.pmi_init_file = "none";
    defparam U2_scratchpad.pmi_init_file_format = "binary";
    defparam U2_scratchpad.pmi_family = "EC";
    defparam U2_scratchpad.module_type = "pmi_distributed_spram";
    
endmodule

//
// Verilog Description of module \isp8_core(FAMILY_NAME="XO2",PROM_FILE="prom_init.hex",PORT_AW=8,EXT_AW=24,PROM_AW=10,PROM_AD=1024,REGISTERS_16=0,PGM_STACK_AW=4,PGM_STACK_AD=16) 
//

module \isp8_core(FAMILY_NAME="XO2",PROM_FILE="prom_init.hex",PORT_AW=8,EXT_AW=24,PROM_AW=10,PROM_AD=1024,REGISTERS_16=0,PGM_STACK_AW=4,PGM_STACK_AD=16)  (clk, 
            rst_n, ext_mem_din, ext_mem_ready, ext_io_din, intr, ext_addr, 
            ext_addr_cyc, ext_dout, ext_mem_wr, ext_mem_rd, ext_io_wr, 
            ext_io_rd, intr_ack) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(42[8:17])
    input clk;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(71[30:33])
    input rst_n;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(72[30:35])
    input [7:0]ext_mem_din;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(73[30:41])
    input ext_mem_ready;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(74[30:43])
    input [7:0]ext_io_din;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(75[30:40])
    input intr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(76[30:34])
    output [23:0]ext_addr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(78[30:38])
    output ext_addr_cyc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(79[30:42])
    output [7:0]ext_dout;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(80[30:38])
    output ext_mem_wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(81[30:40])
    output ext_mem_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(82[30:40])
    output ext_io_wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(83[30:39])
    output ext_io_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(84[30:39])
    output intr_ack;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(85[30:38])
    
    wire [17:0]instr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(92[30:35])
    wire imi_instr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(93[30:39])
    wire sub;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(93[41:44])
    wire subc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(93[46:50])
    wire add;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(93[52:55])
    wire addc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(93[57:61])
    wire mov;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(93[63:66])
    wire andr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(94[30:34])
    wire orr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(94[36:39])
    wire xorr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(94[41:45])
    wire cmp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(94[47:50])
    wire ror1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(94[58:62])
    wire rorc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(94[64:68])
    wire rol1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(95[30:34])
    wire rolc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(95[36:40])
    wire clrc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(95[42:46])
    wire setc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(95[48:52])
    wire clrz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(95[54:58])
    wire setz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(95[60:64])
    wire clri;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(96[30:34])
    wire seti;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(96[36:40])
    wire bz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(96[42:44])
    wire bnz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(96[46:49])
    wire bc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(96[51:53])
    wire bnc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(96[55:58])
    wire b;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(96[60:61])
    wire callz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(97[30:35])
    wire callnz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(97[37:43])
    wire callc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(97[45:50])
    wire callnc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(97[52:58])
    wire call;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(97[60:64])
    wire ret;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(98[30:33])
    wire iret;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(98[35:39])
    wire export;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(98[41:47])
    wire import;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(98[49:55])
    wire exporti;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(98[57:64])
    wire importi;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(98[66:73])
    wire ssp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(99[30:33])
    wire lsp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(99[35:38])
    wire sspi;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(99[40:44])
    wire lspi;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(99[46:50])
    wire [4:0]addr_rb;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(100[30:37])
    wire [4:0]addr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(101[30:37])
    wire [7:0]imi_data;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(102[30:38])
    wire [9:0]addr_jmp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(103[30:38])
    wire update_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(104[30:38])
    wire update_z;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(104[39:47])
    wire [7:0]dout_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(105[30:37])
    wire [7:0]dout_rb;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(106[30:37])
    wire carry_flag;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(107[30:40])
    wire [7:0]dout_alu;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(108[30:38])
    wire cout_alu;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(109[30:38])
    wire addr_cyc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(110[30:38])
    wire data_cyc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(112[30:38])
    wire [9:0]prom_addr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(113[30:39])
    wire prom_enable;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(114[30:41])
    wire wren_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(115[30:37])
    wire wren_alu_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(117[30:41])
    wire wren_il_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(118[30:40])
    wire [7:0]din_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(119[30:36])
    wire [7:0]din_rd1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(119[38:45])
    wire rst_n_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(122[30:39])
    
    wire n5, n143, n145;
    wire [7:0]n146;
    
    wire n165, n166, n167, n168;
    wire [7:0]n169;
    
    wire n205, n206, n207, n208, n209, n210, n211, n212, n213, 
        n214, n215, n217, n218, n232, n233;
    wire [7:0]n234;
    
    wire n252;
    
    not (n5, rst_n) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(133[14:20])
    wide_dffrs_8 page_ptr1_c (.d({n146}), .set({8'b00000000}), .reset({n165, 
            n165, n165, n165, n165, n165, n165, n165}), .clock(clk), 
            .q({ext_addr[15:8]}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(334[18] 337[39])
    \isp8_idec(PROM_AW=10)  u1_isp8_idec (.instr({instr}), .imi_instr(imi_instr), 
            .sub(sub), .subc(subc), .add(add), .addc(addc), .mov(mov), 
            .andr(andr), .orr(orr), .xorr(xorr), .cmp(cmp), .ror1(ror1), 
            .rorc(rorc), .rol1(rol1), .rolc(rolc), .clrc(clrc), .setc(setc), 
            .clrz(clrz), .setz(setz), .clri(clri), .seti(seti), .bz(bz), 
            .bnz(bnz), .bc(bc), .bnc(bnc), .b(b), .callz(callz), .callnz(callnz), 
            .callc(callc), .callnc(callnc), .call(call), .ret(ret), 
            .iret(iret), .export(export), .import(import), .exporti(exporti), 
            .importi(importi), .ssp(ssp), .lsp(lsp), .sspi(sspi), .lspi(lspi), 
            .addr_rb({addr_rb}), .addr_rd({addr_rd}), .imi_data({imi_data}), 
            .addr_jmp({addr_jmp}), .update_c(update_c), .update_z(update_z));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(156[19] 206[9])
    \isp8_alu(FAMILY_NAME="XO2")  u1_isp8_alu (.instr({instr}), .dout_rd({dout_rd}), 
            .dout_rb({dout_rb}), .imi_data({imi_data}), .imi_instr(imi_instr), 
            .carry_flag(carry_flag), .sub(sub), .subc(subc), .addc(addc), 
            .cmp(cmp), .dout_alu({dout_alu}), .cout_alu(cout_alu));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(211[18] 225[9])
    \isp8_flow_cntl(PGM_STACK_AW=4,PGM_STACK_AD=16,PROM_AW=10,FAMILY_NAME="XO2")  u1_isp8_flow_cntl (.clk(clk), 
            .rst_n(rst_n_reg), .setc(setc), .clrc(clrc), .setz(setz), 
            .clrz(clrz), .seti(seti), .clri(clri), .addr_jmp({addr_jmp}), 
            .update_c(update_c), .update_z(update_z), .cout_alu(cout_alu), 
            .dout_alu({dout_alu}), .bz(bz), .bnz(bnz), .bc(bc), .bnc(bnc), 
            .b(b), .callz(callz), .callnz(callnz), .callc(callc), .callnc(callnc), 
            .call(call), .ret(ret), .iret(iret), .intr(intr), .lsp(lsp), 
            .lspi(lspi), .ssp(ssp), .sspi(sspi), .import(import), .importi(importi), 
            .export(export), .exporti(exporti), .ready(ext_mem_ready), 
            .addr_cyc(addr_cyc), .ext_addr_cyc(ext_addr_cyc), .data_cyc(data_cyc), 
            .prom_addr({prom_addr}), .prom_enable(prom_enable), .carry_flag(carry_flag), 
            .intr_ack(intr_ack));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(234[23] 278[9])
    \isp8_io_cntl(PORT_AW=8)  u1_isp8_io_cntl (.clk(clk), .rst_n(rst_n_reg), 
            .import(import), .importi(importi), .export(export), .exporti(exporti), 
            .ssp(ssp), .sspi(sspi), .lsp(lsp), .lspi(lspi), .addr_cyc(addr_cyc), 
            .ext_addr_cyc(ext_addr_cyc), .addr_rb({addr_rb}), .dout_rd({dout_rd}), 
            .dout_rb({dout_rb}), .ext_addr({ext_addr[7:0]}), .ext_dout({ext_dout}), 
            .ext_mem_wr(ext_mem_wr), .ext_mem_rd(ext_mem_rd), .ext_io_wr(ext_io_wr), 
            .ext_io_rd(ext_io_rd));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(284[21] 307[9])
    pmi_rom u1_isp8_prom (.Address({prom_addr}), .OutClock(clk), .OutClockEn(prom_enable), 
            .Reset(1'b0), .Q({instr}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(320[16] 327[9])
    defparam u1_isp8_prom.pmi_addr_depth = 512;
    defparam u1_isp8_prom.pmi_addr_width = 9;
    defparam u1_isp8_prom.pmi_data_width = 8;
    defparam u1_isp8_prom.pmi_regmode = "reg";
    defparam u1_isp8_prom.pmi_gsr = "disable";
    defparam u1_isp8_prom.pmi_resetmode = "sync";
    defparam u1_isp8_prom.pmi_optimization = "speed";
    defparam u1_isp8_prom.pmi_init_file = "none";
    defparam u1_isp8_prom.pmi_init_file_format = "binary";
    defparam u1_isp8_prom.pmi_family = "EC";
    defparam u1_isp8_prom.module_type = "pmi_rom";
    equal_5 equal_8 (.a({addr_rd}), .b({5'b01110}), .o(n143));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(334[22:40])
    and (n145, n143, n167) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(334[22:61])
    mux_8 mux_11 (.d0({ext_addr[15:8]}), .d1({din_rd}), .cond(n145), .o({n146}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(337[16:39])
    wide_dffrs_8 page_ptr2_c (.d({n169}), .set({8'b00000000}), .reset({n165, 
            n165, n165, n165, n165, n165, n165, n165}), .clock(clk), 
            .q({ext_addr[23:16]}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(346[18] 349[39])
    not (n165, rst_n_reg) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(344[17:27])
    equal_5 equal_15 (.a({addr_rd}), .b({5'b01111}), .o(n166));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(346[22:40])
    equal_1 equal_16 (.a({wren_rd}), .b({1'b1}), .o(n167));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(346[44:61])
    and (n168, n166, n167) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(346[22:61])
    mux_8 mux_18 (.d0({ext_addr[23:16]}), .d1({din_rd}), .cond(n168), 
          .o({n169}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(349[16:39])
    VERIFIC_DFFRS wren_alu_rd_51 (.d(n215), .clk(clk), .s(1'b0), .r(n165), 
            .q(wren_alu_rd));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(458[15] 462[13])
    pmi_distributed_dpram u1_isp8_rfmem (.WrAddress({addr_rd}), .Data({din_rd}), 
            .WrClock(clk), .WE(wren_rd), .WrClockEn(1'b1), .RdAddress({addr_rb}), 
            .RdClock(clk), .RdClockEn(1'b1), .Reset(1'b0), .Q({dout_rb}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(386[34] 398[12])
    defparam u1_isp8_rfmem.pmi_addr_depth = 32;
    defparam u1_isp8_rfmem.pmi_addr_width = 5;
    defparam u1_isp8_rfmem.pmi_data_width = 8;
    defparam u1_isp8_rfmem.pmi_regmode = "reg";
    defparam u1_isp8_rfmem.pmi_init_file = "none";
    defparam u1_isp8_rfmem.pmi_init_file_format = "binary";
    defparam u1_isp8_rfmem.pmi_family = "EC";
    defparam u1_isp8_rfmem.module_type = "pmi_distributed_dpram";
    pmi_distributed_dpram u2_isp8_rfmem (.WrAddress({addr_rd}), .Data({din_rd}), 
            .WrClock(clk), .WE(wren_rd), .WrClockEn(1'b1), .RdAddress({addr_rd}), 
            .RdClock(clk), .RdClockEn(1'b1), .Reset(1'b0), .Q({dout_rd}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(434[34] 446[12])
    defparam u2_isp8_rfmem.pmi_addr_depth = 32;
    defparam u2_isp8_rfmem.pmi_addr_width = 5;
    defparam u2_isp8_rfmem.pmi_data_width = 8;
    defparam u2_isp8_rfmem.pmi_regmode = "reg";
    defparam u2_isp8_rfmem.pmi_init_file = "none";
    defparam u2_isp8_rfmem.pmi_init_file_format = "binary";
    defparam u2_isp8_rfmem.pmi_family = "EC";
    defparam u2_isp8_rfmem.module_type = "pmi_distributed_dpram";
    or (n205, add, addc) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(459[29:39])
    or (n206, n205, sub) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(459[29:45])
    or (n207, n206, subc) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(459[29:52])
    or (n208, n207, mov) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(459[29:58])
    or (n209, n208, andr) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(459[29:65])
    or (n210, n209, orr) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(459[29] 460[32])
    or (n211, n210, xorr) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(459[29] 460[39])
    or (n212, n211, ror1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(459[29] 460[46])
    or (n213, n212, rorc) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(459[29] 460[53])
    or (n214, n213, rol1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(459[29] 460[60])
    or (n215, n214, rolc) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(459[28] 460[68])
    or (n217, n233, lsp) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(461[29:51])
    or (n218, n217, lspi) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(461[28:59])
    VERIFIC_DFFRS wren_il_rd_52 (.d(n218), .clk(clk), .s(1'b0), .r(n165), 
            .q(wren_il_rd));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(458[15] 462[13])
    wide_dffrs_8 din_rd1_c (.d({dout_alu}), .set({8'b00000000}), .reset({n165, 
            n165, n165, n165, n165, n165, n165, n165}), .clock(clk), 
            .q({din_rd1}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(470[13:33])
    or (n232, lspi, lsp) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(475[14:23])
    or (n233, import, importi) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(477[19:35])
    mux_8 mux_43 (.d0({din_rd1}), .d1({ext_io_din}), .cond(n233), .o({n234}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(480[13:31])
    mux_8 mux_44 (.d0({n234}), .d1({ext_mem_din}), .cond(n232), .o({din_rd}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(477[15] 480[31])
    or (n252, wren_alu_rd, wren_il_rd) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(482[22:48])
    and (wren_rd, n252, data_cyc) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(482[21:60])
    VERIFIC_DFFRS rst_n_reg_48 (.d(rst_n), .clk(clk), .s(1'b0), .r(n5), 
            .q(rst_n_reg));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(136[13:35])
    
endmodule

//
// Verilog Description of module \isp8_idec(PROM_AW=10) 
//

module \isp8_idec(PROM_AW=10)  (instr, imi_instr, sub, subc, add, 
            addc, mov, andr, orr, xorr, cmp, test, ror1, rorc, 
            rol1, rolc, clrc, setc, clrz, setz, clri, seti, 
            bz, bnz, bc, bnc, b, callz, callnz, callc, callnc, 
            call, ret, iret, export, import, exporti, importi, 
            ssp, lsp, sspi, lspi, addr_rb, addr_rd, imi_data, 
            addr_jmp, update_c, update_z) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(40[8:17])
    input [17:0]instr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    output imi_instr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(109[14:23])
    output sub;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(110[14:17])
    output subc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(111[14:18])
    output add;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(112[14:17])
    output addc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(113[14:18])
    output mov;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(114[14:17])
    output andr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(115[14:18])
    output orr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(116[14:17])
    output xorr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(117[14:18])
    output cmp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(118[14:17])
    output test;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(119[14:18])
    output ror1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(120[14:18])
    output rorc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(121[14:18])
    output rol1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(122[14:18])
    output rolc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(123[14:18])
    output clrc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(124[14:18])
    output setc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(125[14:18])
    output clrz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(126[14:18])
    output setz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(127[14:18])
    output clri;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(128[14:18])
    output seti;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(129[14:18])
    output bz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(130[14:16])
    output bnz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(131[14:17])
    output bc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(132[14:16])
    output bnc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(133[14:17])
    output b;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(134[14:15])
    output callz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(135[14:19])
    output callnz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(136[14:20])
    output callc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(137[14:19])
    output callnc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(138[14:20])
    output call;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(139[14:18])
    output ret;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(140[14:17])
    output iret;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(141[14:18])
    output export;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(142[14:20])
    output import;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(143[14:20])
    output exporti;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(144[14:21])
    output importi;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(145[14:21])
    output ssp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(146[14:17])
    output lsp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(147[14:17])
    output sspi;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(148[14:18])
    output lspi;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(149[14:18])
    output [4:0]addr_rb;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(151[24:31])
    output [4:0]addr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(152[24:31])
    output [7:0]imi_data;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(153[24:32])
    output [9:0]addr_jmp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(154[23:31])
    output update_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(155[24:32])
    output update_z;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(156[24:32])
    
    wire instr_l1_0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(158[6:16])
    wire instr_l1_1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(158[18:28])
    wire instr_l1_2;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(158[30:40])
    wire instr_l1_3;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(158[42:52])
    wire instr_l2_0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(159[6:16])
    wire instr_l2_1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(159[18:28])
    wire instr_l2_2;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(159[30:40])
    wire instr_l2_3;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(159[42:52])
    wire instr_l3_0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(160[6:16])
    wire instr_l4_0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(161[6:16])
    wire instr_l6_0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(163[6:16])
    wire instr_l7_0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(164[6:16])
    wire instr_l7_1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(164[18:28])
    wire instr_l7_2;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(164[30:40])
    wire instr_l7_3;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(164[42:52])
    wire ro;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(165[6:8])
    wire sc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(166[6:8])
    wire br0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(167[6:9])
    wire ca0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(168[6:9])
    wire ca1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(168[11:14])
    wire iels;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(170[6:10])
    wire iels_ie;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(171[6:13])
    wire iels_ls;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(172[6:13])
    
    wire n4, n5, n12, n13, n31, n32, n49, n55, n57, n65, 
        n82, n86, n91, n95, n101, n107, n109, n110, n111, 
        n112, n115, n116, n117, n118, n119;
    
    assign imi_instr = instr[13];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    assign addr_rd[4] = instr[12];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    assign addr_rd[3] = instr[11];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    assign addr_rd[2] = instr[10];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    assign addr_jmp[9] = instr[9];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    assign addr_jmp[8] = instr[8];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    assign addr_jmp[7] = instr[7];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    assign addr_jmp[6] = instr[6];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    assign addr_jmp[5] = instr[5];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    assign addr_jmp[4] = instr[4];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    assign addr_jmp[3] = instr[3];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    assign addr_jmp[2] = instr[2];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    assign addr_jmp[1] = instr[1];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    assign addr_jmp[0] = instr[0];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(107[14:19])
    assign addr_rb[4] = addr_jmp[7];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(151[24:31])
    assign addr_rb[3] = addr_jmp[6];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(151[24:31])
    assign addr_rb[2] = addr_jmp[5];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(151[24:31])
    assign addr_rb[1] = addr_jmp[4];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(151[24:31])
    assign addr_rb[0] = addr_jmp[3];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(151[24:31])
    assign addr_rd[1] = addr_jmp[9];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(152[24:31])
    assign addr_rd[0] = addr_jmp[8];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(152[24:31])
    assign imi_data[7] = addr_jmp[7];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(153[24:32])
    assign imi_data[6] = addr_jmp[6];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(153[24:32])
    assign imi_data[5] = addr_jmp[5];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(153[24:32])
    assign imi_data[4] = addr_jmp[4];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(153[24:32])
    assign imi_data[3] = addr_jmp[3];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(153[24:32])
    assign imi_data[2] = addr_jmp[2];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(153[24:32])
    assign imi_data[1] = addr_jmp[1];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(153[24:32])
    assign imi_data[0] = addr_jmp[0];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(153[24:32])
    not (n4, instr[17]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(175[22:32])
    not (n5, instr[16]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(175[35:45])
    and (instr_l1_0, n4, n5) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(175[21:46])
    and (instr_l1_1, n4, instr[16]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(176[21:45])
    and (instr_l1_2, instr[17], n5) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(177[21:45])
    and (instr_l1_3, instr[17], instr[16]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(178[21:44])
    not (n12, instr[15]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(181[22:32])
    not (n13, instr[14]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(181[35:45])
    and (instr_l2_0, n12, n13) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(181[21:46])
    and (instr_l2_1, n12, instr[14]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(182[21:45])
    and (instr_l2_2, instr[15], n13) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(183[21:45])
    and (instr_l2_3, instr[15], instr[14]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(184[21:44])
    not (instr_l3_0, imi_instr) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(187[21:31])
    not (instr_l4_0, addr_rd[4]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(191[21:31])
    not (instr_l6_0, addr_jmp[2]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(201[21:30])
    not (n31, addr_jmp[1]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(205[22:31])
    not (n32, addr_jmp[0]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(205[34:43])
    and (instr_l7_0, n31, n32) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(205[21:44])
    and (instr_l7_1, n31, addr_jmp[0]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(206[21:43])
    and (instr_l7_2, addr_jmp[1], n32) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(207[21:43])
    and (instr_l7_3, addr_jmp[1], addr_jmp[0]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(208[21:42])
    and (sub, instr_l1_0, instr_l2_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(214[16:39])
    and (subc, instr_l1_0, instr_l2_1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(215[16:39])
    and (add, instr_l1_0, instr_l2_2) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(218[16:39])
    and (addc, instr_l1_0, instr_l2_3) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(219[17:40])
    and (mov, instr_l1_1, instr_l2_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(222[15:38])
    and (andr, instr_l1_1, instr_l2_1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(225[15:38])
    and (orr, instr_l1_1, instr_l2_2) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(226[15:38])
    and (xorr, instr_l1_1, instr_l2_3) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(227[15:38])
    and (cmp, instr_l1_2, instr_l2_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(230[16:39])
    and (test, instr_l1_2, instr_l2_1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(231[16:39])
    and (n49, instr_l1_2, instr_l2_2) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(234[16:39])
    and (ro, n49, instr_l3_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(234[16:52])
    and (ror1, ro, instr_l7_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(235[16:31])
    and (rorc, ro, instr_l7_2) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(236[16:31])
    and (rol1, ro, instr_l7_1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(237[16:31])
    and (rolc, ro, instr_l7_3) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(238[16:31])
    and (n55, instr_l1_2, instr_l2_3) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(241[16:39])
    and (sc, n55, instr_l3_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(241[16:52])
    and (n57, sc, instr_l6_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(242[16:31])
    and (clrc, n57, instr_l7_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(242[16:44])
    and (setc, n57, instr_l7_1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(243[16:44])
    and (clrz, n57, instr_l7_2) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(244[16:44])
    and (setz, n57, instr_l7_3) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(245[16:44])
    and (n65, sc, addr_jmp[2]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(246[16:31])
    and (clri, n65, instr_l7_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(246[16:44])
    and (seti, n65, instr_l7_1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(247[16:44])
    and (iels, n55, imi_instr) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(250[18:54])
    and (iels_ie, iels, instr_l6_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(251[18:35])
    and (export, iels_ie, instr_l7_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(252[18:38])
    and (import, iels_ie, instr_l7_1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(253[18:38])
    and (exporti, iels_ie, instr_l7_2) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(254[18:38])
    and (importi, iels_ie, instr_l7_3) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(255[18:38])
    and (iels_ls, iels, addr_jmp[2]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(258[18:35])
    and (ssp, iels_ls, instr_l7_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(259[18:38])
    and (lsp, iels_ls, instr_l7_1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(260[18:38])
    and (sspi, iels_ls, instr_l7_2) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(261[18:38])
    and (lspi, iels_ls, instr_l7_3) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(262[18:38])
    and (br0, instr_l1_3, instr_l2_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(265[16:39])
    and (n82, br0, instr_l3_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(266[16:32])
    and (bz, n82, instr_l4_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(266[16:45])
    and (bnz, n82, addr_rd[4]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(267[16:45])
    and (n86, br0, imi_instr) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(268[16:32])
    and (bc, n86, instr_l4_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(268[16:45])
    and (bnc, n86, addr_rd[4]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(269[16:45])
    and (ca0, instr_l1_3, instr_l2_1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(273[17:40])
    and (n91, ca0, instr_l3_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(274[17:33])
    and (callz, n91, instr_l4_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(274[17:46])
    and (callnz, n91, addr_rd[4]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(275[17:46])
    and (n95, ca0, imi_instr) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(276[17:33])
    and (callc, n95, instr_l4_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(276[17:46])
    and (callnc, n95, addr_rd[4]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(277[17:46])
    and (ca1, instr_l1_3, instr_l2_2) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(281[16:39])
    and (n101, ca1, instr_l3_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(282[16:32])
    and (call, n101, instr_l4_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(282[16:45])
    and (ret, n101, addr_rd[4]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(283[16:44])
    and (iret, n107, instr_l4_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(284[16:44])
    and (n107, ca1, imi_instr) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(285[16:32])
    and (b, n107, addr_rd[4]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(285[16:45])
    not (n109, instr_l2_3) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(310[48:59])
    and (n110, instr_l1_2, n109) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(310[35:59])
    and (n111, n110, addr_jmp[1]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(310[33:71])
    or (n112, instr_l1_0, n111) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(310[20:71])
    or (update_c, n112, cmp) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(310[19:100])
    not (n115, instr_l2_0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(313[34:45])
    and (n116, instr_l1_1, n115) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(313[20:46])
    or (n117, instr_l1_0, n116) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(312[20] 313[46])
    or (n118, n117, ro) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(312[20] 314[22])
    or (n119, n118, cmp) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(312[20] 315[23])
    or (update_z, n119, test) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(312[19] 316[25])
    
endmodule

//
// Verilog Description of module \isp8_alu(FAMILY_NAME="XO2") 
//

module \isp8_alu(FAMILY_NAME="XO2")  (instr, dout_rd, dout_rb, imi_data, 
            imi_instr, carry_flag, sub, subc, addc, cmp, dout_alu, 
            cout_alu) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(41[8:16])
    input [17:0]instr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(45[18:23])
    input [7:0]dout_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(46[18:25])
    input [7:0]dout_rb;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(47[18:25])
    input [7:0]imi_data;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(48[18:26])
    input imi_instr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(49[18:27])
    input carry_flag;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(50[18:28])
    input sub;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(51[18:21])
    input subc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(52[18:22])
    input addc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(53[18:22])
    input cmp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(54[18:21])
    output [7:0]dout_alu;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(55[18:26])
    output cout_alu;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(56[18:26])
    
    wire [7:0]dout_l;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(59[18:24])
    wire cout_r;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(60[18:24])
    wire [7:0]dout_r;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(61[18:24])
    wire [7:0]data_rb_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(63[18:29])
    wire [7:0]data_add;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(65[18:26])
    wire carry_add_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(66[18:31])
    wire carry_add;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(67[18:27])
    wire adsu_ci;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(68[18:25])
    wire add_sel;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(69[18:25])
    wire add_sel_inv;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(70[18:29])
    wire adsu_ci_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(71[18:29])
    
    wire n4, n7, n32, n33;
    wire [7:0]n34;
    
    wire n43;
    wire [7:0]n44;
    wire [7:0]n53;
    wire [7:0]n62;
    wire [7:0]n71;
    
    wire n89, n90, n91, n92, n93;
    wire [8:0]n94;
    
    wire n114, n115, n116, n117, n118, n119, n120, n121, n122;
    wire [8:0]n123;
    wire [8:0]n133;
    
    xor (adsu_ci, adsu_ci_int, add_sel) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(85[28:66])
    or (n4, sub, subc) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(80[29:39])
    or (add_sel, n4, cmp) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(80[28:46])
    not (add_sel_inv, add_sel) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(82[31:39])
    or (n7, addc, subc) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(83[45:58])
    and (adsu_ci_int, carry_flag, n7) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(83[32:58])
    xor (carry_add, carry_add_int, add_sel) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(106[30:72])
    mux_8 mux_10 (.d0({dout_rb}), .d1({imi_data}), .cond(imi_instr), .o({data_rb_int}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(87[33:63])
    pmi_addsub u1_addsub8 (.DataA({dout_rd}), .DataB({data_rb_int}), .Cin(adsu_ci), 
            .Add_Sub(add_sel_inv), .Result({data_add}), .Cout(carry_add_int));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(95[19] 104[9])
    defparam u1_addsub8.pmi_data_width = 8;
    defparam u1_addsub8.pmi_result_width = 8;
    defparam u1_addsub8.pmi_sign = "off";
    defparam u1_addsub8.pmi_family = "EC";
    defparam u1_addsub8.module_type = "pmi_addsub";
    equal_2 equal_13 (.a({instr[15:14]}), .b({2'b00}), .o(n32));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(108[28:51])
    equal_2 equal_14 (.a({instr[15:14]}), .b({2'b01}), .o(n33));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(109[28:51])
    and_8 and_15 (.a({dout_rd}), .b({data_rb_int}), .o({n34}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(109[54:77])
    equal_2 equal_16 (.a({instr[15:14]}), .b({2'b10}), .o(n43));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(110[28:51])
    or_8 or_17 (.a({dout_rd}), .b({data_rb_int}), .o({n44}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(110[54:77])
    xor_8 xor_18 (.a({dout_rd}), .b({data_rb_int}), .o({n53}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(111[28:51])
    mux_8 mux_19 (.d0({n53}), .d1({n44}), .cond(n43), .o({n62}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(110[28] 111[51])
    mux_8 mux_20 (.d0({n62}), .d1({n34}), .cond(n33), .o({n71}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(109[28] 111[51])
    mux_8 mux_21 (.d0({n71}), .d1({data_rb_int}), .cond(n32), .o({dout_l}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(108[27] 111[52])
    equal_2 equal_22 (.a({instr[1:0]}), .b({2'b00}), .o(n89));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(116[33:54])
    equal_2 equal_23 (.a({instr[1:0]}), .b({2'b10}), .o(n90));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(117[33:54])
    equal_2 equal_24 (.a({instr[1:0]}), .b({2'b01}), .o(n91));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(118[33:54])
    assign n92 = n91 ? carry_flag : dout_rb[7];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(118[33] 119[71])
    assign n93 = n91 ? dout_rb[7] : carry_flag;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(118[33] 119[71])
    mux_9 mux_27 (.d0({n92, dout_rb[6:0], n93}), .d1({dout_rb[0], carry_flag, 
          dout_rb[7:1]}), .cond(n90), .o({n94}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(117[33] 119[71])
    mux_9 mux_28 (.d0({n94}), .d1({carry_flag, dout_rb[0], dout_rb[7:1]}), 
          .cond(n89), .o({cout_r, dout_r}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(116[32] 119[72])
    equal_4 equal_29 (.a({instr[17:14]}), .b({4'b1000}), .o(n114));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(124[36:61])
    equal_2 equal_30 (.a({instr[17:16]}), .b({2'b00}), .o(n115));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(124[65:86])
    or (n116, n114, n115) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(124[35:87])
    equal_4 equal_32 (.a({instr[17:14]}), .b({4'b1001}), .o(n117));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(125[36:61])
    equal_2 equal_33 (.a({instr[17:16]}), .b({2'b01}), .o(n118));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(125[65:86])
    or (n119, n117, n118) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(125[35:87])
    equal_4 equal_35 (.a({instr[17:14]}), .b({4'b1010}), .o(n120));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(126[36:61])
    equal_4 equal_36 (.a({instr[17:14]}), .b({4'b1011}), .o(n121));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(126[65:90])
    or (n122, n120, n121) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(126[35:91])
    mux_9 mux_38 (.d0({9'b011111111}), .d1({cout_r, dout_r}), .cond(n122), 
          .o({n123}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(126[35] 127[103])
    mux_9 mux_39 (.d0({n123}), .d1({carry_flag, dout_l}), .cond(n119), 
          .o({n133}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(125[35] 127[103])
    mux_9 mux_40 (.d0({n133}), .d1({carry_add, data_add}), .cond(n116), 
          .o({cout_alu, dout_alu}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(124[34] 127[104])
    
endmodule

//
// Verilog Description of module \pmi_addsub(pmi_data_width=8,pmi_result_width=8,pmi_sign="off",pmi_family="XO2",module_type="pmi_addsub") 
// module not written out since it is a black-box. 
//


//
// Verilog Description of OPERATOR equal_2
//

module equal_2 (a, b, o);
    input [1:0]a;
    input [1:0]b;
    output o;
    
    
    wire n1, n2, n3;
    
    xor (n1, a[0], b[0]) ;
    xor (n2, a[1], b[1]) ;
    or (n3, n1, n2) ;
    not (o, n3) ;
    
endmodule

//
// Verilog Description of OPERATOR and_8
//

module and_8 (a, b, o);
    input [7:0]a;
    input [7:0]b;
    output [7:0]o;
    
    
    and (o[0], a[0], b[0]) ;
    and (o[1], a[1], b[1]) ;
    and (o[2], a[2], b[2]) ;
    and (o[3], a[3], b[3]) ;
    and (o[4], a[4], b[4]) ;
    and (o[5], a[5], b[5]) ;
    and (o[6], a[6], b[6]) ;
    and (o[7], a[7], b[7]) ;
    
endmodule

//
// Verilog Description of OPERATOR or_8
//

module or_8 (a, b, o);
    input [7:0]a;
    input [7:0]b;
    output [7:0]o;
    
    
    or (o[0], a[0], b[0]) ;
    or (o[1], a[1], b[1]) ;
    or (o[2], a[2], b[2]) ;
    or (o[3], a[3], b[3]) ;
    or (o[4], a[4], b[4]) ;
    or (o[5], a[5], b[5]) ;
    or (o[6], a[6], b[6]) ;
    or (o[7], a[7], b[7]) ;
    
endmodule

//
// Verilog Description of OPERATOR xor_8
//

module xor_8 (a, b, o);
    input [7:0]a;
    input [7:0]b;
    output [7:0]o;
    
    
    xor (o[0], a[0], b[0]) ;
    xor (o[1], a[1], b[1]) ;
    xor (o[2], a[2], b[2]) ;
    xor (o[3], a[3], b[3]) ;
    xor (o[4], a[4], b[4]) ;
    xor (o[5], a[5], b[5]) ;
    xor (o[6], a[6], b[6]) ;
    xor (o[7], a[7], b[7]) ;
    
endmodule

//
// Verilog Description of OPERATOR mux_9
//

module mux_9 (d0, d1, cond, o);
    input [8:0]d0;
    input [8:0]d1;
    input cond;
    output [8:0]o;
    
    
    assign o[0] = cond ? d1[0] : d0[0];
    assign o[1] = cond ? d1[1] : d0[1];
    assign o[2] = cond ? d1[2] : d0[2];
    assign o[3] = cond ? d1[3] : d0[3];
    assign o[4] = cond ? d1[4] : d0[4];
    assign o[5] = cond ? d1[5] : d0[5];
    assign o[6] = cond ? d1[6] : d0[6];
    assign o[7] = cond ? d1[7] : d0[7];
    assign o[8] = cond ? d1[8] : d0[8];
    
endmodule

//
// Verilog Description of OPERATOR equal_4
//

module equal_4 (a, b, o);
    input [3:0]a;
    input [3:0]b;
    output o;
    
    
    wire n1, n2, n3, n4, n5, n6, n7;
    
    xor (n1, a[0], b[0]) ;
    xor (n2, a[1], b[1]) ;
    xor (n3, a[2], b[2]) ;
    xor (n4, a[3], b[3]) ;
    or (n5, n1, n2) ;
    or (n6, n3, n4) ;
    or (n7, n5, n6) ;
    not (o, n7) ;
    
endmodule

//
// Verilog Description of module \isp8_flow_cntl(PGM_STACK_AW=4,PGM_STACK_AD=16,PROM_AW=10,FAMILY_NAME="XO2") 
//

module \isp8_flow_cntl(PGM_STACK_AW=4,PGM_STACK_AD=16,PROM_AW=10,FAMILY_NAME="XO2")  (clk, 
            rst_n, setc, clrc, setz, clrz, seti, clri, addr_jmp, 
            update_c, update_z, cout_alu, dout_alu, bz, bnz, bc, 
            bnc, b, callz, callnz, callc, callnc, call, ret, 
            iret, intr, lsp, lspi, ssp, sspi, import, importi, 
            export, exporti, ready, addr_cyc, ext_addr_cyc, data_cyc, 
            prom_addr, prom_enable, carry_flag, intr_ack) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(41[8:22])
    input clk;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(99[36:39])
    input rst_n;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(100[36:41])
    input setc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(102[36:40])
    input clrc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(103[36:40])
    input setz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(104[36:40])
    input clrz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(105[36:40])
    input seti;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(106[36:40])
    input clri;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(107[36:40])
    input [9:0]addr_jmp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(108[36:44])
    input update_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(109[36:44])
    input update_z;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(110[36:44])
    input cout_alu;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(111[36:44])
    input [7:0]dout_alu;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(112[36:44])
    input bz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(114[36:38])
    input bnz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(115[36:39])
    input bc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(116[36:38])
    input bnc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(117[36:39])
    input b;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(118[36:37])
    input callz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(119[36:41])
    input callnz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(120[36:42])
    input callc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(121[36:41])
    input callnc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(122[36:42])
    input call;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(123[36:40])
    input ret;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(124[36:39])
    input iret;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(125[36:40])
    input intr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(126[36:40])
    input lsp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(128[36:39])
    input lspi;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(129[36:40])
    input ssp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(130[36:39])
    input sspi;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(131[36:40])
    input import;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(132[36:42])
    input importi;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(133[36:43])
    input export;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(134[36:42])
    input exporti;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(135[36:43])
    input ready;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(136[36:41])
    output addr_cyc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(138[36:44])
    output ext_addr_cyc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(139[36:48])
    output data_cyc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(140[36:44])
    output [9:0]prom_addr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(141[36:45])
    output prom_enable;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(142[36:47])
    output carry_flag;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(143[36:46])
    output intr_ack;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(144[36:44])
    
    wire [9:0]pc_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(147[36:42])
    wire push_enb;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(148[36:44])
    wire intr_req_actv;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(149[36:49])
    wire br_enb;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(150[36:42])
    wire br_enb0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(150[43:50])
    wire [9:0]dout_stack;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(151[36:46])
    wire [11:0]dout_stack_w_cz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(152[36:51])
    wire [11:0]din_stack_w_cz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(153[36:50])
    wire sp_we;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(155[36:41])
    wire ext_cycle_type;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(157[36:50])
    wire ret_cycle_type;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(158[36:50])
    wire [3:0]stack_ptr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(162[36:45])
    wire zero_flag;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(165[36:45])
    wire ie_flag;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(166[36:43])
    wire [9:0]pc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(167[36:38])
    wire ret_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(171[36:43])
    wire [7:0]dout_alu_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(172[36:48])
    wire intr_reg0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(173[36:45])
    wire [9:0]addr_jmp_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(174[36:48])
    wire br_enb_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(176[36:46])
    
    wire n12, n13, n14, n15, n16, n17, n22, n23, n24, n25, 
        n26, n27, n28, n29, n30, n31, n33, n34, n41, n55, 
        n56;
    wire [9:0]n60;
    
    wire n71, n84, n86, n87, n88, n89, n90, n91, n92, n93, 
        n94, n96, n97, n98, n100, n101, n103, n114, n116, 
        n117;
    wire [9:0]n118;
    
    wire n129;
    wire [9:0]n130;
    
    wire n174, n175, n176, n177, n178, n179, n180;
    wire [9:0]n181;
    wire [9:0]n205;
    
    wire n227, n228, n232, n233, n234, n235, n236, n237, n238, 
        n241, n242, n246, n247, n248, n249, n250, n251, n252, 
        n253, n257, n258, n259, n270, n271, n272, n274, n298, 
        n299, n300;
    wire [3:0]n302;
    
    wire n307;
    wire [4:0]n308;
    wire [3:0]n314;
    wire [3:0]n319;
    
    or (n12, lspi, lsp) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(183[52:63])
    or (n13, n12, sspi) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(183[52:71])
    or (n14, n13, ssp) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(183[52:78])
    or (n15, n14, export) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(183[52:88])
    or (n16, n15, exporti) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(183[52:99])
    or (n17, n16, import) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(183[52:109])
    or (ext_cycle_type, n17, importi) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(183[52:120])
    or (ret_cycle_type, ret, iret) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(185[53:64])
    not (n41, rst_n) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(189[14:20])
    not (n22, addr_cyc) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(195[34:49])
    not (n23, ext_addr_cyc) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(195[53:74])
    and (n24, n22, n23) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(195[33:75])
    and (n25, addr_cyc, ext_cycle_type) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(196[34:66])
    and (n26, ext_addr_cyc, ext_cycle_type) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(197[35:69])
    not (n27, ready) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(197[73:80])
    and (n28, n26, n27) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(197[34:81])
    or (n29, n25, n28) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(196[33] 197[82])
    not (n30, ext_cycle_type) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(198[51:66])
    and (n31, addr_cyc, n30) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(198[34:67])
    and (n33, n26, ready) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(199[34:79])
    or (n34, n31, n33) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(198[33] 199[80])
    VERIFIC_DFFRS ext_addr_cyc_int_175 (.d(n29), .clk(clk), .s(n41), .r(1'b0), 
            .q(ext_addr_cyc));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(194[15] 200[13])
    VERIFIC_DFFRS data_cyc_int_176 (.d(n34), .clk(clk), .s(1'b0), .r(n41), 
            .q(data_cyc));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(194[15] 200[13])
    VERIFIC_DFFRS ret_reg_177 (.d(ret_cycle_type), .clk(clk), .s(1'b0), 
            .r(n41), .q(ret_reg));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(215[15] 218[13])
    or (prom_enable, data_cyc, n41) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(206[26:47])
    wide_dffrs_8 dout_alu_reg_c (.d({dout_alu}), .set({8'b00000000}), .reset({n41, 
            n41, n41, n41, n41, n41, n41, n41}), .clock(clk), 
            .q({dout_alu_reg}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(215[15] 218[13])
    VERIFIC_DFFRS intr_reg0_179 (.d(n56), .clk(clk), .s(1'b0), .r(n41), 
            .q(intr_reg0));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(226[13] 229[39])
    and (n55, ie_flag, intr) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(227[29:44])
    assign n56 = addr_cyc ? n55 : intr_reg0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(229[16:39])
    VERIFIC_DFFRS br_enb_reg_180 (.d(n71), .clk(clk), .s(1'b0), .r(n41), 
            .q(br_enb_reg));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(238[15] 241[13])
    mux_10 mux_51 (.d0({addr_jmp_reg}), .d1({addr_jmp}), .cond(addr_cyc), 
           .o({n60}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(238[15] 241[13])
    assign n71 = addr_cyc ? br_enb : br_enb_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(238[15] 241[13])
    wide_dffrs_10 addr_jmp_reg_c (.d({n60}), .set({10'b0000000000}), .reset({n41, 
            n41, n41, n41, n41, n41, n41, n41, n41, n41}), 
            .clock(clk), .q({addr_jmp_reg}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(238[15] 241[13])
    wide_dffrs_10 pc_c (.d({n205}), .set({10'b0000000000}), .reset({n41, 
            n41, n41, n41, n41, n41, n41, n41, n41, n41}), 
            .clock(clk), .q({pc}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(288[15] 289[33])
    not (n84, intr_ack) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(244[40:55])
    and (intr_req_actv, intr_reg0, n84) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(244[27:56])
    and (n86, callz, zero_flag) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(248[22:41])
    and (n87, callc, carry_flag) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(248[44:68])
    or (n88, n86, n87) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(248[22:68])
    not (n89, zero_flag) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(249[32:44])
    and (n90, callnz, n89) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(249[22:45])
    or (n91, n88, n90) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(248[22] 249[45])
    not (n92, carry_flag) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(249[58:75])
    and (n93, callnc, n92) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(249[48:76])
    or (n94, n91, n93) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(248[22] 249[76])
    or (push_enb, n94, call) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(248[21] 249[84])
    and (n96, bz, zero_flag) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(252[22:38])
    and (n97, bc, carry_flag) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(252[41:62])
    or (n98, n96, n97) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(252[22:62])
    and (n100, bnz, n89) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(253[22:41])
    or (n101, n98, n100) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(252[22] 253[41])
    and (n103, bnc, n92) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(253[44:68])
    or (br_enb0, n101, n103) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(252[21] 253[69])
    or (n114, br_enb0, b) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(255[22] 256[74])
    or (br_enb, n114, push_enb) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(255[21] 256[86])
    and (n116, br_enb_reg, data_cyc) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(262[20:47])
    add_10u_10u add_88 (.cin(1'b0), .a({pc}), .b({addr_jmp_reg}), .o({n118}), 
            .cout(n117));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(262[50:69])
    add_10u_10u add_89 (.cin(1'b0), .a({pc}), .b({10'b0000000001}), .o({n130}), 
            .cout(n129));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(263[50:58])
    mux_32 mux_90 (.d0({21'b000000000000000000000, n129, n130}), .d1({21'b000000000000000000000, 
           n117, n118}), .cond(n116), .o({Open_152, Open_153, Open_154, 
           Open_155, Open_156, Open_157, Open_158, Open_159, Open_160, 
           Open_161, Open_162, Open_163, Open_164, Open_165, Open_166, 
           Open_167, Open_168, Open_169, Open_170, Open_171, Open_172, 
           Open_173, pc_int}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(262[20] 263[58])
    and (n174, data_cyc, intr_req_actv) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(269[14:43])
    not (n175, push_enb) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(269[47:56])
    and (n176, n174, n175) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(269[14:56])
    not (n177, br_enb0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(269[60:68])
    and (n178, n176, n177) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(269[14:68])
    not (n179, ret_cycle_type) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(270[14:29])
    and (n180, n178, n179) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(269[14] 270[29])
    mux_10 mux_98 (.d0({pc_int}), .d1({dout_stack}), .cond(ret_reg), .o({n181}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(278[13:36])
    mux_10 mux_99 (.d0({n181}), .d1({10'b0000000000}), .cond(n180), .o({prom_addr}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(273[15] 278[36])
    mux_10 mux_102 (.d0({pc}), .d1({prom_addr}), .cond(data_cyc), .o({n205}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(288[15] 289[33])
    VERIFIC_DFFRS carry_flag_int_183 (.d(n238), .clk(clk), .s(1'b0), .r(n41), 
            .q(carry_flag));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(306[15] 316[16])
    and (n227, update_c, cout_alu) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(299[31:53])
    assign n228 = setc ? 1'b1 : n227;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(298[31] 300[35])
    assign din_stack_w_cz[11] = clrc ? 1'b0 : n228;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(297[30] 300[36])
    or (n232, clrc, setc) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(306[19:36])
    or (n233, n232, update_c) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(306[19:50])
    or (n234, n233, iret) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(306[19:59])
    assign n235 = iret ? dout_stack_w_cz[11] : cout_alu;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(315[19:46])
    assign n236 = setc ? 1'b1 : n235;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(312[21] 315[46])
    assign n237 = clrc ? 1'b0 : n236;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(310[21] 315[46])
    assign n238 = n234 ? n237 : carry_flag;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(306[15] 316[16])
    VERIFIC_DFFRS zero_flag_184 (.d(n253), .clk(clk), .s(1'b0), .r(n41), 
            .q(zero_flag));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(335[15] 347[16])
    and (n241, update_z, n249) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(328[30:65])
    assign n242 = setz ? 1'b1 : n241;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(327[30] 329[34])
    assign din_stack_w_cz[10] = clrz ? 1'b0 : n242;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(326[29] 329[35])
    or (n246, update_z, setz) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(335[19:34])
    or (n247, n246, clrz) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(335[19:41])
    or (n248, n247, iret) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(335[19:48])
    equal_8 equal_126 (.a({dout_alu_reg}), .b({8'b00000000}), .o(n249));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(346[32:55])
    assign n250 = iret ? dout_stack_w_cz[10] : n249;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(346[19:56])
    assign n251 = setz ? 1'b1 : n250;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(343[21] 346[56])
    assign n252 = clrz ? 1'b0 : n251;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(341[21] 346[56])
    assign n253 = n248 ? n252 : zero_flag;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(335[15] 347[16])
    VERIFIC_DFFRS ie_flag_185 (.d(n259), .clk(clk), .s(1'b0), .r(n41), 
            .q(ie_flag));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(355[15] 358[32])
    or (n257, clri, seti) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(355[19:36])
    not (n258, clri) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(356[24:31])
    assign n259 = n257 ? n258 : ie_flag;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(358[13:32])
    VERIFIC_DFFRS intr_ack_int_186 (.d(n272), .clk(clk), .s(1'b0), .r(n41), 
            .q(intr_ack));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(367[15] 375[42])
    and (n270, iret, data_cyc) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(372[19:39])
    assign n271 = n270 ? 1'b0 : intr_ack;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(375[13:42])
    assign n272 = n180 ? 1'b1 : n271;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(372[15] 375[42])
    wide_dffrs_4 stack_ptr_c (.d({n319}), .set({4'b0000}), .reset({n41, 
            n41, n41, n41}), .clock(clk), .q({stack_ptr}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(418[15] 421[42])
    and (n274, addr_cyc, push_enb) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(381[20:45])
    or (sp_we, n274, n180) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(381[19] 383[50])
    pmi_distributed_spram u1_isp8_stkmem (.Address({stack_ptr}), .Data({din_stack_w_cz[11:10], 
            pc_int}), .Clock(clk), .ClockEn(1'b1), .WE(sp_we), .Reset(1'b0), 
            .Q({dout_stack_w_cz[11:10], dout_stack}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(394[31] 403[9])
    defparam u1_isp8_stkmem.pmi_addr_depth = 32;
    defparam u1_isp8_stkmem.pmi_addr_width = 5;
    defparam u1_isp8_stkmem.pmi_data_width = 8;
    defparam u1_isp8_stkmem.pmi_regmode = "reg";
    defparam u1_isp8_stkmem.pmi_init_file = "none";
    defparam u1_isp8_stkmem.pmi_init_file_format = "binary";
    defparam u1_isp8_stkmem.pmi_family = "EC";
    defparam u1_isp8_stkmem.module_type = "pmi_distributed_spram";
    and (n298, intr_req_actv, n179) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(418[47:81])
    or (n299, push_enb, n298) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(418[34:82])
    and (n300, data_cyc, n299) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(418[19:82])
    add_4u_4u add_166 (.cin(1'b0), .a({stack_ptr}), .b({4'b0001}), .o({n302}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(419[26:41])
    and (n307, addr_cyc, ret_cycle_type) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(420[19:48])
    sub_5 sub_168 (.a({1'b0, stack_ptr}), .b({5'b00001}), .o({Open_174, 
          n308[3:0]}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(421[26:41])
    mux_4 mux_169 (.d0({stack_ptr}), .d1({n308[3:0]}), .cond(n307), .o({n314}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(420[15] 421[42])
    mux_4 mux_170 (.d0({n314}), .d1({n302}), .cond(n300), .o({n319}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(420[15] 421[42])
    VERIFIC_DFFRS addr_cyc_int_174 (.d(n24), .clk(clk), .s(n41), .r(1'b0), 
            .q(addr_cyc));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(194[15] 200[13])
    
endmodule

//
// Verilog Description of OPERATOR mux_10
//

module mux_10 (d0, d1, cond, o);
    input [9:0]d0;
    input [9:0]d1;
    input cond;
    output [9:0]o;
    
    
    assign o[0] = cond ? d1[0] : d0[0];
    assign o[1] = cond ? d1[1] : d0[1];
    assign o[2] = cond ? d1[2] : d0[2];
    assign o[3] = cond ? d1[3] : d0[3];
    assign o[4] = cond ? d1[4] : d0[4];
    assign o[5] = cond ? d1[5] : d0[5];
    assign o[6] = cond ? d1[6] : d0[6];
    assign o[7] = cond ? d1[7] : d0[7];
    assign o[8] = cond ? d1[8] : d0[8];
    assign o[9] = cond ? d1[9] : d0[9];
    
endmodule

//
// Verilog Description of OPERATOR wide_dffrs_10
//

module wide_dffrs_10 (d, set, reset, clock, q);
    input [9:0]d;
    input [9:0]set;
    input [9:0]reset;
    input clock;
    output [9:0]q;
    
    
    VERIFIC_DFFRS i1 (.d(d[0]), .clk(clock), .s(set[0]), .r(reset[0]), 
            .q(q[0]));
    VERIFIC_DFFRS i2 (.d(d[1]), .clk(clock), .s(set[1]), .r(reset[1]), 
            .q(q[1]));
    VERIFIC_DFFRS i3 (.d(d[2]), .clk(clock), .s(set[2]), .r(reset[2]), 
            .q(q[2]));
    VERIFIC_DFFRS i4 (.d(d[3]), .clk(clock), .s(set[3]), .r(reset[3]), 
            .q(q[3]));
    VERIFIC_DFFRS i5 (.d(d[4]), .clk(clock), .s(set[4]), .r(reset[4]), 
            .q(q[4]));
    VERIFIC_DFFRS i6 (.d(d[5]), .clk(clock), .s(set[5]), .r(reset[5]), 
            .q(q[5]));
    VERIFIC_DFFRS i7 (.d(d[6]), .clk(clock), .s(set[6]), .r(reset[6]), 
            .q(q[6]));
    VERIFIC_DFFRS i8 (.d(d[7]), .clk(clock), .s(set[7]), .r(reset[7]), 
            .q(q[7]));
    VERIFIC_DFFRS i9 (.d(d[8]), .clk(clock), .s(set[8]), .r(reset[8]), 
            .q(q[8]));
    VERIFIC_DFFRS i10 (.d(d[9]), .clk(clock), .s(set[9]), .r(reset[9]), 
            .q(q[9]));
    
endmodule

//
// Verilog Description of OPERATOR add_10u_10u
//

module add_10u_10u (cin, a, b, o, cout);
    input cin;
    input [9:0]a;
    input [9:0]b;
    output [9:0]o;
    output cout;
    
    
    wire n2, n4, n6, n8, n10, n12, n14, n16, n18;
    
    VERIFIC_FADD i1 (.cin(cin), .a(a[0]), .b(b[0]), .o(o[0]), .cout(n2));
    VERIFIC_FADD i2 (.cin(n2), .a(a[1]), .b(b[1]), .o(o[1]), .cout(n4));
    VERIFIC_FADD i3 (.cin(n4), .a(a[2]), .b(b[2]), .o(o[2]), .cout(n6));
    VERIFIC_FADD i4 (.cin(n6), .a(a[3]), .b(b[3]), .o(o[3]), .cout(n8));
    VERIFIC_FADD i5 (.cin(n8), .a(a[4]), .b(b[4]), .o(o[4]), .cout(n10));
    VERIFIC_FADD i6 (.cin(n10), .a(a[5]), .b(b[5]), .o(o[5]), .cout(n12));
    VERIFIC_FADD i7 (.cin(n12), .a(a[6]), .b(b[6]), .o(o[6]), .cout(n14));
    VERIFIC_FADD i8 (.cin(n14), .a(a[7]), .b(b[7]), .o(o[7]), .cout(n16));
    VERIFIC_FADD i9 (.cin(n16), .a(a[8]), .b(b[8]), .o(o[8]), .cout(n18));
    VERIFIC_FADD i10 (.cin(n18), .a(a[9]), .b(b[9]), .o(o[9]), .cout(cout));
    
endmodule

//
// Verilog Description of OPERATOR mux_32
//

module mux_32 (d0, d1, cond, o);
    input [31:0]d0;
    input [31:0]d1;
    input cond;
    output [31:0]o;
    
    
    assign o[0] = cond ? d1[0] : d0[0];
    assign o[1] = cond ? d1[1] : d0[1];
    assign o[2] = cond ? d1[2] : d0[2];
    assign o[3] = cond ? d1[3] : d0[3];
    assign o[4] = cond ? d1[4] : d0[4];
    assign o[5] = cond ? d1[5] : d0[5];
    assign o[6] = cond ? d1[6] : d0[6];
    assign o[7] = cond ? d1[7] : d0[7];
    assign o[8] = cond ? d1[8] : d0[8];
    assign o[9] = cond ? d1[9] : d0[9];
    assign o[10] = cond ? d1[10] : d0[10];
    assign o[11] = cond ? d1[11] : d0[11];
    assign o[12] = cond ? d1[12] : d0[12];
    assign o[13] = cond ? d1[13] : d0[13];
    assign o[14] = cond ? d1[14] : d0[14];
    assign o[15] = cond ? d1[15] : d0[15];
    assign o[16] = cond ? d1[16] : d0[16];
    assign o[17] = cond ? d1[17] : d0[17];
    assign o[18] = cond ? d1[18] : d0[18];
    assign o[19] = cond ? d1[19] : d0[19];
    assign o[20] = cond ? d1[20] : d0[20];
    assign o[21] = cond ? d1[21] : d0[21];
    assign o[22] = cond ? d1[22] : d0[22];
    assign o[23] = cond ? d1[23] : d0[23];
    assign o[24] = cond ? d1[24] : d0[24];
    assign o[25] = cond ? d1[25] : d0[25];
    assign o[26] = cond ? d1[26] : d0[26];
    assign o[27] = cond ? d1[27] : d0[27];
    assign o[28] = cond ? d1[28] : d0[28];
    assign o[29] = cond ? d1[29] : d0[29];
    assign o[30] = cond ? d1[30] : d0[30];
    assign o[31] = cond ? d1[31] : d0[31];
    
endmodule

//
// Verilog Description of OPERATOR equal_8
//

module equal_8 (a, b, o);
    input [7:0]a;
    input [7:0]b;
    output o;
    
    
    wire n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, 
        n12, n13, n14, n15;
    
    xor (n1, a[0], b[0]) ;
    xor (n2, a[1], b[1]) ;
    xor (n3, a[2], b[2]) ;
    xor (n4, a[3], b[3]) ;
    xor (n5, a[4], b[4]) ;
    xor (n6, a[5], b[5]) ;
    xor (n7, a[6], b[6]) ;
    xor (n8, a[7], b[7]) ;
    or (n9, n1, n2) ;
    or (n10, n3, n4) ;
    or (n11, n9, n10) ;
    or (n12, n5, n6) ;
    or (n13, n7, n8) ;
    or (n14, n12, n13) ;
    or (n15, n11, n14) ;
    not (o, n15) ;
    
endmodule

//
// Verilog Description of module \pmi_distributed_spram(pmi_addr_depth=16,pmi_addr_width=4,pmi_data_width=12,pmi_regmode="noreg",pmi_init_file="none",pmi_init_file_format="binary",pmi_family="XO2",module_type="pmi_distributed_spram") 
// module not written out since it is a black-box. 
//


//
// Verilog Description of OPERATOR sub_5
//

module sub_5 (a, b, o);
    input [4:0]a;
    input [4:0]b;
    output [4:0]o;
    
    wire [4:0]n1;
    
    inv_5 inv_0 (.i({b}), .o({n1}));
    add_5u_5u add_2 (.cin(1'b1), .a({a}), .b({n1}), .o({o}));
    
endmodule

//
// Verilog Description of OPERATOR inv_5
//

module inv_5 (i, o);
    input [4:0]i;
    output [4:0]o;
    
    
    not (o[0], i[0]) ;
    not (o[1], i[1]) ;
    not (o[2], i[2]) ;
    not (o[3], i[3]) ;
    not (o[4], i[4]) ;
    
endmodule

//
// Verilog Description of OPERATOR add_5u_5u
//

module add_5u_5u (cin, a, b, o, cout);
    input cin;
    input [4:0]a;
    input [4:0]b;
    output [4:0]o;
    output cout;
    
    
    wire n2, n4, n6, n8;
    
    VERIFIC_FADD i1 (.cin(cin), .a(a[0]), .b(b[0]), .o(o[0]), .cout(n2));
    VERIFIC_FADD i2 (.cin(n2), .a(a[1]), .b(b[1]), .o(o[1]), .cout(n4));
    VERIFIC_FADD i3 (.cin(n4), .a(a[2]), .b(b[2]), .o(o[2]), .cout(n6));
    VERIFIC_FADD i4 (.cin(n6), .a(a[3]), .b(b[3]), .o(o[3]), .cout(n8));
    VERIFIC_FADD i5 (.cin(n8), .a(a[4]), .b(b[4]), .o(o[4]), .cout(cout));
    
endmodule

//
// Verilog Description of module \isp8_io_cntl(PORT_AW=8) 
//

module \isp8_io_cntl(PORT_AW=8)  (clk, rst_n, import, importi, export, 
            exporti, ssp, sspi, lsp, lspi, addr_cyc, ext_addr_cyc, 
            addr_rb, dout_rd, dout_rb, ext_addr, ext_dout, ext_mem_wr, 
            ext_mem_rd, ext_io_wr, ext_io_rd) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(39[9:21])
    input clk;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(66[22:25])
    input rst_n;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(67[22:27])
    input import;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(68[22:28])
    input importi;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(69[22:29])
    input export;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(70[22:28])
    input exporti;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(71[22:29])
    input ssp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(72[22:25])
    input sspi;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(73[22:26])
    input lsp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(74[22:25])
    input lspi;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(75[22:26])
    input addr_cyc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(76[22:30])
    input ext_addr_cyc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(77[22:34])
    input [4:0]addr_rb;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(79[30:37])
    input [7:0]dout_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(80[30:37])
    input [7:0]dout_rb;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(81[30:37])
    output [7:0]ext_addr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(83[31:39])
    output [7:0]ext_dout;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(84[31:39])
    output ext_mem_wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(85[31:41])
    output ext_mem_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(86[31:41])
    output ext_io_wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(87[31:40])
    output ext_io_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(88[31:40])
    
    
    wire n5, n6, n8, n9, n11, n25, n26, n27;
    wire [7:0]n28;
    
    wire n48, n49, n50, n51, n53;
    
    or (n6, export, exporti) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(107[25:43])
    and (n8, n6, n49) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(107[25:72])
    or (n9, import, importi) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(108[25:43])
    and (n11, n9, n49) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(108[25:72])
    VERIFIC_DFFRS ext_io_wr_33 (.d(n8), .clk(clk), .s(1'b0), .r(n5), 
            .q(ext_io_wr));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(105[6] 109[4])
    VERIFIC_DFFRS ext_io_rd_34 (.d(n11), .clk(clk), .s(1'b0), .r(n5), 
            .q(ext_io_rd));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(105[6] 109[4])
    wide_dffrs_8 ext_addr_c6 (.d({n28}), .set({8'b00000000}), .reset({n5, 
            n5, n5, n5, n5, n5, n5, n5}), .clock(clk), .q({ext_addr}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(117[6] 120[39])
    not (n5, rst_n) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(115[5:11])
    or (n25, export, import) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(117[10:31])
    or (n26, n25, lsp) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(117[10:41])
    or (n27, n26, ssp) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(117[10:51])
    mux_8 mux_19 (.d0({dout_rb}), .d1({3'b000, addr_rb}), .cond(n27), 
          .o({n28}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(120[3:39])
    VERIFIC_DFFRS ext_mem_wr_36 (.d(n50), .clk(clk), .s(1'b0), .r(n5), 
            .q(ext_mem_wr));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(130[6] 133[4])
    or (n48, sspi, ssp) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(131[20:33])
    or (n49, addr_cyc, ext_addr_cyc) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(131[36:62])
    and (n50, n48, n49) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(131[20:62])
    or (n51, lspi, lsp) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(132[20:33])
    and (n53, n51, n49) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(132[20:62])
    VERIFIC_DFFRS ext_mem_rd_37 (.d(n53), .clk(clk), .s(1'b0), .r(n5), 
            .q(ext_mem_rd));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(130[6] 133[4])
    wide_dffrs_8 ext_dout_c7 (.d({dout_rd}), .set({8'b00000000}), .reset({n5, 
            n5, n5, n5, n5, n5, n5, n5}), .clock(clk), .q({ext_dout}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_io_cntl.v(105[6] 109[4])
    
endmodule

//
// Verilog Description of module pmi_rom_renamed_due_excessive_length_1
// module not written out since it is a black-box. 
//


//
// Verilog Description of OPERATOR equal_5
//

module equal_5 (a, b, o);
    input [4:0]a;
    input [4:0]b;
    output o;
    
    
    wire n1, n2, n3, n4, n5, n6, n7, n8, n9;
    
    xor (n1, a[0], b[0]) ;
    xor (n2, a[1], b[1]) ;
    xor (n3, a[2], b[2]) ;
    xor (n4, a[3], b[3]) ;
    xor (n5, a[4], b[4]) ;
    or (n6, n1, n2) ;
    or (n7, n4, n5) ;
    or (n8, n3, n7) ;
    or (n9, n6, n8) ;
    not (o, n9) ;
    
endmodule

//
// Verilog Description of OPERATOR equal_1
//

module equal_1 (a, b, o);
    input [0:0]a;
    input [0:0]b;
    output o;
    
    
    wire n1;
    
    xor (n1, a[0], b[0]) ;
    not (o, n1) ;
    
endmodule

//
// Verilog Description of module \pmi_distributed_dpram(pmi_addr_depth=32,pmi_addr_width=5,pmi_data_width=8,pmi_regmode="noreg",pmi_init_file="none",pmi_init_file_format="binary",pmi_family="XO2",module_type="pmi_distributed_dpram") 
// module not written out since it is a black-box. 
//


//
// Verilog Description of module \pmi_distributed_spram(pmi_addr_depth=32,pmi_addr_width=5,pmi_data_width=8,pmi_regmode="noreg",pmi_init_file="none",pmi_init_file_format="binary",pmi_family="XO2",module_type="pmi_distributed_spram") 
// module not written out since it is a black-box. 
//


//
// Verilog Description of module \uart_core(CLK_IN_MHZ=24,BAUD_RATE=115200,ADDRWIDTH=3,DATAWIDTH=8,FIFO=0) 
//

module \uart_core(CLK_IN_MHZ=24,BAUD_RATE=115200,ADDRWIDTH=3,DATAWIDTH=8,FIFO=0)  (RESET, 
            CLK, UART_ADR_I, UART_DAT_I, UART_DAT_O, UART_STB_I, UART_CYC_I, 
            UART_WE_I, UART_SEL_I, UART_CTI_I, UART_BTE_I, UART_ACK_O, 
            INTR, SIN, RXRDY_N, DCD_N, CTS_N, DSR_N, RI_N, DTR_N, 
            RTS_N, SOUT, TXRDY_N) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(52[8:17])
    input RESET;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(98[23:28])
    input CLK;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(99[23:26])
    input [7:0]UART_ADR_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(101[22:32])
    input [15:0]UART_DAT_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(102[23:33])
    output [15:0]UART_DAT_O;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(117[23:33])
    input UART_STB_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(105[23:33])
    input UART_CYC_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(106[23:33])
    input UART_WE_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(107[23:32])
    input [3:0]UART_SEL_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(109[23:33])
    input [2:0]UART_CTI_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(110[23:33])
    input [1:0]UART_BTE_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(108[23:33])
    output UART_ACK_O;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(118[23:33])
    output INTR;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(121[23:27])
    input SIN;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(103[23:26])
    output RXRDY_N;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(123[23:30])
    input DCD_N;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(112[23:28])
    input CTS_N;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(113[23:28])
    input DSR_N;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(114[23:28])
    input RI_N;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(115[23:27])
    output DTR_N;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(127[23:28])
    output RTS_N;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(128[23:28])
    output SOUT;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(124[23:27])
    output TXRDY_N;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(125[23:30])
    
    wire [7:0]MSR;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(129[23:26])
    wire [1:0]MCR;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(130[23:26])
    wire [7:0]RBR_FIFO;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(133[22:30])
    wire [7:0]RBR;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(134[23:26])
    wire [7:0]THR;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(135[23:26])
    wire [1:0]databits;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(136[23:31])
    wire [1:0]stopbits;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(137[23:31])
    wire parity_en;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(138[23:32])
    wire parity_stick;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(139[23:35])
    wire tx_break;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(140[23:31])
    wire thr_wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(141[23:29])
    wire rbr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(142[23:29])
    wire lsr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(143[23:29])
    wire rx_rdy;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(144[23:29])
    wire parity_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(145[23:33])
    wire frame_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(146[23:32])
    wire overrun_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(147[23:34])
    wire break_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(148[23:32])
    wire THRE;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(149[23:27])
    wire TEMT;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(150[23:27])
    wire fifo_empty;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(153[23:33])
    wire fifo_empty_thr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(154[23:37])
    wire thr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(155[23:29])
    wire fifo_almost_full;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(156[23:39])
    wire [15:0]divisor;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(158[23:30])
    wire msr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(188[28:34])
    wire parity_even;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(194[28:39])
    
    \intface(CLK_IN_MHZ=24,BAUD_RATE=115200,ADDRWIDTH=3,DATAWIDTH=8,FIFO=0)  u_intface (.reset(RESET), 
            .clk(CLK), .adr_i({UART_ADR_I}), .dat_i({UART_DAT_I}), .dat_o({UART_DAT_O}), 
            .stb_i(UART_STB_I), .cyc_i(UART_CYC_I), .we_i(UART_WE_I), 
            .sel_i({UART_SEL_I}), .bte_i({UART_BTE_I}), .ack_o(UART_ACK_O), 
            .intr(INTR), .rbr({RBR}), .rbr_fifo({RBR_FIFO}), .thr({THR}), 
            .rbr_rd(rbr_rd), .thr_wr(thr_wr), .lsr_rd(lsr_rd), .msr_rd(msr_rd), 
            .msr({MSR}), .mcr({MCR}), .databits({databits}), .stopbits({stopbits}), 
            .parity_en(parity_en), .parity_even(parity_even), .parity_stick(parity_stick), 
            .tx_break(tx_break), .rx_rdy(rx_rdy), .overrun_err(overrun_err), 
            .parity_err(parity_err), .frame_err(frame_err), .break_int(break_int), 
            .thre(THRE), .temt(TEMT), .fifo_empty(fifo_empty), .fifo_empty_thr(fifo_empty_thr), 
            .thr_rd(thr_rd), .fifo_almost_full(fifo_almost_full), .divisor({divisor}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(169[10] 209[4])
    \rxcver(DATAWIDTH=8,FIFO=0)  u_rxcver (.reset(RESET), .clk(CLK), .rbr({RBR}), 
            .rbr_fifo({RBR_FIFO}), .rbr_rd(rbr_rd), .lsr_rd(lsr_rd), .sin(SIN), 
            .databits({databits}), .parity_en(parity_en), .parity_even(parity_even), 
            .parity_stick(parity_stick), .rx_rdy(rx_rdy), .overrun_err(overrun_err), 
            .parity_err(parity_err), .frame_err(frame_err), .break_int(break_int), 
            .fifo_empty(fifo_empty), .fifo_almost_full(fifo_almost_full), 
            .divisor({divisor}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(259[6] 279[4])
    \txmitt(DATAWIDTH=8,FIFO=0)  u_txmitt (.reset(RESET), .clk(CLK), .thr({THR}), 
            .thr_wr(thr_wr), .sout(SOUT), .databits({databits}), .stopbits({stopbits}), 
            .parity_en(parity_en), .parity_even(parity_even), .parity_stick(parity_stick), 
            .tx_break(tx_break), .thre(THRE), .temt(TEMT), .fifo_empty_thr(fifo_empty_thr), 
            .thr_rd(thr_rd), .divisor({divisor}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(283[7] 300[4])
    \modem(DATAWIDTH=8)  u_modem (.reset(RESET), .clk(CLK), .msr({MSR}), 
            .mcr({MCR}), .msr_rd(msr_rd), .dcd_n(DCD_N), .cts_n(CTS_N), 
            .dsr_n(DSR_N), .ri_n(RI_N), .dtr_n(DTR_N), .rts_n(RTS_N));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(303[34] 316[4])
    not (TXRDY_N, THRE) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(320[23:28])
    not (RXRDY_N, rx_rdy) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(321[23:30])
    
endmodule

//
// Verilog Description of module \intface(CLK_IN_MHZ=24,BAUD_RATE=115200,ADDRWIDTH=3,DATAWIDTH=8,FIFO=0) 
//

module \intface(CLK_IN_MHZ=24,BAUD_RATE=115200,ADDRWIDTH=3,DATAWIDTH=8,FIFO=0)  (reset, 
            clk, adr_i, dat_i, dat_o, stb_i, cyc_i, we_i, sel_i, 
            bte_i, ack_o, intr, rbr, rbr_fifo, thr, rbr_rd, thr_wr, 
            lsr_rd, msr_rd, msr, mcr, databits, stopbits, parity_en, 
            parity_even, parity_stick, tx_break, rx_rdy, overrun_err, 
            parity_err, frame_err, break_int, thre, temt, fifo_empty, 
            fifo_empty_thr, thr_rd, fifo_almost_full, divisor) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(51[8:15])
    input reset;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(106[13:18])
    input clk;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(107[13:16])
    input [7:0]adr_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(112[17:22])
    input [15:0]dat_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(113[18:23])
    output [15:0]dat_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(131[19:24])
    input stb_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(115[18:23])
    input cyc_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(116[18:23])
    input we_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(114[18:22])
    input [3:0]sel_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(117[18:23])
    input [1:0]bte_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(118[18:23])
    output ack_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(133[29:34])
    output intr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(132[29:33])
    input [7:0]rbr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(121[27:30])
    input [7:0]rbr_fifo;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(120[26:34])
    output [7:0]thr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(134[29:32])
    output rbr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(135[29:35])
    output thr_wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(136[29:35])
    output lsr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(130[29:35])
    output msr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(145[29:35])
    input [7:0]msr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(146[29:32])
    output [1:0]mcr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(147[29:32])
    output [1:0]databits;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(138[29:37])
    output [1:0]stopbits;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(139[29:37])
    output parity_en;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(140[29:38])
    output parity_even;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(141[29:40])
    output parity_stick;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(142[29:41])
    output tx_break;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(143[29:37])
    input rx_rdy;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(122[27:33])
    input overrun_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(123[27:38])
    input parity_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(124[27:37])
    input frame_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(125[27:36])
    input break_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(126[27:36])
    input thre;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(127[27:31])
    input temt;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(128[27:31])
    input fifo_empty;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(109[13:23])
    output fifo_empty_thr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(108[13:27])
    input thr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(111[13:19])
    input fifo_almost_full;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(110[13:29])
    output [15:0]divisor;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(149[29:36])
    
    wire [6:0]lcr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(168[15:18])
    wire [3:0]iir;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(170[21:24])
    wire [3:0]ier;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(172[21:24])
    wire rx_rdy_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(177[15:25])
    wire thre_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(178[15:23])
    wire dataerr_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(179[15:26])
    wire data_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(180[15:23])
    wire thr_wr_strobe;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(182[9:22])
    wire rbr_rd_strobe;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(183[9:22])
    wire iir_rd_strobe;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(184[9:22])
    wire div_wr_strobe;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(187[9:22])
    wire modem_stat;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(203[10:20])
    wire modem_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(204[10:19])
    wire [2:0]cs_state;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(524[15:23])
    wire [15:0]n4;
    
    wire n45, n46, n50, n51, n55, n56, n60, n61, n62, n64, 
        n65, n66, n68, n69, n70;
    wire [7:0]n71;
    wire [7:0]n80;
    
    wire n99, n100, n101, n102, n103;
    wire [7:0]n104;
    wire [3:0]n113;
    wire [6:0]n118;
    wire [7:0]n126;
    wire [3:0]n135;
    wire [6:0]n140;
    
    wire n173, n174;
    wire [1:0]n175;
    
    wire n181, n182, n184, n185, n187, n188, n194, n195, n196, 
        n197, n198, n199, n200, n201;
    wire [2:0]n202;
    wire [2:0]n206;
    wire [2:0]n210;
    wire [2:0]n214;
    
    wire n218, n219, n220, n221, n222;
    wire [2:0]n223;
    wire [2:0]n227;
    
    wire n231, n232, n233, n234, n235, n236;
    wire [2:0]n237;
    wire [2:0]n241;
    
    wire n245, n246, n247, n248;
    wire [2:0]n249;
    
    wire n253;
    wire [2:0]n255;
    wire [2:0]n259;
    
    wire n268, n269;
    wire [3:0]n279;
    wire [3:0]n284;
    wire [3:0]n289;
    
    assign dat_o[15] = dat_o[8];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(131[19:24])
    assign dat_o[14] = dat_o[8];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(131[19:24])
    assign dat_o[13] = dat_o[8];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(131[19:24])
    assign dat_o[12] = dat_o[8];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(131[19:24])
    assign dat_o[11] = dat_o[8];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(131[19:24])
    assign dat_o[10] = dat_o[8];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(131[19:24])
    assign dat_o[9] = dat_o[8];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(131[19:24])
    assign msr_rd = dat_o[8];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(145[29:35])
    assign dat_o[8] = 1'b0;
    mux_16 mux_3 (.d0({divisor}), .d1({dat_i}), .cond(div_wr_strobe), 
           .o({n4}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(226[12] 227[32])
    VERIFIC_DFFRS thr_wr_130 (.d(thr_wr_strobe), .clk(clk), .s(dat_o[8]), 
            .r(reset), .q(thr_wr));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(248[7:31])
    VERIFIC_DFFRS rbr_rd_nonfifo_131 (.d(rbr_rd_strobe), .clk(clk), .s(dat_o[8]), 
            .r(reset), .q(rbr_rd));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(259[6:38])
    wide_dffrs_8 data_8bit_c (.d({n80}), .set({reset, reset, reset, 
            reset, reset, reset, reset, reset}), .reset({8'b00000000}), 
            .clock(clk), .q({dat_o[7:0]}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(332[10] 341[11])
    and (thr_wr_strobe, n46, we_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(275[29:88])
    and (n45, n100, cyc_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(282[29:70])
    and (n46, n45, stb_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(282[29:79])
    and (rbr_rd_strobe, n46, n65) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(282[29:88])
    and (n50, n68, cyc_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(289[29:70])
    and (n51, n50, stb_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(289[29:79])
    and (iir_rd_strobe, n51, n65) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(289[29:88])
    and (n55, n69, cyc_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(296[29:70])
    and (n56, n55, stb_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(296[29:79])
    and (lsr_rd, n56, n65) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(296[29:88])
    equal_3 equal_27 (.a({adr_i[2:0]}), .b({3'b111}), .o(n60));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(303[27:58])
    and (n61, n60, cyc_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(303[27:68])
    and (n62, n61, stb_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(303[27:77])
    and (div_wr_strobe, n62, we_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(303[27:86])
    and (n64, cyc_i, stb_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(332[14:28])
    not (n65, we_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(332[32:37])
    and (n66, n64, n65) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(332[14:37])
    equal_3 equal_34 (.a({adr_i[2:0]}), .b({3'b000}), .o(n100));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(334[8:13])
    equal_3 equal_35 (.a({adr_i[2:0]}), .b({3'b010}), .o(n68));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(335[8:13])
    equal_3 equal_36 (.a({adr_i[2:0]}), .b({3'b101}), .o(n69));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(336[8:13])
    nor (n70, n100, n68, n69) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(333[6] 341[11])
    wide_select_4_32 select_38 (.sel({n100, n68, n69, n70}), .data({rbr, 
            4'b0000, iir, 1'b0, temt, thre, break_int, frame_err, 
            parity_err, overrun_err, rx_rdy, 8'b11111111}), .o({n71}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(333[6] 341[11])
    mux_8 mux_39 (.d0({dat_o[7:0]}), .d1({n71}), .cond(n66), .o({n80}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(332[10] 341[11])
    wide_dffrs_8 thr_nonfifo_c (.d({n126}), .set({8'b00000000}), .reset({reset, 
            reset, reset, reset, reset, reset, reset, reset}), 
            .clock(clk), .q({thr}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(361[13] 372[18])
    and (n99, n64, we_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(361[17:39])
    equal_3 equal_44 (.a({adr_i[2:0]}), .b({3'b001}), .o(n101));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(365[16:21])
    equal_3 equal_45 (.a({adr_i[2:0]}), .b({3'b011}), .o(n102));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(370[16:21])
    nor (n103, n100, n101, n102) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(362[11] 372[18])
    wide_select_4_32 select_47 (.sel({n100, n101, n102, n103}), .data({dat_i[7:0], 
            thr, thr, thr}), .o({n104}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(362[11] 372[18])
    wide_select_4_16 select_48 (.sel({n100, n101, n102, n103}), .data({ier, 
            dat_i[3:0], ier, ier}), .o({n113}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(362[11] 372[18])
    wide_select_4_28 select_49 (.sel({n100, n101, n102, n103}), .data({tx_break, 
            parity_stick, parity_even, parity_en, lcr[2], databits, 
            tx_break, parity_stick, parity_even, parity_en, lcr[2], 
            databits, dat_i[6:0], tx_break, parity_stick, parity_even, 
            parity_en, lcr[2], databits}), .o({n118}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(362[11] 372[18])
    mux_8 mux_50 (.d0({thr}), .d1({n104}), .cond(n99), .o({n126}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(361[13] 372[18])
    mux_4 mux_51 (.d0({ier}), .d1({n113}), .cond(n99), .o({n135}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(361[13] 372[18])
    mux_7 mux_52 (.d0({tx_break, parity_stick, parity_even, parity_en, 
          lcr[2], databits}), .d1({n118}), .cond(n99), .o({n140}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(361[13] 372[18])
    wide_dffrs_4 ier_c (.d({n135}), .set({4'b0000}), .reset({reset, reset, 
            reset, reset}), .clock(clk), .q({ier}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(361[13] 372[18])
    wide_dffrs_2 mcr_c8 (.d({mcr}), .set({2'b00}), .reset({reset, reset}), 
            .clock(clk), .q({mcr}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(361[13] 372[18])
    wide_dffrs_7 lcr_c (.d({n140}), .set({7'b0000000}), .reset({reset, 
            reset, reset, reset, reset, reset, reset}), .clock(clk), 
            .q({tx_break, parity_stick, parity_even, parity_en, lcr[2], 
            databits}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(361[13] 372[18])
    wide_dffrs_3 cs_state_c (.d({n259}), .set({3'b000}), .reset({reset, 
            reset, reset}), .clock(clk), .q({cs_state}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(579[11] 616[18])
    equal_1 equal_57 (.a({lcr[2]}), .b({1'b0}), .o(n173));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(430[22:38])
    equal_3 equal_58 (.a({lcr[2], databits}), .b({3'b100}), .o(n174));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(430[49:69])
    mux_2 mux_59 (.d0({2'b10}), .d1({2'b01}), .cond(n174), .o({n175}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(430[49:85])
    mux_2 mux_60 (.d0({n175}), .d1({2'b00}), .cond(n173), .o({stopbits}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(430[22:85])
    or (n181, rx_rdy_int, thre_int) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(491[18:39])
    or (n182, n181, dataerr_int) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(491[18:53])
    or (intr, n182, modem_int) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(491[18:65])
    or (n184, overrun_err, parity_err) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(501[24:48])
    or (n185, n184, frame_err) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(501[24:60])
    or (data_err, n185, break_int) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(501[24:72])
    or (n187, msr[0], msr[1]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(506[24:39])
    or (n188, n187, msr[2]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(506[24:48])
    or (modem_stat, n188, msr[3]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(506[24:57])
    equal_1 equal_74 (.a({rx_rdy}), .b({1'b1}), .o(n194));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(583[43:57])
    and (n195, n221, n194) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(583[25:57])
    equal_1 equal_76 (.a({ier[1]}), .b({1'b1}), .o(n196));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(585[25:39])
    equal_1 equal_77 (.a({thre}), .b({1'b1}), .o(n197));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(585[43:55])
    and (n198, n196, n197) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(585[25:55])
    equal_1 equal_79 (.a({ier[3]}), .b({1'b1}), .o(n199));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(588[25:39])
    equal_1 equal_80 (.a({modem_stat}), .b({1'b1}), .o(n200));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(588[43:61])
    and (n201, n199, n200) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(588[25:61])
    mux_3 mux_82 (.d0({cs_state}), .d1({3'b100}), .cond(n201), .o({n202}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(588[21] 589[35])
    mux_3 mux_83 (.d0({n202}), .d1({3'b011}), .cond(n198), .o({n206}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(588[21] 589[35])
    mux_3 mux_84 (.d0({n206}), .d1({3'b010}), .cond(n195), .o({n210}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(585[21] 589[35])
    mux_3 mux_85 (.d0({n210}), .d1({3'b001}), .cond(n233), .o({n214}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(583[21] 589[35])
    equal_1 equal_86 (.a({lsr_rd}), .b({1'b1}), .o(n218));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(593[13:36])
    equal_1 equal_87 (.a({ier[2]}), .b({1'b0}), .o(n219));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(593[40:56])
    or (n220, n218, n219) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(593[13:56])
    equal_1 equal_89 (.a({ier[0]}), .b({1'b1}), .o(n221));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(594[8:22])
    and (n222, n221, rx_rdy) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(594[8:32])
    mux_3 mux_91 (.d0({3'b000}), .d1({3'b010}), .cond(n222), .o({n223}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(597[13:30])
    mux_3 mux_92 (.d0({cs_state}), .d1({n223}), .cond(n220), .o({n227}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(593[9] 597[34])
    equal_1 equal_93 (.a({data_err}), .b({1'b1}), .o(n231));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(600[20:36])
    equal_1 equal_94 (.a({ier[2]}), .b({1'b1}), .o(n232));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(600[40:54])
    and (n233, n231, n232) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(600[20:54])
    equal_1 equal_96 (.a({rx_rdy}), .b({1'b0}), .o(n234));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(602[18:34])
    equal_1 equal_97 (.a({ier[0]}), .b({1'b0}), .o(n235));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(602[38:54])
    or (n236, n234, n235) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(602[18:54])
    mux_3 mux_99 (.d0({cs_state}), .d1({3'b000}), .cond(n236), .o({n237}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(602[14] 603[30])
    mux_3 mux_100 (.d0({n237}), .d1({3'b001}), .cond(n233), .o({n241}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(602[14] 603[30])
    equal_1 equal_101 (.a({thre}), .b({1'b0}), .o(n245));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(606[30:44])
    or (n246, iir_rd_strobe, n245) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(606[13:44])
    equal_1 equal_103 (.a({ier[1]}), .b({1'b0}), .o(n247));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(606[48:64])
    or (n248, n246, n247) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(606[13:64])
    mux_3 mux_105 (.d0({cs_state}), .d1({3'b000}), .cond(n248), .o({n249}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(606[9] 607[35])
    equal_1 equal_106 (.a({ier[3]}), .b({1'b0}), .o(n253));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(611[38:54])
    mux_3 mux_108 (.d0({cs_state}), .d1({3'b000}), .cond(n253), .o({n255}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(611[16] 612[35])
    wide_mux_3_24 mux_109 (.sel({cs_state}), .data({9'b000000000, n255, 
            n249, n241, n227, n214}), .o({n259}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(579[11] 616[18])
    VERIFIC_DFFRS ack_o_138 (.d(n269), .clk(clk), .s(dat_o[8]), .r(reset), 
            .q(ack_o));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(625[10] 628[21])
    assign n268 = n64 ? 1'b1 : ack_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(627[10] 628[21])
    assign n269 = ack_o ? dat_o[8] : n268;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(627[10] 628[21])
    equal_3 equal_119 (.a({cs_state}), .b({3'b001}), .o(dataerr_int));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(646[17:35])
    equal_3 equal_120 (.a({cs_state}), .b({3'b010}), .o(rx_rdy_int));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(647[17:35])
    equal_3 equal_121 (.a({cs_state}), .b({3'b011}), .o(thre_int));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(648[17:35])
    equal_3 equal_122 (.a({cs_state}), .b({3'b100}), .o(modem_int));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(650[17:35])
    mux_4 mux_123 (.d0({4'b0001}), .d1({4'b0000}), .cond(modem_int), .o({n279}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(650[17] 652[24])
    mux_4 mux_124 (.d0({n279}), .d1({4'b0010}), .cond(thre_int), .o({n284}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(648[17] 652[24])
    mux_4 mux_125 (.d0({n284}), .d1({4'b0100}), .cond(rx_rdy_int), .o({n289}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(647[17] 652[24])
    mux_4 mux_126 (.d0({n289}), .d1({4'b0110}), .cond(dataerr_int), .o({iir}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(646[17] 652[24])
    wide_dffrs_16 divisor_c9 (.d({n4}), .set({8'b00000000, reset, reset, 
            1'b0, reset, 4'b0000}), .reset({reset, reset, reset, 
            reset, reset, reset, reset, reset, 2'b00, reset, 1'b0, 
            reset, reset, reset, reset}), .clock(clk), .q({divisor}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(226[12] 227[32])
    
endmodule

//
// Verilog Description of OPERATOR mux_16
//

module mux_16 (d0, d1, cond, o);
    input [15:0]d0;
    input [15:0]d1;
    input cond;
    output [15:0]o;
    
    
    assign o[0] = cond ? d1[0] : d0[0];
    assign o[1] = cond ? d1[1] : d0[1];
    assign o[2] = cond ? d1[2] : d0[2];
    assign o[3] = cond ? d1[3] : d0[3];
    assign o[4] = cond ? d1[4] : d0[4];
    assign o[5] = cond ? d1[5] : d0[5];
    assign o[6] = cond ? d1[6] : d0[6];
    assign o[7] = cond ? d1[7] : d0[7];
    assign o[8] = cond ? d1[8] : d0[8];
    assign o[9] = cond ? d1[9] : d0[9];
    assign o[10] = cond ? d1[10] : d0[10];
    assign o[11] = cond ? d1[11] : d0[11];
    assign o[12] = cond ? d1[12] : d0[12];
    assign o[13] = cond ? d1[13] : d0[13];
    assign o[14] = cond ? d1[14] : d0[14];
    assign o[15] = cond ? d1[15] : d0[15];
    
endmodule

//
// Verilog Description of OPERATOR equal_3
//

module equal_3 (a, b, o);
    input [2:0]a;
    input [2:0]b;
    output o;
    
    
    wire n1, n2, n3, n4, n5;
    
    xor (n1, a[0], b[0]) ;
    xor (n2, a[1], b[1]) ;
    xor (n3, a[2], b[2]) ;
    or (n4, n2, n3) ;
    or (n5, n1, n4) ;
    not (o, n5) ;
    
endmodule

//
// Verilog Description of OPERATOR wide_select_4_32
//

module wide_select_4_32 (sel, data, o);
    input [3:0]sel;
    input [31:0]data;
    output [7:0]o;
    
    
    Select_4 Select_0 (.sel({sel}), .data({data[24], data[16], data[8], 
            data[0]}), .o(o[0]));
    Select_4 Select_1 (.sel({sel}), .data({data[25], data[17], data[9], 
            data[1]}), .o(o[1]));
    Select_4 Select_2 (.sel({sel}), .data({data[26], data[18], data[10], 
            data[2]}), .o(o[2]));
    Select_4 Select_3 (.sel({sel}), .data({data[27], data[19], data[11], 
            data[3]}), .o(o[3]));
    Select_4 Select_4 (.sel({sel}), .data({data[28], data[20], data[12], 
            data[4]}), .o(o[4]));
    Select_4 Select_5 (.sel({sel}), .data({data[29], data[21], data[13], 
            data[5]}), .o(o[5]));
    Select_4 Select_6 (.sel({sel}), .data({data[30], data[22], data[14], 
            data[6]}), .o(o[6]));
    Select_4 Select_7 (.sel({sel}), .data({data[31], data[23], data[15], 
            data[7]}), .o(o[7]));
    
endmodule

//
// Verilog Description of OPERATOR Select_4
//

module Select_4 (sel, data, o);
    input [3:0]sel;
    input [3:0]data;
    output o;
    
    
    wire n1, n2, n3, n4, n5, n6;
    
    and (n1, data[0], sel[0]) ;
    and (n2, data[1], sel[1]) ;
    and (n3, data[2], sel[2]) ;
    and (n4, data[3], sel[3]) ;
    or (n5, n1, n2) ;
    or (n6, n3, n4) ;
    or (o, n5, n6) ;
    
endmodule

//
// Verilog Description of OPERATOR wide_select_4_16
//

module wide_select_4_16 (sel, data, o);
    input [3:0]sel;
    input [15:0]data;
    output [3:0]o;
    
    
    Select_4 Select_0 (.sel({sel}), .data({data[12], data[8], data[4], 
            data[0]}), .o(o[0]));
    Select_4 Select_1 (.sel({sel}), .data({data[13], data[9], data[5], 
            data[1]}), .o(o[1]));
    Select_4 Select_2 (.sel({sel}), .data({data[14], data[10], data[6], 
            data[2]}), .o(o[2]));
    Select_4 Select_3 (.sel({sel}), .data({data[15], data[11], data[7], 
            data[3]}), .o(o[3]));
    
endmodule

//
// Verilog Description of OPERATOR wide_select_4_28
//

module wide_select_4_28 (sel, data, o);
    input [3:0]sel;
    input [27:0]data;
    output [6:0]o;
    
    
    Select_4 Select_0 (.sel({sel}), .data({data[21], data[14], data[7], 
            data[0]}), .o(o[0]));
    Select_4 Select_1 (.sel({sel}), .data({data[22], data[15], data[8], 
            data[1]}), .o(o[1]));
    Select_4 Select_2 (.sel({sel}), .data({data[23], data[16], data[9], 
            data[2]}), .o(o[2]));
    Select_4 Select_3 (.sel({sel}), .data({data[24], data[17], data[10], 
            data[3]}), .o(o[3]));
    Select_4 Select_4 (.sel({sel}), .data({data[25], data[18], data[11], 
            data[4]}), .o(o[4]));
    Select_4 Select_5 (.sel({sel}), .data({data[26], data[19], data[12], 
            data[5]}), .o(o[5]));
    Select_4 Select_6 (.sel({sel}), .data({data[27], data[20], data[13], 
            data[6]}), .o(o[6]));
    
endmodule

//
// Verilog Description of OPERATOR mux_7
//

module mux_7 (d0, d1, cond, o);
    input [6:0]d0;
    input [6:0]d1;
    input cond;
    output [6:0]o;
    
    
    assign o[0] = cond ? d1[0] : d0[0];
    assign o[1] = cond ? d1[1] : d0[1];
    assign o[2] = cond ? d1[2] : d0[2];
    assign o[3] = cond ? d1[3] : d0[3];
    assign o[4] = cond ? d1[4] : d0[4];
    assign o[5] = cond ? d1[5] : d0[5];
    assign o[6] = cond ? d1[6] : d0[6];
    
endmodule

//
// Verilog Description of OPERATOR wide_dffrs_2
//

module wide_dffrs_2 (d, set, reset, clock, q);
    input [1:0]d;
    input [1:0]set;
    input [1:0]reset;
    input clock;
    output [1:0]q;
    
    
    VERIFIC_DFFRS i1 (.d(d[0]), .clk(clock), .s(set[0]), .r(reset[0]), 
            .q(q[0]));
    VERIFIC_DFFRS i2 (.d(d[1]), .clk(clock), .s(set[1]), .r(reset[1]), 
            .q(q[1]));
    
endmodule

//
// Verilog Description of OPERATOR wide_dffrs_7
//

module wide_dffrs_7 (d, set, reset, clock, q);
    input [6:0]d;
    input [6:0]set;
    input [6:0]reset;
    input clock;
    output [6:0]q;
    
    
    VERIFIC_DFFRS i1 (.d(d[0]), .clk(clock), .s(set[0]), .r(reset[0]), 
            .q(q[0]));
    VERIFIC_DFFRS i2 (.d(d[1]), .clk(clock), .s(set[1]), .r(reset[1]), 
            .q(q[1]));
    VERIFIC_DFFRS i3 (.d(d[2]), .clk(clock), .s(set[2]), .r(reset[2]), 
            .q(q[2]));
    VERIFIC_DFFRS i4 (.d(d[3]), .clk(clock), .s(set[3]), .r(reset[3]), 
            .q(q[3]));
    VERIFIC_DFFRS i5 (.d(d[4]), .clk(clock), .s(set[4]), .r(reset[4]), 
            .q(q[4]));
    VERIFIC_DFFRS i6 (.d(d[5]), .clk(clock), .s(set[5]), .r(reset[5]), 
            .q(q[5]));
    VERIFIC_DFFRS i7 (.d(d[6]), .clk(clock), .s(set[6]), .r(reset[6]), 
            .q(q[6]));
    
endmodule

//
// Verilog Description of OPERATOR wide_dffrs_3
//

module wide_dffrs_3 (d, set, reset, clock, q);
    input [2:0]d;
    input [2:0]set;
    input [2:0]reset;
    input clock;
    output [2:0]q;
    
    
    VERIFIC_DFFRS i1 (.d(d[0]), .clk(clock), .s(set[0]), .r(reset[0]), 
            .q(q[0]));
    VERIFIC_DFFRS i2 (.d(d[1]), .clk(clock), .s(set[1]), .r(reset[1]), 
            .q(q[1]));
    VERIFIC_DFFRS i3 (.d(d[2]), .clk(clock), .s(set[2]), .r(reset[2]), 
            .q(q[2]));
    
endmodule

//
// Verilog Description of OPERATOR mux_2
//

module mux_2 (d0, d1, cond, o);
    input [1:0]d0;
    input [1:0]d1;
    input cond;
    output [1:0]o;
    
    
    assign o[0] = cond ? d1[0] : d0[0];
    assign o[1] = cond ? d1[1] : d0[1];
    
endmodule

//
// Verilog Description of OPERATOR mux_3
//

module mux_3 (d0, d1, cond, o);
    input [2:0]d0;
    input [2:0]d1;
    input cond;
    output [2:0]o;
    
    
    assign o[0] = cond ? d1[0] : d0[0];
    assign o[1] = cond ? d1[1] : d0[1];
    assign o[2] = cond ? d1[2] : d0[2];
    
endmodule

//
// Verilog Description of OPERATOR wide_mux_3_24
//

module wide_mux_3_24 (sel, data, o);
    input [2:0]sel;
    input [23:0]data;
    output [2:0]o;
    
    
    Mux_3u_8u Mux_0 (.sel({sel}), .data({data[21], data[18], data[15], 
            data[12], data[9], data[6], data[3], data[0]}), .o(o[0]));
    Mux_3u_8u Mux_1 (.sel({sel}), .data({data[22], data[19], data[16], 
            data[13], data[10], data[7], data[4], data[1]}), .o(o[1]));
    Mux_3u_8u Mux_2 (.sel({sel}), .data({data[23], data[20], data[17], 
            data[14], data[11], data[8], data[5], data[2]}), .o(o[2]));
    
endmodule

//
// Verilog Description of OPERATOR Mux_3u_8u
//

module Mux_3u_8u (sel, data, o);
    input [2:0]sel;
    input [7:0]data;
    output o;
    
    
    wire n1, n2, n3, n4, n5, n6;
    
    assign n1 = sel[0] ? data[1] : data[0];
    assign n2 = sel[0] ? data[3] : data[2];
    assign n3 = sel[1] ? n2 : n1;
    assign n4 = sel[0] ? data[5] : data[4];
    assign n5 = sel[0] ? data[7] : data[6];
    assign n6 = sel[1] ? n5 : n4;
    assign o = sel[2] ? n6 : n3;
    
endmodule

//
// Verilog Description of OPERATOR wide_dffrs_16
//

module wide_dffrs_16 (d, set, reset, clock, q);
    input [15:0]d;
    input [15:0]set;
    input [15:0]reset;
    input clock;
    output [15:0]q;
    
    
    VERIFIC_DFFRS i1 (.d(d[0]), .clk(clock), .s(set[0]), .r(reset[0]), 
            .q(q[0]));
    VERIFIC_DFFRS i2 (.d(d[1]), .clk(clock), .s(set[1]), .r(reset[1]), 
            .q(q[1]));
    VERIFIC_DFFRS i3 (.d(d[2]), .clk(clock), .s(set[2]), .r(reset[2]), 
            .q(q[2]));
    VERIFIC_DFFRS i4 (.d(d[3]), .clk(clock), .s(set[3]), .r(reset[3]), 
            .q(q[3]));
    VERIFIC_DFFRS i5 (.d(d[4]), .clk(clock), .s(set[4]), .r(reset[4]), 
            .q(q[4]));
    VERIFIC_DFFRS i6 (.d(d[5]), .clk(clock), .s(set[5]), .r(reset[5]), 
            .q(q[5]));
    VERIFIC_DFFRS i7 (.d(d[6]), .clk(clock), .s(set[6]), .r(reset[6]), 
            .q(q[6]));
    VERIFIC_DFFRS i8 (.d(d[7]), .clk(clock), .s(set[7]), .r(reset[7]), 
            .q(q[7]));
    VERIFIC_DFFRS i9 (.d(d[8]), .clk(clock), .s(set[8]), .r(reset[8]), 
            .q(q[8]));
    VERIFIC_DFFRS i10 (.d(d[9]), .clk(clock), .s(set[9]), .r(reset[9]), 
            .q(q[9]));
    VERIFIC_DFFRS i11 (.d(d[10]), .clk(clock), .s(set[10]), .r(reset[10]), 
            .q(q[10]));
    VERIFIC_DFFRS i12 (.d(d[11]), .clk(clock), .s(set[11]), .r(reset[11]), 
            .q(q[11]));
    VERIFIC_DFFRS i13 (.d(d[12]), .clk(clock), .s(set[12]), .r(reset[12]), 
            .q(q[12]));
    VERIFIC_DFFRS i14 (.d(d[13]), .clk(clock), .s(set[13]), .r(reset[13]), 
            .q(q[13]));
    VERIFIC_DFFRS i15 (.d(d[14]), .clk(clock), .s(set[14]), .r(reset[14]), 
            .q(q[14]));
    VERIFIC_DFFRS i16 (.d(d[15]), .clk(clock), .s(set[15]), .r(reset[15]), 
            .q(q[15]));
    
endmodule

//
// Verilog Description of module \rxcver(DATAWIDTH=8,FIFO=0) 
//

module \rxcver(DATAWIDTH=8,FIFO=0)  (reset, clk, rbr, rbr_fifo, rbr_rd, 
            lsr_rd, sin, databits, parity_en, parity_even, parity_stick, 
            rx_rdy, overrun_err, parity_err, frame_err, break_int, 
            fifo_empty, fifo_almost_full, divisor) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(49[8:14])
    input reset;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(79[18:23])
    input clk;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(80[18:21])
    output [7:0]rbr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(90[28:31])
    output [7:0]rbr_fifo;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(89[27:35])
    input rbr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(81[18:24])
    input lsr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(82[18:24])
    input sin;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(83[18:21])
    input [1:0]databits;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(84[18:26])
    input parity_en;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(85[18:27])
    input parity_even;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(86[18:29])
    input parity_stick;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(87[18:30])
    output rx_rdy;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(91[16:22])
    output overrun_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(92[16:27])
    output parity_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(93[16:26])
    output frame_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(94[16:25])
    output break_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(95[16:25])
    output fifo_empty;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(96[28:38])
    output fifo_almost_full;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(97[28:44])
    input [15:0]divisor;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(98[28:35])
    
    wire [3:0]databit_recved_num;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(100[26:44])
    wire [7:0]rsr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(101[28:31])
    wire rx_parity_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(102[14:27])
    wire rx_frame_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(103[14:26])
    wire rx_idle;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(104[14:21])
    wire hunt;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(107[14:18])
    wire hunt_one;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(108[14:22])
    wire sin_d0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(109[14:20])
    wire rx_frame_err_d1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(111[14:29])
    wire rx_idle_d1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(112[14:24])
    wire sampled_once;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(117[14:26])
    wire [2:0]cs_state;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(132[17:25])
    wire [15:0]counter;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(144[17:24])
    wire sin_d0_delay;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(147[17:29])
    
    wire n4, n6, n8, n10, n11, n12, n13, n14, n15, n17, 
        n19, n21, n22, n23, n28, n29, n31, n32, n33, n34, 
        n35, n39, n40, n41;
    wire [2:0]n42;
    wire [15:0]n46;
    
    wire n63, n64, n65;
    wire [2:0]n66;
    wire [7:0]n70;
    wire [3:0]n79;
    
    wire n84, n85;
    wire [2:0]n86;
    wire [7:0]n90;
    wire [3:0]n99;
    
    wire n104, n105, n106;
    wire [15:0]n107;
    wire [2:0]n124;
    wire [15:0]n128;
    wire [3:0]n148;
    wire [7:0]n153;
    
    wire n162;
    wire [3:0]n163;
    
    wire n169, n170, n171, n172, n173, n174, n175, n176, n177, 
        n178, n179, n180, n181, n182, n183, n184;
    wire [2:0]n185;
    wire [2:0]n189;
    wire [2:0]n210;
    
    wire n232, n233, n234, n236, n237, n238;
    wire [2:0]n257;
    
    wire n280;
    wire [2:0]n281;
    wire [2:0]n302;
    wire [7:0]n306;
    wire [3:0]n315;
    
    wire n320, n321;
    wire [15:0]n322;
    
    wire n376, n377, n378;
    wire [7:0]n379;
    wire [7:0]n388;
    
    wire n411, n412, n413, n414, n415, n416, n417, n418, n419, 
        n420, n421, n422, n423, n424, n425;
    
    xor (n236, sin_d0, n234) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(336[28:52])
    equal_3 equal_3 (.a({cs_state}), .b({3'b000}), .o(n4));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(158[15:33])
    and (n6, n4, n39) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(158[15:53])
    and (n8, n6, n40) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(158[15:73])
    and (n10, sampled_once, n33) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(161[15:38])
    not (n11, rx_idle) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(165[15:23])
    or (n12, n11, sin_d0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(165[15:33])
    assign n13 = n12 ? 1'b0 : hunt;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(165[11] 166[21])
    assign n14 = n10 ? 1'b1 : n13;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(165[11] 166[21])
    assign n15 = n8 ? 1'b1 : n14;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(161[11] 166[21])
    VERIFIC_DFFRS hunt_one_149 (.d(n23), .clk(clk), .s(1'b0), .r(reset), 
            .q(hunt_one));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(180[14] 183[28])
    equal_1 equal_16 (.a({rx_idle}), .b({1'b0}), .o(n17));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(182[18:35])
    equal_16 equal_17 (.a({counter}), .b({1'b0, divisor[15:1]}), .o(n63));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(182[39:61])
    and (n19, n17, n63) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(182[18:61])
    equal_1 equal_19 (.a({sin_d0}), .b({1'b1}), .o(n64));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(182[65:81])
    and (n21, n19, n64) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(182[18:81])
    assign n22 = n21 ? 1'b1 : hunt_one;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(182[14] 183[28])
    assign n23 = hunt ? 1'b0 : n22;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(182[14] 183[28])
    VERIFIC_DFFRS rbr_datardy_150 (.d(n29), .clk(clk), .s(1'b0), .r(reset), 
            .q(rx_rdy));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(211[14] 219[12])
    assign n28 = n378 ? 1'b1 : rx_rdy;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(216[17] 218[33])
    assign n29 = rbr_rd ? 1'b0 : n28;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(216[17] 218[33])
    VERIFIC_DFFRS sampled_once_151 (.d(n35), .clk(clk), .s(1'b0), .r(reset), 
            .q(sampled_once));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(232[14] 236[32])
    not (n31, rx_frame_err_d1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(232[34:50])
    and (n32, rx_frame_err, n31) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(232[18:50])
    not (n33, sin_d0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(232[54:61])
    and (n34, n32, n33) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(232[18:61])
    and (n35, n34, hunt_one) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(232[18:73])
    wide_dffrs_8 rsr_c (.d({n306}), .set({8'b00000000}), .reset({reset, 
            reset, reset, reset, reset, reset, reset, reset}), 
            .clock(clk), .q({rsr}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(278[14] 359[18])
    equal_1 equal_38 (.a({sin_d0}), .b({1'b0}), .o(n39));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(280[10:26])
    equal_1 equal_39 (.a({sin_d0_delay}), .b({1'b1}), .o(n40));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(280[30:52])
    and (n41, n39, n40) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(280[10:52])
    mux_3 mux_41 (.d0({cs_state}), .d1({3'b100}), .cond(n41), .o({n42}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(280[6] 282[16])
    sub_16 sub_42 (.a({divisor}), .b({16'b0000000000000001}), .o({n46}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(283[16:30])
    not (n65, parity_even) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(292[42:55])
    mux_3 mux_46 (.d0({cs_state}), .d1({3'b000}), .cond(n64), .o({n66}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(289[14] 294[12])
    mux_8 mux_47 (.d0({8'b00000000}), .d1({rsr}), .cond(n64), .o({n70}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(289[14] 294[12])
    mux_4 mux_48 (.d0({4'b0000}), .d1({databit_recved_num}), .cond(n64), 
          .o({n79}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(289[14] 294[12])
    assign n84 = n64 ? rx_parity_err : n65;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(289[14] 294[12])
    assign n85 = n64 ? rx_frame_err : 1'b0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(289[14] 294[12])
    mux_3 mux_51 (.d0({cs_state}), .d1({n66}), .cond(n63), .o({n86}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(286[7] 295[17])
    mux_8 mux_52 (.d0({rsr}), .d1({n70}), .cond(n63), .o({n90}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(286[7] 295[17])
    mux_4 mux_53 (.d0({databit_recved_num}), .d1({n79}), .cond(n63), .o({n99}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(286[7] 295[17])
    assign n104 = n63 ? n84 : rx_parity_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(286[7] 295[17])
    assign n105 = n63 ? n85 : rx_frame_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(286[7] 295[17])
    equal_16 equal_56 (.a({counter}), .b({16'b0000000000000001}), .o(n106));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(297[17:51])
    sub_16 sub_57 (.a({counter}), .b({16'b0000000000000001}), .o({n107}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(302[26:40])
    mux_3 mux_58 (.d0({n86}), .d1({3'b001}), .cond(n106), .o({n124}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(302[15:41])
    mux_16 mux_59 (.d0({n107}), .d1({divisor}), .cond(n106), .o({n128}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(302[15:41])
    add_4u_4u add_62 (.cin(1'b0), .a({databit_recved_num}), .b({4'b0001}), 
            .o({n148}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(309[45:67])
    mux_8 mux_63 (.d0({rsr}), .d1({sin_d0, rsr[7:1]}), .cond(n63), .o({n153}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(306[21] 310[24])
    assign n162 = n63 ? n233 : rx_parity_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(306[21] 310[24])
    mux_4 mux_65 (.d0({databit_recved_num}), .d1({n148}), .cond(n63), 
          .o({n163}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(306[21] 310[24])
    equal_2 equal_67 (.a({databits}), .b({2'b00}), .o(n169));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(313[14:29])
    equal_4 equal_68 (.a({databit_recved_num}), .b({4'b0101}), .o(n170));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(313[33:59])
    and (n171, n169, n170) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(313[13:60])
    equal_2 equal_70 (.a({databits}), .b({2'b01}), .o(n172));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(314[28:43])
    equal_4 equal_71 (.a({databit_recved_num}), .b({4'b0110}), .o(n173));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(314[47:73])
    and (n174, n172, n173) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(314[27:74])
    or (n175, n171, n174) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(313[13] 314[74])
    equal_2 equal_74 (.a({databits}), .b({2'b10}), .o(n176));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(315[28:43])
    equal_4 equal_75 (.a({databit_recved_num}), .b({4'b0111}), .o(n177));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(315[47:73])
    and (n178, n176, n177) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(315[27:74])
    or (n179, n175, n178) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(313[13] 315[74])
    equal_2 equal_78 (.a({databits}), .b({2'b11}), .o(n180));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(316[28:43])
    equal_4 equal_79 (.a({databit_recved_num}), .b({4'b1000}), .o(n181));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(316[47:73])
    and (n182, n180, n181) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(316[27:74])
    or (n183, n179, n182) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(313[13] 316[74])
    equal_1 equal_82 (.a({parity_en}), .b({1'b0}), .o(n184));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(317[31:48])
    mux_3 mux_83 (.d0({3'b010}), .d1({3'b011}), .cond(n184), .o({n185}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(320[29:48])
    mux_3 mux_84 (.d0({cs_state}), .d1({n185}), .cond(n183), .o({n189}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(313[9] 320[48])
    mux_3 mux_86 (.d0({cs_state}), .d1({n189}), .cond(n106), .o({n210}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(325[23:49])
    equal_1 equal_89 (.a({parity_stick}), .b({1'b0}), .o(n232));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(330[28:48])
    xor (n233, rx_parity_err, sin_d0) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(331[43:65])
    equal_1 equal_91 (.a({parity_even}), .b({1'b0}), .o(n234));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(333[30:49])
    assign n237 = n232 ? n233 : n236;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(333[26] 336[52])
    assign n238 = n63 ? n237 : rx_parity_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(329[22] 337[11])
    mux_3 mux_98 (.d0({cs_state}), .d1({3'b011}), .cond(n106), .o({n257}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(344[23:49])
    assign n280 = n63 ? n33 : rx_frame_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(348[13] 354[16])
    mux_3 mux_103 (.d0({cs_state}), .d1({3'b000}), .cond(n63), .o({n281}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(348[13] 354[16])
    wide_mux_3_24 mux_105 (.sel({cs_state}), .data({9'b000000000, n124, 
            n281, n257, n210, n42}), .o({n302}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(278[14] 359[18])
    wide_mux_3_64 mux_106 (.sel({cs_state}), .data({rsr, rsr, rsr, n90, 
            rsr, rsr, n153, rsr}), .o({n306}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(278[14] 359[18])
    wide_mux_3_32 mux_107 (.sel({cs_state}), .data({databit_recved_num, 
            databit_recved_num, databit_recved_num, n99, databit_recved_num, 
            databit_recved_num, n163, databit_recved_num}), .o({n315}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(278[14] 359[18])
    Mux_3u_8u Mux_108 (.sel({cs_state}), .data({rx_parity_err, rx_parity_err, 
            rx_parity_err, n104, rx_parity_err, n238, n162, rx_parity_err}), 
            .o(n320));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(278[14] 359[18])
    Mux_3u_8u Mux_109 (.sel({cs_state}), .data({rx_frame_err, rx_frame_err, 
            rx_frame_err, n105, n280, rx_frame_err, rx_frame_err, 
            rx_frame_err}), .o(n321));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(278[14] 359[18])
    wide_mux_3_128 mux_110 (.sel({cs_state}), .data({counter, counter, 
            counter, n128, n107, n128, n128, n46}), .o({n322}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(278[14] 359[18])
    wide_dffrs_4 databit_recved_num_c (.d({n315}), .set({4'b0000}), .reset({reset, 
            reset, reset, reset}), .clock(clk), .q({databit_recved_num}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(278[14] 359[18])
    VERIFIC_DFFRS rx_parity_err_156 (.d(n320), .clk(clk), .s(reset), .r(1'b0), 
            .q(rx_parity_err));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(278[14] 359[18])
    VERIFIC_DFFRS rx_frame_err_157 (.d(n321), .clk(clk), .s(1'b0), .r(reset), 
            .q(rx_frame_err));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(278[14] 359[18])
    wide_dffrs_3 cs_state_c (.d({n302}), .set({3'b000}), .reset({reset, 
            reset, reset}), .clock(clk), .q({cs_state}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(278[14] 359[18])
    wide_dffrs_16 counter_c (.d({n322}), .set({16'b0000000000000000}), .reset({reset, 
            reset, reset, reset, reset, reset, reset, reset, reset, 
            reset, reset, reset, reset, reset, reset, reset}), 
            .clock(clk), .q({counter}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(278[14] 359[18])
    wide_dffrs_8 rbr_c10 (.d({n388}), .set({8'b00000000}), .reset({reset, 
            reset, reset, reset, reset, reset, reset, reset}), 
            .clock(clk), .q({rbr}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(413[14] 419[18])
    equal_1 equal_117 (.a({rx_idle}), .b({1'b1}), .o(n376));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(413[18:35])
    equal_1 equal_118 (.a({rx_idle_d1}), .b({1'b0}), .o(n377));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(413[39:59])
    and (n378, n376, n377) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(413[18:59])
    wide_mux_2_32 mux_120 (.sel({databits}), .data({rsr, 1'b0, rsr[7:1], 
            2'b00, rsr[7:2], 3'b000, rsr[7:3]}), .o({n379}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(414[11] 419[18])
    mux_8 mux_121 (.d0({rbr}), .d1({n379}), .cond(n378), .o({n388}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(413[14] 419[18])
    VERIFIC_DFFRS sin_d0_161 (.d(sin), .clk(clk), .s(1'b0), .r(reset), 
            .q(sin_d0));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(431[14] 437[14])
    VERIFIC_DFFRS sin_d0_delay_162 (.d(sin_d0), .clk(clk), .s(1'b0), .r(reset), 
            .q(sin_d0_delay));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(431[14] 437[14])
    VERIFIC_DFFRS rx_frame_err_d1_164 (.d(rx_frame_err), .clk(clk), .s(reset), 
            .r(1'b0), .q(rx_frame_err_d1));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(445[14] 452[12])
    VERIFIC_DFFRS rx_idle_d1_165 (.d(rx_idle), .clk(clk), .s(reset), .r(1'b0), 
            .q(rx_idle_d1));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(459[14] 462[14])
    VERIFIC_DFFRS overrun_err_int_166 (.d(n422), .clk(clk), .s(1'b0), 
            .r(reset), .q(overrun_err));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(514[14] 529[14])
    not (n411, rx_idle_d1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(514[29:40])
    and (n412, rx_idle, n411) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(514[18:40])
    or (n413, parity_err, rx_parity_err) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(518[30:62])
    and (n414, n413, parity_en) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(518[30:74])
    or (n415, frame_err, rx_frame_err) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(520[30:58])
    not (n416, hunt_one) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(522[46:58])
    or (n417, break_int, n416) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(522[30:58])
    assign n418 = lsr_rd ? 1'b0 : parity_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(524[14] 529[14])
    assign n419 = lsr_rd ? 1'b0 : frame_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(524[14] 529[14])
    assign n420 = lsr_rd ? 1'b0 : overrun_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(524[14] 529[14])
    assign n421 = lsr_rd ? 1'b0 : break_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(524[14] 529[14])
    assign n422 = n412 ? rx_rdy : n420;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(524[14] 529[14])
    assign n423 = n412 ? n414 : n418;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(524[14] 529[14])
    assign n424 = n412 ? n415 : n419;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(524[14] 529[14])
    assign n425 = n412 ? n417 : n421;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(524[14] 529[14])
    VERIFIC_DFFRS parity_err_int_167 (.d(n423), .clk(clk), .s(1'b0), .r(reset), 
            .q(parity_err));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(514[14] 529[14])
    VERIFIC_DFFRS frame_err_int_168 (.d(n424), .clk(clk), .s(1'b0), .r(reset), 
            .q(frame_err));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(514[14] 529[14])
    VERIFIC_DFFRS break_int_int_169 (.d(n425), .clk(clk), .s(1'b0), .r(reset), 
            .q(break_int));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(514[14] 529[14])
    VERIFIC_DFFRS hunt_148 (.d(n15), .clk(clk), .s(1'b0), .r(reset), 
            .q(hunt));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(158[11] 166[21])
    VERIFIC_DFFRS rx_idle_153 (.d(n4), .clk(clk), .s(reset), .r(1'b0), 
            .q(rx_idle));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(244[11] 247[27])
    
endmodule

//
// Verilog Description of OPERATOR equal_16
//

module equal_16 (a, b, o);
    input [15:0]a;
    input [15:0]b;
    output o;
    
    
    wire n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, 
        n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, 
        n22, n23, n24, n25, n26, n27, n28, n29, n30, n31;
    
    xor (n1, a[0], b[0]) ;
    xor (n2, a[1], b[1]) ;
    xor (n3, a[2], b[2]) ;
    xor (n4, a[3], b[3]) ;
    xor (n5, a[4], b[4]) ;
    xor (n6, a[5], b[5]) ;
    xor (n7, a[6], b[6]) ;
    xor (n8, a[7], b[7]) ;
    xor (n9, a[8], b[8]) ;
    xor (n10, a[9], b[9]) ;
    xor (n11, a[10], b[10]) ;
    xor (n12, a[11], b[11]) ;
    xor (n13, a[12], b[12]) ;
    xor (n14, a[13], b[13]) ;
    xor (n15, a[14], b[14]) ;
    xor (n16, a[15], b[15]) ;
    or (n17, n1, n2) ;
    or (n18, n3, n4) ;
    or (n19, n17, n18) ;
    or (n20, n5, n6) ;
    or (n21, n7, n8) ;
    or (n22, n20, n21) ;
    or (n23, n19, n22) ;
    or (n24, n9, n10) ;
    or (n25, n11, n12) ;
    or (n26, n24, n25) ;
    or (n27, n13, n14) ;
    or (n28, n15, n16) ;
    or (n29, n27, n28) ;
    or (n30, n26, n29) ;
    or (n31, n23, n30) ;
    not (o, n31) ;
    
endmodule

//
// Verilog Description of OPERATOR sub_16
//

module sub_16 (a, b, o);
    input [15:0]a;
    input [15:0]b;
    output [15:0]o;
    
    wire [15:0]n1;
    
    inv_16 inv_0 (.i({b}), .o({n1}));
    add_16u_16u add_2 (.cin(1'b1), .a({a}), .b({n1}), .o({o}));
    
endmodule

//
// Verilog Description of OPERATOR inv_16
//

module inv_16 (i, o);
    input [15:0]i;
    output [15:0]o;
    
    
    not (o[0], i[0]) ;
    not (o[1], i[1]) ;
    not (o[2], i[2]) ;
    not (o[3], i[3]) ;
    not (o[4], i[4]) ;
    not (o[5], i[5]) ;
    not (o[6], i[6]) ;
    not (o[7], i[7]) ;
    not (o[8], i[8]) ;
    not (o[9], i[9]) ;
    not (o[10], i[10]) ;
    not (o[11], i[11]) ;
    not (o[12], i[12]) ;
    not (o[13], i[13]) ;
    not (o[14], i[14]) ;
    not (o[15], i[15]) ;
    
endmodule

//
// Verilog Description of OPERATOR add_16u_16u
//

module add_16u_16u (cin, a, b, o, cout);
    input cin;
    input [15:0]a;
    input [15:0]b;
    output [15:0]o;
    output cout;
    
    
    wire n2, n4, n6, n8, n10, n12, n14, n16, n18, n20, n22, 
        n24, n26, n28, n30;
    
    VERIFIC_FADD i1 (.cin(cin), .a(a[0]), .b(b[0]), .o(o[0]), .cout(n2));
    VERIFIC_FADD i2 (.cin(n2), .a(a[1]), .b(b[1]), .o(o[1]), .cout(n4));
    VERIFIC_FADD i3 (.cin(n4), .a(a[2]), .b(b[2]), .o(o[2]), .cout(n6));
    VERIFIC_FADD i4 (.cin(n6), .a(a[3]), .b(b[3]), .o(o[3]), .cout(n8));
    VERIFIC_FADD i5 (.cin(n8), .a(a[4]), .b(b[4]), .o(o[4]), .cout(n10));
    VERIFIC_FADD i6 (.cin(n10), .a(a[5]), .b(b[5]), .o(o[5]), .cout(n12));
    VERIFIC_FADD i7 (.cin(n12), .a(a[6]), .b(b[6]), .o(o[6]), .cout(n14));
    VERIFIC_FADD i8 (.cin(n14), .a(a[7]), .b(b[7]), .o(o[7]), .cout(n16));
    VERIFIC_FADD i9 (.cin(n16), .a(a[8]), .b(b[8]), .o(o[8]), .cout(n18));
    VERIFIC_FADD i10 (.cin(n18), .a(a[9]), .b(b[9]), .o(o[9]), .cout(n20));
    VERIFIC_FADD i11 (.cin(n20), .a(a[10]), .b(b[10]), .o(o[10]), .cout(n22));
    VERIFIC_FADD i12 (.cin(n22), .a(a[11]), .b(b[11]), .o(o[11]), .cout(n24));
    VERIFIC_FADD i13 (.cin(n24), .a(a[12]), .b(b[12]), .o(o[12]), .cout(n26));
    VERIFIC_FADD i14 (.cin(n26), .a(a[13]), .b(b[13]), .o(o[13]), .cout(n28));
    VERIFIC_FADD i15 (.cin(n28), .a(a[14]), .b(b[14]), .o(o[14]), .cout(n30));
    VERIFIC_FADD i16 (.cin(n30), .a(a[15]), .b(b[15]), .o(o[15]), .cout(cout));
    
endmodule

//
// Verilog Description of OPERATOR wide_mux_3_64
//

module wide_mux_3_64 (sel, data, o);
    input [2:0]sel;
    input [63:0]data;
    output [7:0]o;
    
    
    Mux_3u_8u Mux_0 (.sel({sel}), .data({data[56], data[48], data[40], 
            data[32], data[24], data[16], data[8], data[0]}), .o(o[0]));
    Mux_3u_8u Mux_1 (.sel({sel}), .data({data[57], data[49], data[41], 
            data[33], data[25], data[17], data[9], data[1]}), .o(o[1]));
    Mux_3u_8u Mux_2 (.sel({sel}), .data({data[58], data[50], data[42], 
            data[34], data[26], data[18], data[10], data[2]}), .o(o[2]));
    Mux_3u_8u Mux_3 (.sel({sel}), .data({data[59], data[51], data[43], 
            data[35], data[27], data[19], data[11], data[3]}), .o(o[3]));
    Mux_3u_8u Mux_4 (.sel({sel}), .data({data[60], data[52], data[44], 
            data[36], data[28], data[20], data[12], data[4]}), .o(o[4]));
    Mux_3u_8u Mux_5 (.sel({sel}), .data({data[61], data[53], data[45], 
            data[37], data[29], data[21], data[13], data[5]}), .o(o[5]));
    Mux_3u_8u Mux_6 (.sel({sel}), .data({data[62], data[54], data[46], 
            data[38], data[30], data[22], data[14], data[6]}), .o(o[6]));
    Mux_3u_8u Mux_7 (.sel({sel}), .data({data[63], data[55], data[47], 
            data[39], data[31], data[23], data[15], data[7]}), .o(o[7]));
    
endmodule

//
// Verilog Description of OPERATOR wide_mux_3_32
//

module wide_mux_3_32 (sel, data, o);
    input [2:0]sel;
    input [31:0]data;
    output [3:0]o;
    
    
    Mux_3u_8u Mux_0 (.sel({sel}), .data({data[28], data[24], data[20], 
            data[16], data[12], data[8], data[4], data[0]}), .o(o[0]));
    Mux_3u_8u Mux_1 (.sel({sel}), .data({data[29], data[25], data[21], 
            data[17], data[13], data[9], data[5], data[1]}), .o(o[1]));
    Mux_3u_8u Mux_2 (.sel({sel}), .data({data[30], data[26], data[22], 
            data[18], data[14], data[10], data[6], data[2]}), .o(o[2]));
    Mux_3u_8u Mux_3 (.sel({sel}), .data({data[31], data[27], data[23], 
            data[19], data[15], data[11], data[7], data[3]}), .o(o[3]));
    
endmodule

//
// Verilog Description of OPERATOR wide_mux_3_128
//

module wide_mux_3_128 (sel, data, o);
    input [2:0]sel;
    input [127:0]data;
    output [15:0]o;
    
    
    Mux_3u_8u Mux_0 (.sel({sel}), .data({data[112], data[96], data[80], 
            data[64], data[48], data[32], data[16], data[0]}), .o(o[0]));
    Mux_3u_8u Mux_1 (.sel({sel}), .data({data[113], data[97], data[81], 
            data[65], data[49], data[33], data[17], data[1]}), .o(o[1]));
    Mux_3u_8u Mux_2 (.sel({sel}), .data({data[114], data[98], data[82], 
            data[66], data[50], data[34], data[18], data[2]}), .o(o[2]));
    Mux_3u_8u Mux_3 (.sel({sel}), .data({data[115], data[99], data[83], 
            data[67], data[51], data[35], data[19], data[3]}), .o(o[3]));
    Mux_3u_8u Mux_4 (.sel({sel}), .data({data[116], data[100], data[84], 
            data[68], data[52], data[36], data[20], data[4]}), .o(o[4]));
    Mux_3u_8u Mux_5 (.sel({sel}), .data({data[117], data[101], data[85], 
            data[69], data[53], data[37], data[21], data[5]}), .o(o[5]));
    Mux_3u_8u Mux_6 (.sel({sel}), .data({data[118], data[102], data[86], 
            data[70], data[54], data[38], data[22], data[6]}), .o(o[6]));
    Mux_3u_8u Mux_7 (.sel({sel}), .data({data[119], data[103], data[87], 
            data[71], data[55], data[39], data[23], data[7]}), .o(o[7]));
    Mux_3u_8u Mux_8 (.sel({sel}), .data({data[120], data[104], data[88], 
            data[72], data[56], data[40], data[24], data[8]}), .o(o[8]));
    Mux_3u_8u Mux_9 (.sel({sel}), .data({data[121], data[105], data[89], 
            data[73], data[57], data[41], data[25], data[9]}), .o(o[9]));
    Mux_3u_8u Mux_10 (.sel({sel}), .data({data[122], data[106], data[90], 
            data[74], data[58], data[42], data[26], data[10]}), .o(o[10]));
    Mux_3u_8u Mux_11 (.sel({sel}), .data({data[123], data[107], data[91], 
            data[75], data[59], data[43], data[27], data[11]}), .o(o[11]));
    Mux_3u_8u Mux_12 (.sel({sel}), .data({data[124], data[108], data[92], 
            data[76], data[60], data[44], data[28], data[12]}), .o(o[12]));
    Mux_3u_8u Mux_13 (.sel({sel}), .data({data[125], data[109], data[93], 
            data[77], data[61], data[45], data[29], data[13]}), .o(o[13]));
    Mux_3u_8u Mux_14 (.sel({sel}), .data({data[126], data[110], data[94], 
            data[78], data[62], data[46], data[30], data[14]}), .o(o[14]));
    Mux_3u_8u Mux_15 (.sel({sel}), .data({data[127], data[111], data[95], 
            data[79], data[63], data[47], data[31], data[15]}), .o(o[15]));
    
endmodule

//
// Verilog Description of OPERATOR wide_mux_2_32
//

module wide_mux_2_32 (sel, data, o);
    input [1:0]sel;
    input [31:0]data;
    output [7:0]o;
    
    
    Mux_2u_4u Mux_0 (.sel({sel}), .data({data[24], data[16], data[8], 
            data[0]}), .o(o[0]));
    Mux_2u_4u Mux_1 (.sel({sel}), .data({data[25], data[17], data[9], 
            data[1]}), .o(o[1]));
    Mux_2u_4u Mux_2 (.sel({sel}), .data({data[26], data[18], data[10], 
            data[2]}), .o(o[2]));
    Mux_2u_4u Mux_3 (.sel({sel}), .data({data[27], data[19], data[11], 
            data[3]}), .o(o[3]));
    Mux_2u_4u Mux_4 (.sel({sel}), .data({data[28], data[20], data[12], 
            data[4]}), .o(o[4]));
    Mux_2u_4u Mux_5 (.sel({sel}), .data({data[29], data[21], data[13], 
            data[5]}), .o(o[5]));
    Mux_2u_4u Mux_6 (.sel({sel}), .data({data[30], data[22], data[14], 
            data[6]}), .o(o[6]));
    Mux_2u_4u Mux_7 (.sel({sel}), .data({data[31], data[23], data[15], 
            data[7]}), .o(o[7]));
    
endmodule

//
// Verilog Description of OPERATOR Mux_2u_4u
//

module Mux_2u_4u (sel, data, o);
    input [1:0]sel;
    input [3:0]data;
    output o;
    
    
    wire n1, n2;
    
    assign n1 = sel[0] ? data[1] : data[0];
    assign n2 = sel[0] ? data[3] : data[2];
    assign o = sel[1] ? n2 : n1;
    
endmodule

//
// Verilog Description of module \txmitt(DATAWIDTH=8,FIFO=0) 
//

module \txmitt(DATAWIDTH=8,FIFO=0)  (reset, clk, thr, thr_wr, sout, 
            databits, stopbits, parity_en, parity_even, parity_stick, 
            tx_break, thre, temt, fifo_empty_thr, thr_rd, divisor) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(48[8:14])
    input reset;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(68[12:17])
    input clk;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(69[12:15])
    input [7:0]thr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(70[28:31])
    input thr_wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(72[28:34])
    output sout;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(84[28:32])
    input [1:0]databits;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(73[28:36])
    input [1:0]stopbits;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(74[28:36])
    input parity_en;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(75[28:37])
    input parity_even;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(76[28:39])
    input parity_stick;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(77[28:40])
    input tx_break;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(78[28:36])
    output thre;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(82[28:32])
    output temt;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(83[28:32])
    input fifo_empty_thr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(79[28:42])
    output thr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(80[28:34])
    input [15:0]divisor;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(85[28:35])
    
    wire tx_output;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(87[28:37])
    wire [7:0]tsr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(88[28:31])
    wire tx_parity;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(89[28:37])
    wire tsr_empty;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(91[28:37])
    wire tx_in_shift_s;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(93[28:41])
    wire tx_in_stop_s;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(94[28:40])
    wire tx_in_shift_s1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(95[28:42])
    wire tx_in_stop_s1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(96[28:41])
    wire [2:0]tx_cnt;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(99[28:34])
    wire thr_rd_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(101[28:38])
    wire thr_rd_delay;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(102[28:40])
    wire [2:0]tx_state;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(114[13:21])
    wire [15:0]counter;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(115[14:21])
    
    wire n4, n6;
    wire [2:0]n7;
    
    wire n11, n12, n13;
    wire [15:0]n14;
    wire [15:0]n31;
    wire [2:0]n48;
    
    wire n52;
    wire [2:0]n53;
    wire [7:0]n57;
    wire [15:0]n66;
    wire [2:0]n83;
    
    wire n87;
    wire [2:0]n88;
    wire [7:0]n92;
    
    wire n103;
    wire [2:0]n105;
    
    wire n109, n110, n111, n112, n113, n114, n115, n116, n117, 
        n118, n119, n120, n121, n122, n123;
    wire [2:0]n124;
    wire [2:0]n128;
    
    wire n149;
    wire [7:0]n167;
    wire [2:0]n176;
    wire [2:0]n180;
    
    wire n201;
    wire [7:0]n202;
    wire [2:0]n211;
    wire [2:0]n215;
    wire [2:0]n255;
    wire [2:0]n276;
    
    wire n281, n284, n285;
    wire [2:0]n286;
    wire [2:0]n290;
    wire [2:0]n328;
    wire [2:0]n349;
    wire [2:0]n450;
    wire [15:0]n454;
    wire [2:0]n471;
    wire [2:0]n475;
    wire [15:0]n479;
    
    wire n496;
    wire [2:0]n497;
    wire [7:0]n501;
    
    wire n510, n547, n548, n549, n550, n551, n552, n553, n554, 
        n556, n557, n558, n559, n563, n565, n567, n568, n570;
    
    not (n4, thr_rd_delay) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(127[33:46])
    and (thr_rd, thr_rd_int, n4) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(127[20:46])
    not (n6, thre) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(286[17:27])
    mux_3 mux_6 (.d0({tx_state}), .d1({3'b110}), .cond(n6), .o({n7}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(286[13] 287[34])
    nor (n11, counter[15], counter[14], counter[13], counter[12], 
          counter[11], counter[10], counter[9], counter[8], counter[7], 
          counter[6], counter[5], counter[4], counter[3], counter[2], 
          counter[1], counter[0]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(290[18:27])
    equal_16 equal_8 (.a({counter}), .b({16'b0000000000000001}), .o(n12));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(293[12:46])
    not (n13, parity_even) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(296[31:43])
    sub_16 sub_10 (.a({counter}), .b({16'b0000000000000001}), .o({n14}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(301[21:35])
    mux_16 mux_11 (.d0({n14}), .d1({16'b0000000000000000}), .cond(n12), 
           .o({n31}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(301[10:36])
    mux_3 mux_12 (.d0({tx_state}), .d1({3'b001}), .cond(n12), .o({n48}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(301[10:36])
    assign n52 = n12 ? n13 : tx_parity;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(301[10:36])
    mux_3 mux_14 (.d0({tx_cnt}), .d1({3'b000}), .cond(n12), .o({n53}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(301[10:36])
    mux_8 mux_15 (.d0({tsr}), .d1({thr}), .cond(n12), .o({n57}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(301[10:36])
    mux_16 mux_16 (.d0({n31}), .d1({divisor}), .cond(n11), .o({n66}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(292[18] 302[10])
    mux_3 mux_17 (.d0({n48}), .d1({tx_state}), .cond(n11), .o({n83}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(292[18] 302[10])
    assign n87 = n11 ? tx_parity : n52;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(292[18] 302[10])
    mux_3 mux_19 (.d0({n53}), .d1({tx_cnt}), .cond(n11), .o({n88}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(292[18] 302[10])
    mux_8 mux_20 (.d0({n57}), .d1({tsr}), .cond(n11), .o({n92}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(292[18] 302[10])
    xor (n103, tx_parity, tsr[0]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(312[16:34])
    add_3u_3u add_24 (.cin(1'b0), .a({tx_cnt}), .b({3'b001}), .o({n105}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(315[27:37])
    equal_2 equal_25 (.a({databits}), .b({2'b00}), .o(n109));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(316[22:37])
    equal_3 equal_26 (.a({tx_cnt}), .b({3'b100}), .o(n110));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(316[41:53])
    and (n111, n109, n110) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(316[21:54])
    equal_2 equal_28 (.a({databits}), .b({2'b01}), .o(n112));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(317[22:37])
    equal_3 equal_29 (.a({tx_cnt}), .b({3'b101}), .o(n113));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(317[41:53])
    and (n114, n112, n113) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(317[21:54])
    or (n115, n111, n114) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(316[21] 317[54])
    equal_2 equal_32 (.a({databits}), .b({2'b10}), .o(n116));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(318[22:37])
    equal_3 equal_33 (.a({tx_cnt}), .b({3'b110}), .o(n117));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(318[41:53])
    and (n118, n116, n117) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(318[21:54])
    or (n119, n115, n118) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(316[21] 318[54])
    equal_2 equal_36 (.a({databits}), .b({2'b11}), .o(n120));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(319[22:37])
    equal_3 equal_37 (.a({tx_cnt}), .b({3'b111}), .o(n121));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(319[41:53])
    and (n122, n120, n121) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(319[21:54])
    or (n123, n119, n122) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(316[21] 319[54])
    mux_3 mux_40 (.d0({3'b011}), .d1({3'b010}), .cond(parity_en), .o({n124}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(320[33:65])
    mux_3 mux_41 (.d0({tx_state}), .d1({n124}), .cond(n123), .o({n128}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(316[17] 320[66])
    assign n149 = n12 ? n103 : tx_parity;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(323[10:36])
    mux_8 mux_45 (.d0({tsr}), .d1({1'b0, tsr[7:1]}), .cond(n12), .o({n167}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(323[10:36])
    mux_3 mux_46 (.d0({tx_cnt}), .d1({n105}), .cond(n12), .o({n176}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(323[10:36])
    mux_3 mux_47 (.d0({tx_state}), .d1({n128}), .cond(n12), .o({n180}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(323[10:36])
    assign n201 = n11 ? tx_parity : n149;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(310[19] 324[17])
    mux_8 mux_50 (.d0({n167}), .d1({tsr}), .cond(n11), .o({n202}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(310[19] 324[17])
    mux_3 mux_51 (.d0({n176}), .d1({tx_cnt}), .cond(n11), .o({n211}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(310[19] 324[17])
    mux_3 mux_52 (.d0({n180}), .d1({tx_state}), .cond(n11), .o({n215}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(310[19] 324[17])
    mux_3 mux_57 (.d0({tx_state}), .d1({3'b011}), .cond(n12), .o({n255}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(336[3:29])
    mux_3 mux_59 (.d0({n255}), .d1({tx_state}), .cond(n11), .o({n276}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(330[19] 337[17])
    assign n281 = parity_stick ? n13 : tx_parity;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(338[27:70])
    equal_2 equal_64 (.a({stopbits}), .b({2'b00}), .o(n284));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(347[21:38])
    equal_2 equal_65 (.a({stopbits}), .b({2'b01}), .o(n285));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(349[26:43])
    mux_3 mux_66 (.d0({3'b100}), .d1({3'b101}), .cond(n285), .o({n286}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(352[20:42])
    mux_3 mux_67 (.d0({n286}), .d1({3'b000}), .cond(n284), .o({n290}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(349[22] 352[42])
    mux_3 mux_70 (.d0({tx_state}), .d1({n290}), .cond(n12), .o({n328}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(355[3:29])
    mux_3 mux_72 (.d0({n328}), .d1({tx_state}), .cond(n11), .o({n349}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(344[19] 356[17])
    mux_3 mux_84 (.d0({tx_state}), .d1({3'b000}), .cond(n12), .o({n450}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(383[10:36])
    mux_16 mux_85 (.d0({n31}), .d1({1'b0, divisor[15:1]}), .cond(n11), 
           .o({n454}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(377[19] 384[17])
    mux_3 mux_86 (.d0({n450}), .d1({tx_state}), .cond(n11), .o({n471}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(377[19] 384[17])
    wide_mux_3_24 mux_87 (.sel({tx_state}), .data({3'b000, n83, n471, 
            n471, n349, n276, n215, n7}), .o({n475}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(284[9] 389[16])
    wide_mux_3_128 mux_88 (.sel({tx_state}), .data({counter, n66, n454, 
            n66, n66, n66, n66, counter}), .o({n479}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(284[9] 389[16])
    Mux_3u_8u Mux_89 (.sel({tx_state}), .data({tx_parity, n87, tx_parity, 
            tx_parity, tx_parity, tx_parity, n201, tx_parity}), .o(n496));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(284[9] 389[16])
    wide_mux_3_24 mux_90 (.sel({tx_state}), .data({tx_cnt, n88, tx_cnt, 
            tx_cnt, tx_cnt, tx_cnt, n211, tx_cnt}), .o({n497}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(284[9] 389[16])
    wide_mux_3_64 mux_91 (.sel({tx_state}), .data({tsr, n92, tsr, tsr, 
            tsr, tsr, n202, tsr}), .o({n501}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(284[9] 389[16])
    Mux_3u_8u Mux_92 (.sel({tx_state}), .data({tx_output, 4'b0111, n281, 
            tsr[0], tx_output}), .o(n510));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(284[9] 389[16])
    wide_dffrs_8 tsr_c (.d({n501}), .set({8'b00000000}), .reset({reset, 
            reset, reset, reset, reset, reset, reset, reset}), 
            .clock(clk), .q({tsr}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(283[11] 390[9])
    VERIFIC_DFFRS tx_parity_129 (.d(n496), .clk(clk), .s(reset), .r(1'b0), 
            .q(tx_parity));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(283[11] 390[9])
    wide_dffrs_3 tx_state_c (.d({n475}), .set({3'b000}), .reset({reset, 
            reset, reset}), .clock(clk), .q({tx_state}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(283[11] 390[9])
    wide_dffrs_16 counter_c (.d({n479}), .set({16'b0000000000000000}), .reset({reset, 
            reset, reset, reset, reset, reset, reset, reset, reset, 
            reset, reset, reset, reset, reset, reset, reset}), 
            .clock(clk), .q({counter}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(283[11] 390[9])
    VERIFIC_DFFRS tsr_empty_132 (.d(n554), .clk(clk), .s(reset), .r(1'b0), 
            .q(tsr_empty));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(421[14] 424[29])
    equal_1 equal_99 (.a({tx_in_stop_s}), .b({1'b0}), .o(n547));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(421[18:38])
    equal_1 equal_100 (.a({tx_in_stop_s1}), .b({1'b1}), .o(n548));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(421[42:63])
    and (n549, n547, n548) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(421[18:63])
    equal_1 equal_102 (.a({tx_in_shift_s}), .b({1'b1}), .o(n550));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(423[18:39])
    equal_1 equal_103 (.a({tx_in_shift_s1}), .b({1'b0}), .o(n551));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(423[43:65])
    and (n552, n550, n551) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(423[18:65])
    assign n553 = n552 ? 1'b0 : tsr_empty;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(423[14] 424[29])
    assign n554 = n549 ? 1'b1 : n553;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(423[14] 424[29])
    VERIFIC_DFFRS thr_empty_133 (.d(n559), .clk(clk), .s(reset), .r(1'b0), 
            .q(thre));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(449[11] 452[26])
    not (n556, tx_in_shift_s1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(451[32:47])
    and (n557, tx_in_shift_s, n556) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(451[15:47])
    assign n558 = n557 ? 1'b1 : thre;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(451[11] 452[26])
    assign n559 = thr_wr ? 1'b0 : n558;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(451[11] 452[26])
    VERIFIC_DFFRS tx_in_shift_s1_134 (.d(tx_in_shift_s), .clk(clk), .s(1'b0), 
            .r(reset), .q(tx_in_shift_s1));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(469[14] 472[14])
    VERIFIC_DFFRS tx_in_stop_s1_135 (.d(tx_in_stop_s), .clk(clk), .s(1'b0), 
            .r(reset), .q(tx_in_stop_s1));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(469[14] 472[14])
    VERIFIC_DFFRS tx_in_shift_s_136 (.d(n563), .clk(clk), .s(1'b0), .r(reset), 
            .q(tx_in_shift_s));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(483[14] 486[33])
    equal_3 equal_115 (.a({tx_state}), .b({3'b001}), .o(n563));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(483[18:35])
    VERIFIC_DFFRS tx_in_stop_s_137 (.d(n565), .clk(clk), .s(1'b0), .r(reset), 
            .q(tx_in_stop_s));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(493[14] 496[32])
    equal_3 equal_117 (.a({tx_state}), .b({3'b011}), .o(n565));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(493[18:39])
    equal_1 equal_119 (.a({thre}), .b({1'b1}), .o(n567));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(508[16:33])
    equal_1 equal_120 (.a({tsr_empty}), .b({1'b1}), .o(n568));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(508[37:54])
    and (temt, n567, n568) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(508[15:55])
    equal_1 equal_122 (.a({tx_break}), .b({1'b1}), .o(n570));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(512[16:32])
    assign sout = n570 ? 1'b0 : tx_output;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(512[16:51])
    wide_dffrs_3 tx_cnt_c (.d({n497}), .set({3'b000}), .reset({reset, 
            reset, reset}), .clock(clk), .q({tx_cnt}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(283[11] 390[9])
    VERIFIC_DFFRS tx_output_128 (.d(n510), .clk(clk), .s(reset), .r(1'b0), 
            .q(tx_output));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(283[11] 390[9])
    
endmodule

//
// Verilog Description of OPERATOR add_3u_3u
//

module add_3u_3u (cin, a, b, o, cout);
    input cin;
    input [2:0]a;
    input [2:0]b;
    output [2:0]o;
    output cout;
    
    
    wire n2, n4;
    
    VERIFIC_FADD i1 (.cin(cin), .a(a[0]), .b(b[0]), .o(o[0]), .cout(n2));
    VERIFIC_FADD i2 (.cin(n2), .a(a[1]), .b(b[1]), .o(o[1]), .cout(n4));
    VERIFIC_FADD i3 (.cin(n4), .a(a[2]), .b(b[2]), .o(o[2]), .cout(cout));
    
endmodule

//
// Verilog Description of module \modem(DATAWIDTH=8) 
//

module \modem(DATAWIDTH=8)  (reset, clk, msr, mcr, msr_rd, dcd_n, 
            cts_n, dsr_n, ri_n, dtr_n, rts_n) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(49[8:13])
    input reset;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(69[26:31])
    input clk;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(70[26:29])
    output [7:0]msr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(79[26:29])
    input [1:0]mcr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(71[26:29])
    input msr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(73[26:32])
    input dcd_n;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(75[26:31])
    input cts_n;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(76[26:31])
    input dsr_n;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(77[26:31])
    input ri_n;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(78[26:30])
    output dtr_n;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(81[26:31])
    output rts_n;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(82[26:31])
    
    wire ctsn_d1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(85[26:33])
    wire dsrn_d1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(86[26:33])
    wire dcdn_d1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(87[26:33])
    wire rin_d1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(88[26:32])
    
    wire n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, 
        n17, n18;
    wire [7:0]n19;
    
    not (dtr_n, mcr[0]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(90[18:25])
    not (rts_n, mcr[1]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(91[18:25])
    xor (n6, ctsn_d1, cts_n) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(115[38:55])
    or (n7, msr[0], n6) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(115[25:55])
    xor (n8, dsrn_d1, dsr_n) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(116[38:55])
    or (n9, msr[1], n8) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(116[25:55])
    not (n10, rin_d1) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(117[39:46])
    and (n11, n10, ri_n) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(117[38:55])
    or (n12, msr[2], n11) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(117[25:55])
    xor (n13, dcdn_d1, dcd_n) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(118[38:55])
    or (n14, msr[3], n13) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(118[25:55])
    not (n15, cts_n) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(119[25:31])
    not (n16, dsr_n) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(120[25:31])
    not (n17, ri_n) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(121[25:30])
    not (n18, dcd_n) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(122[25:31])
    mux_8 mux_18 (.d0({n18, n17, n16, n15, n14, n12, n9, n7}), 
          .d1({8'b00000000}), .cond(msr_rd), .o({n19}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(114[14] 123[14])
    VERIFIC_DFFRS dsrn_d1_28 (.d(dsr_n), .clk(clk), .s(reset), .r(1'b0), 
            .q(dsrn_d1));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(107[11] 124[12])
    VERIFIC_DFFRS dcdn_d1_29 (.d(dcd_n), .clk(clk), .s(reset), .r(1'b0), 
            .q(dcdn_d1));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(107[11] 124[12])
    VERIFIC_DFFRS rin_d1_30 (.d(ri_n), .clk(clk), .s(reset), .r(1'b0), 
            .q(rin_d1));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(107[11] 124[12])
    wide_dffrs_8 msr_reg_c (.d({n19}), .set({8'b00000000}), .reset({reset, 
            reset, reset, reset, reset, reset, reset, reset}), 
            .clock(clk), .q({msr}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(107[11] 124[12])
    VERIFIC_DFFRS ctsn_d1_27 (.d(cts_n), .clk(clk), .s(reset), .r(1'b0), 
            .q(ctsn_d1));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(107[11] 124[12])
    
endmodule

//
// Verilog Description of module adc_wb
//

module adc_wb (clk_i, rst_i, dat_i, stb_i, cyc_i, we_i, dat_o, 
            led, ack_o, analog_cmp, analog_out) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(46[8:14])
    input clk_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(47[9:14])
    input rst_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(48[9:14])
    input [7:0]dat_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(49[15:20])
    input stb_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(50[9:14])
    input cyc_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(51[9:14])
    input we_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(52[9:13])
    output [7:0]dat_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(53[16:21])
    output [7:0]led;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(54[20:23])
    output ack_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(55[10:15])
    input analog_cmp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(57[9:19])
    output analog_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(58[10:20])
    
    wire [7:0]adc_dig_data;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(60[14:26])
    
    assign ack_o = stb_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(50[9:14])
    inv_8 inv_3 (.i({adc_dig_data}), .o({dat_o}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(62[16:29])
    ADC_top adc_inst (.clk_in(clk_i), .rstn(1'b1), .digital_out({adc_dig_data}), 
            .analog_cmp(analog_cmp), .analog_out(analog_out));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_wb.v(65[9] 71[16])
    
endmodule

//
// Verilog Description of OPERATOR inv_8
//

module inv_8 (i, o);
    input [7:0]i;
    output [7:0]o;
    
    
    not (o[0], i[0]) ;
    not (o[1], i[1]) ;
    not (o[2], i[2]) ;
    not (o[3], i[3]) ;
    not (o[4], i[4]) ;
    not (o[5], i[5]) ;
    not (o[6], i[6]) ;
    not (o[7], i[7]) ;
    
endmodule

//
// Verilog Description of module ADC_top
//

module ADC_top (clk_in, rstn, digital_out, analog_cmp, analog_out, 
            sample_rdy) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_top.v(62[8:15])
    input clk_in;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_top.v(78[7:13])
    input rstn;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_top.v(79[7:11])
    output [7:0]digital_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_top.v(85[14:25])
    input analog_cmp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_top.v(80[7:17])
    output analog_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_top.v(83[8:18])
    output sample_rdy;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_top.v(84[9:19])
    
    wire [7:0]digital_out_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_top.v(96[24:37])
    wire [7:0]digital_out_abs;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_top.v(97[24:39])
    
    \sigmadelta_adc(ADC_WIDTH=8,ACCUM_BITS=10,LPF_DEPTH_BITS=3)  SSD_ADC (.clk(clk_in), 
            .rstn(rstn), .digital_out({digital_out_i}), .analog_cmp(analog_cmp), 
            .analog_out(analog_out), .sample_rdy(sample_rdy));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_top.v(114[1] 121[3])
    inv_8 inv_3 (.i({digital_out_i}), .o({digital_out_abs}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_top.v(123[43:57])
    inv_8 inv_4 (.i({digital_out_abs}), .o({digital_out}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_top.v(132[24:40])
    
endmodule

//
// Verilog Description of module \sigmadelta_adc(ADC_WIDTH=8,ACCUM_BITS=10,LPF_DEPTH_BITS=3) 
//

module \sigmadelta_adc(ADC_WIDTH=8,ACCUM_BITS=10,LPF_DEPTH_BITS=3)  (clk, 
            rstn, digital_out, analog_cmp, analog_out, sample_rdy) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(62[8:22])
    input clk;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(76[7:10])
    input rstn;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(77[7:11])
    output [7:0]digital_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(83[24:35])
    input analog_cmp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(78[7:17])
    output analog_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(81[8:18])
    output sample_rdy;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(82[9:19])
    
    wire [9:0]sigma;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(92[26:31])
    wire [7:0]accum;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(93[29:34])
    wire [9:0]counter;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(94[26:33])
    wire rollover;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(95[11:19])
    wire accum_rdy;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(96[11:20])
    
    wire n6, n7, n8;
    wire [9:0]n10;
    wire [9:0]n21;
    wire [7:0]n32;
    wire [9:0]n41;
    wire [9:0]n85;
    
    wire n96;
    
    wide_dffrs_10 sigma_c (.d({n41}), .set({10'b0000000000}), .reset({n6, 
            n6, n6, n6, n6, n6, n6, n6, n6, n6}), .clock(clk), 
            .q({sigma}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(131[14] 141[8])
    not (n6, rstn) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(126[6:11])
    and (n7, sigma[9], sigma[8], sigma[7], sigma[6], sigma[5], sigma[4], 
        sigma[3], sigma[2], sigma[1], sigma[0]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(137[17:23])
    not_equal_1 not_equal_7 (.a({n7}), .b({1'b1}), .o(n8));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(137[17:31])
    add_10u_10u add_8 (.cin(1'b0), .a({sigma}), .b({9'b000000000, analog_out}), 
            .o({n10}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(138[26:39])
    mux_10 mux_9 (.d0({sigma}), .d1({n10}), .cond(n8), .o({n21}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(137[13] 138[40])
    mux_8 mux_10 (.d0({accum}), .d1({sigma[9:2]}), .cond(rollover), .o({n32}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(136[18] 139[12])
    mux_10 mux_11 (.d0({n21}), .d1({9'b000000000, analog_out}), .cond(rollover), 
           .o({n41}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(136[18] 139[12])
    wide_dffrs_8 accum_c (.d({n32}), .set({8'b00000000}), .reset({n6, 
            n6, n6, n6, n6, n6, n6, n6}), .clock(clk), .q({accum}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(131[14] 141[8])
    VERIFIC_DFFRS accum_rdy_25 (.d(rollover), .clk(clk), .s(1'b0), .r(n6), 
            .q(accum_rdy));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(131[14] 141[8])
    wide_dffrs_10 counter_c (.d({n85}), .set({10'b0000000000}), .reset({n6, 
            n6, n6, n6, n6, n6, n6, n6, n6, n6}), .clock(clk), 
            .q({counter}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(178[7] 181[6])
    \box_ave(ADC_WIDTH=8,LPF_DEPTH_BITS=3)  box_ave (.clk(clk), .rstn(rstn), 
            .sample(accum_rdy), .raw_data_in({accum}), .ave_data_out({digital_out}), 
            .data_out_valid(sample_rdy));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(157[1] 164[2])
    add_10u_10u add_17 (.cin(1'b0), .a({counter}), .b({10'b0000000001}), 
            .o({n85}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(179[14:25])
    and (n96, counter[9], counter[8], counter[7], counter[6], counter[5], 
            counter[4], counter[3], counter[2], counter[1], counter[0]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(180[15:23])
    VERIFIC_DFFRS rollover_27 (.d(n96), .clk(clk), .s(1'b0), .r(n6), 
            .q(rollover));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(178[7] 181[6])
    VERIFIC_DFFRS delta_22 (.d(analog_cmp), .clk(clk), .s(1'b0), .r(1'b0), 
            .q(analog_out));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(109[8] 112[4])
    
endmodule

//
// Verilog Description of OPERATOR not_equal_1
//

module not_equal_1 (a, b, o);
    input [0:0]a;
    input [0:0]b;
    output o;
    
    
    wire n1, n2;
    
    xor (n1, a[0], b[0]) ;
    not (n2, n1) ;
    not (o, n2) ;
    
endmodule

//
// Verilog Description of module \box_ave(ADC_WIDTH=8,LPF_DEPTH_BITS=3) 
//

module \box_ave(ADC_WIDTH=8,LPF_DEPTH_BITS=3)  (clk, rstn, sample, raw_data_in, 
            ave_data_out, data_out_valid) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(66[8:15])
    input clk;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(79[7:10])
    input rstn;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(80[7:11])
    input sample;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(81[7:13])
    input [7:0]raw_data_in;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(82[23:34])
    output [7:0]ave_data_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(85[24:36])
    output data_out_valid;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(86[8:22])
    
    wire [10:0]accum;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(94[41:46])
    wire [2:0]count;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(95[41:46])
    wire [7:0]raw_data_d1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(96[27:38])
    wire sample_d1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(98[5:14])
    wire sample_d2;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(98[16:25])
    wire accumulate;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(100[6:16])
    wire latch_result;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(101[6:18])
    
    wire n5, n18, n20;
    wire [2:0]n25;
    wire [2:0]n29;
    wire [10:0]n41;
    wire [10:0]n53;
    wire [10:0]n65;
    wire [7:0]n91;
    
    VERIFIC_DFFRS sample_d2_31 (.d(sample_d1), .clk(clk), .s(1'b0), .r(n5), 
            .q(sample_d2));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(115[11] 120[5])
    wide_dffrs_8 raw_data_d1_c (.d({raw_data_in}), .set({8'b00000000}), 
            .reset({n5, n5, n5, n5, n5, n5, n5, n5}), .clock(clk), 
            .q({raw_data_d1}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(115[11] 120[5])
    VERIFIC_DFFRS result_valid_33 (.d(latch_result), .clk(clk), .s(1'b0), 
            .r(n5), .q(data_out_valid));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(115[11] 120[5])
    wide_dffrs_3 count_c (.d({n29}), .set({3'b000}), .reset({n5, n5, 
            n5}), .clock(clk), .q({count}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(135[11] 137[5])
    not (n18, sample_d2) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(123[35:45])
    and (accumulate, sample_d1, n18) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(123[22:45])
    equal_32 equal_11 (.a({29'b00000000000000000000000000000, count}), .b({32'b00000000000000000000000000000000}), 
            .o(n20));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(124[38:50])
    and (latch_result, accumulate, n20) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(124[24:50])
    add_3u_3u add_15 (.cin(1'b0), .a({count}), .b({3'b001}), .o({n25}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(136[31:40])
    mux_3 mux_16 (.d0({count}), .d1({n25}), .cond(accumulate), .o({n29}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(136[6:41])
    wide_dffrs_11 accum_c (.d({n65}), .set({11'b00000000000}), .reset({n5, 
            n5, n5, n5, n5, n5, n5, n5, n5, n5, n5}), .clock(clk), 
            .q({accum}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(150[11] 156[5])
    add_11u_11u add_21 (.cin(1'b0), .a({accum}), .b({3'b000, raw_data_d1}), 
            .o({n41}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(155[26:45])
    mux_11 mux_22 (.d0({n41}), .d1({3'b000, raw_data_d1}), .cond(n20), 
           .o({n53}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(155[17:46])
    mux_11 mux_23 (.d0({accum}), .d1({n53}), .cond(accumulate), .o({n65}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(151[9] 155[46])
    wide_dffrs_8 ave_data_out_c11 (.d({n91}), .set({8'b00000000}), .reset({n5, 
            n5, n5, n5, n5, n5, n5, n5}), .clock(clk), .q({ave_data_out}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(170[14] 172[8])
    not (n5, rstn) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(168[6:11])
    mux_8 mux_27 (.d0({ave_data_out}), .d1({accum[10:3]}), .cond(latch_result), 
          .o({n91}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(170[14] 172[8])
    VERIFIC_DFFRS sample_d1_30 (.d(sample), .clk(clk), .s(1'b0), .r(n5), 
            .q(sample_d1));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(115[11] 120[5])
    
endmodule

//
// Verilog Description of OPERATOR equal_32
//

module equal_32 (a, b, o);
    input [31:0]a;
    input [31:0]b;
    output o;
    
    
    wire n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, 
        n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, 
        n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, 
        n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, 
        n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, 
        n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, 
        n62, n63;
    
    xor (n1, a[0], b[0]) ;
    xor (n2, a[1], b[1]) ;
    xor (n3, a[2], b[2]) ;
    xor (n4, a[3], b[3]) ;
    xor (n5, a[4], b[4]) ;
    xor (n6, a[5], b[5]) ;
    xor (n7, a[6], b[6]) ;
    xor (n8, a[7], b[7]) ;
    xor (n9, a[8], b[8]) ;
    xor (n10, a[9], b[9]) ;
    xor (n11, a[10], b[10]) ;
    xor (n12, a[11], b[11]) ;
    xor (n13, a[12], b[12]) ;
    xor (n14, a[13], b[13]) ;
    xor (n15, a[14], b[14]) ;
    xor (n16, a[15], b[15]) ;
    xor (n17, a[16], b[16]) ;
    xor (n18, a[17], b[17]) ;
    xor (n19, a[18], b[18]) ;
    xor (n20, a[19], b[19]) ;
    xor (n21, a[20], b[20]) ;
    xor (n22, a[21], b[21]) ;
    xor (n23, a[22], b[22]) ;
    xor (n24, a[23], b[23]) ;
    xor (n25, a[24], b[24]) ;
    xor (n26, a[25], b[25]) ;
    xor (n27, a[26], b[26]) ;
    xor (n28, a[27], b[27]) ;
    xor (n29, a[28], b[28]) ;
    xor (n30, a[29], b[29]) ;
    xor (n31, a[30], b[30]) ;
    xor (n32, a[31], b[31]) ;
    or (n33, n1, n2) ;
    or (n34, n3, n4) ;
    or (n35, n33, n34) ;
    or (n36, n5, n6) ;
    or (n37, n7, n8) ;
    or (n38, n36, n37) ;
    or (n39, n35, n38) ;
    or (n40, n9, n10) ;
    or (n41, n11, n12) ;
    or (n42, n40, n41) ;
    or (n43, n13, n14) ;
    or (n44, n15, n16) ;
    or (n45, n43, n44) ;
    or (n46, n42, n45) ;
    or (n47, n39, n46) ;
    or (n48, n17, n18) ;
    or (n49, n19, n20) ;
    or (n50, n48, n49) ;
    or (n51, n21, n22) ;
    or (n52, n23, n24) ;
    or (n53, n51, n52) ;
    or (n54, n50, n53) ;
    or (n55, n25, n26) ;
    or (n56, n27, n28) ;
    or (n57, n55, n56) ;
    or (n58, n29, n30) ;
    or (n59, n31, n32) ;
    or (n60, n58, n59) ;
    or (n61, n57, n60) ;
    or (n62, n54, n61) ;
    or (n63, n47, n62) ;
    not (o, n63) ;
    
endmodule

//
// Verilog Description of OPERATOR wide_dffrs_11
//

module wide_dffrs_11 (d, set, reset, clock, q);
    input [10:0]d;
    input [10:0]set;
    input [10:0]reset;
    input clock;
    output [10:0]q;
    
    
    VERIFIC_DFFRS i1 (.d(d[0]), .clk(clock), .s(set[0]), .r(reset[0]), 
            .q(q[0]));
    VERIFIC_DFFRS i2 (.d(d[1]), .clk(clock), .s(set[1]), .r(reset[1]), 
            .q(q[1]));
    VERIFIC_DFFRS i3 (.d(d[2]), .clk(clock), .s(set[2]), .r(reset[2]), 
            .q(q[2]));
    VERIFIC_DFFRS i4 (.d(d[3]), .clk(clock), .s(set[3]), .r(reset[3]), 
            .q(q[3]));
    VERIFIC_DFFRS i5 (.d(d[4]), .clk(clock), .s(set[4]), .r(reset[4]), 
            .q(q[4]));
    VERIFIC_DFFRS i6 (.d(d[5]), .clk(clock), .s(set[5]), .r(reset[5]), 
            .q(q[5]));
    VERIFIC_DFFRS i7 (.d(d[6]), .clk(clock), .s(set[6]), .r(reset[6]), 
            .q(q[6]));
    VERIFIC_DFFRS i8 (.d(d[7]), .clk(clock), .s(set[7]), .r(reset[7]), 
            .q(q[7]));
    VERIFIC_DFFRS i9 (.d(d[8]), .clk(clock), .s(set[8]), .r(reset[8]), 
            .q(q[8]));
    VERIFIC_DFFRS i10 (.d(d[9]), .clk(clock), .s(set[9]), .r(reset[9]), 
            .q(q[9]));
    VERIFIC_DFFRS i11 (.d(d[10]), .clk(clock), .s(set[10]), .r(reset[10]), 
            .q(q[10]));
    
endmodule

//
// Verilog Description of OPERATOR add_11u_11u
//

module add_11u_11u (cin, a, b, o, cout);
    input cin;
    input [10:0]a;
    input [10:0]b;
    output [10:0]o;
    output cout;
    
    
    wire n2, n4, n6, n8, n10, n12, n14, n16, n18, n20;
    
    VERIFIC_FADD i1 (.cin(cin), .a(a[0]), .b(b[0]), .o(o[0]), .cout(n2));
    VERIFIC_FADD i2 (.cin(n2), .a(a[1]), .b(b[1]), .o(o[1]), .cout(n4));
    VERIFIC_FADD i3 (.cin(n4), .a(a[2]), .b(b[2]), .o(o[2]), .cout(n6));
    VERIFIC_FADD i4 (.cin(n6), .a(a[3]), .b(b[3]), .o(o[3]), .cout(n8));
    VERIFIC_FADD i5 (.cin(n8), .a(a[4]), .b(b[4]), .o(o[4]), .cout(n10));
    VERIFIC_FADD i6 (.cin(n10), .a(a[5]), .b(b[5]), .o(o[5]), .cout(n12));
    VERIFIC_FADD i7 (.cin(n12), .a(a[6]), .b(b[6]), .o(o[6]), .cout(n14));
    VERIFIC_FADD i8 (.cin(n14), .a(a[7]), .b(b[7]), .o(o[7]), .cout(n16));
    VERIFIC_FADD i9 (.cin(n16), .a(a[8]), .b(b[8]), .o(o[8]), .cout(n18));
    VERIFIC_FADD i10 (.cin(n18), .a(a[9]), .b(b[9]), .o(o[9]), .cout(n20));
    VERIFIC_FADD i11 (.cin(n20), .a(a[10]), .b(b[10]), .o(o[10]), .cout(cout));
    
endmodule

//
// Verilog Description of OPERATOR mux_11
//

module mux_11 (d0, d1, cond, o);
    input [10:0]d0;
    input [10:0]d1;
    input cond;
    output [10:0]o;
    
    
    assign o[0] = cond ? d1[0] : d0[0];
    assign o[1] = cond ? d1[1] : d0[1];
    assign o[2] = cond ? d1[2] : d0[2];
    assign o[3] = cond ? d1[3] : d0[3];
    assign o[4] = cond ? d1[4] : d0[4];
    assign o[5] = cond ? d1[5] : d0[5];
    assign o[6] = cond ? d1[6] : d0[6];
    assign o[7] = cond ? d1[7] : d0[7];
    assign o[8] = cond ? d1[8] : d0[8];
    assign o[9] = cond ? d1[9] : d0[9];
    assign o[10] = cond ? d1[10] : d0[10];
    
endmodule

//
// Verilog Description of module rom_ebr_wb
//

module rom_ebr_wb (wb_clk_i, wb_rst_i, wb_adr_i, wb_dat_o, wb_stb_i, 
            wb_we_i, wb_ack_o) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rom_ebr_wb.v(45[8:18])
    input wb_clk_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rom_ebr_wb.v(47[14:22])
    input wb_rst_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rom_ebr_wb.v(48[14:22])
    input [9:0]wb_adr_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rom_ebr_wb.v(49[14:22])
    output [7:0]wb_dat_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rom_ebr_wb.v(50[14:22])
    input wb_stb_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rom_ebr_wb.v(51[14:22])
    input wb_we_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rom_ebr_wb.v(52[14:21])
    output wb_ack_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rom_ebr_wb.v(53[14:22])
    
    wire rom_ce;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rom_ebr_wb.v(55[6:35])
    
    wire n4;
    
    assign wb_ack_o = wb_stb_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rom_ebr_wb.v(51[14:22])
    not (n4, wb_we_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rom_ebr_wb.v(55[27:35])
    and (rom_ce, wb_ack_o, n4) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rom_ebr_wb.v(55[15:35])
    pmi_rom EXT_ROM_INST (.Address({wb_adr_i}), .OutClock(wb_clk_i), .OutClockEn(rom_ce), 
            .Reset(wb_rst_i), .Q({wb_dat_o}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rom_ebr_wb.v(68[13] 75[9])
    defparam EXT_ROM_INST.pmi_addr_depth = 512;
    defparam EXT_ROM_INST.pmi_addr_width = 9;
    defparam EXT_ROM_INST.pmi_data_width = 8;
    defparam EXT_ROM_INST.pmi_regmode = "reg";
    defparam EXT_ROM_INST.pmi_gsr = "disable";
    defparam EXT_ROM_INST.pmi_resetmode = "sync";
    defparam EXT_ROM_INST.pmi_optimization = "speed";
    defparam EXT_ROM_INST.pmi_init_file = "none";
    defparam EXT_ROM_INST.pmi_init_file_format = "binary";
    defparam EXT_ROM_INST.pmi_family = "EC";
    defparam EXT_ROM_INST.module_type = "pmi_rom";
    
endmodule

//
// Verilog Description of module pmi_rom_renamed_due_excessive_length_2
// module not written out since it is a black-box. 
//


//
// Verilog Description of module \spi(SHIFT_DIRECTION=0,CLOCK_PHASE=0,CLOCK_POLARITY=0,CLOCK_SEL=1,MASTER=1,SLAVE_NUMBER=1,DATA_LENGTH=8,DELAY_TIME=2,CLKCNT_WIDTH=5,INTERVAL_LENGTH=2) 
//

module \spi(SHIFT_DIRECTION=0,CLOCK_PHASE=0,CLOCK_POLARITY=0,CLOCK_SEL=1,MASTER=1,SLAVE_NUMBER=1,DATA_LENGTH=8,DELAY_TIME=2,CLKCNT_WIDTH=5,INTERVAL_LENGTH=2)  (SPI_ADR_I, 
            SPI_DAT_I, SPI_WE_I, SPI_CYC_I, SPI_STB_I, SPI_SEL_I, 
            SPI_CTI_I, SPI_BTE_I, SPI_LOCK_I, SPI_DAT_O, SPI_ACK_O, 
            SPI_INT_O, SPI_ERR_O, SPI_RTY_O, MISO_MASTER, MOSI_MASTER, 
            SS_N_MASTER, SCLK_MASTER, MISO_SLAVE, MOSI_SLAVE, SS_N_SLAVE, 
            SCLK_SLAVE, CLK_I, RST_I) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(48[8:11])
    input [7:0]SPI_ADR_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(90[24:33])
    input [7:0]SPI_DAT_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(91[24:33])
    input SPI_WE_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(92[24:32])
    input SPI_CYC_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(94[24:33])
    input SPI_STB_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(93[24:33])
    input [3:0]SPI_SEL_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(95[24:33])
    input [2:0]SPI_CTI_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(96[24:33])
    input [1:0]SPI_BTE_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(97[24:33])
    input SPI_LOCK_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(98[24:34])
    output [7:0]SPI_DAT_O;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(99[24:33])
    output SPI_ACK_O;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(100[24:33])
    output SPI_INT_O;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(101[24:33])
    output SPI_ERR_O;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(102[24:33])
    output SPI_RTY_O;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(103[24:33])
    input MISO_MASTER;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(106[24:35])
    output MOSI_MASTER;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(107[24:35])
    output [0:0]SS_N_MASTER;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(108[30:41])
    output SCLK_MASTER;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(109[24:35])
    output MISO_SLAVE;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(110[24:34])
    input MOSI_SLAVE;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(111[24:34])
    input SS_N_SLAVE;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(112[24:34])
    input SCLK_SLAVE;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(113[24:34])
    input CLK_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(115[24:29])
    input RST_I;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(116[24:29])
    
    wire dw00_cs;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(135[28:35])
    wire dw04_cs;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(136[28:35])
    wire dw08_cs;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(137[28:35])
    wire dw0c_cs;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(138[28:35])
    wire dw10_cs;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(139[28:35])
    wire reg_wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(140[28:34])
    wire reg_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(141[28:34])
    wire read_wait_done;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(142[28:42])
    wire [7:0]latch_s_data;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(143[28:40])
    wire [7:0]reg_rxdata;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(144[28:38])
    wire [7:0]reg_txdata;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(145[28:38])
    wire [7:0]rx_shift_data;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(146[28:41])
    wire [7:0]tx_shift_data;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(147[28:41])
    wire rx_latch_flag;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(148[28:41])
    wire [7:0]reg_control;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(150[28:39])
    wire [7:0]reg_status;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(158[28:38])
    wire [0:0]reg_ssmask;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(261[28:38])
    wire [4:0]clock_cnt;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(262[28:37])
    wire [5:0]data_cnt;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(263[28:36])
    wire pending_data;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(264[28:40])
    wire [2:0]c_status;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(265[28:36])
    wire [2:0]n_status;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(266[28:36])
    wire wait_one_tick_done;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(412[8:26])
    
    wire n4, n5, n6, n7, n8, n14, n15, n16, n17, n18;
    wire [7:0]n30;
    
    wire n48, n49;
    wire [7:0]n50;
    
    wire n69, n70, n71, n72, n73, n74, n75, n82, n83, n84, 
        n85, n86, n87, n88, n90, n91, n92, n93, n94, n98, 
        n99, n100, n104, n105;
    wire [31:0]n107;
    wire [31:0]n140;
    wire [31:0]n173;
    wire [31:0]n206;
    wire [31:0]n239;
    wire [7:0]n272;
    
    wire n290, n291, n296, n297, n298, n299, n300, n301, n307, 
        n310, n311, n313;
    wire [7:0]n314;
    
    wire n333, n336, n338;
    wire [4:0]n341;
    wire [4:0]n347;
    wire [4:0]n353;
    
    wire n369;
    wire [2:0]n370;
    
    wire n375, n376;
    wire [2:0]n377;
    
    wire n382, n383, n384, n385;
    wire [2:0]n386;
    wire [2:0]n391;
    
    wire n396, n397;
    wire [2:0]n398;
    wire [2:0]n402;
    
    wire n414, n419, n421, n426, n429, n433, n434, n435, n436, 
        n438, n439;
    wire [5:0]n441;
    wire [5:0]n448;
    wire [5:0]n455;
    wire [5:0]n462;
    wire [5:0]n469;
    
    wire n484, n485, n486, n487, n489, n490, n491, n492, n493;
    wire [31:0]n494;
    
    wire n527, n528, n529;
    wire [7:0]n530;
    
    wire n539;
    wire [7:0]n540;
    
    wire n549;
    wire [7:0]n550;
    
    wire n569, n571, n573, n574, n575, n577, n578, n579, n580, 
        n581, n582, n583, n584, n588, n589, n591, n592, n593, 
        n594, n595, n596, n599, n600, n601;
    
    assign SPI_ERR_O = SPI_RTY_O;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(102[24:33])
    assign SPI_RTY_O = 1'b0;
    xor (n307, SCLK_MASTER, n493) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(311[11] 312[46])
    equal_8 equal_3 (.a({SPI_ADR_I}), .b({8'b00000000}), .o(n4));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(177[27:52])
    equal_8 equal_4 (.a({SPI_ADR_I}), .b({8'b00000100}), .o(n5));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(178[27:52])
    equal_8 equal_5 (.a({SPI_ADR_I}), .b({8'b00001000}), .o(n6));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(179[27:52])
    equal_8 equal_6 (.a({SPI_ADR_I}), .b({8'b00001100}), .o(n7));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(180[27:52])
    equal_8 equal_7 (.a({SPI_ADR_I}), .b({8'b00010000}), .o(n8));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(181[27:52])
    VERIFIC_DFFRS dw04_cs_226 (.d(n5), .clk(CLK_I), .s(SPI_RTY_O), .r(RST_I), 
            .q(dw04_cs));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(176[15] 182[9])
    VERIFIC_DFFRS dw08_cs_227 (.d(n6), .clk(CLK_I), .s(SPI_RTY_O), .r(RST_I), 
            .q(dw08_cs));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(176[15] 182[9])
    VERIFIC_DFFRS dw0c_cs_228 (.d(n7), .clk(CLK_I), .s(SPI_RTY_O), .r(RST_I), 
            .q(dw0c_cs));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(176[15] 182[9])
    VERIFIC_DFFRS dw10_cs_229 (.d(n8), .clk(CLK_I), .s(SPI_RTY_O), .r(RST_I), 
            .q(dw10_cs));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(176[15] 182[9])
    VERIFIC_DFFRS reg_wr_230 (.d(n15), .clk(CLK_I), .s(SPI_RTY_O), .r(RST_I), 
            .q(reg_wr));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(188[15] 191[9])
    and (n14, SPI_WE_I, SPI_STB_I) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(189[32:53])
    and (n15, n14, SPI_CYC_I) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(189[32:66])
    not (n16, SPI_WE_I) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(190[31:40])
    and (n17, n16, SPI_STB_I) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(190[31:53])
    and (n18, n17, SPI_CYC_I) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(190[31:66])
    VERIFIC_DFFRS reg_rd_231 (.d(n18), .clk(CLK_I), .s(SPI_RTY_O), .r(RST_I), 
            .q(reg_rd));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(188[15] 191[9])
    wide_dffrs_8 latch_s_data_c (.d({SPI_DAT_I}), .set({8'b00000000}), .reset({RST_I, 
            RST_I, RST_I, RST_I, RST_I, RST_I, RST_I, RST_I}), 
            .clock(CLK_I), .q({latch_s_data}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(197[8:41])
    wide_dffrs_8 reg_rxdata_c (.d({n30}), .set({8'b00000000}), .reset({RST_I, 
            RST_I, RST_I, RST_I, RST_I, RST_I, RST_I, RST_I}), 
            .clock(CLK_I), .q({reg_rxdata}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(203[11] 204[53])
    mux_8 mux_21 (.d0({reg_rxdata}), .d1({rx_shift_data}), .cond(rx_latch_flag), 
          .o({n30}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(203[11] 204[53])
    wide_dffrs_8 reg_txdata_c (.d({n50}), .set({8'b00000000}), .reset({RST_I, 
            RST_I, RST_I, RST_I, RST_I, RST_I, RST_I, RST_I}), 
            .clock(CLK_I), .q({reg_txdata}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(210[11] 211[55])
    and (n48, reg_wr, dw04_cs) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(210[15:32])
    and (n49, n48, reg_status[5]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(210[15:44])
    mux_8 mux_25 (.d0({reg_txdata}), .d1({latch_s_data}), .cond(n49), 
          .o({n50}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(210[11] 211[55])
    VERIFIC_DFFRS reg_iroe_235 (.d(n70), .clk(CLK_I), .s(SPI_RTY_O), .r(RST_I), 
            .q(reg_control[0]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(226[10] 232[49])
    or (reg_status[7], reg_status[3], reg_status[2]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(214[30:47])
    and (n69, reg_wr, dw0c_cs) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(226[13:30])
    assign n70 = n69 ? latch_s_data[0] : reg_control[0];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(226[10] 232[49])
    assign n71 = n69 ? latch_s_data[1] : reg_control[1];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(226[10] 232[49])
    assign n72 = n69 ? latch_s_data[3] : reg_control[3];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(226[10] 232[49])
    assign n73 = n69 ? latch_s_data[4] : reg_control[4];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(226[10] 232[49])
    assign n74 = n69 ? latch_s_data[5] : reg_control[5];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(226[10] 232[49])
    assign n75 = n69 ? latch_s_data[7] : reg_control[7];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(226[10] 232[49])
    VERIFIC_DFFRS reg_itoe_236 (.d(n71), .clk(CLK_I), .s(SPI_RTY_O), .r(RST_I), 
            .q(reg_control[1]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(226[10] 232[49])
    VERIFIC_DFFRS reg_itrdy_237 (.d(n72), .clk(CLK_I), .s(SPI_RTY_O), 
            .r(RST_I), .q(reg_control[3]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(226[10] 232[49])
    VERIFIC_DFFRS reg_irrdy_238 (.d(n73), .clk(CLK_I), .s(SPI_RTY_O), 
            .r(RST_I), .q(reg_control[4]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(226[10] 232[49])
    VERIFIC_DFFRS reg_ie_239 (.d(n74), .clk(CLK_I), .s(SPI_RTY_O), .r(RST_I), 
            .q(reg_control[5]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(226[10] 232[49])
    VERIFIC_DFFRS reg_sso_240 (.d(n75), .clk(CLK_I), .s(SPI_RTY_O), .r(RST_I), 
            .q(reg_control[7]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(226[10] 232[49])
    VERIFIC_DFFRS SPI_ACK_O_241 (.d(n94), .clk(CLK_I), .s(SPI_RTY_O), 
            .r(RST_I), .q(SPI_ACK_O));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(243[10] 246[25])
    and (n82, reg_control[0], reg_status[2]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(234[35:53])
    and (n83, reg_control[1], reg_status[3]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(234[56:74])
    or (n84, n82, n83) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(234[34:75])
    and (n85, reg_control[5], n84) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(234[24:76])
    and (n86, reg_control[3], reg_status[5]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(235[24:46])
    or (n87, n85, n86) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(234[24] 235[46])
    and (n88, reg_control[4], reg_status[6]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(236[24:46])
    or (SPI_INT_O, n87, n88) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(234[24] 236[46])
    and (n90, SPI_STB_I, SPI_CYC_I) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(245[14:36])
    or (n91, SPI_WE_I, read_wait_done) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(245[40:68])
    and (n92, n90, n91) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(245[14:68])
    assign n93 = n92 ? 1'b1 : SPI_ACK_O;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(245[10] 246[25])
    assign n94 = SPI_ACK_O ? SPI_RTY_O : n93;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(245[10] 246[25])
    VERIFIC_DFFRS read_wait_done_242 (.d(n100), .clk(CLK_I), .s(SPI_RTY_O), 
            .r(RST_I), .q(read_wait_done));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(252[10] 255[30])
    and (n98, n90, n16) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(254[14:49])
    assign n99 = n98 ? 1'b1 : read_wait_done;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(254[10] 255[30])
    assign n100 = SPI_ACK_O ? SPI_RTY_O : n99;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(254[10] 255[30])
    VERIFIC_DFFRS pending_data_243 (.d(n105), .clk(CLK_I), .s(SPI_RTY_O), 
            .r(RST_I), .q(pending_data));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(274[11] 277[49])
    assign n104 = n484 ? SPI_RTY_O : pending_data;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(276[11] 277[49])
    assign n105 = n48 ? 1'b1 : n104;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(276[11] 277[49])
    wide_dffrs_8 SPI_DAT_O_c3 (.d({n272}), .set({8'b00000000}), .reset({RST_I, 
            RST_I, RST_I, RST_I, RST_I, RST_I, RST_I, RST_I}), 
            .clock(CLK_I), .q({SPI_DAT_O}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(282[11] 288[48])
    mux_32 mux_66 (.d0({32'b00000000000000000000000000000000}), .d1({31'b0000000000000000000000000000000, 
           reg_ssmask}), .cond(dw10_cs), .o({n107}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(287[32] 288[47])
    mux_32 mux_67 (.d0({n107}), .d1({24'b000000000000000000000000, reg_control[7], 
           1'b0, reg_control[5:3], 1'b0, reg_control[1:0]}), .cond(dw0c_cs), 
           .o({n140}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(286[32] 288[47])
    mux_32 mux_68 (.d0({n140}), .d1({24'b000000000000000000000000, reg_status[7:2], 
           2'b00}), .cond(dw08_cs), .o({n173}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(285[32] 288[47])
    mux_32 mux_69 (.d0({n173}), .d1({24'b000000000000000000000000, reg_txdata}), 
           .cond(dw04_cs), .o({n206}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(284[32] 288[47])
    mux_32 mux_70 (.d0({n206}), .d1({24'b000000000000000000000000, reg_rxdata}), 
           .cond(dw00_cs), .o({Open_175, Open_176, Open_177, Open_178, 
           Open_179, Open_180, Open_181, Open_182, Open_183, Open_184, 
           Open_185, Open_186, Open_187, Open_188, Open_189, Open_190, 
           Open_191, Open_192, Open_193, Open_194, Open_195, Open_196, 
           Open_197, Open_198, n239[7:0]}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(283[32] 288[47])
    mux_8 mux_71 (.d0({SPI_DAT_O}), .d1({n239[7:0]}), .cond(reg_rd), .o({n272}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(282[11] 288[48])
    VERIFIC_DFFRS \reg_ssmask[0]_245  (.d(n291), .clk(CLK_I), .s(SPI_RTY_O), 
            .r(RST_I), .q(reg_ssmask[0]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(293[11] 294[62])
    and (n290, reg_wr, dw10_cs) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(293[15:32])
    assign n291 = n290 ? latch_s_data[0] : reg_ssmask[0];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(293[11] 294[62])
    or (n296, n491, n487) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(301[15:62])
    equal_3 equal_80 (.a({c_status}), .b({3'b100}), .o(n297));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(301[66:93])
    or (n298, n296, n297) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(301[15:93])
    not (n299, reg_ssmask[0]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(302[24:37])
    assign n300 = n298 ? n299 : 1'b1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(304[9:45])
    assign n301 = reg_control[7] ? n299 : n300;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(301[11] 304[45])
    VERIFIC_DFFRS SCLK_MASTER_248 (.d(n307), .clk(CLK_I), .s(SPI_RTY_O), 
            .r(RST_I), .q(SCLK_MASTER));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(311[11] 312[46])
    wide_dffrs_8 rx_shift_data_c (.d({n314}), .set({8'b00000000}), .reset({RST_I, 
            RST_I, RST_I, RST_I, RST_I, RST_I, RST_I, RST_I}), 
            .clock(CLK_I), .q({rx_shift_data}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(317[11] 322[9])
    equal_32 equal_93 (.a({32'b00000000000000000000000000000000}), .b({31'b0000000000000000000000000000000, 
            SCLK_MASTER}), .o(n310));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(317[43:71])
    and (n311, n492, n310) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(317[15:71])
    and (n313, n311, n491) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(317[15:97])
    mux_8 mux_97 (.d0({rx_shift_data}), .d1({rx_shift_data[6:0], MISO_MASTER}), 
          .cond(n313), .o({n314}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(317[11] 322[9])
    VERIFIC_DFFRS rx_latch_flag_250 (.d(n336), .clk(CLK_I), .s(SPI_RTY_O), 
            .r(RST_I), .q(rx_latch_flag));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(328[12] 331[32])
    not_equal_3 not_equal_100 (.a({n_status}), .b({3'b011}), .o(n333));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(328[42:65])
    and (n336, n491, n333) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(328[16:65])
    wide_dffrs_5 clock_cnt_c (.d({n353}), .set({5'b00000}), .reset({RST_I, 
            RST_I, RST_I, RST_I, RST_I}), .clock(CLK_I), .q({clock_cnt}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(337[12] 340[37])
    equal_3 equal_105 (.a({c_status}), .b({3'b000}), .o(n338));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(335[20:41])
    add_5u_5u add_107 (.cin(SPI_RTY_O), .a({clock_cnt}), .b({5'b00001}), 
            .o({n341}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(340[23:36])
    mux_5 mux_108 (.d0({n341}), .d1({5'b00000}), .cond(n492), .o({n347}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(340[10:37])
    mux_5 mux_109 (.d0({n347}), .d1({5'b00000}), .cond(n338), .o({n353}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(337[12] 340[37])
    wide_dffrs_3 c_status_c (.d({n_status}), .set({3'b000}), .reset({RST_I, 
            RST_I, RST_I}), .clock(CLK_I), .q({c_status}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(346[10:31])
    wide_dffrs_3 n_status_c (.d({n402}), .set({3'b000}), .reset({3'b000}), 
            .clock(n369), .q({n_status}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(353[13] 395[11])
    not (n369, CLK_I) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(353[15:28])
    mux_3 mux_113 (.d0({3'b000}), .d1({3'b001}), .cond(pending_data), 
          .o({n370}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(359[24:44])
    equal_32 equal_115 (.a({26'b00000000000000000000000000, data_cnt}), 
            .b({32'b00000000000000000000000000000001}), .o(n375));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(367[54:82])
    and (n376, n492, n375) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(367[26:82])
    mux_3 mux_117 (.d0({3'b010}), .d1({3'b011}), .cond(n376), .o({n377}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(370[26:46])
    equal_6 equal_119 (.a({data_cnt}), .b({6'b000111}), .o(n382));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(374[26:50])
    and (n383, n492, n382) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(373[26] 374[50])
    not_equal_32 not_equal_121 (.a({31'b0000000000000000000000000000000, SCLK_MASTER}), 
            .b({32'b00000000000000000000000000000000}), .o(n384));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(375[26:57])
    and (n385, n383, n384) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(373[26] 375[57])
    mux_3 mux_123 (.d0({3'b011}), .d1({3'b100}), .cond(n385), .o({n386}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(378[26:47])
    mux_3 mux_125 (.d0({n_status}), .d1({3'b101}), .cond(n492), .o({n391}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(381[25] 385[50])
    equal_32 equal_127 (.a({26'b00000000000000000000000000, data_cnt}), 
            .b({32'b00000000000000000000000000000010}), .o(n396));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(388[56:85])
    and (n397, n492, n396) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(388[28:85])
    mux_3 mux_129 (.d0({3'b101}), .d1({3'b000}), .cond(n397), .o({n398}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(391[27:51])
    wide_mux_3_24 mux_130 (.sel({c_status}), .data({6'b000000, n398, n391, 
            n386, n377, 3'b010, n370}), .o({n402}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(355[8] 394[15])
    wide_dffrs_6 data_cnt_c (.d({n469}), .set({6'b000000}), .reset({RST_I, 
            RST_I, RST_I, RST_I, RST_I, RST_I}), .clock(CLK_I), 
            .q({data_cnt}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(400[12] 409[35])
    and (n414, n429, n375) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(400[16:100])
    and (n419, n493, n382) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(402[16:95])
    and (n421, n419, n433) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(402[16:130])
    and (n426, n438, n396) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(404[16:102])
    and (n429, n487, n492) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(406[16:69])
    not_equal_32 not_equal_155 (.a({32'b00000000000000000000000000000000}), 
            .b({31'b0000000000000000000000000000000, SCLK_MASTER}), .o(n433));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(407[73:101])
    and (n434, n493, n433) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(407[16:102])
    or (n435, n429, n434) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(406[16] 407[102])
    equal_3 equal_158 (.a({c_status}), .b({3'b101}), .o(n436));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(408[17:42])
    and (n438, n436, n492) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(408[16:71])
    or (n439, n435, n438) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(406[16] 408[71])
    add_6u_6u add_162 (.cin(SPI_RTY_O), .a({data_cnt}), .b({6'b000001}), 
            .o({n441}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(409[22:34])
    mux_6 mux_163 (.d0({data_cnt}), .d1({n441}), .cond(n439), .o({n448}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(406[12] 409[35])
    mux_6 mux_164 (.d0({n448}), .d1({6'b000000}), .cond(n426), .o({n455}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(406[12] 409[35])
    mux_6 mux_165 (.d0({n455}), .d1({6'b000000}), .cond(n421), .o({n462}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(404[12] 409[35])
    mux_6 mux_166 (.d0({n462}), .d1({6'b000000}), .cond(n414), .o({n469}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(402[12] 409[35])
    VERIFIC_DFFRS wait_one_tick_done_255 (.d(1'b1), .clk(CLK_I), .s(SPI_RTY_O), 
            .r(RST_I), .q(wait_one_tick_done));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(416[12] 421[38])
    VERIFIC_DFFRS MOSI_MASTER_256 (.d(n549), .clk(CLK_I), .s(SPI_RTY_O), 
            .r(RST_I), .q(MOSI_MASTER));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(428[12] 441[16])
    equal_3 equal_169 (.a({c_status}), .b({3'b001}), .o(n484));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(428[17:38])
    equal_3 equal_170 (.a({n_status}), .b({3'b011}), .o(n485));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(428[42:64])
    and (n486, n484, n485) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(428[16:65])
    equal_3 equal_172 (.a({c_status}), .b({3'b010}), .o(n487));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(429[17:38])
    and (n489, n487, n485) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(429[16:65])
    or (n490, n486, n489) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(428[16] 429[65])
    equal_3 equal_176 (.a({c_status}), .b({3'b011}), .o(n491));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(435[16:38])
    equal_32 equal_177 (.a({27'b000000000000000000000000000, clock_cnt}), 
            .b({32'b00000000000000000000000000000001}), .o(n492));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(435[42:66])
    and (n493, n491, n492) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(435[16:66])
    xor_32 xor_179 (.a({32'b00000000000000000000000000000000}), .b({31'b0000000000000000000000000000000, 
           SCLK_MASTER}), .o({n494}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(435[70:97])
    or (n527, n494[31], n494[30], n494[29], n494[28], n494[27], 
           n494[26], n494[25], n494[24], n494[23], n494[22], n494[21], 
           n494[20], n494[19], n494[18], n494[17], n494[16], n494[15], 
           n494[14], n494[13], n494[12], n494[11], n494[10], n494[9], 
           n494[8], n494[7], n494[6], n494[5], n494[4], n494[3], 
           n494[2], n494[1], n494[0]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(435[16:97])
    and (n528, n493, n527) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(435[16:97])
    assign n529 = wait_one_tick_done ? tx_shift_data[7] : MOSI_MASTER;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(436[13] 441[16])
    mux_8 mux_183 (.d0({tx_shift_data}), .d1({tx_shift_data[6:0], 1'b0}), 
          .cond(wait_one_tick_done), .o({n530}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(436[13] 441[16])
    assign n539 = n528 ? n529 : MOSI_MASTER;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(435[12] 441[16])
    mux_8 mux_185 (.d0({tx_shift_data}), .d1({n530}), .cond(n528), .o({n540}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(435[12] 441[16])
    assign n549 = n490 ? reg_txdata[7] : n539;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(435[12] 441[16])
    mux_8 mux_187 (.d0({n540}), .d1({reg_txdata[6:0], 1'b0}), .cond(n490), 
          .o({n550}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(435[12] 441[16])
    wide_dffrs_8 tx_shift_data_c (.d({n550}), .set({8'b00000000}), .reset({RST_I, 
            RST_I, RST_I, RST_I, RST_I, RST_I, RST_I, RST_I}), 
            .clock(CLK_I), .q({tx_shift_data}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(428[12] 441[16])
    VERIFIC_DFFRS reg_trdy_258 (.d(n575), .clk(CLK_I), .s(RST_I), .r(SPI_RTY_O), 
            .q(reg_status[5]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(447[12] 450[24])
    not_equal_3 not_equal_190 (.a({c_status}), .b({3'b011}), .o(n569));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(447[16:38])
    and (n571, n569, n485) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(447[16:64])
    and (n573, n48, SPI_ACK_O) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(449[16:46])
    assign n574 = n573 ? SPI_RTY_O : reg_status[5];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(449[12] 450[24])
    assign n575 = n571 ? 1'b1 : n574;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(449[12] 450[24])
    VERIFIC_DFFRS reg_toe_259 (.d(n584), .clk(CLK_I), .s(SPI_RTY_O), .r(RST_I), 
            .q(reg_status[3]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(455[12] 458[26])
    not (n577, reg_status[5]) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(455[16:25])
    and (n578, n577, reg_wr) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(455[16:35])
    and (n579, n578, dw04_cs) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(455[16:46])
    and (n580, n579, SPI_ACK_O) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(455[16:59])
    and (n581, reg_wr, dw08_cs) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(457[16:33])
    and (n582, n581, SPI_ACK_O) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(457[16:46])
    assign n583 = n582 ? SPI_RTY_O : reg_status[3];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(457[12] 458[26])
    assign n584 = n580 ? 1'b1 : n583;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(457[12] 458[26])
    VERIFIC_DFFRS reg_rrdy_260 (.d(n596), .clk(CLK_I), .s(SPI_RTY_O), 
            .r(RST_I), .q(reg_status[6]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(464[12] 473[31])
    and (n588, n297, n492) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(464[16:71])
    assign n589 = reg_status[6] ? 1'b1 : reg_status[2];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(467[16] 469[16])
    and (n591, reg_rd, dw00_cs) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(471[16:33])
    and (n592, n591, SPI_ACK_O) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(471[16:46])
    assign n593 = n592 ? SPI_RTY_O : reg_status[6];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(471[12] 473[31])
    assign n594 = n592 ? SPI_RTY_O : reg_status[2];   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(471[12] 473[31])
    assign n595 = n588 ? n589 : n594;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(471[12] 473[31])
    assign n596 = n588 ? 1'b1 : n593;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(471[12] 473[31])
    VERIFIC_DFFRS reg_roe_261 (.d(n595), .clk(CLK_I), .s(SPI_RTY_O), .r(RST_I), 
            .q(reg_status[2]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(464[12] 473[31])
    VERIFIC_DFFRS reg_tmt_262 (.d(n601), .clk(CLK_I), .s(RST_I), .r(SPI_RTY_O), 
            .q(reg_status[4]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(478[12] 481[26])
    not_equal_3 not_equal_220 (.a({c_status}), .b({3'b000}), .o(n599));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(478[16:37])
    or (n600, n599, pending_data) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(478[16:53])
    not (n601, n600) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(481[10:26])
    VERIFIC_DFFRS dw00_cs_225 (.d(n4), .clk(CLK_I), .s(SPI_RTY_O), .r(RST_I), 
            .q(dw00_cs));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(176[15] 182[9])
    VERIFIC_DFFRS \SS_N_MASTER[0]_247  (.d(n301), .clk(CLK_I), .s(RST_I), 
            .r(SPI_RTY_O), .q(SS_N_MASTER[0]));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(299[11] 304[45])
    
endmodule

//
// Verilog Description of OPERATOR not_equal_3
//

module not_equal_3 (a, b, o);
    input [2:0]a;
    input [2:0]b;
    output o;
    
    
    wire n1, n2, n3, n4, n5, n6;
    
    xor (n1, a[0], b[0]) ;
    xor (n2, a[1], b[1]) ;
    xor (n3, a[2], b[2]) ;
    or (n4, n2, n3) ;
    or (n5, n1, n4) ;
    not (n6, n5) ;
    not (o, n6) ;
    
endmodule

//
// Verilog Description of OPERATOR wide_dffrs_5
//

module wide_dffrs_5 (d, set, reset, clock, q);
    input [4:0]d;
    input [4:0]set;
    input [4:0]reset;
    input clock;
    output [4:0]q;
    
    
    VERIFIC_DFFRS i1 (.d(d[0]), .clk(clock), .s(set[0]), .r(reset[0]), 
            .q(q[0]));
    VERIFIC_DFFRS i2 (.d(d[1]), .clk(clock), .s(set[1]), .r(reset[1]), 
            .q(q[1]));
    VERIFIC_DFFRS i3 (.d(d[2]), .clk(clock), .s(set[2]), .r(reset[2]), 
            .q(q[2]));
    VERIFIC_DFFRS i4 (.d(d[3]), .clk(clock), .s(set[3]), .r(reset[3]), 
            .q(q[3]));
    VERIFIC_DFFRS i5 (.d(d[4]), .clk(clock), .s(set[4]), .r(reset[4]), 
            .q(q[4]));
    
endmodule

//
// Verilog Description of OPERATOR mux_5
//

module mux_5 (d0, d1, cond, o);
    input [4:0]d0;
    input [4:0]d1;
    input cond;
    output [4:0]o;
    
    
    assign o[0] = cond ? d1[0] : d0[0];
    assign o[1] = cond ? d1[1] : d0[1];
    assign o[2] = cond ? d1[2] : d0[2];
    assign o[3] = cond ? d1[3] : d0[3];
    assign o[4] = cond ? d1[4] : d0[4];
    
endmodule

//
// Verilog Description of OPERATOR equal_6
//

module equal_6 (a, b, o);
    input [5:0]a;
    input [5:0]b;
    output o;
    
    
    wire n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
    
    xor (n1, a[0], b[0]) ;
    xor (n2, a[1], b[1]) ;
    xor (n3, a[2], b[2]) ;
    xor (n4, a[3], b[3]) ;
    xor (n5, a[4], b[4]) ;
    xor (n6, a[5], b[5]) ;
    or (n7, n2, n3) ;
    or (n8, n1, n7) ;
    or (n9, n5, n6) ;
    or (n10, n4, n9) ;
    or (n11, n8, n10) ;
    not (o, n11) ;
    
endmodule

//
// Verilog Description of OPERATOR not_equal_32
//

module not_equal_32 (a, b, o);
    input [31:0]a;
    input [31:0]b;
    output o;
    
    
    wire n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, 
        n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, 
        n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, 
        n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, 
        n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, 
        n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, 
        n62, n63, n64;
    
    xor (n1, a[0], b[0]) ;
    xor (n2, a[1], b[1]) ;
    xor (n3, a[2], b[2]) ;
    xor (n4, a[3], b[3]) ;
    xor (n5, a[4], b[4]) ;
    xor (n6, a[5], b[5]) ;
    xor (n7, a[6], b[6]) ;
    xor (n8, a[7], b[7]) ;
    xor (n9, a[8], b[8]) ;
    xor (n10, a[9], b[9]) ;
    xor (n11, a[10], b[10]) ;
    xor (n12, a[11], b[11]) ;
    xor (n13, a[12], b[12]) ;
    xor (n14, a[13], b[13]) ;
    xor (n15, a[14], b[14]) ;
    xor (n16, a[15], b[15]) ;
    xor (n17, a[16], b[16]) ;
    xor (n18, a[17], b[17]) ;
    xor (n19, a[18], b[18]) ;
    xor (n20, a[19], b[19]) ;
    xor (n21, a[20], b[20]) ;
    xor (n22, a[21], b[21]) ;
    xor (n23, a[22], b[22]) ;
    xor (n24, a[23], b[23]) ;
    xor (n25, a[24], b[24]) ;
    xor (n26, a[25], b[25]) ;
    xor (n27, a[26], b[26]) ;
    xor (n28, a[27], b[27]) ;
    xor (n29, a[28], b[28]) ;
    xor (n30, a[29], b[29]) ;
    xor (n31, a[30], b[30]) ;
    xor (n32, a[31], b[31]) ;
    or (n33, n1, n2) ;
    or (n34, n3, n4) ;
    or (n35, n33, n34) ;
    or (n36, n5, n6) ;
    or (n37, n7, n8) ;
    or (n38, n36, n37) ;
    or (n39, n35, n38) ;
    or (n40, n9, n10) ;
    or (n41, n11, n12) ;
    or (n42, n40, n41) ;
    or (n43, n13, n14) ;
    or (n44, n15, n16) ;
    or (n45, n43, n44) ;
    or (n46, n42, n45) ;
    or (n47, n39, n46) ;
    or (n48, n17, n18) ;
    or (n49, n19, n20) ;
    or (n50, n48, n49) ;
    or (n51, n21, n22) ;
    or (n52, n23, n24) ;
    or (n53, n51, n52) ;
    or (n54, n50, n53) ;
    or (n55, n25, n26) ;
    or (n56, n27, n28) ;
    or (n57, n55, n56) ;
    or (n58, n29, n30) ;
    or (n59, n31, n32) ;
    or (n60, n58, n59) ;
    or (n61, n57, n60) ;
    or (n62, n54, n61) ;
    or (n63, n47, n62) ;
    not (n64, n63) ;
    not (o, n64) ;
    
endmodule

//
// Verilog Description of OPERATOR wide_dffrs_6
//

module wide_dffrs_6 (d, set, reset, clock, q);
    input [5:0]d;
    input [5:0]set;
    input [5:0]reset;
    input clock;
    output [5:0]q;
    
    
    VERIFIC_DFFRS i1 (.d(d[0]), .clk(clock), .s(set[0]), .r(reset[0]), 
            .q(q[0]));
    VERIFIC_DFFRS i2 (.d(d[1]), .clk(clock), .s(set[1]), .r(reset[1]), 
            .q(q[1]));
    VERIFIC_DFFRS i3 (.d(d[2]), .clk(clock), .s(set[2]), .r(reset[2]), 
            .q(q[2]));
    VERIFIC_DFFRS i4 (.d(d[3]), .clk(clock), .s(set[3]), .r(reset[3]), 
            .q(q[3]));
    VERIFIC_DFFRS i5 (.d(d[4]), .clk(clock), .s(set[4]), .r(reset[4]), 
            .q(q[4]));
    VERIFIC_DFFRS i6 (.d(d[5]), .clk(clock), .s(set[5]), .r(reset[5]), 
            .q(q[5]));
    
endmodule

//
// Verilog Description of OPERATOR add_6u_6u
//

module add_6u_6u (cin, a, b, o, cout);
    input cin;
    input [5:0]a;
    input [5:0]b;
    output [5:0]o;
    output cout;
    
    
    wire n2, n4, n6, n8, n10;
    
    VERIFIC_FADD i1 (.cin(cin), .a(a[0]), .b(b[0]), .o(o[0]), .cout(n2));
    VERIFIC_FADD i2 (.cin(n2), .a(a[1]), .b(b[1]), .o(o[1]), .cout(n4));
    VERIFIC_FADD i3 (.cin(n4), .a(a[2]), .b(b[2]), .o(o[2]), .cout(n6));
    VERIFIC_FADD i4 (.cin(n6), .a(a[3]), .b(b[3]), .o(o[3]), .cout(n8));
    VERIFIC_FADD i5 (.cin(n8), .a(a[4]), .b(b[4]), .o(o[4]), .cout(n10));
    VERIFIC_FADD i6 (.cin(n10), .a(a[5]), .b(b[5]), .o(o[5]), .cout(cout));
    
endmodule

//
// Verilog Description of OPERATOR mux_6
//

module mux_6 (d0, d1, cond, o);
    input [5:0]d0;
    input [5:0]d1;
    input cond;
    output [5:0]o;
    
    
    assign o[0] = cond ? d1[0] : d0[0];
    assign o[1] = cond ? d1[1] : d0[1];
    assign o[2] = cond ? d1[2] : d0[2];
    assign o[3] = cond ? d1[3] : d0[3];
    assign o[4] = cond ? d1[4] : d0[4];
    assign o[5] = cond ? d1[5] : d0[5];
    
endmodule

//
// Verilog Description of OPERATOR xor_32
//

module xor_32 (a, b, o);
    input [31:0]a;
    input [31:0]b;
    output [31:0]o;
    
    
    xor (o[0], a[0], b[0]) ;
    xor (o[1], a[1], b[1]) ;
    xor (o[2], a[2], b[2]) ;
    xor (o[3], a[3], b[3]) ;
    xor (o[4], a[4], b[4]) ;
    xor (o[5], a[5], b[5]) ;
    xor (o[6], a[6], b[6]) ;
    xor (o[7], a[7], b[7]) ;
    xor (o[8], a[8], b[8]) ;
    xor (o[9], a[9], b[9]) ;
    xor (o[10], a[10], b[10]) ;
    xor (o[11], a[11], b[11]) ;
    xor (o[12], a[12], b[12]) ;
    xor (o[13], a[13], b[13]) ;
    xor (o[14], a[14], b[14]) ;
    xor (o[15], a[15], b[15]) ;
    xor (o[16], a[16], b[16]) ;
    xor (o[17], a[17], b[17]) ;
    xor (o[18], a[18], b[18]) ;
    xor (o[19], a[19], b[19]) ;
    xor (o[20], a[20], b[20]) ;
    xor (o[21], a[21], b[21]) ;
    xor (o[22], a[22], b[22]) ;
    xor (o[23], a[23], b[23]) ;
    xor (o[24], a[24], b[24]) ;
    xor (o[25], a[25], b[25]) ;
    xor (o[26], a[26], b[26]) ;
    xor (o[27], a[27], b[27]) ;
    xor (o[28], a[28], b[28]) ;
    xor (o[29], a[29], b[29]) ;
    xor (o[30], a[30], b[30]) ;
    xor (o[31], a[31], b[31]) ;
    
endmodule

//
// Verilog Description of module \uptime_wb(CLK_FREQ=24180000,CLK_IN_HZ=25) 
//

module \uptime_wb(CLK_FREQ=24180000,CLK_IN_HZ=25)  (clk_i, rst_i, wb_adr_i, 
            wb_dat_o, wb_cyc_i, wb_stb_i, wb_we_i, wb_ack_o) /* synthesis syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(46[8:17])
    input clk_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(49[30:35])
    input rst_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(50[30:35])
    input [1:0]wb_adr_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(51[30:38])
    output [7:0]wb_dat_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(52[30:38])
    input wb_cyc_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(53[30:38])
    input wb_stb_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(54[30:38])
    input wb_we_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(55[30:37])
    output wb_ack_o;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(56[30:38])
    
    wire [7:0]seconds;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(58[13:20])
    wire [7:0]minutes;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(59[13:20])
    wire [7:0]hours;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(60[13:18])
    wire [7:0]seconds_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(61[13:24])
    wire [7:0]minutes_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(62[13:24])
    wire [7:0]hours_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(63[13:22])
    wire sec_clock;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(65[13:22])
    wire [24:0]counter;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(103[23:30])
    wire [7:0]n5;
    
    wire n23, n51;
    wire [24:0]n54;
    wire [24:0]n80;
    
    wire n106, n134;
    wire [7:0]n136;
    wire [7:0]n146;
    
    wire n155;
    wire [7:0]n157;
    wire [7:0]n166;
    wire [7:0]n175;
    wire [7:0]n184;
    wire [7:0]n193;
    wire [7:0]n202;
    
    assign wb_ack_o = wb_stb_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(54[30:38])
    xor (n106, sec_clock, n51) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(115[16] 117[9])
    not (n23, clk_i) ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(73[11:24])
    wide_mux_2_32 mux_4 (.sel({wb_adr_i}), .data({seconds_reg, hours_reg, 
            minutes_reg, seconds_reg}), .o({n5}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(78[9] 83[16])
    wide_dffrs_8 seconds_reg_c (.d({seconds}), .set({8'b00000000}), .reset({rst_i, 
            rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, rst_i}), 
            .clock(n23), .q({seconds_reg}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(94[10] 98[8])
    wide_dffrs_8 minutes_reg_c (.d({minutes}), .set({8'b00000000}), .reset({rst_i, 
            rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, rst_i}), 
            .clock(n23), .q({minutes_reg}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(94[10] 98[8])
    wide_dffrs_8 hours_reg_c (.d({hours}), .set({8'b00000000}), .reset({rst_i, 
            rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, rst_i}), 
            .clock(n23), .q({hours_reg}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(94[10] 98[8])
    wide_dffrs_25 counter_c (.d({n80}), .set({25'b0000000000000000000000000}), 
            .reset({rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, 
            rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, 
            rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, 
            rst_i, rst_i}), .clock(clk_i), .q({counter}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(111[14] 118[8])
    LessThan_25u_25u LessThan_10 (.cin(1'b1), .a({25'b0101110000111101010010000}), 
            .b({counter}), .o(n51));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(112[11:34])
    add_25u_25u add_12 (.cin(1'b0), .a({counter}), .b({25'b0000000000000000000000001}), 
            .o({n54}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(116[18:29])
    mux_25 mux_13 (.d0({n54}), .d1({25'b0000000000000000000000000}), .cond(n51), 
           .o({n80}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(115[16] 117[9])
    VERIFIC_DFFRS sec_clock_36 (.d(n106), .clk(clk_i), .s(1'b0), .r(rst_i), 
            .q(sec_clock));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(111[14] 118[8])
    wide_dffrs_8 hours_c (.d({n202}), .set({8'b00000000}), .reset({rst_i, 
            rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, rst_i}), 
            .clock(sec_clock), .q({hours}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(129[10] 141[8])
    LessThan_8u_8u LessThan_17 (.cin(1'b0), .a({seconds}), .b({8'b00111011}), 
            .o(n134));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(130[11:28])
    add_8u_8u add_18 (.cin(1'b0), .a({seconds}), .b({8'b00000001}), .o({n136}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(131[20:31])
    add_8u_8u add_19 (.cin(1'b0), .a({minutes}), .b({8'b00000001}), .o({n146}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(134[20:31])
    LessThan_8u_8u LessThan_20 (.cin(1'b0), .a({8'b00111010}), .b({minutes}), 
            .o(n155));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(136[13:25])
    add_8u_8u add_21 (.cin(1'b0), .a({hours}), .b({8'b00000001}), .o({n157}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(138[20:29])
    mux_8 mux_22 (.d0({n146}), .d1({8'b00000000}), .cond(n155), .o({n166}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(136[9] 139[12])
    mux_8 mux_23 (.d0({hours}), .d1({n157}), .cond(n155), .o({n175}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(136[9] 139[12])
    mux_8 mux_24 (.d0({8'b00000000}), .d1({n136}), .cond(n134), .o({n184}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(133[12] 140[10])
    mux_8 mux_25 (.d0({n166}), .d1({minutes}), .cond(n134), .o({n193}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(133[12] 140[10])
    mux_8 mux_26 (.d0({n175}), .d1({hours}), .cond(n134), .o({n202}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(133[12] 140[10])
    wide_dffrs_8 minutes_c (.d({n193}), .set({8'b00000000}), .reset({rst_i, 
            rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, rst_i}), 
            .clock(sec_clock), .q({minutes}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(129[10] 141[8])
    wide_dffrs_8 seconds_c (.d({n184}), .set({8'b00000000}), .reset({rst_i, 
            rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, rst_i}), 
            .clock(sec_clock), .q({seconds}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(129[10] 141[8])
    wide_dffrs_8 dat_o_c (.d({n5}), .set({8'b00000000}), .reset({rst_i, 
            rst_i, rst_i, rst_i, rst_i, rst_i, rst_i, rst_i}), 
            .clock(n23), .q({wb_dat_o}));   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(78[9] 83[16])
    
endmodule

//
// Verilog Description of OPERATOR wide_dffrs_25
//

module wide_dffrs_25 (d, set, reset, clock, q);
    input [24:0]d;
    input [24:0]set;
    input [24:0]reset;
    input clock;
    output [24:0]q;
    
    
    VERIFIC_DFFRS i1 (.d(d[0]), .clk(clock), .s(set[0]), .r(reset[0]), 
            .q(q[0]));
    VERIFIC_DFFRS i2 (.d(d[1]), .clk(clock), .s(set[1]), .r(reset[1]), 
            .q(q[1]));
    VERIFIC_DFFRS i3 (.d(d[2]), .clk(clock), .s(set[2]), .r(reset[2]), 
            .q(q[2]));
    VERIFIC_DFFRS i4 (.d(d[3]), .clk(clock), .s(set[3]), .r(reset[3]), 
            .q(q[3]));
    VERIFIC_DFFRS i5 (.d(d[4]), .clk(clock), .s(set[4]), .r(reset[4]), 
            .q(q[4]));
    VERIFIC_DFFRS i6 (.d(d[5]), .clk(clock), .s(set[5]), .r(reset[5]), 
            .q(q[5]));
    VERIFIC_DFFRS i7 (.d(d[6]), .clk(clock), .s(set[6]), .r(reset[6]), 
            .q(q[6]));
    VERIFIC_DFFRS i8 (.d(d[7]), .clk(clock), .s(set[7]), .r(reset[7]), 
            .q(q[7]));
    VERIFIC_DFFRS i9 (.d(d[8]), .clk(clock), .s(set[8]), .r(reset[8]), 
            .q(q[8]));
    VERIFIC_DFFRS i10 (.d(d[9]), .clk(clock), .s(set[9]), .r(reset[9]), 
            .q(q[9]));
    VERIFIC_DFFRS i11 (.d(d[10]), .clk(clock), .s(set[10]), .r(reset[10]), 
            .q(q[10]));
    VERIFIC_DFFRS i12 (.d(d[11]), .clk(clock), .s(set[11]), .r(reset[11]), 
            .q(q[11]));
    VERIFIC_DFFRS i13 (.d(d[12]), .clk(clock), .s(set[12]), .r(reset[12]), 
            .q(q[12]));
    VERIFIC_DFFRS i14 (.d(d[13]), .clk(clock), .s(set[13]), .r(reset[13]), 
            .q(q[13]));
    VERIFIC_DFFRS i15 (.d(d[14]), .clk(clock), .s(set[14]), .r(reset[14]), 
            .q(q[14]));
    VERIFIC_DFFRS i16 (.d(d[15]), .clk(clock), .s(set[15]), .r(reset[15]), 
            .q(q[15]));
    VERIFIC_DFFRS i17 (.d(d[16]), .clk(clock), .s(set[16]), .r(reset[16]), 
            .q(q[16]));
    VERIFIC_DFFRS i18 (.d(d[17]), .clk(clock), .s(set[17]), .r(reset[17]), 
            .q(q[17]));
    VERIFIC_DFFRS i19 (.d(d[18]), .clk(clock), .s(set[18]), .r(reset[18]), 
            .q(q[18]));
    VERIFIC_DFFRS i20 (.d(d[19]), .clk(clock), .s(set[19]), .r(reset[19]), 
            .q(q[19]));
    VERIFIC_DFFRS i21 (.d(d[20]), .clk(clock), .s(set[20]), .r(reset[20]), 
            .q(q[20]));
    VERIFIC_DFFRS i22 (.d(d[21]), .clk(clock), .s(set[21]), .r(reset[21]), 
            .q(q[21]));
    VERIFIC_DFFRS i23 (.d(d[22]), .clk(clock), .s(set[22]), .r(reset[22]), 
            .q(q[22]));
    VERIFIC_DFFRS i24 (.d(d[23]), .clk(clock), .s(set[23]), .r(reset[23]), 
            .q(q[23]));
    VERIFIC_DFFRS i25 (.d(d[24]), .clk(clock), .s(set[24]), .r(reset[24]), 
            .q(q[24]));
    
endmodule

//
// Verilog Description of OPERATOR LessThan_25u_25u
//

module LessThan_25u_25u (cin, a, b, o);
    input cin;
    input [24:0]a;
    input [24:0]b;
    output o;
    
    
    wire n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, 
        n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, 
        n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, 
        n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, 
        n42, n43, n44, n45, n46, n47, n48, n49;
    
    xor (n1, a[0], b[0]) ;
    assign n2 = n1 ? b[0] : cin;
    xor (n3, a[1], b[1]) ;
    assign n4 = n3 ? b[1] : n2;
    xor (n5, a[2], b[2]) ;
    assign n6 = n5 ? b[2] : n4;
    xor (n7, a[3], b[3]) ;
    assign n8 = n7 ? b[3] : n6;
    xor (n9, a[4], b[4]) ;
    assign n10 = n9 ? b[4] : n8;
    xor (n11, a[5], b[5]) ;
    assign n12 = n11 ? b[5] : n10;
    xor (n13, a[6], b[6]) ;
    assign n14 = n13 ? b[6] : n12;
    xor (n15, a[7], b[7]) ;
    assign n16 = n15 ? b[7] : n14;
    xor (n17, a[8], b[8]) ;
    assign n18 = n17 ? b[8] : n16;
    xor (n19, a[9], b[9]) ;
    assign n20 = n19 ? b[9] : n18;
    xor (n21, a[10], b[10]) ;
    assign n22 = n21 ? b[10] : n20;
    xor (n23, a[11], b[11]) ;
    assign n24 = n23 ? b[11] : n22;
    xor (n25, a[12], b[12]) ;
    assign n26 = n25 ? b[12] : n24;
    xor (n27, a[13], b[13]) ;
    assign n28 = n27 ? b[13] : n26;
    xor (n29, a[14], b[14]) ;
    assign n30 = n29 ? b[14] : n28;
    xor (n31, a[15], b[15]) ;
    assign n32 = n31 ? b[15] : n30;
    xor (n33, a[16], b[16]) ;
    assign n34 = n33 ? b[16] : n32;
    xor (n35, a[17], b[17]) ;
    assign n36 = n35 ? b[17] : n34;
    xor (n37, a[18], b[18]) ;
    assign n38 = n37 ? b[18] : n36;
    xor (n39, a[19], b[19]) ;
    assign n40 = n39 ? b[19] : n38;
    xor (n41, a[20], b[20]) ;
    assign n42 = n41 ? b[20] : n40;
    xor (n43, a[21], b[21]) ;
    assign n44 = n43 ? b[21] : n42;
    xor (n45, a[22], b[22]) ;
    assign n46 = n45 ? b[22] : n44;
    xor (n47, a[23], b[23]) ;
    assign n48 = n47 ? b[23] : n46;
    xor (n49, a[24], b[24]) ;
    assign o = n49 ? b[24] : n48;
    
endmodule

//
// Verilog Description of OPERATOR add_25u_25u
//

module add_25u_25u (cin, a, b, o, cout);
    input cin;
    input [24:0]a;
    input [24:0]b;
    output [24:0]o;
    output cout;
    
    
    wire n2, n4, n6, n8, n10, n12, n14, n16, n18, n20, n22, 
        n24, n26, n28, n30, n32, n34, n36, n38, n40, n42, 
        n44, n46, n48;
    
    VERIFIC_FADD i1 (.cin(cin), .a(a[0]), .b(b[0]), .o(o[0]), .cout(n2));
    VERIFIC_FADD i2 (.cin(n2), .a(a[1]), .b(b[1]), .o(o[1]), .cout(n4));
    VERIFIC_FADD i3 (.cin(n4), .a(a[2]), .b(b[2]), .o(o[2]), .cout(n6));
    VERIFIC_FADD i4 (.cin(n6), .a(a[3]), .b(b[3]), .o(o[3]), .cout(n8));
    VERIFIC_FADD i5 (.cin(n8), .a(a[4]), .b(b[4]), .o(o[4]), .cout(n10));
    VERIFIC_FADD i6 (.cin(n10), .a(a[5]), .b(b[5]), .o(o[5]), .cout(n12));
    VERIFIC_FADD i7 (.cin(n12), .a(a[6]), .b(b[6]), .o(o[6]), .cout(n14));
    VERIFIC_FADD i8 (.cin(n14), .a(a[7]), .b(b[7]), .o(o[7]), .cout(n16));
    VERIFIC_FADD i9 (.cin(n16), .a(a[8]), .b(b[8]), .o(o[8]), .cout(n18));
    VERIFIC_FADD i10 (.cin(n18), .a(a[9]), .b(b[9]), .o(o[9]), .cout(n20));
    VERIFIC_FADD i11 (.cin(n20), .a(a[10]), .b(b[10]), .o(o[10]), .cout(n22));
    VERIFIC_FADD i12 (.cin(n22), .a(a[11]), .b(b[11]), .o(o[11]), .cout(n24));
    VERIFIC_FADD i13 (.cin(n24), .a(a[12]), .b(b[12]), .o(o[12]), .cout(n26));
    VERIFIC_FADD i14 (.cin(n26), .a(a[13]), .b(b[13]), .o(o[13]), .cout(n28));
    VERIFIC_FADD i15 (.cin(n28), .a(a[14]), .b(b[14]), .o(o[14]), .cout(n30));
    VERIFIC_FADD i16 (.cin(n30), .a(a[15]), .b(b[15]), .o(o[15]), .cout(n32));
    VERIFIC_FADD i17 (.cin(n32), .a(a[16]), .b(b[16]), .o(o[16]), .cout(n34));
    VERIFIC_FADD i18 (.cin(n34), .a(a[17]), .b(b[17]), .o(o[17]), .cout(n36));
    VERIFIC_FADD i19 (.cin(n36), .a(a[18]), .b(b[18]), .o(o[18]), .cout(n38));
    VERIFIC_FADD i20 (.cin(n38), .a(a[19]), .b(b[19]), .o(o[19]), .cout(n40));
    VERIFIC_FADD i21 (.cin(n40), .a(a[20]), .b(b[20]), .o(o[20]), .cout(n42));
    VERIFIC_FADD i22 (.cin(n42), .a(a[21]), .b(b[21]), .o(o[21]), .cout(n44));
    VERIFIC_FADD i23 (.cin(n44), .a(a[22]), .b(b[22]), .o(o[22]), .cout(n46));
    VERIFIC_FADD i24 (.cin(n46), .a(a[23]), .b(b[23]), .o(o[23]), .cout(n48));
    VERIFIC_FADD i25 (.cin(n48), .a(a[24]), .b(b[24]), .o(o[24]), .cout(cout));
    
endmodule

//
// Verilog Description of OPERATOR mux_25
//

module mux_25 (d0, d1, cond, o);
    input [24:0]d0;
    input [24:0]d1;
    input cond;
    output [24:0]o;
    
    
    assign o[0] = cond ? d1[0] : d0[0];
    assign o[1] = cond ? d1[1] : d0[1];
    assign o[2] = cond ? d1[2] : d0[2];
    assign o[3] = cond ? d1[3] : d0[3];
    assign o[4] = cond ? d1[4] : d0[4];
    assign o[5] = cond ? d1[5] : d0[5];
    assign o[6] = cond ? d1[6] : d0[6];
    assign o[7] = cond ? d1[7] : d0[7];
    assign o[8] = cond ? d1[8] : d0[8];
    assign o[9] = cond ? d1[9] : d0[9];
    assign o[10] = cond ? d1[10] : d0[10];
    assign o[11] = cond ? d1[11] : d0[11];
    assign o[12] = cond ? d1[12] : d0[12];
    assign o[13] = cond ? d1[13] : d0[13];
    assign o[14] = cond ? d1[14] : d0[14];
    assign o[15] = cond ? d1[15] : d0[15];
    assign o[16] = cond ? d1[16] : d0[16];
    assign o[17] = cond ? d1[17] : d0[17];
    assign o[18] = cond ? d1[18] : d0[18];
    assign o[19] = cond ? d1[19] : d0[19];
    assign o[20] = cond ? d1[20] : d0[20];
    assign o[21] = cond ? d1[21] : d0[21];
    assign o[22] = cond ? d1[22] : d0[22];
    assign o[23] = cond ? d1[23] : d0[23];
    assign o[24] = cond ? d1[24] : d0[24];
    
endmodule

//
// Verilog Description of OPERATOR LessThan_8u_8u
//

module LessThan_8u_8u (cin, a, b, o);
    input cin;
    input [7:0]a;
    input [7:0]b;
    output o;
    
    
    wire n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, 
        n12, n13, n14, n15;
    
    xor (n1, a[0], b[0]) ;
    assign n2 = n1 ? b[0] : cin;
    xor (n3, a[1], b[1]) ;
    assign n4 = n3 ? b[1] : n2;
    xor (n5, a[2], b[2]) ;
    assign n6 = n5 ? b[2] : n4;
    xor (n7, a[3], b[3]) ;
    assign n8 = n7 ? b[3] : n6;
    xor (n9, a[4], b[4]) ;
    assign n10 = n9 ? b[4] : n8;
    xor (n11, a[5], b[5]) ;
    assign n12 = n11 ? b[5] : n10;
    xor (n13, a[6], b[6]) ;
    assign n14 = n13 ? b[6] : n12;
    xor (n15, a[7], b[7]) ;
    assign o = n15 ? b[7] : n14;
    
endmodule

//
// Verilog Description of OPERATOR add_8u_8u
//

module add_8u_8u (cin, a, b, o, cout);
    input cin;
    input [7:0]a;
    input [7:0]b;
    output [7:0]o;
    output cout;
    
    
    wire n2, n4, n6, n8, n10, n12, n14;
    
    VERIFIC_FADD i1 (.cin(cin), .a(a[0]), .b(b[0]), .o(o[0]), .cout(n2));
    VERIFIC_FADD i2 (.cin(n2), .a(a[1]), .b(b[1]), .o(o[1]), .cout(n4));
    VERIFIC_FADD i3 (.cin(n4), .a(a[2]), .b(b[2]), .o(o[2]), .cout(n6));
    VERIFIC_FADD i4 (.cin(n6), .a(a[3]), .b(b[3]), .o(o[3]), .cout(n8));
    VERIFIC_FADD i5 (.cin(n8), .a(a[4]), .b(b[4]), .o(o[4]), .cout(n10));
    VERIFIC_FADD i6 (.cin(n10), .a(a[5]), .b(b[5]), .o(o[5]), .cout(n12));
    VERIFIC_FADD i7 (.cin(n12), .a(a[6]), .b(b[6]), .o(o[6]), .cout(n14));
    VERIFIC_FADD i8 (.cin(n14), .a(a[7]), .b(b[7]), .o(o[7]), .cout(cout));
    
endmodule
