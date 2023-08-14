#log _circuit_name.v

#ifndef _enable_orcastra
#define _enable_orcastra 0
#endif
#define -r SLASH2 //
#define -r STARTCOM /*
#define -r ENDCOM */
#macro converter8(arg1,arg2)
#if #arg1 == "on" || #arg1 == "group_0" || #arg1 == "group_1" || #arg1 == "group_2" || #arg1 == "group_3"
#define arg2 1
#elif #arg1 == "off"
#define arg2 0
#endif
#endmacro
#macro converter10(arg1,arg2)
#define arg2 arg1##.txt
#endmacro
#converter10(_circuit_name, _circuit_name_new)
#converter8(_pcs_360, _enable_lpcs_0)
#converter8(_pcs_361, _enable_lpcs_1)
#converter8(_pcs_362, _enable_lpcs_2)
#converter8(_pcs_363, _enable_lpcs_3)
#converter8(_pcs_3e0, _enable_rpcs_0)
#converter8(_pcs_3e1, _enable_rpcs_1)
#converter8(_pcs_3e2, _enable_rpcs_2)
#converter8(_pcs_3e3, _enable_rpcs_3)
SLASH2 This interface file generated using SYSBUSA GUI: _kit_version

`define NULL 0
`timescale 1ns/ 10 ps

module _circuit_name (
#if _enable_mpi == 1
  mpi_cs0n, mpi_cs1, mpi_clk, mpi_wr_n, mpi_strb_n, mpi_tsiz, mpi_burst, mpi_bdip,
  mpi_addr, mpi_data, mpi_rst_n, mpi_ta, mpi_retry, mpi_tea, mpi_irq_n,
#if _dma_interface == 1
  dfa_addr, dfa_cs1, dfa_cs0n, dfa_wr_n, dfa_bdip, dfa_burst, dfa_tsiz, dfa_strb_n,
#endif
#if _parity_enable == 1
  mpi_par,
#endif
#endif
#if _sys_clock == "USER"
  usr_clk,
#endif
  usr_irq_in, usr_irq_out, sync_clk,
#if _enable_umi == 1
#if _enable_orcastra == 1
  tck, tdi, tms, tdo, rstn, umi_clk,
#else
  umi_addr, umi_wdata, umi_size, umi_clk, umi_rst_n, umi_wr_n, umi_burst, umi_rdy, umi_lock, umi_irq,
  umi_rdata, umi_ack, umi_retry, umi_err, 
#endif
#endif
#if _enable_usi == 1
  usi_rdata, usi_clk, usi_rst_n, usi_ack, usi_retry, usi_err, usi_irq,
  usi_wdata, usi_addr, usi_size, usi_rdy, usi_wr_n,
#endif
#if _enable_smi == 1
#if _enable_smi_port_0x410 == 1
  smi_rdata_0x410,
#endif
#if _enable_smi_port_0x420 == 1
  smi_rdata_0x420,
#endif
#if _enable_smi_port_0x430 == 1
  smi_rdata_0x430,
#endif
#if _enable_smi_port_0x440 == 1
  smi_rdata_0x440,
#endif
#if _enable_smi_port_0x450 == 1
  smi_rdata_0x450,
#endif
#if _enable_smi_port_0x460 == 1
  smi_rdata_0x460,
#endif
#if _enable_smi_port_0x470 == 1
  smi_rdata_0x470,
#endif
#if _enable_smi_port_0x480 == 1
  smi_rdata_0x480,
#endif
#if _enable_smi_port_0x490 == 1
  smi_rdata_0x490,
#endif
#if _enable_smi_port_0x4a0 == 1
  smi_rdata_0x4a0,
#endif
#if _enable_smi_port_0x4b0 == 1
  smi_rdata_0x4b0,
#endif
#if _enable_smi_port_0x4c0 == 1
  smi_rdata_0x4c0,
#endif
#if _enable_smi_port_0x4d0 == 1
  smi_rdata_0x4d0,
#endif
#if _enable_smi_port_0x4e0 == 1
  smi_rdata_0x4e0,
#endif
#if _enable_smi_port_0x4f0 == 1
  smi_rdata_0x4f0,
#endif
#if _enable_smi_port_0x500 == 1
  smi_rdata_0x500,
#endif
#if _enable_smi_port_0x510 == 1
  smi_rdata_0x510,
#endif
#if _enable_smi_port_0x520 == 1
  smi_rdata_0x520,
#endif
#if _enable_smi_port_0x530 == 1
  smi_rdata_0x530,
#endif
#if _enable_smi_port_0x540 == 1
  smi_rdata_0x540,
#endif
#if _enable_smi_port_0x550 == 1
  smi_rdata_0x550,
#endif
#if _enable_smi_port_0x560 == 1
  smi_rdata_0x560,
#endif
#if _enable_smi_port_0x570 == 1
  smi_rdata_0x570,
#endif
#if _enable_smi_port_0x580 == 1
  smi_rdata_0x580,
#endif
#if _enable_smi_port_0x590 == 1
  smi_rdata_0x590,
#endif
#if _enable_smi_port_0x5a0 == 1
  smi_rdata_0x5a0,
#endif
#if _enable_smi_port_0x5b0 == 1
  smi_rdata_0x5b0,
#endif
#if _enable_smi_port_0x5c0 == 1
  smi_rdata_0x5c0,
#endif
#if _enable_smi_port_0x5d0 == 1
  smi_rdata_0x5d0,
#endif
#if _enable_smi_port_0x5e0 == 1
  smi_rdata_0x5e0,
#endif
#if _enable_smi_port_0x5f0 == 1
  smi_rdata_0x5f0,
#endif
#if _enable_smi_port_0x600 == 1
  smi_rdata_0x600,
#endif
#if _enable_smi_port_0x610 == 1
  smi_rdata_0x610,
#endif
#if _enable_smi_port_0x620 == 1
  smi_rdata_0x620,
#endif
#if _enable_smi_port_0x630 == 1
  smi_rdata_0x630,
#endif
#if _enable_smi_port_0x640 == 1
  smi_rdata_0x640,
#endif
#if _enable_smi_port_0x650 == 1
  smi_rdata_0x650,
#endif
#if _enable_smi_port_0x660 == 1
  smi_rdata_0x660,
#endif
#if _enable_smi_port_0x670 == 1
  smi_rdata_0x670,
#endif
#if _enable_smi_port_0x680 == 1
  smi_rdata_0x680,
#endif
#if _enable_smi_port_0x690 == 1
  smi_rdata_0x690,
#endif
#if _enable_smi_port_0x6a0 == 1
  smi_rdata_0x6a0,
#endif
#if _enable_smi_port_0x6b0 == 1
  smi_rdata_0x6b0,
#endif
#if _enable_smi_port_0x6c0 == 1
  smi_rdata_0x6c0,
#endif
#if _enable_smi_port_0x6d0 == 1
  smi_rdata_0x6d0,
#endif
#if _enable_smi_port_0x6e0 == 1
  smi_rdata_0x6e0,
#endif
#if _enable_smi_port_0x6f0 == 1
  smi_rdata_0x6f0,
#endif
#if _enable_smi_port_0x700 == 1
  smi_rdata_0x700,
#endif
#if _enable_smi_port_0x710 == 1
  smi_rdata_0x710,
#endif
#if _enable_smi_port_0x720 == 1
  smi_rdata_0x720,
#endif
#if _enable_smi_port_0x730 == 1
  smi_rdata_0x730,
#endif
#if _enable_smi_port_0x740 == 1
  smi_rdata_0x740,
#endif
#if _enable_smi_port_0x750 == 1
  smi_rdata_0x750,
#endif
#if _enable_smi_port_0x760 == 1
  smi_rdata_0x760,
#endif
#if _enable_smi_port_0x770 == 1
  smi_rdata_0x770,
#endif
#if _enable_smi_port_0x780 == 1
  smi_rdata_0x780,
#endif
#if _enable_smi_port_0x790 == 1
  smi_rdata_0x790,
#endif
#if _enable_smi_port_0x7a0 == 1
  smi_rdata_0x7a0,
#endif
#if _enable_smi_port_0x7b0 == 1
  smi_rdata_0x7b0,
#endif
#if _enable_smi_port_0x7c0 == 1
  smi_rdata_0x7c0,
#endif
#if _enable_smi_port_0x7d0 == 1
  smi_rdata_0x7d0,
#endif
#if _enable_smi_port_0x7e0 == 1
  smi_rdata_0x7e0,
#endif
#if _enable_smi_port_0x7f0 == 1
  smi_rdata_0x7f0,
#endif
  smi_addr, smi_clk, smi_rd, smi_rst_n, smi_wdata, smi_wr,
#endif
#if _enable_lpcs_0 == 1
  pcs360_out,
  pcs360_in,
#endif
#if _enable_lpcs_1 == 1
  pcs361_out,
  pcs361_in,
#endif
#if _enable_lpcs_2 == 1
  pcs362_out,
  pcs362_in,
#endif
#if _enable_lpcs_3 == 1
  pcs363_out,
  pcs363_in,
#endif
#if _enable_rpcs_0 == 1
  pcs3e0_out,
  pcs3e0_in,
#endif
#if _enable_rpcs_1 == 1
  pcs3e1_out,
  pcs3e1_in,
#endif
#if _enable_rpcs_2 == 1
  pcs3e2_out,
  pcs3e2_in,
#endif
#if _enable_rpcs_3 == 1
  pcs3e3_out,
  pcs3e3_in,
#endif
#if _enable_multi_align == 1
  mca_clk_p1_in, mca_clk_p2_in, mca_done_in, mca_clk_p1_out, mca_clk_p2_out, mca_done_out,
#endif
#if _dma_interface == 1
#if _enable_mpi == 1
  dfa_rd_data, dfa_rd_parity, dfa_retry, dfa_ta, dfa_tea, dfa_tri_ctl, dfa_tri_data,
  dfa_wr_data,
#endif
#endif
  sysbus_rst_n);


#if _enable_mpi == 1
  input mpi_cs0n, mpi_cs1, mpi_clk, mpi_wr_n, mpi_strb_n, mpi_burst, mpi_bdip, mpi_rst_n;
  input [0:1] mpi_tsiz;
  input [14:31] mpi_addr;

  output mpi_ta, mpi_retry, mpi_tea, mpi_irq_n;
#if _dma_interface == 1
  output [14:31] dfa_addr;
  output dfa_cs1, dfa_cs0n, dfa_wr_n, dfa_bdip, dfa_burst, dfa_strb_n;
  output [0:1] dfa_tsiz;
#endif
#if _bus_width == 8
  inout [0:7] mpi_data;
#if _parity_enable == 1
  inout [0:0] mpi_par; 
#endif
#endif
#if _bus_width == 16
  inout [0:15] mpi_data;
#if _parity_enable == 1
  inout [0:1] mpi_par;
#endif
#endif
#if _bus_width == 32
  inout [0:31] mpi_data;
#if _parity_enable == 1
  inout [0:3] mpi_par; 
#endif
#endif
#endif
#if _sys_clock == "USER"
  input usr_clk;
#endif
  input usr_irq_in, sysbus_rst_n;
  output usr_irq_out, sync_clk;
#if _enable_umi == 1
#if _enable_orcastra == 1
  input  tck, tdi, tms, rstn, umi_clk;
  output tdo;
#else
  input [17:0] umi_addr;
  input [35:0] umi_wdata;
  input [1:0]  umi_size;
  input  umi_clk, umi_rst_n, umi_wr_n, umi_burst, umi_rdy, umi_lock, umi_irq;
  output [35:0] umi_rdata;
  output umi_ack, umi_retry, umi_err;
#endif
#endif
#if _enable_usi == 1
  input [35:0] usi_rdata;
  input  usi_clk, usi_rst_n, usi_ack, usi_retry, usi_err, usi_irq;
  output [35:0] usi_wdata;
  output [17:0] usi_addr;
  output [1:0]  usi_size;
  output usi_rdy, usi_wr_n;
#endif
#if _enable_smi == 1
#if _enable_smi_port_0x410 == 1
  input smi_rdata_0x410;
#endif
#if _enable_smi_port_0x420 == 1
  input smi_rdata_0x420;
#endif
#if _enable_smi_port_0x430 == 1
  input smi_rdata_0x430;
#endif
#if _enable_smi_port_0x440 == 1
  input smi_rdata_0x440;
#endif
#if _enable_smi_port_0x450 == 1
  input smi_rdata_0x450;
#endif
#if _enable_smi_port_0x460 == 1
  input smi_rdata_0x460;
#endif
#if _enable_smi_port_0x470 == 1
  input smi_rdata_0x470;
#endif
#if _enable_smi_port_0x480 == 1
  input smi_rdata_0x480;
#endif
#if _enable_smi_port_0x490 == 1
  input smi_rdata_0x490;
#endif
#if _enable_smi_port_0x4a0 == 1
  input smi_rdata_0x4a0;
#endif
#if _enable_smi_port_0x4b0 == 1
  input smi_rdata_0x4b0;
#endif
#if _enable_smi_port_0x4c0 == 1
  input smi_rdata_0x4c0;
#endif
#if _enable_smi_port_0x4d0 == 1
  input smi_rdata_0x4d0;
#endif
#if _enable_smi_port_0x4e0 == 1
  input smi_rdata_0x4e0;
#endif
#if _enable_smi_port_0x4f0 == 1
  input smi_rdata_0x4f0;
#endif
#if _enable_smi_port_0x500 == 1
  input smi_rdata_0x500;
#endif
#if _enable_smi_port_0x510 == 1
  input smi_rdata_0x510;
#endif
#if _enable_smi_port_0x520 == 1
  input smi_rdata_0x520;
#endif
#if _enable_smi_port_0x530 == 1
  input smi_rdata_0x530;
#endif
#if _enable_smi_port_0x540 == 1
  input smi_rdata_0x540;
#endif
#if _enable_smi_port_0x550 == 1
  input smi_rdata_0x550;
#endif
#if _enable_smi_port_0x560 == 1
  input smi_rdata_0x560;
#endif
#if _enable_smi_port_0x570 == 1
  input smi_rdata_0x570;
#endif
#if _enable_smi_port_0x580 == 1
  input smi_rdata_0x580;
#endif
#if _enable_smi_port_0x590 == 1
  input smi_rdata_0x590;
#endif
#if _enable_smi_port_0x5a0 == 1
  input smi_rdata_0x5a0;
#endif
#if _enable_smi_port_0x5b0 == 1
  input smi_rdata_0x5b0;
#endif
#if _enable_smi_port_0x5c0 == 1
  input smi_rdata_0x5c0;
#endif
#if _enable_smi_port_0x5d0 == 1
  input smi_rdata_0x5d0;
#endif
#if _enable_smi_port_0x5e0 == 1
  input smi_rdata_0x5e0;
#endif
#if _enable_smi_port_0x5f0 == 1
  input smi_rdata_0x5f0;
#endif
#if _enable_smi_port_0x600 == 1
  input smi_rdata_0x600;
#endif
#if _enable_smi_port_0x610 == 1
  input smi_rdata_0x610;
#endif
#if _enable_smi_port_0x620 == 1
  input smi_rdata_0x620;
#endif
#if _enable_smi_port_0x630 == 1
  input smi_rdata_0x630;
#endif
#if _enable_smi_port_0x640 == 1
  input smi_rdata_0x640;
#endif
#if _enable_smi_port_0x650 == 1
  input smi_rdata_0x650;
#endif
#if _enable_smi_port_0x660 == 1
  input smi_rdata_0x660;
#endif
#if _enable_smi_port_0x670 == 1
  input smi_rdata_0x670;
#endif
#if _enable_smi_port_0x680 == 1
  input smi_rdata_0x680;
#endif
#if _enable_smi_port_0x690 == 1
  input smi_rdata_0x690;
#endif
#if _enable_smi_port_0x6a0 == 1
  input smi_rdata_0x6a0;
#endif
#if _enable_smi_port_0x6b0 == 1
  input smi_rdata_0x6b0;
#endif
#if _enable_smi_port_0x6c0 == 1
  input smi_rdata_0x6c0;
#endif
#if _enable_smi_port_0x6d0 == 1
  input smi_rdata_0x6d0;
#endif
#if _enable_smi_port_0x6e0 == 1
  input smi_rdata_0x6e0;
#endif
#if _enable_smi_port_0x6f0 == 1
  input smi_rdata_0x6f0;
#endif
#if _enable_smi_port_0x700 == 1
  input smi_rdata_0x700;
#endif
#if _enable_smi_port_0x710 == 1
  input smi_rdata_0x710;
#endif
#if _enable_smi_port_0x720 == 1
  input smi_rdata_0x720;
#endif
#if _enable_smi_port_0x730 == 1
  input smi_rdata_0x730;
#endif
#if _enable_smi_port_0x740 == 1
  input smi_rdata_0x740;
#endif
#if _enable_smi_port_0x750 == 1
  input smi_rdata_0x750;
#endif
#if _enable_smi_port_0x760 == 1
  input smi_rdata_0x760;
#endif
#if _enable_smi_port_0x770 == 1
  input smi_rdata_0x770;
#endif
#if _enable_smi_port_0x780 == 1
  input smi_rdata_0x780;
#endif
#if _enable_smi_port_0x790 == 1
  input smi_rdata_0x790;
#endif
#if _enable_smi_port_0x7a0 == 1
  input smi_rdata_0x7a0;
#endif
#if _enable_smi_port_0x7b0 == 1
  input smi_rdata_0x7b0;
#endif
#if _enable_smi_port_0x7c0 == 1
  input smi_rdata_0x7c0;
#endif
#if _enable_smi_port_0x7d0 == 1
  input smi_rdata_0x7d0;
#endif
#if _enable_smi_port_0x7e0 == 1
  input smi_rdata_0x7e0;
#endif
#if _enable_smi_port_0x7f0 == 1
  input smi_rdata_0x7f0;
#endif
  output [9:0] smi_addr;
  output smi_clk, smi_rd, smi_rst_n, smi_wdata, smi_wr;
#endif
#if _enable_lpcs_0 == 1
  output [44:0] pcs360_out;
  input [16:0] pcs360_in;
#endif
#if _enable_lpcs_1 == 1
  output [44:0] pcs361_out;
  input [16:0] pcs361_in;
#endif
#if _enable_lpcs_2 == 1
  output [44:0] pcs362_out;
  input [16:0] pcs362_in;
#endif
#if _enable_lpcs_3 == 1
  output [44:0] pcs363_out;
  input [16:0] pcs363_in;
#endif
#if _enable_rpcs_0 == 1
  output [44:0] pcs3e0_out;
  input [16:0] pcs3e0_in;
#endif
#if _enable_rpcs_1 == 1
  output [44:0] pcs3e1_out;
  input [16:0] pcs3e1_in;
#endif
#if _enable_rpcs_2 == 1
  output [44:0] pcs3e2_out;
  input [16:0] pcs3e2_in;
#endif
#if _enable_rpcs_3 == 1
  output [44:0] pcs3e3_out;
  input [16:0] pcs3e3_in;
#endif
#if _dma_interface == 1
#if _enable_mpi == 1
#if _bus_width == 32
  input [0:31] dfa_rd_data; 
  input [0:3]  dfa_rd_parity;
  output [0:31] dfa_wr_data;
#elif _bus_width == 16
  input [0:15] dfa_rd_data;
  input [0:1]  dfa_rd_parity;
  output [0:15] dfa_wr_data;
#elif _bus_width == 8
  input [0:7] dfa_rd_data;
  input  dfa_rd_parity;
  output [0:7] dfa_wr_data;
#endif
  input  dfa_retry, dfa_ta, dfa_tea, dfa_tri_ctl, dfa_tri_data;
#endif
#endif
#if _enable_multi_align == 1
  input mca_clk_p1_in, mca_clk_p2_in, mca_done_in;
  output mca_clk_p1_out, mca_clk_p2_out, mca_done_out;
#endif

  wire [17:0] to_lpcsa;
  wire [17:0] to_rpcsa;
  wire [19:0] to_lpcsa_grp;
  wire [19:0] to_rpcsa_grp;
#if _enable_mpi == 1
#if _bus_width == 32
  wire [0:31] mpi_wr_data;
#elif _bus_width == 16
  wire [0:15] mpi_wr_data;
#elif _bus_width == 8
  wire [0:7] mpi_wr_data;
#endif
#endif
#if _enable_umi == 1
#if _enable_orcastra == 1
  wire [17:0] umi_addr;
  wire [35:0] umi_wdata;
  wire [35:0] umi_rdata;
  wire umi_ack, umi_retry, umi_err;

reg           PC_Ready ;
reg [31:0]    BSRing1 ;
reg [26:0]    DataInReg ;
reg [4:0]     c ;

reg   umi_wr_n ;
reg   UMackReg ;
reg   UMretryReg ;
reg   UMerrReg ;
reg   UMready2 ;

reg   PCready2 ;
reg   PCready3 ;
reg   PCready4 ;
wire   UMset ;
wire   UMclear ;
reg   umi_rdy ;
reg   UMlockI ;
#endif
#endif
  VLO scuba_vlo_inst (.Z(scuba_vlo));

#if _enable_mpi == 1
  wire [14:31] buf_mpi_addr;
  wire [0:1] buf_mpi_tsiz;

  #for (i=14; i<=31; i=i+1)
  IB I_##i (.I(mpi_addr[##i]), .O(buf_mpi_addr[##i]));
  #endfor

  IB I_cs1 (.I(mpi_cs1), .O(buf_cs1));

  IB I_cs0n (.I(mpi_cs0n), .O(buf_cs0n));

  IB I_mpi_bdip (.I(mpi_bdip), .O(buf_mpi_bdip));

  IB I_mpi_burst (.I(mpi_burst), .O(buf_mpi_burst));

  IB I_mpi_tsiz0 (.I(mpi_tsiz[0]), .O(buf_mpi_tsiz[0]));

  IB I_mpi_tsiz1 (.I(mpi_tsiz[1]), .O(buf_mpi_tsiz[1]));

  IB I_mpi_strb_n (.I(mpi_strb_n), .O(buf_mpi_strb_n));

  IB I_mpi_wr_n (.I(mpi_wr_n), .O(buf_mpi_wr_n));

  IB I_mpi_clk (.I(mpi_clk), .O(buf_mpi_clk));

  OB I_mpi_irq_n (.I(buf_mpi_irq_n), .O(mpi_irq_n));

  OBZ I_mpi_tea (.I(buf_mpi_tea), .T(mpi_cntl_ts), .O(mpi_tea));

  OBZ I_mpi_retry (.I(buf_mpi_retry), .T(mpi_cntl_ts), .O(mpi_retry));

  OBZ I_mpi_ta (.I(buf_mpi_ta), .T(mpi_cntl_ts), .O(mpi_ta));

#if _bus_width == 32
  BB I_mpi_data_31 (.I(mpi_rd_data31), .T(pd31_16_ts), .O(mpi_wr_data[31]),
                   .B(mpi_data[31]));

  BB I_mpi_data_30 (.I(mpi_rd_data30), .T(pd31_16_ts), .O(mpi_wr_data[30]),
                   .B(mpi_data[30]));

  BB I_mpi_data_29 (.I(mpi_rd_data29), .T(pd31_16_ts), .O(mpi_wr_data[29]),
                   .B(mpi_data[29]));

  BB I_mpi_data_28 (.I(mpi_rd_data28), .T(pd31_16_ts), .O(mpi_wr_data[28]),
                   .B(mpi_data[28]));

  BB I_mpi_data_27 (.I(mpi_rd_data27), .T(pd31_16_ts), .O(mpi_wr_data[27]),
                   .B(mpi_data[27]));

  BB I_mpi_data_26 (.I(mpi_rd_data26), .T(pd31_16_ts), .O(mpi_wr_data[26]),
                   .B(mpi_data[26]));

  BB I_mpi_data_25 (.I(mpi_rd_data25), .T(pd31_16_ts), .O(mpi_wr_data[25]),
                   .B(mpi_data[25]));

  BB I_mpi_data_24 (.I(mpi_rd_data24), .T(pd31_16_ts), .O(mpi_wr_data[24]),
                   .B(mpi_data[24]));

  BB I_mpi_data_23 (.I(mpi_rd_data23), .T(pd31_16_ts), .O(mpi_wr_data[23]),
                   .B(mpi_data[23]));

  BB I_mpi_data_22 (.I(mpi_rd_data22), .T(pd31_16_ts), .O(mpi_wr_data[22]),
                   .B(mpi_data[22]));

  BB I_mpi_data_21 (.I(mpi_rd_data21), .T(pd31_16_ts), .O(mpi_wr_data[21]),
                   .B(mpi_data[21]));

  BB I_mpi_data_20 (.I(mpi_rd_data20), .T(pd31_16_ts), .O(mpi_wr_data[20]),
                   .B(mpi_data[20]));

  BB I_mpi_data_19 (.I(mpi_rd_data19), .T(pd31_16_ts), .O(mpi_wr_data[19]),
                   .B(mpi_data[19]));

  BB I_mpi_data_18 (.I(mpi_rd_data18), .T(pd31_16_ts), .O(mpi_wr_data[18]),
                   .B(mpi_data[18]));

  BB I_mpi_data_17 (.I(mpi_rd_data17), .T(pd31_16_ts), .O(mpi_wr_data[17]),
                   .B(mpi_data[17]));

  BB I_mpi_data_16 (.I(mpi_rd_data16), .T(pd31_16_ts), .O(mpi_wr_data[16]),
                   .B(mpi_data[16]));
#if _parity_enable == 1

  BB I_mpi_parity2 (.I(mpi_rd_parity2), .T(mpi_dp_ts_2), .O(mpi_wr_parity2),
                    .B(mpi_par[2]));

  BB I_mpi_parity3 (.I(mpi_rd_parity3), .T(mpi_dp_ts_2), .O(mpi_wr_parity3),
                    .B(mpi_par[3]));
#endif
#endif

#if _bus_width == 32 || _bus_width == 16

  BB I_mpi_data_15 (.I(mpi_rd_data15), .T(pd15_8_ts), .O(mpi_wr_data[15]),
                   .B(mpi_data[15]));

  BB I_mpi_data_14 (.I(mpi_rd_data14), .T(pd15_8_ts), .O(mpi_wr_data[14]),
                   .B(mpi_data[14]));

  BB I_mpi_data_13 (.I(mpi_rd_data13), .T(pd15_8_ts), .O(mpi_wr_data[13]),
                   .B(mpi_data[13]));

  BB I_mpi_data_12 (.I(mpi_rd_data12), .T(pd15_8_ts), .O(mpi_wr_data[12]),
                   .B(mpi_data[12]));

  BB I_mpi_data_11 (.I(mpi_rd_data11), .T(pd15_8_ts), .O(mpi_wr_data[11]),
                   .B(mpi_data[11]));

  BB I_mpi_data_10 (.I(mpi_rd_data10), .T(pd15_8_ts), .O(mpi_wr_data[10]),
                   .B(mpi_data[10]));

  BB I_mpi_data_9 (.I(mpi_rd_data9), .T(pd15_8_ts), .O(mpi_wr_data[9]),
                   .B(mpi_data[9]));

  BB I_mpi_data_8 (.I(mpi_rd_data8), .T(pd15_8_ts), .O(mpi_wr_data[8]),
                   .B(mpi_data[8]));
#if _parity_enable == 1

  BB I_mpi_parity1 (.I(mpi_rd_parity1), .T(mpi_dp_ts_1), .O(mpi_wr_parity1),
                    .B(mpi_par[1]));

#endif
#endif

#if _bus_width == 32 || _bus_width == 16 || _bus_width == 8

  BB I_mpi_data_7 (.I(mpi_rd_data7), .T(pd7_3_ts), .O(mpi_wr_data[7]),
                   .B(mpi_data[7]));

  BB I_mpi_data_6 (.I(mpi_rd_data6), .T(pd7_3_ts), .O(mpi_wr_data[6]),
                   .B(mpi_data[6]));

  BB I_mpi_data_5 (.I(mpi_rd_data5), .T(pd7_3_ts), .O(mpi_wr_data[5]),
                   .B(mpi_data[5]));

  BB I_mpi_data_4 (.I(mpi_rd_data4), .T(pd7_3_ts), .O(mpi_wr_data[4]),
                   .B(mpi_data[4]));

  BB I_mpi_data_3 (.I(mpi_rd_data3), .T(pd7_3_ts), .O(mpi_wr_data[3]),
                   .B(mpi_data[3]));

  BB I_mpi_data_2 (.I(mpi_rd_data2), .T(pd2_0_ts), .O(mpi_wr_data[2]),
                   .B(mpi_data[2]));

  BB I_mpi_data_1 (.I(mpi_rd_data1), .T(pd2_0_ts), .O(mpi_wr_data[1]),
                   .B(mpi_data[1]));

  BB I_mpi_data_0 (.I(mpi_rd_data0), .T(pd2_0_ts), .O(mpi_wr_data[0]),
                   .B(mpi_data[0]));
#if _parity_enable == 1

  BB I_mpi_parity0 (.I(mpi_rd_parity0), .T(mpi_dp_ts_0), .O(mpi_wr_parity0),
                    .B(mpi_par[0]));
#endif
#endif
#endif     -- end of if enable_mpi

#if _dma_interface == 1
#if _enable_mpi == 1
  assign dfa_addr = buf_mpi_addr;
  assign dfa_wr_data = mpi_wr_data;
  assign dfa_cs1 = buf_cs1;
  assign dfa_cs0n = buf_cs0n;
  assign dfa_wr_n = buf_mpi_wr_n;
  assign dfa_bdip = buf_mpi_bdip;
  assign dfa_burst = buf_mpi_burst;
  assign dfa_tsiz = buf_mpi_tsiz;
  assign dfa_strb_n = buf_mpi_strb_n;
#endif
#endif

#macro converter1(arg1,arg2)
#if arg1 == 1
#define arg2 ENABLED
#elif arg1 == 0
#define arg2 DISABLED
#endif
#endmacro
#macro converter2(arg1,arg2)
#if arg1 == 1
#define arg2 SYNC
#elif arg1 == 0
#define arg2 ASYNC
#endif
#endmacro
#macro converter3(arg1,arg2)
#if arg1 == "MPI"
#define arg2 SYNC
#elif arg1 == "USER"
#define arg2 ASYNC
#elif arg1 == "OSC"
#define arg2 ASYNC
#endif
#endmacro

#macro converter4(arg1,arg2)
#define arg2 0b##arg1
#endmacro

#macro converter5(arg1,arg2)
#if arg1 == "EVEN"
#define arg2 EVEN
#elif arg1 == "ODD"
#define arg2 ODD
#endif
#endmacro
#macro converter6(arg1,arg2)
#if arg1 == "MPI"
#define arg2 MPI
#elif arg1 == "USER"
#define arg2 USER
#elif arg1 == "OSC"
#define arg2 OSC
#endif
#endmacro
#macro converter7(arg1,arg2)
#if arg1 == "LOW"
#define arg2 LOW
#elif arg1 == "MED"
#define arg2 MED
#elif arg1 == "HIGH"
#define arg2 HIGH
#endif
#endmacro

#converter1(_parity_enable, _parity_enable_new)
#converter1(_mpi_sys_reset, _mpi_sys_reset_new)
#converter1(_umi_sys_reset, _umi_sys_reset_new)
#converter1(_auto_retry, _auto_retry_new)
#converter3(_sys_clock, _mpi_clk_async_new)
#converter2(_umi_sync_hclk, _umi_sync_hclk_new)
#converter2(_usi_sync_hclk, _usi_sync_hclk_new)
#converter4(_interrupt_vec1, _interrupt_vec1_new)
#converter4(_interrupt_vec2, _interrupt_vec2_new)
#converter4(_interrupt_vec3, _interrupt_vec3_new)
#converter4(_interrupt_vec4, _interrupt_vec4_new)
#converter4(_interrupt_vec5, _interrupt_vec5_new)
#converter4(_interrupt_vec6, _interrupt_vec6_new)
#converter5(_read_parity, _read_parity_new)
#converter6(_sys_clock, _sys_clock_new)
#converter7(_mpi_priority, _mpi_priority_new)
#converter7(_umi_priority, _umi_priority_new)

//synopsys translate_off
  parameter USER_CONFIG_FILE = #_circuit_name_new;
  defparam SYSBUSA_INST.SYSBUS_CONFIG_FILE = USER_CONFIG_FILE;
  defparam SYSBUSA_INST.MPI_PARITY = #_parity_enable_new;
  defparam SYSBUSA_INST.MPI_BUS_WIDTH = _bus_width;
  defparam SYSBUSA_INST.SYS_CLK_SEL = _sys_clock;
  defparam SYSBUSA_INST.MPI_PRIORITY = _mpi_priority;
  defparam SYSBUSA_INST.FPGA_PRIORITY = _umi_priority;
  defparam SYSBUSA_INST.MPI_RST = #_mpi_sys_reset_new;
  defparam SYSBUSA_INST.MASTER_RST = #_umi_sys_reset_new;
  defparam SYSBUSA_INST.PARITY = _read_parity;
  defparam SYSBUSA_INST.MPI_SYNCMODE = #_mpi_clk_async_new;
  defparam SYSBUSA_INST.MASTER_SYNCMODE = #_umi_sync_hclk_new;
  defparam SYSBUSA_INST.MASTER_AUTORETRY = #_auto_retry_new;
  defparam SYSBUSA_INST.SLAVE_SYNCMODE = #_usi_sync_hclk_new;
  defparam SYSBUSA_INST.INTERRUPT_VECTOR1 = 32'b##_interrupt_vec1;
  defparam SYSBUSA_INST.INTERRUPT_VECTOR2 = 32'b##_interrupt_vec2;
  defparam SYSBUSA_INST.INTERRUPT_VECTOR3 = 32'b##_interrupt_vec3;
  defparam SYSBUSA_INST.INTERRUPT_VECTOR4 = 32'b##_interrupt_vec4;
  defparam SYSBUSA_INST.INTERRUPT_VECTOR5 = 32'b##_interrupt_vec5;
  defparam SYSBUSA_INST.INTERRUPT_VECTOR6 = 32'b##_interrupt_vec6;

integer file, r;

