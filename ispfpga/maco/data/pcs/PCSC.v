#log _circuit_name.v

#define -r SLASH2 //
#define -r STARTCOM /*
#define -r ENDCOM */
#ifndef _ch0_teidle
#define _ch0_teidle "FALSE"
#endif
#ifndef _ch1_teidle
#define _ch1_teidle "FALSE"
#endif
#ifndef _ch2_teidle
#define _ch2_teidle "FALSE"
#endif
#ifndef _ch3_teidle
#define _ch3_teidle "FALSE"
#endif
#ifndef _device_name
#define _device_name "LFE2M35E"
#endif
#ifndef _ch0_pll_rxsrc
#define _ch0_pll_rxsrc "REFCLK"
#endif
#ifndef _ch1_pll_rxsrc
#define _ch1_pll_rxsrc "REFCLK"
#endif
#ifndef _ch2_pll_rxsrc
#define _ch2_pll_rxsrc "REFCLK"
#endif
#ifndef _ch3_pll_rxsrc
#define _ch3_pll_rxsrc "REFCLK"
#endif
#macro converter1(arg1,arg2)
#define arg2 arg1##.txt
#endmacro
#if _protocol_mode == "Quad Based Protocol Mode"
#define _data_width_ch0    _data_width
#define _data_width_ch1    _data_width
#define _data_width_ch2    _data_width
#define _data_width_ch3    _data_width
#elif _protocol_mode == "Channel Based Protocol Mode"
#if _ch0_rate == "Half Rate"
#define _data_width_ch0     _data_width_half
#else 
#define _data_width_ch0     _data_width
#endif
#if _ch1_rate == "Half Rate"
#define _data_width_ch1     _data_width_half
#else 
#define _data_width_ch1     _data_width
#endif
#if _ch2_rate == "Half Rate"
#define _data_width_ch2     _data_width_half
#else 
#define _data_width_ch2     _data_width
#endif
#if _ch3_rate == "Half Rate"
#define _data_width_ch3     _data_width_half
#else 
#define _data_width_ch3     _data_width
#endif
#endif
#converter1(_circuit_name, _circuit_name_new)

`define NULL 0
`timescale 1ns / 1 ps

module _circuit_name (
// serdes clk pins //
#if _pll_txsrc == "CORE_TXREFCLK"  //{
  core_txrefclk,
#endif  //}
#if _protocol_mode == "Quad Based Protocol Mode"
#if _pll_rxsrc == "CORE_RXREFCLK"  
  core_rxrefclk,
#endif  
#if _pll_txsrc == "REFCLK" || _pll_rxsrc == "REFCLK"    
  refclkp, refclkn,
#endif  
#elif _protocol_mode == "Channel Based Protocol Mode"
#if _ch0_pll_rxsrc == "CORE_RXREFCLK" || _ch1_pll_rxsrc == "CORE_RXREFCLK" || _ch2_pll_rxsrc == "CORE_RXREFCLK" || _ch3_pll_rxsrc == "CORE_RXREFCLK"  
  core_rxrefclk,
#endif  
#if _pll_txsrc == "REFCLK" || _ch0_pll_rxsrc == "REFCLK" || _ch1_pll_rxsrc == "REFCLK" || _ch2_pll_rxsrc == "REFCLK" || _ch3_pll_rxsrc == "REFCLK"  
  refclkp, refclkn,
#endif  
#endif  //}

#if _ch0_mode != "DISABLE"
#if _sci_ports == "TRUE"
  scisel_ch0, scien_ch0,
#endif
  hdinp0, hdinn0, hdoutp0, hdoutn0,
  ff_rxiclk_ch0, ff_txiclk_ch0, ff_ebrd_clk_0,
#if _pllqclkports == "TRUE"
  ff_rxqtrclk_ch0,
#endif
#if _protocol == "PIPE"
  TxData_ch0, RxData_ch0,
#else
  ff_txdata_ch0, ff_rxdata_ch0,
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" 
  ff_tx_k_cntrl_ch0, ff_rx_k_cntrl_ch0,
#elif _protocol == "XAUI"
  ff_txc_ch0, ff_rxc_ch0,
#elif _protocol == "PIPE"
  TxDataK_ch0, RxDataK_ch0,
#endif
  ff_rxfullclk_ch0,
#if _data_width_ch0 == "16" || _data_width_ch0 == "20" && _ch0_ctc_byp == "BYPASS" 
  ff_rxhalfclk_ch0,
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I" 
  ff_force_disp_ch0,
#endif
#if _protocol == "GIGE" || _protocol == "OBSAI" 
  ff_xmit_ch0,
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
  ff_disp_sel_ch0,
#endif
#if _protocol == "PCIE" || _protocol == "PIPE" 
  ff_pci_ei_en_ch0,
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
  ff_correct_disp_ch0,
#endif
#if _protocol == "PCIE"  
  ff_rxstatus0_ch0, ff_rxstatus1_ch0,
#elif _protocol == "SATA_I" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "XAUI" || _protocol == "GIGE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "OBSAI" || _protocol == "G8B10B" 
  ff_disp_err_ch0, ff_cv_ch0,
#endif
#if _protocol == "PIPE"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  RxStatus0_ch0,
#else
  RxStatus0_ch0,
  RxStatus1_ch0,
#endif
#endif
#if _protocol == "PCIE"  
  ff_rxstatus2_ch0, 
#elif _protocol == "GIGE" || _protocol == "OBSAI"  
  ff_rx_even_ch0,
#endif
  ffc_rrst_ch0,
#if _ch0_elsm == "TRUE"
  ffc_signal_detect_ch0,
  ffc_enable_cgalign_ch0,
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
  ffc_pfifo_clr_ch0,
#endif
#endif
#if _ch0_ird == "TRUE" && _protocol != "PIPE"
  ffc_sb_inv_rx_ch0,
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF" 
  ffc_pcie_ct_ch0,
  ffc_pci_det_en_ch0,
  ffs_pcie_done_ch0,
  ffs_pcie_con_ch0,
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch0_teidle == "TRUE")
  ffc_ei_en_ch0,
#endif
  ffc_lane_tx_rst_ch0,
  ffc_lane_rx_rst_ch0,
  ffc_txpwdnb_ch0,
  ffc_rxpwdnb_ch0,
#if _protocol == "SATA_I"
  ffs_sata_oob_rx_ch0,
#elif _protocol != "PIPE"
  ffs_rlos_lo_ch0,
#endif
#if _protocol != "8BSER"
#if _comma_align == "AUTO"
  ffs_ls_sync_status_ch0,
#endif
#endif
#if _errsports == "TRUE"
  ffs_cc_underrun_ch0,
  ffs_cc_overrun_ch0,
  ffs_txfbfifo_error_ch0,
  ffs_rxfbfifo_error_ch0,
#endif
  ffs_rlol_ch0,
  oob_out_ch0,
#if _protocol == "PIPE"
  TxCompliance_ch0,  
  TxElecIdle_ch0,
  RxPolarity_ch0,
  RxValid_ch0,
  RxElecIdle_ch0,
#endif
#endif
#if _ch1_mode != "DISABLE"
#if _sci_ports == "TRUE"
  scisel_ch1, scien_ch1,
#endif
  hdinp1, hdinn1, hdoutp1, hdoutn1,
  ff_rxiclk_ch1, ff_txiclk_ch1, ff_ebrd_clk_1,
#if _pllqclkports == "TRUE"
  ff_rxqtrclk_ch1,
#endif
#if _protocol == "PIPE"
  TxData_ch1, RxData_ch1,
#else
  ff_txdata_ch1, ff_rxdata_ch1,
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" 
  ff_tx_k_cntrl_ch1, ff_rx_k_cntrl_ch1,
#elif _protocol == "XAUI"
  ff_txc_ch1, ff_rxc_ch1,
#elif _protocol == "PIPE"
  TxDataK_ch1, RxDataK_ch1,
#endif
  ff_rxfullclk_ch1,
#if _data_width_ch1 == "16" || _data_width_ch1 == "20" && _ch1_ctc_byp == "BYPASS" 
  ff_rxhalfclk_ch1,
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I" 
  ff_force_disp_ch1,
#endif
#if _protocol == "GIGE" || _protocol == "OBSAI" 
  ff_xmit_ch1,
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
  ff_disp_sel_ch1,
#endif
#if _protocol == "PCIE" || _protocol == "PIPE" 
  ff_pci_ei_en_ch1,
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
  ff_correct_disp_ch1,
#endif
#if _protocol == "PCIE"  
  ff_rxstatus0_ch1, ff_rxstatus1_ch1,
#elif _protocol == "SATA_I" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "XAUI" || _protocol == "GIGE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "OBSAI" || _protocol == "G8B10B" 
  ff_disp_err_ch1, ff_cv_ch1,
#endif
#if _protocol == "PIPE"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  RxStatus0_ch1,
#else
  RxStatus0_ch1,
  RxStatus1_ch1,
#endif
#endif
#if _protocol == "PCIE"  
  ff_rxstatus2_ch1, 
#elif _protocol == "GIGE" || _protocol == "OBSAI"  
  ff_rx_even_ch1,
#endif
  ffc_rrst_ch1,
#if _ch1_elsm == "TRUE"
  ffc_signal_detect_ch1,
  ffc_enable_cgalign_ch1,
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
  ffc_pfifo_clr_ch1,
#endif
#endif
#if _ch1_ird == "TRUE" && _protocol != "PIPE"
  ffc_sb_inv_rx_ch1,
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF" 
  ffc_pcie_ct_ch1,
  ffc_pci_det_en_ch1,
  ffs_pcie_done_ch1,
  ffs_pcie_con_ch1,
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch1_teidle == "TRUE")
  ffc_ei_en_ch1,
#endif
  ffc_lane_tx_rst_ch1,
  ffc_lane_rx_rst_ch1,
  ffc_txpwdnb_ch1,
  ffc_rxpwdnb_ch1,
#if _protocol == "SATA_I"
  ffs_sata_oob_rx_ch1,
#elif _protocol != "PIPE"
  ffs_rlos_lo_ch1,
#endif
#if _protocol != "8BSER"
#if _comma_align == "AUTO"
  ffs_ls_sync_status_ch1,
#endif
#endif
#if _errsports == "TRUE"
  ffs_cc_underrun_ch1,
  ffs_cc_overrun_ch1,
  ffs_txfbfifo_error_ch1,
  ffs_rxfbfifo_error_ch1,
#endif
  ffs_rlol_ch1,
  oob_out_ch1,
#if _protocol == "PIPE"
  TxCompliance_ch1,
  TxElecIdle_ch1,
  RxPolarity_ch1,
  RxValid_ch1,
  RxElecIdle_ch1,
#endif
#endif
#if _ch2_mode != "DISABLE"
#if _sci_ports == "TRUE"
  scisel_ch2, scien_ch2,
#endif
  hdinp2, hdinn2, hdoutp2, hdoutn2,
  ff_rxiclk_ch2, ff_txiclk_ch2, ff_ebrd_clk_2,
#if _pllqclkports == "TRUE"
  ff_rxqtrclk_ch2,
#endif
#if _protocol == "PIPE"
  TxData_ch2, RxData_ch2,
#else
  ff_txdata_ch2, ff_rxdata_ch2,
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" 
  ff_tx_k_cntrl_ch2, ff_rx_k_cntrl_ch2,
#elif _protocol == "XAUI"
  ff_txc_ch2, ff_rxc_ch2,
#elif _protocol == "PIPE"
  TxDataK_ch2, RxDataK_ch2,
#endif
  ff_rxfullclk_ch2,
#if _data_width_ch2 == "16" || _data_width_ch2 == "20" && _ch2_ctc_byp == "BYPASS" 
  ff_rxhalfclk_ch2,
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I" 
  ff_force_disp_ch2,
#endif
#if _protocol == "GIGE" || _protocol == "OBSAI" 
  ff_xmit_ch2,
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
  ff_disp_sel_ch2,
#endif
#if _protocol == "PCIE" || _protocol == "PIPE" 
  ff_pci_ei_en_ch2,
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
  ff_correct_disp_ch2,
#endif
#if _protocol == "PCIE"  
  ff_rxstatus0_ch2, ff_rxstatus1_ch2,
#elif _protocol == "SATA_I" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "XAUI" || _protocol == "GIGE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "OBSAI" || _protocol == "G8B10B" 
  ff_disp_err_ch2, ff_cv_ch2,
#endif
#if _protocol == "PIPE"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  RxStatus0_ch2,
#else
  RxStatus0_ch2,
  RxStatus1_ch2,
#endif
#endif
#if _protocol == "PCIE"  
  ff_rxstatus2_ch2, 
#elif _protocol == "GIGE" || _protocol == "OBSAI"  
  ff_rx_even_ch2,
#endif
  ffc_rrst_ch2,
#if _ch2_elsm == "TRUE"
  ffc_signal_detect_ch2,
  ffc_enable_cgalign_ch2,
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
  ffc_pfifo_clr_ch2,
#endif
#endif
#if _ch2_ird == "TRUE" && _protocol != "PIPE"
  ffc_sb_inv_rx_ch2,
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF" 
  ffc_pcie_ct_ch2,
  ffc_pci_det_en_ch2,
  ffs_pcie_done_ch2,
  ffs_pcie_con_ch2,
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch2_teidle == "TRUE")
  ffc_ei_en_ch2,
#endif
  ffc_lane_tx_rst_ch2,
  ffc_lane_rx_rst_ch2,
  ffc_txpwdnb_ch2,
  ffc_rxpwdnb_ch2,
#if _protocol == "SATA_I"
  ffs_sata_oob_rx_ch2,
#elif _protocol != "PIPE"
  ffs_rlos_lo_ch2,
#endif
#if _protocol != "8BSER"
#if _comma_align == "AUTO"
  ffs_ls_sync_status_ch2,
#endif
#endif
#if _errsports == "TRUE"
  ffs_cc_underrun_ch2,
  ffs_cc_overrun_ch2,
  ffs_txfbfifo_error_ch2,
  ffs_rxfbfifo_error_ch2,
#endif
  ffs_rlol_ch2,
  oob_out_ch2,
#if _protocol == "PIPE"
  TxCompliance_ch2,
  TxElecIdle_ch2,
  RxPolarity_ch2,
  RxValid_ch2,
  RxElecIdle_ch2,
#endif
#endif
#if _ch3_mode != "DISABLE"
#if _sci_ports == "TRUE"
  scisel_ch3, scien_ch3,
#endif
  hdinp3, hdinn3, hdoutp3, hdoutn3,
  ff_rxiclk_ch3, ff_txiclk_ch3, ff_ebrd_clk_3,
#if _pllqclkports == "TRUE"
  ff_rxqtrclk_ch3,
#endif
#if _protocol == "PIPE"
  TxData_ch3, RxData_ch3,
#else
  ff_txdata_ch3, ff_rxdata_ch3,
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" 
  ff_tx_k_cntrl_ch3, ff_rx_k_cntrl_ch3,
#elif _protocol == "XAUI"
  ff_txc_ch3, ff_rxc_ch3,
#elif _protocol == "PIPE"
  TxDataK_ch3, RxDataK_ch3,
#endif
  ff_rxfullclk_ch3,
#if _data_width_ch3 == "16" || _data_width_ch3 == "20" && _ch3_ctc_byp == "BYPASS" 
  ff_rxhalfclk_ch3,
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I" 
  ff_force_disp_ch3,
#endif
#if _protocol == "GIGE" || _protocol == "OBSAI" 
  ff_xmit_ch3,
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
  ff_disp_sel_ch3,
#endif
#if _protocol == "PCIE" || _protocol == "PIPE" 
  ff_pci_ei_en_ch3,
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
  ff_correct_disp_ch3,
#endif
#if _protocol == "PCIE"  
  ff_rxstatus0_ch3, ff_rxstatus1_ch3,
#elif _protocol == "SATA_I" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "XAUI" || _protocol == "GIGE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "OBSAI" || _protocol == "G8B10B" 
  ff_disp_err_ch3, ff_cv_ch3,
#endif
#if _protocol == "PIPE"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  RxStatus0_ch3,
#else
  RxStatus0_ch3,
  RxStatus1_ch3,
#endif
#endif
#if _protocol == "PCIE"  
  ff_rxstatus2_ch3, 
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
  ff_rx_even_ch3,
#endif
  ffc_rrst_ch3,
#if _ch3_elsm == "TRUE"
  ffc_signal_detect_ch3,
  ffc_enable_cgalign_ch3,
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
  ffc_pfifo_clr_ch3,
#endif
#endif
#if _ch3_ird == "TRUE" && _protocol != "PIPE"
  ffc_sb_inv_rx_ch3,
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF" 
  ffc_pcie_ct_ch3,
  ffc_pci_det_en_ch3,
  ffs_pcie_done_ch3,
  ffs_pcie_con_ch3,
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch3_teidle == "TRUE")
  ffc_ei_en_ch3,
#endif
  ffc_lane_tx_rst_ch3,
  ffc_lane_rx_rst_ch3,
  ffc_txpwdnb_ch3,
  ffc_rxpwdnb_ch3,
#if _protocol == "SATA_I"
  ffs_sata_oob_rx_ch3,
#elif _protocol != "PIPE"
  ffs_rlos_lo_ch3,
#endif
#if _protocol != "8BSER"
#if _comma_align == "AUTO"
  ffs_ls_sync_status_ch3,
#endif
#endif
#if _errsports == "TRUE"
  ffs_cc_underrun_ch3,
  ffs_cc_overrun_ch3,
  ffs_txfbfifo_error_ch3,
  ffs_rxfbfifo_error_ch3,
#endif
  ffs_rlol_ch3,
  oob_out_ch3,
#if _protocol == "PIPE"
  TxCompliance_ch3,
  TxElecIdle_ch3,
  RxPolarity_ch3,
  RxValid_ch3,
  RxElecIdle_ch3,
#endif
#endif
#if _sci_ports == "TRUE"
  sciwritedata, sciaddress, scireaddata,
  scienaux, sciselaux, scird, sciwstn, cyawstn,
#if _sci_int_port == "TRUE"
  sciinterrupt,
#endif
#endif
  ffc_macro_rst,
  ffc_quad_rst,
  ffc_trst,
  ff_txfullclk,
  ff_txhalfclk,
#if _pllqclkports == "TRUE"
  ff_txqtrclk,
#endif
#if _refck2core == "TRUE"
  refck2core,
#endif
#if _protocol == "PIPE"
  TxDetectRx_Loopback, 
  PhyStatus,
  PowerDown,
#endif
#if _protocol == "CPRI"
  ff_txser_clk,
#endif
  ffs_plol);

// inputs and outputs

