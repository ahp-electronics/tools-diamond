#log _circuit_name.v

#define -r SLASH2 //
#define -r STARTCOM /*
#define -r ENDCOM */
#ifndef _maxrate 
#define _maxrate 0.75
#endif 

#macro converter1(arg1,arg2)
#define arg2 arg1##.txt
#endmacro
#macro converter2(arg1,arg2)
#if arg1 < 0.76
#define arg2 RXH1
#elif arg1 >= 0.76 && arg1 <= 0.99
#define arg2 RXH2
#elif arg1 >= 1.00 && arg1 <= 1.40
#define arg2 RXH3
#elif arg1 >= 1.41 && arg1 <= 1.99
#define arg2 RXH4
#elif arg1 >= 2.00 && arg1 <= 2.80
#define arg2 RXF3
#elif arg1 > 2.80
#define arg2 RXF4
#endif
#endmacro

#macro converter6(arg1,arg2)
#if arg1 == "Enabled"
#define arg2 ENABLED
#elif arg1 == "Disabled"
#define arg2 DISABLED
#endif
#endmacro
#macro converter5(arg1,arg2)
#if arg1 < 0.85
#define arg2 TXH1
#elif arg1 >= 0.85 && arg1 <= 1.35
#define arg2 TXH2
#elif arg1 >= 1.36 && arg1 <= 1.99
#define arg2 TXH3
#elif arg1 >= 2.00 && arg1 <= 2.70
#define arg2 TXF2
#elif arg1 > 2.70
#define arg2 TXF3
#endif
#endmacro
#macro converter3(arg1,arg2)
#if arg1 == "Serial RapidIO"
#define arg2 "1x RapidIO"
#elif arg1 == "PCI Express"
#define arg2 "1x PCI Express"
#else
#define arg2 arg1
#endif
#endmacro
#macro converter4(arg0,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8)
#if #arg0 == "all" && arg1 == "1x RapidIO" && arg2 == "1x RapidIO" && arg3 == "1x RapidIO" && arg4 == "1x RapidIO"
#define arg5 "4x Serial RapidIO"
#define arg6 "4x Serial RapidIO"
#define arg7 "4x Serial RapidIO"
#define arg8 "4x Serial RapidIO"
#elif #arg0 == "all" && arg1 == "1x PCI Express" && arg2 == "1x PCI Express" && arg3 == "1x PCI Express" && arg4 == "1x PCI Express"
#define arg5 "4x PCI Express"
#define arg6 "4x PCI Express"
#define arg7 "4x PCI Express"
#define arg8 "4x PCI Express"
#else
#define arg5 arg1
#define arg6 arg2
#define arg7 arg3
#define arg8 arg4
#endif
#endmacro


#converter1(_circuit_name, _circuit_name_new)
#converter2(_maxrate, _maxrate_rx)
#converter5(_maxrate, _maxrate_tx)
#converter6(_amp_boost, _amp_boost_new)
#converter3(_channel_A_options, _channel_A_options_new1)
#converter3(_channel_B_options, _channel_B_options_new1)
#converter3(_channel_C_options, _channel_C_options_new1)
#converter3(_channel_D_options, _channel_D_options_new1)
#converter4(_channel_align_mode, _channel_A_options_new1, _channel_B_options_new1, _channel_C_options_new1, _channel_D_options_new1, _channel_A_options_new, _channel_B_options_new, _channel_C_options_new, _channel_D_options_new)
SLASH2 channel_0 is in _channel_A_options mode
SLASH2 channel_1 is in _channel_B_options mode
SLASH2 channel_2 is in _channel_C_options mode
SLASH2 channel_3 is in _channel_D_options mode

`define NULL 0
`timescale 1ns / 10 ps

module _circuit_name (
// serdes clk pins //
#if _ref_clock_select == "refclk"
  refclkp, refclkn,
#elif _ref_clock_select == "ff_refclk"
  refclk, rxrefclk,
#elif _ref_clock_select == "all"
  refclkp, refclkn,  
  refclk, rxrefclk,
#endif
#if _enable_system_bus == 1
// Interface to SYSBUSA //
  sysbus_in, sysbus_out,
#endif
  quad_rst, serdes_rst, 
// Data to FPGA and SERDES //
#if _channel_A_options_new == "XAUI" || _channel_A_options_new == "4x Serial RapidIO"
  hdinp_0, hdinn_0, hdoutp_0, hdoutn_0,
  hdinp_1, hdinn_1, hdoutp_1, hdoutn_1,
  hdinp_2, hdinn_2, hdoutp_2, hdoutn_2,
  hdinp_3, hdinn_3, hdoutp_3, hdoutn_3,
  txd_0, txd_1, txd_2, txd_3, rxd_0, rxd_1, rxd_2, rxd_3,
  txc_0, txc_1, txc_2, txc_3, rxc_0, rxc_1, rxc_2, rxc_3,
  tclk, rclk,
  ref_0_sclk, ref_1_sclk, ref_2_sclk, ref_3_sclk,
  tx_rst, rx_rst, 
#if _en_control_ports == 1
  lsm_en, mca_align_en, felb, 
  lsm_status_0, lsm_status_1, lsm_status_2, lsm_status_3,
  ctc_orun_0, ctc_orun_1, ctc_orun_2, ctc_orun_3,
  ctc_urun_0, ctc_urun_1, ctc_urun_2, ctc_urun_3,
#endif
#elif _channel_A_options_new == "4x PCI Express" 
  hdinp_0, hdinn_0, hdoutp_0, hdoutn_0, txd_0, rxd_0, 
  hdinp_1, hdinn_1, hdoutp_1, hdoutn_1, txd_1, rxd_1, 
  hdinp_2, hdinn_2, hdoutp_2, hdoutn_2, txd_2, rxd_2, 
  hdinp_3, hdinn_3, hdoutp_3, hdoutn_3, txd_3, rxd_3, 
  tclk, rclk,
  tx_k_0, tx_k_1, tx_k_2, tx_k_3, rx_k_0, rx_k_1, rx_k_2, rx_k_3,
  tx_force_disp_0, tx_force_disp_1, tx_force_disp_2, tx_force_disp_3,
  tx_disp_sel_0, tx_disp_sel_1, tx_disp_sel_2, tx_disp_sel_3,
  rx_disp_err_detect_0, rx_disp_err_detect_1, rx_disp_err_detect_2, rx_disp_err_detect_3,
  rx_cv_detect_0, rx_cv_detect_1, rx_cv_detect_2, rx_cv_detect_3,
  elec_idel_0, elec_idel_1, elec_idel_2, elec_idel_3,
  rx_detect_test_0, rx_detect_test_1, rx_detect_test_2, rx_detect_test_3,
  tx_scrm_en, rx_scrm_en, 
  rx_detect_0, rx_detect_1, rx_detect_2, rx_detect_3,
  rx_detect_done_0, rx_detect_done_1, rx_detect_done_2, rx_detect_done_3,
  ref_0_sclk, ref_1_sclk, ref_2_sclk, ref_3_sclk,
  rx_ei_detect_0, rx_ei_detect_1, rx_ei_detect_2, rx_ei_detect_3,
  rx_invert_0, rx_invert_1, rx_invert_2, rx_invert_3,
  tx_rst, rx_rst,  
#if _en_control_ports == 1
  lsm_en, felb, 
  mca_align_en_0, mca_align_en_1, mca_align_en_2, mca_align_en_3,
  lsm_status_0, lsm_status_1, lsm_status_2, lsm_status_3,
  ctc_orun_0, ctc_orun_1, ctc_orun_2, ctc_orun_3,
  ctc_urun_0, ctc_urun_1, ctc_urun_2, ctc_urun_3,
#endif
#else
#if _channel_A_options_new == "SERDES Only(8/16-bit)"
  hdinp_0, hdinn_0, hdoutp_0, hdoutn_0,
  txd_0, rxd_0, rx_lsd_0,
  tclk_0, rclk_0,
  ref_0_sclk, rx_0_sclk, 
  tx_rst_0, rx_rst_0,
#if _en_control_ports == 1
  felb_0,
#endif
#endif
#if _channel_A_options_new == "SERDES Only(10/20-bit)" 
  hdinp_0, hdinn_0, hdoutp_0, hdoutn_0,
  txd_0, rxd_0, tclk_0, rclk_0,
  ref_0_sclk, rx_0_sclk, 
  tx_rst_0, rx_rst_0, rx_lsd_0,
#if _en_control_ports == 1
  felb_0, word_align_en_0,
#endif
#endif
#if _channel_A_options_new == "8b10b"
  hdinp_0, hdinn_0, hdoutp_0, hdoutn_0,
  txd_0, tx_k_0, tx_force_disp_0, tx_disp_sel_0, 
  rxd_0, rx_k_0, rx_disp_err_detect_0, rx_cv_detect_0, 
  tclk_0, rclk_0,
  ref_0_sclk, rx_0_sclk, 
  tx_rst_0, rx_rst_0,
#if _en_control_ports == 1
  tx_crc_init_0, rx_crc_eop_0,
  word_align_en_0, mca_align_en_0, felb_0, 
  lsm_en_0, lsm_status_0,
#endif
#endif
#if _channel_A_options_new == "Fibre Channel(Single SERDES)"
  hdinp_0, hdinn_0, hdoutp_0, hdoutn_0,
  txd_0, tx_k_0, tx_force_disp_0, tx_disp_sel_0, tx_sof_0,
  rxd_0, rx_k_0, rx_disp_err_detect_0, rx_sof_0, rx_crc_eof_0,
  tclk_0, rclk_0,
  ref_0_sclk,  
  tx_rst_0, rx_rst_0,
#if _en_control_ports == 1
  lsm_en_0, felb_0, lsm_status_0, ctc_orun_0, ctc_urun_0,
#endif
#endif
#if _channel_A_options_new == "1x PCI Express"
  hdinp_0, hdinn_0, hdoutp_0, hdoutn_0,
  txd_0, tx_k_0, tx_force_disp_0, tx_disp_sel_0, 
  rxd_0, rx_k_0, rx_disp_err_detect_0, rx_cv_detect_0, 
  tclk_0, rclk_0,
  elec_idel_0, rx_detect_test_0, tx_scrm_en_0, rx_scrm_en_0,
  rx_detect_0, rx_detect_done_0, 
  ref_0_sclk,  
  rx_ei_detect_0, 
  rx_invert_0, 
  tx_rst_0, rx_rst_0,
#if _en_control_ports == 1
  lsm_en_0, mca_align_en_0, felb_0, lsm_status_0, ctc_orun_0, ctc_urun_0,
#endif
#endif
#if _channel_A_options_new == "1x RapidIO"
  hdinp_0, hdinn_0, hdoutp_0, hdoutn_0,
  txd_0, txc_0, rxd_0, rxc_0, 
  tclk_0, rclk_0,
  ref_0_sclk,  
  tx_rst_0, rx_rst_0,
#if _en_control_ports == 1
  lsm_en_0, felb_0, lsm_status_0, ctc_orun_0, ctc_urun_0,
#endif
#endif
#if _channel_A_options_new == "Gigabit Ethernet"
  hdinp_0, hdinn_0, hdoutp_0, hdoutn_0,
  txd_0, tx_en_0, tx_er_0, tx_crc_insert_0, tx_sfd_0, 
  rxd_0, rx_dv_0, rx_er_0, rx_crc_eop_0, rx_sfd_0,
  tclk_0, rclk_0,
  ref_0_sclk,  
  tx_rst_0, rx_rst_0,
#if _en_control_ports == 1
  lsm_en_0, felb_0, lsm_status_0, ctc_orun_0, ctc_urun_0,
#endif
#endif
#if _channel_A_options_new == "SONET(STS-12, STS-48)"
  hdinp_0, hdinn_0, hdoutp_0, hdoutn_0,
  txd_0, tx_fp_0, 
  rxd_0, rx_spe_0, rx_oof_0, rx_fp_0,  
  rx_j1b1_0, 
  tclk_0, rclk_0,
  ref_0_sclk, rx_0_sclk, 
  tx_rst_0, rx_rst_0,
#if _en_control_ports == 1
  mca_align_en_0, felb_0, 
#endif
#endif


#if _channel_B_options_new == "SERDES Only(8/16-bit)"
  hdinp_1, hdinn_1, hdoutp_1, hdoutn_1,
  txd_1, rxd_1, rx_lsd_1,
  tclk_1, rclk_1,
  ref_1_sclk, rx_1_sclk,
  tx_rst_1, rx_rst_1,
#if _en_control_ports == 1
  felb_1,
#endif
#endif
#if _channel_B_options_new == "SERDES Only(10/20-bit)"
  hdinp_1, hdinn_1, hdoutp_1, hdoutn_1,
  txd_1, rxd_1, tclk_1, rclk_1,
  ref_1_sclk, rx_1_sclk, 
  tx_rst_1, rx_rst_1, rx_lsd_1,
#if _en_control_ports == 1
  felb_1, word_align_en_1,
#endif
#endif
#if _channel_B_options_new == "8b10b"
  hdinp_1, hdinn_1, hdoutp_1, hdoutn_1,
  txd_1, tx_k_1, tx_force_disp_1, tx_disp_sel_1,
  rxd_1, rx_k_1, rx_disp_err_detect_1, rx_cv_detect_1,
  tclk_1, rclk_1,
  ref_1_sclk, rx_1_sclk,
  tx_rst_1, rx_rst_1,
#if _en_control_ports == 1
  tx_crc_init_1, rx_crc_eop_1,
  word_align_en_1, mca_align_en_1, felb_1, 
  lsm_en_1, lsm_status_1,
#endif
#endif
#if _channel_B_options_new == "Fibre Channel(Single SERDES)"
  hdinp_1, hdinn_1, hdoutp_1, hdoutn_1,
  txd_1, tx_k_1, tx_force_disp_1, tx_disp_sel_1, tx_sof_1,
  rxd_1, rx_k_1, rx_disp_err_detect_1, rx_sof_1, rx_crc_eof_1,
  tclk_1, rclk_1,
  ref_1_sclk, 
  tx_rst_1, rx_rst_1,
#if _en_control_ports == 1
  lsm_en_1, felb_1, lsm_status_1, ctc_orun_1, ctc_urun_1,
#endif
#endif
#if _channel_B_options_new == "1x PCI Express"
  hdinp_1, hdinn_1, hdoutp_1, hdoutn_1,
  txd_1, tx_k_1, tx_force_disp_1, tx_disp_sel_1, 
  rxd_1, rx_k_1, rx_disp_err_detect_1, rx_cv_detect_1,
  tclk_1, rclk_1,
  elec_idel_1, rx_detect_test_1, tx_scrm_en_1, rx_scrm_en_1,
  rx_detect_1, rx_detect_done_1,
  ref_1_sclk, 
  rx_ei_detect_1, 
  rx_invert_1, 
  tx_rst_1, rx_rst_1,
#if _en_control_ports == 1
  lsm_en_1, mca_align_en_1, felb_1, lsm_status_1, ctc_orun_1, ctc_urun_1,
#endif
#endif
#if _channel_B_options_new == "1x RapidIO"
  hdinp_1, hdinn_1, hdoutp_1, hdoutn_1,
  txd_1, txc_1, rxd_1, rxc_1,
  tclk_1, rclk_1,
  ref_1_sclk, 
  tx_rst_1, rx_rst_1,
#if _en_control_ports == 1
  lsm_en_1, felb_1, lsm_status_1, ctc_orun_1, ctc_urun_1,
#endif
#endif
#if _channel_B_options_new == "Gigabit Ethernet"
  hdinp_1, hdinn_1, hdoutp_1, hdoutn_1,
  txd_1, tx_en_1, tx_er_1, tx_crc_insert_1, tx_sfd_1,
  rxd_1, rx_dv_1, rx_er_1, rx_crc_eop_1, rx_sfd_1,
  tclk_1, rclk_1,
  ref_1_sclk, 
  tx_rst_1, rx_rst_1,
#if _en_control_ports == 1
  lsm_en_1, felb_1, lsm_status_1, ctc_orun_1, ctc_urun_1,
#endif
#endif
#if _channel_B_options_new == "SONET(STS-12, STS-48)"
  hdinp_1, hdinn_1, hdoutp_1, hdoutn_1,
  txd_1, tx_fp_1,
  rxd_1, rx_spe_1, rx_oof_1, rx_fp_1,
  rx_j1b1_1, 
  tclk_1, rclk_1,
  ref_1_sclk, rx_1_sclk,
  tx_rst_1, rx_rst_1,
#if _en_control_ports == 1
  mca_align_en_1, felb_1,
#endif
#endif
#if _channel_C_options_new == "SERDES Only(8/16-bit)"
  hdinp_2, hdinn_2, hdoutp_2, hdoutn_2,
  txd_2, rxd_2, rx_lsd_2,
  tclk_2, rclk_2,
  ref_2_sclk, rx_2_sclk,
  tx_rst_2, rx_rst_2,
#if _en_control_ports == 1
  felb_2,
#endif
#endif
#if _channel_C_options_new == "SERDES Only(10/20-bit)"
  hdinp_2, hdinn_2, hdoutp_2, hdoutn_2,
  txd_2, rxd_2, tclk_2, rclk_2,
  ref_2_sclk, rx_2_sclk,
  tx_rst_2, rx_rst_2, rx_lsd_2,
#if _en_control_ports == 1
  felb_2, word_align_en_2,
#endif
#endif
#if _channel_C_options_new == "8b10b"
  hdinp_2, hdinn_2, hdoutp_2, hdoutn_2,
  txd_2, tx_k_2, tx_force_disp_2, tx_disp_sel_2,
  rxd_2, rx_k_2, rx_disp_err_detect_2, rx_cv_detect_2,
  tclk_2, rclk_2,
  ref_2_sclk, rx_2_sclk,
  tx_rst_2, rx_rst_2,
#if _en_control_ports == 1
  tx_crc_init_2, rx_crc_eop_2,
  word_align_en_2, mca_align_en_2, felb_2, 
  lsm_en_2, lsm_status_2,
#endif
#endif
#if _channel_C_options_new == "Fibre Channel(Single SERDES)"
  hdinp_2, hdinn_2, hdoutp_2, hdoutn_2,
  txd_2, tx_k_2, tx_force_disp_2, tx_disp_sel_2, tx_sof_2,
  rxd_2, rx_k_2, rx_disp_err_detect_2, rx_sof_2, rx_crc_eof_2,
  tclk_2, rclk_2,
  ref_2_sclk, 
  tx_rst_2, rx_rst_2,
#if _en_control_ports == 1
  lsm_en_2, felb_2, lsm_status_2, ctc_orun_2, ctc_urun_2,
#endif
#endif
#if _channel_C_options_new == "1x PCI Express"
  hdinp_2, hdinn_2, hdoutp_2, hdoutn_2,
  txd_2, tx_k_2, tx_force_disp_2, tx_disp_sel_2, 
  rxd_2, rx_k_2, rx_disp_err_detect_2, rx_cv_detect_2,
  tclk_2, rclk_2,
  elec_idel_2, rx_detect_test_2, tx_scrm_en_2, rx_scrm_en_2,
  rx_detect_2, rx_detect_done_2,
  ref_2_sclk, 
  rx_ei_detect_2, 
  rx_invert_2, 
  tx_rst_2, rx_rst_2,
#if _en_control_ports == 1
  lsm_en_2, mca_align_en_2, felb_2, lsm_status_2, ctc_orun_2, ctc_urun_2,
#endif
#endif
#if _channel_C_options_new == "1x RapidIO"
  hdinp_2, hdinn_2, hdoutp_2, hdoutn_2,
  txd_2, txc_2, rxd_2, rxc_2,
  tclk_2, rclk_2,
  ref_2_sclk, 
  tx_rst_2, rx_rst_2,
#if _en_control_ports == 1
  lsm_en_2, felb_2, lsm_status_2, ctc_orun_2, ctc_urun_2,
#endif
#endif
#if _channel_C_options_new == "Gigabit Ethernet"
  hdinp_2, hdinn_2, hdoutp_2, hdoutn_2,
  txd_2, tx_en_2, tx_er_2, tx_crc_insert_2, tx_sfd_2,
  rxd_2, rx_dv_2, rx_er_2, rx_crc_eop_2, rx_sfd_2,
  tclk_2, rclk_2,
  ref_2_sclk, 
  tx_rst_2, rx_rst_2,
#if _en_control_ports == 1
  lsm_en_2, felb_2, lsm_status_2, ctc_orun_2, ctc_urun_2,
#endif
#endif
#if _channel_C_options_new == "SONET(STS-12, STS-48)"
  hdinp_2, hdinn_2, hdoutp_2, hdoutn_2,
  txd_2, tx_fp_2,
  rxd_2, rx_spe_2, rx_oof_2, rx_fp_2,
  rx_j1b1_2, 
  tclk_2, rclk_2,
  ref_2_sclk, rx_2_sclk,
  tx_rst_2, rx_rst_2,
#if _en_control_ports == 1
  mca_align_en_2, felb_2,
#endif
#endif
#if _channel_D_options_new == "SERDES Only(8/16-bit)"
  hdinp_3, hdinn_3, hdoutp_3, hdoutn_3,
  txd_3, rxd_3, rx_lsd_3,
  tclk_3, rclk_3,
  ref_3_sclk, rx_3_sclk,
  tx_rst_3, rx_rst_3,
#if _en_control_ports == 1
  felb_3,
#endif
#endif
#if _channel_D_options_new == "SERDES Only(10/20-bit)"
  hdinp_3, hdinn_3, hdoutp_3, hdoutn_3,
  txd_3, rxd_3, tclk_3, rclk_3,
  ref_3_sclk, rx_3_sclk,
  tx_rst_3, rx_rst_3, rx_lsd_3,
#if _en_control_ports == 1
  felb_3, word_align_en_3,
#endif
#endif
#if _channel_D_options_new == "8b10b"
  hdinp_3, hdinn_3, hdoutp_3, hdoutn_3,
  txd_3, tx_k_3, tx_force_disp_3, tx_disp_sel_3,
  rxd_3, rx_k_3, rx_disp_err_detect_3, rx_cv_detect_3,
  tclk_3, rclk_3,
  ref_3_sclk, rx_3_sclk,
  tx_rst_3, rx_rst_3,
#if _en_control_ports == 1
  tx_crc_init_3, rx_crc_eop_3,
  word_align_en_3, mca_align_en_3, felb_3, 
  lsm_en_3, lsm_status_3,
#endif
#endif
#if _channel_D_options_new == "Fibre Channel(Single SERDES)"
  hdinp_3, hdinn_3, hdoutp_3, hdoutn_3,
  txd_3, tx_k_3, tx_force_disp_3, tx_disp_sel_3, tx_sof_3,
  rxd_3, rx_k_3, rx_disp_err_detect_3, rx_sof_3, rx_crc_eof_3,
  tclk_3, rclk_3,
  ref_3_sclk, 
  tx_rst_3, rx_rst_3,
#if _en_control_ports == 1
  lsm_en_3, felb_3, lsm_status_3, ctc_orun_3, ctc_urun_3,
#endif
#endif
#if _channel_D_options_new == "1x PCI Express"
  hdinp_3, hdinn_3, hdoutp_3, hdoutn_3,
  txd_3, tx_k_3, tx_force_disp_3, tx_disp_sel_3, 
  rxd_3, rx_k_3, rx_disp_err_detect_3, rx_cv_detect_3,
  tclk_3, rclk_3,
  elec_idel_3, rx_detect_test_3, tx_scrm_en_3, rx_scrm_en_3,
  rx_detect_3, rx_detect_done_3,
  ref_3_sclk, 
  rx_ei_detect_3,
  rx_invert_3,
  tx_rst_3, rx_rst_3,
#if _en_control_ports == 1
  lsm_en_3, mca_align_en_3, felb_3, lsm_status_3, ctc_orun_3, ctc_urun_3,
#endif
#endif
#if _channel_D_options_new == "1x RapidIO"
  hdinp_3, hdinn_3, hdoutp_3, hdoutn_3,
  txd_3, txc_3, rxd_3, rxc_3,
  tclk_3, rclk_3,
  ref_3_sclk, 
  tx_rst_3, rx_rst_3,
#if _en_control_ports == 1
  lsm_en_3, felb_3, lsm_status_3, ctc_orun_3, ctc_urun_3,
#endif
#endif
#if _channel_D_options_new == "Gigabit Ethernet"
  hdinp_3, hdinn_3, hdoutp_3, hdoutn_3,
  txd_3, tx_en_3, tx_er_3, tx_crc_insert_3, tx_sfd_3,
  rxd_3, rx_dv_3, rx_er_3, rx_crc_eop_3, rx_sfd_3,
  tclk_3, rclk_3,
  ref_3_sclk, 
  tx_rst_3, rx_rst_3,
#if _en_control_ports == 1
  lsm_en_3, felb_3, lsm_status_3, ctc_orun_3, ctc_urun_3,
#endif
#endif
#if _channel_D_options_new == "SONET(STS-12, STS-48)"
  hdinp_3, hdinn_3, hdoutp_3, hdoutn_3,
  txd_3, tx_fp_3,
  rxd_3, rx_spe_3, rx_oof_3, rx_fp_3,
  rx_j1b1_3, 
  tclk_3, rclk_3,
  ref_3_sclk, rx_3_sclk,
  tx_rst_3, rx_rst_3,
#if _en_control_ports == 1
  mca_align_en_3, felb_3,
#endif
#endif
#endif
#if _en_control_ports == 1
#if _channel_A_options_new == "XAUI" || _channel_A_options_new == "4x Serial RapidIO" || _channel_A_options_new == "4x PCI Express"
  mca_resync, mca_aligned,  
#else
#if _channel_A_options_new == "8b10b" || _channel_A_options_new == "1x PCI Express" || _channel_A_options_new == "SONET(STS-12, STS-48)"
  mca_resync_01,
#endif
#if _channel_A_options_new == "8b10b" && _channel_B_options_new == "8b10b"
  mca_aligned_01, mca_inskew_01, mca_outskew_01,
#endif
#if _channel_A_options_new == "1x PCI Express" && _channel_B_options_new == "1x PCI Express"
  mca_aligned_01, 
#endif
#if _channel_A_options_new == "SONET(STS-12, STS-48)" && _channel_B_options_new == "SONET(STS-12, STS-48)"
  mca_aligned_01, 
#endif
#if _channel_C_options_new == "8b10b" && _channel_D_options_new == "8b10b"
  mca_resync_23, mca_aligned_23, mca_inskew_23, mca_outskew_23,
#endif
#if _channel_C_options_new == "1x PCI Express" && _channel_D_options_new == "1x PCI Express"
  mca_resync_23, mca_aligned_23, 
#endif
#if _channel_C_options_new == "SONET(STS-12, STS-48)" && _channel_D_options_new == "SONET(STS-12, STS-48)"
  mca_resync_23, mca_aligned_23, 
#endif
#endif
#endif

// misc signals to-from fpga //
#if _channel_A_options_new == "SERDES Only(8/16-bit)" || _channel_A_options_new == "SERDES Only(10/20-bit)" || _channel_A_options_new == "8b10b" || _channel_A_options_new == "SONET(STS-12, STS-48)"
  rxa_pclk, rxb_pclk,
#elif _channel_B_options_new == "SERDES Only(8/16-bit)" || _channel_B_options_new == "SERDES Only(10/20-bit)" || _channel_B_options_new == "8b10b" || _channel_B_options_new == "SONET(STS-12, STS-48)"
  rxa_pclk, rxb_pclk,
#elif _channel_C_options_new == "SERDES Only(8/16-bit)" || _channel_C_options_new == "SERDES Only(10/20-bit)" || _channel_C_options_new == "8b10b" || _channel_C_options_new == "SONET(STS-12, STS-48)"
  rxa_pclk, rxb_pclk,
#elif _channel_D_options_new == "SERDES Only(8/16-bit)" || _channel_D_options_new == "SERDES Only(10/20-bit)" || _channel_D_options_new == "8b10b" || _channel_D_options_new == "SONET(STS-12, STS-48)"
  rxa_pclk, rxb_pclk,
#endif
  ref_pclk);

