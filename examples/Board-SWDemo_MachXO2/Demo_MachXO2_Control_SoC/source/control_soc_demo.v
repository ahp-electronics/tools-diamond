// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2001 - 2008 by Lattice Semiconductor Corporation  
// --------------------------------------------------------------------  
//  
// Permission:                    
//
// Lattice Semiconductor grants permission to use this code for use
// in synthesis for any Lattice programmable logic product. Other
// use of this code, including the selling or duplication of any
// portion is strictly prohibited.
//
// Disclaimer:
//
// This VHDL or Verilog source code is intended as a design reference
// which illustrates how these types of functions can be implemented.
// It is the user's responsibility to verify their design for
// consistency and functionality through the use of formal
// verification methods. Lattice Semiconductor provides no warranty
// regarding the use or functionality of this code.
//
// --------------------------------------------------------------------
//
// Lattice Semiconductor Corporation
// 5555 NE Moore Court
// Hillsboro, OR 97214
// U.S.A
//
// TEL: 1-800-Lattice (USA and Canada)
// 503-268-8001 (other locations)
//
// web: http://www.latticesemi.com/
// email: techsupport@latticesemi.com
//  
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Ver: | Author |Mod. Date |Changes Made:
// V1.0 | R.P.   |10/26/10    |Initial ver
// V1.1 | S.H.   |01/27/11    |General Release
//  
// --------------------------------------------------------------------

//`include "timescale.v"
module control_soc_demo(

  input			xin,
  output		xout,

  input         rst_n,
  input  [3:0]  sw,
  output [3:0]  led,

  input         uart_rx,
  output        uart_tx,

  output        spi_sclk,
  output        spi_csn,
  output        spi_mosi,
  input         spi_miso,

  inout         scl,
  inout         sda,

  input			analog_cmp_n,
  input			analog_cmp_p,
  output		analog_out,

  output		audio_pwm_out,
  output		clk,
  output        clk_pll,
  output        lock_pll

);





localparam LM8_AW = 24;        // Mico8 External Address Width (8/16/24)
localparam SLAVE_SEL_AW = 4;   // Number of address bits to use for decoding slaves




/************************************/
/*		Interconnect				*/
/************************************/

//Clock
wire clk /*synthesis syn_keep=1 */; 

//Reset
wire rst = !rst_n;
wire lm8_rst;
wire lm8_rstn = !lm8_rst;
wire wb_rst;

//Mico8 Core
wire [7:0] data_in;
wire [LM8_AW-1:0] addr;
wire [7:0] data_out;
wire wr;
wire rd;
wire io_rdy;

// Wishbone signals that are common to all slave devices
wire [LM8_AW-SLAVE_SEL_AW-1:0] wb_addr;
wire [7:0] wb_data_from_master;
wire wb_cyc;
wire wb_sel;
wire wb_we;

// Wishbone combined signals that are unique to/from each slave device
wire [15:0] wb_ack;
wire [15:0] wb_stb;
wire [127:0] wb_dat_i;  // wb_dat_i_0[7:0], wb_dat_i_1[7:0], ...

// LED/Switch signals
wire led_sw_ack;
wire [7:0] sw_dat_out;
wire led_sw_stb;

// UART signals
wire uart_stb;
wire uart_ack;
wire [15:0] data_from_uart;

//EBR signals
wire ebr_ack;
wire ebr_stb;
wire [7:0] data_from_ebr;

//ADC Signals
wire adc_stb;
wire adc_ack;
wire [7:0] adc_dig_data;
wire analog_cmp;
ILVDS i0 ( .A(analog_cmp_p), .AN(analog_cmp_n), .Z(analog_cmp));

//Soft Core SPI signals
wire [7:0] data_from_spi;
wire spi_stb;
wire spi_ack;

//Soft Core I2C Signals
wire [7:0] data_from_i2c2;
wire i2c2_stb;
wire i2c2_ack;


//Timer Signals
wire timer_ack;
wire timer_stb;
wire [7:0] data_from_timer;

// unused outputs
assign  clk_pll  = 1'b0;
assign  lock_pll = 1'b0;
assign  audio_pwm_out = 1'b0;
assign  scl = 1'bz;
assign  sda = 1'bz;


/************************************/
/*		Clock Generation			*/
/************************************/

//Crystal Oscillator
assign		xout = ~xin;