#if _pll_txsrc == "CORE_TXREFCLK"
input         core_txrefclk;
#endif
#if _protocol_mode == "Quad Based Protocol Mode"
#if _pll_rxsrc == "CORE_RXREFCLK"  
input         core_rxrefclk;
#endif  
#if _pll_txsrc == "REFCLK" || _pll_rxsrc == "REFCLK"    
input         refclkp, refclkn;
#endif  
#elif _protocol_mode == "Channel Based Protocol Mode"
#if _ch0_pll_rxsrc == "CORE_RXREFCLK" || _ch1_pll_rxsrc == "CORE_RXREFCLK" || _ch2_pll_rxsrc == "CORE_RXREFCLK" || _ch3_pll_rxsrc == "CORE_RXREFCLK"  
input         core_rxrefclk;
#endif  
#if _pll_txsrc == "REFCLK" || _ch0_pll_rxsrc == "REFCLK" || _ch1_pll_rxsrc == "REFCLK" || _ch2_pll_rxsrc == "REFCLK" || _ch3_pll_rxsrc == "REFCLK"  
input         refclkp, refclkn;
#endif  
#endif  //}
#if _ch0_mode != "DISABLE"
#if _sci_ports == "TRUE"
input         scisel_ch0, scien_ch0;
#endif
input         hdinp0, hdinn0; 
output        hdoutp0, hdoutn0;
input         ff_rxiclk_ch0, ff_txiclk_ch0, ff_ebrd_clk_0; 
#if _pllqclkports == "TRUE"
output        ff_rxqtrclk_ch0;
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10" 
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER"  
input [9:0]   ff_txdata_ch0;
output [9:0]  ff_rxdata_ch0;
#elif _protocol == "USERDEF"
input [11:0]  ff_txdata_ch0;
output [11:0] ff_rxdata_ch0;
#elif _protocol == "PIPE"
input [7:0]   TxData_ch0;
output [7:0]  RxData_ch0;
#else
input [7:0]   ff_txdata_ch0;
output [7:0]  ff_rxdata_ch0;
#endif
#elif _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER"  
input [19:0]  ff_txdata_ch0;
output [19:0] ff_rxdata_ch0;
#elif _protocol == "USERDEF"
input [23:0]  ff_txdata_ch0;
output [23:0] ff_rxdata_ch0;
#elif _protocol == "PIPE"
input [15:0]  TxData_ch0;
output [15:0] RxData_ch0;
#else
input [15:0]  ff_txdata_ch0;
output [15:0] ff_rxdata_ch0;
#endif
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
input         ff_tx_k_cntrl_ch0;
output        ff_rx_k_cntrl_ch0;
#else
input [1:0]   ff_tx_k_cntrl_ch0;
output [1:0]  ff_rx_k_cntrl_ch0;
#endif
#elif _protocol == "XAUI"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
input         ff_txc_ch0;
output        ff_rxc_ch0;
#else
input [1:0]   ff_txc_ch0;
output [1:0]  ff_rxc_ch0;
#endif
#elif _protocol == "PIPE"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
input         TxDataK_ch0;
output        RxDataK_ch0;
#else
input [1:0]   TxDataK_ch0;
output [1:0]  RxDataK_ch0;
#endif
#endif
output        ff_rxfullclk_ch0;
#if _data_width_ch0 == "16" || _data_width_ch0 == "20" && _ch0_ctc_byp == "BYPASS"
output        ff_rxhalfclk_ch0;
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
input         ff_force_disp_ch0;
#else
input [1:0]   ff_force_disp_ch0;
#endif
#endif
#if _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
input         ff_xmit_ch0;
#else
input [1:0]   ff_xmit_ch0;
#endif
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
input         ff_disp_sel_ch0;
#else
input [1:0]   ff_disp_sel_ch0;
#endif
#endif
#if _protocol == "PCIE" || _protocol == "PIPE" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
input         ff_pci_ei_en_ch0;
#else
input [1:0]   ff_pci_ei_en_ch0;
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI"  
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
input         ff_correct_disp_ch0;
#else
input [1:0]   ff_correct_disp_ch0;
#endif
#endif
#if _protocol == "PCIE"  
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
output        ff_rxstatus0_ch0, ff_rxstatus1_ch0;
#else
output [1:0]  ff_rxstatus0_ch0, ff_rxstatus1_ch0;
#endif
#elif _protocol == "SATA_I" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "XAUI" || _protocol == "GIGE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "OBSAI" || _protocol == "G8B10B" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
output        ff_disp_err_ch0, ff_cv_ch0;
#else
output [1:0]  ff_disp_err_ch0, ff_cv_ch0;
#endif
#endif
#if _protocol == "PCIE"  
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
output        ff_rxstatus2_ch0;
#else
output [1:0]  ff_rxstatus2_ch0;
#endif 
#elif _protocol == "GIGE" || _protocol == "OBSAI"  
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
output        ff_rx_even_ch0;
#else
output [1:0]  ff_rx_even_ch0;
#endif
#endif
input         ffc_rrst_ch0;
#if _ch0_elsm == "TRUE"
input         ffc_signal_detect_ch0;
input         ffc_enable_cgalign_ch0;
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
input         ffc_pfifo_clr_ch0;
#endif
#endif
#if _ch0_ird == "TRUE" && _protocol != "PIPE"
input         ffc_sb_inv_rx_ch0;
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
input         ffc_pcie_ct_ch0;
input         ffc_pci_det_en_ch0;
output        ffs_pcie_done_ch0;
output        ffs_pcie_con_ch0;
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch0_teidle == "TRUE")
input         ffc_ei_en_ch0;
#endif
input         ffc_lane_tx_rst_ch0;
input         ffc_lane_rx_rst_ch0;
input         ffc_txpwdnb_ch0;
input         ffc_rxpwdnb_ch0;
#if _protocol == "SATA_I"
output        ffs_sata_oob_rx_ch0;
#elif _protocol != "PIPE"
output        ffs_rlos_lo_ch0;
#endif
#if _protocol != "8BSER"
#if _comma_align == "AUTO"
output        ffs_ls_sync_status_ch0;
#endif
#endif
#if _errsports == "TRUE"
output        ffs_cc_underrun_ch0;
output        ffs_cc_overrun_ch0;
output        ffs_txfbfifo_error_ch0;
output        ffs_rxfbfifo_error_ch0;
#endif
output        ffs_rlol_ch0;
output        oob_out_ch0;
#if _protocol == "PIPE"
input         TxCompliance_ch0;
input         TxElecIdle_ch0;
input         RxPolarity_ch0;
output        RxValid_ch0;
output        RxElecIdle_ch0;
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
output [2:0]  RxStatus0_ch0;
#else
output [2:0]  RxStatus0_ch0;
output [2:0]  RxStatus1_ch0;
#endif
#endif
#endif
#if _ch1_mode != "DISABLE"
#if _sci_ports == "TRUE"
input         scisel_ch1, scien_ch1;
#endif
input         hdinp1, hdinn1; 
output        hdoutp1, hdoutn1;
input         ff_rxiclk_ch1, ff_txiclk_ch1, ff_ebrd_clk_1; 
#if _pllqclkports == "TRUE"
output        ff_rxqtrclk_ch1;
#endif
#if _data_width_ch1 == "8"  || _data_width_ch1 == "10"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER"  
input [9:0]   ff_txdata_ch1;
output [9:0]  ff_rxdata_ch1;
#elif _protocol == "USERDEF"
input [11:0]  ff_txdata_ch1;
output [11:0] ff_rxdata_ch1;
#elif _protocol == "PIPE"
input [7:0]   TxData_ch1;
output [7:0]  RxData_ch1;
#else
input [7:0]   ff_txdata_ch1;
output [7:0]  ff_rxdata_ch1;
#endif
#elif _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER"  
input [19:0]  ff_txdata_ch1;
output [19:0] ff_rxdata_ch1;
#elif _protocol == "USERDEF"
input [23:0]  ff_txdata_ch1;
output [23:0] ff_rxdata_ch1;
#elif _protocol == "PIPE"
input [15:0]  TxData_ch1;
output [15:0] RxData_ch1;
#else
input [15:0]  ff_txdata_ch1;
output [15:0] ff_rxdata_ch1;
#endif
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
input         ff_tx_k_cntrl_ch1;
output        ff_rx_k_cntrl_ch1;
#else
input [1:0]   ff_tx_k_cntrl_ch1;
output [1:0]  ff_rx_k_cntrl_ch1;
#endif
#elif _protocol == "XAUI"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
input         ff_txc_ch1;
output        ff_rxc_ch1;
#else
input [1:0]   ff_txc_ch1;
output [1:0]  ff_rxc_ch1;
#endif
#elif _protocol == "PIPE"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
input         TxDataK_ch1;
output        RxDataK_ch1;
#else
input [1:0]   TxDataK_ch1;
output [1:0]  RxDataK_ch1;
#endif
#endif
output        ff_rxfullclk_ch1;
#if _data_width_ch1 == "16" || _data_width_ch1 == "20" && _ch1_ctc_byp == "BYPASS"
output        ff_rxhalfclk_ch1;
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
input         ff_force_disp_ch1;
#else
input [1:0]   ff_force_disp_ch1;
#endif
#endif
#if _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
input         ff_xmit_ch1;
#else
input [1:0]   ff_xmit_ch1;
#endif
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
input         ff_disp_sel_ch1;
#else
input [1:0]   ff_disp_sel_ch1;
#endif
#endif
#if _protocol == "PCIE" || _protocol == "PIPE" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
input         ff_pci_ei_en_ch1;
#else
input [1:0]   ff_pci_ei_en_ch1;
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
input         ff_correct_disp_ch1;
#else
input [1:0]   ff_correct_disp_ch1;
#endif
#endif
#if _protocol == "PCIE"  
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
output        ff_rxstatus0_ch1, ff_rxstatus1_ch1;
#else
output [1:0]  ff_rxstatus0_ch1, ff_rxstatus1_ch1;
#endif
#elif _protocol == "SATA_I" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "XAUI" || _protocol == "GIGE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "OBSAI" || _protocol == "G8B10B" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
output        ff_disp_err_ch1, ff_cv_ch1;
#else
output [1:0]  ff_disp_err_ch1, ff_cv_ch1;
#endif
#endif
#if _protocol == "PCIE"  
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
output        ff_rxstatus2_ch1;
#else
output [1:0]  ff_rxstatus2_ch1;
#endif 
#elif _protocol == "GIGE" || _protocol == "OBSAI"  
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
output        ff_rx_even_ch1;
#else
output [1:0]  ff_rx_even_ch1;
#endif
#endif
input         ffc_rrst_ch1;
#if _ch1_elsm == "TRUE"
input         ffc_signal_detect_ch1;
input         ffc_enable_cgalign_ch1;
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
input         ffc_pfifo_clr_ch1;
#endif
#endif
#if _ch1_ird == "TRUE" && _protocol != "PIPE"
input         ffc_sb_inv_rx_ch1;
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
input         ffc_pcie_ct_ch1;
input         ffc_pci_det_en_ch1;
output        ffs_pcie_done_ch1;
output        ffs_pcie_con_ch1;
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch1_teidle == "TRUE")
input         ffc_ei_en_ch1;
#endif
input         ffc_lane_tx_rst_ch1;
input         ffc_lane_rx_rst_ch1;
input         ffc_txpwdnb_ch1;
input         ffc_rxpwdnb_ch1;
#if _protocol == "SATA_I"
output        ffs_sata_oob_rx_ch1;
#elif _protocol != "PIPE"
output        ffs_rlos_lo_ch1;
#endif
#if _protocol != "8BSER"
#if _comma_align == "AUTO"
output        ffs_ls_sync_status_ch1;
#endif
#endif
#if _errsports == "TRUE"
output        ffs_cc_underrun_ch1;
output        ffs_cc_overrun_ch1;
output        ffs_txfbfifo_error_ch1;
output        ffs_rxfbfifo_error_ch1;
#endif
output        ffs_rlol_ch1;
output        oob_out_ch1;
#if _protocol == "PIPE"
input         TxCompliance_ch1;
input         TxElecIdle_ch1;
input         RxPolarity_ch1;
output        RxValid_ch1;
output        RxElecIdle_ch1;
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
output [2:0]  RxStatus0_ch1;
#else
output [2:0]  RxStatus0_ch1;
output [2:0]  RxStatus1_ch1;
#endif
#endif
#endif
#if _ch2_mode != "DISABLE"
#if _sci_ports == "TRUE"
input         scisel_ch2, scien_ch2;
#endif
input         hdinp2, hdinn2; 
output        hdoutp2, hdoutn2;
input         ff_rxiclk_ch2, ff_txiclk_ch2, ff_ebrd_clk_2; 
#if _pllqclkports == "TRUE"
output        ff_rxqtrclk_ch2;
#endif
#if _data_width_ch2 == "8"  || _data_width_ch2 == "10"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER"  
input [9:0]   ff_txdata_ch2;
output [9:0]  ff_rxdata_ch2;
#elif _protocol == "USERDEF"
input [11:0]  ff_txdata_ch2;
output [11:0] ff_rxdata_ch2;
#elif _protocol == "PIPE"
input [7:0]   TxData_ch2;
output [7:0]  RxData_ch2;
#else
input [7:0]   ff_txdata_ch2;
output [7:0]  ff_rxdata_ch2;
#endif
#elif _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER"  
input [19:0]  ff_txdata_ch2;
output [19:0] ff_rxdata_ch2;
#elif _protocol == "USERDEF"
input [23:0]  ff_txdata_ch2;
output [23:0] ff_rxdata_ch2;
#elif _protocol == "PIPE"
input [15:0]  TxData_ch2;
output [15:0] RxData_ch2;
#else
input [15:0]  ff_txdata_ch2;
output [15:0] ff_rxdata_ch2;
#endif
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
input         ff_tx_k_cntrl_ch2;
output        ff_rx_k_cntrl_ch2;
#else
input [1:0]   ff_tx_k_cntrl_ch2;
output [1:0]  ff_rx_k_cntrl_ch2;
#endif
#elif _protocol == "XAUI"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
input         ff_txc_ch2;
output        ff_rxc_ch2;
#else
input [1:0]   ff_txc_ch2;
output [1:0]  ff_rxc_ch2;
#endif
#elif _protocol == "PIPE"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
input         TxDataK_ch2;
output        RxDataK_ch2;
#else
input [1:0]   TxDataK_ch2;
output [1:0]  RxDataK_ch2;
#endif
#endif
output        ff_rxfullclk_ch2;
#if _data_width_ch2 == "16" || _data_width_ch2 == "20" && _ch2_ctc_byp == "BYPASS"
output        ff_rxhalfclk_ch2;
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
input         ff_force_disp_ch2;
#else
input [1:0]   ff_force_disp_ch2;
#endif
#endif
#if _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
input         ff_xmit_ch2;
#else
input [1:0]   ff_xmit_ch2;
#endif
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
input         ff_disp_sel_ch2;
#else
input [1:0]   ff_disp_sel_ch2;
#endif
#endif
#if _protocol == "PCIE" || _protocol == "PIPE" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
input         ff_pci_ei_en_ch2;
#else
input [1:0]   ff_pci_ei_en_ch2;
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
input         ff_correct_disp_ch2;
#else
input [1:0]   ff_correct_disp_ch2;
#endif
#endif
#if _protocol == "PCIE"  
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
output        ff_rxstatus0_ch2, ff_rxstatus1_ch2;
#else
output [1:0]  ff_rxstatus0_ch2, ff_rxstatus1_ch2;
#endif
#elif _protocol == "SATA_I" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "XAUI" || _protocol == "GIGE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "OBSAI" || _protocol == "G8B10B" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
output        ff_disp_err_ch2, ff_cv_ch2;
#else
output [1:0]  ff_disp_err_ch2, ff_cv_ch2;
#endif
#endif
#if _protocol == "PCIE"  
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
output        ff_rxstatus2_ch2;
#else
output [1:0]  ff_rxstatus2_ch2;
#endif 
#elif _protocol == "GIGE" || _protocol == "OBSAI"  
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
output        ff_rx_even_ch2;
#else
output [1:0]  ff_rx_even_ch2;
#endif
#endif
input         ffc_rrst_ch2;
#if _ch2_elsm == "TRUE"
input         ffc_signal_detect_ch2;
input         ffc_enable_cgalign_ch2;
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
input         ffc_pfifo_clr_ch2;
#endif
#endif
#if _ch2_ird == "TRUE" && _protocol != "PIPE"
input         ffc_sb_inv_rx_ch2;
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
input         ffc_pcie_ct_ch2;
input         ffc_pci_det_en_ch2;
output        ffs_pcie_done_ch2;
output        ffs_pcie_con_ch2;
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch2_teidle == "TRUE")
input         ffc_ei_en_ch2;
#endif
input         ffc_lane_tx_rst_ch2;
input         ffc_lane_rx_rst_ch2;
input         ffc_txpwdnb_ch2;
input         ffc_rxpwdnb_ch2;
#if _protocol == "SATA_I"
output        ffs_sata_oob_rx_ch2;
#elif _protocol != "PIPE"
output        ffs_rlos_lo_ch2;
#endif
#if _protocol != "8BSER"
#if _comma_align == "AUTO"
output        ffs_ls_sync_status_ch2;
#endif
#endif
#if _errsports == "TRUE"
output        ffs_cc_underrun_ch2;
output        ffs_cc_overrun_ch2;
output        ffs_txfbfifo_error_ch2;
output        ffs_rxfbfifo_error_ch2;
#endif
output        ffs_rlol_ch2;
output        oob_out_ch2;
#if _protocol == "PIPE"
input         TxCompliance_ch2;
input         TxElecIdle_ch2;
input         RxPolarity_ch2;
output        RxValid_ch2;
output        RxElecIdle_ch2;
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
output [2:0]  RxStatus0_ch2;
#else
output [2:0]  RxStatus0_ch2;
output [2:0]  RxStatus1_ch2;
#endif
#endif
#endif
#if _ch3_mode != "DISABLE"
#if _sci_ports == "TRUE"
input         scisel_ch3, scien_ch3;
#endif
input         hdinp3, hdinn3; 
output        hdoutp3, hdoutn3;
input         ff_rxiclk_ch3, ff_txiclk_ch3, ff_ebrd_clk_3; 
#if _pllqclkports == "TRUE"
output        ff_rxqtrclk_ch3;
#endif
#if _data_width_ch3 == "8"  || _data_width_ch3 == "10"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER"  
input [9:0]   ff_txdata_ch3;
output [9:0]  ff_rxdata_ch3;
#elif _protocol == "USERDEF"
input [11:0]  ff_txdata_ch3;
output [11:0] ff_rxdata_ch3;
#elif _protocol == "PIPE"
input [7:0]   TxData_ch3;
output [7:0]  RxData_ch3;
#else
input [7:0]   ff_txdata_ch3;
output [7:0]  ff_rxdata_ch3;
#endif
#elif _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER"  
input [19:0]  ff_txdata_ch3;
output [19:0] ff_rxdata_ch3;
#elif _protocol == "USERDEF"
input [23:0]  ff_txdata_ch3;
output [23:0] ff_rxdata_ch3;
#elif _protocol == "PIPE"
input [15:0]  TxData_ch3;
output [15:0] RxData_ch3;
#else
input [15:0]  ff_txdata_ch3;
output [15:0] ff_rxdata_ch3;
#endif
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
input         ff_tx_k_cntrl_ch3;
output        ff_rx_k_cntrl_ch3;
#else
input [1:0]   ff_tx_k_cntrl_ch3;
output [1:0]  ff_rx_k_cntrl_ch3;
#endif
#elif _protocol == "XAUI"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
input         ff_txc_ch3;
output        ff_rxc_ch3;
#else
input [1:0]   ff_txc_ch3;
output [1:0]  ff_rxc_ch3;
#endif
#elif _protocol == "PIPE"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
input         TxDataK_ch3;
output        RxDataK_ch3;
#else
input [1:0]   TxDataK_ch3;
output [1:0]  RxDataK_ch3;
#endif
#endif
output        ff_rxfullclk_ch3;
#if _data_width_ch3 == "16" || _data_width_ch3 == "20" && _ch3_ctc_byp == "BYPASS"
output        ff_rxhalfclk_ch3;
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
input         ff_force_disp_ch3;
#else
input [1:0]   ff_force_disp_ch3;
#endif
#endif
#if _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
input         ff_xmit_ch3;
#else
input [1:0]   ff_xmit_ch3;
#endif
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
input         ff_disp_sel_ch3;
#else
input [1:0]   ff_disp_sel_ch3;
#endif
#endif
#if _protocol == "PCIE" || _protocol == "PIPE" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
input         ff_pci_ei_en_ch3;
#else
input [1:0]   ff_pci_ei_en_ch3;
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
input         ff_correct_disp_ch3;
#else
input [1:0]   ff_correct_disp_ch3;
#endif
#endif
#if _protocol == "PCIE"  
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
output        ff_rxstatus0_ch3, ff_rxstatus1_ch3;
#else
output [1:0]  ff_rxstatus0_ch3, ff_rxstatus1_ch3;
#endif
#elif _protocol == "SATA_I" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "XAUI" || _protocol == "GIGE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "OBSAI" || _protocol == "G8B10B" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
output        ff_disp_err_ch3, ff_cv_ch3;
#else
output [1:0]  ff_disp_err_ch3, ff_cv_ch3;
#endif
#endif
#if _protocol == "PCIE"  
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
output        ff_rxstatus2_ch3;
#else
output [1:0]  ff_rxstatus2_ch3;
#endif 
#elif _protocol == "GIGE" || _protocol == "OBSAI"  
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
output        ff_rx_even_ch3;
#else
output [1:0]  ff_rx_even_ch3;
#endif
#endif
input         ffc_rrst_ch3;
#if _ch3_elsm == "TRUE"
input         ffc_signal_detect_ch3;
input         ffc_enable_cgalign_ch3;
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
input         ffc_pfifo_clr_ch3;
#endif
#endif
#if _ch3_ird == "TRUE" && _protocol != "PIPE"
input         ffc_sb_inv_rx_ch3;
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
input         ffc_pcie_ct_ch3;
input         ffc_pci_det_en_ch3;
output        ffs_pcie_done_ch3;
output        ffs_pcie_con_ch3;
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch3_teidle == "TRUE")
input         ffc_ei_en_ch3;
#endif
input         ffc_lane_tx_rst_ch3;
input         ffc_lane_rx_rst_ch3;
input         ffc_txpwdnb_ch3;
input         ffc_rxpwdnb_ch3;
#if _protocol == "SATA_I"
output        ffs_sata_oob_rx_ch3;
#elif _protocol != "PIPE"
output        ffs_rlos_lo_ch3;
#endif
#if _protocol != "8BSER"
#if _comma_align == "AUTO"
output        ffs_ls_sync_status_ch3;
#endif
#endif
#if _errsports == "TRUE"
output        ffs_cc_underrun_ch3;
output        ffs_cc_overrun_ch3;
output        ffs_txfbfifo_error_ch3;
output        ffs_rxfbfifo_error_ch3;
#endif
output        ffs_rlol_ch3;
output        oob_out_ch3;
#if _protocol == "PIPE"
input         TxCompliance_ch3;
input         TxElecIdle_ch3;
input         RxPolarity_ch3;
output        RxValid_ch3;
output        RxElecIdle_ch3;
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
output [2:0]  RxStatus0_ch3;
#else
output [2:0]  RxStatus0_ch3;
output [2:0]  RxStatus1_ch3;
#endif
#endif
#endif
#if _sci_ports == "TRUE"
input [7:0]   sciwritedata;
input [5:0]   sciaddress;
output [7:0]  scireaddata;
input         scienaux;
input         sciselaux;
input         scird;
input         sciwstn;
input         cyawstn;
#if _sci_int_port == "TRUE"
output        sciinterrupt;
#endif
#endif
input         ffc_macro_rst;
input         ffc_quad_rst;
input         ffc_trst;
output        ff_txfullclk;
output        ff_txhalfclk;
#if _pllqclkports == "TRUE"
output        ff_txqtrclk;
#endif
#if _refck2core == "TRUE"
output        refck2core;
#endif
output        ffs_plol;
#if _protocol == "PIPE"
input         TxDetectRx_Loopback;
output        PhyStatus;
input [1:0]   PowerDown;
#endif
#if _protocol == "CPRI"
output        ff_txser_clk;
#endif

#if _protocol == "CPRI"
wire [18:0]   cout;
#else
wire [19:0]   cout;
#endif
wire  fpsc_vlo;

   VLO fpsc_vlo_inst (.Z(fpsc_vlo));

// pcs_quad instance
//synopsys translate_off
  parameter USER_CONFIG_FILE = #_circuit_name_new;
  defparam pcsc_inst.CONFIG_FILE = USER_CONFIG_FILE;

integer file, r;