#if _ref_clock_select == "refclk"
input         refclkp, refclkn;
#elif _ref_clock_select == "ff_refclk"
input         refclk, rxrefclk;
#elif _ref_clock_select == "all"
input         refclkp, refclkn;
input         refclk, rxrefclk;
#endif
output        ref_pclk;
#if _channel_A_options_new == "SERDES Only(8/16-bit)" || _channel_A_options_new == "SERDES Only(10/20-bit)" || _channel_A_options_new == "8b10b" || _channel_A_options_new == "SONET(STS-12, STS-48)"
output        rxa_pclk, rxb_pclk;
#elif _channel_B_options_new == "SERDES Only(8/16-bit)" || _channel_B_options_new == "SERDES Only(10/20-bit)" || _channel_B_options_new == "8b10b" || _channel_B_options_new == "SONET(STS-12, STS-48)"
output        rxa_pclk, rxb_pclk;
#elif _channel_C_options_new == "SERDES Only(8/16-bit)" || _channel_C_options_new == "SERDES Only(10/20-bit)" || _channel_C_options_new == "8b10b" || _channel_C_options_new == "SONET(STS-12, STS-48)"
output        rxa_pclk, rxb_pclk;
#elif _channel_D_options_new == "SERDES Only(8/16-bit)" || _channel_D_options_new == "SERDES Only(10/20-bit)" || _channel_D_options_new == "8b10b" || _channel_D_options_new == "SONET(STS-12, STS-48)"
output        rxa_pclk, rxb_pclk;
#endif
input         quad_rst;
input         serdes_rst;
#if _enable_system_bus == 1
input [44:0]  sysbus_in;
output [16:0] sysbus_out;
#endif
#if _channel_A_options_new == "XAUI"  || _channel_A_options_new == "4x Serial RapidIO"
input         hdinp_0, hdinn_0, hdinp_1, hdinn_1;
input         hdinp_2, hdinn_2, hdinp_3, hdinn_3;
output        hdoutp_0, hdoutn_0, hdoutp_1, hdoutn_1;
output        hdoutp_2, hdoutn_2, hdoutp_3, hdoutn_3;
#if _16_bit_ch_a == 1
input  [15:0] txd_0, txd_1, txd_2, txd_3;
input  [1:0]  txc_0, txc_1, txc_2, txc_3;
output [15:0] rxd_0, rxd_1, rxd_2, rxd_3;
output [1:0]  rxc_0, rxc_1, rxc_2, rxc_3;
#elif _16_bit_ch_a == 0
input  [7:0]  txd_0, txd_1, txd_2, txd_3;
input         txc_0, txc_1, txc_2, txc_3;     
output [7:0]  rxd_0, rxd_1, rxd_2, rxd_3;     
output        rxc_0, rxc_1, rxc_2, rxc_3;     
#endif
input         tclk, rclk;
input         tx_rst, rx_rst;
output        ref_0_sclk, ref_1_sclk, ref_2_sclk, ref_3_sclk;
#if _en_control_ports == 1
input         lsm_en, mca_align_en, felb;
output        lsm_status_0, lsm_status_1, lsm_status_2, lsm_status_3;
output        ctc_orun_0, ctc_orun_1, ctc_orun_2, ctc_orun_3;
output        ctc_urun_0, ctc_urun_1, ctc_urun_2, ctc_urun_3;
#endif
#elif _channel_A_options_new == "4x PCI Express"
input         hdinp_0, hdinn_0, hdinp_1, hdinn_1;
input         hdinp_2, hdinn_2, hdinp_3, hdinn_3;
output        hdoutp_0, hdoutn_0, hdoutp_1, hdoutn_1;
output        hdoutp_2, hdoutn_2, hdoutp_3, hdoutn_3;
input         tclk, rclk;
input         tx_rst, rx_rst;
output        rx_ei_detect_0, rx_ei_detect_1, rx_ei_detect_2, rx_ei_detect_3;
input         rx_invert_0, rx_invert_1, rx_invert_2, rx_invert_3;
#if _16_bit_ch_a == 1
input  [15:0] txd_0, txd_1, txd_2, txd_3;
input  [1:0]  tx_k_0, tx_k_1, tx_k_2, tx_k_3;
input  [1:0]  tx_force_disp_0, tx_force_disp_1, tx_force_disp_2, tx_force_disp_3;
input  [1:0]  tx_disp_sel_0, tx_disp_sel_1, tx_disp_sel_2, tx_disp_sel_3;
output [15:0] rxd_0, rxd_1, rxd_2, rxd_3;
output [1:0]  rx_k_0, rx_k_1, rx_k_2, rx_k_3;
output [1:0]  rx_disp_err_detect_0, rx_disp_err_detect_1, rx_disp_err_detect_2, rx_disp_err_detect_3;
output [1:0]  rx_cv_detect_0, rx_cv_detect_1, rx_cv_detect_2, rx_cv_detect_3;
#elif _16_bit_ch_a == 0
input  [7:0]  txd_0, txd_1, txd_2, txd_3;
input         tx_k_0, tx_k_1, tx_k_2, tx_k_3;
input         tx_force_disp_0, tx_force_disp_1, tx_force_disp_2, tx_force_disp_3;
input         tx_disp_sel_0, tx_disp_sel_1, tx_disp_sel_2, tx_disp_sel_3;
output [7:0]  rxd_0, rxd_1, rxd_2, rxd_3;
output        rx_k_0, rx_k_1, rx_k_2, rx_k_3;
output        rx_disp_err_detect_0, rx_disp_err_detect_1, rx_disp_err_detect_2, rx_disp_err_detect_3;
output        rx_cv_detect_0, rx_cv_detect_1, rx_cv_detect_2, rx_cv_detect_3;
#endif
input         elec_idel_0, elec_idel_1, elec_idel_2, elec_idel_3;
input         rx_detect_test_0, rx_detect_test_1, rx_detect_test_2, rx_detect_test_3;
input         tx_scrm_en, rx_scrm_en;
output        rx_detect_0, rx_detect_1, rx_detect_2, rx_detect_3;
output        rx_detect_done_0, rx_detect_done_1, rx_detect_done_2, rx_detect_done_3;
output        ref_0_sclk, ref_1_sclk, ref_2_sclk, ref_3_sclk;
#if _en_control_ports == 1
input         lsm_en, felb;
input         mca_align_en_0, mca_align_en_1, mca_align_en_2, mca_align_en_3;
output        lsm_status_0, lsm_status_1, lsm_status_2, lsm_status_3;
output        ctc_orun_0, ctc_orun_1, ctc_orun_2, ctc_orun_3;
output        ctc_urun_0, ctc_urun_1, ctc_urun_2, ctc_urun_3;
#endif
#else
#if _channel_A_options_new == "SERDES Only(8/16-bit)"
input         hdinp_0, hdinn_0;
output        hdoutp_0, hdoutn_0;
input         tclk_0, rclk_0;
input         tx_rst_0, rx_rst_0; 
output        ref_0_sclk, rx_0_sclk;
output        rx_lsd_0;
#if _16_bit_ch_a == 1
input  [15:0] txd_0;
output [15:0] rxd_0;
#elif _16_bit_ch_a == 0
input  [7:0]  txd_0;
output [7:0]  rxd_0;
#endif
#if _en_control_ports == 1
input         felb_0;
#endif
#endif
#if _channel_A_options_new == "SERDES Only(10/20-bit)"
input         hdinp_0, hdinn_0;
output        hdoutp_0, hdoutn_0;
input         tclk_0, rclk_0;
input         tx_rst_0, rx_rst_0; 
output        ref_0_sclk, rx_0_sclk;
output        rx_lsd_0;
#if _20_bit_ch_a == 1
input  [19:0] txd_0;
output [19:0] rxd_0;
#elif _20_bit_ch_a == 0
input  [9:0]  txd_0;
output [9:0]  rxd_0;
#endif
#if _en_control_ports == 1
input         felb_0, word_align_en_0;
#endif
#endif
#if _channel_A_options_new == "8b10b"
input         hdinp_0, hdinn_0;
output        hdoutp_0, hdoutn_0;
input         tclk_0, rclk_0;
input         tx_rst_0, rx_rst_0; 
output        ref_0_sclk, rx_0_sclk;
#if _16_bit_ch_a == 1
input  [15:0] txd_0;
input  [1:0]  tx_k_0, tx_force_disp_0, tx_disp_sel_0;
output [15:0] rxd_0;
output [1:0]  rx_k_0, rx_disp_err_detect_0, rx_cv_detect_0;
#elif _16_bit_ch_a == 0
input  [7:0]  txd_0;
input         tx_k_0, tx_force_disp_0, tx_disp_sel_0;
output [7:0]  rxd_0;
output        rx_k_0, rx_disp_err_detect_0, rx_cv_detect_0;
#endif
#if _en_control_ports == 1
#if _16_bit_ch_a == 1
input  [1:0]  tx_crc_init_0;
output [1:0]  rx_crc_eop_0;
#elif _16_bit_ch_a == 0
input         tx_crc_init_0;
output        rx_crc_eop_0;
#endif
input         word_align_en_0, mca_align_en_0, felb_0;
input         lsm_en_0;
output        lsm_status_0;
#endif
#endif
#if _channel_A_options_new == "Fibre Channel(Single SERDES)"
input         hdinp_0, hdinn_0;
output        hdoutp_0, hdoutn_0;
input         tclk_0, rclk_0;
input         tx_rst_0, rx_rst_0; 
output        ref_0_sclk;
#if _16_bit_ch_a == 1
input  [15:0] txd_0;
input  [1:0]  tx_k_0, tx_force_disp_0, tx_disp_sel_0, tx_sof_0;
output [15:0] rxd_0;
output [1:0]  rx_k_0, rx_disp_err_detect_0, rx_sof_0, rx_crc_eof_0;
#elif _16_bit_ch_a == 0
input  [7:0]  txd_0;
input         tx_k_0, tx_force_disp_0, tx_disp_sel_0, tx_sof_0;
output [7:0]  rxd_0;
output        rx_k_0, rx_disp_err_detect_0, rx_sof_0, rx_crc_eof_0;
#endif
#if _en_control_ports == 1
input         lsm_en_0, felb_0;
output        lsm_status_0, ctc_orun_0, ctc_urun_0;
#endif
#endif
#if _channel_A_options_new == "1x PCI Express"
input         hdinp_0, hdinn_0;
output        hdoutp_0, hdoutn_0;
input         tclk_0, rclk_0;
input         tx_rst_0, rx_rst_0; 
output        ref_0_sclk;
input         elec_idel_0, rx_detect_test_0, tx_scrm_en_0, rx_scrm_en_0;
output        rx_detect_0, rx_detect_done_0;
output        rx_ei_detect_0;
input         rx_invert_0;
#if _16_bit_ch_a == 1
input  [15:0] txd_0;
input  [1:0]  tx_k_0, tx_force_disp_0, tx_disp_sel_0;
output [15:0] rxd_0;
output [1:0]  rx_k_0, rx_disp_err_detect_0, rx_cv_detect_0;
#elif _16_bit_ch_a == 0
input  [7:0]  txd_0;
input         tx_k_0, tx_force_disp_0, tx_disp_sel_0;
output [7:0]  rxd_0;
output        rx_k_0, rx_disp_err_detect_0, rx_cv_detect_0;
#endif
#if _en_control_ports == 1
input         lsm_en_0, mca_align_en_0, felb_0;
output        lsm_status_0, ctc_orun_0, ctc_urun_0;
#endif
#endif
#if _channel_A_options_new == "1x RapidIO"
input         hdinp_0, hdinn_0;
output        hdoutp_0, hdoutn_0;
input         tclk_0, rclk_0;
input         tx_rst_0, rx_rst_0; 
output        ref_0_sclk;
#if _16_bit_ch_a == 1
input  [15:0] txd_0;
input  [1:0]  txc_0;
output [15:0] rxd_0;
output [1:0]  rxc_0;
#elif _16_bit_ch_a == 0
input  [7:0]  txd_0;
input         txc_0;
output [7:0]  rxd_0;
output        rxc_0;
#endif
#if _en_control_ports == 1
input         lsm_en_0, felb_0;
output        lsm_status_0, ctc_orun_0, ctc_urun_0;
#endif
#endif
#if _channel_A_options_new == "Gigabit Ethernet"
input         hdinp_0, hdinn_0;
output        hdoutp_0, hdoutn_0;
input         tclk_0, rclk_0;
input         tx_rst_0, rx_rst_0; 
output        ref_0_sclk;
#if _16_bit_ch_a == 1
input  [15:0] txd_0;
input  [1:0]  tx_en_0, tx_er_0, tx_crc_insert_0, tx_sfd_0;
output [15:0] rxd_0;
output [1:0]  rx_dv_0, rx_er_0, rx_crc_eop_0, rx_sfd_0;
#elif _16_bit_ch_a == 0
input  [7:0]  txd_0;
input         tx_en_0, tx_er_0, tx_crc_insert_0, tx_sfd_0;
output [7:0]  rxd_0;
output        rx_dv_0, rx_er_0, rx_crc_eop_0, rx_sfd_0;
#endif
#if _en_control_ports == 1
input         lsm_en_0, felb_0;
output        lsm_status_0, ctc_orun_0, ctc_urun_0;
#endif
#endif
#if _channel_A_options_new == "SONET(STS-12, STS-48)"
input         hdinp_0, hdinn_0;
output        hdoutp_0, hdoutn_0;
input         tclk_0, rclk_0;
input         tx_rst_0, rx_rst_0; 
output        ref_0_sclk, rx_0_sclk;
#if _16_bit_ch_a == 1
input  [15:0] txd_0;
input  [1:0]  tx_fp_0;
output [15:0] rxd_0;
output [1:0]  rx_spe_0, rx_oof_0, rx_fp_0;
output [1:0]  rx_j1b1_0;
#elif _16_bit_ch_a == 0
input  [7:0]  txd_0;
input         tx_fp_0;
output [7:0]  rxd_0;
output        rx_spe_0, rx_oof_0, rx_fp_0;
output        rx_j1b1_0;
#endif
#if _en_control_ports == 1
input         mca_align_en_0, felb_0;
#endif
#endif

#if _channel_B_options_new == "SERDES Only(8/16-bit)"
input         hdinp_1, hdinn_1;
output        hdoutp_1, hdoutn_1;
input         tclk_1, rclk_1;
input         tx_rst_1, rx_rst_1;
output        ref_1_sclk, rx_1_sclk;
output        rx_lsd_1;
#if _16_bit_ch_b == 1
input  [15:0] txd_1;
output [15:0] rxd_1;
#elif _16_bit_ch_b == 0
input  [7:0]  txd_1;
output [7:0]  rxd_1;
#endif
#if _en_control_ports == 1
input         felb_1;
#endif
#endif
#if _channel_B_options_new == "SERDES Only(10/20-bit)"
input         hdinp_1, hdinn_1;
output        hdoutp_1, hdoutn_1;
input         tclk_1, rclk_1;
input         tx_rst_1, rx_rst_1;
output        ref_1_sclk, rx_1_sclk;
output        rx_lsd_1;
#if _20_bit_ch_b == 1
input  [19:0] txd_1;
output [19:0] rxd_1;
#elif _20_bit_ch_b == 0
input  [9:0]  txd_1;
output [9:0]  rxd_1;
#endif
#if _en_control_ports == 1
input         felb_1, word_align_en_1;
#endif
#endif
#if _channel_B_options_new == "8b10b"
input         hdinp_1, hdinn_1;
output        hdoutp_1, hdoutn_1;
input         tclk_1, rclk_1;
input         tx_rst_1, rx_rst_1;
output        ref_1_sclk, rx_1_sclk;
#if _16_bit_ch_b == 1
input  [15:0] txd_1;
input  [1:0]  tx_k_1, tx_force_disp_1, tx_disp_sel_1;
output [15:0] rxd_1;
output [1:0]  rx_k_1, rx_disp_err_detect_1, rx_cv_detect_1;
#elif _16_bit_ch_b == 0
input  [7:0]  txd_1;
input         tx_k_1, tx_force_disp_1, tx_disp_sel_1;
output [7:0]  rxd_1;
output        rx_k_1, rx_disp_err_detect_1, rx_cv_detect_1;
#endif
#if _en_control_ports == 1
#if _16_bit_ch_a == 1
input  [1:0]  tx_crc_init_1;
output [1:0]  rx_crc_eop_1;
#elif _16_bit_ch_a == 0
input         tx_crc_init_1;
output        rx_crc_eop_1;
#endif
input         word_align_en_1, mca_align_en_1, felb_1;
input         lsm_en_1;
output        lsm_status_1;
#endif
#endif
#if _channel_B_options_new == "Fibre Channel(Single SERDES)"
input         hdinp_1, hdinn_1;
output        hdoutp_1, hdoutn_1;
input         tclk_1, rclk_1;
input         tx_rst_1, rx_rst_1; 
output        ref_1_sclk;
#if _16_bit_ch_b == 1
input  [15:0] txd_1;
input  [1:0]  tx_k_1, tx_force_disp_1, tx_disp_sel_1, tx_sof_1;
output [15:0] rxd_1;
output [1:0]  rx_k_1, rx_disp_err_detect_1, rx_sof_1, rx_crc_eof_1;
#elif _16_bit_ch_b == 0
input  [7:0]  txd_1;
input         tx_k_1, tx_force_disp_1, tx_disp_sel_1, tx_sof_1;
output [7:0]  rxd_1;
output        rx_k_1, rx_disp_err_detect_1, rx_sof_1, rx_crc_eof_1;
#endif
#if _en_control_ports == 1
input         lsm_en_1, felb_1;
output        lsm_status_1, ctc_orun_1, ctc_urun_1;
#endif
#endif
#if _channel_B_options_new == "1x PCI Express"
input         hdinp_1, hdinn_1;
output        hdoutp_1, hdoutn_1;
input         tclk_1, rclk_1;
input         tx_rst_1, rx_rst_1;
output        ref_1_sclk;
input         elec_idel_1, rx_detect_test_1, tx_scrm_en_1, rx_scrm_en_1;
output        rx_detect_1, rx_detect_done_1;
output        rx_ei_detect_1;
input         rx_invert_1;
#if _16_bit_ch_b == 1
input  [15:0] txd_1;
input  [1:0]  tx_k_1, tx_force_disp_1, tx_disp_sel_1;
output [15:0] rxd_1;
output [1:0]  rx_k_1, rx_disp_err_detect_1, rx_cv_detect_1;
#elif _16_bit_ch_b == 0
input  [7:0]  txd_1;
input         tx_k_1, tx_force_disp_1, tx_disp_sel_1;
output [7:0]  rxd_1;
output        rx_k_1, rx_disp_err_detect_1, rx_cv_detect_1;
#endif
#if _en_control_ports == 1
input         lsm_en_1, mca_align_en_1, felb_1;
output        lsm_status_1, ctc_orun_1, ctc_urun_1;
#endif
#endif
#if _channel_B_options_new == "1x RapidIO"
input         hdinp_1, hdinn_1;
output        hdoutp_1, hdoutn_1;
input         tclk_1, rclk_1;
input         tx_rst_1, rx_rst_1;
output        ref_1_sclk;
#if _16_bit_ch_b == 1
input  [15:0] txd_1;
input  [1:0]  txc_1;
output [15:0] rxd_1;
output [1:0]  rxc_1;
#elif _16_bit_ch_b == 0
input  [7:0]  txd_1;
input         txc_1;
output [7:0]  rxd_1;
output        rxc_1;
#endif
#if _en_control_ports == 1
input         lsm_en_1, felb_1;
output        lsm_status_1, ctc_orun_1, ctc_urun_1;
#endif
#endif
#if _channel_B_options_new == "Gigabit Ethernet"
input         hdinp_1, hdinn_1;
output        hdoutp_1, hdoutn_1;
input         tclk_1, rclk_1;
input         tx_rst_1, rx_rst_1;
output        ref_1_sclk;
#if _16_bit_ch_b == 1
input  [15:0] txd_1;
input  [1:0]  tx_en_1, tx_er_1, tx_crc_insert_1, tx_sfd_1;
output [15:0] rxd_1;
output [1:0]  rx_dv_1, rx_er_1, rx_crc_eop_1, rx_sfd_1;
#elif _16_bit_ch_b == 0
input  [7:0]  txd_1;
input         tx_en_1, tx_er_1, tx_crc_insert_1, tx_sfd_1;
output [7:0]  rxd_1;
output        rx_dv_1, rx_er_1, rx_crc_eop_1, rx_sfd_1;
#endif
#if _en_control_ports == 1
input         lsm_en_1, felb_1;
output        lsm_status_1, ctc_orun_1, ctc_urun_1;
#endif
#endif
#if _channel_B_options_new == "SONET(STS-12, STS-48)"
input         hdinp_1, hdinn_1;
output        hdoutp_1, hdoutn_1;
input         tclk_1, rclk_1;
input         tx_rst_1, rx_rst_1;
output        ref_1_sclk, rx_1_sclk;
#if _16_bit_ch_b == 1
input  [15:0] txd_1;
input  [1:0]  tx_fp_1;
output [15:0] rxd_1;
output [1:0]  rx_spe_1, rx_oof_1, rx_fp_1;
output [1:0]  rx_j1b1_1;
#elif _16_bit_ch_b == 0
input  [7:0]  txd_1;
input         tx_fp_1;
output [7:0]  rxd_1;
output        rx_spe_1, rx_oof_1, rx_fp_1;
output        rx_j1b1_1;
#endif
#if _en_control_ports == 1
input         mca_align_en_1, felb_1;
#endif
#endif

#if _channel_C_options_new == "SERDES Only(8/16-bit)"
input         hdinp_2, hdinn_2;
output        hdoutp_2, hdoutn_2;
input         tclk_2, rclk_2;
input         tx_rst_2, rx_rst_2; 
output        ref_2_sclk, rx_2_sclk;
output        rx_lsd_2;
#if _16_bit_ch_c == 1
input  [15:0] txd_2;
output [15:0] rxd_2;
#elif _16_bit_ch_c == 0
input  [7:0]  txd_2;
output [7:0]  rxd_2;
#endif
#if _en_control_ports == 1
input         felb_2;
#endif
#endif
#if _channel_C_options_new == "SERDES Only(10/20-bit)"
input         hdinp_2, hdinn_2;
output        hdoutp_2, hdoutn_2;
input         tclk_2, rclk_2;
input         tx_rst_2, rx_rst_2; 
output        ref_2_sclk, rx_2_sclk;
output        rx_lsd_2;
#if _20_bit_ch_c == 1
input  [19:0] txd_2;
output [19:0] rxd_2;
#elif _20_bit_ch_c == 0
input  [9:0]  txd_2;
output [9:0]  rxd_2;
#endif
#if _en_control_ports == 1
input         felb_2, word_align_en_2;
#endif
#endif
#if _channel_C_options_new == "8b10b"
input         hdinp_2, hdinn_2;
output        hdoutp_2, hdoutn_2;
input         tclk_2, rclk_2;
input         tx_rst_2, rx_rst_2; 
output        ref_2_sclk, rx_2_sclk;
#if _16_bit_ch_c == 1
input  [15:0] txd_2;
input  [1:0]  tx_k_2, tx_force_disp_2, tx_disp_sel_2;
output [15:0] rxd_2;
output [1:0]  rx_k_2, rx_disp_err_detect_2, rx_cv_detect_2;
#elif _16_bit_ch_c == 0
input  [7:0]  txd_2;
input         tx_k_2, tx_force_disp_2, tx_disp_sel_2;
output [7:0]  rxd_2;
output        rx_k_2, rx_disp_err_detect_2, rx_cv_detect_2;
#endif
#if _en_control_ports == 1
#if _16_bit_ch_c == 1
input  [1:0]  tx_crc_init_2;
output [1:0]  rx_crc_eop_2;
#elif _16_bit_ch_c == 0
input         tx_crc_init_2;
output        rx_crc_eop_2;
#endif
input         word_align_en_2, mca_align_en_2, felb_2;
input         lsm_en_2;
output        lsm_status_2;
#endif
#endif
#if _channel_C_options_new == "Fibre Channel(Single SERDES)"
input         hdinp_2, hdinn_2;
output        hdoutp_2, hdoutn_2;
input         tclk_2, rclk_2;
input         tx_rst_2, rx_rst_2; 
output        ref_2_sclk;
#if _16_bit_ch_c == 1
input  [15:0] txd_2;
input  [1:0]  tx_k_2, tx_force_disp_2, tx_disp_sel_2, tx_sof_2;
output [15:0] rxd_2;
output [1:0]  rx_k_2, rx_disp_err_detect_2, rx_sof_2, rx_crc_eof_2;
#elif _16_bit_ch_c == 0
input  [7:0]  txd_2;
input         tx_k_2, tx_force_disp_2, tx_disp_sel_2, tx_sof_2;
output [7:0]  rxd_2;
output        rx_k_2, rx_disp_err_detect_2, rx_sof_2, rx_crc_eof_2;
#endif
#if _en_control_ports == 1
input         lsm_en_2, felb_2;
output        lsm_status_2, ctc_orun_2, ctc_urun_2;
#endif
#endif
#if _channel_C_options_new == "1x PCI Express"
input         hdinp_2, hdinn_2;
output        hdoutp_2, hdoutn_2;
input         tclk_2, rclk_2;
input         tx_rst_2, rx_rst_2; 
output        ref_2_sclk;
input         elec_idel_2, rx_detect_test_2, tx_scrm_en_2, rx_scrm_en_2;
output        rx_detect_2, rx_detect_done_2;
output        rx_ei_detect_2;
input         rx_invert_2;
#if _16_bit_ch_c == 1
input  [15:0] txd_2;
input  [1:0]  tx_k_2, tx_force_disp_2, tx_disp_sel_2;
output [15:0] rxd_2;
output [1:0]  rx_k_2, rx_disp_err_detect_2, rx_cv_detect_2;
#elif _16_bit_ch_c == 0
input  [7:0]  txd_2;
input         tx_k_2, tx_force_disp_2, tx_disp_sel_2;
output [7:0]  rxd_2;
output        rx_k_2, rx_disp_err_detect_2, rx_cv_detect_2;
#endif
#if _en_control_ports == 1
input         lsm_en_2, mca_align_en_2, felb_2;
output        lsm_status_2, ctc_orun_2, ctc_urun_2;
#endif
#endif
#if _channel_C_options_new == "1x RapidIO"
input         hdinp_2, hdinn_2;
output        hdoutp_2, hdoutn_2;
input         tclk_2, rclk_2;
input         tx_rst_2, rx_rst_2; 
output        ref_2_sclk;
#if _16_bit_ch_c == 1
input  [15:0] txd_2;
input  [1:0]  txc_2;
output [15:0] rxd_2;
output [1:0]  rxc_2;
#elif _16_bit_ch_c == 0
input  [7:0]  txd_2;
input         txc_2;
output [7:0]  rxd_2;
output        rxc_2;
#endif
#if _en_control_ports == 1
input         lsm_en_2, felb_2;
output        lsm_status_2, ctc_orun_2, ctc_urun_2;
#endif
#endif
#if _channel_C_options_new == "Gigabit Ethernet"
input         hdinp_2, hdinn_2;
output        hdoutp_2, hdoutn_2;
input         tclk_2, rclk_2;
input         tx_rst_2, rx_rst_2; 
output        ref_2_sclk;
#if _16_bit_ch_c == 1
input  [15:0] txd_2;
input  [1:0]  tx_en_2, tx_er_2, tx_crc_insert_2, tx_sfd_2;
output [15:0] rxd_2;
output [1:0]  rx_dv_2, rx_er_2, rx_crc_eop_2, rx_sfd_2;
#elif _16_bit_ch_c == 0
input  [7:0]  txd_2;
input         tx_en_2, tx_er_2, tx_crc_insert_2, tx_sfd_2;
output [7:0]  rxd_2;
output        rx_dv_2, rx_er_2, rx_crc_eop_2, rx_sfd_2;
#endif
#if _en_control_ports == 1
input         lsm_en_2, felb_2;
output        lsm_status_2, ctc_orun_2, ctc_urun_2;
#endif
#endif
#if _channel_C_options_new == "SONET(STS-12, STS-48)"
input         hdinp_2, hdinn_2;
output        hdoutp_2, hdoutn_2;
input         tclk_2, rclk_2;
input         tx_rst_2, rx_rst_2; 
output        ref_2_sclk, rx_2_sclk;
#if _16_bit_ch_c == 1
input  [15:0] txd_2;
input  [1:0]  tx_fp_2;
output [15:0] rxd_2;
output [1:0]  rx_spe_2, rx_oof_2, rx_fp_2;
output [1:0]  rx_j1b1_2;
#elif _16_bit_ch_c == 0
input  [7:0]  txd_2;
input         tx_fp_2;
output [7:0]  rxd_2;
output        rx_spe_2, rx_oof_2, rx_fp_2;
output        rx_j1b1_2;
#endif
#if _en_control_ports == 1
input         mca_align_en_2, felb_2;
#endif
#endif

