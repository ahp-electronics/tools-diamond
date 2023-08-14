// ===========================================================================
//                         FILE DETAILS
// Project          : isp8
// File             : isp8_tb.v
// Title            :
// Dependencies     :
// Description      : This module is the testbench for the Verilog version of Mico8.
// ===========================================================================
//                        REVISION HISTORY
// $Revision: 1.1 $
//
// ===========================================================================
// ---------------------------------------------------------------------------
// Permission:
//
//   Lattice Semiconductor grants permission to use this code for use
//   in synthesis for any Lattice programmable logic product.  Other
//   use of this code, including the selling or duplication of any
//   portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL or Verilog source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Lattice Semiconductor provides no warranty
//   regarding the use or functionality of this code.
// ---------------------------------------------------------------------------
//
//    Lattice Semiconductor Corporation
//    5555 NE Moore Court
//    Hillsboro, OR 97124
//    U.S.A
//
//    TEL: 1-800-Lattice (USA and Canada)
//    408-826-6000 (other locations)
//------------------------------------------------------------------------
//    web: http://www.latticesemi.com/
//    email: techsupport@latticesemi.com
//
// ---------------------------------------------------------------------------
`include "timescale.v"

module isp8_tb #(parameter FAMILY_NAME = "XO") ();

reg            rst_n ;
reg            clk ;
wire [7:0]     ext_mem_din ;
wire [7:0]     ext_io_din ;
reg  [7:0]     ext_mem_din2 ;
reg  [7:0]     ext_io_din2 ;
reg            no_ext_mem ;
reg            intr ;
reg            test_done ;
reg            test_done_r ;
reg [7:0]      rf_dut[0:255] ;
reg [7:0]      rf_dut_m[0:255] ;
reg [7:0]      rf_model[0:255] ;

wire           test_complete ;
reg  [7:0]     rf_model_sig[0:31] ;
wire [7:0]     ext_addr ;
   
wire [7:0]     ext_dout ;
wire           ext_mem_wr ;
wire           ext_io_wr ;
wire           ext_mem_rd ;
wire           ext_io_rd ;
wire           intr_ack ;
reg            ext_mem_ready;

wire   hi_val,lo_val;
assign hi_val=1'b1;
assign lo_val=1'b0;


`include "testbench.v"

// Instantiate GSR & PUR
GSR GSR_INST (.GSR (rst_n) );
PUR PUR_INST (.PUR (rst_n) );

isp8_core #(
            FAMILY_NAME,
            "prom_init.hex",
            8,
            8,
            14,
            16384,
            0,
            4,
            16
            ) u1_isp8
            ( .clk           ( clk          ),
              .rst_n         ( rst_n        ),
              .ext_mem_din   ( ext_mem_din  ),
              .ext_io_din    ( ext_io_din   ),
              .ext_mem_ready ( ext_mem_ready),
              .intr          ( intr         ),
              .ext_addr      ( ext_addr     ),
              .ext_addr_cyc  (              ),
              .ext_dout      ( ext_dout     ),
              .ext_mem_wr    ( ext_mem_wr   ),
              .ext_mem_rd    ( ext_mem_rd   ),
              .ext_io_wr     ( ext_io_wr    ),
              .ext_io_rd     ( ext_io_rd    ),
              .intr_ack      ( intr_ack     )
              );

pmi_distributed_spram #(
                        32,
                        5,
                        8,
                        "noreg",
                        "none",
                        "binary",
                        FAMILY_NAME ,
                        "pmi_distributed_spram"
                        ) u1_isp8_spmem
                        ( .Address (  ext_addr[4:0] ),
                          .Data    (  ext_dout      ),
                          .Clock   (  clk           ),
                          .ClockEn (  hi_val        ),
                          .WE      (  ext_mem_wr    ),
                          .Reset   (  lo_val        ),
                          .Q       (  ext_mem_din   )
                          );
pmi_distributed_spram #(
                        32,
                        5,
                        8,
                        "noreg",
                        "none",
                        "binary",
                        FAMILY_NAME ,
                        "pmi_distributed_spram"
                        ) u2_isp8_spmem
                        (.Address (  ext_addr[4:0] ),
                         .Data    (  ext_dout      ),
                         .Clock   (  clk           ),
                         .ClockEn (  hi_val        ),
                         .WE      (  ext_io_wr    ),
                         .Reset   (  lo_val        ),
                         .Q       (  ext_io_din   )
                         );
initial
   begin
      clk           = 1'b0;
      rst_n         = 1'b0;
      no_ext_mem    = 1'b1;
      intr          = 1'b0;
      test_done_r   = 1'b0 ;
      test_done     = 1'b0 ;
      ext_mem_ready = 1'b1;
      # 200  rst_n  = 1'b1;
      ext_mem_din2  = 0;
      ext_io_din2   = 0;


$readmemh("isp8sim_out.txt", rf_model);
end

always @(posedge clk) begin
   if (!rst_n)
      test_done   <= 1'b0 ;
   else if (ext_io_wr && (ext_addr == 'd255))
      test_done <= 1'b1 ;
end

always @(posedge clk) test_done_r <= test_done ;

assign test_complete = test_done ;

always @(posedge clk) begin
   if (ext_io_wr && (ext_addr != 'd255))    	
      rf_dut[ext_addr] <= ext_dout ;
end

always @(posedge clk) begin
   if (ext_mem_wr)
      rf_dut_m[ext_addr] <= ext_dout ;
end

// ============================================================================
// Dump waveform
// ============================================================================
initial begin
   $timeformat (-9 ,1 , "ns", 10);
   `ifdef REGRESS
   `else
    `ifdef NC_VERILOG
       $recordfile ("isp8_test.trn");
       $recordvars ();
    `else
       $dumpfile ("isp8_test.trn");
       $dumpvars ();
    `endif
   `endif
end

// ============================================================================
// Timeout generation to finish hung test cases.
// ============================================================================
parameter TIMEOUT_NUM = 5000 ;

always  #5 clk = ~clk ;

 initial begin
    repeat (TIMEOUT_NUM) @(posedge clk);
    $display(" ERROR : Simulation Time Out, Test case Terminated at time : %0t", $time) ;
    $finish ;
 end


// ============================================================================
// Clocks generation
// ============================================================================
// 100 Mhz clock
endmodule