initial
begin
    file = $fopen(USER_CONFIG_FILE, "r");
    if (file == `NULL)
       $display ("ERROR : Auto configuration file for PCSC module not found.  PCSC internal configuration registers will not be initialized correctly during simulation!");
end
//synopsys translate_on

PCSC pcsc_inst (
#if _pll_txsrc == "CORE_TXREFCLK"
 .FFC_CK_CORE_TX(core_txrefclk),
#else
 .FFC_CK_CORE_TX(fpsc_vlo),
#endif
#if _protocol_mode == "Quad Based Protocol Mode"
#if _pll_rxsrc == "CORE_RXREFCLK"
 .FFC_CK_CORE_RX(core_rxrefclk),
#else
 .FFC_CK_CORE_RX(fpsc_vlo),
#endif
#if _pll_txsrc == "REFCLK" || _pll_rxsrc == "REFCLK"
 .REFCLKP(refclkp),
 .REFCLKN(refclkn),
#else
 .REFCLKP(fpsc_vlo),
 .REFCLKN(fpsc_vlo),
#endif
#elif _protocol_mode == "Channel Based Protocol Mode"
#if _ch0_pll_rxsrc == "CORE_RXREFCLK" || _ch1_pll_rxsrc == "CORE_RXREFCLK" || _ch2_pll_rxsrc == "CORE_RXREFCLK" || _ch3_pll_rxsrc == "CORE_RXREFCLK"
 .FFC_CK_CORE_RX(core_rxrefclk),
#else
 .FFC_CK_CORE_RX(fpsc_vlo),
#endif
#if _pll_txsrc == "REFCLK" || _ch0_pll_rxsrc == "REFCLK" || _ch1_pll_rxsrc == "REFCLK" || _ch2_pll_rxsrc == "REFCLK" || _ch3_pll_rxsrc == "REFCLK"
 .REFCLKP(refclkp),
 .REFCLKN(refclkn),
#else
 .REFCLKP(fpsc_vlo),
 .REFCLKN(fpsc_vlo),
#endif
#endif
//CH0
#if _ch0_mode == "DISABLE" 
 .HDINP0(fpsc_vlo),
 .HDINN0(fpsc_vlo),
 .HDOUTP0(),
 .HDOUTN0(),
 .SCISELCH0(fpsc_vlo),
 .SCIENCH0(fpsc_vlo),
 .FF_RXI_CLK_0(fpsc_vlo),
 .FF_TXI_CLK_0(fpsc_vlo),
 .FF_EBRD_CLK_0(fpsc_vlo),
 .FF_RX_F_CLK_0(),
 .FF_RX_H_CLK_0(),
 .FF_RX_Q_CLK_0(),
 .FF_TX_D_0_0(fpsc_vlo),
 .FF_TX_D_0_1(fpsc_vlo),
 .FF_TX_D_0_2(fpsc_vlo),
 .FF_TX_D_0_3(fpsc_vlo),
 .FF_TX_D_0_4(fpsc_vlo),
 .FF_TX_D_0_5(fpsc_vlo),
 .FF_TX_D_0_6(fpsc_vlo),
 .FF_TX_D_0_7(fpsc_vlo),
 .FF_TX_D_0_8(fpsc_vlo),
 .FF_TX_D_0_9(fpsc_vlo),
 .FF_TX_D_0_10(fpsc_vlo),
 .FF_TX_D_0_11(fpsc_vlo),
 .FF_TX_D_0_12(fpsc_vlo),
 .FF_TX_D_0_13(fpsc_vlo),
 .FF_TX_D_0_14(fpsc_vlo),
 .FF_TX_D_0_15(fpsc_vlo),
 .FF_TX_D_0_16(fpsc_vlo),
 .FF_TX_D_0_17(fpsc_vlo),
 .FF_TX_D_0_18(fpsc_vlo),
 .FF_TX_D_0_19(fpsc_vlo),
 .FF_TX_D_0_20(fpsc_vlo),
 .FF_TX_D_0_21(fpsc_vlo),
 .FF_TX_D_0_22(fpsc_vlo),
 .FF_TX_D_0_23(fpsc_vlo),
 .FF_RX_D_0_0(),
 .FF_RX_D_0_1(),
 .FF_RX_D_0_2(),
 .FF_RX_D_0_3(),
 .FF_RX_D_0_4(),
 .FF_RX_D_0_5(),
 .FF_RX_D_0_6(),
 .FF_RX_D_0_7(),
 .FF_RX_D_0_8(),
 .FF_RX_D_0_9(),
 .FF_RX_D_0_10(),
 .FF_RX_D_0_11(),
 .FF_RX_D_0_12(),
 .FF_RX_D_0_13(),
 .FF_RX_D_0_14(),
 .FF_RX_D_0_15(),
 .FF_RX_D_0_16(),
 .FF_RX_D_0_17(),
 .FF_RX_D_0_18(),
 .FF_RX_D_0_19(),
 .FF_RX_D_0_20(),
 .FF_RX_D_0_21(),
 .FF_RX_D_0_22(),
 .FF_RX_D_0_23(),
 .FFC_RRST_0(fpsc_vlo),
 .FFC_SIGNAL_DETECT_0(fpsc_vlo),
 .FFC_SB_PFIFO_LP_0(fpsc_vlo),
 .FFC_SB_INV_RX_0(fpsc_vlo),
 .FFC_PFIFO_CLR_0(fpsc_vlo),
 .FFC_PCIE_CT_0(fpsc_vlo),
 .FFC_PCI_DET_EN_0(fpsc_vlo),
 .FFC_FB_LOOPBACK_0(fpsc_vlo),
 .FFC_ENABLE_CGALIGN_0(fpsc_vlo),
 .FFC_EI_EN_0(fpsc_vlo),
 .FFC_LANE_TX_RST_0(fpsc_vlo),
 .FFC_LANE_RX_RST_0(fpsc_vlo),
 .FFC_TXPWDNB_0(fpsc_vlo),
 .FFC_RXPWDNB_0(fpsc_vlo),
 .FFS_RLOS_LO_0(),
 .FFS_PCIE_DONE_0(),
 .FFS_PCIE_CON_0(),
 .FFS_LS_SYNC_STATUS_0(),
 .FFS_CC_UNDERRUN_0(),
 .FFS_CC_OVERRUN_0(),
 .FFS_RLOL_0(),
 .FFS_RXFBFIFO_ERROR_0(),
 .FFS_TXFBFIFO_ERROR_0(),
 .OOB_OUT_0(),
#else
 .HDINP0(hdinp0),
 .HDINN0(hdinn0),
 .HDOUTP0(hdoutp0),
 .HDOUTN0(hdoutn0),
#if _sci_ports == "TRUE"
 .SCISELCH0(scisel_ch0),
 .SCIENCH0(scien_ch0),
#else
 .SCISELCH0(fpsc_vlo),
 .SCIENCH0(fpsc_vlo),
#endif
 .FF_RXI_CLK_0(ff_rxiclk_ch0),
 .FF_TXI_CLK_0(ff_txiclk_ch0),
 .FF_EBRD_CLK_0(ff_ebrd_clk_0),
 .FF_RX_F_CLK_0(ff_rxfullclk_ch0),
#if _data_width_ch0 == "8" || _data_width_ch0 == "10" && _ch0_ctc_byp == "BYPASS"
 .FF_RX_H_CLK_0(),
#elif _data_width_ch0 == "16" || _data_width_ch0 == "20" && _ch0_ctc_byp == "BYPASS"
 .FF_RX_H_CLK_0(ff_rxhalfclk_ch0),
#endif
#if _pllqclkports == "TRUE"
 .FF_RX_Q_CLK_0(ff_rxqtrclk_ch0),
#else
 .FF_RX_Q_CLK_0(),
#endif
#if _protocol == "PIPE"
 .FF_TX_D_0_0(TxData_ch0[0]),
 .FF_TX_D_0_1(TxData_ch0[1]),
 .FF_TX_D_0_2(TxData_ch0[2]),
 .FF_TX_D_0_3(TxData_ch0[3]),
 .FF_TX_D_0_4(TxData_ch0[4]),
 .FF_TX_D_0_5(TxData_ch0[5]),
 .FF_TX_D_0_6(TxData_ch0[6]),
 .FF_TX_D_0_7(TxData_ch0[7]),
#else
 .FF_TX_D_0_0(ff_txdata_ch0[0]),
 .FF_TX_D_0_1(ff_txdata_ch0[1]),
 .FF_TX_D_0_2(ff_txdata_ch0[2]),
 .FF_TX_D_0_3(ff_txdata_ch0[3]),
 .FF_TX_D_0_4(ff_txdata_ch0[4]),
 .FF_TX_D_0_5(ff_txdata_ch0[5]),
 .FF_TX_D_0_6(ff_txdata_ch0[6]),
 .FF_TX_D_0_7(ff_txdata_ch0[7]),
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_TX_D_0_8(ff_tx_k_cntrl_ch0),
#else
 .FF_TX_D_0_8(ff_tx_k_cntrl_ch0[0]),
#endif
#elif _protocol == "XAUI"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_TX_D_0_8(ff_txc_ch0),
#else
 .FF_TX_D_0_8(ff_txc_ch0[0]),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_TX_D_0_8(TxDataK_ch0),
#else
 .FF_TX_D_0_8(TxDataK_ch0[0]),
#endif
#elif _protocol == "8BSER"
 .FF_TX_D_0_8(fpsc_vlo),
#else
 .FF_TX_D_0_8(ff_txdata_ch0[8]),
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_TX_D_0_9(ff_force_disp_ch0),
#else
 .FF_TX_D_0_9(ff_force_disp_ch0[0]),
#endif
#elif _protocol == "10BSER" || _protocol == "USERDEF" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" 
 .FF_TX_D_0_9(ff_txdata_ch0[9]),
#else
 .FF_TX_D_0_9(fpsc_vlo),
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_TX_D_0_10(ff_disp_sel_ch0),
#else
 .FF_TX_D_0_10(ff_disp_sel_ch0[0]),
#endif
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_TX_D_0_10(ff_xmit_ch0),
#else
 .FF_TX_D_0_10(ff_xmit_ch0[0]),
#endif
#elif _protocol == "USERDEF"
 .FF_TX_D_0_10(ff_txdata_ch0[10]),
#else
 .FF_TX_D_0_10(fpsc_vlo),
#endif
#if _protocol == "PCIE" || _protocol == "PIPE"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_TX_D_0_11(ff_pci_ei_en_ch0),
#else
 .FF_TX_D_0_11(ff_pci_ei_en_ch0[0]),
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_TX_D_0_11(ff_correct_disp_ch0),
#else
 .FF_TX_D_0_11(ff_correct_disp_ch0[0]),
#endif
#elif _protocol == "USERDEF"
 .FF_TX_D_0_11(ff_txdata_ch0[11]),
#else
 .FF_TX_D_0_11(fpsc_vlo),
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_0_12(ff_txdata_ch0[12]),
#elif _protocol == "PIPE"
 .FF_TX_D_0_12(TxData_ch0[8]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_0_12(ff_txdata_ch0[10]),
#else
 .FF_TX_D_0_12(ff_txdata_ch0[8]),
#endif
#else
 .FF_TX_D_0_12(fpsc_vlo),
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_0_13(ff_txdata_ch0[13]),
#elif _protocol == "PIPE"
 .FF_TX_D_0_13(TxData_ch0[9]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_0_13(ff_txdata_ch0[11]),
#else
 .FF_TX_D_0_13(ff_txdata_ch0[9]),
#endif
#else
 .FF_TX_D_0_13(fpsc_vlo),
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_0_14(ff_txdata_ch0[14]),
#elif _protocol == "PIPE"
 .FF_TX_D_0_14(TxData_ch0[10]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_0_14(ff_txdata_ch0[12]),
#else
 .FF_TX_D_0_14(ff_txdata_ch0[10]),
#endif
#else
 .FF_TX_D_0_14(fpsc_vlo),
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_0_15(ff_txdata_ch0[15]),
#elif _protocol == "PIPE"
 .FF_TX_D_0_15(TxData_ch0[11]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_0_15(ff_txdata_ch0[13]),
#else
 .FF_TX_D_0_15(ff_txdata_ch0[11]),
#endif
#else
 .FF_TX_D_0_15(fpsc_vlo),
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_0_16(ff_txdata_ch0[16]),
#elif _protocol == "PIPE"
 .FF_TX_D_0_16(TxData_ch0[12]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_0_16(ff_txdata_ch0[14]),
#else
 .FF_TX_D_0_16(ff_txdata_ch0[12]),
#endif
#else
 .FF_TX_D_0_16(fpsc_vlo),
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_0_17(ff_txdata_ch0[17]),
#elif _protocol == "PIPE"
 .FF_TX_D_0_17(TxData_ch0[13]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_0_17(ff_txdata_ch0[15]),
#else
 .FF_TX_D_0_17(ff_txdata_ch0[13]),
#endif
#else
 .FF_TX_D_0_17(fpsc_vlo),
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_0_18(ff_txdata_ch0[18]),
#elif _protocol == "PIPE"
 .FF_TX_D_0_18(TxData_ch0[14]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_0_18(ff_txdata_ch0[16]),
#else
 .FF_TX_D_0_18(ff_txdata_ch0[14]),
#endif
#else
 .FF_TX_D_0_18(fpsc_vlo),
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_0_19(ff_txdata_ch0[19]),
#elif _protocol == "PIPE"
 .FF_TX_D_0_19(TxData_ch0[15]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_0_19(ff_txdata_ch0[17]),
#else
 .FF_TX_D_0_19(ff_txdata_ch0[15]),
#endif
#else
 .FF_TX_D_0_19(fpsc_vlo),
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_0_20(ff_txdata_ch0[20]),
#elif _protocol == "XAUI"
 .FF_TX_D_0_20(ff_txc_ch0[1]),
#elif _protocol == "PIPE"
 .FF_TX_D_0_20(TxDataK_ch0[1]),
#elif _protocol == "8BSER"
 .FF_TX_D_0_20(fpsc_vlo),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_TX_D_0_20(ff_txdata_ch0[18]),
#else
 .FF_TX_D_0_20(ff_tx_k_cntrl_ch0[1]),
#endif
#else
 .FF_TX_D_0_20(fpsc_vlo),
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_0_21(ff_txdata_ch0[21]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_TX_D_0_21(ff_txdata_ch0[19]),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
 .FF_TX_D_0_21(ff_force_disp_ch0[1]),
#else
 .FF_TX_D_0_21(fpsc_vlo),
#endif
#else
 .FF_TX_D_0_21(fpsc_vlo),
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_0_22(ff_txdata_ch0[22]),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
 .FF_TX_D_0_22(ff_xmit_ch0[1]),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
 .FF_TX_D_0_22(ff_disp_sel_ch0[1]),
#else
 .FF_TX_D_0_22(fpsc_vlo),
#endif
#else
 .FF_TX_D_0_22(fpsc_vlo),
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_0_23(ff_txdata_ch0[23]),
#elif _protocol == "PCIE" || _protocol == "PIPE"
 .FF_TX_D_0_23(ff_pci_ei_en_ch0[1]),
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
 .FF_TX_D_0_23(ff_correct_disp_ch0[1]),
#else
 .FF_TX_D_0_23(fpsc_vlo),
#endif
#else
 .FF_TX_D_0_23(fpsc_vlo),
#endif
#if _protocol == "PIPE"
 .FF_RX_D_0_0(RxData_ch0[0]),
 .FF_RX_D_0_1(RxData_ch0[1]),
 .FF_RX_D_0_2(RxData_ch0[2]),
 .FF_RX_D_0_3(RxData_ch0[3]),
 .FF_RX_D_0_4(RxData_ch0[4]),
 .FF_RX_D_0_5(RxData_ch0[5]),
 .FF_RX_D_0_6(RxData_ch0[6]),
 .FF_RX_D_0_7(RxData_ch0[7]),
#else 
 .FF_RX_D_0_0(ff_rxdata_ch0[0]),
 .FF_RX_D_0_1(ff_rxdata_ch0[1]),
 .FF_RX_D_0_2(ff_rxdata_ch0[2]),
 .FF_RX_D_0_3(ff_rxdata_ch0[3]),
 .FF_RX_D_0_4(ff_rxdata_ch0[4]),
 .FF_RX_D_0_5(ff_rxdata_ch0[5]),
 .FF_RX_D_0_6(ff_rxdata_ch0[6]),
 .FF_RX_D_0_7(ff_rxdata_ch0[7]),
#endif
#if _protocol == "XAUI"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_8(ff_rxc_ch0),
#else
 .FF_RX_D_0_8(ff_rxc_ch0[0]),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_8(RxDataK_ch0),
#else
 .FF_RX_D_0_8(RxDataK_ch0[0]),
#endif
#elif _protocol == "8BSER"
 .FF_RX_D_0_8(),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
 .FF_RX_D_0_8(ff_rxdata_ch0[8]),
#else
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_8(ff_rx_k_cntrl_ch0),
#else
 .FF_RX_D_0_8(ff_rx_k_cntrl_ch0[0]),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_9(ff_rxstatus0_ch0),
#else
 .FF_RX_D_0_9(ff_rxstatus0_ch0[0]),
#endif
#elif _protocol == "PIPE"
 .FF_RX_D_0_9(RxStatus0_ch0[0]),
#elif _protocol == "8BSER" 
 .FF_RX_D_0_9(),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
 .FF_RX_D_0_9(ff_rxdata_ch0[9]),
#else
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_9(ff_disp_err_ch0),
#else
 .FF_RX_D_0_9(ff_disp_err_ch0[0]),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_10(ff_rxstatus1_ch0),
#else
 .FF_RX_D_0_10(ff_rxstatus1_ch0[0]),
#endif
#elif _protocol == "PIPE"
 .FF_RX_D_0_10(RxStatus0_ch0[1]),
#elif _protocol == "USERDEF"
 .FF_RX_D_0_10(ff_rxdata_ch0[10]),
#elif _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_0_10(),
#else
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_10(ff_cv_ch0),
#else
 .FF_RX_D_0_10(ff_cv_ch0[0]),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_11(ff_rxstatus2_ch0),
#else
 .FF_RX_D_0_11(ff_rxstatus2_ch0[0]),
#endif
#elif _protocol == "PIPE"
 .FF_RX_D_0_11(RxStatus0_ch0[2]),
#elif _protocol == "USERDEF"
 .FF_RX_D_0_11(ff_rxdata_ch0[11]),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_11(ff_rx_even_ch0),
#else
 .FF_RX_D_0_11(ff_rx_even_ch0[0]),
#endif
#else
 .FF_RX_D_0_11(),
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_12(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_0_12(ff_rxdata_ch0[10]),
#elif _protocol == "USERDEF"
 .FF_RX_D_0_12(ff_rxdata_ch0[12]),
#elif _protocol == "PIPE"
 .FF_RX_D_0_12(RxData_ch0[8]),
#else
 .FF_RX_D_0_12(ff_rxdata_ch0[8]),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_13(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_0_13(ff_rxdata_ch0[11]),
#elif _protocol == "USERDEF"
 .FF_RX_D_0_13(ff_rxdata_ch0[13]),
#elif _protocol == "PIPE"
 .FF_RX_D_0_13(RxData_ch0[9]),
#else
 .FF_RX_D_0_13(ff_rxdata_ch0[9]),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_14(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_0_14(ff_rxdata_ch0[12]),
#elif _protocol == "USERDEF"
 .FF_RX_D_0_14(ff_rxdata_ch0[14]),
#elif _protocol == "PIPE"
 .FF_RX_D_0_14(RxData_ch0[10]),
#else
 .FF_RX_D_0_14(ff_rxdata_ch0[10]),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_15(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_0_15(ff_rxdata_ch0[13]),
#elif _protocol == "USERDEF"
 .FF_RX_D_0_15(ff_rxdata_ch0[15]),
#elif _protocol == "PIPE"
 .FF_RX_D_0_15(RxData_ch0[11]),
#else
 .FF_RX_D_0_15(ff_rxdata_ch0[11]),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_16(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_0_16(ff_rxdata_ch0[14]),
#elif _protocol == "USERDEF"
 .FF_RX_D_0_16(ff_rxdata_ch0[16]),
#elif _protocol == "PIPE"
 .FF_RX_D_0_16(RxData_ch0[12]),
#else
 .FF_RX_D_0_16(ff_rxdata_ch0[12]),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_17(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_0_17(ff_rxdata_ch0[15]),
#elif _protocol == "USERDEF"
 .FF_RX_D_0_17(ff_rxdata_ch0[17]),
#elif _protocol == "PIPE"
 .FF_RX_D_0_17(RxData_ch0[13]),
#else
 .FF_RX_D_0_17(ff_rxdata_ch0[13]),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_18(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_0_18(ff_rxdata_ch0[16]),
#elif _protocol == "USERDEF"
 .FF_RX_D_0_18(ff_rxdata_ch0[18]),
#elif _protocol == "PIPE"
 .FF_RX_D_0_18(RxData_ch0[14]),
#else
 .FF_RX_D_0_18(ff_rxdata_ch0[14]),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_19(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_0_19(ff_rxdata_ch0[17]),
#elif _protocol == "USERDEF"
 .FF_RX_D_0_19(ff_rxdata_ch0[19]),
#elif _protocol == "PIPE"
 .FF_RX_D_0_19(RxData_ch0[15]),
#else
 .FF_RX_D_0_19(ff_rxdata_ch0[15]),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_20(),
#else
#if _protocol == "8BSER"
 .FF_RX_D_0_20(),
#elif _protocol == "USERDEF"
 .FF_RX_D_0_20(ff_rxdata_ch0[20]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_0_20(ff_rxdata_ch0[18]),
#elif _protocol == "XAUI"
 .FF_RX_D_0_20(ff_rxc_ch0[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_0_20(RxDataK_ch0[1]),
#else
 .FF_RX_D_0_20(ff_rx_k_cntrl_ch0[1]),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_21(),
#else
#if _protocol == "8BSER" 
 .FF_RX_D_0_21(),
#elif _protocol == "USERDEF"
 .FF_RX_D_0_21(ff_rxdata_ch0[21]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_0_21(ff_rxdata_ch0[19]),
#elif _protocol == "PCIE" 
 .FF_RX_D_0_21(ff_rxstatus0_ch0[1]),
#elif _protocol == "PIPE" 
 .FF_RX_D_0_21(RxStatus1_ch0[0]),
#else
 .FF_RX_D_0_21(ff_disp_err_ch0[1]),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_22(),
#else
#if _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_0_22(),
#elif _protocol == "USERDEF"
 .FF_RX_D_0_22(ff_rxdata_ch0[22]),
#elif _protocol == "PCIE" 
 .FF_RX_D_0_22(ff_rxstatus1_ch0[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_0_22(RxStatus1_ch0[1]),
#else
 .FF_RX_D_0_22(ff_cv_ch0[1]),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
 .FF_RX_D_0_23(),
#else
#if _protocol == "GIGE" || _protocol == "OBSAI" 
 .FF_RX_D_0_23(ff_rx_even_ch0[1]),
#elif _protocol == "USERDEF"
 .FF_RX_D_0_23(ff_rxdata_ch0[23]),
#elif _protocol == "PCIE" 
 .FF_RX_D_0_23(ff_rxstatus2_ch0[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_0_23(RxStatus1_ch0[2]),
#else
 .FF_RX_D_0_23(),
#endif
#endif
 .FFC_RRST_0(ffc_rrst_ch0),
#if _ch0_elsm == "TRUE"
 .FFC_SIGNAL_DETECT_0(ffc_signal_detect_ch0),
 .FFC_ENABLE_CGALIGN_0(ffc_enable_cgalign_ch0),
#else
 .FFC_SIGNAL_DETECT_0(fpsc_vlo),
 .FFC_ENABLE_CGALIGN_0(fpsc_vlo),
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
 .FFC_SB_PFIFO_LP_0(fpsc_vlo),
 .FFC_PFIFO_CLR_0(ffc_pfifo_clr_ch0),
 .FFC_FB_LOOPBACK_0(fpsc_vlo),
#elif _lbtype == "PCS Parallel Loopback"
 .FFC_SB_PFIFO_LP_0(fpsc_vlo),
 .FFC_PFIFO_CLR_0(fpsc_vlo),
#if _protocol != "PIPE"
 .FFC_FB_LOOPBACK_0(fpsc_vlo),
#else
 .FFC_FB_LOOPBACK_0(fpsc_vlo),
#endif
#else
 .FFC_SB_PFIFO_LP_0(fpsc_vlo),
 .FFC_PFIFO_CLR_0(fpsc_vlo),
 .FFC_FB_LOOPBACK_0(fpsc_vlo),
#endif
#else
 .FFC_SB_PFIFO_LP_0(fpsc_vlo),
 .FFC_PFIFO_CLR_0(fpsc_vlo),
 .FFC_FB_LOOPBACK_0(fpsc_vlo),
#endif
#if _ch0_ird == "TRUE"
#if _protocol == "PIPE"
 .FFC_SB_INV_RX_0(),
#else
 .FFC_SB_INV_RX_0(ffc_sb_inv_rx_ch0),
#endif
#else
 .FFC_SB_INV_RX_0(fpsc_vlo),
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
 .FFC_PCIE_CT_0(ffc_pcie_ct_ch0),
 .FFC_PCI_DET_EN_0(ffc_pci_det_en_ch0),
 .FFS_PCIE_DONE_0(ffs_pcie_done_ch0),
 .FFS_PCIE_CON_0(ffs_pcie_con_ch0),
#elif _protocol == "PIPE"
 .FFC_PCIE_CT_0(),
 .FFC_PCI_DET_EN_0(),
 .FFS_PCIE_DONE_0(),
 .FFS_PCIE_CON_0(),
#else
 .FFC_PCIE_CT_0(fpsc_vlo),
 .FFC_PCI_DET_EN_0(fpsc_vlo),
 .FFS_PCIE_DONE_0(),
 .FFS_PCIE_CON_0(),
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch0_teidle == "TRUE")
 .FFC_EI_EN_0(ffc_ei_en_ch0),
#else
 .FFC_EI_EN_0(fpsc_vlo),
#endif
 .FFC_LANE_TX_RST_0(ffc_lane_tx_rst_ch0),
 .FFC_LANE_RX_RST_0(ffc_lane_rx_rst_ch0),
 .FFC_TXPWDNB_0(ffc_txpwdnb_ch0),
 .FFC_RXPWDNB_0(ffc_rxpwdnb_ch0),
#if _protocol == "PIPE"
 .FFS_RLOS_LO_0(),
#elif _protocol == "SATA_I"
 .FFS_RLOS_LO_0(ffs_sata_oob_rx_ch0),
#else
 .FFS_RLOS_LO_0(ffs_rlos_lo_ch0),
#endif
#if _protocol == "8BSER"
 .FFS_LS_SYNC_STATUS_0(),
#else
#if _comma_align == "AUTO"
 .FFS_LS_SYNC_STATUS_0(ffs_ls_sync_status_ch0),
#else
 .FFS_LS_SYNC_STATUS_0(),
#endif
#endif
#if _errsports == "TRUE"
 .FFS_CC_UNDERRUN_0(ffs_cc_underrun_ch0),
 .FFS_CC_OVERRUN_0(ffs_cc_overrun_ch0),
 .FFS_RXFBFIFO_ERROR_0(ffs_rxfbfifo_error_ch0),
 .FFS_TXFBFIFO_ERROR_0(ffs_txfbfifo_error_ch0),
#else
 .FFS_CC_UNDERRUN_0(),
 .FFS_CC_OVERRUN_0(),
 .FFS_RXFBFIFO_ERROR_0(),
 .FFS_TXFBFIFO_ERROR_0(),
#endif
 .FFS_RLOL_0(ffs_rlol_ch0),
 .OOB_OUT_0(oob_out_ch0),
#endif
//CH1
#if _ch1_mode == "DISABLE" 
 .HDINP1(fpsc_vlo),
 .HDINN1(fpsc_vlo),
 .HDOUTP1(),
 .HDOUTN1(),
 .SCISELCH1(fpsc_vlo),
 .SCIENCH1(fpsc_vlo),
 .FF_RXI_CLK_1(fpsc_vlo),
 .FF_TXI_CLK_1(fpsc_vlo),
 .FF_EBRD_CLK_1(fpsc_vlo),
 .FF_RX_F_CLK_1(),
 .FF_RX_H_CLK_1(),
 .FF_RX_Q_CLK_1(),
 .FF_TX_D_1_0(fpsc_vlo),
 .FF_TX_D_1_1(fpsc_vlo),
 .FF_TX_D_1_2(fpsc_vlo),
 .FF_TX_D_1_3(fpsc_vlo),
 .FF_TX_D_1_4(fpsc_vlo),
 .FF_TX_D_1_5(fpsc_vlo),
 .FF_TX_D_1_6(fpsc_vlo),
 .FF_TX_D_1_7(fpsc_vlo),
 .FF_TX_D_1_8(fpsc_vlo),
 .FF_TX_D_1_9(fpsc_vlo),
 .FF_TX_D_1_10(fpsc_vlo),
 .FF_TX_D_1_11(fpsc_vlo),
 .FF_TX_D_1_12(fpsc_vlo),
 .FF_TX_D_1_13(fpsc_vlo),
 .FF_TX_D_1_14(fpsc_vlo),
 .FF_TX_D_1_15(fpsc_vlo),
 .FF_TX_D_1_16(fpsc_vlo),
 .FF_TX_D_1_17(fpsc_vlo),
 .FF_TX_D_1_18(fpsc_vlo),
 .FF_TX_D_1_19(fpsc_vlo),
 .FF_TX_D_1_20(fpsc_vlo),
 .FF_TX_D_1_21(fpsc_vlo),
 .FF_TX_D_1_22(fpsc_vlo),
 .FF_TX_D_1_23(fpsc_vlo),
 .FF_RX_D_1_0(),
 .FF_RX_D_1_1(),
 .FF_RX_D_1_2(),
 .FF_RX_D_1_3(),
 .FF_RX_D_1_4(),
 .FF_RX_D_1_5(),
 .FF_RX_D_1_6(),
 .FF_RX_D_1_7(),
 .FF_RX_D_1_8(),
 .FF_RX_D_1_9(),
 .FF_RX_D_1_10(),
 .FF_RX_D_1_11(),
 .FF_RX_D_1_12(),
 .FF_RX_D_1_13(),
 .FF_RX_D_1_14(),
 .FF_RX_D_1_15(),
 .FF_RX_D_1_16(),
 .FF_RX_D_1_17(),
 .FF_RX_D_1_18(),
 .FF_RX_D_1_19(),
 .FF_RX_D_1_20(),
 .FF_RX_D_1_21(),
 .FF_RX_D_1_22(),
 .FF_RX_D_1_23(),
 .FFC_RRST_1(fpsc_vlo),
 .FFC_SIGNAL_DETECT_1(fpsc_vlo),
 .FFC_SB_PFIFO_LP_1(fpsc_vlo),
 .FFC_SB_INV_RX_1(fpsc_vlo),
 .FFC_PFIFO_CLR_1(fpsc_vlo),
 .FFC_PCIE_CT_1(fpsc_vlo),
 .FFC_PCI_DET_EN_1(fpsc_vlo),
 .FFC_FB_LOOPBACK_1(fpsc_vlo),
 .FFC_ENABLE_CGALIGN_1(fpsc_vlo),
 .FFC_EI_EN_1(fpsc_vlo),
 .FFC_LANE_TX_RST_1(fpsc_vlo),
 .FFC_LANE_RX_RST_1(fpsc_vlo),
 .FFC_TXPWDNB_1(fpsc_vlo),
 .FFC_RXPWDNB_1(fpsc_vlo),
 .FFS_RLOS_LO_1(),
 .FFS_PCIE_DONE_1(),
 .FFS_PCIE_CON_1(),
 .FFS_LS_SYNC_STATUS_1(),
 .FFS_CC_UNDERRUN_1(),
 .FFS_CC_OVERRUN_1(),
 .FFS_RLOL_1(),
 .FFS_RXFBFIFO_ERROR_1(),
 .FFS_TXFBFIFO_ERROR_1(),
 .OOB_OUT_1(),
#else
 .HDINP1(hdinp1),
 .HDINN1(hdinn1),
 .HDOUTP1(hdoutp1),
 .HDOUTN1(hdoutn1),
#if _sci_ports == "TRUE"
 .SCISELCH1(scisel_ch1),
 .SCIENCH1(scien_ch1),
#else
 .SCISELCH1(fpsc_vlo),
 .SCIENCH1(fpsc_vlo),
#endif
 .FF_RXI_CLK_1(ff_rxiclk_ch1),
 .FF_TXI_CLK_1(ff_txiclk_ch1),
 .FF_EBRD_CLK_1(ff_ebrd_clk_1),
 .FF_RX_F_CLK_1(ff_rxfullclk_ch1),
#if _data_width_ch1 == "8" || _data_width_ch1 == "10" && _ch1_ctc_byp == "BYPASS"
 .FF_RX_H_CLK_1(),
#elif _data_width_ch1 == "16" || _data_width_ch1 == "20" && _ch1_ctc_byp == "BYPASS"
 .FF_RX_H_CLK_1(ff_rxhalfclk_ch1),
#endif
#if _pllqclkports == "TRUE"
 .FF_RX_Q_CLK_1(ff_rxqtrclk_ch1),
#else
 .FF_RX_Q_CLK_1(),
#endif
#if _protocol == "PIPE"
 .FF_TX_D_1_0(TxData_ch1[0]),
 .FF_TX_D_1_1(TxData_ch1[1]),
 .FF_TX_D_1_2(TxData_ch1[2]),
 .FF_TX_D_1_3(TxData_ch1[3]),
 .FF_TX_D_1_4(TxData_ch1[4]),
 .FF_TX_D_1_5(TxData_ch1[5]),
 .FF_TX_D_1_6(TxData_ch1[6]),
 .FF_TX_D_1_7(TxData_ch1[7]),
#else
 .FF_TX_D_1_0(ff_txdata_ch1[0]),
 .FF_TX_D_1_1(ff_txdata_ch1[1]),
 .FF_TX_D_1_2(ff_txdata_ch1[2]),
 .FF_TX_D_1_3(ff_txdata_ch1[3]),
 .FF_TX_D_1_4(ff_txdata_ch1[4]),
 .FF_TX_D_1_5(ff_txdata_ch1[5]),
 .FF_TX_D_1_6(ff_txdata_ch1[6]),
 .FF_TX_D_1_7(ff_txdata_ch1[7]),
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_TX_D_1_8(ff_tx_k_cntrl_ch1),
#else
 .FF_TX_D_1_8(ff_tx_k_cntrl_ch1[0]),
#endif
#elif _protocol == "XAUI"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_TX_D_1_8(ff_txc_ch1),
#else
 .FF_TX_D_1_8(ff_txc_ch1[0]),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_TX_D_1_8(TxDataK_ch1),
#else
 .FF_TX_D_1_8(TxDataK_ch1[0]),
#endif
#elif _protocol == "8BSER"
 .FF_TX_D_1_8(fpsc_vlo),
#else
 .FF_TX_D_1_8(ff_txdata_ch1[8]),
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_TX_D_1_9(ff_force_disp_ch1),
#else
 .FF_TX_D_1_9(ff_force_disp_ch1[0]),
#endif
#elif _protocol == "10BSER" || _protocol == "USERDEF" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" 
 .FF_TX_D_1_9(ff_txdata_ch1[9]),
#else
 .FF_TX_D_1_9(fpsc_vlo),
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_TX_D_1_10(ff_disp_sel_ch1),
#else
 .FF_TX_D_1_10(ff_disp_sel_ch1[0]),
#endif
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_TX_D_1_10(ff_xmit_ch1),
#else
 .FF_TX_D_1_10(ff_xmit_ch1[0]),
#endif
#elif _protocol == "USERDEF"
 .FF_TX_D_1_10(ff_txdata_ch1[10]),
#else
 .FF_TX_D_1_10(fpsc_vlo),
#endif
#if _protocol == "PCIE" || _protocol == "PIPE"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_TX_D_1_11(ff_pci_ei_en_ch1),
#else
 .FF_TX_D_1_11(ff_pci_ei_en_ch1[0]),
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_TX_D_1_11(ff_correct_disp_ch1),
#else
 .FF_TX_D_1_11(ff_correct_disp_ch1[0]),
#endif
#elif _protocol == "USERDEF"
 .FF_TX_D_1_11(ff_txdata_ch1[11]),
#else
 .FF_TX_D_1_11(fpsc_vlo),
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_1_12(ff_txdata_ch1[12]),
#elif _protocol == "PIPE"
 .FF_TX_D_1_12(TxData_ch1[8]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_1_12(ff_txdata_ch1[10]),
#else
 .FF_TX_D_1_12(ff_txdata_ch1[8]),
#endif
#else
 .FF_TX_D_1_12(fpsc_vlo),
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_1_13(ff_txdata_ch1[13]),
#elif _protocol == "PIPE"
 .FF_TX_D_1_13(TxData_ch1[9]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_1_13(ff_txdata_ch1[11]),
#else
 .FF_TX_D_1_13(ff_txdata_ch1[9]),
#endif
#else
 .FF_TX_D_1_13(fpsc_vlo),
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_1_14(ff_txdata_ch1[14]),
#elif _protocol == "PIPE"
 .FF_TX_D_1_14(TxData_ch1[10]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_1_14(ff_txdata_ch1[12]),
#else
 .FF_TX_D_1_14(ff_txdata_ch1[10]),
#endif
#else
 .FF_TX_D_1_14(fpsc_vlo),
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_1_15(ff_txdata_ch1[15]),
#elif _protocol == "PIPE"
 .FF_TX_D_1_15(TxData_ch1[11]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_1_15(ff_txdata_ch1[13]),
#else
 .FF_TX_D_1_15(ff_txdata_ch1[11]),
#endif
#else
 .FF_TX_D_1_15(fpsc_vlo),
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_1_16(ff_txdata_ch1[16]),
#elif _protocol == "PIPE"
 .FF_TX_D_1_16(TxData_ch1[12]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_1_16(ff_txdata_ch1[14]),
#else
 .FF_TX_D_1_16(ff_txdata_ch1[12]),
#endif
#else
 .FF_TX_D_1_16(fpsc_vlo),
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_1_17(ff_txdata_ch1[17]),
#elif _protocol == "PIPE"
 .FF_TX_D_1_17(TxData_ch1[13]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_1_17(ff_txdata_ch1[15]),
#else
 .FF_TX_D_1_17(ff_txdata_ch1[13]),
#endif
#else
 .FF_TX_D_1_17(fpsc_vlo),
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_1_18(ff_txdata_ch1[18]),
#elif _protocol == "PIPE"
 .FF_TX_D_1_18(TxData_ch1[14]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_1_18(ff_txdata_ch1[16]),
#else
 .FF_TX_D_1_18(ff_txdata_ch1[14]),
#endif
#else
 .FF_TX_D_1_18(fpsc_vlo),
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_1_19(ff_txdata_ch1[19]),
#elif _protocol == "PIPE"
 .FF_TX_D_1_19(TxData_ch1[15]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_1_19(ff_txdata_ch1[17]),
#else
 .FF_TX_D_1_19(ff_txdata_ch1[15]),
#endif
#else
 .FF_TX_D_1_19(fpsc_vlo),
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_1_20(ff_txdata_ch1[20]),
#elif _protocol == "XAUI"
 .FF_TX_D_1_20(ff_txc_ch1[1]),
#elif _protocol == "PIPE"
 .FF_TX_D_1_20(TxDataK_ch1[1]),
#elif _protocol == "8BSER"
 .FF_TX_D_1_20(fpsc_vlo),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_TX_D_1_20(ff_txdata_ch1[18]),
#else
 .FF_TX_D_1_20(ff_tx_k_cntrl_ch1[1]),
#endif
#else
 .FF_TX_D_1_20(fpsc_vlo),
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_1_21(ff_txdata_ch1[21]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_TX_D_1_21(ff_txdata_ch1[19]),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
 .FF_TX_D_1_21(ff_force_disp_ch1[1]),
#else
 .FF_TX_D_1_21(fpsc_vlo),
#endif
#else
 .FF_TX_D_1_21(fpsc_vlo),
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_1_22(ff_txdata_ch1[22]),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
 .FF_TX_D_1_22(ff_xmit_ch1[1]),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
 .FF_TX_D_1_22(ff_disp_sel_ch1[1]),
#else
 .FF_TX_D_1_22(fpsc_vlo),
#endif
#else
 .FF_TX_D_1_22(fpsc_vlo),
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_1_23(ff_txdata_ch1[23]),
#elif _protocol == "PCIE" || _protocol == "PIPE"
 .FF_TX_D_1_23(ff_pci_ei_en_ch1[1]),
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
 .FF_TX_D_1_23(ff_correct_disp_ch1[1]),
#else
 .FF_TX_D_1_23(fpsc_vlo),
#endif
#else
 .FF_TX_D_1_23(fpsc_vlo),
#endif
#if _protocol == "PIPE"
 .FF_RX_D_1_0(RxData_ch1[0]),
 .FF_RX_D_1_1(RxData_ch1[1]),
 .FF_RX_D_1_2(RxData_ch1[2]),
 .FF_RX_D_1_3(RxData_ch1[3]),
 .FF_RX_D_1_4(RxData_ch1[4]),
 .FF_RX_D_1_5(RxData_ch1[5]),
 .FF_RX_D_1_6(RxData_ch1[6]),
 .FF_RX_D_1_7(RxData_ch1[7]),
#else
 .FF_RX_D_1_0(ff_rxdata_ch1[0]),
 .FF_RX_D_1_1(ff_rxdata_ch1[1]),
 .FF_RX_D_1_2(ff_rxdata_ch1[2]),
 .FF_RX_D_1_3(ff_rxdata_ch1[3]),
 .FF_RX_D_1_4(ff_rxdata_ch1[4]),
 .FF_RX_D_1_5(ff_rxdata_ch1[5]),
 .FF_RX_D_1_6(ff_rxdata_ch1[6]),
 .FF_RX_D_1_7(ff_rxdata_ch1[7]),
#endif
#if _protocol == "XAUI"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_8(ff_rxc_ch1),
#else
 .FF_RX_D_1_8(ff_rxc_ch1[0]),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_8(RxDataK_ch1),
#else
 .FF_RX_D_1_8(RxDataK_ch1[0]),
#endif
#elif _protocol == "8BSER"
 .FF_RX_D_1_8(),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
 .FF_RX_D_1_8(ff_rxdata_ch1[8]),
#else
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_8(ff_rx_k_cntrl_ch1),
#else
 .FF_RX_D_1_8(ff_rx_k_cntrl_ch1[0]),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_9(ff_rxstatus0_ch1),
#else
 .FF_RX_D_1_9(ff_rxstatus0_ch1[0]),
#endif
#elif _protocol == "PIPE"
 .FF_RX_D_1_9(RxStatus0_ch1[0]),
#elif _protocol == "8BSER" 
 .FF_RX_D_1_9(),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
 .FF_RX_D_1_9(ff_rxdata_ch1[9]),
#else
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_9(ff_disp_err_ch1),
#else
 .FF_RX_D_1_9(ff_disp_err_ch1[0]),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_10(ff_rxstatus1_ch1),
#else
 .FF_RX_D_1_10(ff_rxstatus1_ch1[0]),
#endif
#elif _protocol == "PIPE"
 .FF_RX_D_1_10(RxStatus0_ch1[1]),
#elif _protocol == "USERDEF"
 .FF_RX_D_1_10(ff_rxdata_ch1[10]),
#elif _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_1_10(),
#else
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_10(ff_cv_ch1),
#else
 .FF_RX_D_1_10(ff_cv_ch1[0]),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_11(ff_rxstatus2_ch1),
#else
 .FF_RX_D_1_11(ff_rxstatus2_ch1[0]),
#endif
#elif _protocol == "PIPE"
 .FF_RX_D_1_11(RxStatus0_ch1[2]),
#elif _protocol == "USERDEF"
 .FF_RX_D_1_11(ff_rxdata_ch1[11]),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_11(ff_rx_even_ch1),
#else
 .FF_RX_D_1_11(ff_rx_even_ch1[0]),
#endif
#else
 .FF_RX_D_1_11(),
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_12(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_1_12(ff_rxdata_ch1[10]),
#elif _protocol == "USERDEF"
 .FF_RX_D_1_12(ff_rxdata_ch1[12]),
#elif _protocol == "PIPE"
 .FF_RX_D_1_12(RxData_ch1[8]),
#else
 .FF_RX_D_1_12(ff_rxdata_ch1[8]),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_13(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_1_13(ff_rxdata_ch1[11]),
#elif _protocol == "USERDEF"
 .FF_RX_D_1_13(ff_rxdata_ch1[13]),
#elif _protocol == "PIPE"
 .FF_RX_D_1_13(RxData_ch1[9]),
#else
 .FF_RX_D_1_13(ff_rxdata_ch1[9]),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_14(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_1_14(ff_rxdata_ch1[12]),
#elif _protocol == "USERDEF"
 .FF_RX_D_1_14(ff_rxdata_ch1[14]),
#elif _protocol == "PIPE"
 .FF_RX_D_1_14(RxData_ch1[10]),
#else
 .FF_RX_D_1_14(ff_rxdata_ch1[10]),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_15(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_1_15(ff_rxdata_ch1[13]),
#elif _protocol == "USERDEF"
 .FF_RX_D_1_15(ff_rxdata_ch1[15]),
#elif _protocol == "PIPE"
 .FF_RX_D_1_15(RxData_ch1[11]),
#else
 .FF_RX_D_1_15(ff_rxdata_ch1[11]),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_16(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_1_16(ff_rxdata_ch1[14]),
#elif _protocol == "USERDEF"
 .FF_RX_D_1_16(ff_rxdata_ch1[16]),
#elif _protocol == "PIPE"
 .FF_RX_D_1_16(RxData_ch1[12]),
#else
 .FF_RX_D_1_16(ff_rxdata_ch1[12]),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_17(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_1_17(ff_rxdata_ch1[15]),
#elif _protocol == "USERDEF"
 .FF_RX_D_1_17(ff_rxdata_ch1[17]),
#elif _protocol == "PIPE"
 .FF_RX_D_1_17(RxData_ch1[13]),
#else
 .FF_RX_D_1_17(ff_rxdata_ch1[13]),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_18(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_1_18(ff_rxdata_ch1[16]),
#elif _protocol == "USERDEF"
 .FF_RX_D_1_18(ff_rxdata_ch1[18]),
#elif _protocol == "PIPE"
 .FF_RX_D_1_18(RxData_ch1[14]),
#else
 .FF_RX_D_1_18(ff_rxdata_ch1[14]),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_19(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_1_19(ff_rxdata_ch1[17]),
#elif _protocol == "USERDEF"
 .FF_RX_D_1_19(ff_rxdata_ch1[19]),
#elif _protocol == "PIPE"
 .FF_RX_D_1_19(RxData_ch1[15]),
#else
 .FF_RX_D_1_19(ff_rxdata_ch1[15]),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_20(),
#else
#if _protocol == "8BSER"
 .FF_RX_D_1_20(),
#elif _protocol == "USERDEF"
 .FF_RX_D_1_20(ff_rxdata_ch1[20]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_1_20(ff_rxdata_ch1[18]),
#elif _protocol == "XAUI"
 .FF_RX_D_1_20(ff_rxc_ch1[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_1_20(RxDataK_ch1[1]),
#else
 .FF_RX_D_1_20(ff_rx_k_cntrl_ch1[1]),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_21(),
#else
#if _protocol == "8BSER" 
 .FF_RX_D_1_21(),
#elif _protocol == "USERDEF"
 .FF_RX_D_1_21(ff_rxdata_ch1[21]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_1_21(ff_rxdata_ch1[19]),
#elif _protocol == "PCIE" 
 .FF_RX_D_1_21(ff_rxstatus0_ch1[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_1_21(RxStatus1_ch1[0]),
#else
 .FF_RX_D_1_21(ff_disp_err_ch1[1]),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_22(),
#else
#if _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_1_22(),
#elif _protocol == "USERDEF"
 .FF_RX_D_1_22(ff_rxdata_ch1[22]),
#elif _protocol == "PCIE" 
 .FF_RX_D_1_22(ff_rxstatus1_ch1[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_1_22(RxStatus1_ch1[1]),
#else
 .FF_RX_D_1_22(ff_cv_ch1[1]),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
 .FF_RX_D_1_23(),
#else
#if _protocol == "GIGE" || _protocol == "OBSAI" 
 .FF_RX_D_1_23(ff_rx_even_ch1[1]),
#elif _protocol == "USERDEF"
 .FF_RX_D_1_23(ff_rxdata_ch1[23]),
#elif _protocol == "PCIE" 
 .FF_RX_D_1_23(ff_rxstatus2_ch1[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_1_23(RxStatus1_ch1[2]),
#else
 .FF_RX_D_1_23(),
#endif
#endif
 .FFC_RRST_1(ffc_rrst_ch1),
#if _ch1_elsm == "TRUE"
 .FFC_SIGNAL_DETECT_1(ffc_signal_detect_ch1),
 .FFC_ENABLE_CGALIGN_1(ffc_enable_cgalign_ch1),
#else
 .FFC_SIGNAL_DETECT_1(fpsc_vlo),
 .FFC_ENABLE_CGALIGN_1(fpsc_vlo),
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
 .FFC_SB_PFIFO_LP_1(fpsc_vlo),
 .FFC_PFIFO_CLR_1(ffc_pfifo_clr_ch1),
 .FFC_FB_LOOPBACK_1(fpsc_vlo),
#elif _lbtype == "PCS Parallel Loopback"
 .FFC_SB_PFIFO_LP_1(fpsc_vlo),
 .FFC_PFIFO_CLR_1(fpsc_vlo),
#if _protocol != "PIPE"
 .FFC_FB_LOOPBACK_1(fpsc_vlo),
#else
 .FFC_FB_LOOPBACK_1(fpsc_vlo),
#endif
#else
 .FFC_SB_PFIFO_LP_1(fpsc_vlo),
 .FFC_PFIFO_CLR_1(fpsc_vlo),
 .FFC_FB_LOOPBACK_1(fpsc_vlo),
#endif
#else
 .FFC_SB_PFIFO_LP_1(fpsc_vlo),
 .FFC_PFIFO_CLR_1(fpsc_vlo),
 .FFC_FB_LOOPBACK_1(fpsc_vlo),
#endif
#if _ch1_ird == "TRUE"
#if _protocol == "PIPE"
 .FFC_SB_INV_RX_1(),
#else
 .FFC_SB_INV_RX_1(ffc_sb_inv_rx_ch1),
#endif
#else
 .FFC_SB_INV_RX_1(fpsc_vlo),
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
 .FFC_PCIE_CT_1(ffc_pcie_ct_ch1),
 .FFC_PCI_DET_EN_1(ffc_pci_det_en_ch1),
 .FFS_PCIE_DONE_1(ffs_pcie_done_ch1),
 .FFS_PCIE_CON_1(ffs_pcie_con_ch1),
#elif _protocol == "PIPE"
 .FFC_PCIE_CT_1(),
 .FFC_PCI_DET_EN_1(),
 .FFS_PCIE_DONE_1(),
 .FFS_PCIE_CON_1(),
#else
 .FFC_PCIE_CT_1(fpsc_vlo),
 .FFC_PCI_DET_EN_1(fpsc_vlo),
 .FFS_PCIE_DONE_1(),
 .FFS_PCIE_CON_1(),
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch1_teidle == "TRUE")
 .FFC_EI_EN_1(ffc_ei_en_ch1),
#else
 .FFC_EI_EN_1(fpsc_vlo),
#endif
 .FFC_LANE_TX_RST_1(ffc_lane_tx_rst_ch1),
 .FFC_LANE_RX_RST_1(ffc_lane_rx_rst_ch1),
 .FFC_TXPWDNB_1(ffc_txpwdnb_ch1),
 .FFC_RXPWDNB_1(ffc_rxpwdnb_ch1),
#if _protocol == "PIPE"
 .FFS_RLOS_LO_1(),
#elif _protocol == "SATA_I"
 .FFS_RLOS_LO_1(ffs_sata_oob_rx_ch1),
#else
 .FFS_RLOS_LO_1(ffs_rlos_lo_ch1),
#endif
#if _protocol == "8BSER"
 .FFS_LS_SYNC_STATUS_1(),
#else
#if _comma_align == "AUTO"
 .FFS_LS_SYNC_STATUS_1(ffs_ls_sync_status_ch1),
#else
 .FFS_LS_SYNC_STATUS_1(),
#endif
#endif
#if _errsports == "TRUE"
 .FFS_CC_UNDERRUN_1(ffs_cc_underrun_ch1),
 .FFS_CC_OVERRUN_1(ffs_cc_overrun_ch1),
 .FFS_RXFBFIFO_ERROR_1(ffs_rxfbfifo_error_ch1),
 .FFS_TXFBFIFO_ERROR_1(ffs_txfbfifo_error_ch1),
#else
 .FFS_CC_UNDERRUN_1(),
 .FFS_CC_OVERRUN_1(),
 .FFS_RXFBFIFO_ERROR_1(),
 .FFS_TXFBFIFO_ERROR_1(),
#endif
 .FFS_RLOL_1(ffs_rlol_ch1),
 .OOB_OUT_1(oob_out_ch1),
#endif
//CH2
#if _ch2_mode == "DISABLE" 
 .HDINP2(fpsc_vlo),
 .HDINN2(fpsc_vlo),
 .HDOUTP2(),
 .HDOUTN2(),
 .SCISELCH2(fpsc_vlo),
 .SCIENCH2(fpsc_vlo),
 .FF_RXI_CLK_2(fpsc_vlo),
 .FF_TXI_CLK_2(fpsc_vlo),
 .FF_EBRD_CLK_2(fpsc_vlo),
 .FF_RX_F_CLK_2(),
 .FF_RX_H_CLK_2(),
 .FF_RX_Q_CLK_2(),
 .FF_TX_D_2_0(fpsc_vlo),
 .FF_TX_D_2_1(fpsc_vlo),
 .FF_TX_D_2_2(fpsc_vlo),
 .FF_TX_D_2_3(fpsc_vlo),
 .FF_TX_D_2_4(fpsc_vlo),
 .FF_TX_D_2_5(fpsc_vlo),
 .FF_TX_D_2_6(fpsc_vlo),
 .FF_TX_D_2_7(fpsc_vlo),
 .FF_TX_D_2_8(fpsc_vlo),
 .FF_TX_D_2_9(fpsc_vlo),
 .FF_TX_D_2_10(fpsc_vlo),
 .FF_TX_D_2_11(fpsc_vlo),
 .FF_TX_D_2_12(fpsc_vlo),
 .FF_TX_D_2_13(fpsc_vlo),
 .FF_TX_D_2_14(fpsc_vlo),
 .FF_TX_D_2_15(fpsc_vlo),
 .FF_TX_D_2_16(fpsc_vlo),
 .FF_TX_D_2_17(fpsc_vlo),
 .FF_TX_D_2_18(fpsc_vlo),
 .FF_TX_D_2_19(fpsc_vlo),
 .FF_TX_D_2_20(fpsc_vlo),
 .FF_TX_D_2_21(fpsc_vlo),
 .FF_TX_D_2_22(fpsc_vlo),
 .FF_TX_D_2_23(fpsc_vlo),
 .FF_RX_D_2_0(),
 .FF_RX_D_2_1(),
 .FF_RX_D_2_2(),
 .FF_RX_D_2_3(),
 .FF_RX_D_2_4(),
 .FF_RX_D_2_5(),
 .FF_RX_D_2_6(),
 .FF_RX_D_2_7(),
 .FF_RX_D_2_8(),
 .FF_RX_D_2_9(),
 .FF_RX_D_2_10(),
 .FF_RX_D_2_11(),
 .FF_RX_D_2_12(),
 .FF_RX_D_2_13(),
 .FF_RX_D_2_14(),
 .FF_RX_D_2_15(),
 .FF_RX_D_2_16(),
 .FF_RX_D_2_17(),
 .FF_RX_D_2_18(),
 .FF_RX_D_2_19(),
 .FF_RX_D_2_20(),
 .FF_RX_D_2_21(),
 .FF_RX_D_2_22(),
 .FF_RX_D_2_23(),
 .FFC_RRST_2(fpsc_vlo),
 .FFC_SIGNAL_DETECT_2(fpsc_vlo),
 .FFC_SB_PFIFO_LP_2(fpsc_vlo),
 .FFC_SB_INV_RX_2(fpsc_vlo),
 .FFC_PFIFO_CLR_2(fpsc_vlo),
 .FFC_PCIE_CT_2(fpsc_vlo),
 .FFC_PCI_DET_EN_2(fpsc_vlo),
 .FFC_FB_LOOPBACK_2(fpsc_vlo),
 .FFC_ENABLE_CGALIGN_2(fpsc_vlo),
 .FFC_EI_EN_2(fpsc_vlo),
 .FFC_LANE_TX_RST_2(fpsc_vlo),
 .FFC_LANE_RX_RST_2(fpsc_vlo),
 .FFC_TXPWDNB_2(fpsc_vlo),
 .FFC_RXPWDNB_2(fpsc_vlo),
 .FFS_RLOS_LO_2(),
 .FFS_PCIE_DONE_2(),
 .FFS_PCIE_CON_2(),
 .FFS_LS_SYNC_STATUS_2(),
 .FFS_CC_UNDERRUN_2(),
 .FFS_CC_OVERRUN_2(),
 .FFS_RLOL_2(),
 .FFS_RXFBFIFO_ERROR_2(),
 .FFS_TXFBFIFO_ERROR_2(),
 .OOB_OUT_2(),
#else
 .HDINP2(hdinp2),
 .HDINN2(hdinn2),
 .HDOUTP2(hdoutp2),
 .HDOUTN2(hdoutn2),
#if _sci_ports == "TRUE"
 .SCISELCH2(scisel_ch2),
 .SCIENCH2(scien_ch2),
#else
 .SCISELCH2(fpsc_vlo),
 .SCIENCH2(fpsc_vlo),
#endif
 .FF_RXI_CLK_2(ff_rxiclk_ch2),
 .FF_TXI_CLK_2(ff_txiclk_ch2),
 .FF_EBRD_CLK_2(ff_ebrd_clk_2),
 .FF_RX_F_CLK_2(ff_rxfullclk_ch2),
#if _data_width_ch2 == "8" || _data_width_ch2 == "10" && _ch2_ctc_byp == "BYPASS"
 .FF_RX_H_CLK_2(),
#elif _data_width_ch2 == "16" || _data_width_ch2 == "20" && _ch2_ctc_byp == "BYPASS"
 .FF_RX_H_CLK_2(ff_rxhalfclk_ch2),
#endif
#if _pllqclkports == "TRUE"
 .FF_RX_Q_CLK_2(ff_rxqtrclk_ch2),
#else
 .FF_RX_Q_CLK_2(),
#endif
#if _protocol == "PIPE"
 .FF_TX_D_2_0(TxData_ch2[0]),
 .FF_TX_D_2_1(TxData_ch2[1]),
 .FF_TX_D_2_2(TxData_ch2[2]),
 .FF_TX_D_2_3(TxData_ch2[3]),
 .FF_TX_D_2_4(TxData_ch2[4]),
 .FF_TX_D_2_5(TxData_ch2[5]),
 .FF_TX_D_2_6(TxData_ch2[6]),
 .FF_TX_D_2_7(TxData_ch2[7]),
#else
 .FF_TX_D_2_0(ff_txdata_ch2[0]),
 .FF_TX_D_2_1(ff_txdata_ch2[1]),
 .FF_TX_D_2_2(ff_txdata_ch2[2]),
 .FF_TX_D_2_3(ff_txdata_ch2[3]),
 .FF_TX_D_2_4(ff_txdata_ch2[4]),
 .FF_TX_D_2_5(ff_txdata_ch2[5]),
 .FF_TX_D_2_6(ff_txdata_ch2[6]),
 .FF_TX_D_2_7(ff_txdata_ch2[7]),
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_TX_D_2_8(ff_tx_k_cntrl_ch2),
#else
 .FF_TX_D_2_8(ff_tx_k_cntrl_ch2[0]),
#endif
#elif _protocol == "XAUI"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_TX_D_2_8(ff_txc_ch2),
#else
 .FF_TX_D_2_8(ff_txc_ch2[0]),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_TX_D_2_8(TxDataK_ch2),
#else
 .FF_TX_D_2_8(TxDataK_ch2[0]),
#endif
#elif _protocol == "8BSER"
 .FF_TX_D_2_8(fpsc_vlo),
#else
 .FF_TX_D_2_8(ff_txdata_ch2[8]),
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_TX_D_2_9(ff_force_disp_ch2),
#else
 .FF_TX_D_2_9(ff_force_disp_ch2[0]),
#endif
#elif _protocol == "10BSER" || _protocol == "USERDEF" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" 
 .FF_TX_D_2_9(ff_txdata_ch2[9]),
#else
 .FF_TX_D_2_9(fpsc_vlo),
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_TX_D_2_10(ff_disp_sel_ch2),
#else
 .FF_TX_D_2_10(ff_disp_sel_ch2[0]),
#endif
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_TX_D_2_10(ff_xmit_ch2),
#else
 .FF_TX_D_2_10(ff_xmit_ch2[0]),
#endif
#elif _protocol == "USERDEF"
 .FF_TX_D_2_10(ff_txdata_ch2[10]),
#else
 .FF_TX_D_2_10(fpsc_vlo),
#endif
#if _protocol == "PCIE" || _protocol == "PIPE"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_TX_D_2_11(ff_pci_ei_en_ch2),
#else
 .FF_TX_D_2_11(ff_pci_ei_en_ch2[0]),
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_TX_D_2_11(ff_correct_disp_ch2),
#else
 .FF_TX_D_2_11(ff_correct_disp_ch2[0]),
#endif
#elif _protocol == "USERDEF"
 .FF_TX_D_2_11(ff_txdata_ch2[11]),
#else
 .FF_TX_D_2_11(fpsc_vlo),
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_2_12(ff_txdata_ch2[12]),
#elif _protocol == "PIPE"
 .FF_TX_D_2_12(TxData_ch2[8]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_2_12(ff_txdata_ch2[10]),
#else
 .FF_TX_D_2_12(ff_txdata_ch2[8]),
#endif
#else
 .FF_TX_D_2_12(fpsc_vlo),
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_2_13(ff_txdata_ch2[13]),
#elif _protocol == "PIPE"
 .FF_TX_D_2_13(TxData_ch2[9]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_2_13(ff_txdata_ch2[11]),
#else
 .FF_TX_D_2_13(ff_txdata_ch2[9]),
#endif
#else
 .FF_TX_D_2_13(fpsc_vlo),
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_2_14(ff_txdata_ch2[14]),
#elif _protocol == "PIPE"
 .FF_TX_D_2_14(TxData_ch2[10]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_2_14(ff_txdata_ch2[12]),
#else
 .FF_TX_D_2_14(ff_txdata_ch2[10]),
#endif
#else
 .FF_TX_D_2_14(fpsc_vlo),
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_2_15(ff_txdata_ch2[15]),
#elif _protocol == "PIPE"
 .FF_TX_D_2_15(TxData_ch2[11]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_2_15(ff_txdata_ch2[13]),
#else
 .FF_TX_D_2_15(ff_txdata_ch2[11]),
#endif
#else
 .FF_TX_D_2_15(fpsc_vlo),
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_2_16(ff_txdata_ch2[16]),
#elif _protocol == "PIPE"
 .FF_TX_D_2_16(TxData_ch2[12]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_2_16(ff_txdata_ch2[14]),
#else
 .FF_TX_D_2_16(ff_txdata_ch2[12]),
#endif
#else
 .FF_TX_D_2_16(fpsc_vlo),
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_2_17(ff_txdata_ch2[17]),
#elif _protocol == "PIPE"
 .FF_TX_D_2_17(TxData_ch2[13]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_2_17(ff_txdata_ch2[15]),
#else
 .FF_TX_D_2_17(ff_txdata_ch2[13]),
#endif
#else
 .FF_TX_D_2_17(fpsc_vlo),
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_2_18(ff_txdata_ch2[18]),
#elif _protocol == "PIPE"
 .FF_TX_D_2_18(TxData_ch2[14]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_2_18(ff_txdata_ch2[16]),
#else
 .FF_TX_D_2_18(ff_txdata_ch2[14]),
#endif
#else
 .FF_TX_D_2_18(fpsc_vlo),
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_2_19(ff_txdata_ch2[19]),
#elif _protocol == "PIPE"
 .FF_TX_D_2_19(TxData_ch2[15]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_2_19(ff_txdata_ch2[17]),
#else
 .FF_TX_D_2_19(ff_txdata_ch2[15]),
#endif
#else
 .FF_TX_D_2_19(fpsc_vlo),
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_2_20(ff_txdata_ch2[20]),
#elif _protocol == "XAUI"
 .FF_TX_D_2_20(ff_txc_ch2[1]),
#elif _protocol == "PIPE"
 .FF_TX_D_2_20(TxDataK_ch2[1]),
#elif _protocol == "8BSER"
 .FF_TX_D_2_20(fpsc_vlo),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_TX_D_2_20(ff_txdata_ch2[18]),
#else
 .FF_TX_D_2_20(ff_tx_k_cntrl_ch2[1]),
#endif
#else
 .FF_TX_D_2_20(fpsc_vlo),
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_2_21(ff_txdata_ch2[21]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_TX_D_2_21(ff_txdata_ch2[19]),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
 .FF_TX_D_2_21(ff_force_disp_ch2[1]),
#else
 .FF_TX_D_2_21(fpsc_vlo),
#endif
#else
 .FF_TX_D_2_21(fpsc_vlo),
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_2_22(ff_txdata_ch2[22]),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
 .FF_TX_D_2_22(ff_xmit_ch2[1]),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
 .FF_TX_D_2_22(ff_disp_sel_ch2[1]),
#else
 .FF_TX_D_2_22(fpsc_vlo),
#endif
#else
 .FF_TX_D_2_22(fpsc_vlo),
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_2_23(ff_txdata_ch2[23]),
#elif _protocol == "PCIE" || _protocol == "PIPE"
 .FF_TX_D_2_23(ff_pci_ei_en_ch2[1]),
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
 .FF_TX_D_2_23(ff_correct_disp_ch2[1]),
#else
 .FF_TX_D_2_23(fpsc_vlo),
#endif
#else
 .FF_TX_D_2_23(fpsc_vlo),
#endif
#if _protocol == "PIPE"
 .FF_RX_D_2_0(RxData_ch2[0]),
 .FF_RX_D_2_1(RxData_ch2[1]),
 .FF_RX_D_2_2(RxData_ch2[2]),
 .FF_RX_D_2_3(RxData_ch2[3]),
 .FF_RX_D_2_4(RxData_ch2[4]),
 .FF_RX_D_2_5(RxData_ch2[5]),
 .FF_RX_D_2_6(RxData_ch2[6]),
 .FF_RX_D_2_7(RxData_ch2[7]),
#else
 .FF_RX_D_2_0(ff_rxdata_ch2[0]),
 .FF_RX_D_2_1(ff_rxdata_ch2[1]),
 .FF_RX_D_2_2(ff_rxdata_ch2[2]),
 .FF_RX_D_2_3(ff_rxdata_ch2[3]),
 .FF_RX_D_2_4(ff_rxdata_ch2[4]),
 .FF_RX_D_2_5(ff_rxdata_ch2[5]),
 .FF_RX_D_2_6(ff_rxdata_ch2[6]),
 .FF_RX_D_2_7(ff_rxdata_ch2[7]),
#endif
#if _protocol == "XAUI"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_8(ff_rxc_ch2),
#else
 .FF_RX_D_2_8(ff_rxc_ch2[0]),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_8(RxDataK_ch2),
#else
 .FF_RX_D_2_8(RxDataK_ch2[0]),
#endif
#elif _protocol == "8BSER"
 .FF_RX_D_2_8(),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
 .FF_RX_D_2_8(ff_rxdata_ch2[8]),
#else
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_8(ff_rx_k_cntrl_ch2),
#else
 .FF_RX_D_2_8(ff_rx_k_cntrl_ch2[0]),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_9(ff_rxstatus0_ch2),
#else
 .FF_RX_D_2_9(ff_rxstatus0_ch2[0]),
#endif
#elif _protocol == "PIPE"
 .FF_RX_D_2_9(RxStatus0_ch2[0]),
#elif _protocol == "8BSER" 
 .FF_RX_D_2_9(),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
 .FF_RX_D_2_9(ff_rxdata_ch2[9]),
#else
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_9(ff_disp_err_ch2),
#else
 .FF_RX_D_2_9(ff_disp_err_ch2[0]),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_10(ff_rxstatus1_ch2),
#else
 .FF_RX_D_2_10(ff_rxstatus1_ch2[0]),
#endif
#elif _protocol == "PIPE"
 .FF_RX_D_2_10(RxStatus0_ch2[1]),
#elif _protocol == "USERDEF"
 .FF_RX_D_2_10(ff_rxdata_ch2[10]),
#elif _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_2_10(),
#else
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_10(ff_cv_ch2),
#else
 .FF_RX_D_2_10(ff_cv_ch2[0]),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_11(ff_rxstatus2_ch2),
#else
 .FF_RX_D_2_11(ff_rxstatus2_ch2[0]),
#endif
#elif _protocol == "PIPE"
 .FF_RX_D_2_11(RxStatus0_ch2[2]),
#elif _protocol == "USERDEF"
 .FF_RX_D_2_11(ff_rxdata_ch2[11]),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_11(ff_rx_even_ch2),
#else
 .FF_RX_D_2_11(ff_rx_even_ch2[0]),
#endif
#else
 .FF_RX_D_2_11(),
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_12(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_2_12(ff_rxdata_ch2[10]),
#elif _protocol == "USERDEF"
 .FF_RX_D_2_12(ff_rxdata_ch2[12]),
#elif _protocol == "PIPE"
 .FF_RX_D_2_12(RxData_ch2[8]),
#else
 .FF_RX_D_2_12(ff_rxdata_ch2[8]),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_13(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_2_13(ff_rxdata_ch2[11]),
#elif _protocol == "USERDEF"
 .FF_RX_D_2_13(ff_rxdata_ch2[13]),
#elif _protocol == "PIPE"
 .FF_RX_D_2_13(RxData_ch2[9]),
#else
 .FF_RX_D_2_13(ff_rxdata_ch2[9]),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_14(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_2_14(ff_rxdata_ch2[12]),
#elif _protocol == "USERDEF"
 .FF_RX_D_2_14(ff_rxdata_ch2[14]),
#elif _protocol == "PIPE"
 .FF_RX_D_2_14(RxData_ch2[10]),
#else
 .FF_RX_D_2_14(ff_rxdata_ch2[10]),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_15(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_2_15(ff_rxdata_ch2[13]),
#elif _protocol == "USERDEF"
 .FF_RX_D_2_15(ff_rxdata_ch2[15]),
#elif _protocol == "PIPE"
 .FF_RX_D_2_15(RxData_ch2[11]),
#else
 .FF_RX_D_2_15(ff_rxdata_ch2[11]),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_16(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_2_16(ff_rxdata_ch2[14]),
#elif _protocol == "USERDEF"
 .FF_RX_D_2_16(ff_rxdata_ch2[16]),
#elif _protocol == "PIPE"
 .FF_RX_D_2_16(RxData_ch2[12]),
#else
 .FF_RX_D_2_16(ff_rxdata_ch2[12]),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_17(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_2_17(ff_rxdata_ch2[15]),
#elif _protocol == "USERDEF"
 .FF_RX_D_2_17(ff_rxdata_ch2[17]),
#elif _protocol == "PIPE"
 .FF_RX_D_2_17(RxData_ch2[13]),
#else
 .FF_RX_D_2_17(ff_rxdata_ch2[13]),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_18(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_2_18(ff_rxdata_ch2[16]),
#elif _protocol == "USERDEF"
 .FF_RX_D_2_18(ff_rxdata_ch2[18]),
#elif _protocol == "PIPE"
 .FF_RX_D_2_18(RxData_ch2[14]),
#else
 .FF_RX_D_2_18(ff_rxdata_ch2[14]),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_19(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_2_19(ff_rxdata_ch2[17]),
#elif _protocol == "USERDEF"
 .FF_RX_D_2_19(ff_rxdata_ch2[19]),
#elif _protocol == "PIPE"
 .FF_RX_D_2_19(RxData_ch2[15]),
#else
 .FF_RX_D_2_19(ff_rxdata_ch2[15]),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_20(),
#else
#if _protocol == "8BSER"
 .FF_RX_D_2_20(),
#elif _protocol == "USERDEF"
 .FF_RX_D_2_20(ff_rxdata_ch2[20]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_2_20(ff_rxdata_ch2[18]),
#elif _protocol == "XAUI"
 .FF_RX_D_2_20(ff_rxc_ch2[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_2_20(RxDataK_ch2[1]),
#else
 .FF_RX_D_2_20(ff_rx_k_cntrl_ch2[1]),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_21(),
#else
#if _protocol == "8BSER" 
 .FF_RX_D_2_21(),
#elif _protocol == "USERDEF"
 .FF_RX_D_2_21(ff_rxdata_ch2[21]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_2_21(ff_rxdata_ch2[19]),
#elif _protocol == "PCIE" 
 .FF_RX_D_2_21(ff_rxstatus0_ch2[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_2_21(RxStatus1_ch2[0]),
#else
 .FF_RX_D_2_21(ff_disp_err_ch2[1]),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_22(),
#else
#if _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_2_22(),
#elif _protocol == "USERDEF"
 .FF_RX_D_2_22(ff_rxdata_ch2[22]),
#elif _protocol == "PCIE" 
 .FF_RX_D_2_22(ff_rxstatus1_ch2[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_2_22(RxStatus1_ch2[1]),
#else
 .FF_RX_D_2_22(ff_cv_ch2[1]),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
 .FF_RX_D_2_23(),
#else
#if _protocol == "GIGE" || _protocol == "OBSAI" 
 .FF_RX_D_2_23(ff_rx_even_ch2[1]),
#elif _protocol == "USERDEF"
 .FF_RX_D_2_23(ff_rxdata_ch2[23]),
#elif _protocol == "PCIE" 
 .FF_RX_D_2_23(ff_rxstatus2_ch2[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_2_23(RxStatus1_ch2[2]),
#else
 .FF_RX_D_2_23(),
#endif
#endif
 .FFC_RRST_2(ffc_rrst_ch2),
#if _ch2_elsm == "TRUE"
 .FFC_SIGNAL_DETECT_2(ffc_signal_detect_ch2),
 .FFC_ENABLE_CGALIGN_2(ffc_enable_cgalign_ch2),
#else
 .FFC_SIGNAL_DETECT_2(fpsc_vlo),
 .FFC_ENABLE_CGALIGN_2(fpsc_vlo),
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
 .FFC_SB_PFIFO_LP_2(fpsc_vlo),
 .FFC_PFIFO_CLR_2(ffc_pfifo_clr_ch2),
 .FFC_FB_LOOPBACK_2(fpsc_vlo),
#elif _lbtype == "PCS Parallel Loopback"
 .FFC_SB_PFIFO_LP_2(fpsc_vlo),
 .FFC_PFIFO_CLR_2(fpsc_vlo),
#if _protocol != "PIPE"
 .FFC_FB_LOOPBACK_2(fpsc_vlo),
#else
 .FFC_FB_LOOPBACK_2(fpsc_vlo),
#endif
#else
 .FFC_SB_PFIFO_LP_2(fpsc_vlo),
 .FFC_PFIFO_CLR_2(fpsc_vlo),
 .FFC_FB_LOOPBACK_2(fpsc_vlo),
#endif
#else
 .FFC_SB_PFIFO_LP_2(fpsc_vlo),
 .FFC_PFIFO_CLR_2(fpsc_vlo),
 .FFC_FB_LOOPBACK_2(fpsc_vlo),
#endif
#if _ch2_ird == "TRUE"
#if _protocol == "PIPE"
 .FFC_SB_INV_RX_2(),
#else
 .FFC_SB_INV_RX_2(ffc_sb_inv_rx_ch2),
#endif
#else
 .FFC_SB_INV_RX_2(fpsc_vlo),
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
 .FFC_PCIE_CT_2(ffc_pcie_ct_ch2),
 .FFC_PCI_DET_EN_2(ffc_pci_det_en_ch2),
 .FFS_PCIE_DONE_2(ffs_pcie_done_ch2),
 .FFS_PCIE_CON_2(ffs_pcie_con_ch2),
#elif _protocol == "PIPE"
 .FFC_PCIE_CT_2(),
 .FFC_PCI_DET_EN_2(),
 .FFS_PCIE_DONE_2(),
 .FFS_PCIE_CON_2(),
#else
 .FFC_PCIE_CT_2(fpsc_vlo),
 .FFC_PCI_DET_EN_2(fpsc_vlo),
 .FFS_PCIE_DONE_2(),
 .FFS_PCIE_CON_2(),
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch2_teidle == "TRUE")
 .FFC_EI_EN_2(ffc_ei_en_ch2),
#else
 .FFC_EI_EN_2(fpsc_vlo),
#endif
 .FFC_LANE_TX_RST_2(ffc_lane_tx_rst_ch2),
 .FFC_LANE_RX_RST_2(ffc_lane_rx_rst_ch2),
 .FFC_TXPWDNB_2(ffc_txpwdnb_ch2),
 .FFC_RXPWDNB_2(ffc_rxpwdnb_ch2),
#if _protocol == "PIPE"
 .FFS_RLOS_LO_2(),
#elif _protocol == "SATA_I"
 .FFS_RLOS_LO_2(ffs_sata_oob_rx_ch2),
#else
 .FFS_RLOS_LO_2(ffs_rlos_lo_ch2),
#endif
#if _protocol == "8BSER"
 .FFS_LS_SYNC_STATUS_2(),
#else
#if _comma_align == "AUTO"
 .FFS_LS_SYNC_STATUS_2(ffs_ls_sync_status_ch2),
#else
 .FFS_LS_SYNC_STATUS_2(),
#endif
#endif
#if _errsports == "TRUE"
 .FFS_CC_UNDERRUN_2(ffs_cc_underrun_ch2),
 .FFS_CC_OVERRUN_2(ffs_cc_overrun_ch2),
 .FFS_RXFBFIFO_ERROR_2(ffs_rxfbfifo_error_ch2),
 .FFS_TXFBFIFO_ERROR_2(ffs_txfbfifo_error_ch2),
#else
 .FFS_CC_UNDERRUN_2(),
 .FFS_CC_OVERRUN_2(),
 .FFS_RXFBFIFO_ERROR_2(),
 .FFS_TXFBFIFO_ERROR_2(),
#endif
 .FFS_RLOL_2(ffs_rlol_ch2),
 .OOB_OUT_2(oob_out_ch2),
#endif
//CH3
#if _ch3_mode == "DISABLE" 
 .HDINP3(fpsc_vlo),
 .HDINN3(fpsc_vlo),
 .HDOUTP3(),
 .HDOUTN3(),
 .SCISELCH3(fpsc_vlo),
 .SCIENCH3(fpsc_vlo),
 .FF_RXI_CLK_3(fpsc_vlo),
 .FF_TXI_CLK_3(fpsc_vlo),
 .FF_EBRD_CLK_3(fpsc_vlo),
 .FF_RX_F_CLK_3(),
 .FF_RX_H_CLK_3(),
 .FF_RX_Q_CLK_3(),
 .FF_TX_D_3_0(fpsc_vlo),
 .FF_TX_D_3_1(fpsc_vlo),
 .FF_TX_D_3_2(fpsc_vlo),
 .FF_TX_D_3_3(fpsc_vlo),
 .FF_TX_D_3_4(fpsc_vlo),
 .FF_TX_D_3_5(fpsc_vlo),
 .FF_TX_D_3_6(fpsc_vlo),
 .FF_TX_D_3_7(fpsc_vlo),
 .FF_TX_D_3_8(fpsc_vlo),
 .FF_TX_D_3_9(fpsc_vlo),
 .FF_TX_D_3_10(fpsc_vlo),
 .FF_TX_D_3_11(fpsc_vlo),
 .FF_TX_D_3_12(fpsc_vlo),
 .FF_TX_D_3_13(fpsc_vlo),
 .FF_TX_D_3_14(fpsc_vlo),
 .FF_TX_D_3_15(fpsc_vlo),
 .FF_TX_D_3_16(fpsc_vlo),
 .FF_TX_D_3_17(fpsc_vlo),
 .FF_TX_D_3_18(fpsc_vlo),
 .FF_TX_D_3_19(fpsc_vlo),
 .FF_TX_D_3_20(fpsc_vlo),
 .FF_TX_D_3_21(fpsc_vlo),
 .FF_TX_D_3_22(fpsc_vlo),
 .FF_TX_D_3_23(fpsc_vlo),
 .FF_RX_D_3_0(),
 .FF_RX_D_3_1(),
 .FF_RX_D_3_2(),
 .FF_RX_D_3_3(),
 .FF_RX_D_3_4(),
 .FF_RX_D_3_5(),
 .FF_RX_D_3_6(),
 .FF_RX_D_3_7(),
 .FF_RX_D_3_8(),
 .FF_RX_D_3_9(),
 .FF_RX_D_3_10(),
 .FF_RX_D_3_11(),
 .FF_RX_D_3_12(),
 .FF_RX_D_3_13(),
 .FF_RX_D_3_14(),
 .FF_RX_D_3_15(),
 .FF_RX_D_3_16(),
 .FF_RX_D_3_17(),
 .FF_RX_D_3_18(),
 .FF_RX_D_3_19(),
 .FF_RX_D_3_20(),
 .FF_RX_D_3_21(),
 .FF_RX_D_3_22(),
 .FF_RX_D_3_23(),
 .FFC_RRST_3(fpsc_vlo),
 .FFC_SIGNAL_DETECT_3(fpsc_vlo),
 .FFC_SB_PFIFO_LP_3(fpsc_vlo),
 .FFC_SB_INV_RX_3(fpsc_vlo),
 .FFC_PFIFO_CLR_3(fpsc_vlo),
 .FFC_PCIE_CT_3(fpsc_vlo),
 .FFC_PCI_DET_EN_3(fpsc_vlo),
 .FFC_FB_LOOPBACK_3(fpsc_vlo),
 .FFC_ENABLE_CGALIGN_3(fpsc_vlo),
 .FFC_EI_EN_3(fpsc_vlo),
 .FFC_LANE_TX_RST_3(fpsc_vlo),
 .FFC_LANE_RX_RST_3(fpsc_vlo),
 .FFC_TXPWDNB_3(fpsc_vlo),
 .FFC_RXPWDNB_3(fpsc_vlo),
 .FFS_RLOS_LO_3(),
 .FFS_PCIE_DONE_3(),
 .FFS_PCIE_CON_3(),
 .FFS_LS_SYNC_STATUS_3(),
 .FFS_CC_UNDERRUN_3(),
 .FFS_CC_OVERRUN_3(),
 .FFS_RLOL_3(),
 .FFS_RXFBFIFO_ERROR_3(),
 .FFS_TXFBFIFO_ERROR_3(),
 .OOB_OUT_3(),
#else
 .HDINP3(hdinp3),
 .HDINN3(hdinn3),
 .HDOUTP3(hdoutp3),
 .HDOUTN3(hdoutn3),
#if _sci_ports == "TRUE"
 .SCISELCH3(scisel_ch3),
 .SCIENCH3(scien_ch3),
#else
 .SCISELCH3(fpsc_vlo),
 .SCIENCH3(fpsc_vlo),
#endif
 .FF_RXI_CLK_3(ff_rxiclk_ch3),
 .FF_TXI_CLK_3(ff_txiclk_ch3),
 .FF_EBRD_CLK_3(ff_ebrd_clk_3),
 .FF_RX_F_CLK_3(ff_rxfullclk_ch3),
#if _data_width_ch3 == "8" || _data_width_ch3 == "10" && _ch3_ctc_byp == "BYPASS"
 .FF_RX_H_CLK_3(),
#elif _data_width_ch3 == "16" || _data_width_ch3 == "20" && _ch3_ctc_byp == "BYPASS"
 .FF_RX_H_CLK_3(ff_rxhalfclk_ch3),
#endif
#if _pllqclkports == "TRUE"
 .FF_RX_Q_CLK_3(ff_rxqtrclk_ch3),
#else
 .FF_RX_Q_CLK_3(),
#endif
#if _protocol == "PIPE"
 .FF_TX_D_3_0(TxData_ch3[0]),
 .FF_TX_D_3_1(TxData_ch3[1]),
 .FF_TX_D_3_2(TxData_ch3[2]),
 .FF_TX_D_3_3(TxData_ch3[3]),
 .FF_TX_D_3_4(TxData_ch3[4]),
 .FF_TX_D_3_5(TxData_ch3[5]),
 .FF_TX_D_3_6(TxData_ch3[6]),
 .FF_TX_D_3_7(TxData_ch3[7]),
#else
 .FF_TX_D_3_0(ff_txdata_ch3[0]),
 .FF_TX_D_3_1(ff_txdata_ch3[1]),
 .FF_TX_D_3_2(ff_txdata_ch3[2]),
 .FF_TX_D_3_3(ff_txdata_ch3[3]),
 .FF_TX_D_3_4(ff_txdata_ch3[4]),
 .FF_TX_D_3_5(ff_txdata_ch3[5]),
 .FF_TX_D_3_6(ff_txdata_ch3[6]),
 .FF_TX_D_3_7(ff_txdata_ch3[7]),
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_TX_D_3_8(ff_tx_k_cntrl_ch3),
#else
 .FF_TX_D_3_8(ff_tx_k_cntrl_ch3[0]),
#endif
#elif _protocol == "XAUI"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_TX_D_3_8(ff_txc_ch3),
#else
 .FF_TX_D_3_8(ff_txc_ch3[0]),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_TX_D_3_8(TxDataK_ch3),
#else
 .FF_TX_D_3_8(TxDataK_ch3[0]),
#endif
#elif _protocol == "8BSER"
 .FF_TX_D_3_8(fpsc_vlo),
#else
 .FF_TX_D_3_8(ff_txdata_ch3[8]),
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_TX_D_3_9(ff_force_disp_ch3),
#else
 .FF_TX_D_3_9(ff_force_disp_ch3[0]),
#endif
#elif _protocol == "10BSER" || _protocol == "USERDEF" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" 
 .FF_TX_D_3_9(ff_txdata_ch3[9]),
#else
 .FF_TX_D_3_9(fpsc_vlo),
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_TX_D_3_10(ff_disp_sel_ch3),
#else
 .FF_TX_D_3_10(ff_disp_sel_ch3[0]),
#endif
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_TX_D_3_10(ff_xmit_ch3),
#else
 .FF_TX_D_3_10(ff_xmit_ch3[0]),
#endif
#elif _protocol == "USERDEF"
 .FF_TX_D_3_10(ff_txdata_ch3[10]),
#else
 .FF_TX_D_3_10(fpsc_vlo),
#endif
#if _protocol == "PCIE" || _protocol == "PIPE"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_TX_D_3_11(ff_pci_ei_en_ch3),
#else
 .FF_TX_D_3_11(ff_pci_ei_en_ch3[0]),
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_TX_D_3_11(ff_correct_disp_ch3),
#else
 .FF_TX_D_3_11(ff_correct_disp_ch3[0]),
#endif
#elif _protocol == "USERDEF"
 .FF_TX_D_3_11(ff_txdata_ch3[11]),
#else
 .FF_TX_D_3_11(fpsc_vlo),
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_3_12(ff_txdata_ch3[12]),
#elif _protocol == "PIPE"
 .FF_TX_D_3_12(TxData_ch3[8]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_3_12(ff_txdata_ch3[10]),
#else
 .FF_TX_D_3_12(ff_txdata_ch3[8]),
#endif
#else
 .FF_TX_D_3_12(fpsc_vlo),
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_3_13(ff_txdata_ch3[13]),
#elif _protocol == "PIPE"
 .FF_TX_D_3_13(TxData_ch3[9]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_3_13(ff_txdata_ch3[11]),
#else
 .FF_TX_D_3_13(ff_txdata_ch3[9]),
#endif
#else
 .FF_TX_D_3_13(fpsc_vlo),
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_3_14(ff_txdata_ch3[14]),
#elif _protocol == "PIPE"
 .FF_TX_D_3_14(TxData_ch3[10]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_3_14(ff_txdata_ch3[12]),
#else
 .FF_TX_D_3_14(ff_txdata_ch3[10]),
#endif
#else
 .FF_TX_D_3_14(fpsc_vlo),
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_3_15(ff_txdata_ch3[15]),
#elif _protocol == "PIPE"
 .FF_TX_D_3_15(TxData_ch3[11]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_3_15(ff_txdata_ch3[13]),
#else
 .FF_TX_D_3_15(ff_txdata_ch3[11]),
#endif
#else
 .FF_TX_D_3_15(fpsc_vlo),
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_3_16(ff_txdata_ch3[16]),
#elif _protocol == "PIPE"
 .FF_TX_D_3_16(TxData_ch3[12]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_3_16(ff_txdata_ch3[14]),
#else
 .FF_TX_D_3_16(ff_txdata_ch3[12]),
#endif
#else
 .FF_TX_D_3_16(fpsc_vlo),
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_3_17(ff_txdata_ch3[17]),
#elif _protocol == "PIPE"
 .FF_TX_D_3_17(TxData_ch3[13]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_3_17(ff_txdata_ch3[15]),
#else
 .FF_TX_D_3_17(ff_txdata_ch3[13]),
#endif
#else
 .FF_TX_D_3_17(fpsc_vlo),
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_3_18(ff_txdata_ch3[18]),
#elif _protocol == "PIPE"
 .FF_TX_D_3_18(TxData_ch3[14]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_3_18(ff_txdata_ch3[16]),
#else
 .FF_TX_D_3_18(ff_txdata_ch3[14]),
#endif
#else
 .FF_TX_D_3_18(fpsc_vlo),
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_3_19(ff_txdata_ch3[19]),
#elif _protocol == "PIPE"
 .FF_TX_D_3_19(TxData_ch3[15]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_TX_D_3_19(ff_txdata_ch3[17]),
#else
 .FF_TX_D_3_19(ff_txdata_ch3[15]),
#endif
#else
 .FF_TX_D_3_19(fpsc_vlo),
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_3_20(ff_txdata_ch3[20]),
#elif _protocol == "XAUI"
 .FF_TX_D_3_20(ff_txc_ch3[1]),
#elif _protocol == "PIPE"
 .FF_TX_D_3_20(TxDataK_ch3[1]),
#elif _protocol == "8BSER"
 .FF_TX_D_3_20(fpsc_vlo),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_TX_D_3_20(ff_txdata_ch3[18]),
#else
 .FF_TX_D_3_20(ff_tx_k_cntrl_ch3[1]),
#endif
#else
 .FF_TX_D_3_20(fpsc_vlo),
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_3_21(ff_txdata_ch3[21]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER"
 .FF_TX_D_3_21(ff_txdata_ch3[19]),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
 .FF_TX_D_3_21(ff_force_disp_ch3[1]),
#else
 .FF_TX_D_3_21(fpsc_vlo),
#endif
#else
 .FF_TX_D_3_21(fpsc_vlo),
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_3_22(ff_txdata_ch3[22]),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
 .FF_TX_D_3_22(ff_xmit_ch3[1]),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
 .FF_TX_D_3_22(ff_disp_sel_ch3[1]),
#else
 .FF_TX_D_3_22(fpsc_vlo),
#endif
#else
 .FF_TX_D_3_22(fpsc_vlo),
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
 .FF_TX_D_3_23(ff_txdata_ch3[23]),
#elif _protocol == "PCIE" || _protocol == "PIPE"
 .FF_TX_D_3_23(ff_pci_ei_en_ch3[1]),
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
 .FF_TX_D_3_23(ff_correct_disp_ch3[1]),
#else
 .FF_TX_D_3_23(fpsc_vlo),
#endif
#else
 .FF_TX_D_3_23(fpsc_vlo),
#endif
#if _protocol == "PIPE"
 .FF_RX_D_3_0(RxData_ch3[0]),
 .FF_RX_D_3_1(RxData_ch3[1]),
 .FF_RX_D_3_2(RxData_ch3[2]),
 .FF_RX_D_3_3(RxData_ch3[3]),
 .FF_RX_D_3_4(RxData_ch3[4]),
 .FF_RX_D_3_5(RxData_ch3[5]),
 .FF_RX_D_3_6(RxData_ch3[6]),
 .FF_RX_D_3_7(RxData_ch3[7]),
#else
 .FF_RX_D_3_0(ff_rxdata_ch3[0]),
 .FF_RX_D_3_1(ff_rxdata_ch3[1]),
 .FF_RX_D_3_2(ff_rxdata_ch3[2]),
 .FF_RX_D_3_3(ff_rxdata_ch3[3]),
 .FF_RX_D_3_4(ff_rxdata_ch3[4]),
 .FF_RX_D_3_5(ff_rxdata_ch3[5]),
 .FF_RX_D_3_6(ff_rxdata_ch3[6]),
 .FF_RX_D_3_7(ff_rxdata_ch3[7]),
#endif
#if _protocol == "XAUI"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_8(ff_rxc_ch3),
#else
 .FF_RX_D_3_8(ff_rxc_ch3[0]),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_8(RxDataK_ch3),
#else
 .FF_RX_D_3_8(RxDataK_ch3[0]),
#endif
#elif _protocol == "8BSER"
 .FF_RX_D_3_8(),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
 .FF_RX_D_3_8(ff_rxdata_ch3[8]),
#else
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_8(ff_rx_k_cntrl_ch3),
#else
 .FF_RX_D_3_8(ff_rx_k_cntrl_ch3[0]),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_9(ff_rxstatus0_ch3),
#else
 .FF_RX_D_3_9(ff_rxstatus0_ch3[0]),
#endif
#elif _protocol == "PIPE"
 .FF_RX_D_3_9(RxStatus0_ch3[0]),
#elif _protocol == "8BSER" 
 .FF_RX_D_3_9(),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
 .FF_RX_D_3_9(ff_rxdata_ch3[9]),
#else
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_9(ff_disp_err_ch3),
#else
 .FF_RX_D_3_9(ff_disp_err_ch3[0]),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_10(ff_rxstatus1_ch3),
#else
 .FF_RX_D_3_10(ff_rxstatus1_ch3[0]),
#endif
#elif _protocol == "PIPE"
 .FF_RX_D_3_10(RxStatus0_ch3[1]),
#elif _protocol == "USERDEF"
 .FF_RX_D_3_10(ff_rxdata_ch3[10]),
#elif _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_3_10(),
#else
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_10(ff_cv_ch3),
#else
 .FF_RX_D_3_10(ff_cv_ch3[0]),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_11(ff_rxstatus2_ch3),
#else
 .FF_RX_D_3_11(ff_rxstatus2_ch3[0]),
#endif
#elif _protocol == "PIPE"
 .FF_RX_D_3_11(RxStatus0_ch3[2]),
#elif _protocol == "USERDEF"
 .FF_RX_D_3_11(ff_rxdata_ch3[11]),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_11(ff_rx_even_ch3),
#else
 .FF_RX_D_3_11(ff_rx_even_ch3[0]),
#endif
#else
 .FF_RX_D_3_11(),
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_12(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_3_12(ff_rxdata_ch3[10]),
#elif _protocol == "USERDEF"
 .FF_RX_D_3_12(ff_rxdata_ch3[12]),
#elif _protocol == "PIPE"
 .FF_RX_D_3_12(RxData_ch3[8]),
#else
 .FF_RX_D_3_12(ff_rxdata_ch3[8]),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_13(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_3_13(ff_rxdata_ch3[11]),
#elif _protocol == "USERDEF"
 .FF_RX_D_3_13(ff_rxdata_ch3[13]),
#elif _protocol == "PIPE"
 .FF_RX_D_3_13(RxData_ch3[9]),
#else
 .FF_RX_D_3_13(ff_rxdata_ch3[9]),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_14(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_3_14(ff_rxdata_ch3[12]),
#elif _protocol == "USERDEF"
 .FF_RX_D_3_14(ff_rxdata_ch3[14]),
#elif _protocol == "PIPE"
 .FF_RX_D_3_14(RxData_ch3[10]),
#else
 .FF_RX_D_3_14(ff_rxdata_ch3[10]),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_15(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_3_15(ff_rxdata_ch3[13]),
#elif _protocol == "USERDEF"
 .FF_RX_D_3_15(ff_rxdata_ch3[15]),
#elif _protocol == "PIPE"
 .FF_RX_D_3_15(RxData_ch3[11]),
#else
 .FF_RX_D_3_15(ff_rxdata_ch3[11]),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_16(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_3_16(ff_rxdata_ch3[14]),
#elif _protocol == "USERDEF"
 .FF_RX_D_3_16(ff_rxdata_ch3[16]),
#elif _protocol == "PIPE"
 .FF_RX_D_3_16(RxData_ch3[12]),
#else
 .FF_RX_D_3_16(ff_rxdata_ch3[12]),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_17(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_3_17(ff_rxdata_ch3[15]),
#elif _protocol == "USERDEF"
 .FF_RX_D_3_17(ff_rxdata_ch3[17]),
#elif _protocol == "PIPE"
 .FF_RX_D_3_17(RxData_ch3[13]),
#else
 .FF_RX_D_3_17(ff_rxdata_ch3[13]),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_18(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_3_18(ff_rxdata_ch3[16]),
#elif _protocol == "USERDEF"
 .FF_RX_D_3_18(ff_rxdata_ch3[18]),
#elif _protocol == "PIPE"
 .FF_RX_D_3_18(RxData_ch3[14]),
#else
 .FF_RX_D_3_18(ff_rxdata_ch3[14]),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_19(),
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
 .FF_RX_D_3_19(ff_rxdata_ch3[17]),
#elif _protocol == "USERDEF"
 .FF_RX_D_3_19(ff_rxdata_ch3[19]),
#elif _protocol == "PIPE"
 .FF_RX_D_3_19(RxData_ch3[15]),
#else
 .FF_RX_D_3_19(ff_rxdata_ch3[15]),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_20(),
#else
#if _protocol == "8BSER"
 .FF_RX_D_3_20(),
#elif _protocol == "USERDEF"
 .FF_RX_D_3_20(ff_rxdata_ch3[20]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_3_20(ff_rxdata_ch3[18]),
#elif _protocol == "XAUI"
 .FF_RX_D_3_20(ff_rxc_ch3[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_3_20(RxDataK_ch3[1]),
#else
 .FF_RX_D_3_20(ff_rx_k_cntrl_ch3[1]),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_21(),
#else
#if _protocol == "8BSER" 
 .FF_RX_D_3_21(),
#elif _protocol == "USERDEF"
 .FF_RX_D_3_21(ff_rxdata_ch3[21]),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_3_21(ff_rxdata_ch3[19]),
#elif _protocol == "PCIE"
 .FF_RX_D_3_21(ff_rxstatus0_ch3[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_3_21(RxStatus1_ch3[0]),
#else
 .FF_RX_D_3_21(ff_disp_err_ch3[1]),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_22(),
#else
#if _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
 .FF_RX_D_3_22(),
#elif _protocol == "USERDEF"
 .FF_RX_D_3_22(ff_rxdata_ch3[22]),
#elif _protocol == "PCIE" 
 .FF_RX_D_3_22(ff_rxstatus1_ch3[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_3_22(RxStatus1_ch3[1]),
#else
 .FF_RX_D_3_22(ff_cv_ch3[1]),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
 .FF_RX_D_3_23(),
#else
#if _protocol == "GIGE" || _protocol == "OBSAI" 
 .FF_RX_D_3_23(ff_rx_even_ch3[1]),
#elif _protocol == "USERDEF"
 .FF_RX_D_3_23(ff_rxdata_ch3[23]),
#elif _protocol == "PCIE" 
 .FF_RX_D_3_23(ff_rxstatus2_ch3[1]),
#elif _protocol == "PIPE"
 .FF_RX_D_3_23(RxStatus1_ch3[2]),
#else
 .FF_RX_D_3_23(),
#endif
#endif
 .FFC_RRST_3(ffc_rrst_ch3),
#if _ch3_elsm == "TRUE"
 .FFC_SIGNAL_DETECT_3(ffc_signal_detect_ch3),
 .FFC_ENABLE_CGALIGN_3(ffc_enable_cgalign_ch3),
#else
 .FFC_SIGNAL_DETECT_3(fpsc_vlo),
 .FFC_ENABLE_CGALIGN_3(fpsc_vlo),
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
 .FFC_SB_PFIFO_LP_3(fpsc_vlo),
 .FFC_PFIFO_CLR_3(ffc_pfifo_clr_ch3),
 .FFC_FB_LOOPBACK_3(fpsc_vlo),
#elif _lbtype == "PCS Parallel Loopback"
 .FFC_SB_PFIFO_LP_3(fpsc_vlo),
 .FFC_PFIFO_CLR_3(fpsc_vlo),
#if _protocol != "PIPE"
 .FFC_FB_LOOPBACK_3(fpsc_vlo),
#else
 .FFC_FB_LOOPBACK_3(fpsc_vlo),
#endif
#else
 .FFC_SB_PFIFO_LP_3(fpsc_vlo),
 .FFC_PFIFO_CLR_3(fpsc_vlo),
 .FFC_FB_LOOPBACK_3(fpsc_vlo),
#endif
#else
 .FFC_SB_PFIFO_LP_3(fpsc_vlo),
 .FFC_PFIFO_CLR_3(fpsc_vlo),
 .FFC_FB_LOOPBACK_3(fpsc_vlo),
#endif
#if _ch3_ird == "TRUE"
#if _protocol == "PIPE"
 .FFC_SB_INV_RX_3(),
#else
 .FFC_SB_INV_RX_3(ffc_sb_inv_rx_ch3),
#endif
#else
 .FFC_SB_INV_RX_3(fpsc_vlo),
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
 .FFC_PCIE_CT_3(ffc_pcie_ct_ch3),
 .FFC_PCI_DET_EN_3(ffc_pci_det_en_ch3),
 .FFS_PCIE_DONE_3(ffs_pcie_done_ch3),
 .FFS_PCIE_CON_3(ffs_pcie_con_ch3),
#elif _protocol == "PIPE"
 .FFC_PCIE_CT_3(),
 .FFC_PCI_DET_EN_3(),
 .FFS_PCIE_DONE_3(),
 .FFS_PCIE_CON_3(),
#else
 .FFC_PCIE_CT_3(fpsc_vlo),
 .FFC_PCI_DET_EN_3(fpsc_vlo),
 .FFS_PCIE_DONE_3(),
 .FFS_PCIE_CON_3(),
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch3_teidle == "TRUE")
 .FFC_EI_EN_3(ffc_ei_en_ch3),
#else
 .FFC_EI_EN_3(fpsc_vlo),
#endif
 .FFC_LANE_TX_RST_3(ffc_lane_tx_rst_ch3),
 .FFC_LANE_RX_RST_3(ffc_lane_rx_rst_ch3),
 .FFC_TXPWDNB_3(ffc_txpwdnb_ch3),
 .FFC_RXPWDNB_3(ffc_rxpwdnb_ch3),
#if _protocol == "PIPE"
 .FFS_RLOS_LO_3(),
#elif _protocol == "SATA_I"
 .FFS_RLOS_LO_3(ffs_sata_oob_rx_ch3),
#else
 .FFS_RLOS_LO_3(ffs_rlos_lo_ch3),
#endif
#if _protocol == "8BSER"
 .FFS_LS_SYNC_STATUS_3(),
#else
#if _comma_align == "AUTO"
 .FFS_LS_SYNC_STATUS_3(ffs_ls_sync_status_ch3),
#else
 .FFS_LS_SYNC_STATUS_3(),
#endif
#endif
#if _errsports == "TRUE"
 .FFS_CC_UNDERRUN_3(ffs_cc_underrun_ch3),
 .FFS_CC_OVERRUN_3(ffs_cc_overrun_ch3),
 .FFS_RXFBFIFO_ERROR_3(ffs_rxfbfifo_error_ch3),
 .FFS_TXFBFIFO_ERROR_3(ffs_txfbfifo_error_ch3),
#else
 .FFS_CC_UNDERRUN_3(),
 .FFS_CC_OVERRUN_3(),
 .FFS_RXFBFIFO_ERROR_3(),
 .FFS_TXFBFIFO_ERROR_3(),
#endif
 .FFS_RLOL_3(ffs_rlol_ch3),
 .OOB_OUT_3(oob_out_ch3),
#endif
// SCI PINS
#if _sci_ports == "TRUE"
 .SCIWDATA0(sciwritedata[0]),
 .SCIWDATA1(sciwritedata[1]),
 .SCIWDATA2(sciwritedata[2]),
 .SCIWDATA3(sciwritedata[3]),
 .SCIWDATA4(sciwritedata[4]),
 .SCIWDATA5(sciwritedata[5]),
 .SCIWDATA6(sciwritedata[6]),
 .SCIWDATA7(sciwritedata[7]),
 .SCIADDR0(sciaddress[0]),
 .SCIADDR1(sciaddress[1]),
 .SCIADDR2(sciaddress[2]),
 .SCIADDR3(sciaddress[3]),
 .SCIADDR4(sciaddress[4]),
 .SCIADDR5(sciaddress[5]),
 .SCIRDATA0(scireaddata[0]),
 .SCIRDATA1(scireaddata[1]),
 .SCIRDATA2(scireaddata[2]),
 .SCIRDATA3(scireaddata[3]),
 .SCIRDATA4(scireaddata[4]),
 .SCIRDATA5(scireaddata[5]),
 .SCIRDATA6(scireaddata[6]),
 .SCIRDATA7(scireaddata[7]),
 .SCIENAUX(scienaux),
 .SCISELAUX(sciselaux),
 .SCIRD(scird),
 .SCIWSTN(sciwstn),
 .CYAWSTN(cyawstn),
#if _sci_int_port == "TRUE"
 .SCIINT(sciinterrupt),
#else
 .SCIINT(),
#endif
#else
 .SCIWDATA0(fpsc_vlo),
 .SCIWDATA1(fpsc_vlo),
 .SCIWDATA2(fpsc_vlo),
 .SCIWDATA3(fpsc_vlo),
 .SCIWDATA4(fpsc_vlo),
 .SCIWDATA5(fpsc_vlo),
 .SCIWDATA6(fpsc_vlo),
 .SCIWDATA7(fpsc_vlo),
 .SCIADDR0(fpsc_vlo),
 .SCIADDR1(fpsc_vlo),
 .SCIADDR2(fpsc_vlo),
 .SCIADDR3(fpsc_vlo),
 .SCIADDR4(fpsc_vlo),
 .SCIADDR5(fpsc_vlo),
 .SCIRDATA0(),
 .SCIRDATA1(),
 .SCIRDATA2(),
 .SCIRDATA3(),
 .SCIRDATA4(),
 .SCIRDATA5(),
 .SCIRDATA6(),
 .SCIRDATA7(),
 .SCIENAUX(fpsc_vlo),
 .SCISELAUX(fpsc_vlo),
 .SCIRD(fpsc_vlo),
 .SCIWSTN(fpsc_vlo),
 .CYAWSTN(fpsc_vlo),
 .SCIINT(),
#endif
 .FFC_MACRO_RST(ffc_macro_rst),
 .FFC_QUAD_RST(ffc_quad_rst),
 .FFC_TRST(ffc_trst),
 .FF_TX_F_CLK(ff_txfullclk),
 .FF_TX_H_CLK(ff_txhalfclk),
#if _pllqclkports == "TRUE"
 .FF_TX_Q_CLK(ff_txqtrclk),
#else
 .FF_TX_Q_CLK(),
#endif
#if _refck2core == "TRUE"
 .REFCK2CORE(refck2core),
#else
 .REFCK2CORE(),
#endif
 .CIN0(fpsc_vlo),
 .CIN1(fpsc_vlo),
 .CIN2(fpsc_vlo),
 .CIN3(fpsc_vlo),
 .CIN4(fpsc_vlo),
 .CIN5(fpsc_vlo),
 .CIN6(fpsc_vlo),
 .CIN7(fpsc_vlo),
 .CIN8(fpsc_vlo),
 .CIN9(fpsc_vlo),
 .CIN10(fpsc_vlo),
 .CIN11(fpsc_vlo),
 .COUT0(cout[0]),
 .COUT1(cout[1]),
 .COUT2(cout[2]),
 .COUT3(cout[3]),
 .COUT4(cout[4]),
 .COUT5(cout[5]),
 .COUT6(cout[6]),
 .COUT7(cout[7]),
 .COUT8(cout[8]),
 .COUT9(cout[9]),
 .COUT10(cout[10]),
 .COUT11(cout[11]),
 .COUT12(cout[12]),
 .COUT13(cout[13]),
 .COUT14(cout[14]),
 .COUT15(cout[15]),
 .COUT16(cout[16]),
 .COUT17(cout[17]),
 .COUT18(cout[18]),
#if _protocol == "CPRI"
 .COUT19(ff_txser_clk),
#else
 .COUT19(cout[19]),
#endif
 .FFS_PLOL(ffs_plol)
 )  
  STARTCOM synthesis CONFIG_FILE=#_circuit_name_new ENDCOM 
  STARTCOM synthesis FREQUENCY_PIN_FF_RX_F_CLK_0=#_ch0_rx_ficlk_rate ENDCOM 
  STARTCOM synthesis FREQUENCY_PIN_FF_RX_F_CLK_1=#_ch1_rx_ficlk_rate ENDCOM 
  STARTCOM synthesis FREQUENCY_PIN_FF_RX_F_CLK_2=#_ch2_rx_ficlk_rate ENDCOM 
  STARTCOM synthesis FREQUENCY_PIN_FF_RX_F_CLK_3=#_ch3_rx_ficlk_rate ENDCOM 
  STARTCOM synthesis FREQUENCY_PIN_FF_RX_H_CLK_0=#_ch0_rx_hiclk_rate ENDCOM 
  STARTCOM synthesis FREQUENCY_PIN_FF_RX_H_CLK_1=#_ch1_rx_hiclk_rate ENDCOM 
  STARTCOM synthesis FREQUENCY_PIN_FF_RX_H_CLK_2=#_ch2_rx_hiclk_rate ENDCOM 
  STARTCOM synthesis FREQUENCY_PIN_FF_RX_H_CLK_3=#_ch3_rx_hiclk_rate ENDCOM 
  STARTCOM synthesis FREQUENCY_PIN_FF_TX_F_CLK=#_tx_ficlk_rate ENDCOM 
  STARTCOM synthesis FREQUENCY_PIN_FF_TX_H_CLK=#_tx_hiclk_rate ENDCOM;

SLASH2 exemplar begin
SLASH2 exemplar attribute pcsc_inst CONFIG_FILE  _circuit_name_new
SLASH2 exemplar attribute pcsc_inst FREQUENCY_PIN_FF_RX_F_CLK_0  _ch0_rx_ficlk_rate
SLASH2 exemplar attribute pcsc_inst FREQUENCY_PIN_FF_RX_F_CLK_1  _ch0_rx_ficlk_rate
SLASH2 exemplar attribute pcsc_inst FREQUENCY_PIN_FF_RX_F_CLK_2  _ch0_rx_ficlk_rate
SLASH2 exemplar attribute pcsc_inst FREQUENCY_PIN_FF_RX_F_CLK_3  _ch0_rx_ficlk_rate
SLASH2 exemplar attribute pcsc_inst FREQUENCY_PIN_FF_RX_H_CLK_0  _ch0_rx_hiclk_rate
SLASH2 exemplar attribute pcsc_inst FREQUENCY_PIN_FF_RX_H_CLK_1  _ch0_rx_hiclk_rate
SLASH2 exemplar attribute pcsc_inst FREQUENCY_PIN_FF_RX_H_CLK_2  _ch0_rx_hiclk_rate
SLASH2 exemplar attribute pcsc_inst FREQUENCY_PIN_FF_RX_H_CLK_3  _ch0_rx_hiclk_rate
SLASH2 exemplar attribute pcsc_inst FREQUENCY_PIN_FF_TX_F_CLK  _tx_ficlk_rate
SLASH2 exemplar attribute pcsc_inst FREQUENCY_PIN_FF_TX_H_CLK  _tx_hiclk_rate
SLASH2 exemplar end

endmodule


//synopsys translate_off

`timescale 1ns / 1 ps

module PCSC (
    HDINN0,
    HDINN1,
    HDINN2,
    HDINN3,
    HDINP0,
    HDINP1,
    HDINP2,
    HDINP3,
    REFCLKN,
    REFCLKP,
    CIN0,
    CIN1,
    CIN2,
    CIN3,
    CIN4,
    CIN5,
    CIN6,
    CIN7,
    CIN8,
    CIN9,
    CIN10,
    CIN11,
    CYAWSTN,
    FF_EBRD_CLK_0,
    FF_EBRD_CLK_1,
    FF_EBRD_CLK_2,
    FF_EBRD_CLK_3,
    FF_RXI_CLK_0,
    FF_RXI_CLK_1,
    FF_RXI_CLK_2,
    FF_RXI_CLK_3,
    FF_TX_D_0_0,
    FF_TX_D_0_1,
    FF_TX_D_0_2,
    FF_TX_D_0_3,
    FF_TX_D_0_4,
    FF_TX_D_0_5,
    FF_TX_D_0_6,
    FF_TX_D_0_7,
    FF_TX_D_0_8,
    FF_TX_D_0_9,
    FF_TX_D_0_10,
    FF_TX_D_0_11,
    FF_TX_D_0_12,
    FF_TX_D_0_13,
    FF_TX_D_0_14,
    FF_TX_D_0_15,
    FF_TX_D_0_16,
    FF_TX_D_0_17,
    FF_TX_D_0_18,
    FF_TX_D_0_19,
    FF_TX_D_0_20,
    FF_TX_D_0_21,
    FF_TX_D_0_22,
    FF_TX_D_0_23,
    FF_TX_D_1_0,
    FF_TX_D_1_1,
    FF_TX_D_1_2,
    FF_TX_D_1_3,
    FF_TX_D_1_4,
    FF_TX_D_1_5,
    FF_TX_D_1_6,
    FF_TX_D_1_7,
    FF_TX_D_1_8,
    FF_TX_D_1_9,
    FF_TX_D_1_10,
    FF_TX_D_1_11,
    FF_TX_D_1_12,
    FF_TX_D_1_13,
    FF_TX_D_1_14,
    FF_TX_D_1_15,
    FF_TX_D_1_16,
    FF_TX_D_1_17,
    FF_TX_D_1_18,
    FF_TX_D_1_19,
    FF_TX_D_1_20,
    FF_TX_D_1_21,
    FF_TX_D_1_22,
    FF_TX_D_1_23,
    FF_TX_D_2_0,
    FF_TX_D_2_1,
    FF_TX_D_2_2,
    FF_TX_D_2_3,
    FF_TX_D_2_4,
    FF_TX_D_2_5,
    FF_TX_D_2_6,
    FF_TX_D_2_7,
    FF_TX_D_2_8,
    FF_TX_D_2_9,
    FF_TX_D_2_10,
    FF_TX_D_2_11,
    FF_TX_D_2_12,
    FF_TX_D_2_13,
    FF_TX_D_2_14,
    FF_TX_D_2_15,
    FF_TX_D_2_16,
    FF_TX_D_2_17,
    FF_TX_D_2_18,
    FF_TX_D_2_19,
    FF_TX_D_2_20,
    FF_TX_D_2_21,
    FF_TX_D_2_22,
    FF_TX_D_2_23,
    FF_TX_D_3_0,
    FF_TX_D_3_1,
    FF_TX_D_3_2,
    FF_TX_D_3_3,
    FF_TX_D_3_4,
    FF_TX_D_3_5,
    FF_TX_D_3_6,
    FF_TX_D_3_7,
    FF_TX_D_3_8,
    FF_TX_D_3_9,
    FF_TX_D_3_10,
    FF_TX_D_3_11,
    FF_TX_D_3_12,
    FF_TX_D_3_13,
    FF_TX_D_3_14,
    FF_TX_D_3_15,
    FF_TX_D_3_16,
    FF_TX_D_3_17,
    FF_TX_D_3_18,
    FF_TX_D_3_19,
    FF_TX_D_3_20,
    FF_TX_D_3_21,
    FF_TX_D_3_22,
    FF_TX_D_3_23,
    FF_TXI_CLK_0,
    FF_TXI_CLK_1,
    FF_TXI_CLK_2,
    FF_TXI_CLK_3,
    FFC_CK_CORE_RX,
    FFC_CK_CORE_TX,
    FFC_EI_EN_0,
    FFC_EI_EN_1,
    FFC_EI_EN_2,
    FFC_EI_EN_3,
    FFC_ENABLE_CGALIGN_0,
    FFC_ENABLE_CGALIGN_1,
    FFC_ENABLE_CGALIGN_2,
    FFC_ENABLE_CGALIGN_3,
    FFC_FB_LOOPBACK_0,
    FFC_FB_LOOPBACK_1,
    FFC_FB_LOOPBACK_2,
    FFC_FB_LOOPBACK_3,
    FFC_LANE_RX_RST_0,
    FFC_LANE_RX_RST_1,
    FFC_LANE_RX_RST_2,
    FFC_LANE_RX_RST_3,
    FFC_LANE_TX_RST_0,
    FFC_LANE_TX_RST_1,
    FFC_LANE_TX_RST_2,
    FFC_LANE_TX_RST_3,
    FFC_MACRO_RST,
    FFC_PCI_DET_EN_0,
    FFC_PCI_DET_EN_1,
    FFC_PCI_DET_EN_2,
    FFC_PCI_DET_EN_3,
    FFC_PCIE_CT_0,
    FFC_PCIE_CT_1,
    FFC_PCIE_CT_2,
    FFC_PCIE_CT_3,
    FFC_PFIFO_CLR_0,
    FFC_PFIFO_CLR_1,
    FFC_PFIFO_CLR_2,
    FFC_PFIFO_CLR_3,
    FFC_QUAD_RST,
    FFC_RRST_0,
    FFC_RRST_1,
    FFC_RRST_2,
    FFC_RRST_3,
    FFC_RXPWDNB_0,
    FFC_RXPWDNB_1,
    FFC_RXPWDNB_2,
    FFC_RXPWDNB_3,
    FFC_SB_INV_RX_0,
    FFC_SB_INV_RX_1,
    FFC_SB_INV_RX_2,
    FFC_SB_INV_RX_3,
    FFC_SB_PFIFO_LP_0,
    FFC_SB_PFIFO_LP_1,
    FFC_SB_PFIFO_LP_2,
    FFC_SB_PFIFO_LP_3,
    FFC_SIGNAL_DETECT_0,
    FFC_SIGNAL_DETECT_1,
    FFC_SIGNAL_DETECT_2,
    FFC_SIGNAL_DETECT_3,
    FFC_TRST,
    FFC_TXPWDNB_0,
    FFC_TXPWDNB_1,
    FFC_TXPWDNB_2,
    FFC_TXPWDNB_3,
    SCIADDR0,
    SCIADDR1,
    SCIADDR2,
    SCIADDR3,
    SCIADDR4,
    SCIADDR5,
    SCIENAUX,
    SCIENCH0,
    SCIENCH1,
    SCIENCH2,
    SCIENCH3,
    SCIRD,
    SCISELAUX,
    SCISELCH0,
    SCISELCH1,
    SCISELCH2,
    SCISELCH3,
    SCIWDATA0,
    SCIWDATA1,
    SCIWDATA2,
    SCIWDATA3,
    SCIWDATA4,
    SCIWDATA5,
    SCIWDATA6,
    SCIWDATA7,
    SCIWSTN,
    HDOUTN0,
    HDOUTN1,
    HDOUTN2,
    HDOUTN3,
    HDOUTP0,
    HDOUTP1,
    HDOUTP2,
    HDOUTP3,
    COUT0,
    COUT1,
    COUT2,
    COUT3,
    COUT4,
    COUT5,
    COUT6,
    COUT7,
    COUT8,
    COUT9,
    COUT10,
    COUT11,
    COUT12,
    COUT13,
    COUT14,
    COUT15,
    COUT16,
    COUT17,
    COUT18,
    COUT19,
    FF_RX_D_0_0,
    FF_RX_D_0_1,
    FF_RX_D_0_2,
    FF_RX_D_0_3,
    FF_RX_D_0_4,
    FF_RX_D_0_5,
    FF_RX_D_0_6,
    FF_RX_D_0_7,
    FF_RX_D_0_8,
    FF_RX_D_0_9,
    FF_RX_D_0_10,
    FF_RX_D_0_11,
    FF_RX_D_0_12,
    FF_RX_D_0_13,
    FF_RX_D_0_14,
    FF_RX_D_0_15,
    FF_RX_D_0_16,
    FF_RX_D_0_17,
    FF_RX_D_0_18,
    FF_RX_D_0_19,
    FF_RX_D_0_20,
    FF_RX_D_0_21,
    FF_RX_D_0_22,
    FF_RX_D_0_23,
    FF_RX_D_1_0,
    FF_RX_D_1_1,
    FF_RX_D_1_2,
    FF_RX_D_1_3,
    FF_RX_D_1_4,
    FF_RX_D_1_5,
    FF_RX_D_1_6,
    FF_RX_D_1_7,
    FF_RX_D_1_8,
    FF_RX_D_1_9,
    FF_RX_D_1_10,
    FF_RX_D_1_11,
    FF_RX_D_1_12,
    FF_RX_D_1_13,
    FF_RX_D_1_14,
    FF_RX_D_1_15,
    FF_RX_D_1_16,
    FF_RX_D_1_17,
    FF_RX_D_1_18,
    FF_RX_D_1_19,
    FF_RX_D_1_20,
    FF_RX_D_1_21,
    FF_RX_D_1_22,
    FF_RX_D_1_23,
    FF_RX_D_2_0,
    FF_RX_D_2_1,
    FF_RX_D_2_2,
    FF_RX_D_2_3,
    FF_RX_D_2_4,
    FF_RX_D_2_5,
    FF_RX_D_2_6,
    FF_RX_D_2_7,
    FF_RX_D_2_8,
    FF_RX_D_2_9,
    FF_RX_D_2_10,
    FF_RX_D_2_11,
    FF_RX_D_2_12,
    FF_RX_D_2_13,
    FF_RX_D_2_14,
    FF_RX_D_2_15,
    FF_RX_D_2_16,
    FF_RX_D_2_17,
    FF_RX_D_2_18,
    FF_RX_D_2_19,
    FF_RX_D_2_20,
    FF_RX_D_2_21,
    FF_RX_D_2_22,
    FF_RX_D_2_23,
    FF_RX_D_3_0,
    FF_RX_D_3_1,
    FF_RX_D_3_2,
    FF_RX_D_3_3,
    FF_RX_D_3_4,
    FF_RX_D_3_5,
    FF_RX_D_3_6,
    FF_RX_D_3_7,
    FF_RX_D_3_8,
    FF_RX_D_3_9,
    FF_RX_D_3_10,
    FF_RX_D_3_11,
    FF_RX_D_3_12,
    FF_RX_D_3_13,
    FF_RX_D_3_14,
    FF_RX_D_3_15,
    FF_RX_D_3_16,
    FF_RX_D_3_17,
    FF_RX_D_3_18,
    FF_RX_D_3_19,
    FF_RX_D_3_20,
    FF_RX_D_3_21,
    FF_RX_D_3_22,
    FF_RX_D_3_23,
    FF_RX_F_CLK_0,
    FF_RX_F_CLK_1,
    FF_RX_F_CLK_2,
    FF_RX_F_CLK_3,
    FF_RX_H_CLK_0,
    FF_RX_H_CLK_1,
    FF_RX_H_CLK_2,
    FF_RX_H_CLK_3,
    FF_RX_Q_CLK_0,
    FF_RX_Q_CLK_1,
    FF_RX_Q_CLK_2,
    FF_RX_Q_CLK_3,
    FF_TX_F_CLK,
    FF_TX_H_CLK,
    FF_TX_Q_CLK,
    FFS_CC_OVERRUN_0,
    FFS_CC_OVERRUN_1,
    FFS_CC_OVERRUN_2,
    FFS_CC_OVERRUN_3,
    FFS_CC_UNDERRUN_0,
    FFS_CC_UNDERRUN_1,
    FFS_CC_UNDERRUN_2,
    FFS_CC_UNDERRUN_3,
    FFS_LS_SYNC_STATUS_0,
    FFS_LS_SYNC_STATUS_1,
    FFS_LS_SYNC_STATUS_2,
    FFS_LS_SYNC_STATUS_3,
    FFS_PCIE_CON_0,
    FFS_PCIE_CON_1,
    FFS_PCIE_CON_2,
    FFS_PCIE_CON_3,
    FFS_PCIE_DONE_0,
    FFS_PCIE_DONE_1,
    FFS_PCIE_DONE_2,
    FFS_PCIE_DONE_3,
    FFS_RLOS_LO_0,
    FFS_RLOS_LO_1,
    FFS_RLOS_LO_2,
    FFS_RLOS_LO_3,
    OOB_OUT_0,
    OOB_OUT_1,
    OOB_OUT_2,
    OOB_OUT_3,
    REFCK2CORE,
    SCIINT,
    SCIRDATA0,
    SCIRDATA1,
    SCIRDATA2,
    SCIRDATA3,
    SCIRDATA4,
    SCIRDATA5,
    SCIRDATA6,
    SCIRDATA7,
    FFS_PLOL,
    FFS_RLOL_0,
    FFS_RLOL_1,
    FFS_RLOL_2,
    FFS_RLOL_3,
    FFS_RXFBFIFO_ERROR_0,
    FFS_RXFBFIFO_ERROR_1,
    FFS_RXFBFIFO_ERROR_2,
    FFS_RXFBFIFO_ERROR_3,
    FFS_TXFBFIFO_ERROR_0,
    FFS_TXFBFIFO_ERROR_1,
    FFS_TXFBFIFO_ERROR_2,
    FFS_TXFBFIFO_ERROR_3
  );

input		HDINN0;
input		HDINN1;
input		HDINN2;
input		HDINN3;
input		HDINP0;
input		HDINP1;
input		HDINP2;
input		HDINP3;
input		REFCLKN;
input		REFCLKP;
input		CIN0;
input		CIN1;
input		CIN2;
input		CIN3;
input		CIN4;
input		CIN5;
input		CIN6;
input		CIN7;
input		CIN8;
input		CIN9;
input		CIN10;
input		CIN11;
input		CYAWSTN;
input		FF_EBRD_CLK_0;
input		FF_EBRD_CLK_1;
input		FF_EBRD_CLK_2;
input		FF_EBRD_CLK_3;
input		FF_RXI_CLK_0;
input		FF_RXI_CLK_1;
input		FF_RXI_CLK_2;
input		FF_RXI_CLK_3;
input		FF_TX_D_0_0;
input		FF_TX_D_0_1;
input		FF_TX_D_0_2;
input		FF_TX_D_0_3;
input		FF_TX_D_0_4;
input		FF_TX_D_0_5;
input		FF_TX_D_0_6;
input		FF_TX_D_0_7;
input		FF_TX_D_0_8;
input		FF_TX_D_0_9;
input           FF_TX_D_0_10;
input           FF_TX_D_0_11;
input           FF_TX_D_0_12;
input           FF_TX_D_0_13;
input           FF_TX_D_0_14;
input           FF_TX_D_0_15;
input           FF_TX_D_0_16;
input           FF_TX_D_0_17;
input           FF_TX_D_0_18;
input           FF_TX_D_0_19;
input           FF_TX_D_0_20;
input           FF_TX_D_0_21;
input           FF_TX_D_0_22;
input           FF_TX_D_0_23;
input           FF_TX_D_1_0;
input           FF_TX_D_1_1;
input           FF_TX_D_1_2;
input           FF_TX_D_1_3;
input           FF_TX_D_1_4;
input           FF_TX_D_1_5;
input           FF_TX_D_1_6;
input           FF_TX_D_1_7;
input           FF_TX_D_1_8;
input           FF_TX_D_1_9;
input           FF_TX_D_1_10;
input           FF_TX_D_1_11;
input           FF_TX_D_1_12;
input           FF_TX_D_1_13;
input           FF_TX_D_1_14;
input           FF_TX_D_1_15;
input           FF_TX_D_1_16;
input           FF_TX_D_1_17;
input           FF_TX_D_1_18;
input           FF_TX_D_1_19;
input           FF_TX_D_1_20;
input           FF_TX_D_1_21;
input           FF_TX_D_1_22;
input           FF_TX_D_1_23;
input           FF_TX_D_2_0;
input           FF_TX_D_2_1;
input           FF_TX_D_2_2;
input           FF_TX_D_2_3;
input           FF_TX_D_2_4;
input           FF_TX_D_2_5;
input           FF_TX_D_2_6;
input           FF_TX_D_2_7;
input           FF_TX_D_2_8;
input           FF_TX_D_2_9;
input           FF_TX_D_2_10;
input           FF_TX_D_2_11;
input           FF_TX_D_2_12;
input           FF_TX_D_2_13;
input           FF_TX_D_2_14;
input           FF_TX_D_2_15;
input           FF_TX_D_2_16;
input           FF_TX_D_2_17;
input           FF_TX_D_2_18;
input           FF_TX_D_2_19;
input           FF_TX_D_2_20;
input           FF_TX_D_2_21;
input           FF_TX_D_2_22;
input           FF_TX_D_2_23;
input           FF_TX_D_3_0;
input           FF_TX_D_3_1;
input           FF_TX_D_3_2;
input           FF_TX_D_3_3;
input           FF_TX_D_3_4;
input           FF_TX_D_3_5;
input           FF_TX_D_3_6;
input           FF_TX_D_3_7;
input           FF_TX_D_3_8;
input           FF_TX_D_3_9;
input           FF_TX_D_3_10;
input           FF_TX_D_3_11;
input           FF_TX_D_3_12;
input           FF_TX_D_3_13;
input           FF_TX_D_3_14;
input           FF_TX_D_3_15;
input           FF_TX_D_3_16;
input           FF_TX_D_3_17;
input           FF_TX_D_3_18;
input           FF_TX_D_3_19;
input           FF_TX_D_3_20;
input           FF_TX_D_3_21;
input           FF_TX_D_3_22;
input           FF_TX_D_3_23;
input		FF_TXI_CLK_0;
input		FF_TXI_CLK_1;
input		FF_TXI_CLK_2;
input		FF_TXI_CLK_3;
input		FFC_CK_CORE_RX;
input		FFC_CK_CORE_TX;
input		FFC_EI_EN_0;
input		FFC_EI_EN_1;
input		FFC_EI_EN_2;
input		FFC_EI_EN_3;
input		FFC_ENABLE_CGALIGN_0;
input		FFC_ENABLE_CGALIGN_1;
input		FFC_ENABLE_CGALIGN_2;
input		FFC_ENABLE_CGALIGN_3;
input		FFC_FB_LOOPBACK_0;
input		FFC_FB_LOOPBACK_1;
input		FFC_FB_LOOPBACK_2;
input		FFC_FB_LOOPBACK_3;
input		FFC_LANE_RX_RST_0;
input		FFC_LANE_RX_RST_1;
input		FFC_LANE_RX_RST_2;
input		FFC_LANE_RX_RST_3;
input		FFC_LANE_TX_RST_0;
input		FFC_LANE_TX_RST_1;
input		FFC_LANE_TX_RST_2;
input		FFC_LANE_TX_RST_3;
input		FFC_MACRO_RST;
input		FFC_PCI_DET_EN_0;
input		FFC_PCI_DET_EN_1;
input		FFC_PCI_DET_EN_2;
input		FFC_PCI_DET_EN_3;
input		FFC_PCIE_CT_0;
input		FFC_PCIE_CT_1;
input		FFC_PCIE_CT_2;
input		FFC_PCIE_CT_3;
input		FFC_PFIFO_CLR_0;
input		FFC_PFIFO_CLR_1;
input		FFC_PFIFO_CLR_2;
input		FFC_PFIFO_CLR_3;
input		FFC_QUAD_RST;
input		FFC_RRST_0;
input		FFC_RRST_1;
input		FFC_RRST_2;
input		FFC_RRST_3;
input		FFC_RXPWDNB_0;
input		FFC_RXPWDNB_1;
input		FFC_RXPWDNB_2;
input		FFC_RXPWDNB_3;
input		FFC_SB_INV_RX_0;
input		FFC_SB_INV_RX_1;
input		FFC_SB_INV_RX_2;
input		FFC_SB_INV_RX_3;
input		FFC_SB_PFIFO_LP_0;
input		FFC_SB_PFIFO_LP_1;
input		FFC_SB_PFIFO_LP_2;
input		FFC_SB_PFIFO_LP_3;
input		FFC_SIGNAL_DETECT_0;
input		FFC_SIGNAL_DETECT_1;
input		FFC_SIGNAL_DETECT_2;
input		FFC_SIGNAL_DETECT_3;
input		FFC_TRST;
input		FFC_TXPWDNB_0;
input		FFC_TXPWDNB_1;
input		FFC_TXPWDNB_2;
input		FFC_TXPWDNB_3;
input		SCIADDR0;
input		SCIADDR1;
input		SCIADDR2;
input		SCIADDR3;
input		SCIADDR4;
input		SCIADDR5;
input		SCIENAUX;
input		SCIENCH0;
input		SCIENCH1;
input		SCIENCH2;
input		SCIENCH3;
input		SCIRD;
input		SCISELAUX;
input		SCISELCH0;
input		SCISELCH1;
input		SCISELCH2;
input		SCISELCH3;
input		SCIWDATA0;
input		SCIWDATA1;
input		SCIWDATA2;
input		SCIWDATA3;
input		SCIWDATA4;
input		SCIWDATA5;
input		SCIWDATA6;
input		SCIWDATA7;
input		SCIWSTN;
output		HDOUTN0;
output		HDOUTN1;
output		HDOUTN2;
output		HDOUTN3;
output		HDOUTP0;
output		HDOUTP1;
output		HDOUTP2;
output		HDOUTP3;
output		COUT0;
output		COUT1;
output		COUT2;
output		COUT3;
output		COUT4;
output		COUT5;
output		COUT6;
output		COUT7;
output		COUT8;
output		COUT9;
output          COUT10;
output          COUT11;
output          COUT12;
output          COUT13;
output          COUT14;
output          COUT15;
output          COUT16;
output          COUT17;
output          COUT18;
output          COUT19;
output		FF_RX_D_0_0;
output		FF_RX_D_0_1;
output		FF_RX_D_0_2;
output		FF_RX_D_0_3;
output		FF_RX_D_0_4;
output		FF_RX_D_0_5;
output		FF_RX_D_0_6;
output		FF_RX_D_0_7;
output		FF_RX_D_0_8;
output		FF_RX_D_0_9;
output          FF_RX_D_0_10;
output          FF_RX_D_0_11;
output          FF_RX_D_0_12;
output          FF_RX_D_0_13;
output          FF_RX_D_0_14;
output          FF_RX_D_0_15;
output          FF_RX_D_0_16;
output          FF_RX_D_0_17;
output          FF_RX_D_0_18;
output          FF_RX_D_0_19;
output          FF_RX_D_0_20;
output          FF_RX_D_0_21;
output          FF_RX_D_0_22;
output          FF_RX_D_0_23;
output          FF_RX_D_1_0;
output          FF_RX_D_1_1;
output          FF_RX_D_1_2;
output          FF_RX_D_1_3;
output          FF_RX_D_1_4;
output          FF_RX_D_1_5;
output          FF_RX_D_1_6;
output          FF_RX_D_1_7;
output          FF_RX_D_1_8;
output          FF_RX_D_1_9;
output          FF_RX_D_1_10;
output          FF_RX_D_1_11;
output          FF_RX_D_1_12;
output          FF_RX_D_1_13;
output          FF_RX_D_1_14;
output          FF_RX_D_1_15;
output          FF_RX_D_1_16;
output          FF_RX_D_1_17;
output          FF_RX_D_1_18;
output          FF_RX_D_1_19;
output          FF_RX_D_1_20;
output          FF_RX_D_1_21;
output          FF_RX_D_1_22;
output          FF_RX_D_1_23;
output          FF_RX_D_2_0;
output          FF_RX_D_2_1;
output          FF_RX_D_2_2;
output          FF_RX_D_2_3;
output          FF_RX_D_2_4;
output          FF_RX_D_2_5;
output          FF_RX_D_2_6;
output          FF_RX_D_2_7;
output          FF_RX_D_2_8;
output          FF_RX_D_2_9;
output          FF_RX_D_2_10;
output          FF_RX_D_2_11;
output          FF_RX_D_2_12;
output          FF_RX_D_2_13;
output          FF_RX_D_2_14;
output          FF_RX_D_2_15;
output          FF_RX_D_2_16;
output          FF_RX_D_2_17;
output          FF_RX_D_2_18;
output          FF_RX_D_2_19;
output          FF_RX_D_2_20;
output          FF_RX_D_2_21;
output          FF_RX_D_2_22;
output          FF_RX_D_2_23;
output          FF_RX_D_3_0;
output          FF_RX_D_3_1;
output          FF_RX_D_3_2;
output          FF_RX_D_3_3;
output          FF_RX_D_3_4;
output          FF_RX_D_3_5;
output          FF_RX_D_3_6;
output          FF_RX_D_3_7;
output          FF_RX_D_3_8;
output          FF_RX_D_3_9;
output          FF_RX_D_3_10;
output          FF_RX_D_3_11;
output          FF_RX_D_3_12;
output          FF_RX_D_3_13;
output          FF_RX_D_3_14;
output          FF_RX_D_3_15;
output          FF_RX_D_3_16;
output          FF_RX_D_3_17;
output          FF_RX_D_3_18;
output          FF_RX_D_3_19;
output          FF_RX_D_3_20;
output          FF_RX_D_3_21;
output          FF_RX_D_3_22;
output          FF_RX_D_3_23;
output		FF_RX_F_CLK_0;
output		FF_RX_F_CLK_1;
output		FF_RX_F_CLK_2;
output		FF_RX_F_CLK_3;
output		FF_RX_H_CLK_0;
output		FF_RX_H_CLK_1;
output		FF_RX_H_CLK_2;
output		FF_RX_H_CLK_3;
output		FF_RX_Q_CLK_0;
output		FF_RX_Q_CLK_1;
output		FF_RX_Q_CLK_2;
output		FF_RX_Q_CLK_3;
output		FF_TX_F_CLK;
output		FF_TX_H_CLK;
output		FF_TX_Q_CLK;
output		FFS_CC_OVERRUN_0;
output		FFS_CC_OVERRUN_1;
output		FFS_CC_OVERRUN_2;
output		FFS_CC_OVERRUN_3;
output		FFS_CC_UNDERRUN_0;
output		FFS_CC_UNDERRUN_1;
output		FFS_CC_UNDERRUN_2;
output		FFS_CC_UNDERRUN_3;
output		FFS_LS_SYNC_STATUS_0;
output		FFS_LS_SYNC_STATUS_1;
output		FFS_LS_SYNC_STATUS_2;
output		FFS_LS_SYNC_STATUS_3;
output		FFS_PCIE_CON_0;
output		FFS_PCIE_CON_1;
output		FFS_PCIE_CON_2;
output		FFS_PCIE_CON_3;
output		FFS_PCIE_DONE_0;
output		FFS_PCIE_DONE_1;
output		FFS_PCIE_DONE_2;
output		FFS_PCIE_DONE_3;
output		FFS_RLOS_LO_0;
output		FFS_RLOS_LO_1;
output		FFS_RLOS_LO_2;
output		FFS_RLOS_LO_3;
output		OOB_OUT_0;
output		OOB_OUT_1;
output		OOB_OUT_2;
output		OOB_OUT_3;
output		REFCK2CORE;
output		SCIINT;
output		SCIRDATA0;
output		SCIRDATA1;
output		SCIRDATA2;
output		SCIRDATA3;
output		SCIRDATA4;
output		SCIRDATA5;
output		SCIRDATA6;
output		SCIRDATA7;
output          FFS_PLOL;
output          FFS_RLOL_0;
output          FFS_RLOL_1;
output          FFS_RLOL_2;
output          FFS_RLOL_3;
output          FFS_RXFBFIFO_ERROR_0;
output          FFS_RXFBFIFO_ERROR_1;
output          FFS_RXFBFIFO_ERROR_2;
output          FFS_RXFBFIFO_ERROR_3;
output          FFS_TXFBFIFO_ERROR_0;
output          FFS_TXFBFIFO_ERROR_1;
output          FFS_TXFBFIFO_ERROR_2;
output          FFS_TXFBFIFO_ERROR_3;


parameter CONFIG_FILE = "configfile.txt";

defparam PCSC_sim_inst.CONFIG_FILE = CONFIG_FILE;

 PCSC_sim PCSC_sim_inst (
   .HDINN0(HDINN0),
   .HDINN1(HDINN1),
   .HDINN2(HDINN2),
   .HDINN3(HDINN3),
   .HDINP0(HDINP0),
   .HDINP1(HDINP1),
   .HDINP2(HDINP2),
   .HDINP3(HDINP3),
   .REFCLKN(REFCLKN),
   .REFCLKP(REFCLKP),
   .CIN11(CIN11),
   .CIN10(CIN10),
   .CIN9(CIN9),
   .CIN8(CIN8),
   .CIN7(CIN7),
   .CIN6(CIN6),
   .CIN5(CIN5),
   .CIN4(CIN4),
   .CIN3(CIN3),
   .CIN2(CIN2),
   .CIN1(CIN1),
   .CIN0(CIN0),
   .CYAWSTN(CYAWSTN),
   .FF_EBRD_CLK_3(FF_EBRD_CLK_3),
   .FF_EBRD_CLK_2(FF_EBRD_CLK_2),
   .FF_EBRD_CLK_1(FF_EBRD_CLK_1),
   .FF_EBRD_CLK_0(FF_EBRD_CLK_0),
   .FF_RXI_CLK_3(FF_RXI_CLK_3),
   .FF_RXI_CLK_2(FF_RXI_CLK_2),
   .FF_RXI_CLK_1(FF_RXI_CLK_1),
   .FF_RXI_CLK_0(FF_RXI_CLK_0),

   .FF_TX_D_0_0(FF_TX_D_0_0),
   .FF_TX_D_0_1(FF_TX_D_0_1),
   .FF_TX_D_0_2(FF_TX_D_0_2),
   .FF_TX_D_0_3(FF_TX_D_0_3),
   .FF_TX_D_0_4(FF_TX_D_0_4),
   .FF_TX_D_0_5(FF_TX_D_0_5),
   .FF_TX_D_0_6(FF_TX_D_0_6),
   .FF_TX_D_0_7(FF_TX_D_0_7),
   .FF_TX_D_0_8(FF_TX_D_0_8),
   .FF_TX_D_0_9(FF_TX_D_0_9),
   .FF_TX_D_0_10(FF_TX_D_0_10),
   .FF_TX_D_0_11(FF_TX_D_0_11),
   .FF_TX_D_0_12(FF_TX_D_0_12),
   .FF_TX_D_0_13(FF_TX_D_0_13),
   .FF_TX_D_0_14(FF_TX_D_0_14),
   .FF_TX_D_0_15(FF_TX_D_0_15),
   .FF_TX_D_0_16(FF_TX_D_0_16),
   .FF_TX_D_0_17(FF_TX_D_0_17),
   .FF_TX_D_0_18(FF_TX_D_0_18),
   .FF_TX_D_0_19(FF_TX_D_0_19),
   .FF_TX_D_0_20(FF_TX_D_0_20),
   .FF_TX_D_0_21(FF_TX_D_0_21),
   .FF_TX_D_0_22(FF_TX_D_0_22),
   .FF_TX_D_0_23(FF_TX_D_0_23),
   .FF_TX_D_1_0(FF_TX_D_1_0),
   .FF_TX_D_1_1(FF_TX_D_1_1),
   .FF_TX_D_1_2(FF_TX_D_1_2),
   .FF_TX_D_1_3(FF_TX_D_1_3),
   .FF_TX_D_1_4(FF_TX_D_1_4),
   .FF_TX_D_1_5(FF_TX_D_1_5),
   .FF_TX_D_1_6(FF_TX_D_1_6),
   .FF_TX_D_1_7(FF_TX_D_1_7),
   .FF_TX_D_1_8(FF_TX_D_1_8),
   .FF_TX_D_1_9(FF_TX_D_1_9),
   .FF_TX_D_1_10(FF_TX_D_1_10),
   .FF_TX_D_1_11(FF_TX_D_1_11),
   .FF_TX_D_1_12(FF_TX_D_1_12),
   .FF_TX_D_1_13(FF_TX_D_1_13),
   .FF_TX_D_1_14(FF_TX_D_1_14),
   .FF_TX_D_1_15(FF_TX_D_1_15),
   .FF_TX_D_1_16(FF_TX_D_1_16),
   .FF_TX_D_1_17(FF_TX_D_1_17),
   .FF_TX_D_1_18(FF_TX_D_1_18),
   .FF_TX_D_1_19(FF_TX_D_1_19),
   .FF_TX_D_1_20(FF_TX_D_1_20),
   .FF_TX_D_1_21(FF_TX_D_1_21),
   .FF_TX_D_1_22(FF_TX_D_1_22),
   .FF_TX_D_1_23(FF_TX_D_1_23),
   .FF_TX_D_2_0(FF_TX_D_2_0),
   .FF_TX_D_2_1(FF_TX_D_2_1),
   .FF_TX_D_2_2(FF_TX_D_2_2),
   .FF_TX_D_2_3(FF_TX_D_2_3),
   .FF_TX_D_2_4(FF_TX_D_2_4),
   .FF_TX_D_2_5(FF_TX_D_2_5),
   .FF_TX_D_2_6(FF_TX_D_2_6),
   .FF_TX_D_2_7(FF_TX_D_2_7),
   .FF_TX_D_2_8(FF_TX_D_2_8),
   .FF_TX_D_2_9(FF_TX_D_2_9),
   .FF_TX_D_2_10(FF_TX_D_2_10),
   .FF_TX_D_2_11(FF_TX_D_2_11),
   .FF_TX_D_2_12(FF_TX_D_2_12),
   .FF_TX_D_2_13(FF_TX_D_2_13),
   .FF_TX_D_2_14(FF_TX_D_2_14),
   .FF_TX_D_2_15(FF_TX_D_2_15),
   .FF_TX_D_2_16(FF_TX_D_2_16),
   .FF_TX_D_2_17(FF_TX_D_2_17),
   .FF_TX_D_2_18(FF_TX_D_2_18),
   .FF_TX_D_2_19(FF_TX_D_2_19),
   .FF_TX_D_2_20(FF_TX_D_2_20),
   .FF_TX_D_2_21(FF_TX_D_2_21),
   .FF_TX_D_2_22(FF_TX_D_2_22),
   .FF_TX_D_2_23(FF_TX_D_2_23),
   .FF_TX_D_3_0(FF_TX_D_3_0),
   .FF_TX_D_3_1(FF_TX_D_3_1),
   .FF_TX_D_3_2(FF_TX_D_3_2),
   .FF_TX_D_3_3(FF_TX_D_3_3),
   .FF_TX_D_3_4(FF_TX_D_3_4),
   .FF_TX_D_3_5(FF_TX_D_3_5),
   .FF_TX_D_3_6(FF_TX_D_3_6),
   .FF_TX_D_3_7(FF_TX_D_3_7),
   .FF_TX_D_3_8(FF_TX_D_3_8),
   .FF_TX_D_3_9(FF_TX_D_3_9),
   .FF_TX_D_3_10(FF_TX_D_3_10),
   .FF_TX_D_3_11(FF_TX_D_3_11),
   .FF_TX_D_3_12(FF_TX_D_3_12),
   .FF_TX_D_3_13(FF_TX_D_3_13),
   .FF_TX_D_3_14(FF_TX_D_3_14),
   .FF_TX_D_3_15(FF_TX_D_3_15),
   .FF_TX_D_3_16(FF_TX_D_3_16),
   .FF_TX_D_3_17(FF_TX_D_3_17),
   .FF_TX_D_3_18(FF_TX_D_3_18),
   .FF_TX_D_3_19(FF_TX_D_3_19),
   .FF_TX_D_3_20(FF_TX_D_3_20),
   .FF_TX_D_3_21(FF_TX_D_3_21),
   .FF_TX_D_3_22(FF_TX_D_3_22),
   .FF_TX_D_3_23(FF_TX_D_3_23),
   .FF_TXI_CLK_0(FF_TXI_CLK_0),
   .FF_TXI_CLK_1(FF_TXI_CLK_1),
   .FF_TXI_CLK_2(FF_TXI_CLK_2),
   .FF_TXI_CLK_3(FF_TXI_CLK_3),
   .FFC_CK_CORE_RX(FFC_CK_CORE_RX),
   .FFC_CK_CORE_TX(FFC_CK_CORE_TX),
   .FFC_EI_EN_0(FFC_EI_EN_0),
   .FFC_EI_EN_1(FFC_EI_EN_1),
   .FFC_EI_EN_2(FFC_EI_EN_2),
   .FFC_EI_EN_3(FFC_EI_EN_3),
   .FFC_ENABLE_CGALIGN_0(FFC_ENABLE_CGALIGN_0),
   .FFC_ENABLE_CGALIGN_1(FFC_ENABLE_CGALIGN_1),
   .FFC_ENABLE_CGALIGN_2(FFC_ENABLE_CGALIGN_2),
   .FFC_ENABLE_CGALIGN_3(FFC_ENABLE_CGALIGN_3),
   .FFC_FB_LOOPBACK_0(FFC_FB_LOOPBACK_0),
   .FFC_FB_LOOPBACK_1(FFC_FB_LOOPBACK_1),
   .FFC_FB_LOOPBACK_2(FFC_FB_LOOPBACK_2),
   .FFC_FB_LOOPBACK_3(FFC_FB_LOOPBACK_3),
   .FFC_LANE_RX_RST_0(FFC_LANE_RX_RST_0),
   .FFC_LANE_RX_RST_1(FFC_LANE_RX_RST_1),
   .FFC_LANE_RX_RST_2(FFC_LANE_RX_RST_2),
   .FFC_LANE_RX_RST_3(FFC_LANE_RX_RST_3),
   .FFC_LANE_TX_RST_0(FFC_LANE_TX_RST_0),
   .FFC_LANE_TX_RST_1(FFC_LANE_TX_RST_1),
   .FFC_LANE_TX_RST_2(FFC_LANE_TX_RST_2),
   .FFC_LANE_TX_RST_3(FFC_LANE_TX_RST_3),
   .FFC_MACRO_RST(FFC_MACRO_RST),
   .FFC_PCI_DET_EN_0(FFC_PCI_DET_EN_0),
   .FFC_PCI_DET_EN_1(FFC_PCI_DET_EN_1),
   .FFC_PCI_DET_EN_2(FFC_PCI_DET_EN_2),
   .FFC_PCI_DET_EN_3(FFC_PCI_DET_EN_3),
   .FFC_PCIE_CT_0(FFC_PCIE_CT_0),
   .FFC_PCIE_CT_1(FFC_PCIE_CT_1),
   .FFC_PCIE_CT_2(FFC_PCIE_CT_2),
   .FFC_PCIE_CT_3(FFC_PCIE_CT_3),
   .FFC_PFIFO_CLR_0(FFC_PFIFO_CLR_0),
   .FFC_PFIFO_CLR_1(FFC_PFIFO_CLR_1),
   .FFC_PFIFO_CLR_2(FFC_PFIFO_CLR_2),
   .FFC_PFIFO_CLR_3(FFC_PFIFO_CLR_3),
   .FFC_QUAD_RST(FFC_QUAD_RST),
   .FFC_RRST_0(FFC_RRST_0),
   .FFC_RRST_1(FFC_RRST_1),
   .FFC_RRST_2(FFC_RRST_2),
   .FFC_RRST_3(FFC_RRST_3),
   .FFC_RXPWDNB_0(FFC_RXPWDNB_0),
   .FFC_RXPWDNB_1(FFC_RXPWDNB_1),
   .FFC_RXPWDNB_2(FFC_RXPWDNB_2),
   .FFC_RXPWDNB_3(FFC_RXPWDNB_3),
   .FFC_SB_INV_RX_0(FFC_SB_INV_RX_0),
   .FFC_SB_INV_RX_1(FFC_SB_INV_RX_1),
   .FFC_SB_INV_RX_2(FFC_SB_INV_RX_2),
   .FFC_SB_INV_RX_3(FFC_SB_INV_RX_3),
   .FFC_SB_PFIFO_LP_0(FFC_SB_PFIFO_LP_0),
   .FFC_SB_PFIFO_LP_1(FFC_SB_PFIFO_LP_1),
   .FFC_SB_PFIFO_LP_2(FFC_SB_PFIFO_LP_2),
   .FFC_SB_PFIFO_LP_3(FFC_SB_PFIFO_LP_3),
   .FFC_SIGNAL_DETECT_0(FFC_SIGNAL_DETECT_0),
   .FFC_SIGNAL_DETECT_1(FFC_SIGNAL_DETECT_1),
   .FFC_SIGNAL_DETECT_2(FFC_SIGNAL_DETECT_2),
   .FFC_SIGNAL_DETECT_3(FFC_SIGNAL_DETECT_3),
   .FFC_TRST(FFC_TRST),
   .FFC_TXPWDNB_0(FFC_TXPWDNB_0),
   .FFC_TXPWDNB_1(FFC_TXPWDNB_1),
   .FFC_TXPWDNB_2(FFC_TXPWDNB_2),
   .FFC_TXPWDNB_3(FFC_TXPWDNB_3),
   .SCIADDR0(SCIADDR0),
   .SCIADDR1(SCIADDR1),
   .SCIADDR2(SCIADDR2),
   .SCIADDR3(SCIADDR3),
   .SCIADDR4(SCIADDR4),
   .SCIADDR5(SCIADDR5),
   .SCIENAUX(SCIENAUX),
   .SCIENCH0(SCIENCH0),
   .SCIENCH1(SCIENCH1),
   .SCIENCH2(SCIENCH2),
   .SCIENCH3(SCIENCH3),
   .SCIRD(SCIRD),
   .SCISELAUX(SCISELAUX),
   .SCISELCH0(SCISELCH0),
   .SCISELCH1(SCISELCH1),
   .SCISELCH2(SCISELCH2),
   .SCISELCH3(SCISELCH3),
   .SCIWDATA0(SCIWDATA0),
   .SCIWDATA1(SCIWDATA1),
   .SCIWDATA2(SCIWDATA2),
   .SCIWDATA3(SCIWDATA3),
   .SCIWDATA4(SCIWDATA4),
   .SCIWDATA5(SCIWDATA5),
   .SCIWDATA6(SCIWDATA6),
   .SCIWDATA7(SCIWDATA7),
   .SCIWSTN(SCIWSTN),
   .HDOUTN0(HDOUTN0),
   .HDOUTN1(HDOUTN1),
   .HDOUTN2(HDOUTN2),
   .HDOUTN3(HDOUTN3),
   .HDOUTP0(HDOUTP0),
   .HDOUTP1(HDOUTP1),
   .HDOUTP2(HDOUTP2),
   .HDOUTP3(HDOUTP3),
   .COUT19(COUT19),
   .COUT18(COUT18),
   .COUT17(COUT17),
   .COUT16(COUT16),
   .COUT15(COUT15),
   .COUT14(COUT14),
   .COUT13(COUT13),
   .COUT12(COUT12),
   .COUT11(COUT11),
   .COUT10(COUT10),
   .COUT9(COUT9),
   .COUT8(COUT8),
   .COUT7(COUT7),
   .COUT6(COUT6),
   .COUT5(COUT5),
   .COUT4(COUT4),
   .COUT3(COUT3),
   .COUT2(COUT2),
   .COUT1(COUT1),
   .COUT0(COUT0),
   .FF_RX_D_0_0(FF_RX_D_0_0),
   .FF_RX_D_0_1(FF_RX_D_0_1),
   .FF_RX_D_0_2(FF_RX_D_0_2),
   .FF_RX_D_0_3(FF_RX_D_0_3),
   .FF_RX_D_0_4(FF_RX_D_0_4),
   .FF_RX_D_0_5(FF_RX_D_0_5),
   .FF_RX_D_0_6(FF_RX_D_0_6),
   .FF_RX_D_0_7(FF_RX_D_0_7),
   .FF_RX_D_0_8(FF_RX_D_0_8),
   .FF_RX_D_0_9(FF_RX_D_0_9),
   .FF_RX_D_0_10(FF_RX_D_0_10),
   .FF_RX_D_0_11(FF_RX_D_0_11),
   .FF_RX_D_0_12(FF_RX_D_0_12),
   .FF_RX_D_0_13(FF_RX_D_0_13),
   .FF_RX_D_0_14(FF_RX_D_0_14),
   .FF_RX_D_0_15(FF_RX_D_0_15),
   .FF_RX_D_0_16(FF_RX_D_0_16),
   .FF_RX_D_0_17(FF_RX_D_0_17),
   .FF_RX_D_0_18(FF_RX_D_0_18),
   .FF_RX_D_0_19(FF_RX_D_0_19),
   .FF_RX_D_0_20(FF_RX_D_0_20),
   .FF_RX_D_0_21(FF_RX_D_0_21),
   .FF_RX_D_0_22(FF_RX_D_0_22),
   .FF_RX_D_0_23(FF_RX_D_0_23),
   .FF_RX_D_1_0(FF_RX_D_1_0),
   .FF_RX_D_1_1(FF_RX_D_1_1),
   .FF_RX_D_1_2(FF_RX_D_1_2),
   .FF_RX_D_1_3(FF_RX_D_1_3),
   .FF_RX_D_1_4(FF_RX_D_1_4),
   .FF_RX_D_1_5(FF_RX_D_1_5),
   .FF_RX_D_1_6(FF_RX_D_1_6),
   .FF_RX_D_1_7(FF_RX_D_1_7),
   .FF_RX_D_1_8(FF_RX_D_1_8),
   .FF_RX_D_1_9(FF_RX_D_1_9),
   .FF_RX_D_1_10(FF_RX_D_1_10),
   .FF_RX_D_1_11(FF_RX_D_1_11),
   .FF_RX_D_1_12(FF_RX_D_1_12),
   .FF_RX_D_1_13(FF_RX_D_1_13),
   .FF_RX_D_1_14(FF_RX_D_1_14),
   .FF_RX_D_1_15(FF_RX_D_1_15),
   .FF_RX_D_1_16(FF_RX_D_1_16),
   .FF_RX_D_1_17(FF_RX_D_1_17),
   .FF_RX_D_1_18(FF_RX_D_1_18),
   .FF_RX_D_1_19(FF_RX_D_1_19),
   .FF_RX_D_1_20(FF_RX_D_1_20),
   .FF_RX_D_1_21(FF_RX_D_1_21),
   .FF_RX_D_1_22(FF_RX_D_1_22),
   .FF_RX_D_1_23(FF_RX_D_1_23),
   .FF_RX_D_2_0(FF_RX_D_2_0),
   .FF_RX_D_2_1(FF_RX_D_2_1),
   .FF_RX_D_2_2(FF_RX_D_2_2),
   .FF_RX_D_2_3(FF_RX_D_2_3),
   .FF_RX_D_2_4(FF_RX_D_2_4),
   .FF_RX_D_2_5(FF_RX_D_2_5),
   .FF_RX_D_2_6(FF_RX_D_2_6),
   .FF_RX_D_2_7(FF_RX_D_2_7),
   .FF_RX_D_2_8(FF_RX_D_2_8),
   .FF_RX_D_2_9(FF_RX_D_2_9),
   .FF_RX_D_2_10(FF_RX_D_2_10),
   .FF_RX_D_2_11(FF_RX_D_2_11),
   .FF_RX_D_2_12(FF_RX_D_2_12),
   .FF_RX_D_2_13(FF_RX_D_2_13),
   .FF_RX_D_2_14(FF_RX_D_2_14),
   .FF_RX_D_2_15(FF_RX_D_2_15),
   .FF_RX_D_2_16(FF_RX_D_2_16),
   .FF_RX_D_2_17(FF_RX_D_2_17),
   .FF_RX_D_2_18(FF_RX_D_2_18),
   .FF_RX_D_2_19(FF_RX_D_2_19),
   .FF_RX_D_2_20(FF_RX_D_2_20),
   .FF_RX_D_2_21(FF_RX_D_2_21),
   .FF_RX_D_2_22(FF_RX_D_2_22),
   .FF_RX_D_2_23(FF_RX_D_2_23),
   .FF_RX_D_3_0(FF_RX_D_3_0),
   .FF_RX_D_3_1(FF_RX_D_3_1),
   .FF_RX_D_3_2(FF_RX_D_3_2),
   .FF_RX_D_3_3(FF_RX_D_3_3),
   .FF_RX_D_3_4(FF_RX_D_3_4),
   .FF_RX_D_3_5(FF_RX_D_3_5),
   .FF_RX_D_3_6(FF_RX_D_3_6),
   .FF_RX_D_3_7(FF_RX_D_3_7),
   .FF_RX_D_3_8(FF_RX_D_3_8),
   .FF_RX_D_3_9(FF_RX_D_3_9),
   .FF_RX_D_3_10(FF_RX_D_3_10),
   .FF_RX_D_3_11(FF_RX_D_3_11),
   .FF_RX_D_3_12(FF_RX_D_3_12),
   .FF_RX_D_3_13(FF_RX_D_3_13),
   .FF_RX_D_3_14(FF_RX_D_3_14),
   .FF_RX_D_3_15(FF_RX_D_3_15),
   .FF_RX_D_3_16(FF_RX_D_3_16),
   .FF_RX_D_3_17(FF_RX_D_3_17),
   .FF_RX_D_3_18(FF_RX_D_3_18),
   .FF_RX_D_3_19(FF_RX_D_3_19),
   .FF_RX_D_3_20(FF_RX_D_3_20),
   .FF_RX_D_3_21(FF_RX_D_3_21),
   .FF_RX_D_3_22(FF_RX_D_3_22),
   .FF_RX_D_3_23(FF_RX_D_3_23),
   .FF_RX_F_CLK_0(FF_RX_F_CLK_0),
   .FF_RX_F_CLK_1(FF_RX_F_CLK_1),
   .FF_RX_F_CLK_2(FF_RX_F_CLK_2),
   .FF_RX_F_CLK_3(FF_RX_F_CLK_3),
   .FF_RX_H_CLK_0(FF_RX_H_CLK_0),
   .FF_RX_H_CLK_1(FF_RX_H_CLK_1),
   .FF_RX_H_CLK_2(FF_RX_H_CLK_2),
   .FF_RX_H_CLK_3(FF_RX_H_CLK_3),
   .FF_RX_Q_CLK_0(FF_RX_Q_CLK_0),
   .FF_RX_Q_CLK_1(FF_RX_Q_CLK_1),
   .FF_RX_Q_CLK_2(FF_RX_Q_CLK_2),
   .FF_RX_Q_CLK_3(FF_RX_Q_CLK_3),
   .FF_TX_F_CLK(FF_TX_F_CLK),
   .FF_TX_H_CLK(FF_TX_H_CLK),
   .FF_TX_Q_CLK(FF_TX_Q_CLK),
   .FFS_CC_OVERRUN_0(FFS_CC_OVERRUN_0),
   .FFS_CC_OVERRUN_1(FFS_CC_OVERRUN_1),
   .FFS_CC_OVERRUN_2(FFS_CC_OVERRUN_2),
   .FFS_CC_OVERRUN_3(FFS_CC_OVERRUN_3),
   .FFS_CC_UNDERRUN_0(FFS_CC_UNDERRUN_0),
   .FFS_CC_UNDERRUN_1(FFS_CC_UNDERRUN_1),
   .FFS_CC_UNDERRUN_2(FFS_CC_UNDERRUN_2),
   .FFS_CC_UNDERRUN_3(FFS_CC_UNDERRUN_3),
   .FFS_LS_SYNC_STATUS_0(FFS_LS_SYNC_STATUS_0),
   .FFS_LS_SYNC_STATUS_1(FFS_LS_SYNC_STATUS_1),
   .FFS_LS_SYNC_STATUS_2(FFS_LS_SYNC_STATUS_2),
   .FFS_LS_SYNC_STATUS_3(FFS_LS_SYNC_STATUS_3),
   .FFS_PCIE_CON_0(FFS_PCIE_CON_0),
   .FFS_PCIE_CON_1(FFS_PCIE_CON_1),
   .FFS_PCIE_CON_2(FFS_PCIE_CON_2),
   .FFS_PCIE_CON_3(FFS_PCIE_CON_3),
   .FFS_PCIE_DONE_0(FFS_PCIE_DONE_0),
   .FFS_PCIE_DONE_1(FFS_PCIE_DONE_1),
   .FFS_PCIE_DONE_2(FFS_PCIE_DONE_2),
   .FFS_PCIE_DONE_3(FFS_PCIE_DONE_3),
   .FFS_RLOS_LO_0(FFS_RLOS_LO_0),
   .FFS_RLOS_LO_1(FFS_RLOS_LO_1),
   .FFS_RLOS_LO_2(FFS_RLOS_LO_2),
   .FFS_RLOS_LO_3(FFS_RLOS_LO_3),
   .FFS_PLOL(FFS_PLOL),
   .FFS_RLOL_0(FFS_RLOL_0),
   .FFS_RLOL_1(FFS_RLOL_1),
   .FFS_RLOL_2(FFS_RLOL_2),
   .FFS_RLOL_3(FFS_RLOL_3),
   .FFS_RXFBFIFO_ERROR_0(FFS_RXFBFIFO_ERROR_0),
   .FFS_RXFBFIFO_ERROR_1(FFS_RXFBFIFO_ERROR_1),
   .FFS_RXFBFIFO_ERROR_2(FFS_RXFBFIFO_ERROR_2),
   .FFS_RXFBFIFO_ERROR_3(FFS_RXFBFIFO_ERROR_3),
   .FFS_TXFBFIFO_ERROR_0(FFS_TXFBFIFO_ERROR_0),
   .FFS_TXFBFIFO_ERROR_1(FFS_TXFBFIFO_ERROR_1),
   .FFS_TXFBFIFO_ERROR_2(FFS_TXFBFIFO_ERROR_2),
   .FFS_TXFBFIFO_ERROR_3(FFS_TXFBFIFO_ERROR_3),
   .OOB_OUT_0(OOB_OUT_0),
   .OOB_OUT_1(OOB_OUT_1),
   .OOB_OUT_2(OOB_OUT_2),
   .OOB_OUT_3(OOB_OUT_3),
   .REFCK2CORE(REFCK2CORE),
   .SCIINT(SCIINT),
   .SCIRDATA0(SCIRDATA0),
   .SCIRDATA1(SCIRDATA1),
   .SCIRDATA2(SCIRDATA2),
   .SCIRDATA3(SCIRDATA3),
   .SCIRDATA4(SCIRDATA4),
   .SCIRDATA5(SCIRDATA5),
   .SCIRDATA6(SCIRDATA6),
   .SCIRDATA7(SCIRDATA7)
   );

endmodule
//synopsys translate_on
#include <pcs/pcsc.tft>