#if _channel_D_options_new == "SERDES Only(8/16-bit)"
input         hdinp_3, hdinn_3;
output        hdoutp_3, hdoutn_3;
input         tclk_3, rclk_3;
input         tx_rst_3, rx_rst_3;
output        ref_3_sclk, rx_3_sclk;
output        rx_lsd_3;
#if _16_bit_ch_b == 1
input  [15:0] txd_3;
output [15:0] rxd_3;
#elif _16_bit_ch_b == 0
input  [7:0]  txd_3;
output [7:0]  rxd_3;
#endif
#if _en_control_ports == 1
input         felb_3;
#endif
#endif
#if _channel_D_options_new == "SERDES Only(10/20-bit)"
input         hdinp_3, hdinn_3;
output        hdoutp_3, hdoutn_3;
input         tclk_3, rclk_3;
input         tx_rst_3, rx_rst_3;
output        ref_3_sclk, rx_3_sclk;
output        rx_lsd_3;
#if _20_bit_ch_b == 1
input  [19:0] txd_3;
output [19:0] rxd_3;
#elif _20_bit_ch_b == 0
input  [9:0]  txd_3;
output [9:0]  rxd_3;
#endif
#if _en_control_ports == 1
input         felb_3, word_align_en_3;
#endif
#endif
#if _channel_D_options_new == "8b10b"
input         hdinp_3, hdinn_3;
output        hdoutp_3, hdoutn_3;
input         tclk_3, rclk_3;
input         tx_rst_3, rx_rst_3;
output        ref_3_sclk, rx_3_sclk;
#if _16_bit_ch_d == 1
input  [15:0] txd_3;
input  [1:0]  tx_k_3, tx_force_disp_3, tx_disp_sel_3;
output [15:0] rxd_3;
output [1:0]  rx_k_3, rx_disp_err_detect_3, rx_cv_detect_3;
#elif _16_bit_ch_d == 0
input  [7:0]  txd_3;
input         tx_k_3, tx_force_disp_3, tx_disp_sel_3;
output [7:0]  rxd_3;
output        rx_k_3, rx_disp_err_detect_3, rx_cv_detect_3;
#endif
#if _en_control_ports == 1
#if _16_bit_ch_a == 1
input  [1:0]  tx_crc_init_3;
output [1:0]  rx_crc_eop_3;
#elif _16_bit_ch_a == 0
input         tx_crc_init_3;
input         rx_crc_eop_3;
#endif
input         word_align_en_3, mca_align_en_3, felb_3;
input         lsm_en_3;
output        lsm_status_3;
#endif
#endif
#if _channel_D_options_new == "Fibre Channel(Single SERDES)"
input         hdinp_3, hdinn_3;
output        hdoutp_3, hdoutn_3;
input         tclk_3, rclk_3;
input         tx_rst_3, rx_rst_3; 
output        ref_3_sclk;
#if _16_bit_ch_d == 1
input  [15:0] txd_3;
input  [1:0]  tx_k_3, tx_force_disp_3, tx_disp_sel_3, tx_sof_3;
output [15:0] rxd_3;
output [1:0]  rx_k_3, rx_disp_err_detect_3, rx_sof_3, rx_crc_eof_3;
#elif _16_bit_ch_d == 0
input  [7:0]  txd_3;
input         tx_k_3, tx_force_disp_3, tx_disp_sel_3, tx_sof_3;
output [7:0]  rxd_3;
output        rx_k_3, rx_disp_err_detect_3, rx_sof_3, rx_crc_eof_3;
#endif
#if _en_control_ports == 1
input         lsm_en_3, felb_3;
output        lsm_status_3, ctc_orun_3, ctc_urun_3;
#endif
#endif
#if _channel_D_options_new == "1x PCI Express"
input         hdinp_3, hdinn_3;
output        hdoutp_3, hdoutn_3;
input         tclk_3, rclk_3;
input         tx_rst_3, rx_rst_3;
output        ref_3_sclk;
input         elec_idel_3, rx_detect_test_3, tx_scrm_en_3, rx_scrm_en_3;
output        rx_detect_3, rx_detect_done_3;
output        rx_ei_detect_3;
input         rx_invert_3;
#if _16_bit_ch_d == 1
input  [15:0] txd_3;
input  [1:0]  tx_k_3, tx_force_disp_3, tx_disp_sel_3;
output [15:0] rxd_3;
output [1:0]  rx_k_3, rx_disp_err_detect_3, rx_cv_detect_3;
#elif _16_bit_ch_d == 0
input  [7:0]  txd_3;
input         tx_k_3, tx_force_disp_3, tx_disp_sel_3;
output [7:0]  rxd_3;
output        rx_k_3, rx_disp_err_detect_3, rx_cv_detect_3;
#endif
#if _en_control_ports == 1
input         lsm_en_3, mca_align_en_3, felb_3;
output        lsm_status_3, ctc_orun_3, ctc_urun_3;
#endif
#endif
#if _channel_D_options_new == "1x RapidIO"
input         hdinp_3, hdinn_3;
output        hdoutp_3, hdoutn_3;
input         tclk_3, rclk_3;
input         tx_rst_3, rx_rst_3;
output        ref_3_sclk;
#if _16_bit_ch_d == 1
input  [15:0] txd_3;
input  [1:0]  txc_3;
output [15:0] rxd_3;
output [1:0]  rxc_3;
#elif _16_bit_ch_d == 0
input  [7:0]  txd_3;
input         txc_3;
output [7:0]  rxd_3;
output        rxc_3;
#endif
#if _en_control_ports == 1
input         lsm_en_3, felb_3;
output        lsm_status_3, ctc_orun_3, ctc_urun_3;
#endif
#endif
#if _channel_D_options_new == "Gigabit Ethernet"
input         hdinp_3, hdinn_3;
output        hdoutp_3, hdoutn_3;
input         tclk_3, rclk_3;
input         tx_rst_3, rx_rst_3;
output        ref_3_sclk;
#if _16_bit_ch_d == 1
input  [15:0] txd_3;
input  [1:0]  tx_en_3, tx_er_3, tx_crc_insert_3, tx_sfd_3;
output [15:0] rxd_3;
output [1:0]  rx_dv_3, rx_er_3, rx_crc_eop_3, rx_sfd_3;
#elif _16_bit_ch_d == 0
input  [7:0]  txd_3;
input         tx_en_3, tx_er_3, tx_crc_insert_3, tx_sfd_3;
output [7:0]  rxd_3;
output        rx_dv_3, rx_er_3, rx_crc_eop_3, rx_sfd_3;
#endif
#if _en_control_ports == 1
input         lsm_en_3, felb_3;
output        lsm_status_3, ctc_orun_3, ctc_urun_3;
#endif
#endif
#if _channel_D_options_new == "SONET(STS-12, STS-48)"
input         hdinp_3, hdinn_3;
output        hdoutp_3, hdoutn_3;
input         tclk_3, rclk_3;
input         tx_rst_3, rx_rst_3;
output        ref_3_sclk, rx_3_sclk;
#if _16_bit_ch_d == 1
input  [15:0] txd_3;
input  [1:0]  tx_fp_3;
output [15:0] rxd_3;
output [1:0]  rx_spe_3, rx_oof_3, rx_fp_3;
output [1:0]  rx_j1b1_3;
#elif _16_bit_ch_d == 0
input  [7:0]  txd_3;
input         tx_fp_3;
output [7:0]  rxd_3;
output        rx_spe_3, rx_oof_3, rx_fp_3;
output        rx_j1b1_3;
#endif
#if _en_control_ports == 1
input         mca_align_en_3, felb_3;
#endif
#endif
#endif

#if _en_control_ports == 1
#if _channel_A_options_new == "XAUI" || _channel_A_options_new == "4x Serial RapidIO" || _channel_A_options_new == "4x PCI Express"
input         mca_resync;
output        mca_aligned;
#else
#if _channel_A_options_new == "8b10b" || _channel_A_options_new == "1x PCI Express" || _channel_A_options_new == "SONET(STS-12, STS-48)"
input         mca_resync_01;
#endif
#if _channel_A_options_new == "8b10b" && _channel_B_options_new == "8b10b"
output        mca_aligned_01, mca_inskew_01, mca_outskew_01;
#endif
#if _channel_A_options_new == "1x PCI Express" && _channel_B_options_new == "1x PCI Express"
output        mca_aligned_01;
#endif
#if _channel_A_options_new == "SONET(STS-12, STS-48)" && _channel_B_options_new == "SONET(STS-12, STS-48)"
output        mca_aligned_01;
#endif
#if _channel_C_options_new == "8b10b" && _channel_D_options_new == "8b10b"
input         mca_resync_23;
output        mca_aligned_23, mca_inskew_23, mca_outskew_23;
#endif
#if _channel_C_options_new == "1x PCI Express" && _channel_D_options_new == "1x PCI Express"
input         mca_resync_23;
output        mca_aligned_23;
#endif
#if _channel_C_options_new == "SONET(STS-12, STS-48)" && _channel_D_options_new == "SONET(STS-12, STS-48)"
input         mca_resync_23;
output        mca_aligned_23;
#endif
#endif
#endif

   wire  fpsc_vlo;

   VLO fpsc_vlo_inst (.Z(fpsc_vlo));

// pcs_quad instance
//synopsys translate_off
  parameter USER_CONFIG_FILE = #_circuit_name_new;
  defparam pcsa_inst.CONFIG_FILE = USER_CONFIG_FILE;

integer file, r;