initial
begin
    file = $fopen(USER_CONFIG_FILE, "r");
    if (file == `NULL)
       $display ("WARNING : Auto configuration file for SYSBUSA module not found.  SYSBUSA internal configuration registers required for multi quad PCS alignment will not be initialized correctly during simulation!"); 
end
//synopsys translate_on

  SYSBUSA SYSBUSA_INST (
#if _enable_mpi == 1
    .CS0_N(buf_cs0n),
    .CS1(buf_cs1), 
    .MPI_CLK(buf_mpi_clk), 
    .MPI_WR_N(buf_mpi_wr_n), 
    .MPI_STRB_N(buf_mpi_strb_n), 
    .MPI_TSIZ_0(buf_mpi_tsiz[0]), 
    .MPI_TSIZ_1(buf_mpi_tsiz[1]), 
    .MPI_BURST(buf_mpi_burst), 
    .MPI_BDIP(buf_mpi_bdip), 
    .MPI_ADDR_14(buf_mpi_addr[14]), 
    .MPI_ADDR_15(buf_mpi_addr[15]), 
    .MPI_ADDR_16(buf_mpi_addr[16]), 
    .MPI_ADDR_17(buf_mpi_addr[17]), 
    .MPI_ADDR_18(buf_mpi_addr[18]), 
    .MPI_ADDR_19(buf_mpi_addr[19]), 
    .MPI_ADDR_20(buf_mpi_addr[20]), 
    .MPI_ADDR_21(buf_mpi_addr[21]), 
    .MPI_ADDR_22(buf_mpi_addr[22]), 
    .MPI_ADDR_23(buf_mpi_addr[23]), 
    .MPI_ADDR_24(buf_mpi_addr[24]), 
    .MPI_ADDR_25(buf_mpi_addr[25]), 
    .MPI_ADDR_26(buf_mpi_addr[26]), 
    .MPI_ADDR_27(buf_mpi_addr[27]), 
    .MPI_ADDR_28(buf_mpi_addr[28]), 
    .MPI_ADDR_29(buf_mpi_addr[29]), 
    .MPI_ADDR_30(buf_mpi_addr[30]), 
    .MPI_ADDR_31(buf_mpi_addr[31]), 
#if _bus_width == 32
    .MPI_WR_DATA_31(mpi_wr_data[31]), 
    .MPI_WR_DATA_30(mpi_wr_data[30]), 
    .MPI_WR_DATA_29(mpi_wr_data[29]), 
    .MPI_WR_DATA_28(mpi_wr_data[28]), 
    .MPI_WR_DATA_27(mpi_wr_data[27]), 
    .MPI_WR_DATA_26(mpi_wr_data[26]), 
    .MPI_WR_DATA_25(mpi_wr_data[25]), 
    .MPI_WR_DATA_24(mpi_wr_data[24]), 
    .MPI_WR_DATA_23(mpi_wr_data[23]), 
    .MPI_WR_DATA_22(mpi_wr_data[22]), 
    .MPI_WR_DATA_21(mpi_wr_data[21]), 
    .MPI_WR_DATA_20(mpi_wr_data[20]), 
    .MPI_WR_DATA_19(mpi_wr_data[19]), 
    .MPI_WR_DATA_18(mpi_wr_data[18]), 
    .MPI_WR_DATA_17(mpi_wr_data[17]), 
    .MPI_WR_DATA_16(mpi_wr_data[16]), 
#if _parity_enable == 1
    .MPI_WR_PARITY_3(mpi_wr_parity3), 
    .MPI_WR_PARITY_2(mpi_wr_parity2), 
#else 
    .MPI_WR_PARITY_3(scuba_vlo),
    .MPI_WR_PARITY_2(scuba_vlo),
#endif
    .MPI_WR_DATA_15(mpi_wr_data[15]),
    .MPI_WR_DATA_14(mpi_wr_data[14]),
    .MPI_WR_DATA_13(mpi_wr_data[13]),
    .MPI_WR_DATA_12(mpi_wr_data[12]),
    .MPI_WR_DATA_11(mpi_wr_data[11]),
    .MPI_WR_DATA_10(mpi_wr_data[10]),
    .MPI_WR_DATA_9(mpi_wr_data[9]),
    .MPI_WR_DATA_8(mpi_wr_data[8]),
#if _parity_enable == 1
    .MPI_WR_PARITY_1(mpi_wr_parity1),
#else
    .MPI_WR_PARITY_1(scuba_vlo),
#endif
    .MPI_WR_DATA_7(mpi_wr_data[7]),
    .MPI_WR_DATA_6(mpi_wr_data[6]),
    .MPI_WR_DATA_5(mpi_wr_data[5]),
    .MPI_WR_DATA_4(mpi_wr_data[4]),
    .MPI_WR_DATA_3(mpi_wr_data[3]),
    .MPI_WR_DATA_2(mpi_wr_data[2]),
    .MPI_WR_DATA_1(mpi_wr_data[1]),
    .MPI_WR_DATA_0(mpi_wr_data[0]),
#if _parity_enable == 1
    .MPI_WR_PARITY_0(mpi_wr_parity0),
#else
    .MPI_WR_PARITY_0(scuba_vlo),
#endif
#endif
#if _bus_width == 16
    .MPI_WR_DATA_31(scuba_vlo),
    .MPI_WR_DATA_30(scuba_vlo),
    .MPI_WR_DATA_29(scuba_vlo),
    .MPI_WR_DATA_28(scuba_vlo),
    .MPI_WR_DATA_27(scuba_vlo),
    .MPI_WR_DATA_26(scuba_vlo),
    .MPI_WR_DATA_25(scuba_vlo),
    .MPI_WR_DATA_24(scuba_vlo),
    .MPI_WR_DATA_23(scuba_vlo),
    .MPI_WR_DATA_22(scuba_vlo),
    .MPI_WR_DATA_21(scuba_vlo),
    .MPI_WR_DATA_20(scuba_vlo),
    .MPI_WR_DATA_19(scuba_vlo),
    .MPI_WR_DATA_18(scuba_vlo),
    .MPI_WR_DATA_17(scuba_vlo),
    .MPI_WR_DATA_16(scuba_vlo),
    .MPI_WR_PARITY_3(scuba_vlo),
    .MPI_WR_PARITY_2(scuba_vlo),
    .MPI_WR_DATA_15(mpi_wr_data[15]),
    .MPI_WR_DATA_14(mpi_wr_data[14]),
    .MPI_WR_DATA_13(mpi_wr_data[13]),
    .MPI_WR_DATA_12(mpi_wr_data[12]),
    .MPI_WR_DATA_11(mpi_wr_data[11]),
    .MPI_WR_DATA_10(mpi_wr_data[10]),
    .MPI_WR_DATA_9(mpi_wr_data[9]),
    .MPI_WR_DATA_8(mpi_wr_data[8]),
#if _parity_enable == 1
    .MPI_WR_PARITY_1(mpi_wr_parity1),
#else 
    .MPI_WR_PARITY_1(scuba_vlo),
#endif
    .MPI_WR_DATA_7(mpi_wr_data[7]),
    .MPI_WR_DATA_6(mpi_wr_data[6]),
    .MPI_WR_DATA_5(mpi_wr_data[5]),
    .MPI_WR_DATA_4(mpi_wr_data[4]),
    .MPI_WR_DATA_3(mpi_wr_data[3]),
    .MPI_WR_DATA_2(mpi_wr_data[2]),
    .MPI_WR_DATA_1(mpi_wr_data[1]),
    .MPI_WR_DATA_0(mpi_wr_data[0]),
#if _parity_enable == 1
    .MPI_WR_PARITY_0(mpi_wr_parity0),
#else
    .MPI_WR_PARITY_0(scuba_vlo),
#endif
#endif
#if _bus_width == 8
    .MPI_WR_DATA_31(scuba_vlo),
    .MPI_WR_DATA_30(scuba_vlo),
    .MPI_WR_DATA_29(scuba_vlo),
    .MPI_WR_DATA_28(scuba_vlo),
    .MPI_WR_DATA_27(scuba_vlo),
    .MPI_WR_DATA_26(scuba_vlo),
    .MPI_WR_DATA_25(scuba_vlo),
    .MPI_WR_DATA_24(scuba_vlo),
    .MPI_WR_DATA_23(scuba_vlo),
    .MPI_WR_DATA_22(scuba_vlo),
    .MPI_WR_DATA_21(scuba_vlo),
    .MPI_WR_DATA_20(scuba_vlo),
    .MPI_WR_DATA_19(scuba_vlo),
    .MPI_WR_DATA_18(scuba_vlo),
    .MPI_WR_DATA_17(scuba_vlo),
    .MPI_WR_DATA_16(scuba_vlo),
    .MPI_WR_PARITY_3(scuba_vlo),
    .MPI_WR_PARITY_2(scuba_vlo),
    .MPI_WR_DATA_15(scuba_vlo),
    .MPI_WR_DATA_14(scuba_vlo),
    .MPI_WR_DATA_13(scuba_vlo),
    .MPI_WR_DATA_12(scuba_vlo),
    .MPI_WR_DATA_11(scuba_vlo),
    .MPI_WR_DATA_10(scuba_vlo),
    .MPI_WR_DATA_9(scuba_vlo),
    .MPI_WR_DATA_8(scuba_vlo),
    .MPI_WR_PARITY_1(scuba_vlo),
    .MPI_WR_DATA_7(mpi_wr_data[7]),
    .MPI_WR_DATA_6(mpi_wr_data[6]),
    .MPI_WR_DATA_5(mpi_wr_data[5]),
    .MPI_WR_DATA_4(mpi_wr_data[4]),
    .MPI_WR_DATA_3(mpi_wr_data[3]),
    .MPI_WR_DATA_2(mpi_wr_data[2]),
    .MPI_WR_DATA_1(mpi_wr_data[1]),
    .MPI_WR_DATA_0(mpi_wr_data[0]),
#if _parity_enable == 1
    .MPI_WR_PARITY_0(mpi_wr_parity0),
#else 
    .MPI_WR_PARITY_0(scuba_vlo),
#endif
#endif
    .MPI_RST_N(mpi_rst_n), 
    .MPI_TA(buf_mpi_ta), 
    .MPI_RETRY(buf_mpi_retry), 
    .MPI_TEA(buf_mpi_tea), 
#if _bus_width == 32
    .MPI_RD_DATA_31(mpi_rd_data31),
    .MPI_RD_DATA_30(mpi_rd_data30),
    .MPI_RD_DATA_29(mpi_rd_data29),
    .MPI_RD_DATA_28(mpi_rd_data28),
    .MPI_RD_DATA_27(mpi_rd_data27),
    .MPI_RD_DATA_26(mpi_rd_data26),
    .MPI_RD_DATA_25(mpi_rd_data25),
    .MPI_RD_DATA_24(mpi_rd_data24),
    .MPI_RD_DATA_23(mpi_rd_data23),
    .MPI_RD_DATA_22(mpi_rd_data22),
    .MPI_RD_DATA_21(mpi_rd_data21),
    .MPI_RD_DATA_20(mpi_rd_data20),
    .MPI_RD_DATA_19(mpi_rd_data19),
    .MPI_RD_DATA_18(mpi_rd_data18),
    .MPI_RD_DATA_17(mpi_rd_data17),
    .MPI_RD_DATA_16(mpi_rd_data16),
#if _parity_enable == 1
    .MPI_RD_PARITY_3(mpi_rd_parity3),
    .MPI_RD_PARITY_2(mpi_rd_parity2),
#else 
    .MPI_RD_PARITY_3(),
    .MPI_RD_PARITY_2(),
#endif
    .MPI_RD_DATA_15(mpi_rd_data15),
    .MPI_RD_DATA_14(mpi_rd_data14),
    .MPI_RD_DATA_13(mpi_rd_data13),
    .MPI_RD_DATA_12(mpi_rd_data12),
    .MPI_RD_DATA_11(mpi_rd_data11),
    .MPI_RD_DATA_10(mpi_rd_data10),
    .MPI_RD_DATA_9(mpi_rd_data9),
    .MPI_RD_DATA_8(mpi_rd_data8),
#if _parity_enable == 1
    .MPI_RD_PARITY_1(mpi_rd_parity1),
#else 
    .MPI_RD_PARITY_1(),
#endif
    .MPI_RD_DATA_7(mpi_rd_data7),
    .MPI_RD_DATA_6(mpi_rd_data6),
    .MPI_RD_DATA_5(mpi_rd_data5),
    .MPI_RD_DATA_4(mpi_rd_data4),
    .MPI_RD_DATA_3(mpi_rd_data3),
    .MPI_RD_DATA_2(mpi_rd_data2),
    .MPI_RD_DATA_1(mpi_rd_data1),
    .MPI_RD_DATA_0(mpi_rd_data0),
#if _parity_enable == 1
    .MPI_RD_PARITY_0(mpi_rd_parity0),
#else 
    .MPI_RD_PARITY_0(),
#endif
#endif
#if _bus_width == 16
    .MPI_RD_DATA_31(),
    .MPI_RD_DATA_30(),
    .MPI_RD_DATA_29(),
    .MPI_RD_DATA_28(),
    .MPI_RD_DATA_27(),
    .MPI_RD_DATA_26(),
    .MPI_RD_DATA_25(),
    .MPI_RD_DATA_24(),
    .MPI_RD_DATA_23(),
    .MPI_RD_DATA_22(),
    .MPI_RD_DATA_21(),
    .MPI_RD_DATA_20(),
    .MPI_RD_DATA_19(),
    .MPI_RD_DATA_18(),
    .MPI_RD_DATA_17(),
    .MPI_RD_DATA_16(),
    .MPI_RD_PARITY_3(),
    .MPI_RD_PARITY_2(),
    .MPI_RD_DATA_15(mpi_rd_data15),
    .MPI_RD_DATA_14(mpi_rd_data14),
    .MPI_RD_DATA_13(mpi_rd_data13),
    .MPI_RD_DATA_12(mpi_rd_data12),
    .MPI_RD_DATA_11(mpi_rd_data11),
    .MPI_RD_DATA_10(mpi_rd_data10),
    .MPI_RD_DATA_9(mpi_rd_data9),
    .MPI_RD_DATA_8(mpi_rd_data8),
#if _parity_enable == 1
    .MPI_RD_PARITY_1(mpi_rd_parity1),
#else 
    .MPI_RD_PARITY_1(),
#endif
    .MPI_RD_DATA_7(mpi_rd_data7),
    .MPI_RD_DATA_6(mpi_rd_data6),
    .MPI_RD_DATA_5(mpi_rd_data5),
    .MPI_RD_DATA_4(mpi_rd_data4),
    .MPI_RD_DATA_3(mpi_rd_data3),
    .MPI_RD_DATA_2(mpi_rd_data2),
    .MPI_RD_DATA_1(mpi_rd_data1),
    .MPI_RD_DATA_0(mpi_rd_data0),
#if _parity_enable == 1
    .MPI_RD_PARITY_0(mpi_rd_parity0),
#else
    .MPI_RD_PARITY_0(),
#endif
#endif
#if _bus_width == 8
    .MPI_RD_DATA_31(),
    .MPI_RD_DATA_30(),
    .MPI_RD_DATA_29(),
    .MPI_RD_DATA_28(),
    .MPI_RD_DATA_27(),
    .MPI_RD_DATA_26(),
    .MPI_RD_DATA_25(),
    .MPI_RD_DATA_24(),
    .MPI_RD_DATA_23(),
    .MPI_RD_DATA_22(),
    .MPI_RD_DATA_21(),
    .MPI_RD_DATA_20(),
    .MPI_RD_DATA_19(),
    .MPI_RD_DATA_18(),
    .MPI_RD_DATA_17(),
    .MPI_RD_DATA_16(),
    .MPI_RD_PARITY_3(),
    .MPI_RD_PARITY_2(),
    .MPI_RD_DATA_15(),
    .MPI_RD_DATA_14(),
    .MPI_RD_DATA_13(),
    .MPI_RD_DATA_12(),
    .MPI_RD_DATA_11(),
    .MPI_RD_DATA_10(),
    .MPI_RD_DATA_9(),
    .MPI_RD_DATA_8(),
    .MPI_RD_PARITY_1(),
    .MPI_RD_DATA_7(mpi_rd_data7),
    .MPI_RD_DATA_6(mpi_rd_data6),
    .MPI_RD_DATA_5(mpi_rd_data5),
    .MPI_RD_DATA_4(mpi_rd_data4),
    .MPI_RD_DATA_3(mpi_rd_data3),
    .MPI_RD_DATA_2(mpi_rd_data2),
    .MPI_RD_DATA_1(mpi_rd_data1),
    .MPI_RD_DATA_0(mpi_rd_data0),
#if _parity_enable == 1
    .MPI_RD_PARITY_0(mpi_rd_parity0),
#else 
    .MPI_RD_PARITY_0(),
#endif
#endif
    .PD2_0_TS(pd2_0_ts), 
    .PD7_3_TS(pd7_3_ts), 
    .PD15_8_TS(pd15_8_ts), 
    .PD31_16_TS(pd31_16_ts), 
#if _parity_enable == 1
    .MPI_DP_TS_0(mpi_dp_ts_0), 
    .MPI_DP_TS_1(mpi_dp_ts_1), 
    .MPI_DP_TS_2(mpi_dp_ts_2), 
#else
    .MPI_DP_TS_0(),
    .MPI_DP_TS_1(),
    .MPI_DP_TS_2(),
#endif
    .MPI_IRQ_N(buf_mpi_irq_n), 
    .MPI_CNTL_TS(mpi_cntl_ts), 
#elif _enable_mpi == 0
    .CS0_N(scuba_vlo),
    .CS1(scuba_vlo),
    .MPI_CLK(scuba_vlo),
    .MPI_WR_N(scuba_vlo),
    .MPI_STRB_N(scuba_vlo),
    .MPI_TSIZ_0(scuba_vlo),
    .MPI_TSIZ_1(scuba_vlo),
    .MPI_BURST(scuba_vlo),
    .MPI_BDIP(scuba_vlo),
    .MPI_ADDR_14(scuba_vlo),
    .MPI_ADDR_15(scuba_vlo),
    .MPI_ADDR_16(scuba_vlo),
    .MPI_ADDR_17(scuba_vlo),
    .MPI_ADDR_18(scuba_vlo),
    .MPI_ADDR_19(scuba_vlo),
    .MPI_ADDR_20(scuba_vlo),
    .MPI_ADDR_21(scuba_vlo),
    .MPI_ADDR_22(scuba_vlo),
    .MPI_ADDR_23(scuba_vlo),
    .MPI_ADDR_24(scuba_vlo),
    .MPI_ADDR_25(scuba_vlo),
    .MPI_ADDR_26(scuba_vlo),
    .MPI_ADDR_27(scuba_vlo),
    .MPI_ADDR_28(scuba_vlo),
    .MPI_ADDR_29(scuba_vlo),
    .MPI_ADDR_30(scuba_vlo),
    .MPI_ADDR_31(scuba_vlo),
    .MPI_WR_DATA_31(scuba_vlo),
    .MPI_WR_DATA_30(scuba_vlo),
    .MPI_WR_DATA_29(scuba_vlo),
    .MPI_WR_DATA_28(scuba_vlo),
    .MPI_WR_DATA_27(scuba_vlo),
    .MPI_WR_DATA_26(scuba_vlo),
    .MPI_WR_DATA_25(scuba_vlo),
    .MPI_WR_DATA_24(scuba_vlo),
    .MPI_WR_DATA_23(scuba_vlo),
    .MPI_WR_DATA_22(scuba_vlo),
    .MPI_WR_DATA_21(scuba_vlo),
    .MPI_WR_DATA_20(scuba_vlo),
    .MPI_WR_DATA_19(scuba_vlo),
    .MPI_WR_DATA_18(scuba_vlo),
    .MPI_WR_DATA_17(scuba_vlo),
    .MPI_WR_DATA_16(scuba_vlo),
    .MPI_WR_PARITY_3(scuba_vlo),
    .MPI_WR_PARITY_2(scuba_vlo),
    .MPI_WR_DATA_15(scuba_vlo),
    .MPI_WR_DATA_14(scuba_vlo),
    .MPI_WR_DATA_13(scuba_vlo),
    .MPI_WR_DATA_12(scuba_vlo),
    .MPI_WR_DATA_11(scuba_vlo),
    .MPI_WR_DATA_10(scuba_vlo),
    .MPI_WR_DATA_9(scuba_vlo),
    .MPI_WR_DATA_8(scuba_vlo),
    .MPI_WR_PARITY_1(scuba_vlo),
    .MPI_WR_DATA_7(scuba_vlo),
    .MPI_WR_DATA_6(scuba_vlo),
    .MPI_WR_DATA_5(scuba_vlo),
    .MPI_WR_DATA_4(scuba_vlo),
    .MPI_WR_DATA_3(scuba_vlo),
    .MPI_WR_DATA_2(scuba_vlo),
    .MPI_WR_DATA_1(scuba_vlo),
    .MPI_WR_DATA_0(scuba_vlo),
    .MPI_WR_PARITY_0(scuba_vlo),
    .MPI_RST_N(scuba_vlo),
    .MPI_RD_DATA_31(),
    .MPI_RD_DATA_30(),
    .MPI_RD_DATA_29(),
    .MPI_RD_DATA_28(),
    .MPI_RD_DATA_27(),
    .MPI_RD_DATA_26(),
    .MPI_RD_DATA_25(),
    .MPI_RD_DATA_24(),
    .MPI_RD_DATA_23(),
    .MPI_RD_DATA_22(),
    .MPI_RD_DATA_21(),
    .MPI_RD_DATA_20(),
    .MPI_RD_DATA_19(),
    .MPI_RD_DATA_18(),
    .MPI_RD_DATA_17(),
    .MPI_RD_DATA_16(),
    .MPI_RD_PARITY_3(),
    .MPI_RD_PARITY_2(),
    .MPI_RD_DATA_15(),
    .MPI_RD_DATA_14(),
    .MPI_RD_DATA_13(),
    .MPI_RD_DATA_12(),
    .MPI_RD_DATA_11(),
    .MPI_RD_DATA_10(),
    .MPI_RD_DATA_9(),
    .MPI_RD_DATA_8(),
    .MPI_RD_PARITY_1(),
    .MPI_RD_DATA_7(),
    .MPI_RD_DATA_6(),
    .MPI_RD_DATA_5(),
    .MPI_RD_DATA_4(),
    .MPI_RD_DATA_3(),
    .MPI_RD_DATA_2(),
    .MPI_RD_DATA_1(),
    .MPI_RD_DATA_0(),
    .MPI_RD_PARITY_0(),
    .PD2_0_TS(),
    .PD7_3_TS(),
    .PD15_8_TS(),
    .PD31_16_TS(),
    .MPI_DP_TS_0(),
    .MPI_DP_TS_1(),
    .MPI_DP_TS_2(),
    .MPI_IRQ_N(),
    .MPI_CNTL_TS(),
    .MPI_TA(),
    .MPI_RETRY(),
    .MPI_TEA(),
#endif
#if _sys_clock == "USER"
    .USR_CLK(usr_clk),
#else
    .USR_CLK(scuba_vlo),
#endif
    .USER_IRQ_IN(usr_irq_in),
    .USER_IRQ_OUT(usr_irq_out), 
    .HCLK_CIB(sync_clk), 
#if _enable_smi == 1
#if _enable_smi_port_0x7f0 == 1
    .SMI_RDATA_63(smi_rdata_0x7f0),
#else
    .SMI_RDATA_63(scuba_vlo),
#endif
#if _enable_smi_port_0x7e0 == 1
    .SMI_RDATA_62(smi_rdata_0x7e0),
#else
    .SMI_RDATA_62(scuba_vlo),
#endif
#if _enable_smi_port_0x7d0 == 1
    .SMI_RDATA_61(smi_rdata_0x7d0),
#else
    .SMI_RDATA_61(scuba_vlo),
#endif
#if _enable_smi_port_0x7c0 == 1
    .SMI_RDATA_60(smi_rdata_0x7c0),
#else
    .SMI_RDATA_60(scuba_vlo),
#endif
#if _enable_smi_port_0x7b0 == 1
    .SMI_RDATA_59(smi_rdata_0x7b0),
#else
    .SMI_RDATA_59(scuba_vlo),
#endif
#if _enable_smi_port_0x7a0 == 1
    .SMI_RDATA_58(smi_rdata_0x7a0),
#else
    .SMI_RDATA_58(scuba_vlo),
#endif
#if _enable_smi_port_0x790 == 1
    .SMI_RDATA_57(smi_rdata_0x790),
#else
    .SMI_RDATA_57(scuba_vlo),
#endif
#if _enable_smi_port_0x780 == 1
    .SMI_RDATA_56(smi_rdata_0x780),
#else
    .SMI_RDATA_56(scuba_vlo),
#endif
#if _enable_smi_port_0x770 == 1
    .SMI_RDATA_55(smi_rdata_0x770),
#else
    .SMI_RDATA_55(scuba_vlo),
#endif
#if _enable_smi_port_0x760 == 1
    .SMI_RDATA_54(smi_rdata_0x760),
#else
    .SMI_RDATA_54(scuba_vlo),
#endif
#if _enable_smi_port_0x750 == 1
    .SMI_RDATA_53(smi_rdata_0x750),
#else
    .SMI_RDATA_53(scuba_vlo),
#endif
#if _enable_smi_port_0x740 == 1
    .SMI_RDATA_52(smi_rdata_0x740),
#else
    .SMI_RDATA_52(scuba_vlo),
#endif
#if _enable_smi_port_0x730 == 1
    .SMI_RDATA_51(smi_rdata_0x730),
#else
    .SMI_RDATA_51(scuba_vlo),
#endif
#if _enable_smi_port_0x720 == 1
    .SMI_RDATA_50(smi_rdata_0x720),
#else
    .SMI_RDATA_50(scuba_vlo),
#endif
#if _enable_smi_port_0x710 == 1
    .SMI_RDATA_49(smi_rdata_0x710),
#else
    .SMI_RDATA_49(scuba_vlo),
#endif
#if _enable_smi_port_0x700 == 1
    .SMI_RDATA_48(smi_rdata_0x700),
#else
    .SMI_RDATA_48(scuba_vlo),
#endif
#if _enable_smi_port_0x6f0 == 1
    .SMI_RDATA_47(smi_rdata_0x6f0),
#else
    .SMI_RDATA_47(scuba_vlo),
#endif
#if _enable_smi_port_0x6e0 == 1
    .SMI_RDATA_46(smi_rdata_0x6e0),
#else
    .SMI_RDATA_46(scuba_vlo),
#endif
#if _enable_smi_port_0x6d0 == 1
    .SMI_RDATA_45(smi_rdata_0x6d0),
#else
    .SMI_RDATA_45(scuba_vlo),
#endif
#if _enable_smi_port_0x6c0 == 1
    .SMI_RDATA_44(smi_rdata_0x6c0),
#else
    .SMI_RDATA_44(scuba_vlo),
#endif
#if _enable_smi_port_0x6b0 == 1
    .SMI_RDATA_43(smi_rdata_0x6b0),
#else
    .SMI_RDATA_43(scuba_vlo),
#endif
#if _enable_smi_port_0x6a0 == 1
    .SMI_RDATA_42(smi_rdata_0x6a0),
#else
    .SMI_RDATA_42(scuba_vlo),
#endif
#if _enable_smi_port_0x690 == 1
    .SMI_RDATA_41(smi_rdata_0x690),
#else
    .SMI_RDATA_41(scuba_vlo),
#endif
#if _enable_smi_port_0x680 == 1
    .SMI_RDATA_40(smi_rdata_0x680),
#else
    .SMI_RDATA_40(scuba_vlo),
#endif
#if _enable_smi_port_0x670 == 1
    .SMI_RDATA_39(smi_rdata_0x670),
#else
    .SMI_RDATA_39(scuba_vlo),
#endif
#if _enable_smi_port_0x660 == 1
    .SMI_RDATA_38(smi_rdata_0x660),
#else
    .SMI_RDATA_38(scuba_vlo),
#endif
#if _enable_smi_port_0x650 == 1
    .SMI_RDATA_37(smi_rdata_0x650),
#else
    .SMI_RDATA_37(scuba_vlo),
#endif
#if _enable_smi_port_0x640 == 1
    .SMI_RDATA_36(smi_rdata_0x640),
#else
    .SMI_RDATA_36(scuba_vlo),
#endif
#if _enable_smi_port_0x630 == 1
    .SMI_RDATA_35(smi_rdata_0x630),
#else
    .SMI_RDATA_35(scuba_vlo),
#endif
#if _enable_smi_port_0x620 == 1
    .SMI_RDATA_34(smi_rdata_0x620),
#else
    .SMI_RDATA_34(scuba_vlo),
#endif
#if _enable_smi_port_0x610 == 1
    .SMI_RDATA_33(smi_rdata_0x610),
#else
    .SMI_RDATA_33(scuba_vlo),
#endif
#if _enable_smi_port_0x600 == 1
    .SMI_RDATA_32(smi_rdata_0x600),
#else
    .SMI_RDATA_32(scuba_vlo),
#endif
#if _enable_smi_port_0x5f0 == 1
    .SMI_RDATA_31(smi_rdata_0x5f0),
#else
    .SMI_RDATA_31(scuba_vlo),
#endif
#if _enable_smi_port_0x5e0 == 1
    .SMI_RDATA_30(smi_rdata_0x5e0),
#else
    .SMI_RDATA_30(scuba_vlo),
#endif
#if _enable_smi_port_0x5d0 == 1
    .SMI_RDATA_29(smi_rdata_0x5d0),
#else
    .SMI_RDATA_29(scuba_vlo),
#endif
#if _enable_smi_port_0x5c0 == 1
    .SMI_RDATA_28(smi_rdata_0x5c0),
#else
    .SMI_RDATA_28(scuba_vlo),
#endif
#if _enable_smi_port_0x5b0 == 1
    .SMI_RDATA_27(smi_rdata_0x5b0),
#else
    .SMI_RDATA_27(scuba_vlo),
#endif
#if _enable_smi_port_0x5a0 == 1
    .SMI_RDATA_26(smi_rdata_0x5a0),
#else
    .SMI_RDATA_26(scuba_vlo),
#endif
#if _enable_smi_port_0x590 == 1
    .SMI_RDATA_25(smi_rdata_0x590),
#else
    .SMI_RDATA_25(scuba_vlo),
#endif
#if _enable_smi_port_0x580 == 1
    .SMI_RDATA_24(smi_rdata_0x580),
#else
    .SMI_RDATA_24(scuba_vlo),
#endif
#if _enable_smi_port_0x570 == 1
    .SMI_RDATA_23(smi_rdata_0x570),
#else
    .SMI_RDATA_23(scuba_vlo),
#endif
#if _enable_smi_port_0x560 == 1
    .SMI_RDATA_22(smi_rdata_0x560),
#else
    .SMI_RDATA_22(scuba_vlo),
#endif
#if _enable_smi_port_0x550 == 1
    .SMI_RDATA_21(smi_rdata_0x550),
#else
    .SMI_RDATA_21(scuba_vlo),
#endif
#if _enable_smi_port_0x540 == 1
    .SMI_RDATA_20(smi_rdata_0x540),
#else
    .SMI_RDATA_20(scuba_vlo),
#endif
#if _enable_smi_port_0x530 == 1
    .SMI_RDATA_19(smi_rdata_0x530),
#else
    .SMI_RDATA_19(scuba_vlo),
#endif
#if _enable_smi_port_0x520 == 1
    .SMI_RDATA_18(smi_rdata_0x520),
#else
    .SMI_RDATA_18(scuba_vlo),
#endif
#if _enable_smi_port_0x510 == 1
    .SMI_RDATA_17(smi_rdata_0x510),
#else
    .SMI_RDATA_17(scuba_vlo),
#endif
#if _enable_smi_port_0x500 == 1
    .SMI_RDATA_16(smi_rdata_0x500),
#else
    .SMI_RDATA_16(scuba_vlo),
#endif
#if _enable_smi_port_0x4f0 == 1
    .SMI_RDATA_15(smi_rdata_0x4f0),
#else
    .SMI_RDATA_15(scuba_vlo),
#endif
#if _enable_smi_port_0x4e0 == 1
    .SMI_RDATA_14(smi_rdata_0x4e0),
#else
    .SMI_RDATA_14(scuba_vlo),
#endif
#if _enable_smi_port_0x4d0 == 1
    .SMI_RDATA_13(smi_rdata_0x4d0),
#else
    .SMI_RDATA_13(scuba_vlo),
#endif
#if _enable_smi_port_0x4c0 == 1
    .SMI_RDATA_12(smi_rdata_0x4c0),
#else
    .SMI_RDATA_12(scuba_vlo),
#endif
#if _enable_smi_port_0x4b0 == 1
    .SMI_RDATA_11(smi_rdata_0x4b0),
#else
    .SMI_RDATA_11(scuba_vlo),
#endif
#if _enable_smi_port_0x4a0 == 1
    .SMI_RDATA_10(smi_rdata_0x4a0),
#else
    .SMI_RDATA_10(scuba_vlo),
#endif
#if _enable_smi_port_0x490 == 1
    .SMI_RDATA_9(smi_rdata_0x490),
#else
    .SMI_RDATA_9(scuba_vlo),
#endif
#if _enable_smi_port_0x480 == 1
    .SMI_RDATA_8(smi_rdata_0x480),
#else
    .SMI_RDATA_8(scuba_vlo),
#endif
#if _enable_smi_port_0x470 == 1
    .SMI_RDATA_7(smi_rdata_0x470),
#else
    .SMI_RDATA_7(scuba_vlo),
#endif
#if _enable_smi_port_0x460 == 1
    .SMI_RDATA_6(smi_rdata_0x460),
#else
    .SMI_RDATA_6(scuba_vlo),
#endif
#if _enable_smi_port_0x450 == 1
    .SMI_RDATA_5(smi_rdata_0x450),
#else
    .SMI_RDATA_5(scuba_vlo),
#endif
#if _enable_smi_port_0x440 == 1
    .SMI_RDATA_4(smi_rdata_0x440),
#else
    .SMI_RDATA_4(scuba_vlo),
#endif
#if _enable_smi_port_0x430 == 1
    .SMI_RDATA_3(smi_rdata_0x430),
#else
    .SMI_RDATA_3(scuba_vlo),
#endif
#if _enable_smi_port_0x420 == 1
    .SMI_RDATA_2(smi_rdata_0x420),
#else
    .SMI_RDATA_2(scuba_vlo),
#endif
#if _enable_smi_port_0x410 == 1
    .SMI_RDATA_1(smi_rdata_0x410),
#else
    .SMI_RDATA_1(scuba_vlo),
#endif
    .SMI_RDATA_0(scuba_vlo),
    .SMI_ADDR_9(smi_addr[9]), 
    .SMI_ADDR_8(smi_addr[8]), 
    .SMI_ADDR_7(smi_addr[7]), 
    .SMI_ADDR_6(smi_addr[6]), 
    .SMI_ADDR_5(smi_addr[5]), 
    .SMI_ADDR_4(smi_addr[4]), 
    .SMI_ADDR_3(smi_addr[3]), 
    .SMI_ADDR_2(smi_addr[2]), 
    .SMI_ADDR_1(smi_addr[1]), 
    .SMI_ADDR_0(smi_addr[0]), 
    .SMI_CLK(smi_clk), 
    .SMI_RD(smi_rd), 
    .SMI_RST_N(smi_rst_n), 
    .SMI_WDATA(smi_wdata), 
    .SMI_WR(smi_wr), 
#elif _enable_smi == 0
    .SMI_RDATA_63(scuba_vlo), 
    .SMI_RDATA_62(scuba_vlo), 
    .SMI_RDATA_61(scuba_vlo), 
    .SMI_RDATA_60(scuba_vlo), 
    .SMI_RDATA_59(scuba_vlo), 
    .SMI_RDATA_58(scuba_vlo), 
    .SMI_RDATA_57(scuba_vlo), 
    .SMI_RDATA_56(scuba_vlo), 
    .SMI_RDATA_55(scuba_vlo), 
    .SMI_RDATA_54(scuba_vlo), 
    .SMI_RDATA_53(scuba_vlo), 
    .SMI_RDATA_52(scuba_vlo), 
    .SMI_RDATA_51(scuba_vlo), 
    .SMI_RDATA_50(scuba_vlo), 
    .SMI_RDATA_49(scuba_vlo),
    .SMI_RDATA_48(scuba_vlo),
    .SMI_RDATA_47(scuba_vlo),
    .SMI_RDATA_46(scuba_vlo),
    .SMI_RDATA_45(scuba_vlo),
    .SMI_RDATA_44(scuba_vlo),
    .SMI_RDATA_43(scuba_vlo),
    .SMI_RDATA_42(scuba_vlo),
    .SMI_RDATA_41(scuba_vlo),
    .SMI_RDATA_40(scuba_vlo),
    .SMI_RDATA_39(scuba_vlo),
    .SMI_RDATA_38(scuba_vlo),
    .SMI_RDATA_37(scuba_vlo),
    .SMI_RDATA_36(scuba_vlo),
    .SMI_RDATA_35(scuba_vlo),
    .SMI_RDATA_34(scuba_vlo),
    .SMI_RDATA_33(scuba_vlo),
    .SMI_RDATA_32(scuba_vlo),
    .SMI_RDATA_31(scuba_vlo),
    .SMI_RDATA_30(scuba_vlo),
    .SMI_RDATA_29(scuba_vlo),
    .SMI_RDATA_28(scuba_vlo),
    .SMI_RDATA_27(scuba_vlo),
    .SMI_RDATA_26(scuba_vlo),
    .SMI_RDATA_25(scuba_vlo),
    .SMI_RDATA_24(scuba_vlo),
    .SMI_RDATA_23(scuba_vlo),
    .SMI_RDATA_22(scuba_vlo),
    .SMI_RDATA_21(scuba_vlo),
    .SMI_RDATA_20(scuba_vlo),
    .SMI_RDATA_19(scuba_vlo),
    .SMI_RDATA_18(scuba_vlo),
    .SMI_RDATA_17(scuba_vlo),
    .SMI_RDATA_16(scuba_vlo),
    .SMI_RDATA_15(scuba_vlo),
    .SMI_RDATA_14(scuba_vlo),
    .SMI_RDATA_13(scuba_vlo),
    .SMI_RDATA_12(scuba_vlo),
    .SMI_RDATA_11(scuba_vlo),
    .SMI_RDATA_10(scuba_vlo),
    .SMI_RDATA_9(scuba_vlo),
    .SMI_RDATA_8(scuba_vlo),
    .SMI_RDATA_7(scuba_vlo),
    .SMI_RDATA_6(scuba_vlo),
    .SMI_RDATA_5(scuba_vlo),
    .SMI_RDATA_4(scuba_vlo),
    .SMI_RDATA_3(scuba_vlo),
    .SMI_RDATA_2(scuba_vlo),
    .SMI_RDATA_1(scuba_vlo),
    .SMI_RDATA_0(scuba_vlo),
    .SMI_ADDR_9(),
    .SMI_ADDR_8(),
    .SMI_ADDR_7(),
    .SMI_ADDR_6(),
    .SMI_ADDR_5(),
    .SMI_ADDR_4(),
    .SMI_ADDR_3(),
    .SMI_ADDR_2(),
    .SMI_ADDR_1(),
    .SMI_ADDR_0(),
    .SMI_CLK(),
    .SMI_RD(),
    .SMI_RST_N(),
    .SMI_WDATA(),
    .SMI_WR(),
#endif
#if _enable_umi == 1
#if _enable_orcastra == 1
    .FMADDR_17(umi_addr[17]),
    .FMADDR_16(umi_addr[16]),
    .FMADDR_15(umi_addr[15]),
    .FMADDR_14(umi_addr[14]),
    .FMADDR_13(umi_addr[13]),
    .FMADDR_12(umi_addr[12]),
    .FMADDR_11(umi_addr[11]),
    .FMADDR_10(umi_addr[10]),
    .FMADDR_9(umi_addr[9]),
    .FMADDR_8(umi_addr[8]),
    .FMADDR_7(umi_addr[7]),
    .FMADDR_6(umi_addr[6]),
    .FMADDR_5(umi_addr[5]),
    .FMADDR_4(umi_addr[4]),
    .FMADDR_3(umi_addr[3]),
    .FMADDR_2(umi_addr[2]),
    .FMADDR_1(umi_addr[1]),
    .FMADDR_0(umi_addr[0]),
    .FMWDATA_35(scuba_vlo), 
    .FMWDATA_34(scuba_vlo), 
    .FMWDATA_33(scuba_vlo), 
    .FMWDATA_32(scuba_vlo), 
    .FMWDATA_31(umi_wdata[7]), 
    .FMWDATA_30(umi_wdata[6]), 
    .FMWDATA_29(umi_wdata[5]), 
    .FMWDATA_28(umi_wdata[4]), 
    .FMWDATA_27(umi_wdata[3]), 
    .FMWDATA_26(umi_wdata[2]), 
    .FMWDATA_25(umi_wdata[1]),
    .FMWDATA_24(umi_wdata[0]),
    .FMWDATA_23(umi_wdata[7]),
    .FMWDATA_22(umi_wdata[6]),
    .FMWDATA_21(umi_wdata[5]),
    .FMWDATA_20(umi_wdata[4]),
    .FMWDATA_19(umi_wdata[3]),
    .FMWDATA_18(umi_wdata[2]),
    .FMWDATA_17(umi_wdata[1]),
    .FMWDATA_16(umi_wdata[0]),
    .FMWDATA_15(umi_wdata[7]),
    .FMWDATA_14(umi_wdata[6]),
    .FMWDATA_13(umi_wdata[5]),
    .FMWDATA_12(umi_wdata[4]),
    .FMWDATA_11(umi_wdata[3]),
    .FMWDATA_10(umi_wdata[2]),
    .FMWDATA_9(umi_wdata[1]),
    .FMWDATA_8(umi_wdata[0]),
    .FMWDATA_7(umi_wdata[7]),
    .FMWDATA_6(umi_wdata[6]),
    .FMWDATA_5(umi_wdata[5]),
    .FMWDATA_4(umi_wdata[4]),
    .FMWDATA_3(umi_wdata[3]),
    .FMWDATA_2(umi_wdata[2]),
    .FMWDATA_1(umi_wdata[1]),
    .FMWDATA_0(umi_wdata[0]),
    .FMCLK(umi_clk), 
    .FMRESET_N(rstn), 
    .FMWRN(umi_wr_n), 
    .FMBURST(scuba_vlo), 
    .FMRDY(umi_rdy), 
    .FMSIZE_1(scuba_vlo), 
    .FMSIZE_0(scuba_vlo), 
    .FMLOCK(scuba_vlo), 
    .FMIRQ(scuba_vlo), 
    .FMRDATA_35(umi_rdata[35]),
    .FMRDATA_34(umi_rdata[34]),
    .FMRDATA_33(umi_rdata[33]),
    .FMRDATA_32(umi_rdata[32]),
    .FMRDATA_31(umi_rdata[31]),
    .FMRDATA_30(umi_rdata[30]),
    .FMRDATA_29(umi_rdata[29]),
    .FMRDATA_28(umi_rdata[28]),
    .FMRDATA_27(umi_rdata[27]),
    .FMRDATA_26(umi_rdata[26]),
    .FMRDATA_25(umi_rdata[25]),
    .FMRDATA_24(umi_rdata[24]),
    .FMRDATA_23(umi_rdata[23]),
    .FMRDATA_22(umi_rdata[22]),
    .FMRDATA_21(umi_rdata[21]),
    .FMRDATA_20(umi_rdata[20]),
    .FMRDATA_19(umi_rdata[19]),
    .FMRDATA_18(umi_rdata[18]),
    .FMRDATA_17(umi_rdata[17]),
    .FMRDATA_16(umi_rdata[16]),
    .FMRDATA_15(umi_rdata[15]),
    .FMRDATA_14(umi_rdata[14]),
    .FMRDATA_13(umi_rdata[13]),
    .FMRDATA_12(umi_rdata[12]),
    .FMRDATA_11(umi_rdata[11]),
    .FMRDATA_10(umi_rdata[10]),
    .FMRDATA_9(umi_rdata[9]),
    .FMRDATA_8(umi_rdata[8]),
    .FMRDATA_7(umi_rdata[7]),
    .FMRDATA_6(umi_rdata[6]),
    .FMRDATA_5(umi_rdata[5]),
    .FMRDATA_4(umi_rdata[4]),
    .FMRDATA_3(umi_rdata[3]),
    .FMRDATA_2(umi_rdata[2]),
    .FMRDATA_1(umi_rdata[1]),
    .FMRDATA_0(umi_rdata[0]),
    .FMACK(umi_ack), 
    .FMRETRY(umi_retry), 
    .FMERR(umi_err), 
#else
    .FMADDR_17(umi_addr[17]),
    .FMADDR_16(umi_addr[16]),
    .FMADDR_15(umi_addr[15]),
    .FMADDR_14(umi_addr[14]),
    .FMADDR_13(umi_addr[13]),
    .FMADDR_12(umi_addr[12]),
    .FMADDR_11(umi_addr[11]),
    .FMADDR_10(umi_addr[10]),
    .FMADDR_9(umi_addr[9]),
    .FMADDR_8(umi_addr[8]),
    .FMADDR_7(umi_addr[7]),
    .FMADDR_6(umi_addr[6]),
    .FMADDR_5(umi_addr[5]),
    .FMADDR_4(umi_addr[4]),
    .FMADDR_3(umi_addr[3]),
    .FMADDR_2(umi_addr[2]),
    .FMADDR_1(umi_addr[1]),
    .FMADDR_0(umi_addr[0]),
    .FMWDATA_35(umi_wdata[35]), 
    .FMWDATA_34(umi_wdata[34]), 
    .FMWDATA_33(umi_wdata[33]), 
    .FMWDATA_32(umi_wdata[32]), 
    .FMWDATA_31(umi_wdata[31]), 
    .FMWDATA_30(umi_wdata[30]), 
    .FMWDATA_29(umi_wdata[29]), 
    .FMWDATA_28(umi_wdata[28]), 
    .FMWDATA_27(umi_wdata[27]), 
    .FMWDATA_26(umi_wdata[26]), 
    .FMWDATA_25(umi_wdata[25]),
    .FMWDATA_24(umi_wdata[24]),
    .FMWDATA_23(umi_wdata[23]),
    .FMWDATA_22(umi_wdata[22]),
    .FMWDATA_21(umi_wdata[21]),
    .FMWDATA_20(umi_wdata[20]),
    .FMWDATA_19(umi_wdata[19]),
    .FMWDATA_18(umi_wdata[18]),
    .FMWDATA_17(umi_wdata[17]),
    .FMWDATA_16(umi_wdata[16]),
    .FMWDATA_15(umi_wdata[15]),
    .FMWDATA_14(umi_wdata[14]),
    .FMWDATA_13(umi_wdata[13]),
    .FMWDATA_12(umi_wdata[12]),
    .FMWDATA_11(umi_wdata[11]),
    .FMWDATA_10(umi_wdata[10]),
    .FMWDATA_9(umi_wdata[9]),
    .FMWDATA_8(umi_wdata[8]),
    .FMWDATA_7(umi_wdata[7]),
    .FMWDATA_6(umi_wdata[6]),
    .FMWDATA_5(umi_wdata[5]),
    .FMWDATA_4(umi_wdata[4]),
    .FMWDATA_3(umi_wdata[3]),
    .FMWDATA_2(umi_wdata[2]),
    .FMWDATA_1(umi_wdata[1]),
    .FMWDATA_0(umi_wdata[0]),
    .FMCLK(umi_clk), 
    .FMRESET_N(umi_rst_n), 
    .FMWRN(umi_wr_n), 
    .FMBURST(umi_burst), 
    .FMRDY(umi_rdy), 
    .FMSIZE_1(umi_size[1]), 
    .FMSIZE_0(umi_size[0]), 
    .FMLOCK(umi_lock), 
    .FMIRQ(umi_irq), 
    .FMRDATA_35(umi_rdata[35]),
    .FMRDATA_34(umi_rdata[34]),
    .FMRDATA_33(umi_rdata[33]),
    .FMRDATA_32(umi_rdata[32]),
    .FMRDATA_31(umi_rdata[31]),
    .FMRDATA_30(umi_rdata[30]),
    .FMRDATA_29(umi_rdata[29]),
    .FMRDATA_28(umi_rdata[28]),
    .FMRDATA_27(umi_rdata[27]),
    .FMRDATA_26(umi_rdata[26]),
    .FMRDATA_25(umi_rdata[25]),
    .FMRDATA_24(umi_rdata[24]),
    .FMRDATA_23(umi_rdata[23]),
    .FMRDATA_22(umi_rdata[22]),
    .FMRDATA_21(umi_rdata[21]),
    .FMRDATA_20(umi_rdata[20]),
    .FMRDATA_19(umi_rdata[19]),
    .FMRDATA_18(umi_rdata[18]),
    .FMRDATA_17(umi_rdata[17]),
    .FMRDATA_16(umi_rdata[16]),
    .FMRDATA_15(umi_rdata[15]),
    .FMRDATA_14(umi_rdata[14]),
    .FMRDATA_13(umi_rdata[13]),
    .FMRDATA_12(umi_rdata[12]),
    .FMRDATA_11(umi_rdata[11]),
    .FMRDATA_10(umi_rdata[10]),
    .FMRDATA_9(umi_rdata[9]),
    .FMRDATA_8(umi_rdata[8]),
    .FMRDATA_7(umi_rdata[7]),
    .FMRDATA_6(umi_rdata[6]),
    .FMRDATA_5(umi_rdata[5]),
    .FMRDATA_4(umi_rdata[4]),
    .FMRDATA_3(umi_rdata[3]),
    .FMRDATA_2(umi_rdata[2]),
    .FMRDATA_1(umi_rdata[1]),
    .FMRDATA_0(umi_rdata[0]),
    .FMACK(umi_ack), 
    .FMRETRY(umi_retry), 
    .FMERR(umi_err), 
#endif
#elif _enable_umi == 0
    .FMADDR_17(scuba_vlo),
    .FMADDR_16(scuba_vlo),
    .FMADDR_15(scuba_vlo),
    .FMADDR_14(scuba_vlo),
    .FMADDR_13(scuba_vlo),
    .FMADDR_12(scuba_vlo),
    .FMADDR_11(scuba_vlo),
    .FMADDR_10(scuba_vlo),
    .FMADDR_9(scuba_vlo),
    .FMADDR_8(scuba_vlo),
    .FMADDR_7(scuba_vlo),
    .FMADDR_6(scuba_vlo),
    .FMADDR_5(scuba_vlo),
    .FMADDR_4(scuba_vlo),
    .FMADDR_3(scuba_vlo),
    .FMADDR_2(scuba_vlo),
    .FMADDR_1(scuba_vlo),
    .FMADDR_0(scuba_vlo),
    .FMWDATA_35(scuba_vlo), 
    .FMWDATA_34(scuba_vlo), 
    .FMWDATA_33(scuba_vlo), 
    .FMWDATA_32(scuba_vlo), 
    .FMWDATA_31(scuba_vlo), 
    .FMWDATA_30(scuba_vlo), 
    .FMWDATA_29(scuba_vlo), 
    .FMWDATA_28(scuba_vlo), 
    .FMWDATA_27(scuba_vlo), 
    .FMWDATA_26(scuba_vlo), 
    .FMWDATA_25(scuba_vlo),
    .FMWDATA_24(scuba_vlo),
    .FMWDATA_23(scuba_vlo),
    .FMWDATA_22(scuba_vlo),
    .FMWDATA_21(scuba_vlo),
    .FMWDATA_20(scuba_vlo),
    .FMWDATA_19(scuba_vlo),
    .FMWDATA_18(scuba_vlo),
    .FMWDATA_17(scuba_vlo),
    .FMWDATA_16(scuba_vlo),
    .FMWDATA_15(scuba_vlo),
    .FMWDATA_14(scuba_vlo),
    .FMWDATA_13(scuba_vlo),
    .FMWDATA_12(scuba_vlo),
    .FMWDATA_11(scuba_vlo),
    .FMWDATA_10(scuba_vlo),
    .FMWDATA_9(scuba_vlo),
    .FMWDATA_8(scuba_vlo),
    .FMWDATA_7(scuba_vlo),
    .FMWDATA_6(scuba_vlo),
    .FMWDATA_5(scuba_vlo),
    .FMWDATA_4(scuba_vlo),
    .FMWDATA_3(scuba_vlo),
    .FMWDATA_2(scuba_vlo),
    .FMWDATA_1(scuba_vlo),
    .FMWDATA_0(scuba_vlo),
    .FMCLK(scuba_vlo), 
    .FMRESET_N(scuba_vlo), 
    .FMWRN(scuba_vlo), 
    .FMBURST(scuba_vlo), 
    .FMRDY(scuba_vlo), 
    .FMSIZE_1(scuba_vlo), 
    .FMSIZE_0(scuba_vlo), 
    .FMLOCK(scuba_vlo), 
    .FMIRQ(scuba_vlo), 
    .FMRDATA_35(),
    .FMRDATA_34(),
    .FMRDATA_33(),
    .FMRDATA_32(),
    .FMRDATA_31(),
    .FMRDATA_30(),
    .FMRDATA_29(),
    .FMRDATA_28(),
    .FMRDATA_27(),
    .FMRDATA_26(),
    .FMRDATA_25(),
    .FMRDATA_24(),
    .FMRDATA_23(),
    .FMRDATA_22(),
    .FMRDATA_21(),
    .FMRDATA_20(),
    .FMRDATA_19(),
    .FMRDATA_18(),
    .FMRDATA_17(),
    .FMRDATA_16(),
    .FMRDATA_15(),
    .FMRDATA_14(),
    .FMRDATA_13(),
    .FMRDATA_12(),
    .FMRDATA_11(),
    .FMRDATA_10(),
    .FMRDATA_9(),
    .FMRDATA_8(),
    .FMRDATA_7(),
    .FMRDATA_6(),
    .FMRDATA_5(),
    .FMRDATA_4(),
    .FMRDATA_3(),
    .FMRDATA_2(),
    .FMRDATA_1(),
    .FMRDATA_0(),
    .FMACK(), 
    .FMRETRY(), 
    .FMERR(), 
#endif
#if _enable_usi == 1
    .FSRDATA_35(usi_rdata[35]),
    .FSRDATA_34(usi_rdata[34]),
    .FSRDATA_33(usi_rdata[33]),
    .FSRDATA_32(usi_rdata[32]),
    .FSRDATA_31(usi_rdata[31]),
    .FSRDATA_30(usi_rdata[30]),
    .FSRDATA_29(usi_rdata[29]),
    .FSRDATA_28(usi_rdata[28]),
    .FSRDATA_27(usi_rdata[27]),
    .FSRDATA_26(usi_rdata[26]),
    .FSRDATA_25(usi_rdata[25]),
    .FSRDATA_24(usi_rdata[24]),
    .FSRDATA_23(usi_rdata[23]),
    .FSRDATA_22(usi_rdata[22]),
    .FSRDATA_21(usi_rdata[21]),
    .FSRDATA_20(usi_rdata[20]),
    .FSRDATA_19(usi_rdata[19]),
    .FSRDATA_18(usi_rdata[18]),
    .FSRDATA_17(usi_rdata[17]),
    .FSRDATA_16(usi_rdata[16]),
    .FSRDATA_15(usi_rdata[15]),
    .FSRDATA_14(usi_rdata[14]),
    .FSRDATA_13(usi_rdata[13]),
    .FSRDATA_12(usi_rdata[12]),
    .FSRDATA_11(usi_rdata[11]),
    .FSRDATA_10(usi_rdata[10]),
    .FSRDATA_9(usi_rdata[9]),
    .FSRDATA_8(usi_rdata[8]),
    .FSRDATA_7(usi_rdata[7]),
    .FSRDATA_6(usi_rdata[6]),
    .FSRDATA_5(usi_rdata[5]),
    .FSRDATA_4(usi_rdata[4]),
    .FSRDATA_3(usi_rdata[3]),
    .FSRDATA_2(usi_rdata[2]),
    .FSRDATA_1(usi_rdata[1]),
    .FSRDATA_0(usi_rdata[0]),
    .FSCLK(usi_clk), 
    .FSRESET_N(usi_rst_n), 
    .FSACK(usi_ack), 
    .FSRETRY(usi_retry), 
    .FSERR(usi_err), 
    .FSIRQ(usi_irq), 
    .FSWDATA_35(usi_wdata[35]),
    .FSWDATA_34(usi_wdata[34]),
    .FSWDATA_33(usi_wdata[33]),
    .FSWDATA_32(usi_wdata[32]),
    .FSWDATA_31(usi_wdata[31]),
    .FSWDATA_30(usi_wdata[30]),
    .FSWDATA_29(usi_wdata[29]),
    .FSWDATA_28(usi_wdata[28]),
    .FSWDATA_27(usi_wdata[27]),
    .FSWDATA_26(usi_wdata[26]),
    .FSWDATA_25(usi_wdata[25]),
    .FSWDATA_24(usi_wdata[24]),
    .FSWDATA_23(usi_wdata[23]),
    .FSWDATA_22(usi_wdata[22]),
    .FSWDATA_21(usi_wdata[21]),
    .FSWDATA_20(usi_wdata[20]),
    .FSWDATA_19(usi_wdata[19]),
    .FSWDATA_18(usi_wdata[18]),
    .FSWDATA_17(usi_wdata[17]),
    .FSWDATA_16(usi_wdata[16]),
    .FSWDATA_15(usi_wdata[15]),
    .FSWDATA_14(usi_wdata[14]),
    .FSWDATA_13(usi_wdata[13]),
    .FSWDATA_12(usi_wdata[12]),
    .FSWDATA_11(usi_wdata[11]),
    .FSWDATA_10(usi_wdata[10]),
    .FSWDATA_9(usi_wdata[9]),
    .FSWDATA_8(usi_wdata[8]),
    .FSWDATA_7(usi_wdata[7]),
    .FSWDATA_6(usi_wdata[6]),
    .FSWDATA_5(usi_wdata[5]),
    .FSWDATA_4(usi_wdata[4]),
    .FSWDATA_3(usi_wdata[3]),
    .FSWDATA_2(usi_wdata[2]),
    .FSWDATA_1(usi_wdata[1]),
    .FSWDATA_0(usi_wdata[0]),
    .FSADDR_17(usi_addr[17]),
    .FSADDR_16(usi_addr[16]),
    .FSADDR_15(usi_addr[15]),
    .FSADDR_14(usi_addr[14]),
    .FSADDR_13(usi_addr[13]),
    .FSADDR_12(usi_addr[12]),
    .FSADDR_11(usi_addr[11]),
    .FSADDR_10(usi_addr[10]),
    .FSADDR_9(usi_addr[9]),
    .FSADDR_8(usi_addr[8]),
    .FSADDR_7(usi_addr[7]),
    .FSADDR_6(usi_addr[6]),
    .FSADDR_5(usi_addr[5]),
    .FSADDR_4(usi_addr[4]),
    .FSADDR_3(usi_addr[3]),
    .FSADDR_2(usi_addr[2]),
    .FSADDR_1(usi_addr[1]),
    .FSADDR_0(usi_addr[0]),
    .FSRDY(usi_rdy), 
    .FSWRN(usi_wr_n), 
    .FSSIZE_1(usi_size[1]), 
    .FSSIZE_0(usi_size[0]), 
#elif _enable_usi == 0
    .FSRDATA_35(scuba_vlo), 
    .FSRDATA_34(scuba_vlo), 
    .FSRDATA_33(scuba_vlo), 
    .FSRDATA_32(scuba_vlo), 
    .FSRDATA_31(scuba_vlo), 
    .FSRDATA_30(scuba_vlo), 
    .FSRDATA_29(scuba_vlo), 
    .FSRDATA_28(scuba_vlo), 
    .FSRDATA_27(scuba_vlo), 
    .FSRDATA_26(scuba_vlo), 
    .FSRDATA_25(scuba_vlo),
    .FSRDATA_24(scuba_vlo),
    .FSRDATA_23(scuba_vlo),
    .FSRDATA_22(scuba_vlo),
    .FSRDATA_21(scuba_vlo),
    .FSRDATA_20(scuba_vlo),
    .FSRDATA_19(scuba_vlo),
    .FSRDATA_18(scuba_vlo),
    .FSRDATA_17(scuba_vlo),
    .FSRDATA_16(scuba_vlo),
    .FSRDATA_15(scuba_vlo),
    .FSRDATA_14(scuba_vlo),
    .FSRDATA_13(scuba_vlo),
    .FSRDATA_12(scuba_vlo),
    .FSRDATA_11(scuba_vlo),
    .FSRDATA_10(scuba_vlo),
    .FSRDATA_9(scuba_vlo),
    .FSRDATA_8(scuba_vlo),
    .FSRDATA_7(scuba_vlo),
    .FSRDATA_6(scuba_vlo),
    .FSRDATA_5(scuba_vlo),
    .FSRDATA_4(scuba_vlo),
    .FSRDATA_3(scuba_vlo),
    .FSRDATA_2(scuba_vlo),
    .FSRDATA_1(scuba_vlo),
    .FSRDATA_0(scuba_vlo),
    .FSCLK(scuba_vlo),
    .FSRESET_N(scuba_vlo),
    .FSACK(scuba_vlo),
    .FSRETRY(scuba_vlo),
    .FSERR(scuba_vlo),
    .FSIRQ(scuba_vlo),
    .FSWDATA_35(),
    .FSWDATA_34(),
    .FSWDATA_33(),
    .FSWDATA_32(),
    .FSWDATA_31(),
    .FSWDATA_30(),
    .FSWDATA_29(),
    .FSWDATA_28(),
    .FSWDATA_27(),
    .FSWDATA_26(),
    .FSWDATA_25(),
    .FSWDATA_24(),
    .FSWDATA_23(),
    .FSWDATA_22(),
    .FSWDATA_21(),
    .FSWDATA_20(),
    .FSWDATA_19(),
    .FSWDATA_18(),
    .FSWDATA_17(),
    .FSWDATA_16(),
    .FSWDATA_15(),
    .FSWDATA_14(),
    .FSWDATA_13(),
    .FSWDATA_12(),
    .FSWDATA_11(),
    .FSWDATA_10(),
    .FSWDATA_9(),
    .FSWDATA_8(),
    .FSWDATA_7(),
    .FSWDATA_6(),
    .FSWDATA_5(),
    .FSWDATA_4(),
    .FSWDATA_3(),
    .FSWDATA_2(),
    .FSWDATA_1(),
    .FSWDATA_0(),
    .FSADDR_17(),
    .FSADDR_16(),
    .FSADDR_15(),
    .FSADDR_14(),
    .FSADDR_13(),
    .FSADDR_12(),
    .FSADDR_11(),
    .FSADDR_10(),
    .FSADDR_9(),
    .FSADDR_8(),
    .FSADDR_7(),
    .FSADDR_6(),
    .FSADDR_5(),
    .FSADDR_4(),
    .FSADDR_3(),
    .FSADDR_2(),
    .FSADDR_1(),
    .FSADDR_0(),
    .FSRDY(),
    .FSWRN(),
    .FSSIZE_1(),
    .FSSIZE_0(),
#endif
    .HADDR_LASBM_17(scuba_vlo),
    .HADDR_LASBM_16(scuba_vlo),
    .HADDR_LASBM_15(scuba_vlo),
    .HADDR_LASBM_14(scuba_vlo),
    .HADDR_LASBM_13(scuba_vlo),
    .HADDR_LASBM_12(scuba_vlo),
    .HADDR_LASBM_11(scuba_vlo),
    .HADDR_LASBM_10(scuba_vlo),
    .HADDR_LASBM_9(scuba_vlo),
    .HADDR_LASBM_8(scuba_vlo),
    .HADDR_LASBM_7(scuba_vlo),
    .HADDR_LASBM_6(scuba_vlo),
    .HADDR_LASBM_5(scuba_vlo),
    .HADDR_LASBM_4(scuba_vlo),
    .HADDR_LASBM_3(scuba_vlo),
    .HADDR_LASBM_2(scuba_vlo),
    .HADDR_LASBM_1(scuba_vlo),
    .HADDR_LASBM_0(scuba_vlo),
    .HSIZE_LASBM_1(scuba_vlo),
    .HSIZE_LASBM_0(scuba_vlo),
    .HTRANS_LASBM_1(scuba_vlo),
    .HTRANS_LASBM_0(scuba_vlo),
    .HWDATA_LASBM_35(scuba_vlo),
    .HWDATA_LASBM_34(scuba_vlo),
    .HWDATA_LASBM_33(scuba_vlo),
    .HWDATA_LASBM_32(scuba_vlo),
    .HWDATA_LASBM_31(scuba_vlo),
    .HWDATA_LASBM_30(scuba_vlo),
    .HWDATA_LASBM_29(scuba_vlo),
    .HWDATA_LASBM_28(scuba_vlo),
    .HWDATA_LASBM_27(scuba_vlo),
    .HWDATA_LASBM_26(scuba_vlo),
    .HWDATA_LASBM_25(scuba_vlo),
    .HWDATA_LASBM_24(scuba_vlo),
    .HWDATA_LASBM_23(scuba_vlo),
    .HWDATA_LASBM_22(scuba_vlo),
    .HWDATA_LASBM_21(scuba_vlo),
    .HWDATA_LASBM_20(scuba_vlo),
    .HWDATA_LASBM_19(scuba_vlo),
    .HWDATA_LASBM_18(scuba_vlo),
    .HWDATA_LASBM_17(scuba_vlo),
    .HWDATA_LASBM_16(scuba_vlo),
    .HWDATA_LASBM_15(scuba_vlo),
    .HWDATA_LASBM_14(scuba_vlo),
    .HWDATA_LASBM_13(scuba_vlo),
    .HWDATA_LASBM_12(scuba_vlo),
    .HWDATA_LASBM_11(scuba_vlo),
    .HWDATA_LASBM_10(scuba_vlo),
    .HWDATA_LASBM_9(scuba_vlo),
    .HWDATA_LASBM_8(scuba_vlo),
    .HWDATA_LASBM_7(scuba_vlo),
    .HWDATA_LASBM_6(scuba_vlo),
    .HWDATA_LASBM_5(scuba_vlo),
    .HWDATA_LASBM_4(scuba_vlo),
    .HWDATA_LASBM_3(scuba_vlo),
    .HWDATA_LASBM_2(scuba_vlo),
    .HWDATA_LASBM_1(scuba_vlo),
    .HWDATA_LASBM_0(scuba_vlo),
    .HBURST_LASBM(scuba_vlo),
    .HWRITE_LASBM(scuba_vlo),
    .LASB_CLK(scuba_vlo),
    .LASB_GSR(scuba_vlo),
    .LASB_IRQ_MASTER(scuba_vlo),
    .HRDATA_LASBM_35(),
    .HRDATA_LASBM_34(),
    .HRDATA_LASBM_33(),
    .HRDATA_LASBM_32(),
    .HRDATA_LASBM_31(),
    .HRDATA_LASBM_30(),
    .HRDATA_LASBM_29(),
    .HRDATA_LASBM_28(),
    .HRDATA_LASBM_27(),
    .HRDATA_LASBM_26(),
    .HRDATA_LASBM_25(),
    .HRDATA_LASBM_24(),
    .HRDATA_LASBM_23(),
    .HRDATA_LASBM_22(),
    .HRDATA_LASBM_21(),
    .HRDATA_LASBM_20(),
    .HRDATA_LASBM_19(),
    .HRDATA_LASBM_18(),
    .HRDATA_LASBM_17(),
    .HRDATA_LASBM_16(),
    .HRDATA_LASBM_15(),
    .HRDATA_LASBM_14(),
    .HRDATA_LASBM_13(),
    .HRDATA_LASBM_12(),
    .HRDATA_LASBM_11(),
    .HRDATA_LASBM_10(),
    .HRDATA_LASBM_9(),
    .HRDATA_LASBM_8(),
    .HRDATA_LASBM_7(),
    .HRDATA_LASBM_6(),
    .HRDATA_LASBM_5(),
    .HRDATA_LASBM_4(),
    .HRDATA_LASBM_3(),
    .HRDATA_LASBM_2(),
    .HRDATA_LASBM_1(),
    .HRDATA_LASBM_0(),
    .HRESP_LASBM_1(),
    .HRESP_LASBM_0(),
    .HCLK_LASB(),
    .HREADY_LASB(),
    .HRESET_N_LASB(),
    .LASB_DONE(),
    .LASB_GSR_N(),
    .LASB_IRQ_OUT(),
    .HADDR_RASBM_17(scuba_vlo),
    .HADDR_RASBM_16(scuba_vlo),
    .HADDR_RASBM_15(scuba_vlo),
    .HADDR_RASBM_14(scuba_vlo),
    .HADDR_RASBM_13(scuba_vlo),
    .HADDR_RASBM_12(scuba_vlo),
    .HADDR_RASBM_11(scuba_vlo),
    .HADDR_RASBM_10(scuba_vlo),
    .HADDR_RASBM_9(scuba_vlo),
    .HADDR_RASBM_8(scuba_vlo),
    .HADDR_RASBM_7(scuba_vlo),
    .HADDR_RASBM_6(scuba_vlo),
    .HADDR_RASBM_5(scuba_vlo),
    .HADDR_RASBM_4(scuba_vlo),
    .HADDR_RASBM_3(scuba_vlo),
    .HADDR_RASBM_2(scuba_vlo),
    .HADDR_RASBM_1(scuba_vlo),
    .HADDR_RASBM_0(scuba_vlo),
    .HSIZE_RASBM_1(scuba_vlo),
    .HSIZE_RASBM_0(scuba_vlo),
    .HTRANS_RASBM_1(scuba_vlo),
    .HTRANS_RASBM_0(scuba_vlo),
    .HWDATA_RASBM_35(scuba_vlo),
    .HWDATA_RASBM_34(scuba_vlo),
    .HWDATA_RASBM_33(scuba_vlo),
    .HWDATA_RASBM_32(scuba_vlo),
    .HWDATA_RASBM_31(scuba_vlo),
    .HWDATA_RASBM_30(scuba_vlo),
    .HWDATA_RASBM_29(scuba_vlo),
    .HWDATA_RASBM_28(scuba_vlo),
    .HWDATA_RASBM_27(scuba_vlo),
    .HWDATA_RASBM_26(scuba_vlo),
    .HWDATA_RASBM_25(scuba_vlo),
    .HWDATA_RASBM_24(scuba_vlo),
    .HWDATA_RASBM_23(scuba_vlo),
    .HWDATA_RASBM_22(scuba_vlo),
    .HWDATA_RASBM_21(scuba_vlo),
    .HWDATA_RASBM_20(scuba_vlo),
    .HWDATA_RASBM_19(scuba_vlo),
    .HWDATA_RASBM_18(scuba_vlo),
    .HWDATA_RASBM_17(scuba_vlo),
    .HWDATA_RASBM_16(scuba_vlo),
    .HWDATA_RASBM_15(scuba_vlo),
    .HWDATA_RASBM_14(scuba_vlo),
    .HWDATA_RASBM_13(scuba_vlo),
    .HWDATA_RASBM_12(scuba_vlo),
    .HWDATA_RASBM_11(scuba_vlo),
    .HWDATA_RASBM_10(scuba_vlo),
    .HWDATA_RASBM_9(scuba_vlo),
    .HWDATA_RASBM_8(scuba_vlo),
    .HWDATA_RASBM_7(scuba_vlo),
    .HWDATA_RASBM_6(scuba_vlo),
    .HWDATA_RASBM_5(scuba_vlo),
    .HWDATA_RASBM_4(scuba_vlo),
    .HWDATA_RASBM_3(scuba_vlo),
    .HWDATA_RASBM_2(scuba_vlo),
    .HWDATA_RASBM_1(scuba_vlo),
    .HWDATA_RASBM_0(scuba_vlo),
    .HBURST_RASBM(scuba_vlo),
    .HWRITE_RASBM(scuba_vlo),
    .RASB_CLK(scuba_vlo),
    .RASB_GSR(scuba_vlo),
    .RASB_IRQ_MASTER(scuba_vlo),
    .HRDATA_RASBM_35(),
    .HRDATA_RASBM_34(),
    .HRDATA_RASBM_33(),
    .HRDATA_RASBM_32(),
    .HRDATA_RASBM_31(),
    .HRDATA_RASBM_30(),
    .HRDATA_RASBM_29(),
    .HRDATA_RASBM_28(),
    .HRDATA_RASBM_27(),
    .HRDATA_RASBM_26(),
    .HRDATA_RASBM_25(),
    .HRDATA_RASBM_24(),
    .HRDATA_RASBM_23(),
    .HRDATA_RASBM_22(),
    .HRDATA_RASBM_21(),
    .HRDATA_RASBM_20(),
    .HRDATA_RASBM_19(),
    .HRDATA_RASBM_18(),
    .HRDATA_RASBM_17(),
    .HRDATA_RASBM_16(),
    .HRDATA_RASBM_15(),
    .HRDATA_RASBM_14(),
    .HRDATA_RASBM_13(),
    .HRDATA_RASBM_12(),
    .HRDATA_RASBM_11(),
    .HRDATA_RASBM_10(),
    .HRDATA_RASBM_9(),
    .HRDATA_RASBM_8(),
    .HRDATA_RASBM_7(),
    .HRDATA_RASBM_6(),
    .HRDATA_RASBM_5(),
    .HRDATA_RASBM_4(),
    .HRDATA_RASBM_3(),
    .HRDATA_RASBM_2(),
    .HRDATA_RASBM_1(),
    .HRDATA_RASBM_0(),
    .HRESP_RASBM_1(),
    .HRESP_RASBM_0(),
    .HCLK_RASB(),
    .HREADY_RASB(),
    .HRESET_N_RASB(),
    .RASB_DONE(),
    .RASB_GSR_N(),
    .RASB_IRQ_OUT(),
#if _dma_interface == 1
#if _enable_mpi == 1
#if _bus_width == 32
    .DMA_RD_DATA_31(dfa_rd_data[31]),
    .DMA_RD_DATA_30(dfa_rd_data[30]),
    .DMA_RD_DATA_29(dfa_rd_data[29]),
    .DMA_RD_DATA_28(dfa_rd_data[28]),
    .DMA_RD_DATA_27(dfa_rd_data[27]),
    .DMA_RD_DATA_26(dfa_rd_data[26]),
    .DMA_RD_DATA_25(dfa_rd_data[25]),
    .DMA_RD_DATA_24(dfa_rd_data[24]),
    .DMA_RD_DATA_23(dfa_rd_data[23]),
    .DMA_RD_DATA_22(dfa_rd_data[22]),
    .DMA_RD_DATA_21(dfa_rd_data[21]),
    .DMA_RD_DATA_20(dfa_rd_data[20]),
    .DMA_RD_DATA_19(dfa_rd_data[19]),
    .DMA_RD_DATA_18(dfa_rd_data[18]),
    .DMA_RD_DATA_17(dfa_rd_data[17]),
    .DMA_RD_DATA_16(dfa_rd_data[16]),
    .DMA_RD_DATA_15(dfa_rd_data[15]),
    .DMA_RD_DATA_14(dfa_rd_data[14]),
    .DMA_RD_DATA_13(dfa_rd_data[13]),
    .DMA_RD_DATA_12(dfa_rd_data[12]),
    .DMA_RD_DATA_11(dfa_rd_data[11]),
    .DMA_RD_DATA_10(dfa_rd_data[10]),
    .DMA_RD_DATA_9(dfa_rd_data[9]),
    .DMA_RD_DATA_8(dfa_rd_data[8]),
    .DMA_RD_DATA_7(dfa_rd_data[7]),
    .DMA_RD_DATA_6(dfa_rd_data[6]),
    .DMA_RD_DATA_5(dfa_rd_data[5]),
    .DMA_RD_DATA_4(dfa_rd_data[4]),
    .DMA_RD_DATA_3(dfa_rd_data[3]),
    .DMA_RD_DATA_2(dfa_rd_data[2]),
    .DMA_RD_DATA_1(dfa_rd_data[1]),
    .DMA_RD_DATA_0(dfa_rd_data[0]),
    .DMA_RD_PARITY_3(dfa_rd_parity[3]),
    .DMA_RD_PARITY_2(dfa_rd_parity[2]),
    .DMA_RD_PARITY_1(dfa_rd_parity[1]),
    .DMA_RD_PARITY_0(dfa_rd_parity[0]),
#elif _bus_width == 16
    .DMA_RD_DATA_31(scuba_vlo),
    .DMA_RD_DATA_30(scuba_vlo),
    .DMA_RD_DATA_29(scuba_vlo),
    .DMA_RD_DATA_28(scuba_vlo),
    .DMA_RD_DATA_27(scuba_vlo),
    .DMA_RD_DATA_26(scuba_vlo),
    .DMA_RD_DATA_25(scuba_vlo),
    .DMA_RD_DATA_24(scuba_vlo),
    .DMA_RD_DATA_23(scuba_vlo),
    .DMA_RD_DATA_22(scuba_vlo),
    .DMA_RD_DATA_21(scuba_vlo),
    .DMA_RD_DATA_20(scuba_vlo),
    .DMA_RD_DATA_19(scuba_vlo),
    .DMA_RD_DATA_18(scuba_vlo),
    .DMA_RD_DATA_17(scuba_vlo),
    .DMA_RD_DATA_16(scuba_vlo),
    .DMA_RD_DATA_15(dfa_rd_data[15]),
    .DMA_RD_DATA_14(dfa_rd_data[14]),
    .DMA_RD_DATA_13(dfa_rd_data[13]),
    .DMA_RD_DATA_12(dfa_rd_data[12]),
    .DMA_RD_DATA_11(dfa_rd_data[11]),
    .DMA_RD_DATA_10(dfa_rd_data[10]),
    .DMA_RD_DATA_9(dfa_rd_data[9]),
    .DMA_RD_DATA_8(dfa_rd_data[8]),
    .DMA_RD_DATA_7(dfa_rd_data[7]),
    .DMA_RD_DATA_6(dfa_rd_data[6]),
    .DMA_RD_DATA_5(dfa_rd_data[5]),
    .DMA_RD_DATA_4(dfa_rd_data[4]),
    .DMA_RD_DATA_3(dfa_rd_data[3]),
    .DMA_RD_DATA_2(dfa_rd_data[2]),
    .DMA_RD_DATA_1(dfa_rd_data[1]),
    .DMA_RD_DATA_0(dfa_rd_data[0]),
    .DMA_RD_PARITY_3(scuba_vlo),
    .DMA_RD_PARITY_2(scuba_vlo),
    .DMA_RD_PARITY_1(dfa_rd_parity[1]),
    .DMA_RD_PARITY_0(dfa_rd_parity[0]),
#elif _bus_width == 8
    .DMA_RD_DATA_31(scuba_vlo),
    .DMA_RD_DATA_30(scuba_vlo),
    .DMA_RD_DATA_29(scuba_vlo),
    .DMA_RD_DATA_28(scuba_vlo),
    .DMA_RD_DATA_27(scuba_vlo),
    .DMA_RD_DATA_26(scuba_vlo),
    .DMA_RD_DATA_25(scuba_vlo),
    .DMA_RD_DATA_24(scuba_vlo),
    .DMA_RD_DATA_23(scuba_vlo),
    .DMA_RD_DATA_22(scuba_vlo),
    .DMA_RD_DATA_21(scuba_vlo),
    .DMA_RD_DATA_20(scuba_vlo),
    .DMA_RD_DATA_19(scuba_vlo),
    .DMA_RD_DATA_18(scuba_vlo),
    .DMA_RD_DATA_17(scuba_vlo),
    .DMA_RD_DATA_16(scuba_vlo),
    .DMA_RD_DATA_15(scuba_vlo),
    .DMA_RD_DATA_14(scuba_vlo),
    .DMA_RD_DATA_13(scuba_vlo),
    .DMA_RD_DATA_12(scuba_vlo),
    .DMA_RD_DATA_11(scuba_vlo),
    .DMA_RD_DATA_10(scuba_vlo),
    .DMA_RD_DATA_9(scuba_vlo),
    .DMA_RD_DATA_8(scuba_vlo),
    .DMA_RD_DATA_7(dfa_rd_data[7]),
    .DMA_RD_DATA_6(dfa_rd_data[6]),
    .DMA_RD_DATA_5(dfa_rd_data[5]),
    .DMA_RD_DATA_4(dfa_rd_data[4]),
    .DMA_RD_DATA_3(dfa_rd_data[3]),
    .DMA_RD_DATA_2(dfa_rd_data[2]),
    .DMA_RD_DATA_1(dfa_rd_data[1]),
    .DMA_RD_DATA_0(dfa_rd_data[0]),
    .DMA_RD_PARITY_3(scuba_vlo),
    .DMA_RD_PARITY_2(scuba_vlo),
    .DMA_RD_PARITY_1(scuba_vlo),
    .DMA_RD_PARITY_0(dfa_rd_parity),
#endif
    .DMA_RETRY(dfa_retry),
    .DMA_TA(dfa_ta),
    .DMA_TEA(dfa_tea),
    .DMA_TRI_CTL(dfa_tri_ctl),
    .DMA_TRI_DATA(dfa_tri_data),
#elif _enable_mpi == 0
    .DMA_RD_DATA_31(scuba_vlo),
    .DMA_RD_DATA_30(scuba_vlo),
    .DMA_RD_DATA_29(scuba_vlo),
    .DMA_RD_DATA_28(scuba_vlo),
    .DMA_RD_DATA_27(scuba_vlo),
    .DMA_RD_DATA_26(scuba_vlo),
    .DMA_RD_DATA_25(scuba_vlo),
    .DMA_RD_DATA_24(scuba_vlo),
    .DMA_RD_DATA_23(scuba_vlo),
    .DMA_RD_DATA_22(scuba_vlo),
    .DMA_RD_DATA_21(scuba_vlo),
    .DMA_RD_DATA_20(scuba_vlo),
    .DMA_RD_DATA_19(scuba_vlo),
    .DMA_RD_DATA_18(scuba_vlo),
    .DMA_RD_DATA_17(scuba_vlo),
    .DMA_RD_DATA_16(scuba_vlo),
    .DMA_RD_DATA_15(scuba_vlo),
    .DMA_RD_DATA_14(scuba_vlo),
    .DMA_RD_DATA_13(scuba_vlo),
    .DMA_RD_DATA_12(scuba_vlo),
    .DMA_RD_DATA_11(scuba_vlo),
    .DMA_RD_DATA_10(scuba_vlo),
    .DMA_RD_DATA_9(scuba_vlo),
    .DMA_RD_DATA_8(scuba_vlo),
    .DMA_RD_DATA_7(scuba_vlo),
    .DMA_RD_DATA_6(scuba_vlo),
    .DMA_RD_DATA_5(scuba_vlo),
    .DMA_RD_DATA_4(scuba_vlo),
    .DMA_RD_DATA_3(scuba_vlo),
    .DMA_RD_DATA_2(scuba_vlo),
    .DMA_RD_DATA_1(scuba_vlo),
    .DMA_RD_DATA_0(scuba_vlo),
    .DMA_RD_PARITY_3(scuba_vlo),
    .DMA_RD_PARITY_2(scuba_vlo),
    .DMA_RD_PARITY_1(scuba_vlo),
    .DMA_RD_PARITY_0(scuba_vlo),
    .DMA_RETRY(scuba_vlo),
    .DMA_TA(scuba_vlo),
    .DMA_TEA(scuba_vlo),
    .DMA_TRI_CTL(scuba_vlo),
    .DMA_TRI_DATA(scuba_vlo),
#endif
#elif _dma_interface == 0
    .DMA_RD_DATA_31(scuba_vlo),
    .DMA_RD_DATA_30(scuba_vlo),
    .DMA_RD_DATA_29(scuba_vlo),
    .DMA_RD_DATA_28(scuba_vlo),
    .DMA_RD_DATA_27(scuba_vlo),
    .DMA_RD_DATA_26(scuba_vlo),
    .DMA_RD_DATA_25(scuba_vlo),
    .DMA_RD_DATA_24(scuba_vlo),
    .DMA_RD_DATA_23(scuba_vlo),
    .DMA_RD_DATA_22(scuba_vlo),
    .DMA_RD_DATA_21(scuba_vlo),
    .DMA_RD_DATA_20(scuba_vlo),
    .DMA_RD_DATA_19(scuba_vlo),
    .DMA_RD_DATA_18(scuba_vlo),
    .DMA_RD_DATA_17(scuba_vlo),
    .DMA_RD_DATA_16(scuba_vlo),
    .DMA_RD_DATA_15(scuba_vlo),
    .DMA_RD_DATA_14(scuba_vlo),
    .DMA_RD_DATA_13(scuba_vlo),
    .DMA_RD_DATA_12(scuba_vlo),
    .DMA_RD_DATA_11(scuba_vlo),
    .DMA_RD_DATA_10(scuba_vlo),
    .DMA_RD_DATA_9(scuba_vlo),
    .DMA_RD_DATA_8(scuba_vlo),
    .DMA_RD_DATA_7(scuba_vlo),
    .DMA_RD_DATA_6(scuba_vlo),
    .DMA_RD_DATA_5(scuba_vlo),
    .DMA_RD_DATA_4(scuba_vlo),
    .DMA_RD_DATA_3(scuba_vlo),
    .DMA_RD_DATA_2(scuba_vlo),
    .DMA_RD_DATA_1(scuba_vlo),
    .DMA_RD_DATA_0(scuba_vlo),
    .DMA_RD_PARITY_3(scuba_vlo),
    .DMA_RD_PARITY_2(scuba_vlo),
    .DMA_RD_PARITY_1(scuba_vlo),
    .DMA_RD_PARITY_0(scuba_vlo),
    .DMA_RETRY(scuba_vlo),
    .DMA_TA(scuba_vlo),
    .DMA_TEA(scuba_vlo),
    .DMA_TRI_CTL(scuba_vlo),
    .DMA_TRI_DATA(scuba_vlo),
#endif
#if _enable_multi_align == 1
    .EXT_CLK_P1_IN(mca_clk_p1_in),
    .EXT_CLK_P2_IN(mca_clk_p2_in),
    .EXT_DONE_IN(mca_done_in),
    .EXT_CLK_P1_OUT(mca_clk_p1_out),
    .EXT_CLK_P2_OUT(mca_clk_p2_out),
    .EXT_DONE_OUT(mca_done_out),
#elif _enable_multi_align == 0
    .EXT_CLK_P1_IN(scuba_vlo),
    .EXT_CLK_P2_IN(scuba_vlo),
    .EXT_DONE_IN(scuba_vlo),
    .EXT_CLK_P1_OUT(),
    .EXT_CLK_P2_OUT(),
    .EXT_DONE_OUT(),
#endif
#if _enable_lpcs_0 == 1
    .LPCS_C_0(pcs360_out[0]),
    .LPCS_C_1(pcs360_out[1]),
    .LPCS_C_2(pcs360_out[2]),
    .LPCS_C_3(pcs360_out[3]),
    .LPCS_Q_0(pcs360_out[4]),
    .LPCS_QUAD_ID0_0(pcs360_out[5]),
    .LPCS_QUAD_ID0_1(pcs360_out[6]),
#elif _enable_lpcs_0 == 0
    .LPCS_C_0(),
    .LPCS_C_1(),
    .LPCS_C_2(),
    .LPCS_C_3(),
    .LPCS_Q_0(),
    .LPCS_QUAD_ID0_0(),
    .LPCS_QUAD_ID0_1(),
#endif
#if _enable_lpcs_1 == 1
    .LPCS_C_4(pcs361_out[0]),
    .LPCS_C_5(pcs361_out[1]),
    .LPCS_C_6(pcs361_out[2]),
    .LPCS_C_7(pcs361_out[3]),
    .LPCS_Q_1(pcs361_out[4]),
    .LPCS_QUAD_ID1_0(pcs361_out[5]),
    .LPCS_QUAD_ID1_1(pcs361_out[6]),
#elif _enable_lpcs_1 == 0
    .LPCS_C_4(),
    .LPCS_C_5(),
    .LPCS_C_6(),
    .LPCS_C_7(),
    .LPCS_Q_1(),
    .LPCS_QUAD_ID1_0(),
    .LPCS_QUAD_ID1_1(),
#endif
#if _enable_lpcs_2 == 1
    .LPCS_C_8(pcs362_out[0]),
    .LPCS_C_9(pcs362_out[1]),
    .LPCS_C_10(pcs362_out[2]),
    .LPCS_C_11(pcs362_out[3]),
    .LPCS_Q_2(pcs362_out[4]),
    .LPCS_QUAD_ID2_0(pcs362_out[5]),
    .LPCS_QUAD_ID2_1(pcs362_out[6]),
#elif _enable_lpcs_2 == 0
    .LPCS_C_8(),
    .LPCS_C_9(),
    .LPCS_C_10(),
    .LPCS_C_11(),
    .LPCS_Q_2(),
    .LPCS_QUAD_ID2_0(),
    .LPCS_QUAD_ID2_1(),
#endif
#if _enable_lpcs_3 == 1
    .LPCS_C_12(pcs363_out[0]),
    .LPCS_C_13(pcs363_out[1]),
    .LPCS_C_14(pcs363_out[2]),
    .LPCS_C_15(pcs363_out[3]),
    .LPCS_Q_3(pcs363_out[4]),
    .LPCS_QUAD_ID3_0(pcs363_out[5]),
    .LPCS_QUAD_ID3_1(pcs363_out[6]),
#elif _enable_lpcs_3 == 0
    .LPCS_C_12(),
    .LPCS_C_13(),
    .LPCS_C_14(),
    .LPCS_C_15(),
    .LPCS_Q_3(),
    .LPCS_QUAD_ID3_0(),
    .LPCS_QUAD_ID3_1(),
#endif
#if _enable_rpcs_0 == 1
    .RPCS_C_0(pcs3e0_out[0]),
    .RPCS_C_1(pcs3e0_out[1]),
    .RPCS_C_2(pcs3e0_out[2]),
    .RPCS_C_3(pcs3e0_out[3]),
    .RPCS_Q_0(pcs3e0_out[4]),
    .RPCS_QUAD_ID0_0(pcs3e0_out[5]),
    .RPCS_QUAD_ID0_1(pcs3e0_out[6]),
#elif _enable_rpcs_0 == 0
    .RPCS_C_0(),
    .RPCS_C_1(),
    .RPCS_C_2(),
    .RPCS_C_3(),
    .RPCS_Q_0(),
    .RPCS_QUAD_ID0_0(),
    .RPCS_QUAD_ID0_1(),
#endif
#if _enable_rpcs_1 == 1
    .RPCS_C_4(pcs3e1_out[0]),
    .RPCS_C_5(pcs3e1_out[1]),
    .RPCS_C_6(pcs3e1_out[2]),
    .RPCS_C_7(pcs3e1_out[3]),
    .RPCS_Q_1(pcs3e1_out[4]),
    .RPCS_QUAD_ID1_0(pcs3e1_out[5]),
    .RPCS_QUAD_ID1_1(pcs3e1_out[6]),
#elif _enable_rpcs_1 == 0
    .RPCS_C_4(),
    .RPCS_C_5(),
    .RPCS_C_6(),
    .RPCS_C_7(),
    .RPCS_Q_1(),
    .RPCS_QUAD_ID1_0(),
    .RPCS_QUAD_ID1_1(),
#endif
#if _enable_rpcs_2 == 1
    .RPCS_C_8(pcs3e2_out[0]),
    .RPCS_C_9(pcs3e2_out[1]),
    .RPCS_C_10(pcs3e2_out[2]),
    .RPCS_C_11(pcs3e2_out[3]),
    .RPCS_Q_2(pcs3e2_out[4]),
    .RPCS_QUAD_ID2_0(pcs3e2_out[5]),
    .RPCS_QUAD_ID2_1(pcs3e2_out[6]),
#elif _enable_rpcs_2 == 0
    .RPCS_C_8(),
    .RPCS_C_9(),
    .RPCS_C_10(),
    .RPCS_C_11(),
    .RPCS_Q_2(),
    .RPCS_QUAD_ID2_0(),
    .RPCS_QUAD_ID2_1(),
#endif
#if _enable_rpcs_3 == 1
    .RPCS_C_12(pcs3e3_out[0]),
    .RPCS_C_13(pcs3e3_out[1]),
    .RPCS_C_14(pcs3e3_out[2]),
    .RPCS_C_15(pcs3e3_out[3]),
    .RPCS_Q_3(pcs3e3_out[4]),
    .RPCS_QUAD_ID3_0(pcs3e3_out[5]),
    .RPCS_QUAD_ID3_1(pcs3e3_out[6]),
#elif _enable_rpcs_3 == 0
    .RPCS_C_12(),
    .RPCS_C_13(),
    .RPCS_C_14(),
    .RPCS_C_15(),
    .RPCS_Q_3(),
    .RPCS_QUAD_ID3_0(),
    .RPCS_QUAD_ID3_1(),
#endif
    .LPCS_ADDR_0(to_lpcsa[0]),
    .LPCS_ADDR_1(to_lpcsa[1]),
    .LPCS_ADDR_2(to_lpcsa[2]),
    .LPCS_ADDR_3(to_lpcsa[3]),
    .LPCS_ADDR_4(to_lpcsa[4]),
    .LPCS_ADDR_5(to_lpcsa[5]),
    .LPCS_ADDR_6(to_lpcsa[6]),
    .LPCS_ADDR_7(to_lpcsa[7]),
    .LPCS_WDATA_0(to_lpcsa[8]),
    .LPCS_WDATA_1(to_lpcsa[9]),
    .LPCS_WDATA_2(to_lpcsa[10]),
    .LPCS_WDATA_3(to_lpcsa[11]),
    .LPCS_WDATA_4(to_lpcsa[12]),
    .LPCS_WDATA_5(to_lpcsa[13]),
    .LPCS_WDATA_6(to_lpcsa[14]),
    .LPCS_WDATA_7(to_lpcsa[15]),
    .LPCS_RD(to_lpcsa[16]),
    .LPCS_WSTB(to_lpcsa[17]),
    .RPCS_ADDR_0(to_rpcsa[0]),
    .RPCS_ADDR_1(to_rpcsa[1]),
    .RPCS_ADDR_2(to_rpcsa[2]),
    .RPCS_ADDR_3(to_rpcsa[3]),
    .RPCS_ADDR_4(to_rpcsa[4]),
    .RPCS_ADDR_5(to_rpcsa[5]),
    .RPCS_ADDR_6(to_rpcsa[6]),
    .RPCS_ADDR_7(to_rpcsa[7]),
    .RPCS_WDATA_0(to_rpcsa[8]),
    .RPCS_WDATA_1(to_rpcsa[9]),
    .RPCS_WDATA_2(to_rpcsa[10]),
    .RPCS_WDATA_3(to_rpcsa[11]),
    .RPCS_WDATA_4(to_rpcsa[12]),
    .RPCS_WDATA_5(to_rpcsa[13]),
    .RPCS_WDATA_6(to_rpcsa[14]),
    .RPCS_WDATA_7(to_rpcsa[15]),
    .RPCS_RD(to_rpcsa[16]),
    .RPCS_WSTB(to_rpcsa[17]),
    .GRP_CLK_P1_L_0(to_lpcsa_grp[0]),
    .GRP_CLK_P1_L_1(to_lpcsa_grp[1]),
    .GRP_CLK_P1_L_2(to_lpcsa_grp[2]),
    .GRP_CLK_P1_L_3(to_lpcsa_grp[3]),
    .GRP_CLK_P2_L_0(to_lpcsa_grp[4]),
    .GRP_CLK_P2_L_1(to_lpcsa_grp[5]),
    .GRP_CLK_P2_L_2(to_lpcsa_grp[6]),
    .GRP_CLK_P2_L_3(to_lpcsa_grp[7]),
    .GRP_START_L_0(to_lpcsa_grp[8]),
    .GRP_START_L_1(to_lpcsa_grp[9]),
    .GRP_START_L_2(to_lpcsa_grp[10]),
    .GRP_START_L_3(to_lpcsa_grp[11]),
    .GRP_DONE_L_0(to_lpcsa_grp[12]),
    .GRP_DONE_L_1(to_lpcsa_grp[13]),
    .GRP_DONE_L_2(to_lpcsa_grp[14]),
    .GRP_DONE_L_3(to_lpcsa_grp[15]),
    .GRP_DESKEW_ERROR_L_0(to_lpcsa_grp[16]),
    .GRP_DESKEW_ERROR_L_1(to_lpcsa_grp[17]),
    .GRP_DESKEW_ERROR_L_2(to_lpcsa_grp[18]),
    .GRP_DESKEW_ERROR_L_3(to_lpcsa_grp[19]),
    .GRP_CLK_P1_R_0(to_rpcsa_grp[0]),
    .GRP_CLK_P1_R_1(to_rpcsa_grp[1]),
    .GRP_CLK_P1_R_2(to_rpcsa_grp[2]),
    .GRP_CLK_P1_R_3(to_rpcsa_grp[3]),
    .GRP_CLK_P2_R_0(to_rpcsa_grp[4]),
    .GRP_CLK_P2_R_1(to_rpcsa_grp[5]),
    .GRP_CLK_P2_R_2(to_rpcsa_grp[6]),
    .GRP_CLK_P2_R_3(to_rpcsa_grp[7]),
    .GRP_START_R_0(to_rpcsa_grp[8]),
    .GRP_START_R_1(to_rpcsa_grp[9]),
    .GRP_START_R_2(to_rpcsa_grp[10]),
    .GRP_START_R_3(to_rpcsa_grp[11]),
    .GRP_DONE_R_0(to_rpcsa_grp[12]),
    .GRP_DONE_R_1(to_rpcsa_grp[13]),
    .GRP_DONE_R_2(to_rpcsa_grp[14]),
    .GRP_DONE_R_3(to_rpcsa_grp[15]),
    .GRP_DESKEW_ERROR_R_0(to_rpcsa_grp[16]),
    .GRP_DESKEW_ERROR_R_1(to_rpcsa_grp[17]),
    .GRP_DESKEW_ERROR_R_2(to_rpcsa_grp[18]),
    .GRP_DESKEW_ERROR_R_3(to_rpcsa_grp[19]),
#if _enable_lpcs_0 == 1
    .LPCS_RDATA_Q0_0(pcs360_in[0]),
    .LPCS_RDATA_Q0_1(pcs360_in[1]),
    .LPCS_RDATA_Q0_2(pcs360_in[2]),
    .LPCS_RDATA_Q0_3(pcs360_in[3]),
    .LPCS_RDATA_Q0_4(pcs360_in[4]),
    .LPCS_RDATA_Q0_5(pcs360_in[5]),
    .LPCS_RDATA_Q0_6(pcs360_in[6]),
    .LPCS_RDATA_Q0_7(pcs360_in[7]),
    .LPCS_INT_0(pcs360_in[8]),
    .QUAD_CLK_0(pcs360_in[9]),
    .QUAD_START_0(pcs360_in[10]),
    .QUAD_DONE_0(pcs360_in[11]),
    .QUAD_AND_FP1_0(pcs360_in[12]),
    .QUAD_AND_FP0_0(pcs360_in[13]),
    .QUAD_OR_FP1_0(pcs360_in[14]),
    .QUAD_OR_FP0_0(pcs360_in[15]),
    .QUAD_RST_N_0(pcs360_in[16]),
#elif _enable_lpcs_0 == 0
    .LPCS_RDATA_Q0_0(scuba_vlo),
    .LPCS_RDATA_Q0_1(scuba_vlo),
    .LPCS_RDATA_Q0_2(scuba_vlo),
    .LPCS_RDATA_Q0_3(scuba_vlo),
    .LPCS_RDATA_Q0_4(scuba_vlo),
    .LPCS_RDATA_Q0_5(scuba_vlo),
    .LPCS_RDATA_Q0_6(scuba_vlo),
    .LPCS_RDATA_Q0_7(scuba_vlo),
    .LPCS_INT_0(scuba_vlo),
    .QUAD_CLK_0(scuba_vlo),
    .QUAD_START_0(scuba_vlo),
    .QUAD_DONE_0(scuba_vlo),
    .QUAD_AND_FP1_0(scuba_vlo),
    .QUAD_AND_FP0_0(scuba_vlo),
    .QUAD_OR_FP1_0(scuba_vlo),
    .QUAD_OR_FP0_0(scuba_vlo),
    .QUAD_RST_N_0(scuba_vlo),
#endif
#if _enable_lpcs_1 == 1
    .LPCS_RDATA_Q1_0(pcs361_in[0]),
    .LPCS_RDATA_Q1_1(pcs361_in[1]),
    .LPCS_RDATA_Q1_2(pcs361_in[2]),
    .LPCS_RDATA_Q1_3(pcs361_in[3]),
    .LPCS_RDATA_Q1_4(pcs361_in[4]),
    .LPCS_RDATA_Q1_5(pcs361_in[5]),
    .LPCS_RDATA_Q1_6(pcs361_in[6]),
    .LPCS_RDATA_Q1_7(pcs361_in[7]),
    .LPCS_INT_1(pcs361_in[8]),
    .QUAD_CLK_1(pcs361_in[9]),
    .QUAD_START_1(pcs361_in[10]),
    .QUAD_DONE_1(pcs361_in[11]),
    .QUAD_AND_FP1_1(pcs361_in[12]),
    .QUAD_AND_FP0_1(pcs361_in[13]),
    .QUAD_OR_FP1_1(pcs361_in[14]),
    .QUAD_OR_FP0_1(pcs361_in[15]),
    .QUAD_RST_N_1(pcs361_in[16]),
#elif _enable_lpcs_1 == 0
    .LPCS_RDATA_Q1_0(scuba_vlo),
    .LPCS_RDATA_Q1_1(scuba_vlo),
    .LPCS_RDATA_Q1_2(scuba_vlo),
    .LPCS_RDATA_Q1_3(scuba_vlo),
    .LPCS_RDATA_Q1_4(scuba_vlo),
    .LPCS_RDATA_Q1_5(scuba_vlo),
    .LPCS_RDATA_Q1_6(scuba_vlo),
    .LPCS_RDATA_Q1_7(scuba_vlo),
    .LPCS_INT_1(scuba_vlo),
    .QUAD_CLK_1(scuba_vlo),
    .QUAD_START_1(scuba_vlo),
    .QUAD_DONE_1(scuba_vlo),
    .QUAD_AND_FP1_1(scuba_vlo),
    .QUAD_AND_FP0_1(scuba_vlo),
    .QUAD_OR_FP1_1(scuba_vlo),
    .QUAD_OR_FP0_1(scuba_vlo),
    .QUAD_RST_N_1(scuba_vlo),
#endif
#if _enable_lpcs_2 == 1
    .LPCS_RDATA_Q2_0(pcs362_in[0]),
    .LPCS_RDATA_Q2_1(pcs362_in[1]),
    .LPCS_RDATA_Q2_2(pcs362_in[2]),
    .LPCS_RDATA_Q2_3(pcs362_in[3]),
    .LPCS_RDATA_Q2_4(pcs362_in[4]),
    .LPCS_RDATA_Q2_5(pcs362_in[5]),
    .LPCS_RDATA_Q2_6(pcs362_in[6]),
    .LPCS_RDATA_Q2_7(pcs362_in[7]),
    .LPCS_INT_2(pcs362_in[8]),
    .QUAD_CLK_2(pcs362_in[9]),
    .QUAD_START_2(pcs362_in[10]),
    .QUAD_DONE_2(pcs362_in[11]),
    .QUAD_AND_FP1_2(pcs362_in[12]),
    .QUAD_AND_FP0_2(pcs362_in[13]),
    .QUAD_OR_FP1_2(pcs362_in[14]),
    .QUAD_OR_FP0_2(pcs362_in[15]),
    .QUAD_RST_N_2(pcs362_in[16]),
#elif _enable_lpcs_2 == 0
    .LPCS_RDATA_Q2_0(scuba_vlo),
    .LPCS_RDATA_Q2_1(scuba_vlo),
    .LPCS_RDATA_Q2_2(scuba_vlo),
    .LPCS_RDATA_Q2_3(scuba_vlo),
    .LPCS_RDATA_Q2_4(scuba_vlo),
    .LPCS_RDATA_Q2_5(scuba_vlo),
    .LPCS_RDATA_Q2_6(scuba_vlo),
    .LPCS_RDATA_Q2_7(scuba_vlo),
    .LPCS_INT_2(scuba_vlo),
    .QUAD_CLK_2(scuba_vlo),
    .QUAD_START_2(scuba_vlo),
    .QUAD_DONE_2(scuba_vlo),
    .QUAD_AND_FP1_2(scuba_vlo),
    .QUAD_AND_FP0_2(scuba_vlo),
    .QUAD_OR_FP1_2(scuba_vlo),
    .QUAD_OR_FP0_2(scuba_vlo),
    .QUAD_RST_N_2(scuba_vlo),
#endif
#if _enable_lpcs_3 == 1
    .LPCS_RDATA_Q3_0(pcs363_in[0]),
    .LPCS_RDATA_Q3_1(pcs363_in[1]),
    .LPCS_RDATA_Q3_2(pcs363_in[2]),
    .LPCS_RDATA_Q3_3(pcs363_in[3]),
    .LPCS_RDATA_Q3_4(pcs363_in[4]),
    .LPCS_RDATA_Q3_5(pcs363_in[5]),
    .LPCS_RDATA_Q3_6(pcs363_in[6]),
    .LPCS_RDATA_Q3_7(pcs363_in[7]),
    .LPCS_INT_3(pcs363_in[8]),
    .QUAD_CLK_3(pcs363_in[9]),
    .QUAD_START_3(pcs363_in[10]),
    .QUAD_DONE_3(pcs363_in[11]),
    .QUAD_AND_FP1_3(pcs363_in[12]),
    .QUAD_AND_FP0_3(pcs363_in[13]),
    .QUAD_OR_FP1_3(pcs363_in[14]),
    .QUAD_OR_FP0_3(pcs363_in[15]),
    .QUAD_RST_N_3(pcs363_in[16]),
#elif _enable_lpcs_3 == 0
    .LPCS_RDATA_Q3_0(scuba_vlo),
    .LPCS_RDATA_Q3_1(scuba_vlo),
    .LPCS_RDATA_Q3_2(scuba_vlo),
    .LPCS_RDATA_Q3_3(scuba_vlo),
    .LPCS_RDATA_Q3_4(scuba_vlo),
    .LPCS_RDATA_Q3_5(scuba_vlo),
    .LPCS_RDATA_Q3_6(scuba_vlo),
    .LPCS_RDATA_Q3_7(scuba_vlo),
    .LPCS_INT_3(scuba_vlo),
    .QUAD_CLK_3(scuba_vlo),
    .QUAD_START_3(scuba_vlo),
    .QUAD_DONE_3(scuba_vlo),
    .QUAD_AND_FP1_3(scuba_vlo),
    .QUAD_AND_FP0_3(scuba_vlo),
    .QUAD_OR_FP1_3(scuba_vlo),
    .QUAD_OR_FP0_3(scuba_vlo),
    .QUAD_RST_N_3(scuba_vlo),
#endif
#if _enable_rpcs_0 == 1
    .RPCS_RDATA_Q0_0(pcs3e0_in[0]),
    .RPCS_RDATA_Q0_1(pcs3e0_in[1]),
    .RPCS_RDATA_Q0_2(pcs3e0_in[2]),
    .RPCS_RDATA_Q0_3(pcs3e0_in[3]),
    .RPCS_RDATA_Q0_4(pcs3e0_in[4]),
    .RPCS_RDATA_Q0_5(pcs3e0_in[5]),
    .RPCS_RDATA_Q0_6(pcs3e0_in[6]),
    .RPCS_RDATA_Q0_7(pcs3e0_in[7]),
    .RPCS_INT_0(pcs3e0_in[8]),
    .QUAD_CLK_4(pcs3e0_in[9]),
    .QUAD_START_4(pcs3e0_in[10]),
    .QUAD_DONE_4(pcs3e0_in[11]),
    .QUAD_AND_FP1_4(pcs3e0_in[12]),
    .QUAD_AND_FP0_4(pcs3e0_in[13]),
    .QUAD_OR_FP1_4(pcs3e0_in[14]),
    .QUAD_OR_FP0_4(pcs3e0_in[15]),
    .QUAD_RST_N_4(pcs3e0_in[16]),
#elif _enable_rpcs_0 == 0
    .RPCS_RDATA_Q0_0(scuba_vlo),
    .RPCS_RDATA_Q0_1(scuba_vlo),
    .RPCS_RDATA_Q0_2(scuba_vlo),
    .RPCS_RDATA_Q0_3(scuba_vlo),
    .RPCS_RDATA_Q0_4(scuba_vlo),
    .RPCS_RDATA_Q0_5(scuba_vlo),
    .RPCS_RDATA_Q0_6(scuba_vlo),
    .RPCS_RDATA_Q0_7(scuba_vlo),
    .RPCS_INT_0(scuba_vlo),
    .QUAD_CLK_4(scuba_vlo),
    .QUAD_START_4(scuba_vlo),
    .QUAD_DONE_4(scuba_vlo),
    .QUAD_AND_FP1_4(scuba_vlo),
    .QUAD_AND_FP0_4(scuba_vlo),
    .QUAD_OR_FP1_4(scuba_vlo),
    .QUAD_OR_FP0_4(scuba_vlo),
    .QUAD_RST_N_4(scuba_vlo),
#endif
#if _enable_rpcs_1 == 1
    .RPCS_RDATA_Q1_0(pcs3e1_in[0]),
    .RPCS_RDATA_Q1_1(pcs3e1_in[1]),
    .RPCS_RDATA_Q1_2(pcs3e1_in[2]),
    .RPCS_RDATA_Q1_3(pcs3e1_in[3]),
    .RPCS_RDATA_Q1_4(pcs3e1_in[4]),
    .RPCS_RDATA_Q1_5(pcs3e1_in[5]),
    .RPCS_RDATA_Q1_6(pcs3e1_in[6]),
    .RPCS_RDATA_Q1_7(pcs3e1_in[7]),
    .RPCS_INT_1(pcs3e1_in[8]),
    .QUAD_CLK_5(pcs3e1_in[9]),
    .QUAD_START_5(pcs3e1_in[10]),
    .QUAD_DONE_5(pcs3e1_in[11]),
    .QUAD_AND_FP1_5(pcs3e1_in[12]),
    .QUAD_AND_FP0_5(pcs3e1_in[13]),
    .QUAD_OR_FP1_5(pcs3e1_in[14]),
    .QUAD_OR_FP0_5(pcs3e1_in[15]),
    .QUAD_RST_N_5(pcs3e1_in[16]),
#elif _enable_rpcs_1 == 0
    .RPCS_RDATA_Q1_0(scuba_vlo),
    .RPCS_RDATA_Q1_1(scuba_vlo),
    .RPCS_RDATA_Q1_2(scuba_vlo),
    .RPCS_RDATA_Q1_3(scuba_vlo),
    .RPCS_RDATA_Q1_4(scuba_vlo),
    .RPCS_RDATA_Q1_5(scuba_vlo),
    .RPCS_RDATA_Q1_6(scuba_vlo),
    .RPCS_RDATA_Q1_7(scuba_vlo),
    .RPCS_INT_1(scuba_vlo),
    .QUAD_CLK_5(scuba_vlo),
    .QUAD_START_5(scuba_vlo),
    .QUAD_DONE_5(scuba_vlo),
    .QUAD_AND_FP1_5(scuba_vlo),
    .QUAD_AND_FP0_5(scuba_vlo),
    .QUAD_OR_FP1_5(scuba_vlo),
    .QUAD_OR_FP0_5(scuba_vlo),
    .QUAD_RST_N_5(scuba_vlo),
#endif
#if _enable_rpcs_2 == 1
    .RPCS_RDATA_Q2_0(pcs3e2_in[0]),
    .RPCS_RDATA_Q2_1(pcs3e2_in[1]),
    .RPCS_RDATA_Q2_2(pcs3e2_in[2]),
    .RPCS_RDATA_Q2_3(pcs3e2_in[3]),
    .RPCS_RDATA_Q2_4(pcs3e2_in[4]),
    .RPCS_RDATA_Q2_5(pcs3e2_in[5]),
    .RPCS_RDATA_Q2_6(pcs3e2_in[6]),
    .RPCS_RDATA_Q2_7(pcs3e2_in[7]),
    .RPCS_INT_2(pcs3e2_in[8]),
    .QUAD_CLK_6(pcs3e2_in[9]),
    .QUAD_START_6(pcs3e2_in[10]),
    .QUAD_DONE_6(pcs3e2_in[11]),
    .QUAD_AND_FP1_6(pcs3e2_in[12]),
    .QUAD_AND_FP0_6(pcs3e2_in[13]),
    .QUAD_OR_FP1_6(pcs3e2_in[14]),
    .QUAD_OR_FP0_6(pcs3e2_in[15]),
    .QUAD_RST_N_6(pcs3e2_in[16]),
#elif _enable_rpcs_2 == 0
    .RPCS_RDATA_Q2_0(scuba_vlo),
    .RPCS_RDATA_Q2_1(scuba_vlo),
    .RPCS_RDATA_Q2_2(scuba_vlo),
    .RPCS_RDATA_Q2_3(scuba_vlo),
    .RPCS_RDATA_Q2_4(scuba_vlo),
    .RPCS_RDATA_Q2_5(scuba_vlo),
    .RPCS_RDATA_Q2_6(scuba_vlo),
    .RPCS_RDATA_Q2_7(scuba_vlo),
    .RPCS_INT_2(scuba_vlo),
    .QUAD_CLK_6(scuba_vlo),
    .QUAD_START_6(scuba_vlo),
    .QUAD_DONE_6(scuba_vlo),
    .QUAD_AND_FP1_6(scuba_vlo),
    .QUAD_AND_FP0_6(scuba_vlo),
    .QUAD_OR_FP1_6(scuba_vlo),
    .QUAD_OR_FP0_6(scuba_vlo),
    .QUAD_RST_N_6(scuba_vlo),
#endif
#if _enable_rpcs_3 == 1
    .RPCS_RDATA_Q3_0(pcs3e3_in[0]),
    .RPCS_RDATA_Q3_1(pcs3e3_in[1]),
    .RPCS_RDATA_Q3_2(pcs3e3_in[2]),
    .RPCS_RDATA_Q3_3(pcs3e3_in[3]),
    .RPCS_RDATA_Q3_4(pcs3e3_in[4]),
    .RPCS_RDATA_Q3_5(pcs3e3_in[5]),
    .RPCS_RDATA_Q3_6(pcs3e3_in[6]),
    .RPCS_RDATA_Q3_7(pcs3e3_in[7]),
    .RPCS_INT_3(pcs3e3_in[8]),
    .QUAD_CLK_7(pcs3e3_in[9]),
    .QUAD_START_7(pcs3e3_in[10]),
    .QUAD_DONE_7(pcs3e3_in[11]),
    .QUAD_AND_FP1_7(pcs3e3_in[12]),
    .QUAD_AND_FP0_7(pcs3e3_in[13]),
    .QUAD_OR_FP1_7(pcs3e3_in[14]),
    .QUAD_OR_FP0_7(pcs3e3_in[15]),
    .QUAD_RST_N_7(pcs3e3_in[16]),
#elif _enable_rpcs_3 == 0
    .RPCS_RDATA_Q3_0(scuba_vlo),
    .RPCS_RDATA_Q3_1(scuba_vlo),
    .RPCS_RDATA_Q3_2(scuba_vlo),
    .RPCS_RDATA_Q3_3(scuba_vlo),
    .RPCS_RDATA_Q3_4(scuba_vlo),
    .RPCS_RDATA_Q3_5(scuba_vlo),
    .RPCS_RDATA_Q3_6(scuba_vlo),
    .RPCS_RDATA_Q3_7(scuba_vlo),
    .RPCS_INT_3(scuba_vlo),
    .QUAD_CLK_7(scuba_vlo),
    .QUAD_START_7(scuba_vlo),
    .QUAD_DONE_7(scuba_vlo),
    .QUAD_AND_FP1_7(scuba_vlo),
    .QUAD_AND_FP0_7(scuba_vlo),
    .QUAD_OR_FP1_7(scuba_vlo),
    .QUAD_OR_FP0_7(scuba_vlo),
    .QUAD_RST_N_7(scuba_vlo),
#endif

    .SYS_RST_N(sysbus_rst_n)
) STARTCOM synthesis IS_ASB="or5s00/data/or5s00.acd" SYSBUS_CONFIG_FILE=#_circuit_name_new MPI_BUS_WIDTH=#_bus_width SYS_CLK_SEL=_sys_clock MPI_PRIORITY=_mpi_priority FPGA_PRIORITY=_umi_priority PARITY=_read_parity MPI_PARITY=#_parity_enable_new MPI_RST=#_mpi_sys_reset_new MASTER_RST=#_umi_sys_reset_new MPI_SYNCMODE=#_mpi_clk_async_new MASTER_SYNCMODE=#_umi_sync_hclk_new MASTER_AUTORETRY=#_auto_retry_new SLAVE_SYNCMODE=#_usi_sync_hclk_new INTERRUPT_VECTOR1=#_interrupt_vec1_new INTERRUPT_VECTOR2=#_interrupt_vec2_new INTERRUPT_VECTOR3=#_interrupt_vec3_new INTERRUPT_VECTOR4=#_interrupt_vec4_new INTERRUPT_VECTOR5=#_interrupt_vec5_new INTERRUPT_VECTOR6=#_interrupt_vec6_new ENDCOM;

SLASH2 exemplar begin
SLASH2 exemplar attribute SYSBUSA_INST SYSBUS_CONFIG_FILE _circuit_name_new
SLASH2 exemplar attribute SYSBUSA_INST IS_ASB or5s00/data/or5s00.acd
SLASH2 exemplar attribute SYSBUSA_INST MPI_BUS_WIDTH _bus_width
SLASH2 exemplar attribute SYSBUSA_INST SYS_CLK_SEL _sys_clock_new
SLASH2 exemplar attribute SYSBUSA_INST MPI_PRIORITY _mpi_priority_new
SLASH2 exemplar attribute SYSBUSA_INST FPGA_PRIORITY _umi_priority_new
SLASH2 exemplar attribute SYSBUSA_INST PARITY _read_parity_new
SLASH2 exemplar attribute SYSBUSA_INST MPI_PARITY _parity_enable_new
SLASH2 exemplar attribute SYSBUSA_INST MPI_RST _mpi_sys_reset_new
SLASH2 exemplar attribute SYSBUSA_INST MASTER_RST _umi_sys_reset_new
SLASH2 exemplar attribute SYSBUSA_INST MPI_SYNCMODE _mpi_clk_async_new
SLASH2 exemplar attribute SYSBUSA_INST MASTER_SYNCMODE _umi_sync_hclk_new
SLASH2 exemplar attribute SYSBUSA_INST MASTER_AUTORETRY _auto_retry_new
SLASH2 exemplar attribute SYSBUSA_INST SLAVE_SYNCMODE _usi_sync_hclk_new
SLASH2 exemplar attribute SYSBUSA_INST INTERRUPT_VECTOR1 _interrupt_vec1_new
SLASH2 exemplar attribute SYSBUSA_INST INTERRUPT_VECTOR2 _interrupt_vec2_new
SLASH2 exemplar attribute SYSBUSA_INST INTERRUPT_VECTOR3 _interrupt_vec3_new
SLASH2 exemplar attribute SYSBUSA_INST INTERRUPT_VECTOR4 _interrupt_vec4_new
SLASH2 exemplar attribute SYSBUSA_INST INTERRUPT_VECTOR5 _interrupt_vec5_new
SLASH2 exemplar attribute SYSBUSA_INST INTERRUPT_VECTOR6 _interrupt_vec6_new
SLASH2 exemplar end

#if _enable_lpcs_0 == 1
    assign pcs360_out[44:7] = {to_lpcsa_grp, to_lpcsa};
#endif
#if _enable_lpcs_1 == 1
    assign pcs361_out[44:7] = {to_lpcsa_grp, to_lpcsa};
#endif
#if _enable_lpcs_2 == 1
    assign pcs362_out[44:7] = {to_lpcsa_grp, to_lpcsa};
#endif
#if _enable_lpcs_3 == 1
    assign pcs363_out[44:7] = {to_lpcsa_grp, to_lpcsa};
#endif

#if _enable_rpcs_0 == 1
    assign pcs3e0_out[44:7] = {to_rpcsa_grp, to_rpcsa};
#endif
#if _enable_rpcs_1 == 1
    assign pcs3e1_out[44:7] = {to_rpcsa_grp, to_rpcsa};
#endif
#if _enable_rpcs_2 == 1
    assign pcs3e2_out[44:7] = {to_rpcsa_grp, to_rpcsa};
#endif
#if _enable_rpcs_3 == 1
    assign pcs3e3_out[44:7] = {to_rpcsa_grp, to_rpcsa};
#endif

#if _enable_umi == 1
#if _enable_orcastra == 1
JTAGA jtag(
  .TCK(tck),
  .TDI(tdi),
  .TDO(tdo),
  .TMS(tms),
  .PSROUT1(PSR_Out1),
  .PSROUT2(1'b0),
  .PSROUT3(1'b0),
  .JTDO1(JTDO),
  .JTDO2(1'b0),
  .JTDO3(1'b0),
  .JTDO4(1'b0),
  .JTDO5(1'b0),
  .JTDO6(1'b0),
  .JTDO7(1'b0),
  .JTDO8(1'b0),
  .TRESET( ),
  .PSRSFTN(Shift_DR),
  .PSRCAP(Capture_DR),
  .PSRENABLE1(PSR_Enable1),
  .PSRENABLE2( ),
  .PSRENABLE3( ),
  .SCANENABLE1( ),
  .SCANENABLE2( ),
  .SCANENABLE3( ),
  .SCANENABLE4( ),
  .SCANENABLE5( ),
  .SCANENABLE6( ),
  .SCANENABLE7( ),
  .SCANENABLE8( ),
  .SCANI(),
  .JTCK(JTCK),
  .JTDI(JTDI),
  .JSHIFT( ),
  .JUPDATE( ),
  .JRSTN( ),
  .JCE1( ),
  .JCE2( ),
  .JCE3( ),
  .JCE4( ),
  .JCE5( ),
  .JCE6( ),
  .JCE7( ),
  .JCE8( ),
  .JRTI1( ),
  .JRTI2( ),
  .JRTI3( ),
  .JRTI4( ),
  .JRTI5( ),
  .JRTI6( ),
  .JRTI7( ),
  .JRTI8( )
);

always @(posedge JTCK or posedge Capture_DR)
begin
    if (Capture_DR)
    begin
      c <= 5'b00000;
    end
    else if (~Shift_DR & PSR_Enable1)
    begin
      c <= c + 1;
    end
end

always @(posedge JTCK or negedge rstn)
begin
    if (~rstn)
    begin
       PC_Ready <= 1'b0 ;
       DataInReg <= 27'h0000000 ;
       BSRing1 <= 32'h00000000 ;
    end
    else if (PSR_Enable1 && ~Shift_DR)
    begin
      if (c == 5'b11110)
      begin
          PC_Ready <= 1'b0 ;
          DataInReg <= BSRing1[29:3] ;
      end
      else if (c == 5'b11111)
      begin
          PC_Ready <= BSRing1[30] ;
          BSRing1 <= ({19'b0000000000000000000, UMackReg, UMackReg, UMretryReg, UMerrReg, umi_rdata[7:0], 1'b0}) ;
      end
      else
          BSRing1 <= ({JTDI, BSRing1[31:1]}) ;
    end
end

assign PSR_Out1 = BSRing1[0] ;
assign umi_wdata = ({4'b0000, DataInReg[7:0],  DataInReg[7:0],  DataInReg[7:0],  DataInReg[7:0]});
assign umi_addr = DataInReg[25:8] ;
assign PC_Read = DataInReg[26] ;

assign UMset = PCready3 & ~PCready4 ;
assign UMclear = ~PCready3 & PCready4 ;

always @ (posedge umi_clk or negedge rstn)
begin
  if (~rstn)
    begin
       PCready2 <= 1'b0 ;
       PCready3 <= 1'b0 ;
       PCready4 <= 1'b0 ;
       umi_rdy <= 1'b0 ;
    end
  else
   begin
     PCready2 <= PC_Ready ;
     PCready3 <= PCready2 ;
     PCready4 <= PCready3 ;
     umi_rdy <= UMlockI & umi_ack & ~UMready2 ;
   end
end

always @ (posedge umi_clk or negedge rstn)
begin
   if (~rstn)
      UMready2 <= 1'b0 ;
   else if (UMclear)
      UMready2 <= 1'b0 ;
   else if (UMlockI && umi_ack)
      UMready2 <= 1'b1 ;
   else if (umi_ack && ~umi_rdy && UMready2)
       UMready2 <= 1'b0 ;
end

always @ (posedge umi_clk or negedge rstn)
begin
    if (~rstn)
       begin
         umi_wr_n <= 1'b0 ;
         UMlockI <= 1'b0 ;
       end
    else if (UMclear)
       begin
         umi_wr_n <= 1'b0 ;
         UMlockI <= 1'b0 ;
       end
    else if (UMset)
       begin
         umi_wr_n <= ~PC_Read ;
         UMlockI <= 1'b1 ;
       end
    else if (umi_ack && ~umi_rdy && UMready2)
       begin
         umi_wr_n <= 1'b0 ;
         UMlockI <= 1'b0 ;
       end
end

always @ (posedge umi_clk or negedge rstn)
begin
   if (~rstn)
      begin
         UMackReg <= 1'b0 ;
         UMretryReg <= 1'b0 ;
         UMerrReg <= 1'b0 ;
      end
   else if (UMclear)
      begin
         UMackReg <= 1'b0 ;
         UMretryReg <= 1'b0 ;
         UMerrReg <= 1'b0 ;
      end
   else if (umi_ack && ~umi_rdy && UMready2)
      begin
         UMackReg <= 1'b1 ;
         UMretryReg <= umi_retry ;
         UMerrReg <= umi_err ;
      end
end
#endif
#endif
endmodule

// Module for synthesis only

module SYSBUSA (
// MPI //
      CS0_N, CS1, MPI_CLK, MPI_WR_N, MPI_STRB_N, MPI_TSIZ_1, MPI_TSIZ_0, MPI_BURST, MPI_BDIP,
      MPI_ADDR_14, MPI_ADDR_15, MPI_ADDR_16, MPI_ADDR_17, MPI_ADDR_18, MPI_ADDR_19,
      MPI_ADDR_20, MPI_ADDR_21, MPI_ADDR_22, MPI_ADDR_23, MPI_ADDR_24, MPI_ADDR_25,
      MPI_ADDR_26, MPI_ADDR_27, MPI_ADDR_28, MPI_ADDR_29, MPI_ADDR_30, MPI_ADDR_31,
      MPI_WR_DATA_31, MPI_WR_DATA_30, MPI_WR_DATA_29, MPI_WR_DATA_28, MPI_WR_DATA_27,
      MPI_WR_DATA_26, MPI_WR_DATA_25, MPI_WR_DATA_24, MPI_WR_DATA_23, MPI_WR_DATA_22,
      MPI_WR_DATA_21, MPI_WR_DATA_20, MPI_WR_DATA_19, MPI_WR_DATA_18, MPI_WR_DATA_17,
      MPI_WR_DATA_16, MPI_WR_DATA_15, MPI_WR_DATA_14, MPI_WR_DATA_13, MPI_WR_DATA_12,
      MPI_WR_DATA_11, MPI_WR_DATA_10, MPI_WR_DATA_9, MPI_WR_DATA_8, MPI_WR_DATA_7,
      MPI_WR_DATA_6, MPI_WR_DATA_5, MPI_WR_DATA_4, MPI_WR_DATA_3, MPI_WR_DATA_2,
      MPI_WR_DATA_1, MPI_WR_DATA_0, MPI_WR_PARITY_3, MPI_WR_PARITY_2,
      MPI_WR_PARITY_1, MPI_WR_PARITY_0, MPI_RST_N, SYS_RST_N, USR_CLK, USER_IRQ_IN,

      MPI_TA, MPI_RETRY, MPI_TEA, MPI_RD_DATA_31, MPI_RD_DATA_30, MPI_RD_DATA_29,
      MPI_RD_DATA_28, MPI_RD_DATA_27, MPI_RD_DATA_26, MPI_RD_DATA_25, MPI_RD_DATA_24,
      MPI_RD_DATA_23, MPI_RD_DATA_22, MPI_RD_DATA_21, MPI_RD_DATA_20, MPI_RD_DATA_19,
      MPI_RD_DATA_18, MPI_RD_DATA_17, MPI_RD_DATA_16, MPI_RD_DATA_15, MPI_RD_DATA_14,
      MPI_RD_DATA_13, MPI_RD_DATA_12, MPI_RD_DATA_11, MPI_RD_DATA_10, MPI_RD_DATA_9,
      MPI_RD_DATA_8, MPI_RD_DATA_7, MPI_RD_DATA_6, MPI_RD_DATA_5, MPI_RD_DATA_4,
      MPI_RD_DATA_3, MPI_RD_DATA_2, MPI_RD_DATA_1, MPI_RD_DATA_0,
      PD2_0_TS, PD7_3_TS, PD15_8_TS, PD31_16_TS, MPI_RD_PARITY_3, MPI_RD_PARITY_2,
      MPI_RD_PARITY_1, MPI_RD_PARITY_0, MPI_DP_TS_0, MPI_DP_TS_1, MPI_DP_TS_2,
      MPI_IRQ_N, MPI_CNTL_TS, USER_IRQ_OUT, HCLK_CIB,

// PLL_SMI INTERFACE //
      SMI_RDATA_63, SMI_RDATA_62, SMI_RDATA_61, SMI_RDATA_60, SMI_RDATA_59, SMI_RDATA_58,
      SMI_RDATA_57, SMI_RDATA_56, SMI_RDATA_55, SMI_RDATA_54, SMI_RDATA_53, SMI_RDATA_52,
      SMI_RDATA_51, SMI_RDATA_50, SMI_RDATA_49, SMI_RDATA_48, SMI_RDATA_47, SMI_RDATA_46,
      SMI_RDATA_45, SMI_RDATA_44, SMI_RDATA_43, SMI_RDATA_42, SMI_RDATA_41, SMI_RDATA_40,
      SMI_RDATA_39, SMI_RDATA_38, SMI_RDATA_37, SMI_RDATA_36, SMI_RDATA_35, SMI_RDATA_34,
      SMI_RDATA_33, SMI_RDATA_32, SMI_RDATA_31, SMI_RDATA_30, SMI_RDATA_29, SMI_RDATA_28,
      SMI_RDATA_27, SMI_RDATA_26, SMI_RDATA_25, SMI_RDATA_24, SMI_RDATA_23, SMI_RDATA_22,
      SMI_RDATA_21, SMI_RDATA_20, SMI_RDATA_19, SMI_RDATA_18, SMI_RDATA_17, SMI_RDATA_16,
      SMI_RDATA_15, SMI_RDATA_14, SMI_RDATA_13, SMI_RDATA_12, SMI_RDATA_11, SMI_RDATA_10,
      SMI_RDATA_9, SMI_RDATA_8, SMI_RDATA_7, SMI_RDATA_6, SMI_RDATA_5, SMI_RDATA_4,
      SMI_RDATA_3, SMI_RDATA_2, SMI_RDATA_1, SMI_RDATA_0,

      SMI_ADDR_9, SMI_ADDR_8, SMI_ADDR_7, SMI_ADDR_6, SMI_ADDR_5, SMI_ADDR_4, SMI_ADDR_3,
      SMI_ADDR_2, SMI_ADDR_1, SMI_ADDR_0, SMI_CLK, SMI_RD, SMI_RST_N, SMI_WDATA, SMI_WR,

// USER LOGIC INTERFACE (MASTER) //
      FMADDR_0, FMADDR_1, FMADDR_2, FMADDR_3, FMADDR_4, FMADDR_5, FMADDR_6, FMADDR_7,
      FMADDR_8, FMADDR_9, FMADDR_10, FMADDR_11, FMADDR_12, FMADDR_13, FMADDR_14,
      FMADDR_15, FMADDR_16, FMADDR_17, FMWDATA_0, FMWDATA_1, FMWDATA_2, FMWDATA_3,
      FMWDATA_4, FMWDATA_5, FMWDATA_6, FMWDATA_7, FMWDATA_8, FMWDATA_9, FMWDATA_10,
      FMWDATA_11, FMWDATA_12, FMWDATA_13, FMWDATA_14, FMWDATA_15, FMWDATA_16, FMWDATA_17,
      FMWDATA_18, FMWDATA_19, FMWDATA_20, FMWDATA_21, FMWDATA_22, FMWDATA_23, FMWDATA_24,
      FMWDATA_25, FMWDATA_26, FMWDATA_27, FMWDATA_28, FMWDATA_29, FMWDATA_30, FMWDATA_31,
      FMWDATA_32, FMWDATA_33, FMWDATA_34, FMWDATA_35,
      FMCLK, FMRESET_N, FMWRN, FMBURST, FMRDY, FMSIZE_0, FMSIZE_1, FMLOCK, FMIRQ,

      FMRDATA_0, FMRDATA_1, FMRDATA_2, FMRDATA_3, FMRDATA_4, FMRDATA_5, FMRDATA_6,
      FMRDATA_7, FMRDATA_8, FMRDATA_9, FMRDATA_10, FMRDATA_11, FMRDATA_12, FMRDATA_13,
      FMRDATA_14, FMRDATA_15, FMRDATA_16, FMRDATA_17, FMRDATA_18, FMRDATA_19, FMRDATA_20,
      FMRDATA_21, FMRDATA_22, FMRDATA_23, FMRDATA_24, FMRDATA_25, FMRDATA_26, FMRDATA_27,
      FMRDATA_28, FMRDATA_29, FMRDATA_30, FMRDATA_31, FMRDATA_32, FMRDATA_33, FMRDATA_34,
      FMRDATA_35, FMACK, FMRETRY, FMERR,

// USER LOGIC INTERFACE (SLAVE) //
      FSRDATA_0, FSRDATA_1, FSRDATA_2, FSRDATA_3, FSRDATA_4, FSRDATA_5, FSRDATA_6, FSRDATA_7,
      FSRDATA_8, FSRDATA_9, FSRDATA_10, FSRDATA_11, FSRDATA_12, FSRDATA_13, FSRDATA_14,
      FSRDATA_15, FSRDATA_16, FSRDATA_17, FSRDATA_18, FSRDATA_19, FSRDATA_20, FSRDATA_21,
      FSRDATA_22, FSRDATA_23, FSRDATA_24, FSRDATA_25, FSRDATA_26, FSRDATA_27, FSRDATA_28,
      FSRDATA_29, FSRDATA_30, FSRDATA_31, FSRDATA_32, FSRDATA_33, FSRDATA_34, FSRDATA_35,
      FSCLK, FSRESET_N, FSACK, FSRETRY, FSERR, FSIRQ,

      FSWDATA_0, FSWDATA_1, FSWDATA_2, FSWDATA_3, FSWDATA_4, FSWDATA_5, FSWDATA_6,
      FSWDATA_7, FSWDATA_8, FSWDATA_9, FSWDATA_10, FSWDATA_11, FSWDATA_12, FSWDATA_13,
      FSWDATA_14, FSWDATA_15, FSWDATA_16, FSWDATA_17, FSWDATA_18, FSWDATA_19, FSWDATA_20,
      FSWDATA_21, FSWDATA_22, FSWDATA_23, FSWDATA_24, FSWDATA_25, FSWDATA_26, FSWDATA_27,
      FSWDATA_28, FSWDATA_29, FSWDATA_30, FSWDATA_31, FSWDATA_32, FSWDATA_33, FSWDATA_34,
      FSWDATA_35, FSADDR_0, FSADDR_1, FSADDR_2, FSADDR_3, FSADDR_4, FSADDR_5, FSADDR_6,
      FSADDR_7, FSADDR_8, FSADDR_9, FSADDR_10, FSADDR_11, FSADDR_12, FSADDR_13, FSADDR_14,
      FSADDR_15, FSADDR_16, FSADDR_17, FSRDY, FSWRN, FSSIZE_0, FSSIZE_1,

// Left ASB //
      HADDR_LASBM_17, HADDR_LASBM_16, HADDR_LASBM_15, HADDR_LASBM_14, HADDR_LASBM_13,
      HADDR_LASBM_12, HADDR_LASBM_11, HADDR_LASBM_10, HADDR_LASBM_9, HADDR_LASBM_8,
      HADDR_LASBM_7, HADDR_LASBM_6, HADDR_LASBM_5, HADDR_LASBM_4, HADDR_LASBM_3,
      HADDR_LASBM_2, HADDR_LASBM_1, HADDR_LASBM_0, HSIZE_LASBM_1, HSIZE_LASBM_0,
      HTRANS_LASBM_1, HTRANS_LASBM_0, HWDATA_LASBM_35, HWDATA_LASBM_34, HWDATA_LASBM_33,
      HWDATA_LASBM_32, HWDATA_LASBM_31, HWDATA_LASBM_30, HWDATA_LASBM_29, HWDATA_LASBM_28,
      HWDATA_LASBM_27, HWDATA_LASBM_26, HWDATA_LASBM_25, HWDATA_LASBM_24, HWDATA_LASBM_23,
      HWDATA_LASBM_22, HWDATA_LASBM_21, HWDATA_LASBM_20, HWDATA_LASBM_19, HWDATA_LASBM_18,
      HWDATA_LASBM_17, HWDATA_LASBM_16, HWDATA_LASBM_15, HWDATA_LASBM_14, HWDATA_LASBM_13,
      HWDATA_LASBM_12, HWDATA_LASBM_11, HWDATA_LASBM_10, HWDATA_LASBM_9, HWDATA_LASBM_8,
      HWDATA_LASBM_7, HWDATA_LASBM_6, HWDATA_LASBM_5, HWDATA_LASBM_4, HWDATA_LASBM_3,
      HWDATA_LASBM_2, HWDATA_LASBM_1, HWDATA_LASBM_0, HBURST_LASBM,
      HWRITE_LASBM, LASB_CLK, LASB_GSR, LASB_IRQ_MASTER,

      HRDATA_LASBM_35, HRDATA_LASBM_34, HRDATA_LASBM_33,
      HRDATA_LASBM_32, HRDATA_LASBM_31, HRDATA_LASBM_30, HRDATA_LASBM_29, HRDATA_LASBM_28,
      HRDATA_LASBM_27, HRDATA_LASBM_26, HRDATA_LASBM_25, HRDATA_LASBM_24, HRDATA_LASBM_23,
      HRDATA_LASBM_22, HRDATA_LASBM_21, HRDATA_LASBM_20, HRDATA_LASBM_19, HRDATA_LASBM_18,
      HRDATA_LASBM_17, HRDATA_LASBM_16, HRDATA_LASBM_15, HRDATA_LASBM_14, HRDATA_LASBM_13,
      HRDATA_LASBM_12, HRDATA_LASBM_11, HRDATA_LASBM_10, HRDATA_LASBM_9, HRDATA_LASBM_8,
      HRDATA_LASBM_7, HRDATA_LASBM_6, HRDATA_LASBM_5, HRDATA_LASBM_4, HRDATA_LASBM_3,
      HRDATA_LASBM_2, HRDATA_LASBM_1, HRDATA_LASBM_0, HRESP_LASBM_1, HRESP_LASBM_0,
      HCLK_LASB, HREADY_LASB, HRESET_N_LASB, LASB_DONE, LASB_GSR_N,
      LASB_IRQ_OUT, 
// Right ASB //
      HADDR_RASBM_17, HADDR_RASBM_16, HADDR_RASBM_15, HADDR_RASBM_14, HADDR_RASBM_13,
      HADDR_RASBM_12, HADDR_RASBM_11, HADDR_RASBM_10, HADDR_RASBM_9, HADDR_RASBM_8,
      HADDR_RASBM_7, HADDR_RASBM_6, HADDR_RASBM_5, HADDR_RASBM_4, HADDR_RASBM_3,
      HADDR_RASBM_2, HADDR_RASBM_1, HADDR_RASBM_0, HSIZE_RASBM_1, HSIZE_RASBM_0,
      HTRANS_RASBM_1, HTRANS_RASBM_0, HWDATA_RASBM_35, HWDATA_RASBM_34, HWDATA_RASBM_33,
      HWDATA_RASBM_32, HWDATA_RASBM_31, HWDATA_RASBM_30, HWDATA_RASBM_29, HWDATA_RASBM_28,
      HWDATA_RASBM_27, HWDATA_RASBM_26, HWDATA_RASBM_25, HWDATA_RASBM_24, HWDATA_RASBM_23,
      HWDATA_RASBM_22, HWDATA_RASBM_21, HWDATA_RASBM_20, HWDATA_RASBM_19, HWDATA_RASBM_18,
      HWDATA_RASBM_17, HWDATA_RASBM_16, HWDATA_RASBM_15, HWDATA_RASBM_14, HWDATA_RASBM_13,
      HWDATA_RASBM_12, HWDATA_RASBM_11, HWDATA_RASBM_10, HWDATA_RASBM_9, HWDATA_RASBM_8,
      HWDATA_RASBM_7, HWDATA_RASBM_6, HWDATA_RASBM_5, HWDATA_RASBM_4, HWDATA_RASBM_3,
      HWDATA_RASBM_2, HWDATA_RASBM_1, HWDATA_RASBM_0, HBURST_RASBM,
      HWRITE_RASBM, RASB_CLK, RASB_GSR, RASB_IRQ_MASTER,

      HRDATA_RASBM_35, HRDATA_RASBM_34, HRDATA_RASBM_33,
      HRDATA_RASBM_32, HRDATA_RASBM_31, HRDATA_RASBM_30, HRDATA_RASBM_29, HRDATA_RASBM_28,
      HRDATA_RASBM_27, HRDATA_RASBM_26, HRDATA_RASBM_25, HRDATA_RASBM_24, HRDATA_RASBM_23,
      HRDATA_RASBM_22, HRDATA_RASBM_21, HRDATA_RASBM_20, HRDATA_RASBM_19, HRDATA_RASBM_18,
      HRDATA_RASBM_17, HRDATA_RASBM_16, HRDATA_RASBM_15, HRDATA_RASBM_14, HRDATA_RASBM_13,
      HRDATA_RASBM_12, HRDATA_RASBM_11, HRDATA_RASBM_10, HRDATA_RASBM_9, HRDATA_RASBM_8,
      HRDATA_RASBM_7, HRDATA_RASBM_6, HRDATA_RASBM_5, HRDATA_RASBM_4, HRDATA_RASBM_3,
      HRDATA_RASBM_2, HRDATA_RASBM_1, HRDATA_RASBM_0, HRESP_RASBM_1, HRESP_RASBM_0,
      HCLK_RASB, HREADY_RASB, HRESET_N_RASB, RASB_DONE, RASB_GSR_N,
      RASB_IRQ_OUT, 

// PCS //
      EXT_CLK_P1_IN, EXT_CLK_P2_IN, EXT_DONE_IN,
      QUAD_AND_FP0_7, QUAD_AND_FP0_6, QUAD_AND_FP0_5, QUAD_AND_FP0_4, QUAD_AND_FP0_3,
      QUAD_AND_FP0_2, QUAD_AND_FP0_1, QUAD_AND_FP0_0,
      QUAD_AND_FP1_7, QUAD_AND_FP1_6, QUAD_AND_FP1_5, QUAD_AND_FP1_4, QUAD_AND_FP1_3,
      QUAD_AND_FP1_2, QUAD_AND_FP1_1, QUAD_AND_FP1_0,
      QUAD_CLK_7, QUAD_CLK_6, QUAD_CLK_5, QUAD_CLK_4, QUAD_CLK_3,
      QUAD_CLK_2, QUAD_CLK_1, QUAD_CLK_0,
      QUAD_DONE_7, QUAD_DONE_6, QUAD_DONE_5, QUAD_DONE_4, QUAD_DONE_3,
      QUAD_DONE_2, QUAD_DONE_1, QUAD_DONE_0,
      QUAD_OR_FP0_7, QUAD_OR_FP0_6, QUAD_OR_FP0_5, QUAD_OR_FP0_4, QUAD_OR_FP0_3,
      QUAD_OR_FP0_2, QUAD_OR_FP0_1, QUAD_OR_FP0_0,
      QUAD_OR_FP1_7, QUAD_OR_FP1_6, QUAD_OR_FP1_5, QUAD_OR_FP1_4, QUAD_OR_FP1_3,
      QUAD_OR_FP1_2, QUAD_OR_FP1_1, QUAD_OR_FP1_0,
      QUAD_RST_N_7, QUAD_RST_N_6, QUAD_RST_N_5, QUAD_RST_N_4, QUAD_RST_N_3,
      QUAD_RST_N_2, QUAD_RST_N_1, QUAD_RST_N_0,
      QUAD_START_7, QUAD_START_6, QUAD_START_5, QUAD_START_4, QUAD_START_3,
      QUAD_START_2, QUAD_START_1, QUAD_START_0,
      
      EXT_CLK_P1_OUT, EXT_CLK_P2_OUT, EXT_DONE_OUT,
      GRP_CLK_P1_L_3, GRP_CLK_P1_L_2, GRP_CLK_P1_L_1, GRP_CLK_P1_L_0,
      GRP_CLK_P2_L_3, GRP_CLK_P2_L_2, GRP_CLK_P2_L_1, GRP_CLK_P2_L_0,
      GRP_DESKEW_ERROR_L_3, GRP_DESKEW_ERROR_L_2, GRP_DESKEW_ERROR_L_1, GRP_DESKEW_ERROR_L_0,
      GRP_DONE_L_3, GRP_DONE_L_2, GRP_DONE_L_1, GRP_DONE_L_0,
      GRP_START_L_3, GRP_START_L_2, GRP_START_L_1, GRP_START_L_0,
      GRP_CLK_P1_R_3, GRP_CLK_P1_R_2, GRP_CLK_P1_R_1, GRP_CLK_P1_R_0,
      GRP_CLK_P2_R_3, GRP_CLK_P2_R_2, GRP_CLK_P2_R_1, GRP_CLK_P2_R_0,
      GRP_DESKEW_ERROR_R_3, GRP_DESKEW_ERROR_R_2, GRP_DESKEW_ERROR_R_1, GRP_DESKEW_ERROR_R_0,
      GRP_DONE_R_3, GRP_DONE_R_2, GRP_DONE_R_1, GRP_DONE_R_0,
      GRP_START_R_3, GRP_START_R_2, GRP_START_R_1, GRP_START_R_0,

// LPCS //
      LPCS_INT_3, LPCS_INT_2, LPCS_INT_1, LPCS_INT_0,
      LPCS_RDATA_Q0_7, LPCS_RDATA_Q0_6, LPCS_RDATA_Q0_5, LPCS_RDATA_Q0_4,
      LPCS_RDATA_Q0_3, LPCS_RDATA_Q0_2, LPCS_RDATA_Q0_1, LPCS_RDATA_Q0_0,
      LPCS_RDATA_Q1_7, LPCS_RDATA_Q1_6, LPCS_RDATA_Q1_5, LPCS_RDATA_Q1_4,
      LPCS_RDATA_Q1_3, LPCS_RDATA_Q1_2, LPCS_RDATA_Q1_1, LPCS_RDATA_Q1_0,
      LPCS_RDATA_Q2_7, LPCS_RDATA_Q2_6, LPCS_RDATA_Q2_5, LPCS_RDATA_Q2_4,
      LPCS_RDATA_Q2_3, LPCS_RDATA_Q2_2, LPCS_RDATA_Q2_1, LPCS_RDATA_Q2_0,
      LPCS_RDATA_Q3_7, LPCS_RDATA_Q3_6, LPCS_RDATA_Q3_5, LPCS_RDATA_Q3_4,
      LPCS_RDATA_Q3_3, LPCS_RDATA_Q3_2, LPCS_RDATA_Q3_1, LPCS_RDATA_Q3_0,

      LPCS_ADDR_7, LPCS_ADDR_6, LPCS_ADDR_5, LPCS_ADDR_4,
      LPCS_ADDR_3, LPCS_ADDR_2, LPCS_ADDR_1, LPCS_ADDR_0,
      LPCS_WDATA_7, LPCS_WDATA_6, LPCS_WDATA_5, LPCS_WDATA_4,
      LPCS_WDATA_3, LPCS_WDATA_2, LPCS_WDATA_1, LPCS_WDATA_0,
      LPCS_C_15, LPCS_C_14, LPCS_C_13, LPCS_C_12,
      LPCS_C_11, LPCS_C_10, LPCS_C_9, LPCS_C_8,
      LPCS_C_7, LPCS_C_6, LPCS_C_5, LPCS_C_4,
      LPCS_C_3, LPCS_C_2, LPCS_C_1, LPCS_C_0,
      LPCS_Q_3, LPCS_Q_2, LPCS_Q_1, LPCS_Q_0,
      LPCS_RD, LPCS_WSTB, LPCS_QUAD_ID0_1, LPCS_QUAD_ID0_0,
      LPCS_QUAD_ID1_1, LPCS_QUAD_ID1_0, LPCS_QUAD_ID2_1, LPCS_QUAD_ID2_0,
      LPCS_QUAD_ID3_1, LPCS_QUAD_ID3_0,

// RPCS //
      RPCS_INT_3, RPCS_INT_2, RPCS_INT_1, RPCS_INT_0,
      RPCS_RDATA_Q0_7, RPCS_RDATA_Q0_6, RPCS_RDATA_Q0_5, RPCS_RDATA_Q0_4,
      RPCS_RDATA_Q0_3, RPCS_RDATA_Q0_2, RPCS_RDATA_Q0_1, RPCS_RDATA_Q0_0,
      RPCS_RDATA_Q1_7, RPCS_RDATA_Q1_6, RPCS_RDATA_Q1_5, RPCS_RDATA_Q1_4,
      RPCS_RDATA_Q1_3, RPCS_RDATA_Q1_2, RPCS_RDATA_Q1_1, RPCS_RDATA_Q1_0,
      RPCS_RDATA_Q2_7, RPCS_RDATA_Q2_6, RPCS_RDATA_Q2_5, RPCS_RDATA_Q2_4,
      RPCS_RDATA_Q2_3, RPCS_RDATA_Q2_2, RPCS_RDATA_Q2_1, RPCS_RDATA_Q2_0,
      RPCS_RDATA_Q3_7, RPCS_RDATA_Q3_6, RPCS_RDATA_Q3_5, RPCS_RDATA_Q3_4,
      RPCS_RDATA_Q3_3, RPCS_RDATA_Q3_2, RPCS_RDATA_Q3_1, RPCS_RDATA_Q3_0,

      RPCS_ADDR_7, RPCS_ADDR_6, RPCS_ADDR_5, RPCS_ADDR_4,
      RPCS_ADDR_3, RPCS_ADDR_2, RPCS_ADDR_1, RPCS_ADDR_0,
      RPCS_WDATA_7, RPCS_WDATA_6, RPCS_WDATA_5, RPCS_WDATA_4,
      RPCS_WDATA_3, RPCS_WDATA_2, RPCS_WDATA_1, RPCS_WDATA_0,
      RPCS_C_15, RPCS_C_14, RPCS_C_13, RPCS_C_12,
      RPCS_C_11, RPCS_C_10, RPCS_C_9, RPCS_C_8,
      RPCS_C_7, RPCS_C_6, RPCS_C_5, RPCS_C_4,
      RPCS_C_3, RPCS_C_2, RPCS_C_1, RPCS_C_0,
      RPCS_Q_3, RPCS_Q_2, RPCS_Q_1, RPCS_Q_0,
      RPCS_RD, RPCS_WSTB, RPCS_QUAD_ID0_1, RPCS_QUAD_ID0_0,
      RPCS_QUAD_ID1_1, RPCS_QUAD_ID1_0, RPCS_QUAD_ID2_1, RPCS_QUAD_ID2_0,
      RPCS_QUAD_ID3_1, RPCS_QUAD_ID3_0,

// DMA //
      DMA_RD_DATA_31, DMA_RD_DATA_30, DMA_RD_DATA_29, DMA_RD_DATA_28,
      DMA_RD_DATA_27, DMA_RD_DATA_26, DMA_RD_DATA_25, DMA_RD_DATA_24, DMA_RD_DATA_23,
      DMA_RD_DATA_22, DMA_RD_DATA_21, DMA_RD_DATA_20, DMA_RD_DATA_19, DMA_RD_DATA_18,
      DMA_RD_DATA_17, DMA_RD_DATA_16, DMA_RD_DATA_15, DMA_RD_DATA_14, DMA_RD_DATA_13,
      DMA_RD_DATA_12, DMA_RD_DATA_11, DMA_RD_DATA_10, DMA_RD_DATA_9, DMA_RD_DATA_8,
      DMA_RD_DATA_7, DMA_RD_DATA_6, DMA_RD_DATA_5, DMA_RD_DATA_4, DMA_RD_DATA_3,
      DMA_RD_DATA_2, DMA_RD_DATA_1, DMA_RD_DATA_0, DMA_RD_PARITY_3, DMA_RD_PARITY_2,
      DMA_RD_PARITY_1, DMA_RD_PARITY_0, DMA_RETRY, DMA_TA, DMA_TEA, DMA_TRI_CTL, DMA_TRI_DATA);


input         CS0_N, CS1, MPI_CLK, MPI_WR_N, MPI_STRB_N, MPI_BURST, MPI_BDIP, MPI_RST_N,
              USR_CLK, USER_IRQ_IN, SYS_RST_N;
input         MPI_TSIZ_1, MPI_TSIZ_0;
input         MPI_ADDR_14, MPI_ADDR_15, MPI_ADDR_16, MPI_ADDR_17, MPI_ADDR_18, MPI_ADDR_19,
      MPI_ADDR_20, MPI_ADDR_21, MPI_ADDR_22, MPI_ADDR_23, MPI_ADDR_24, MPI_ADDR_25,
      MPI_ADDR_26, MPI_ADDR_27, MPI_ADDR_28, MPI_ADDR_29, MPI_ADDR_30, MPI_ADDR_31;
input         MPI_WR_DATA_31, MPI_WR_DATA_30, MPI_WR_DATA_29, MPI_WR_DATA_28, MPI_WR_DATA_27,
      MPI_WR_DATA_26, MPI_WR_DATA_25, MPI_WR_DATA_24, MPI_WR_DATA_23, MPI_WR_DATA_22,
      MPI_WR_DATA_21, MPI_WR_DATA_20, MPI_WR_DATA_19, MPI_WR_DATA_18, MPI_WR_DATA_17,
      MPI_WR_DATA_16, MPI_WR_DATA_15, MPI_WR_DATA_14, MPI_WR_DATA_13, MPI_WR_DATA_12,
      MPI_WR_DATA_11, MPI_WR_DATA_10, MPI_WR_DATA_9, MPI_WR_DATA_8, MPI_WR_DATA_7,
      MPI_WR_DATA_6, MPI_WR_DATA_5, MPI_WR_DATA_4, MPI_WR_DATA_3, MPI_WR_DATA_2,
      MPI_WR_DATA_1, MPI_WR_DATA_0;
input          MPI_WR_PARITY_3, MPI_WR_PARITY_2, MPI_WR_PARITY_1, MPI_WR_PARITY_0;

output         MPI_TA, MPI_RETRY, MPI_TEA, PD2_0_TS, PD7_3_TS, PD15_8_TS, PD31_16_TS,
               MPI_IRQ_N, MPI_CNTL_TS, USER_IRQ_OUT, HCLK_CIB;
output         MPI_RD_DATA_31, MPI_RD_DATA_30, MPI_RD_DATA_29,
      MPI_RD_DATA_28, MPI_RD_DATA_27, MPI_RD_DATA_26, MPI_RD_DATA_25, MPI_RD_DATA_24,
      MPI_RD_DATA_23, MPI_RD_DATA_22, MPI_RD_DATA_21, MPI_RD_DATA_20, MPI_RD_DATA_19,
      MPI_RD_DATA_18, MPI_RD_DATA_17, MPI_RD_DATA_16, MPI_RD_DATA_15, MPI_RD_DATA_14,
      MPI_RD_DATA_13, MPI_RD_DATA_12, MPI_RD_DATA_11, MPI_RD_DATA_10, MPI_RD_DATA_9,
      MPI_RD_DATA_8, MPI_RD_DATA_7, MPI_RD_DATA_6, MPI_RD_DATA_5, MPI_RD_DATA_4,
      MPI_RD_DATA_3, MPI_RD_DATA_2, MPI_RD_DATA_1, MPI_RD_DATA_0;
output         MPI_RD_PARITY_3, MPI_RD_PARITY_2, MPI_RD_PARITY_1, MPI_RD_PARITY_0;
output         MPI_DP_TS_0, MPI_DP_TS_1, MPI_DP_TS_2;


//PLL_SMI interface //
input SMI_RDATA_63, SMI_RDATA_62, SMI_RDATA_61, SMI_RDATA_60, SMI_RDATA_59, SMI_RDATA_58,
      SMI_RDATA_57, SMI_RDATA_56, SMI_RDATA_55, SMI_RDATA_54, SMI_RDATA_53, SMI_RDATA_52,
      SMI_RDATA_51, SMI_RDATA_50, SMI_RDATA_49, SMI_RDATA_48, SMI_RDATA_47, SMI_RDATA_46,
      SMI_RDATA_45, SMI_RDATA_44, SMI_RDATA_43, SMI_RDATA_42, SMI_RDATA_41, SMI_RDATA_40,
      SMI_RDATA_39, SMI_RDATA_38, SMI_RDATA_37, SMI_RDATA_36, SMI_RDATA_35, SMI_RDATA_34,
      SMI_RDATA_33, SMI_RDATA_32, SMI_RDATA_31, SMI_RDATA_30, SMI_RDATA_29, SMI_RDATA_28,
      SMI_RDATA_27, SMI_RDATA_26, SMI_RDATA_25, SMI_RDATA_24, SMI_RDATA_23, SMI_RDATA_22,
      SMI_RDATA_21, SMI_RDATA_20, SMI_RDATA_19, SMI_RDATA_18, SMI_RDATA_17, SMI_RDATA_16,
      SMI_RDATA_15, SMI_RDATA_14, SMI_RDATA_13, SMI_RDATA_12, SMI_RDATA_11, SMI_RDATA_10,
      SMI_RDATA_9, SMI_RDATA_8, SMI_RDATA_7, SMI_RDATA_6, SMI_RDATA_5, SMI_RDATA_4,
      SMI_RDATA_3, SMI_RDATA_2, SMI_RDATA_1, SMI_RDATA_0;

output SMI_ADDR_9, SMI_ADDR_8, SMI_ADDR_7, SMI_ADDR_6, SMI_ADDR_5, SMI_ADDR_4, SMI_ADDR_3,
      SMI_ADDR_2, SMI_ADDR_1, SMI_ADDR_0;
output         SMI_CLK, SMI_RD, SMI_RST_N, SMI_WDATA, SMI_WR;

// USER LOGIC INTERFACE (MASTER) //
input FMADDR_0, FMADDR_1, FMADDR_2, FMADDR_3, FMADDR_4, FMADDR_5, FMADDR_6, FMADDR_7,
      FMADDR_8, FMADDR_9, FMADDR_10, FMADDR_11, FMADDR_12, FMADDR_13, FMADDR_14,
      FMADDR_15, FMADDR_16, FMADDR_17;
input FMWDATA_0, FMWDATA_1, FMWDATA_2, FMWDATA_3,
      FMWDATA_4, FMWDATA_5, FMWDATA_6, FMWDATA_7, FMWDATA_8, FMWDATA_9, FMWDATA_10,
      FMWDATA_11, FMWDATA_12, FMWDATA_13, FMWDATA_14, FMWDATA_15, FMWDATA_16, FMWDATA_17,
      FMWDATA_18, FMWDATA_19, FMWDATA_20, FMWDATA_21, FMWDATA_22, FMWDATA_23, FMWDATA_24,
      FMWDATA_25, FMWDATA_26, FMWDATA_27, FMWDATA_28, FMWDATA_29, FMWDATA_30, FMWDATA_31,
      FMWDATA_32, FMWDATA_33, FMWDATA_34, FMWDATA_35;
input FMSIZE_0, FMSIZE_1;
input          FMCLK, FMRESET_N, FMWRN, FMBURST, FMRDY, FMLOCK, FMIRQ;

output FMRDATA_0, FMRDATA_1, FMRDATA_2, FMRDATA_3, FMRDATA_4, FMRDATA_5, FMRDATA_6,
      FMRDATA_7, FMRDATA_8, FMRDATA_9, FMRDATA_10, FMRDATA_11, FMRDATA_12, FMRDATA_13,
      FMRDATA_14, FMRDATA_15, FMRDATA_16, FMRDATA_17, FMRDATA_18, FMRDATA_19, FMRDATA_20,
      FMRDATA_21, FMRDATA_22, FMRDATA_23, FMRDATA_24, FMRDATA_25, FMRDATA_26, FMRDATA_27,
      FMRDATA_28, FMRDATA_29, FMRDATA_30, FMRDATA_31, FMRDATA_32, FMRDATA_33, FMRDATA_34,
      FMRDATA_35;
output         FMACK, FMRETRY, FMERR;

// USER LOGIC INTERFACE (SLAVE) //
input FSRDATA_0, FSRDATA_1, FSRDATA_2, FSRDATA_3, FSRDATA_4, FSRDATA_5, FSRDATA_6, FSRDATA_7,
      FSRDATA_8, FSRDATA_9, FSRDATA_10, FSRDATA_11, FSRDATA_12, FSRDATA_13, FSRDATA_14,
      FSRDATA_15, FSRDATA_16, FSRDATA_17, FSRDATA_18, FSRDATA_19, FSRDATA_20, FSRDATA_21,
      FSRDATA_22, FSRDATA_23, FSRDATA_24, FSRDATA_25, FSRDATA_26, FSRDATA_27, FSRDATA_28,
      FSRDATA_29, FSRDATA_30, FSRDATA_31, FSRDATA_32, FSRDATA_33, FSRDATA_34, FSRDATA_35;
input          FSCLK, FSRESET_N, FSACK, FSRETRY, FSERR, FSIRQ;

output FSWDATA_0, FSWDATA_1, FSWDATA_2, FSWDATA_3, FSWDATA_4, FSWDATA_5, FSWDATA_6,
      FSWDATA_7, FSWDATA_8, FSWDATA_9, FSWDATA_10, FSWDATA_11, FSWDATA_12, FSWDATA_13,
      FSWDATA_14, FSWDATA_15, FSWDATA_16, FSWDATA_17, FSWDATA_18, FSWDATA_19, FSWDATA_20,
      FSWDATA_21, FSWDATA_22, FSWDATA_23, FSWDATA_24, FSWDATA_25, FSWDATA_26, FSWDATA_27,
      FSWDATA_28, FSWDATA_29, FSWDATA_30, FSWDATA_31, FSWDATA_32, FSWDATA_33, FSWDATA_34,
      FSWDATA_35;
output FSADDR_0, FSADDR_1, FSADDR_2, FSADDR_3, FSADDR_4, FSADDR_5, FSADDR_6,
      FSADDR_7, FSADDR_8, FSADDR_9, FSADDR_10, FSADDR_11, FSADDR_12, FSADDR_13, FSADDR_14,
      FSADDR_15, FSADDR_16, FSADDR_17;
output FSSIZE_0, FSSIZE_1;
output         FSRDY, FSWRN;

// Left ASB //
input HADDR_LASBM_17, HADDR_LASBM_16, HADDR_LASBM_15, HADDR_LASBM_14, HADDR_LASBM_13,
      HADDR_LASBM_12, HADDR_LASBM_11, HADDR_LASBM_10, HADDR_LASBM_9, HADDR_LASBM_8,
      HADDR_LASBM_7, HADDR_LASBM_6, HADDR_LASBM_5, HADDR_LASBM_4, HADDR_LASBM_3,
      HADDR_LASBM_2, HADDR_LASBM_1, HADDR_LASBM_0;
input HSIZE_LASBM_1, HSIZE_LASBM_0;
input HTRANS_LASBM_1, HTRANS_LASBM_0;
input HWDATA_LASBM_35, HWDATA_LASBM_34, HWDATA_LASBM_33,
      HWDATA_LASBM_32, HWDATA_LASBM_31, HWDATA_LASBM_30, HWDATA_LASBM_29, HWDATA_LASBM_28,
      HWDATA_LASBM_27, HWDATA_LASBM_26, HWDATA_LASBM_25, HWDATA_LASBM_24, HWDATA_LASBM_23,
      HWDATA_LASBM_22, HWDATA_LASBM_21, HWDATA_LASBM_20, HWDATA_LASBM_19, HWDATA_LASBM_18,
      HWDATA_LASBM_17, HWDATA_LASBM_16, HWDATA_LASBM_15, HWDATA_LASBM_14, HWDATA_LASBM_13,
      HWDATA_LASBM_12, HWDATA_LASBM_11, HWDATA_LASBM_10, HWDATA_LASBM_9, HWDATA_LASBM_8,
      HWDATA_LASBM_7, HWDATA_LASBM_6, HWDATA_LASBM_5, HWDATA_LASBM_4, HWDATA_LASBM_3,
      HWDATA_LASBM_2, HWDATA_LASBM_1, HWDATA_LASBM_0;
input          HBURST_LASBM, HWRITE_LASBM, LASB_CLK, LASB_GSR, LASB_IRQ_MASTER;

output HRDATA_LASBM_35, HRDATA_LASBM_34, HRDATA_LASBM_33,
      HRDATA_LASBM_32, HRDATA_LASBM_31, HRDATA_LASBM_30, HRDATA_LASBM_29, HRDATA_LASBM_28,
      HRDATA_LASBM_27, HRDATA_LASBM_26, HRDATA_LASBM_25, HRDATA_LASBM_24, HRDATA_LASBM_23,
      HRDATA_LASBM_22, HRDATA_LASBM_21, HRDATA_LASBM_20, HRDATA_LASBM_19, HRDATA_LASBM_18,
      HRDATA_LASBM_17, HRDATA_LASBM_16, HRDATA_LASBM_15, HRDATA_LASBM_14, HRDATA_LASBM_13,
      HRDATA_LASBM_12, HRDATA_LASBM_11, HRDATA_LASBM_10, HRDATA_LASBM_9, HRDATA_LASBM_8,
      HRDATA_LASBM_7, HRDATA_LASBM_6, HRDATA_LASBM_5, HRDATA_LASBM_4, HRDATA_LASBM_3,
      HRDATA_LASBM_2, HRDATA_LASBM_1, HRDATA_LASBM_0;
output HRESP_LASBM_1, HRESP_LASBM_0;
output         HCLK_LASB, HREADY_LASB, HRESET_N_LASB, LASB_DONE, LASB_GSR_N,
               LASB_IRQ_OUT;

// Right ASB //
input HADDR_RASBM_17, HADDR_RASBM_16, HADDR_RASBM_15, HADDR_RASBM_14, HADDR_RASBM_13,
      HADDR_RASBM_12, HADDR_RASBM_11, HADDR_RASBM_10, HADDR_RASBM_9, HADDR_RASBM_8,
      HADDR_RASBM_7, HADDR_RASBM_6, HADDR_RASBM_5, HADDR_RASBM_4, HADDR_RASBM_3,
      HADDR_RASBM_2, HADDR_RASBM_1, HADDR_RASBM_0;
input HSIZE_RASBM_1, HSIZE_RASBM_0;
input HTRANS_RASBM_1, HTRANS_RASBM_0;
input HWDATA_RASBM_35, HWDATA_RASBM_34, HWDATA_RASBM_33,
      HWDATA_RASBM_32, HWDATA_RASBM_31, HWDATA_RASBM_30, HWDATA_RASBM_29, HWDATA_RASBM_28,
      HWDATA_RASBM_27, HWDATA_RASBM_26, HWDATA_RASBM_25, HWDATA_RASBM_24, HWDATA_RASBM_23,
      HWDATA_RASBM_22, HWDATA_RASBM_21, HWDATA_RASBM_20, HWDATA_RASBM_19, HWDATA_RASBM_18,
      HWDATA_RASBM_17, HWDATA_RASBM_16, HWDATA_RASBM_15, HWDATA_RASBM_14, HWDATA_RASBM_13,
      HWDATA_RASBM_12, HWDATA_RASBM_11, HWDATA_RASBM_10, HWDATA_RASBM_9, HWDATA_RASBM_8,
      HWDATA_RASBM_7, HWDATA_RASBM_6, HWDATA_RASBM_5, HWDATA_RASBM_4, HWDATA_RASBM_3,
      HWDATA_RASBM_2, HWDATA_RASBM_1, HWDATA_RASBM_0;
input          HBURST_RASBM, HWRITE_RASBM, RASB_CLK, RASB_GSR, RASB_IRQ_MASTER;

output HRDATA_RASBM_35, HRDATA_RASBM_34, HRDATA_RASBM_33,
      HRDATA_RASBM_32, HRDATA_RASBM_31, HRDATA_RASBM_30, HRDATA_RASBM_29, HRDATA_RASBM_28,
      HRDATA_RASBM_27, HRDATA_RASBM_26, HRDATA_RASBM_25, HRDATA_RASBM_24, HRDATA_RASBM_23,
      HRDATA_RASBM_22, HRDATA_RASBM_21, HRDATA_RASBM_20, HRDATA_RASBM_19, HRDATA_RASBM_18,
      HRDATA_RASBM_17, HRDATA_RASBM_16, HRDATA_RASBM_15, HRDATA_RASBM_14, HRDATA_RASBM_13,
      HRDATA_RASBM_12, HRDATA_RASBM_11, HRDATA_RASBM_10, HRDATA_RASBM_9, HRDATA_RASBM_8,
      HRDATA_RASBM_7, HRDATA_RASBM_6, HRDATA_RASBM_5, HRDATA_RASBM_4, HRDATA_RASBM_3,
      HRDATA_RASBM_2, HRDATA_RASBM_1, HRDATA_RASBM_0;
output HRESP_RASBM_1, HRESP_RASBM_0;
output         HCLK_RASB, HREADY_RASB, HRESET_N_RASB, RASB_DONE, RASB_GSR_N,
               RASB_IRQ_OUT;

// PCS  //
input          EXT_CLK_P1_IN, EXT_CLK_P2_IN, EXT_DONE_IN;
input QUAD_AND_FP0_7, QUAD_AND_FP0_6, QUAD_AND_FP0_5, QUAD_AND_FP0_4, QUAD_AND_FP0_3,
      QUAD_AND_FP0_2, QUAD_AND_FP0_1, QUAD_AND_FP0_0;
input QUAD_AND_FP1_7, QUAD_AND_FP1_6, QUAD_AND_FP1_5, QUAD_AND_FP1_4, QUAD_AND_FP1_3,
      QUAD_AND_FP1_2, QUAD_AND_FP1_1, QUAD_AND_FP1_0;
input QUAD_CLK_7, QUAD_CLK_6, QUAD_CLK_5, QUAD_CLK_4, QUAD_CLK_3,
      QUAD_CLK_2, QUAD_CLK_1, QUAD_CLK_0;
input QUAD_DONE_7, QUAD_DONE_6, QUAD_DONE_5, QUAD_DONE_4, QUAD_DONE_3,
      QUAD_DONE_2, QUAD_DONE_1, QUAD_DONE_0;
input QUAD_OR_FP0_7, QUAD_OR_FP0_6, QUAD_OR_FP0_5, QUAD_OR_FP0_4, QUAD_OR_FP0_3,
      QUAD_OR_FP0_2, QUAD_OR_FP0_1, QUAD_OR_FP0_0;
input QUAD_OR_FP1_7, QUAD_OR_FP1_6, QUAD_OR_FP1_5, QUAD_OR_FP1_4, QUAD_OR_FP1_3,
      QUAD_OR_FP1_2, QUAD_OR_FP1_1, QUAD_OR_FP1_0;
input QUAD_RST_N_7, QUAD_RST_N_6, QUAD_RST_N_5, QUAD_RST_N_4, QUAD_RST_N_3,
      QUAD_RST_N_2, QUAD_RST_N_1, QUAD_RST_N_0;
input QUAD_START_7, QUAD_START_6, QUAD_START_5, QUAD_START_4, QUAD_START_3,
      QUAD_START_2, QUAD_START_1, QUAD_START_0;

output         EXT_CLK_P1_OUT, EXT_CLK_P2_OUT, EXT_DONE_OUT;
output GRP_CLK_P1_L_3, GRP_CLK_P1_L_2, GRP_CLK_P1_L_1, GRP_CLK_P1_L_0;
output GRP_CLK_P2_L_3, GRP_CLK_P2_L_2, GRP_CLK_P2_L_1, GRP_CLK_P2_L_0;
output GRP_DESKEW_ERROR_L_3, GRP_DESKEW_ERROR_L_2, GRP_DESKEW_ERROR_L_1, GRP_DESKEW_ERROR_L_0;
output GRP_DONE_L_3, GRP_DONE_L_2, GRP_DONE_L_1, GRP_DONE_L_0;
output GRP_START_L_3, GRP_START_L_2, GRP_START_L_1, GRP_START_L_0;
output GRP_CLK_P1_R_3, GRP_CLK_P1_R_2, GRP_CLK_P1_R_1, GRP_CLK_P1_R_0;
output GRP_CLK_P2_R_3, GRP_CLK_P2_R_2, GRP_CLK_P2_R_1, GRP_CLK_P2_R_0;
output GRP_DESKEW_ERROR_R_3, GRP_DESKEW_ERROR_R_2, GRP_DESKEW_ERROR_R_1, GRP_DESKEW_ERROR_R_0;
output GRP_DONE_R_3, GRP_DONE_R_2, GRP_DONE_R_1, GRP_DONE_R_0;
output GRP_START_R_3, GRP_START_R_2, GRP_START_R_1, GRP_START_R_0;

// LPCS  //
input LPCS_INT_3, LPCS_INT_2, LPCS_INT_1, LPCS_INT_0;
input LPCS_RDATA_Q0_7, LPCS_RDATA_Q0_6, LPCS_RDATA_Q0_5, LPCS_RDATA_Q0_4,
      LPCS_RDATA_Q0_3, LPCS_RDATA_Q0_2, LPCS_RDATA_Q0_1, LPCS_RDATA_Q0_0;
input LPCS_RDATA_Q1_7, LPCS_RDATA_Q1_6, LPCS_RDATA_Q1_5, LPCS_RDATA_Q1_4,
      LPCS_RDATA_Q1_3, LPCS_RDATA_Q1_2, LPCS_RDATA_Q1_1, LPCS_RDATA_Q1_0;
input LPCS_RDATA_Q2_7, LPCS_RDATA_Q2_6, LPCS_RDATA_Q2_5, LPCS_RDATA_Q2_4,
      LPCS_RDATA_Q2_3, LPCS_RDATA_Q2_2, LPCS_RDATA_Q2_1, LPCS_RDATA_Q2_0;
input LPCS_RDATA_Q3_7, LPCS_RDATA_Q3_6, LPCS_RDATA_Q3_5, LPCS_RDATA_Q3_4,
      LPCS_RDATA_Q3_3, LPCS_RDATA_Q3_2, LPCS_RDATA_Q3_1, LPCS_RDATA_Q3_0;

output LPCS_ADDR_7, LPCS_ADDR_6, LPCS_ADDR_5, LPCS_ADDR_4,
      LPCS_ADDR_3, LPCS_ADDR_2, LPCS_ADDR_1, LPCS_ADDR_0;
output LPCS_WDATA_7, LPCS_WDATA_6, LPCS_WDATA_5, LPCS_WDATA_4,
      LPCS_WDATA_3, LPCS_WDATA_2, LPCS_WDATA_1, LPCS_WDATA_0;
output LPCS_C_15, LPCS_C_14, LPCS_C_13, LPCS_C_12,
      LPCS_C_11, LPCS_C_10, LPCS_C_9, LPCS_C_8,
      LPCS_C_7, LPCS_C_6, LPCS_C_5, LPCS_C_4,
      LPCS_C_3, LPCS_C_2, LPCS_C_1, LPCS_C_0;
output LPCS_Q_3, LPCS_Q_2, LPCS_Q_1, LPCS_Q_0;
output         LPCS_RD, LPCS_WSTB;
output LPCS_QUAD_ID0_1, LPCS_QUAD_ID0_0;
output LPCS_QUAD_ID1_1, LPCS_QUAD_ID1_0;
output LPCS_QUAD_ID2_1, LPCS_QUAD_ID2_0;
output LPCS_QUAD_ID3_1, LPCS_QUAD_ID3_0;

// RPCS  //
input RPCS_INT_3, RPCS_INT_2, RPCS_INT_1, RPCS_INT_0;
input RPCS_RDATA_Q0_7, RPCS_RDATA_Q0_6, RPCS_RDATA_Q0_5, RPCS_RDATA_Q0_4,
      RPCS_RDATA_Q0_3, RPCS_RDATA_Q0_2, RPCS_RDATA_Q0_1, RPCS_RDATA_Q0_0;
input RPCS_RDATA_Q1_7, RPCS_RDATA_Q1_6, RPCS_RDATA_Q1_5, RPCS_RDATA_Q1_4,
      RPCS_RDATA_Q1_3, RPCS_RDATA_Q1_2, RPCS_RDATA_Q1_1, RPCS_RDATA_Q1_0;
input RPCS_RDATA_Q2_7, RPCS_RDATA_Q2_6, RPCS_RDATA_Q2_5, RPCS_RDATA_Q2_4,
      RPCS_RDATA_Q2_3, RPCS_RDATA_Q2_2, RPCS_RDATA_Q2_1, RPCS_RDATA_Q2_0;
input RPCS_RDATA_Q3_7, RPCS_RDATA_Q3_6, RPCS_RDATA_Q3_5, RPCS_RDATA_Q3_4,
      RPCS_RDATA_Q3_3, RPCS_RDATA_Q3_2, RPCS_RDATA_Q3_1, RPCS_RDATA_Q3_0;

output RPCS_ADDR_7, RPCS_ADDR_6, RPCS_ADDR_5, RPCS_ADDR_4,
      RPCS_ADDR_3, RPCS_ADDR_2, RPCS_ADDR_1, RPCS_ADDR_0;
output RPCS_WDATA_7, RPCS_WDATA_6, RPCS_WDATA_5, RPCS_WDATA_4,
      RPCS_WDATA_3, RPCS_WDATA_2, RPCS_WDATA_1, RPCS_WDATA_0;
output RPCS_C_15, RPCS_C_14, RPCS_C_13, RPCS_C_12,
      RPCS_C_11, RPCS_C_10, RPCS_C_9, RPCS_C_8,
      RPCS_C_7, RPCS_C_6, RPCS_C_5, RPCS_C_4,
      RPCS_C_3, RPCS_C_2, RPCS_C_1, RPCS_C_0;
output RPCS_Q_3, RPCS_Q_2, RPCS_Q_1, RPCS_Q_0;
output         RPCS_RD, RPCS_WSTB;
output RPCS_QUAD_ID0_1, RPCS_QUAD_ID0_0;
output RPCS_QUAD_ID1_1, RPCS_QUAD_ID1_0;
output RPCS_QUAD_ID2_1, RPCS_QUAD_ID2_0;
output RPCS_QUAD_ID3_1, RPCS_QUAD_ID3_0;

// DMA //

input DMA_RD_DATA_31, DMA_RD_DATA_30, DMA_RD_DATA_29, DMA_RD_DATA_28,
      DMA_RD_DATA_27, DMA_RD_DATA_26, DMA_RD_DATA_25, DMA_RD_DATA_24, DMA_RD_DATA_23,
      DMA_RD_DATA_22, DMA_RD_DATA_21, DMA_RD_DATA_20, DMA_RD_DATA_19, DMA_RD_DATA_18,
      DMA_RD_DATA_17, DMA_RD_DATA_16, DMA_RD_DATA_15, DMA_RD_DATA_14, DMA_RD_DATA_13,
      DMA_RD_DATA_12, DMA_RD_DATA_11, DMA_RD_DATA_10, DMA_RD_DATA_9, DMA_RD_DATA_8,
      DMA_RD_DATA_7, DMA_RD_DATA_6, DMA_RD_DATA_5, DMA_RD_DATA_4, DMA_RD_DATA_3,
      DMA_RD_DATA_2, DMA_RD_DATA_1, DMA_RD_DATA_0;
input DMA_RD_PARITY_3, DMA_RD_PARITY_2, DMA_RD_PARITY_1, DMA_RD_PARITY_0;
input          DMA_RETRY, DMA_TA, DMA_TEA, DMA_TRI_CTL, DMA_TRI_DATA;


//synopsys translate_off
parameter SYSBUS_CONFIG_FILE = #_circuit_name_new;
parameter MPI_PARITY = "DISABLED";
parameter MPI_BUS_WIDTH = 8;
parameter SYS_CLK_SEL = "MPI";
parameter MPI_PRIORITY = "LOW";
parameter FPGA_PRIORITY = "LOW";
parameter MPI_RST = "DISABLED";
parameter MASTER_RST = "DISABLED";
parameter PARITY = "EVEN";
parameter MPI_SYNCMODE = "SYNC";
parameter MASTER_SYNCMODE = "ASYNC";
parameter MASTER_AUTORETRY = "ENABLED";
parameter SLAVE_SYNCMODE = "ASYNC";
parameter INTERRUPT_VECTOR1 = 32'b00000000000000000000000000000000;
parameter INTERRUPT_VECTOR2 = 32'b00000000000000000000000000000000;
parameter INTERRUPT_VECTOR3 = 32'b00000000000000000000000000000000;
parameter INTERRUPT_VECTOR4 = 32'b00000000000000000000000000000000;
parameter INTERRUPT_VECTOR5 = 32'b00000000000000000000000000000000;
parameter INTERRUPT_VECTOR6 = 32'b00000000000000000000000000000000;

  defparam SYSBUSA_sim_inst.SYSBUS_CONFIG_FILE = SYSBUS_CONFIG_FILE;
  defparam SYSBUSA_sim_inst.MPI_PARITY = MPI_PARITY;
  defparam SYSBUSA_sim_inst.MPI_BUS_WIDTH = MPI_BUS_WIDTH;
  defparam SYSBUSA_sim_inst.SYS_CLK_SEL = SYS_CLK_SEL;
  defparam SYSBUSA_sim_inst.MPI_PRIORITY = MPI_PRIORITY;
  defparam SYSBUSA_sim_inst.FPGA_PRIORITY = FPGA_PRIORITY;
  defparam SYSBUSA_sim_inst.MPI_RST = MPI_RST;
  defparam SYSBUSA_sim_inst.MASTER_RST = MASTER_RST;
  defparam SYSBUSA_sim_inst.PARITY = PARITY;
  defparam SYSBUSA_sim_inst.MPI_SYNCMODE = MPI_SYNCMODE;
  defparam SYSBUSA_sim_inst.MASTER_SYNCMODE = MASTER_SYNCMODE;
  defparam SYSBUSA_sim_inst.MASTER_AUTORETRY = MASTER_AUTORETRY;
  defparam SYSBUSA_sim_inst.SLAVE_SYNCMODE = SLAVE_SYNCMODE;
  defparam SYSBUSA_sim_inst.INTERRUPT_VECTOR1 = INTERRUPT_VECTOR1;
  defparam SYSBUSA_sim_inst.INTERRUPT_VECTOR2 = INTERRUPT_VECTOR2;
  defparam SYSBUSA_sim_inst.INTERRUPT_VECTOR3 = INTERRUPT_VECTOR3;
  defparam SYSBUSA_sim_inst.INTERRUPT_VECTOR4 = INTERRUPT_VECTOR4;
  defparam SYSBUSA_sim_inst.INTERRUPT_VECTOR5 = INTERRUPT_VECTOR5;
  defparam SYSBUSA_sim_inst.INTERRUPT_VECTOR6 = INTERRUPT_VECTOR6;

SYSBUSA_sim SYSBUSA_sim_inst (
  .CS0_N            (CS0_N),
  .CS1              (CS1),
  .MPI_CLK          (MPI_CLK),
  .MPI_WR_N         (MPI_WR_N),
  .MPI_STRB_N       (MPI_STRB_N),
  .MPI_BURST        (MPI_BURST),
  .MPI_BDIP         (MPI_BDIP),
  .MPI_RST_N        (MPI_RST_N),
  .USR_CLK          (USR_CLK),
  .USER_IRQ_IN      (USER_IRQ_IN),
  .SYS_RST_N        (SYS_RST_N),
  .MPI_TSIZ_1       (MPI_TSIZ_1),
  .MPI_TSIZ_0       (MPI_TSIZ_0),
  .MPI_ADDR_14      (MPI_ADDR_14),
  .MPI_ADDR_15      (MPI_ADDR_15),
  .MPI_ADDR_16      (MPI_ADDR_16),
  .MPI_ADDR_17      (MPI_ADDR_17),
  .MPI_ADDR_18      (MPI_ADDR_18),
  .MPI_ADDR_19      (MPI_ADDR_19),
  .MPI_ADDR_20      (MPI_ADDR_20),
  .MPI_ADDR_21      (MPI_ADDR_21),
  .MPI_ADDR_22      (MPI_ADDR_22),
  .MPI_ADDR_23      (MPI_ADDR_23),
  .MPI_ADDR_24      (MPI_ADDR_24),
  .MPI_ADDR_25      (MPI_ADDR_25),
  .MPI_ADDR_26      (MPI_ADDR_26),
  .MPI_ADDR_27      (MPI_ADDR_27),
  .MPI_ADDR_28      (MPI_ADDR_28),
  .MPI_ADDR_29      (MPI_ADDR_29),
  .MPI_ADDR_30      (MPI_ADDR_30),
  .MPI_ADDR_31      (MPI_ADDR_31),
  .MPI_WR_DATA_31   (MPI_WR_DATA_31),
  .MPI_WR_DATA_30   (MPI_WR_DATA_30),
  .MPI_WR_DATA_29   (MPI_WR_DATA_29),
  .MPI_WR_DATA_28   (MPI_WR_DATA_28),
  .MPI_WR_DATA_27   (MPI_WR_DATA_27),
  .MPI_WR_DATA_26   (MPI_WR_DATA_26),
  .MPI_WR_DATA_25   (MPI_WR_DATA_25),
  .MPI_WR_DATA_24   (MPI_WR_DATA_24),
  .MPI_WR_DATA_23   (MPI_WR_DATA_23),
  .MPI_WR_DATA_22   (MPI_WR_DATA_22),
  .MPI_WR_DATA_21   (MPI_WR_DATA_21),
  .MPI_WR_DATA_20   (MPI_WR_DATA_20),
  .MPI_WR_DATA_19   (MPI_WR_DATA_19),
  .MPI_WR_DATA_18   (MPI_WR_DATA_18),
  .MPI_WR_DATA_17   (MPI_WR_DATA_17),
  .MPI_WR_DATA_16   (MPI_WR_DATA_16),
  .MPI_WR_DATA_15   (MPI_WR_DATA_15),
  .MPI_WR_DATA_14   (MPI_WR_DATA_14),
  .MPI_WR_DATA_13   (MPI_WR_DATA_13),
  .MPI_WR_DATA_12   (MPI_WR_DATA_12),
  .MPI_WR_DATA_11   (MPI_WR_DATA_11),
  .MPI_WR_DATA_10   (MPI_WR_DATA_10),
  .MPI_WR_DATA_9    (MPI_WR_DATA_9),
  .MPI_WR_DATA_8    (MPI_WR_DATA_8),
  .MPI_WR_DATA_7    (MPI_WR_DATA_7),
  .MPI_WR_DATA_6    (MPI_WR_DATA_6),
  .MPI_WR_DATA_5    (MPI_WR_DATA_5),
  .MPI_WR_DATA_4    (MPI_WR_DATA_4),
  .MPI_WR_DATA_3    (MPI_WR_DATA_3),
  .MPI_WR_DATA_2    (MPI_WR_DATA_2),
  .MPI_WR_DATA_1    (MPI_WR_DATA_1),
  .MPI_WR_DATA_0    (MPI_WR_DATA_0),
  .MPI_WR_PARITY_3  (MPI_WR_PARITY_3),
  .MPI_WR_PARITY_2  (MPI_WR_PARITY_2),
  .MPI_WR_PARITY_1  (MPI_WR_PARITY_1),
  .MPI_WR_PARITY_0  (MPI_WR_PARITY_0),
  .MPI_TA           (MPI_TA),
  .MPI_RETRY        (MPI_RETRY),
  .MPI_TEA          (MPI_TEA),
  .PD2_0_TS         (PD2_0_TS),
  .PD7_3_TS         (PD7_3_TS),
  .PD15_8_TS        (PD15_8_TS),
  .PD31_16_TS       (PD31_16_TS),
  .MPI_IRQ_N        (MPI_IRQ_N),
  .MPI_CNTL_TS      (MPI_CNTL_TS),
  .USER_IRQ_OUT     (USER_IRQ_OUT),
  .HCLK_CIB         (HCLK_CIB),
  .MPI_RD_DATA_31   (MPI_RD_DATA_31),
  .MPI_RD_DATA_30   (MPI_RD_DATA_30),
  .MPI_RD_DATA_29   (MPI_RD_DATA_29),
  .MPI_RD_DATA_28   (MPI_RD_DATA_28),
  .MPI_RD_DATA_27   (MPI_RD_DATA_27),
  .MPI_RD_DATA_26   (MPI_RD_DATA_26),
  .MPI_RD_DATA_25   (MPI_RD_DATA_25),
  .MPI_RD_DATA_24   (MPI_RD_DATA_24),
  .MPI_RD_DATA_23   (MPI_RD_DATA_23),
  .MPI_RD_DATA_22   (MPI_RD_DATA_22),
  .MPI_RD_DATA_21   (MPI_RD_DATA_21),
  .MPI_RD_DATA_20   (MPI_RD_DATA_20),
  .MPI_RD_DATA_19   (MPI_RD_DATA_19),
  .MPI_RD_DATA_18   (MPI_RD_DATA_18),
  .MPI_RD_DATA_17   (MPI_RD_DATA_17),
  .MPI_RD_DATA_16   (MPI_RD_DATA_16),
  .MPI_RD_DATA_15   (MPI_RD_DATA_15),
  .MPI_RD_DATA_14   (MPI_RD_DATA_14),
  .MPI_RD_DATA_13   (MPI_RD_DATA_13),
  .MPI_RD_DATA_12   (MPI_RD_DATA_12),
  .MPI_RD_DATA_11   (MPI_RD_DATA_11),
  .MPI_RD_DATA_10   (MPI_RD_DATA_10),
  .MPI_RD_DATA_9    (MPI_RD_DATA_9),
  .MPI_RD_DATA_8    (MPI_RD_DATA_8),
  .MPI_RD_DATA_7    (MPI_RD_DATA_7),
  .MPI_RD_DATA_6    (MPI_RD_DATA_6),
  .MPI_RD_DATA_5    (MPI_RD_DATA_5),
  .MPI_RD_DATA_4    (MPI_RD_DATA_4),
  .MPI_RD_DATA_3    (MPI_RD_DATA_3),
  .MPI_RD_DATA_2    (MPI_RD_DATA_2),
  .MPI_RD_DATA_1    (MPI_RD_DATA_1),
  .MPI_RD_DATA_0    (MPI_RD_DATA_0),
  .MPI_RD_PARITY_3  (MPI_RD_PARITY_3),
  .MPI_RD_PARITY_2  (MPI_RD_PARITY_2),
  .MPI_RD_PARITY_1  (MPI_RD_PARITY_1),
  .MPI_RD_PARITY_0  (MPI_RD_PARITY_0),
  .MPI_DP_TS_0      (MPI_DP_TS_0),
  .MPI_DP_TS_1      (MPI_DP_TS_1),
  .MPI_DP_TS_2      (MPI_DP_TS_2),
  .SMI_RDATA_63     (SMI_RDATA_63),
  .SMI_RDATA_62     (SMI_RDATA_62),
  .SMI_RDATA_61     (SMI_RDATA_61),
  .SMI_RDATA_60     (SMI_RDATA_60),
  .SMI_RDATA_59     (SMI_RDATA_59),
  .SMI_RDATA_58     (SMI_RDATA_58),
  .SMI_RDATA_57     (SMI_RDATA_57),
  .SMI_RDATA_56     (SMI_RDATA_56),
  .SMI_RDATA_55     (SMI_RDATA_55),
  .SMI_RDATA_54     (SMI_RDATA_54),
  .SMI_RDATA_53     (SMI_RDATA_53),
  .SMI_RDATA_52     (SMI_RDATA_52),
  .SMI_RDATA_51     (SMI_RDATA_51),
  .SMI_RDATA_50     (SMI_RDATA_50),
  .SMI_RDATA_49     (SMI_RDATA_49),
  .SMI_RDATA_48     (SMI_RDATA_48),
  .SMI_RDATA_47     (SMI_RDATA_47),
  .SMI_RDATA_46     (SMI_RDATA_46),
  .SMI_RDATA_45     (SMI_RDATA_45),
  .SMI_RDATA_44     (SMI_RDATA_44),
  .SMI_RDATA_43     (SMI_RDATA_43),
  .SMI_RDATA_42     (SMI_RDATA_42),
  .SMI_RDATA_41     (SMI_RDATA_41),
  .SMI_RDATA_40     (SMI_RDATA_40),
  .SMI_RDATA_39     (SMI_RDATA_39),
  .SMI_RDATA_38     (SMI_RDATA_38),
  .SMI_RDATA_37     (SMI_RDATA_37),
  .SMI_RDATA_36     (SMI_RDATA_36),
  .SMI_RDATA_35     (SMI_RDATA_35),
  .SMI_RDATA_34     (SMI_RDATA_34),
  .SMI_RDATA_33     (SMI_RDATA_33),
  .SMI_RDATA_32     (SMI_RDATA_32),
  .SMI_RDATA_31     (SMI_RDATA_31),
  .SMI_RDATA_30     (SMI_RDATA_30),
  .SMI_RDATA_29     (SMI_RDATA_29),
  .SMI_RDATA_28     (SMI_RDATA_28),
  .SMI_RDATA_27     (SMI_RDATA_27),
  .SMI_RDATA_26     (SMI_RDATA_26),
  .SMI_RDATA_25     (SMI_RDATA_25),
  .SMI_RDATA_24     (SMI_RDATA_24),
  .SMI_RDATA_23     (SMI_RDATA_23),
  .SMI_RDATA_22     (SMI_RDATA_22),
  .SMI_RDATA_21     (SMI_RDATA_21),
  .SMI_RDATA_20     (SMI_RDATA_20),
  .SMI_RDATA_19     (SMI_RDATA_19),
  .SMI_RDATA_18     (SMI_RDATA_18),
  .SMI_RDATA_17     (SMI_RDATA_17),
  .SMI_RDATA_16     (SMI_RDATA_16),
  .SMI_RDATA_15     (SMI_RDATA_15),
  .SMI_RDATA_14     (SMI_RDATA_14),
  .SMI_RDATA_13     (SMI_RDATA_13),
  .SMI_RDATA_12     (SMI_RDATA_12),
  .SMI_RDATA_11     (SMI_RDATA_11),
  .SMI_RDATA_10     (SMI_RDATA_10),
  .SMI_RDATA_9      (SMI_RDATA_9),
  .SMI_RDATA_8      (SMI_RDATA_8),
  .SMI_RDATA_7      (SMI_RDATA_7),
  .SMI_RDATA_6      (SMI_RDATA_6),
  .SMI_RDATA_5      (SMI_RDATA_5),
  .SMI_RDATA_4      (SMI_RDATA_4),
  .SMI_RDATA_3      (SMI_RDATA_3),
  .SMI_RDATA_2      (SMI_RDATA_2),
  .SMI_RDATA_1      (SMI_RDATA_1),
  .SMI_RDATA_0      (SMI_RDATA_0),
  .SMI_ADDR_9       (SMI_ADDR_9),
  .SMI_ADDR_8       (SMI_ADDR_8),
  .SMI_ADDR_7       (SMI_ADDR_7),
  .SMI_ADDR_6       (SMI_ADDR_6),
  .SMI_ADDR_5       (SMI_ADDR_5),
  .SMI_ADDR_4       (SMI_ADDR_4),
  .SMI_ADDR_3       (SMI_ADDR_3),
  .SMI_ADDR_2       (SMI_ADDR_2),
  .SMI_ADDR_1       (SMI_ADDR_1),
  .SMI_ADDR_0       (SMI_ADDR_0),
  .SMI_CLK          (SMI_CLK),
  .SMI_RD           (SMI_RD),
  .SMI_RST_N        (SMI_RST_N),
  .SMI_WDATA        (SMI_WDATA),
  .SMI_WR           (SMI_WR),
  .FMADDR_17        (FMADDR_17),
  .FMADDR_16        (FMADDR_16),
  .FMADDR_15        (FMADDR_15),
  .FMADDR_14        (FMADDR_14),
  .FMADDR_13        (FMADDR_13),
  .FMADDR_12        (FMADDR_12),
  .FMADDR_11        (FMADDR_11),
  .FMADDR_10        (FMADDR_10),
  .FMADDR_9         (FMADDR_9),
  .FMADDR_8         (FMADDR_8),
  .FMADDR_7         (FMADDR_7),
  .FMADDR_6         (FMADDR_6),
  .FMADDR_5         (FMADDR_5),
  .FMADDR_4         (FMADDR_4),
  .FMADDR_3         (FMADDR_3),
  .FMADDR_2         (FMADDR_2),
  .FMADDR_1         (FMADDR_1),
  .FMADDR_0         (FMADDR_0),
  .FMWDATA_35       (FMWDATA_35),
  .FMWDATA_34       (FMWDATA_34),
  .FMWDATA_33       (FMWDATA_33),
  .FMWDATA_32       (FMWDATA_32),
  .FMWDATA_31       (FMWDATA_31),
  .FMWDATA_30       (FMWDATA_30),
  .FMWDATA_29       (FMWDATA_29),
  .FMWDATA_28       (FMWDATA_28),
  .FMWDATA_27       (FMWDATA_27),
  .FMWDATA_26       (FMWDATA_26),
  .FMWDATA_25       (FMWDATA_25),
  .FMWDATA_24       (FMWDATA_24),
  .FMWDATA_23       (FMWDATA_23),
  .FMWDATA_22       (FMWDATA_22),
  .FMWDATA_21       (FMWDATA_21),
  .FMWDATA_20       (FMWDATA_20),
  .FMWDATA_19       (FMWDATA_19),
  .FMWDATA_18       (FMWDATA_18),
  .FMWDATA_17       (FMWDATA_17),
  .FMWDATA_16       (FMWDATA_16),
  .FMWDATA_15       (FMWDATA_15),
  .FMWDATA_14       (FMWDATA_14),
  .FMWDATA_13       (FMWDATA_13),
  .FMWDATA_12       (FMWDATA_12),
  .FMWDATA_11       (FMWDATA_11),
  .FMWDATA_10       (FMWDATA_10),
  .FMWDATA_9        (FMWDATA_9),
  .FMWDATA_8        (FMWDATA_8),
  .FMWDATA_7        (FMWDATA_7),
  .FMWDATA_6        (FMWDATA_6),
  .FMWDATA_5        (FMWDATA_5),
  .FMWDATA_4        (FMWDATA_4),
  .FMWDATA_3        (FMWDATA_3),
  .FMWDATA_2        (FMWDATA_2),
  .FMWDATA_1        (FMWDATA_1),
  .FMWDATA_0        (FMWDATA_0),
  .FMSIZE_0         (FMSIZE_0),
  .FMSIZE_1         (FMSIZE_1),
  .FMCLK            (FMCLK),
  .FMRESET_N        (FMRESET_N),
  .FMWRN            (FMWRN),
  .FMBURST          (FMBURST),
  .FMRDY            (FMRDY),
  .FMLOCK           (FMLOCK),
  .FMIRQ            (FMIRQ),
  .FMRDATA_35       (FMRDATA_35),
  .FMRDATA_34       (FMRDATA_34),
  .FMRDATA_33       (FMRDATA_33),
  .FMRDATA_32       (FMRDATA_32),
  .FMRDATA_31       (FMRDATA_31),
  .FMRDATA_30       (FMRDATA_30),
  .FMRDATA_29       (FMRDATA_29),
  .FMRDATA_28       (FMRDATA_28),
  .FMRDATA_27       (FMRDATA_27),
  .FMRDATA_26       (FMRDATA_26),
  .FMRDATA_25       (FMRDATA_25),
  .FMRDATA_24       (FMRDATA_24),
  .FMRDATA_23       (FMRDATA_23),
  .FMRDATA_22       (FMRDATA_22),
  .FMRDATA_21       (FMRDATA_21),
  .FMRDATA_20       (FMRDATA_20),
  .FMRDATA_19       (FMRDATA_19),
  .FMRDATA_18       (FMRDATA_18),
  .FMRDATA_17       (FMRDATA_17),
  .FMRDATA_16       (FMRDATA_16),
  .FMRDATA_15       (FMRDATA_15),
  .FMRDATA_14       (FMRDATA_14),
  .FMRDATA_13       (FMRDATA_13),
  .FMRDATA_12       (FMRDATA_12),
  .FMRDATA_11       (FMRDATA_11),
  .FMRDATA_10       (FMRDATA_10),
  .FMRDATA_9        (FMRDATA_9),
  .FMRDATA_8        (FMRDATA_8),
  .FMRDATA_7        (FMRDATA_7),
  .FMRDATA_6        (FMRDATA_6),
  .FMRDATA_5        (FMRDATA_5),
  .FMRDATA_4        (FMRDATA_4),
  .FMRDATA_3        (FMRDATA_3),
  .FMRDATA_2        (FMRDATA_2),
  .FMRDATA_1        (FMRDATA_1),
  .FMRDATA_0        (FMRDATA_0),
  .FMACK            (FMACK),
  .FMRETRY          (FMRETRY),
  .FMERR            (FMERR),
  .FSRDATA_35       (FSRDATA_35),
  .FSRDATA_34       (FSRDATA_34),
  .FSRDATA_33       (FSRDATA_33),
  .FSRDATA_32       (FSRDATA_32),
  .FSRDATA_31       (FSRDATA_31),
  .FSRDATA_30       (FSRDATA_30),
  .FSRDATA_29       (FSRDATA_29),
  .FSRDATA_28       (FSRDATA_28),
  .FSRDATA_27       (FSRDATA_27),
  .FSRDATA_26       (FSRDATA_26),
  .FSRDATA_25       (FSRDATA_25),
  .FSRDATA_24       (FSRDATA_24),
  .FSRDATA_23       (FSRDATA_23),
  .FSRDATA_22       (FSRDATA_22),
  .FSRDATA_21       (FSRDATA_21),
  .FSRDATA_20       (FSRDATA_20),
  .FSRDATA_19       (FSRDATA_19),
  .FSRDATA_18       (FSRDATA_18),
  .FSRDATA_17       (FSRDATA_17),
  .FSRDATA_16       (FSRDATA_16),
  .FSRDATA_15       (FSRDATA_15),
  .FSRDATA_14       (FSRDATA_14),
  .FSRDATA_13       (FSRDATA_13),
  .FSRDATA_12       (FSRDATA_12),
  .FSRDATA_11       (FSRDATA_11),
  .FSRDATA_10       (FSRDATA_10),
  .FSRDATA_9        (FSRDATA_9),
  .FSRDATA_8        (FSRDATA_8),
  .FSRDATA_7        (FSRDATA_7),
  .FSRDATA_6        (FSRDATA_6),
  .FSRDATA_5        (FSRDATA_5),
  .FSRDATA_4        (FSRDATA_4),
  .FSRDATA_3        (FSRDATA_3),
  .FSRDATA_2        (FSRDATA_2),
  .FSRDATA_1        (FSRDATA_1),
  .FSRDATA_0        (FSRDATA_0),
  .FSCLK            (FSCLK),
  .FSRESET_N        (FSRESET_N),
  .FSACK            (FSACK),
  .FSRETRY          (FSRETRY),
  .FSERR            (FSERR),
  .FSIRQ            (FSIRQ),
  .FSWDATA_35       (FSWDATA_35),
  .FSWDATA_34       (FSWDATA_34),
  .FSWDATA_33       (FSWDATA_33),
  .FSWDATA_32       (FSWDATA_32),
  .FSWDATA_31       (FSWDATA_31),
  .FSWDATA_30       (FSWDATA_30),
  .FSWDATA_29       (FSWDATA_29),
  .FSWDATA_28       (FSWDATA_28),
  .FSWDATA_27       (FSWDATA_27),
  .FSWDATA_26       (FSWDATA_26),
  .FSWDATA_25       (FSWDATA_25),
  .FSWDATA_24       (FSWDATA_24),
  .FSWDATA_23       (FSWDATA_23),
  .FSWDATA_22       (FSWDATA_22),
  .FSWDATA_21       (FSWDATA_21),
  .FSWDATA_20       (FSWDATA_20),
  .FSWDATA_19       (FSWDATA_19),
  .FSWDATA_18       (FSWDATA_18),
  .FSWDATA_17       (FSWDATA_17),
  .FSWDATA_16       (FSWDATA_16),
  .FSWDATA_15       (FSWDATA_15),
  .FSWDATA_14       (FSWDATA_14),
  .FSWDATA_13       (FSWDATA_13),
  .FSWDATA_12       (FSWDATA_12),
  .FSWDATA_11       (FSWDATA_11),
  .FSWDATA_10       (FSWDATA_10),
  .FSWDATA_9        (FSWDATA_9),
  .FSWDATA_8        (FSWDATA_8),
  .FSWDATA_7        (FSWDATA_7),
  .FSWDATA_6        (FSWDATA_6),
  .FSWDATA_5        (FSWDATA_5),
  .FSWDATA_4        (FSWDATA_4),
  .FSWDATA_3        (FSWDATA_3),
  .FSWDATA_2        (FSWDATA_2),
  .FSWDATA_1        (FSWDATA_1),
  .FSWDATA_0        (FSWDATA_0),
  .FSADDR_17        (FSADDR_17),
  .FSADDR_16        (FSADDR_16),
  .FSADDR_15        (FSADDR_15),
  .FSADDR_14        (FSADDR_14),
  .FSADDR_13        (FSADDR_13),
  .FSADDR_12        (FSADDR_12),
  .FSADDR_11        (FSADDR_11),
  .FSADDR_10        (FSADDR_10),
  .FSADDR_9         (FSADDR_9),
  .FSADDR_8         (FSADDR_8),
  .FSADDR_7         (FSADDR_7),
  .FSADDR_6         (FSADDR_6),
  .FSADDR_5         (FSADDR_5),
  .FSADDR_4         (FSADDR_4),
  .FSADDR_3         (FSADDR_3),
  .FSADDR_2         (FSADDR_2),
  .FSADDR_1         (FSADDR_1),
  .FSADDR_0         (FSADDR_0),
  .FSSIZE_0         (FSSIZE_0),
  .FSSIZE_1         (FSSIZE_1),
  .FSRDY            (FSRDY),
  .FSWRN            (FSWRN),
  .HADDR_LASBM_17   (HADDR_LASBM_17),
  .HADDR_LASBM_16   (HADDR_LASBM_16),
  .HADDR_LASBM_15   (HADDR_LASBM_15),
  .HADDR_LASBM_14   (HADDR_LASBM_14),
  .HADDR_LASBM_13   (HADDR_LASBM_13),
  .HADDR_LASBM_12   (HADDR_LASBM_12),
  .HADDR_LASBM_11   (HADDR_LASBM_11),
  .HADDR_LASBM_10   (HADDR_LASBM_10),
  .HADDR_LASBM_9    (HADDR_LASBM_9),
  .HADDR_LASBM_8    (HADDR_LASBM_8),
  .HADDR_LASBM_7    (HADDR_LASBM_7),
  .HADDR_LASBM_6    (HADDR_LASBM_6),
  .HADDR_LASBM_5    (HADDR_LASBM_5),
  .HADDR_LASBM_4    (HADDR_LASBM_4),
  .HADDR_LASBM_3    (HADDR_LASBM_3),
  .HADDR_LASBM_2    (HADDR_LASBM_2),
  .HADDR_LASBM_1    (HADDR_LASBM_1),
  .HADDR_LASBM_0    (HADDR_LASBM_0),
  .HSIZE_LASBM_1    (HSIZE_LASBM_1),
  .HSIZE_LASBM_0    (HSIZE_LASBM_0),
  .HTRANS_LASBM_1   (HTRANS_LASBM_1),
  .HTRANS_LASBM_0   (HTRANS_LASBM_0),
  .HWDATA_LASBM_35  (HWDATA_LASBM_35),
  .HWDATA_LASBM_34  (HWDATA_LASBM_34),
  .HWDATA_LASBM_33  (HWDATA_LASBM_33),
  .HWDATA_LASBM_32  (HWDATA_LASBM_32),
  .HWDATA_LASBM_31  (HWDATA_LASBM_31),
  .HWDATA_LASBM_30  (HWDATA_LASBM_30),
  .HWDATA_LASBM_29  (HWDATA_LASBM_29),
  .HWDATA_LASBM_28  (HWDATA_LASBM_28),
  .HWDATA_LASBM_27  (HWDATA_LASBM_27),
  .HWDATA_LASBM_26  (HWDATA_LASBM_26),
  .HWDATA_LASBM_25  (HWDATA_LASBM_25),
  .HWDATA_LASBM_24  (HWDATA_LASBM_24),
  .HWDATA_LASBM_23  (HWDATA_LASBM_23),
  .HWDATA_LASBM_22  (HWDATA_LASBM_22),
  .HWDATA_LASBM_21  (HWDATA_LASBM_21),
  .HWDATA_LASBM_20  (HWDATA_LASBM_20),
  .HWDATA_LASBM_19  (HWDATA_LASBM_19),
  .HWDATA_LASBM_18  (HWDATA_LASBM_18),
  .HWDATA_LASBM_17  (HWDATA_LASBM_17),
  .HWDATA_LASBM_16  (HWDATA_LASBM_16),
  .HWDATA_LASBM_15  (HWDATA_LASBM_15),
  .HWDATA_LASBM_14  (HWDATA_LASBM_14),
  .HWDATA_LASBM_13  (HWDATA_LASBM_13),
  .HWDATA_LASBM_12  (HWDATA_LASBM_12),
  .HWDATA_LASBM_11  (HWDATA_LASBM_11),
  .HWDATA_LASBM_10  (HWDATA_LASBM_10),
  .HWDATA_LASBM_9   (HWDATA_LASBM_9),
  .HWDATA_LASBM_8   (HWDATA_LASBM_8),
  .HWDATA_LASBM_7   (HWDATA_LASBM_7),
  .HWDATA_LASBM_6   (HWDATA_LASBM_6),
  .HWDATA_LASBM_5   (HWDATA_LASBM_5),
  .HWDATA_LASBM_4   (HWDATA_LASBM_4),
  .HWDATA_LASBM_3   (HWDATA_LASBM_3),
  .HWDATA_LASBM_2   (HWDATA_LASBM_2),
  .HWDATA_LASBM_1   (HWDATA_LASBM_1),
  .HWDATA_LASBM_0   (HWDATA_LASBM_0),
  .HBURST_LASBM     (HBURST_LASBM),
  .HWRITE_LASBM     (HWRITE_LASBM),
  .LASB_CLK         (LASB_CLK),
  .LASB_GSR         (LASB_GSR),
  .LASB_IRQ_MASTER  (LASB_IRQ_MASTER),
  .HRDATA_LASBM_35  (HRDATA_LASBM_35),
  .HRDATA_LASBM_34  (HRDATA_LASBM_34),
  .HRDATA_LASBM_33  (HRDATA_LASBM_33),
  .HRDATA_LASBM_32  (HRDATA_LASBM_32),
  .HRDATA_LASBM_31  (HRDATA_LASBM_31),
  .HRDATA_LASBM_30  (HRDATA_LASBM_30),
  .HRDATA_LASBM_29  (HRDATA_LASBM_29),
  .HRDATA_LASBM_28  (HRDATA_LASBM_28),
  .HRDATA_LASBM_27  (HRDATA_LASBM_27),
  .HRDATA_LASBM_26  (HRDATA_LASBM_26),
  .HRDATA_LASBM_25  (HRDATA_LASBM_25),
  .HRDATA_LASBM_24  (HRDATA_LASBM_24),
  .HRDATA_LASBM_23  (HRDATA_LASBM_23),
  .HRDATA_LASBM_22  (HRDATA_LASBM_22),
  .HRDATA_LASBM_21  (HRDATA_LASBM_21),
  .HRDATA_LASBM_20  (HRDATA_LASBM_20),
  .HRDATA_LASBM_19  (HRDATA_LASBM_19),
  .HRDATA_LASBM_18  (HRDATA_LASBM_18),
  .HRDATA_LASBM_17  (HRDATA_LASBM_17),
  .HRDATA_LASBM_16  (HRDATA_LASBM_16),
  .HRDATA_LASBM_15  (HRDATA_LASBM_15),
  .HRDATA_LASBM_14  (HRDATA_LASBM_14),
  .HRDATA_LASBM_13  (HRDATA_LASBM_13),
  .HRDATA_LASBM_12  (HRDATA_LASBM_12),
  .HRDATA_LASBM_11  (HRDATA_LASBM_11),
  .HRDATA_LASBM_10  (HRDATA_LASBM_10),
  .HRDATA_LASBM_9   (HRDATA_LASBM_9),
  .HRDATA_LASBM_8   (HRDATA_LASBM_8),
  .HRDATA_LASBM_7   (HRDATA_LASBM_7),
  .HRDATA_LASBM_6   (HRDATA_LASBM_6),
  .HRDATA_LASBM_5   (HRDATA_LASBM_5),
  .HRDATA_LASBM_4   (HRDATA_LASBM_4),
  .HRDATA_LASBM_3   (HRDATA_LASBM_3),
  .HRDATA_LASBM_2   (HRDATA_LASBM_2),
  .HRDATA_LASBM_1   (HRDATA_LASBM_1),
  .HRDATA_LASBM_0   (HRDATA_LASBM_0),
  .HRESP_LASBM_1    (HRESP_LASBM_1),
  .HRESP_LASBM_0    (HRESP_LASBM_0),
  .HCLK_LASB        (HCLK_LASB),
  .HREADY_LASB      (HREADY_LASB),
  .HRESET_N_LASB    (HRESET_N_LASB),
  .LASB_DONE        (LASB_DONE),
  .LASB_GSR_N       (LASB_GSR_N),
  .LASB_IRQ_OUT     (LASB_IRQ_OUT),
  .HADDR_RASBM_17   (HADDR_RASBM_17),
  .HADDR_RASBM_16   (HADDR_RASBM_16),
  .HADDR_RASBM_15   (HADDR_RASBM_15),
  .HADDR_RASBM_14   (HADDR_RASBM_14),
  .HADDR_RASBM_13   (HADDR_RASBM_13),
  .HADDR_RASBM_12   (HADDR_RASBM_12),
  .HADDR_RASBM_11   (HADDR_RASBM_11),
  .HADDR_RASBM_10   (HADDR_RASBM_10),
  .HADDR_RASBM_9    (HADDR_RASBM_9),
  .HADDR_RASBM_8    (HADDR_RASBM_8),
  .HADDR_RASBM_7    (HADDR_RASBM_7),
  .HADDR_RASBM_6    (HADDR_RASBM_6),
  .HADDR_RASBM_5    (HADDR_RASBM_5),
  .HADDR_RASBM_4    (HADDR_RASBM_4),
  .HADDR_RASBM_3    (HADDR_RASBM_3),
  .HADDR_RASBM_2    (HADDR_RASBM_2),
  .HADDR_RASBM_1    (HADDR_RASBM_1),
  .HADDR_RASBM_0    (HADDR_RASBM_0),
  .HSIZE_RASBM_1    (HSIZE_RASBM_1),
  .HSIZE_RASBM_0    (HSIZE_RASBM_0),
  .HTRANS_RASBM_1   (HTRANS_RASBM_1),
  .HTRANS_RASBM_0   (HTRANS_RASBM_0),
  .HWDATA_RASBM_35  (HWDATA_RASBM_35),
  .HWDATA_RASBM_34  (HWDATA_RASBM_34),
  .HWDATA_RASBM_33  (HWDATA_RASBM_33),
  .HWDATA_RASBM_32  (HWDATA_RASBM_32),
  .HWDATA_RASBM_31  (HWDATA_RASBM_31),
  .HWDATA_RASBM_30  (HWDATA_RASBM_30),
  .HWDATA_RASBM_29  (HWDATA_RASBM_29),
  .HWDATA_RASBM_28  (HWDATA_RASBM_28),
  .HWDATA_RASBM_27  (HWDATA_RASBM_27),
  .HWDATA_RASBM_26  (HWDATA_RASBM_26),
  .HWDATA_RASBM_25  (HWDATA_RASBM_25),
  .HWDATA_RASBM_24  (HWDATA_RASBM_24),
  .HWDATA_RASBM_23  (HWDATA_RASBM_23),
  .HWDATA_RASBM_22  (HWDATA_RASBM_22),
  .HWDATA_RASBM_21  (HWDATA_RASBM_21),
  .HWDATA_RASBM_20  (HWDATA_RASBM_20),
  .HWDATA_RASBM_19  (HWDATA_RASBM_19),
  .HWDATA_RASBM_18  (HWDATA_RASBM_18),
  .HWDATA_RASBM_17  (HWDATA_RASBM_17),
  .HWDATA_RASBM_16  (HWDATA_RASBM_16),
  .HWDATA_RASBM_15  (HWDATA_RASBM_15),
  .HWDATA_RASBM_14  (HWDATA_RASBM_14),
  .HWDATA_RASBM_13  (HWDATA_RASBM_13),
  .HWDATA_RASBM_12  (HWDATA_RASBM_12),
  .HWDATA_RASBM_11  (HWDATA_RASBM_11),
  .HWDATA_RASBM_10  (HWDATA_RASBM_10),
  .HWDATA_RASBM_9   (HWDATA_RASBM_9),
  .HWDATA_RASBM_8   (HWDATA_RASBM_8),
  .HWDATA_RASBM_7   (HWDATA_RASBM_7),
  .HWDATA_RASBM_6   (HWDATA_RASBM_6),
  .HWDATA_RASBM_5   (HWDATA_RASBM_5),
  .HWDATA_RASBM_4   (HWDATA_RASBM_4),
  .HWDATA_RASBM_3   (HWDATA_RASBM_3),
  .HWDATA_RASBM_2   (HWDATA_RASBM_2),
  .HWDATA_RASBM_1   (HWDATA_RASBM_1),
  .HWDATA_RASBM_0   (HWDATA_RASBM_0),
  .HBURST_RASBM     (HBURST_RASBM),
  .HWRITE_RASBM     (HWRITE_RASBM),
  .RASB_CLK         (RASB_CLK),
  .RASB_GSR         (RASB_GSR),
  .RASB_IRQ_MASTER  (RASB_IRQ_MASTER),
  .HRDATA_RASBM_35  (HRDATA_RASBM_35),
  .HRDATA_RASBM_34  (HRDATA_RASBM_34),
  .HRDATA_RASBM_33  (HRDATA_RASBM_33),
  .HRDATA_RASBM_32  (HRDATA_RASBM_32),
  .HRDATA_RASBM_31  (HRDATA_RASBM_31),
  .HRDATA_RASBM_30  (HRDATA_RASBM_30),
  .HRDATA_RASBM_29  (HRDATA_RASBM_29),
  .HRDATA_RASBM_28  (HRDATA_RASBM_28),
  .HRDATA_RASBM_27  (HRDATA_RASBM_27),
  .HRDATA_RASBM_26  (HRDATA_RASBM_26),
  .HRDATA_RASBM_25  (HRDATA_RASBM_25),
  .HRDATA_RASBM_24  (HRDATA_RASBM_24),
  .HRDATA_RASBM_23  (HRDATA_RASBM_23),
  .HRDATA_RASBM_22  (HRDATA_RASBM_22),
  .HRDATA_RASBM_21  (HRDATA_RASBM_21),
  .HRDATA_RASBM_20  (HRDATA_RASBM_20),
  .HRDATA_RASBM_19  (HRDATA_RASBM_19),
  .HRDATA_RASBM_18  (HRDATA_RASBM_18),
  .HRDATA_RASBM_17  (HRDATA_RASBM_17),
  .HRDATA_RASBM_16  (HRDATA_RASBM_16),
  .HRDATA_RASBM_15  (HRDATA_RASBM_15),
  .HRDATA_RASBM_14  (HRDATA_RASBM_14),
  .HRDATA_RASBM_13  (HRDATA_RASBM_13),
  .HRDATA_RASBM_12  (HRDATA_RASBM_12),
  .HRDATA_RASBM_11  (HRDATA_RASBM_11),
  .HRDATA_RASBM_10  (HRDATA_RASBM_10),
  .HRDATA_RASBM_9   (HRDATA_RASBM_9),
  .HRDATA_RASBM_8   (HRDATA_RASBM_8),
  .HRDATA_RASBM_7   (HRDATA_RASBM_7),
  .HRDATA_RASBM_6   (HRDATA_RASBM_6),
  .HRDATA_RASBM_5   (HRDATA_RASBM_5),
  .HRDATA_RASBM_4   (HRDATA_RASBM_4),
  .HRDATA_RASBM_3   (HRDATA_RASBM_3),
  .HRDATA_RASBM_2   (HRDATA_RASBM_2),
  .HRDATA_RASBM_1   (HRDATA_RASBM_1),
  .HRDATA_RASBM_0   (HRDATA_RASBM_0),
  .HRESP_RASBM_1    (HRESP_RASBM_1),
  .HRESP_RASBM_0    (HRESP_RASBM_0),
  .HCLK_RASB        (HCLK_RASB),
  .HREADY_RASB      (HREADY_RASB),
  .HRESET_N_RASB    (HRESET_N_RASB),
  .RASB_DONE        (RASB_DONE),
  .RASB_GSR_N       (RASB_GSR_N),
  .RASB_IRQ_OUT     (RASB_IRQ_OUT),
  .EXT_CLK_P1_IN    (EXT_CLK_P1_IN),
  .EXT_CLK_P2_IN    (EXT_CLK_P2_IN),
  .EXT_DONE_IN      (EXT_DONE_IN),
  .QUAD_AND_FP0_7   (QUAD_AND_FP0_7),
  .QUAD_AND_FP0_6   (QUAD_AND_FP0_6),
  .QUAD_AND_FP0_5   (QUAD_AND_FP0_5),
  .QUAD_AND_FP0_4   (QUAD_AND_FP0_4),
  .QUAD_AND_FP0_3   (QUAD_AND_FP0_3),
  .QUAD_AND_FP0_2   (QUAD_AND_FP0_2),
  .QUAD_AND_FP0_1   (QUAD_AND_FP0_1),
  .QUAD_AND_FP0_0   (QUAD_AND_FP0_0),
  .QUAD_AND_FP1_7   (QUAD_AND_FP1_7),
  .QUAD_AND_FP1_6   (QUAD_AND_FP1_6),
  .QUAD_AND_FP1_5   (QUAD_AND_FP1_5),
  .QUAD_AND_FP1_4   (QUAD_AND_FP1_4),
  .QUAD_AND_FP1_3   (QUAD_AND_FP1_3),
  .QUAD_AND_FP1_2   (QUAD_AND_FP1_2),
  .QUAD_AND_FP1_1   (QUAD_AND_FP1_1),
  .QUAD_AND_FP1_0   (QUAD_AND_FP1_0),
  .QUAD_CLK_7       (QUAD_CLK_7),
  .QUAD_CLK_6       (QUAD_CLK_6),
  .QUAD_CLK_5       (QUAD_CLK_5),
  .QUAD_CLK_4       (QUAD_CLK_4),
  .QUAD_CLK_3       (QUAD_CLK_3),
  .QUAD_CLK_2       (QUAD_CLK_2),
  .QUAD_CLK_1       (QUAD_CLK_1),
  .QUAD_CLK_0       (QUAD_CLK_0),
  .QUAD_DONE_7      (QUAD_DONE_7),
  .QUAD_DONE_6      (QUAD_DONE_6),
  .QUAD_DONE_5      (QUAD_DONE_5),
  .QUAD_DONE_4      (QUAD_DONE_4),
  .QUAD_DONE_3      (QUAD_DONE_3),
  .QUAD_DONE_2      (QUAD_DONE_2),
  .QUAD_DONE_1      (QUAD_DONE_1),
  .QUAD_DONE_0      (QUAD_DONE_0),
  .QUAD_OR_FP0_7    (QUAD_OR_FP0_7),
  .QUAD_OR_FP0_6    (QUAD_OR_FP0_6),
  .QUAD_OR_FP0_5    (QUAD_OR_FP0_5),
  .QUAD_OR_FP0_4    (QUAD_OR_FP0_4),
  .QUAD_OR_FP0_3    (QUAD_OR_FP0_3),
  .QUAD_OR_FP0_2    (QUAD_OR_FP0_2),
  .QUAD_OR_FP0_1    (QUAD_OR_FP0_1),
  .QUAD_OR_FP0_0    (QUAD_OR_FP0_0),
  .QUAD_OR_FP1_7    (QUAD_OR_FP1_7),
  .QUAD_OR_FP1_6    (QUAD_OR_FP1_6),
  .QUAD_OR_FP1_5    (QUAD_OR_FP1_5),
  .QUAD_OR_FP1_4    (QUAD_OR_FP1_4),
  .QUAD_OR_FP1_3    (QUAD_OR_FP1_3),
  .QUAD_OR_FP1_2    (QUAD_OR_FP1_2),
  .QUAD_OR_FP1_1    (QUAD_OR_FP1_1),
  .QUAD_OR_FP1_0    (QUAD_OR_FP1_0),
  .QUAD_RST_N_7     (QUAD_RST_N_7),
  .QUAD_RST_N_6     (QUAD_RST_N_6),
  .QUAD_RST_N_5     (QUAD_RST_N_5),
  .QUAD_RST_N_4     (QUAD_RST_N_4),
  .QUAD_RST_N_3     (QUAD_RST_N_3),
  .QUAD_RST_N_2     (QUAD_RST_N_2),
  .QUAD_RST_N_1     (QUAD_RST_N_1),
  .QUAD_RST_N_0     (QUAD_RST_N_0),
  .QUAD_START_7     (QUAD_START_7),
  .QUAD_START_6     (QUAD_START_6),
  .QUAD_START_5     (QUAD_START_5),
  .QUAD_START_4     (QUAD_START_4),
  .QUAD_START_3     (QUAD_START_3),
  .QUAD_START_2     (QUAD_START_2),
  .QUAD_START_1     (QUAD_START_1),
  .QUAD_START_0     (QUAD_START_0),
  .EXT_CLK_P1_OUT   (EXT_CLK_P1_OUT),
  .EXT_CLK_P2_OUT   (EXT_CLK_P2_OUT),
  .EXT_DONE_OUT     (EXT_DONE_OUT),
  .GRP_CLK_P1_L_3     (GRP_CLK_P1_L_3),
  .GRP_CLK_P1_L_2     (GRP_CLK_P1_L_2),
  .GRP_CLK_P1_L_1     (GRP_CLK_P1_L_1),
  .GRP_CLK_P1_L_0     (GRP_CLK_P1_L_0),
  .GRP_CLK_P2_L_3     (GRP_CLK_P2_L_3),
  .GRP_CLK_P2_L_2     (GRP_CLK_P2_L_2),
  .GRP_CLK_P2_L_1     (GRP_CLK_P2_L_1),
  .GRP_CLK_P2_L_0     (GRP_CLK_P2_L_0),
  .GRP_DESKEW_ERROR_L_3   (GRP_DESKEW_ERROR_L_3),
  .GRP_DESKEW_ERROR_L_2   (GRP_DESKEW_ERROR_L_2),
  .GRP_DESKEW_ERROR_L_1   (GRP_DESKEW_ERROR_L_1),
  .GRP_DESKEW_ERROR_L_0   (GRP_DESKEW_ERROR_L_0),
  .GRP_DONE_L_3       (GRP_DONE_L_3),
  .GRP_DONE_L_2       (GRP_DONE_L_2),
  .GRP_DONE_L_1       (GRP_DONE_L_1),
  .GRP_DONE_L_0       (GRP_DONE_L_0),
  .GRP_START_L_3      (GRP_START_L_3),
  .GRP_START_L_2      (GRP_START_L_2),
  .GRP_START_L_1      (GRP_START_L_1),
  .GRP_START_L_0      (GRP_START_L_0),
  .GRP_CLK_P1_R_3     (GRP_CLK_P1_R_3),
  .GRP_CLK_P1_R_2     (GRP_CLK_P1_R_2),
  .GRP_CLK_P1_R_1     (GRP_CLK_P1_R_1),
  .GRP_CLK_P1_R_0     (GRP_CLK_P1_R_0),
  .GRP_CLK_P2_R_3     (GRP_CLK_P2_R_3),
  .GRP_CLK_P2_R_2     (GRP_CLK_P2_R_2),
  .GRP_CLK_P2_R_1     (GRP_CLK_P2_R_1),
  .GRP_CLK_P2_R_0     (GRP_CLK_P2_R_0),
  .GRP_DESKEW_ERROR_R_3   (GRP_DESKEW_ERROR_R_3),
  .GRP_DESKEW_ERROR_R_2   (GRP_DESKEW_ERROR_R_2),
  .GRP_DESKEW_ERROR_R_1   (GRP_DESKEW_ERROR_R_1),
  .GRP_DESKEW_ERROR_R_0   (GRP_DESKEW_ERROR_R_0),
  .GRP_DONE_R_3       (GRP_DONE_R_3),
  .GRP_DONE_R_2       (GRP_DONE_R_2),
  .GRP_DONE_R_1       (GRP_DONE_R_1),
  .GRP_DONE_R_0       (GRP_DONE_R_0),
  .GRP_START_R_3      (GRP_START_R_3),
  .GRP_START_R_2      (GRP_START_R_2),
  .GRP_START_R_1      (GRP_START_R_1),
  .GRP_START_R_0      (GRP_START_R_0),
  .LPCS_INT_3       (LPCS_INT_3),
  .LPCS_INT_2       (LPCS_INT_2),
  .LPCS_INT_1       (LPCS_INT_1),
  .LPCS_INT_0       (LPCS_INT_0),
  .LPCS_RDATA_Q0_7  (LPCS_RDATA_Q0_7),
  .LPCS_RDATA_Q0_6  (LPCS_RDATA_Q0_6),
  .LPCS_RDATA_Q0_5  (LPCS_RDATA_Q0_5),
  .LPCS_RDATA_Q0_4  (LPCS_RDATA_Q0_4),
  .LPCS_RDATA_Q0_3  (LPCS_RDATA_Q0_3),
  .LPCS_RDATA_Q0_2  (LPCS_RDATA_Q0_2),
  .LPCS_RDATA_Q0_1  (LPCS_RDATA_Q0_1),
  .LPCS_RDATA_Q0_0  (LPCS_RDATA_Q0_0),
  .LPCS_RDATA_Q1_7  (LPCS_RDATA_Q1_7),
  .LPCS_RDATA_Q1_6  (LPCS_RDATA_Q1_6),
  .LPCS_RDATA_Q1_5  (LPCS_RDATA_Q1_5),
  .LPCS_RDATA_Q1_4  (LPCS_RDATA_Q1_4),
  .LPCS_RDATA_Q1_3  (LPCS_RDATA_Q1_3),
  .LPCS_RDATA_Q1_2  (LPCS_RDATA_Q1_2),
  .LPCS_RDATA_Q1_1  (LPCS_RDATA_Q1_1),
  .LPCS_RDATA_Q1_0  (LPCS_RDATA_Q1_0),
  .LPCS_RDATA_Q2_7  (LPCS_RDATA_Q2_7),
  .LPCS_RDATA_Q2_6  (LPCS_RDATA_Q2_6),
  .LPCS_RDATA_Q2_5  (LPCS_RDATA_Q2_5),
  .LPCS_RDATA_Q2_4  (LPCS_RDATA_Q2_4),
  .LPCS_RDATA_Q2_3  (LPCS_RDATA_Q2_3),
  .LPCS_RDATA_Q2_2  (LPCS_RDATA_Q2_2),
  .LPCS_RDATA_Q2_1  (LPCS_RDATA_Q2_1),
  .LPCS_RDATA_Q2_0  (LPCS_RDATA_Q2_0),
  .LPCS_RDATA_Q3_7  (LPCS_RDATA_Q3_7),
  .LPCS_RDATA_Q3_6  (LPCS_RDATA_Q3_6),
  .LPCS_RDATA_Q3_5  (LPCS_RDATA_Q3_5),
  .LPCS_RDATA_Q3_4  (LPCS_RDATA_Q3_4),
  .LPCS_RDATA_Q3_3  (LPCS_RDATA_Q3_3),
  .LPCS_RDATA_Q3_2  (LPCS_RDATA_Q3_2),
  .LPCS_RDATA_Q3_1  (LPCS_RDATA_Q3_1),
  .LPCS_RDATA_Q3_0  (LPCS_RDATA_Q3_0),
  .LPCS_ADDR_7      (LPCS_ADDR_7),
  .LPCS_ADDR_6      (LPCS_ADDR_6),
  .LPCS_ADDR_5      (LPCS_ADDR_5),
  .LPCS_ADDR_4      (LPCS_ADDR_4),
  .LPCS_ADDR_3      (LPCS_ADDR_3),
  .LPCS_ADDR_2      (LPCS_ADDR_2),
  .LPCS_ADDR_1      (LPCS_ADDR_1),
  .LPCS_ADDR_0      (LPCS_ADDR_0),
  .LPCS_WDATA_7     (LPCS_WDATA_7),
  .LPCS_WDATA_6     (LPCS_WDATA_6),
  .LPCS_WDATA_5     (LPCS_WDATA_5),
  .LPCS_WDATA_4     (LPCS_WDATA_4),
  .LPCS_WDATA_3     (LPCS_WDATA_3),
  .LPCS_WDATA_2     (LPCS_WDATA_2),
  .LPCS_WDATA_1     (LPCS_WDATA_1),
  .LPCS_WDATA_0     (LPCS_WDATA_0),
  .LPCS_C_15        (LPCS_C_15),
  .LPCS_C_14        (LPCS_C_14),
  .LPCS_C_13        (LPCS_C_13),
  .LPCS_C_12        (LPCS_C_12),
  .LPCS_C_11        (LPCS_C_11),
  .LPCS_C_10        (LPCS_C_10),
  .LPCS_C_9         (LPCS_C_9),
  .LPCS_C_8         (LPCS_C_8),
  .LPCS_C_7         (LPCS_C_7),
  .LPCS_C_6         (LPCS_C_6),
  .LPCS_C_5         (LPCS_C_5),
  .LPCS_C_4         (LPCS_C_4),
  .LPCS_C_3         (LPCS_C_3),
  .LPCS_C_2         (LPCS_C_2),
  .LPCS_C_1         (LPCS_C_1),
  .LPCS_C_0         (LPCS_C_0),
  .LPCS_Q_3         (LPCS_Q_3),
  .LPCS_Q_2         (LPCS_Q_2),
  .LPCS_Q_1         (LPCS_Q_1),
  .LPCS_Q_0         (LPCS_Q_0),
  .LPCS_RD          (LPCS_RD),
  .LPCS_WSTB        (LPCS_WSTB),
  .LPCS_QUAD_ID0_1  (LPCS_QUAD_ID0_1),
  .LPCS_QUAD_ID0_0  (LPCS_QUAD_ID0_0),
  .LPCS_QUAD_ID1_1  (LPCS_QUAD_ID1_1),
  .LPCS_QUAD_ID1_0  (LPCS_QUAD_ID1_0),
  .LPCS_QUAD_ID2_1  (LPCS_QUAD_ID2_1),
  .LPCS_QUAD_ID2_0  (LPCS_QUAD_ID2_0),
  .LPCS_QUAD_ID3_1  (LPCS_QUAD_ID3_1),
  .LPCS_QUAD_ID3_0  (LPCS_QUAD_ID3_0),
  .RPCS_INT_3       (RPCS_INT_3),
  .RPCS_INT_2       (RPCS_INT_2),
  .RPCS_INT_1       (RPCS_INT_1),
  .RPCS_INT_0       (RPCS_INT_0),
  .RPCS_RDATA_Q0_7  (RPCS_RDATA_Q0_7),
  .RPCS_RDATA_Q0_6  (RPCS_RDATA_Q0_6),
  .RPCS_RDATA_Q0_5  (RPCS_RDATA_Q0_5),
  .RPCS_RDATA_Q0_4  (RPCS_RDATA_Q0_4),
  .RPCS_RDATA_Q0_3  (RPCS_RDATA_Q0_3),
  .RPCS_RDATA_Q0_2  (RPCS_RDATA_Q0_2),
  .RPCS_RDATA_Q0_1  (RPCS_RDATA_Q0_1),
  .RPCS_RDATA_Q0_0  (RPCS_RDATA_Q0_0),
  .RPCS_RDATA_Q1_7  (RPCS_RDATA_Q1_7),
  .RPCS_RDATA_Q1_6  (RPCS_RDATA_Q1_6),
  .RPCS_RDATA_Q1_5  (RPCS_RDATA_Q1_5),
  .RPCS_RDATA_Q1_4  (RPCS_RDATA_Q1_4),
  .RPCS_RDATA_Q1_3  (RPCS_RDATA_Q1_3),
  .RPCS_RDATA_Q1_2  (RPCS_RDATA_Q1_2),
  .RPCS_RDATA_Q1_1  (RPCS_RDATA_Q1_1),
  .RPCS_RDATA_Q1_0  (RPCS_RDATA_Q1_0),
  .RPCS_RDATA_Q2_7  (RPCS_RDATA_Q2_7),
  .RPCS_RDATA_Q2_6  (RPCS_RDATA_Q2_6),
  .RPCS_RDATA_Q2_5  (RPCS_RDATA_Q2_5),
  .RPCS_RDATA_Q2_4  (RPCS_RDATA_Q2_4),
  .RPCS_RDATA_Q2_3  (RPCS_RDATA_Q2_3),
  .RPCS_RDATA_Q2_2  (RPCS_RDATA_Q2_2),
  .RPCS_RDATA_Q2_1  (RPCS_RDATA_Q2_1),
  .RPCS_RDATA_Q2_0  (RPCS_RDATA_Q2_0),
  .RPCS_RDATA_Q3_7  (RPCS_RDATA_Q3_7),
  .RPCS_RDATA_Q3_6  (RPCS_RDATA_Q3_6),
  .RPCS_RDATA_Q3_5  (RPCS_RDATA_Q3_5),
  .RPCS_RDATA_Q3_4  (RPCS_RDATA_Q3_4),
  .RPCS_RDATA_Q3_3  (RPCS_RDATA_Q3_3),
  .RPCS_RDATA_Q3_2  (RPCS_RDATA_Q3_2),
  .RPCS_RDATA_Q3_1  (RPCS_RDATA_Q3_1),
  .RPCS_RDATA_Q3_0  (RPCS_RDATA_Q3_0),
  .RPCS_ADDR_7      (RPCS_ADDR_7),
  .RPCS_ADDR_6      (RPCS_ADDR_6),
  .RPCS_ADDR_5      (RPCS_ADDR_5),
  .RPCS_ADDR_4      (RPCS_ADDR_4),
  .RPCS_ADDR_3      (RPCS_ADDR_3),
  .RPCS_ADDR_2      (RPCS_ADDR_2),
  .RPCS_ADDR_1      (RPCS_ADDR_1),
  .RPCS_ADDR_0      (RPCS_ADDR_0),
  .RPCS_WDATA_7     (RPCS_WDATA_7),
  .RPCS_WDATA_6     (RPCS_WDATA_6),
  .RPCS_WDATA_5     (RPCS_WDATA_5),
  .RPCS_WDATA_4     (RPCS_WDATA_4),
  .RPCS_WDATA_3     (RPCS_WDATA_3),
  .RPCS_WDATA_2     (RPCS_WDATA_2),
  .RPCS_WDATA_1     (RPCS_WDATA_1),
  .RPCS_WDATA_0     (RPCS_WDATA_0),
  .RPCS_C_15        (RPCS_C_15),
  .RPCS_C_14        (RPCS_C_14),
  .RPCS_C_13        (RPCS_C_13),
  .RPCS_C_12        (RPCS_C_12),
  .RPCS_C_11        (RPCS_C_11),
  .RPCS_C_10        (RPCS_C_10),
  .RPCS_C_9         (RPCS_C_9),
  .RPCS_C_8         (RPCS_C_8),
  .RPCS_C_7         (RPCS_C_7),
  .RPCS_C_6         (RPCS_C_6),
  .RPCS_C_5         (RPCS_C_5),
  .RPCS_C_4         (RPCS_C_4),
  .RPCS_C_3         (RPCS_C_3),
  .RPCS_C_2         (RPCS_C_2),
  .RPCS_C_1         (RPCS_C_1),
  .RPCS_C_0         (RPCS_C_0),
  .RPCS_Q_3         (RPCS_Q_3),
  .RPCS_Q_2         (RPCS_Q_2),
  .RPCS_Q_1         (RPCS_Q_1),
  .RPCS_Q_0         (RPCS_Q_0),
  .RPCS_RD          (RPCS_RD),
  .RPCS_WSTB        (RPCS_WSTB),
  .RPCS_QUAD_ID0_1  (RPCS_QUAD_ID0_1),
  .RPCS_QUAD_ID0_0  (RPCS_QUAD_ID0_0),
  .RPCS_QUAD_ID1_1  (RPCS_QUAD_ID1_1),
  .RPCS_QUAD_ID1_0  (RPCS_QUAD_ID1_0),
  .RPCS_QUAD_ID2_1  (RPCS_QUAD_ID2_1),
  .RPCS_QUAD_ID2_0  (RPCS_QUAD_ID2_0),
  .RPCS_QUAD_ID3_1  (RPCS_QUAD_ID3_1),
  .RPCS_QUAD_ID3_0  (RPCS_QUAD_ID3_0),
  .DMA_RD_DATA_31   (DMA_RD_DATA_31),
  .DMA_RD_DATA_30   (DMA_RD_DATA_30),
  .DMA_RD_DATA_29   (DMA_RD_DATA_29),
  .DMA_RD_DATA_28   (DMA_RD_DATA_28),
  .DMA_RD_DATA_27   (DMA_RD_DATA_27),
  .DMA_RD_DATA_26   (DMA_RD_DATA_26),
  .DMA_RD_DATA_25   (DMA_RD_DATA_25),
  .DMA_RD_DATA_24   (DMA_RD_DATA_24),
  .DMA_RD_DATA_23   (DMA_RD_DATA_23),
  .DMA_RD_DATA_22   (DMA_RD_DATA_22),
  .DMA_RD_DATA_21   (DMA_RD_DATA_21),
  .DMA_RD_DATA_20   (DMA_RD_DATA_20),
  .DMA_RD_DATA_19   (DMA_RD_DATA_19),
  .DMA_RD_DATA_18   (DMA_RD_DATA_18),
  .DMA_RD_DATA_17   (DMA_RD_DATA_17),
  .DMA_RD_DATA_16   (DMA_RD_DATA_16),
  .DMA_RD_DATA_15   (DMA_RD_DATA_15),
  .DMA_RD_DATA_14   (DMA_RD_DATA_14),
  .DMA_RD_DATA_13   (DMA_RD_DATA_13),
  .DMA_RD_DATA_12   (DMA_RD_DATA_12),
  .DMA_RD_DATA_11   (DMA_RD_DATA_11),
  .DMA_RD_DATA_10   (DMA_RD_DATA_10),
  .DMA_RD_DATA_9    (DMA_RD_DATA_9),
  .DMA_RD_DATA_8    (DMA_RD_DATA_8),
  .DMA_RD_DATA_7    (DMA_RD_DATA_7),
  .DMA_RD_DATA_6    (DMA_RD_DATA_6),
  .DMA_RD_DATA_5    (DMA_RD_DATA_5),
  .DMA_RD_DATA_4    (DMA_RD_DATA_4),
  .DMA_RD_DATA_3    (DMA_RD_DATA_3),
  .DMA_RD_DATA_2    (DMA_RD_DATA_2),
  .DMA_RD_DATA_1    (DMA_RD_DATA_1),
  .DMA_RD_DATA_0    (DMA_RD_DATA_0),
  .DMA_RD_PARITY_3  (DMA_RD_PARITY_3),
  .DMA_RD_PARITY_2  (DMA_RD_PARITY_2),
  .DMA_RD_PARITY_1  (DMA_RD_PARITY_1),
  .DMA_RD_PARITY_0  (DMA_RD_PARITY_0),
  .DMA_RETRY        (DMA_RETRY),
  .DMA_TA           (DMA_TA),
  .DMA_TEA          (DMA_TEA),
  .DMA_TRI_CTL      (DMA_TRI_CTL),
  .DMA_TRI_DATA     (DMA_TRI_DATA));

//synopsys translate_on

endmodule
#include <sysbus/sysbus.tft>
