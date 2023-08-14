// Verilog netlist produced by program LST :  version Diamond_1.3_Production (92)
// Netlist written on Tue Oct 25 13:55:01 2011

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
    output scl /* synthesis .original_dir=IN_OUT */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(63[17:20])
    output sda /* synthesis .original_dir=IN_OUT */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(64[17:20])
    input analog_cmp_n /* synthesis black_box_pad_pin=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(66[11:23])
    input analog_cmp_p /* synthesis black_box_pad_pin=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(67[11:23])
    output analog_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(68[11:21])
    output audio_pwm_out;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(70[11:24])
    output clk /* synthesis syn_keep=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(71[11:14])
    output clk_pll;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(72[17:24])
    output lock_pll;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(73[17:25])
    
    wire xin_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(48[11:14])
    wire xout_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(49[11:15])
    wire rst_n_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(51[17:22])
    wire [3:0]led_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(53[17:20])
    wire uart_rx_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(55[17:24])
    wire uart_tx_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(56[17:24])
    wire spi_sclk_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(58[17:25])
    wire [0:0]SS_N_MASTER;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(59[17:24])
    wire spi_mosi_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(60[17:25])
    wire spi_miso_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(61[17:25])
    wire analog_out_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(68[11:21])
    wire clk_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(71[11:14])
    wire rst;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(95[6:18])
    wire lm8_rst;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(96[6:13])
    wire lm8_rstn;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(97[6:25])
    wire wb_rst;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(98[6:12])
    wire [7:0]data_in;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(101[12:19])
    wire [23:0]addr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(102[19:23])
    wire ack_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(78[8:15])
    wire io_rdy;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(106[6:12])
    wire [19:0]wb_addr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(109[32:39])
    wire [7:0]wb_data_from_master;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(110[12:31])
    wire [15:0]wb_ack;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(116[13:19])
    wire [127:0]wb_dat_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(118[14:22])
    wire reg_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(141[28:34])
    wire analog_cmp;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(139[6:16])
    wire rom_ce;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rom_ebr_wb.v(55[6:35])
    wire parity_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(145[23:33])
    wire read_wait_done;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(142[28:42])
    wire [3:0]ier;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(172[21:24])
    wire GND_net;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(118[14:22])
    wire div_wr_strobe;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(187[9:22])
    wire VCC_net;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(112[24:34])
    wire [7:0]digital_out_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/adc_top.v(96[24:37])
    
    wire n10664, n9219;
    wire [31:0]n239;
    
    wire n10661, n10684, n10659, n7422, n4411, n3377, n10723, 
        n9581, n9133;
    wire [7:0]n1242;
    
    wire n2642, n8203, n9218, n8260, n8200, n3660, n9267, n3618, 
        n10268, n8279, n8197, n8194, n8191, n8188, n8183, n8180, 
        n1506, n2694, n10682, n10670, n10249, n2143;
    wire [7:0]n10793;
    
    wire n2976, n10217, n9343, n10221, n10626, n9266, n10236, 
        n10625;
    
    OSCH OSCH_inst (.STDBY(GND_net), .OSC(clk_c)) /* synthesis syn_instantiated=1 */ ;
    defparam OSCH_inst.NOM_FREQ = "24.18";
    INV i4 (.A(rst_n_c), .Z(rst));
    INV i12 (.A(xin_c), .Z(xout_c));
    ILVDS i0 (.A(analog_cmp_p), .AN(analog_cmp_n), .Z(analog_cmp)) /* synthesis syn_instantiated=1 */ ;
    VHI i2 (.Z(VCC_net));
    IB spi_miso_pad (.I(spi_miso), .O(spi_miso_c));
    OBZ sda_pad (.I(GND_net), .T(VCC_net), .O(sda));
    OBZ scl_pad (.I(GND_net), .T(VCC_net), .O(scl));
    OB spi_mosi_pad (.I(spi_mosi_c), .O(spi_mosi));
    IB uart_rx_pad (.I(uart_rx), .O(uart_rx_c));
    IB wb_dat_i_pad_32 (.I(sw[0]), .O(wb_dat_i[32]));
    OB spi_csn_pad (.I(SS_N_MASTER[0]), .O(spi_csn));
    OB spi_sclk_pad (.I(spi_sclk_c), .O(spi_sclk));
    OB uart_tx_pad (.I(uart_tx_c), .O(uart_tx));
    IB wb_dat_i_pad_33 (.I(sw[1]), .O(wb_dat_i[33]));
    OB led_pad_0 (.I(led_c[0]), .O(led[0]));
    OB led_pad_1 (.I(led_c[1]), .O(led[1]));
    IB wb_dat_i_pad_34 (.I(sw[2]), .O(wb_dat_i[34]));
    OB led_pad_2 (.I(led_c[2]), .O(led[2]));
    IB wb_dat_i_pad_35 (.I(sw[3]), .O(wb_dat_i[35]));
    IB rst_n_pad (.I(rst_n), .O(rst_n_c));
    IB xin_pad (.I(xin), .O(xin_c));
    OB lock_pll_pad (.I(GND_net), .O(lock_pll));
    OB clk_pll_pad (.I(GND_net), .O(clk_pll));
    OB clk_pad (.I(clk_c), .O(clk));
    OB audio_pwm_out_pad (.I(GND_net), .O(audio_pwm_out));
    OB analog_out_pad (.I(analog_out_c), .O(analog_out));
    GSR GSR_INST (.GSR(n3660));
    OB led_pad_3 (.I(led_c[3]), .O(led[3]));
    OB xout_pad (.I(xout_c), .O(xout));
    adc_wb adc_wb_inst (.clk_c(clk_c), .digital_out_i({digital_out_i}), 
           .analog_out_c(analog_out_c), .analog_cmp(analog_cmp)) /* synthesis syn_module_defined=1 */ ;
    \uptime_wb(CLK_FREQ=24180000,CLK_IN_HZ=25)  TIME_INST (.\wb_addr[0] (wb_addr[0]), 
            .\wb_addr[1] (wb_addr[1]), .n8203(n8203), .clk_c(clk_c), .n10723(n10723), 
            .n8200(n8200), .n8197(n8197), .n8194(n8194), .n8191(n8191), 
            .n8188(n8188), .n8183(n8183), .n8180(n8180), .rst(rst)) /* synthesis syn_module_defined=1 */ ;
    INV i5 (.A(lm8_rst), .Z(lm8_rstn));
    reset_gen reset_gen_inst (.clk_c(clk_c), .rst(rst), .n10684(n10684), 
            .wb_rst(wb_rst), .n3660(n3660)) /* synthesis syn_module_defined=1 */ ;
    PUR PUR_INST (.PUR(VCC_net));
    led_sw_wb led_sw_inst (.clk_c(clk_c), .n10664(n10664), .led({led_c}), 
            .\wb_data_from_master[2] (wb_data_from_master[2]), .\wb_data_from_master[1] (wb_data_from_master[1]), 
            .\wb_data_from_master[0] (wb_data_from_master[0]), .\wb_data_from_master[3] (wb_data_from_master[3])) /* synthesis syn_module_defined=1 */ ;
    \spi(SHIFT_DIRECTION=0,CLOCK_PHASE=0,CLOCK_POLARITY=0,CLOCK_SEL=1,MASTER=1,SLAVE_NUMBER=1,DATA_LENGTH=8,DELAY_TIME=2,CLKCNT_WIDTH=5,INTERVAL_LENGTH=2)  SPI_INST (.clk_c(clk_c), 
            .n9266(n9266), .wb_data_from_master({wb_data_from_master}), 
            .n270(n239[1]), .n269(n239[2]), .n10666(n239[6]), .\wb_ack[10] (wb_ack[10]), 
            .spi_sclk_c(spi_sclk_c), .spi_miso_c(spi_miso_c), .n10723(n10723), 
            .SS_N_MASTER({SS_N_MASTER}), .n10667(n239[7]), .spi_mosi_c(spi_mosi_c), 
            .n266(n239[5]), .n267(n239[4]), .n268(n239[3]), .reg_rd(reg_rd), 
            .n271(n239[0]), .n9343(n9343), .n10625(n10625), .n10626(n10626), 
            .n2642(n2642), .read_wait_done(read_wait_done), .n10659(n10659), 
            .n9218(n9218), .n8260(n8260), .n9267(n9267), .n9133(n9133)) /* synthesis syn_module_defined=1 */ ;
    LUT4 m1_lut (.Z(n10626)) /* synthesis lut_function=1, syn_instantiated=1 */ ;
    defparam m1_lut.init = 16'hffff;
    \lm8_wb(LM8_ADDR_W=24,NUM_DECODE=4)  lm8_wb_inst (.\addr[20] (addr[20]), 
            .\addr[21] (addr[21]), .\addr[22] (addr[22]), .n2143(n2143), 
            .\addr[23] (addr[23]), .digital_out_i({digital_out_i}), .\wb_ack[10] (wb_ack[10]), 
            .\wb_ack[0] (wb_ack[0]), .n8279(n8279), .io_rdy(io_rdy), .n9581(n9581), 
            .clk_c(clk_c), .reg_rd(reg_rd), .n10667(n239[7]), .n10666(n239[6]), 
            .n266(n239[5]), .n267(n239[4]), .n268(n239[3]), .n269(n239[2]), 
            .n270(n239[1]), .wb_rst(wb_rst), .data_in({data_in}), .n271(n239[0]), 
            .n10236(n10236), .n4411(n4411), .n1242({n1242}), .n10626(n10626), 
            .n2976(n2976), .n10723(n10723), .rst(rst), .n8203(n8203), 
            .n8191(n8191), .n8194(n8194), .n8197(n8197), .n8200(n8200), 
            .n8180(n8180), .n8183(n8183), .n8188(n8188), .n9219(n9219), 
            .n10661(n10661), .ack_reg(ack_reg), .n10268(n10268), .wb_dat_i_c_35(wb_dat_i[35]), 
            .wb_dat_i_c_32(wb_dat_i[32]), .wb_dat_i_c_34(wb_dat_i[34]), 
            .wb_dat_i_c_33(wb_dat_i[33]), .\wb_addr[9] (wb_addr[9]), .\wb_addr[8] (wb_addr[8]), 
            .\wb_addr[7] (wb_addr[7]), .\wb_addr[6] (wb_addr[6]), .\wb_addr[5] (wb_addr[5]), 
            .\wb_addr[4] (wb_addr[4]), .\wb_addr[3] (wb_addr[3]), .\wb_addr[2] (wb_addr[2]), 
            .\wb_addr[1] (wb_addr[1]), .\wb_addr[0] (wb_addr[0]), .rom_ce(rom_ce)) /* synthesis syn_module_defined=1 */ ;
    \uart_core(CLK_IN_MHZ=24,BAUD_RATE=115200,ADDRWIDTH=3,DATAWIDTH=8,FIFO=0)  UART_INST (.clk_c(clk_c), 
            .uart_tx_c(uart_tx_c), .n1506(n1506), .wb_data_from_master({wb_data_from_master}), 
            .\wb_addr[0] (wb_addr[0]), .\wb_addr[1] (wb_addr[1]), .n1242({n1242}), 
            .n10625(n10625), .n10221(n10221), .uart_rx_c(uart_rx_c), .parity_err(parity_err), 
            .n10626(n10626), .n3618(n3618), .n3377(n3377), .\wb_addr[3] (wb_addr[3]), 
            .\wb_addr[4] (wb_addr[4]), .n9133(n9133), .n9267(n9267), .n9266(n9266), 
            .n8260(n8260), .n9343(n9343), .n7422(n7422), .\ier[2] (ier[2]), 
            .n10236(n10236), .n10670(n10670), .n10217(n10217), .\wb_addr[2] (wb_addr[2]), 
            .\wb_addr[5] (wb_addr[5]), .\wb_addr[6] (wb_addr[6]), .\wb_addr[7] (wb_addr[7]), 
            .n10682(n10682), .n10793({n10793}), .div_wr_strobe(div_wr_strobe), 
            .n2694(n2694), .n10249(n10249)) /* synthesis syn_module_defined=1 */ ;
    \isp8(FAMILY_NAME="XO2",PROM_FILE="prom_init.hex",PORT_AW=8,EXT_AW=24,PROM_AW=10,PROM_AD=1024,REGISTERS_16=0,PGM_STACK_AW=4,PGM_STACK_AD=16)  lm8_inst (.clk_c(clk_c), 
            .\wb_addr[4] (wb_addr[4]), .\wb_addr[3] (wb_addr[3]), .\wb_addr[2] (wb_addr[2]), 
            .\wb_addr[1] (wb_addr[1]), .\wb_addr[0] (wb_addr[0]), .wb_data_from_master({wb_data_from_master}), 
            .\addr[23] (addr[23]), .\addr[21] (addr[21]), .n10236(n10236), 
            .n10268(n10268), .n2976(n2976), .data_in({data_in}), .\addr[20] (addr[20]), 
            .n2143(n2143), .\addr[22] (addr[22]), .ack_reg(ack_reg), .n10249(n10249), 
            .lm8_rst(lm8_rst), .rst(rst), .n10684(n10684), .n10661(n10661), 
            .n7422(n7422), .n10682(n10682), .\wb_addr[8] (wb_addr[8]), 
            .lm8_rstn(lm8_rstn), .\wb_addr[9] (wb_addr[9]), .parity_err(parity_err), 
            .n3618(n3618), .n4411(n4411), .n10793({n10793}), .div_wr_strobe(div_wr_strobe), 
            .rom_ce(rom_ce), .n10664(n10664), .n10221(n10221), .n10659(n10659), 
            .read_wait_done(read_wait_done), .n9219(n9219), .n3377(n3377), 
            .n2694(n2694), .n9218(n9218), .n1506(n1506), .n10670(n10670), 
            .n2642(n2642), .\ier[2] (ier[2]), .n10217(n10217), .n8279(n8279), 
            .\wb_ack[10] (wb_ack[10]), .\wb_ack[0] (wb_ack[0]), .n9581(n9581), 
            .wb_rst(wb_rst), .io_rdy(io_rdy)) /* synthesis syn_module_defined=1 */ ;
    LUT4 m0_lut (.Z(n10625)) /* synthesis lut_function=0, syn_instantiated=1 */ ;
    defparam m0_lut.init = 16'h0000;
    VLO i1 (.Z(GND_net));
    
endmodule

//
// Verilog Description of module adc_wb
//

module adc_wb (clk_c, digital_out_i, analog_out_c, analog_cmp) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    output [7:0]digital_out_i;
    output analog_out_c;
    input analog_cmp;
    
    
    ADC_top adc_inst (.clk_c(clk_c), .digital_out_i({digital_out_i}), .analog_out_c(analog_out_c), 
            .analog_cmp(analog_cmp)) /* synthesis syn_module_defined=1 */ ;
    
endmodule

//
// Verilog Description of module ADC_top
//

module ADC_top (clk_c, digital_out_i, analog_out_c, analog_cmp) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    output [7:0]digital_out_i;
    output analog_out_c;
    input analog_cmp;
    
    wire latch_result;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(101[6:18])
    wire [10:0]accum;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(94[41:46])
    
    FD1P3AX ave_data_out_i0_i0_i7 (.D(accum[10]), .SP(latch_result), .CK(clk_c), 
            .Q(digital_out_i[7])) /* synthesis syn_module_defined=1 */ ;
    defparam ave_data_out_i0_i0_i7.GSR = "DISABLED";
    FD1P3AX ave_data_out_i0_i0_i6 (.D(accum[9]), .SP(latch_result), .CK(clk_c), 
            .Q(digital_out_i[6])) /* synthesis syn_module_defined=1 */ ;
    defparam ave_data_out_i0_i0_i6.GSR = "DISABLED";
    FD1P3AX ave_data_out_i0_i0_i5 (.D(accum[8]), .SP(latch_result), .CK(clk_c), 
            .Q(digital_out_i[5])) /* synthesis syn_module_defined=1 */ ;
    defparam ave_data_out_i0_i0_i5.GSR = "DISABLED";
    FD1P3AX ave_data_out_i0_i0_i4 (.D(accum[7]), .SP(latch_result), .CK(clk_c), 
            .Q(digital_out_i[4])) /* synthesis syn_module_defined=1 */ ;
    defparam ave_data_out_i0_i0_i4.GSR = "DISABLED";
    FD1P3AX ave_data_out_i0_i0_i3 (.D(accum[6]), .SP(latch_result), .CK(clk_c), 
            .Q(digital_out_i[3])) /* synthesis syn_module_defined=1 */ ;
    defparam ave_data_out_i0_i0_i3.GSR = "DISABLED";
    FD1P3AX ave_data_out_i0_i0_i2 (.D(accum[5]), .SP(latch_result), .CK(clk_c), 
            .Q(digital_out_i[2])) /* synthesis syn_module_defined=1 */ ;
    defparam ave_data_out_i0_i0_i2.GSR = "DISABLED";
    FD1P3AX ave_data_out_i0_i0_i1 (.D(accum[4]), .SP(latch_result), .CK(clk_c), 
            .Q(digital_out_i[1])) /* synthesis syn_module_defined=1 */ ;
    defparam ave_data_out_i0_i0_i1.GSR = "DISABLED";
    FD1P3AX ave_data_out_i0_i0_i0 (.D(accum[3]), .SP(latch_result), .CK(clk_c), 
            .Q(digital_out_i[0])) /* synthesis syn_module_defined=1 */ ;
    defparam ave_data_out_i0_i0_i0.GSR = "DISABLED";
    \sigmadelta_adc(ADC_WIDTH=8,ACCUM_BITS=10,LPF_DEPTH_BITS=3)  SSD_ADC (.analog_out_c(analog_out_c), 
            .clk_c(clk_c), .analog_cmp(analog_cmp), .\accum[10] (accum[10]), 
            .\accum[9] (accum[9]), .\accum[8] (accum[8]), .\accum[7] (accum[7]), 
            .\accum[6] (accum[6]), .\accum[5] (accum[5]), .\accum[4] (accum[4]), 
            .\accum[3] (accum[3]), .latch_result(latch_result)) /* synthesis syn_module_defined=1 */ ;
    
endmodule

//
// Verilog Description of module \sigmadelta_adc(ADC_WIDTH=8,ACCUM_BITS=10,LPF_DEPTH_BITS=3) 
//

module \sigmadelta_adc(ADC_WIDTH=8,ACCUM_BITS=10,LPF_DEPTH_BITS=3)  (analog_out_c, 
            clk_c, analog_cmp, \accum[10] , \accum[9] , \accum[8] , 
            \accum[7] , \accum[6] , \accum[5] , \accum[4] , \accum[3] , 
            latch_result) /* synthesis syn_module_defined=1 */ ;
    output analog_out_c;
    input clk_c;
    input analog_cmp;
    output \accum[10] ;
    output \accum[9] ;
    output \accum[8] ;
    output \accum[7] ;
    output \accum[6] ;
    output \accum[5] ;
    output \accum[4] ;
    output \accum[3] ;
    output latch_result;
    
    wire rollover;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(95[11:19])
    wire [9:0]counter;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(94[26:33])
    wire [9:0]sigma;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(92[26:31])
    wire [7:0]accum;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(93[29:34])
    wire accum_rdy;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/sigmadelta_adc.v(96[11:20])
    wire [9:0]n47;
    wire [9:0]n36_adj_0;
    
    wire n8252, n16_adj_0, n17_adj_0, GND_net, n8255, n8132, n8133, 
        n8134, n8135, n8136;
    wire [9:0]n36;
    
    wire n8100, n16, n17, n8101, n8102, n8103, n8104;
    
    LUT4 sigma_760_mux_5_i1_3_lut (.A(n36_adj_0[0]), .B(analog_out_c), .C(rollover), 
         .Z(n47[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam sigma_760_mux_5_i1_3_lut.init = 16'hcaca;
    LUT4 i9_4_lut_adj_0 (.A(n17_adj_0), .B(counter[5]), .C(n16_adj_0), 
         .D(counter[1]), .Z(n8252)) /* synthesis lut_function=(A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i9_4_lut_adj_0.init = 16'h8000;
    LUT4 i7_4_lut_adj_0 (.A(counter[0]), .B(counter[8]), .C(counter[9]), 
         .D(counter[2]), .Z(n17_adj_0)) /* synthesis lut_function=(A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i7_4_lut_adj_0.init = 16'h8000;
    LUT4 i6_4_lut_adj_0 (.A(counter[7]), .B(counter[3]), .C(counter[4]), 
         .D(counter[6]), .Z(n16_adj_0)) /* synthesis lut_function=(A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i6_4_lut_adj_0.init = 16'h8000;
    CCU2D sigma_760_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(analog_out_c), .B1(n8255), .C1(sigma[0]), 
          .D1(GND_net), .COUT(n8132), .S1(n36_adj_0[0])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760_add_4_1.INIT0 = 16'hF000;
    defparam sigma_760_add_4_1.INIT1 = 16'hd2d2;
    defparam sigma_760_add_4_1.INJECT1_0 = "NO";
    defparam sigma_760_add_4_1.INJECT1_1 = "NO";
    CCU2D sigma_760_add_4_3 (.A0(sigma[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(sigma[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8132), .COUT(n8133), .S0(n36_adj_0[1]), .S1(n36_adj_0[2])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760_add_4_3.INIT0 = 16'hfaaa;
    defparam sigma_760_add_4_3.INIT1 = 16'hfaaa;
    defparam sigma_760_add_4_3.INJECT1_0 = "NO";
    defparam sigma_760_add_4_3.INJECT1_1 = "NO";
    CCU2D sigma_760_add_4_5 (.A0(sigma[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(sigma[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8133), .COUT(n8134), .S0(n36_adj_0[3]), .S1(n36_adj_0[4])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760_add_4_5.INIT0 = 16'hfaaa;
    defparam sigma_760_add_4_5.INIT1 = 16'hfaaa;
    defparam sigma_760_add_4_5.INJECT1_0 = "NO";
    defparam sigma_760_add_4_5.INJECT1_1 = "NO";
    CCU2D sigma_760_add_4_7 (.A0(sigma[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(sigma[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8134), .COUT(n8135), .S0(n36_adj_0[5]), .S1(n36_adj_0[6])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760_add_4_7.INIT0 = 16'hfaaa;
    defparam sigma_760_add_4_7.INIT1 = 16'hfaaa;
    defparam sigma_760_add_4_7.INJECT1_0 = "NO";
    defparam sigma_760_add_4_7.INJECT1_1 = "NO";
    CCU2D sigma_760_add_4_9 (.A0(sigma[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(sigma[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8135), .COUT(n8136), .S0(n36_adj_0[7]), .S1(n36_adj_0[8])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760_add_4_9.INIT0 = 16'hfaaa;
    defparam sigma_760_add_4_9.INIT1 = 16'hfaaa;
    defparam sigma_760_add_4_9.INJECT1_0 = "NO";
    defparam sigma_760_add_4_9.INJECT1_1 = "NO";
    CCU2D sigma_760_add_4_11 (.A0(sigma[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8136), .S0(n36_adj_0[9])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760_add_4_11.INIT0 = 16'hfaaa;
    defparam sigma_760_add_4_11.INIT1 = 16'h0000;
    defparam sigma_760_add_4_11.INJECT1_0 = "NO";
    defparam sigma_760_add_4_11.INJECT1_1 = "NO";
    CCU2D counter_761_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[0]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n8100), .S1(n36[0])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761_add_4_1.INIT0 = 16'hF000;
    defparam counter_761_add_4_1.INIT1 = 16'h0555;
    defparam counter_761_add_4_1.INJECT1_0 = "NO";
    defparam counter_761_add_4_1.INJECT1_1 = "NO";
    LUT4 i9_4_lut (.A(n17), .B(sigma[5]), .C(n16), .D(sigma[1]), .Z(n8255)) /* synthesis lut_function=(A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i9_4_lut.init = 16'h8000;
    LUT4 i7_4_lut (.A(sigma[0]), .B(sigma[8]), .C(sigma[9]), .D(sigma[2]), 
         .Z(n17)) /* synthesis lut_function=(A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i7_4_lut.init = 16'h8000;
    LUT4 i6_4_lut (.A(sigma[7]), .B(sigma[3]), .C(sigma[4]), .D(sigma[6]), 
         .Z(n16)) /* synthesis lut_function=(A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i6_4_lut.init = 16'h8000;
    CCU2D counter_761_add_4_3 (.A0(counter[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8100), .COUT(n8101), .S0(n36[1]), .S1(n36[2])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761_add_4_3.INIT0 = 16'hfaaa;
    defparam counter_761_add_4_3.INIT1 = 16'hfaaa;
    defparam counter_761_add_4_3.INJECT1_0 = "NO";
    defparam counter_761_add_4_3.INJECT1_1 = "NO";
    CCU2D counter_761_add_4_5 (.A0(counter[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8101), .COUT(n8102), .S0(n36[3]), .S1(n36[4])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761_add_4_5.INIT0 = 16'hfaaa;
    defparam counter_761_add_4_5.INIT1 = 16'hfaaa;
    defparam counter_761_add_4_5.INJECT1_0 = "NO";
    defparam counter_761_add_4_5.INJECT1_1 = "NO";
    CCU2D counter_761_add_4_7 (.A0(counter[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8102), .COUT(n8103), .S0(n36[5]), .S1(n36[6])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761_add_4_7.INIT0 = 16'hfaaa;
    defparam counter_761_add_4_7.INIT1 = 16'hfaaa;
    defparam counter_761_add_4_7.INJECT1_0 = "NO";
    defparam counter_761_add_4_7.INJECT1_1 = "NO";
    CCU2D counter_761_add_4_9 (.A0(counter[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8103), .COUT(n8104), .S0(n36[7]), .S1(n36[8])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761_add_4_9.INIT0 = 16'hfaaa;
    defparam counter_761_add_4_9.INIT1 = 16'hfaaa;
    defparam counter_761_add_4_9.INJECT1_0 = "NO";
    defparam counter_761_add_4_9.INJECT1_1 = "NO";
    CCU2D counter_761_add_4_11 (.A0(counter[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8104), .S0(n36[9])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761_add_4_11.INIT0 = 16'hfaaa;
    defparam counter_761_add_4_11.INIT1 = 16'h0000;
    defparam counter_761_add_4_11.INJECT1_0 = "NO";
    defparam counter_761_add_4_11.INJECT1_1 = "NO";
    FD1P3AX accum_i0_i0_i7 (.D(sigma[9]), .SP(rollover), .CK(clk_c), .Q(accum[7])) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i7.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i6 (.D(sigma[8]), .SP(rollover), .CK(clk_c), .Q(accum[6])) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i6.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i5 (.D(sigma[7]), .SP(rollover), .CK(clk_c), .Q(accum[5])) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i5.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i4 (.D(sigma[6]), .SP(rollover), .CK(clk_c), .Q(accum[4])) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i4.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i3 (.D(sigma[5]), .SP(rollover), .CK(clk_c), .Q(accum[3])) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i3.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i2 (.D(sigma[4]), .SP(rollover), .CK(clk_c), .Q(accum[2])) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i2.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i1 (.D(sigma[3]), .SP(rollover), .CK(clk_c), .Q(accum[1])) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i1.GSR = "DISABLED";
    FD1S3IX sigma_760__i9 (.D(n36_adj_0[9]), .CK(clk_c), .CD(rollover), 
            .Q(sigma[9])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760__i9.GSR = "DISABLED";
    FD1S3IX sigma_760__i8 (.D(n36_adj_0[8]), .CK(clk_c), .CD(rollover), 
            .Q(sigma[8])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760__i8.GSR = "DISABLED";
    FD1S3IX sigma_760__i7 (.D(n36_adj_0[7]), .CK(clk_c), .CD(rollover), 
            .Q(sigma[7])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760__i7.GSR = "DISABLED";
    FD1S3IX sigma_760__i6 (.D(n36_adj_0[6]), .CK(clk_c), .CD(rollover), 
            .Q(sigma[6])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760__i6.GSR = "DISABLED";
    FD1S3IX sigma_760__i5 (.D(n36_adj_0[5]), .CK(clk_c), .CD(rollover), 
            .Q(sigma[5])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760__i5.GSR = "DISABLED";
    FD1S3IX sigma_760__i4 (.D(n36_adj_0[4]), .CK(clk_c), .CD(rollover), 
            .Q(sigma[4])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760__i4.GSR = "DISABLED";
    FD1S3IX sigma_760__i3 (.D(n36_adj_0[3]), .CK(clk_c), .CD(rollover), 
            .Q(sigma[3])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760__i3.GSR = "DISABLED";
    FD1S3IX sigma_760__i2 (.D(n36_adj_0[2]), .CK(clk_c), .CD(rollover), 
            .Q(sigma[2])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760__i2.GSR = "DISABLED";
    FD1S3IX sigma_760__i1 (.D(n36_adj_0[1]), .CK(clk_c), .CD(rollover), 
            .Q(sigma[1])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760__i1.GSR = "DISABLED";
    FD1S3AX delta (.D(analog_cmp), .CK(clk_c), .Q(analog_out_c)) /* synthesis syn_module_defined=1 */ ;
    defparam delta.GSR = "DISABLED";
    FD1S3AX rollover_c (.D(n8252), .CK(clk_c), .Q(rollover)) /* synthesis syn_module_defined=1 */ ;
    defparam rollover_c.GSR = "DISABLED";
    FD1S3AX accum_rdy_c (.D(rollover), .CK(clk_c), .Q(accum_rdy)) /* synthesis syn_module_defined=1 */ ;
    defparam accum_rdy_c.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i0 (.D(sigma[2]), .SP(rollover), .CK(clk_c), .Q(accum[0])) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i0.GSR = "DISABLED";
    FD1S3AX sigma_760__i0 (.D(n47[0]), .CK(clk_c), .Q(sigma[0])) /* synthesis syn_module_defined=1 */ ;
    defparam sigma_760__i0.GSR = "DISABLED";
    FD1S3AX counter_761__i0 (.D(n36[0]), .CK(clk_c), .Q(counter[0])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761__i0.GSR = "DISABLED";
    FD1S3AX counter_761__i1 (.D(n36[1]), .CK(clk_c), .Q(counter[1])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761__i1.GSR = "DISABLED";
    FD1S3AX counter_761__i2 (.D(n36[2]), .CK(clk_c), .Q(counter[2])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761__i2.GSR = "DISABLED";
    FD1S3AX counter_761__i3 (.D(n36[3]), .CK(clk_c), .Q(counter[3])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761__i3.GSR = "DISABLED";
    FD1S3AX counter_761__i4 (.D(n36[4]), .CK(clk_c), .Q(counter[4])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761__i4.GSR = "DISABLED";
    FD1S3AX counter_761__i5 (.D(n36[5]), .CK(clk_c), .Q(counter[5])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761__i5.GSR = "DISABLED";
    FD1S3AX counter_761__i6 (.D(n36[6]), .CK(clk_c), .Q(counter[6])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761__i6.GSR = "DISABLED";
    FD1S3AX counter_761__i7 (.D(n36[7]), .CK(clk_c), .Q(counter[7])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761__i7.GSR = "DISABLED";
    FD1S3AX counter_761__i8 (.D(n36[8]), .CK(clk_c), .Q(counter[8])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761__i8.GSR = "DISABLED";
    FD1S3AX counter_761__i9 (.D(n36[9]), .CK(clk_c), .Q(counter[9])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_761__i9.GSR = "DISABLED";
    \box_ave(ADC_WIDTH=8,LPF_DEPTH_BITS=3)  box_ave (.clk_c(clk_c), .accum({accum}), 
            .\accum[10] (\accum[10] ), .\accum[9] (\accum[9] ), .\accum[8] (\accum[8] ), 
            .\accum[7]_adj_0 (\accum[7] ), .\accum[6]_adj_0 (\accum[6] ), 
            .\accum[5]_adj_0 (\accum[5] ), .\accum[4]_adj_0 (\accum[4] ), 
            .\accum[3]_adj_0 (\accum[3] ), .accum_rdy(accum_rdy), .latch_result(latch_result)) /* synthesis syn_module_defined=1 */ ;
    VLO i1 (.Z(GND_net));
    
endmodule

//
// Verilog Description of module \box_ave(ADC_WIDTH=8,LPF_DEPTH_BITS=3) 
//

module \box_ave(ADC_WIDTH=8,LPF_DEPTH_BITS=3)  (clk_c, accum, \accum[10] , 
            \accum[9] , \accum[8] , \accum[7]_adj_0 , \accum[6]_adj_0 , 
            \accum[5]_adj_0 , \accum[4]_adj_0 , \accum[3]_adj_0 , accum_rdy, 
            latch_result) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    input [7:0]accum;
    output \accum[10] ;
    output \accum[9] ;
    output \accum[8] ;
    output \accum[7]_adj_0 ;
    output \accum[6]_adj_0 ;
    output \accum[5]_adj_0 ;
    output \accum[4]_adj_0 ;
    output \accum[3]_adj_0 ;
    input accum_rdy;
    output latch_result;
    
    wire [2:0]count;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(95[41:46])
    wire accumulate;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(100[6:16])
    wire sample_d2;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(98[16:25])
    wire sample_d1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(98[5:14])
    wire [7:0]raw_data_d1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(96[27:38])
    wire [10:0]accum_adj_0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/box_ave.v(94[41:46])
    
    wire n4;
    wire [2:0]n15;
    wire [10:0]n53;
    
    wire n4_adj_0, n8117, GND_net, n8118, n8119, n8120, n8121;
    
    LUT4 i1_2_lut_adj_0 (.A(count[0]), .B(count[1]), .Z(n4)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i1_2_lut_adj_0.init = 16'heeee;
    LUT4 i11_2_lut (.A(sample_d1), .B(sample_d2), .Z(accumulate)) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i11_2_lut.init = 16'h2222;
    LUT4 i7061_3_lut (.A(count[2]), .B(count[1]), .C(count[0]), .Z(n15[2])) /* synthesis lut_function=(!(A (B (C))+!A !(B (C)))), syn_module_defined=1 */ ;
    defparam i7061_3_lut.init = 16'h6a6a;
    INV i7052 (.A(count[0]), .Z(n15[0])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i7054_2_lut (.A(count[1]), .B(count[0]), .Z(n15[1])) /* synthesis lut_function=(!(A (B)+!A !(B))), syn_module_defined=1 */ ;
    defparam i7054_2_lut.init = 16'h6666;
    FD1S3AX raw_data_d1_i7 (.D(accum[7]), .CK(clk_c), .Q(raw_data_d1[7])) /* synthesis syn_module_defined=1 */ ;
    defparam raw_data_d1_i7.GSR = "DISABLED";
    FD1S3AX raw_data_d1_i6 (.D(accum[6]), .CK(clk_c), .Q(raw_data_d1[6])) /* synthesis syn_module_defined=1 */ ;
    defparam raw_data_d1_i6.GSR = "DISABLED";
    FD1S3AX raw_data_d1_i5 (.D(accum[5]), .CK(clk_c), .Q(raw_data_d1[5])) /* synthesis syn_module_defined=1 */ ;
    defparam raw_data_d1_i5.GSR = "DISABLED";
    FD1S3AX raw_data_d1_i4 (.D(accum[4]), .CK(clk_c), .Q(raw_data_d1[4])) /* synthesis syn_module_defined=1 */ ;
    defparam raw_data_d1_i4.GSR = "DISABLED";
    FD1S3AX raw_data_d1_i3 (.D(accum[3]), .CK(clk_c), .Q(raw_data_d1[3])) /* synthesis syn_module_defined=1 */ ;
    defparam raw_data_d1_i3.GSR = "DISABLED";
    FD1S3AX raw_data_d1_i2 (.D(accum[2]), .CK(clk_c), .Q(raw_data_d1[2])) /* synthesis syn_module_defined=1 */ ;
    defparam raw_data_d1_i2.GSR = "DISABLED";
    FD1S3AX raw_data_d1_i1 (.D(accum[1]), .CK(clk_c), .Q(raw_data_d1[1])) /* synthesis syn_module_defined=1 */ ;
    defparam raw_data_d1_i1.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i10 (.D(n53[10]), .SP(accumulate), .CK(clk_c), 
            .Q(\accum[10] )) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i10.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i9 (.D(n53[9]), .SP(accumulate), .CK(clk_c), .Q(\accum[9] )) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i9.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i8 (.D(n53[8]), .SP(accumulate), .CK(clk_c), .Q(\accum[8] )) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i8.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i7 (.D(n53[7]), .SP(accumulate), .CK(clk_c), .Q(\accum[7]_adj_0 )) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i7.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i6 (.D(n53[6]), .SP(accumulate), .CK(clk_c), .Q(\accum[6]_adj_0 )) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i6.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i5 (.D(n53[5]), .SP(accumulate), .CK(clk_c), .Q(\accum[5]_adj_0 )) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i5.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i4 (.D(n53[4]), .SP(accumulate), .CK(clk_c), .Q(\accum[4]_adj_0 )) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i4.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i3 (.D(n53[3]), .SP(accumulate), .CK(clk_c), .Q(\accum[3]_adj_0 )) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i3.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i2 (.D(n53[2]), .SP(accumulate), .CK(clk_c), .Q(accum_adj_0[2])) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i2.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i1 (.D(n53[1]), .SP(accumulate), .CK(clk_c), .Q(accum_adj_0[1])) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i1.GSR = "DISABLED";
    FD1S3AX sample_d1_c (.D(accum_rdy), .CK(clk_c), .Q(sample_d1)) /* synthesis syn_module_defined=1 */ ;
    defparam sample_d1_c.GSR = "DISABLED";
    FD1S3AX sample_d2_c (.D(sample_d1), .CK(clk_c), .Q(sample_d2)) /* synthesis syn_module_defined=1 */ ;
    defparam sample_d2_c.GSR = "DISABLED";
    FD1S3AX raw_data_d1_i0 (.D(accum[0]), .CK(clk_c), .Q(raw_data_d1[0])) /* synthesis syn_module_defined=1 */ ;
    defparam raw_data_d1_i0.GSR = "DISABLED";
    FD1P3AX accum_i0_i0_i0 (.D(n53[0]), .SP(accumulate), .CK(clk_c), .Q(accum_adj_0[0])) /* synthesis syn_module_defined=1 */ ;
    defparam accum_i0_i0_i0.GSR = "DISABLED";
    FD1P3AX count_762__i0 (.D(n15[0]), .SP(accumulate), .CK(clk_c), .Q(count[0])) /* synthesis syn_module_defined=1 */ ;
    defparam count_762__i0.GSR = "DISABLED";
    FD1P3AX count_762__i1 (.D(n15[1]), .SP(accumulate), .CK(clk_c), .Q(count[1])) /* synthesis syn_module_defined=1 */ ;
    defparam count_762__i1.GSR = "DISABLED";
    LUT4 i2_4_lut (.A(sample_d2), .B(sample_d1), .C(count[1]), .D(n4_adj_0), 
         .Z(latch_result)) /* synthesis lut_function=(!(A+((C+(D))+!B))), syn_module_defined=1 */ ;
    defparam i2_4_lut.init = 16'h0004;
    LUT4 i1_2_lut (.A(count[2]), .B(count[0]), .Z(n4_adj_0)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i1_2_lut.init = 16'heeee;
    FD1P3AX count_762__i2 (.D(n15[2]), .SP(accumulate), .CK(clk_c), .Q(count[2])) /* synthesis syn_module_defined=1 */ ;
    defparam count_762__i2.GSR = "DISABLED";
    CCU2D add_497_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(raw_data_d1[0]), .B1(n4), .C1(count[2]), .D1(accum_adj_0[0]), 
          .COUT(n8117), .S1(n53[0])) /* synthesis syn_module_defined=1 */ ;
    defparam add_497_1.INIT0 = 16'hF000;
    defparam add_497_1.INIT1 = 16'h56aa;
    defparam add_497_1.INJECT1_0 = "NO";
    defparam add_497_1.INJECT1_1 = "NO";
    CCU2D add_497_3 (.A0(raw_data_d1[1]), .B0(n4), .C0(count[2]), .D0(accum_adj_0[1]), 
          .A1(raw_data_d1[2]), .B1(n4), .C1(count[2]), .D1(accum_adj_0[2]), 
          .CIN(n8117), .COUT(n8118), .S0(n53[1]), .S1(n53[2])) /* synthesis syn_module_defined=1 */ ;
    defparam add_497_3.INIT0 = 16'h56aa;
    defparam add_497_3.INIT1 = 16'h56aa;
    defparam add_497_3.INJECT1_0 = "NO";
    defparam add_497_3.INJECT1_1 = "NO";
    CCU2D add_497_5 (.A0(raw_data_d1[3]), .B0(n4), .C0(count[2]), .D0(\accum[3]_adj_0 ), 
          .A1(raw_data_d1[4]), .B1(n4), .C1(count[2]), .D1(\accum[4]_adj_0 ), 
          .CIN(n8118), .COUT(n8119), .S0(n53[3]), .S1(n53[4])) /* synthesis syn_module_defined=1 */ ;
    defparam add_497_5.INIT0 = 16'h56aa;
    defparam add_497_5.INIT1 = 16'h56aa;
    defparam add_497_5.INJECT1_0 = "NO";
    defparam add_497_5.INJECT1_1 = "NO";
    CCU2D add_497_7 (.A0(raw_data_d1[5]), .B0(n4), .C0(count[2]), .D0(\accum[5]_adj_0 ), 
          .A1(raw_data_d1[6]), .B1(n4), .C1(count[2]), .D1(\accum[6]_adj_0 ), 
          .CIN(n8119), .COUT(n8120), .S0(n53[5]), .S1(n53[6])) /* synthesis syn_module_defined=1 */ ;
    defparam add_497_7.INIT0 = 16'h56aa;
    defparam add_497_7.INIT1 = 16'h56aa;
    defparam add_497_7.INJECT1_0 = "NO";
    defparam add_497_7.INJECT1_1 = "NO";
    CCU2D add_497_9 (.A0(raw_data_d1[7]), .B0(n4), .C0(count[2]), .D0(\accum[7]_adj_0 ), 
          .A1(count[1]), .B1(count[0]), .C1(count[2]), .D1(\accum[8] ), 
          .CIN(n8120), .COUT(n8121), .S0(n53[7]), .S1(n53[8])) /* synthesis syn_module_defined=1 */ ;
    defparam add_497_9.INIT0 = 16'h56aa;
    defparam add_497_9.INIT1 = 16'hfe00;
    defparam add_497_9.INJECT1_0 = "NO";
    defparam add_497_9.INJECT1_1 = "NO";
    CCU2D add_497_11 (.A0(count[1]), .B0(count[0]), .C0(count[2]), .D0(\accum[9] ), 
          .A1(count[1]), .B1(count[0]), .C1(count[2]), .D1(\accum[10] ), 
          .CIN(n8121), .S0(n53[9]), .S1(n53[10])) /* synthesis syn_module_defined=1 */ ;
    defparam add_497_11.INIT0 = 16'hfe00;
    defparam add_497_11.INIT1 = 16'hfe00;
    defparam add_497_11.INJECT1_0 = "NO";
    defparam add_497_11.INJECT1_1 = "NO";
    VLO i1 (.Z(GND_net));
    
endmodule

//
// Verilog Description of module \uptime_wb(CLK_FREQ=24180000,CLK_IN_HZ=25) 
//

module \uptime_wb(CLK_FREQ=24180000,CLK_IN_HZ=25)  (\wb_addr[0] , \wb_addr[1] , 
            n8203, clk_c, n10723, n8200, n8197, n8194, n8191, 
            n8188, n8183, n8180, rst) /* synthesis syn_module_defined=1 */ ;
    input \wb_addr[0] ;
    input \wb_addr[1] ;
    output n8203;
    input clk_c;
    output n10723;
    output n8200;
    output n8197;
    output n8194;
    output n8191;
    output n8188;
    output n8183;
    output n8180;
    input rst;
    
    wire [7:0]minutes_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(62[13:24])
    wire [7:0]seconds_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(61[13:24])
    wire [7:0]hours_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(63[13:22])
    wire [7:0]minutes;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(59[13:20])
    wire [24:0]counter;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(103[23:30])
    wire [7:0]seconds;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(58[13:20])
    wire [7:0]hours;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(60[13:18])
    wire sec_clock;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uptime_wb.v(65[13:22])
    wire [24:0]n81;
    
    wire n51;
    wire [24:0]n107;
    
    wire n8192, n8193, n8195, n8196, n8198, n8199, GND_net;
    wire [7:0]n14;
    
    wire n8128, n8129, n8130, n8131, n8202, n8201, n2433, n6_adj_0, 
        n8093, n8094, n8095, n8096, n8097, n8098, n3378;
    wire [7:0]n39_adj_0;
    wire [7:0]n30_adj_0;
    
    wire n8088;
    wire [24:0]n159;
    
    wire n8087, n8105, n8106, n8107;
    wire [7:0]n30;
    
    wire n8083, n8108, n8092, n8084, n8085, n8086, n8249, n8330, 
        n7, n22_adj_0, n8, n16, n8178, n8190, n8189, n8179, 
        n8181, n8182, n8187, n8186, n8091;
    wire [7:0]n39;
    
    wire n6, n5, n8090, n8089, n106;
    
    LUT4 i4504_2_lut (.A(n81[13]), .B(n51), .Z(n107[13])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4504_2_lut.init = 16'h2222;
    LUT4 i4505_2_lut (.A(n81[12]), .B(n51), .Z(n107[12])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4505_2_lut.init = 16'h2222;
    LUT4 i4506_2_lut (.A(n81[11]), .B(n51), .Z(n107[11])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4506_2_lut.init = 16'h2222;
    LUT4 i4507_2_lut (.A(n81[10]), .B(n51), .Z(n107[10])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4507_2_lut.init = 16'h2222;
    LUT4 i4509_2_lut (.A(n81[9]), .B(n51), .Z(n107[9])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4509_2_lut.init = 16'h2222;
    LUT4 i4510_2_lut (.A(n81[8]), .B(n51), .Z(n107[8])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4510_2_lut.init = 16'h2222;
    LUT4 i4511_2_lut (.A(n81[7]), .B(n51), .Z(n107[7])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4511_2_lut.init = 16'h2222;
    LUT4 i4516_2_lut (.A(n81[6]), .B(n51), .Z(n107[6])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4516_2_lut.init = 16'h2222;
    LUT4 i4518_2_lut (.A(n81[5]), .B(n51), .Z(n107[5])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4518_2_lut.init = 16'h2222;
    LUT4 i4519_2_lut (.A(n81[4]), .B(n51), .Z(n107[4])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4519_2_lut.init = 16'h2222;
    LUT4 i7136_3_lut (.A(seconds_reg[3]), .B(minutes_reg[3]), .C(\wb_addr[0] ), 
         .Z(n8192)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7136_3_lut.init = 16'hcaca;
    LUT4 i7137_3_lut (.A(hours_reg[3]), .B(seconds_reg[3]), .C(\wb_addr[0] ), 
         .Z(n8193)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7137_3_lut.init = 16'hcaca;
    LUT4 i4522_2_lut (.A(n81[3]), .B(n51), .Z(n107[3])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4522_2_lut.init = 16'h2222;
    LUT4 i4523_2_lut (.A(n81[2]), .B(n51), .Z(n107[2])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4523_2_lut.init = 16'h2222;
    LUT4 i4524_2_lut (.A(n81[1]), .B(n51), .Z(n107[1])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4524_2_lut.init = 16'h2222;
    LUT4 i7139_3_lut (.A(seconds_reg[4]), .B(minutes_reg[4]), .C(\wb_addr[0] ), 
         .Z(n8195)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7139_3_lut.init = 16'hcaca;
    LUT4 i7140_3_lut (.A(hours_reg[4]), .B(seconds_reg[4]), .C(\wb_addr[0] ), 
         .Z(n8196)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7140_3_lut.init = 16'hcaca;
    LUT4 i7142_3_lut (.A(seconds_reg[5]), .B(minutes_reg[5]), .C(\wb_addr[0] ), 
         .Z(n8198)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7142_3_lut.init = 16'hcaca;
    LUT4 i7143_3_lut (.A(hours_reg[5]), .B(seconds_reg[5]), .C(\wb_addr[0] ), 
         .Z(n8199)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7143_3_lut.init = 16'hcaca;
    CCU2D minutes_755_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(minutes[0]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n8128), .S1(n14[0])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_755_add_4_1.INIT0 = 16'hF000;
    defparam minutes_755_add_4_1.INIT1 = 16'h0555;
    defparam minutes_755_add_4_1.INJECT1_0 = "NO";
    defparam minutes_755_add_4_1.INJECT1_1 = "NO";
    CCU2D minutes_755_add_4_3 (.A0(minutes[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(minutes[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8128), .COUT(n8129), .S0(n14[1]), .S1(n14[2])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_755_add_4_3.INIT0 = 16'hfaaa;
    defparam minutes_755_add_4_3.INIT1 = 16'hfaaa;
    defparam minutes_755_add_4_3.INJECT1_0 = "NO";
    defparam minutes_755_add_4_3.INJECT1_1 = "NO";
    CCU2D minutes_755_add_4_5 (.A0(minutes[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(minutes[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8129), .COUT(n8130), .S0(n14[3]), .S1(n14[4])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_755_add_4_5.INIT0 = 16'hfaaa;
    defparam minutes_755_add_4_5.INIT1 = 16'hfaaa;
    defparam minutes_755_add_4_5.INJECT1_0 = "NO";
    defparam minutes_755_add_4_5.INJECT1_1 = "NO";
    CCU2D minutes_755_add_4_7 (.A0(minutes[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(minutes[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8130), .COUT(n8131), .S0(n14[5]), .S1(n14[6])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_755_add_4_7.INIT0 = 16'hfaaa;
    defparam minutes_755_add_4_7.INIT1 = 16'hfaaa;
    defparam minutes_755_add_4_7.INJECT1_0 = "NO";
    defparam minutes_755_add_4_7.INJECT1_1 = "NO";
    CCU2D minutes_755_add_4_9 (.A0(minutes[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8131), .S0(n14[7])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_755_add_4_9.INIT0 = 16'hfaaa;
    defparam minutes_755_add_4_9.INIT1 = 16'h0000;
    defparam minutes_755_add_4_9.INJECT1_0 = "NO";
    defparam minutes_755_add_4_9.INJECT1_1 = "NO";
    PFUMX i7147 (.BLUT(n8201), .ALUT(n8202), .C0(\wb_addr[1] ), .Z(n8203)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i4572_2_lut (.A(n81[0]), .B(n51), .Z(n107[0])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4572_2_lut.init = 16'h2222;
    LUT4 i3_4_lut_adj_0 (.A(n6_adj_0), .B(minutes[5]), .C(minutes[4]), 
         .D(minutes[3]), .Z(n2433)) /* synthesis lut_function=(A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i3_4_lut_adj_0.init = 16'h8000;
    LUT4 i988_3_lut (.A(minutes[0]), .B(minutes[2]), .C(minutes[1]), .Z(n6_adj_0)) /* synthesis lut_function=(A (B+(C))+!A (B)), syn_module_defined=1 */ ;
    defparam i988_3_lut.init = 16'hecec;
    CCU2D counter_753_add_4_15 (.A0(counter[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[14]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8093), .COUT(n8094), .S0(n81[13]), .S1(n81[14])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753_add_4_15.INIT0 = 16'hfaaa;
    defparam counter_753_add_4_15.INIT1 = 16'hfaaa;
    defparam counter_753_add_4_15.INJECT1_0 = "NO";
    defparam counter_753_add_4_15.INJECT1_1 = "NO";
    CCU2D counter_753_add_4_17 (.A0(counter[15]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[16]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8094), .COUT(n8095), .S0(n81[15]), .S1(n81[16])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753_add_4_17.INIT0 = 16'hfaaa;
    defparam counter_753_add_4_17.INIT1 = 16'hfaaa;
    defparam counter_753_add_4_17.INJECT1_0 = "NO";
    defparam counter_753_add_4_17.INJECT1_1 = "NO";
    CCU2D counter_753_add_4_19 (.A0(counter[17]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[18]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8095), .COUT(n8096), .S0(n81[17]), .S1(n81[18])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753_add_4_19.INIT0 = 16'hfaaa;
    defparam counter_753_add_4_19.INIT1 = 16'hfaaa;
    defparam counter_753_add_4_19.INJECT1_0 = "NO";
    defparam counter_753_add_4_19.INJECT1_1 = "NO";
    INV i113 (.A(clk_c), .Z(n10723)) /* synthesis syn_module_defined=1 */ ;
    CCU2D counter_753_add_4_21 (.A0(counter[19]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[20]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8096), .COUT(n8097), .S0(n81[19]), .S1(n81[20])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753_add_4_21.INIT0 = 16'hfaaa;
    defparam counter_753_add_4_21.INIT1 = 16'hfaaa;
    defparam counter_753_add_4_21.INJECT1_0 = "NO";
    defparam counter_753_add_4_21.INJECT1_1 = "NO";
    CCU2D counter_753_add_4_23 (.A0(counter[21]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[22]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8097), .COUT(n8098), .S0(n81[21]), .S1(n81[22])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753_add_4_23.INIT0 = 16'hfaaa;
    defparam counter_753_add_4_23.INIT1 = 16'hfaaa;
    defparam counter_753_add_4_23.INJECT1_0 = "NO";
    defparam counter_753_add_4_23.INJECT1_1 = "NO";
    CCU2D counter_753_add_4_25 (.A0(counter[23]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[24]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8098), .S0(n81[23]), .S1(n81[24])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753_add_4_25.INIT0 = 16'hfaaa;
    defparam counter_753_add_4_25.INIT1 = 16'hfaaa;
    defparam counter_753_add_4_25.INJECT1_0 = "NO";
    defparam counter_753_add_4_25.INJECT1_1 = "NO";
    LUT4 i4601_2_lut (.A(n30_adj_0[7]), .B(n3378), .Z(n39_adj_0[7])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4601_2_lut.init = 16'h2222;
    LUT4 i4602_2_lut (.A(n30_adj_0[6]), .B(n3378), .Z(n39_adj_0[6])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4602_2_lut.init = 16'h2222;
    LUT4 i4603_2_lut (.A(n30_adj_0[5]), .B(n3378), .Z(n39_adj_0[5])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4603_2_lut.init = 16'h2222;
    LUT4 i4604_2_lut (.A(n30_adj_0[4]), .B(n3378), .Z(n39_adj_0[4])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4604_2_lut.init = 16'h2222;
    LUT4 i4605_2_lut (.A(n30_adj_0[3]), .B(n3378), .Z(n39_adj_0[3])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4605_2_lut.init = 16'h2222;
    LUT4 i4606_2_lut (.A(n30_adj_0[2]), .B(n3378), .Z(n39_adj_0[2])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4606_2_lut.init = 16'h2222;
    LUT4 i4607_2_lut (.A(n30_adj_0[1]), .B(n3378), .Z(n39_adj_0[1])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4607_2_lut.init = 16'h2222;
    LUT4 i7145_3_lut (.A(seconds_reg[1]), .B(minutes_reg[1]), .C(\wb_addr[0] ), 
         .Z(n8201)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7145_3_lut.init = 16'hcaca;
    LUT4 i7146_3_lut (.A(hours_reg[1]), .B(seconds_reg[1]), .C(\wb_addr[0] ), 
         .Z(n8202)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7146_3_lut.init = 16'hcaca;
    CCU2D counter_753_add_4_3 (.A0(n159[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n159[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8087), .COUT(n8088), .S0(n81[1]), .S1(n81[2])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753_add_4_3.INIT0 = 16'hfaaa;
    defparam counter_753_add_4_3.INIT1 = 16'hfaaa;
    defparam counter_753_add_4_3.INJECT1_0 = "NO";
    defparam counter_753_add_4_3.INJECT1_1 = "NO";
    CCU2D seconds_754_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(seconds[0]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n8105), .S1(n30_adj_0[0])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_754_add_4_1.INIT0 = 16'hF000;
    defparam seconds_754_add_4_1.INIT1 = 16'h0555;
    defparam seconds_754_add_4_1.INJECT1_0 = "NO";
    defparam seconds_754_add_4_1.INJECT1_1 = "NO";
    PFUMX i7144 (.BLUT(n8198), .ALUT(n8199), .C0(\wb_addr[1] ), .Z(n8200)) /* synthesis syn_module_defined=1 */ ;
    PFUMX i7141 (.BLUT(n8195), .ALUT(n8196), .C0(\wb_addr[1] ), .Z(n8197)) /* synthesis syn_module_defined=1 */ ;
    CCU2D seconds_754_add_4_3 (.A0(seconds[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(seconds[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8105), .COUT(n8106), .S0(n30_adj_0[1]), 
          .S1(n30_adj_0[2])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_754_add_4_3.INIT0 = 16'hfaaa;
    defparam seconds_754_add_4_3.INIT1 = 16'hfaaa;
    defparam seconds_754_add_4_3.INJECT1_0 = "NO";
    defparam seconds_754_add_4_3.INJECT1_1 = "NO";
    LUT4 i4646_2_lut (.A(n30_adj_0[0]), .B(n3378), .Z(n39_adj_0[0])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4646_2_lut.init = 16'h2222;
    CCU2D seconds_754_add_4_5 (.A0(seconds[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(seconds[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8106), .COUT(n8107), .S0(n30_adj_0[3]), 
          .S1(n30_adj_0[4])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_754_add_4_5.INIT0 = 16'hfaaa;
    defparam seconds_754_add_4_5.INIT1 = 16'hfaaa;
    defparam seconds_754_add_4_5.INJECT1_0 = "NO";
    defparam seconds_754_add_4_5.INJECT1_1 = "NO";
    CCU2D hours_756_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(hours[0]), .B1(minutes[7]), .C1(n2433), 
          .D1(minutes[6]), .COUT(n8083), .S1(n30[0])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_756_add_4_1.INIT0 = 16'hF000;
    defparam hours_756_add_4_1.INIT1 = 16'h5556;
    defparam hours_756_add_4_1.INJECT1_0 = "NO";
    defparam hours_756_add_4_1.INJECT1_1 = "NO";
    CCU2D seconds_754_add_4_7 (.A0(seconds[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(seconds[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8107), .COUT(n8108), .S0(n30_adj_0[5]), 
          .S1(n30_adj_0[6])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_754_add_4_7.INIT0 = 16'hfaaa;
    defparam seconds_754_add_4_7.INIT1 = 16'hfaaa;
    defparam seconds_754_add_4_7.INJECT1_0 = "NO";
    defparam seconds_754_add_4_7.INJECT1_1 = "NO";
    CCU2D counter_753_add_4_13 (.A0(counter[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[12]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8092), .COUT(n8093), .S0(n81[11]), .S1(n81[12])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753_add_4_13.INIT0 = 16'hfaaa;
    defparam counter_753_add_4_13.INIT1 = 16'hfaaa;
    defparam counter_753_add_4_13.INJECT1_0 = "NO";
    defparam counter_753_add_4_13.INJECT1_1 = "NO";
    CCU2D hours_756_add_4_3 (.A0(hours[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(hours[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8083), .COUT(n8084), .S0(n30[1]), .S1(n30[2])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_756_add_4_3.INIT0 = 16'hfaaa;
    defparam hours_756_add_4_3.INIT1 = 16'hfaaa;
    defparam hours_756_add_4_3.INJECT1_0 = "NO";
    defparam hours_756_add_4_3.INJECT1_1 = "NO";
    CCU2D seconds_754_add_4_9 (.A0(seconds[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8108), .S0(n30_adj_0[7])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_754_add_4_9.INIT0 = 16'hfaaa;
    defparam seconds_754_add_4_9.INIT1 = 16'h0000;
    defparam seconds_754_add_4_9.INJECT1_0 = "NO";
    defparam seconds_754_add_4_9.INJECT1_1 = "NO";
    CCU2D hours_756_add_4_5 (.A0(hours[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(hours[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8084), .COUT(n8085), .S0(n30[3]), .S1(n30[4])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_756_add_4_5.INIT0 = 16'hfaaa;
    defparam hours_756_add_4_5.INIT1 = 16'hfaaa;
    defparam hours_756_add_4_5.INJECT1_0 = "NO";
    defparam hours_756_add_4_5.INJECT1_1 = "NO";
    PFUMX i7138 (.BLUT(n8192), .ALUT(n8193), .C0(\wb_addr[1] ), .Z(n8194)) /* synthesis syn_module_defined=1 */ ;
    CCU2D hours_756_add_4_7 (.A0(hours[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(hours[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8085), .COUT(n8086), .S0(n30[5]), .S1(n30[6])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_756_add_4_7.INIT0 = 16'hfaaa;
    defparam hours_756_add_4_7.INIT1 = 16'hfaaa;
    defparam hours_756_add_4_7.INJECT1_0 = "NO";
    defparam hours_756_add_4_7.INJECT1_1 = "NO";
    LUT4 i4715_2_lut (.A(n81[24]), .B(n51), .Z(n107[24])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4715_2_lut.init = 16'h2222;
    LUT4 i878_4_lut (.A(n8249), .B(counter[24]), .C(counter[23]), .D(counter[22]), 
         .Z(n51)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))), syn_module_defined=1 */ ;
    defparam i878_4_lut.init = 16'hfcec;
    LUT4 i3_4_lut (.A(n8330), .B(counter[21]), .C(counter[20]), .D(counter[19]), 
         .Z(n8249)) /* synthesis lut_function=(A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i3_4_lut.init = 16'h8000;
    LUT4 i4_4_lut (.A(n7), .B(counter[18]), .C(counter[17]), .D(counter[15]), 
         .Z(n8330)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i4_4_lut.init = 16'hfffe;
    LUT4 i2_4_lut_adj_0 (.A(counter[16]), .B(counter[12]), .C(n8), .D(n22_adj_0), 
         .Z(n7)) /* synthesis lut_function=(A+(B (C (D)))), syn_module_defined=1 */ ;
    defparam i2_4_lut_adj_0.init = 16'heaaa;
    LUT4 i3_3_lut (.A(counter[14]), .B(counter[13]), .C(counter[11]), 
         .Z(n8)) /* synthesis lut_function=(A (B (C))), syn_module_defined=1 */ ;
    defparam i3_3_lut.init = 16'h8080;
    LUT4 i946_4_lut (.A(n16), .B(counter[10]), .C(counter[9]), .D(counter[8]), 
         .Z(n22_adj_0)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))), syn_module_defined=1 */ ;
    defparam i946_4_lut.init = 16'hfcec;
    LUT4 i1025_4_lut (.A(counter[6]), .B(counter[7]), .C(counter[5]), 
         .D(counter[4]), .Z(n16)) /* synthesis lut_function=(A (B)+!A (B (C+(D)))), syn_module_defined=1 */ ;
    defparam i1025_4_lut.init = 16'hccc8;
    LUT4 i4494_2_lut (.A(n81[23]), .B(n51), .Z(n107[23])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4494_2_lut.init = 16'h2222;
    LUT4 i7123_3_lut (.A(seconds_reg[6]), .B(minutes_reg[6]), .C(\wb_addr[0] ), 
         .Z(n8178)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7123_3_lut.init = 16'hcaca;
    PFUMX i7135 (.BLUT(n8189), .ALUT(n8190), .C0(\wb_addr[1] ), .Z(n8191)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i4495_2_lut (.A(n81[22]), .B(n51), .Z(n107[22])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4495_2_lut.init = 16'h2222;
    LUT4 i7124_3_lut (.A(hours_reg[6]), .B(seconds_reg[6]), .C(\wb_addr[0] ), 
         .Z(n8179)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7124_3_lut.init = 16'hcaca;
    LUT4 i7126_3_lut (.A(seconds_reg[7]), .B(minutes_reg[7]), .C(\wb_addr[0] ), 
         .Z(n8181)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7126_3_lut.init = 16'hcaca;
    LUT4 i7127_3_lut (.A(hours_reg[7]), .B(seconds_reg[7]), .C(\wb_addr[0] ), 
         .Z(n8182)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7127_3_lut.init = 16'hcaca;
    LUT4 i4496_2_lut (.A(n81[21]), .B(n51), .Z(n107[21])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4496_2_lut.init = 16'h2222;
    LUT4 i4497_2_lut (.A(n81[20]), .B(n51), .Z(n107[20])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4497_2_lut.init = 16'h2222;
    PFUMX i7132 (.BLUT(n8186), .ALUT(n8187), .C0(\wb_addr[1] ), .Z(n8188)) /* synthesis syn_module_defined=1 */ ;
    PFUMX i7128 (.BLUT(n8181), .ALUT(n8182), .C0(\wb_addr[1] ), .Z(n8183)) /* synthesis syn_module_defined=1 */ ;
    PFUMX i7125 (.BLUT(n8178), .ALUT(n8179), .C0(\wb_addr[1] ), .Z(n8180)) /* synthesis syn_module_defined=1 */ ;
    CCU2D counter_753_add_4_11 (.A0(counter[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[10]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8091), .COUT(n8092), .S0(n81[9]), .S1(n81[10])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753_add_4_11.INIT0 = 16'hfaaa;
    defparam counter_753_add_4_11.INIT1 = 16'hfaaa;
    defparam counter_753_add_4_11.INJECT1_0 = "NO";
    defparam counter_753_add_4_11.INJECT1_1 = "NO";
    LUT4 i4498_2_lut (.A(n81[19]), .B(n51), .Z(n107[19])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4498_2_lut.init = 16'h2222;
    FD1P3DX minutes_755__i0 (.D(n39[0]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(minutes[0])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_755__i0.GSR = "DISABLED";
    LUT4 i7130_3_lut (.A(seconds_reg[0]), .B(minutes_reg[0]), .C(\wb_addr[0] ), 
         .Z(n8186)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7130_3_lut.init = 16'hcaca;
    LUT4 i4499_2_lut (.A(n81[18]), .B(n51), .Z(n107[18])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4499_2_lut.init = 16'h2222;
    LUT4 i4500_2_lut (.A(n81[17]), .B(n51), .Z(n107[17])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4500_2_lut.init = 16'h2222;
    FD1S3DX seconds_reg_i1 (.D(seconds[1]), .CK(n10723), .CD(rst), .Q(seconds_reg[1])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_reg_i1.GSR = "DISABLED";
    LUT4 i7131_3_lut (.A(hours_reg[0]), .B(seconds_reg[0]), .C(\wb_addr[0] ), 
         .Z(n8187)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7131_3_lut.init = 16'hcaca;
    FD1S3DX seconds_reg_i2 (.D(seconds[2]), .CK(n10723), .CD(rst), .Q(seconds_reg[2])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_reg_i2.GSR = "DISABLED";
    FD1S3DX seconds_reg_i3 (.D(seconds[3]), .CK(n10723), .CD(rst), .Q(seconds_reg[3])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_reg_i3.GSR = "DISABLED";
    FD1S3DX seconds_reg_i4 (.D(seconds[4]), .CK(n10723), .CD(rst), .Q(seconds_reg[4])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_reg_i4.GSR = "DISABLED";
    FD1S3DX seconds_reg_i5 (.D(seconds[5]), .CK(n10723), .CD(rst), .Q(seconds_reg[5])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_reg_i5.GSR = "DISABLED";
    FD1S3DX seconds_reg_i6 (.D(seconds[6]), .CK(n10723), .CD(rst), .Q(seconds_reg[6])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_reg_i6.GSR = "DISABLED";
    FD1S3DX seconds_reg_i7 (.D(seconds[7]), .CK(n10723), .CD(rst), .Q(seconds_reg[7])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_reg_i7.GSR = "DISABLED";
    FD1S3DX minutes_reg_i1 (.D(minutes[1]), .CK(n10723), .CD(rst), .Q(minutes_reg[1])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_reg_i1.GSR = "DISABLED";
    FD1S3DX minutes_reg_i2 (.D(minutes[2]), .CK(n10723), .CD(rst), .Q(minutes_reg[2])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_reg_i2.GSR = "DISABLED";
    FD1S3DX minutes_reg_i3 (.D(minutes[3]), .CK(n10723), .CD(rst), .Q(minutes_reg[3])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_reg_i3.GSR = "DISABLED";
    FD1S3DX minutes_reg_i4 (.D(minutes[4]), .CK(n10723), .CD(rst), .Q(minutes_reg[4])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_reg_i4.GSR = "DISABLED";
    FD1S3DX minutes_reg_i5 (.D(minutes[5]), .CK(n10723), .CD(rst), .Q(minutes_reg[5])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_reg_i5.GSR = "DISABLED";
    FD1S3DX seconds_754__i0 (.D(n39_adj_0[0]), .CK(sec_clock), .CD(rst), 
            .Q(seconds[0])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_754__i0.GSR = "DISABLED";
    FD1S3DX minutes_reg_i6 (.D(minutes[6]), .CK(n10723), .CD(rst), .Q(minutes_reg[6])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_reg_i6.GSR = "DISABLED";
    FD1S3DX minutes_reg_i7 (.D(minutes[7]), .CK(n10723), .CD(rst), .Q(minutes_reg[7])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_reg_i7.GSR = "DISABLED";
    LUT4 i2_4_lut (.A(seconds[7]), .B(n5), .C(seconds[6]), .D(n6), .Z(n3378)) /* synthesis lut_function=(A+(B (C+(D))+!B (C))), syn_module_defined=1 */ ;
    defparam i2_4_lut.init = 16'hfefa;
    FD1S3DX hours_reg_i1 (.D(hours[1]), .CK(n10723), .CD(rst), .Q(hours_reg[1])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_reg_i1.GSR = "DISABLED";
    FD1S3DX hours_reg_i2 (.D(hours[2]), .CK(n10723), .CD(rst), .Q(hours_reg[2])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_reg_i2.GSR = "DISABLED";
    FD1S3DX hours_reg_i3 (.D(hours[3]), .CK(n10723), .CD(rst), .Q(hours_reg[3])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_reg_i3.GSR = "DISABLED";
    FD1S3DX hours_reg_i4 (.D(hours[4]), .CK(n10723), .CD(rst), .Q(hours_reg[4])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_reg_i4.GSR = "DISABLED";
    FD1S3DX hours_reg_i5 (.D(hours[5]), .CK(n10723), .CD(rst), .Q(hours_reg[5])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_reg_i5.GSR = "DISABLED";
    CCU2D counter_753_add_4_9 (.A0(counter[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8090), .COUT(n8091), .S0(n81[7]), .S1(n81[8])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753_add_4_9.INIT0 = 16'hfaaa;
    defparam counter_753_add_4_9.INIT1 = 16'hfaaa;
    defparam counter_753_add_4_9.INJECT1_0 = "NO";
    defparam counter_753_add_4_9.INJECT1_1 = "NO";
    FD1S3DX hours_reg_i6 (.D(hours[6]), .CK(n10723), .CD(rst), .Q(hours_reg[6])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_reg_i6.GSR = "DISABLED";
    LUT4 i1_4_lut (.A(seconds[0]), .B(seconds[5]), .C(seconds[2]), .D(seconds[1]), 
         .Z(n5)) /* synthesis lut_function=(A (B (C+(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i1_4_lut.init = 16'hc8c0;
    LUT4 i2_2_lut (.A(seconds[3]), .B(seconds[4]), .Z(n6)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i2_2_lut.init = 16'h8888;
    FD1S3DX seconds_754__i1 (.D(n39_adj_0[1]), .CK(sec_clock), .CD(rst), 
            .Q(seconds[1])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_754__i1.GSR = "DISABLED";
    FD1S3DX seconds_754__i2 (.D(n39_adj_0[2]), .CK(sec_clock), .CD(rst), 
            .Q(seconds[2])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_754__i2.GSR = "DISABLED";
    FD1S3DX seconds_754__i3 (.D(n39_adj_0[3]), .CK(sec_clock), .CD(rst), 
            .Q(seconds[3])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_754__i3.GSR = "DISABLED";
    FD1S3DX seconds_754__i4 (.D(n39_adj_0[4]), .CK(sec_clock), .CD(rst), 
            .Q(seconds[4])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_754__i4.GSR = "DISABLED";
    FD1S3DX seconds_754__i5 (.D(n39_adj_0[5]), .CK(sec_clock), .CD(rst), 
            .Q(seconds[5])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_754__i5.GSR = "DISABLED";
    FD1S3DX seconds_754__i6 (.D(n39_adj_0[6]), .CK(sec_clock), .CD(rst), 
            .Q(seconds[6])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_754__i6.GSR = "DISABLED";
    FD1S3DX seconds_754__i7 (.D(n39_adj_0[7]), .CK(sec_clock), .CD(rst), 
            .Q(seconds[7])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_754__i7.GSR = "DISABLED";
    FD1P3DX minutes_755__i1 (.D(n39[1]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(minutes[1])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_755__i1.GSR = "DISABLED";
    FD1P3DX minutes_755__i2 (.D(n39[2]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(minutes[2])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_755__i2.GSR = "DISABLED";
    FD1P3DX minutes_755__i3 (.D(n39[3]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(minutes[3])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_755__i3.GSR = "DISABLED";
    FD1P3DX minutes_755__i4 (.D(n39[4]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(minutes[4])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_755__i4.GSR = "DISABLED";
    FD1P3DX minutes_755__i5 (.D(n39[5]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(minutes[5])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_755__i5.GSR = "DISABLED";
    FD1P3DX minutes_755__i6 (.D(n39[6]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(minutes[6])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_755__i6.GSR = "DISABLED";
    LUT4 i7133_3_lut (.A(seconds_reg[2]), .B(minutes_reg[2]), .C(\wb_addr[0] ), 
         .Z(n8189)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7133_3_lut.init = 16'hcaca;
    FD1P3DX minutes_755__i7 (.D(n39[7]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(minutes[7])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_755__i7.GSR = "DISABLED";
    FD1S3DX hours_reg_i7 (.D(hours[7]), .CK(n10723), .CD(rst), .Q(hours_reg[7])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_reg_i7.GSR = "DISABLED";
    LUT4 i7134_3_lut (.A(hours_reg[2]), .B(seconds_reg[2]), .C(\wb_addr[0] ), 
         .Z(n8190)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i7134_3_lut.init = 16'hcaca;
    FD1S3DX counter_753__i0 (.D(n107[0]), .CK(clk_c), .CD(rst), .Q(n159[0])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i0.GSR = "DISABLED";
    FD1P3DX hours_756__i0 (.D(n30[0]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(hours[0])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_756__i0.GSR = "DISABLED";
    LUT4 i4643_2_lut_4_lut (.A(minutes[7]), .B(minutes[6]), .C(n2433), 
         .D(n14[7]), .Z(n39[7])) /* synthesis lut_function=(!(A+(B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4643_2_lut_4_lut.init = 16'h0100;
    LUT4 i4657_2_lut_4_lut (.A(minutes[7]), .B(minutes[6]), .C(n2433), 
         .D(n14[6]), .Z(n39[6])) /* synthesis lut_function=(!(A+(B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4657_2_lut_4_lut.init = 16'h0100;
    CCU2D hours_756_add_4_9 (.A0(hours[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8086), .S0(n30[7])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_756_add_4_9.INIT0 = 16'hfaaa;
    defparam hours_756_add_4_9.INIT1 = 16'h0000;
    defparam hours_756_add_4_9.INJECT1_0 = "NO";
    defparam hours_756_add_4_9.INJECT1_1 = "NO";
    LUT4 i4501_2_lut (.A(n81[16]), .B(n51), .Z(n107[16])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4501_2_lut.init = 16'h2222;
    LUT4 i4667_2_lut_4_lut (.A(minutes[7]), .B(minutes[6]), .C(n2433), 
         .D(n14[5]), .Z(n39[5])) /* synthesis lut_function=(!(A+(B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4667_2_lut_4_lut.init = 16'h0100;
    CCU2D counter_753_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n159[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n8087), .S1(n81[0])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753_add_4_1.INIT0 = 16'hF000;
    defparam counter_753_add_4_1.INIT1 = 16'h0555;
    defparam counter_753_add_4_1.INJECT1_0 = "NO";
    defparam counter_753_add_4_1.INJECT1_1 = "NO";
    LUT4 i4668_2_lut_4_lut (.A(minutes[7]), .B(minutes[6]), .C(n2433), 
         .D(n14[4]), .Z(n39[4])) /* synthesis lut_function=(!(A+(B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4668_2_lut_4_lut.init = 16'h0100;
    FD1S3DX counter_753__i1 (.D(n107[1]), .CK(clk_c), .CD(rst), .Q(n159[1])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i1.GSR = "DISABLED";
    FD1S3DX counter_753__i2 (.D(n107[2]), .CK(clk_c), .CD(rst), .Q(n159[2])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i2.GSR = "DISABLED";
    FD1S3DX counter_753__i3 (.D(n107[3]), .CK(clk_c), .CD(rst), .Q(n159[3])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i3.GSR = "DISABLED";
    FD1S3DX counter_753__i4 (.D(n107[4]), .CK(clk_c), .CD(rst), .Q(counter[4])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i4.GSR = "DISABLED";
    LUT4 i4669_2_lut_4_lut (.A(minutes[7]), .B(minutes[6]), .C(n2433), 
         .D(n14[3]), .Z(n39[3])) /* synthesis lut_function=(!(A+(B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4669_2_lut_4_lut.init = 16'h0100;
    LUT4 i4671_2_lut_4_lut (.A(minutes[7]), .B(minutes[6]), .C(n2433), 
         .D(n14[2]), .Z(n39[2])) /* synthesis lut_function=(!(A+(B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4671_2_lut_4_lut.init = 16'h0100;
    LUT4 i4502_2_lut (.A(n81[15]), .B(n51), .Z(n107[15])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4502_2_lut.init = 16'h2222;
    CCU2D counter_753_add_4_7 (.A0(counter[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8089), .COUT(n8090), .S0(n81[5]), .S1(n81[6])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753_add_4_7.INIT0 = 16'hfaaa;
    defparam counter_753_add_4_7.INIT1 = 16'hfaaa;
    defparam counter_753_add_4_7.INJECT1_0 = "NO";
    defparam counter_753_add_4_7.INJECT1_1 = "NO";
    FD1S3DX counter_753__i5 (.D(n107[5]), .CK(clk_c), .CD(rst), .Q(counter[5])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i5.GSR = "DISABLED";
    FD1S3DX counter_753__i6 (.D(n107[6]), .CK(clk_c), .CD(rst), .Q(counter[6])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i6.GSR = "DISABLED";
    LUT4 i32_2_lut (.A(sec_clock), .B(n51), .Z(n106)) /* synthesis lut_function=(!(A (B)+!A !(B))), syn_module_defined=1 */ ;
    defparam i32_2_lut.init = 16'h6666;
    FD1S3DX counter_753__i7 (.D(n107[7]), .CK(clk_c), .CD(rst), .Q(counter[7])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i7.GSR = "DISABLED";
    FD1S3DX counter_753__i8 (.D(n107[8]), .CK(clk_c), .CD(rst), .Q(counter[8])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i8.GSR = "DISABLED";
    FD1S3DX counter_753__i9 (.D(n107[9]), .CK(clk_c), .CD(rst), .Q(counter[9])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i9.GSR = "DISABLED";
    FD1S3DX counter_753__i10 (.D(n107[10]), .CK(clk_c), .CD(rst), .Q(counter[10])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i10.GSR = "DISABLED";
    FD1S3DX counter_753__i11 (.D(n107[11]), .CK(clk_c), .CD(rst), .Q(counter[11])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i11.GSR = "DISABLED";
    FD1S3DX counter_753__i12 (.D(n107[12]), .CK(clk_c), .CD(rst), .Q(counter[12])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i12.GSR = "DISABLED";
    FD1S3DX counter_753__i13 (.D(n107[13]), .CK(clk_c), .CD(rst), .Q(counter[13])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i13.GSR = "DISABLED";
    FD1S3DX counter_753__i14 (.D(n107[14]), .CK(clk_c), .CD(rst), .Q(counter[14])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i14.GSR = "DISABLED";
    FD1S3DX sec_clock_c (.D(n106), .CK(clk_c), .CD(rst), .Q(sec_clock)) /* synthesis syn_module_defined=1 */ ;
    defparam sec_clock_c.GSR = "DISABLED";
    FD1S3DX hours_reg_i0 (.D(hours[0]), .CK(n10723), .CD(rst), .Q(hours_reg[0])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_reg_i0.GSR = "DISABLED";
    FD1S3DX minutes_reg_i0 (.D(minutes[0]), .CK(n10723), .CD(rst), .Q(minutes_reg[0])) /* synthesis syn_module_defined=1 */ ;
    defparam minutes_reg_i0.GSR = "DISABLED";
    FD1S3DX seconds_reg_i0 (.D(seconds[0]), .CK(n10723), .CD(rst), .Q(seconds_reg[0])) /* synthesis syn_module_defined=1 */ ;
    defparam seconds_reg_i0.GSR = "DISABLED";
    FD1S3DX counter_753__i15 (.D(n107[15]), .CK(clk_c), .CD(rst), .Q(counter[15])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i15.GSR = "DISABLED";
    FD1S3DX counter_753__i16 (.D(n107[16]), .CK(clk_c), .CD(rst), .Q(counter[16])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i16.GSR = "DISABLED";
    LUT4 i4503_2_lut (.A(n81[14]), .B(n51), .Z(n107[14])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4503_2_lut.init = 16'h2222;
    FD1S3DX counter_753__i17 (.D(n107[17]), .CK(clk_c), .CD(rst), .Q(counter[17])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i17.GSR = "DISABLED";
    FD1S3DX counter_753__i18 (.D(n107[18]), .CK(clk_c), .CD(rst), .Q(counter[18])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i18.GSR = "DISABLED";
    FD1S3DX counter_753__i19 (.D(n107[19]), .CK(clk_c), .CD(rst), .Q(counter[19])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i19.GSR = "DISABLED";
    FD1S3DX counter_753__i20 (.D(n107[20]), .CK(clk_c), .CD(rst), .Q(counter[20])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i20.GSR = "DISABLED";
    FD1S3DX counter_753__i21 (.D(n107[21]), .CK(clk_c), .CD(rst), .Q(counter[21])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i21.GSR = "DISABLED";
    FD1S3DX counter_753__i22 (.D(n107[22]), .CK(clk_c), .CD(rst), .Q(counter[22])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i22.GSR = "DISABLED";
    FD1S3DX counter_753__i23 (.D(n107[23]), .CK(clk_c), .CD(rst), .Q(counter[23])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i23.GSR = "DISABLED";
    FD1S3DX counter_753__i24 (.D(n107[24]), .CK(clk_c), .CD(rst), .Q(counter[24])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753__i24.GSR = "DISABLED";
    LUT4 i4680_2_lut_4_lut (.A(minutes[7]), .B(minutes[6]), .C(n2433), 
         .D(n14[1]), .Z(n39[1])) /* synthesis lut_function=(!(A+(B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4680_2_lut_4_lut.init = 16'h0100;
    LUT4 i4656_2_lut_4_lut (.A(minutes[7]), .B(minutes[6]), .C(n2433), 
         .D(n14[0]), .Z(n39[0])) /* synthesis lut_function=(!(A+(B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4656_2_lut_4_lut.init = 16'h0100;
    CCU2D counter_753_add_4_5 (.A0(n159[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8088), .COUT(n8089), .S0(n81[3]), .S1(n81[4])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_753_add_4_5.INIT0 = 16'hfaaa;
    defparam counter_753_add_4_5.INIT1 = 16'hfaaa;
    defparam counter_753_add_4_5.INJECT1_0 = "NO";
    defparam counter_753_add_4_5.INJECT1_1 = "NO";
    FD1P3DX hours_756__i1 (.D(n30[1]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(hours[1])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_756__i1.GSR = "DISABLED";
    FD1P3DX hours_756__i2 (.D(n30[2]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(hours[2])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_756__i2.GSR = "DISABLED";
    FD1P3DX hours_756__i3 (.D(n30[3]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(hours[3])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_756__i3.GSR = "DISABLED";
    FD1P3DX hours_756__i4 (.D(n30[4]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(hours[4])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_756__i4.GSR = "DISABLED";
    FD1P3DX hours_756__i5 (.D(n30[5]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(hours[5])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_756__i5.GSR = "DISABLED";
    FD1P3DX hours_756__i6 (.D(n30[6]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(hours[6])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_756__i6.GSR = "DISABLED";
    FD1P3DX hours_756__i7 (.D(n30[7]), .SP(n3378), .CK(sec_clock), .CD(rst), 
            .Q(hours[7])) /* synthesis syn_module_defined=1 */ ;
    defparam hours_756__i7.GSR = "DISABLED";
    VLO i1 (.Z(GND_net));
    
endmodule

//
// Verilog Description of module reset_gen
//

module reset_gen (clk_c, rst, n10684, wb_rst, n3660) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    input rst;
    output n10684;
    output wb_rst;
    output n3660;
    
    wire [3:0]reset_counter;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/reset_gen.v(59[22:35])
    wire [3:0]n18;
    
    wire n21;
    
    FD1P3DX reset_counter_750__i3 (.D(n18[3]), .SP(n10684), .CK(clk_c), 
            .CD(rst), .Q(reset_counter[3])) /* synthesis syn_module_defined=1 */ ;
    defparam reset_counter_750__i3.GSR = "DISABLED";
    INV i2651 (.A(wb_rst), .Z(n3660)) /* synthesis syn_module_defined=1 */ ;
    INV i6991 (.A(reset_counter[0]), .Z(n18[0])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i8579_2_lut_3_lut_4_lut (.A(reset_counter[1]), .B(reset_counter[0]), 
         .C(reset_counter[3]), .D(reset_counter[2]), .Z(n10684)) /* synthesis lut_function=(!(A (B (C (D))))), syn_module_defined=1 */ ;
    defparam i8579_2_lut_3_lut_4_lut.init = 16'h7fff;
    LUT4 i7000_2_lut_3_lut (.A(reset_counter[1]), .B(reset_counter[0]), 
         .C(reset_counter[2]), .Z(n18[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))), syn_module_defined=1 */ ;
    defparam i7000_2_lut_3_lut.init = 16'h7878;
    LUT4 i7007_2_lut_3_lut_4_lut (.A(reset_counter[1]), .B(reset_counter[0]), 
         .C(reset_counter[3]), .D(reset_counter[2]), .Z(n18[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))), syn_module_defined=1 */ ;
    defparam i7007_2_lut_3_lut_4_lut.init = 16'h78f0;
    INV i1030 (.A(reset_counter[3]), .Z(n21)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i6993_2_lut (.A(reset_counter[1]), .B(reset_counter[0]), .Z(n18[1])) /* synthesis lut_function=(!(A (B)+!A !(B))), syn_module_defined=1 */ ;
    defparam i6993_2_lut.init = 16'h6666;
    FD1P3DX reset_counter_750__i0 (.D(n18[0]), .SP(n10684), .CK(clk_c), 
            .CD(rst), .Q(reset_counter[0])) /* synthesis syn_module_defined=1 */ ;
    defparam reset_counter_750__i0.GSR = "DISABLED";
    FD1P3DX reset_counter_750__i1 (.D(n18[1]), .SP(n10684), .CK(clk_c), 
            .CD(rst), .Q(reset_counter[1])) /* synthesis syn_module_defined=1 */ ;
    defparam reset_counter_750__i1.GSR = "DISABLED";
    FD1S3BX rst1_out (.D(n21), .CK(clk_c), .PD(rst), .Q(wb_rst)) /* synthesis syn_module_defined=1 */ ;
    defparam rst1_out.GSR = "DISABLED";
    FD1P3DX reset_counter_750__i2 (.D(n18[2]), .SP(n10684), .CK(clk_c), 
            .CD(rst), .Q(reset_counter[2])) /* synthesis syn_module_defined=1 */ ;
    defparam reset_counter_750__i2.GSR = "DISABLED";
    
endmodule

//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//


//
// Verilog Description of module led_sw_wb
//

module led_sw_wb (clk_c, n10664, led, \wb_data_from_master[2] , \wb_data_from_master[1] , 
            \wb_data_from_master[0] , \wb_data_from_master[3] ) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    input n10664;
    output [3:0]led;
    input \wb_data_from_master[2] ;
    input \wb_data_from_master[1] ;
    input \wb_data_from_master[0] ;
    input \wb_data_from_master[3] ;
    
    
    wire GND_net;
    
    OFS1P3DX led___i3 (.D(\wb_data_from_master[2] ), .SP(n10664), .SCLK(clk_c), 
            .CD(GND_net), .Q(led[2])) /* synthesis syn_module_defined=1 */ ;
    defparam led___i3.GSR = "ENABLED";
    OFS1P3DX led___i2 (.D(\wb_data_from_master[1] ), .SP(n10664), .SCLK(clk_c), 
            .CD(GND_net), .Q(led[1])) /* synthesis syn_module_defined=1 */ ;
    defparam led___i2.GSR = "ENABLED";
    OFS1P3DX led___i1 (.D(\wb_data_from_master[0] ), .SP(n10664), .SCLK(clk_c), 
            .CD(GND_net), .Q(led[0])) /* synthesis syn_module_defined=1 */ ;
    defparam led___i1.GSR = "ENABLED";
    OFS1P3DX led___i4 (.D(\wb_data_from_master[3] ), .SP(n10664), .SCLK(clk_c), 
            .CD(GND_net), .Q(led[3])) /* synthesis syn_module_defined=1 */ ;
    defparam led___i4.GSR = "ENABLED";
    VLO i1 (.Z(GND_net));
    
endmodule

//
// Verilog Description of module \spi(SHIFT_DIRECTION=0,CLOCK_PHASE=0,CLOCK_POLARITY=0,CLOCK_SEL=1,MASTER=1,SLAVE_NUMBER=1,DATA_LENGTH=8,DELAY_TIME=2,CLKCNT_WIDTH=5,INTERVAL_LENGTH=2) 
//

module \spi(SHIFT_DIRECTION=0,CLOCK_PHASE=0,CLOCK_POLARITY=0,CLOCK_SEL=1,MASTER=1,SLAVE_NUMBER=1,DATA_LENGTH=8,DELAY_TIME=2,CLKCNT_WIDTH=5,INTERVAL_LENGTH=2)  (clk_c, 
            n9266, wb_data_from_master, n270, n269, n10666, \wb_ack[10] , 
            spi_sclk_c, spi_miso_c, n10723, SS_N_MASTER, n10667, spi_mosi_c, 
            n266, n267, n268, reg_rd, n271, n9343, n10625, n10626, 
            n2642, read_wait_done, n10659, n9218, n8260, n9267, 
            n9133) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    input n9266;
    input [7:0]wb_data_from_master;
    output n270;
    output n269;
    output n10666;
    input \wb_ack[10] ;
    output spi_sclk_c;
    input spi_miso_c;
    input n10723;
    output [0:0]SS_N_MASTER;
    output n10667;
    output spi_mosi_c;
    output n266;
    output n267;
    output n268;
    output reg_rd;
    output n271;
    input n9343;
    input n10625;
    input n10626;
    input n2642;
    output read_wait_done;
    input n10659;
    input n9218;
    input n8260;
    input n9267;
    input n9133;
    
    wire dw04_cs;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(136[28:35])
    wire [7:0]latch_s_data;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(143[28:40])
    wire pending_data;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(264[28:40])
    wire [2:0]c_status;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(265[28:36])
    wire [5:0]data_cnt;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(263[28:36])
    wire [4:0]clock_cnt;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(262[28:37])
    wire dw00_cs;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(135[28:35])
    wire [7:0]reg_rxdata;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(144[28:38])
    wire dw08_cs;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(137[28:35])
    wire [7:0]reg_txdata;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(145[28:38])
    wire dw0c_cs;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(138[28:35])
    wire [7:0]reg_control;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(150[28:39])
    wire [7:0]reg_status;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(158[28:38])
    wire reg_wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(140[28:34])
    wire [2:0]n_status;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(266[28:36])
    wire [0:0]reg_ssmask;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(261[28:38])
    wire [7:0]tx_shift_data;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(147[28:41])
    wire [7:0]rx_shift_data;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(146[28:41])
    wire rx_latch_flag;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(148[28:41])
    wire wait_one_tick_done;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(412[8:26])
    wire dw10_cs;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/spi_wb.v(139[28:35])
    
    wire n9347, n9320, n10262, n10180, n804, n9168, n10241;
    wire [4:0]n21;
    
    wire n10272;
    wire [31:0]n206;
    
    wire n4_adj_0, n2838, n10257, n10230, n9985, n9984, n9100, 
        n10246, n10220, n3464, n10247, n10265, n69, n299;
    wire [31:0]n173;
    
    wire n9500, n10137, n10135, n10136, n9313, n10146, n10148, 
        n10147, n9140, n10234;
    wire [5:0]n24;
    
    wire n5630, GND_net, n8145, n10229, n8146, n3632, n39, n3395, 
        n8147, n10176, n1587, n3641, n3640, n808, n3638, n3637, 
        n3636, n3635;
    wire [2:0]n402;
    
    wire n3, n3_adj_0, n3634, n3633, n3627, n3626, n3472, n49, 
        n3625, n3624, n3623, n1585, n6_adj_0, n10248, n9067, VCC_net, 
        n3593, n10252, n3592, n9177, n10253, n3652, n2836, n290, 
        n9283;
    wire [31:0]n140;
    
    wire n6, n9126;
    
    FD1S3AX dw04_cs_c (.D(n9266), .CK(clk_c), .Q(dw04_cs)) /* synthesis syn_module_defined=1 */ ;
    defparam dw04_cs_c.GSR = "ENABLED";
    FD1S3AX latch_s_data_i0 (.D(wb_data_from_master[0]), .CK(clk_c), .Q(latch_s_data[0])) /* synthesis syn_module_defined=1 */ ;
    defparam latch_s_data_i0.GSR = "ENABLED";
    LUT4 i8573_2_lut_3_lut_4_lut (.A(c_status[0]), .B(c_status[2]), .C(pending_data), 
         .D(c_status[1]), .Z(n9347)) /* synthesis lut_function=(!(A+(B+(C+(D))))), syn_module_defined=1 */ ;
    defparam i8573_2_lut_3_lut_4_lut.init = 16'h0001;
    LUT4 i1_2_lut_3_lut_adj_0 (.A(c_status[1]), .B(c_status[0]), .C(c_status[2]), 
         .Z(n9320)) /* synthesis lut_function=(A+((C)+!B)), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut_adj_0.init = 16'hfbfb;
    LUT4 i3_4_lut_adj_0 (.A(n10262), .B(data_cnt[5]), .C(n9168), .D(n10180), 
         .Z(n804)) /* synthesis lut_function=(!(A+(B+!(C+(D))))), syn_module_defined=1 */ ;
    defparam i3_4_lut_adj_0.init = 16'h1110;
    LUT4 i1_4_lut (.A(data_cnt[1]), .B(data_cnt[2]), .C(data_cnt[0]), 
         .D(n10241), .Z(n9168)) /* synthesis lut_function=(!((B+(C+(D)))+!A)), syn_module_defined=1 */ ;
    defparam i1_4_lut.init = 16'h0002;
    LUT4 i7076_2_lut (.A(clock_cnt[1]), .B(clock_cnt[0]), .Z(n21[1])) /* synthesis lut_function=(!(A (B)+!A !(B))), syn_module_defined=1 */ ;
    defparam i7076_2_lut.init = 16'h6666;
    LUT4 i7083_3_lut (.A(clock_cnt[2]), .B(clock_cnt[1]), .C(clock_cnt[0]), 
         .Z(n21[2])) /* synthesis lut_function=(!(A (B (C))+!A !(B (C)))), syn_module_defined=1 */ ;
    defparam i7083_3_lut.init = 16'h6a6a;
    LUT4 i7097_3_lut (.A(clock_cnt[4]), .B(clock_cnt[3]), .C(n10272), 
         .Z(n21[4])) /* synthesis lut_function=(!(A (B (C))+!A !(B (C)))), syn_module_defined=1 */ ;
    defparam i7097_3_lut.init = 16'h6a6a;
    LUT4 mux_255_i2_3_lut (.A(n206[1]), .B(reg_rxdata[1]), .C(dw00_cs), 
         .Z(n270)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_255_i2_3_lut.init = 16'hcaca;
    LUT4 mux_260_i2_4_lut (.A(dw08_cs), .B(reg_txdata[1]), .C(dw04_cs), 
         .D(n4_adj_0), .Z(n206[1])) /* synthesis lut_function=(A (B (C))+!A (B (C+(D))+!B !(C+!(D)))), syn_module_defined=1 */ ;
    defparam mux_260_i2_4_lut.init = 16'hc5c0;
    LUT4 i1_2_lut_adj_0 (.A(reg_control[1]), .B(dw0c_cs), .Z(n4_adj_0)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i1_2_lut_adj_0.init = 16'h8888;
    LUT4 i2_3_lut_rep_190_4_lut (.A(c_status[1]), .B(c_status[0]), .C(c_status[2]), 
         .D(n2838), .Z(n10241)) /* synthesis lut_function=(A+(((D)+!C)+!B)), syn_module_defined=1 */ ;
    defparam i2_3_lut_rep_190_4_lut.init = 16'hffbf;
    LUT4 mux_255_i3_3_lut (.A(n206[2]), .B(reg_rxdata[2]), .C(dw00_cs), 
         .Z(n269)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_255_i3_3_lut.init = 16'hcaca;
    LUT4 mux_260_i3_4_lut (.A(reg_status[2]), .B(reg_txdata[2]), .C(dw04_cs), 
         .D(dw08_cs), .Z(n206[2])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_260_i3_4_lut.init = 16'hcac0;
    LUT4 mux_255_i7_3_lut (.A(n206[6]), .B(reg_rxdata[6]), .C(dw00_cs), 
         .Z(n10666)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_255_i7_3_lut.init = 16'hcaca;
    LUT4 mux_260_i7_4_lut (.A(dw08_cs), .B(reg_txdata[6]), .C(dw04_cs), 
         .D(reg_status[6]), .Z(n206[6])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_260_i7_4_lut.init = 16'hcac0;
    LUT4 i4681_2_lut_rep_206 (.A(clock_cnt[3]), .B(clock_cnt[4]), .Z(n10257)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i4681_2_lut_rep_206.init = 16'heeee;
    LUT4 i8307_2_lut_rep_179_3_lut_4_lut (.A(clock_cnt[3]), .B(clock_cnt[4]), 
         .C(n10262), .D(data_cnt[5]), .Z(n10230)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i8307_2_lut_rep_179_3_lut_4_lut.init = 16'hfffe;
    LUT4 reg_status_3__bdd_3_lut_4_lut (.A(\wb_ack[10] ), .B(reg_wr), .C(n9984), 
         .D(reg_status[3]), .Z(n9985)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam reg_status_3__bdd_3_lut_4_lut.init = 16'hf780;
    LUT4 i5 (.A(\wb_ack[10] ), .B(reg_wr), .C(dw04_cs), .Z(n9100)) /* synthesis lut_function=(A (B (C))), syn_module_defined=1 */ ;
    defparam i5.init = 16'h8080;
    LUT4 i1_2_lut_rep_211 (.A(data_cnt[3]), .B(data_cnt[4]), .Z(n10262)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_211.init = 16'heeee;
    LUT4 i2_2_lut_rep_195_3_lut (.A(data_cnt[3]), .B(data_cnt[4]), .C(data_cnt[5]), 
         .Z(n10246)) /* synthesis lut_function=(A+(B+(C))), syn_module_defined=1 */ ;
    defparam i2_2_lut_rep_195_3_lut.init = 16'hfefe;
    LUT4 i8591_2_lut_rep_169_2_lut_3_lut_4_lut (.A(c_status[1]), .B(c_status[0]), 
         .C(n2838), .D(c_status[2]), .Z(n10220)) /* synthesis lut_function=(!(A+(B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i8591_2_lut_rep_169_2_lut_3_lut_4_lut.init = 16'h0100;
    LUT4 i1_2_lut_3_lut_4_lut (.A(c_status[1]), .B(c_status[0]), .C(n2838), 
         .D(c_status[2]), .Z(n3464)) /* synthesis lut_function=(A+(B+!(C (D)))), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'hefff;
    LUT4 i2_2_lut_rep_196_3_lut (.A(c_status[1]), .B(c_status[0]), .C(c_status[2]), 
         .Z(n10247)) /* synthesis lut_function=(A+(B+!(C))), syn_module_defined=1 */ ;
    defparam i2_2_lut_rep_196_3_lut.init = 16'hefef;
    LUT4 i8567_3_lut_rep_214 (.A(n_status[0]), .B(n_status[2]), .C(n_status[1]), 
         .Z(n10265)) /* synthesis lut_function=((B+!(C))+!A), syn_module_defined=1 */ ;
    defparam i8567_3_lut_rep_214.init = 16'hdfdf;
    LUT4 i29_2_lut (.A(reg_wr), .B(dw0c_cs), .Z(n69)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i29_2_lut.init = 16'h8888;
    LUT4 i2_3_lut_rep_221 (.A(clock_cnt[1]), .B(clock_cnt[0]), .C(clock_cnt[2]), 
         .Z(n10272)) /* synthesis lut_function=(A (B (C))), syn_module_defined=1 */ ;
    defparam i2_3_lut_rep_221.init = 16'h8080;
    LUT4 i7090_2_lut_4_lut (.A(clock_cnt[1]), .B(clock_cnt[0]), .C(clock_cnt[2]), 
         .D(clock_cnt[3]), .Z(n21[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))), syn_module_defined=1 */ ;
    defparam i7090_2_lut_4_lut.init = 16'h7f80;
    INV i83 (.A(reg_ssmask[0]), .Z(n299)) /* synthesis syn_module_defined=1 */ ;
    INV i7074 (.A(clock_cnt[0]), .Z(n21[0])) /* synthesis syn_module_defined=1 */ ;
    LUT4 mux_261_i4_4_lut (.A(reg_control[3]), .B(reg_status[3]), .C(dw08_cs), 
         .D(dw0c_cs), .Z(n173[3])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_261_i4_4_lut.init = 16'hcac0;
    LUT4 mux_260_i4_3_lut (.A(reg_txdata[3]), .B(reg_rxdata[3]), .C(dw00_cs), 
         .Z(n206[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_260_i4_3_lut.init = 16'hcaca;
    LUT4 i8597_2_lut (.A(dw00_cs), .B(dw04_cs), .Z(n9500)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i8597_2_lut.init = 16'heeee;
    LUT4 mux_261_i5_4_lut (.A(reg_control[4]), .B(reg_status[4]), .C(dw08_cs), 
         .D(dw0c_cs), .Z(n173[4])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_261_i5_4_lut.init = 16'hcac0;
    LUT4 mux_260_i5_3_lut (.A(reg_txdata[4]), .B(reg_rxdata[4]), .C(dw00_cs), 
         .Z(n206[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_260_i5_3_lut.init = 16'hcaca;
    PFUMX i8789 (.BLUT(n10136), .ALUT(n10135), .C0(c_status[2]), .Z(n10137)) /* synthesis syn_module_defined=1 */ ;
    LUT4 n9384_bdd_4_lut (.A(n10230), .B(c_status[0]), .C(c_status[1]), 
         .D(n9313), .Z(n10136)) /* synthesis lut_function=(A (B+(C))+!A !(B (C (D))+!B !(C))), syn_module_defined=1 */ ;
    defparam n9384_bdd_4_lut.init = 16'hbcfc;
    LUT4 i8788 (.A(n2838), .B(c_status[0]), .C(c_status[1]), .D(n_status[1]), 
         .Z(n10135)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)), syn_module_defined=1 */ ;
    defparam i8788.init = 16'h0200;
    PFUMX i8794 (.BLUT(n10147), .ALUT(n10146), .C0(c_status[0]), .Z(n10148)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i1_2_lut_3_lut (.A(c_status[0]), .B(n9313), .C(c_status[1]), 
         .Z(n9140)) /* synthesis lut_function=(A (B (C))), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut.init = 16'h8080;
    LUT4 n9384_bdd_3_lut (.A(n10234), .B(data_cnt[0]), .C(data_cnt[1]), 
         .Z(n10147)) /* synthesis lut_function=(!(A+((C)+!B))), syn_module_defined=1 */ ;
    defparam n9384_bdd_3_lut.init = 16'h0404;
    CCU2D data_cnt_752_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(data_cnt[0]), .B1(n5630), .C1(n10229), .D1(spi_sclk_c), 
          .COUT(n8145), .S1(n24[0])) /* synthesis syn_module_defined=1 */ ;
    defparam data_cnt_752_add_4_1.INIT0 = 16'hF000;
    defparam data_cnt_752_add_4_1.INIT1 = 16'h5999;
    defparam data_cnt_752_add_4_1.INJECT1_0 = "NO";
    defparam data_cnt_752_add_4_1.INJECT1_1 = "NO";
    CCU2D data_cnt_752_add_4_3 (.A0(data_cnt[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(data_cnt[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8145), .COUT(n8146), .S0(n24[1]), .S1(n24[2])) /* synthesis syn_module_defined=1 */ ;
    defparam data_cnt_752_add_4_3.INIT0 = 16'hfaaa;
    defparam data_cnt_752_add_4_3.INIT1 = 16'hfaaa;
    defparam data_cnt_752_add_4_3.INJECT1_0 = "NO";
    defparam data_cnt_752_add_4_3.INJECT1_1 = "NO";
    LUT4 i1_3_lut_4_lut_4_lut (.A(n10247), .B(n39), .C(reg_status[6]), 
         .D(n2838), .Z(n3632)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (D)+!B !(C+!(D))))), syn_module_defined=1 */ ;
    defparam i1_3_lut_4_lut_4_lut.init = 16'h3075;
    LUT4 i4837_3_lut_4_lut_4_lut (.A(n10247), .B(reg_status[6]), .C(n39), 
         .D(n2838), .Z(n3395)) /* synthesis lut_function=(A (C)+!A (B (C+!(D))+!B (C (D)))), syn_module_defined=1 */ ;
    defparam i4837_3_lut_4_lut_4_lut.init = 16'hf0e4;
    CCU2D data_cnt_752_add_4_5 (.A0(data_cnt[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(data_cnt[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8146), .COUT(n8147), .S0(n24[3]), .S1(n24[4])) /* synthesis syn_module_defined=1 */ ;
    defparam data_cnt_752_add_4_5.INIT0 = 16'hfaaa;
    defparam data_cnt_752_add_4_5.INIT1 = 16'hfaaa;
    defparam data_cnt_752_add_4_5.INJECT1_0 = "NO";
    defparam data_cnt_752_add_4_5.INJECT1_1 = "NO";
    CCU2D data_cnt_752_add_4_7 (.A0(data_cnt[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8147), .S0(n24[5])) /* synthesis syn_module_defined=1 */ ;
    defparam data_cnt_752_add_4_7.INIT0 = 16'hfaaa;
    defparam data_cnt_752_add_4_7.INIT1 = 16'h0000;
    defparam data_cnt_752_add_4_7.INJECT1_0 = "NO";
    defparam data_cnt_752_add_4_7.INJECT1_1 = "NO";
    LUT4 i4624_2_lut_4_lut_4_lut (.A(c_status[1]), .B(c_status[0]), .C(n2838), 
         .D(c_status[2]), .Z(n5630)) /* synthesis lut_function=(A (B+(C+(D)))+!A ((C+!(D))+!B)), syn_module_defined=1 */ ;
    defparam i4624_2_lut_4_lut_4_lut.init = 16'hfbfd;
    LUT4 mux_261_i6_4_lut (.A(reg_control[5]), .B(reg_status[5]), .C(dw08_cs), 
         .D(dw0c_cs), .Z(n173[5])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_261_i6_4_lut.init = 16'hcac0;
    LUT4 mux_260_i6_3_lut (.A(reg_txdata[5]), .B(reg_rxdata[5]), .C(dw00_cs), 
         .Z(n206[5])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_260_i6_3_lut.init = 16'hcaca;
    LUT4 i8850 (.A(data_cnt[2]), .B(data_cnt[1]), .C(c_status[0]), .D(spi_sclk_c), 
         .Z(n10176)) /* synthesis lut_function=(A (B (C (D)))+!A !(B+(C))), syn_module_defined=1 */ ;
    defparam i8850.init = 16'h8101;
    LUT4 i2634_3_lut (.A(n3640), .B(reg_txdata[6]), .C(n1587), .Z(n3641)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2634_3_lut.init = 16'hcaca;
    LUT4 i2633_3_lut (.A(tx_shift_data[7]), .B(tx_shift_data[6]), .C(n808), 
         .Z(n3640)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2633_3_lut.init = 16'hcaca;
    LUT4 i2_4_lut (.A(n10265), .B(c_status[0]), .C(c_status[2]), .D(c_status[1]), 
         .Z(n1587)) /* synthesis lut_function=(!(A+(B (C+(D))+!B (C+!(D))))), syn_module_defined=1 */ ;
    defparam i2_4_lut.init = 16'h0104;
    LUT4 i2631_3_lut (.A(n3637), .B(reg_txdata[5]), .C(n1587), .Z(n3638)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2631_3_lut.init = 16'hcaca;
    LUT4 i2630_3_lut (.A(tx_shift_data[6]), .B(tx_shift_data[5]), .C(n808), 
         .Z(n3637)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2630_3_lut.init = 16'hcaca;
    LUT4 i2629_3_lut (.A(n3635), .B(reg_txdata[4]), .C(n1587), .Z(n3636)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2629_3_lut.init = 16'hcaca;
    LUT4 mux_130_Mux_0_i7_3_lut (.A(n3_adj_0), .B(n3), .C(c_status[2]), 
         .Z(n402[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_130_Mux_0_i7_3_lut.init = 16'hcaca;
    LUT4 i2628_3_lut (.A(tx_shift_data[5]), .B(tx_shift_data[4]), .C(n808), 
         .Z(n3635)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2628_3_lut.init = 16'hcaca;
    LUT4 i2627_3_lut (.A(n3633), .B(reg_txdata[3]), .C(n1587), .Z(n3634)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2627_3_lut.init = 16'hcaca;
    LUT4 i2626_3_lut (.A(tx_shift_data[4]), .B(tx_shift_data[3]), .C(n808), 
         .Z(n3633)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2626_3_lut.init = 16'hcaca;
    FD1S3IX data_cnt_752__i5 (.D(n24[5]), .CK(clk_c), .CD(n804), .Q(data_cnt[5])) /* synthesis syn_module_defined=1 */ ;
    defparam data_cnt_752__i5.GSR = "ENABLED";
    FD1S3IX data_cnt_752__i4 (.D(n24[4]), .CK(clk_c), .CD(n804), .Q(data_cnt[4])) /* synthesis syn_module_defined=1 */ ;
    defparam data_cnt_752__i4.GSR = "ENABLED";
    FD1S3IX data_cnt_752__i3 (.D(n24[3]), .CK(clk_c), .CD(n804), .Q(data_cnt[3])) /* synthesis syn_module_defined=1 */ ;
    defparam data_cnt_752__i3.GSR = "ENABLED";
    FD1S3IX data_cnt_752__i2 (.D(n24[2]), .CK(clk_c), .CD(n804), .Q(data_cnt[2])) /* synthesis syn_module_defined=1 */ ;
    defparam data_cnt_752__i2.GSR = "ENABLED";
    FD1S3IX data_cnt_752__i1 (.D(n24[1]), .CK(clk_c), .CD(n804), .Q(data_cnt[1])) /* synthesis syn_module_defined=1 */ ;
    defparam data_cnt_752__i1.GSR = "ENABLED";
    LUT4 i2620_3_lut (.A(n3626), .B(reg_txdata[2]), .C(n1587), .Z(n3627)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2620_3_lut.init = 16'hcaca;
    LUT4 i2619_3_lut (.A(tx_shift_data[3]), .B(tx_shift_data[2]), .C(n808), 
         .Z(n3626)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2619_3_lut.init = 16'hcaca;
    LUT4 mux_130_Mux_0_i3_4_lut (.A(pending_data), .B(n10148), .C(c_status[1]), 
         .D(c_status[0]), .Z(n3_adj_0)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_130_Mux_0_i3_4_lut.init = 16'hc0ca;
    FD1P3AX rx_shift_data_i0_i0_i7 (.D(rx_shift_data[6]), .SP(n3472), .CK(clk_c), 
            .Q(rx_shift_data[7])) /* synthesis syn_module_defined=1 */ ;
    defparam rx_shift_data_i0_i0_i7.GSR = "ENABLED";
    FD1P3AX rx_shift_data_i0_i0_i6 (.D(rx_shift_data[5]), .SP(n3472), .CK(clk_c), 
            .Q(rx_shift_data[6])) /* synthesis syn_module_defined=1 */ ;
    defparam rx_shift_data_i0_i0_i6.GSR = "ENABLED";
    FD1P3AX rx_shift_data_i0_i0_i5 (.D(rx_shift_data[4]), .SP(n3472), .CK(clk_c), 
            .Q(rx_shift_data[5])) /* synthesis syn_module_defined=1 */ ;
    defparam rx_shift_data_i0_i0_i5.GSR = "ENABLED";
    FD1P3AX rx_shift_data_i0_i0_i4 (.D(rx_shift_data[3]), .SP(n3472), .CK(clk_c), 
            .Q(rx_shift_data[4])) /* synthesis syn_module_defined=1 */ ;
    defparam rx_shift_data_i0_i0_i4.GSR = "ENABLED";
    FD1P3AX rx_shift_data_i0_i0_i3 (.D(rx_shift_data[2]), .SP(n3472), .CK(clk_c), 
            .Q(rx_shift_data[3])) /* synthesis syn_module_defined=1 */ ;
    defparam rx_shift_data_i0_i0_i3.GSR = "ENABLED";
    FD1P3AX rx_shift_data_i0_i0_i2 (.D(rx_shift_data[1]), .SP(n3472), .CK(clk_c), 
            .Q(rx_shift_data[2])) /* synthesis syn_module_defined=1 */ ;
    defparam rx_shift_data_i0_i0_i2.GSR = "ENABLED";
    FD1P3AX rx_shift_data_i0_i0_i1 (.D(rx_shift_data[0]), .SP(n3472), .CK(clk_c), 
            .Q(rx_shift_data[1])) /* synthesis syn_module_defined=1 */ ;
    defparam rx_shift_data_i0_i0_i1.GSR = "ENABLED";
    FD1P3AX reg_txdata_i0_i0_i7 (.D(latch_s_data[7]), .SP(n49), .CK(clk_c), 
            .Q(reg_txdata[7])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_txdata_i0_i0_i7.GSR = "ENABLED";
    FD1P3AX reg_txdata_i0_i0_i6 (.D(latch_s_data[6]), .SP(n49), .CK(clk_c), 
            .Q(reg_txdata[6])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_txdata_i0_i0_i6.GSR = "ENABLED";
    FD1P3AX reg_txdata_i0_i0_i5 (.D(latch_s_data[5]), .SP(n49), .CK(clk_c), 
            .Q(reg_txdata[5])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_txdata_i0_i0_i5.GSR = "ENABLED";
    FD1P3AX reg_txdata_i0_i0_i4 (.D(latch_s_data[4]), .SP(n49), .CK(clk_c), 
            .Q(reg_txdata[4])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_txdata_i0_i0_i4.GSR = "ENABLED";
    FD1P3AX reg_txdata_i0_i0_i3 (.D(latch_s_data[3]), .SP(n49), .CK(clk_c), 
            .Q(reg_txdata[3])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_txdata_i0_i0_i3.GSR = "ENABLED";
    FD1P3AX reg_txdata_i0_i0_i2 (.D(latch_s_data[2]), .SP(n49), .CK(clk_c), 
            .Q(reg_txdata[2])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_txdata_i0_i0_i2.GSR = "ENABLED";
    FD1P3AX reg_txdata_i0_i0_i1 (.D(latch_s_data[1]), .SP(n49), .CK(clk_c), 
            .Q(reg_txdata[1])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_txdata_i0_i0_i1.GSR = "ENABLED";
    LUT4 i2618_3_lut (.A(n3624), .B(reg_txdata[1]), .C(n1587), .Z(n3625)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2618_3_lut.init = 16'hcaca;
    LUT4 i2617_3_lut (.A(tx_shift_data[2]), .B(tx_shift_data[1]), .C(n808), 
         .Z(n3624)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2617_3_lut.init = 16'hcaca;
    LUT4 i2616_4_lut (.A(tx_shift_data[1]), .B(reg_txdata[0]), .C(n1587), 
         .D(n808), .Z(n3623)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2616_4_lut.init = 16'hc0ca;
    FD1S3IX clock_cnt_751__i4 (.D(n21[4]), .CK(clk_c), .CD(n1585), .Q(clock_cnt[4])) /* synthesis syn_module_defined=1 */ ;
    defparam clock_cnt_751__i4.GSR = "ENABLED";
    FD1S3IX clock_cnt_751__i3 (.D(n21[3]), .CK(clk_c), .CD(n1585), .Q(clock_cnt[3])) /* synthesis syn_module_defined=1 */ ;
    defparam clock_cnt_751__i3.GSR = "ENABLED";
    FD1S3IX clock_cnt_751__i2 (.D(n21[2]), .CK(clk_c), .CD(n1585), .Q(clock_cnt[2])) /* synthesis syn_module_defined=1 */ ;
    defparam clock_cnt_751__i2.GSR = "ENABLED";
    FD1S3IX clock_cnt_751__i1 (.D(n21[1]), .CK(clk_c), .CD(n1585), .Q(clock_cnt[1])) /* synthesis syn_module_defined=1 */ ;
    defparam clock_cnt_751__i1.GSR = "ENABLED";
    FD1P3AX reg_rxdata_i0_i0_i7 (.D(rx_shift_data[7]), .SP(rx_latch_flag), 
            .CK(clk_c), .Q(reg_rxdata[7])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_rxdata_i0_i0_i7.GSR = "ENABLED";
    FD1P3AX reg_rxdata_i0_i0_i6 (.D(rx_shift_data[6]), .SP(rx_latch_flag), 
            .CK(clk_c), .Q(reg_rxdata[6])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_rxdata_i0_i0_i6.GSR = "ENABLED";
    FD1P3AX reg_rxdata_i0_i0_i5 (.D(rx_shift_data[5]), .SP(rx_latch_flag), 
            .CK(clk_c), .Q(reg_rxdata[5])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_rxdata_i0_i0_i5.GSR = "ENABLED";
    FD1P3AX reg_rxdata_i0_i0_i4 (.D(rx_shift_data[4]), .SP(rx_latch_flag), 
            .CK(clk_c), .Q(reg_rxdata[4])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_rxdata_i0_i0_i4.GSR = "ENABLED";
    FD1P3AX reg_rxdata_i0_i0_i3 (.D(rx_shift_data[3]), .SP(rx_latch_flag), 
            .CK(clk_c), .Q(reg_rxdata[3])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_rxdata_i0_i0_i3.GSR = "ENABLED";
    FD1P3AX reg_rxdata_i0_i0_i2 (.D(rx_shift_data[2]), .SP(rx_latch_flag), 
            .CK(clk_c), .Q(reg_rxdata[2])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_rxdata_i0_i0_i2.GSR = "ENABLED";
    FD1P3AX reg_rxdata_i0_i0_i1 (.D(rx_shift_data[1]), .SP(rx_latch_flag), 
            .CK(clk_c), .Q(reg_rxdata[1])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_rxdata_i0_i0_i1.GSR = "ENABLED";
    LUT4 i4577_4_lut (.A(c_status[0]), .B(c_status[1]), .C(n6_adj_0), 
         .D(data_cnt[0]), .Z(n3)) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A (B))), syn_module_defined=1 */ ;
    defparam i4577_4_lut.init = 16'h3331;
    FD1P3AX i1091 (.D(latch_s_data[7]), .SP(n69), .CK(clk_c), .Q(reg_control[7])) /* synthesis syn_module_defined=1 */ ;
    defparam i1091.GSR = "ENABLED";
    LUT4 i2_2_lut_4_lut (.A(n10246), .B(n2838), .C(data_cnt[2]), .D(data_cnt[1]), 
         .Z(n6_adj_0)) /* synthesis lut_function=(A+(B+(C+!(D)))), syn_module_defined=1 */ ;
    defparam i2_2_lut_4_lut.init = 16'hfeff;
    FD1S3IX data_cnt_752__i0 (.D(n24[0]), .CK(clk_c), .CD(n804), .Q(data_cnt[0])) /* synthesis syn_module_defined=1 */ ;
    defparam data_cnt_752__i0.GSR = "ENABLED";
    LUT4 lock_pll_c_bdd_2_lut_3_lut_4_lut (.A(n10248), .B(c_status[1]), 
         .C(data_cnt[0]), .D(n2838), .Z(n10180)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)), syn_module_defined=1 */ ;
    defparam lock_pll_c_bdd_2_lut_3_lut_4_lut.init = 16'h0080;
    FD1P3AX rx_shift_data_i0_i0_i0 (.D(spi_miso_c), .SP(n3472), .CK(clk_c), 
            .Q(rx_shift_data[0])) /* synthesis syn_module_defined=1 */ ;
    defparam rx_shift_data_i0_i0_i0.GSR = "ENABLED";
    FD1P3AX reg_txdata_i0_i0_i0 (.D(latch_s_data[0]), .SP(n49), .CK(clk_c), 
            .Q(reg_txdata[0])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_txdata_i0_i0_i0.GSR = "ENABLED";
    FD1S3AX c_status_i1 (.D(n_status[1]), .CK(clk_c), .Q(c_status[1])) /* synthesis syn_module_defined=1 */ ;
    defparam c_status_i1.GSR = "ENABLED";
    FD1S3AX c_status_i2 (.D(n_status[2]), .CK(clk_c), .Q(c_status[2])) /* synthesis syn_module_defined=1 */ ;
    defparam c_status_i2.GSR = "ENABLED";
    FD1S3AX n_status_i1 (.D(n10137), .CK(n10723), .Q(n_status[1])) /* synthesis syn_module_defined=1 */ ;
    defparam n_status_i1.GSR = "DISABLED";
    FD1P3AX n_status_i2 (.D(n402[2]), .SP(n3464), .CK(n10723), .Q(n_status[2])) /* synthesis syn_module_defined=1 */ ;
    defparam n_status_i2.GSR = "DISABLED";
    FD1S3IX clock_cnt_751__i0 (.D(n21[0]), .CK(clk_c), .CD(n1585), .Q(clock_cnt[0])) /* synthesis syn_module_defined=1 */ ;
    defparam clock_cnt_751__i0.GSR = "ENABLED";
    OFS1P3JX SS_N_MASTER_0 (.D(n9067), .SP(VCC_net), .SCLK(clk_c), .PD(n299), 
            .Q(SS_N_MASTER[0])) /* synthesis syn_module_defined=1 */ ;
    defparam SS_N_MASTER_0.GSR = "ENABLED";
    FD1P3AX reg_rxdata_i0_i0_i0 (.D(rx_shift_data[0]), .SP(rx_latch_flag), 
            .CK(clk_c), .Q(reg_rxdata[0])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_rxdata_i0_i0_i0.GSR = "ENABLED";
    FD1P3AX i1099 (.D(latch_s_data[5]), .SP(n69), .CK(clk_c), .Q(reg_control[5])) /* synthesis syn_module_defined=1 */ ;
    defparam i1099.GSR = "ENABLED";
    PFUMX mux_255_i8 (.BLUT(n173[7]), .ALUT(n206[7]), .C0(n9500), .Z(n10667)) /* synthesis syn_module_defined=1 */ ;
    FD1S3AX i1101 (.D(n3593), .CK(clk_c), .Q(spi_mosi_c)) /* synthesis syn_module_defined=1 */ ;
    defparam i1101.GSR = "ENABLED";
    FD1P3AX i1103 (.D(latch_s_data[4]), .SP(n69), .CK(clk_c), .Q(reg_control[4])) /* synthesis syn_module_defined=1 */ ;
    defparam i1103.GSR = "ENABLED";
    FD1S3AX latch_s_data_i1 (.D(wb_data_from_master[1]), .CK(clk_c), .Q(latch_s_data[1])) /* synthesis syn_module_defined=1 */ ;
    defparam latch_s_data_i1.GSR = "ENABLED";
    LUT4 reg_status_3__bdd_4_lut (.A(reg_status[3]), .B(reg_status[5]), 
         .C(dw08_cs), .D(dw04_cs), .Z(n9984)) /* synthesis lut_function=(!(A (B (C)+!B !((D)+!C))+!A (B+!(D)))), syn_module_defined=1 */ ;
    defparam reg_status_3__bdd_4_lut.init = 16'h3b0a;
    FD1S3AX tx_shift_data_i1 (.D(n3623), .CK(clk_c), .Q(tx_shift_data[1])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_shift_data_i1.GSR = "ENABLED";
    FD1S3AX tx_shift_data_i2 (.D(n3625), .CK(clk_c), .Q(tx_shift_data[2])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_shift_data_i2.GSR = "ENABLED";
    FD1S3AX tx_shift_data_i3 (.D(n3627), .CK(clk_c), .Q(tx_shift_data[3])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_shift_data_i3.GSR = "ENABLED";
    FD1S3AX tx_shift_data_i4 (.D(n3634), .CK(clk_c), .Q(tx_shift_data[4])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_shift_data_i4.GSR = "ENABLED";
    FD1S3AX tx_shift_data_i5 (.D(n3636), .CK(clk_c), .Q(tx_shift_data[5])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_shift_data_i5.GSR = "ENABLED";
    FD1S3AX tx_shift_data_i6 (.D(n3638), .CK(clk_c), .Q(tx_shift_data[6])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_shift_data_i6.GSR = "ENABLED";
    LUT4 i2_3_lut_rep_201 (.A(c_status[0]), .B(c_status[1]), .C(c_status[2]), 
         .Z(n10252)) /* synthesis lut_function=(((C)+!B)+!A), syn_module_defined=1 */ ;
    defparam i2_3_lut_rep_201.init = 16'hf7f7;
    FD1S3AX tx_shift_data_i7 (.D(n3641), .CK(clk_c), .Q(tx_shift_data[7])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_shift_data_i7.GSR = "ENABLED";
    FD1S3AX latch_s_data_i2 (.D(wb_data_from_master[2]), .CK(clk_c), .Q(latch_s_data[2])) /* synthesis syn_module_defined=1 */ ;
    defparam latch_s_data_i2.GSR = "ENABLED";
    FD1S3AX latch_s_data_i3 (.D(wb_data_from_master[3]), .CK(clk_c), .Q(latch_s_data[3])) /* synthesis syn_module_defined=1 */ ;
    defparam latch_s_data_i3.GSR = "ENABLED";
    FD1S3AX latch_s_data_i4 (.D(wb_data_from_master[4]), .CK(clk_c), .Q(latch_s_data[4])) /* synthesis syn_module_defined=1 */ ;
    defparam latch_s_data_i4.GSR = "ENABLED";
    FD1S3AX latch_s_data_i5 (.D(wb_data_from_master[5]), .CK(clk_c), .Q(latch_s_data[5])) /* synthesis syn_module_defined=1 */ ;
    defparam latch_s_data_i5.GSR = "ENABLED";
    FD1S3AX latch_s_data_i6 (.D(wb_data_from_master[6]), .CK(clk_c), .Q(latch_s_data[6])) /* synthesis syn_module_defined=1 */ ;
    defparam latch_s_data_i6.GSR = "ENABLED";
    FD1S3AX latch_s_data_i7 (.D(wb_data_from_master[7]), .CK(clk_c), .Q(latch_s_data[7])) /* synthesis syn_module_defined=1 */ ;
    defparam latch_s_data_i7.GSR = "ENABLED";
    LUT4 i2586_3_lut (.A(n3592), .B(reg_txdata[7]), .C(n1587), .Z(n3593)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2586_3_lut.init = 16'hcaca;
    LUT4 i2585_3_lut (.A(spi_mosi_c), .B(tx_shift_data[7]), .C(n808), 
         .Z(n3592)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2585_3_lut.init = 16'hcaca;
    LUT4 i1_3_lut_4_lut (.A(c_status[1]), .B(n10253), .C(n9177), .D(n10257), 
         .Z(n1585)) /* synthesis lut_function=(!(A ((D)+!C)+!A (B ((D)+!C)))), syn_module_defined=1 */ ;
    defparam i1_3_lut_4_lut.init = 16'h11f1;
    PFUMX mux_255_i6 (.BLUT(n173[5]), .ALUT(n206[5]), .C0(n9500), .Z(n266)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i8483_4_lut (.A(reg_control[7]), .B(reg_status[7]), .C(dw08_cs), 
         .D(dw0c_cs), .Z(n173[7])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i8483_4_lut.init = 16'hcac0;
    LUT4 i28_2_lut (.A(reg_status[3]), .B(reg_status[2]), .Z(reg_status[7])) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i28_2_lut.init = 16'heeee;
    LUT4 mux_260_i8_3_lut (.A(reg_txdata[7]), .B(reg_rxdata[7]), .C(dw00_cs), 
         .Z(n206[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_260_i8_3_lut.init = 16'hcaca;
    PFUMX mux_255_i5 (.BLUT(n173[4]), .ALUT(n206[4]), .C0(n9500), .Z(n267)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i8600_4_lut (.A(reg_control[7]), .B(c_status[0]), .C(c_status[1]), 
         .D(c_status[2]), .Z(n9067)) /* synthesis lut_function=(!(A+!(B ((D)+!C)+!B (C (D)+!C !(D))))), syn_module_defined=1 */ ;
    defparam i8600_4_lut.init = 16'h5405;
    PFUMX mux_255_i4 (.BLUT(n173[3]), .ALUT(n206[3]), .C0(n9500), .Z(n268)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i8570_2_lut_3_lut_3_lut (.A(n10252), .B(spi_sclk_c), .C(n2838), 
         .Z(n3472)) /* synthesis lut_function=(!(A+(B+(C)))), syn_module_defined=1 */ ;
    defparam i8570_2_lut_3_lut_3_lut.init = 16'h0101;
    LUT4 i2_3_lut_4_lut_4_lut (.A(n10252), .B(spi_sclk_c), .C(wait_one_tick_done), 
         .D(n2838), .Z(n808)) /* synthesis lut_function=(!(A+(((D)+!C)+!B))), syn_module_defined=1 */ ;
    defparam i2_3_lut_4_lut_4_lut.init = 16'h0040;
    LUT4 i4783_4_lut (.A(pending_data), .B(reg_wr), .C(n9320), .D(dw04_cs), 
         .Z(n3652)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))), syn_module_defined=1 */ ;
    defparam i4783_4_lut.init = 16'heca0;
    LUT4 i1_2_lut_3_lut_3_lut (.A(n10252), .B(spi_sclk_c), .C(n2838), 
         .Z(n2836)) /* synthesis lut_function=(A (B)+!A (B (C)+!B !(C))), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut_3_lut.init = 16'hc9c9;
    LUT4 i2_3_lut_adj_0 (.A(clock_cnt[2]), .B(clock_cnt[0]), .C(clock_cnt[1]), 
         .Z(n9177)) /* synthesis lut_function=(!(A+((C)+!B))), syn_module_defined=1 */ ;
    defparam i2_3_lut_adj_0.init = 16'h0404;
    LUT4 i3 (.A(reg_rd), .B(\wb_ack[10] ), .C(dw00_cs), .Z(n39)) /* synthesis lut_function=(A (B (C))), syn_module_defined=1 */ ;
    defparam i3.init = 16'h8080;
    LUT4 i74_2_lut (.A(reg_wr), .B(dw10_cs), .Z(n290)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i74_2_lut.init = 16'h8888;
    FD1P3AX i1107 (.D(latch_s_data[3]), .SP(n69), .CK(clk_c), .Q(reg_control[3])) /* synthesis syn_module_defined=1 */ ;
    defparam i1107.GSR = "ENABLED";
    LUT4 mux_130_Mux_2_i7_4_lut (.A(n9140), .B(n3), .C(c_status[2]), .D(n10230), 
         .Z(n402[2])) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_130_Mux_2_i7_4_lut.init = 16'hc0ca;
    FD1P3AX i1109 (.D(latch_s_data[1]), .SP(n69), .CK(clk_c), .Q(reg_control[1])) /* synthesis syn_module_defined=1 */ ;
    defparam i1109.GSR = "ENABLED";
    LUT4 i3_4_lut (.A(data_cnt[0]), .B(n9177), .C(data_cnt[2]), .D(n9283), 
         .Z(n9313)) /* synthesis lut_function=(A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i3_4_lut.init = 16'h8000;
    LUT4 i4 (.A(data_cnt[1]), .B(spi_sclk_c), .Z(n9283)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i4.init = 16'h8888;
    LUT4 n9384_bdd_2_lut_3_lut_4_lut (.A(data_cnt[5]), .B(n10262), .C(n9313), 
         .D(n10257), .Z(n10146)) /* synthesis lut_function=(A+(B+((D)+!C))), syn_module_defined=1 */ ;
    defparam n9384_bdd_2_lut_3_lut_4_lut.init = 16'hffef;
    LUT4 mux_255_i1_3_lut (.A(n206[0]), .B(reg_rxdata[0]), .C(dw00_cs), 
         .Z(n271)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_255_i1_3_lut.init = 16'hcaca;
    LUT4 mux_260_i1_4_lut (.A(n140[0]), .B(reg_txdata[0]), .C(dw04_cs), 
         .D(dw08_cs), .Z(n206[0])) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_260_i1_4_lut.init = 16'hc0ca;
    LUT4 mux_262_i1_4_lut (.A(reg_ssmask[0]), .B(reg_control[0]), .C(dw0c_cs), 
         .D(dw10_cs), .Z(n140[0])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_262_i1_4_lut.init = 16'hcac0;
    LUT4 i2_3_lut_rep_183_4_lut (.A(data_cnt[5]), .B(n10262), .C(data_cnt[2]), 
         .D(n2838), .Z(n10234)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i2_3_lut_rep_183_4_lut.init = 16'hfffe;
    LUT4 n10176_bdd_2_lut_rep_197 (.A(n10176), .B(c_status[2]), .Z(n10248)) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam n10176_bdd_2_lut_rep_197.init = 16'h2222;
    LUT4 i4_4_lut (.A(clock_cnt[3]), .B(clock_cnt[0]), .C(clock_cnt[2]), 
         .D(n6), .Z(n2838)) /* synthesis lut_function=(A+((C+(D))+!B)), syn_module_defined=1 */ ;
    defparam i4_4_lut.init = 16'hfffb;
    LUT4 i1_2_lut (.A(clock_cnt[1]), .B(clock_cnt[4]), .Z(n6)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i1_2_lut.init = 16'heeee;
    FD1S3AX dw00_cs_c (.D(n9343), .CK(clk_c), .Q(dw00_cs)) /* synthesis syn_module_defined=1 */ ;
    defparam dw00_cs_c.GSR = "ENABLED";
    FD1S3AY reg_tmt (.D(n9347), .CK(clk_c), .Q(reg_status[4])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_tmt.GSR = "ENABLED";
    FD1P3AX reg_roe (.D(n10220), .SP(n3395), .CK(clk_c), .Q(reg_status[2])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_roe.GSR = "ENABLED";
    FD1S3AX reg_rrdy (.D(n3632), .CK(clk_c), .Q(reg_status[6])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_rrdy.GSR = "ENABLED";
    FD1S3AX reg_toe (.D(n9985), .CK(clk_c), .Q(reg_status[3])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_toe.GSR = "ENABLED";
    FD1P3JX reg_trdy (.D(n10625), .SP(n9100), .PD(n9126), .CK(clk_c), 
            .Q(reg_status[5])) /* synthesis syn_module_defined=1 */ ;
    defparam reg_trdy.GSR = "ENABLED";
    LUT4 i2_3_lut (.A(dw04_cs), .B(reg_status[5]), .C(reg_wr), .Z(n49)) /* synthesis lut_function=(A (B (C))), syn_module_defined=1 */ ;
    defparam i2_3_lut.init = 16'h8080;
    FD1S3AX wait_one_tick_done_c (.D(n10626), .CK(clk_c), .Q(wait_one_tick_done)) /* synthesis syn_module_defined=1 */ ;
    defparam wait_one_tick_done_c.GSR = "ENABLED";
    FD1P3AX n_status_i0 (.D(n402[0]), .SP(n3464), .CK(n10723), .Q(n_status[0])) /* synthesis syn_module_defined=1 */ ;
    defparam n_status_i0.GSR = "DISABLED";
    FD1P3AX i1117 (.D(latch_s_data[0]), .SP(n69), .CK(clk_c), .Q(reg_control[0])) /* synthesis syn_module_defined=1 */ ;
    defparam i1117.GSR = "ENABLED";
    FD1S3IX rx_latch_flag_c (.D(n10265), .CK(clk_c), .CD(n10252), .Q(rx_latch_flag)) /* synthesis syn_module_defined=1 */ ;
    defparam rx_latch_flag_c.GSR = "ENABLED";
    FD1S3AX c_status_i0 (.D(n_status[0]), .CK(clk_c), .Q(c_status[0])) /* synthesis syn_module_defined=1 */ ;
    defparam c_status_i0.GSR = "ENABLED";
    FD1S3AX SCLK_MASTER (.D(n2836), .CK(clk_c), .Q(spi_sclk_c)) /* synthesis syn_module_defined=1 */ ;
    defparam SCLK_MASTER.GSR = "ENABLED";
    FD1P3AX i1115 (.D(latch_s_data[0]), .SP(n290), .CK(clk_c), .Q(reg_ssmask[0])) /* synthesis syn_module_defined=1 */ ;
    defparam i1115.GSR = "ENABLED";
    FD1S3AX pending_data_c (.D(n3652), .CK(clk_c), .Q(pending_data)) /* synthesis syn_module_defined=1 */ ;
    defparam pending_data_c.GSR = "ENABLED";
    FD1P3IX read_wait_done_c20 (.D(n10626), .SP(n2642), .CD(\wb_ack[10] ), 
            .CK(clk_c), .Q(read_wait_done)) /* synthesis syn_module_defined=1 */ ;
    defparam read_wait_done_c20.GSR = "ENABLED";
    FD1S3AX reg_rd_c21 (.D(n2642), .CK(clk_c), .Q(reg_rd)) /* synthesis syn_module_defined=1 */ ;
    defparam reg_rd_c21.GSR = "ENABLED";
    FD1S3IX reg_wr_c (.D(n9218), .CK(clk_c), .CD(n10659), .Q(reg_wr)) /* synthesis syn_module_defined=1 */ ;
    defparam reg_wr_c.GSR = "ENABLED";
    FD1S3AX dw10_cs_c (.D(n8260), .CK(clk_c), .Q(dw10_cs)) /* synthesis syn_module_defined=1 */ ;
    defparam dw10_cs_c.GSR = "ENABLED";
    FD1S3AX dw0c_cs_c (.D(n9267), .CK(clk_c), .Q(dw0c_cs)) /* synthesis syn_module_defined=1 */ ;
    defparam dw0c_cs_c.GSR = "ENABLED";
    FD1S3AX dw08_cs_c (.D(n9133), .CK(clk_c), .Q(dw08_cs)) /* synthesis syn_module_defined=1 */ ;
    defparam dw08_cs_c.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_202 (.A(c_status[0]), .B(c_status[2]), .Z(n10253)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_202.init = 16'heeee;
    LUT4 i8587_2_lut_rep_178_2_lut_4_lut (.A(c_status[0]), .B(c_status[1]), 
         .C(c_status[2]), .D(n2838), .Z(n10229)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)), syn_module_defined=1 */ ;
    defparam i8587_2_lut_rep_178_2_lut_4_lut.init = 16'h0008;
    LUT4 i1_2_lut_2_lut_4_lut (.A(c_status[0]), .B(c_status[1]), .C(c_status[2]), 
         .D(n10265), .Z(n9126)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B (D))+!A (D))), syn_module_defined=1 */ ;
    defparam i1_2_lut_2_lut_4_lut.init = 16'h00f7;
    VHI i2 (.Z(VCC_net));
    VLO i1 (.Z(GND_net));
    
endmodule

//
// Verilog Description of module \lm8_wb(LM8_ADDR_W=24,NUM_DECODE=4) 
//

module \lm8_wb(LM8_ADDR_W=24,NUM_DECODE=4)  (\addr[20] , \addr[21] , \addr[22] , 
            n2143, \addr[23] , digital_out_i, \wb_ack[10] , \wb_ack[0] , 
            n8279, io_rdy, n9581, clk_c, reg_rd, n10667, n10666, 
            n266, n267, n268, n269, n270, wb_rst, data_in, n271, 
            n10236, n4411, n1242, n10626, n2976, n10723, rst, 
            n8203, n8191, n8194, n8197, n8200, n8180, n8183, n8188, 
            n9219, n10661, ack_reg, n10268, wb_dat_i_c_35, wb_dat_i_c_32, 
            wb_dat_i_c_34, wb_dat_i_c_33, \wb_addr[9] , \wb_addr[8] , 
            \wb_addr[7] , \wb_addr[6] , \wb_addr[5] , \wb_addr[4] , 
            \wb_addr[3] , \wb_addr[2] , \wb_addr[1] , \wb_addr[0] , 
            rom_ce) /* synthesis syn_module_defined=1 */ ;
    input \addr[20] ;
    input \addr[21] ;
    input \addr[22] ;
    input n2143;
    input \addr[23] ;
    input [7:0]digital_out_i;
    output \wb_ack[10] ;
    output \wb_ack[0] ;
    output n8279;
    output io_rdy;
    output n9581;
    input clk_c;
    input reg_rd;
    input n10667;
    input n10666;
    input n266;
    input n267;
    input n268;
    input n269;
    input n270;
    input wb_rst;
    output [7:0]data_in;
    input n271;
    input n10236;
    input n4411;
    input [7:0]n1242;
    input n10626;
    input n2976;
    input n10723;
    input rst;
    input n8203;
    input n8191;
    input n8194;
    input n8197;
    input n8200;
    input n8180;
    input n8183;
    input n8188;
    input n9219;
    input n10661;
    input ack_reg;
    input n10268;
    input wb_dat_i_c_35;
    input wb_dat_i_c_32;
    input wb_dat_i_c_34;
    input wb_dat_i_c_33;
    input \wb_addr[9] ;
    input \wb_addr[8] ;
    input \wb_addr[7] ;
    input \wb_addr[6] ;
    input \wb_addr[5] ;
    input \wb_addr[4] ;
    input \wb_addr[3] ;
    input \wb_addr[2] ;
    input \wb_addr[1] ;
    input \wb_addr[0] ;
    input rom_ce;
    
    wire [127:0]wb_dat_i;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(118[14:22])
    wire [127:0]data_mux;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_wb.v(81[27:35])
    
    wire n580, n10200, n579, n8937, n648, n646, n2151, n8933, 
        n7_adj_0, n13_adj_0, n10193, n10199, n513, n2126, n3, 
        n4, n10201, n578, n577, n10192, n10191, n10198, n10194, 
        n645, n8931, n1, n2, n516, n515, n514, n8935, n647, 
        n7, n13;
    
    LUT4 i4566_4_lut (.A(wb_dat_i[83]), .B(\addr[21] ), .C(wb_dat_i[91]), 
         .D(\addr[20] ), .Z(n580)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i4566_4_lut.init = 16'hc088;
    LUT4 wb_dat_i_114__bdd_4_lut (.A(wb_dat_i[114]), .B(n2143), .C(n579), 
         .D(\addr[22] ), .Z(n10200)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C+(D)))+!A ((D)+!C))), syn_module_defined=1 */ ;
    defparam wb_dat_i_114__bdd_4_lut.init = 16'h22f0;
    PFUMX shift_right_13_i776 (.BLUT(n648), .ALUT(n8937), .C0(\addr[23] ), 
          .Z(data_mux[7])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i4544_4_lut (.A(wb_dat_i[5]), .B(n2151), .C(digital_out_i[5]), 
         .D(\addr[20] ), .Z(n646)) /* synthesis lut_function=(!(A (B+(C (D)))+!A (B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4544_4_lut.init = 16'h0322;
    LUT4 i1_4_lut_adj_0 (.A(\addr[21] ), .B(n13_adj_0), .C(n7_adj_0), 
         .D(\addr[22] ), .Z(n8933)) /* synthesis lut_function=(A (B (C+!(D))+!B (C (D)))), syn_module_defined=1 */ ;
    defparam i1_4_lut_adj_0.init = 16'ha088;
    LUT4 i2_3_lut (.A(\wb_ack[0] ), .B(n8279), .C(\wb_ack[10] ), .Z(io_rdy)) /* synthesis lut_function=(A+(B+(C))), syn_module_defined=1 */ ;
    defparam i2_3_lut.init = 16'hfefe;
    LUT4 i8537_2_lut (.A(\addr[21] ), .B(\addr[23] ), .Z(n9581)) /* synthesis lut_function=(!(A (B)+!A !(B))), syn_module_defined=1 */ ;
    defparam i8537_2_lut.init = 16'h6666;
    L6MUX21 i8449 (.D0(n10193), .D1(n10199), .SD(\addr[23] ), .Z(data_mux[3])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i4558_4_lut (.A(wb_dat_i[0]), .B(\addr[21] ), .C(digital_out_i[0]), 
         .D(\addr[20] ), .Z(n513)) /* synthesis lut_function=(!(A (B+(C (D)))+!A (B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4558_4_lut.init = 16'h0322;
    LUT4 i1232_2_lut (.A(\addr[20] ), .B(\addr[21] ), .Z(n2126)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i1232_2_lut.init = 16'heeee;
    LUT4 i4542_4_lut (.A(wb_dat_i[7]), .B(n2151), .C(digital_out_i[7]), 
         .D(\addr[20] ), .Z(n648)) /* synthesis lut_function=(!(A (B+(C (D)))+!A (B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4542_4_lut.init = 16'h0322;
    LUT4 i26_3_lut_adj_0 (.A(wb_dat_i[85]), .B(wb_dat_i[93]), .C(\addr[20] ), 
         .Z(n13_adj_0)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i26_3_lut_adj_0.init = 16'hcaca;
    LUT4 i6 (.A(\addr[21] ), .B(n4), .C(n3), .D(\addr[22] ), .Z(n8937)) /* synthesis lut_function=(A (B (C+!(D))+!B (C (D)))), syn_module_defined=1 */ ;
    defparam i6.init = 16'ha088;
    LUT4 i5 (.A(wb_dat_i[87]), .B(wb_dat_i[95]), .C(\addr[20] ), .Z(n4)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i5.init = 16'hcaca;
    LUT4 i4 (.A(\addr[20] ), .B(wb_dat_i[119]), .Z(n3)) /* synthesis lut_function=(!(A+!(B))), syn_module_defined=1 */ ;
    defparam i4.init = 16'h4444;
    LUT4 wb_dat_i_113__bdd_4_lut (.A(wb_dat_i[113]), .B(n2143), .C(n578), 
         .D(\addr[22] ), .Z(n10201)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C+(D)))+!A ((D)+!C))), syn_module_defined=1 */ ;
    defparam wb_dat_i_113__bdd_4_lut.init = 16'h22f0;
    LUT4 i4563_4_lut (.A(wb_dat_i[80]), .B(\addr[21] ), .C(wb_dat_i[88]), 
         .D(\addr[20] ), .Z(n577)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i4563_4_lut.init = 16'hc088;
    L6MUX21 i8446 (.D0(n10192), .D1(n10200), .SD(\addr[23] ), .Z(data_mux[2])) /* synthesis syn_module_defined=1 */ ;
    L6MUX21 i8443 (.D0(n10191), .D1(n10201), .SD(\addr[23] ), .Z(data_mux[1])) /* synthesis syn_module_defined=1 */ ;
    L6MUX21 i8440 (.D0(n10198), .D1(n10194), .SD(\addr[23] ), .Z(data_mux[0])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i4545_4_lut (.A(wb_dat_i[4]), .B(n2151), .C(digital_out_i[4]), 
         .D(\addr[20] ), .Z(n645)) /* synthesis lut_function=(!(A (B+(C (D)))+!A (B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4545_4_lut.init = 16'h0322;
    LUT4 i3 (.A(\addr[21] ), .B(n2), .C(n1), .D(\addr[22] ), .Z(n8931)) /* synthesis lut_function=(A (B (C+!(D))+!B (C (D)))), syn_module_defined=1 */ ;
    defparam i3.init = 16'ha088;
    LUT4 i2 (.A(wb_dat_i[84]), .B(wb_dat_i[92]), .C(\addr[20] ), .Z(n2)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2.init = 16'hcaca;
    LUT4 i1 (.A(\addr[20] ), .B(wb_dat_i[116]), .Z(n1)) /* synthesis lut_function=(!(A+!(B))), syn_module_defined=1 */ ;
    defparam i1.init = 16'h4444;
    FD1P3AX SPI_DAT_O___i8 (.D(n10667), .SP(reg_rd), .CK(clk_c), .Q(wb_dat_i[87])) /* synthesis syn_module_defined=1 */ ;
    defparam SPI_DAT_O___i8.GSR = "ENABLED";
    FD1P3AX SPI_DAT_O___i7 (.D(n10666), .SP(reg_rd), .CK(clk_c), .Q(wb_dat_i[86])) /* synthesis syn_module_defined=1 */ ;
    defparam SPI_DAT_O___i7.GSR = "ENABLED";
    FD1P3AX SPI_DAT_O___i6 (.D(n266), .SP(reg_rd), .CK(clk_c), .Q(wb_dat_i[85])) /* synthesis syn_module_defined=1 */ ;
    defparam SPI_DAT_O___i6.GSR = "ENABLED";
    FD1P3AX SPI_DAT_O___i5 (.D(n267), .SP(reg_rd), .CK(clk_c), .Q(wb_dat_i[84])) /* synthesis syn_module_defined=1 */ ;
    defparam SPI_DAT_O___i5.GSR = "ENABLED";
    FD1P3AX SPI_DAT_O___i4 (.D(n268), .SP(reg_rd), .CK(clk_c), .Q(wb_dat_i[83])) /* synthesis syn_module_defined=1 */ ;
    defparam SPI_DAT_O___i4.GSR = "ENABLED";
    FD1P3AX SPI_DAT_O___i3 (.D(n269), .SP(reg_rd), .CK(clk_c), .Q(wb_dat_i[82])) /* synthesis syn_module_defined=1 */ ;
    defparam SPI_DAT_O___i3.GSR = "ENABLED";
    FD1P3AX SPI_DAT_O___i2 (.D(n270), .SP(reg_rd), .CK(clk_c), .Q(wb_dat_i[81])) /* synthesis syn_module_defined=1 */ ;
    defparam SPI_DAT_O___i2.GSR = "ENABLED";
    FD1S3IX lm8_ext_io_din_i4 (.D(data_mux[4]), .CK(clk_c), .CD(wb_rst), 
            .Q(data_in[4])) /* synthesis syn_module_defined=1 */ ;
    defparam lm8_ext_io_din_i4.GSR = "DISABLED";
    FD1S3IX lm8_ext_io_din_i5 (.D(data_mux[5]), .CK(clk_c), .CD(wb_rst), 
            .Q(data_in[5])) /* synthesis syn_module_defined=1 */ ;
    defparam lm8_ext_io_din_i5.GSR = "DISABLED";
    FD1S3IX lm8_ext_io_din_i6 (.D(data_mux[6]), .CK(clk_c), .CD(wb_rst), 
            .Q(data_in[6])) /* synthesis syn_module_defined=1 */ ;
    defparam lm8_ext_io_din_i6.GSR = "DISABLED";
    LUT4 i4561_4_lut (.A(wb_dat_i[3]), .B(\addr[21] ), .C(digital_out_i[3]), 
         .D(\addr[20] ), .Z(n516)) /* synthesis lut_function=(!(A (B+(C (D)))+!A (B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4561_4_lut.init = 16'h0322;
    FD1S3IX lm8_ext_io_din_i7 (.D(data_mux[7]), .CK(clk_c), .CD(wb_rst), 
            .Q(data_in[7])) /* synthesis syn_module_defined=1 */ ;
    defparam lm8_ext_io_din_i7.GSR = "DISABLED";
    FD1P3AX SPI_DAT_O___i1 (.D(n271), .SP(reg_rd), .CK(clk_c), .Q(wb_dat_i[80])) /* synthesis syn_module_defined=1 */ ;
    defparam SPI_DAT_O___i1.GSR = "ENABLED";
    LUT4 i4560_4_lut (.A(wb_dat_i[2]), .B(\addr[21] ), .C(digital_out_i[2]), 
         .D(\addr[20] ), .Z(n515)) /* synthesis lut_function=(!(A (B+(C (D)))+!A (B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4560_4_lut.init = 16'h0322;
    LUT4 i4559_4_lut (.A(wb_dat_i[1]), .B(\addr[21] ), .C(digital_out_i[1]), 
         .D(\addr[20] ), .Z(n514)) /* synthesis lut_function=(!(A (B+(C (D)))+!A (B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4559_4_lut.init = 16'h0322;
    PFUMX shift_right_13_i775 (.BLUT(n647), .ALUT(n8935), .C0(\addr[23] ), 
          .Z(data_mux[6])) /* synthesis syn_module_defined=1 */ ;
    FD1P3JX data_8bit___i8 (.D(n1242[7]), .SP(n10236), .PD(n4411), .CK(clk_c), 
            .Q(wb_dat_i[7])) /* synthesis syn_module_defined=1 */ ;
    defparam data_8bit___i8.GSR = "ENABLED";
    FD1P3JX data_8bit___i7 (.D(n1242[6]), .SP(n10236), .PD(n4411), .CK(clk_c), 
            .Q(wb_dat_i[6])) /* synthesis syn_module_defined=1 */ ;
    defparam data_8bit___i7.GSR = "ENABLED";
    FD1P3JX data_8bit___i6 (.D(n1242[5]), .SP(n10236), .PD(n4411), .CK(clk_c), 
            .Q(wb_dat_i[5])) /* synthesis syn_module_defined=1 */ ;
    defparam data_8bit___i6.GSR = "ENABLED";
    FD1P3JX data_8bit___i5 (.D(n1242[4]), .SP(n10236), .PD(n4411), .CK(clk_c), 
            .Q(wb_dat_i[4])) /* synthesis syn_module_defined=1 */ ;
    defparam data_8bit___i5.GSR = "ENABLED";
    FD1P3JX data_8bit___i4 (.D(n1242[3]), .SP(n10236), .PD(n4411), .CK(clk_c), 
            .Q(wb_dat_i[3])) /* synthesis syn_module_defined=1 */ ;
    defparam data_8bit___i4.GSR = "ENABLED";
    FD1P3JX data_8bit___i3 (.D(n1242[2]), .SP(n10236), .PD(n4411), .CK(clk_c), 
            .Q(wb_dat_i[2])) /* synthesis syn_module_defined=1 */ ;
    defparam data_8bit___i3.GSR = "ENABLED";
    FD1P3JX data_8bit___i2 (.D(n1242[1]), .SP(n10236), .PD(n4411), .CK(clk_c), 
            .Q(wb_dat_i[1])) /* synthesis syn_module_defined=1 */ ;
    defparam data_8bit___i2.GSR = "ENABLED";
    FD1P3IX ack_o (.D(n10626), .SP(n2976), .CD(\wb_ack[0] ), .CK(clk_c), 
            .Q(\wb_ack[0] )) /* synthesis syn_module_defined=1 */ ;
    defparam ack_o.GSR = "ENABLED";
    PFUMX shift_right_13_i773 (.BLUT(n645), .ALUT(n8931), .C0(\addr[23] ), 
          .Z(data_mux[4])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i4543_4_lut (.A(wb_dat_i[6]), .B(n2151), .C(digital_out_i[6]), 
         .D(\addr[20] ), .Z(n647)) /* synthesis lut_function=(!(A (B+(C (D)))+!A (B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i4543_4_lut.init = 16'h0322;
    LUT4 i1_4_lut (.A(\addr[21] ), .B(n13), .C(n7), .D(\addr[22] ), 
         .Z(n8935)) /* synthesis lut_function=(A (B (C+!(D))+!B (C (D)))), syn_module_defined=1 */ ;
    defparam i1_4_lut.init = 16'ha088;
    LUT4 i26_3_lut (.A(wb_dat_i[86]), .B(wb_dat_i[94]), .C(\addr[20] ), 
         .Z(n13)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i26_3_lut.init = 16'hcaca;
    LUT4 i1_2_lut (.A(\addr[20] ), .B(wb_dat_i[118]), .Z(n7)) /* synthesis lut_function=(!(A+!(B))), syn_module_defined=1 */ ;
    defparam i1_2_lut.init = 16'h4444;
    FD1P3JX data_8bit___i1 (.D(n1242[0]), .SP(n10236), .PD(n4411), .CK(clk_c), 
            .Q(wb_dat_i[0])) /* synthesis syn_module_defined=1 */ ;
    defparam data_8bit___i1.GSR = "ENABLED";
    FD1S3DX dat_o_i2 (.D(n8203), .CK(n10723), .CD(rst), .Q(wb_dat_i[89])) /* synthesis syn_module_defined=1 */ ;
    defparam dat_o_i2.GSR = "DISABLED";
    FD1S3DX dat_o_i3 (.D(n8191), .CK(n10723), .CD(rst), .Q(wb_dat_i[90])) /* synthesis syn_module_defined=1 */ ;
    defparam dat_o_i3.GSR = "DISABLED";
    FD1S3DX dat_o_i4 (.D(n8194), .CK(n10723), .CD(rst), .Q(wb_dat_i[91])) /* synthesis syn_module_defined=1 */ ;
    defparam dat_o_i4.GSR = "DISABLED";
    LUT4 i1_2_lut_adj_0 (.A(\addr[20] ), .B(wb_dat_i[117]), .Z(n7_adj_0)) /* synthesis lut_function=(!(A+!(B))), syn_module_defined=1 */ ;
    defparam i1_2_lut_adj_0.init = 16'h4444;
    FD1S3DX dat_o_i5 (.D(n8197), .CK(n10723), .CD(rst), .Q(wb_dat_i[92])) /* synthesis syn_module_defined=1 */ ;
    defparam dat_o_i5.GSR = "DISABLED";
    FD1S3DX dat_o_i6 (.D(n8200), .CK(n10723), .CD(rst), .Q(wb_dat_i[93])) /* synthesis syn_module_defined=1 */ ;
    defparam dat_o_i6.GSR = "DISABLED";
    FD1S3DX dat_o_i7 (.D(n8180), .CK(n10723), .CD(rst), .Q(wb_dat_i[94])) /* synthesis syn_module_defined=1 */ ;
    defparam dat_o_i7.GSR = "DISABLED";
    FD1S3DX dat_o_i8 (.D(n8183), .CK(n10723), .CD(rst), .Q(wb_dat_i[95])) /* synthesis syn_module_defined=1 */ ;
    defparam dat_o_i8.GSR = "DISABLED";
    PFUMX shift_right_13_i774 (.BLUT(n646), .ALUT(n8933), .C0(\addr[23] ), 
          .Z(data_mux[5])) /* synthesis syn_module_defined=1 */ ;
    FD1S3IX lm8_ext_io_din_i0 (.D(data_mux[0]), .CK(clk_c), .CD(wb_rst), 
            .Q(data_in[0])) /* synthesis syn_module_defined=1 */ ;
    defparam lm8_ext_io_din_i0.GSR = "DISABLED";
    LUT4 i1257_2_lut (.A(\addr[21] ), .B(\addr[22] ), .Z(n2151)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i1257_2_lut.init = 16'heeee;
    FD1S3IX lm8_ext_io_din_i1 (.D(data_mux[1]), .CK(clk_c), .CD(wb_rst), 
            .Q(data_in[1])) /* synthesis syn_module_defined=1 */ ;
    defparam lm8_ext_io_din_i1.GSR = "DISABLED";
    FD1S3IX lm8_ext_io_din_i2 (.D(data_mux[2]), .CK(clk_c), .CD(wb_rst), 
            .Q(data_in[2])) /* synthesis syn_module_defined=1 */ ;
    defparam lm8_ext_io_din_i2.GSR = "DISABLED";
    FD1S3DX dat_o_i1 (.D(n8188), .CK(n10723), .CD(rst), .Q(wb_dat_i[88])) /* synthesis syn_module_defined=1 */ ;
    defparam dat_o_i1.GSR = "DISABLED";
    FD1S3IX lm8_ext_io_din_i3 (.D(data_mux[3]), .CK(clk_c), .CD(wb_rst), 
            .Q(data_in[3])) /* synthesis syn_module_defined=1 */ ;
    defparam lm8_ext_io_din_i3.GSR = "DISABLED";
    FD1P3IX SPI_ACK_O (.D(n10626), .SP(n9219), .CD(\wb_ack[10] ), .CK(clk_c), 
            .Q(\wb_ack[10] )) /* synthesis syn_module_defined=1 */ ;
    defparam SPI_ACK_O.GSR = "ENABLED";
    LUT4 i3_4_lut (.A(n10661), .B(ack_reg), .C(n9581), .D(n10268), .Z(n8279)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)), syn_module_defined=1 */ ;
    defparam i3_4_lut.init = 16'h0200;
    LUT4 wb_dat_i_c_35_bdd_4_lut (.A(wb_dat_i_c_35), .B(n2126), .C(n516), 
         .D(\addr[22] ), .Z(n10193)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C+(D)))+!A ((D)+!C))), syn_module_defined=1 */ ;
    defparam wb_dat_i_c_35_bdd_4_lut.init = 16'h22f0;
    LUT4 wb_dat_i_c_32_bdd_4_lut (.A(wb_dat_i_c_32), .B(n2126), .C(n513), 
         .D(\addr[22] ), .Z(n10198)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C+(D)))+!A ((D)+!C))), syn_module_defined=1 */ ;
    defparam wb_dat_i_c_32_bdd_4_lut.init = 16'h22f0;
    LUT4 wb_dat_i_c_34_bdd_4_lut (.A(wb_dat_i_c_34), .B(n2126), .C(n515), 
         .D(\addr[22] ), .Z(n10192)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C+(D)))+!A ((D)+!C))), syn_module_defined=1 */ ;
    defparam wb_dat_i_c_34_bdd_4_lut.init = 16'h22f0;
    LUT4 wb_dat_i_112__bdd_4_lut (.A(wb_dat_i[112]), .B(n2143), .C(n577), 
         .D(\addr[22] ), .Z(n10194)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C+(D)))+!A ((D)+!C))), syn_module_defined=1 */ ;
    defparam wb_dat_i_112__bdd_4_lut.init = 16'h22f0;
    LUT4 wb_dat_i_c_33_bdd_4_lut (.A(wb_dat_i_c_33), .B(n2126), .C(n514), 
         .D(\addr[22] ), .Z(n10191)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C+(D)))+!A ((D)+!C))), syn_module_defined=1 */ ;
    defparam wb_dat_i_c_33_bdd_4_lut.init = 16'h22f0;
    LUT4 i4564_4_lut (.A(wb_dat_i[81]), .B(\addr[21] ), .C(wb_dat_i[89]), 
         .D(\addr[20] ), .Z(n578)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i4564_4_lut.init = 16'hc088;
    LUT4 i4565_4_lut (.A(wb_dat_i[82]), .B(\addr[21] ), .C(wb_dat_i[90]), 
         .D(\addr[20] ), .Z(n579)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i4565_4_lut.init = 16'hc088;
    LUT4 wb_dat_i_115__bdd_4_lut (.A(wb_dat_i[115]), .B(n2143), .C(n580), 
         .D(\addr[22] ), .Z(n10199)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C+(D)))+!A ((D)+!C))), syn_module_defined=1 */ ;
    defparam wb_dat_i_115__bdd_4_lut.init = 16'h22f0;
    pmi_romXhmenusdn8101024 \pmi_rompmi_romXO2hexmenu.hexsyncdisablenoreg8101024  (.Address({\wb_addr[9] , 
            \wb_addr[8] , \wb_addr[7] , \wb_addr[6] , \wb_addr[5] , 
            \wb_addr[4] , \wb_addr[3] , \wb_addr[2] , \wb_addr[1] , 
            \wb_addr[0] }), .Q({wb_dat_i[119:112]}), .OutClock(clk_c), 
            .OutClockEn(rom_ce), .Reset(wb_rst)) /* synthesis syn_instantiated=1, syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(358[12] 366[2])
    defparam \pmi_rompmi_romXO2hexmenu.hexsyncdisablenoreg8101024 .module_type = "pmi_rom";
    defparam \pmi_rompmi_romXO2hexmenu.hexsyncdisablenoreg8101024 .pmi_family = "XO2";
    defparam \pmi_rompmi_romXO2hexmenu.hexsyncdisablenoreg8101024 .pmi_init_file_format = "hex";
    defparam \pmi_rompmi_romXO2hexmenu.hexsyncdisablenoreg8101024 .pmi_init_file = "menu.hex";
    defparam \pmi_rompmi_romXO2hexmenu.hexsyncdisablenoreg8101024 .pmi_resetmode = "sync";
    defparam \pmi_rompmi_romXO2hexmenu.hexsyncdisablenoreg8101024 .pmi_gsr = "disable";
    defparam \pmi_rompmi_romXO2hexmenu.hexsyncdisablenoreg8101024 .pmi_regmode = "noreg";
    defparam \pmi_rompmi_romXO2hexmenu.hexsyncdisablenoreg8101024 .pmi_data_width = 8;
    defparam \pmi_rompmi_romXO2hexmenu.hexsyncdisablenoreg8101024 .pmi_addr_width = 10;
    defparam \pmi_rompmi_romXO2hexmenu.hexsyncdisablenoreg8101024 .pmi_addr_depth = 1024;
    
endmodule

//
// Verilog Description of module \uart_core(CLK_IN_MHZ=24,BAUD_RATE=115200,ADDRWIDTH=3,DATAWIDTH=8,FIFO=0) 
//

module \uart_core(CLK_IN_MHZ=24,BAUD_RATE=115200,ADDRWIDTH=3,DATAWIDTH=8,FIFO=0)  (clk_c, 
            uart_tx_c, n1506, wb_data_from_master, \wb_addr[0] , \wb_addr[1] , 
            n1242, n10625, n10221, uart_rx_c, parity_err, n10626, 
            n3618, n3377, \wb_addr[3] , \wb_addr[4] , n9133, n9267, 
            n9266, n8260, n9343, n7422, \ier[2] , n10236, n10670, 
            n10217, \wb_addr[2] , \wb_addr[5] , \wb_addr[6] , \wb_addr[7] , 
            n10682, n10793, div_wr_strobe, n2694, n10249) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    output uart_tx_c;
    input n1506;
    input [7:0]wb_data_from_master;
    output \wb_addr[0] ;
    output \wb_addr[1] ;
    output [7:0]n1242;
    input n10625;
    input n10221;
    input uart_rx_c;
    output parity_err;
    input n10626;
    input n3618;
    input n3377;
    output \wb_addr[3] ;
    output \wb_addr[4] ;
    output n9133;
    output n9267;
    output n9266;
    output n8260;
    output n9343;
    input n7422;
    output \ier[2] ;
    input n10236;
    input n10670;
    input n10217;
    output \wb_addr[2] ;
    output \wb_addr[5] ;
    output \wb_addr[6] ;
    output \wb_addr[7] ;
    input n10682;
    input [7:0]n10793;
    input div_wr_strobe;
    input n2694;
    input n10249;
    
    wire [6:0]n15;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(138[23:32])
    wire [2:0]tx_cnt;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(99[28:34])
    wire [1:0]databits;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(136[23:31])
    wire [7:0]THR;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(135[23:26])
    wire THRE;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(149[23:27])
    wire thr_wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(141[23:29])
    wire [15:0]divisor;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(158[23:30])
    wire [7:0]RBR;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(134[23:26])
    wire tsr_empty;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(91[28:37])
    wire overrun_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(147[23:34])
    wire rx_rdy;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(144[23:29])
    wire frame_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(146[23:32])
    wire break_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(148[23:32])
    wire [7:0]MSR;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(129[23:26])
    
    wire n31, n10204, n3595, n3397;
    wire [2:0]n15_adj_0;
    
    wire n10267;
    
    \txmitt(DATAWIDTH=8,FIFO=0)  u_txmitt (.clk_c(clk_c), .parity_en(n15[3]), 
            .tx_cnt({tx_cnt}), .databits({databits}), .n31(n31), .n10204(n10204), 
            .uart_tx_c(uart_tx_c), .THR({THR}), .parity_even(n15[4]), 
            .n1506(n1506), .\wb_data_from_master[6] (wb_data_from_master[6]), 
            .parity_stick(n15[5]), .\wb_data_from_master[5] (wb_data_from_master[5]), 
            .\wb_data_from_master[4] (wb_data_from_master[4]), .\wb_data_from_master[3] (wb_data_from_master[3]), 
            .\wb_data_from_master[2] (wb_data_from_master[2]), .THRE(THRE), 
            .thr_wr(thr_wr), .n3595(n3595), .n3397(n3397), .\divisor[7] (divisor[7]), 
            .\divisor[0] (divisor[0]), .\RBR[5] (RBR[5]), .\wb_addr[0] (\wb_addr[0] ), 
            .\wb_addr[1] (\wb_addr[1] ), .n1245(n1242[5]), .\divisor[1] (divisor[1]), 
            .\divisor[2] (divisor[2]), .\divisor[3] (divisor[3]), .\divisor[6] (divisor[6]), 
            .\divisor[5] (divisor[5]), .\divisor[4] (divisor[4]), .n16(n15_adj_0[2]), 
            .tsr_empty(tsr_empty), .n10625(n10625)) /* synthesis syn_module_defined=1 */ ;
    \rxcver(DATAWIDTH=8,FIFO=0)  u_rxcver (.databits({databits}), .clk_c(clk_c), 
            .parity_en(n15[3]), .n1506(n1506), .\wb_data_from_master[1] (wb_data_from_master[1]), 
            .tx_cnt({tx_cnt}), .n31(n31), .n16(n15_adj_0[2]), .\wb_data_from_master[0] (wb_data_from_master[0]), 
            .n10267(n10267), .overrun_err(overrun_err), .n10221(n10221), 
            .rx_rdy(rx_rdy), .uart_rx_c(uart_rx_c), .frame_err(frame_err), 
            .break_int(break_int), .RBR({RBR}), .n3397(n3397), .n10204(n10204), 
            .parity_err(parity_err), .n10626(n10626), .parity_even(n15[4]), 
            .parity_stick(n15[5]), .\divisor[7] (divisor[7]), .\divisor[5] (divisor[5]), 
            .\divisor[6] (divisor[6]), .\divisor[3] (divisor[3]), .\divisor[4] (divisor[4]), 
            .\divisor[1] (divisor[1]), .\divisor[2] (divisor[2]), .\divisor[0] (divisor[0]), 
            .n3618(n3618)) /* synthesis syn_module_defined=1 */ ;
    \modem(DATAWIDTH=8)  u_modem (.clk_c(clk_c), .\MSR[1] (MSR[1]), .n10626(n10626), 
            .n10625(n10625)) /* synthesis syn_module_defined=1 */ ;
    \intface(CLK_IN_MHZ=24,BAUD_RATE=115200,ADDRWIDTH=3,DATAWIDTH=8,FIFO=0)  u_intface (.clk_c(clk_c), 
            .n3377(n3377), .THR({THR}), .wb_data_from_master({wb_data_from_master}), 
            .\wb_addr[3] (\wb_addr[3] ), .\wb_addr[4] (\wb_addr[4] ), .n9133(n9133), 
            .n9267(n9267), .n9266(n9266), .n8260(n8260), .n9343(n9343), 
            .n7422(n7422), .\ier[2] (\ier[2] ), .\MSR[1] (MSR[1]), .rx_rdy(rx_rdy), 
            .break_int(break_int), .frame_err(frame_err), .parity_err(parity_err), 
            .overrun_err(overrun_err), .THRE(THRE), .n10236(n10236), .n10670(n10670), 
            .n10217(n10217), .n10221(n10221), .\wb_addr[0] (\wb_addr[0] ), 
            .\wb_addr[1] (\wb_addr[1] ), .\wb_addr[2] (\wb_addr[2] ), .\wb_addr[5] (\wb_addr[5] ), 
            .\wb_addr[6] (\wb_addr[6] ), .\wb_addr[7] (\wb_addr[7] ), .\RBR[7] (RBR[7]), 
            .n1243(n1242[7]), .n1250(n1242[0]), .\RBR[0] (RBR[0]), .n1244(n1242[6]), 
            .\RBR[6] (RBR[6]), .tsr_empty(tsr_empty), .n10682(n10682), 
            .n10793({n10793}), .div_wr_strobe(div_wr_strobe), .\divisor[7] (divisor[7]), 
            .\divisor[6] (divisor[6]), .\divisor[5] (divisor[5]), .\divisor[4] (divisor[4]), 
            .\divisor[3] (divisor[3]), .\divisor[2] (divisor[2]), .\divisor[1] (divisor[1]), 
            .n2694(n2694), .n1249(n1242[1]), .\RBR[1] (RBR[1]), .n1248(n1242[2]), 
            .\RBR[2] (RBR[2]), .\RBR[3] (RBR[3]), .n1247(n1242[3]), .\RBR[4] (RBR[4]), 
            .n1246(n1242[4]), .\divisor[0] (divisor[0]), .n3595(n3595), 
            .n10267(n10267), .n10626(n10626), .thr_wr(thr_wr), .n10249(n10249)) /* synthesis syn_module_defined=1 */ ;
    
endmodule

//
// Verilog Description of module \txmitt(DATAWIDTH=8,FIFO=0) 
//

module \txmitt(DATAWIDTH=8,FIFO=0)  (clk_c, parity_en, tx_cnt, databits, 
            n31, n10204, uart_tx_c, THR, parity_even, n1506, \wb_data_from_master[6] , 
            parity_stick, \wb_data_from_master[5] , \wb_data_from_master[4] , 
            \wb_data_from_master[3] , \wb_data_from_master[2] , THRE, 
            thr_wr, n3595, n3397, \divisor[7] , \divisor[0] , \RBR[5] , 
            \wb_addr[0] , \wb_addr[1] , n1245, \divisor[1] , \divisor[2] , 
            \divisor[3] , \divisor[6] , \divisor[5] , \divisor[4] , 
            n16, tsr_empty, n10625) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    output parity_en;
    output [2:0]tx_cnt;
    input [1:0]databits;
    output n31;
    output n10204;
    output uart_tx_c;
    input [7:0]THR;
    output parity_even;
    input n1506;
    input \wb_data_from_master[6] ;
    output parity_stick;
    input \wb_data_from_master[5] ;
    input \wb_data_from_master[4] ;
    input \wb_data_from_master[3] ;
    input \wb_data_from_master[2] ;
    input THRE;
    input thr_wr;
    output n3595;
    output n3397;
    input \divisor[7] ;
    input \divisor[0] ;
    input \RBR[5] ;
    input \wb_addr[0] ;
    input \wb_addr[1] ;
    output n1245;
    input \divisor[1] ;
    input \divisor[2] ;
    input \divisor[3] ;
    input \divisor[6] ;
    input \divisor[5] ;
    input \divisor[4] ;
    input n16;
    output tsr_empty;
    input n10625;
    
    wire [15:0]counter;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(115[14:21])
    wire tx_in_stop_s1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(96[28:41])
    wire tx_in_stop_s;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(94[28:40])
    wire tx_output;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(87[28:37])
    wire [6:0]n15;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(140[23:31])
    wire [7:0]tsr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(88[28:31])
    wire tx_parity;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(89[28:37])
    wire [6:0]lcr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(168[15:18])
    wire tx_in_shift_s1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(95[28:42])
    wire tx_in_shift_s;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/txmitt.v(93[28:41])
    
    wire GND_net;
    wire [15:0]n14;
    
    wire n8141, n8140, n8142;
    wire [7:0]n554;
    
    wire n582, n8759, n585, n588, n10254, n3670, n8143, n2480, 
        n10205, n9151, n9149, n10271, n9585, n4507, n7073, n572, 
        n9165, n32, n3, n8144, n10196, n504, n3610, n2078, n3421, 
        n844, n2068, n2270, n2070, n2072, n22, n28, n30, n10269, 
        n10197, n3608, n2074, n26, n18, n10273, n10, n10113, 
        n10114, n10115, n10116, n10117, n3607;
    wire [15:0]n31_c;
    
    wire n3606, n3605, n3604, n3597, n3596;
    wire [15:0]n454;
    
    wire n3613, n3612;
    wire [15:0]n66;
    
    wire n3406;
    wire [0:0]n1449;
    
    wire n8137, n8138, n2076, n2120, n3616;
    wire [0:0]n1437;
    
    wire n281, n10195, n8139, n17, n72, n9227;
    
    CCU2D sub_10_add_2_9 (.A0(counter[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8140), .COUT(n8141), .S0(n14[7]), .S1(n14[8])) /* synthesis syn_module_defined=1 */ ;
    defparam sub_10_add_2_9.INIT0 = 16'h5555;
    defparam sub_10_add_2_9.INIT1 = 16'h5555;
    defparam sub_10_add_2_9.INJECT1_0 = "NO";
    defparam sub_10_add_2_9.INJECT1_1 = "NO";
    CCU2D sub_10_add_2_11 (.A0(counter[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[10]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8141), .COUT(n8142), .S0(n14[9]), .S1(n14[10])) /* synthesis syn_module_defined=1 */ ;
    defparam sub_10_add_2_11.INIT0 = 16'h5555;
    defparam sub_10_add_2_11.INIT1 = 16'h5555;
    defparam sub_10_add_2_11.INJECT1_0 = "NO";
    defparam sub_10_add_2_11.INJECT1_1 = "NO";
    FD1S3AX tx_state_FSM_i5 (.D(n582), .CK(clk_c), .Q(n554[4])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_state_FSM_i5.GSR = "ENABLED";
    FD1S3AY tx_state_FSM_i1 (.D(n8759), .CK(clk_c), .Q(n554[0])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_state_FSM_i1.GSR = "ENABLED";
    FD1S3AX tx_state_FSM_i6 (.D(n585), .CK(clk_c), .Q(n554[5])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_state_FSM_i6.GSR = "ENABLED";
    FD1S3AX tx_state_FSM_i7 (.D(n588), .CK(clk_c), .Q(n554[6])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_state_FSM_i7.GSR = "ENABLED";
    FD1P3IX counter_i10 (.D(n14[10]), .SP(n10254), .CD(n3670), .CK(clk_c), 
            .Q(counter[10])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i10.GSR = "ENABLED";
    CCU2D sub_10_add_2_13 (.A0(counter[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[12]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8142), .COUT(n8143), .S0(n14[11]), .S1(n14[12])) /* synthesis syn_module_defined=1 */ ;
    defparam sub_10_add_2_13.INIT0 = 16'h5555;
    defparam sub_10_add_2_13.INIT1 = 16'h5555;
    defparam sub_10_add_2_13.INJECT1_0 = "NO";
    defparam sub_10_add_2_13.INJECT1_1 = "NO";
    LUT4 i7151_4_lut (.A(n554[3]), .B(n9151), .C(n10205), .D(n554[2]), 
         .Z(n2480)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B (C)+!B (C (D)))), syn_module_defined=1 */ ;
    defparam i7151_4_lut.init = 16'hfaca;
    LUT4 i6 (.A(parity_en), .B(n9149), .Z(n9151)) /* synthesis lut_function=(!(A+!(B))), syn_module_defined=1 */ ;
    defparam i6.init = 16'h4444;
    LUT4 i2_4_lut (.A(tx_cnt[2]), .B(n554[1]), .C(n9585), .D(n10271), 
         .Z(n9149)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)), syn_module_defined=1 */ ;
    defparam i2_4_lut.init = 16'h0008;
    LUT4 i8541_2_lut (.A(tx_cnt[0]), .B(databits[0]), .Z(n9585)) /* synthesis lut_function=(!(A (B)+!A !(B))), syn_module_defined=1 */ ;
    defparam i8541_2_lut.init = 16'h6666;
    LUT4 i4802_4_lut (.A(parity_en), .B(n554[2]), .C(n7073), .D(n9149), 
         .Z(n4507)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i4802_4_lut.init = 16'hcac0;
    LUT4 i5 (.A(n31), .B(n10204), .C(n554[1]), .D(n9165), .Z(n572)) /* synthesis lut_function=(A (B+(C))+!A (B+!((D)+!C))), syn_module_defined=1 */ ;
    defparam i5.init = 16'hecfc;
    LUT4 i51_3_lut (.A(tx_cnt[0]), .B(tx_cnt[2]), .C(databits[0]), .Z(n32)) /* synthesis lut_function=(A (B (C))+!A !((C)+!B)), syn_module_defined=1 */ ;
    defparam i51_3_lut.init = 16'h8484;
    LUT4 i8602_2_lut (.A(tx_in_stop_s1), .B(tx_in_stop_s), .Z(n3)) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i8602_2_lut.init = 16'h2222;
    LUT4 i4666_2_lut (.A(tx_output), .B(n15[6]), .Z(uart_tx_c)) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4666_2_lut.init = 16'h2222;
    CCU2D sub_10_add_2_15 (.A0(counter[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[14]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8143), .COUT(n8144), .S0(n14[13]), .S1(n14[14])) /* synthesis syn_module_defined=1 */ ;
    defparam sub_10_add_2_15.INIT0 = 16'h5555;
    defparam sub_10_add_2_15.INIT1 = 16'h5555;
    defparam sub_10_add_2_15.INJECT1_0 = "NO";
    defparam sub_10_add_2_15.INJECT1_1 = "NO";
    LUT4 n27_bdd_4_lut (.A(n14[3]), .B(n31), .C(n3610), .D(n504), .Z(n10196)) /* synthesis lut_function=(A (B (C+(D))+!B !((D)+!C))+!A !((D)+!C)), syn_module_defined=1 */ ;
    defparam n27_bdd_4_lut.init = 16'h88f0;
    CCU2D sub_10_add_2_17 (.A0(counter[15]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n8144), .S0(n14[15]), .S1(n504)) /* synthesis syn_module_defined=1 */ ;
    defparam sub_10_add_2_17.INIT0 = 16'h5555;
    defparam sub_10_add_2_17.INIT1 = 16'h0000;
    defparam sub_10_add_2_17.INJECT1_0 = "NO";
    defparam sub_10_add_2_17.INJECT1_1 = "NO";
    LUT4 i1186_3_lut_4_lut (.A(n504), .B(n554[6]), .C(THR[1]), .D(tsr[2]), 
         .Z(n2078)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam i1186_3_lut_4_lut.init = 16'hf780;
    FD1P3IX counter_i14 (.D(n14[14]), .SP(n10254), .CD(n3670), .CK(clk_c), 
            .Q(counter[14])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i14.GSR = "ENABLED";
    FD1P3IX counter_i12 (.D(n14[12]), .SP(n10254), .CD(n3670), .CK(clk_c), 
            .Q(counter[12])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i12.GSR = "ENABLED";
    FD1P3IX counter_i8 (.D(n14[8]), .SP(n10254), .CD(n3670), .CK(clk_c), 
            .Q(counter[8])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i8.GSR = "ENABLED";
    FD1P3AX tsr_i0_i0_i7 (.D(n844), .SP(n3421), .CK(clk_c), .Q(tsr[7])) /* synthesis syn_module_defined=1 */ ;
    defparam tsr_i0_i0_i7.GSR = "ENABLED";
    FD1P3IX tsr_i0_i0_i6 (.D(n2068), .SP(n3421), .CD(GND_net), .CK(clk_c), 
            .Q(tsr[6])) /* synthesis syn_module_defined=1 */ ;
    defparam tsr_i0_i0_i6.GSR = "ENABLED";
    LUT4 i1372_4_lut (.A(tx_parity), .B(parity_even), .C(n554[6]), .D(tsr[0]), 
         .Z(n2270)) /* synthesis lut_function=(!(A (B (C+(D))+!B !(C+!(D)))+!A (B (C+!(D))+!B !(C+(D))))), syn_module_defined=1 */ ;
    defparam i1372_4_lut.init = 16'h353a;
    FD1P3IX tsr_i0_i0_i5 (.D(n2070), .SP(n3421), .CD(GND_net), .CK(clk_c), 
            .Q(tsr[5])) /* synthesis syn_module_defined=1 */ ;
    defparam tsr_i0_i0_i5.GSR = "ENABLED";
    FD1P3IX tsr_i0_i0_i4 (.D(n2072), .SP(n3421), .CD(GND_net), .CK(clk_c), 
            .Q(tsr[4])) /* synthesis syn_module_defined=1 */ ;
    defparam tsr_i0_i0_i4.GSR = "ENABLED";
    FD1P3AX lcr___i7 (.D(\wb_data_from_master[6] ), .SP(n1506), .CK(clk_c), 
            .Q(n15[6])) /* synthesis syn_module_defined=1 */ ;
    defparam lcr___i7.GSR = "ENABLED";
    FD1P3AX lcr___i6 (.D(\wb_data_from_master[5] ), .SP(n1506), .CK(clk_c), 
            .Q(parity_stick)) /* synthesis syn_module_defined=1 */ ;
    defparam lcr___i6.GSR = "ENABLED";
    FD1P3AX lcr___i5 (.D(\wb_data_from_master[4] ), .SP(n1506), .CK(clk_c), 
            .Q(parity_even)) /* synthesis syn_module_defined=1 */ ;
    defparam lcr___i5.GSR = "ENABLED";
    FD1P3AX lcr___i4 (.D(\wb_data_from_master[3] ), .SP(n1506), .CK(clk_c), 
            .Q(parity_en)) /* synthesis syn_module_defined=1 */ ;
    defparam lcr___i4.GSR = "ENABLED";
    FD1P3AX lcr___i3 (.D(\wb_data_from_master[2] ), .SP(n1506), .CK(clk_c), 
            .Q(lcr[2])) /* synthesis syn_module_defined=1 */ ;
    defparam lcr___i3.GSR = "ENABLED";
    LUT4 i14_4_lut (.A(counter[10]), .B(n28), .C(n22), .D(counter[12]), 
         .Z(n30)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i14_4_lut.init = 16'hfffe;
    LUT4 i1_2_lut_rep_218 (.A(tx_in_shift_s), .B(tx_in_shift_s1), .Z(n10269)) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_218.init = 16'h2222;
    LUT4 i1_3_lut_4_lut_adj_0 (.A(tx_in_shift_s), .B(tx_in_shift_s1), .C(thr_wr), 
         .D(THRE), .Z(n3595)) /* synthesis lut_function=(!(A (B (C+!(D))+!B (C))+!A (C+!(D)))), syn_module_defined=1 */ ;
    defparam i1_3_lut_4_lut_adj_0.init = 16'h0f02;
    LUT4 i8539_2_lut_rep_220 (.A(tx_cnt[1]), .B(databits[1]), .Z(n10271)) /* synthesis lut_function=(!(A (B)+!A !(B))), syn_module_defined=1 */ ;
    defparam i8539_2_lut_rep_220.init = 16'h6666;
    LUT4 i3 (.A(tx_cnt[1]), .B(databits[1]), .C(n32), .D(n504), .Z(n9165)) /* synthesis lut_function=(A (B (C (D)))+!A !(B+!(C (D)))), syn_module_defined=1 */ ;
    defparam i3.init = 16'h9000;
    LUT4 n26_bdd_4_lut (.A(n14[4]), .B(n31), .C(n3608), .D(n504), .Z(n10197)) /* synthesis lut_function=(A (B (C+(D))+!B !((D)+!C))+!A !((D)+!C)), syn_module_defined=1 */ ;
    defparam n26_bdd_4_lut.init = 16'h88f0;
    LUT4 i1182_3_lut_4_lut (.A(n504), .B(n554[6]), .C(THR[3]), .D(tsr[4]), 
         .Z(n2074)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam i1182_3_lut_4_lut.init = 16'hf780;
    LUT4 i10_4_lut (.A(counter[8]), .B(counter[3]), .C(counter[13]), .D(counter[5]), 
         .Z(n26)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i10_4_lut.init = 16'hfffe;
    LUT4 i2_2_lut (.A(counter[1]), .B(counter[4]), .Z(n18)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i2_2_lut.init = 16'heeee;
    LUT4 i12_4_lut (.A(counter[11]), .B(counter[9]), .C(counter[14]), 
         .D(counter[15]), .Z(n28)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i12_4_lut.init = 16'hfffe;
    LUT4 i6_2_lut (.A(counter[2]), .B(counter[7]), .Z(n22)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i6_2_lut.init = 16'heeee;
    FD1S3AX tx_state_FSM_i2 (.D(n572), .CK(clk_c), .Q(n554[1])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_state_FSM_i2.GSR = "ENABLED";
    FD1S3AX tx_state_FSM_i3 (.D(n4507), .CK(clk_c), .Q(n554[2])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_state_FSM_i3.GSR = "ENABLED";
    FD1S3AX tx_state_FSM_i4 (.D(n2480), .CK(clk_c), .Q(n554[3])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_state_FSM_i4.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_222 (.A(n554[5]), .B(n554[4]), .Z(n10273)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_222.init = 16'heeee;
    LUT4 i2 (.A(n554[5]), .B(n554[4]), .C(lcr[2]), .D(n554[3]), .Z(n10)) /* synthesis lut_function=(A+(B+!(C+!(D)))), syn_module_defined=1 */ ;
    defparam i2.init = 16'hefee;
    LUT4 i8784 (.A(n14[7]), .B(n31), .C(counter[7]), .D(n554[5]), .Z(n10113)) /* synthesis lut_function=(A (B (C+(D))+!B !((D)+!C))+!A !((D)+!C)), syn_module_defined=1 */ ;
    defparam i8784.init = 16'h88f0;
    LUT4 i8785 (.A(n14[7]), .B(n31), .Z(n10114)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i8785.init = 16'h8888;
    LUT4 i7148_2_lut_rep_154 (.A(n504), .B(n31), .Z(n10205)) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i7148_2_lut_rep_154.init = 16'h2222;
    LUT4 i1_2_lut_3_lut_4_lut (.A(n504), .B(n31), .C(THR[7]), .D(n554[6]), 
         .Z(n844)) /* synthesis lut_function=(!((B+!(C (D)))+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'h2000;
    PFUMX i8776 (.BLUT(n10114), .ALUT(n10113), .C0(n554[0]), .Z(n10115)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i1_4_lut_4_lut_4_lut (.A(n504), .B(n31), .C(n554[1]), .D(n554[6]), 
         .Z(n3397)) /* synthesis lut_function=(!((B ((D)+!C)+!B !(C+(D)))+!A)), syn_module_defined=1 */ ;
    defparam i1_4_lut_4_lut_4_lut.init = 16'h22a0;
    LUT4 i8805 (.A(\divisor[7] ), .B(counter[7]), .C(n554[0]), .D(n554[5]), 
         .Z(n10116)) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))), syn_module_defined=1 */ ;
    defparam i8805.init = 16'h00ca;
    LUT4 n10116_bdd_3_lut (.A(n10116), .B(n10115), .C(n504), .Z(n10117)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam n10116_bdd_3_lut.init = 16'hcaca;
    PFUMX i2600 (.BLUT(n3606), .ALUT(n31_c[5]), .C0(n504), .Z(n3607)) /* synthesis syn_module_defined=1 */ ;
    PFUMX i2598 (.BLUT(n3604), .ALUT(n31_c[6]), .C0(n504), .Z(n3605)) /* synthesis syn_module_defined=1 */ ;
    PFUMX i2590 (.BLUT(n3596), .ALUT(n454[0]), .C0(n554[5]), .Z(n3597)) /* synthesis syn_module_defined=1 */ ;
    PFUMX i2606 (.BLUT(n3612), .ALUT(n454[2]), .C0(n554[5]), .Z(n3613)) /* synthesis syn_module_defined=1 */ ;
    LUT4 mux_16_i1_3_lut_4_lut (.A(n14[0]), .B(n31), .C(n504), .D(\divisor[0] ), 
         .Z(n66[0])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A !(C+!(D))), syn_module_defined=1 */ ;
    defparam mux_16_i1_3_lut_4_lut.init = 16'h8f80;
    INV i2429 (.A(n554[0]), .Z(n3406)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i6719_4_lut (.A(\RBR[5] ), .B(THRE), .C(\wb_addr[0] ), .D(\wb_addr[1] ), 
         .Z(n1245)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i6719_4_lut.init = 16'hc0ca;
    LUT4 i1180_3_lut_4_lut (.A(n504), .B(n554[6]), .C(THR[4]), .D(tsr[5]), 
         .Z(n2072)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam i1180_3_lut_4_lut.init = 16'hf780;
    LUT4 i1178_3_lut_4_lut (.A(n504), .B(n554[6]), .C(THR[5]), .D(tsr[6]), 
         .Z(n2070)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam i1178_3_lut_4_lut.init = 16'hf780;
    FD1P3IX tsr_i0_i0_i3 (.D(n2074), .SP(n3421), .CD(GND_net), .CK(clk_c), 
            .Q(tsr[3])) /* synthesis syn_module_defined=1 */ ;
    defparam tsr_i0_i0_i3.GSR = "ENABLED";
    FD1P3AY tx_output_c (.D(n1449[0]), .SP(n3406), .CK(clk_c), .Q(tx_output)) /* synthesis syn_module_defined=1 */ ;
    defparam tx_output_c.GSR = "ENABLED";
    FD1S3AX tx_in_stop_s_c (.D(n554[3]), .CK(clk_c), .Q(tx_in_stop_s)) /* synthesis syn_module_defined=1 */ ;
    defparam tx_in_stop_s_c.GSR = "ENABLED";
    FD1S3AX tx_in_shift_s_c (.D(n554[1]), .CK(clk_c), .Q(tx_in_shift_s)) /* synthesis syn_module_defined=1 */ ;
    defparam tx_in_shift_s_c.GSR = "ENABLED";
    FD1S3AX tx_in_stop_s1_c (.D(tx_in_stop_s), .CK(clk_c), .Q(tx_in_stop_s1)) /* synthesis syn_module_defined=1 */ ;
    defparam tx_in_stop_s1_c.GSR = "ENABLED";
    LUT4 mux_85_i1_3_lut_4_lut (.A(n14[0]), .B(n31), .C(n504), .D(\divisor[1] ), 
         .Z(n454[0])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A !(C+!(D))), syn_module_defined=1 */ ;
    defparam mux_85_i1_3_lut_4_lut.init = 16'h8f80;
    FD1S3AX tx_in_shift_s1_c (.D(tx_in_shift_s), .CK(clk_c), .Q(tx_in_shift_s1)) /* synthesis syn_module_defined=1 */ ;
    defparam tx_in_shift_s1_c.GSR = "ENABLED";
    FD1S3AX counter_i0 (.D(n3597), .CK(clk_c), .Q(counter[0])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i0.GSR = "ENABLED";
    LUT4 mux_16_i3_3_lut_4_lut (.A(n14[2]), .B(n31), .C(n504), .D(\divisor[2] ), 
         .Z(n66[2])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A !(C+!(D))), syn_module_defined=1 */ ;
    defparam mux_16_i3_3_lut_4_lut.init = 16'h8f80;
    LUT4 mux_85_i3_3_lut_4_lut (.A(n14[2]), .B(n31), .C(n504), .D(\divisor[3] ), 
         .Z(n454[2])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A !(C+!(D))), syn_module_defined=1 */ ;
    defparam mux_85_i3_3_lut_4_lut.init = 16'h8f80;
    LUT4 i2605_3_lut (.A(counter[2]), .B(n66[2]), .C(n554[0]), .Z(n3612)) /* synthesis lut_function=(A (B+(C))+!A !((C)+!B)), syn_module_defined=1 */ ;
    defparam i2605_3_lut.init = 16'hacac;
    LUT4 i2589_3_lut (.A(counter[0]), .B(n66[0]), .C(n554[0]), .Z(n3596)) /* synthesis lut_function=(A (B+(C))+!A !((C)+!B)), syn_module_defined=1 */ ;
    defparam i2589_3_lut.init = 16'hacac;
    CCU2D sub_10_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(counter[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n8137), .S1(n14[0])) /* synthesis syn_module_defined=1 */ ;
    defparam sub_10_add_2_1.INIT0 = 16'hF000;
    defparam sub_10_add_2_1.INIT1 = 16'h5555;
    defparam sub_10_add_2_1.INJECT1_0 = "NO";
    defparam sub_10_add_2_1.INJECT1_1 = "NO";
    CCU2D sub_10_add_2_3 (.A0(counter[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8137), .COUT(n8138), .S0(n14[1]), .S1(n14[2])) /* synthesis syn_module_defined=1 */ ;
    defparam sub_10_add_2_3.INIT0 = 16'h5555;
    defparam sub_10_add_2_3.INIT1 = 16'h5555;
    defparam sub_10_add_2_3.INJECT1_0 = "NO";
    defparam sub_10_add_2_3.INJECT1_1 = "NO";
    LUT4 i2597_3_lut (.A(\divisor[6] ), .B(\divisor[7] ), .C(n554[5]), 
         .Z(n3604)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2597_3_lut.init = 16'hcaca;
    LUT4 i4630_2_lut (.A(n14[6]), .B(n31), .Z(n31_c[6])) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i4630_2_lut.init = 16'h8888;
    LUT4 i2599_3_lut (.A(\divisor[5] ), .B(\divisor[6] ), .C(n554[5]), 
         .Z(n3606)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2599_3_lut.init = 16'hcaca;
    LUT4 i4631_2_lut (.A(n14[5]), .B(n31), .Z(n31_c[5])) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i4631_2_lut.init = 16'h8888;
    LUT4 i2601_3_lut (.A(\divisor[4] ), .B(\divisor[5] ), .C(n554[5]), 
         .Z(n3608)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2601_3_lut.init = 16'hcaca;
    FD1P3IX tsr_i0_i0_i2 (.D(n2076), .SP(n3421), .CD(GND_net), .CK(clk_c), 
            .Q(tsr[2])) /* synthesis syn_module_defined=1 */ ;
    defparam tsr_i0_i0_i2.GSR = "ENABLED";
    LUT4 i2603_3_lut (.A(\divisor[3] ), .B(\divisor[4] ), .C(n554[5]), 
         .Z(n3610)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2603_3_lut.init = 16'hcaca;
    LUT4 i1228_3_lut_4_lut (.A(n504), .B(n554[6]), .C(THR[0]), .D(tsr[1]), 
         .Z(n2120)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam i1228_3_lut_4_lut.init = 16'hf780;
    FD1P3IX tsr_i0_i0_i1 (.D(n2078), .SP(n3421), .CD(GND_net), .CK(clk_c), 
            .Q(tsr[1])) /* synthesis syn_module_defined=1 */ ;
    defparam tsr_i0_i0_i1.GSR = "ENABLED";
    LUT4 i2609_3_lut (.A(\divisor[1] ), .B(\divisor[2] ), .C(n554[5]), 
         .Z(n3616)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2609_3_lut.init = 16'hcaca;
    LUT4 i1_2_lut_rep_153_3_lut (.A(n504), .B(n31), .C(n554[6]), .Z(n10204)) /* synthesis lut_function=(!((B+!(C))+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_153_3_lut.init = 16'h2020;
    FD1P3IX tx_cnt_758__i2 (.D(n16), .SP(n3397), .CD(n10204), .CK(clk_c), 
            .Q(tx_cnt[2])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_cnt_758__i2.GSR = "ENABLED";
    LUT4 i1_3_lut_4_lut (.A(n504), .B(n31), .C(n554[6]), .D(n554[1]), 
         .Z(n3421)) /* synthesis lut_function=(!((B+!(C+(D)))+!A)), syn_module_defined=1 */ ;
    defparam i1_3_lut_4_lut.init = 16'h2220;
    FD1P3IX counter_i15 (.D(n14[15]), .SP(n10254), .CD(n3670), .CK(clk_c), 
            .Q(counter[15])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i15.GSR = "ENABLED";
    FD1P3AY i1105 (.D(n2270), .SP(n3421), .CK(clk_c), .Q(tx_parity)) /* synthesis syn_module_defined=1 */ ;
    defparam i1105.GSR = "ENABLED";
    LUT4 i1_4_lut (.A(n10273), .B(n554[6]), .C(n1437[0]), .D(n554[3]), 
         .Z(n1449[0])) /* synthesis lut_function=(!(A (B)+!A (B+!(C+(D))))), syn_module_defined=1 */ ;
    defparam i1_4_lut.init = 16'h3332;
    LUT4 mux_593_i1_3_lut (.A(tsr[0]), .B(n281), .C(n554[2]), .Z(n1437[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_593_i1_3_lut.init = 16'hcaca;
    LUT4 i62_3_lut (.A(tx_parity), .B(parity_even), .C(parity_stick), 
         .Z(n281)) /* synthesis lut_function=(!(A (B (C))+!A (B+!(C)))), syn_module_defined=1 */ ;
    defparam i62_3_lut.init = 16'h3a3a;
    FD1P3AX counter_i1 (.D(n10195), .SP(n10254), .CK(clk_c), .Q(counter[1])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i1.GSR = "ENABLED";
    FD1S3AX counter_i2 (.D(n3613), .CK(clk_c), .Q(counter[2])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i2.GSR = "ENABLED";
    FD1P3AX counter_i3 (.D(n10196), .SP(n10254), .CK(clk_c), .Q(counter[3])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i3.GSR = "ENABLED";
    FD1P3AX counter_i4 (.D(n10197), .SP(n10254), .CK(clk_c), .Q(counter[4])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i4.GSR = "ENABLED";
    FD1P3AX counter_i5 (.D(n3607), .SP(n10254), .CK(clk_c), .Q(counter[5])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i5.GSR = "ENABLED";
    FD1P3IX counter_i9 (.D(n14[9]), .SP(n10254), .CD(n3670), .CK(clk_c), 
            .Q(counter[9])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i9.GSR = "ENABLED";
    FD1P3AX counter_i6 (.D(n3605), .SP(n10254), .CK(clk_c), .Q(counter[6])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i6.GSR = "ENABLED";
    LUT4 i1184_3_lut_4_lut (.A(n504), .B(n554[6]), .C(THR[2]), .D(tsr[3]), 
         .Z(n2076)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam i1184_3_lut_4_lut.init = 16'hf780;
    LUT4 i4 (.A(n554[0]), .B(n554[5]), .Z(n10254)) /* synthesis lut_function=((B)+!A), syn_module_defined=1 */ ;
    defparam i4.init = 16'hdddd;
    CCU2D sub_10_add_2_5 (.A0(counter[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8138), .COUT(n8139), .S0(n14[3]), .S1(n14[4])) /* synthesis syn_module_defined=1 */ ;
    defparam sub_10_add_2_5.INIT0 = 16'h5555;
    defparam sub_10_add_2_5.INIT1 = 16'h5555;
    defparam sub_10_add_2_5.INJECT1_0 = "NO";
    defparam sub_10_add_2_5.INJECT1_1 = "NO";
    LUT4 i1176_3_lut_4_lut (.A(n504), .B(n554[6]), .C(THR[6]), .D(tsr[7]), 
         .Z(n2068)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam i1176_3_lut_4_lut.init = 16'hf780;
    FD1S3AX counter_i7 (.D(n10117), .CK(clk_c), .Q(counter[7])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i7.GSR = "ENABLED";
    LUT4 i1_2_lut (.A(counter[0]), .B(counter[6]), .Z(n17)) /* synthesis lut_function=((B)+!A), syn_module_defined=1 */ ;
    defparam i1_2_lut.init = 16'hdddd;
    LUT4 i8593_2_lut_2_lut_3_lut_4_lut (.A(n554[0]), .B(n554[5]), .C(n504), 
         .D(n31), .Z(n3670)) /* synthesis lut_function=(!(A ((C (D))+!B)+!A (C (D)))), syn_module_defined=1 */ ;
    defparam i8593_2_lut_2_lut_3_lut_4_lut.init = 16'h0ddd;
    FD1P3JX tsr_empty_c34 (.D(n10625), .SP(n10269), .PD(n3), .CK(clk_c), 
            .Q(tsr_empty)) /* synthesis syn_module_defined=1 */ ;
    defparam tsr_empty_c34.GSR = "ENABLED";
    LUT4 i1_4_lut_adj_0 (.A(THRE), .B(n7073), .C(n554[0]), .D(n554[6]), 
         .Z(n588)) /* synthesis lut_function=(A (B (D))+!A (B (C+(D))+!B (C))), syn_module_defined=1 */ ;
    defparam i1_4_lut_adj_0.init = 16'hdc50;
    LUT4 i1_2_lut_adj_0 (.A(n31), .B(n504), .Z(n7073)) /* synthesis lut_function=(A+!(B)), syn_module_defined=1 */ ;
    defparam i1_2_lut_adj_0.init = 16'hbbbb;
    LUT4 i4798_4_lut (.A(n72), .B(n554[5]), .C(n7073), .D(n9227), .Z(n585)) /* synthesis lut_function=(A (B (C))+!A (B (C+(D))+!B !(C+!(D)))), syn_module_defined=1 */ ;
    defparam i4798_4_lut.init = 16'hc5c0;
    LUT4 i8 (.A(databits[1]), .B(databits[0]), .Z(n72)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i8.init = 16'heeee;
    LUT4 i7 (.A(n554[3]), .B(lcr[2]), .Z(n9227)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i7.init = 16'h8888;
    LUT4 i9 (.A(THRE), .B(n10), .C(n554[0]), .D(n10205), .Z(n8759)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))), syn_module_defined=1 */ ;
    defparam i9.init = 16'heca0;
    FD1P3IX counter_i13 (.D(n14[13]), .SP(n10254), .CD(n3670), .CK(clk_c), 
            .Q(counter[13])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i13.GSR = "ENABLED";
    LUT4 n29_bdd_4_lut (.A(n14[1]), .B(n31), .C(n3616), .D(n504), .Z(n10195)) /* synthesis lut_function=(A (B (C+(D))+!B !((D)+!C))+!A !((D)+!C)), syn_module_defined=1 */ ;
    defparam n29_bdd_4_lut.init = 16'h88f0;
    LUT4 i7149_4_lut (.A(n554[4]), .B(n72), .C(n10205), .D(n9227), .Z(n582)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i7149_4_lut.init = 16'hca0a;
    CCU2D sub_10_add_2_7 (.A0(counter[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(counter[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n8139), .COUT(n8140), .S0(n14[5]), .S1(n14[6])) /* synthesis syn_module_defined=1 */ ;
    defparam sub_10_add_2_7.INIT0 = 16'h5555;
    defparam sub_10_add_2_7.INIT1 = 16'h5555;
    defparam sub_10_add_2_7.INJECT1_0 = "NO";
    defparam sub_10_add_2_7.INJECT1_1 = "NO";
    LUT4 i15_4_lut (.A(n17), .B(n30), .C(n26), .D(n18), .Z(n31)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i15_4_lut.init = 16'hfffe;
    FD1P3IX tsr_i0_i0_i0 (.D(n2120), .SP(n3421), .CD(GND_net), .CK(clk_c), 
            .Q(tsr[0])) /* synthesis syn_module_defined=1 */ ;
    defparam tsr_i0_i0_i0.GSR = "ENABLED";
    FD1P3IX counter_i11 (.D(n14[11]), .SP(n10254), .CD(n3670), .CK(clk_c), 
            .Q(counter[11])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i11.GSR = "ENABLED";
    VLO i1 (.Z(GND_net));
    
endmodule

//
// Verilog Description of module \rxcver(DATAWIDTH=8,FIFO=0) 
//

module \rxcver(DATAWIDTH=8,FIFO=0)  (databits, clk_c, parity_en, n1506, 
            \wb_data_from_master[1] , tx_cnt, n31, n16, \wb_data_from_master[0] , 
            n10267, overrun_err, n10221, rx_rdy, uart_rx_c, frame_err, 
            break_int, RBR, n3397, n10204, parity_err, n10626, parity_even, 
            parity_stick, \divisor[7] , \divisor[5] , \divisor[6] , 
            \divisor[3] , \divisor[4] , \divisor[1] , \divisor[2] , 
            \divisor[0] , n3618) /* synthesis syn_module_defined=1 */ ;
    output [1:0]databits;
    input clk_c;
    input parity_en;
    input n1506;
    input \wb_data_from_master[1] ;
    input [2:0]tx_cnt;
    input n31;
    output n16;
    input \wb_data_from_master[0] ;
    output n10267;
    output overrun_err;
    input n10221;
    input rx_rdy;
    input uart_rx_c;
    output frame_err;
    output break_int;
    output [7:0]RBR;
    input n3397;
    input n10204;
    output parity_err;
    input n10626;
    input parity_even;
    input parity_stick;
    input \divisor[7] ;
    input \divisor[5] ;
    input \divisor[6] ;
    input \divisor[3] ;
    input \divisor[4] ;
    input \divisor[1] ;
    input \divisor[2] ;
    input \divisor[0] ;
    input n3618;
    
    wire sin_d0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(109[14:20])
    wire [15:0]counter;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(144[17:24])
    wire [3:0]databit_recved_num;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(100[26:44])
    wire [7:0]rsr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(101[28:31])
    wire rx_idle;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(104[14:21])
    wire rx_frame_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(103[14:26])
    wire hunt_one;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(108[14:22])
    wire rx_frame_err_d1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(111[14:29])
    wire rx_parity_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(102[14:27])
    wire sampled_once;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(117[14:26])
    wire hunt;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(107[14:18])
    wire rx_idle_d1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(112[14:24])
    wire sin_d0_delay;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/rxcver.v(147[17:29])
    wire [7:0]n343;
    
    wire n3513, n63, n5838, n8925, n10235, n46;
    wire [15:0]n448;
    
    wire GND_net;
    wire [15:0]n128;
    
    wire n8082, n49, n9172, n10263, n9173, n9438, n9406, n7637, 
        n3469, n10215, n8929, n26, n25, n30, n8109;
    wire [15:0]n1089;
    
    wire n8110, n8111, n8112, n41, n8452, n8113, n8590, n3336, 
        n3503;
    wire [2:0]n15;
    
    wire n3621, VCC_net, n8595;
    wire [3:0]n18;
    
    wire n3603, n3601, n20_adj_0, n3599, n7562;
    wire [7:0]n379;
    
    wire n3382, n3619, n8114, n9214, n5, n1_adj_0, n8282, n3691, 
        n3, n8115, n8116, n4, n2379, n10155, n372;
    wire [15:0]n1179;
    wire [15:0]n1052;
    
    wire n10211, n2_adj_0, n7901, n7902, n7903, n414, n8077, n8078, 
        n8079, n8076, n8075, n8080, n8, n7, n6, n8081, n10154, 
        n10153, n10, n14;
    
    LUT4 i9 (.A(n63), .B(n343[3]), .C(sin_d0), .D(n343[4]), .Z(n3513)) /* synthesis lut_function=(!((B (C (D))+!B (C+!(D)))+!A)), syn_module_defined=1 */ ;
    defparam i9.init = 16'h0a88;
    LUT4 i8617_2_lut (.A(sin_d0), .B(n343[4]), .Z(n5838)) /* synthesis lut_function=(!(A+(B))), syn_module_defined=1 */ ;
    defparam i8617_2_lut.init = 16'h1111;
    LUT4 i7 (.A(n343[3]), .B(n10235), .C(n63), .D(n46), .Z(n8925)) /* synthesis lut_function=(!(A (B (C)+!B !((D)+!C))+!A (B+!(D)))), syn_module_defined=1 */ ;
    defparam i7.init = 16'h3b0a;
    CCU2D add_513_17 (.A0(n343[0]), .B0(n128[15]), .C0(n343[3]), .D0(counter[15]), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n8082), 
          .S0(n448[15])) /* synthesis syn_module_defined=1 */ ;
    defparam add_513_17.INIT0 = 16'h0bfb;
    defparam add_513_17.INIT1 = 16'h0000;
    defparam add_513_17.INJECT1_0 = "NO";
    defparam add_513_17.INJECT1_1 = "NO";
    LUT4 i6 (.A(n10263), .B(n9172), .C(databits[0]), .D(n9173), .Z(n49)) /* synthesis lut_function=(A (B)+!A (B+!(C+!(D)))), syn_module_defined=1 */ ;
    defparam i6.init = 16'hcdcc;
    LUT4 i5 (.A(databit_recved_num[0]), .B(databits[0]), .C(n9438), .D(n9406), 
         .Z(n9172)) /* synthesis lut_function=(!(A+((C (D))+!B))), syn_module_defined=1 */ ;
    defparam i5.init = 16'h0444;
    FD1P3IX rsr_i0_i0_i1 (.D(rsr[2]), .SP(n3469), .CD(n7637), .CK(clk_c), 
            .Q(rsr[1])) /* synthesis syn_module_defined=1 */ ;
    defparam rsr_i0_i0_i1.GSR = "ENABLED";
    FD1P3IX rsr_i0_i0_i2 (.D(rsr[3]), .SP(n3469), .CD(n7637), .CK(clk_c), 
            .Q(rsr[2])) /* synthesis syn_module_defined=1 */ ;
    defparam rsr_i0_i0_i2.GSR = "ENABLED";
    LUT4 i8358_4_lut (.A(databits[1]), .B(databit_recved_num[2]), .C(databit_recved_num[1]), 
         .D(databit_recved_num[3]), .Z(n9438)) /* synthesis lut_function=((B+(C+!(D)))+!A), syn_module_defined=1 */ ;
    defparam i8358_4_lut.init = 16'hfdff;
    FD1P3IX rsr_i0_i0_i3 (.D(rsr[4]), .SP(n3469), .CD(n7637), .CK(clk_c), 
            .Q(rsr[3])) /* synthesis syn_module_defined=1 */ ;
    defparam rsr_i0_i0_i3.GSR = "ENABLED";
    FD1P3IX rsr_i0_i0_i4 (.D(rsr[5]), .SP(n3469), .CD(n7637), .CK(clk_c), 
            .Q(rsr[4])) /* synthesis syn_module_defined=1 */ ;
    defparam rsr_i0_i0_i4.GSR = "ENABLED";
    LUT4 i56_4_lut (.A(parity_en), .B(n343[2]), .C(n10235), .D(n10215), 
         .Z(n8929)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i56_4_lut.init = 16'hcac0;
    CCU2D add_505_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(n1089[0]), .B1(n26), .C1(n25), .D1(n30), .COUT(n8109), 
          .S1(n128[0])) /* synthesis syn_module_defined=1 */ ;
    defparam add_505_1.INIT0 = 16'hF000;
    defparam add_505_1.INIT1 = 16'h5556;
    defparam add_505_1.INJECT1_0 = "NO";
    defparam add_505_1.INJECT1_1 = "NO";
    FD1P3IX rsr_i0_i0_i5 (.D(rsr[6]), .SP(n3469), .CD(n7637), .CK(clk_c), 
            .Q(rsr[5])) /* synthesis syn_module_defined=1 */ ;
    defparam rsr_i0_i0_i5.GSR = "ENABLED";
    CCU2D add_505_3 (.A0(n1089[1]), .B0(n26), .C0(n25), .D0(n30), .A1(n1089[2]), 
          .B1(n26), .C1(n25), .D1(n30), .CIN(n8109), .COUT(n8110), 
          .S0(n128[1]), .S1(n128[2])) /* synthesis syn_module_defined=1 */ ;
    defparam add_505_3.INIT0 = 16'h5556;
    defparam add_505_3.INIT1 = 16'h5556;
    defparam add_505_3.INJECT1_0 = "NO";
    defparam add_505_3.INJECT1_1 = "NO";
    CCU2D add_505_5 (.A0(n1089[3]), .B0(n26), .C0(n25), .D0(n30), .A1(n1089[4]), 
          .B1(n26), .C1(n25), .D1(n30), .CIN(n8110), .COUT(n8111), 
          .S0(n128[3]), .S1(n128[4])) /* synthesis syn_module_defined=1 */ ;
    defparam add_505_5.INIT0 = 16'h5556;
    defparam add_505_5.INIT1 = 16'h5556;
    defparam add_505_5.INJECT1_0 = "NO";
    defparam add_505_5.INJECT1_1 = "NO";
    CCU2D add_505_7 (.A0(n1089[5]), .B0(n26), .C0(n25), .D0(n30), .A1(n1089[6]), 
          .B1(n26), .C1(n25), .D1(n30), .CIN(n8111), .COUT(n8112), 
          .S0(n128[5]), .S1(n128[6])) /* synthesis syn_module_defined=1 */ ;
    defparam add_505_7.INIT0 = 16'h5556;
    defparam add_505_7.INIT1 = 16'h5556;
    defparam add_505_7.INJECT1_0 = "NO";
    defparam add_505_7.INJECT1_1 = "NO";
    FD1P3IX rsr_i0_i0_i6 (.D(rsr[7]), .SP(n3469), .CD(n7637), .CK(clk_c), 
            .Q(rsr[6])) /* synthesis syn_module_defined=1 */ ;
    defparam rsr_i0_i0_i6.GSR = "ENABLED";
    FD1P3AX lcr___i2 (.D(\wb_data_from_master[1] ), .SP(n1506), .CK(clk_c), 
            .Q(databits[1])) /* synthesis syn_module_defined=1 */ ;
    defparam lcr___i2.GSR = "ENABLED";
    LUT4 i8576_4_lut (.A(n343[1]), .B(n49), .C(n10235), .D(n343[4]), 
         .Z(n41)) /* synthesis lut_function=(A ((C+(D))+!B)+!A !(C+!(D))), syn_module_defined=1 */ ;
    defparam i8576_4_lut.init = 16'hafa2;
    FD1P3IX rsr_i0_i0_i7 (.D(sin_d0), .SP(n3469), .CD(n7637), .CK(clk_c), 
            .Q(rsr[7])) /* synthesis syn_module_defined=1 */ ;
    defparam rsr_i0_i0_i7.GSR = "ENABLED";
    LUT4 i2_3_lut (.A(sin_d0), .B(rx_idle), .C(n63), .Z(n8452)) /* synthesis lut_function=(!((B+!(C))+!A)), syn_module_defined=1 */ ;
    defparam i2_3_lut.init = 16'h2020;
    CCU2D add_505_9 (.A0(n1089[7]), .B0(n26), .C0(n25), .D0(n30), .A1(n1089[8]), 
          .B1(n26), .C1(n25), .D1(n30), .CIN(n8112), .COUT(n8113), 
          .S0(n128[7]), .S1(n128[8])) /* synthesis syn_module_defined=1 */ ;
    defparam add_505_9.INIT0 = 16'h5556;
    defparam add_505_9.INIT1 = 16'h5556;
    defparam add_505_9.INJECT1_0 = "NO";
    defparam add_505_9.INJECT1_1 = "NO";
    LUT4 i2_3_lut_rep_184 (.A(n25), .B(n30), .C(n26), .Z(n10235)) /* synthesis lut_function=(A+(B+(C))), syn_module_defined=1 */ ;
    defparam i2_3_lut_rep_184.init = 16'hfefe;
    LUT4 i3_4_lut (.A(rx_frame_err), .B(hunt_one), .C(sin_d0), .D(rx_frame_err_d1), 
         .Z(n8590)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)), syn_module_defined=1 */ ;
    defparam i3_4_lut.init = 16'h0008;
    FD1P3AY i1095 (.D(n3336), .SP(n3503), .CK(clk_c), .Q(rx_parity_err)) /* synthesis syn_module_defined=1 */ ;
    defparam i1095.GSR = "ENABLED";
    LUT4 i4584_2_lut_4_lut (.A(n25), .B(n30), .C(n26), .D(counter[10]), 
         .Z(n1089[10])) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C (D)))), syn_module_defined=1 */ ;
    defparam i4584_2_lut_4_lut.init = 16'hfe00;
    LUT4 i6971_3_lut (.A(tx_cnt[1]), .B(n31), .C(tx_cnt[0]), .Z(n15[1])) /* synthesis lut_function=(A (B+!(C))+!A !(B+!(C))), syn_module_defined=1 */ ;
    defparam i6971_3_lut.init = 16'h9a9a;
    LUT4 i6978_4_lut (.A(tx_cnt[2]), .B(tx_cnt[0]), .C(tx_cnt[1]), .D(n31), 
         .Z(n16)) /* synthesis lut_function=(A (((D)+!C)+!B)+!A !(((D)+!C)+!B)), syn_module_defined=1 */ ;
    defparam i6978_4_lut.init = 16'haa6a;
    FD1P3AX lcr___i1 (.D(\wb_data_from_master[0] ), .SP(n1506), .CK(clk_c), 
            .Q(databits[0])) /* synthesis syn_module_defined=1 */ ;
    defparam lcr___i1.GSR = "ENABLED";
    LUT4 i2614_4_lut (.A(overrun_err), .B(rx_rdy), .C(n10267), .D(n10221), 
         .Z(n3621)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2614_4_lut.init = 16'hc0ca;
    IFS1P3DX sin_d0_c (.D(uart_rx_c), .SP(VCC_net), .SCLK(clk_c), .CD(GND_net), 
            .Q(sin_d0)) /* synthesis syn_module_defined=1 */ ;
    defparam sin_d0_c.GSR = "ENABLED";
    LUT4 i1_2_lut_adj_0 (.A(n31), .B(tx_cnt[0]), .Z(n8595)) /* synthesis lut_function=(A (B)+!A !(B)), syn_module_defined=1 */ ;
    defparam i1_2_lut_adj_0.init = 16'h9999;
    LUT4 i6935_2_lut (.A(n63), .B(databit_recved_num[0]), .Z(n18[0])) /* synthesis lut_function=(!(A (B)+!A !(B))), syn_module_defined=1 */ ;
    defparam i6935_2_lut.init = 16'h6666;
    LUT4 i2596_4_lut (.A(frame_err), .B(rx_frame_err), .C(n10267), .D(n10221), 
         .Z(n3603)) /* synthesis lut_function=(A (C+!(D))+!A (B (C))), syn_module_defined=1 */ ;
    defparam i2596_4_lut.init = 16'he0ea;
    LUT4 i2594_4_lut (.A(break_int), .B(hunt_one), .C(n10267), .D(n10221), 
         .Z(n3601)) /* synthesis lut_function=(A (C+!(D))+!A !(B+!(C))), syn_module_defined=1 */ ;
    defparam i2594_4_lut.init = 16'hb0ba;
    LUT4 i4 (.A(sin_d0), .B(n7562), .C(n20_adj_0), .D(sampled_once), 
         .Z(n3599)) /* synthesis lut_function=(A (B)+!A (B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i4.init = 16'hdddc;
    FD1P3AX rbr_i0_i0_i0 (.D(n379[0]), .SP(n10267), .CK(clk_c), .Q(RBR[0])) /* synthesis syn_module_defined=1 */ ;
    defparam rbr_i0_i0_i0.GSR = "ENABLED";
    FD1S3AY rx_idle_c (.D(n343[0]), .CK(clk_c), .Q(rx_idle)) /* synthesis syn_module_defined=1 */ ;
    defparam rx_idle_c.GSR = "ENABLED";
    FD1S3AX hunt_c (.D(n3599), .CK(clk_c), .Q(hunt)) /* synthesis syn_module_defined=1 */ ;
    defparam hunt_c.GSR = "ENABLED";
    FD1S3AX break_int_int (.D(n3601), .CK(clk_c), .Q(break_int)) /* synthesis syn_module_defined=1 */ ;
    defparam break_int_int.GSR = "ENABLED";
    FD1S3AX frame_err_int (.D(n3603), .CK(clk_c), .Q(frame_err)) /* synthesis syn_module_defined=1 */ ;
    defparam frame_err_int.GSR = "ENABLED";
    FD1P3IX databit_recved_num_757__i0 (.D(n18[0]), .SP(n3382), .CD(n7637), 
            .CK(clk_c), .Q(databit_recved_num[0])) /* synthesis syn_module_defined=1 */ ;
    defparam databit_recved_num_757__i0.GSR = "ENABLED";
    FD1P3IX tx_cnt_758__i0 (.D(n8595), .SP(n3397), .CD(n10204), .CK(clk_c), 
            .Q(tx_cnt[0])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_cnt_758__i0.GSR = "ENABLED";
    FD1S3AX parity_err_int (.D(n3619), .CK(clk_c), .Q(parity_err)) /* synthesis syn_module_defined=1 */ ;
    defparam parity_err_int.GSR = "ENABLED";
    FD1S3AX overrun_err_int (.D(n3621), .CK(clk_c), .Q(overrun_err)) /* synthesis syn_module_defined=1 */ ;
    defparam overrun_err_int.GSR = "ENABLED";
    FD1S3AY rx_idle_d1_c (.D(rx_idle), .CK(clk_c), .Q(rx_idle_d1)) /* synthesis syn_module_defined=1 */ ;
    defparam rx_idle_d1_c.GSR = "ENABLED";
    FD1S3AY rx_frame_err_d1_c (.D(rx_frame_err), .CK(clk_c), .Q(rx_frame_err_d1)) /* synthesis syn_module_defined=1 */ ;
    defparam rx_frame_err_d1_c.GSR = "ENABLED";
    CCU2D add_505_11 (.A0(counter[9]), .B0(n26), .C0(n25), .D0(n30), 
          .A1(n1089[10]), .B1(n26), .C1(n25), .D1(n30), .CIN(n8113), 
          .COUT(n8114), .S0(n128[9]), .S1(n128[10])) /* synthesis syn_module_defined=1 */ ;
    defparam add_505_11.INIT0 = 16'h5556;
    defparam add_505_11.INIT1 = 16'h5556;
    defparam add_505_11.INJECT1_0 = "NO";
    defparam add_505_11.INJECT1_1 = "NO";
    FD1S3AX sin_d0_delay_c (.D(sin_d0), .CK(clk_c), .Q(sin_d0_delay)) /* synthesis syn_module_defined=1 */ ;
    defparam sin_d0_delay_c.GSR = "ENABLED";
    FD1S3AX counter_i0 (.D(n448[0]), .CK(clk_c), .Q(counter[0])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i0.GSR = "ENABLED";
    LUT4 i1_2_lut_4_lut (.A(n25), .B(n30), .C(n26), .D(n343[4]), .Z(n9214)) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C (D)))), syn_module_defined=1 */ ;
    defparam i1_2_lut_4_lut.init = 16'hfe00;
    LUT4 i3 (.A(rx_idle), .B(hunt), .Z(n20_adj_0)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i3.init = 16'h8888;
    FD1P3IX tx_cnt_758__i1 (.D(n15[1]), .SP(n3397), .CD(n10204), .CK(clk_c), 
            .Q(tx_cnt[1])) /* synthesis syn_module_defined=1 */ ;
    defparam tx_cnt_758__i1.GSR = "ENABLED";
    FD1S3AX sampled_once_c (.D(n8590), .CK(clk_c), .Q(sampled_once)) /* synthesis syn_module_defined=1 */ ;
    defparam sampled_once_c.GSR = "ENABLED";
    LUT4 mux_120_Mux_0_i3_3_lut (.A(n1_adj_0), .B(n5), .C(databits[1]), 
         .Z(n379[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_120_Mux_0_i3_3_lut.init = 16'hcaca;
    LUT4 mux_120_Mux_0_i2_3_lut (.A(rsr[1]), .B(rsr[0]), .C(databits[0]), 
         .Z(n5)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_120_Mux_0_i2_3_lut.init = 16'hcaca;
    FD1P3IX hunt_one_c (.D(n10626), .SP(n8452), .CD(hunt), .CK(clk_c), 
            .Q(hunt_one)) /* synthesis syn_module_defined=1 */ ;
    defparam hunt_one_c.GSR = "ENABLED";
    FD1P3AX rbr_i0_i0_i7 (.D(n8282), .SP(n10267), .CK(clk_c), .Q(RBR[7])) /* synthesis syn_module_defined=1 */ ;
    defparam rbr_i0_i0_i7.GSR = "ENABLED";
    FD1P3IX rbr_i0_i0_i6 (.D(n3), .SP(n10267), .CD(n3691), .CK(clk_c), 
            .Q(RBR[6])) /* synthesis syn_module_defined=1 */ ;
    defparam rbr_i0_i0_i6.GSR = "ENABLED";
    LUT4 i4586_2_lut_4_lut (.A(n25), .B(n30), .C(n26), .D(counter[8]), 
         .Z(n1089[8])) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C (D)))), syn_module_defined=1 */ ;
    defparam i4586_2_lut_4_lut.init = 16'hfe00;
    LUT4 i4582_2_lut_4_lut (.A(n25), .B(n30), .C(n26), .D(counter[12]), 
         .Z(n1089[12])) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C (D)))), syn_module_defined=1 */ ;
    defparam i4582_2_lut_4_lut.init = 16'hfe00;
    CCU2D add_505_13 (.A0(counter[11]), .B0(n26), .C0(n25), .D0(n30), 
          .A1(n1089[12]), .B1(n26), .C1(n25), .D1(n30), .CIN(n8114), 
          .COUT(n8115), .S0(n128[11]), .S1(n128[12])) /* synthesis syn_module_defined=1 */ ;
    defparam add_505_13.INIT0 = 16'h5556;
    defparam add_505_13.INIT1 = 16'h5556;
    defparam add_505_13.INJECT1_0 = "NO";
    defparam add_505_13.INJECT1_1 = "NO";
    CCU2D add_505_15 (.A0(counter[13]), .B0(n26), .C0(n25), .D0(n30), 
          .A1(n1089[14]), .B1(n26), .C1(n25), .D1(n30), .CIN(n8115), 
          .COUT(n8116), .S0(n128[13]), .S1(n128[14])) /* synthesis syn_module_defined=1 */ ;
    defparam add_505_15.INIT0 = 16'h5556;
    defparam add_505_15.INIT1 = 16'h5556;
    defparam add_505_15.INJECT1_0 = "NO";
    defparam add_505_15.INJECT1_1 = "NO";
    LUT4 i4580_2_lut_4_lut (.A(n25), .B(n30), .C(n26), .D(counter[14]), 
         .Z(n1089[14])) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C (D)))), syn_module_defined=1 */ ;
    defparam i4580_2_lut_4_lut.init = 16'hfe00;
    FD1P3AX rbr_i0_i0_i1 (.D(n379[1]), .SP(n10267), .CK(clk_c), .Q(RBR[1])) /* synthesis syn_module_defined=1 */ ;
    defparam rbr_i0_i0_i1.GSR = "ENABLED";
    FD1P3AX rbr_i0_i0_i2 (.D(n379[2]), .SP(n10267), .CK(clk_c), .Q(RBR[2])) /* synthesis syn_module_defined=1 */ ;
    defparam rbr_i0_i0_i2.GSR = "ENABLED";
    FD1P3AX rbr_i0_i0_i3 (.D(n379[3]), .SP(n10267), .CK(clk_c), .Q(RBR[3])) /* synthesis syn_module_defined=1 */ ;
    defparam rbr_i0_i0_i3.GSR = "ENABLED";
    FD1P3AX rbr_i0_i0_i4 (.D(n379[4]), .SP(n10267), .CK(clk_c), .Q(RBR[4])) /* synthesis syn_module_defined=1 */ ;
    defparam rbr_i0_i0_i4.GSR = "ENABLED";
    FD1P3AX rbr_i0_i0_i5 (.D(n379[5]), .SP(n10267), .CK(clk_c), .Q(RBR[5])) /* synthesis syn_module_defined=1 */ ;
    defparam rbr_i0_i0_i5.GSR = "ENABLED";
    CCU2D add_505_17 (.A0(counter[15]), .B0(n26), .C0(n25), .D0(n30), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n8116), 
          .S0(n128[15])) /* synthesis syn_module_defined=1 */ ;
    defparam add_505_17.INIT0 = 16'h5556;
    defparam add_505_17.INIT1 = 16'h0000;
    defparam add_505_17.INJECT1_0 = "NO";
    defparam add_505_17.INJECT1_1 = "NO";
    FD1S3AX counter_i1 (.D(n448[1]), .CK(clk_c), .Q(counter[1])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i1.GSR = "ENABLED";
    FD1S3AX counter_i2 (.D(n448[2]), .CK(clk_c), .Q(counter[2])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i2.GSR = "ENABLED";
    FD1S3AX counter_i3 (.D(n448[3]), .CK(clk_c), .Q(counter[3])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i3.GSR = "ENABLED";
    FD1S3AX counter_i4 (.D(n448[4]), .CK(clk_c), .Q(counter[4])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i4.GSR = "ENABLED";
    FD1S3AX counter_i5 (.D(n448[5]), .CK(clk_c), .Q(counter[5])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i5.GSR = "ENABLED";
    FD1S3AX counter_i6 (.D(n448[6]), .CK(clk_c), .Q(counter[6])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i6.GSR = "ENABLED";
    FD1S3AX counter_i7 (.D(n448[7]), .CK(clk_c), .Q(counter[7])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i7.GSR = "ENABLED";
    FD1S3AX counter_i8 (.D(n448[8]), .CK(clk_c), .Q(counter[8])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i8.GSR = "ENABLED";
    FD1S3AX counter_i9 (.D(n448[9]), .CK(clk_c), .Q(counter[9])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i9.GSR = "ENABLED";
    FD1S3AX counter_i10 (.D(n448[10]), .CK(clk_c), .Q(counter[10])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i10.GSR = "ENABLED";
    FD1S3AX counter_i11 (.D(n448[11]), .CK(clk_c), .Q(counter[11])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i11.GSR = "ENABLED";
    FD1S3AX counter_i12 (.D(n448[12]), .CK(clk_c), .Q(counter[12])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i12.GSR = "ENABLED";
    FD1S3AX counter_i13 (.D(n448[13]), .CK(clk_c), .Q(counter[13])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i13.GSR = "ENABLED";
    FD1S3AX counter_i14 (.D(n448[14]), .CK(clk_c), .Q(counter[14])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i14.GSR = "ENABLED";
    FD1S3AX counter_i15 (.D(n448[15]), .CK(clk_c), .Q(counter[15])) /* synthesis syn_module_defined=1 */ ;
    defparam counter_i15.GSR = "ENABLED";
    LUT4 i1_4_lut (.A(n63), .B(n4), .C(sin_d0), .D(n343[4]), .Z(n3503)) /* synthesis lut_function=(!((B (C (D))+!B (C+!(D)))+!A)), syn_module_defined=1 */ ;
    defparam i1_4_lut.init = 16'h0a88;
    LUT4 i1_2_lut (.A(n343[2]), .B(n343[1]), .Z(n4)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i8624_4_lut (.A(sin_d0), .B(n343[1]), .C(n63), .D(n343[4]), 
         .Z(n3382)) /* synthesis lut_function=(!(A ((D)+!B)+!A !(B (C+!(D))+!B (C (D))))), syn_module_defined=1 */ ;
    defparam i8624_4_lut.init = 16'h50cc;
    LUT4 i2372_4_lut (.A(sin_d0), .B(parity_even), .C(n343[4]), .D(n2379), 
         .Z(n3336)) /* synthesis lut_function=(!(A (B (C+(D))+!B !(C+!(D)))+!A (B (C+!(D))+!B !(C+(D))))), syn_module_defined=1 */ ;
    defparam i2372_4_lut.init = 16'h353a;
    LUT4 i1459_4_lut (.A(rx_parity_err), .B(parity_even), .C(parity_stick), 
         .D(n343[2]), .Z(n2379)) /* synthesis lut_function=(!(A (B (C (D)))+!A (B+!(C (D))))), syn_module_defined=1 */ ;
    defparam i1459_4_lut.init = 16'h3aaa;
    LUT4 i1_3_lut (.A(sin_d0), .B(n63), .C(n343[4]), .Z(n7637)) /* synthesis lut_function=(!(A+!(B (C)))), syn_module_defined=1 */ ;
    defparam i1_3_lut.init = 16'h4040;
    LUT4 i6943_3_lut (.A(databit_recved_num[1]), .B(n63), .C(databit_recved_num[0]), 
         .Z(n18[1])) /* synthesis lut_function=(!(A (B (C))+!A !(B (C)))), syn_module_defined=1 */ ;
    defparam i6943_3_lut.init = 16'h6a6a;
    FD1S3AY cs_state_FSM_i1 (.D(n10155), .CK(clk_c), .Q(n343[0])) /* synthesis syn_module_defined=1 */ ;
    defparam cs_state_FSM_i1.GSR = "ENABLED";
    LUT4 mux_502_i8_3_lut (.A(\divisor[7] ), .B(counter[7]), .C(n10235), 
         .Z(n1089[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_502_i8_3_lut.init = 16'hcaca;
    FD1P3IX rsr_i0_i0_i0 (.D(rsr[1]), .SP(n3469), .CD(n7637), .CK(clk_c), 
            .Q(rsr[0])) /* synthesis syn_module_defined=1 */ ;
    defparam rsr_i0_i0_i0.GSR = "ENABLED";
    FD1P3IX databit_recved_num_757__i3 (.D(n18[3]), .SP(n3382), .CD(n7637), 
            .CK(clk_c), .Q(databit_recved_num[3])) /* synthesis syn_module_defined=1 */ ;
    defparam databit_recved_num_757__i3.GSR = "ENABLED";
    LUT4 i1_3_lut_4_lut (.A(n343[1]), .B(n49), .C(parity_en), .D(n343[2]), 
         .Z(n46)) /* synthesis lut_function=(A (B ((D)+!C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam i1_3_lut_4_lut.init = 16'hff08;
    FD1P3IX databit_recved_num_757__i2 (.D(n18[2]), .SP(n3382), .CD(n7637), 
            .CK(clk_c), .Q(databit_recved_num[2])) /* synthesis syn_module_defined=1 */ ;
    defparam databit_recved_num_757__i2.GSR = "ENABLED";
    FD1P3IX databit_recved_num_757__i1 (.D(n18[1]), .SP(n3382), .CD(n7637), 
            .CK(clk_c), .Q(databit_recved_num[1])) /* synthesis syn_module_defined=1 */ ;
    defparam databit_recved_num_757__i1.GSR = "ENABLED";
    FD1S3AX cs_state_FSM_i2 (.D(n41), .CK(clk_c), .Q(n343[1])) /* synthesis syn_module_defined=1 */ ;
    defparam cs_state_FSM_i2.GSR = "ENABLED";
    FD1S3AX cs_state_FSM_i3 (.D(n8929), .CK(clk_c), .Q(n343[2])) /* synthesis syn_module_defined=1 */ ;
    defparam cs_state_FSM_i3.GSR = "ENABLED";
    LUT4 mux_502_i6_3_lut (.A(\divisor[5] ), .B(counter[5]), .C(n10235), 
         .Z(n1089[5])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_502_i6_3_lut.init = 16'hcaca;
    LUT4 mux_502_i7_3_lut (.A(\divisor[6] ), .B(counter[6]), .C(n10235), 
         .Z(n1089[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_502_i7_3_lut.init = 16'hcaca;
    FD1S3AX cs_state_FSM_i4 (.D(n8925), .CK(clk_c), .Q(n343[3])) /* synthesis syn_module_defined=1 */ ;
    defparam cs_state_FSM_i4.GSR = "ENABLED";
    FD1P3AX i1113 (.D(n5838), .SP(n3513), .CK(clk_c), .Q(rx_frame_err)) /* synthesis syn_module_defined=1 */ ;
    defparam i1113.GSR = "ENABLED";
    FD1S3AX cs_state_FSM_i5 (.D(n372), .CK(clk_c), .Q(n343[4])) /* synthesis syn_module_defined=1 */ ;
    defparam cs_state_FSM_i5.GSR = "ENABLED";
    LUT4 mux_502_i4_3_lut (.A(\divisor[3] ), .B(counter[3]), .C(n10235), 
         .Z(n1089[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_502_i4_3_lut.init = 16'hcaca;
    LUT4 mux_502_i5_3_lut (.A(\divisor[4] ), .B(counter[4]), .C(n10235), 
         .Z(n1089[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_502_i5_3_lut.init = 16'hcaca;
    LUT4 mux_502_i2_3_lut (.A(\divisor[1] ), .B(counter[1]), .C(n10235), 
         .Z(n1089[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_502_i2_3_lut.init = 16'hcaca;
    LUT4 i8319_2_lut_rep_212 (.A(databit_recved_num[3]), .B(databit_recved_num[2]), 
         .Z(n10263)) /* synthesis lut_function=(A+!(B)), syn_module_defined=1 */ ;
    defparam i8319_2_lut_rep_212.init = 16'hbbbb;
    LUT4 i8328_3_lut_4_lut (.A(databit_recved_num[3]), .B(databit_recved_num[2]), 
         .C(databits[1]), .D(databit_recved_num[1]), .Z(n9406)) /* synthesis lut_function=(A+((C+!(D))+!B)), syn_module_defined=1 */ ;
    defparam i8328_3_lut_4_lut.init = 16'hfbff;
    LUT4 i1_4_lut_3_lut (.A(databit_recved_num[1]), .B(databits[1]), .C(databit_recved_num[0]), 
         .Z(n9173)) /* synthesis lut_function=(A (B (C))+!A !(B+!(C))), syn_module_defined=1 */ ;
    defparam i1_4_lut_3_lut.init = 16'h9090;
    LUT4 mux_502_i3_3_lut (.A(\divisor[2] ), .B(counter[2]), .C(n10235), 
         .Z(n1089[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_502_i3_3_lut.init = 16'hcaca;
    LUT4 mux_502_i1_3_lut (.A(\divisor[0] ), .B(counter[0]), .C(n10235), 
         .Z(n1089[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_502_i1_3_lut.init = 16'hcaca;
    LUT4 mux_510_i4_3_lut (.A(n1052[3]), .B(counter[3]), .C(n343[3]), 
         .Z(n1179[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_510_i4_3_lut.init = 16'hcaca;
    LUT4 i6957_3_lut (.A(databit_recved_num[3]), .B(databit_recved_num[2]), 
         .C(n10211), .Z(n18[3])) /* synthesis lut_function=(!(A (B (C))+!A !(B (C)))), syn_module_defined=1 */ ;
    defparam i6957_3_lut.init = 16'h6a6a;
    LUT4 mux_498_i4_3_lut (.A(n128[3]), .B(\divisor[3] ), .C(n343[0]), 
         .Z(n1052[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_498_i4_3_lut.init = 16'hcaca;
    LUT4 mux_510_i5_3_lut (.A(n1052[4]), .B(counter[4]), .C(n343[3]), 
         .Z(n1179[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_510_i5_3_lut.init = 16'hcaca;
    LUT4 mux_498_i5_3_lut (.A(n128[4]), .B(\divisor[4] ), .C(n343[0]), 
         .Z(n1052[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_498_i5_3_lut.init = 16'hcaca;
    LUT4 i1_4_lut_adj_0 (.A(n63), .B(n343[1]), .C(sin_d0), .D(n343[4]), 
         .Z(n3469)) /* synthesis lut_function=(!((B (C (D))+!B (C+!(D)))+!A)), syn_module_defined=1 */ ;
    defparam i1_4_lut_adj_0.init = 16'h0a88;
    LUT4 mux_120_Mux_5_i3_3_lut_4_lut (.A(rsr[7]), .B(databits[0]), .C(databits[1]), 
         .D(n2_adj_0), .Z(n379[5])) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A (C (D))), syn_module_defined=1 */ ;
    defparam mux_120_Mux_5_i3_3_lut_4_lut.init = 16'hf808;
    LUT4 mux_498_i1_3_lut (.A(n128[0]), .B(\divisor[0] ), .C(n343[0]), 
         .Z(n1052[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_498_i1_3_lut.init = 16'hcaca;
    LUT4 i2_2_lut_3_lut (.A(rsr[7]), .B(databits[0]), .C(databits[1]), 
         .Z(n8282)) /* synthesis lut_function=(A (B (C))), syn_module_defined=1 */ ;
    defparam i2_2_lut_3_lut.init = 16'h8080;
    LUT4 i1_2_lut_rep_216 (.A(rx_idle), .B(rx_idle_d1), .Z(n10267)) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_216.init = 16'h2222;
    LUT4 i1_2_lut_3_lut (.A(rx_idle), .B(rx_idle_d1), .C(databits[1]), 
         .Z(n3691)) /* synthesis lut_function=(!((B+(C))+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut.init = 16'h0202;
    LUT4 i2_3_lut_rep_160 (.A(databit_recved_num[0]), .B(n63), .C(databit_recved_num[1]), 
         .Z(n10211)) /* synthesis lut_function=(A (B (C))), syn_module_defined=1 */ ;
    defparam i2_3_lut_rep_160.init = 16'h8080;
    LUT4 i6950_2_lut_4_lut (.A(databit_recved_num[0]), .B(n63), .C(databit_recved_num[1]), 
         .D(databit_recved_num[2]), .Z(n18[2])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))), syn_module_defined=1 */ ;
    defparam i6950_2_lut_4_lut.init = 16'h7f80;
    CCU2D equal_17_0 (.A0(\divisor[7] ), .B0(counter[6]), .C0(GND_net), 
          .D0(GND_net), .A1(counter[15]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n7901)) /* synthesis syn_module_defined=1 */ ;
    defparam equal_17_0.INIT0 = 16'h9000;
    defparam equal_17_0.INIT1 = 16'h5555;
    defparam equal_17_0.INJECT1_0 = "NO";
    defparam equal_17_0.INJECT1_1 = "YES";
    CCU2D equal_17_13 (.A0(counter[14]), .B0(counter[13]), .C0(counter[12]), 
          .D0(counter[11]), .A1(counter[10]), .B1(counter[9]), .C1(counter[8]), 
          .D1(counter[7]), .CIN(n7901), .COUT(n7902)) /* synthesis syn_module_defined=1 */ ;
    defparam equal_17_13.INIT0 = 16'h0001;
    defparam equal_17_13.INIT1 = 16'h0001;
    defparam equal_17_13.INJECT1_0 = "YES";
    defparam equal_17_13.INJECT1_1 = "YES";
    CCU2D equal_17_15 (.A0(\divisor[6] ), .B0(counter[5]), .C0(\divisor[5] ), 
          .D0(counter[4]), .A1(\divisor[4] ), .B1(counter[3]), .C1(\divisor[3] ), 
          .D1(counter[2]), .CIN(n7902), .COUT(n7903)) /* synthesis syn_module_defined=1 */ ;
    defparam equal_17_15.INIT0 = 16'h9009;
    defparam equal_17_15.INIT1 = 16'h9009;
    defparam equal_17_15.INJECT1_0 = "YES";
    defparam equal_17_15.INJECT1_1 = "YES";
    PFUMX i2612 (.BLUT(n3618), .ALUT(n414), .C0(n10267), .Z(n3619)) /* synthesis syn_module_defined=1 */ ;
    CCU2D add_513_7 (.A0(n1179[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(n1179[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n8077), 
          .COUT(n8078), .S0(n448[5]), .S1(n448[6])) /* synthesis syn_module_defined=1 */ ;
    defparam add_513_7.INIT0 = 16'h5555;
    defparam add_513_7.INIT1 = 16'h5555;
    defparam add_513_7.INJECT1_0 = "NO";
    defparam add_513_7.INJECT1_1 = "NO";
    LUT4 mux_510_i2_3_lut (.A(n1052[1]), .B(counter[1]), .C(n343[3]), 
         .Z(n1179[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_510_i2_3_lut.init = 16'hcaca;
    LUT4 mux_498_i2_3_lut (.A(n128[1]), .B(\divisor[1] ), .C(n343[0]), 
         .Z(n1052[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_498_i2_3_lut.init = 16'hcaca;
    LUT4 mux_510_i3_3_lut (.A(n1052[2]), .B(counter[2]), .C(n343[3]), 
         .Z(n1179[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_510_i3_3_lut.init = 16'hcaca;
    LUT4 mux_498_i3_3_lut (.A(n128[2]), .B(\divisor[2] ), .C(n343[0]), 
         .Z(n1052[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_498_i3_3_lut.init = 16'hcaca;
    CCU2D add_513_9 (.A0(n1179[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(n343[0]), .B1(n128[8]), .C1(n343[3]), .D1(counter[8]), 
          .CIN(n8078), .COUT(n8079), .S0(n448[7]), .S1(n448[8])) /* synthesis syn_module_defined=1 */ ;
    defparam add_513_9.INIT0 = 16'h5555;
    defparam add_513_9.INIT1 = 16'h0bfb;
    defparam add_513_9.INJECT1_0 = "NO";
    defparam add_513_9.INJECT1_1 = "NO";
    CCU2D add_513_3 (.A0(n1179[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(n1179[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n8075), 
          .COUT(n8076), .S0(n448[1]), .S1(n448[2])) /* synthesis syn_module_defined=1 */ ;
    defparam add_513_3.INIT0 = 16'h5555;
    defparam add_513_3.INIT1 = 16'h5555;
    defparam add_513_3.INJECT1_0 = "NO";
    defparam add_513_3.INJECT1_1 = "NO";
    CCU2D equal_17_16 (.A0(\divisor[2] ), .B0(counter[1]), .C0(\divisor[1] ), 
          .D0(counter[0]), .A1(GND_net), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n7903), .S1(n63)) /* synthesis syn_module_defined=1 */ ;
    defparam equal_17_16.INIT0 = 16'h9009;
    defparam equal_17_16.INIT1 = 16'hFFFF;
    defparam equal_17_16.INJECT1_0 = "YES";
    defparam equal_17_16.INJECT1_1 = "NO";
    LUT4 mux_510_i8_3_lut (.A(n1052[7]), .B(counter[7]), .C(n343[3]), 
         .Z(n1179[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_510_i8_3_lut.init = 16'hcaca;
    LUT4 mux_498_i8_3_lut (.A(n128[7]), .B(\divisor[7] ), .C(n343[0]), 
         .Z(n1052[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_498_i8_3_lut.init = 16'hcaca;
    CCU2D add_513_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(n343[0]), .B1(n343[3]), .C1(counter[0]), .D1(n1052[0]), 
          .COUT(n8075), .S1(n448[0])) /* synthesis syn_module_defined=1 */ ;
    defparam add_513_1.INIT0 = 16'h0000;
    defparam add_513_1.INIT1 = 16'he2d1;
    defparam add_513_1.INJECT1_0 = "NO";
    defparam add_513_1.INJECT1_1 = "NO";
    CCU2D add_513_11 (.A0(n343[0]), .B0(n128[9]), .C0(n343[3]), .D0(counter[9]), 
          .A1(n343[0]), .B1(n128[10]), .C1(n343[3]), .D1(counter[10]), 
          .CIN(n8079), .COUT(n8080), .S0(n448[9]), .S1(n448[10])) /* synthesis syn_module_defined=1 */ ;
    defparam add_513_11.INIT0 = 16'h0bfb;
    defparam add_513_11.INIT1 = 16'h0bfb;
    defparam add_513_11.INJECT1_0 = "NO";
    defparam add_513_11.INJECT1_1 = "NO";
    LUT4 mux_510_i6_3_lut (.A(n1052[5]), .B(counter[5]), .C(n343[3]), 
         .Z(n1179[5])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_510_i6_3_lut.init = 16'hcaca;
    LUT4 mux_498_i6_3_lut (.A(n128[5]), .B(\divisor[5] ), .C(n343[0]), 
         .Z(n1052[5])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_498_i6_3_lut.init = 16'hcaca;
    LUT4 mux_510_i7_3_lut (.A(n1052[6]), .B(counter[6]), .C(n343[3]), 
         .Z(n1179[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_510_i7_3_lut.init = 16'hcaca;
    LUT4 mux_498_i7_3_lut (.A(n128[6]), .B(\divisor[6] ), .C(n343[0]), 
         .Z(n1052[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_498_i7_3_lut.init = 16'hcaca;
    LUT4 mux_120_Mux_5_i2_3_lut (.A(rsr[6]), .B(rsr[5]), .C(databits[0]), 
         .Z(n2_adj_0)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_120_Mux_5_i2_3_lut.init = 16'hcaca;
    LUT4 i1_2_lut_rep_164 (.A(n343[1]), .B(n49), .Z(n10215)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_164.init = 16'h8888;
    LUT4 mux_120_Mux_4_i3_3_lut (.A(n3), .B(n8), .C(databits[1]), .Z(n379[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_120_Mux_4_i3_3_lut.init = 16'hcaca;
    CCU2D add_513_5 (.A0(n1179[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(n1179[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n8076), 
          .COUT(n8077), .S0(n448[3]), .S1(n448[4])) /* synthesis syn_module_defined=1 */ ;
    defparam add_513_5.INIT0 = 16'h5555;
    defparam add_513_5.INIT1 = 16'h5555;
    defparam add_513_5.INJECT1_0 = "NO";
    defparam add_513_5.INJECT1_1 = "NO";
    LUT4 i132_3_lut (.A(parity_err), .B(parity_en), .C(rx_parity_err), 
         .Z(n414)) /* synthesis lut_function=(A (B)+!A (B (C))), syn_module_defined=1 */ ;
    defparam i132_3_lut.init = 16'hc8c8;
    LUT4 mux_120_Mux_6_i2_3_lut (.A(rsr[7]), .B(rsr[6]), .C(databits[0]), 
         .Z(n3)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_120_Mux_6_i2_3_lut.init = 16'hcaca;
    LUT4 mux_120_Mux_4_i2_3_lut (.A(rsr[5]), .B(rsr[4]), .C(databits[0]), 
         .Z(n8)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_120_Mux_4_i2_3_lut.init = 16'hcaca;
    LUT4 mux_120_Mux_3_i3_3_lut (.A(n2_adj_0), .B(n7), .C(databits[1]), 
         .Z(n379[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_120_Mux_3_i3_3_lut.init = 16'hcaca;
    LUT4 mux_120_Mux_3_i2_3_lut (.A(rsr[4]), .B(rsr[3]), .C(databits[0]), 
         .Z(n7)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_120_Mux_3_i2_3_lut.init = 16'hcaca;
    LUT4 mux_120_Mux_2_i3_3_lut (.A(n8), .B(n1_adj_0), .C(databits[1]), 
         .Z(n379[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_120_Mux_2_i3_3_lut.init = 16'hcaca;
    LUT4 mux_120_Mux_0_i1_3_lut (.A(rsr[3]), .B(rsr[2]), .C(databits[0]), 
         .Z(n1_adj_0)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_120_Mux_0_i1_3_lut.init = 16'hcaca;
    LUT4 mux_120_Mux_1_i3_3_lut (.A(n7), .B(n6), .C(databits[1]), .Z(n379[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_120_Mux_1_i3_3_lut.init = 16'hcaca;
    LUT4 mux_120_Mux_1_i2_3_lut (.A(rsr[2]), .B(rsr[1]), .C(databits[0]), 
         .Z(n6)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_120_Mux_1_i2_3_lut.init = 16'hcaca;
    CCU2D add_513_13 (.A0(n343[0]), .B0(n128[11]), .C0(n343[3]), .D0(counter[11]), 
          .A1(n343[0]), .B1(n128[12]), .C1(n343[3]), .D1(counter[12]), 
          .CIN(n8080), .COUT(n8081), .S0(n448[11]), .S1(n448[12])) /* synthesis syn_module_defined=1 */ ;
    defparam add_513_13.INIT0 = 16'h0bfb;
    defparam add_513_13.INIT1 = 16'h0bfb;
    defparam add_513_13.INJECT1_0 = "NO";
    defparam add_513_13.INJECT1_1 = "NO";
    LUT4 n351_bdd_4_lut (.A(n63), .B(sin_d0), .C(n9214), .D(n343[3]), 
         .Z(n10154)) /* synthesis lut_function=(A (B (C+(D))+!B (D))), syn_module_defined=1 */ ;
    defparam n351_bdd_4_lut.init = 16'haa80;
    LUT4 i8796 (.A(n63), .B(sin_d0_delay), .C(sin_d0), .D(n343[3]), 
         .Z(n10153)) /* synthesis lut_function=(A ((C+(D))+!B)+!A ((C)+!B)), syn_module_defined=1 */ ;
    defparam i8796.init = 16'hfbf3;
    LUT4 i10 (.A(n63), .B(n7562), .C(n9214), .D(sin_d0), .Z(n372)) /* synthesis lut_function=(A (B+!((D)+!C))+!A (B+(C))), syn_module_defined=1 */ ;
    defparam i10.init = 16'hdcfc;
    PFUMX i8797 (.BLUT(n10154), .ALUT(n10153), .C0(n343[0]), .Z(n10155)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i2_3_lut_adj_0 (.A(sin_d0_delay), .B(n343[0]), .C(sin_d0), .Z(n7562)) /* synthesis lut_function=(!(((C)+!B)+!A)), syn_module_defined=1 */ ;
    defparam i2_3_lut_adj_0.init = 16'h0808;
    LUT4 i3_4_lut_adj_0 (.A(counter[4]), .B(counter[8]), .C(counter[0]), 
         .D(counter[2]), .Z(n25)) /* synthesis lut_function=(A+(B+((D)+!C))), syn_module_defined=1 */ ;
    defparam i3_4_lut_adj_0.init = 16'hffef;
    LUT4 i7_4_lut (.A(counter[6]), .B(n14), .C(n10), .D(counter[13]), 
         .Z(n30)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i7_4_lut.init = 16'hfffe;
    LUT4 i6_4_lut (.A(counter[7]), .B(counter[14]), .C(counter[11]), .D(counter[15]), 
         .Z(n14)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i6_4_lut.init = 16'hfffe;
    LUT4 i2_2_lut (.A(counter[3]), .B(counter[5]), .Z(n10)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i2_2_lut.init = 16'heeee;
    LUT4 i8 (.A(counter[10]), .B(counter[12]), .C(counter[1]), .D(counter[9]), 
         .Z(n26)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i8.init = 16'hfffe;
    CCU2D add_513_15 (.A0(n343[0]), .B0(n128[13]), .C0(n343[3]), .D0(counter[13]), 
          .A1(n343[0]), .B1(n128[14]), .C1(n343[3]), .D1(counter[14]), 
          .CIN(n8081), .COUT(n8082), .S0(n448[13]), .S1(n448[14])) /* synthesis syn_module_defined=1 */ ;
    defparam add_513_15.INIT0 = 16'h0bfb;
    defparam add_513_15.INIT1 = 16'h0bfb;
    defparam add_513_15.INJECT1_0 = "NO";
    defparam add_513_15.INJECT1_1 = "NO";
    VHI i2 (.Z(VCC_net));
    VLO i1 (.Z(GND_net));
    
endmodule

//
// Verilog Description of module \modem(DATAWIDTH=8) 
//

module \modem(DATAWIDTH=8)  (clk_c, \MSR[1] , n10626, n10625) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    output \MSR[1] ;
    input n10626;
    input n10625;
    
    wire dsrn_d1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/modem.v(86[26:33])
    
    FD1P3AX msr_reg_i2 (.D(n10626), .SP(dsrn_d1), .CK(clk_c), .Q(\MSR[1] )) /* synthesis syn_module_defined=1 */ ;
    defparam msr_reg_i2.GSR = "ENABLED";
    FD1S3AY dsrn_d1_c (.D(n10625), .CK(clk_c), .Q(dsrn_d1)) /* synthesis syn_module_defined=1 */ ;
    defparam dsrn_d1_c.GSR = "ENABLED";
    
endmodule

//
// Verilog Description of module \intface(CLK_IN_MHZ=24,BAUD_RATE=115200,ADDRWIDTH=3,DATAWIDTH=8,FIFO=0) 
//

module \intface(CLK_IN_MHZ=24,BAUD_RATE=115200,ADDRWIDTH=3,DATAWIDTH=8,FIFO=0)  (clk_c, 
            n3377, THR, wb_data_from_master, \wb_addr[3] , \wb_addr[4] , 
            n9133, n9267, n9266, n8260, n9343, n7422, \ier[2] , 
            \MSR[1] , rx_rdy, break_int, frame_err, parity_err, overrun_err, 
            THRE, n10236, n10670, n10217, n10221, \wb_addr[0] , 
            \wb_addr[1] , \wb_addr[2] , \wb_addr[5] , \wb_addr[6] , 
            \wb_addr[7] , \RBR[7] , n1243, n1250, \RBR[0] , n1244, 
            \RBR[6] , tsr_empty, n10682, n10793, div_wr_strobe, \divisor[7] , 
            \divisor[6] , \divisor[5] , \divisor[4] , \divisor[3] , 
            \divisor[2] , \divisor[1] , n2694, n1249, \RBR[1] , n1248, 
            \RBR[2] , \RBR[3] , n1247, \RBR[4] , n1246, \divisor[0] , 
            n3595, n10267, n10626, thr_wr, n10249) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    input n3377;
    output [7:0]THR;
    input [7:0]wb_data_from_master;
    output \wb_addr[3] ;
    output \wb_addr[4] ;
    output n9133;
    output n9267;
    output n9266;
    output n8260;
    output n9343;
    input n7422;
    output \ier[2] ;
    input \MSR[1] ;
    output rx_rdy;
    input break_int;
    input frame_err;
    input parity_err;
    input overrun_err;
    output THRE;
    input n10236;
    input n10670;
    input n10217;
    input n10221;
    output \wb_addr[0] ;
    output \wb_addr[1] ;
    output \wb_addr[2] ;
    output \wb_addr[5] ;
    output \wb_addr[6] ;
    output \wb_addr[7] ;
    input \RBR[7] ;
    output n1243;
    output n1250;
    input \RBR[0] ;
    output n1244;
    input \RBR[6] ;
    input tsr_empty;
    input n10682;
    input [7:0]n10793;
    input div_wr_strobe;
    output \divisor[7] ;
    output \divisor[6] ;
    output \divisor[5] ;
    output \divisor[4] ;
    output \divisor[3] ;
    output \divisor[2] ;
    output \divisor[1] ;
    input n2694;
    output n1249;
    input \RBR[1] ;
    output n1248;
    input \RBR[2] ;
    input \RBR[3] ;
    output n1247;
    input \RBR[4] ;
    output n1246;
    output \divisor[0] ;
    input n3595;
    input n10267;
    input n10626;
    output thr_wr;
    input n10249;
    
    wire rbr_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(142[23:29])
    wire data_err;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(180[15:23])
    wire [3:0]ier;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(172[21:24])
    wire modem_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(204[10:19])
    wire thre_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(178[15:23])
    wire dataerr_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(179[15:26])
    wire rx_rdy_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/intface.v(177[15:25])
    wire TEMT;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/uart_core.v(150[23:27])
    
    wire n10261, n10260, n9265, n189, n10251;
    wire [7:0]n273;
    
    wire n10242, n8869, n3, n10, n10228, n3329, n5653, n9436, 
        n248, n3263, n1, n10208, n8969, n10270, n302, n9260, 
        n9003, n4;
    wire [7:0]n1227;
    
    wire n8296;
    wire [3:0]n289;
    
    FD1P3AX thr_nonfifo_i0_i0_i1 (.D(wb_data_from_master[1]), .SP(n3377), 
            .CK(clk_c), .Q(THR[1])) /* synthesis syn_module_defined=1 */ ;
    defparam thr_nonfifo_i0_i0_i1.GSR = "ENABLED";
    FD1P3AX thr_nonfifo_i0_i0_i2 (.D(wb_data_from_master[2]), .SP(n3377), 
            .CK(clk_c), .Q(THR[2])) /* synthesis syn_module_defined=1 */ ;
    defparam thr_nonfifo_i0_i0_i2.GSR = "ENABLED";
    FD1P3AX thr_nonfifo_i0_i0_i3 (.D(wb_data_from_master[3]), .SP(n3377), 
            .CK(clk_c), .Q(THR[3])) /* synthesis syn_module_defined=1 */ ;
    defparam thr_nonfifo_i0_i0_i3.GSR = "ENABLED";
    FD1P3AX thr_nonfifo_i0_i0_i4 (.D(wb_data_from_master[4]), .SP(n3377), 
            .CK(clk_c), .Q(THR[4])) /* synthesis syn_module_defined=1 */ ;
    defparam thr_nonfifo_i0_i0_i4.GSR = "ENABLED";
    LUT4 i1 (.A(\wb_addr[3] ), .B(n10261), .C(\wb_addr[4] ), .D(n10260), 
         .Z(n9133)) /* synthesis lut_function=(!((B+(C+(D)))+!A)), syn_module_defined=1 */ ;
    defparam i1.init = 16'h0002;
    LUT4 i1_2_lut_4_lut (.A(\wb_addr[3] ), .B(n10261), .C(\wb_addr[4] ), 
         .D(n9265), .Z(n9267)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_4_lut.init = 16'h0200;
    LUT4 i1_2_lut_3_lut_4_lut (.A(\wb_addr[3] ), .B(n10261), .C(n9265), 
         .D(\wb_addr[4] ), .Z(n9266)) /* synthesis lut_function=(!(A+(B+((D)+!C)))), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'h0010;
    LUT4 i2_3_lut_4_lut (.A(\wb_addr[3] ), .B(n10261), .C(\wb_addr[4] ), 
         .D(n10260), .Z(n8260)) /* synthesis lut_function=(!(A+(B+((D)+!C)))), syn_module_defined=1 */ ;
    defparam i2_3_lut_4_lut.init = 16'h0010;
    LUT4 i8596_2_lut_3_lut_3_lut_4_lut (.A(\wb_addr[3] ), .B(n10261), .C(\wb_addr[4] ), 
         .D(n10260), .Z(n9343)) /* synthesis lut_function=(!(A+(B+(C+(D))))), syn_module_defined=1 */ ;
    defparam i8596_2_lut_3_lut_3_lut_4_lut.init = 16'h0001;
    FD1P3AX thr_nonfifo_i0_i0_i5 (.D(wb_data_from_master[5]), .SP(n3377), 
            .CK(clk_c), .Q(THR[5])) /* synthesis syn_module_defined=1 */ ;
    defparam thr_nonfifo_i0_i0_i5.GSR = "ENABLED";
    FD1P3AX thr_nonfifo_i0_i0_i6 (.D(wb_data_from_master[6]), .SP(n3377), 
            .CK(clk_c), .Q(THR[6])) /* synthesis syn_module_defined=1 */ ;
    defparam thr_nonfifo_i0_i0_i6.GSR = "ENABLED";
    FD1S3IX rbr_rd_nonfifo (.D(n189), .CK(clk_c), .CD(n7422), .Q(rbr_rd)) /* synthesis syn_module_defined=1 */ ;
    defparam rbr_rd_nonfifo.GSR = "ENABLED";
    LUT4 i4525_2_lut_rep_200 (.A(\ier[2] ), .B(data_err), .Z(n10251)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i4525_2_lut_rep_200.init = 16'h8888;
    LUT4 i1_2_lut_rep_191_3_lut (.A(\ier[2] ), .B(data_err), .C(n273[0]), 
         .Z(n10242)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_191_3_lut.init = 16'h7070;
    LUT4 i2_4_lut_adj_0 (.A(n10), .B(n3), .C(ier[3]), .D(modem_int), 
         .Z(n8869)) /* synthesis lut_function=(A+(B+!(C+!(D)))), syn_module_defined=1 */ ;
    defparam i2_4_lut_adj_0.init = 16'hefee;
    LUT4 i1_4_lut_adj_0 (.A(n5653), .B(n9436), .C(n3329), .D(n10228), 
         .Z(n10)) /* synthesis lut_function=(!(A+!(B (C)+!B (C+(D))))), syn_module_defined=1 */ ;
    defparam i1_4_lut_adj_0.init = 16'h5150;
    LUT4 i1_2_lut_adj_0 (.A(n248), .B(thre_int), .Z(n3)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i1_2_lut_adj_0.init = 16'h8888;
    LUT4 i8356_2_lut (.A(\MSR[1] ), .B(ier[3]), .Z(n9436)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i8356_2_lut.init = 16'h8888;
    LUT4 i4647_2_lut (.A(rx_rdy), .B(ier[0]), .Z(n5653)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i4647_2_lut.init = 16'h8888;
    LUT4 i3_4_lut_adj_0 (.A(overrun_err), .B(break_int), .C(frame_err), 
         .D(parity_err), .Z(data_err)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i3_4_lut_adj_0.init = 16'hfffe;
    LUT4 i5 (.A(ier[1]), .B(THRE), .C(n10236), .D(n10670), .Z(n248)) /* synthesis lut_function=(((C (D))+!B)+!A), syn_module_defined=1 */ ;
    defparam i5.init = 16'hf777;
    INV i213 (.A(n10260), .Z(n189)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i4 (.A(n10217), .B(data_err), .C(dataerr_int), .D(n1), .Z(n3263)) /* synthesis lut_function=(A (B (D))+!A (B (C+(D))+!B (C))), syn_module_defined=1 */ ;
    defparam i4.init = 16'hdc50;
    LUT4 i1_2_lut_rep_157_3_lut (.A(n10221), .B(\ier[2] ), .C(dataerr_int), 
         .Z(n10208)) /* synthesis lut_function=(A (C)+!A !(B+!(C))), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_157_3_lut.init = 16'hb0b0;
    LUT4 i2_4_lut (.A(n10208), .B(n5653), .C(n10251), .D(n10270), .Z(n8969)) /* synthesis lut_function=(A (B)+!A !((C+!(D))+!B)), syn_module_defined=1 */ ;
    defparam i2_4_lut.init = 16'h8c88;
    LUT4 reduce_or_100_i1_3_lut (.A(n248), .B(n9260), .C(thre_int), .Z(n302)) /* synthesis lut_function=(A (B)+!A (B+(C))), syn_module_defined=1 */ ;
    defparam reduce_or_100_i1_3_lut.init = 16'hdcdc;
    LUT4 i3 (.A(THRE), .B(ier[1]), .C(n5653), .D(n10242), .Z(n9260)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)), syn_module_defined=1 */ ;
    defparam i3.init = 16'h0800;
    LUT4 i1_4_lut (.A(ier[3]), .B(modem_int), .C(n5653), .D(n4), .Z(n9003)) /* synthesis lut_function=(A (B+!(C+!(D)))), syn_module_defined=1 */ ;
    defparam i1_4_lut.init = 16'h8a88;
    LUT4 i2_3_lut_rep_209 (.A(\wb_addr[1] ), .B(\wb_addr[0] ), .C(\wb_addr[2] ), 
         .Z(n10260)) /* synthesis lut_function=(A+(B+(C))), syn_module_defined=1 */ ;
    defparam i2_3_lut_rep_209.init = 16'hfefe;
    LUT4 i2_3_lut_rep_210 (.A(\wb_addr[7] ), .B(\wb_addr[5] ), .C(\wb_addr[6] ), 
         .Z(n10261)) /* synthesis lut_function=(A+(B+(C))), syn_module_defined=1 */ ;
    defparam i2_3_lut_rep_210.init = 16'hfefe;
    LUT4 i1_2_lut_3_lut_adj_0 (.A(\wb_addr[0] ), .B(\wb_addr[1] ), .C(\wb_addr[2] ), 
         .Z(n9265)) /* synthesis lut_function=(!(A+(B+!(C)))), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut_adj_0.init = 16'h1010;
    LUT4 i2 (.A(\wb_addr[0] ), .B(\wb_addr[1] ), .C(\RBR[7] ), .Z(n1243)) /* synthesis lut_function=(!(A+(B+!(C)))), syn_module_defined=1 */ ;
    defparam i2.init = 16'h1010;
    LUT4 i2_3_lut_4_lut_adj_0 (.A(dataerr_int), .B(n10217), .C(rx_rdy_int), 
         .D(n10251), .Z(n3329)) /* synthesis lut_function=(A (B+!((D)+!C))+!A !((D)+!C)), syn_module_defined=1 */ ;
    defparam i2_3_lut_4_lut_adj_0.init = 16'h88f8;
    LUT4 i2_2_lut_rep_219 (.A(n273[0]), .B(rx_rdy_int), .Z(n10270)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i2_2_lut_rep_219.init = 16'heeee;
    LUT4 i1_2_lut_3_lut (.A(n273[0]), .B(rx_rdy_int), .C(\ier[2] ), .Z(n1)) /* synthesis lut_function=(A (C)+!A (B (C))), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut.init = 16'he0e0;
    LUT4 mux_524_i1_3_lut (.A(n1227[0]), .B(rx_rdy), .C(\wb_addr[0] ), 
         .Z(n1250)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_524_i1_3_lut.init = 16'hcaca;
    LUT4 mux_517_i1_3_lut (.A(\RBR[0] ), .B(n8296), .C(\wb_addr[1] ), 
         .Z(n1227[0])) /* synthesis lut_function=(!(A (B (C))+!A (B+!(C)))), syn_module_defined=1 */ ;
    defparam mux_517_i1_3_lut.init = 16'h3a3a;
    LUT4 i3_4_lut (.A(modem_int), .B(thre_int), .C(rx_rdy_int), .D(dataerr_int), 
         .Z(n8296)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i3_4_lut.init = 16'hfffe;
    PFUMX mux_524_i7 (.BLUT(n1227[6]), .ALUT(TEMT), .C0(\wb_addr[0] ), 
          .Z(n1244)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i4552_2_lut (.A(\RBR[6] ), .B(\wb_addr[1] ), .Z(n1227[6])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4552_2_lut.init = 16'h2222;
    LUT4 i1_2_lut (.A(THRE), .B(tsr_empty), .Z(TEMT)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i1_2_lut.init = 16'h8888;
    LUT4 i1_2_lut_4_lut_adj_0 (.A(THRE), .B(n10242), .C(ier[1]), .D(\MSR[1] ), 
         .Z(n4)) /* synthesis lut_function=(!(A ((C+!(D))+!B)+!A !(B (D)))), syn_module_defined=1 */ ;
    defparam i1_2_lut_4_lut_adj_0.init = 16'h4c00;
    FD1S3AX cs_state_FSM_i5 (.D(n9003), .CK(clk_c), .Q(modem_int)) /* synthesis syn_module_defined=1 */ ;
    defparam cs_state_FSM_i5.GSR = "ENABLED";
    FD1S3AX cs_state_FSM_i4 (.D(n302), .CK(clk_c), .Q(thre_int)) /* synthesis syn_module_defined=1 */ ;
    defparam cs_state_FSM_i4.GSR = "ENABLED";
    FD1S3AX cs_state_FSM_i3 (.D(n8969), .CK(clk_c), .Q(rx_rdy_int)) /* synthesis syn_module_defined=1 */ ;
    defparam cs_state_FSM_i3.GSR = "ENABLED";
    FD1S3AX cs_state_FSM_i2 (.D(n3263), .CK(clk_c), .Q(dataerr_int)) /* synthesis syn_module_defined=1 */ ;
    defparam cs_state_FSM_i2.GSR = "ENABLED";
    FD1S3DX ext_addr_i8 (.D(n10793[7]), .CK(clk_c), .CD(n10682), .Q(\wb_addr[7] )) /* synthesis syn_module_defined=1 */ ;
    defparam ext_addr_i8.GSR = "DISABLED";
    FD1S3DX ext_addr_i7 (.D(n10793[6]), .CK(clk_c), .CD(n10682), .Q(\wb_addr[6] )) /* synthesis syn_module_defined=1 */ ;
    defparam ext_addr_i7.GSR = "DISABLED";
    FD1S3DX ext_addr_i6 (.D(n10793[5]), .CK(clk_c), .CD(n10682), .Q(\wb_addr[5] )) /* synthesis syn_module_defined=1 */ ;
    defparam ext_addr_i6.GSR = "DISABLED";
    FD1S3DX ext_addr_i5 (.D(n10793[4]), .CK(clk_c), .CD(n10682), .Q(\wb_addr[4] )) /* synthesis syn_module_defined=1 */ ;
    defparam ext_addr_i5.GSR = "DISABLED";
    FD1S3DX ext_addr_i4 (.D(n10793[3]), .CK(clk_c), .CD(n10682), .Q(\wb_addr[3] )) /* synthesis syn_module_defined=1 */ ;
    defparam ext_addr_i4.GSR = "DISABLED";
    FD1S3DX ext_addr_i3 (.D(n10793[2]), .CK(clk_c), .CD(n10682), .Q(\wb_addr[2] )) /* synthesis syn_module_defined=1 */ ;
    defparam ext_addr_i3.GSR = "DISABLED";
    FD1S3DX ext_addr_i2 (.D(n10793[1]), .CK(clk_c), .CD(n10682), .Q(\wb_addr[1] )) /* synthesis syn_module_defined=1 */ ;
    defparam ext_addr_i2.GSR = "DISABLED";
    FD1P3AY divisor_i0_i0_i7 (.D(wb_data_from_master[7]), .SP(div_wr_strobe), 
            .CK(clk_c), .Q(\divisor[7] )) /* synthesis syn_module_defined=1 */ ;
    defparam divisor_i0_i0_i7.GSR = "ENABLED";
    FD1P3AY divisor_i0_i0_i6 (.D(wb_data_from_master[6]), .SP(div_wr_strobe), 
            .CK(clk_c), .Q(\divisor[6] )) /* synthesis syn_module_defined=1 */ ;
    defparam divisor_i0_i0_i6.GSR = "ENABLED";
    FD1P3AX divisor_i0_i0_i5 (.D(wb_data_from_master[5]), .SP(div_wr_strobe), 
            .CK(clk_c), .Q(\divisor[5] )) /* synthesis syn_module_defined=1 */ ;
    defparam divisor_i0_i0_i5.GSR = "ENABLED";
    FD1P3AY divisor_i0_i0_i4 (.D(wb_data_from_master[4]), .SP(div_wr_strobe), 
            .CK(clk_c), .Q(\divisor[4] )) /* synthesis syn_module_defined=1 */ ;
    defparam divisor_i0_i0_i4.GSR = "ENABLED";
    FD1P3AX thr_nonfifo_i0_i0_i7 (.D(wb_data_from_master[7]), .SP(n3377), 
            .CK(clk_c), .Q(THR[7])) /* synthesis syn_module_defined=1 */ ;
    defparam thr_nonfifo_i0_i0_i7.GSR = "ENABLED";
    FD1P3AX divisor_i0_i0_i3 (.D(wb_data_from_master[3]), .SP(div_wr_strobe), 
            .CK(clk_c), .Q(\divisor[3] )) /* synthesis syn_module_defined=1 */ ;
    defparam divisor_i0_i0_i3.GSR = "ENABLED";
    FD1P3AX divisor_i0_i0_i2 (.D(wb_data_from_master[2]), .SP(div_wr_strobe), 
            .CK(clk_c), .Q(\divisor[2] )) /* synthesis syn_module_defined=1 */ ;
    defparam divisor_i0_i0_i2.GSR = "ENABLED";
    FD1P3AX divisor_i0_i0_i1 (.D(wb_data_from_master[1]), .SP(div_wr_strobe), 
            .CK(clk_c), .Q(\divisor[1] )) /* synthesis syn_module_defined=1 */ ;
    defparam divisor_i0_i0_i1.GSR = "ENABLED";
    FD1P3AX ier_i0_i0_i3 (.D(wb_data_from_master[3]), .SP(n2694), .CK(clk_c), 
            .Q(ier[3])) /* synthesis syn_module_defined=1 */ ;
    defparam ier_i0_i0_i3.GSR = "ENABLED";
    FD1P3AX ier_i0_i0_i2 (.D(wb_data_from_master[2]), .SP(n2694), .CK(clk_c), 
            .Q(\ier[2] )) /* synthesis syn_module_defined=1 */ ;
    defparam ier_i0_i0_i2.GSR = "ENABLED";
    FD1P3AX ier_i0_i0_i1 (.D(wb_data_from_master[1]), .SP(n2694), .CK(clk_c), 
            .Q(ier[1])) /* synthesis syn_module_defined=1 */ ;
    defparam ier_i0_i0_i1.GSR = "ENABLED";
    FD1S3AY cs_state_FSM_i1 (.D(n8869), .CK(clk_c), .Q(n273[0])) /* synthesis syn_module_defined=1 */ ;
    defparam cs_state_FSM_i1.GSR = "ENABLED";
    FD1S3DX ext_addr_i1 (.D(n10793[0]), .CK(clk_c), .CD(n10682), .Q(\wb_addr[0] )) /* synthesis syn_module_defined=1 */ ;
    defparam ext_addr_i1.GSR = "DISABLED";
    LUT4 mux_524_i2_3_lut (.A(n1227[1]), .B(overrun_err), .C(\wb_addr[0] ), 
         .Z(n1249)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_524_i2_3_lut.init = 16'hcaca;
    LUT4 mux_517_i2_4_lut (.A(\RBR[1] ), .B(n289[1]), .C(\wb_addr[1] ), 
         .D(dataerr_int), .Z(n1227[1])) /* synthesis lut_function=(A (B+((D)+!C))+!A (B (C)+!B (C (D)))), syn_module_defined=1 */ ;
    defparam mux_517_i2_4_lut.init = 16'hfaca;
    LUT4 i4598_2_lut (.A(thre_int), .B(rx_rdy_int), .Z(n289[1])) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i4598_2_lut.init = 16'h2222;
    LUT4 mux_524_i3_3_lut (.A(n1227[2]), .B(parity_err), .C(\wb_addr[0] ), 
         .Z(n1248)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_524_i3_3_lut.init = 16'hcaca;
    LUT4 mux_517_i3_4_lut (.A(\RBR[2] ), .B(rx_rdy_int), .C(\wb_addr[1] ), 
         .D(dataerr_int), .Z(n1227[2])) /* synthesis lut_function=(A (B+((D)+!C))+!A (B (C)+!B (C (D)))), syn_module_defined=1 */ ;
    defparam mux_517_i3_4_lut.init = 16'hfaca;
    LUT4 mux_524_i4_4_lut (.A(\RBR[3] ), .B(frame_err), .C(\wb_addr[0] ), 
         .D(\wb_addr[1] ), .Z(n1247)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_524_i4_4_lut.init = 16'hc0ca;
    LUT4 mux_524_i5_4_lut (.A(\RBR[4] ), .B(break_int), .C(\wb_addr[0] ), 
         .D(\wb_addr[1] ), .Z(n1246)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_524_i5_4_lut.init = 16'hc0ca;
    FD1P3AX divisor_i0_i0_i0 (.D(wb_data_from_master[0]), .SP(div_wr_strobe), 
            .CK(clk_c), .Q(\divisor[0] )) /* synthesis syn_module_defined=1 */ ;
    defparam divisor_i0_i0_i0.GSR = "ENABLED";
    FD1P3AX ier_i0_i0_i0 (.D(wb_data_from_master[0]), .SP(n2694), .CK(clk_c), 
            .Q(ier[0])) /* synthesis syn_module_defined=1 */ ;
    defparam ier_i0_i0_i0.GSR = "ENABLED";
    FD1S3AY thr_empty (.D(n3595), .CK(clk_c), .Q(THRE)) /* synthesis syn_module_defined=1 */ ;
    defparam thr_empty.GSR = "ENABLED";
    FD1P3AX thr_nonfifo_i0_i0_i0 (.D(wb_data_from_master[0]), .SP(n3377), 
            .CK(clk_c), .Q(THR[0])) /* synthesis syn_module_defined=1 */ ;
    defparam thr_nonfifo_i0_i0_i0.GSR = "ENABLED";
    LUT4 i1_3_lut_rep_177_4_lut (.A(n10251), .B(n273[0]), .C(ier[1]), 
         .D(THRE), .Z(n10228)) /* synthesis lut_function=(!(A+((C (D))+!B))), syn_module_defined=1 */ ;
    defparam i1_3_lut_rep_177_4_lut.init = 16'h0444;
    FD1P3IX rbr_datardy (.D(n10626), .SP(n10267), .CD(rbr_rd), .CK(clk_c), 
            .Q(rx_rdy)) /* synthesis syn_module_defined=1 */ ;
    defparam rbr_datardy.GSR = "ENABLED";
    FD1S3IX thr_wr_c39 (.D(n10249), .CK(clk_c), .CD(n10260), .Q(thr_wr)) /* synthesis syn_module_defined=1 */ ;
    defparam thr_wr_c39.GSR = "ENABLED";
    
endmodule

//
// Verilog Description of module \isp8(FAMILY_NAME="XO2",PROM_FILE="prom_init.hex",PORT_AW=8,EXT_AW=24,PROM_AW=10,PROM_AD=1024,REGISTERS_16=0,PGM_STACK_AW=4,PGM_STACK_AD=16) 
//

module \isp8(FAMILY_NAME="XO2",PROM_FILE="prom_init.hex",PORT_AW=8,EXT_AW=24,PROM_AW=10,PROM_AD=1024,REGISTERS_16=0,PGM_STACK_AW=4,PGM_STACK_AD=16)  (clk_c, 
            \wb_addr[4] , \wb_addr[3] , \wb_addr[2] , \wb_addr[1] , 
            \wb_addr[0] , wb_data_from_master, \addr[23] , \addr[21] , 
            n10236, n10268, n2976, data_in, \addr[20] , n2143, \addr[22] , 
            ack_reg, n10249, lm8_rst, rst, n10684, n10661, n7422, 
            n10682, \wb_addr[8] , lm8_rstn, \wb_addr[9] , parity_err, 
            n3618, n4411, n10793, div_wr_strobe, rom_ce, n10664, 
            n10221, n10659, read_wait_done, n9219, n3377, n2694, 
            n9218, n1506, n10670, n2642, \ier[2] , n10217, n8279, 
            \wb_ack[10] , \wb_ack[0] , n9581, wb_rst, io_rdy) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    input \wb_addr[4] ;
    input \wb_addr[3] ;
    input \wb_addr[2] ;
    input \wb_addr[1] ;
    input \wb_addr[0] ;
    output [7:0]wb_data_from_master;
    output \addr[23] ;
    output \addr[21] ;
    output n10236;
    output n10268;
    output n2976;
    input [7:0]data_in;
    output \addr[20] ;
    output n2143;
    output \addr[22] ;
    output ack_reg;
    output n10249;
    output lm8_rst;
    input rst;
    input n10684;
    output n10661;
    output n7422;
    output n10682;
    output \wb_addr[8] ;
    input lm8_rstn;
    output \wb_addr[9] ;
    input parity_err;
    output n3618;
    output n4411;
    output [7:0]n10793;
    output div_wr_strobe;
    output rom_ce;
    output n10664;
    output n10221;
    output n10659;
    input read_wait_done;
    output n9219;
    output n3377;
    output n2694;
    output n9218;
    output n1506;
    output n10670;
    output n2642;
    input \ier[2] ;
    output n10217;
    input n8279;
    input \wb_ack[10] ;
    input \wb_ack[0] ;
    input n9581;
    input wb_rst;
    input io_rdy;
    
    wire [7:0]ext_mem_din;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(85[21:32])
    wire ext_mem_wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(86[21:31])
    
    wire GND_net, VCC_net;
    
    pmi_distributed_spramXbnonen8532 pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg8532 (.Address({\wb_addr[4] , 
            \wb_addr[3] , \wb_addr[2] , \wb_addr[1] , \wb_addr[0] }), 
            .Data({wb_data_from_master}), .Q({ext_mem_din}), .Clock(clk_c), 
            .ClockEn(VCC_net), .WE(ext_mem_wr), .Reset(GND_net)) /* synthesis syn_instantiated=1, syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(299[1] 311[2])
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg8532.module_type = "pmi_distributed_spram";
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg8532.pmi_family = "XO2";
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg8532.pmi_init_file_format = "binary";
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg8532.pmi_init_file = "none";
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg8532.pmi_regmode = "noreg";
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg8532.pmi_data_width = 8;
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg8532.pmi_addr_width = 5;
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg8532.pmi_addr_depth = 32;
    \isp8_core(FAMILY_NAME="XO2",PROM_FILE="prom_init.hex",PORT_AW=8,EXT_AW=24,PROM_AW=10,PROM_AD=1024,REGISTERS_16=0,PGM_STACK_AW=4,PGM_STACK_AD=16)  u1_isp8 (.\addr[23] (\addr[23] ), 
            .\addr[21] (\addr[21] ), .n10236(n10236), .n10268(n10268), 
            .n2976(n2976), .data_in({data_in}), .\addr[20] (\addr[20] ), 
            .n2143(n2143), .ext_mem_din({ext_mem_din}), .\addr[22] (\addr[22] ), 
            .ack_reg(ack_reg), .n10249(n10249), .lm8_rst(lm8_rst), .clk_c(clk_c), 
            .rst(rst), .n10684(n10684), .n10661(n10661), .n7422(n7422), 
            .n10682(n10682), .\wb_addr[8] (\wb_addr[8] ), .lm8_rstn(lm8_rstn), 
            .\wb_addr[9] (\wb_addr[9] ), .\wb_addr[1] (\wb_addr[1] ), .parity_err(parity_err), 
            .n3618(n3618), .\wb_addr[0] (\wb_addr[0] ), .\wb_addr[2] (\wb_addr[2] ), 
            .n4411(n4411), .n10793({n10793}), .wb_data_from_master({wb_data_from_master}), 
            .div_wr_strobe(div_wr_strobe), .rom_ce(rom_ce), .n10664(n10664), 
            .n10221(n10221), .ext_mem_wr(ext_mem_wr), .n10659(n10659), 
            .read_wait_done(read_wait_done), .n9219(n9219), .n3377(n3377), 
            .n2694(n2694), .n9218(n9218), .n1506(n1506), .n10670(n10670), 
            .n2642(n2642), .\ier[2] (\ier[2] ), .n10217(n10217), .n8279(n8279), 
            .\wb_ack[10] (\wb_ack[10] ), .\wb_ack[0] (\wb_ack[0] ), .n9581(n9581), 
            .wb_rst(wb_rst), .io_rdy(io_rdy)) /* synthesis syn_module_defined=1 */ ;
    VHI i2 (.Z(VCC_net));
    VLO i1 (.Z(GND_net));
    
endmodule

//
// Verilog Description of module \isp8_core(FAMILY_NAME="XO2",PROM_FILE="prom_init.hex",PORT_AW=8,EXT_AW=24,PROM_AW=10,PROM_AD=1024,REGISTERS_16=0,PGM_STACK_AW=4,PGM_STACK_AD=16) 
//

module \isp8_core(FAMILY_NAME="XO2",PROM_FILE="prom_init.hex",PORT_AW=8,EXT_AW=24,PROM_AW=10,PROM_AD=1024,REGISTERS_16=0,PGM_STACK_AW=4,PGM_STACK_AD=16)  (\addr[23] , 
            \addr[21] , n10236, n10268, n2976, data_in, \addr[20] , 
            n2143, ext_mem_din, \addr[22] , ack_reg, n10249, lm8_rst, 
            clk_c, rst, n10684, n10661, n7422, n10682, \wb_addr[8] , 
            lm8_rstn, \wb_addr[9] , \wb_addr[1] , parity_err, n3618, 
            \wb_addr[0] , \wb_addr[2] , n4411, n10793, wb_data_from_master, 
            div_wr_strobe, rom_ce, n10664, n10221, ext_mem_wr, n10659, 
            read_wait_done, n9219, n3377, n2694, n9218, n1506, n10670, 
            n2642, \ier[2] , n10217, n8279, \wb_ack[10] , \wb_ack[0] , 
            n9581, wb_rst, io_rdy) /* synthesis syn_module_defined=1 */ ;
    output \addr[23] ;
    output \addr[21] ;
    output n10236;
    output n10268;
    output n2976;
    input [7:0]data_in;
    output \addr[20] ;
    output n2143;
    input [7:0]ext_mem_din;
    output \addr[22] ;
    output ack_reg;
    output n10249;
    output lm8_rst;
    input clk_c;
    input rst;
    input n10684;
    output n10661;
    output n7422;
    output n10682;
    output \wb_addr[8] ;
    input lm8_rstn;
    output \wb_addr[9] ;
    input \wb_addr[1] ;
    input parity_err;
    output n3618;
    input \wb_addr[0] ;
    input \wb_addr[2] ;
    output n4411;
    output [7:0]n10793;
    output [7:0]wb_data_from_master;
    output div_wr_strobe;
    output rom_ce;
    output n10664;
    output n10221;
    output ext_mem_wr;
    output n10659;
    input read_wait_done;
    output n9219;
    output n3377;
    output n2694;
    output n9218;
    output n1506;
    output n10670;
    output n2642;
    input \ier[2] ;
    output n10217;
    input n8279;
    input \wb_ack[10] ;
    input \wb_ack[0] ;
    input n9581;
    input wb_rst;
    input io_rdy;
    
    wire instr_l1_0;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_idec.v(158[6:16])
    wire rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(105[6:8])
    wire [7:0]din_rd1;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(119[38:45])
    wire [17:0]instr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(92[30:35])
    wire [7:0]din_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(119[30:36])
    wire wren_alu_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(117[30:41])
    wire wren_il_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(118[30:40])
    wire wr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/control_soc_demo.v(104[6:8])
    wire wren_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(115[30:37])
    wire data_cyc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(112[30:38])
    wire rst_n_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(122[30:39])
    wire [7:0]dout_rb;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(106[30:37])
    wire [7:0]dout_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(105[30:37])
    wire ext_mem_rd;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(87[21:31])
    wire update_z;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(104[39:47])
    wire update_c;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(104[30:38])
    wire addr_cyc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(110[30:38])
    wire [11:0]dout_stack_w_cz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(152[36:51])
    wire sp_we;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(155[36:41])
    wire zero_flag;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(165[36:45])
    wire cout_alu;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(109[30:38])
    wire ret_cycle_type;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(158[36:50])
    wire push_enb;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(148[36:44])
    wire br_enb;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(150[36:42])
    wire clrc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(95[42:46])
    wire [7:0]dout_alu;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(108[30:38])
    wire carry_flag;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(107[30:40])
    
    wire n5680, n10264;
    wire [7:0]n234;
    
    wire n10206, n10224, n3423, n232, n9310, n10266, n6, n3, 
        n10244, n10218, n3658, n10216, n3587, n7, n10240, n10223, 
        n10232, n8971, n9431, n10233, n10213, n9328, n10222, n10210, 
        n10209, GND_net, VCC_net, n8973, n10250, n8, n10212, n53, 
        n9303, n11, n9309, n5708, n10227, n10207, n9404, n8409, 
        n8294, n10237, n10226, n6_adj_0, n10219, n5892, n3657, 
        n10239, n10243;
    
    INV i4675 (.A(n5680), .Z(instr_l1_0)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i1_2_lut_rep_185_4_lut (.A(\addr[23] ), .B(\addr[21] ), .C(n10264), 
         .D(rd), .Z(n10236)) /* synthesis lut_function=(!(A+(B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_185_4_lut.init = 16'h0100;
    LUT4 i1_2_lut_4_lut (.A(\addr[23] ), .B(\addr[21] ), .C(n10264), .D(n10268), 
         .Z(n2976)) /* synthesis lut_function=(!(A+(B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i1_2_lut_4_lut.init = 16'h0100;
    MUX21 mux_43_i3 (.D0(din_rd1[2]), .D1(data_in[2]), .SD(n10206), .Z(n234[2])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i8622_2_lut_2_lut (.A(n10224), .B(instr[8]), .Z(n3423)) /* synthesis lut_function=(!(A+!(B))), syn_module_defined=1 */ ;
    defparam i8622_2_lut_2_lut.init = 16'h4444;
    LUT4 i1_2_lut (.A(\addr[20] ), .B(\addr[21] ), .Z(n2143)) /* synthesis lut_function=(A+!(B)), syn_module_defined=1 */ ;
    defparam i1_2_lut.init = 16'hbbbb;
    MUX21 mux_44_i4 (.D0(n234[3]), .D1(ext_mem_din[3]), .SD(n232), .Z(din_rd[3])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i2_3_lut_rep_213 (.A(\addr[20] ), .B(\addr[22] ), .C(ack_reg), 
         .Z(n10264)) /* synthesis lut_function=(A+(B+(C))), syn_module_defined=1 */ ;
    defparam i2_3_lut_rep_213.init = 16'hfefe;
    LUT4 i1_2_lut_rep_198_4_lut (.A(\addr[20] ), .B(\addr[22] ), .C(ack_reg), 
         .D(n9310), .Z(n10249)) /* synthesis lut_function=(!(A+(B+(C+!(D))))), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_198_4_lut.init = 16'h0100;
    LUT4 i46_2_lut_rep_215 (.A(wren_alu_rd), .B(wren_il_rd), .Z(n10266)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i46_2_lut_rep_215.init = 16'heeee;
    LUT4 i1_2_lut_3_lut (.A(wren_alu_rd), .B(wren_il_rd), .C(instr[9]), 
         .Z(n6)) /* synthesis lut_function=(A (C)+!A (B (C))), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut.init = 16'he0e0;
    LUT4 i1_2_lut_rep_217 (.A(wr), .B(rd), .Z(n10268)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_217.init = 16'heeee;
    FD1S3BX rst2_out (.D(n10684), .CK(clk_c), .PD(rst), .Q(lm8_rst)) /* synthesis syn_module_defined=1 */ ;
    defparam rst2_out.GSR = "DISABLED";
    LUT4 i2_3_lut_4_lut (.A(wr), .B(rd), .C(\addr[20] ), .D(\addr[22] ), 
         .Z(n3)) /* synthesis lut_function=(A (C (D)+!C !(D))+!A ((C (D)+!C !(D))+!B)), syn_module_defined=1 */ ;
    defparam i2_3_lut_4_lut.init = 16'hf11f;
    LUT4 i4779_3_lut_4_lut_4_lut (.A(n10244), .B(n10218), .C(n3658), .D(n10216), 
         .Z(n3587)) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A !(C))), syn_module_defined=1 */ ;
    defparam i4779_3_lut_4_lut_4_lut.init = 16'h7270;
    LUT4 i36_2_lut (.A(\addr[22] ), .B(\addr[20] ), .Z(n10661)) /* synthesis lut_function=(!(A (B)+!A !(B))), syn_module_defined=1 */ ;
    defparam i36_2_lut.init = 16'h6666;
    MUX21 mux_43_i4 (.D0(din_rd1[3]), .D1(data_in[3]), .SD(n10206), .Z(n234[3])) /* synthesis syn_module_defined=1 */ ;
    MUX21 mux_44_i3 (.D0(n234[2]), .D1(ext_mem_din[2]), .SD(n232), .Z(din_rd[2])) /* synthesis syn_module_defined=1 */ ;
    AND2 i47 (.A(n10266), .B(data_cyc), .Z(wren_rd)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i1_4_lut_rep_173 (.A(instr[12]), .B(n7), .C(data_cyc), .D(n6), 
         .Z(n10224)) /* synthesis lut_function=(A+!(B (C (D)))), syn_module_defined=1 */ ;
    defparam i1_4_lut_rep_173.init = 16'hbfff;
    INV i6443 (.A(n10236), .Z(n7422)) /* synthesis syn_module_defined=1 */ ;
    LUT4 mux_44_i8_3_lut (.A(n234[7]), .B(ext_mem_din[7]), .C(n232), .Z(din_rd[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_44_i8_3_lut.init = 16'hcaca;
    LUT4 i2_2_lut (.A(instr[10]), .B(instr[11]), .Z(n7)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i2_2_lut.init = 16'h8888;
    LUT4 i1_4_lut_adj_0 (.A(n10240), .B(n10223), .C(instr[0]), .D(instr[2]), 
         .Z(n232)) /* synthesis lut_function=(A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i1_4_lut_adj_0.init = 16'h8000;
    LUT4 mux_44_i7_3_lut (.A(n234[6]), .B(ext_mem_din[6]), .C(n232), .Z(din_rd[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_44_i7_3_lut.init = 16'hcaca;
    LUT4 mux_44_i6_3_lut (.A(n234[5]), .B(ext_mem_din[5]), .C(n232), .Z(din_rd[5])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_44_i6_3_lut.init = 16'hcaca;
    LUT4 i1_2_lut_rep_181 (.A(instr[15]), .B(instr[14]), .Z(n10232)) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_181.init = 16'h2222;
    LUT4 mux_44_i5_3_lut (.A(n234[4]), .B(ext_mem_din[4]), .C(n232), .Z(din_rd[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_44_i5_3_lut.init = 16'hcaca;
    LUT4 mux_44_i2_3_lut (.A(n234[1]), .B(ext_mem_din[1]), .C(n232), .Z(din_rd[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_44_i2_3_lut.init = 16'hcaca;
    LUT4 i1_4_lut (.A(instr[17]), .B(n10232), .C(instr[13]), .D(n9431), 
         .Z(n8971)) /* synthesis lut_function=(!(A ((C+!(D))+!B))), syn_module_defined=1 */ ;
    defparam i1_4_lut.init = 16'h5d55;
    LUT4 i8351_3_lut (.A(instr[0]), .B(instr[16]), .C(instr[17]), .Z(n9431)) /* synthesis lut_function=(!(A (B)+!A (B+!(C)))), syn_module_defined=1 */ ;
    defparam i8351_3_lut.init = 16'h3232;
    LUT4 i1_2_lut_rep_162_3_lut_4_lut (.A(instr[15]), .B(instr[14]), .C(instr[12]), 
         .D(n10233), .Z(n10213)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_162_3_lut_4_lut.init = 16'h0200;
    FD1P3DX page_ptr1___i1 (.D(din_rd[0]), .SP(n9328), .CK(clk_c), .CD(n10682), 
            .Q(\wb_addr[8] )) /* synthesis syn_module_defined=1 */ ;
    defparam page_ptr1___i1.GSR = "DISABLED";
    LUT4 mux_44_i1_3_lut (.A(n234[0]), .B(ext_mem_din[0]), .C(n232), .Z(din_rd[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_44_i1_3_lut.init = 16'hcaca;
    LUT4 i1_2_lut_rep_193 (.A(instr[1]), .B(instr[13]), .Z(n10244)) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_193.init = 16'h2222;
    LUT4 i1_2_lut_rep_159_3_lut_4_lut (.A(instr[1]), .B(instr[13]), .C(n10222), 
         .D(instr[0]), .Z(n10210)) /* synthesis lut_function=(!((B+((D)+!C))+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_159_3_lut_4_lut.init = 16'h0020;
    LUT4 i1_2_lut_rep_158_3_lut_4_lut (.A(instr[1]), .B(instr[13]), .C(n10222), 
         .D(instr[0]), .Z(n10209)) /* synthesis lut_function=(!((B+!(C (D)))+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_158_3_lut_4_lut.init = 16'h2000;
    FD1S3DX rst_n_reg_c (.D(lm8_rstn), .CK(clk_c), .CD(lm8_rst), .Q(rst_n_reg)) /* synthesis syn_module_defined=1 */ ;
    defparam rst_n_reg_c.GSR = "DISABLED";
    pmi_distributed_dpramXbnonen8532 i53 (.WrAddress({instr[12:8]}), .Data({din_rd}), 
            .RdAddress({instr[7:3]}), .Q({dout_rb}), .WrClock(clk_c), 
            .WE(wren_rd), .WrClockEn(VCC_net), .RdClock(clk_c), .RdClockEn(VCC_net), 
            .Reset(GND_net)) /* synthesis syn_instantiated=1, syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(103[18] 119[19])
    defparam i53.module_type = "pmi_distributed_dpram";
    defparam i53.pmi_family = "XO2";
    defparam i53.pmi_init_file_format = "binary";
    defparam i53.pmi_init_file = "none";
    defparam i53.pmi_regmode = "noreg";
    defparam i53.pmi_data_width = 8;
    defparam i53.pmi_addr_width = 5;
    defparam i53.pmi_addr_depth = 32;
    pmi_distributed_dpramXbnonen8532_c pmi_distributed_dprampmi_distributed_dpramXO2binarynonenoreg8532 (.WrAddress({instr[12:8]}), 
            .Data({din_rd}), .RdAddress({instr[12:8]}), .Q({dout_rd}), 
            .WrClock(clk_c), .WE(wren_rd), .WrClockEn(VCC_net), .RdClock(clk_c), 
            .RdClockEn(VCC_net), .Reset(GND_net)) /* synthesis syn_instantiated=1, syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(103[18] 119[19])
    defparam pmi_distributed_dprampmi_distributed_dpramXO2binarynonenoreg8532.module_type = "pmi_distributed_dpram";
    defparam pmi_distributed_dprampmi_distributed_dpramXO2binarynonenoreg8532.pmi_family = "XO2";
    defparam pmi_distributed_dprampmi_distributed_dpramXO2binarynonenoreg8532.pmi_init_file_format = "binary";
    defparam pmi_distributed_dprampmi_distributed_dpramXO2binarynonenoreg8532.pmi_init_file = "none";
    defparam pmi_distributed_dprampmi_distributed_dpramXO2binarynonenoreg8532.pmi_regmode = "noreg";
    defparam pmi_distributed_dprampmi_distributed_dpramXO2binarynonenoreg8532.pmi_data_width = 8;
    defparam pmi_distributed_dprampmi_distributed_dpramXO2binarynonenoreg8532.pmi_addr_width = 5;
    defparam pmi_distributed_dprampmi_distributed_dpramXO2binarynonenoreg8532.pmi_addr_depth = 32;
    FD1S3DX wren_il_rd_c (.D(n8973), .CK(clk_c), .CD(n10682), .Q(wren_il_rd)) /* synthesis syn_module_defined=1 */ ;
    defparam wren_il_rd_c.GSR = "DISABLED";
    FD1S3DX wren_alu_rd_c (.D(n8971), .CK(clk_c), .CD(n10682), .Q(wren_alu_rd)) /* synthesis syn_module_defined=1 */ ;
    defparam wren_alu_rd_c.GSR = "DISABLED";
    FD1P3DX page_ptr1___i2 (.D(din_rd[1]), .SP(n9328), .CK(clk_c), .CD(n10682), 
            .Q(\wb_addr[9] )) /* synthesis syn_module_defined=1 */ ;
    defparam page_ptr1___i2.GSR = "DISABLED";
    FD1P3DX page_ptr2___i4 (.D(din_rd[4]), .SP(n3423), .CK(clk_c), .CD(n10682), 
            .Q(\addr[20] )) /* synthesis syn_module_defined=1 */ ;
    defparam page_ptr2___i4.GSR = "DISABLED";
    FD1P3DX page_ptr2___i5 (.D(din_rd[5]), .SP(n3423), .CK(clk_c), .CD(n10682), 
            .Q(\addr[21] )) /* synthesis syn_module_defined=1 */ ;
    defparam page_ptr2___i5.GSR = "DISABLED";
    FD1P3DX page_ptr2___i6 (.D(din_rd[6]), .SP(n3423), .CK(clk_c), .CD(n10682), 
            .Q(\addr[22] )) /* synthesis syn_module_defined=1 */ ;
    defparam page_ptr2___i6.GSR = "DISABLED";
    FD1P3DX page_ptr2___i7 (.D(din_rd[7]), .SP(n3423), .CK(clk_c), .CD(n10682), 
            .Q(\addr[23] )) /* synthesis syn_module_defined=1 */ ;
    defparam page_ptr2___i7.GSR = "DISABLED";
    LUT4 i8620_2_lut_2_lut (.A(n10224), .B(instr[8]), .Z(n9328)) /* synthesis lut_function=(!(A+(B))), syn_module_defined=1 */ ;
    defparam i8620_2_lut_2_lut.init = 16'h1111;
    OR2 i4674 (.A(instr[17]), .B(instr[16]), .Z(n5680)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i2_3_lut_rep_199 (.A(\addr[23] ), .B(\addr[21] ), .C(n10264), 
         .Z(n10250)) /* synthesis lut_function=(A+(B+(C))), syn_module_defined=1 */ ;
    defparam i2_3_lut_rep_199.init = 16'hfefe;
    \isp8_io_cntl(PORT_AW=8)  u1_isp8_io_cntl (.\wb_addr[1] (\wb_addr[1] ), 
            .n10236(n10236), .parity_err(parity_err), .n3618(n3618), .\wb_addr[0] (\wb_addr[0] ), 
            .\wb_addr[2] (\wb_addr[2] ), .n4411(n4411), .n10240(n10240), 
            .\instr[1] (instr[1]), .n10223(n10223), .\instr[2] (instr[2]), 
            .n8(n8), .dout_rb({dout_rb}), .n10793({n10793}), .n9310(n9310), 
            .\addr[23] (\addr[23] ), .\addr[21] (\addr[21] ), .wr(wr), 
            .rd(rd), .clk_c(clk_c), .n10682(n10682), .wb_data_from_master({wb_data_from_master}), 
            .dout_rd({dout_rd}), .n10264(n10264), .div_wr_strobe(div_wr_strobe), 
            .rst_n_reg(rst_n_reg), .n10212(n10212), .\instr[3] (instr[3]), 
            .rom_ce(rom_ce), .\addr[22] (\addr[22] ), .ack_reg(ack_reg), 
            .\addr[20] (\addr[20] ), .n10664(n10664), .n10250(n10250), 
            .n10221(n10221), .ext_mem_rd(ext_mem_rd), .n53(n53), .ext_mem_wr(ext_mem_wr), 
            .n9303(n9303), .n11(n11), .n9309(n9309), .n10659(n10659), 
            .read_wait_done(read_wait_done), .n9219(n9219), .n10249(n10249), 
            .n3377(n3377), .n2694(n2694), .n10268(n10268), .n9218(n9218), 
            .n1506(n1506), .\instr[4] (instr[4]), .\instr[5] (instr[5]), 
            .\instr[6] (instr[6]), .\instr[7] (instr[7]), .n10670(n10670), 
            .n2642(n2642), .\ier[2] (\ier[2] ), .n10217(n10217)) /* synthesis syn_module_defined=1 */ ;
    \isp8_idec(PROM_AW=10)  u1_isp8_idec (.n5708(n5708), .n10210(n10210), 
            .\instr[16] (instr[16]), .\instr[17] (instr[17]), .\instr[14] (instr[14]), 
            .\instr[13] (instr[13]), .n10227(n10227), .n10240(n10240), 
            .n10207(n10207), .n9404(n9404), .n8409(n8409), .\instr[15] (instr[15]), 
            .update_z(update_z), .update_c(update_c), .n8294(n8294)) /* synthesis syn_module_defined=1 */ ;
    \isp8_flow_cntl(PGM_STACK_AW=4,PGM_STACK_AD=16,PROM_AW=10,FAMILY_NAME="XO2")  u1_isp8_flow_cntl (.clk_c(clk_c), 
            .n10682(n10682), .addr_cyc(addr_cyc), .instr({instr}), .n10237(n10237), 
            .\dout_stack_w_cz[10] (dout_stack_w_cz[10]), .sp_we(sp_we), 
            .n10240(n10240), .n10222(n10222), .data_cyc(data_cyc), .zero_flag(zero_flag), 
            .n3587(n3587), .cout_alu(cout_alu), .update_c(update_c), .ret_cycle_type(ret_cycle_type), 
            .push_enb(push_enb), .n10223(n10223), .n10226(n10226), .n9404(n9404), 
            .br_enb(br_enb), .n6_adj_0(n6_adj_0), .n10219(n10219), .clrc(clrc), 
            .n5708(n5708), .n5892(n5892), .din_rd1({din_rd1}), .dout_alu({dout_alu}), 
            .n11(n11), .n9309(n9309), .carry_flag(carry_flag), .n8409(n8409), 
            .n8(n8), .n8279(n8279), .ext_mem_rd(ext_mem_rd), .\wb_ack[10] (\wb_ack[10] ), 
            .ext_mem_wr(ext_mem_wr), .\wb_ack[0] (\wb_ack[0] ), .ack_reg(ack_reg), 
            .n9581(n9581), .n3(n3), .update_z(update_z), .n3657(n3657), 
            .n10239(n10239), .wb_rst(wb_rst), .io_rdy(io_rdy), .n10216(n10216), 
            .n10218(n10218), .n10243(n10243), .n232(n232), .n53(n53), 
            .n10209(n10209), .n10207(n10207)) /* synthesis syn_module_defined=1 */ ;
    \isp8_alu(FAMILY_NAME="XO2")  u1_isp8_alu (.\instr[13] (instr[13]), .n10216(n10216), 
            .\data_in[7] (data_in[7]), .\din_rd1[7] (din_rd1[7]), .n235(n234[7]), 
            .n10227(n10227), .\instr[15] (instr[15]), .\instr[14] (instr[14]), 
            .\instr[16] (instr[16]), .\instr[17] (instr[17]), .n10219(n10219), 
            .\instr[1] (instr[1]), .\instr[0] (instr[0]), .dout_rb({dout_rb}), 
            .\instr[7] (instr[7]), .dout_alu({dout_alu}), .n5892(n5892), 
            .clrc(clrc), .\instr[6] (instr[6]), .n10240(n10240), .n10237(n10237), 
            .n10212(n10212), .\data_in[0] (data_in[0]), .\din_rd1[0] (din_rd1[0]), 
            .n242(n234[0]), .dout_rd({dout_rd}), .n8294(n8294), .n10226(n10226), 
            .push_enb(push_enb), .sp_we(sp_we), .addr_cyc(addr_cyc), .\instr[5] (instr[5]), 
            .n6_adj_0(n6_adj_0), .n10243(n10243), .n9303(n9303), .n10222(n10222), 
            .n10206(n10206), .n232(n232), .n8973(n8973), .\instr[4] (instr[4]), 
            .\instr[3] (instr[3]), .\instr[2] (instr[2]), .instr_l1_0(instr_l1_0), 
            .carry_flag(carry_flag), .\data_in[4] (data_in[4]), .\din_rd1[4] (din_rd1[4]), 
            .n238(n234[4]), .\data_in[1] (data_in[1]), .\din_rd1[1] (din_rd1[1]), 
            .n241(n234[1]), .n10233(n10233), .\instr[12] (instr[12]), 
            .zero_flag(zero_flag), .n10239(n10239), .\data_in[5] (data_in[5]), 
            .\din_rd1[5] (din_rd1[5]), .n237(n234[5]), .\data_in[6] (data_in[6]), 
            .\din_rd1[6] (din_rd1[6]), .n236(n234[6]), .n10232(n10232), 
            .ret_cycle_type(ret_cycle_type), .br_enb(br_enb), .n10207(n10207), 
            .n10213(n10213), .\dout_stack_w_cz[10] (dout_stack_w_cz[10]), 
            .n3657(n3657), .n3658(n3658), .cout_alu(cout_alu)) /* synthesis syn_module_defined=1 */ ;
    VHI i2 (.Z(VCC_net));
    VLO i1 (.Z(GND_net));
    
endmodule

//
// Verilog Description of module \isp8_io_cntl(PORT_AW=8) 
//

module \isp8_io_cntl(PORT_AW=8)  (\wb_addr[1] , n10236, parity_err, n3618, 
            \wb_addr[0] , \wb_addr[2] , n4411, n10240, \instr[1] , 
            n10223, \instr[2] , n8, dout_rb, n10793, n9310, \addr[23] , 
            \addr[21] , wr, rd, clk_c, n10682, wb_data_from_master, 
            dout_rd, n10264, div_wr_strobe, rst_n_reg, n10212, \instr[3] , 
            rom_ce, \addr[22] , ack_reg, \addr[20] , n10664, n10250, 
            n10221, ext_mem_rd, n53, ext_mem_wr, n9303, n11, n9309, 
            n10659, read_wait_done, n9219, n10249, n3377, n2694, 
            n10268, n9218, n1506, \instr[4] , \instr[5] , \instr[6] , 
            \instr[7] , n10670, n2642, \ier[2] , n10217) /* synthesis syn_module_defined=1 */ ;
    input \wb_addr[1] ;
    input n10236;
    input parity_err;
    output n3618;
    input \wb_addr[0] ;
    input \wb_addr[2] ;
    output n4411;
    input n10240;
    input \instr[1] ;
    input n10223;
    input \instr[2] ;
    output n8;
    input [7:0]dout_rb;
    output [7:0]n10793;
    output n9310;
    input \addr[23] ;
    input \addr[21] ;
    output wr;
    output rd;
    input clk_c;
    output n10682;
    output [7:0]wb_data_from_master;
    input [7:0]dout_rd;
    input n10264;
    output div_wr_strobe;
    input rst_n_reg;
    input n10212;
    input \instr[3] ;
    output rom_ce;
    input \addr[22] ;
    input ack_reg;
    input \addr[20] ;
    output n10664;
    input n10250;
    output n10221;
    output ext_mem_rd;
    input n53;
    output ext_mem_wr;
    input n9303;
    input n11;
    input n9309;
    output n10659;
    input read_wait_done;
    output n9219;
    input n10249;
    output n3377;
    output n2694;
    input n10268;
    output n9218;
    output n1506;
    input \instr[4] ;
    input \instr[5] ;
    input \instr[6] ;
    input \instr[7] ;
    output n10670;
    output n2642;
    input \ier[2] ;
    output n10217;
    
    
    wire n9208, n10259, n10256, n10245, n10258;
    
    LUT4 i4540_2_lut_4_lut (.A(n10236), .B(\wb_addr[1] ), .C(n9208), .D(parity_err), 
         .Z(n3618)) /* synthesis lut_function=(A (B (D)+!B !(C+!(D)))+!A (D)), syn_module_defined=1 */ ;
    defparam i4540_2_lut_4_lut.init = 16'hdf00;
    LUT4 i1_4_lut_adj_0 (.A(\wb_addr[2] ), .B(n10236), .C(\wb_addr[1] ), 
         .D(\wb_addr[0] ), .Z(n4411)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (D))), syn_module_defined=1 */ ;
    defparam i1_4_lut_adj_0.init = 16'hc488;
    LUT4 i3 (.A(n10240), .B(\instr[1] ), .C(n10223), .D(\instr[2] ), 
         .Z(n8)) /* synthesis lut_function=(!((B+((D)+!C))+!A)), syn_module_defined=1 */ ;
    defparam i3.init = 16'h0020;
    LUT4 i4733_2_lut_4_lut (.A(n10240), .B(\instr[1] ), .C(n10223), .D(dout_rb[5]), 
         .Z(n10793[5])) /* synthesis lut_function=(A (B (D)+!B !(C+!(D)))+!A (D)), syn_module_defined=1 */ ;
    defparam i4733_2_lut_4_lut.init = 16'hdf00;
    LUT4 i4734_2_lut_4_lut (.A(n10240), .B(\instr[1] ), .C(n10223), .D(dout_rb[6]), 
         .Z(n10793[6])) /* synthesis lut_function=(A (B (D)+!B !(C+!(D)))+!A (D)), syn_module_defined=1 */ ;
    defparam i4734_2_lut_4_lut.init = 16'hdf00;
    LUT4 i4735_2_lut_4_lut (.A(n10240), .B(\instr[1] ), .C(n10223), .D(dout_rb[7]), 
         .Z(n10793[7])) /* synthesis lut_function=(A (B (D)+!B !(C+!(D)))+!A (D)), syn_module_defined=1 */ ;
    defparam i4735_2_lut_4_lut.init = 16'hdf00;
    LUT4 i2_4_lut (.A(rd), .B(wr), .C(\addr[21] ), .D(\addr[23] ), .Z(n9310)) /* synthesis lut_function=(!(A+((C+(D))+!B))), syn_module_defined=1 */ ;
    defparam i2_4_lut.init = 16'h0004;
    FD1S3DX ext_dout_i7 (.D(dout_rd[7]), .CK(clk_c), .CD(n10682), .Q(wb_data_from_master[7])) /* synthesis syn_module_defined=1 */ ;
    defparam ext_dout_i7.GSR = "DISABLED";
    FD1S3DX ext_dout_i6 (.D(dout_rd[6]), .CK(clk_c), .CD(n10682), .Q(wb_data_from_master[6])) /* synthesis syn_module_defined=1 */ ;
    defparam ext_dout_i6.GSR = "DISABLED";
    FD1S3DX ext_dout_i5 (.D(dout_rd[5]), .CK(clk_c), .CD(n10682), .Q(wb_data_from_master[5])) /* synthesis syn_module_defined=1 */ ;
    defparam ext_dout_i5.GSR = "DISABLED";
    FD1S3DX ext_dout_i4 (.D(dout_rd[4]), .CK(clk_c), .CD(n10682), .Q(wb_data_from_master[4])) /* synthesis syn_module_defined=1 */ ;
    defparam ext_dout_i4.GSR = "DISABLED";
    LUT4 i2_3_lut_4_lut (.A(n10264), .B(n9310), .C(n9208), .D(\wb_addr[1] ), 
         .Z(div_wr_strobe)) /* synthesis lut_function=(!(A+!(B (C (D))))), syn_module_defined=1 */ ;
    defparam i2_3_lut_4_lut.init = 16'h4000;
    FD1S3DX ext_dout_i3 (.D(dout_rd[3]), .CK(clk_c), .CD(n10682), .Q(wb_data_from_master[3])) /* synthesis syn_module_defined=1 */ ;
    defparam ext_dout_i3.GSR = "DISABLED";
    INV i21 (.A(rst_n_reg), .Z(n10682)) /* synthesis syn_module_defined=1 */ ;
    LUT4 mux_19_i1_3_lut (.A(dout_rb[0]), .B(\instr[3] ), .C(n10212), 
         .Z(n10793[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_19_i1_3_lut.init = 16'hcaca;
    AND2 i1_adj_0 (.A(n10259), .B(n10256), .Z(rom_ce)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i1_3_lut_rep_205 (.A(\addr[22] ), .B(ack_reg), .C(\addr[20] ), 
         .Z(n10256)) /* synthesis lut_function=(!((B+(C))+!A)), syn_module_defined=1 */ ;
    defparam i1_3_lut_rep_205.init = 16'h0202;
    LUT4 i1_2_lut_4_lut_adj_0 (.A(\addr[22] ), .B(ack_reg), .C(\addr[20] ), 
         .D(n9310), .Z(n10664)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_4_lut_adj_0.init = 16'h0200;
    FD1S3DX ext_dout_i2 (.D(dout_rd[2]), .CK(clk_c), .CD(n10682), .Q(wb_data_from_master[2])) /* synthesis syn_module_defined=1 */ ;
    defparam ext_dout_i2.GSR = "DISABLED";
    FD1S3DX ext_dout_i1 (.D(dout_rd[1]), .CK(clk_c), .CD(n10682), .Q(wb_data_from_master[1])) /* synthesis syn_module_defined=1 */ ;
    defparam ext_dout_i1.GSR = "DISABLED";
    LUT4 i2_3_lut_rep_170_4_lut (.A(rd), .B(n10250), .C(n9208), .D(\wb_addr[1] ), 
         .Z(n10221)) /* synthesis lut_function=(!((B+((D)+!C))+!A)), syn_module_defined=1 */ ;
    defparam i2_3_lut_rep_170_4_lut.init = 16'h0020;
    FD1S3DX ext_mem_rd_c42 (.D(n53), .CK(clk_c), .CD(n10682), .Q(ext_mem_rd)) /* synthesis syn_module_defined=1 */ ;
    defparam ext_mem_rd_c42.GSR = "DISABLED";
    FD1S3DX ext_mem_wr_c43 (.D(n9303), .CK(clk_c), .CD(n10682), .Q(ext_mem_wr)) /* synthesis syn_module_defined=1 */ ;
    defparam ext_mem_wr_c43.GSR = "DISABLED";
    FD1S3DX ext_dout_i0 (.D(dout_rd[0]), .CK(clk_c), .CD(n10682), .Q(wb_data_from_master[0])) /* synthesis syn_module_defined=1 */ ;
    defparam ext_dout_i0.GSR = "DISABLED";
    FD1S3DX ext_io_rd (.D(n11), .CK(clk_c), .CD(n10682), .Q(rd)) /* synthesis syn_module_defined=1 */ ;
    defparam ext_io_rd.GSR = "DISABLED";
    FD1S3DX ext_io_wr (.D(n9309), .CK(clk_c), .CD(n10682), .Q(wr)) /* synthesis syn_module_defined=1 */ ;
    defparam ext_io_wr.GSR = "DISABLED";
    LUT4 i1_2_lut_adj_0 (.A(\wb_addr[0] ), .B(\wb_addr[2] ), .Z(n9208)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i1_2_lut_adj_0.init = 16'h8888;
    LUT4 i1_2_lut (.A(rd), .B(wr), .Z(n10659)) /* synthesis lut_function=(A+!(B)), syn_module_defined=1 */ ;
    defparam i1_2_lut.init = 16'hbbbb;
    LUT4 i1_4_lut (.A(wr), .B(n10245), .C(read_wait_done), .D(rd), .Z(n9219)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i1_4_lut.init = 16'hc088;
    LUT4 i2 (.A(n10249), .B(\wb_addr[1] ), .C(\wb_addr[2] ), .D(\wb_addr[0] ), 
         .Z(n3377)) /* synthesis lut_function=(!((B+(C+(D)))+!A)), syn_module_defined=1 */ ;
    defparam i2.init = 16'h0002;
    LUT4 i1 (.A(n10249), .B(\wb_addr[1] ), .C(\wb_addr[2] ), .D(\wb_addr[0] ), 
         .Z(n2694)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)), syn_module_defined=1 */ ;
    defparam i1.init = 16'h0200;
    LUT4 i2_3_lut_rep_194 (.A(\addr[23] ), .B(\addr[21] ), .C(n10264), 
         .Z(n10245)) /* synthesis lut_function=(!(((C)+!B)+!A)), syn_module_defined=1 */ ;
    defparam i2_3_lut_rep_194.init = 16'h0808;
    LUT4 i1_2_lut_4_lut (.A(\addr[23] ), .B(\addr[21] ), .C(n10264), .D(n10268), 
         .Z(n9218)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_4_lut.init = 16'h0800;
    LUT4 i2_3_lut_4_lut_adj_0 (.A(n10264), .B(n9310), .C(\wb_addr[0] ), 
         .D(n10258), .Z(n1506)) /* synthesis lut_function=(!(A+!(B (C (D))))), syn_module_defined=1 */ ;
    defparam i2_3_lut_4_lut_adj_0.init = 16'h4000;
    LUT4 mux_19_i2_3_lut (.A(dout_rb[1]), .B(\instr[4] ), .C(n10212), 
         .Z(n10793[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_19_i2_3_lut.init = 16'hcaca;
    LUT4 mux_19_i3_3_lut (.A(dout_rb[2]), .B(\instr[5] ), .C(n10212), 
         .Z(n10793[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_19_i3_3_lut.init = 16'hcaca;
    LUT4 mux_19_i4_3_lut (.A(dout_rb[3]), .B(\instr[6] ), .C(n10212), 
         .Z(n10793[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_19_i4_3_lut.init = 16'hcaca;
    LUT4 mux_19_i5_3_lut (.A(dout_rb[4]), .B(\instr[7] ), .C(n10212), 
         .Z(n10793[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_19_i5_3_lut.init = 16'hcaca;
    LUT4 i1_2_lut_rep_207 (.A(\wb_addr[1] ), .B(\wb_addr[2] ), .Z(n10258)) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_207.init = 16'h2222;
    LUT4 i1_2_lut_3_lut (.A(\wb_addr[1] ), .B(\wb_addr[2] ), .C(\wb_addr[0] ), 
         .Z(n10670)) /* synthesis lut_function=(!((B+(C))+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut.init = 16'h0202;
    LUT4 i2_3_lut_rep_208 (.A(\addr[23] ), .B(\addr[21] ), .C(rd), .Z(n10259)) /* synthesis lut_function=(A (B (C))), syn_module_defined=1 */ ;
    defparam i2_3_lut_rep_208.init = 16'h8080;
    LUT4 i4 (.A(\addr[23] ), .B(\addr[21] ), .C(rd), .D(n10264), .Z(n2642)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)), syn_module_defined=1 */ ;
    defparam i4.init = 16'h0080;
    LUT4 i89_2_lut_rep_166_4_lut (.A(n10236), .B(\wb_addr[1] ), .C(n9208), 
         .D(\ier[2] ), .Z(n10217)) /* synthesis lut_function=(!(A (B (D)+!B !(C+!(D)))+!A (D))), syn_module_defined=1 */ ;
    defparam i89_2_lut_rep_166_4_lut.init = 16'h20ff;
    
endmodule

//
// Verilog Description of module \isp8_idec(PROM_AW=10) 
//

module \isp8_idec(PROM_AW=10)  (n5708, n10210, \instr[16] , \instr[17] , 
            \instr[14] , \instr[13] , n10227, n10240, n10207, n9404, 
            n8409, \instr[15] , update_z, update_c, n8294) /* synthesis syn_module_defined=1 */ ;
    output n5708;
    input n10210;
    input \instr[16] ;
    input \instr[17] ;
    input \instr[14] ;
    input \instr[13] ;
    input n10227;
    input n10240;
    input n10207;
    input n9404;
    output n8409;
    input \instr[15] ;
    output update_z;
    output update_c;
    input n8294;
    
    
    wire n10276, n10275;
    
    INV i4702 (.A(n10210), .Z(n5708)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i1_4_lut_then_4_lut (.A(\instr[16] ), .B(\instr[17] ), .C(\instr[14] ), 
         .D(\instr[13] ), .Z(n10276)) /* synthesis lut_function=(!(A (B)+!A (B (C+(D))))), syn_module_defined=1 */ ;
    defparam i1_4_lut_then_4_lut.init = 16'h3337;
    LUT4 i1_4_lut_else_4_lut (.A(\instr[16] ), .B(\instr[17] ), .C(\instr[14] ), 
         .Z(n10275)) /* synthesis lut_function=(!(A (B+!(C)))), syn_module_defined=1 */ ;
    defparam i1_4_lut_else_4_lut.init = 16'h7575;
    LUT4 i3_4_lut (.A(n10240), .B(n10207), .C(n9404), .D(n10227), .Z(n8409)) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(D))), syn_module_defined=1 */ ;
    defparam i3_4_lut.init = 16'hffec;
    PFUMX i8815 (.BLUT(n10275), .ALUT(n10276), .C0(\instr[15] ), .Z(update_z)) /* synthesis syn_module_defined=1 */ ;
    OR2 i1 (.A(n8294), .B(n10227), .Z(update_c)) /* synthesis syn_module_defined=1 */ ;
    
endmodule

//
// Verilog Description of module \isp8_flow_cntl(PGM_STACK_AW=4,PGM_STACK_AD=16,PROM_AW=10,FAMILY_NAME="XO2") 
//

module \isp8_flow_cntl(PGM_STACK_AW=4,PGM_STACK_AD=16,PROM_AW=10,FAMILY_NAME="XO2")  (clk_c, 
            n10682, addr_cyc, instr, n10237, \dout_stack_w_cz[10] , 
            sp_we, n10240, n10222, data_cyc, zero_flag, n3587, cout_alu, 
            update_c, ret_cycle_type, push_enb, n10223, n10226, n9404, 
            br_enb, n6_adj_0, n10219, clrc, n5708, n5892, din_rd1, 
            dout_alu, n11, n9309, carry_flag, n8409, n8, n8279, 
            ext_mem_rd, \wb_ack[10] , ext_mem_wr, \wb_ack[0] , ack_reg, 
            n9581, n3, update_z, n3657, n10239, wb_rst, io_rdy, 
            n10216, n10218, n10243, n232, n53, n10209, n10207) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    input n10682;
    output addr_cyc;
    output [17:0]instr;
    output n10237;
    output \dout_stack_w_cz[10] ;
    input sp_we;
    output n10240;
    output n10222;
    output data_cyc;
    output zero_flag;
    input n3587;
    input cout_alu;
    input update_c;
    input ret_cycle_type;
    input push_enb;
    output n10223;
    output n10226;
    output n9404;
    input br_enb;
    output n6_adj_0;
    output n10219;
    output clrc;
    input n5708;
    input n5892;
    output [7:0]din_rd1;
    input [7:0]dout_alu;
    output n11;
    output n9309;
    output carry_flag;
    input n8409;
    input n8;
    input n8279;
    input ext_mem_rd;
    input \wb_ack[10] ;
    input ext_mem_wr;
    input \wb_ack[0] ;
    output ack_reg;
    input n9581;
    input n3;
    input update_z;
    output n3657;
    input n10239;
    input wb_rst;
    input io_rdy;
    output n10216;
    output n10218;
    output n10243;
    input n232;
    output n53;
    input n10209;
    input n10207;
    
    wire [9:0]addr_jmp_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(174[36:48])
    wire [9:0]pc_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(147[36:42])
    wire [3:0]stack_ptr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(162[36:45])
    wire [9:0]dout_stack;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(151[36:46])
    wire [11:0]dout_stack_w_cz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(152[36:51])
    wire [11:0]din_stack_w_cz;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(153[36:50])
    wire [9:0]pc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(167[36:38])
    wire [9:0]prom_addr;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(113[30:39])
    wire ret_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(171[36:43])
    wire ext_addr_cyc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(76[21:33])
    wire br_enb_reg;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_flow_cntl.v(176[36:46])
    wire setc;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(95[48:52])
    wire prom_enable;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(114[30:41])
    
    wire n10274, GND_net, VCC_net, n227, n4, n9402, n8801, n8312, 
        n249, n9115, n242, n1991, n10214, n3388, n8601, n8599, 
        n10163, n8125, n116, n8126;
    wire [3:0]n18;
    
    wire n9108, n9190, n10278, n10004, n9442, n3_c, n82, n5, 
        n9109, n10, n14, n8123, n8124, n8127, n241, n10161, 
        n10162;
    
    FD1P3DX addr_jmp_reg_i0_i0_i3 (.D(instr[3]), .SP(addr_cyc), .CK(clk_c), 
            .CD(n10682), .Q(addr_jmp_reg[3])) /* synthesis syn_module_defined=1 */ ;
    defparam addr_jmp_reg_i0_i0_i3.GSR = "DISABLED";
    FD1P3DX addr_jmp_reg_i0_i0_i2 (.D(instr[2]), .SP(addr_cyc), .CK(clk_c), 
            .CD(n10682), .Q(addr_jmp_reg[2])) /* synthesis syn_module_defined=1 */ ;
    defparam addr_jmp_reg_i0_i0_i2.GSR = "DISABLED";
    FD1P3DX addr_jmp_reg_i0_i0_i1 (.D(instr[1]), .SP(addr_cyc), .CK(clk_c), 
            .CD(n10682), .Q(addr_jmp_reg[1])) /* synthesis syn_module_defined=1 */ ;
    defparam addr_jmp_reg_i0_i0_i1.GSR = "DISABLED";
    LUT4 i1_2_lut_rep_186 (.A(instr[15]), .B(instr[14]), .Z(n10237)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_186.init = 16'h8888;
    FD1S3BX addr_cyc_int (.D(n10274), .CK(clk_c), .PD(n10682), .Q(addr_cyc)) /* synthesis syn_module_defined=1 */ ;
    defparam addr_cyc_int.GSR = "DISABLED";
    pmi_distributed_spramXbnonen12416 pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg12416 (.Address({stack_ptr}), 
            .Data({din_stack_w_cz[11:10], pc_int}), .Q({dout_stack_w_cz[11], 
            \dout_stack_w_cz[10] , dout_stack}), .Clock(clk_c), .ClockEn(VCC_net), 
            .WE(sp_we), .Reset(GND_net)) /* synthesis syn_instantiated=1, syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(234[23] 278[9])
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg12416.module_type = "pmi_distributed_spram";
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg12416.pmi_family = "XO2";
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg12416.pmi_init_file_format = "binary";
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg12416.pmi_init_file = "none";
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg12416.pmi_regmode = "noreg";
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg12416.pmi_data_width = 12;
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg12416.pmi_addr_width = 4;
    defparam pmi_distributed_sprampmi_distributed_spramXO2binarynonenoreg12416.pmi_addr_depth = 16;
    LUT4 i1_3_lut_rep_171_4_lut (.A(instr[15]), .B(instr[14]), .C(instr[2]), 
         .D(n10240), .Z(n10222)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)), syn_module_defined=1 */ ;
    defparam i1_3_lut_rep_171_4_lut.init = 16'h0800;
    FD1P3DX pc_i0_i0_i0 (.D(prom_addr[0]), .SP(data_cyc), .CK(clk_c), 
            .CD(n10682), .Q(pc[0])) /* synthesis syn_module_defined=1 */ ;
    defparam pc_i0_i0_i0.GSR = "DISABLED";
    FD1S3DX i1093 (.D(n3587), .CK(clk_c), .CD(n10682), .Q(zero_flag)) /* synthesis syn_module_defined=1 */ ;
    defparam i1093.GSR = "DISABLED";
    AND2 i105 (.A(update_c), .B(cout_alu), .Z(n227)) /* synthesis syn_module_defined=1 */ ;
    FD1S3DX ret_reg_c (.D(ret_cycle_type), .CK(clk_c), .CD(n10682), .Q(ret_reg)) /* synthesis syn_module_defined=1 */ ;
    defparam ret_reg_c.GSR = "DISABLED";
    LUT4 i7027_4_lut_3_lut_4_lut (.A(stack_ptr[1]), .B(stack_ptr[0]), .C(data_cyc), 
         .D(push_enb), .Z(n4)) /* synthesis lut_function=(A (B+!(C (D)))+!A !((C (D))+!B)), syn_module_defined=1 */ ;
    defparam i7027_4_lut_3_lut_4_lut.init = 16'h8eee;
    FD1S3DX data_cyc_int (.D(n9402), .CK(clk_c), .CD(n10682), .Q(data_cyc)) /* synthesis syn_module_defined=1 */ ;
    defparam data_cyc_int.GSR = "DISABLED";
    LUT4 i1_2_lut_rep_172_3_lut (.A(instr[15]), .B(instr[14]), .C(instr[13]), 
         .Z(n10223)) /* synthesis lut_function=(A (B (C))), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_172_3_lut.init = 16'h8080;
    FD1S3BX ext_addr_cyc_int (.D(n8801), .CK(clk_c), .PD(n10682), .Q(ext_addr_cyc)) /* synthesis syn_module_defined=1 */ ;
    defparam ext_addr_cyc_int.GSR = "DISABLED";
    LUT4 i1_2_lut_rep_175_3_lut (.A(instr[15]), .B(instr[14]), .C(instr[1]), 
         .Z(n10226)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_175_3_lut.init = 16'h7070;
    INV equal_126_i16 (.A(n8312), .Z(n249)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i1_2_lut_3_lut_4_lut (.A(instr[15]), .B(instr[14]), .C(n9115), 
         .D(instr[1]), .Z(n9404)) /* synthesis lut_function=(A (B (C)+!B (C+(D)))+!A (C+(D))), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'hf7f0;
    FD1P3DX i1097 (.D(br_enb), .SP(addr_cyc), .CK(clk_c), .CD(n10682), 
            .Q(br_enb_reg)) /* synthesis syn_module_defined=1 */ ;
    defparam i1097.GSR = "DISABLED";
    FD1P3DX addr_jmp_reg_i0_i0_i0 (.D(instr[0]), .SP(addr_cyc), .CK(clk_c), 
            .CD(n10682), .Q(addr_jmp_reg[0])) /* synthesis syn_module_defined=1 */ ;
    defparam addr_jmp_reg_i0_i0_i0.GSR = "DISABLED";
    LUT4 i1_2_lut_rep_189 (.A(instr[17]), .B(instr[16]), .Z(n10240)) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_189.init = 16'h2222;
    LUT4 i1_2_lut_3_lut (.A(instr[17]), .B(instr[16]), .C(instr[2]), .Z(n6_adj_0)) /* synthesis lut_function=(!((B+!(C))+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut.init = 16'h2020;
    LUT4 i1_2_lut_rep_168_3_lut (.A(instr[17]), .B(instr[16]), .C(instr[15]), 
         .Z(n10219)) /* synthesis lut_function=(!((B+!(C))+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_168_3_lut.init = 16'h2020;
    LUT4 i1_3_lut_4_lut_adj_0 (.A(instr[17]), .B(instr[16]), .C(instr[0]), 
         .D(n9115), .Z(setc)) /* synthesis lut_function=(!((B+!(C (D)))+!A)), syn_module_defined=1 */ ;
    defparam i1_3_lut_4_lut_adj_0.init = 16'h2000;
    LUT4 i1_3_lut_4_lut (.A(instr[17]), .B(instr[16]), .C(instr[0]), .D(n9115), 
         .Z(clrc)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)), syn_module_defined=1 */ ;
    defparam i1_3_lut_4_lut.init = 16'h0200;
    pmi_romXhprom_initadn18101024 \pmi_rompmi_romXO2hexprom_init.hexasyncdisablenoreg18101024  (.Address({prom_addr}), 
            .Q({instr}), .OutClock(clk_c), .OutClockEn(prom_enable), .Reset(GND_net)) /* synthesis syn_instantiated=1, syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/lm8_top.v(103[18] 119[19])
    defparam \pmi_rompmi_romXO2hexprom_init.hexasyncdisablenoreg18101024 .module_type = "pmi_rom";
    defparam \pmi_rompmi_romXO2hexprom_init.hexasyncdisablenoreg18101024 .pmi_family = "XO2";
    defparam \pmi_rompmi_romXO2hexprom_init.hexasyncdisablenoreg18101024 .pmi_init_file_format = "hex";
    defparam \pmi_rompmi_romXO2hexprom_init.hexasyncdisablenoreg18101024 .pmi_init_file = "prom_init.hex";
    defparam \pmi_rompmi_romXO2hexprom_init.hexasyncdisablenoreg18101024 .pmi_resetmode = "async";
    defparam \pmi_rompmi_romXO2hexprom_init.hexasyncdisablenoreg18101024 .pmi_gsr = "disable";
    defparam \pmi_rompmi_romXO2hexprom_init.hexasyncdisablenoreg18101024 .pmi_regmode = "noreg";
    defparam \pmi_rompmi_romXO2hexprom_init.hexasyncdisablenoreg18101024 .pmi_data_width = 18;
    defparam \pmi_rompmi_romXO2hexprom_init.hexasyncdisablenoreg18101024 .pmi_addr_width = 10;
    defparam \pmi_rompmi_romXO2hexprom_init.hexasyncdisablenoreg18101024 .pmi_addr_depth = 1024;
    AND2 i4703 (.A(n242), .B(n5708), .Z(din_stack_w_cz[10])) /* synthesis syn_module_defined=1 */ ;
    AND2 i4698 (.A(n1991), .B(n5892), .Z(din_stack_w_cz[11])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i166_2_lut_rep_163 (.A(data_cyc), .B(push_enb), .Z(n10214)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i166_2_lut_rep_163.init = 16'h8888;
    LUT4 i4527_3_lut_4_lut (.A(data_cyc), .B(push_enb), .C(ret_cycle_type), 
         .D(addr_cyc), .Z(n3388)) /* synthesis lut_function=(A (B+(C (D)))+!A (C (D))), syn_module_defined=1 */ ;
    defparam i4527_3_lut_4_lut.init = 16'hf888;
    FD1S3DX din_rd1_i0 (.D(dout_alu[0]), .CK(clk_c), .CD(n10682), .Q(din_rd1[0])) /* synthesis syn_module_defined=1 */ ;
    defparam din_rd1_i0.GSR = "DISABLED";
    LUT4 i2_3_lut_4_lut_adj_0 (.A(data_cyc), .B(push_enb), .C(n4), .D(stack_ptr[2]), 
         .Z(n8601)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(C (D)+!C !(D)))), syn_module_defined=1 */ ;
    defparam i2_3_lut_4_lut_adj_0.init = 16'h7887;
    LUT4 i2_3_lut_4_lut (.A(data_cyc), .B(push_enb), .C(stack_ptr[0]), 
         .D(stack_ptr[1]), .Z(n8599)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(C (D)+!C !(D)))), syn_module_defined=1 */ ;
    defparam i2_3_lut_4_lut.init = 16'h7887;
    LUT4 mux_98_i8_3_lut (.A(pc_int[7]), .B(dout_stack[7]), .C(ret_reg), 
         .Z(prom_addr[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_98_i8_3_lut.init = 16'hcaca;
    FD1S3DX din_rd1_i1 (.D(dout_alu[1]), .CK(clk_c), .CD(n10682), .Q(din_rd1[1])) /* synthesis syn_module_defined=1 */ ;
    defparam din_rd1_i1.GSR = "DISABLED";
    OR2 i4696 (.A(n227), .B(setc), .Z(n1991)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i11_2_lut_3_lut_4_lut_4_lut (.A(n10274), .B(instr[13]), .C(n10222), 
         .D(instr[0]), .Z(n11)) /* synthesis lut_function=(!(A+!(B (C (D))))), syn_module_defined=1 */ ;
    defparam i11_2_lut_3_lut_4_lut_4_lut.init = 16'h4000;
    FD1S3DX din_rd1_i2 (.D(dout_alu[2]), .CK(clk_c), .CD(n10682), .Q(din_rd1[2])) /* synthesis syn_module_defined=1 */ ;
    defparam din_rd1_i2.GSR = "DISABLED";
    FD1S3DX din_rd1_i3 (.D(dout_alu[3]), .CK(clk_c), .CD(n10682), .Q(din_rd1[3])) /* synthesis syn_module_defined=1 */ ;
    defparam din_rd1_i3.GSR = "DISABLED";
    LUT4 i1_2_lut_3_lut_4_lut_4_lut (.A(n10274), .B(instr[0]), .C(n10222), 
         .D(instr[13]), .Z(n9309)) /* synthesis lut_function=(!(A+(B+!(C (D))))), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut_4_lut_4_lut.init = 16'h1000;
    FD1S3DX din_rd1_i4 (.D(dout_alu[4]), .CK(clk_c), .CD(n10682), .Q(din_rd1[4])) /* synthesis syn_module_defined=1 */ ;
    defparam din_rd1_i4.GSR = "DISABLED";
    FD1S3DX din_rd1_i5 (.D(dout_alu[5]), .CK(clk_c), .CD(n10682), .Q(din_rd1[5])) /* synthesis syn_module_defined=1 */ ;
    defparam din_rd1_i5.GSR = "DISABLED";
    FD1S3DX din_rd1_i6 (.D(dout_alu[6]), .CK(clk_c), .CD(n10682), .Q(din_rd1[6])) /* synthesis syn_module_defined=1 */ ;
    defparam din_rd1_i6.GSR = "DISABLED";
    FD1S3DX din_rd1_i7 (.D(dout_alu[7]), .CK(clk_c), .CD(n10682), .Q(din_rd1[7])) /* synthesis syn_module_defined=1 */ ;
    defparam din_rd1_i7.GSR = "DISABLED";
    FD1P3DX i1111 (.D(n10163), .SP(n8409), .CK(clk_c), .CD(n10682), 
            .Q(carry_flag)) /* synthesis syn_module_defined=1 */ ;
    defparam i1111.GSR = "DISABLED";
    CCU2D add_491_7 (.A0(addr_jmp_reg[5]), .B0(n116), .C0(pc[5]), .D0(GND_net), 
          .A1(addr_jmp_reg[6]), .B1(n116), .C1(pc[6]), .D1(GND_net), 
          .CIN(n8125), .COUT(n8126), .S0(pc_int[5]), .S1(pc_int[6])) /* synthesis syn_module_defined=1 */ ;
    defparam add_491_7.INIT0 = 16'h7878;
    defparam add_491_7.INIT1 = 16'h7878;
    defparam add_491_7.INJECT1_0 = "NO";
    defparam add_491_7.INJECT1_1 = "NO";
    LUT4 mux_98_i9_3_lut (.A(pc_int[8]), .B(dout_stack[8]), .C(ret_reg), 
         .Z(prom_addr[8])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_98_i9_3_lut.init = 16'hcaca;
    FD1P3DX stack_ptr_759__i0 (.D(n18[0]), .SP(n3388), .CK(clk_c), .CD(n10682), 
            .Q(stack_ptr[0])) /* synthesis syn_module_defined=1 */ ;
    defparam stack_ptr_759__i0.GSR = "DISABLED";
    LUT4 i1_4_lut_adj_0 (.A(n8), .B(addr_cyc), .C(n9190), .D(n9108), 
         .Z(n8801)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))), syn_module_defined=1 */ ;
    defparam i1_4_lut_adj_0.init = 16'hfac8;
    LUT4 addr_cyc_bdd_4_lut (.A(addr_cyc), .B(instr[16]), .C(instr[17]), 
         .D(n10223), .Z(n10278)) /* synthesis lut_function=(A (B+!(C (D)))), syn_module_defined=1 */ ;
    defparam addr_cyc_bdd_4_lut.init = 16'h8aaa;
    LUT4 stack_ptr_3__bdd_4_lut (.A(stack_ptr[3]), .B(n10214), .C(stack_ptr[2]), 
         .D(n4), .Z(n10004)) /* synthesis lut_function=(!(A (B (C (D))+!B !(C+(D)))+!A !(B (C (D))+!B !(C+(D))))), syn_module_defined=1 */ ;
    defparam stack_ptr_3__bdd_4_lut.init = 16'h6aa9;
    LUT4 i5 (.A(n10240), .B(n10223), .C(instr[2]), .D(instr[1]), .Z(n9190)) /* synthesis lut_function=(A (B (C+(D)))), syn_module_defined=1 */ ;
    defparam i5.init = 16'h8880;
    LUT4 i2_3_lut (.A(n8279), .B(ext_addr_cyc), .C(n9442), .Z(n9108)) /* synthesis lut_function=(!(A+((C)+!B))), syn_module_defined=1 */ ;
    defparam i2_3_lut.init = 16'h0404;
    LUT4 i8362_4_lut (.A(ext_mem_rd), .B(\wb_ack[10] ), .C(ext_mem_wr), 
         .D(\wb_ack[0] ), .Z(n9442)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i8362_4_lut.init = 16'hfffe;
    LUT4 i8614_4_lut (.A(n10278), .B(instr[13]), .C(n3_c), .D(instr[14]), 
         .Z(n9402)) /* synthesis lut_function=(A+!((C+!(D))+!B)), syn_module_defined=1 */ ;
    defparam i8614_4_lut.init = 16'haeaa;
    LUT4 i2_4_lut (.A(instr[15]), .B(n5), .C(ext_addr_cyc), .D(n82), 
         .Z(n3_c)) /* synthesis lut_function=((B+((D)+!C))+!A), syn_module_defined=1 */ ;
    defparam i2_4_lut.init = 16'hffdf;
    LUT4 i4 (.A(n9109), .B(instr[2]), .C(instr[0]), .D(n10240), .Z(n5)) /* synthesis lut_function=(A+!(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i4.init = 16'haaab;
    LUT4 i3 (.A(instr[17]), .B(instr[0]), .C(instr[16]), .D(instr[2]), 
         .Z(n82)) /* synthesis lut_function=(A (B (C)+!B (C (D)))+!A (B+(D))), syn_module_defined=1 */ ;
    defparam i3.init = 16'hf5c4;
    FD1P3DX stack_ptr_759__i1 (.D(n8599), .SP(n3388), .CK(clk_c), .CD(n10682), 
            .Q(stack_ptr[1])) /* synthesis syn_module_defined=1 */ ;
    defparam stack_ptr_759__i1.GSR = "DISABLED";
    FD1P3DX stack_ptr_759__i2 (.D(n8601), .SP(n3388), .CK(clk_c), .CD(n10682), 
            .Q(stack_ptr[2])) /* synthesis syn_module_defined=1 */ ;
    defparam stack_ptr_759__i2.GSR = "DISABLED";
    LUT4 i1_4_lut (.A(n9442), .B(n9581), .C(n3), .D(ack_reg), .Z(n9109)) /* synthesis lut_function=(!(A+!(B+(C+(D))))), syn_module_defined=1 */ ;
    defparam i1_4_lut.init = 16'h5554;
    FD1P3DX stack_ptr_759__i3 (.D(n10004), .SP(n3388), .CK(clk_c), .CD(n10682), 
            .Q(stack_ptr[3])) /* synthesis syn_module_defined=1 */ ;
    defparam stack_ptr_759__i3.GSR = "DISABLED";
    LUT4 i2648_3_lut (.A(zero_flag), .B(n8312), .C(update_z), .Z(n3657)) /* synthesis lut_function=(!(A (B (C))+!A (B+!(C)))), syn_module_defined=1 */ ;
    defparam i2648_3_lut.init = 16'h3a3a;
    LUT4 i7_4_lut (.A(din_rd1[0]), .B(n14), .C(n10), .D(din_rd1[6]), 
         .Z(n8312)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i7_4_lut.init = 16'hfffe;
    CCU2D add_491_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(pc[0]), .B1(br_enb_reg), .C1(data_cyc), .D1(addr_jmp_reg[0]), 
          .COUT(n8123), .S1(pc_int[0])) /* synthesis syn_module_defined=1 */ ;
    defparam add_491_1.INIT0 = 16'hF000;
    defparam add_491_1.INIT1 = 16'h5595;
    defparam add_491_1.INJECT1_0 = "NO";
    defparam add_491_1.INJECT1_1 = "NO";
    CCU2D add_491_3 (.A0(addr_jmp_reg[1]), .B0(n116), .C0(pc[1]), .D0(GND_net), 
          .A1(addr_jmp_reg[2]), .B1(n116), .C1(pc[2]), .D1(GND_net), 
          .CIN(n8123), .COUT(n8124), .S0(pc_int[1]), .S1(pc_int[2])) /* synthesis syn_module_defined=1 */ ;
    defparam add_491_3.INIT0 = 16'h7878;
    defparam add_491_3.INIT1 = 16'h7878;
    defparam add_491_3.INJECT1_0 = "NO";
    defparam add_491_3.INJECT1_1 = "NO";
    LUT4 i6_4_lut (.A(din_rd1[3]), .B(din_rd1[1]), .C(din_rd1[5]), .D(din_rd1[7]), 
         .Z(n14)) /* synthesis lut_function=(A+(B+(C+(D)))), syn_module_defined=1 */ ;
    defparam i6_4_lut.init = 16'hfffe;
    LUT4 mux_98_i7_3_lut (.A(pc_int[6]), .B(dout_stack[6]), .C(ret_reg), 
         .Z(prom_addr[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_98_i7_3_lut.init = 16'hcaca;
    LUT4 mux_98_i10_3_lut (.A(pc_int[9]), .B(dout_stack[9]), .C(ret_reg), 
         .Z(prom_addr[9])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_98_i10_3_lut.init = 16'hcaca;
    LUT4 i2_4_lut_adj_0 (.A(n10239), .B(instr[14]), .C(instr[13]), .D(instr[2]), 
         .Z(n9115)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)), syn_module_defined=1 */ ;
    defparam i2_4_lut_adj_0.init = 16'h0008;
    LUT4 i88_2_lut (.A(br_enb_reg), .B(data_cyc), .Z(n116)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i88_2_lut.init = 16'h8888;
    CCU2D add_491_9 (.A0(addr_jmp_reg[7]), .B0(n116), .C0(pc[7]), .D0(GND_net), 
          .A1(addr_jmp_reg[8]), .B1(n116), .C1(pc[8]), .D1(GND_net), 
          .CIN(n8126), .COUT(n8127), .S0(pc_int[7]), .S1(pc_int[8])) /* synthesis syn_module_defined=1 */ ;
    defparam add_491_9.INIT0 = 16'h7878;
    defparam add_491_9.INIT1 = 16'h7878;
    defparam add_491_9.INJECT1_0 = "NO";
    defparam add_491_9.INJECT1_1 = "NO";
    LUT4 i2_2_lut (.A(din_rd1[2]), .B(din_rd1[4]), .Z(n10)) /* synthesis lut_function=(A+(B)), syn_module_defined=1 */ ;
    defparam i2_2_lut.init = 16'heeee;
    CCU2D add_491_11 (.A0(addr_jmp_reg[9]), .B0(n116), .C0(pc[9]), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n8127), 
          .S0(pc_int[9])) /* synthesis syn_module_defined=1 */ ;
    defparam add_491_11.INIT0 = 16'h7878;
    defparam add_491_11.INIT1 = 16'h0000;
    defparam add_491_11.INJECT1_0 = "NO";
    defparam add_491_11.INJECT1_1 = "NO";
    CCU2D add_491_5 (.A0(addr_jmp_reg[3]), .B0(n116), .C0(pc[3]), .D0(GND_net), 
          .A1(addr_jmp_reg[4]), .B1(n116), .C1(pc[4]), .D1(GND_net), 
          .CIN(n8124), .COUT(n8125), .S0(pc_int[3]), .S1(pc_int[4])) /* synthesis syn_module_defined=1 */ ;
    defparam add_491_5.INIT0 = 16'h7878;
    defparam add_491_5.INIT1 = 16'h7878;
    defparam add_491_5.INJECT1_0 = "NO";
    defparam add_491_5.INJECT1_1 = "NO";
    FD1S3IX ack_reg_c47 (.D(io_rdy), .CK(clk_c), .CD(wb_rst), .Q(ack_reg)) /* synthesis syn_module_defined=1 */ ;
    defparam ack_reg_c47.GSR = "DISABLED";
    LUT4 i1_2_lut_rep_165_4_lut (.A(n10240), .B(n10237), .C(instr[2]), 
         .D(instr[0]), .Z(n10216)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_165_4_lut.init = 16'h0800;
    LUT4 i8611_2_lut_rep_223 (.A(addr_cyc), .B(ext_addr_cyc), .Z(n10274)) /* synthesis lut_function=(!(A+(B))), syn_module_defined=1 */ ;
    defparam i8611_2_lut_rep_223.init = 16'h1111;
    LUT4 i1_2_lut_rep_167_4_lut (.A(n10240), .B(n10237), .C(instr[2]), 
         .D(instr[0]), .Z(n10218)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_167_4_lut.init = 16'h0008;
    LUT4 i1_2_lut_rep_192_2_lut_3_lut (.A(addr_cyc), .B(ext_addr_cyc), .C(instr[13]), 
         .Z(n10243)) /* synthesis lut_function=(A (C)+!A (B (C))), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_192_2_lut_3_lut.init = 16'he0e0;
    LUT4 i29_2_lut_2_lut_3_lut (.A(addr_cyc), .B(ext_addr_cyc), .C(n232), 
         .Z(n53)) /* synthesis lut_function=(A (C)+!A (B (C))), syn_module_defined=1 */ ;
    defparam i29_2_lut_2_lut_3_lut.init = 16'he0e0;
    OR2 i4701 (.A(n241), .B(n10209), .Z(n242)) /* synthesis syn_module_defined=1 */ ;
    AND2 i119 (.A(update_z), .B(n249), .Z(n241)) /* synthesis syn_module_defined=1 */ ;
    INV i7020 (.A(stack_ptr[0]), .Z(n18[0])) /* synthesis syn_module_defined=1 */ ;
    LUT4 mux_98_i1_3_lut (.A(pc_int[0]), .B(dout_stack[0]), .C(ret_reg), 
         .Z(prom_addr[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_98_i1_3_lut.init = 16'hcaca;
    LUT4 mux_98_i2_3_lut (.A(pc_int[1]), .B(dout_stack[1]), .C(ret_reg), 
         .Z(prom_addr[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_98_i2_3_lut.init = 16'hcaca;
    LUT4 mux_98_i3_3_lut (.A(pc_int[2]), .B(dout_stack[2]), .C(ret_reg), 
         .Z(prom_addr[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_98_i3_3_lut.init = 16'hcaca;
    LUT4 mux_98_i4_3_lut (.A(pc_int[3]), .B(dout_stack[3]), .C(ret_reg), 
         .Z(prom_addr[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_98_i4_3_lut.init = 16'hcaca;
    OR2 i39 (.A(data_cyc), .B(n10682), .Z(prom_enable)) /* synthesis syn_module_defined=1 */ ;
    FD1P3DX addr_jmp_reg_i0_i0_i8 (.D(instr[8]), .SP(addr_cyc), .CK(clk_c), 
            .CD(n10682), .Q(addr_jmp_reg[8])) /* synthesis syn_module_defined=1 */ ;
    defparam addr_jmp_reg_i0_i0_i8.GSR = "DISABLED";
    FD1P3DX addr_jmp_reg_i0_i0_i7 (.D(instr[7]), .SP(addr_cyc), .CK(clk_c), 
            .CD(n10682), .Q(addr_jmp_reg[7])) /* synthesis syn_module_defined=1 */ ;
    defparam addr_jmp_reg_i0_i0_i7.GSR = "DISABLED";
    LUT4 mux_98_i5_3_lut (.A(pc_int[4]), .B(dout_stack[4]), .C(ret_reg), 
         .Z(prom_addr[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_98_i5_3_lut.init = 16'hcaca;
    FD1P3DX addr_jmp_reg_i0_i0_i6 (.D(instr[6]), .SP(addr_cyc), .CK(clk_c), 
            .CD(n10682), .Q(addr_jmp_reg[6])) /* synthesis syn_module_defined=1 */ ;
    defparam addr_jmp_reg_i0_i0_i6.GSR = "DISABLED";
    LUT4 mux_98_i6_3_lut (.A(pc_int[5]), .B(dout_stack[5]), .C(ret_reg), 
         .Z(prom_addr[5])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_98_i6_3_lut.init = 16'hcaca;
    PFUMX i8803 (.BLUT(n10162), .ALUT(n10161), .C0(n10207), .Z(n10163)) /* synthesis syn_module_defined=1 */ ;
    FD1P3DX addr_jmp_reg_i0_i0_i5 (.D(instr[5]), .SP(addr_cyc), .CK(clk_c), 
            .CD(n10682), .Q(addr_jmp_reg[5])) /* synthesis syn_module_defined=1 */ ;
    defparam addr_jmp_reg_i0_i0_i5.GSR = "DISABLED";
    LUT4 dout_stack_w_cz_11__bdd_4_lut (.A(cout_alu), .B(n9115), .C(n10240), 
         .D(instr[0]), .Z(n10162)) /* synthesis lut_function=(A (((D)+!C)+!B)+!A (B (C (D)))), syn_module_defined=1 */ ;
    defparam dout_stack_w_cz_11__bdd_4_lut.init = 16'hea2a;
    LUT4 i8802 (.A(dout_stack_w_cz[11]), .B(n9115), .C(n10240), .D(instr[0]), 
         .Z(n10161)) /* synthesis lut_function=(A (((D)+!C)+!B)+!A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i8802.init = 16'hea2a;
    FD1P3DX pc_i0_i0_i9 (.D(prom_addr[9]), .SP(data_cyc), .CK(clk_c), 
            .CD(n10682), .Q(pc[9])) /* synthesis syn_module_defined=1 */ ;
    defparam pc_i0_i0_i9.GSR = "DISABLED";
    FD1P3DX pc_i0_i0_i8 (.D(prom_addr[8]), .SP(data_cyc), .CK(clk_c), 
            .CD(n10682), .Q(pc[8])) /* synthesis syn_module_defined=1 */ ;
    defparam pc_i0_i0_i8.GSR = "DISABLED";
    FD1P3DX pc_i0_i0_i7 (.D(prom_addr[7]), .SP(data_cyc), .CK(clk_c), 
            .CD(n10682), .Q(pc[7])) /* synthesis syn_module_defined=1 */ ;
    defparam pc_i0_i0_i7.GSR = "DISABLED";
    FD1P3DX pc_i0_i0_i6 (.D(prom_addr[6]), .SP(data_cyc), .CK(clk_c), 
            .CD(n10682), .Q(pc[6])) /* synthesis syn_module_defined=1 */ ;
    defparam pc_i0_i0_i6.GSR = "DISABLED";
    FD1P3DX pc_i0_i0_i5 (.D(prom_addr[5]), .SP(data_cyc), .CK(clk_c), 
            .CD(n10682), .Q(pc[5])) /* synthesis syn_module_defined=1 */ ;
    defparam pc_i0_i0_i5.GSR = "DISABLED";
    FD1P3DX pc_i0_i0_i4 (.D(prom_addr[4]), .SP(data_cyc), .CK(clk_c), 
            .CD(n10682), .Q(pc[4])) /* synthesis syn_module_defined=1 */ ;
    defparam pc_i0_i0_i4.GSR = "DISABLED";
    FD1P3DX pc_i0_i0_i3 (.D(prom_addr[3]), .SP(data_cyc), .CK(clk_c), 
            .CD(n10682), .Q(pc[3])) /* synthesis syn_module_defined=1 */ ;
    defparam pc_i0_i0_i3.GSR = "DISABLED";
    FD1P3DX pc_i0_i0_i2 (.D(prom_addr[2]), .SP(data_cyc), .CK(clk_c), 
            .CD(n10682), .Q(pc[2])) /* synthesis syn_module_defined=1 */ ;
    defparam pc_i0_i0_i2.GSR = "DISABLED";
    FD1P3DX addr_jmp_reg_i0_i0_i4 (.D(instr[4]), .SP(addr_cyc), .CK(clk_c), 
            .CD(n10682), .Q(addr_jmp_reg[4])) /* synthesis syn_module_defined=1 */ ;
    defparam addr_jmp_reg_i0_i0_i4.GSR = "DISABLED";
    FD1P3DX pc_i0_i0_i1 (.D(prom_addr[1]), .SP(data_cyc), .CK(clk_c), 
            .CD(n10682), .Q(pc[1])) /* synthesis syn_module_defined=1 */ ;
    defparam pc_i0_i0_i1.GSR = "DISABLED";
    FD1P3DX addr_jmp_reg_i0_i0_i9 (.D(instr[9]), .SP(addr_cyc), .CK(clk_c), 
            .CD(n10682), .Q(addr_jmp_reg[9])) /* synthesis syn_module_defined=1 */ ;
    defparam addr_jmp_reg_i0_i0_i9.GSR = "DISABLED";
    VHI i2 (.Z(VCC_net));
    VLO i1 (.Z(GND_net));
    
endmodule

//
// Verilog Description of module \isp8_alu(FAMILY_NAME="XO2") 
//

module \isp8_alu(FAMILY_NAME="XO2")  (\instr[13] , n10216, \data_in[7] , 
            \din_rd1[7] , n235, n10227, \instr[15] , \instr[14] , 
            \instr[16] , \instr[17] , n10219, \instr[1] , \instr[0] , 
            dout_rb, \instr[7] , dout_alu, n5892, clrc, \instr[6] , 
            n10240, n10237, n10212, \data_in[0] , \din_rd1[0] , n242, 
            dout_rd, n8294, n10226, push_enb, sp_we, addr_cyc, \instr[5] , 
            n6_adj_0, n10243, n9303, n10222, n10206, n232, n8973, 
            \instr[4] , \instr[3] , \instr[2] , instr_l1_0, carry_flag, 
            \data_in[4] , \din_rd1[4] , n238, \data_in[1] , \din_rd1[1] , 
            n241, n10233, \instr[12] , zero_flag, n10239, \data_in[5] , 
            \din_rd1[5] , n237, \data_in[6] , \din_rd1[6] , n236, 
            n10232, ret_cycle_type, br_enb, n10207, n10213, \dout_stack_w_cz[10] , 
            n3657, n3658, cout_alu) /* synthesis syn_module_defined=1 */ ;
    input \instr[13] ;
    input n10216;
    input \data_in[7] ;
    input \din_rd1[7] ;
    output n235;
    output n10227;
    input \instr[15] ;
    input \instr[14] ;
    input \instr[16] ;
    input \instr[17] ;
    input n10219;
    input \instr[1] ;
    input \instr[0] ;
    input [7:0]dout_rb;
    input \instr[7] ;
    output [7:0]dout_alu;
    output n5892;
    input clrc;
    input \instr[6] ;
    input n10240;
    input n10237;
    output n10212;
    input \data_in[0] ;
    input \din_rd1[0] ;
    output n242;
    input [7:0]dout_rd;
    output n8294;
    input n10226;
    output push_enb;
    output sp_we;
    input addr_cyc;
    input \instr[5] ;
    input n6_adj_0;
    input n10243;
    output n9303;
    input n10222;
    output n10206;
    input n232;
    output n8973;
    input \instr[4] ;
    input \instr[3] ;
    input \instr[2] ;
    input instr_l1_0;
    input carry_flag;
    input \data_in[4] ;
    input \din_rd1[4] ;
    output n238;
    input \data_in[1] ;
    input \din_rd1[1] ;
    output n241;
    output n10233;
    input \instr[12] ;
    input zero_flag;
    output n10239;
    input \data_in[5] ;
    input \din_rd1[5] ;
    output n237;
    input \data_in[6] ;
    input \din_rd1[6] ;
    output n236;
    input n10232;
    output ret_cycle_type;
    output br_enb;
    output n10207;
    input n10213;
    input \dout_stack_w_cz[10] ;
    input n3657;
    output n3658;
    output cout_alu;
    
    wire [7:0]data_add;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(65[18:26])
    wire add_sel_inv;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(70[18:29])
    wire [7:0]data_rb_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(63[18:29])
    wire [7:0]dout_l;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(59[18:24])
    wire [7:0]dout_r;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(61[18:24])
    wire adsu_ci;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(68[18:25])
    wire adsu_ci_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(71[18:29])
    wire add_sel;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(69[18:25])
    wire carry_add_int;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_alu.v(66[18:31])
    
    wire n10093, n10092, n9508, n10225, n10091;
    wire [8:0]n133;
    wire [8:0]n94;
    
    wire n93;
    wire [7:0]n71;
    
    wire n10459, n10460, n10461, n10462, n10464, n10465, n10466, 
        n10467, n10082, n10469, n10470, n10471, n10472, n4, n10474, 
        n10475, n10476, n10477, n9981, n9992, n9993, n10479, n10480, 
        n3552, n9980, n10481, n10084, n10482, n10081, n10484, 
        n10485, n10486, n10487;
    
    LUT4 mux_43_i8_3_lut_4_lut (.A(\instr[13] ), .B(n10216), .C(\data_in[7] ), 
         .D(\din_rd1[7] ), .Z(n235)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam mux_43_i8_3_lut_4_lut.init = 16'hf780;
    LUT4 n10092_bdd_3_lut (.A(n10092), .B(data_add[0]), .C(n10227), .Z(n10093)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam n10092_bdd_3_lut.init = 16'hcaca;
    LUT4 i8366_4_lut (.A(\instr[16] ), .B(\instr[17] ), .C(\instr[15] ), 
         .D(\instr[14] ), .Z(add_sel_inv)) /* synthesis lut_function=(A+(B (C+(D))+!B (C))), syn_module_defined=1 */ ;
    defparam i8366_4_lut.init = 16'hfefa;
    LUT4 instr_16__bdd_4_lut (.A(\instr[16] ), .B(\instr[17] ), .C(\instr[15] ), 
         .D(\instr[14] ), .Z(n9508)) /* synthesis lut_function=(A (B+!(C+(D)))+!A ((C+!(D))+!B)), syn_module_defined=1 */ ;
    defparam instr_16__bdd_4_lut.init = 16'hd9df;
    PFUMX i8766 (.BLUT(n10091), .ALUT(data_rb_int[0]), .C0(n10225), .Z(n10092)) /* synthesis syn_module_defined=1 */ ;
    LUT4 mux_39_i8_3_lut (.A(dout_l[7]), .B(data_add[7]), .C(n10227), 
         .Z(n133[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_39_i8_3_lut.init = 16'hcaca;
    LUT4 mux_21_i8_4_lut (.A(data_rb_int[7]), .B(dout_r[7]), .C(n10225), 
         .D(n10219), .Z(dout_l[7])) /* synthesis lut_function=(A (B+(C+!(D)))+!A !(B (C)+!B (C+(D)))), syn_module_defined=1 */ ;
    defparam mux_21_i8_4_lut.init = 16'hacaf;
    LUT4 mux_28_i8_4_lut (.A(dout_rb[0]), .B(n94[7]), .C(\instr[0] ), 
         .D(\instr[1] ), .Z(dout_r[7])) /* synthesis lut_function=(A (B+!(C+(D)))+!A (B (C+(D)))), syn_module_defined=1 */ ;
    defparam mux_28_i8_4_lut.init = 16'hccca;
    LUT4 mux_10_i8_3_lut (.A(dout_rb[7]), .B(\instr[7] ), .C(\instr[13] ), 
         .Z(data_rb_int[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_10_i8_3_lut.init = 16'hcaca;
    LUT4 data_rb_int_0__bdd_4_lut (.A(n93), .B(dout_rb[1]), .C(n10219), 
         .D(\instr[0] ), .Z(n10091)) /* synthesis lut_function=(A (B+((D)+!C))+!A !(B (C (D))+!B (C))), syn_module_defined=1 */ ;
    defparam data_rb_int_0__bdd_4_lut.init = 16'hafcf;
    PFUMX i8768 (.BLUT(n71[0]), .ALUT(n10093), .C0(n9508), .Z(dout_alu[0])) /* synthesis syn_module_defined=1 */ ;
    LUT4 mux_10_i1_3_lut (.A(dout_rb[0]), .B(\instr[0] ), .C(\instr[13] ), 
         .Z(data_rb_int[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_10_i1_3_lut.init = 16'hcaca;
    INV i4697 (.A(clrc), .Z(n5892)) /* synthesis syn_module_defined=1 */ ;
    LUT4 mux_10_i7_3_lut (.A(dout_rb[6]), .B(\instr[6] ), .C(\instr[13] ), 
         .Z(data_rb_int[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_10_i7_3_lut.init = 16'hcaca;
    LUT4 i1_3_lut_rep_161_4_lut (.A(\instr[13] ), .B(n10237), .C(\instr[1] ), 
         .D(n10240), .Z(n10212)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)), syn_module_defined=1 */ ;
    defparam i1_3_lut_rep_161_4_lut.init = 16'h0800;
    XOR2 i42 (.A(adsu_ci_int), .B(add_sel), .Z(adsu_ci)) /* synthesis syn_module_defined=1 */ ;
    LUT4 mux_43_i1_3_lut_4_lut (.A(\instr[13] ), .B(n10216), .C(\data_in[0] ), 
         .D(\din_rd1[0] ), .Z(n242)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam mux_43_i1_3_lut_4_lut.init = 16'hf780;
    LUT4 mux_20_i1_4_lut_4_lut (.A(dout_rd[0]), .B(\instr[14] ), .C(\instr[15] ), 
         .D(data_rb_int[0]), .Z(n71[0])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C+!(D)))+!A !(B (C (D))+!B (D)))), syn_module_defined=1 */ ;
    defparam mux_20_i1_4_lut_4_lut.init = 16'h79a2;
    LUT4 mux_20_i8_4_lut_4_lut (.A(dout_rd[7]), .B(\instr[14] ), .C(\instr[15] ), 
         .D(data_rb_int[7]), .Z(n71[7])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C+!(D)))+!A !(B (C (D))+!B (D)))), syn_module_defined=1 */ ;
    defparam mux_20_i8_4_lut_4_lut.init = 16'h79a2;
    AND2 i2_adj_0 (.A(n10240), .B(n10226), .Z(n8294)) /* synthesis syn_module_defined=1 */ ;
    AND2 i1_adj_0 (.A(push_enb), .B(addr_cyc), .Z(sp_we)) /* synthesis syn_module_defined=1 */ ;
    INV i8367 (.A(add_sel_inv), .Z(add_sel)) /* synthesis syn_module_defined=1 */ ;
    LUT4 mux_10_i6_3_lut (.A(dout_rb[5]), .B(\instr[5] ), .C(\instr[13] ), 
         .Z(data_rb_int[5])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_10_i6_3_lut.init = 16'hcaca;
    LUT4 i2_4_lut (.A(n6_adj_0), .B(\instr[0] ), .C(n10243), .D(n10237), 
         .Z(n9303)) /* synthesis lut_function=(!((B+!(C (D)))+!A)), syn_module_defined=1 */ ;
    defparam i2_4_lut.init = 16'h2000;
    LUT4 i1_2_lut_rep_155_3_lut (.A(\instr[0] ), .B(n10222), .C(\instr[13] ), 
         .Z(n10206)) /* synthesis lut_function=(A (B (C))), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_155_3_lut.init = 16'h8080;
    LUT4 i8970 (.A(dout_rb[7]), .B(dout_rb[5]), .C(n10219), .D(\instr[0] ), 
         .Z(n10459)) /* synthesis lut_function=(A (B+!(C (D)))+!A (B ((D)+!C)+!B !(C))), syn_module_defined=1 */ ;
    defparam i8970.init = 16'hcfaf;
    LUT4 i1_2_lut_3_lut_4_lut (.A(\instr[0] ), .B(n10222), .C(n232), .D(\instr[13] ), 
         .Z(n8973)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C)), syn_module_defined=1 */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'hf8f0;
    PFUMX i8880 (.BLUT(n10459), .ALUT(data_rb_int[6]), .C0(n10225), .Z(n10460)) /* synthesis syn_module_defined=1 */ ;
    LUT4 n10460_bdd_3_lut (.A(n10460), .B(data_add[6]), .C(n10227), .Z(n10461)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam n10460_bdd_3_lut.init = 16'hcaca;
    LUT4 i8973 (.A(data_rb_int[6]), .B(dout_rd[6]), .C(\instr[14] ), .D(\instr[15] ), 
         .Z(n10462)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !((D)+!C))+!A !(B ((D)+!C)))), syn_module_defined=1 */ ;
    defparam i8973.init = 16'h6e86;
    PFUMX i8882 (.BLUT(n10462), .ALUT(n10461), .C0(n9508), .Z(dout_alu[6])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i8962 (.A(dout_rb[6]), .B(dout_rb[4]), .C(n10219), .D(\instr[0] ), 
         .Z(n10464)) /* synthesis lut_function=(A (B+!(C (D)))+!A (B ((D)+!C)+!B !(C))), syn_module_defined=1 */ ;
    defparam i8962.init = 16'hcfaf;
    PFUMX i8884 (.BLUT(n10464), .ALUT(data_rb_int[5]), .C0(n10225), .Z(n10465)) /* synthesis syn_module_defined=1 */ ;
    LUT4 n10465_bdd_3_lut (.A(n10465), .B(data_add[5]), .C(n10227), .Z(n10466)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam n10465_bdd_3_lut.init = 16'hcaca;
    LUT4 mux_10_i5_3_lut (.A(dout_rb[4]), .B(\instr[4] ), .C(\instr[13] ), 
         .Z(data_rb_int[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_10_i5_3_lut.init = 16'hcaca;
    LUT4 i8965 (.A(data_rb_int[5]), .B(dout_rd[5]), .C(\instr[14] ), .D(\instr[15] ), 
         .Z(n10467)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !((D)+!C))+!A !(B ((D)+!C)))), syn_module_defined=1 */ ;
    defparam i8965.init = 16'h6e86;
    LUT4 mux_10_i4_3_lut (.A(dout_rb[3]), .B(\instr[3] ), .C(\instr[13] ), 
         .Z(data_rb_int[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_10_i4_3_lut.init = 16'hcaca;
    LUT4 i8799 (.A(dout_rb[0]), .B(dout_rb[7]), .C(\instr[1] ), .D(\instr[0] ), 
         .Z(n10082)) /* synthesis lut_function=(A (B (C)+!B !((D)+!C))+!A (B (C (D)))), syn_module_defined=1 */ ;
    defparam i8799.init = 16'hc0a0;
    LUT4 mux_10_i3_3_lut (.A(dout_rb[2]), .B(\instr[2] ), .C(\instr[13] ), 
         .Z(data_rb_int[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_10_i3_3_lut.init = 16'hcaca;
    PFUMX i8886 (.BLUT(n10467), .ALUT(n10466), .C0(n9508), .Z(dout_alu[5])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i8958 (.A(dout_rb[5]), .B(dout_rb[3]), .C(n10219), .D(\instr[0] ), 
         .Z(n10469)) /* synthesis lut_function=(A (B+!(C (D)))+!A (B ((D)+!C)+!B !(C))), syn_module_defined=1 */ ;
    defparam i8958.init = 16'hcfaf;
    PFUMX i8888 (.BLUT(n10469), .ALUT(data_rb_int[4]), .C0(n10225), .Z(n10470)) /* synthesis syn_module_defined=1 */ ;
    LUT4 n10470_bdd_3_lut (.A(n10470), .B(data_add[4]), .C(n10227), .Z(n10471)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam n10470_bdd_3_lut.init = 16'hcaca;
    LUT4 i8961 (.A(data_rb_int[4]), .B(dout_rd[4]), .C(\instr[14] ), .D(\instr[15] ), 
         .Z(n10472)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !((D)+!C))+!A !(B ((D)+!C)))), syn_module_defined=1 */ ;
    defparam i8961.init = 16'h6e86;
    PFUMX mux_40_i8 (.BLUT(n71[7]), .ALUT(n133[7]), .C0(n9508), .Z(dout_alu[7])) /* synthesis syn_module_defined=1 */ ;
    AND2 i2 (.A(instr_l1_0), .B(n4), .Z(adsu_ci_int)) /* synthesis syn_module_defined=1 */ ;
    AND2 i1 (.A(\instr[14] ), .B(carry_flag), .Z(n4)) /* synthesis syn_module_defined=1 */ ;
    LUT4 mux_10_i2_3_lut (.A(dout_rb[1]), .B(\instr[1] ), .C(\instr[13] ), 
         .Z(data_rb_int[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam mux_10_i2_3_lut.init = 16'hcaca;
    LUT4 mux_43_i5_3_lut_4_lut (.A(\instr[13] ), .B(n10216), .C(\data_in[4] ), 
         .D(\din_rd1[4] ), .Z(n238)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam mux_43_i5_3_lut_4_lut.init = 16'hf780;
    LUT4 mux_43_i2_3_lut_4_lut (.A(\instr[13] ), .B(n10216), .C(\data_in[1] ), 
         .D(\din_rd1[1] ), .Z(n241)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam mux_43_i2_3_lut_4_lut.init = 16'hf780;
    PFUMX i8890 (.BLUT(n10472), .ALUT(n10471), .C0(n9508), .Z(dout_alu[4])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i13_3_lut_rep_174_4_lut (.A(\instr[14] ), .B(\instr[15] ), .C(\instr[17] ), 
         .D(\instr[16] ), .Z(n10225)) /* synthesis lut_function=(!(A (B (C+!(D))+!B (C (D)+!C !(D)))+!A (C+!(D)))), syn_module_defined=1 */ ;
    defparam i13_3_lut_rep_174_4_lut.init = 16'h0f20;
    LUT4 i8950 (.A(dout_rb[4]), .B(dout_rb[2]), .C(n10219), .D(\instr[0] ), 
         .Z(n10474)) /* synthesis lut_function=(A (B+!(C (D)))+!A (B ((D)+!C)+!B !(C))), syn_module_defined=1 */ ;
    defparam i8950.init = 16'hcfaf;
    LUT4 mux_27_i8_3_lut_4_lut (.A(\instr[0] ), .B(\instr[1] ), .C(dout_rb[6]), 
         .D(carry_flag), .Z(n94[7])) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))), syn_module_defined=1 */ ;
    defparam mux_27_i8_3_lut_4_lut.init = 16'hf4b0;
    PFUMX i8892 (.BLUT(n10474), .ALUT(data_rb_int[3]), .C0(n10225), .Z(n10475)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i1_2_lut_rep_182 (.A(\instr[17] ), .B(\instr[16] ), .Z(n10233)) /* synthesis lut_function=(A (B)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_182.init = 16'h8888;
    LUT4 i27_3_lut_4_lut (.A(\instr[0] ), .B(\instr[1] ), .C(carry_flag), 
         .D(dout_rb[7]), .Z(n93)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (C)), syn_module_defined=1 */ ;
    defparam i27_3_lut_4_lut.init = 16'hf2d0;
    LUT4 n10475_bdd_3_lut (.A(n10475), .B(data_add[3]), .C(n10227), .Z(n10476)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam n10475_bdd_3_lut.init = 16'hcaca;
    pmi_addsubXo88 pmi_addsubpmi_addsubXO2off88 (.DataA({dout_rd}), .DataB({data_rb_int}), 
            .Result({data_add}), .Cin(adsu_ci), .Add_Sub(add_sel_inv), 
            .Cout(carry_add_int)) /* synthesis syn_instantiated=1, syn_module_defined=1 */ ;   // c:/work/swdemoproject/machxoboard/demo_machxo2_control_soc/diamond_project/demoimpl/source/isp8_core.v(211[18] 225[9])
    defparam pmi_addsubpmi_addsubXO2off88.module_type = "pmi_addsub";
    defparam pmi_addsubpmi_addsubXO2off88.pmi_family = "XO2";
    defparam pmi_addsubpmi_addsubXO2off88.pmi_sign = "off";
    defparam pmi_addsubpmi_addsubXO2off88.pmi_result_width = 8;
    defparam pmi_addsubpmi_addsubXO2off88.pmi_data_width = 8;
    LUT4 i8953 (.A(data_rb_int[3]), .B(dout_rd[3]), .C(\instr[14] ), .D(\instr[15] ), 
         .Z(n10477)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !((D)+!C))+!A !(B ((D)+!C)))), syn_module_defined=1 */ ;
    defparam i8953.init = 16'h6e86;
    LUT4 i8718 (.A(\instr[12] ), .B(\instr[13] ), .C(zero_flag), .D(carry_flag), 
         .Z(n9981)) /* synthesis lut_function=(!(A (B (D)+!B (C))+!A !(B (D)+!B (C)))), syn_module_defined=1 */ ;
    defparam i8718.init = 16'h569a;
    LUT4 n9993_bdd_4_lut (.A(n9993), .B(n9992), .C(\instr[13] ), .D(n10233), 
         .Z(push_enb)) /* synthesis lut_function=(A (B (D)+!B !(C+!(D)))+!A (B (C (D)))), syn_module_defined=1 */ ;
    defparam n9993_bdd_4_lut.init = 16'hca00;
    PFUMX i8894 (.BLUT(n10477), .ALUT(n10476), .C0(n9508), .Z(dout_alu[3])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i8635_3_lut_rep_176_4_lut_4_lut (.A(\instr[16] ), .B(\instr[17] ), 
         .C(\instr[15] ), .D(\instr[14] ), .Z(n10227)) /* synthesis lut_function=(!(A+(B (C+(D))))), syn_module_defined=1 */ ;
    defparam i8635_3_lut_rep_176_4_lut_4_lut.init = 16'h1115;
    LUT4 i8946 (.A(dout_rb[3]), .B(dout_rb[1]), .C(n10219), .D(\instr[0] ), 
         .Z(n10479)) /* synthesis lut_function=(A (B+!(C (D)))+!A (B ((D)+!C)+!B !(C))), syn_module_defined=1 */ ;
    defparam i8946.init = 16'hcfaf;
    LUT4 i1_2_lut_rep_188 (.A(\instr[15] ), .B(\instr[1] ), .Z(n10239)) /* synthesis lut_function=(!((B)+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_188.init = 16'h2222;
    PFUMX i8896 (.BLUT(n10479), .ALUT(data_rb_int[2]), .C0(n10225), .Z(n10480)) /* synthesis syn_module_defined=1 */ ;
    LUT4 i1_3_lut_4_lut (.A(\instr[15] ), .B(\instr[1] ), .C(n10225), 
         .D(n10240), .Z(n3552)) /* synthesis lut_function=(A (B (C)+!B (C+(D)))+!A (C)), syn_module_defined=1 */ ;
    defparam i1_3_lut_4_lut.init = 16'hf2f0;
    LUT4 i8727 (.A(\instr[12] ), .B(\instr[14] ), .C(\instr[13] ), .Z(n9980)) /* synthesis lut_function=(!(A (B+!(C))+!A (B+(C)))), syn_module_defined=1 */ ;
    defparam i8727.init = 16'h2121;
    LUT4 i8728 (.A(\instr[12] ), .B(zero_flag), .C(\instr[15] ), .D(\instr[14] ), 
         .Z(n9993)) /* synthesis lut_function=(!(A (B+(C+!(D)))+!A (B (C (D)+!C !(D))+!B ((D)+!C)))), syn_module_defined=1 */ ;
    defparam i8728.init = 16'h0650;
    LUT4 i8719 (.A(\instr[12] ), .B(carry_flag), .C(\instr[15] ), .D(\instr[14] ), 
         .Z(n9992)) /* synthesis lut_function=(!(A (B+(C+!(D)))+!A ((C+!(D))+!B))), syn_module_defined=1 */ ;
    defparam i8719.init = 16'h0600;
    LUT4 n10480_bdd_3_lut (.A(n10480), .B(data_add[2]), .C(n10227), .Z(n10481)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam n10480_bdd_3_lut.init = 16'hcaca;
    LUT4 n10083_bdd_3_lut_4_lut (.A(n10082), .B(n10219), .C(n3552), .D(carry_flag), 
         .Z(n10084)) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A (C (D))), syn_module_defined=1 */ ;
    defparam n10083_bdd_3_lut_4_lut.init = 16'hf808;
    LUT4 mux_43_i6_3_lut_4_lut (.A(\instr[13] ), .B(n10216), .C(\data_in[5] ), 
         .D(\din_rd1[5] ), .Z(n237)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam mux_43_i6_3_lut_4_lut.init = 16'hf780;
    LUT4 mux_43_i7_3_lut_4_lut (.A(\instr[13] ), .B(n10216), .C(\data_in[6] ), 
         .D(\din_rd1[6] ), .Z(n236)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam mux_43_i7_3_lut_4_lut.init = 16'hf780;
    LUT4 i8949 (.A(data_rb_int[2]), .B(dout_rd[2]), .C(\instr[14] ), .D(\instr[15] ), 
         .Z(n10482)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !((D)+!C))+!A !(B ((D)+!C)))), syn_module_defined=1 */ ;
    defparam i8949.init = 16'h6e86;
    LUT4 i8800 (.A(carry_add_int), .B(add_sel_inv), .Z(n10081)) /* synthesis lut_function=(A (B)+!A !(B)), syn_module_defined=1 */ ;
    defparam i8800.init = 16'h9999;
    PFUMX i8898 (.BLUT(n10482), .ALUT(n10481), .C0(n9508), .Z(dout_alu[2])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i8942 (.A(dout_rb[2]), .B(dout_rb[0]), .C(n10219), .D(\instr[0] ), 
         .Z(n10484)) /* synthesis lut_function=(A (B+!(C (D)))+!A (B ((D)+!C)+!B !(C))), syn_module_defined=1 */ ;
    defparam i8942.init = 16'hcfaf;
    PFUMX i8900 (.BLUT(n10484), .ALUT(data_rb_int[1]), .C0(n10225), .Z(n10485)) /* synthesis syn_module_defined=1 */ ;
    LUT4 n10485_bdd_3_lut (.A(n10485), .B(data_add[1]), .C(n10227), .Z(n10486)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))), syn_module_defined=1 */ ;
    defparam n10485_bdd_3_lut.init = 16'hcaca;
    LUT4 i8945 (.A(data_rb_int[1]), .B(dout_rd[1]), .C(\instr[14] ), .D(\instr[15] ), 
         .Z(n10487)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !((D)+!C))+!A !(B ((D)+!C)))), syn_module_defined=1 */ ;
    defparam i8945.init = 16'h6e86;
    PFUMX i8902 (.BLUT(n10487), .ALUT(n10486), .C0(n9508), .Z(dout_alu[1])) /* synthesis syn_module_defined=1 */ ;
    LUT4 i1_3_lut_4_lut_adj_0 (.A(n10233), .B(n10232), .C(\instr[12] ), 
         .D(\instr[13] ), .Z(ret_cycle_type)) /* synthesis lut_function=(!(((C (D)+!C !(D))+!B)+!A)), syn_module_defined=1 */ ;
    defparam i1_3_lut_4_lut_adj_0.init = 16'h0880;
    LUT4 n9981_bdd_4_lut (.A(n9981), .B(n9980), .C(\instr[15] ), .D(n10233), 
         .Z(br_enb)) /* synthesis lut_function=(A (B (D)+!B !(C+!(D)))+!A (B (C (D)))), syn_module_defined=1 */ ;
    defparam n9981_bdd_4_lut.init = 16'hca00;
    LUT4 i1_2_lut_rep_156_3_lut_4_lut (.A(n10233), .B(n10232), .C(\instr[13] ), 
         .D(\instr[12] ), .Z(n10207)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)), syn_module_defined=1 */ ;
    defparam i1_2_lut_rep_156_3_lut_4_lut.init = 16'h0080;
    LUT4 i2649_3_lut_4_lut (.A(\instr[13] ), .B(n10213), .C(\dout_stack_w_cz[10] ), 
         .D(n3657), .Z(n3658)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (D)), syn_module_defined=1 */ ;
    defparam i2649_3_lut_4_lut.init = 16'hf780;
    PFUMX i8762 (.BLUT(n10084), .ALUT(n10081), .C0(n10227), .Z(cout_alu)) /* synthesis syn_module_defined=1 */ ;
    
endmodule