initial
begin
    file = $fopen(USER_CONFIG_FILE, "r");
    if (file == `NULL)
       $display ("ERROR : Auto configuration file for PCS module not found.  PCS internal configuration registers will not be initialized correctly during simulation!");
end
//synopsys translate_on

PCSA pcsa_inst (
#if _ref_clock_select == "refclk"
 .REFCLKP(refclkp),
 .REFCLKN(refclkn),
 .RXREFCLKP(fpsc_vlo),
 .RXREFCLKN(fpsc_vlo),
 .FFC_CK_CORE_RX(fpsc_vlo),
 .FFC_CK_CORE_TX(fpsc_vlo),
#elif _ref_clock_select == "ff_refclk"
 .REFCLKP(fpsc_vlo),
 .REFCLKN(fpsc_vlo),
 .RXREFCLKP(fpsc_vlo),
 .RXREFCLKN(fpsc_vlo),
 .FFC_CK_CORE_RX(rxrefclk),
 .FFC_CK_CORE_TX(refclk),
#elif _ref_clock_select == "all"
 .REFCLKP(refclkp),
 .REFCLKN(refclkn),
 .RXREFCLKP(fpsc_vlo),
 .RXREFCLKN(fpsc_vlo),
 .FFC_CK_CORE_RX(rxrefclk),
 .FFC_CK_CORE_TX(refclk),
#endif
#if _enable_system_bus == 1
// from sysbus
 .CS_CHIF_0(sysbus_in[0]),
 .CS_CHIF_1(sysbus_in[1]),
 .CS_CHIF_2(sysbus_in[2]),
 .CS_CHIF_3(sysbus_in[3]),
 .CS_QIF(sysbus_in[4]),
 .QUAD_ID_0(sysbus_in[5]),
 .QUAD_ID_1(sysbus_in[6]),
 .ADDRI_0(sysbus_in[7]),
 .ADDRI_1(sysbus_in[8]),
 .ADDRI_2(sysbus_in[9]),
 .ADDRI_3(sysbus_in[10]),
 .ADDRI_4(sysbus_in[11]),
 .ADDRI_5(sysbus_in[12]),
 .ADDRI_6(sysbus_in[13]),
 .ADDRI_7(sysbus_in[14]),
 .WDATAI_0(sysbus_in[15]),
 .WDATAI_1(sysbus_in[16]),
 .WDATAI_2(sysbus_in[17]),
 .WDATAI_3(sysbus_in[18]),
 .WDATAI_4(sysbus_in[19]),
 .WDATAI_5(sysbus_in[20]),
 .WDATAI_6(sysbus_in[21]),
 .WDATAI_7(sysbus_in[22]),
 .RDI(sysbus_in[23]),
 .WSTBI(sysbus_in[24]),
 .GRP_CLK_P1_0(sysbus_in[25]),
 .GRP_CLK_P1_1(sysbus_in[26]),
 .GRP_CLK_P1_2(sysbus_in[27]),
 .GRP_CLK_P1_3(sysbus_in[28]),
 .GRP_CLK_P2_0(sysbus_in[29]),
 .GRP_CLK_P2_1(sysbus_in[30]),
 .GRP_CLK_P2_2(sysbus_in[31]),
 .GRP_CLK_P2_3(sysbus_in[32]),
 .GRP_START_0(sysbus_in[33]),
 .GRP_START_1(sysbus_in[34]),
 .GRP_START_2(sysbus_in[35]),
 .GRP_START_3(sysbus_in[36]),
 .GRP_DONE_0(sysbus_in[37]),
 .GRP_DONE_1(sysbus_in[38]),
 .GRP_DONE_2(sysbus_in[39]),
 .GRP_DONE_3(sysbus_in[40]),
 .GRP_DESKEW_ERROR_0(sysbus_in[41]),
 .GRP_DESKEW_ERROR_1(sysbus_in[42]),
 .GRP_DESKEW_ERROR_2(sysbus_in[43]),
 .GRP_DESKEW_ERROR_3(sysbus_in[44]),
// to sysbusa
 .RDATAO_0(sysbus_out[0]),
 .RDATAO_1(sysbus_out[1]),
 .RDATAO_2(sysbus_out[2]),
 .RDATAO_3(sysbus_out[3]),
 .RDATAO_4(sysbus_out[4]),
 .RDATAO_5(sysbus_out[5]),
 .RDATAO_6(sysbus_out[6]),
 .RDATAO_7(sysbus_out[7]),
 .INTO(sysbus_out[8]),
 .QUAD_CLK(sysbus_out[9]),
 .IQA_START_LS(sysbus_out[10]),
 .IQA_DONE_LS(sysbus_out[11]),
 .IQA_AND_FP1_LS(sysbus_out[12]),
 .IQA_AND_FP0_LS(sysbus_out[13]),
 .IQA_OR_FP1_LS(sysbus_out[14]),
 .IQA_OR_FP0_LS(sysbus_out[15]),
 .IQA_RST_N(sysbus_out[16]),
#elif _enable_system_bus == 0
 .CS_CHIF_0(fpsc_vlo),
 .CS_CHIF_1(fpsc_vlo),
 .CS_CHIF_2(fpsc_vlo),
 .CS_CHIF_3(fpsc_vlo),
 .CS_QIF(fpsc_vlo),
 .QUAD_ID_0(fpsc_vlo),
 .QUAD_ID_1(fpsc_vlo),
 .ADDRI_0(fpsc_vlo),
 .ADDRI_1(fpsc_vlo),
 .ADDRI_2(fpsc_vlo),
 .ADDRI_3(fpsc_vlo),
 .ADDRI_4(fpsc_vlo),
 .ADDRI_5(fpsc_vlo),
 .ADDRI_6(fpsc_vlo),
 .ADDRI_7(fpsc_vlo),
 .WDATAI_0(fpsc_vlo),
 .WDATAI_1(fpsc_vlo),
 .WDATAI_2(fpsc_vlo),
 .WDATAI_3(fpsc_vlo),
 .WDATAI_4(fpsc_vlo),
 .WDATAI_5(fpsc_vlo),
 .WDATAI_6(fpsc_vlo),
 .WDATAI_7(fpsc_vlo),
 .RDI(fpsc_vlo),
 .WSTBI(fpsc_vlo),
 .GRP_CLK_P1_0(fpsc_vlo),
 .GRP_CLK_P1_1(fpsc_vlo),
 .GRP_CLK_P1_2(fpsc_vlo),
 .GRP_CLK_P1_3(fpsc_vlo),
 .GRP_CLK_P2_0(fpsc_vlo),
 .GRP_CLK_P2_1(fpsc_vlo),
 .GRP_CLK_P2_2(fpsc_vlo),
 .GRP_CLK_P2_3(fpsc_vlo),
 .GRP_START_0(fpsc_vlo),
 .GRP_START_1(fpsc_vlo),
 .GRP_START_2(fpsc_vlo),
 .GRP_START_3(fpsc_vlo),
 .GRP_DONE_0(fpsc_vlo),
 .GRP_DONE_1(fpsc_vlo),
 .GRP_DONE_2(fpsc_vlo),
 .GRP_DONE_3(fpsc_vlo),
 .GRP_DESKEW_ERROR_0(fpsc_vlo),
 .GRP_DESKEW_ERROR_1(fpsc_vlo),
 .GRP_DESKEW_ERROR_2(fpsc_vlo),
 .GRP_DESKEW_ERROR_3(fpsc_vlo),
// to sysbusa
 .RDATAO_0(),
 .RDATAO_1(),
 .RDATAO_2(),
 .RDATAO_3(),
 .RDATAO_4(),
 .RDATAO_5(),
 .RDATAO_6(),
 .RDATAO_7(),
 .INTO(),
 .QUAD_CLK(),
 .IQA_START_LS(),
 .IQA_DONE_LS(),
 .IQA_AND_FP1_LS(),
 .IQA_AND_FP0_LS(),
 .IQA_OR_FP1_LS(),
 .IQA_OR_FP0_LS(),
 .IQA_RST_N(),
#endif

#if _channel_A_options_new == "Disabled"
 .FF_TXD_0_19(fpsc_vlo),
 .FF_TXD_0_18(fpsc_vlo),
 .FF_TXD_0_17(fpsc_vlo),
 .FF_TXD_0_16(fpsc_vlo),
 .FF_TXD_0_15(fpsc_vlo),
 .FF_TXD_0_14(fpsc_vlo),
 .FF_TXD_0_13(fpsc_vlo),
 .FF_TXD_0_12(fpsc_vlo),
 .FF_TXD_0_7(fpsc_vlo),
 .FF_TXD_0_6(fpsc_vlo),
 .FF_TXD_0_5(fpsc_vlo),
 .FF_TXD_0_4(fpsc_vlo),
 .FF_TXD_0_3(fpsc_vlo),
 .FF_TXD_0_2(fpsc_vlo),
 .FF_TXD_0_1(fpsc_vlo),
 .FF_TXD_0_0(fpsc_vlo),
 .FB_RXD_0_19(),
 .FB_RXD_0_18(),
 .FB_RXD_0_17(),
 .FB_RXD_0_16(),
 .FB_RXD_0_15(),
 .FB_RXD_0_14(),
 .FB_RXD_0_13(),
 .FB_RXD_0_12(),
 .FB_RXD_0_7(),
 .FB_RXD_0_6(),
 .FB_RXD_0_5(),
 .FB_RXD_0_4(),
 .FB_RXD_0_3(),
 .FB_RXD_0_2(),
 .FB_RXD_0_1(),
 .FB_RXD_0_0(),
#else
#if _channel_A_options_new != "SERDES Only(10/20-bit)"
#if _16_bit_ch_a == 1
 .FF_TXD_0_19(txd_0[15]),
 .FF_TXD_0_18(txd_0[14]),
 .FF_TXD_0_17(txd_0[13]),
 .FF_TXD_0_16(txd_0[12]),
 .FF_TXD_0_15(txd_0[11]),
 .FF_TXD_0_14(txd_0[10]),
 .FF_TXD_0_13(txd_0[9]),
 .FF_TXD_0_12(txd_0[8]),
 .FF_TXD_0_7(txd_0[7]),
 .FF_TXD_0_6(txd_0[6]),
 .FF_TXD_0_5(txd_0[5]),
 .FF_TXD_0_4(txd_0[4]),
 .FF_TXD_0_3(txd_0[3]),
 .FF_TXD_0_2(txd_0[2]),
 .FF_TXD_0_1(txd_0[1]),
 .FF_TXD_0_0(txd_0[0]),
 .FB_RXD_0_19(rxd_0[15]),
 .FB_RXD_0_18(rxd_0[14]),
 .FB_RXD_0_17(rxd_0[13]),
 .FB_RXD_0_16(rxd_0[12]),
 .FB_RXD_0_15(rxd_0[11]),
 .FB_RXD_0_14(rxd_0[10]),
 .FB_RXD_0_13(rxd_0[9]),
 .FB_RXD_0_12(rxd_0[8]),
 .FB_RXD_0_7(rxd_0[7]),
 .FB_RXD_0_6(rxd_0[6]),
 .FB_RXD_0_5(rxd_0[5]),
 .FB_RXD_0_4(rxd_0[4]),
 .FB_RXD_0_3(rxd_0[3]),
 .FB_RXD_0_2(rxd_0[2]),
 .FB_RXD_0_1(rxd_0[1]),
 .FB_RXD_0_0(rxd_0[0]),
#elif _16_bit_ch_a == 0
 .FF_TXD_0_19(fpsc_vlo),
 .FF_TXD_0_18(fpsc_vlo),
 .FF_TXD_0_17(fpsc_vlo),
 .FF_TXD_0_16(fpsc_vlo),
 .FF_TXD_0_15(fpsc_vlo),
 .FF_TXD_0_14(fpsc_vlo),
 .FF_TXD_0_13(fpsc_vlo),
 .FF_TXD_0_12(fpsc_vlo),
 .FF_TXD_0_7(txd_0[7]),
 .FF_TXD_0_6(txd_0[6]),
 .FF_TXD_0_5(txd_0[5]),
 .FF_TXD_0_4(txd_0[4]),
 .FF_TXD_0_3(txd_0[3]),
 .FF_TXD_0_2(txd_0[2]),
 .FF_TXD_0_1(txd_0[1]),
 .FF_TXD_0_0(txd_0[0]),
 .FB_RXD_0_19(),
 .FB_RXD_0_18(),
 .FB_RXD_0_17(),
 .FB_RXD_0_16(),
 .FB_RXD_0_15(),
 .FB_RXD_0_14(),
 .FB_RXD_0_13(),
 .FB_RXD_0_12(),
 .FB_RXD_0_7(rxd_0[7]),
 .FB_RXD_0_6(rxd_0[6]),
 .FB_RXD_0_5(rxd_0[5]),
 .FB_RXD_0_4(rxd_0[4]),
 .FB_RXD_0_3(rxd_0[3]),
 .FB_RXD_0_2(rxd_0[2]),
 .FB_RXD_0_1(rxd_0[1]),
 .FB_RXD_0_0(rxd_0[0]),
#endif
#elif _channel_A_options_new == "SERDES Only(10/20-bit)"
#if _20_bit_ch_a == 1
 .FF_TXD_0_19(txd_0[17]),
 .FF_TXD_0_18(txd_0[16]),
 .FF_TXD_0_17(txd_0[15]),
 .FF_TXD_0_16(txd_0[14]),
 .FF_TXD_0_15(txd_0[13]),
 .FF_TXD_0_14(txd_0[12]),
 .FF_TXD_0_13(txd_0[11]),
 .FF_TXD_0_12(txd_0[10]),
 .FF_TXD_0_7(txd_0[7]),
 .FF_TXD_0_6(txd_0[6]),
 .FF_TXD_0_5(txd_0[5]),
 .FF_TXD_0_4(txd_0[4]),
 .FF_TXD_0_3(txd_0[3]),
 .FF_TXD_0_2(txd_0[2]),
 .FF_TXD_0_1(txd_0[1]),
 .FF_TXD_0_0(txd_0[0]),
 .FB_RXD_0_19(rxd_0[17]),
 .FB_RXD_0_18(rxd_0[16]),
 .FB_RXD_0_17(rxd_0[15]),
 .FB_RXD_0_16(rxd_0[14]),
 .FB_RXD_0_15(rxd_0[13]),
 .FB_RXD_0_14(rxd_0[12]),
 .FB_RXD_0_13(rxd_0[11]),
 .FB_RXD_0_12(rxd_0[10]),
 .FB_RXD_0_7(rxd_0[7]),
 .FB_RXD_0_6(rxd_0[6]),
 .FB_RXD_0_5(rxd_0[5]),
 .FB_RXD_0_4(rxd_0[4]),
 .FB_RXD_0_3(rxd_0[3]),
 .FB_RXD_0_2(rxd_0[2]),
 .FB_RXD_0_1(rxd_0[1]),
 .FB_RXD_0_0(rxd_0[0]),
#elif _20_bit_ch_a == 0
 .FF_TXD_0_19(fpsc_vlo),
 .FF_TXD_0_18(fpsc_vlo),
 .FF_TXD_0_17(fpsc_vlo),
 .FF_TXD_0_16(fpsc_vlo),
 .FF_TXD_0_15(fpsc_vlo),
 .FF_TXD_0_14(fpsc_vlo),
 .FF_TXD_0_13(fpsc_vlo),
 .FF_TXD_0_12(fpsc_vlo),
 .FF_TXD_0_7(txd_0[7]),
 .FF_TXD_0_6(txd_0[6]),
 .FF_TXD_0_5(txd_0[5]),
 .FF_TXD_0_4(txd_0[4]),
 .FF_TXD_0_3(txd_0[3]),
 .FF_TXD_0_2(txd_0[2]),
 .FF_TXD_0_1(txd_0[1]),
 .FF_TXD_0_0(txd_0[0]),
 .FB_RXD_0_19(),
 .FB_RXD_0_18(),
 .FB_RXD_0_17(),
 .FB_RXD_0_16(),
 .FB_RXD_0_15(),
 .FB_RXD_0_14(),
 .FB_RXD_0_13(),
 .FB_RXD_0_12(),
 .FB_RXD_0_7(rxd_0[7]),
 .FB_RXD_0_6(rxd_0[6]),
 .FB_RXD_0_5(rxd_0[5]),
 .FB_RXD_0_4(rxd_0[4]),
 .FB_RXD_0_3(rxd_0[3]),
 .FB_RXD_0_2(rxd_0[2]),
 .FB_RXD_0_1(rxd_0[1]),
 .FB_RXD_0_0(rxd_0[0]),
#endif
#endif
#endif

#if _channel_A_options_new == "Disabled" || _channel_A_options_new == "SERDES Only(8/16-bit)"
 .FF_TXD_0_20(fpsc_vlo),
 .FF_TXD_0_8(fpsc_vlo),
 .FB_RXD_0_20(),
 .FB_RXD_0_8(),
#elif _channel_A_options_new == "SERDES Only(10/20-bit)"
#if _20_bit_ch_a == 1
 .FF_TXD_0_20(txd_0[18]),
 .FF_TXD_0_8(txd_0[8]),
 .FB_RXD_0_20(rxd_0[18]),
 .FB_RXD_0_8(rxd_0[8]),
#elif _20_bit_ch_a == 0
 .FF_TXD_0_20(fpsc_vlo),
 .FF_TXD_0_8(txd_0[8]),
 .FB_RXD_0_20(),
 .FB_RXD_0_8(rxd_0[8]),
#endif
#elif _channel_A_options_new == "Gigabit Ethernet"
#if _16_bit_ch_a == 1
 .FF_TXD_0_20(tx_en_0[1]),
 .FF_TXD_0_8(tx_en_0[0]),
 .FB_RXD_0_20(rx_dv_0[1]),
 .FB_RXD_0_8(rx_dv_0[0]),
#elif _16_bit_ch_a == 0
 .FF_TXD_0_20(fpsc_vlo),
 .FF_TXD_0_8(tx_en_0),
 .FB_RXD_0_20(),
 .FB_RXD_0_8(rx_dv_0),
#endif
#elif _channel_A_options_new == "XAUI" || _channel_A_options_new == "4x Serial RapidIO" || _channel_A_options_new == "1x RapidIO"
#if _16_bit_ch_a == 1
 .FF_TXD_0_20(txc_0[1]),
 .FF_TXD_0_8(txc_0[0]),
 .FB_RXD_0_20(rxc_0[1]),
 .FB_RXD_0_8(rxc_0[0]),
#elif _16_bit_ch_a == 0
 .FF_TXD_0_20(fpsc_vlo),
 .FF_TXD_0_8(txc_0),
 .FB_RXD_0_20(),
 .FB_RXD_0_8(rxc_0),
#endif
#elif _channel_A_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_a == 1
 .FF_TXD_0_20(tx_fp_0[1]),
 .FF_TXD_0_8(tx_fp_0[0]),
 .FB_RXD_0_20(rx_spe_0[1]),
 .FB_RXD_0_8(rx_spe_0[0]),
#elif _16_bit_ch_a == 0
 .FF_TXD_0_20(fpsc_vlo),
 .FF_TXD_0_8(tx_fp_0),
 .FB_RXD_0_20(),
 .FB_RXD_0_8(rx_spe_0),
#endif
#else 
#if _16_bit_ch_a == 1
 .FF_TXD_0_20(tx_k_0[1]),
 .FF_TXD_0_8(tx_k_0[0]),
 .FB_RXD_0_20(rx_k_0[1]),
 .FB_RXD_0_8(rx_k_0[0]),
#elif _16_bit_ch_a == 0
 .FF_TXD_0_20(fpsc_vlo),
 .FF_TXD_0_8(tx_k_0),
 .FB_RXD_0_20(),
 .FB_RXD_0_8(rx_k_0),
#endif
#endif

#if _channel_A_options_new == "SERDES Only(10/20-bit)"
#if _20_bit_ch_a == 1
 .FF_TXD_0_21(txd_0[19]),
 .FF_TXD_0_9(txd_0[9]),
#elif _20_bit_ch_a == 0
 .FF_TXD_0_21(fpsc_vlo),
 .FF_TXD_0_9(txd_0[9]),
#endif
#elif _channel_A_options_new == "8b10b" || _channel_A_options_new == "Fibre Channel(Single SERDES)" || _channel_A_options_new == "1x PCI Express" || _channel_A_options_new == "4x PCI Express"
#if _16_bit_ch_a == 1
 .FF_TXD_0_21(tx_force_disp_0[1]),
 .FF_TXD_0_9(tx_force_disp_0[0]),
#elif _16_bit_ch_a == 0
 .FF_TXD_0_21(fpsc_vlo),
 .FF_TXD_0_9(tx_force_disp_0),
#endif
#elif _channel_A_options_new == "Gigabit Ethernet"
#if _16_bit_ch_a == 1
 .FF_TXD_0_21(tx_er_0[1]),
 .FF_TXD_0_9(tx_er_0[0]),
#elif _16_bit_ch_a == 0
 .FF_TXD_0_21(fpsc_vlo),
 .FF_TXD_0_9(tx_er_0),
#endif
#else
 .FF_TXD_0_21(fpsc_vlo),
 .FF_TXD_0_9(fpsc_vlo),
#endif

#if _channel_A_options_new == "8b10b" || _channel_A_options_new == "Fibre Channel(Single SERDES)" || _channel_A_options_new == "1x PCI Express" || _channel_A_options_new == "4x PCI Express"
#if _16_bit_ch_a == 1
 .FF_TXD_0_22(tx_disp_sel_0[1]),
 .FF_TXD_0_10(tx_disp_sel_0[0]),
#elif _16_bit_ch_a == 0
 .FF_TXD_0_22(fpsc_vlo),
 .FF_TXD_0_10(tx_disp_sel_0),
#endif
#elif _channel_A_options_new == "Gigabit Ethernet"
#if _16_bit_ch_a == 1
 .FF_TXD_0_22(tx_crc_insert_0[1]),
 .FF_TXD_0_10(tx_crc_insert_0[0]),
#elif _16_bit_ch_a == 0
 .FF_TXD_0_22(fpsc_vlo),
 .FF_TXD_0_10(tx_crc_insert_0),
#endif
#else
 .FF_TXD_0_22(fpsc_vlo),
 .FF_TXD_0_10(fpsc_vlo),
#endif
#if _channel_A_options_new == "Fibre Channel(Single SERDES)"  
#if _16_bit_ch_a == 1
 .FF_TXD_0_23(tx_sof_0[1]),
 .FF_TXD_0_11(tx_sof_0[0]),
#elif _16_bit_ch_a == 0
 .FF_TXD_0_23(fpsc_vlo),
 .FF_TXD_0_11(tx_sof_0),
#endif
#elif _channel_A_options_new == "Gigabit Ethernet" 
#if _16_bit_ch_a == 1
 .FF_TXD_0_23(tx_sfd_0[1]),
 .FF_TXD_0_11(tx_sfd_0[0]),
#elif _16_bit_ch_a == 0
 .FF_TXD_0_23(fpsc_vlo),
 .FF_TXD_0_11(tx_sfd_0),
#endif
#elif _channel_A_options_new == "8b10b"
#if _en_control_ports == 1
#if _16_bit_ch_a == 1
 .FF_TXD_0_23(tx_crc_init_0[1]),
 .FF_TXD_0_11(tx_crc_init_0[0]),
#elif _16_bit_ch_a == 0
 .FF_TXD_0_23(fpsc_vlo),
 .FF_TXD_0_11(tx_crc_init_0),
#endif
#elif _en_control_ports == 0
 .FF_TXD_0_23(fpsc_vlo),
 .FF_TXD_0_11(fpsc_vlo),
#endif
#else
 .FF_TXD_0_23(fpsc_vlo),
 .FF_TXD_0_11(fpsc_vlo),
#endif

#if _channel_A_options_new == "SERDES Only(10/20-bit)" 
#if _20_bit_ch_a == 1
 .FB_RXD_0_21(rxd_0[19]),
 .FB_RXD_0_9(rxd_0[9]),
#elif _20_bit_ch_a == 0
 .FB_RXD_0_21(),
 .FB_RXD_0_9(rxd_0[9]),
#endif
#elif _channel_A_options_new == "8b10b" || _channel_A_options_new == "Fibre Channel(Single SERDES)" || _channel_A_options_new == "1x PCI Express" || _channel_A_options_new == "4x PCI Express"
#if _16_bit_ch_a == 1
 .FB_RXD_0_21(rx_disp_err_detect_0[1]),
 .FB_RXD_0_9(rx_disp_err_detect_0[0]),
#elif _16_bit_ch_a == 0
 .FB_RXD_0_21(),
 .FB_RXD_0_9(rx_disp_err_detect_0),
#endif
#elif _channel_A_options_new == "Gigabit Ethernet"
#if _16_bit_ch_a == 1
 .FB_RXD_0_21(rx_er_0[1]),
 .FB_RXD_0_9(rx_er_0[0]),
#elif _16_bit_ch_a == 0
 .FB_RXD_0_21(),
 .FB_RXD_0_9(rx_er_0),
#endif
#elif _channel_A_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_a == 1
 .FB_RXD_0_21(rx_j1b1_0[1]),
 .FB_RXD_0_9(rx_j1b1_0[0]),
#elif _16_bit_ch_a == 0
 .FB_RXD_0_21(),
 .FB_RXD_0_9(rx_j1b1_0),
#endif
#else
 .FB_RXD_0_21(),
 .FB_RXD_0_9(),
#endif

#if _channel_A_options_new == "8b10b" || _channel_A_options_new == "4x PCI Express" || _channel_A_options_new == "1x PCI Express"
#if _16_bit_ch_a == 1
 .FB_RXD_0_22(rx_cv_detect_0[1]),
 .FB_RXD_0_10(rx_cv_detect_0[0]),
#elif _16_bit_ch_a == 0
 .FB_RXD_0_22(),
 .FB_RXD_0_10(rx_cv_detect_0),
#endif
#elif _channel_A_options_new == "Fibre Channel(Single SERDES)"
#if _16_bit_ch_a == 1
 .FB_RXD_0_22(rx_sof_0[1]),
 .FB_RXD_0_10(rx_sof_0[0]),
#elif _16_bit_ch_a == 0
 .FB_RXD_0_22(),
 .FB_RXD_0_10(rx_sof_0),
#endif
#elif _channel_A_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_a == 1
 .FB_RXD_0_22(rx_oof_0[1]),
 .FB_RXD_0_10(rx_oof_0[0]),
#elif _16_bit_ch_a == 0
 .FB_RXD_0_22(),
 .FB_RXD_0_10(rx_oof_0),
#endif
#elif _channel_A_options_new == "Gigabit Ethernet"
#if _16_bit_ch_a == 1
 .FB_RXD_0_22(rx_sfd_0[1]),
 .FB_RXD_0_10(rx_sfd_0[0]),
#elif _16_bit_ch_a == 0
 .FB_RXD_0_22(),
 .FB_RXD_0_10(rx_sfd_0),
#endif
#else
 .FB_RXD_0_22(),
 .FB_RXD_0_10(),
#endif

#if _channel_A_options_new == "Fibre Channel(Single SERDES)" 
#if _16_bit_ch_a == 1
 .FB_RXD_0_23(rx_crc_eof_0[1]),
 .FB_RXD_0_11(rx_crc_eof_0[0]),
#elif _16_bit_ch_a == 0
 .FB_RXD_0_23(),
 .FB_RXD_0_11(rx_crc_eof_0),
#endif
#elif _channel_A_options_new == "Gigabit Ethernet"
#if _16_bit_ch_a == 1
 .FB_RXD_0_23(rx_crc_eop_0[1]),
 .FB_RXD_0_11(rx_crc_eop_0[0]),
#elif _16_bit_ch_a == 0
 .FB_RXD_0_23(),
 .FB_RXD_0_11(rx_crc_eop_0),
#endif
#elif _channel_A_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_a == 1
 .FB_RXD_0_23(rx_fp_0[1]),
 .FB_RXD_0_11(rx_fp_0[0]),
#elif _16_bit_ch_a == 0
 .FB_RXD_0_23(),
 .FB_RXD_0_11(rx_fp_0),
#endif
#elif _channel_A_options_new == "8b10b"
#if _en_control_ports == 1
#if _16_bit_ch_a == 1
 .FB_RXD_0_23(rx_crc_eop_0[1]),
 .FB_RXD_0_11(rx_crc_eop_0[0]),
#elif _16_bit_ch_a == 0
 .FB_RXD_0_23(),
 .FB_RXD_0_11(rx_crc_eop_0),
#endif
#elif _en_control_ports == 0
 .FB_RXD_0_23(),
 .FB_RXD_0_11(),
#endif
#else
 .FB_RXD_0_23(),
 .FB_RXD_0_11(),
#endif


#if _channel_B_options_new == "Disabled"
 .FF_TXD_1_19(fpsc_vlo),
 .FF_TXD_1_18(fpsc_vlo),
 .FF_TXD_1_17(fpsc_vlo),
 .FF_TXD_1_16(fpsc_vlo),
 .FF_TXD_1_15(fpsc_vlo),
 .FF_TXD_1_14(fpsc_vlo),
 .FF_TXD_1_13(fpsc_vlo),
 .FF_TXD_1_12(fpsc_vlo),
 .FF_TXD_1_7(fpsc_vlo),
 .FF_TXD_1_6(fpsc_vlo),
 .FF_TXD_1_5(fpsc_vlo),
 .FF_TXD_1_4(fpsc_vlo),
 .FF_TXD_1_3(fpsc_vlo),
 .FF_TXD_1_2(fpsc_vlo),
 .FF_TXD_1_1(fpsc_vlo),
 .FF_TXD_1_0(fpsc_vlo),
 .FB_RXD_1_19(),
 .FB_RXD_1_18(),
 .FB_RXD_1_17(),
 .FB_RXD_1_16(),
 .FB_RXD_1_15(),
 .FB_RXD_1_14(),
 .FB_RXD_1_13(),
 .FB_RXD_1_12(),
 .FB_RXD_1_7(),
 .FB_RXD_1_6(),
 .FB_RXD_1_5(),
 .FB_RXD_1_4(),
 .FB_RXD_1_3(),
 .FB_RXD_1_2(),
 .FB_RXD_1_1(),
 .FB_RXD_1_0(),
#else
#if _channel_B_options_new != "SERDES Only(10/20-bit)"
#if _16_bit_ch_b == 1
 .FF_TXD_1_19(txd_1[15]),
 .FF_TXD_1_18(txd_1[14]),
 .FF_TXD_1_17(txd_1[13]),
 .FF_TXD_1_16(txd_1[12]),
 .FF_TXD_1_15(txd_1[11]),
 .FF_TXD_1_14(txd_1[10]),
 .FF_TXD_1_13(txd_1[9]),
 .FF_TXD_1_12(txd_1[8]),
 .FF_TXD_1_7(txd_1[7]),
 .FF_TXD_1_6(txd_1[6]),
 .FF_TXD_1_5(txd_1[5]),
 .FF_TXD_1_4(txd_1[4]),
 .FF_TXD_1_3(txd_1[3]),
 .FF_TXD_1_2(txd_1[2]),
 .FF_TXD_1_1(txd_1[1]),
 .FF_TXD_1_0(txd_1[0]),
 .FB_RXD_1_19(rxd_1[15]),
 .FB_RXD_1_18(rxd_1[14]),
 .FB_RXD_1_17(rxd_1[13]),
 .FB_RXD_1_16(rxd_1[12]),
 .FB_RXD_1_15(rxd_1[11]),
 .FB_RXD_1_14(rxd_1[10]),
 .FB_RXD_1_13(rxd_1[9]),
 .FB_RXD_1_12(rxd_1[8]),
 .FB_RXD_1_7(rxd_1[7]),
 .FB_RXD_1_6(rxd_1[6]),
 .FB_RXD_1_5(rxd_1[5]),
 .FB_RXD_1_4(rxd_1[4]),
 .FB_RXD_1_3(rxd_1[3]),
 .FB_RXD_1_2(rxd_1[2]),
 .FB_RXD_1_1(rxd_1[1]),
 .FB_RXD_1_0(rxd_1[0]),
#elif _16_bit_ch_b == 0 
 .FF_TXD_1_19(fpsc_vlo),
 .FF_TXD_1_18(fpsc_vlo),
 .FF_TXD_1_17(fpsc_vlo),
 .FF_TXD_1_16(fpsc_vlo),
 .FF_TXD_1_15(fpsc_vlo),
 .FF_TXD_1_14(fpsc_vlo),
 .FF_TXD_1_13(fpsc_vlo),
 .FF_TXD_1_12(fpsc_vlo),
 .FF_TXD_1_7(txd_1[7]),
 .FF_TXD_1_6(txd_1[6]),
 .FF_TXD_1_5(txd_1[5]),
 .FF_TXD_1_4(txd_1[4]),
 .FF_TXD_1_3(txd_1[3]),
 .FF_TXD_1_2(txd_1[2]),
 .FF_TXD_1_1(txd_1[1]),
 .FF_TXD_1_0(txd_1[0]),
 .FB_RXD_1_19(),
 .FB_RXD_1_18(),
 .FB_RXD_1_17(),
 .FB_RXD_1_16(),
 .FB_RXD_1_15(),
 .FB_RXD_1_14(),
 .FB_RXD_1_13(),
 .FB_RXD_1_12(),
 .FB_RXD_1_7(rxd_1[7]),
 .FB_RXD_1_6(rxd_1[6]),
 .FB_RXD_1_5(rxd_1[5]),
 .FB_RXD_1_4(rxd_1[4]),
 .FB_RXD_1_3(rxd_1[3]),
 .FB_RXD_1_2(rxd_1[2]),
 .FB_RXD_1_1(rxd_1[1]),
 .FB_RXD_1_0(rxd_1[0]),
#endif
#elif _channel_B_options_new == "SERDES Only(10/20-bit)"
#if _20_bit_ch_b == 1
 .FF_TXD_1_19(txd_1[17]),
 .FF_TXD_1_18(txd_1[16]),
 .FF_TXD_1_17(txd_1[15]),
 .FF_TXD_1_16(txd_1[14]),
 .FF_TXD_1_15(txd_1[13]),
 .FF_TXD_1_14(txd_1[12]),
 .FF_TXD_1_13(txd_1[11]),
 .FF_TXD_1_12(txd_1[10]),
 .FF_TXD_1_7(txd_1[7]),
 .FF_TXD_1_6(txd_1[6]),
 .FF_TXD_1_5(txd_1[5]),
 .FF_TXD_1_4(txd_1[4]),
 .FF_TXD_1_3(txd_1[3]),
 .FF_TXD_1_2(txd_1[2]),
 .FF_TXD_1_1(txd_1[1]),
 .FF_TXD_1_0(txd_1[0]),
 .FB_RXD_1_19(rxd_1[17]),
 .FB_RXD_1_18(rxd_1[16]),
 .FB_RXD_1_17(rxd_1[15]),
 .FB_RXD_1_16(rxd_1[14]),
 .FB_RXD_1_15(rxd_1[13]),
 .FB_RXD_1_14(rxd_1[12]),
 .FB_RXD_1_13(rxd_1[11]),
 .FB_RXD_1_12(rxd_1[10]),
 .FB_RXD_1_7(rxd_1[7]),
 .FB_RXD_1_6(rxd_1[6]),
 .FB_RXD_1_5(rxd_1[5]),
 .FB_RXD_1_4(rxd_1[4]),
 .FB_RXD_1_3(rxd_1[3]),
 .FB_RXD_1_2(rxd_1[2]),
 .FB_RXD_1_1(rxd_1[1]),
 .FB_RXD_1_0(rxd_1[0]),
#elif _20_bit_ch_b == 0
 .FF_TXD_1_19(fpsc_vlo),
 .FF_TXD_1_18(fpsc_vlo),
 .FF_TXD_1_17(fpsc_vlo),
 .FF_TXD_1_16(fpsc_vlo),
 .FF_TXD_1_15(fpsc_vlo),
 .FF_TXD_1_14(fpsc_vlo),
 .FF_TXD_1_13(fpsc_vlo),
 .FF_TXD_1_12(fpsc_vlo),
 .FF_TXD_1_7(txd_1[7]),
 .FF_TXD_1_6(txd_1[6]),
 .FF_TXD_1_5(txd_1[5]),
 .FF_TXD_1_4(txd_1[4]),
 .FF_TXD_1_3(txd_1[3]),
 .FF_TXD_1_2(txd_1[2]),
 .FF_TXD_1_1(txd_1[1]),
 .FF_TXD_1_0(txd_1[0]),
 .FB_RXD_1_19(),
 .FB_RXD_1_18(),
 .FB_RXD_1_17(),
 .FB_RXD_1_16(),
 .FB_RXD_1_15(),
 .FB_RXD_1_14(),
 .FB_RXD_1_13(),
 .FB_RXD_1_12(),
 .FB_RXD_1_7(rxd_1[7]),
 .FB_RXD_1_6(rxd_1[6]),
 .FB_RXD_1_5(rxd_1[5]),
 .FB_RXD_1_4(rxd_1[4]),
 .FB_RXD_1_3(rxd_1[3]),
 .FB_RXD_1_2(rxd_1[2]),
 .FB_RXD_1_1(rxd_1[1]),
 .FB_RXD_1_0(rxd_1[0]),
#endif
#endif
#endif

#if _channel_B_options_new == "Disabled" || _channel_B_options_new == "SERDES Only(8/16-bit)"
 .FF_TXD_1_20(fpsc_vlo),
 .FF_TXD_1_8(fpsc_vlo),
 .FB_RXD_1_20(),
 .FB_RXD_1_8(),
#elif _channel_B_options_new == "SERDES Only(10/20-bit)"
#if _20_bit_ch_b == 1
 .FF_TXD_1_20(txd_1[18]),
 .FF_TXD_1_8(txd_1[8]),
 .FB_RXD_1_20(rxd_1[18]),
 .FB_RXD_1_8(rxd_1[8]),
#elif _20_bit_ch_b == 0
 .FF_TXD_1_20(fpsc_vlo),
 .FF_TXD_1_8(txd_1[8]),
 .FB_RXD_1_20(),
 .FB_RXD_1_8(rxd_1[8]),
#endif
#elif _channel_B_options_new == "Gigabit Ethernet"
#if _16_bit_ch_b == 1
 .FF_TXD_1_20(tx_en_1[1]),
 .FF_TXD_1_8(tx_en_1[0]),
 .FB_RXD_1_20(rx_dv_1[1]),
 .FB_RXD_1_8(rx_dv_1[0]),
#elif _16_bit_ch_b == 0
 .FF_TXD_1_20(fpsc_vlo),
 .FF_TXD_1_8(tx_en_1),
 .FB_RXD_1_20(),
 .FB_RXD_1_8(rx_dv_1),
#endif
#elif _channel_B_options_new == "XAUI" || _channel_B_options_new == "4x Serial RapidIO" || _channel_B_options_new == "1x RapidIO"
#if _16_bit_ch_b == 1
 .FF_TXD_1_20(txc_1[1]),
 .FF_TXD_1_8(txc_1[0]),
 .FB_RXD_1_20(rxc_1[1]),
 .FB_RXD_1_8(rxc_1[0]),
#elif _16_bit_ch_b == 0
 .FF_TXD_1_20(fpsc_vlo),
 .FF_TXD_1_8(txc_1),
 .FB_RXD_1_20(),
 .FB_RXD_1_8(rxc_1),
#endif
#elif _channel_B_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_b == 1
 .FF_TXD_1_20(tx_fp_1[1]),
 .FF_TXD_1_8(tx_fp_1[0]),
 .FB_RXD_1_20(rx_spe_1[1]),
 .FB_RXD_1_8(rx_spe_1[0]),
#elif _16_bit_ch_b == 0
 .FF_TXD_1_20(fpsc_vlo),
 .FF_TXD_1_8(tx_fp_1),
 .FB_RXD_1_20(),
 .FB_RXD_1_8(rx_spe_1),
#endif
#else 
#if _16_bit_ch_b == 1
 .FF_TXD_1_20(tx_k_1[1]),
 .FF_TXD_1_8(tx_k_1[0]),
 .FB_RXD_1_20(rx_k_1[1]),
 .FB_RXD_1_8(rx_k_1[0]),
#elif _16_bit_ch_b == 0
 .FF_TXD_1_20(fpsc_vlo),
 .FF_TXD_1_8(tx_k_1),
 .FB_RXD_1_20(),
 .FB_RXD_1_8(rx_k_1),
#endif
#endif

#if _channel_B_options_new == "SERDES Only(10/20-bit)"
#if _20_bit_ch_b == 1
 .FF_TXD_1_21(txd_1[19]),
 .FF_TXD_1_9(txd_1[9]),
#elif _20_bit_ch_b == 0
 .FF_TXD_1_21(fpsc_vlo),
 .FF_TXD_1_9(txd_1[9]),
#endif
#elif _channel_B_options_new == "8b10b" || _channel_B_options_new == "Fibre Channel(Single SERDES)" || _channel_B_options_new == "1x PCI Express" || _channel_B_options_new == "4x PCI Express"
#if _16_bit_ch_b == 1
 .FF_TXD_1_21(tx_force_disp_1[1]),
 .FF_TXD_1_9(tx_force_disp_1[0]),
#elif _16_bit_ch_b == 0
 .FF_TXD_1_21(fpsc_vlo),
 .FF_TXD_1_9(tx_force_disp_1),
#endif
#elif _channel_B_options_new == "Gigabit Ethernet"
#if _16_bit_ch_b == 1
 .FF_TXD_1_21(tx_er_1[1]),
 .FF_TXD_1_9(tx_er_1[0]),
#elif _16_bit_ch_b == 0
 .FF_TXD_1_21(fpsc_vlo),
 .FF_TXD_1_9(tx_er_1),
#endif
#else
 .FF_TXD_1_21(fpsc_vlo),
 .FF_TXD_1_9(fpsc_vlo),
#endif

#if _channel_B_options_new == "8b10b" || _channel_B_options_new == "Fibre Channel(Single SERDES)" || _channel_B_options_new == "1x PCI Express" || _channel_B_options_new == "4x PCI Express"
#if _16_bit_ch_b == 1
 .FF_TXD_1_22(tx_disp_sel_1[1]),
 .FF_TXD_1_10(tx_disp_sel_1[0]),
#elif _16_bit_ch_b == 0
 .FF_TXD_1_22(fpsc_vlo),
 .FF_TXD_1_10(tx_disp_sel_1),
#endif
#elif _channel_B_options_new == "Gigabit Ethernet"
#if _16_bit_ch_b == 1
 .FF_TXD_1_22(tx_crc_insert_1[1]),
 .FF_TXD_1_10(tx_crc_insert_1[0]),
#elif _16_bit_ch_b == 0
 .FF_TXD_1_22(fpsc_vlo),
 .FF_TXD_1_10(tx_crc_insert_1),
#endif
#else
 .FF_TXD_1_22(fpsc_vlo),
 .FF_TXD_1_10(fpsc_vlo),
#endif
#if _channel_B_options_new == "Fibre Channel(Single SERDES)" 
#if _16_bit_ch_b == 1
 .FF_TXD_1_23(tx_sof_1[1]),
 .FF_TXD_1_11(tx_sof_1[0]),
#elif _16_bit_ch_b == 0
 .FF_TXD_1_23(fpsc_vlo),
 .FF_TXD_1_11(tx_sof_1),
#endif
#elif _channel_B_options_new == "Gigabit Ethernet"
#if _16_bit_ch_b == 1
 .FF_TXD_1_23(tx_sfd_1[1]),
 .FF_TXD_1_11(tx_sfd_1[0]),
#elif _16_bit_ch_b == 0
 .FF_TXD_1_23(fpsc_vlo),
 .FF_TXD_1_11(tx_sfd_1),
#endif
#elif _channel_B_options_new == "8b10b"
#if _en_control_ports == 1
#if _16_bit_ch_b == 1
 .FF_TXD_1_23(tx_crc_init_1[1]),
 .FF_TXD_1_11(tx_crc_init_1[0]),
#elif _16_bit_ch_b == 0
 .FF_TXD_1_23(fpsc_vlo),
 .FF_TXD_1_11(tx_crc_init_1),
#endif
#elif _en_control_ports == 0
 .FF_TXD_1_23(fpsc_vlo),
 .FF_TXD_1_11(fpsc_vlo),
#endif
#else
 .FF_TXD_1_23(fpsc_vlo),
 .FF_TXD_1_11(fpsc_vlo),
#endif

#if _channel_B_options_new == "SERDES Only(10/20-bit)" 
#if _20_bit_ch_b == 1
 .FB_RXD_1_21(rxd_1[19]),
 .FB_RXD_1_9(rxd_1[9]),
#elif _20_bit_ch_b == 0
 .FB_RXD_1_21(),
 .FB_RXD_1_9(rxd_1[9]),
#endif
#elif _channel_B_options_new == "8b10b" || _channel_B_options_new == "Fibre Channel(Single SERDES)" || _channel_B_options_new == "1x PCI Express" || _channel_B_options_new == "4x PCI Express"
#if _16_bit_ch_b == 1
 .FB_RXD_1_21(rx_disp_err_detect_1[1]),
 .FB_RXD_1_9(rx_disp_err_detect_1[0]),
#elif _16_bit_ch_b == 0
 .FB_RXD_1_21(),
 .FB_RXD_1_9(rx_disp_err_detect_1),
#endif
#elif _channel_B_options_new == "Gigabit Ethernet"
#if _16_bit_ch_b == 1
 .FB_RXD_1_21(rx_er_1[1]),
 .FB_RXD_1_9(rx_er_1[0]),
#elif _16_bit_ch_b == 0
 .FB_RXD_1_21(),
 .FB_RXD_1_9(rx_er_1),
#endif
#elif _channel_B_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_a == 1
 .FB_RXD_1_21(rx_j1b1_1[1]),
 .FB_RXD_1_9(rx_j1b1_1[0]),
#elif _16_bit_ch_a == 0
 .FB_RXD_1_21(),
 .FB_RXD_1_9(rx_j1b1_1),
#endif
#else
 .FB_RXD_1_21(),
 .FB_RXD_1_9(),
#endif

#if _channel_B_options_new == "8b10b" || _channel_B_options_new == "4x PCI Express" || _channel_B_options_new == "1x PCI Express"
#if _16_bit_ch_b == 1
 .FB_RXD_1_22(rx_cv_detect_1[1]),
 .FB_RXD_1_10(rx_cv_detect_1[0]),
#elif _16_bit_ch_b == 0
 .FB_RXD_1_22(),
 .FB_RXD_1_10(rx_cv_detect_1),
#endif
#elif _channel_B_options_new == "Fibre Channel(Single SERDES)"
#if _16_bit_ch_b == 1
 .FB_RXD_1_22(rx_sof_1[1]),
 .FB_RXD_1_10(rx_sof_1[0]),
#elif _16_bit_ch_b == 0
 .FB_RXD_1_22(),
 .FB_RXD_1_10(rx_sof_1),
#endif
#elif _channel_B_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_b == 1
 .FB_RXD_1_22(rx_oof_1[1]),
 .FB_RXD_1_10(rx_oof_1[0]),
#elif _16_bit_ch_b == 0
 .FB_RXD_1_22(),
 .FB_RXD_1_10(rx_oof_1),
#endif
#elif _channel_B_options_new == "Gigabit Ethernet"
#if _16_bit_ch_b == 1
 .FB_RXD_1_22(rx_sfd_1[1]),
 .FB_RXD_1_10(rx_sfd_1[0]),
#elif _16_bit_ch_b == 0
 .FB_RXD_1_22(),
 .FB_RXD_1_10(rx_sfd_1),
#endif
#else
 .FB_RXD_1_22(),
 .FB_RXD_1_10(),
#endif

#if _channel_B_options_new == "Fibre Channel(Single SERDES)" 
#if _16_bit_ch_b == 1
 .FB_RXD_1_23(rx_crc_eof_1[1]),
 .FB_RXD_1_11(rx_crc_eof_1[0]),
#elif _16_bit_ch_b == 0
 .FB_RXD_1_23(),
 .FB_RXD_1_11(rx_crc_eof_1),
#endif
#elif _channel_B_options_new == "Gigabit Ethernet"
#if _16_bit_ch_b == 1
 .FB_RXD_1_23(rx_crc_eop_1[1]),
 .FB_RXD_1_11(rx_crc_eop_1[0]),
#elif _16_bit_ch_b == 0
 .FB_RXD_1_23(),
 .FB_RXD_1_11(rx_crc_eop_1),
#endif
#elif _channel_B_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_b == 1
 .FB_RXD_1_23(rx_fp_1[1]),
 .FB_RXD_1_11(rx_fp_1[0]),
#elif _16_bit_ch_b == 0
 .FB_RXD_1_23(),
 .FB_RXD_1_11(rx_fp_1),
#endif
#elif _channel_B_options_new == "8b10b"
#if _en_control_ports == 1
#if _16_bit_ch_b == 1
 .FB_RXD_1_23(rx_crc_eop_1[1]),
 .FB_RXD_1_11(rx_crc_eop_1[0]),
#elif _16_bit_ch_b == 0
 .FB_RXD_1_23(),
 .FB_RXD_1_11(rx_crc_eop_1),
#endif
#elif _en_control_ports == 0
 .FB_RXD_1_23(),
 .FB_RXD_1_11(),
#endif
#else
 .FB_RXD_1_23(),
 .FB_RXD_1_11(),
#endif

#if _channel_C_options_new == "Disabled"
 .FF_TXD_2_19(fpsc_vlo),
 .FF_TXD_2_18(fpsc_vlo),
 .FF_TXD_2_17(fpsc_vlo),
 .FF_TXD_2_16(fpsc_vlo),
 .FF_TXD_2_15(fpsc_vlo),
 .FF_TXD_2_14(fpsc_vlo),
 .FF_TXD_2_13(fpsc_vlo),
 .FF_TXD_2_12(fpsc_vlo),
 .FF_TXD_2_7(fpsc_vlo),
 .FF_TXD_2_6(fpsc_vlo),
 .FF_TXD_2_5(fpsc_vlo),
 .FF_TXD_2_4(fpsc_vlo),
 .FF_TXD_2_3(fpsc_vlo),
 .FF_TXD_2_2(fpsc_vlo),
 .FF_TXD_2_1(fpsc_vlo),
 .FF_TXD_2_0(fpsc_vlo),
 .FB_RXD_2_19(),
 .FB_RXD_2_18(),
 .FB_RXD_2_17(),
 .FB_RXD_2_16(),
 .FB_RXD_2_15(),
 .FB_RXD_2_14(),
 .FB_RXD_2_13(),
 .FB_RXD_2_12(),
 .FB_RXD_2_7(),
 .FB_RXD_2_6(),
 .FB_RXD_2_5(),
 .FB_RXD_2_4(),
 .FB_RXD_2_3(),
 .FB_RXD_2_2(),
 .FB_RXD_2_1(),
 .FB_RXD_2_0(),
#else
#if _channel_C_options_new != "SERDES Only(10/20-bit)"
#if _16_bit_ch_c == 1
 .FF_TXD_2_19(txd_2[15]),
 .FF_TXD_2_18(txd_2[14]),
 .FF_TXD_2_17(txd_2[13]),
 .FF_TXD_2_16(txd_2[12]),
 .FF_TXD_2_15(txd_2[11]),
 .FF_TXD_2_14(txd_2[10]),
 .FF_TXD_2_13(txd_2[9]),
 .FF_TXD_2_12(txd_2[8]),
 .FF_TXD_2_7(txd_2[7]),
 .FF_TXD_2_6(txd_2[6]),
 .FF_TXD_2_5(txd_2[5]),
 .FF_TXD_2_4(txd_2[4]),
 .FF_TXD_2_3(txd_2[3]),
 .FF_TXD_2_2(txd_2[2]),
 .FF_TXD_2_1(txd_2[1]),
 .FF_TXD_2_0(txd_2[0]),
 .FB_RXD_2_19(rxd_2[15]),
 .FB_RXD_2_18(rxd_2[14]),
 .FB_RXD_2_17(rxd_2[13]),
 .FB_RXD_2_16(rxd_2[12]),
 .FB_RXD_2_15(rxd_2[11]),
 .FB_RXD_2_14(rxd_2[10]),
 .FB_RXD_2_13(rxd_2[9]),
 .FB_RXD_2_12(rxd_2[8]),
 .FB_RXD_2_7(rxd_2[7]),
 .FB_RXD_2_6(rxd_2[6]),
 .FB_RXD_2_5(rxd_2[5]),
 .FB_RXD_2_4(rxd_2[4]),
 .FB_RXD_2_3(rxd_2[3]),
 .FB_RXD_2_2(rxd_2[2]),
 .FB_RXD_2_1(rxd_2[1]),
 .FB_RXD_2_0(rxd_2[0]),
#elif _16_bit_ch_c == 0
 .FF_TXD_2_19(fpsc_vlo),
 .FF_TXD_2_18(fpsc_vlo),
 .FF_TXD_2_17(fpsc_vlo),
 .FF_TXD_2_16(fpsc_vlo),
 .FF_TXD_2_15(fpsc_vlo),
 .FF_TXD_2_14(fpsc_vlo),
 .FF_TXD_2_13(fpsc_vlo),
 .FF_TXD_2_12(fpsc_vlo),
 .FF_TXD_2_7(txd_2[7]),
 .FF_TXD_2_6(txd_2[6]),
 .FF_TXD_2_5(txd_2[5]),
 .FF_TXD_2_4(txd_2[4]),
 .FF_TXD_2_3(txd_2[3]),
 .FF_TXD_2_2(txd_2[2]),
 .FF_TXD_2_1(txd_2[1]),
 .FF_TXD_2_0(txd_2[0]),
 .FB_RXD_2_19(),
 .FB_RXD_2_18(),
 .FB_RXD_2_17(),
 .FB_RXD_2_16(),
 .FB_RXD_2_15(),
 .FB_RXD_2_14(),
 .FB_RXD_2_13(),
 .FB_RXD_2_12(),
 .FB_RXD_2_7(rxd_2[7]),
 .FB_RXD_2_6(rxd_2[6]),
 .FB_RXD_2_5(rxd_2[5]),
 .FB_RXD_2_4(rxd_2[4]),
 .FB_RXD_2_3(rxd_2[3]),
 .FB_RXD_2_2(rxd_2[2]),
 .FB_RXD_2_1(rxd_2[1]),
 .FB_RXD_2_0(rxd_2[0]),
#endif
#elif _channel_C_options_new == "SERDES Only(10/20-bit)"
#if _20_bit_ch_c == 1
 .FF_TXD_2_19(txd_2[17]),
 .FF_TXD_2_18(txd_2[16]),
 .FF_TXD_2_17(txd_2[15]),
 .FF_TXD_2_16(txd_2[14]),
 .FF_TXD_2_15(txd_2[13]),
 .FF_TXD_2_14(txd_2[12]),
 .FF_TXD_2_13(txd_2[11]),
 .FF_TXD_2_12(txd_2[10]),
 .FF_TXD_2_7(txd_2[7]),
 .FF_TXD_2_6(txd_2[6]),
 .FF_TXD_2_5(txd_2[5]),
 .FF_TXD_2_4(txd_2[4]),
 .FF_TXD_2_3(txd_2[3]),
 .FF_TXD_2_2(txd_2[2]),
 .FF_TXD_2_1(txd_2[1]),
 .FF_TXD_2_0(txd_2[0]),
 .FB_RXD_2_19(rxd_2[17]),
 .FB_RXD_2_18(rxd_2[16]),
 .FB_RXD_2_17(rxd_2[15]),
 .FB_RXD_2_16(rxd_2[14]),
 .FB_RXD_2_15(rxd_2[13]),
 .FB_RXD_2_14(rxd_2[12]),
 .FB_RXD_2_13(rxd_2[11]),
 .FB_RXD_2_12(rxd_2[10]),
 .FB_RXD_2_7(rxd_2[7]),
 .FB_RXD_2_6(rxd_2[6]),
 .FB_RXD_2_5(rxd_2[5]),
 .FB_RXD_2_4(rxd_2[4]),
 .FB_RXD_2_3(rxd_2[3]),
 .FB_RXD_2_2(rxd_2[2]),
 .FB_RXD_2_1(rxd_2[1]),
 .FB_RXD_2_0(rxd_2[0]),
#elif _20_bit_ch_c == 0
 .FF_TXD_2_19(fpsc_vlo),
 .FF_TXD_2_18(fpsc_vlo),
 .FF_TXD_2_17(fpsc_vlo),
 .FF_TXD_2_16(fpsc_vlo),
 .FF_TXD_2_15(fpsc_vlo),
 .FF_TXD_2_14(fpsc_vlo),
 .FF_TXD_2_13(fpsc_vlo),
 .FF_TXD_2_12(fpsc_vlo),
 .FF_TXD_2_7(txd_2[7]),
 .FF_TXD_2_6(txd_2[6]),
 .FF_TXD_2_5(txd_2[5]),
 .FF_TXD_2_4(txd_2[4]),
 .FF_TXD_2_3(txd_2[3]),
 .FF_TXD_2_2(txd_2[2]),
 .FF_TXD_2_1(txd_2[1]),
 .FF_TXD_2_0(txd_2[0]),
 .FB_RXD_2_19(),
 .FB_RXD_2_18(),
 .FB_RXD_2_17(),
 .FB_RXD_2_16(),
 .FB_RXD_2_15(),
 .FB_RXD_2_14(),
 .FB_RXD_2_13(),
 .FB_RXD_2_12(),
 .FB_RXD_2_7(rxd_2[7]),
 .FB_RXD_2_6(rxd_2[6]),
 .FB_RXD_2_5(rxd_2[5]),
 .FB_RXD_2_4(rxd_2[4]),
 .FB_RXD_2_3(rxd_2[3]),
 .FB_RXD_2_2(rxd_2[2]),
 .FB_RXD_2_1(rxd_2[1]),
 .FB_RXD_2_0(rxd_2[0]),
#endif
#endif
#endif

#if _channel_C_options_new == "Disabled" || _channel_C_options_new == "SERDES Only(8/16-bit)"
 .FF_TXD_2_20(fpsc_vlo),
 .FF_TXD_2_8(fpsc_vlo),
 .FB_RXD_2_20(),
 .FB_RXD_2_8(),
#elif _channel_C_options_new == "SERDES Only(10/20-bit)"
#if _20_bit_ch_c == 1
 .FF_TXD_2_20(txd_2[18]),
 .FF_TXD_2_8(txd_2[8]),
 .FB_RXD_2_20(rxd_2[18]),
 .FB_RXD_2_8(rxd_2[8]),
#elif _20_bit_ch_c == 0
 .FF_TXD_2_20(fpsc_vlo),
 .FF_TXD_2_8(txd_2[8]),
 .FB_RXD_2_20(),
 .FB_RXD_2_8(rxd_2[8]),
#endif
#elif _channel_C_options_new == "Gigabit Ethernet"
#if _16_bit_ch_c == 1
 .FF_TXD_2_20(tx_en_2[1]),
 .FF_TXD_2_8(tx_en_2[0]),
 .FB_RXD_2_20(rx_dv_2[1]),
 .FB_RXD_2_8(rx_dv_2[0]),
#elif _16_bit_ch_c == 0
 .FF_TXD_2_20(fpsc_vlo),
 .FF_TXD_2_8(tx_en_2),
 .FB_RXD_2_20(),
 .FB_RXD_2_8(rx_dv_2),
#endif
#elif _channel_C_options_new == "XAUI" || _channel_C_options_new == "4x Serial RapidIO" || _channel_C_options_new == "1x RapidIO"
#if _16_bit_ch_c == 1
 .FF_TXD_2_20(txc_2[1]),
 .FF_TXD_2_8(txc_2[0]),
 .FB_RXD_2_20(rxc_2[1]),
 .FB_RXD_2_8(rxc_2[0]),
#elif _16_bit_ch_c == 0
 .FF_TXD_2_20(fpsc_vlo),
 .FF_TXD_2_8(txc_2),
 .FB_RXD_2_20(),
 .FB_RXD_2_8(rxc_2),
#endif
#elif _channel_C_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_c == 1
 .FF_TXD_2_20(tx_fp_2[1]),
 .FF_TXD_2_8(tx_fp_2[0]),
 .FB_RXD_2_20(rx_spe_2[1]),
 .FB_RXD_2_8(rx_spe_2[0]),
#elif _16_bit_ch_c == 0
 .FF_TXD_2_20(fpsc_vlo),
 .FF_TXD_2_8(tx_fp_2),
 .FB_RXD_2_20(),
 .FB_RXD_2_8(rx_spe_2),
#endif
#else 
#if _16_bit_ch_c == 1
 .FF_TXD_2_20(tx_k_2[1]),
 .FF_TXD_2_8(tx_k_2[0]),
 .FB_RXD_2_20(rx_k_2[1]),
 .FB_RXD_2_8(rx_k_2[0]),
#elif _16_bit_ch_c == 0
 .FF_TXD_2_20(fpsc_vlo),
 .FF_TXD_2_8(tx_k_2),
 .FB_RXD_2_20(),
 .FB_RXD_2_8(rx_k_2),
#endif
#endif

#if _channel_C_options_new == "SERDES Only(10/20-bit)"
#if _20_bit_ch_c == 1
 .FF_TXD_2_21(txd_2[19]),
 .FF_TXD_2_9(txd_2[9]),
#elif _20_bit_ch_c == 0
 .FF_TXD_2_21(fpsc_vlo),
 .FF_TXD_2_9(txd_2[9]),
#endif
#elif _channel_C_options_new == "8b10b" || _channel_C_options_new == "Fibre Channel(Single SERDES)" || _channel_C_options_new == "1x PCI Express" || _channel_C_options_new == "4x PCI Express"
#if _16_bit_ch_c == 1
 .FF_TXD_2_21(tx_force_disp_2[1]),
 .FF_TXD_2_9(tx_force_disp_2[0]),
#elif _16_bit_ch_c == 0
 .FF_TXD_2_21(fpsc_vlo),
 .FF_TXD_2_9(tx_force_disp_2),
#endif
#elif _channel_C_options_new == "Gigabit Ethernet"
#if _16_bit_ch_c == 1
 .FF_TXD_2_21(tx_er_2[1]),
 .FF_TXD_2_9(tx_er_2[0]),
#elif _16_bit_ch_c == 0
 .FF_TXD_2_21(fpsc_vlo),
 .FF_TXD_2_9(tx_er_2),
#endif
#else
 .FF_TXD_2_21(fpsc_vlo),
 .FF_TXD_2_9(fpsc_vlo),
#endif

#if _channel_C_options_new == "8b10b" || _channel_C_options_new == "Fibre Channel(Single SERDES)" || _channel_C_options_new == "1x PCI Express" || _channel_C_options_new == "4x PCI Express"
#if _16_bit_ch_c == 1
 .FF_TXD_2_22(tx_disp_sel_2[1]),
 .FF_TXD_2_10(tx_disp_sel_2[0]),
#elif _16_bit_ch_c == 0
 .FF_TXD_2_22(fpsc_vlo),
 .FF_TXD_2_10(tx_disp_sel_2),
#endif
#elif _channel_C_options_new == "Gigabit Ethernet"
#if _16_bit_ch_c == 1
 .FF_TXD_2_22(tx_crc_insert_2[1]),
 .FF_TXD_2_10(tx_crc_insert_2[0]),
#elif _16_bit_ch_c == 0
 .FF_TXD_2_22(fpsc_vlo),
 .FF_TXD_2_10(tx_crc_insert_2),
#endif
#else
 .FF_TXD_2_22(fpsc_vlo),
 .FF_TXD_2_10(fpsc_vlo),
#endif
#if _channel_C_options_new == "Fibre Channel(Single SERDES)"
#if _16_bit_ch_c == 1
 .FF_TXD_2_23(tx_sof_2[1]),
 .FF_TXD_2_11(tx_sof_2[0]),
#elif _16_bit_ch_c == 0
 .FF_TXD_2_23(fpsc_vlo),
 .FF_TXD_2_11(tx_sof_2),
#endif
#elif _channel_C_options_new == "Gigabit Ethernet"
#if _16_bit_ch_c == 1
 .FF_TXD_2_23(tx_sfd_2[1]),
 .FF_TXD_2_11(tx_sfd_2[0]),
#elif _16_bit_ch_c == 0
 .FF_TXD_2_23(fpsc_vlo),
 .FF_TXD_2_11(tx_sfd_2),
#endif
#elif _channel_C_options_new == "8b10b"
#if _en_control_ports == 1
#if _16_bit_ch_c == 1
 .FF_TXD_2_23(tx_crc_init_2[1]),
 .FF_TXD_2_11(tx_crc_init_2[0]),
#elif _16_bit_ch_c == 0
 .FF_TXD_2_23(fpsc_vlo),
 .FF_TXD_2_11(tx_crc_init_2),
#endif
#elif _en_control_ports == 0
 .FF_TXD_2_23(fpsc_vlo),
 .FF_TXD_2_11(fpsc_vlo),
#endif
#else
 .FF_TXD_2_23(fpsc_vlo),
 .FF_TXD_2_11(fpsc_vlo),
#endif

#if _channel_C_options_new == "SERDES Only(10/20-bit)" 
#if _20_bit_ch_c == 1
 .FB_RXD_2_21(rxd_2[19]),
 .FB_RXD_2_9(rxd_2[9]),
#elif _20_bit_ch_c == 0
 .FB_RXD_2_21(),
 .FB_RXD_2_9(rxd_2[9]),
#endif
#elif _channel_C_options_new == "8b10b" || _channel_C_options_new == "Fibre Channel(Single SERDES)" || _channel_C_options_new == "1x PCI Express" || _channel_C_options_new == "4x PCI Express"
#if _16_bit_ch_c == 1
 .FB_RXD_2_21(rx_disp_err_detect_2[1]),
 .FB_RXD_2_9(rx_disp_err_detect_2[0]),
#elif _16_bit_ch_c == 0
 .FB_RXD_2_21(),
 .FB_RXD_2_9(rx_disp_err_detect_2),
#endif
#elif _channel_C_options_new == "Gigabit Ethernet"
#if _16_bit_ch_c == 1
 .FB_RXD_2_21(rx_er_2[1]),
 .FB_RXD_2_9(rx_er_2[0]),
#elif _16_bit_ch_c == 0
 .FB_RXD_2_21(),
 .FB_RXD_2_9(rx_er_2),
#endif
#elif _channel_C_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_a == 1
 .FB_RXD_2_21(rx_j1b1_2[1]),
 .FB_RXD_2_9(rx_j1b1_2[0]),
#elif _16_bit_ch_a == 0
 .FB_RXD_2_21(),
 .FB_RXD_2_9(rx_j1b1_2),
#endif
#else
 .FB_RXD_2_21(),
 .FB_RXD_2_9(),
#endif

#if _channel_C_options_new == "8b10b" || _channel_C_options_new == "4x PCI Express" || _channel_C_options_new == "1x PCI Express"
#if _16_bit_ch_c == 1
 .FB_RXD_2_22(rx_cv_detect_2[1]),
 .FB_RXD_2_10(rx_cv_detect_2[0]),
#elif _16_bit_ch_c == 0
 .FB_RXD_2_22(),
 .FB_RXD_2_10(rx_cv_detect_2),
#endif
#elif _channel_C_options_new == "Fibre Channel(Single SERDES)"
#if _16_bit_ch_c == 1
 .FB_RXD_2_22(rx_sof_2[1]),
 .FB_RXD_2_10(rx_sof_2[0]),
#elif _16_bit_ch_c == 0
 .FB_RXD_2_22(),
 .FB_RXD_2_10(rx_sof_2),
#endif
#elif _channel_C_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_c == 1
 .FB_RXD_2_22(rx_oof_2[1]),
 .FB_RXD_2_10(rx_oof_2[0]),
#elif _16_bit_ch_c == 0
 .FB_RXD_2_22(),
 .FB_RXD_2_10(rx_oof_2),
#endif
#elif _channel_C_options_new == "Gigabit Ethernet"
#if _16_bit_ch_c == 1
 .FB_RXD_2_22(rx_sfd_2[1]),
 .FB_RXD_2_10(rx_sfd_2[0]),
#elif _16_bit_ch_c == 0
 .FB_RXD_2_22(),
 .FB_RXD_2_10(rx_sfd_2),
#endif
#else
 .FB_RXD_2_22(),
 .FB_RXD_2_10(),
#endif

#if _channel_C_options_new == "Fibre Channel(Single SERDES)" 
#if _16_bit_ch_c == 1
 .FB_RXD_2_23(rx_crc_eof_2[1]),
 .FB_RXD_2_11(rx_crc_eof_2[0]),
#elif _16_bit_ch_c == 0
 .FB_RXD_2_23(),
 .FB_RXD_2_11(rx_crc_eof_2),
#endif
#elif _channel_C_options_new == "Gigabit Ethernet"
#if _16_bit_ch_c == 1
 .FB_RXD_2_23(rx_crc_eop_2[1]),
 .FB_RXD_2_11(rx_crc_eop_2[0]),
#elif _16_bit_ch_c == 0
 .FB_RXD_2_23(),
 .FB_RXD_2_11(rx_crc_eop_2),
#endif
#elif _channel_C_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_c == 1
 .FB_RXD_2_23(rx_fp_2[1]),
 .FB_RXD_2_11(rx_fp_2[0]),
#elif _16_bit_ch_c == 0
 .FB_RXD_2_23(),
 .FB_RXD_2_11(rx_fp_2),
#endif
#elif _channel_C_options_new == "8b10b"
#if _en_control_ports == 1
#if _16_bit_ch_c == 1
 .FB_RXD_2_23(rx_crc_eop_2[1]),
 .FB_RXD_2_11(rx_crc_eop_2[0]),
#elif _16_bit_ch_c == 0
 .FB_RXD_2_23(),
 .FB_RXD_2_11(rx_crc_eop_2),
#endif
#elif _en_control_ports == 0
 .FB_RXD_2_23(),
 .FB_RXD_2_11(),
#endif
#else
 .FB_RXD_2_23(),
 .FB_RXD_2_11(),
#endif

#if _channel_D_options_new == "Disabled"
 .FF_TXD_3_19(fpsc_vlo),
 .FF_TXD_3_18(fpsc_vlo),
 .FF_TXD_3_17(fpsc_vlo),
 .FF_TXD_3_16(fpsc_vlo),
 .FF_TXD_3_15(fpsc_vlo),
 .FF_TXD_3_14(fpsc_vlo),
 .FF_TXD_3_13(fpsc_vlo),
 .FF_TXD_3_12(fpsc_vlo),
 .FF_TXD_3_7(fpsc_vlo),
 .FF_TXD_3_6(fpsc_vlo),
 .FF_TXD_3_5(fpsc_vlo),
 .FF_TXD_3_4(fpsc_vlo),
 .FF_TXD_3_3(fpsc_vlo),
 .FF_TXD_3_2(fpsc_vlo),
 .FF_TXD_3_1(fpsc_vlo),
 .FF_TXD_3_0(fpsc_vlo),
 .FB_RXD_3_19(),
 .FB_RXD_3_18(),
 .FB_RXD_3_17(),
 .FB_RXD_3_16(),
 .FB_RXD_3_15(),
 .FB_RXD_3_14(),
 .FB_RXD_3_13(),
 .FB_RXD_3_12(),
 .FB_RXD_3_7(),
 .FB_RXD_3_6(),
 .FB_RXD_3_5(),
 .FB_RXD_3_4(),
 .FB_RXD_3_3(),
 .FB_RXD_3_2(),
 .FB_RXD_3_1(),
 .FB_RXD_3_0(),
#else
#if _channel_D_options_new != "SERDES Only(10/20-bit)"
#if _16_bit_ch_d == 1
 .FF_TXD_3_19(txd_3[15]),
 .FF_TXD_3_18(txd_3[14]),
 .FF_TXD_3_17(txd_3[13]),
 .FF_TXD_3_16(txd_3[12]),
 .FF_TXD_3_15(txd_3[11]),
 .FF_TXD_3_14(txd_3[10]),
 .FF_TXD_3_13(txd_3[9]),
 .FF_TXD_3_12(txd_3[8]),
 .FF_TXD_3_7(txd_3[7]),
 .FF_TXD_3_6(txd_3[6]),
 .FF_TXD_3_5(txd_3[5]),
 .FF_TXD_3_4(txd_3[4]),
 .FF_TXD_3_3(txd_3[3]),
 .FF_TXD_3_2(txd_3[2]),
 .FF_TXD_3_1(txd_3[1]),
 .FF_TXD_3_0(txd_3[0]),
 .FB_RXD_3_19(rxd_3[15]),
 .FB_RXD_3_18(rxd_3[14]),
 .FB_RXD_3_17(rxd_3[13]),
 .FB_RXD_3_16(rxd_3[12]),
 .FB_RXD_3_15(rxd_3[11]),
 .FB_RXD_3_14(rxd_3[10]),
 .FB_RXD_3_13(rxd_3[9]),
 .FB_RXD_3_12(rxd_3[8]),
 .FB_RXD_3_7(rxd_3[7]),
 .FB_RXD_3_6(rxd_3[6]),
 .FB_RXD_3_5(rxd_3[5]),
 .FB_RXD_3_4(rxd_3[4]),
 .FB_RXD_3_3(rxd_3[3]),
 .FB_RXD_3_2(rxd_3[2]),
 .FB_RXD_3_1(rxd_3[1]),
 .FB_RXD_3_0(rxd_3[0]),
#elif _16_bit_ch_d == 0
 .FF_TXD_3_19(fpsc_vlo),
 .FF_TXD_3_18(fpsc_vlo),
 .FF_TXD_3_17(fpsc_vlo),
 .FF_TXD_3_16(fpsc_vlo),
 .FF_TXD_3_15(fpsc_vlo),
 .FF_TXD_3_14(fpsc_vlo),
 .FF_TXD_3_13(fpsc_vlo),
 .FF_TXD_3_12(fpsc_vlo),
 .FF_TXD_3_7(txd_3[7]),
 .FF_TXD_3_6(txd_3[6]),
 .FF_TXD_3_5(txd_3[5]),
 .FF_TXD_3_4(txd_3[4]),
 .FF_TXD_3_3(txd_3[3]),
 .FF_TXD_3_2(txd_3[2]),
 .FF_TXD_3_1(txd_3[1]),
 .FF_TXD_3_0(txd_3[0]),
 .FB_RXD_3_19(),
 .FB_RXD_3_18(),
 .FB_RXD_3_17(),
 .FB_RXD_3_16(),
 .FB_RXD_3_15(),
 .FB_RXD_3_14(),
 .FB_RXD_3_13(),
 .FB_RXD_3_12(),
 .FB_RXD_3_7(rxd_3[7]),
 .FB_RXD_3_6(rxd_3[6]),
 .FB_RXD_3_5(rxd_3[5]),
 .FB_RXD_3_4(rxd_3[4]),
 .FB_RXD_3_3(rxd_3[3]),
 .FB_RXD_3_2(rxd_3[2]),
 .FB_RXD_3_1(rxd_3[1]),
 .FB_RXD_3_0(rxd_3[0]),
#endif
#elif _channel_D_options_new == "SERDES Only(10/20-bit)"
#if _20_bit_ch_d == 1
 .FF_TXD_3_19(txd_3[17]),
 .FF_TXD_3_18(txd_3[16]),
 .FF_TXD_3_17(txd_3[15]),
 .FF_TXD_3_16(txd_3[14]),
 .FF_TXD_3_15(txd_3[13]),
 .FF_TXD_3_14(txd_3[12]),
 .FF_TXD_3_13(txd_3[11]),
 .FF_TXD_3_12(txd_3[10]),
 .FF_TXD_3_7(txd_3[7]),
 .FF_TXD_3_6(txd_3[6]),
 .FF_TXD_3_5(txd_3[5]),
 .FF_TXD_3_4(txd_3[4]),
 .FF_TXD_3_3(txd_3[3]),
 .FF_TXD_3_2(txd_3[2]),
 .FF_TXD_3_1(txd_3[1]),
 .FF_TXD_3_0(txd_3[0]),
 .FB_RXD_3_19(rxd_3[17]),
 .FB_RXD_3_18(rxd_3[16]),
 .FB_RXD_3_17(rxd_3[15]),
 .FB_RXD_3_16(rxd_3[14]),
 .FB_RXD_3_15(rxd_3[13]),
 .FB_RXD_3_14(rxd_3[12]),
 .FB_RXD_3_13(rxd_3[11]),
 .FB_RXD_3_12(rxd_3[10]),
 .FB_RXD_3_7(rxd_3[7]),
 .FB_RXD_3_6(rxd_3[6]),
 .FB_RXD_3_5(rxd_3[5]),
 .FB_RXD_3_4(rxd_3[4]),
 .FB_RXD_3_3(rxd_3[3]),
 .FB_RXD_3_2(rxd_3[2]),
 .FB_RXD_3_1(rxd_3[1]),
 .FB_RXD_3_0(rxd_3[0]),
#elif _20_bit_ch_d == 0
 .FF_TXD_3_19(fpsc_vlo),
 .FF_TXD_3_18(fpsc_vlo),
 .FF_TXD_3_17(fpsc_vlo),
 .FF_TXD_3_16(fpsc_vlo),
 .FF_TXD_3_15(fpsc_vlo),
 .FF_TXD_3_14(fpsc_vlo),
 .FF_TXD_3_13(fpsc_vlo),
 .FF_TXD_3_12(fpsc_vlo),
 .FF_TXD_3_7(txd_3[7]),
 .FF_TXD_3_6(txd_3[6]),
 .FF_TXD_3_5(txd_3[5]),
 .FF_TXD_3_4(txd_3[4]),
 .FF_TXD_3_3(txd_3[3]),
 .FF_TXD_3_2(txd_3[2]),
 .FF_TXD_3_1(txd_3[1]),
 .FF_TXD_3_0(txd_3[0]),
 .FB_RXD_3_19(),
 .FB_RXD_3_18(),
 .FB_RXD_3_17(),
 .FB_RXD_3_16(),
 .FB_RXD_3_15(),
 .FB_RXD_3_14(),
 .FB_RXD_3_13(),
 .FB_RXD_3_12(),
 .FB_RXD_3_7(rxd_3[7]),
 .FB_RXD_3_6(rxd_3[6]),
 .FB_RXD_3_5(rxd_3[5]),
 .FB_RXD_3_4(rxd_3[4]),
 .FB_RXD_3_3(rxd_3[3]),
 .FB_RXD_3_2(rxd_3[2]),
 .FB_RXD_3_1(rxd_3[1]),
 .FB_RXD_3_0(rxd_3[0]),
#endif
#endif
#endif

#if _channel_D_options_new == "Disabled" || _channel_D_options_new == "SERDES Only(8/16-bit)"
 .FF_TXD_3_20(fpsc_vlo),
 .FF_TXD_3_8(fpsc_vlo),
 .FB_RXD_3_20(),
 .FB_RXD_3_8(),
#elif _channel_D_options_new == "SERDES Only(10/20-bit)"
#if _20_bit_ch_d == 1
 .FF_TXD_3_20(txd_3[18]),
 .FF_TXD_3_8(txd_3[8]),
 .FB_RXD_3_20(rxd_3[18]),
 .FB_RXD_3_8(rxd_3[8]),
#elif _20_bit_ch_d == 0
 .FF_TXD_3_20(fpsc_vlo),
 .FF_TXD_3_8(txd_3[8]),
 .FB_RXD_3_20(),
 .FB_RXD_3_8(rxd_3[8]),
#endif
#elif _channel_D_options_new == "Gigabit Ethernet"
#if _16_bit_ch_d == 1
 .FF_TXD_3_20(tx_en_3[1]),
 .FF_TXD_3_8(tx_en_3[0]),
 .FB_RXD_3_20(rx_dv_3[1]),
 .FB_RXD_3_8(rx_dv_3[0]),
#elif _16_bit_ch_d == 0
 .FF_TXD_3_20(fpsc_vlo),
 .FF_TXD_3_8(tx_en_3),
 .FB_RXD_3_20(),
 .FB_RXD_3_8(rx_dv_3),
#endif
#elif _channel_D_options_new == "XAUI" || _channel_D_options_new == "4x Serial RapidIO" || _channel_D_options_new == "1x RapidIO"
#if _16_bit_ch_d == 1
 .FF_TXD_3_20(txc_3[1]),
 .FF_TXD_3_8(txc_3[0]),
 .FB_RXD_3_20(rxc_3[1]),
 .FB_RXD_3_8(rxc_3[0]),
#elif _16_bit_ch_d == 0
 .FF_TXD_3_20(fpsc_vlo),
 .FF_TXD_3_8(txc_3),
 .FB_RXD_3_20(),
 .FB_RXD_3_8(rxc_3),
#endif
#elif _channel_D_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_d == 1
 .FF_TXD_3_20(tx_fp_3[1]),
 .FF_TXD_3_8(tx_fp_3[0]),
 .FB_RXD_3_20(rx_spe_3[1]),
 .FB_RXD_3_8(rx_spe_3[0]),
#elif _16_bit_ch_d == 0
 .FF_TXD_3_20(fpsc_vlo),
 .FF_TXD_3_8(tx_fp_3),
 .FB_RXD_3_20(),
 .FB_RXD_3_8(rx_spe_3),
#endif
#else 
#if _16_bit_ch_d == 1
 .FF_TXD_3_20(tx_k_3[1]),
 .FF_TXD_3_8(tx_k_3[0]),
 .FB_RXD_3_20(rx_k_3[1]),
 .FB_RXD_3_8(rx_k_3[0]),
#elif _16_bit_ch_d == 0
 .FF_TXD_3_20(fpsc_vlo),
 .FF_TXD_3_8(tx_k_3),
 .FB_RXD_3_20(),
 .FB_RXD_3_8(rx_k_3),
#endif
#endif

#if _channel_D_options_new == "SERDES Only(10/20-bit)"
#if _20_bit_ch_d == 1
 .FF_TXD_3_21(txd_3[19]),
 .FF_TXD_3_9(txd_3[9]),
#elif _20_bit_ch_d == 0
 .FF_TXD_3_21(fpsc_vlo),
 .FF_TXD_3_9(txd_3[9]),
#endif
#elif _channel_D_options_new == "8b10b" || _channel_D_options_new == "Fibre Channel(Single SERDES)" || _channel_D_options_new == "1x PCI Express" || _channel_D_options_new == "4x PCI Express"
#if _16_bit_ch_d == 1
 .FF_TXD_3_21(tx_force_disp_3[1]),
 .FF_TXD_3_9(tx_force_disp_3[0]),
#elif _16_bit_ch_d == 0
 .FF_TXD_3_21(fpsc_vlo),
 .FF_TXD_3_9(tx_force_disp_3),
#endif
#elif _channel_D_options_new == "Gigabit Ethernet"
#if _16_bit_ch_d == 1
 .FF_TXD_3_21(tx_er_3[1]),
 .FF_TXD_3_9(tx_er_3[0]),
#elif _16_bit_ch_d == 0
 .FF_TXD_3_21(fpsc_vlo),
 .FF_TXD_3_9(tx_er_3),
#endif
#else
 .FF_TXD_3_21(fpsc_vlo),
 .FF_TXD_3_9(fpsc_vlo),
#endif

#if _channel_D_options_new == "8b10b" || _channel_D_options_new == "Fibre Channel(Single SERDES)" || _channel_D_options_new == "1x PCI Express" || _channel_D_options_new == "4x PCI Express"
#if _16_bit_ch_d == 1
 .FF_TXD_3_22(tx_disp_sel_3[1]),
 .FF_TXD_3_10(tx_disp_sel_3[0]),
#elif _16_bit_ch_d == 0
 .FF_TXD_3_22(fpsc_vlo),
 .FF_TXD_3_10(tx_disp_sel_3),
#endif
#elif _channel_D_options_new == "Gigabit Ethernet"
#if _16_bit_ch_d == 1
 .FF_TXD_3_22(tx_crc_insert_3[1]),
 .FF_TXD_3_10(tx_crc_insert_3[0]),
#elif _16_bit_ch_d == 0
 .FF_TXD_3_22(fpsc_vlo),
 .FF_TXD_3_10(tx_crc_insert_3),
#endif
#else
 .FF_TXD_3_22(fpsc_vlo),
 .FF_TXD_3_10(fpsc_vlo),
#endif
#if _channel_D_options_new == "Fibre Channel(Single SERDES)"
#if _16_bit_ch_d == 1
 .FF_TXD_3_23(tx_sof_3[1]),
 .FF_TXD_3_11(tx_sof_3[0]),
#elif _16_bit_ch_d == 0
 .FF_TXD_3_23(fpsc_vlo),
 .FF_TXD_3_11(tx_sof_3),
#endif
#elif _channel_D_options_new == "Gigabit Ethernet"
#if _16_bit_ch_d == 1
 .FF_TXD_3_23(tx_sfd_3[1]),
 .FF_TXD_3_11(tx_sfd_3[0]),
#elif _16_bit_ch_d == 0
 .FF_TXD_3_23(fpsc_vlo),
 .FF_TXD_3_11(tx_sfd_3),
#endif
#elif _channel_D_options_new == "8b10b"
#if _en_control_ports == 1
#if _16_bit_ch_d == 1
 .FF_TXD_3_23(tx_crc_init_3[1]),
 .FF_TXD_3_11(tx_crc_init_3[0]),
#elif _16_bit_ch_d == 0
 .FF_TXD_3_23(fpsc_vlo),
 .FF_TXD_3_11(tx_crc_init_3),
#endif
#elif _en_control_ports == 0
 .FF_TXD_3_23(fpsc_vlo),
 .FF_TXD_3_11(fpsc_vlo),
#endif
#else
 .FF_TXD_3_23(fpsc_vlo),
 .FF_TXD_3_11(fpsc_vlo),
#endif

#if _channel_D_options_new == "SERDES Only(10/20-bit)" 
#if _20_bit_ch_d == 1
 .FB_RXD_3_21(rxd_3[19]),
 .FB_RXD_3_9(rxd_3[9]),
#elif _20_bit_ch_d == 0
 .FB_RXD_3_21(),
 .FB_RXD_3_9(rxd_3[9]),
#endif
#elif _channel_D_options_new == "8b10b" || _channel_D_options_new == "Fibre Channel(Single SERDES)" || _channel_D_options_new == "1x PCI Express" || _channel_D_options_new == "4x PCI Express"
#if _16_bit_ch_d == 1
 .FB_RXD_3_21(rx_disp_err_detect_3[1]),
 .FB_RXD_3_9(rx_disp_err_detect_3[0]),
#elif _16_bit_ch_d == 0
 .FB_RXD_3_21(),
 .FB_RXD_3_9(rx_disp_err_detect_3),
#endif
#elif _channel_D_options_new == "Gigabit Ethernet"
#if _16_bit_ch_d == 1
 .FB_RXD_3_21(rx_er_3[1]),
 .FB_RXD_3_9(rx_er_3[0]),
#elif _16_bit_ch_d == 0
 .FB_RXD_3_21(),
 .FB_RXD_3_9(rx_er_3),
#endif
#elif _channel_D_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_a == 1
 .FB_RXD_3_21(rx_j1b1_3[1]),
 .FB_RXD_3_9(rx_j1b1_3[0]),
#elif _16_bit_ch_a == 0
 .FB_RXD_3_21(),
 .FB_RXD_3_9(rx_j1b1_3),
#endif
#else
 .FB_RXD_3_21(),
 .FB_RXD_3_9(),
#endif

#if _channel_D_options_new == "8b10b" || _channel_D_options_new == "4x PCI Express" || _channel_D_options_new == "1x PCI Express"
#if _16_bit_ch_d == 1
 .FB_RXD_3_22(rx_cv_detect_3[1]),
 .FB_RXD_3_10(rx_cv_detect_3[0]),
#elif _16_bit_ch_d == 0
 .FB_RXD_3_22(),
 .FB_RXD_3_10(rx_cv_detect_3),
#endif
#elif _channel_D_options_new == "Fibre Channel(Single SERDES)"
#if _16_bit_ch_d == 1
 .FB_RXD_3_22(rx_sof_3[1]),
 .FB_RXD_3_10(rx_sof_3[0]),
#elif _16_bit_ch_d == 0
 .FB_RXD_3_22(),
 .FB_RXD_3_10(rx_sof_3),
#endif
#elif _channel_D_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_d == 1
 .FB_RXD_3_22(rx_oof_3[1]),
 .FB_RXD_3_10(rx_oof_3[0]),
#elif _16_bit_ch_d == 0
 .FB_RXD_3_22(),
 .FB_RXD_3_10(rx_oof_3),
#endif
#elif _channel_D_options_new == "Gigabit Ethernet"
#if _16_bit_ch_d == 1
 .FB_RXD_3_22(rx_sfd_3[1]),
 .FB_RXD_3_10(rx_sfd_3[0]),
#elif _16_bit_ch_d == 0
 .FB_RXD_3_22(),
 .FB_RXD_3_10(rx_sfd_3),
#endif
#else
 .FB_RXD_3_22(),
 .FB_RXD_3_10(),
#endif

#if _channel_D_options_new == "Fibre Channel(Single SERDES)" 
#if _16_bit_ch_d == 1
 .FB_RXD_3_23(rx_crc_eof_3[1]),
 .FB_RXD_3_11(rx_crc_eof_3[0]),
#elif _16_bit_ch_d == 0
 .FB_RXD_3_23(),
 .FB_RXD_3_11(rx_crc_eof_3),
#endif
#elif _channel_D_options_new == "Gigabit Ethernet"
#if _16_bit_ch_d == 1
 .FB_RXD_3_23(rx_crc_eop_3[1]),
 .FB_RXD_3_11(rx_crc_eop_3[0]),
#elif _16_bit_ch_d == 0
 .FB_RXD_3_23(),
 .FB_RXD_3_11(rx_crc_eop_3),
#endif
#elif _channel_D_options_new == "SONET(STS-12, STS-48)"
#if _16_bit_ch_d == 1
 .FB_RXD_3_23(rx_fp_3[1]),
 .FB_RXD_3_11(rx_fp_3[0]),
#elif _16_bit_ch_d == 0
 .FB_RXD_3_23(),
 .FB_RXD_3_11(rx_fp_3),
#endif
#elif _channel_D_options_new == "8b10b"
#if _en_control_ports == 1
#if _16_bit_ch_d == 1
 .FB_RXD_3_23(rx_crc_eop_3[1]),
 .FB_RXD_3_11(rx_crc_eop_3[0]),
#elif _16_bit_ch_d == 0
 .FB_RXD_3_23(),
 .FB_RXD_3_11(rx_crc_eop_3),
#endif
#elif _en_control_ports == 0
 .FB_RXD_3_23(),
 .FB_RXD_3_11(),
#endif
#else
 .FB_RXD_3_23(),
 .FB_RXD_3_11(),
#endif

#if _channel_A_options_new == "Disabled"
 .HDINP0(fpsc_vlo),
 .HDINN0(fpsc_vlo),
 .HDOUTP0(),
 .HDOUTN0(),
 .FF_SYSCLK0(),
 .FF_RXCLK0(),
 .FFC_LANE_TX_RST0(fpsc_vlo),
 .FFC_LANE_RX_RST0(fpsc_vlo),
 .FF_TCLK0(fpsc_vlo),
 .FF_RCLK0(fpsc_vlo),
#else
 .HDINP0(hdinp_0),
 .HDINN0(hdinn_0),
 .HDOUTP0(hdoutp_0),
 .HDOUTN0(hdoutn_0),
 .FF_SYSCLK0(ref_0_sclk),
#if _channel_A_options_new == "SERDES Only(8/16-bit)" || _channel_A_options_new == "SERDES Only(10/20-bit)" || _channel_A_options_new == "SONET(STS-12, STS-48)" || _channel_A_options_new == "8b10b"
 .FF_RXCLK0(rx_0_sclk),
#else
 .FF_RXCLK0(),
#endif
#if _channel_A_options_new == "XAUI" || _channel_A_options_new == "4x Serial RapidIO" || _channel_A_options_new == "4x PCI Express"
 .FFC_LANE_TX_RST0(tx_rst),
 .FFC_LANE_RX_RST0(rx_rst),
 .FF_TCLK0(tclk),
 .FF_RCLK0(rclk),
#else
 .FFC_LANE_TX_RST0(tx_rst_0),
 .FFC_LANE_RX_RST0(rx_rst_0),
 .FF_TCLK0(tclk_0),
 .FF_RCLK0(rclk_0),
#endif
#endif
#if _channel_B_options_new == "Disabled"
 .HDINP1(fpsc_vlo),
 .HDINN1(fpsc_vlo),
 .HDOUTP1(),
 .HDOUTN1(),
 .FF_SYSCLK1(),
 .FF_RXCLK1(),
 .FFC_LANE_TX_RST1(fpsc_vlo),
 .FFC_LANE_RX_RST1(fpsc_vlo),
 .FF_TCLK1(fpsc_vlo),
 .FF_RCLK1(fpsc_vlo),
#else
 .HDINP1(hdinp_1),
 .HDINN1(hdinn_1),
 .HDOUTP1(hdoutp_1),
 .HDOUTN1(hdoutn_1),
 .FF_SYSCLK1(ref_1_sclk),
#if _channel_B_options_new == "SERDES Only(8/16-bit)" || _channel_B_options_new == "SERDES Only(10/20-bit)" || _channel_B_options_new == "SONET(STS-12, STS-48)" || _channel_B_options_new == "8b10b"
 .FF_RXCLK1(rx_1_sclk),
#else
 .FF_RXCLK1(),
#endif
#if _channel_B_options_new == "XAUI" || _channel_B_options_new == "4x Serial RapidIO" || _channel_B_options_new == "4x PCI Express"
 .FFC_LANE_TX_RST1(tx_rst),
 .FFC_LANE_RX_RST1(rx_rst),
 .FF_TCLK1(tclk),
 .FF_RCLK1(rclk),
#else
 .FFC_LANE_TX_RST1(tx_rst_1),
 .FFC_LANE_RX_RST1(rx_rst_1),
 .FF_TCLK1(tclk_1),
 .FF_RCLK1(rclk_1),
#endif
#endif
#if _channel_C_options_new == "Disabled"
 .HDINP2(fpsc_vlo),
 .HDINN2(fpsc_vlo),
 .HDOUTP2(),
 .HDOUTN2(),
 .FF_SYSCLK2(),
 .FF_RXCLK2(),
 .FFC_LANE_TX_RST2(fpsc_vlo),
 .FFC_LANE_RX_RST2(fpsc_vlo),
 .FF_TCLK2(fpsc_vlo),
 .FF_RCLK2(fpsc_vlo),
#else
 .HDINP2(hdinp_2),
 .HDINN2(hdinn_2),
 .HDOUTP2(hdoutp_2),
 .HDOUTN2(hdoutn_2),
 .FF_SYSCLK2(ref_2_sclk),
#if _channel_C_options_new == "SERDES Only(8/16-bit)" || _channel_C_options_new == "SERDES Only(10/20-bit)" || _channel_C_options_new == "SONET(STS-12, STS-48)" || _channel_C_options_new == "8b10b"
 .FF_RXCLK2(rx_2_sclk),
#else
 .FF_RXCLK2(),
#endif
#if _channel_C_options_new == "XAUI" || _channel_C_options_new == "4x Serial RapidIO" || _channel_C_options_new == "4x PCI Express"
 .FFC_LANE_TX_RST2(tx_rst),
 .FFC_LANE_RX_RST2(rx_rst),
 .FF_TCLK2(tclk),
 .FF_RCLK2(rclk),
#else
 .FFC_LANE_TX_RST2(tx_rst_2),
 .FFC_LANE_RX_RST2(rx_rst_2),
 .FF_TCLK2(tclk_2),
 .FF_RCLK2(rclk_2),
#endif
#endif
#if _channel_D_options_new == "Disabled"
 .HDINP3(fpsc_vlo),
 .HDINN3(fpsc_vlo),
 .HDOUTP3(),
 .HDOUTN3(),
 .FF_SYSCLK3(),
 .FF_RXCLK3(),
 .FFC_LANE_TX_RST3(fpsc_vlo),
 .FFC_LANE_RX_RST3(fpsc_vlo),
 .FF_TCLK3(fpsc_vlo),
 .FF_RCLK3(fpsc_vlo),
#else
 .HDINP3(hdinp_3),
 .HDINN3(hdinn_3),
 .HDOUTP3(hdoutp_3),
 .HDOUTN3(hdoutn_3),
 .FF_SYSCLK3(ref_3_sclk),
#if _channel_D_options_new == "SERDES Only(8/16-bit)" || _channel_D_options_new == "SERDES Only(10/20-bit)" || _channel_D_options_new == "SONET(STS-12, STS-48)" || _channel_D_options_new == "8b10b"
 .FF_RXCLK3(rx_3_sclk),
#else
 .FF_RXCLK3(),
#endif
#if _channel_D_options_new == "XAUI" || _channel_D_options_new == "4x Serial RapidIO" || _channel_D_options_new == "4x PCI Express"
 .FFC_LANE_TX_RST3(tx_rst),
 .FFC_LANE_RX_RST3(rx_rst),
 .FF_TCLK3(tclk),
 .FF_RCLK3(rclk),
#else
 .FFC_LANE_TX_RST3(tx_rst_3),
 .FFC_LANE_RX_RST3(rx_rst_3),
 .FF_TCLK3(tclk_3),
 .FF_RCLK3(rclk_3),
#endif
#endif

#if _channel_A_options_new == "1x PCI Express"
 .FFC_PCIE_EI_EN_0(elec_idel_0),
 .FFC_PCIE_CT_0(rx_detect_test_0),
 .FFC_PCIE_TX_0(tx_scrm_en_0),
 .FFC_PCIE_RX_0(rx_scrm_en_0),
 .FFS_PCIE_CON_0(rx_detect_0),
 .FFS_PCIE_DONE_0(rx_detect_done_0),
#elif _channel_A_options_new == "4x PCI Express"
 .FFC_PCIE_EI_EN_0(elec_idel_0),
 .FFC_PCIE_CT_0(rx_detect_test_0),
 .FFC_PCIE_TX_0(tx_scrm_en),
 .FFC_PCIE_RX_0(rx_scrm_en),
 .FFS_PCIE_CON_0(rx_detect_0),
 .FFS_PCIE_DONE_0(rx_detect_done_0),
#else
 .FFC_PCIE_EI_EN_0(fpsc_vlo),
 .FFC_PCIE_CT_0(fpsc_vlo),
 .FFC_PCIE_TX_0(fpsc_vlo),
 .FFC_PCIE_RX_0(fpsc_vlo),
 .FFS_PCIE_CON_0(),
 .FFS_PCIE_DONE_0(),
#endif
#if _channel_B_options_new == "1x PCI Express"
 .FFC_PCIE_EI_EN_1(elec_idel_1),
 .FFC_PCIE_CT_1(rx_detect_test_1),
 .FFC_PCIE_TX_1(tx_scrm_en_1),
 .FFC_PCIE_RX_1(rx_scrm_en_1),
 .FFS_PCIE_CON_1(rx_detect_1),
 .FFS_PCIE_DONE_1(rx_detect_done_1),
#elif _channel_B_options_new == "4x PCI Express"
 .FFC_PCIE_EI_EN_1(elec_idel_1),
 .FFC_PCIE_CT_1(rx_detect_test_1),
 .FFC_PCIE_TX_1(tx_scrm_en),
 .FFC_PCIE_RX_1(rx_scrm_en),
 .FFS_PCIE_CON_1(rx_detect_1),
 .FFS_PCIE_DONE_1(rx_detect_done_1),
#else
 .FFC_PCIE_EI_EN_1(fpsc_vlo),
 .FFC_PCIE_CT_1(fpsc_vlo),
 .FFC_PCIE_TX_1(fpsc_vlo),
 .FFC_PCIE_RX_1(fpsc_vlo),
 .FFS_PCIE_CON_1(),
 .FFS_PCIE_DONE_1(),
#endif
#if _channel_C_options_new == "1x PCI Express"
 .FFC_PCIE_EI_EN_2(elec_idel_2),
 .FFC_PCIE_CT_2(rx_detect_test_2),
 .FFC_PCIE_TX_2(tx_scrm_en_2),
 .FFC_PCIE_RX_2(rx_scrm_en_2),
 .FFS_PCIE_CON_2(rx_detect_2),
 .FFS_PCIE_DONE_2(rx_detect_done_2),
#elif _channel_C_options_new == "4x PCI Express"
 .FFC_PCIE_EI_EN_2(elec_idel_2),
 .FFC_PCIE_CT_2(rx_detect_test_2),
 .FFC_PCIE_TX_2(tx_scrm_en),
 .FFC_PCIE_RX_2(rx_scrm_en),
 .FFS_PCIE_CON_2(rx_detect_2),
 .FFS_PCIE_DONE_2(rx_detect_done_2),
#else
 .FFC_PCIE_EI_EN_2(fpsc_vlo),
 .FFC_PCIE_CT_2(fpsc_vlo),
 .FFC_PCIE_TX_2(fpsc_vlo),
 .FFC_PCIE_RX_2(fpsc_vlo),
 .FFS_PCIE_CON_2(),
 .FFS_PCIE_DONE_2(),
#endif
#if _channel_D_options_new == "1x PCI Express"
 .FFC_PCIE_EI_EN_3(elec_idel_3),
 .FFC_PCIE_CT_3(rx_detect_test_3),
 .FFC_PCIE_TX_3(tx_scrm_en_3),
 .FFC_PCIE_RX_3(rx_scrm_en_3),
 .FFS_PCIE_CON_3(rx_detect_3),
 .FFS_PCIE_DONE_3(rx_detect_done_3),
#elif _channel_D_options_new == "4x PCI Express"
 .FFC_PCIE_EI_EN_3(elec_idel_3),
 .FFC_PCIE_CT_3(rx_detect_test_3),
 .FFC_PCIE_TX_3(tx_scrm_en),
 .FFC_PCIE_RX_3(rx_scrm_en),
 .FFS_PCIE_CON_3(rx_detect_3),
 .FFS_PCIE_DONE_3(rx_detect_done_3),
#else
 .FFC_PCIE_EI_EN_3(fpsc_vlo),
 .FFC_PCIE_CT_3(fpsc_vlo),
 .FFC_PCIE_TX_3(fpsc_vlo),
 .FFC_PCIE_RX_3(fpsc_vlo),
 .FFS_PCIE_CON_3(),
 .FFS_PCIE_DONE_3(),
#endif

#if _en_control_ports == 1
#if _channel_A_options_new == "Disabled" || _channel_A_options_new == "SERDES Only(8/16-bit)" || _channel_A_options_new == "SERDES Only(10/20-bit)" || _channel_A_options_new == "SONET(STS-12, STS-48)"
 .FFC_SD_0(fpsc_vlo),
#elif _channel_A_options_new == "XAUI" || _channel_A_options_new == "4x Serial RapidIO" || _channel_A_options_new == "4x PCI Express"
 .FFC_SD_0(lsm_en),    
#else
 .FFC_SD_0(lsm_en_0),    
#endif
#elif _en_control_ports == 0
 .FFC_SD_0(fpsc_vlo),    
#endif
#if _en_control_ports == 1
#if _channel_B_options_new == "Disabled" || _channel_B_options_new == "SERDES Only(8/16-bit)" || _channel_B_options_new == "SERDES Only(10/20-bit)" || _channel_B_options_new == "SONET(STS-12, STS-48)"
 .FFC_SD_1(fpsc_vlo),
#elif _channel_B_options_new == "XAUI" || _channel_B_options_new == "4x Serial RapidIO" || _channel_B_options_new == "4x PCI Express"
 .FFC_SD_1(lsm_en),    
#else
 .FFC_SD_1(lsm_en_1),    
#endif
#elif _en_control_ports == 0
 .FFC_SD_1(fpsc_vlo),    
#endif
#if _en_control_ports == 1
#if _channel_C_options_new == "Disabled" || _channel_C_options_new == "SERDES Only(8/16-bit)" || _channel_C_options_new == "SERDES Only(10/20-bit)" || _channel_C_options_new == "SONET(STS-12, STS-48)"
 .FFC_SD_2(fpsc_vlo),
#elif _channel_C_options_new == "XAUI" || _channel_C_options_new == "4x Serial RapidIO" || _channel_C_options_new == "4x PCI Express"
 .FFC_SD_2(lsm_en),    
#else
 .FFC_SD_2(lsm_en_2),    
#endif
#elif _en_control_ports == 0
 .FFC_SD_2(fpsc_vlo),    
#endif
#if _en_control_ports == 1
#if _channel_D_options_new == "Disabled" || _channel_D_options_new == "SERDES Only(8/16-bit)" || _channel_D_options_new == "SERDES Only(10/20-bit)" || _channel_D_options_new == "SONET(STS-12, STS-48)"
 .FFC_SD_3(fpsc_vlo),
#elif _channel_D_options_new == "XAUI" || _channel_D_options_new == "4x Serial RapidIO" || _channel_D_options_new == "4x PCI Express"
 .FFC_SD_3(lsm_en),    
#else
 .FFC_SD_3(lsm_en_3),    
#endif
#elif _en_control_ports == 0
 .FFC_SD_3(fpsc_vlo),    
#endif
     
#if _en_control_ports == 1
#if _channel_A_options_new == "SERDES Only(10/20-bit)" || _channel_A_options_new == "8b10b"
 .FFC_EN_CGA_0(word_align_en_0),
#else
 .FFC_EN_CGA_0(fpsc_vlo),
#endif
#elif _en_control_ports == 0
 .FFC_EN_CGA_0(fpsc_vlo),
#endif
#if _en_control_ports == 1
#if _channel_B_options_new == "SERDES Only(10/20-bit)" || _channel_B_options_new == "8b10b"
 .FFC_EN_CGA_1(word_align_en_1),
#else
 .FFC_EN_CGA_1(fpsc_vlo),
#endif
#elif _en_control_ports == 0
 .FFC_EN_CGA_1(fpsc_vlo),
#endif
#if _en_control_ports == 1
#if _channel_C_options_new == "SERDES Only(10/20-bit)" || _channel_C_options_new == "8b10b"
 .FFC_EN_CGA_2(word_align_en_2),
#else
 .FFC_EN_CGA_2(fpsc_vlo),
#endif
#elif _en_control_ports == 0
 .FFC_EN_CGA_2(fpsc_vlo),
#endif
#if _en_control_ports == 1
#if _channel_D_options_new == "SERDES Only(10/20-bit)" || _channel_D_options_new == "8b10b"
 .FFC_EN_CGA_3(word_align_en_3),
#else
 .FFC_EN_CGA_3(fpsc_vlo),
#endif
#elif _en_control_ports == 0
 .FFC_EN_CGA_3(fpsc_vlo),
#endif

#if _en_control_ports == 1
#if _channel_A_options_new == "XAUI" || _channel_A_options_new == "4x Serial RapidIO"
 .FFC_ALIGN_EN_0(mca_align_en),
#elif _channel_A_options_new == "4x PCI Express" || _channel_A_options_new == "8b10b" || _channel_A_options_new == "1x PCI Express" || _channel_A_options_new == "SONET(STS-12, STS-48)"
 .FFC_ALIGN_EN_0(mca_align_en_0),
#else
 .FFC_ALIGN_EN_0(fpsc_vlo),
#endif
#elif _en_control_ports == 0
 .FFC_ALIGN_EN_0(fpsc_vlo),
#endif
#if _en_control_ports == 1
#if _channel_B_options_new == "XAUI" || _channel_B_options_new == "4x Serial RapidIO"
 .FFC_ALIGN_EN_1(mca_align_en),
#elif _channel_B_options_new == "4x PCI Express" || _channel_B_options_new == "8b10b" || _channel_B_options_new == "1x PCI Express" || _channel_B_options_new == "SONET(STS-12, STS-48)"
 .FFC_ALIGN_EN_1(mca_align_en_1),
#else
 .FFC_ALIGN_EN_1(fpsc_vlo),
#endif
#elif _en_control_ports == 0
 .FFC_ALIGN_EN_1(fpsc_vlo),
#endif
#if _en_control_ports == 1
#if _channel_C_options_new == "XAUI" || _channel_C_options_new == "4x Serial RapidIO"
 .FFC_ALIGN_EN_2(mca_align_en),
#elif _channel_C_options_new == "4x PCI Express" || _channel_C_options_new == "8b10b" || _channel_C_options_new == "1x PCI Express" || _channel_C_options_new == "SONET(STS-12, STS-48)"
 .FFC_ALIGN_EN_2(mca_align_en_2),
#else
 .FFC_ALIGN_EN_2(fpsc_vlo),
#endif
#elif _en_control_ports == 0
 .FFC_ALIGN_EN_2(fpsc_vlo),
#endif
#if _en_control_ports == 1
#if _channel_D_options_new == "XAUI" || _channel_D_options_new == "4x Serial RapidIO"
 .FFC_ALIGN_EN_3(mca_align_en),
#elif _channel_D_options_new == "4x PCI Express" || _channel_D_options_new == "8b10b" || _channel_D_options_new == "1x PCI Express" || _channel_D_options_new == "SONET(STS-12, STS-48)"
 .FFC_ALIGN_EN_3(mca_align_en_3),
#else
 .FFC_ALIGN_EN_3(fpsc_vlo),
#endif
#elif _en_control_ports == 0
 .FFC_ALIGN_EN_3(fpsc_vlo),
#endif

#if _en_control_ports == 1
#if _channel_A_options_new == "Disabled"
 .FFC_FB_LB_0(fpsc_vlo),
#elif _channel_A_options_new == "XAUI" || _channel_A_options_new == "4x Serial RapidIO" || _channel_A_options_new == "4x PCI Express"
 .FFC_FB_LB_0(felb),
#else
 .FFC_FB_LB_0(felb_0),
#endif
#elif _en_control_ports == 0
 .FFC_FB_LB_0(fpsc_vlo),
#endif
#if _en_control_ports == 1
#if _channel_B_options_new == "Disabled"
 .FFC_FB_LB_1(fpsc_vlo),
#elif _channel_B_options_new == "XAUI" || _channel_B_options_new == "4x Serial RapidIO" || _channel_B_options_new == "4x PCI Express"
 .FFC_FB_LB_1(felb),
#else
 .FFC_FB_LB_1(felb_1),
#endif
#elif _en_control_ports == 0
 .FFC_FB_LB_1(fpsc_vlo),
#endif
#if _en_control_ports == 1
#if _channel_C_options_new == "Disabled"
 .FFC_FB_LB_2(fpsc_vlo),
#elif _channel_C_options_new == "XAUI" || _channel_C_options_new == "4x Serial RapidIO" || _channel_C_options_new == "4x PCI Express"
 .FFC_FB_LB_2(felb),
#else
 .FFC_FB_LB_2(felb_2),
#endif
#elif _en_control_ports == 0
 .FFC_FB_LB_2(fpsc_vlo),
#endif
#if _en_control_ports == 1
#if _channel_D_options_new == "Disabled"
 .FFC_FB_LB_3(fpsc_vlo),
#elif _channel_D_options_new == "XAUI" || _channel_D_options_new == "4x Serial RapidIO" || _channel_D_options_new == "4x PCI Express"
 .FFC_FB_LB_3(felb),
#else
 .FFC_FB_LB_3(felb_3),
#endif
#elif _en_control_ports == 0
 .FFC_FB_LB_3(fpsc_vlo),
#endif

#if _en_control_ports == 1
#if _channel_A_options_new == "Disabled" || _channel_A_options_new == "SERDES Only(8/16-bit)" || _channel_A_options_new == "SERDES Only(10/20-bit)" || _channel_A_options_new == "SONET(STS-12, STS-48)" 
 .FFS_LS_STATUS_0(),
#else
 .FFS_LS_STATUS_0(lsm_status_0),
#endif
#elif _en_control_ports == 0
 .FFS_LS_STATUS_0(),
#endif
#if _en_control_ports == 1
#if _channel_B_options_new == "Disabled" || _channel_B_options_new == "SERDES Only(8/16-bit)" || _channel_B_options_new == "SERDES Only(10/20-bit)" || _channel_B_options_new == "SONET(STS-12, STS-48)" 
 .FFS_LS_STATUS_1(),
#else
 .FFS_LS_STATUS_1(lsm_status_1),
#endif
#elif _en_control_ports == 0
 .FFS_LS_STATUS_1(),
#endif
#if _en_control_ports == 1
#if _channel_C_options_new == "Disabled" || _channel_C_options_new == "SERDES Only(8/16-bit)" || _channel_C_options_new == "SERDES Only(10/20-bit)" || _channel_C_options_new == "SONET(STS-12, STS-48)" 
 .FFS_LS_STATUS_2(),
#else
 .FFS_LS_STATUS_2(lsm_status_2),
#endif
#elif _en_control_ports == 0
 .FFS_LS_STATUS_2(),
#endif
#if _en_control_ports == 1
#if _channel_D_options_new == "Disabled" || _channel_D_options_new == "SERDES Only(8/16-bit)" || _channel_D_options_new == "SERDES Only(10/20-bit)" || _channel_D_options_new == "SONET(STS-12, STS-48)" 
 .FFS_LS_STATUS_3(),
#else
 .FFS_LS_STATUS_3(lsm_status_3),
#endif
#elif _en_control_ports == 0
 .FFS_LS_STATUS_3(),
#endif

#if _en_control_ports == 1
#if _channel_A_options_new == "Disabled" || _channel_A_options_new == "SERDES Only(8/16-bit)" || _channel_A_options_new == "SERDES Only(10/20-bit)" || _channel_A_options_new == "8b10b" || _channel_A_options_new == "SONET(STS-12, STS-48)"
 .FFS_CC_ORUN_0(),
 .FFS_CC_URUN_0(),
#else
 .FFS_CC_ORUN_0(ctc_orun_0),
 .FFS_CC_URUN_0(ctc_urun_0),
#endif
#elif _en_control_ports == 0
 .FFS_CC_ORUN_0(),
 .FFS_CC_URUN_0(),
#endif
#if _en_control_ports == 1
#if _channel_B_options_new == "Disabled" || _channel_B_options_new == "SERDES Only(8/16-bit)" || _channel_B_options_new == "SERDES Only(10/20-bit)" || _channel_B_options_new == "8b10b" || _channel_B_options_new == "SONET(STS-12, STS-48)"
 .FFS_CC_ORUN_1(),
 .FFS_CC_URUN_1(),
#else
 .FFS_CC_ORUN_1(ctc_orun_1),
 .FFS_CC_URUN_1(ctc_urun_1),
#endif
#elif _en_control_ports == 0
 .FFS_CC_ORUN_1(),
 .FFS_CC_URUN_1(),
#endif
#if _en_control_ports == 1
#if _channel_C_options_new == "Disabled" || _channel_C_options_new == "SERDES Only(8/16-bit)" || _channel_C_options_new == "SERDES Only(10/20-bit)" || _channel_C_options_new == "8b10b" || _channel_C_options_new == "SONET(STS-12, STS-48)"
 .FFS_CC_ORUN_2(),
 .FFS_CC_URUN_2(),
#else
 .FFS_CC_ORUN_2(ctc_orun_2),
 .FFS_CC_URUN_2(ctc_urun_2),
#endif
#elif _en_control_ports == 0
 .FFS_CC_ORUN_2(),
 .FFS_CC_URUN_2(),
#endif
#if _en_control_ports == 1
#if _channel_D_options_new == "Disabled" || _channel_D_options_new == "SERDES Only(8/16-bit)" || _channel_D_options_new == "SERDES Only(10/20-bit)" || _channel_D_options_new == "8b10b" || _channel_D_options_new == "SONET(STS-12, STS-48)"
 .FFS_CC_ORUN_3(),
 .FFS_CC_URUN_3(),
#else
 .FFS_CC_ORUN_3(ctc_orun_3),
 .FFS_CC_URUN_3(ctc_urun_3),
#endif
#elif _en_control_ports == 0
 .FFS_CC_ORUN_3(),
 .FFS_CC_URUN_3(),
#endif
 
#if _en_control_ports == 1
#if _channel_A_options_new == "XAUI" || _channel_A_options_new == "4x Serial RapidIO" || _channel_A_options_new == "4x PCI Express"
 .FFC_AB_RESET(mca_resync),
#elif _channel_A_options_new == "8b10b" || _channel_A_options_new == "1x PCI Express" || _channel_A_options_new == "SONET(STS-12, STS-48)"
 .FFC_AB_RESET(mca_resync_01),
#else
 .FFC_AB_RESET(fpsc_vlo),
#endif
#elif _en_control_ports == 0
 .FFC_AB_RESET(fpsc_vlo),
#endif

#if _en_control_ports == 1
#if _channel_A_options_new == "XAUI" || _channel_A_options_new == "4x Serial RapidIO" || _channel_A_options_new == "4x PCI Express"
 .FFS_AB_STATUS(mca_aligned),
#elif _channel_A_options_new == "8b10b" && _channel_B_options_new == "8b10b"
 .FFS_AB_STATUS(mca_aligned_01),
#elif _channel_A_options_new == "1x PCI Express" && _channel_B_options_new == "1x PCI Express"
 .FFS_AB_STATUS(mca_aligned_01),
#elif _channel_A_options_new == "SONET(STS-12, STS-48)" && _channel_B_options_new == "SONET(STS-12, STS-48)"
 .FFS_AB_STATUS(mca_aligned_01),
#else
 .FFS_AB_STATUS(),
#endif
#elif _en_control_ports == 0
 .FFS_AB_STATUS(),
#endif

#if _en_control_ports == 1
#if _channel_A_options_new == "8b10b" && _channel_B_options_new == "8b10b"
 .FFS_AB_ALIGNED(mca_inskew_01),
 .FFS_AB_FAILED(mca_outskew_01),
#else
 .FFS_AB_ALIGNED(),
 .FFS_AB_FAILED(),
#endif
#elif _en_control_ports == 0
 .FFS_AB_ALIGNED(),
 .FFS_AB_FAILED(),
#endif

#if _en_control_ports == 1
#if _channel_C_options_new == "8b10b" && _channel_D_options_new == "8b10b"
 .FFC_CD_RESET(mca_resync_23),
 .FFS_CD_STATUS(mca_aligned_23),
#elif _channel_C_options_new == "1x PCI Express" && _channel_D_options_new == "1x PCI Express"
 .FFC_CD_RESET(mca_resync_23),
 .FFS_CD_STATUS(mca_aligned_23),
#elif _channel_C_options_new == "SONET(STS-12, STS-48)" && _channel_D_options_new == "SONET(STS-12, STS-48)"
 .FFC_CD_RESET(mca_resync_23),
 .FFS_CD_STATUS(mca_aligned_23),
#else
 .FFC_CD_RESET(fpsc_vlo),
 .FFS_CD_STATUS(),
#endif
#elif _en_control_ports == 0
 .FFC_CD_RESET(fpsc_vlo),
 .FFS_CD_STATUS(),
#endif

#if _en_control_ports == 1
#if _channel_C_options_new == "8b10b" && _channel_D_options_new == "8b10b"
 .FFS_CD_ALIGNED(mca_inskew_23),
 .FFS_CD_FAILED(mca_outskew_23),
#else
 .FFS_CD_ALIGNED(),
 .FFS_CD_FAILED(),
#endif
#elif _en_control_ports == 0
 .FFS_CD_ALIGNED(),
 .FFS_CD_FAILED(),
#endif

#if _channel_A_options_new == "SERDES Only(8/16-bit)" || _channel_A_options_new == "SERDES Only(10/20-bit)"
 .BS4PAD_0(rx_lsd_0),
#else
 .BS4PAD_0(),
#endif
#if _channel_B_options_new == "SERDES Only(8/16-bit)" || _channel_B_options_new == "SERDES Only(10/20-bit)"
 .BS4PAD_1(rx_lsd_1),
#else
 .BS4PAD_1(),
#endif
#if _channel_C_options_new == "SERDES Only(8/16-bit)" || _channel_C_options_new == "SERDES Only(10/20-bit)"
 .BS4PAD_2(rx_lsd_2),
#else
 .BS4PAD_2(),
#endif
#if _channel_D_options_new == "SERDES Only(8/16-bit)" || _channel_D_options_new == "SERDES Only(10/20-bit)"
 .BS4PAD_3(rx_lsd_3),
#else
 .BS4PAD_3(),
#endif
#if _channel_A_options_new == "1x PCI Express" || _channel_A_options_new == "4x PCI Express"
 .FFC_SB_INV_RX_0(rx_invert_0),
#else
 .FFC_SB_INV_RX_0(fpsc_vlo),
#endif
#if _channel_B_options_new == "1x PCI Express" || _channel_B_options_new == "4x PCI Express"
 .FFC_SB_INV_RX_1(rx_invert_1),
#else
 .FFC_SB_INV_RX_1(fpsc_vlo),
#endif
#if _channel_C_options_new == "1x PCI Express" || _channel_C_options_new == "4x PCI Express"
 .FFC_SB_INV_RX_2(rx_invert_2),
#else
 .FFC_SB_INV_RX_2(fpsc_vlo),
#endif
#if _channel_D_options_new == "1x PCI Express" || _channel_D_options_new == "4x PCI Express"
 .FFC_SB_INV_RX_3(rx_invert_3),
#else
 .FFC_SB_INV_RX_3(fpsc_vlo),
#endif
 .TCK_FMAC(),
 .TCK_FMACP(fpsc_vlo),
 .FF_SYSCLK_P1(ref_pclk),
#if _channel_A_options_new == "SERDES Only(8/16-bit)" || _channel_A_options_new == "SERDES Only(10/20-bit)" || _channel_A_options_new == "8b10b" || _channel_A_options_new == "SONET(STS-12, STS-48)"
 .FF_RXCLK_P1(rxa_pclk),
 .FF_RXCLK_P2(rxb_pclk),
#elif _channel_B_options_new == "SERDES Only(8/16-bit)" || _channel_B_options_new == "SERDES Only(10/20-bit)" || _channel_B_options_new == "8b10b" || _channel_B_options_new == "SONET(STS-12, STS-48)"
 .FF_RXCLK_P1(rxa_pclk),
 .FF_RXCLK_P2(rxb_pclk),
#elif _channel_C_options_new == "SERDES Only(8/16-bit)" || _channel_C_options_new == "SERDES Only(10/20-bit)" || _channel_C_options_new == "8b10b" || _channel_C_options_new == "SONET(STS-12, STS-48)"
 .FF_RXCLK_P1(rxa_pclk),
 .FF_RXCLK_P2(rxb_pclk),
#elif _channel_D_options_new == "SERDES Only(8/16-bit)" || _channel_D_options_new == "SERDES Only(10/20-bit)" || _channel_D_options_new == "8b10b" || _channel_D_options_new == "SONET(STS-12, STS-48)"
 .FF_RXCLK_P1(rxa_pclk),
 .FF_RXCLK_P2(rxb_pclk),
#else
 .FF_RXCLK_P1(),
 .FF_RXCLK_P2(),
#endif
#if _channel_A_options_new == "1x PCI Express" || _channel_A_options_new == "4x PCI Express"
 .FFS_RLOS_LO0(rx_ei_detect_0),
#else
 .FFS_RLOS_LO0(),
#endif
#if _channel_B_options_new == "1x PCI Express" || _channel_B_options_new == "4x PCI Express"
 .FFS_RLOS_LO1(rx_ei_detect_1),
#else
 .FFS_RLOS_LO1(),
#endif
#if _channel_C_options_new == "1x PCI Express" || _channel_C_options_new == "4x PCI Express"
 .FFS_RLOS_LO2(rx_ei_detect_2),
#else
 .FFS_RLOS_LO2(),
#endif
#if _channel_D_options_new == "1x PCI Express" || _channel_D_options_new == "4x PCI Express"
 .FFS_RLOS_LO3(rx_ei_detect_3),
#else
 .FFS_RLOS_LO3(),
#endif
 .COUT_21(),
 .COUT_20(),
 .COUT_19(),
 .COUT_18(),
 .COUT_17(),
 .COUT_16(),
 .COUT_15(),
 .COUT_14(),
 .COUT_13(),
 .COUT_12(),
 .COUT_11(),
 .COUT_10(),
 .COUT_9(),
 .COUT_8(),
 .COUT_7(),
 .COUT_6(),
 .COUT_5(),
 .COUT_4(),
 .COUT_3(),
 .COUT_2(),
 .COUT_1(),
 .COUT_0(),
 .CIN_12(fpsc_vlo),
 .CIN_11(fpsc_vlo),
 .CIN_10(fpsc_vlo),
 .CIN_9(fpsc_vlo),
 .CIN_8(fpsc_vlo),
 .CIN_7(fpsc_vlo),
 .CIN_6(fpsc_vlo),
 .CIN_5(fpsc_vlo),
 .CIN_4(fpsc_vlo),
 .CIN_3(fpsc_vlo),
 .CIN_2(fpsc_vlo),
 .CIN_1(fpsc_vlo),
 .CIN_0(fpsc_vlo),
 .TESTCLK_MACO(fpsc_vlo),

 .FFC_QUAD_RST(quad_rst),
 .FFC_MACRO_RST(serdes_rst)
)  STARTCOM synthesis IS_ASB="or5s00/data/or5s00.acd" CONFIG_FILE=#_circuit_name_new CH0_RX_MAXRATE=#_maxrate_rx CH1_RX_MAXRATE=#_maxrate_rx CH2_RX_MAXRATE=#_maxrate_rx CH3_RX_MAXRATE=#_maxrate_rx CH0_TX_MAXRATE=#_maxrate_tx CH1_TX_MAXRATE=#_maxrate_tx CH2_TX_MAXRATE=#_maxrate_tx CH3_TX_MAXRATE=#_maxrate_tx AMP_BOOST=#_amp_boost_new ENDCOM;

SLASH2 exemplar begin
SLASH2 exemplar attribute pcsa_inst IS_ASB or5s00/data/or5s00.acd
SLASH2 exemplar attribute pcsa_inst CONFIG_FILE  _circuit_name_new
SLASH2 exemplar attribute pcsa_inst CH0_RX_MAXRATE  _maxrate_rx
SLASH2 exemplar attribute pcsa_inst CH1_RX_MAXRATE  _maxrate_rx
SLASH2 exemplar attribute pcsa_inst CH2_RX_MAXRATE  _maxrate_rx
SLASH2 exemplar attribute pcsa_inst CH3_RX_MAXRATE  _maxrate_rx
SLASH2 exemplar attribute pcsa_inst CH0_TX_MAXRATE  _maxrate_tx
SLASH2 exemplar attribute pcsa_inst CH1_TX_MAXRATE  _maxrate_tx
SLASH2 exemplar attribute pcsa_inst CH2_TX_MAXRATE  _maxrate_tx
SLASH2 exemplar attribute pcsa_inst CH3_TX_MAXRATE  _maxrate_tx
SLASH2 exemplar attribute pcsa_inst AMP_BOOST  _amp_boost_new
SLASH2 exemplar end

endmodule

#log PCSA.v

module PCSA(
// SERDES//
       HDINP0, HDINN0, HDINP1, HDINN1, HDINP2, HDINN2, HDINP3, HDINN3, REFCLKP, REFCLKN,
       RXREFCLKP, RXREFCLKN,

       HDOUTP0, HDOUTN0, HDOUTP1, HDOUTN1, HDOUTP2, HDOUTN2, HDOUTP3, HDOUTN3,

// QUAD CONTROL //
       FFC_QUAD_RST, FFC_MACRO_RST, FFC_LANE_TX_RST0, FFC_LANE_TX_RST1, FFC_LANE_TX_RST2,
       FFC_LANE_TX_RST3, FFC_LANE_RX_RST0, FFC_LANE_RX_RST1, FFC_LANE_RX_RST2, FFC_LANE_RX_RST3,
       FFC_PCIE_EI_EN_0, FFC_PCIE_EI_EN_1, FFC_PCIE_EI_EN_2, FFC_PCIE_EI_EN_3,
       FFC_PCIE_CT_0, FFC_PCIE_CT_1, FFC_PCIE_CT_2, FFC_PCIE_CT_3, FFC_PCIE_TX_0,
       FFC_PCIE_TX_1, FFC_PCIE_TX_2, FFC_PCIE_TX_3, FFC_PCIE_RX_0, FFC_PCIE_RX_1,
       FFC_PCIE_RX_2, FFC_PCIE_RX_3, FFC_SD_0, FFC_SD_1, FFC_SD_2, FFC_SD_3, FFC_EN_CGA_0,
       FFC_EN_CGA_1, FFC_EN_CGA_2, FFC_EN_CGA_3, FFC_ALIGN_EN_0, FFC_ALIGN_EN_1,
       FFC_ALIGN_EN_2, FFC_ALIGN_EN_3, FFC_AB_RESET, FFC_CD_RESET, FFC_FB_LB_0, FFC_FB_LB_1,
       FFC_FB_LB_2, FFC_FB_LB_3, FFC_SB_INV_RX_0, FFC_SB_INV_RX_1, FFC_SB_INV_RX_2,
       FFC_SB_INV_RX_3,

       FFS_PCIE_CON_0, FFS_PCIE_CON_1, FFS_PCIE_CON_2, FFS_PCIE_CON_3, FFS_PCIE_DONE_0,
       FFS_PCIE_DONE_1, FFS_PCIE_DONE_2, FFS_PCIE_DONE_3, FFS_LS_STATUS_0, FFS_LS_STATUS_1,
       FFS_LS_STATUS_2, FFS_LS_STATUS_3, FFS_AB_STATUS, FFS_CD_STATUS, FFS_AB_ALIGNED,
       FFS_CD_ALIGNED, FFS_AB_FAILED, FFS_CD_FAILED, FFS_CC_ORUN_0, FFS_CC_ORUN_1,
       FFS_CC_ORUN_2, FFS_CC_ORUN_3, FFS_CC_URUN_0, FFS_CC_URUN_1, FFS_CC_URUN_2,
       FFS_CC_URUN_3, BS4PAD_0, BS4PAD_1, BS4PAD_2, BS4PAD_3,
       FFS_RLOS_LO0, FFS_RLOS_LO1, FFS_RLOS_LO2, FFS_RLOS_LO3,

// INTERFACE TO SYSBUSA //
       ADDRI_7, ADDRI_6, ADDRI_5, ADDRI_4, ADDRI_3, ADDRI_2, ADDRI_1, ADDRI_0,
       WDATAI_7, WDATAI_6, WDATAI_5, WDATAI_4, WDATAI_3, WDATAI_2, WDATAI_1, WDATAI_0,
       RDI, WSTBI, CS_CHIF_0, CS_CHIF_1, CS_CHIF_2,
       CS_CHIF_3, CS_QIF, QUAD_ID_1, QUAD_ID_0,

       RDATAO_7, RDATAO_6, RDATAO_5, RDATAO_4, RDATAO_3, RDATAO_2, RDATAO_1,
       RDATAO_0, INTO,

       FF_SYSCLK_P1, FF_SYSCLK0, FF_SYSCLK1, FF_SYSCLK2, FF_SYSCLK3,
       FF_RXCLK_P1, FF_RXCLK_P2, FF_RXCLK0, FF_RXCLK1, FF_RXCLK2, FF_RXCLK3,

       QUAD_CLK, GRP_CLK_P1_3, GRP_CLK_P1_2, GRP_CLK_P1_1, GRP_CLK_P1_0,
       GRP_CLK_P2_3, GRP_CLK_P2_2, GRP_CLK_P2_1, GRP_CLK_P2_0,
       GRP_START_3, GRP_START_2, GRP_START_1, GRP_START_0,
       GRP_DONE_3, GRP_DONE_2, GRP_DONE_1, GRP_DONE_0,
       GRP_DESKEW_ERROR_3, GRP_DESKEW_ERROR_2, GRP_DESKEW_ERROR_1, GRP_DESKEW_ERROR_0,

       IQA_START_LS, IQA_DONE_LS, IQA_AND_FP1_LS, IQA_AND_FP0_LS, IQA_OR_FP1_LS,
       IQA_OR_FP0_LS, IQA_RST_N,

// FPGA //
       FFC_CK_CORE_TX, FFC_CK_CORE_RX,
       FF_TCLK0, FF_TCLK1, FF_TCLK2, FF_TCLK3, FF_RCLK0, FF_RCLK1, FF_RCLK2, FF_RCLK3,
       FF_TXD_0_23, FF_TXD_0_22, FF_TXD_0_21, FF_TXD_0_20, FF_TXD_0_19, FF_TXD_0_18,
       FF_TXD_0_17, FF_TXD_0_16, FF_TXD_0_15, FF_TXD_0_14, FF_TXD_0_13, FF_TXD_0_12,
       FF_TXD_0_11, FF_TXD_0_10, FF_TXD_0_9, FF_TXD_0_8, FF_TXD_0_7, FF_TXD_0_6,
       FF_TXD_0_5, FF_TXD_0_4, FF_TXD_0_3, FF_TXD_0_2, FF_TXD_0_1, FF_TXD_0_0,
       FF_TXD_1_23, FF_TXD_1_22, FF_TXD_1_21, FF_TXD_1_20, FF_TXD_1_19, FF_TXD_1_18,
       FF_TXD_1_17, FF_TXD_1_16, FF_TXD_1_15, FF_TXD_1_14, FF_TXD_1_13, FF_TXD_1_12,
       FF_TXD_1_11, FF_TXD_1_10, FF_TXD_1_9, FF_TXD_1_8, FF_TXD_1_7, FF_TXD_1_6,
       FF_TXD_1_5, FF_TXD_1_4, FF_TXD_1_3, FF_TXD_1_2, FF_TXD_1_1, FF_TXD_1_0,
       FF_TXD_2_23, FF_TXD_2_22, FF_TXD_2_21, FF_TXD_2_20, FF_TXD_2_19, FF_TXD_2_18,
       FF_TXD_2_17, FF_TXD_2_16, FF_TXD_2_15, FF_TXD_2_14, FF_TXD_2_13, FF_TXD_2_12,
       FF_TXD_2_11, FF_TXD_2_10, FF_TXD_2_9, FF_TXD_2_8, FF_TXD_2_7, FF_TXD_2_6,
       FF_TXD_2_5, FF_TXD_2_4, FF_TXD_2_3, FF_TXD_2_2, FF_TXD_2_1, FF_TXD_2_0,
       FF_TXD_3_23, FF_TXD_3_22, FF_TXD_3_21, FF_TXD_3_20, FF_TXD_3_19, FF_TXD_3_18,
       FF_TXD_3_17, FF_TXD_3_16, FF_TXD_3_15, FF_TXD_3_14, FF_TXD_3_13, FF_TXD_3_12,
       FF_TXD_3_11, FF_TXD_3_10, FF_TXD_3_9, FF_TXD_3_8, FF_TXD_3_7, FF_TXD_3_6,
       FF_TXD_3_5, FF_TXD_3_4, FF_TXD_3_3, FF_TXD_3_2, FF_TXD_3_1, FF_TXD_3_0,
       TCK_FMACP, TESTCLK_MACO,

       FB_RXD_0_23, FB_RXD_0_22, FB_RXD_0_21, FB_RXD_0_20, FB_RXD_0_19, FB_RXD_0_18,
       FB_RXD_0_17, FB_RXD_0_16, FB_RXD_0_15, FB_RXD_0_14, FB_RXD_0_13, FB_RXD_0_12,
       FB_RXD_0_11, FB_RXD_0_10, FB_RXD_0_9, FB_RXD_0_8, FB_RXD_0_7, FB_RXD_0_6,
       FB_RXD_0_5, FB_RXD_0_4, FB_RXD_0_3, FB_RXD_0_2, FB_RXD_0_1, FB_RXD_0_0,
       FB_RXD_1_23, FB_RXD_1_22, FB_RXD_1_21, FB_RXD_1_20, FB_RXD_1_19, FB_RXD_1_18,
       FB_RXD_1_17, FB_RXD_1_16, FB_RXD_1_15, FB_RXD_1_14, FB_RXD_1_13, FB_RXD_1_12,
       FB_RXD_1_11, FB_RXD_1_10, FB_RXD_1_9, FB_RXD_1_8, FB_RXD_1_7, FB_RXD_1_6,
       FB_RXD_1_5, FB_RXD_1_4, FB_RXD_1_3, FB_RXD_1_2, FB_RXD_1_1, FB_RXD_1_0,
       FB_RXD_2_23, FB_RXD_2_22, FB_RXD_2_21, FB_RXD_2_20, FB_RXD_2_19, FB_RXD_2_18,
       FB_RXD_2_17, FB_RXD_2_16, FB_RXD_2_15, FB_RXD_2_14, FB_RXD_2_13, FB_RXD_2_12,
       FB_RXD_2_11, FB_RXD_2_10, FB_RXD_2_9, FB_RXD_2_8, FB_RXD_2_7, FB_RXD_2_6,
       FB_RXD_2_5, FB_RXD_2_4, FB_RXD_2_3, FB_RXD_2_2, FB_RXD_2_1, FB_RXD_2_0,
       FB_RXD_3_23, FB_RXD_3_22, FB_RXD_3_21, FB_RXD_3_20, FB_RXD_3_19, FB_RXD_3_18,
       FB_RXD_3_17, FB_RXD_3_16, FB_RXD_3_15, FB_RXD_3_14, FB_RXD_3_13, FB_RXD_3_12,
       FB_RXD_3_11, FB_RXD_3_10, FB_RXD_3_9, FB_RXD_3_8, FB_RXD_3_7, FB_RXD_3_6,
       FB_RXD_3_5, FB_RXD_3_4, FB_RXD_3_3, FB_RXD_3_2, FB_RXD_3_1, FB_RXD_3_0,
       TCK_FMAC, COUT_21, COUT_20, COUT_19, COUT_18, COUT_17, COUT_16, COUT_15, COUT_14,
       COUT_13, COUT_12, COUT_11, COUT_10, COUT_9, COUT_8, COUT_7, COUT_6, COUT_5, COUT_4,
       COUT_3, COUT_2, COUT_1, COUT_0,
       CIN_12, CIN_11, CIN_10, CIN_9, CIN_8, CIN_7, CIN_6, CIN_5, CIN_4,
       CIN_3, CIN_2, CIN_1, CIN_0
  )/* synthesis syn_black_box black_box_pad_pin = "HDINP0, HDINN0, HDINP1, HDINN1, HDINP2, HDINN2, HDINP3, HDINN3, HDOUTP0, HDOUTN0, HDOUTP1, HDOUTN1, HDOUTP2, HDOUTN2, HDOUTP3, HDOUTN3, REFCLKP, REFCLKN, RXREFCLKP, RXREFCLKN" */;

input             HDINP0,
                  HDINN0,
                  HDINP1,
                  HDINN1,
                  HDINP2,
                  HDINN2,
                  HDINP3,
                  HDINN3;

output            HDOUTP0,
                  HDOUTN0,
                  HDOUTP1,
                  HDOUTN1,
                  HDOUTP2,
                  HDOUTN2,
                  HDOUTP3,
                  HDOUTN3;

input             REFCLKP,
                  REFCLKN,
                  RXREFCLKP,
                  RXREFCLKN;

input         FFC_QUAD_RST;
input         FFC_MACRO_RST;

input         FFC_LANE_TX_RST0;
input         FFC_LANE_TX_RST1;
input         FFC_LANE_TX_RST2;
input         FFC_LANE_TX_RST3;

input         FFC_LANE_RX_RST0;
input         FFC_LANE_RX_RST1;
input         FFC_LANE_RX_RST2;
input         FFC_LANE_RX_RST3;

input         FFC_PCIE_EI_EN_0;
input         FFC_PCIE_EI_EN_1;
input         FFC_PCIE_EI_EN_2;
input         FFC_PCIE_EI_EN_3;

input         FFC_PCIE_CT_0;
input         FFC_PCIE_CT_1;
input         FFC_PCIE_CT_2;
input         FFC_PCIE_CT_3;

output        FFS_PCIE_CON_0;
output        FFS_PCIE_CON_1;
output        FFS_PCIE_CON_2;
output        FFS_PCIE_CON_3;

output        FFS_PCIE_DONE_0;
output        FFS_PCIE_DONE_1;
output        FFS_PCIE_DONE_2;
output        FFS_PCIE_DONE_3;

input         FFC_PCIE_TX_0;
input         FFC_PCIE_TX_1;
input         FFC_PCIE_TX_2;
input         FFC_PCIE_TX_3;

input         FFC_PCIE_RX_0;
input         FFC_PCIE_RX_1;
input         FFC_PCIE_RX_2;
input         FFC_PCIE_RX_3;

input         FFC_SD_0;
input         FFC_SD_1;
input         FFC_SD_2;
input         FFC_SD_3;

input         FFC_EN_CGA_0;
input         FFC_EN_CGA_1;
input         FFC_EN_CGA_2;
input         FFC_EN_CGA_3;

input         FFC_ALIGN_EN_0;
input         FFC_ALIGN_EN_1;
input         FFC_ALIGN_EN_2;
input         FFC_ALIGN_EN_3;

input         FFC_AB_RESET;
input         FFC_CD_RESET;

output        FFS_LS_STATUS_0;
output        FFS_LS_STATUS_1;
output        FFS_LS_STATUS_2;
output        FFS_LS_STATUS_3;

output        FFS_AB_STATUS;
output        FFS_CD_STATUS;

output        FFS_AB_ALIGNED;
output        FFS_CD_ALIGNED;

output        FFS_AB_FAILED;
output        FFS_CD_FAILED;

output        FFS_RLOS_LO0;
output        FFS_RLOS_LO1;
output        FFS_RLOS_LO2;
output        FFS_RLOS_LO3;

input         FFC_FB_LB_0;
input         FFC_FB_LB_1;
input         FFC_FB_LB_2;
input         FFC_FB_LB_3;

input         FFC_SB_INV_RX_0;
input         FFC_SB_INV_RX_1;
input         FFC_SB_INV_RX_2;
input         FFC_SB_INV_RX_3;

output        FFS_CC_ORUN_0;
output        FFS_CC_ORUN_1;
output        FFS_CC_ORUN_2;
output        FFS_CC_ORUN_3;

output        FFS_CC_URUN_0;
output        FFS_CC_URUN_1;
output        FFS_CC_URUN_2;
output        FFS_CC_URUN_3;

input         FFC_CK_CORE_TX;
input         FFC_CK_CORE_RX;

output BS4PAD_0, BS4PAD_1, BS4PAD_2, BS4PAD_3;

// ---------------------------------------------------------------------------

output RDATAO_7, RDATAO_6, RDATAO_5, RDATAO_4, RDATAO_3, RDATAO_2, RDATAO_1, RDATAO_0;
output        INTO;

input  ADDRI_7, ADDRI_6, ADDRI_5, ADDRI_4, ADDRI_3, ADDRI_2, ADDRI_1, ADDRI_0;
input  WDATAI_7, WDATAI_6, WDATAI_5, WDATAI_4, WDATAI_3, WDATAI_2, WDATAI_1, WDATAI_0;
input         RDI;
input         WSTBI;

input         CS_CHIF_0;
input         CS_CHIF_1;
input         CS_CHIF_2;
input         CS_CHIF_3;
input         CS_QIF;

input  QUAD_ID_1, QUAD_ID_0;

// ---------------------------------------------------------------------------

output        FF_SYSCLK_P1;

output        FF_SYSCLK0;
output        FF_SYSCLK1;
output        FF_SYSCLK2;
output        FF_SYSCLK3;

output        FF_RXCLK_P1;
output        FF_RXCLK_P2;

output        FF_RXCLK0;
output        FF_RXCLK1;
output        FF_RXCLK2;
output        FF_RXCLK3;

// ---------------------------------------------------------------------------

output        QUAD_CLK;

input  GRP_CLK_P1_3, GRP_CLK_P1_2, GRP_CLK_P1_1, GRP_CLK_P1_0;
input  GRP_CLK_P2_3, GRP_CLK_P2_2, GRP_CLK_P2_1, GRP_CLK_P2_0;
input  GRP_START_3, GRP_START_2, GRP_START_1, GRP_START_0;
input  GRP_DONE_3, GRP_DONE_2, GRP_DONE_1, GRP_DONE_0;
input  GRP_DESKEW_ERROR_3, GRP_DESKEW_ERROR_2, GRP_DESKEW_ERROR_1, GRP_DESKEW_ERROR_0;

output        IQA_START_LS;
output        IQA_DONE_LS;
output        IQA_AND_FP1_LS;
output        IQA_AND_FP0_LS;
output        IQA_OR_FP1_LS;
output        IQA_OR_FP0_LS;
output        IQA_RST_N;

// ---------------------------------------------------------------------------

input         FF_TCLK0;
input         FF_TCLK1;
input         FF_TCLK2;
input         FF_TCLK3;

input         FF_RCLK0;
input         FF_RCLK1;
input         FF_RCLK2;
input         FF_RCLK3;
input         TCK_FMACP;

input  FF_TXD_0_23, FF_TXD_0_22, FF_TXD_0_21, FF_TXD_0_20, FF_TXD_0_19, FF_TXD_0_18,
       FF_TXD_0_17, FF_TXD_0_16, FF_TXD_0_15, FF_TXD_0_14, FF_TXD_0_13, FF_TXD_0_12,
       FF_TXD_0_11, FF_TXD_0_10, FF_TXD_0_9, FF_TXD_0_8, FF_TXD_0_7, FF_TXD_0_6,
       FF_TXD_0_5, FF_TXD_0_4, FF_TXD_0_3, FF_TXD_0_2, FF_TXD_0_1, FF_TXD_0_0;
output FB_RXD_0_23, FB_RXD_0_22, FB_RXD_0_21, FB_RXD_0_20, FB_RXD_0_19, FB_RXD_0_18,
       FB_RXD_0_17, FB_RXD_0_16, FB_RXD_0_15, FB_RXD_0_14, FB_RXD_0_13, FB_RXD_0_12,
       FB_RXD_0_11, FB_RXD_0_10, FB_RXD_0_9, FB_RXD_0_8, FB_RXD_0_7, FB_RXD_0_6,
       FB_RXD_0_5, FB_RXD_0_4, FB_RXD_0_3, FB_RXD_0_2, FB_RXD_0_1, FB_RXD_0_0;
input  FF_TXD_1_23, FF_TXD_1_22, FF_TXD_1_21, FF_TXD_1_20, FF_TXD_1_19, FF_TXD_1_18,
       FF_TXD_1_17, FF_TXD_1_16, FF_TXD_1_15, FF_TXD_1_14, FF_TXD_1_13, FF_TXD_1_12,
       FF_TXD_1_11, FF_TXD_1_10, FF_TXD_1_9, FF_TXD_1_8, FF_TXD_1_7, FF_TXD_1_6,
       FF_TXD_1_5, FF_TXD_1_4, FF_TXD_1_3, FF_TXD_1_2, FF_TXD_1_1, FF_TXD_1_0;
output FB_RXD_1_23, FB_RXD_1_22, FB_RXD_1_21, FB_RXD_1_20, FB_RXD_1_19, FB_RXD_1_18,
       FB_RXD_1_17, FB_RXD_1_16, FB_RXD_1_15, FB_RXD_1_14, FB_RXD_1_13, FB_RXD_1_12,
       FB_RXD_1_11, FB_RXD_1_10, FB_RXD_1_9, FB_RXD_1_8, FB_RXD_1_7, FB_RXD_1_6,
       FB_RXD_1_5, FB_RXD_1_4, FB_RXD_1_3, FB_RXD_1_2, FB_RXD_1_1, FB_RXD_1_0;
input  FF_TXD_2_23, FF_TXD_2_22, FF_TXD_2_21, FF_TXD_2_20, FF_TXD_2_19, FF_TXD_2_18,
       FF_TXD_2_17, FF_TXD_2_16, FF_TXD_2_15, FF_TXD_2_14, FF_TXD_2_13, FF_TXD_2_12,
       FF_TXD_2_11, FF_TXD_2_10, FF_TXD_2_9, FF_TXD_2_8, FF_TXD_2_7, FF_TXD_2_6,
       FF_TXD_2_5, FF_TXD_2_4, FF_TXD_2_3, FF_TXD_2_2, FF_TXD_2_1, FF_TXD_2_0;
output FB_RXD_2_23, FB_RXD_2_22, FB_RXD_2_21, FB_RXD_2_20, FB_RXD_2_19, FB_RXD_2_18,
       FB_RXD_2_17, FB_RXD_2_16, FB_RXD_2_15, FB_RXD_2_14, FB_RXD_2_13, FB_RXD_2_12,
       FB_RXD_2_11, FB_RXD_2_10, FB_RXD_2_9, FB_RXD_2_8, FB_RXD_2_7, FB_RXD_2_6,
       FB_RXD_2_5, FB_RXD_2_4, FB_RXD_2_3, FB_RXD_2_2, FB_RXD_2_1, FB_RXD_2_0;
input  FF_TXD_3_23, FF_TXD_3_22, FF_TXD_3_21, FF_TXD_3_20, FF_TXD_3_19, FF_TXD_3_18,
       FF_TXD_3_17, FF_TXD_3_16, FF_TXD_3_15, FF_TXD_3_14, FF_TXD_3_13, FF_TXD_3_12,
       FF_TXD_3_11, FF_TXD_3_10, FF_TXD_3_9, FF_TXD_3_8, FF_TXD_3_7, FF_TXD_3_6,
       FF_TXD_3_5, FF_TXD_3_4, FF_TXD_3_3, FF_TXD_3_2, FF_TXD_3_1, FF_TXD_3_0;
output FB_RXD_3_23, FB_RXD_3_22, FB_RXD_3_21, FB_RXD_3_20, FB_RXD_3_19, FB_RXD_3_18,
       FB_RXD_3_17, FB_RXD_3_16, FB_RXD_3_15, FB_RXD_3_14, FB_RXD_3_13, FB_RXD_3_12,
       FB_RXD_3_11, FB_RXD_3_10, FB_RXD_3_9, FB_RXD_3_8, FB_RXD_3_7, FB_RXD_3_6,
       FB_RXD_3_5, FB_RXD_3_4, FB_RXD_3_3, FB_RXD_3_2, FB_RXD_3_1, FB_RXD_3_0;
output        TCK_FMAC;
output COUT_21, COUT_20, COUT_19, COUT_18, COUT_17, COUT_16, COUT_15, COUT_14, COUT_13,
       COUT_12, COUT_11, COUT_10, COUT_9, COUT_8, COUT_7, COUT_6, COUT_5, COUT_4,
       COUT_3, COUT_2, COUT_1, COUT_0;
input  CIN_12, CIN_11, CIN_10, CIN_9, CIN_8, CIN_7, CIN_6, CIN_5, CIN_4,
       CIN_3, CIN_2, CIN_1, CIN_0;
input         TESTCLK_MACO;

//synopsys translate_off
parameter CONFIG_FILE = #_circuit_name_new;

defparam PCSA_sim_inst.CONFIG_FILE = CONFIG_FILE;

PCSA_sim PCSA_sim_inst (
 .HDINP0(HDINP0),
 .HDINN0(HDINN0),
 .HDINP1(HDINP1),
 .HDINN1(HDINN1),
 .HDINP2(HDINP2),
 .HDINN2(HDINN2),
 .HDINP3(HDINP3),
 .HDINN3(HDINN3),
 .HDOUTP0(HDOUTP0),
 .HDOUTN0(HDOUTN0),
 .HDOUTP1(HDOUTP1),
 .HDOUTN1(HDOUTN1),
 .HDOUTP2(HDOUTP2),
 .HDOUTN2(HDOUTN2),
 .HDOUTP3(HDOUTP3),
 .HDOUTN3(HDOUTN3),
 .REFCLKP(REFCLKP),
 .REFCLKN(REFCLKN),
 .RXREFCLKP(RXREFCLKP),
 .RXREFCLKN(RXREFCLKN),
 .FFC_QUAD_RST(FFC_QUAD_RST),
 .FFC_MACRO_RST(FFC_MACRO_RST),
 .FFC_LANE_TX_RST0(FFC_LANE_TX_RST0),
 .FFC_LANE_TX_RST1(FFC_LANE_TX_RST1),
 .FFC_LANE_TX_RST2(FFC_LANE_TX_RST2),
 .FFC_LANE_TX_RST3(FFC_LANE_TX_RST3),
 .FFC_LANE_RX_RST0(FFC_LANE_RX_RST0),
 .FFC_LANE_RX_RST1(FFC_LANE_RX_RST1),
 .FFC_LANE_RX_RST2(FFC_LANE_RX_RST2),
 .FFC_LANE_RX_RST3(FFC_LANE_RX_RST3),
 .FFC_PCIE_EI_EN_0(FFC_PCIE_EI_EN_0),
 .FFC_PCIE_EI_EN_1(FFC_PCIE_EI_EN_1),
 .FFC_PCIE_EI_EN_2(FFC_PCIE_EI_EN_2),
 .FFC_PCIE_EI_EN_3(FFC_PCIE_EI_EN_3),
 .FFC_PCIE_CT_0(FFC_PCIE_CT_0),
 .FFC_PCIE_CT_1(FFC_PCIE_CT_1),
 .FFC_PCIE_CT_2(FFC_PCIE_CT_2),
 .FFC_PCIE_CT_3(FFC_PCIE_CT_3),
 .FFS_PCIE_CON_0(FFS_PCIE_CON_0),
 .FFS_PCIE_CON_1(FFS_PCIE_CON_1),
 .FFS_PCIE_CON_2(FFS_PCIE_CON_2),
 .FFS_PCIE_CON_3(FFS_PCIE_CON_3),
 .FFS_PCIE_DONE_0(FFS_PCIE_DONE_0),
 .FFS_PCIE_DONE_1(FFS_PCIE_DONE_1),
 .FFS_PCIE_DONE_2(FFS_PCIE_DONE_2),
 .FFS_PCIE_DONE_3(FFS_PCIE_DONE_3),
 .FFC_PCIE_TX_0(FFC_PCIE_TX_0),
 .FFC_PCIE_TX_1(FFC_PCIE_TX_1),
 .FFC_PCIE_TX_2(FFC_PCIE_TX_2),
 .FFC_PCIE_TX_3(FFC_PCIE_TX_3),
 .FFC_PCIE_RX_0(FFC_PCIE_RX_0),
 .FFC_PCIE_RX_1(FFC_PCIE_RX_1),
 .FFC_PCIE_RX_2(FFC_PCIE_RX_2),
 .FFC_PCIE_RX_3(FFC_PCIE_RX_3),
 .FFC_SD_0(FFC_SD_0),
 .FFC_SD_1(FFC_SD_1),
 .FFC_SD_2(FFC_SD_2),
 .FFC_SD_3(FFC_SD_3),
 .FFC_EN_CGA_0(FFC_EN_CGA_0),
 .FFC_EN_CGA_1(FFC_EN_CGA_1),
 .FFC_EN_CGA_2(FFC_EN_CGA_2),
 .FFC_EN_CGA_3(FFC_EN_CGA_3),
 .FFC_ALIGN_EN_0(FFC_ALIGN_EN_0),
 .FFC_ALIGN_EN_1(FFC_ALIGN_EN_1),
 .FFC_ALIGN_EN_2(FFC_ALIGN_EN_2),
 .FFC_ALIGN_EN_3(FFC_ALIGN_EN_3),
 .FFC_AB_RESET(FFC_AB_RESET),
 .FFC_CD_RESET(FFC_CD_RESET),
 .FFS_LS_STATUS_0(FFS_LS_STATUS_0),
 .FFS_LS_STATUS_1(FFS_LS_STATUS_1),
 .FFS_LS_STATUS_2(FFS_LS_STATUS_2),
 .FFS_LS_STATUS_3(FFS_LS_STATUS_3),
 .FFS_AB_STATUS(FFS_AB_STATUS),
 .FFS_CD_STATUS(FFS_CD_STATUS),
 .FFS_AB_ALIGNED(FFS_AB_ALIGNED),
 .FFS_CD_ALIGNED(FFS_CD_ALIGNED),
 .FFS_AB_FAILED(FFS_AB_FAILED),
 .FFS_CD_FAILED(FFS_CD_FAILED),
 .FFS_RLOS_LO0(FFS_RLOS_LO0),
 .FFS_RLOS_LO1(FFS_RLOS_LO1),
 .FFS_RLOS_LO2(FFS_RLOS_LO2),
 .FFS_RLOS_LO3(FFS_RLOS_LO3),
 .FFC_FB_LB_0(FFC_FB_LB_0),
 .FFC_FB_LB_1(FFC_FB_LB_1),
 .FFC_FB_LB_2(FFC_FB_LB_2),
 .FFC_FB_LB_3(FFC_FB_LB_3),
 .FFC_SB_INV_RX_0(FFC_SB_INV_RX_0),
 .FFC_SB_INV_RX_1(FFC_SB_INV_RX_1),
 .FFC_SB_INV_RX_2(FFC_SB_INV_RX_2),
 .FFC_SB_INV_RX_3(FFC_SB_INV_RX_3),
 .FFS_CC_ORUN_0(FFS_CC_ORUN_0),
 .FFS_CC_ORUN_1(FFS_CC_ORUN_1),
 .FFS_CC_ORUN_2(FFS_CC_ORUN_2),
 .FFS_CC_ORUN_3(FFS_CC_ORUN_3),
 .FFS_CC_URUN_0(FFS_CC_URUN_0),
 .FFS_CC_URUN_1(FFS_CC_URUN_1),
 .FFS_CC_URUN_2(FFS_CC_URUN_2),
 .FFS_CC_URUN_3(FFS_CC_URUN_3),
 .FFC_CK_CORE_TX(FFC_CK_CORE_TX),
 .FFC_CK_CORE_RX(FFC_CK_CORE_RX),
 .BS4PAD_0(BS4PAD_0),
 .BS4PAD_1(BS4PAD_1),
 .BS4PAD_2(BS4PAD_2),
 .BS4PAD_3(BS4PAD_3),
 .RDATAO_7(RDATAO_7),
 .RDATAO_6(RDATAO_6),
 .RDATAO_5(RDATAO_5),
 .RDATAO_4(RDATAO_4),
 .RDATAO_3(RDATAO_3),
 .RDATAO_2(RDATAO_2),
 .RDATAO_1(RDATAO_1),
 .RDATAO_0(RDATAO_0),
 .INTO(INTO),
 .ADDRI_7(ADDRI_7),
 .ADDRI_6(ADDRI_6),
 .ADDRI_5(ADDRI_5),
 .ADDRI_4(ADDRI_4),
 .ADDRI_3(ADDRI_3),
 .ADDRI_2(ADDRI_2),
 .ADDRI_1(ADDRI_1),
 .ADDRI_0(ADDRI_0),
 .WDATAI_7(WDATAI_7),
 .WDATAI_6(WDATAI_6),
 .WDATAI_5(WDATAI_5),
 .WDATAI_4(WDATAI_4),
 .WDATAI_3(WDATAI_3),
 .WDATAI_2(WDATAI_2),
 .WDATAI_1(WDATAI_1),
 .WDATAI_0(WDATAI_0),
 .RDI(RDI),
 .WSTBI(WSTBI),
 .CS_CHIF_0(CS_CHIF_0),
 .CS_CHIF_1(CS_CHIF_1),
 .CS_CHIF_2(CS_CHIF_2),
 .CS_CHIF_3(CS_CHIF_3),
 .CS_QIF(CS_QIF),
 .QUAD_ID_1(QUAD_ID_1),
 .QUAD_ID_0(QUAD_ID_0),
 .FF_SYSCLK_P1(FF_SYSCLK_P1),
 .FF_SYSCLK0(FF_SYSCLK0),
 .FF_SYSCLK1(FF_SYSCLK1),
 .FF_SYSCLK2(FF_SYSCLK2),
 .FF_SYSCLK3(FF_SYSCLK3),
 .FF_RXCLK_P1(FF_RXCLK_P1),
 .FF_RXCLK_P2(FF_RXCLK_P2),
 .FF_RXCLK0(FF_RXCLK0),
 .FF_RXCLK1(FF_RXCLK1),
 .FF_RXCLK2(FF_RXCLK2),
 .FF_RXCLK3(FF_RXCLK3),
 .QUAD_CLK(QUAD_CLK),
 .GRP_CLK_P1_3(GRP_CLK_P1_3),
 .GRP_CLK_P1_2(GRP_CLK_P1_2),
 .GRP_CLK_P1_1(GRP_CLK_P1_1),
 .GRP_CLK_P1_0(GRP_CLK_P1_0),
 .GRP_CLK_P2_3(GRP_CLK_P2_3),
 .GRP_CLK_P2_2(GRP_CLK_P2_2),
 .GRP_CLK_P2_1(GRP_CLK_P2_1),
 .GRP_CLK_P2_0(GRP_CLK_P2_0),
 .GRP_START_3(GRP_START_3),
 .GRP_START_2(GRP_START_2),
 .GRP_START_1(GRP_START_1),
 .GRP_START_0(GRP_START_0),
 .GRP_DONE_3(GRP_DONE_3),
 .GRP_DONE_2(GRP_DONE_2),
 .GRP_DONE_1(GRP_DONE_1),
 .GRP_DONE_0(GRP_DONE_0),
 .GRP_DESKEW_ERROR_3(GRP_DESKEW_ERROR_3),
 .GRP_DESKEW_ERROR_2(GRP_DESKEW_ERROR_2),
 .GRP_DESKEW_ERROR_1(GRP_DESKEW_ERROR_1),
 .GRP_DESKEW_ERROR_0(GRP_DESKEW_ERROR_0),
 .IQA_START_LS(IQA_START_LS),
 .IQA_DONE_LS(IQA_DONE_LS),
 .IQA_AND_FP1_LS(IQA_AND_FP1_LS),
 .IQA_AND_FP0_LS(IQA_AND_FP0_LS),
 .IQA_OR_FP1_LS(IQA_OR_FP1_LS),
 .IQA_OR_FP0_LS(IQA_OR_FP0_LS),
 .IQA_RST_N(IQA_RST_N),
 .FF_TCLK0(FF_TCLK0),
 .FF_TCLK1(FF_TCLK1),
 .FF_TCLK2(FF_TCLK2),
 .FF_TCLK3(FF_TCLK3),
 .FF_RCLK0(FF_RCLK0),
 .FF_RCLK1(FF_RCLK1),
 .FF_RCLK2(FF_RCLK2),
 .FF_RCLK3(FF_RCLK3),
 .TCK_FMACP(TCK_FMACP),
 .FF_TXD_0_23(FF_TXD_0_23),
 .FF_TXD_0_22(FF_TXD_0_22),
 .FF_TXD_0_21(FF_TXD_0_21),
 .FF_TXD_0_20(FF_TXD_0_20),
 .FF_TXD_0_19(FF_TXD_0_19),
 .FF_TXD_0_18(FF_TXD_0_18),
 .FF_TXD_0_17(FF_TXD_0_17),
 .FF_TXD_0_16(FF_TXD_0_16),
 .FF_TXD_0_15(FF_TXD_0_15),
 .FF_TXD_0_14(FF_TXD_0_14),
 .FF_TXD_0_13(FF_TXD_0_13),
 .FF_TXD_0_12(FF_TXD_0_12),
 .FF_TXD_0_11(FF_TXD_0_11),
 .FF_TXD_0_10(FF_TXD_0_10),
 .FF_TXD_0_9(FF_TXD_0_9),
 .FF_TXD_0_8(FF_TXD_0_8),
 .FF_TXD_0_7(FF_TXD_0_7),
 .FF_TXD_0_6(FF_TXD_0_6),
 .FF_TXD_0_5(FF_TXD_0_5),
 .FF_TXD_0_4(FF_TXD_0_4),
 .FF_TXD_0_3(FF_TXD_0_3),
 .FF_TXD_0_2(FF_TXD_0_2),
 .FF_TXD_0_1(FF_TXD_0_1),
 .FF_TXD_0_0(FF_TXD_0_0),
 .FB_RXD_0_23(FB_RXD_0_23),
 .FB_RXD_0_22(FB_RXD_0_22),
 .FB_RXD_0_21(FB_RXD_0_21),
 .FB_RXD_0_20(FB_RXD_0_20),
 .FB_RXD_0_19(FB_RXD_0_19),
 .FB_RXD_0_18(FB_RXD_0_18),
 .FB_RXD_0_17(FB_RXD_0_17),
 .FB_RXD_0_16(FB_RXD_0_16),
 .FB_RXD_0_15(FB_RXD_0_15),
 .FB_RXD_0_14(FB_RXD_0_14),
 .FB_RXD_0_13(FB_RXD_0_13),
 .FB_RXD_0_12(FB_RXD_0_12),
 .FB_RXD_0_11(FB_RXD_0_11),
 .FB_RXD_0_10(FB_RXD_0_10),
 .FB_RXD_0_9(FB_RXD_0_9),
 .FB_RXD_0_8(FB_RXD_0_8),
 .FB_RXD_0_7(FB_RXD_0_7),
 .FB_RXD_0_6(FB_RXD_0_6),
 .FB_RXD_0_5(FB_RXD_0_5),
 .FB_RXD_0_4(FB_RXD_0_4),
 .FB_RXD_0_3(FB_RXD_0_3),
 .FB_RXD_0_2(FB_RXD_0_2),
 .FB_RXD_0_1(FB_RXD_0_1),
 .FB_RXD_0_0(FB_RXD_0_0),
 .FF_TXD_1_23(FF_TXD_1_23),
 .FF_TXD_1_22(FF_TXD_1_22),
 .FF_TXD_1_21(FF_TXD_1_21),
 .FF_TXD_1_20(FF_TXD_1_20),
 .FF_TXD_1_19(FF_TXD_1_19),
 .FF_TXD_1_18(FF_TXD_1_18),
 .FF_TXD_1_17(FF_TXD_1_17),
 .FF_TXD_1_16(FF_TXD_1_16),
 .FF_TXD_1_15(FF_TXD_1_15),
 .FF_TXD_1_14(FF_TXD_1_14),
 .FF_TXD_1_13(FF_TXD_1_13),
 .FF_TXD_1_12(FF_TXD_1_12),
 .FF_TXD_1_11(FF_TXD_1_11),
 .FF_TXD_1_10(FF_TXD_1_10),
 .FF_TXD_1_9(FF_TXD_1_9),
 .FF_TXD_1_8(FF_TXD_1_8),
 .FF_TXD_1_7(FF_TXD_1_7),
 .FF_TXD_1_6(FF_TXD_1_6),
 .FF_TXD_1_5(FF_TXD_1_5),
 .FF_TXD_1_4(FF_TXD_1_4),
 .FF_TXD_1_3(FF_TXD_1_3),
 .FF_TXD_1_2(FF_TXD_1_2),
 .FF_TXD_1_1(FF_TXD_1_1),
 .FF_TXD_1_0(FF_TXD_1_0),
 .FB_RXD_1_23(FB_RXD_1_23),
 .FB_RXD_1_22(FB_RXD_1_22),
 .FB_RXD_1_21(FB_RXD_1_21),
 .FB_RXD_1_20(FB_RXD_1_20),
 .FB_RXD_1_19(FB_RXD_1_19),
 .FB_RXD_1_18(FB_RXD_1_18),
 .FB_RXD_1_17(FB_RXD_1_17),
 .FB_RXD_1_16(FB_RXD_1_16),
 .FB_RXD_1_15(FB_RXD_1_15),
 .FB_RXD_1_14(FB_RXD_1_14),
 .FB_RXD_1_13(FB_RXD_1_13),
 .FB_RXD_1_12(FB_RXD_1_12),
 .FB_RXD_1_11(FB_RXD_1_11),
 .FB_RXD_1_10(FB_RXD_1_10),
 .FB_RXD_1_9(FB_RXD_1_9),
 .FB_RXD_1_8(FB_RXD_1_8),
 .FB_RXD_1_7(FB_RXD_1_7),
 .FB_RXD_1_6(FB_RXD_1_6),
 .FB_RXD_1_5(FB_RXD_1_5),
 .FB_RXD_1_4(FB_RXD_1_4),
 .FB_RXD_1_3(FB_RXD_1_3),
 .FB_RXD_1_2(FB_RXD_1_2),
 .FB_RXD_1_1(FB_RXD_1_1),
 .FB_RXD_1_0(FB_RXD_1_0),
 .FF_TXD_2_23(FF_TXD_2_23),
 .FF_TXD_2_22(FF_TXD_2_22),
 .FF_TXD_2_21(FF_TXD_2_21),
 .FF_TXD_2_20(FF_TXD_2_20),
 .FF_TXD_2_19(FF_TXD_2_19),
 .FF_TXD_2_18(FF_TXD_2_18),
 .FF_TXD_2_17(FF_TXD_2_17),
 .FF_TXD_2_16(FF_TXD_2_16),
 .FF_TXD_2_15(FF_TXD_2_15),
 .FF_TXD_2_14(FF_TXD_2_14),
 .FF_TXD_2_13(FF_TXD_2_13),
 .FF_TXD_2_12(FF_TXD_2_12),
 .FF_TXD_2_11(FF_TXD_2_11),
 .FF_TXD_2_10(FF_TXD_2_10),
 .FF_TXD_2_9(FF_TXD_2_9),
 .FF_TXD_2_8(FF_TXD_2_8),
 .FF_TXD_2_7(FF_TXD_2_7),
 .FF_TXD_2_6(FF_TXD_2_6),
 .FF_TXD_2_5(FF_TXD_2_5),
 .FF_TXD_2_4(FF_TXD_2_4),
 .FF_TXD_2_3(FF_TXD_2_3),
 .FF_TXD_2_2(FF_TXD_2_2),
 .FF_TXD_2_1(FF_TXD_2_1),
 .FF_TXD_2_0(FF_TXD_2_0),
 .FB_RXD_2_23(FB_RXD_2_23),
 .FB_RXD_2_22(FB_RXD_2_22),
 .FB_RXD_2_21(FB_RXD_2_21),
 .FB_RXD_2_20(FB_RXD_2_20),
 .FB_RXD_2_19(FB_RXD_2_19),
 .FB_RXD_2_18(FB_RXD_2_18),
 .FB_RXD_2_17(FB_RXD_2_17),
 .FB_RXD_2_16(FB_RXD_2_16),
 .FB_RXD_2_15(FB_RXD_2_15),
 .FB_RXD_2_14(FB_RXD_2_14),
 .FB_RXD_2_13(FB_RXD_2_13),
 .FB_RXD_2_12(FB_RXD_2_12),
 .FB_RXD_2_11(FB_RXD_2_11),
 .FB_RXD_2_10(FB_RXD_2_10),
 .FB_RXD_2_9(FB_RXD_2_9),
 .FB_RXD_2_8(FB_RXD_2_8),
 .FB_RXD_2_7(FB_RXD_2_7),
 .FB_RXD_2_6(FB_RXD_2_6),
 .FB_RXD_2_5(FB_RXD_2_5),
 .FB_RXD_2_4(FB_RXD_2_4),
 .FB_RXD_2_3(FB_RXD_2_3),
 .FB_RXD_2_2(FB_RXD_2_2),
 .FB_RXD_2_1(FB_RXD_2_1),
 .FB_RXD_2_0(FB_RXD_2_0),
 .FF_TXD_3_23(FF_TXD_3_23),
 .FF_TXD_3_22(FF_TXD_3_22),
 .FF_TXD_3_21(FF_TXD_3_21),
 .FF_TXD_3_20(FF_TXD_3_20),
 .FF_TXD_3_19(FF_TXD_3_19),
 .FF_TXD_3_18(FF_TXD_3_18),
 .FF_TXD_3_17(FF_TXD_3_17),
 .FF_TXD_3_16(FF_TXD_3_16),
 .FF_TXD_3_15(FF_TXD_3_15),
 .FF_TXD_3_14(FF_TXD_3_14),
 .FF_TXD_3_13(FF_TXD_3_13),
 .FF_TXD_3_12(FF_TXD_3_12),
 .FF_TXD_3_11(FF_TXD_3_11),
 .FF_TXD_3_10(FF_TXD_3_10),
 .FF_TXD_3_9(FF_TXD_3_9),
 .FF_TXD_3_8(FF_TXD_3_8),
 .FF_TXD_3_7(FF_TXD_3_7),
 .FF_TXD_3_6(FF_TXD_3_6),
 .FF_TXD_3_5(FF_TXD_3_5),
 .FF_TXD_3_4(FF_TXD_3_4),
 .FF_TXD_3_3(FF_TXD_3_3),
 .FF_TXD_3_2(FF_TXD_3_2),
 .FF_TXD_3_1(FF_TXD_3_1),
 .FF_TXD_3_0(FF_TXD_3_0),
 .FB_RXD_3_23(FB_RXD_3_23),
 .FB_RXD_3_22(FB_RXD_3_22),
 .FB_RXD_3_21(FB_RXD_3_21),
 .FB_RXD_3_20(FB_RXD_3_20),
 .FB_RXD_3_19(FB_RXD_3_19),
 .FB_RXD_3_18(FB_RXD_3_18),
 .FB_RXD_3_17(FB_RXD_3_17),
 .FB_RXD_3_16(FB_RXD_3_16),
 .FB_RXD_3_15(FB_RXD_3_15),
 .FB_RXD_3_14(FB_RXD_3_14),
 .FB_RXD_3_13(FB_RXD_3_13),
 .FB_RXD_3_12(FB_RXD_3_12),
 .FB_RXD_3_11(FB_RXD_3_11),
 .FB_RXD_3_10(FB_RXD_3_10),
 .FB_RXD_3_9(FB_RXD_3_9),
 .FB_RXD_3_8(FB_RXD_3_8),
 .FB_RXD_3_7(FB_RXD_3_7),
 .FB_RXD_3_6(FB_RXD_3_6),
 .FB_RXD_3_5(FB_RXD_3_5),
 .FB_RXD_3_4(FB_RXD_3_4),
 .FB_RXD_3_3(FB_RXD_3_3),
 .FB_RXD_3_2(FB_RXD_3_2),
 .FB_RXD_3_1(FB_RXD_3_1),
 .FB_RXD_3_0(FB_RXD_3_0),
 .TCK_FMAC(TCK_FMAC),
 .TESTCLK_MACO(TESTCLK_MACO),
 .COUT_21(COUT_21),
 .COUT_20(COUT_20),
 .COUT_19(COUT_19),
 .COUT_18(COUT_18),
 .COUT_17(COUT_17),
 .COUT_16(COUT_16),
 .COUT_15(COUT_15),
 .COUT_14(COUT_14),
 .COUT_13(COUT_13),
 .COUT_12(COUT_12),
 .COUT_11(COUT_11),
 .COUT_10(COUT_10),
 .COUT_9(COUT_9),
 .COUT_8(COUT_8),
 .COUT_7(COUT_7),
 .COUT_6(COUT_6),
 .COUT_5(COUT_5),
 .COUT_4(COUT_4),
 .COUT_3(COUT_3),
 .COUT_2(COUT_2),
 .COUT_1(COUT_1),
 .COUT_0(COUT_0),
 .CIN_12(CIN_12),
 .CIN_11(CIN_11),
 .CIN_10(CIN_10),
 .CIN_9(CIN_9),
 .CIN_8(CIN_8),
 .CIN_7(CIN_7),
 .CIN_6(CIN_6),
 .CIN_5(CIN_5),
 .CIN_4(CIN_4),
 .CIN_3(CIN_3),
 .CIN_2(CIN_2),
 .CIN_1(CIN_1),
 .CIN_0(CIN_0)
);

//synopsys translate_on

endmodule
#include <pcs/pcs.tft>