//On-Chip Oscillator
defparam OSCH_inst.NOM_FREQ = "24.18"; 
OSCH OSCH_inst (.OSC(clk), .SEDSTDBY(), .STDBY(1'b0)); 



/************************************/
/*	WB Continous Assignments		*/
/************************************/

//ACK signals from wishbone slave components to wishbone master
assign wb_ack = {
                   1'b0,              // Device #15 (UNUSED)
                   ebr_ack,           // Device #14 (EBR)
                   1'b0,              // Device #13 (UNUSED)
                   1'b0,              // Device #12 (UNUSED)
                   timer_ack,         // Device #11 (SOFT TIMER)
                   spi_ack,	          // Device #10 (SOFT SPI)
                   1'b0,              // Device #9 (UNUSED)
                   1'b0,              // Device #8 (UNUSED)
                   1'b0,              // Device #7 (UNUSED)
                   1'b0,              // Device #6 (UNUSED)
                   1'b0,              // Device #5 (UNUSED)
                   led_sw_ack,        // Device #4 (LED/Switches)
                   1'b0,              // Device #3 (UNUSED)
                   1'b0,              // Device #2 (UNUSED)
                   adc_ack,           // Device #1 (ADC)
                   uart_ack           // Device #0 (UART)                 
                   };

//Data busses from wishbone slave components to wishbone master
assign wb_dat_i = {
                   8'h00,             // Device #15 (UNUSED)
                   data_from_ebr,     // Device #14 (EBR) 
                   8'h00,             // Device #13 (UNUSED)
                   8'h00,             // Device #12 (UNUSED)
                   data_from_timer,   // Device #11 (SOFT TIMER)
                   data_from_spi,     // Device #10 (SOFT SPI)
                   8'h00,             // Device #9 (UNUSED)
                   8'h00,             // Device #8 (UNUSED)
                   8'h00,             // Device #7 (UNUSED)
                   8'h00,             // Device #6 (UNUSED)
                   8'h00,         	  // Device #5 (UNUSED)
                   sw_dat_out,        // Device #4 (LED/Switches)
                   8'h00,             // Device #3 (UNUSED)
                   8'h00,             // Device #2 (UNUSED)
                   adc_dig_data,      // Device #1 (ADC)
                   data_from_uart[7:0]// Device #0 (UART)
                   };
                   
//Strobe signals from wishbone master to wishbone slave components
assign ebr_stb    = wb_stb[14];
assign timer_stb  = wb_stb[11];
assign spi_stb    = wb_stb[10];
assign led_sw_stb = wb_stb[4];
assign adc_stb    = wb_stb[1];
assign uart_stb   = wb_stb[0];


/************************************/
/*		Instantiating Design		*/
/*			Modules					*/
/************************************/

//Reset Generator
reset_gen reset_gen_inst(
  .clk(clk),
  .rst_in(rst),
  .rst1_out(wb_rst),
  .rst2_out(lm8_rst)
);

//User Interface
//LEDs (output) and SWITCHES (input)
//Reset is Active High
led_sw_wb led_sw_inst(
  .clk_i(clk),
  .rst_i(wb_rst),
  .dat_i(wb_data_from_master),
  .stb_i(led_sw_stb),
  .cyc_i(wb_cyc),
  .we_i(wb_we),
  .dat_o(sw_dat_out),
  .ack_o(led_sw_ack),
  .sw({4'h0,sw}),
  .led(led)
);

//Master Wishbone Controller - Mico 8
//Reset is Active High
lm8_wb #(
  .LM8_ADDR_W(LM8_AW),
  .NUM_DECODE(SLAVE_SEL_AW)
  )
   lm8_wb_inst (
  .clk_i(clk),
  .rst_i(wb_rst),
  .wb_ack_i(wb_ack),
  .wb_dat_i(wb_dat_i),
  .wb_stb_o(wb_stb),
  .wb_we_o(wb_we),
  .wb_sel_o(wb_sel),
  .wb_cyc_o(wb_cyc),
  .wb_dat_o(wb_data_from_master),
  .wb_adr_o(wb_addr),
  .lm8_addr(addr),
  .lm8_ext_io_rd(rd),
  .lm8_ext_io_wr(wr),
  .lm8_ext_io_din(data_in),
  .lm8_ext_io_dout(data_out),
  .lm8_io_ready(io_rdy)
);

//Mico8 Core
//Reset is Active High
isp8 
# (
  .FAMILY_NAME  ("XO2"),
  .PROM_FILE    ("prom_init.hex"),
  .PORT_AW      (8),
  .EXT_AW       (LM8_AW),
  .PROM_AW      (10),
  .PROM_AD      (1024),
  .REGISTERS_16 (0),
  .PGM_STACK_AW (4),
  .PGM_STACK_AD (16))
lm8_inst (
  .clk(clk),
  .rst_n(lm8_rstn),
  .ext_io_ready(io_rdy),
  .ext_io_din(data_in),
  .intr(1'b0),
  .ext_addr(addr),
  .ext_addr_cyc(),
  .ext_io_dout(data_out),
  .ext_io_wr(wr),
  .ext_io_rd(rd),
  .intr_ack()
);

//UART for communication to COM port of a PC
uart_core #(
  .CLK_IN_MHZ(24),
  .BAUD_RATE(115200),
  .ADDRWIDTH(3),
  .DATAWIDTH(8),
  .FIFO(0))
UART_INST(
  .RESET(wb_rst),
  .CLK(clk),
  .UART_ADR_I(wb_addr[7:0]),
  .UART_DAT_I({8'h00,wb_data_from_master}),
  .UART_DAT_O(data_from_uart),
  .UART_STB_I(uart_stb),
  .UART_CYC_I(wb_cyc),
  .UART_WE_I(wb_we),
  .UART_SEL_I({3'b000,wb_sel}),
  .UART_CTI_I(3'b000),
  .UART_BTE_I(2'b00),
  .UART_ACK_O(uart_ack),
  .INTR(/*open*/),
  .SIN(uart_rx),
  .SOUT(uart_tx),
  .RXRDY_N(/*open*/),
  .TXRDY_N(/*open*/)
);


//Soft Delta-Sigma ADC
adc_wb adc_wb_inst(
  .clk_i(clk),
  .rst_i(),
  .dat_i(),
  .stb_i(adc_stb),
  .cyc_i(),
  .we_i(),
  .dat_o(adc_dig_data),
  .ack_o(adc_ack),
  .analog_cmp(analog_cmp),
  .analog_out(analog_out)
);


//EBR memory for storing user interface menu,
//which is displayed in Hyperterminal
rom_ebr_wb STRING_TABLE_INST (
  .wb_clk_i(clk),
  .wb_rst_i(wb_rst),
  .wb_adr_i(wb_addr[9:0]),
  .wb_dat_o(data_from_ebr),
  .wb_stb_i(ebr_stb),
  .wb_we_i(wb_we),
  .wb_ack_o(ebr_ack)
);


spi #(
      .SHIFT_DIRECTION (0),
      .CLOCK_PHASE     (0),
      .CLOCK_POLARITY  (0),
      .CLOCK_SEL       (1),
      .MASTER          (1),
      .SLAVE_NUMBER    (1),
      .DATA_LENGTH     (8),
      .DELAY_TIME      (2),
      .CLKCNT_WIDTH    (5),
      .INTERVAL_LENGTH (2)
      ) 
SPI_INST
   (
    .SPI_ADR_I(wb_addr[7:0]),
    .SPI_DAT_I(wb_data_from_master),
    .SPI_WE_I(wb_we),
    .SPI_CYC_I(wb_cyc),
    .SPI_STB_I(spi_stb),
    .SPI_SEL_I({3'b000,wb_sel}),
    .SPI_CTI_I(3'b000),
    .SPI_BTE_I(2'b00),
    .SPI_LOCK_I(1'b0),
    .SPI_DAT_O(data_from_spi),
    .SPI_ACK_O(spi_ack),
    .SPI_INT_O(/*open*/),
    .SPI_ERR_O(/*open*/),
    .SPI_RTY_O(/*open*/),
    .MISO_MASTER(spi_miso),
    .MOSI_MASTER(spi_mosi),
    .SS_N_MASTER(spi_csn),
    .SCLK_MASTER(spi_sclk),
    .MISO_SLAVE(/*open*/),
    .MOSI_SLAVE(1'b0),
    .SS_N_SLAVE(1'b1),
    .SCLK_SLAVE(1'b0),
    .CLK_I(clk),
    .RST_I(wb_rst)
   );


uptime_wb #( 
  .CLK_FREQ(24180000), //clk_i frequency, in Hz
  .CLK_IN_HZ(25) //Number of timer bits to convert clk_i frequency to Hertz
  ) TIME_INST(
  .clk_i(clk),
  .rst_i(rst),
  .wb_adr_i(wb_addr[1:0]),
  .wb_dat_o(data_from_timer),
  .wb_cyc_i(wb_cyc),
  .wb_stb_i(timer_stb),
  .wb_we_i(wb_we),
  .wb_ack_o(timer_ack)
   );


endmodule

