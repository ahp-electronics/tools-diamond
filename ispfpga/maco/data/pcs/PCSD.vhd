#log _circuit_name.vhd

#define -r SLASH2 --
#ifndef _ch0_rx_lol_port
#define _ch0_rx_lol_port "INTERNAL"
#endif
#ifndef _ch1_rx_lol_port
#define _ch1_rx_lol_port "INTERNAL"
#endif
#ifndef _ch2_rx_lol_port
#define _ch2_rx_lol_port "INTERNAL"
#endif
#ifndef _ch3_rx_lol_port
#define _ch3_rx_lol_port "INTERNAL"
#endif
#ifndef _los_threshold_mode0
#define _los_threshold_mode0 "LOS_E"
#endif
#ifndef _los_threshold_mode1
#define _los_threshold_mode1 "LOS_E"
#endif
#ifndef _los_threshold_mode2
#define _los_threshold_mode2 "LOS_E"
#endif
#ifndef _los_threshold_mode3
#define _los_threshold_mode3 "LOS_E"
#endif
#ifndef _ch0_teidle
#define _ch0_teidle "DISABLED"
#endif
#ifndef _ch1_teidle
#define _ch1_teidle "DISABLED"
#endif
#ifndef _ch2_teidle
#define _ch2_teidle "DISABLED"
#endif
#ifndef _ch3_teidle
#define _ch3_teidle "DISABLED"
#endif
#ifndef _ch0_lbtype
#define _ch0_lbtype "DISABLED"
#endif
#ifndef _ch1_lbtype
#define _ch1_lbtype "DISABLED"
#endif
#ifndef _ch2_lbtype
#define _ch2_lbtype "DISABLED"
#endif
#ifndef _ch3_lbtype
#define _ch3_lbtype "DISABLED"
#endif
#macro converter1(arg1,arg2)
#define arg2 arg1##.txt
#endmacro
#macro converter2(arg1,arg2,arg3)
#if arg1 == "DISABLED"
#define arg3 "DISABLED"
#else
#define arg3 arg2
#endif
#endmacro
#macro converter3(arg1,arg2)
#define arg2 arg1##rx_reset_sm
#endmacro
#macro converter4(arg1,arg2)
#define arg2 arg1##tx_reset_sm
#endmacro
                                                                                                         
#converter3(_circuit_name, _rx_reset_sm_module)
#converter4(_circuit_name, _tx_reset_sm_module)
#converter2(_ch0_mode, _ch0_protocol, _ch0_protocol_new)
#converter2(_ch1_mode, _ch1_protocol, _ch1_protocol_new)
#converter2(_ch2_mode, _ch2_protocol, _ch2_protocol_new)
#converter2(_ch3_mode, _ch3_protocol, _ch3_protocol_new)
#converter1(_circuit_name, _circuit_name_new)
#if _ch0_rx_data_width == "16" || _ch0_rx_data_width == "20"
#define _ch0_rx_ficlk_rate_new = _ch0_rx_ficlk_rate*2
#else
#define _ch0_rx_ficlk_rate_new = _ch0_rx_ficlk_rate
#endif
#if _ch1_rx_data_width == "16" || _ch1_rx_data_width == "20"
#define _ch1_rx_ficlk_rate_new = _ch1_rx_ficlk_rate*2
#else
#define _ch1_rx_ficlk_rate_new = _ch1_rx_ficlk_rate
#endif
#if _ch2_rx_data_width == "16" || _ch2_rx_data_width == "20"
#define _ch2_rx_ficlk_rate_new = _ch2_rx_ficlk_rate*2
#else
#define _ch2_rx_ficlk_rate_new = _ch2_rx_ficlk_rate
#endif
#if _ch3_rx_data_width == "16" || _ch3_rx_data_width == "20"
#define _ch3_rx_ficlk_rate_new = _ch3_rx_ficlk_rate*2
#else
#define _ch3_rx_ficlk_rate_new = _ch3_rx_ficlk_rate
#endif
#if _ch0_tx_data_width == "16" || _ch0_tx_data_width == "20"
#define _ch0_tx_ficlk_rate_new = _ch0_tx_ficlk_rate*2
#else
#define _ch0_tx_ficlk_rate_new = _ch0_tx_ficlk_rate
#endif
#if _ch1_tx_data_width == "16" || _ch1_tx_data_width == "20"
#define _ch1_tx_ficlk_rate_new = _ch1_tx_ficlk_rate*2
#else
#define _ch1_tx_ficlk_rate_new = _ch1_tx_ficlk_rate
#endif
#if _ch2_tx_data_width == "16" || _ch2_tx_data_width == "20"
#define _ch2_tx_ficlk_rate_new = _ch2_tx_ficlk_rate*2
#else
#define _ch2_tx_ficlk_rate_new = _ch2_tx_ficlk_rate
#endif
#if _ch3_tx_data_width == "16" || _ch3_tx_data_width == "20"
#define _ch3_tx_ficlk_rate_new = _ch3_tx_ficlk_rate*2
#else
#define _ch3_tx_ficlk_rate_new = _ch3_tx_ficlk_rate
#endif
#define _ch0_rx_ficlk_rate_new_h = _ch0_rx_ficlk_rate_new/2
#define _ch1_rx_ficlk_rate_new_h = _ch1_rx_ficlk_rate_new/2
#define _ch2_rx_ficlk_rate_new_h = _ch2_rx_ficlk_rate_new/2
#define _ch3_rx_ficlk_rate_new_h = _ch3_rx_ficlk_rate_new/2
#define _ch0_tx_ficlk_rate_new_h = _ch0_tx_ficlk_rate_new/2
#define _ch1_tx_ficlk_rate_new_h = _ch1_tx_ficlk_rate_new/2
#define _ch2_tx_ficlk_rate_new_h = _ch2_tx_ficlk_rate_new/2
#define _ch3_tx_ficlk_rate_new_h = _ch3_tx_ficlk_rate_new/2

--synopsys translate_off

library pcsd_work;
use pcsd_work.all;
library IEEE;
use IEEE.std_logic_1164.all;

entity PCSD is
GENERIC(
  CONFIG_FILE : String;
  QUAD_MODE : String;
  CH0_CDR_SRC   : String := "REFCLK_EXT";
  CH1_CDR_SRC   : String := "REFCLK_EXT";
  CH2_CDR_SRC   : String := "REFCLK_EXT";
  CH3_CDR_SRC   : String := "REFCLK_EXT";
  PLL_SRC   : String
--  CONFIG_FILE : String  := #_circuit_name_new;
--  QUAD_MODE : String := "SINGLE";
--  CH0_CDR_SRC   : String := _ch0_pll_rxsrc;
--  CH1_CDR_SRC   : String := _ch1_pll_rxsrc;
--  CH2_CDR_SRC   : String := _ch2_pll_rxsrc;
--  CH3_CDR_SRC   : String := _ch3_pll_rxsrc;
--  PLL_SRC   : String := _pll_txsrc
  );
port (
  HDINN0             : in std_logic;
  HDINN1             : in std_logic;
  HDINN2             : in std_logic;
  HDINN3             : in std_logic;
  HDINP0             : in std_logic;
  HDINP1             : in std_logic;
  HDINP2             : in std_logic;
  HDINP3             : in std_logic;
  REFCLKN             : in std_logic;
  REFCLKP             : in std_logic;
  CIN0             : in std_logic;
  CIN1             : in std_logic;
  CIN2             : in std_logic;
  CIN3             : in std_logic;
  CIN4             : in std_logic;
  CIN5             : in std_logic;
  CIN6             : in std_logic;
  CIN7             : in std_logic;
  CIN8             : in std_logic;
  CIN9             : in std_logic;
  CIN10             : in std_logic;
  CIN11             : in std_logic;
  CYAWSTN             : in std_logic;
  FF_EBRD_CLK_0             : in std_logic;
  FF_EBRD_CLK_1             : in std_logic;
  FF_EBRD_CLK_2             : in std_logic;
  FF_EBRD_CLK_3             : in std_logic;
  FF_RXI_CLK_0             : in std_logic;
  FF_RXI_CLK_1             : in std_logic;
  FF_RXI_CLK_2             : in std_logic;
  FF_RXI_CLK_3             : in std_logic;
  FF_TX_D_0_0             : in std_logic;
  FF_TX_D_0_1             : in std_logic;
  FF_TX_D_0_2             : in std_logic;
  FF_TX_D_0_3             : in std_logic;
  FF_TX_D_0_4             : in std_logic;
  FF_TX_D_0_5             : in std_logic;
  FF_TX_D_0_6             : in std_logic;
  FF_TX_D_0_7             : in std_logic;
  FF_TX_D_0_8             : in std_logic;
  FF_TX_D_0_9             : in std_logic;
  FF_TX_D_0_10             : in std_logic;
  FF_TX_D_0_11             : in std_logic;
  FF_TX_D_0_12             : in std_logic;
  FF_TX_D_0_13             : in std_logic;
  FF_TX_D_0_14             : in std_logic;
  FF_TX_D_0_15             : in std_logic;
  FF_TX_D_0_16             : in std_logic;
  FF_TX_D_0_17             : in std_logic;
  FF_TX_D_0_18             : in std_logic;
  FF_TX_D_0_19             : in std_logic;
  FF_TX_D_0_20             : in std_logic;
  FF_TX_D_0_21             : in std_logic;
  FF_TX_D_0_22             : in std_logic;
  FF_TX_D_0_23             : in std_logic;
  FF_TX_D_1_0             : in std_logic;
  FF_TX_D_1_1             : in std_logic;
  FF_TX_D_1_2             : in std_logic;
  FF_TX_D_1_3             : in std_logic;
  FF_TX_D_1_4             : in std_logic;
  FF_TX_D_1_5             : in std_logic;
  FF_TX_D_1_6             : in std_logic;
  FF_TX_D_1_7             : in std_logic;
  FF_TX_D_1_8             : in std_logic;
  FF_TX_D_1_9             : in std_logic;
  FF_TX_D_1_10             : in std_logic;
  FF_TX_D_1_11             : in std_logic;
  FF_TX_D_1_12             : in std_logic;
  FF_TX_D_1_13             : in std_logic;
  FF_TX_D_1_14             : in std_logic;
  FF_TX_D_1_15             : in std_logic;
  FF_TX_D_1_16             : in std_logic;
  FF_TX_D_1_17             : in std_logic;
  FF_TX_D_1_18             : in std_logic;
  FF_TX_D_1_19             : in std_logic;
  FF_TX_D_1_20             : in std_logic;
  FF_TX_D_1_21             : in std_logic;
  FF_TX_D_1_22             : in std_logic;
  FF_TX_D_1_23             : in std_logic;
  FF_TX_D_2_0             : in std_logic;
  FF_TX_D_2_1             : in std_logic;
  FF_TX_D_2_2             : in std_logic;
  FF_TX_D_2_3             : in std_logic;
  FF_TX_D_2_4             : in std_logic;
  FF_TX_D_2_5             : in std_logic;
  FF_TX_D_2_6             : in std_logic;
  FF_TX_D_2_7             : in std_logic;
  FF_TX_D_2_8             : in std_logic;
  FF_TX_D_2_9             : in std_logic;
  FF_TX_D_2_10             : in std_logic;
  FF_TX_D_2_11             : in std_logic;
  FF_TX_D_2_12             : in std_logic;
  FF_TX_D_2_13             : in std_logic;
  FF_TX_D_2_14             : in std_logic;
  FF_TX_D_2_15             : in std_logic;
  FF_TX_D_2_16             : in std_logic;
  FF_TX_D_2_17             : in std_logic;
  FF_TX_D_2_18             : in std_logic;
  FF_TX_D_2_19             : in std_logic;
  FF_TX_D_2_20             : in std_logic;
  FF_TX_D_2_21             : in std_logic;
  FF_TX_D_2_22             : in std_logic;
  FF_TX_D_2_23             : in std_logic;
  FF_TX_D_3_0             : in std_logic;
  FF_TX_D_3_1             : in std_logic;
  FF_TX_D_3_2             : in std_logic;
  FF_TX_D_3_3             : in std_logic;
  FF_TX_D_3_4             : in std_logic;
  FF_TX_D_3_5             : in std_logic;
  FF_TX_D_3_6             : in std_logic;
  FF_TX_D_3_7             : in std_logic;
  FF_TX_D_3_8             : in std_logic;
  FF_TX_D_3_9             : in std_logic;
  FF_TX_D_3_10             : in std_logic;
  FF_TX_D_3_11             : in std_logic;
  FF_TX_D_3_12             : in std_logic;
  FF_TX_D_3_13             : in std_logic;
  FF_TX_D_3_14             : in std_logic;
  FF_TX_D_3_15             : in std_logic;
  FF_TX_D_3_16             : in std_logic;
  FF_TX_D_3_17             : in std_logic;
  FF_TX_D_3_18             : in std_logic;
  FF_TX_D_3_19             : in std_logic;
  FF_TX_D_3_20             : in std_logic;
  FF_TX_D_3_21             : in std_logic;
  FF_TX_D_3_22             : in std_logic;
  FF_TX_D_3_23             : in std_logic;
  FF_TXI_CLK_0             : in std_logic;
  FF_TXI_CLK_1             : in std_logic;
  FF_TXI_CLK_2             : in std_logic;
  FF_TXI_CLK_3             : in std_logic;
  FFC_CK_CORE_RX_0         : in std_logic;
  FFC_CK_CORE_RX_1         : in std_logic;
  FFC_CK_CORE_RX_2         : in std_logic;
  FFC_CK_CORE_RX_3         : in std_logic;
  FFC_CK_CORE_TX           : in std_logic;
  FFC_EI_EN_0             : in std_logic;
  FFC_EI_EN_1             : in std_logic;
  FFC_EI_EN_2             : in std_logic;
  FFC_EI_EN_3             : in std_logic;
  FFC_ENABLE_CGALIGN_0             : in std_logic;
  FFC_ENABLE_CGALIGN_1             : in std_logic;
  FFC_ENABLE_CGALIGN_2             : in std_logic;
  FFC_ENABLE_CGALIGN_3             : in std_logic;
  FFC_FB_LOOPBACK_0             : in std_logic;
  FFC_FB_LOOPBACK_1             : in std_logic;
  FFC_FB_LOOPBACK_2             : in std_logic;
  FFC_FB_LOOPBACK_3             : in std_logic;
  FFC_LANE_RX_RST_0             : in std_logic;
  FFC_LANE_RX_RST_1             : in std_logic;
  FFC_LANE_RX_RST_2             : in std_logic;
  FFC_LANE_RX_RST_3             : in std_logic;
  FFC_LANE_TX_RST_0             : in std_logic;
  FFC_LANE_TX_RST_1             : in std_logic;
  FFC_LANE_TX_RST_2             : in std_logic;
  FFC_LANE_TX_RST_3             : in std_logic;
  FFC_MACRO_RST             : in std_logic;
  FFC_PCI_DET_EN_0             : in std_logic;
  FFC_PCI_DET_EN_1             : in std_logic;
  FFC_PCI_DET_EN_2             : in std_logic;
  FFC_PCI_DET_EN_3             : in std_logic;
  FFC_PCIE_CT_0             : in std_logic;
  FFC_PCIE_CT_1             : in std_logic;
  FFC_PCIE_CT_2             : in std_logic;
  FFC_PCIE_CT_3             : in std_logic;
  FFC_PFIFO_CLR_0             : in std_logic;
  FFC_PFIFO_CLR_1             : in std_logic;
  FFC_PFIFO_CLR_2             : in std_logic;
  FFC_PFIFO_CLR_3             : in std_logic;
  FFC_QUAD_RST             : in std_logic;
  FFC_RRST_0             : in std_logic;
  FFC_RRST_1             : in std_logic;
  FFC_RRST_2             : in std_logic;
  FFC_RRST_3             : in std_logic;
  FFC_RXPWDNB_0             : in std_logic;
  FFC_RXPWDNB_1             : in std_logic;
  FFC_RXPWDNB_2             : in std_logic;
  FFC_RXPWDNB_3             : in std_logic;
  FFC_SB_INV_RX_0             : in std_logic;
  FFC_SB_INV_RX_1             : in std_logic;
  FFC_SB_INV_RX_2             : in std_logic;
  FFC_SB_INV_RX_3             : in std_logic;
  FFC_SB_PFIFO_LP_0             : in std_logic;
  FFC_SB_PFIFO_LP_1             : in std_logic;
  FFC_SB_PFIFO_LP_2             : in std_logic;
  FFC_SB_PFIFO_LP_3             : in std_logic;
  FFC_SIGNAL_DETECT_0             : in std_logic;
  FFC_SIGNAL_DETECT_1             : in std_logic;
  FFC_SIGNAL_DETECT_2             : in std_logic;
  FFC_SIGNAL_DETECT_3             : in std_logic;
  FFC_SYNC_TOGGLE             : in std_logic;
  FFC_TRST             : in std_logic;
  FFC_TXPWDNB_0             : in std_logic;
  FFC_TXPWDNB_1             : in std_logic;
  FFC_TXPWDNB_2             : in std_logic;
  FFC_TXPWDNB_3             : in std_logic;
  FFC_RATE_MODE_RX_0        : in std_logic;
  FFC_RATE_MODE_RX_1        : in std_logic;
  FFC_RATE_MODE_RX_2        : in std_logic;
  FFC_RATE_MODE_RX_3        : in std_logic;
  FFC_RATE_MODE_TX_0        : in std_logic;
  FFC_RATE_MODE_TX_1        : in std_logic;
  FFC_RATE_MODE_TX_2        : in std_logic;
  FFC_RATE_MODE_TX_3        : in std_logic;
  FFC_DIV11_MODE_RX_0       : in std_logic;
  FFC_DIV11_MODE_RX_1       : in std_logic;
  FFC_DIV11_MODE_RX_2       : in std_logic;
  FFC_DIV11_MODE_RX_3       : in std_logic;
  FFC_DIV11_MODE_TX_0       : in std_logic;
  FFC_DIV11_MODE_TX_1       : in std_logic;
  FFC_DIV11_MODE_TX_2       : in std_logic;
  FFC_DIV11_MODE_TX_3       : in std_logic;
  LDR_CORE2TX_0             : in std_logic;
  LDR_CORE2TX_1             : in std_logic;
  LDR_CORE2TX_2             : in std_logic;
  LDR_CORE2TX_3             : in std_logic;
  FFC_LDR_CORE2TX_EN_0      : in std_logic;
  FFC_LDR_CORE2TX_EN_1      : in std_logic;
  FFC_LDR_CORE2TX_EN_2      : in std_logic;
  FFC_LDR_CORE2TX_EN_3      : in std_logic;
  PCIE_POWERDOWN_0_0      : in std_logic;
  PCIE_POWERDOWN_0_1      : in std_logic;
  PCIE_POWERDOWN_1_0      : in std_logic;
  PCIE_POWERDOWN_1_1      : in std_logic;
  PCIE_POWERDOWN_2_0      : in std_logic;
  PCIE_POWERDOWN_2_1      : in std_logic;
  PCIE_POWERDOWN_3_0      : in std_logic;
  PCIE_POWERDOWN_3_1      : in std_logic;
  PCIE_RXPOLARITY_0         : in std_logic;
  PCIE_RXPOLARITY_1         : in std_logic;
  PCIE_RXPOLARITY_2         : in std_logic;
  PCIE_RXPOLARITY_3         : in std_logic;
  PCIE_TXCOMPLIANCE_0       : in std_logic;
  PCIE_TXCOMPLIANCE_1       : in std_logic;
  PCIE_TXCOMPLIANCE_2       : in std_logic;
  PCIE_TXCOMPLIANCE_3       : in std_logic;
  PCIE_TXDETRX_PR2TLB_0     : in std_logic;
  PCIE_TXDETRX_PR2TLB_1     : in std_logic;
  PCIE_TXDETRX_PR2TLB_2     : in std_logic;
  PCIE_TXDETRX_PR2TLB_3     : in std_logic;
  SCIADDR0             : in std_logic;
  SCIADDR1             : in std_logic;
  SCIADDR2             : in std_logic;
  SCIADDR3             : in std_logic;
  SCIADDR4             : in std_logic;
  SCIADDR5             : in std_logic;
  SCIENAUX             : in std_logic;
  SCIENCH0             : in std_logic;
  SCIENCH1             : in std_logic;
  SCIENCH2             : in std_logic;
  SCIENCH3             : in std_logic;
  SCIRD                : in std_logic;
  SCISELAUX             : in std_logic;
  SCISELCH0             : in std_logic;
  SCISELCH1             : in std_logic;
  SCISELCH2             : in std_logic;
  SCISELCH3             : in std_logic;
  SCIWDATA0             : in std_logic;
  SCIWDATA1             : in std_logic;
  SCIWDATA2             : in std_logic;
  SCIWDATA3             : in std_logic;
  SCIWDATA4             : in std_logic;
  SCIWDATA5             : in std_logic;
  SCIWDATA6             : in std_logic;
  SCIWDATA7             : in std_logic;
  SCIWSTN               : in std_logic;
  REFCLK_FROM_NQ        : in std_logic;

  HDOUTN0             : out std_logic;
  HDOUTN1             : out std_logic;
  HDOUTN2             : out std_logic;
  HDOUTN3             : out std_logic;
  HDOUTP0             : out std_logic;
  HDOUTP1             : out std_logic;
  HDOUTP2             : out std_logic;
  HDOUTP3             : out std_logic;
  COUT0             : out std_logic;
  COUT1             : out std_logic;
  COUT2             : out std_logic;
  COUT3             : out std_logic;
  COUT4             : out std_logic;
  COUT5             : out std_logic;
  COUT6             : out std_logic;
  COUT7             : out std_logic;
  COUT8             : out std_logic;
  COUT9             : out std_logic;
  COUT10             : out std_logic;
  COUT11             : out std_logic;
  COUT12             : out std_logic;
  COUT13             : out std_logic;
  COUT14             : out std_logic;
  COUT15             : out std_logic;
  COUT16             : out std_logic;
  COUT17             : out std_logic;
  COUT18             : out std_logic;
  COUT19             : out std_logic;
  FF_RX_D_0_0             : out std_logic;
  FF_RX_D_0_1             : out std_logic;
  FF_RX_D_0_2             : out std_logic;
  FF_RX_D_0_3             : out std_logic;
  FF_RX_D_0_4             : out std_logic;
  FF_RX_D_0_5             : out std_logic;
  FF_RX_D_0_6             : out std_logic;
  FF_RX_D_0_7             : out std_logic;
  FF_RX_D_0_8             : out std_logic;
  FF_RX_D_0_9             : out std_logic;
  FF_RX_D_0_10             : out std_logic;
  FF_RX_D_0_11             : out std_logic;
  FF_RX_D_0_12             : out std_logic;
  FF_RX_D_0_13             : out std_logic;
  FF_RX_D_0_14             : out std_logic;
  FF_RX_D_0_15             : out std_logic;
  FF_RX_D_0_16             : out std_logic;
  FF_RX_D_0_17             : out std_logic;
  FF_RX_D_0_18             : out std_logic;
  FF_RX_D_0_19             : out std_logic;
  FF_RX_D_0_20             : out std_logic;
  FF_RX_D_0_21             : out std_logic;
  FF_RX_D_0_22             : out std_logic;
  FF_RX_D_0_23             : out std_logic;
  FF_RX_D_1_0             : out std_logic;
  FF_RX_D_1_1             : out std_logic;
  FF_RX_D_1_2             : out std_logic;
  FF_RX_D_1_3             : out std_logic;
  FF_RX_D_1_4             : out std_logic;
  FF_RX_D_1_5             : out std_logic;
  FF_RX_D_1_6             : out std_logic;
  FF_RX_D_1_7             : out std_logic;
  FF_RX_D_1_8             : out std_logic;
  FF_RX_D_1_9             : out std_logic;
  FF_RX_D_1_10             : out std_logic;
  FF_RX_D_1_11             : out std_logic;
  FF_RX_D_1_12             : out std_logic;
  FF_RX_D_1_13             : out std_logic;
  FF_RX_D_1_14             : out std_logic;
  FF_RX_D_1_15             : out std_logic;
  FF_RX_D_1_16             : out std_logic;
  FF_RX_D_1_17             : out std_logic;
  FF_RX_D_1_18             : out std_logic;
  FF_RX_D_1_19             : out std_logic;
  FF_RX_D_1_20             : out std_logic;
  FF_RX_D_1_21             : out std_logic;
  FF_RX_D_1_22             : out std_logic;
  FF_RX_D_1_23             : out std_logic;
  FF_RX_D_2_0             : out std_logic;
  FF_RX_D_2_1             : out std_logic;
  FF_RX_D_2_2             : out std_logic;
  FF_RX_D_2_3             : out std_logic;
  FF_RX_D_2_4             : out std_logic;
  FF_RX_D_2_5             : out std_logic;
  FF_RX_D_2_6             : out std_logic;
  FF_RX_D_2_7             : out std_logic;
  FF_RX_D_2_8             : out std_logic;
  FF_RX_D_2_9             : out std_logic;
  FF_RX_D_2_10             : out std_logic;
  FF_RX_D_2_11             : out std_logic;
  FF_RX_D_2_12             : out std_logic;
  FF_RX_D_2_13             : out std_logic;
  FF_RX_D_2_14             : out std_logic;
  FF_RX_D_2_15             : out std_logic;
  FF_RX_D_2_16             : out std_logic;
  FF_RX_D_2_17             : out std_logic;
  FF_RX_D_2_18             : out std_logic;
  FF_RX_D_2_19             : out std_logic;
  FF_RX_D_2_20             : out std_logic;
  FF_RX_D_2_21             : out std_logic;
  FF_RX_D_2_22             : out std_logic;
  FF_RX_D_2_23             : out std_logic;
  FF_RX_D_3_0             : out std_logic;
  FF_RX_D_3_1             : out std_logic;
  FF_RX_D_3_2             : out std_logic;
  FF_RX_D_3_3             : out std_logic;
  FF_RX_D_3_4             : out std_logic;
  FF_RX_D_3_5             : out std_logic;
  FF_RX_D_3_6             : out std_logic;
  FF_RX_D_3_7             : out std_logic;
  FF_RX_D_3_8             : out std_logic;
  FF_RX_D_3_9             : out std_logic;
  FF_RX_D_3_10             : out std_logic;
  FF_RX_D_3_11             : out std_logic;
  FF_RX_D_3_12             : out std_logic;
  FF_RX_D_3_13             : out std_logic;
  FF_RX_D_3_14             : out std_logic;
  FF_RX_D_3_15             : out std_logic;
  FF_RX_D_3_16             : out std_logic;
  FF_RX_D_3_17             : out std_logic;
  FF_RX_D_3_18             : out std_logic;
  FF_RX_D_3_19             : out std_logic;
  FF_RX_D_3_20             : out std_logic;
  FF_RX_D_3_21             : out std_logic;
  FF_RX_D_3_22             : out std_logic;
  FF_RX_D_3_23             : out std_logic;
  FF_RX_F_CLK_0             : out std_logic;
  FF_RX_F_CLK_1             : out std_logic;
  FF_RX_F_CLK_2             : out std_logic;
  FF_RX_F_CLK_3             : out std_logic;
  FF_RX_H_CLK_0             : out std_logic;
  FF_RX_H_CLK_1             : out std_logic;
  FF_RX_H_CLK_2             : out std_logic;
  FF_RX_H_CLK_3             : out std_logic;
  FF_TX_F_CLK_0             : out std_logic;
  FF_TX_F_CLK_1             : out std_logic;
  FF_TX_F_CLK_2             : out std_logic;
  FF_TX_F_CLK_3             : out std_logic;
  FF_TX_H_CLK_0             : out std_logic;
  FF_TX_H_CLK_1             : out std_logic;
  FF_TX_H_CLK_2             : out std_logic;
  FF_TX_H_CLK_3             : out std_logic;
  FFS_CC_OVERRUN_0             : out std_logic;
  FFS_CC_OVERRUN_1             : out std_logic;
  FFS_CC_OVERRUN_2             : out std_logic;
  FFS_CC_OVERRUN_3             : out std_logic;
  FFS_CC_UNDERRUN_0             : out std_logic;
  FFS_CC_UNDERRUN_1             : out std_logic;
  FFS_CC_UNDERRUN_2             : out std_logic;
  FFS_CC_UNDERRUN_3             : out std_logic;
  FFS_LS_SYNC_STATUS_0             : out std_logic;
  FFS_LS_SYNC_STATUS_1             : out std_logic;
  FFS_LS_SYNC_STATUS_2             : out std_logic;
  FFS_LS_SYNC_STATUS_3             : out std_logic;
  FFS_CDR_TRAIN_DONE_0             : out std_logic;
  FFS_CDR_TRAIN_DONE_1             : out std_logic;
  FFS_CDR_TRAIN_DONE_2             : out std_logic;
  FFS_CDR_TRAIN_DONE_3             : out std_logic;
  FFS_PCIE_CON_0             : out std_logic;
  FFS_PCIE_CON_1             : out std_logic;
  FFS_PCIE_CON_2             : out std_logic;
  FFS_PCIE_CON_3             : out std_logic;
  FFS_PCIE_DONE_0             : out std_logic;
  FFS_PCIE_DONE_1             : out std_logic;
  FFS_PCIE_DONE_2             : out std_logic;
  FFS_PCIE_DONE_3             : out std_logic;
  FFS_PLOL             : out std_logic;
  FFS_RLOL_0             : out std_logic;
  FFS_RLOL_1             : out std_logic;
  FFS_RLOL_2             : out std_logic;
  FFS_RLOL_3             : out std_logic;
  FFS_RLOS_HI_0             : out std_logic;
  FFS_RLOS_HI_1             : out std_logic;
  FFS_RLOS_HI_2             : out std_logic;
  FFS_RLOS_HI_3             : out std_logic;
  FFS_RLOS_LO_0             : out std_logic;
  FFS_RLOS_LO_1             : out std_logic;
  FFS_RLOS_LO_2             : out std_logic;
  FFS_RLOS_LO_3             : out std_logic;
  FFS_RXFBFIFO_ERROR_0             : out std_logic;
  FFS_RXFBFIFO_ERROR_1             : out std_logic;
  FFS_RXFBFIFO_ERROR_2             : out std_logic;
  FFS_RXFBFIFO_ERROR_3             : out std_logic;
  FFS_TXFBFIFO_ERROR_0             : out std_logic;
  FFS_TXFBFIFO_ERROR_1             : out std_logic;
  FFS_TXFBFIFO_ERROR_2             : out std_logic;
  FFS_TXFBFIFO_ERROR_3             : out std_logic;
  PCIE_PHYSTATUS_0             : out std_logic;
  PCIE_PHYSTATUS_1             : out std_logic;
  PCIE_PHYSTATUS_2             : out std_logic;
  PCIE_PHYSTATUS_3             : out std_logic;
  PCIE_RXVALID_0               : out std_logic;
  PCIE_RXVALID_1               : out std_logic;
  PCIE_RXVALID_2               : out std_logic;
  PCIE_RXVALID_3               : out std_logic;
  FFS_SKP_ADDED_0                  : out std_logic;
  FFS_SKP_ADDED_1                  : out std_logic;
  FFS_SKP_ADDED_2                  : out std_logic;
  FFS_SKP_ADDED_3                  : out std_logic;
  FFS_SKP_DELETED_0                : out std_logic;
  FFS_SKP_DELETED_1                : out std_logic;
  FFS_SKP_DELETED_2                : out std_logic;
  FFS_SKP_DELETED_3                : out std_logic;
  LDR_RX2CORE_0                    : out std_logic;
  LDR_RX2CORE_1                    : out std_logic;
  LDR_RX2CORE_2                    : out std_logic;
  LDR_RX2CORE_3                    : out std_logic;
  REFCK2CORE             : out std_logic;
  SCIINT                : out std_logic;
  SCIRDATA0             : out std_logic;
  SCIRDATA1             : out std_logic;
  SCIRDATA2             : out std_logic;
  SCIRDATA3             : out std_logic;
  SCIRDATA4             : out std_logic;
  SCIRDATA5             : out std_logic;
  SCIRDATA6             : out std_logic;
  SCIRDATA7             : out std_logic;
  REFCLK_TO_NQ          : out std_logic
);

end PCSD;

architecture PCSD_arch of PCSD is


component PCSD_sim
GENERIC(
  CONFIG_FILE : String;
  QUAD_MODE : String;
  CH0_CDR_SRC   : String;
  CH1_CDR_SRC   : String;
  CH2_CDR_SRC   : String;
  CH3_CDR_SRC   : String;
  PLL_SRC   : String
  );
port (
  HDINN0             : in std_logic;
  HDINN1             : in std_logic;
  HDINN2             : in std_logic;
  HDINN3             : in std_logic;
  HDINP0             : in std_logic;
  HDINP1             : in std_logic;
  HDINP2             : in std_logic;
  HDINP3             : in std_logic;
  REFCLKN             : in std_logic;
  REFCLKP             : in std_logic;
  CIN0             : in std_logic;
  CIN1             : in std_logic;
  CIN2             : in std_logic;
  CIN3             : in std_logic;
  CIN4             : in std_logic;
  CIN5             : in std_logic;
  CIN6             : in std_logic;
  CIN7             : in std_logic;
  CIN8             : in std_logic;
  CIN9             : in std_logic;
  CIN10             : in std_logic;
  CIN11             : in std_logic;
  CYAWSTN             : in std_logic;
  FF_EBRD_CLK_0             : in std_logic;
  FF_EBRD_CLK_1             : in std_logic;
  FF_EBRD_CLK_2             : in std_logic;
  FF_EBRD_CLK_3             : in std_logic;
  FF_RXI_CLK_0             : in std_logic;
  FF_RXI_CLK_1             : in std_logic;
  FF_RXI_CLK_2             : in std_logic;
  FF_RXI_CLK_3             : in std_logic;
  FF_TX_D_0_0             : in std_logic;
  FF_TX_D_0_1             : in std_logic;
  FF_TX_D_0_2             : in std_logic;
  FF_TX_D_0_3             : in std_logic;
  FF_TX_D_0_4             : in std_logic;
  FF_TX_D_0_5             : in std_logic;
  FF_TX_D_0_6             : in std_logic;
  FF_TX_D_0_7             : in std_logic;
  FF_TX_D_0_8             : in std_logic;
  FF_TX_D_0_9             : in std_logic;
  FF_TX_D_0_10             : in std_logic;
  FF_TX_D_0_11             : in std_logic;
  FF_TX_D_0_12             : in std_logic;
  FF_TX_D_0_13             : in std_logic;
  FF_TX_D_0_14             : in std_logic;
  FF_TX_D_0_15             : in std_logic;
  FF_TX_D_0_16             : in std_logic;
  FF_TX_D_0_17             : in std_logic;
  FF_TX_D_0_18             : in std_logic;
  FF_TX_D_0_19             : in std_logic;
  FF_TX_D_0_20             : in std_logic;
  FF_TX_D_0_21             : in std_logic;
  FF_TX_D_0_22             : in std_logic;
  FF_TX_D_0_23             : in std_logic;
  FF_TX_D_1_0             : in std_logic;
  FF_TX_D_1_1             : in std_logic;
  FF_TX_D_1_2             : in std_logic;
  FF_TX_D_1_3             : in std_logic;
  FF_TX_D_1_4             : in std_logic;
  FF_TX_D_1_5             : in std_logic;
  FF_TX_D_1_6             : in std_logic;
  FF_TX_D_1_7             : in std_logic;
  FF_TX_D_1_8             : in std_logic;
  FF_TX_D_1_9             : in std_logic;
  FF_TX_D_1_10             : in std_logic;
  FF_TX_D_1_11             : in std_logic;
  FF_TX_D_1_12             : in std_logic;
  FF_TX_D_1_13             : in std_logic;
  FF_TX_D_1_14             : in std_logic;
  FF_TX_D_1_15             : in std_logic;
  FF_TX_D_1_16             : in std_logic;
  FF_TX_D_1_17             : in std_logic;
  FF_TX_D_1_18             : in std_logic;
  FF_TX_D_1_19             : in std_logic;
  FF_TX_D_1_20             : in std_logic;
  FF_TX_D_1_21             : in std_logic;
  FF_TX_D_1_22             : in std_logic;
  FF_TX_D_1_23             : in std_logic;
  FF_TX_D_2_0             : in std_logic;
  FF_TX_D_2_1             : in std_logic;
  FF_TX_D_2_2             : in std_logic;
  FF_TX_D_2_3             : in std_logic;
  FF_TX_D_2_4             : in std_logic;
  FF_TX_D_2_5             : in std_logic;
  FF_TX_D_2_6             : in std_logic;
  FF_TX_D_2_7             : in std_logic;
  FF_TX_D_2_8             : in std_logic;
  FF_TX_D_2_9             : in std_logic;
  FF_TX_D_2_10             : in std_logic;
  FF_TX_D_2_11             : in std_logic;
  FF_TX_D_2_12             : in std_logic;
  FF_TX_D_2_13             : in std_logic;
  FF_TX_D_2_14             : in std_logic;
  FF_TX_D_2_15             : in std_logic;
  FF_TX_D_2_16             : in std_logic;
  FF_TX_D_2_17             : in std_logic;
  FF_TX_D_2_18             : in std_logic;
  FF_TX_D_2_19             : in std_logic;
  FF_TX_D_2_20             : in std_logic;
  FF_TX_D_2_21             : in std_logic;
  FF_TX_D_2_22             : in std_logic;
  FF_TX_D_2_23             : in std_logic;
  FF_TX_D_3_0             : in std_logic;
  FF_TX_D_3_1             : in std_logic;
  FF_TX_D_3_2             : in std_logic;
  FF_TX_D_3_3             : in std_logic;
  FF_TX_D_3_4             : in std_logic;
  FF_TX_D_3_5             : in std_logic;
  FF_TX_D_3_6             : in std_logic;
  FF_TX_D_3_7             : in std_logic;
  FF_TX_D_3_8             : in std_logic;
  FF_TX_D_3_9             : in std_logic;
  FF_TX_D_3_10             : in std_logic;
  FF_TX_D_3_11             : in std_logic;
  FF_TX_D_3_12             : in std_logic;
  FF_TX_D_3_13             : in std_logic;
  FF_TX_D_3_14             : in std_logic;
  FF_TX_D_3_15             : in std_logic;
  FF_TX_D_3_16             : in std_logic;
  FF_TX_D_3_17             : in std_logic;
  FF_TX_D_3_18             : in std_logic;
  FF_TX_D_3_19             : in std_logic;
  FF_TX_D_3_20             : in std_logic;
  FF_TX_D_3_21             : in std_logic;
  FF_TX_D_3_22             : in std_logic;
  FF_TX_D_3_23             : in std_logic;
  FF_TXI_CLK_0             : in std_logic;
  FF_TXI_CLK_1             : in std_logic;
  FF_TXI_CLK_2             : in std_logic;
  FF_TXI_CLK_3             : in std_logic;
  FFC_CK_CORE_RX_0         : in std_logic;
  FFC_CK_CORE_RX_1         : in std_logic;
  FFC_CK_CORE_RX_2         : in std_logic;
  FFC_CK_CORE_RX_3         : in std_logic;
  FFC_CK_CORE_TX           : in std_logic;
  FFC_EI_EN_0             : in std_logic;
  FFC_EI_EN_1             : in std_logic;
  FFC_EI_EN_2             : in std_logic;
  FFC_EI_EN_3             : in std_logic;
  FFC_ENABLE_CGALIGN_0             : in std_logic;
  FFC_ENABLE_CGALIGN_1             : in std_logic;
  FFC_ENABLE_CGALIGN_2             : in std_logic;
  FFC_ENABLE_CGALIGN_3             : in std_logic;
  FFC_FB_LOOPBACK_0             : in std_logic;
  FFC_FB_LOOPBACK_1             : in std_logic;
  FFC_FB_LOOPBACK_2             : in std_logic;
  FFC_FB_LOOPBACK_3             : in std_logic;
  FFC_LANE_RX_RST_0             : in std_logic;
  FFC_LANE_RX_RST_1             : in std_logic;
  FFC_LANE_RX_RST_2             : in std_logic;
  FFC_LANE_RX_RST_3             : in std_logic;
  FFC_LANE_TX_RST_0             : in std_logic;
  FFC_LANE_TX_RST_1             : in std_logic;
  FFC_LANE_TX_RST_2             : in std_logic;
  FFC_LANE_TX_RST_3             : in std_logic;
  FFC_MACRO_RST             : in std_logic;
  FFC_PCI_DET_EN_0             : in std_logic;
  FFC_PCI_DET_EN_1             : in std_logic;
  FFC_PCI_DET_EN_2             : in std_logic;
  FFC_PCI_DET_EN_3             : in std_logic;
  FFC_PCIE_CT_0             : in std_logic;
  FFC_PCIE_CT_1             : in std_logic;
  FFC_PCIE_CT_2             : in std_logic;
  FFC_PCIE_CT_3             : in std_logic;
  FFC_PFIFO_CLR_0             : in std_logic;
  FFC_PFIFO_CLR_1             : in std_logic;
  FFC_PFIFO_CLR_2             : in std_logic;
  FFC_PFIFO_CLR_3             : in std_logic;
  FFC_QUAD_RST             : in std_logic;
  FFC_RRST_0             : in std_logic;
  FFC_RRST_1             : in std_logic;
  FFC_RRST_2             : in std_logic;
  FFC_RRST_3             : in std_logic;
  FFC_RXPWDNB_0             : in std_logic;
  FFC_RXPWDNB_1             : in std_logic;
  FFC_RXPWDNB_2             : in std_logic;
  FFC_RXPWDNB_3             : in std_logic;
  FFC_SB_INV_RX_0             : in std_logic;
  FFC_SB_INV_RX_1             : in std_logic;
  FFC_SB_INV_RX_2             : in std_logic;
  FFC_SB_INV_RX_3             : in std_logic;
  FFC_SB_PFIFO_LP_0             : in std_logic;
  FFC_SB_PFIFO_LP_1             : in std_logic;
  FFC_SB_PFIFO_LP_2             : in std_logic;
  FFC_SB_PFIFO_LP_3             : in std_logic;
  FFC_SIGNAL_DETECT_0             : in std_logic;
  FFC_SIGNAL_DETECT_1             : in std_logic;
  FFC_SIGNAL_DETECT_2             : in std_logic;
  FFC_SIGNAL_DETECT_3             : in std_logic;
  FFC_SYNC_TOGGLE             : in std_logic;
  FFC_TRST             : in std_logic;
  FFC_TXPWDNB_0             : in std_logic;
  FFC_TXPWDNB_1             : in std_logic;
  FFC_TXPWDNB_2             : in std_logic;
  FFC_TXPWDNB_3             : in std_logic;
  FFC_RATE_MODE_RX_0        : in std_logic;
  FFC_RATE_MODE_RX_1        : in std_logic;
  FFC_RATE_MODE_RX_2        : in std_logic;
  FFC_RATE_MODE_RX_3        : in std_logic;
  FFC_RATE_MODE_TX_0        : in std_logic;
  FFC_RATE_MODE_TX_1        : in std_logic;
  FFC_RATE_MODE_TX_2        : in std_logic;
  FFC_RATE_MODE_TX_3        : in std_logic;
  FFC_DIV11_MODE_RX_0       : in std_logic;
  FFC_DIV11_MODE_RX_1       : in std_logic;
  FFC_DIV11_MODE_RX_2       : in std_logic;
  FFC_DIV11_MODE_RX_3       : in std_logic;
  FFC_DIV11_MODE_TX_0       : in std_logic;
  FFC_DIV11_MODE_TX_1       : in std_logic;
  FFC_DIV11_MODE_TX_2       : in std_logic;
  FFC_DIV11_MODE_TX_3       : in std_logic;
  LDR_CORE2TX_0             : in std_logic;
  LDR_CORE2TX_1             : in std_logic;
  LDR_CORE2TX_2             : in std_logic;
  LDR_CORE2TX_3             : in std_logic;
  FFC_LDR_CORE2TX_EN_0      : in std_logic;
  FFC_LDR_CORE2TX_EN_1      : in std_logic;
  FFC_LDR_CORE2TX_EN_2      : in std_logic;
  FFC_LDR_CORE2TX_EN_3      : in std_logic;
  PCIE_POWERDOWN_0_0      : in std_logic;
  PCIE_POWERDOWN_0_1      : in std_logic;
  PCIE_POWERDOWN_1_0      : in std_logic;
  PCIE_POWERDOWN_1_1      : in std_logic;
  PCIE_POWERDOWN_2_0      : in std_logic;
  PCIE_POWERDOWN_2_1      : in std_logic;
  PCIE_POWERDOWN_3_0      : in std_logic;
  PCIE_POWERDOWN_3_1      : in std_logic;
  PCIE_RXPOLARITY_0         : in std_logic;
  PCIE_RXPOLARITY_1         : in std_logic;
  PCIE_RXPOLARITY_2         : in std_logic;
  PCIE_RXPOLARITY_3         : in std_logic;
  PCIE_TXCOMPLIANCE_0       : in std_logic;
  PCIE_TXCOMPLIANCE_1       : in std_logic;
  PCIE_TXCOMPLIANCE_2       : in std_logic;
  PCIE_TXCOMPLIANCE_3       : in std_logic;
  PCIE_TXDETRX_PR2TLB_0     : in std_logic;
  PCIE_TXDETRX_PR2TLB_1     : in std_logic;
  PCIE_TXDETRX_PR2TLB_2     : in std_logic;
  PCIE_TXDETRX_PR2TLB_3     : in std_logic;
  SCIADDR0             : in std_logic;
  SCIADDR1             : in std_logic;
  SCIADDR2             : in std_logic;
  SCIADDR3             : in std_logic;
  SCIADDR4             : in std_logic;
  SCIADDR5             : in std_logic;
  SCIENAUX             : in std_logic;
  SCIENCH0             : in std_logic;
  SCIENCH1             : in std_logic;
  SCIENCH2             : in std_logic;
  SCIENCH3             : in std_logic;
  SCIRD                : in std_logic;
  SCISELAUX             : in std_logic;
  SCISELCH0             : in std_logic;
  SCISELCH1             : in std_logic;
  SCISELCH2             : in std_logic;
  SCISELCH3             : in std_logic;
  SCIWDATA0             : in std_logic;
  SCIWDATA1             : in std_logic;
  SCIWDATA2             : in std_logic;
  SCIWDATA3             : in std_logic;
  SCIWDATA4             : in std_logic;
  SCIWDATA5             : in std_logic;
  SCIWDATA6             : in std_logic;
  SCIWDATA7             : in std_logic;
  SCIWSTN               : in std_logic;
  REFCLK_FROM_NQ        : in std_logic;

  HDOUTN0             : out std_logic;
  HDOUTN1             : out std_logic;
  HDOUTN2             : out std_logic;
  HDOUTN3             : out std_logic;
  HDOUTP0             : out std_logic;
  HDOUTP1             : out std_logic;
  HDOUTP2             : out std_logic;
  HDOUTP3             : out std_logic;
  COUT0             : out std_logic;
  COUT1             : out std_logic;
  COUT2             : out std_logic;
  COUT3             : out std_logic;
  COUT4             : out std_logic;
  COUT5             : out std_logic;
  COUT6             : out std_logic;
  COUT7             : out std_logic;
  COUT8             : out std_logic;
  COUT9             : out std_logic;
  COUT10             : out std_logic;
  COUT11             : out std_logic;
  COUT12             : out std_logic;
  COUT13             : out std_logic;
  COUT14             : out std_logic;
  COUT15             : out std_logic;
  COUT16             : out std_logic;
  COUT17             : out std_logic;
  COUT18             : out std_logic;
  COUT19             : out std_logic;
  FF_RX_D_0_0             : out std_logic;
  FF_RX_D_0_1             : out std_logic;
  FF_RX_D_0_2             : out std_logic;
  FF_RX_D_0_3             : out std_logic;
  FF_RX_D_0_4             : out std_logic;
  FF_RX_D_0_5             : out std_logic;
  FF_RX_D_0_6             : out std_logic;
  FF_RX_D_0_7             : out std_logic;
  FF_RX_D_0_8             : out std_logic;
  FF_RX_D_0_9             : out std_logic;
  FF_RX_D_0_10             : out std_logic;
  FF_RX_D_0_11             : out std_logic;
  FF_RX_D_0_12             : out std_logic;
  FF_RX_D_0_13             : out std_logic;
  FF_RX_D_0_14             : out std_logic;
  FF_RX_D_0_15             : out std_logic;
  FF_RX_D_0_16             : out std_logic;
  FF_RX_D_0_17             : out std_logic;
  FF_RX_D_0_18             : out std_logic;
  FF_RX_D_0_19             : out std_logic;
  FF_RX_D_0_20             : out std_logic;
  FF_RX_D_0_21             : out std_logic;
  FF_RX_D_0_22             : out std_logic;
  FF_RX_D_0_23             : out std_logic;
  FF_RX_D_1_0             : out std_logic;
  FF_RX_D_1_1             : out std_logic;
  FF_RX_D_1_2             : out std_logic;
  FF_RX_D_1_3             : out std_logic;
  FF_RX_D_1_4             : out std_logic;
  FF_RX_D_1_5             : out std_logic;
  FF_RX_D_1_6             : out std_logic;
  FF_RX_D_1_7             : out std_logic;
  FF_RX_D_1_8             : out std_logic;
  FF_RX_D_1_9             : out std_logic;
  FF_RX_D_1_10             : out std_logic;
  FF_RX_D_1_11             : out std_logic;
  FF_RX_D_1_12             : out std_logic;
  FF_RX_D_1_13             : out std_logic;
  FF_RX_D_1_14             : out std_logic;
  FF_RX_D_1_15             : out std_logic;
  FF_RX_D_1_16             : out std_logic;
  FF_RX_D_1_17             : out std_logic;
  FF_RX_D_1_18             : out std_logic;
  FF_RX_D_1_19             : out std_logic;
  FF_RX_D_1_20             : out std_logic;
  FF_RX_D_1_21             : out std_logic;
  FF_RX_D_1_22             : out std_logic;
  FF_RX_D_1_23             : out std_logic;
  FF_RX_D_2_0             : out std_logic;
  FF_RX_D_2_1             : out std_logic;
  FF_RX_D_2_2             : out std_logic;
  FF_RX_D_2_3             : out std_logic;
  FF_RX_D_2_4             : out std_logic;
  FF_RX_D_2_5             : out std_logic;
  FF_RX_D_2_6             : out std_logic;
  FF_RX_D_2_7             : out std_logic;
  FF_RX_D_2_8             : out std_logic;
  FF_RX_D_2_9             : out std_logic;
  FF_RX_D_2_10             : out std_logic;
  FF_RX_D_2_11             : out std_logic;
  FF_RX_D_2_12             : out std_logic;
  FF_RX_D_2_13             : out std_logic;
  FF_RX_D_2_14             : out std_logic;
  FF_RX_D_2_15             : out std_logic;
  FF_RX_D_2_16             : out std_logic;
  FF_RX_D_2_17             : out std_logic;
  FF_RX_D_2_18             : out std_logic;
  FF_RX_D_2_19             : out std_logic;
  FF_RX_D_2_20             : out std_logic;
  FF_RX_D_2_21             : out std_logic;
  FF_RX_D_2_22             : out std_logic;
  FF_RX_D_2_23             : out std_logic;
  FF_RX_D_3_0             : out std_logic;
  FF_RX_D_3_1             : out std_logic;
  FF_RX_D_3_2             : out std_logic;
  FF_RX_D_3_3             : out std_logic;
  FF_RX_D_3_4             : out std_logic;
  FF_RX_D_3_5             : out std_logic;
  FF_RX_D_3_6             : out std_logic;
  FF_RX_D_3_7             : out std_logic;
  FF_RX_D_3_8             : out std_logic;
  FF_RX_D_3_9             : out std_logic;
  FF_RX_D_3_10             : out std_logic;
  FF_RX_D_3_11             : out std_logic;
  FF_RX_D_3_12             : out std_logic;
  FF_RX_D_3_13             : out std_logic;
  FF_RX_D_3_14             : out std_logic;
  FF_RX_D_3_15             : out std_logic;
  FF_RX_D_3_16             : out std_logic;
  FF_RX_D_3_17             : out std_logic;
  FF_RX_D_3_18             : out std_logic;
  FF_RX_D_3_19             : out std_logic;
  FF_RX_D_3_20             : out std_logic;
  FF_RX_D_3_21             : out std_logic;
  FF_RX_D_3_22             : out std_logic;
  FF_RX_D_3_23             : out std_logic;
  FF_RX_F_CLK_0             : out std_logic;
  FF_RX_F_CLK_1             : out std_logic;
  FF_RX_F_CLK_2             : out std_logic;
  FF_RX_F_CLK_3             : out std_logic;
  FF_RX_H_CLK_0             : out std_logic;
  FF_RX_H_CLK_1             : out std_logic;
  FF_RX_H_CLK_2             : out std_logic;
  FF_RX_H_CLK_3             : out std_logic;
  FF_TX_F_CLK_0             : out std_logic;
  FF_TX_F_CLK_1             : out std_logic;
  FF_TX_F_CLK_2             : out std_logic;
  FF_TX_F_CLK_3             : out std_logic;
  FF_TX_H_CLK_0             : out std_logic;
  FF_TX_H_CLK_1             : out std_logic;
  FF_TX_H_CLK_2             : out std_logic;
  FF_TX_H_CLK_3             : out std_logic;
  FFS_CC_OVERRUN_0             : out std_logic;
  FFS_CC_OVERRUN_1             : out std_logic;
  FFS_CC_OVERRUN_2             : out std_logic;
  FFS_CC_OVERRUN_3             : out std_logic;
  FFS_CC_UNDERRUN_0             : out std_logic;
  FFS_CC_UNDERRUN_1             : out std_logic;
  FFS_CC_UNDERRUN_2             : out std_logic;
  FFS_CC_UNDERRUN_3             : out std_logic;
  FFS_LS_SYNC_STATUS_0             : out std_logic;
  FFS_LS_SYNC_STATUS_1             : out std_logic;
  FFS_LS_SYNC_STATUS_2             : out std_logic;
  FFS_LS_SYNC_STATUS_3             : out std_logic;
  FFS_CDR_TRAIN_DONE_0             : out std_logic;
  FFS_CDR_TRAIN_DONE_1             : out std_logic;
  FFS_CDR_TRAIN_DONE_2             : out std_logic;
  FFS_CDR_TRAIN_DONE_3             : out std_logic;
  FFS_PCIE_CON_0             : out std_logic;
  FFS_PCIE_CON_1             : out std_logic;
  FFS_PCIE_CON_2             : out std_logic;
  FFS_PCIE_CON_3             : out std_logic;
  FFS_PCIE_DONE_0             : out std_logic;
  FFS_PCIE_DONE_1             : out std_logic;
  FFS_PCIE_DONE_2             : out std_logic;
  FFS_PCIE_DONE_3             : out std_logic;
  FFS_PLOL             : out std_logic;
  FFS_RLOL_0             : out std_logic;
  FFS_RLOL_1             : out std_logic;
  FFS_RLOL_2             : out std_logic;
  FFS_RLOL_3             : out std_logic;
  FFS_RLOS_HI_0             : out std_logic;
  FFS_RLOS_HI_1             : out std_logic;
  FFS_RLOS_HI_2             : out std_logic;
  FFS_RLOS_HI_3             : out std_logic;
  FFS_RLOS_LO_0             : out std_logic;
  FFS_RLOS_LO_1             : out std_logic;
  FFS_RLOS_LO_2             : out std_logic;
  FFS_RLOS_LO_3             : out std_logic;
  FFS_RXFBFIFO_ERROR_0             : out std_logic;
  FFS_RXFBFIFO_ERROR_1             : out std_logic;
  FFS_RXFBFIFO_ERROR_2             : out std_logic;
  FFS_RXFBFIFO_ERROR_3             : out std_logic;
  FFS_TXFBFIFO_ERROR_0             : out std_logic;
  FFS_TXFBFIFO_ERROR_1             : out std_logic;
  FFS_TXFBFIFO_ERROR_2             : out std_logic;
  FFS_TXFBFIFO_ERROR_3             : out std_logic;
  PCIE_PHYSTATUS_0             : out std_logic;
  PCIE_PHYSTATUS_1             : out std_logic;
  PCIE_PHYSTATUS_2             : out std_logic;
  PCIE_PHYSTATUS_3             : out std_logic;
  PCIE_RXVALID_0               : out std_logic;
  PCIE_RXVALID_1               : out std_logic;
  PCIE_RXVALID_2               : out std_logic;
  PCIE_RXVALID_3               : out std_logic;
  FFS_SKP_ADDED_0                  : out std_logic;
  FFS_SKP_ADDED_1                  : out std_logic;
  FFS_SKP_ADDED_2                  : out std_logic;
  FFS_SKP_ADDED_3                  : out std_logic;
  FFS_SKP_DELETED_0                : out std_logic;
  FFS_SKP_DELETED_1                : out std_logic;
  FFS_SKP_DELETED_2                : out std_logic;
  FFS_SKP_DELETED_3                : out std_logic;
  LDR_RX2CORE_0                    : out std_logic;
  LDR_RX2CORE_1                    : out std_logic;
  LDR_RX2CORE_2                    : out std_logic;
  LDR_RX2CORE_3                    : out std_logic;
  REFCK2CORE             : out std_logic;
  SCIINT                : out std_logic;
  SCIRDATA0             : out std_logic;
  SCIRDATA1             : out std_logic;
  SCIRDATA2             : out std_logic;
  SCIRDATA3             : out std_logic;
  SCIRDATA4             : out std_logic;
  SCIRDATA5             : out std_logic;
  SCIRDATA6             : out std_logic;
  SCIRDATA7             : out std_logic;
  REFCLK_TO_NQ          : out std_logic
);
end component;

begin

PCSD_sim_inst : PCSD_sim
generic map (
  CONFIG_FILE => CONFIG_FILE,
  QUAD_MODE => QUAD_MODE,
  CH0_CDR_SRC => CH0_CDR_SRC,
  CH1_CDR_SRC => CH1_CDR_SRC,
  CH2_CDR_SRC => CH2_CDR_SRC,
  CH3_CDR_SRC => CH3_CDR_SRC,
  PLL_SRC => PLL_SRC
  )
port map (
   HDINN0 => HDINN0,
   HDINN1 => HDINN1,
   HDINN2 => HDINN2,
   HDINN3 => HDINN3,
   HDINP0 => HDINP0,
   HDINP1 => HDINP1,
   HDINP2 => HDINP2,
   HDINP3 => HDINP3,
   REFCLKN => REFCLKN,
   REFCLKP => REFCLKP,
   CIN11 => CIN11,
   CIN10 => CIN10,
   CIN9 => CIN9,
   CIN8 => CIN8,
   CIN7 => CIN7,
   CIN6 => CIN6,
   CIN5 => CIN5,
   CIN4 => CIN4,
   CIN3 => CIN3,
   CIN2 => CIN2,
   CIN1 => CIN1,
   CIN0 => CIN0,
   CYAWSTN => CYAWSTN,
   FF_EBRD_CLK_3 => FF_EBRD_CLK_3,
   FF_EBRD_CLK_2 => FF_EBRD_CLK_2,
   FF_EBRD_CLK_1 => FF_EBRD_CLK_1,
   FF_EBRD_CLK_0 => FF_EBRD_CLK_0,
   FF_RXI_CLK_3 => FF_RXI_CLK_3,
   FF_RXI_CLK_2 => FF_RXI_CLK_2,
   FF_RXI_CLK_1 => FF_RXI_CLK_1,
   FF_RXI_CLK_0 => FF_RXI_CLK_0,
   FF_TX_D_0_0 => FF_TX_D_0_0,
   FF_TX_D_0_1 => FF_TX_D_0_1,
   FF_TX_D_0_2 => FF_TX_D_0_2,
   FF_TX_D_0_3 => FF_TX_D_0_3,
   FF_TX_D_0_4 => FF_TX_D_0_4,
   FF_TX_D_0_5 => FF_TX_D_0_5,
   FF_TX_D_0_6 => FF_TX_D_0_6,
   FF_TX_D_0_7 => FF_TX_D_0_7,
   FF_TX_D_0_8 => FF_TX_D_0_8,
   FF_TX_D_0_9 => FF_TX_D_0_9,
   FF_TX_D_0_10 => FF_TX_D_0_10,
   FF_TX_D_0_11 => FF_TX_D_0_11,
   FF_TX_D_0_12 => FF_TX_D_0_12,
   FF_TX_D_0_13 => FF_TX_D_0_13,
   FF_TX_D_0_14 => FF_TX_D_0_14,
   FF_TX_D_0_15 => FF_TX_D_0_15,
   FF_TX_D_0_16 => FF_TX_D_0_16,
   FF_TX_D_0_17 => FF_TX_D_0_17,
   FF_TX_D_0_18 => FF_TX_D_0_18,
   FF_TX_D_0_19 => FF_TX_D_0_19,
   FF_TX_D_0_20 => FF_TX_D_0_20,
   FF_TX_D_0_21 => FF_TX_D_0_21,
   FF_TX_D_0_22 => FF_TX_D_0_22,
   FF_TX_D_0_23 => FF_TX_D_0_23,
   FF_TX_D_1_0 => FF_TX_D_1_0,
   FF_TX_D_1_1 => FF_TX_D_1_1,
   FF_TX_D_1_2 => FF_TX_D_1_2,
   FF_TX_D_1_3 => FF_TX_D_1_3,
   FF_TX_D_1_4 => FF_TX_D_1_4,
   FF_TX_D_1_5 => FF_TX_D_1_5,
   FF_TX_D_1_6 => FF_TX_D_1_6,
   FF_TX_D_1_7 => FF_TX_D_1_7,
   FF_TX_D_1_8 => FF_TX_D_1_8,
   FF_TX_D_1_9 => FF_TX_D_1_9,
   FF_TX_D_1_10 => FF_TX_D_1_10,
   FF_TX_D_1_11 => FF_TX_D_1_11,
   FF_TX_D_1_12 => FF_TX_D_1_12,
   FF_TX_D_1_13 => FF_TX_D_1_13,
   FF_TX_D_1_14 => FF_TX_D_1_14,
   FF_TX_D_1_15 => FF_TX_D_1_15,
   FF_TX_D_1_16 => FF_TX_D_1_16,
   FF_TX_D_1_17 => FF_TX_D_1_17,
   FF_TX_D_1_18 => FF_TX_D_1_18,
   FF_TX_D_1_19 => FF_TX_D_1_19,
   FF_TX_D_1_20 => FF_TX_D_1_20,
   FF_TX_D_1_21 => FF_TX_D_1_21,
   FF_TX_D_1_22 => FF_TX_D_1_22,
   FF_TX_D_1_23 => FF_TX_D_1_23,
   FF_TX_D_2_0 => FF_TX_D_2_0,
   FF_TX_D_2_1 => FF_TX_D_2_1,
   FF_TX_D_2_2 => FF_TX_D_2_2,
   FF_TX_D_2_3 => FF_TX_D_2_3,
   FF_TX_D_2_4 => FF_TX_D_2_4,
   FF_TX_D_2_5 => FF_TX_D_2_5,
   FF_TX_D_2_6 => FF_TX_D_2_6,
   FF_TX_D_2_7 => FF_TX_D_2_7,
   FF_TX_D_2_8 => FF_TX_D_2_8,
   FF_TX_D_2_9 => FF_TX_D_2_9,
   FF_TX_D_2_10 => FF_TX_D_2_10,
   FF_TX_D_2_11 => FF_TX_D_2_11,
   FF_TX_D_2_12 => FF_TX_D_2_12,
   FF_TX_D_2_13 => FF_TX_D_2_13,
   FF_TX_D_2_14 => FF_TX_D_2_14,
   FF_TX_D_2_15 => FF_TX_D_2_15,
   FF_TX_D_2_16 => FF_TX_D_2_16,
   FF_TX_D_2_17 => FF_TX_D_2_17,
   FF_TX_D_2_18 => FF_TX_D_2_18,
   FF_TX_D_2_19 => FF_TX_D_2_19,
   FF_TX_D_2_20 => FF_TX_D_2_20,
   FF_TX_D_2_21 => FF_TX_D_2_21,
   FF_TX_D_2_22 => FF_TX_D_2_22,
   FF_TX_D_2_23 => FF_TX_D_2_23,
   FF_TX_D_3_0 => FF_TX_D_3_0,
   FF_TX_D_3_1 => FF_TX_D_3_1,
   FF_TX_D_3_2 => FF_TX_D_3_2,
   FF_TX_D_3_3 => FF_TX_D_3_3,
   FF_TX_D_3_4 => FF_TX_D_3_4,
   FF_TX_D_3_5 => FF_TX_D_3_5,
   FF_TX_D_3_6 => FF_TX_D_3_6,
   FF_TX_D_3_7 => FF_TX_D_3_7,
   FF_TX_D_3_8 => FF_TX_D_3_8,
   FF_TX_D_3_9 => FF_TX_D_3_9,
   FF_TX_D_3_10 => FF_TX_D_3_10,
   FF_TX_D_3_11 => FF_TX_D_3_11,
   FF_TX_D_3_12 => FF_TX_D_3_12,
   FF_TX_D_3_13 => FF_TX_D_3_13,
   FF_TX_D_3_14 => FF_TX_D_3_14,
   FF_TX_D_3_15 => FF_TX_D_3_15,
   FF_TX_D_3_16 => FF_TX_D_3_16,
   FF_TX_D_3_17 => FF_TX_D_3_17,
   FF_TX_D_3_18 => FF_TX_D_3_18,
   FF_TX_D_3_19 => FF_TX_D_3_19,
   FF_TX_D_3_20 => FF_TX_D_3_20,
   FF_TX_D_3_21 => FF_TX_D_3_21,
   FF_TX_D_3_22 => FF_TX_D_3_22,
   FF_TX_D_3_23 => FF_TX_D_3_23,
   FF_TXI_CLK_0 => FF_TXI_CLK_0,
   FF_TXI_CLK_1 => FF_TXI_CLK_1,
   FF_TXI_CLK_2 => FF_TXI_CLK_2,
   FF_TXI_CLK_3 => FF_TXI_CLK_3,
   FFC_CK_CORE_RX_0 => FFC_CK_CORE_RX_0,
   FFC_CK_CORE_RX_1 => FFC_CK_CORE_RX_1,
   FFC_CK_CORE_RX_2 => FFC_CK_CORE_RX_2,
   FFC_CK_CORE_RX_3 => FFC_CK_CORE_RX_3,
   FFC_CK_CORE_TX => FFC_CK_CORE_TX,
   FFC_EI_EN_0 => FFC_EI_EN_0,
   FFC_EI_EN_1 => FFC_EI_EN_1,
   FFC_EI_EN_2 => FFC_EI_EN_2,
   FFC_EI_EN_3 => FFC_EI_EN_3,
   FFC_ENABLE_CGALIGN_0 => FFC_ENABLE_CGALIGN_0,
   FFC_ENABLE_CGALIGN_1 => FFC_ENABLE_CGALIGN_1,
   FFC_ENABLE_CGALIGN_2 => FFC_ENABLE_CGALIGN_2,
   FFC_ENABLE_CGALIGN_3 => FFC_ENABLE_CGALIGN_3,
   FFC_FB_LOOPBACK_0 => FFC_FB_LOOPBACK_0,
   FFC_FB_LOOPBACK_1 => FFC_FB_LOOPBACK_1,
   FFC_FB_LOOPBACK_2 => FFC_FB_LOOPBACK_2,
   FFC_FB_LOOPBACK_3 => FFC_FB_LOOPBACK_3,
   FFC_LANE_RX_RST_0 => FFC_LANE_RX_RST_0,
   FFC_LANE_RX_RST_1 => FFC_LANE_RX_RST_1,
   FFC_LANE_RX_RST_2 => FFC_LANE_RX_RST_2,
   FFC_LANE_RX_RST_3 => FFC_LANE_RX_RST_3,
   FFC_LANE_TX_RST_0 => FFC_LANE_TX_RST_0,
   FFC_LANE_TX_RST_1 => FFC_LANE_TX_RST_1,
   FFC_LANE_TX_RST_2 => FFC_LANE_TX_RST_2,
   FFC_LANE_TX_RST_3 => FFC_LANE_TX_RST_3,
   FFC_MACRO_RST => FFC_MACRO_RST,
   FFC_PCI_DET_EN_0 => FFC_PCI_DET_EN_0,
   FFC_PCI_DET_EN_1 => FFC_PCI_DET_EN_1,
   FFC_PCI_DET_EN_2 => FFC_PCI_DET_EN_2,
   FFC_PCI_DET_EN_3 => FFC_PCI_DET_EN_3,
   FFC_PCIE_CT_0 => FFC_PCIE_CT_0,
   FFC_PCIE_CT_1 => FFC_PCIE_CT_1,
   FFC_PCIE_CT_2 => FFC_PCIE_CT_2,
   FFC_PCIE_CT_3 => FFC_PCIE_CT_3,
   FFC_PFIFO_CLR_0 => FFC_PFIFO_CLR_0,
   FFC_PFIFO_CLR_1 => FFC_PFIFO_CLR_1,
   FFC_PFIFO_CLR_2 => FFC_PFIFO_CLR_2,
   FFC_PFIFO_CLR_3 => FFC_PFIFO_CLR_3,
   FFC_QUAD_RST => FFC_QUAD_RST,
   FFC_RRST_0 => FFC_RRST_0,
   FFC_RRST_1 => FFC_RRST_1,
   FFC_RRST_2 => FFC_RRST_2,
   FFC_RRST_3 => FFC_RRST_3,
   FFC_RXPWDNB_0 => FFC_RXPWDNB_0,
   FFC_RXPWDNB_1 => FFC_RXPWDNB_1,
   FFC_RXPWDNB_2 => FFC_RXPWDNB_2,
   FFC_RXPWDNB_3 => FFC_RXPWDNB_3,
   FFC_SB_INV_RX_0 => FFC_SB_INV_RX_0,
   FFC_SB_INV_RX_1 => FFC_SB_INV_RX_1,
   FFC_SB_INV_RX_2 => FFC_SB_INV_RX_2,
   FFC_SB_INV_RX_3 => FFC_SB_INV_RX_3,
   FFC_SB_PFIFO_LP_0 => FFC_SB_PFIFO_LP_0,
   FFC_SB_PFIFO_LP_1 => FFC_SB_PFIFO_LP_1,
   FFC_SB_PFIFO_LP_2 => FFC_SB_PFIFO_LP_2,
   FFC_SB_PFIFO_LP_3 => FFC_SB_PFIFO_LP_3,
   FFC_SIGNAL_DETECT_0 => FFC_SIGNAL_DETECT_0,
   FFC_SIGNAL_DETECT_1 => FFC_SIGNAL_DETECT_1,
   FFC_SIGNAL_DETECT_2 => FFC_SIGNAL_DETECT_2,
   FFC_SIGNAL_DETECT_3 => FFC_SIGNAL_DETECT_3,
   FFC_SYNC_TOGGLE => FFC_SYNC_TOGGLE,
   FFC_TRST => FFC_TRST,
   FFC_TXPWDNB_0 => FFC_TXPWDNB_0,
   FFC_TXPWDNB_1 => FFC_TXPWDNB_1,
   FFC_TXPWDNB_2 => FFC_TXPWDNB_2,
   FFC_TXPWDNB_3 => FFC_TXPWDNB_3,
   FFC_RATE_MODE_RX_0 => FFC_RATE_MODE_RX_0,
   FFC_RATE_MODE_RX_1 => FFC_RATE_MODE_RX_1,
   FFC_RATE_MODE_RX_2 => FFC_RATE_MODE_RX_2,
   FFC_RATE_MODE_RX_3 => FFC_RATE_MODE_RX_3,
   FFC_RATE_MODE_TX_0 => FFC_RATE_MODE_TX_0,
   FFC_RATE_MODE_TX_1 => FFC_RATE_MODE_TX_1,
   FFC_RATE_MODE_TX_2 => FFC_RATE_MODE_TX_2,
   FFC_RATE_MODE_TX_3 => FFC_RATE_MODE_TX_3,
   FFC_DIV11_MODE_RX_0 => FFC_DIV11_MODE_RX_0,
   FFC_DIV11_MODE_RX_1 => FFC_DIV11_MODE_RX_1,
   FFC_DIV11_MODE_RX_2 => FFC_DIV11_MODE_RX_2,
   FFC_DIV11_MODE_RX_3 => FFC_DIV11_MODE_RX_3,
   FFC_DIV11_MODE_TX_0 => FFC_DIV11_MODE_TX_0,
   FFC_DIV11_MODE_TX_1 => FFC_DIV11_MODE_TX_1,
   FFC_DIV11_MODE_TX_2 => FFC_DIV11_MODE_TX_2,
   FFC_DIV11_MODE_TX_3 => FFC_DIV11_MODE_TX_3,
   LDR_CORE2TX_0 => LDR_CORE2TX_0,
   LDR_CORE2TX_1 => LDR_CORE2TX_1,
   LDR_CORE2TX_2 => LDR_CORE2TX_2,
   LDR_CORE2TX_3 => LDR_CORE2TX_3,
   FFC_LDR_CORE2TX_EN_0 => FFC_LDR_CORE2TX_EN_0,
   FFC_LDR_CORE2TX_EN_1 => FFC_LDR_CORE2TX_EN_1,
   FFC_LDR_CORE2TX_EN_2 => FFC_LDR_CORE2TX_EN_2,
   FFC_LDR_CORE2TX_EN_3 => FFC_LDR_CORE2TX_EN_3,
   PCIE_POWERDOWN_0_0 => PCIE_POWERDOWN_0_0,
   PCIE_POWERDOWN_0_1 => PCIE_POWERDOWN_0_1,
   PCIE_POWERDOWN_1_0 => PCIE_POWERDOWN_1_0,
   PCIE_POWERDOWN_1_1 => PCIE_POWERDOWN_1_1,
   PCIE_POWERDOWN_2_0 => PCIE_POWERDOWN_2_0,
   PCIE_POWERDOWN_2_1 => PCIE_POWERDOWN_2_1,
   PCIE_POWERDOWN_3_0 => PCIE_POWERDOWN_3_0,
   PCIE_POWERDOWN_3_1 => PCIE_POWERDOWN_3_1,
   PCIE_RXPOLARITY_0 => PCIE_RXPOLARITY_0,
   PCIE_RXPOLARITY_1 => PCIE_RXPOLARITY_1,
   PCIE_RXPOLARITY_2 => PCIE_RXPOLARITY_2,
   PCIE_RXPOLARITY_3 => PCIE_RXPOLARITY_3,
   PCIE_TXCOMPLIANCE_0 => PCIE_TXCOMPLIANCE_0,
   PCIE_TXCOMPLIANCE_1 => PCIE_TXCOMPLIANCE_1,
   PCIE_TXCOMPLIANCE_2 => PCIE_TXCOMPLIANCE_2,
   PCIE_TXCOMPLIANCE_3 => PCIE_TXCOMPLIANCE_3,
   PCIE_TXDETRX_PR2TLB_0 => PCIE_TXDETRX_PR2TLB_0,
   PCIE_TXDETRX_PR2TLB_1 => PCIE_TXDETRX_PR2TLB_1,
   PCIE_TXDETRX_PR2TLB_2 => PCIE_TXDETRX_PR2TLB_2,
   PCIE_TXDETRX_PR2TLB_3 => PCIE_TXDETRX_PR2TLB_3,
   SCIADDR0 => SCIADDR0,
   SCIADDR1 => SCIADDR1,
   SCIADDR2 => SCIADDR2,
   SCIADDR3 => SCIADDR3,
   SCIADDR4 => SCIADDR4,
   SCIADDR5 => SCIADDR5,
   SCIENAUX => SCIENAUX,
   SCIENCH0 => SCIENCH0,
   SCIENCH1 => SCIENCH1,
   SCIENCH2 => SCIENCH2,
   SCIENCH3 => SCIENCH3,
   SCIRD => SCIRD,
   SCISELAUX => SCISELAUX,
   SCISELCH0 => SCISELCH0,
   SCISELCH1 => SCISELCH1,
   SCISELCH2 => SCISELCH2,
   SCISELCH3 => SCISELCH3,
   SCIWDATA0 => SCIWDATA0,
   SCIWDATA1 => SCIWDATA1,
   SCIWDATA2 => SCIWDATA2,
   SCIWDATA3 => SCIWDATA3,
   SCIWDATA4 => SCIWDATA4,
   SCIWDATA5 => SCIWDATA5,
   SCIWDATA6 => SCIWDATA6,
   SCIWDATA7 => SCIWDATA7,
   SCIWSTN => SCIWSTN,
   HDOUTN0 => HDOUTN0,
   HDOUTN1 => HDOUTN1,
   HDOUTN2 => HDOUTN2,
   HDOUTN3 => HDOUTN3,
   HDOUTP0 => HDOUTP0,
   HDOUTP1 => HDOUTP1,
   HDOUTP2 => HDOUTP2,
   HDOUTP3 => HDOUTP3,
   COUT19 => COUT19,
   COUT18 => COUT18,
   COUT17 => COUT17,
   COUT16 => COUT16,
   COUT15 => COUT15,
   COUT14 => COUT14,
   COUT13 => COUT13,
   COUT12 => COUT12,
   COUT11 => COUT11,
   COUT10 => COUT10,
   COUT9 => COUT9,
   COUT8 => COUT8,
   COUT7 => COUT7,
   COUT6 => COUT6,
   COUT5 => COUT5,
   COUT4 => COUT4,
   COUT3 => COUT3,
   COUT2 => COUT2,
   COUT1 => COUT1,
   COUT0 => COUT0,
   FF_RX_D_0_0 => FF_RX_D_0_0,
   FF_RX_D_0_1 => FF_RX_D_0_1,
   FF_RX_D_0_2 => FF_RX_D_0_2,
   FF_RX_D_0_3 => FF_RX_D_0_3,
   FF_RX_D_0_4 => FF_RX_D_0_4,
   FF_RX_D_0_5 => FF_RX_D_0_5,
   FF_RX_D_0_6 => FF_RX_D_0_6,
   FF_RX_D_0_7 => FF_RX_D_0_7,
   FF_RX_D_0_8 => FF_RX_D_0_8,
   FF_RX_D_0_9 => FF_RX_D_0_9,
   FF_RX_D_0_10 => FF_RX_D_0_10,
   FF_RX_D_0_11 => FF_RX_D_0_11,
   FF_RX_D_0_12 => FF_RX_D_0_12,
   FF_RX_D_0_13 => FF_RX_D_0_13,
   FF_RX_D_0_14 => FF_RX_D_0_14,
   FF_RX_D_0_15 => FF_RX_D_0_15,
   FF_RX_D_0_16 => FF_RX_D_0_16,
   FF_RX_D_0_17 => FF_RX_D_0_17,
   FF_RX_D_0_18 => FF_RX_D_0_18,
   FF_RX_D_0_19 => FF_RX_D_0_19,
   FF_RX_D_0_20 => FF_RX_D_0_20,
   FF_RX_D_0_21 => FF_RX_D_0_21,
   FF_RX_D_0_22 => FF_RX_D_0_22,
   FF_RX_D_0_23 => FF_RX_D_0_23,
   FF_RX_D_1_0 => FF_RX_D_1_0,
   FF_RX_D_1_1 => FF_RX_D_1_1,
   FF_RX_D_1_2 => FF_RX_D_1_2,
   FF_RX_D_1_3 => FF_RX_D_1_3,
   FF_RX_D_1_4 => FF_RX_D_1_4,
   FF_RX_D_1_5 => FF_RX_D_1_5,
   FF_RX_D_1_6 => FF_RX_D_1_6,
   FF_RX_D_1_7 => FF_RX_D_1_7,
   FF_RX_D_1_8 => FF_RX_D_1_8,
   FF_RX_D_1_9 => FF_RX_D_1_9,
   FF_RX_D_1_10 => FF_RX_D_1_10,
   FF_RX_D_1_11 => FF_RX_D_1_11,
   FF_RX_D_1_12 => FF_RX_D_1_12,
   FF_RX_D_1_13 => FF_RX_D_1_13,
   FF_RX_D_1_14 => FF_RX_D_1_14,
   FF_RX_D_1_15 => FF_RX_D_1_15,
   FF_RX_D_1_16 => FF_RX_D_1_16,
   FF_RX_D_1_17 => FF_RX_D_1_17,
   FF_RX_D_1_18 => FF_RX_D_1_18,
   FF_RX_D_1_19 => FF_RX_D_1_19,
   FF_RX_D_1_20 => FF_RX_D_1_20,
   FF_RX_D_1_21 => FF_RX_D_1_21,
   FF_RX_D_1_22 => FF_RX_D_1_22,
   FF_RX_D_1_23 => FF_RX_D_1_23,
   FF_RX_D_2_0 => FF_RX_D_2_0,
   FF_RX_D_2_1 => FF_RX_D_2_1,
   FF_RX_D_2_2 => FF_RX_D_2_2,
   FF_RX_D_2_3 => FF_RX_D_2_3,
   FF_RX_D_2_4 => FF_RX_D_2_4,
   FF_RX_D_2_5 => FF_RX_D_2_5,
   FF_RX_D_2_6 => FF_RX_D_2_6,
   FF_RX_D_2_7 => FF_RX_D_2_7,
   FF_RX_D_2_8 => FF_RX_D_2_8,
   FF_RX_D_2_9 => FF_RX_D_2_9,
   FF_RX_D_2_10 => FF_RX_D_2_10,
   FF_RX_D_2_11 => FF_RX_D_2_11,
   FF_RX_D_2_12 => FF_RX_D_2_12,
   FF_RX_D_2_13 => FF_RX_D_2_13,
   FF_RX_D_2_14 => FF_RX_D_2_14,
   FF_RX_D_2_15 => FF_RX_D_2_15,
   FF_RX_D_2_16 => FF_RX_D_2_16,
   FF_RX_D_2_17 => FF_RX_D_2_17,
   FF_RX_D_2_18 => FF_RX_D_2_18,
   FF_RX_D_2_19 => FF_RX_D_2_19,
   FF_RX_D_2_20 => FF_RX_D_2_20,
   FF_RX_D_2_21 => FF_RX_D_2_21,
   FF_RX_D_2_22 => FF_RX_D_2_22,
   FF_RX_D_2_23 => FF_RX_D_2_23,
   FF_RX_D_3_0 => FF_RX_D_3_0,
   FF_RX_D_3_1 => FF_RX_D_3_1,
   FF_RX_D_3_2 => FF_RX_D_3_2,
   FF_RX_D_3_3 => FF_RX_D_3_3,
   FF_RX_D_3_4 => FF_RX_D_3_4,
   FF_RX_D_3_5 => FF_RX_D_3_5,
   FF_RX_D_3_6 => FF_RX_D_3_6,
   FF_RX_D_3_7 => FF_RX_D_3_7,
   FF_RX_D_3_8 => FF_RX_D_3_8,
   FF_RX_D_3_9 => FF_RX_D_3_9,
   FF_RX_D_3_10 => FF_RX_D_3_10,
   FF_RX_D_3_11 => FF_RX_D_3_11,
   FF_RX_D_3_12 => FF_RX_D_3_12,
   FF_RX_D_3_13 => FF_RX_D_3_13,
   FF_RX_D_3_14 => FF_RX_D_3_14,
   FF_RX_D_3_15 => FF_RX_D_3_15,
   FF_RX_D_3_16 => FF_RX_D_3_16,
   FF_RX_D_3_17 => FF_RX_D_3_17,
   FF_RX_D_3_18 => FF_RX_D_3_18,
   FF_RX_D_3_19 => FF_RX_D_3_19,
   FF_RX_D_3_20 => FF_RX_D_3_20,
   FF_RX_D_3_21 => FF_RX_D_3_21,
   FF_RX_D_3_22 => FF_RX_D_3_22,
   FF_RX_D_3_23 => FF_RX_D_3_23,
   FF_RX_F_CLK_0 => FF_RX_F_CLK_0,
   FF_RX_F_CLK_1 => FF_RX_F_CLK_1,
   FF_RX_F_CLK_2 => FF_RX_F_CLK_2,
   FF_RX_F_CLK_3 => FF_RX_F_CLK_3,
   FF_RX_H_CLK_0 => FF_RX_H_CLK_0,
   FF_RX_H_CLK_1 => FF_RX_H_CLK_1,
   FF_RX_H_CLK_2 => FF_RX_H_CLK_2,
   FF_RX_H_CLK_3 => FF_RX_H_CLK_3,
   FF_TX_F_CLK_0 => FF_TX_F_CLK_0,
   FF_TX_F_CLK_1 => FF_TX_F_CLK_1,
   FF_TX_F_CLK_2 => FF_TX_F_CLK_2,
   FF_TX_F_CLK_3 => FF_TX_F_CLK_3,
   FF_TX_H_CLK_0 => FF_TX_H_CLK_0,
   FF_TX_H_CLK_1 => FF_TX_H_CLK_1,
   FF_TX_H_CLK_2 => FF_TX_H_CLK_2,
   FF_TX_H_CLK_3 => FF_TX_H_CLK_3,
   FFS_CC_OVERRUN_0 => FFS_CC_OVERRUN_0,
   FFS_CC_OVERRUN_1 => FFS_CC_OVERRUN_1,
   FFS_CC_OVERRUN_2 => FFS_CC_OVERRUN_2,
   FFS_CC_OVERRUN_3 => FFS_CC_OVERRUN_3,
   FFS_CC_UNDERRUN_0 => FFS_CC_UNDERRUN_0,
   FFS_CC_UNDERRUN_1 => FFS_CC_UNDERRUN_1,
   FFS_CC_UNDERRUN_2 => FFS_CC_UNDERRUN_2,
   FFS_CC_UNDERRUN_3 => FFS_CC_UNDERRUN_3,
   FFS_LS_SYNC_STATUS_0 => FFS_LS_SYNC_STATUS_0,
   FFS_LS_SYNC_STATUS_1 => FFS_LS_SYNC_STATUS_1,
   FFS_LS_SYNC_STATUS_2 => FFS_LS_SYNC_STATUS_2,
   FFS_LS_SYNC_STATUS_3 => FFS_LS_SYNC_STATUS_3,
   FFS_CDR_TRAIN_DONE_0 => FFS_CDR_TRAIN_DONE_0,
   FFS_CDR_TRAIN_DONE_1 => FFS_CDR_TRAIN_DONE_1,
   FFS_CDR_TRAIN_DONE_2 => FFS_CDR_TRAIN_DONE_2,
   FFS_CDR_TRAIN_DONE_3 => FFS_CDR_TRAIN_DONE_3,
   FFS_PCIE_CON_0 => FFS_PCIE_CON_0,
   FFS_PCIE_CON_1 => FFS_PCIE_CON_1,
   FFS_PCIE_CON_2 => FFS_PCIE_CON_2,
   FFS_PCIE_CON_3 => FFS_PCIE_CON_3,
   FFS_PCIE_DONE_0 => FFS_PCIE_DONE_0,
   FFS_PCIE_DONE_1 => FFS_PCIE_DONE_1,
   FFS_PCIE_DONE_2 => FFS_PCIE_DONE_2,
   FFS_PCIE_DONE_3 => FFS_PCIE_DONE_3,
   FFS_PLOL => FFS_PLOL,
   FFS_RLOL_0 => FFS_RLOL_0,
   FFS_RLOL_1 => FFS_RLOL_1,
   FFS_RLOL_2 => FFS_RLOL_2,
   FFS_RLOL_3 => FFS_RLOL_3,
   FFS_RLOS_HI_0 => FFS_RLOS_HI_0,
   FFS_RLOS_HI_1 => FFS_RLOS_HI_1,
   FFS_RLOS_HI_2 => FFS_RLOS_HI_2,
   FFS_RLOS_HI_3 => FFS_RLOS_HI_3,
   FFS_RLOS_LO_0 => FFS_RLOS_LO_0,
   FFS_RLOS_LO_1 => FFS_RLOS_LO_1,
   FFS_RLOS_LO_2 => FFS_RLOS_LO_2,
   FFS_RLOS_LO_3 => FFS_RLOS_LO_3,
   FFS_RXFBFIFO_ERROR_0 => FFS_RXFBFIFO_ERROR_0,
   FFS_RXFBFIFO_ERROR_1 => FFS_RXFBFIFO_ERROR_1,
   FFS_RXFBFIFO_ERROR_2 => FFS_RXFBFIFO_ERROR_2,
   FFS_RXFBFIFO_ERROR_3 => FFS_RXFBFIFO_ERROR_3,
   FFS_TXFBFIFO_ERROR_0 => FFS_TXFBFIFO_ERROR_0,
   FFS_TXFBFIFO_ERROR_1 => FFS_TXFBFIFO_ERROR_1,
   FFS_TXFBFIFO_ERROR_2 => FFS_TXFBFIFO_ERROR_2,
   FFS_TXFBFIFO_ERROR_3 => FFS_TXFBFIFO_ERROR_3,
   PCIE_PHYSTATUS_0 => PCIE_PHYSTATUS_0,
   PCIE_PHYSTATUS_1 => PCIE_PHYSTATUS_1,
   PCIE_PHYSTATUS_2 => PCIE_PHYSTATUS_2,
   PCIE_PHYSTATUS_3 => PCIE_PHYSTATUS_3,
   PCIE_RXVALID_0 => PCIE_RXVALID_0,
   PCIE_RXVALID_1 => PCIE_RXVALID_1,
   PCIE_RXVALID_2 => PCIE_RXVALID_2,
   PCIE_RXVALID_3 => PCIE_RXVALID_3,
   FFS_SKP_ADDED_0 => FFS_SKP_ADDED_0,
   FFS_SKP_ADDED_1 => FFS_SKP_ADDED_1,
   FFS_SKP_ADDED_2 => FFS_SKP_ADDED_2,
   FFS_SKP_ADDED_3 => FFS_SKP_ADDED_3,
   FFS_SKP_DELETED_0 => FFS_SKP_DELETED_0,
   FFS_SKP_DELETED_1 => FFS_SKP_DELETED_1,
   FFS_SKP_DELETED_2 => FFS_SKP_DELETED_2,
   FFS_SKP_DELETED_3 => FFS_SKP_DELETED_3,
   LDR_RX2CORE_0 => LDR_RX2CORE_0,
   LDR_RX2CORE_1 => LDR_RX2CORE_1,
   LDR_RX2CORE_2 => LDR_RX2CORE_2,
   LDR_RX2CORE_3 => LDR_RX2CORE_3,
   REFCK2CORE => REFCK2CORE,
   SCIINT => SCIINT,
   SCIRDATA0 => SCIRDATA0,
   SCIRDATA1 => SCIRDATA1,
   SCIRDATA2 => SCIRDATA2,
   SCIRDATA3 => SCIRDATA3,
   SCIRDATA4 => SCIRDATA4,
   SCIRDATA5 => SCIRDATA5,
   SCIRDATA6 => SCIRDATA6,
   SCIRDATA7 => SCIRDATA7,
   REFCLK_FROM_NQ => REFCLK_FROM_NQ,
   REFCLK_TO_NQ => REFCLK_TO_NQ
   );

end PCSD_arch;

--synopsys translate_on

#if (_rst_gen == "ENABLED" && (_ch0_mode == "RXONLY" || _ch0_mode == "RXTX" || _ch1_mode == "RXONLY" || _ch1_mode == "RXTX" || _ch2_mode == "RXONLY" || _ch2_mode == "RXTX" || _ch3_mode == "RXONLY" || _ch3_mode == "RXTX"))
--THIS MODULE IS INSTANTIATED PER RX CHANNEL
--Reset Sequence Generator
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
                                                                                              
entity _rx_reset_sm_module is
generic (count_index: integer :=18);
port (
   rst_n       : in std_logic;
   refclkdiv2        : in std_logic;
   tx_pll_lol_qd_s   : in std_logic;
   rx_serdes_rst_ch_c: out std_logic;
   rx_cdr_lol_ch_s   : in std_logic;
   rx_los_low_ch_s   : in std_logic;
   rx_pcs_rst_ch_c   : out std_logic
);
end _rx_reset_sm_module ;
                                                                                              
architecture rx_reset_sm_arch of _rx_reset_sm_module is
                                                                                              
type statetype is (WAIT_FOR_PLOL, RX_SERDES_RESET, WAIT_FOR_TIMER1, CHECK_LOL_LOS, WAIT_FOR_TIMER2, NORMAL);
                                                                                              
signal   cs:      statetype;  -- current state of lsm
signal   ns:      statetype;  -- next state of lsm
attribute syn_encoding : string;
attribute syn_encoding of cs : signal is "safe";
attribute syn_encoding of ns : signal is "safe";
                                                                                              
signal   tx_pll_lol_qd_s_int: std_logic;
signal   rx_los_low_int:         std_logic;
signal   plol_los_int:        std_logic;
signal   rx_lol_los  :  std_logic;
signal   rx_lol_los_int:      std_logic;
signal   rx_lol_los_del:      std_logic;
signal   rx_pcs_rst_ch_c_int: std_logic;
signal   rx_serdes_rst_ch_c_int: std_logic;
                                                                                              
signal   reset_timer1:  std_logic;
signal   reset_timer2:  std_logic;
                                                                                              
signal   counter1:   std_logic_vector(1 downto 0);
signal   TIMER1:  std_logic;
                                                                                              
signal   counter2: std_logic_vector(18 downto 0);
signal   TIMER2   : std_logic;
signal   rstn_m1:       std_logic;                                           
signal   rstn_m2:       std_logic;                                           
signal   sync_rst_n:       std_logic;                                                                                                                                      
begin

process (refclkdiv2, rst_n)
begin
   if rst_n = '0' then
      rstn_m1 <= '0';
      rstn_m2 <= '0';
   else if rising_edge(refclkdiv2) then
      rstn_m1 <= '1';
      rstn_m2 <= rstn_m1;
   end if;
   end if;
end process;

   sync_rst_n <= rstn_m2;                   
                                                                                              
rx_lol_los <= rx_cdr_lol_ch_s or rx_los_low_ch_s ;
                                                                                              
process(refclkdiv2, sync_rst_n)
begin
   if  sync_rst_n = '0' then
         cs <= WAIT_FOR_PLOL;
         rx_lol_los_int <= '1';
         rx_lol_los_del <= '1';
         tx_pll_lol_qd_s_int <= '1';
         rx_pcs_rst_ch_c <= '1';
         rx_serdes_rst_ch_c <= '0';
         rx_los_low_int <= '1';
      else if rising_edge(refclkdiv2) then
         cs <= ns;
         rx_lol_los_del <= rx_lol_los;
         rx_lol_los_int <= rx_lol_los_del;
         tx_pll_lol_qd_s_int <= tx_pll_lol_qd_s;
         rx_pcs_rst_ch_c <= rx_pcs_rst_ch_c_int;
         rx_serdes_rst_ch_c <= rx_serdes_rst_ch_c_int;
         rx_los_low_int <= rx_los_low_ch_s;
      end if;
   end if;
end process;
                                                                                              
--TIMER1 = 3NS;
--Fastest REFCLK = 312 MHz, or 3ns. We need 1 REFCLK cycles or 2 REFCLKDIV2 cycles
--A 1 bit counter  counts 2 cycles, so a 2 bit ([1:0]) counter will do if we set TIMER1 = bit[1]
                                                                                              
process(refclkdiv2, reset_timer1)
begin
   if rising_edge(refclkdiv2) then
      if reset_timer1 = '1' then
         counter1 <= "00";
         TIMER1 <= '0';
      else
         if counter1(1) = '1' then
            TIMER1 <='1';
         else
            TIMER1 <='0';
            counter1 <= counter1 + 1 ;
         end if;
      end if;
   end if;
end process;
                                                                                              
--TIMER2 = 400,000 Refclk cycles or 200,000 REFCLKDIV2 cycles
--An 18 bit counter ([17:0]) counts 262144 cycles, so a 19 bit ([18:0]) counter will do if we set TIMER2 = bit[18]
                                                                                              
process(refclkdiv2, reset_timer2)
begin
   if rising_edge(refclkdiv2) then
      if reset_timer2 = '1' then
         counter2 <= "0000000000000000000";
         TIMER2 <= '0';
      else
         if counter2(count_index) = '1' then
            TIMER2 <='1';
         else
            TIMER2 <='0';
            counter2 <= counter2 + 1 ;
         end if;
      end if;
   end if;
end process;
                                                                                              
                                                                                              
process(cs, tx_pll_lol_qd_s_int, rx_los_low_int, TIMER1, rx_lol_los_int, TIMER2)
begin
      reset_timer1 <= '0';
      reset_timer2 <= '0';
                                                                                              
   case cs is
      when WAIT_FOR_PLOL =>
         rx_pcs_rst_ch_c_int <= '1';
         rx_serdes_rst_ch_c_int <= '0';
         if (tx_pll_lol_qd_s_int = '1' or rx_los_low_int = '1') then  --Also make sure A Signal
            ns <= WAIT_FOR_PLOL;             --is Present prior to moving to the next
         else
            ns <= RX_SERDES_RESET;
            end if;
                                                                                              
       when RX_SERDES_RESET =>
         rx_pcs_rst_ch_c_int <= '1';
         rx_serdes_rst_ch_c_int <= '1';
         reset_timer1 <= '1';
            ns <= WAIT_FOR_TIMER1;
                                                                                              
                                                                                              
      when WAIT_FOR_TIMER1 =>
         rx_pcs_rst_ch_c_int <= '1';
         rx_serdes_rst_ch_c_int <= '1';
         if TIMER1 = '1' then
            ns <= CHECK_LOL_LOS;
         else
            ns <= WAIT_FOR_TIMER1;
            end if;
                                                                                              
      when CHECK_LOL_LOS =>
         rx_pcs_rst_ch_c_int <= '1';
         rx_serdes_rst_ch_c_int <= '0';
         reset_timer2 <= '1';
            ns <= WAIT_FOR_TIMER2;
                                                                                              
      when WAIT_FOR_TIMER2 =>
         rx_pcs_rst_ch_c_int <= '1';
         rx_serdes_rst_ch_c_int <= '0';
         if rx_lol_los_int = rx_lol_los_del then   --NO RISING OR FALLING EDGES
            if TIMER2 = '1' then
               if rx_lol_los_int = '1' then
                  ns <= WAIT_FOR_PLOL;
               else
                  ns <= NORMAL;
               end if;
            else
               ns <= WAIT_FOR_TIMER2;
            end if;
         else
               ns <= CHECK_LOL_LOS;    --RESET TIMER2
         end if;
                                                                                              
      when NORMAL =>
         rx_pcs_rst_ch_c_int <= '0';
         rx_serdes_rst_ch_c_int <= '0';
         if rx_lol_los_int = '1' then
            ns <= WAIT_FOR_PLOL;
         else
            ns <= NORMAL;
         end if;
                                                                                              
      when others =>
         ns <= WAIT_FOR_PLOL;
                                                                                              
      end case;
                                                                                              
end process;
                                                                                              
                                                                                              
end rx_reset_sm_arch;
#endif

#if (_rst_gen == "ENABLED" && (_ch0_mode == "TXONLY" || _ch0_mode == "RXTX" || _ch1_mode == "TXONLY" || _ch1_mode == "RXTX" || _ch2_mode == "TXONLY" || _ch2_mode == "RXTX" || _ch3_mode == "TXONLY" || _ch3_mode == "RXTX"))
--THIS MODULE IS INSTANTIATED PER TX  QUAD
--TX Reset Sequence state machine--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
                                                                                              
entity _tx_reset_sm_module is
generic (count_index: integer :=18);
port (
   rst_n          : in std_logic;
   refclkdiv2      : in std_logic;
   tx_pll_lol_qd_s : in std_logic;
   rst_qd_c    : out std_logic;
   tx_pcs_rst_ch_c : out std_logic
   );
end _tx_reset_sm_module;
                                                                                              
architecture tx_reset_sm_arch of _tx_reset_sm_module is
                                                                                              
type statetype is (QUAD_RESET, WAIT_FOR_TIMER1, CHECK_PLOL, WAIT_FOR_TIMER2, NORMAL);
                                                                                              
signal   cs:      statetype;  -- current state of lsm
signal   ns:      statetype;  -- next state of lsm
attribute syn_encoding : string;
attribute syn_encoding of cs : signal is "safe";
attribute syn_encoding of ns : signal is "safe";
                                                                                              
signal   tx_pll_lol_qd_s_int  : std_logic;
signal   tx_pcs_rst_ch_c_int  : std_logic_vector(3 downto 0);
signal   rst_qd_c_int      : std_logic;
                                                                                              
signal   reset_timer1:  std_logic;
signal   reset_timer2:  std_logic;
                                                                                              
signal   counter1:      std_logic_vector(2 downto 0);
signal   TIMER1:        std_logic;
                                                                                              
signal   counter2:      std_logic_vector(18 downto 0);
signal   TIMER2:        std_logic;

signal   rstn_m1:       std_logic;                                                                                  
signal   rstn_m2:       std_logic;                                                                                              
signal   sync_rst_n:       std_logic;                                                                                              
begin

process (refclkdiv2, rst_n)
begin
   if rst_n = '0' then
      rstn_m1 <= '0';
      rstn_m2 <= '0';
   else if rising_edge(refclkdiv2) then
      rstn_m1 <= '1';
      rstn_m2 <= rstn_m1;
   end if;
   end if;
end process;
   
   sync_rst_n <= rstn_m2;                                                                                           
process (refclkdiv2, sync_rst_n)
begin
   if sync_rst_n = '0' then
      cs <= QUAD_RESET;
      tx_pll_lol_qd_s_int <= '1';
      tx_pcs_rst_ch_c <= '1';
      rst_qd_c <= '1';
   else if rising_edge(refclkdiv2) then
      cs <= ns;
      tx_pll_lol_qd_s_int <= tx_pll_lol_qd_s;
      tx_pcs_rst_ch_c <= tx_pcs_rst_ch_c_int(0);
      rst_qd_c <= rst_qd_c_int;
   end if;
   end if;
end process;
--TIMER1 = 20ns;
--Fastest REFLCK =312 MHZ, or 3 ns. We need 8 REFCLK cycles or 4 REFCLKDIV2 cycles
-- A 2 bit counter ([1:0]) counts 4 cycles, so a 3 bit ([2:0]) counter will do if we set TIMER1 = bit[2]
                                                                                              
                                                                                              
process (refclkdiv2, reset_timer1)
begin
   if rising_edge(refclkdiv2) then
      if reset_timer1 = '1' then
         counter1 <= "000";
         TIMER1 <= '0';
      else
         if counter1(2) = '1' then
            TIMER1 <= '1';
         else
            TIMER1 <='0';
            counter1 <= counter1 + 1 ;
         end if;
      end if;
   end if;
end process;
                                                                                              
                                                                                              
--TIMER2 = 1,400,000 UI;
--WORST CASE CYCLES is with smallest multipier factor.
-- This would be with X8 clock multiplier in DIV2 mode
-- IN this casse, 1 UI = 2/8 REFCLK  CYCLES = 1/8 REFCLKDIV2 CYCLES
-- SO 1,400,000 UI =1,400,000/8 = 175,000 REFCLKDIV2 CYCLES
-- An 18 bit counter ([17:0]) counts 262144 cycles, so a 19 bit ([18:0]) counter will do if we set TIMER2 = bit[18]
                                                                                              
                                                                                              
process(refclkdiv2, reset_timer2)
begin
   if rising_edge(refclkdiv2) then
      if reset_timer2 = '1' then
         counter2 <= "0000000000000000000";
         TIMER2 <= '0';
      else
         if counter2(count_index) = '1' then
            TIMER2 <='1';
         else
            TIMER2 <='0';
            counter2 <= counter2 + 1 ;
         end if;
      end if;
   end if;
end process;
                                                                                              
process(cs, TIMER1, TIMER2, tx_pll_lol_qd_s_int)
begin
                                                                                              
      reset_timer1 <= '0';
      reset_timer2 <= '0';
                                                                                              
   case cs is
                                                                                              
      when QUAD_RESET   =>
      tx_pcs_rst_ch_c_int <= "1111";
      rst_qd_c_int <= '1';
      reset_timer1 <= '1';
         ns <= WAIT_FOR_TIMER1;
                                                                                              
      when WAIT_FOR_TIMER1 =>
      tx_pcs_rst_ch_c_int <= "1111";
      rst_qd_c_int <= '1';
      if TIMER1 = '1' then
         ns <= CHECK_PLOL;
      else
         ns <= WAIT_FOR_TIMER1;
         end if;
                                                                                              
      when CHECK_PLOL   =>
      tx_pcs_rst_ch_c_int <= "1111";
      rst_qd_c_int <= '0';
      reset_timer2 <= '1';
         ns <= WAIT_FOR_TIMER2;
                                                                                              
      when WAIT_FOR_TIMER2 =>
      tx_pcs_rst_ch_c_int <= "1111";
      rst_qd_c_int <= '0';
      if TIMER2 = '1' then
         if tx_pll_lol_qd_s_int = '1' then
            ns <= QUAD_RESET;
         else
            ns <= NORMAL;
         end if;
      else
            ns <= WAIT_FOR_TIMER2;
            end if;
                                                                                              
   when NORMAL =>
      tx_pcs_rst_ch_c_int <= "0000";
      rst_qd_c_int <= '0';
      if tx_pll_lol_qd_s_int = '1' then
         ns <= QUAD_RESET;
      else
         ns <= NORMAL;
         end if;
                                                                                              
   when others =>
      ns <=    QUAD_RESET;
                                                                                              
   end case;
                                                                                              
end process;
                                                                                              
end tx_reset_sm_arch;
#endif


--synopsys translate_off
library ECP3;
use ECP3.components.all;
--synopsys translate_on


library IEEE, STD;
use IEEE.std_logic_1164.all;
use STD.TEXTIO.all;

entity _circuit_name is
   GENERIC (USER_CONFIG_FILE    :  String := #_circuit_name_new);
 port (
------------------
#if _pll_txsrc == "REFCLK_EXT" || ((_ch0_mode == "RXTX" || _ch0_mode == "RXONLY") && _ch0_pll_rxsrc == "REFCLK_EXT") || ((_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")  && _ch1_pll_rxsrc == "REFCLK_EXT") || ((_ch2_mode == "RXTX" || _ch2_mode == "RXONLY") && _ch2_pll_rxsrc == "REFCLK_EXT") || ((_ch3_mode == "RXTX" || _ch3_mode == "RXONLY") && _ch3_pll_rxsrc == "REFCLK_EXT")
    refclkp, refclkn  :   in std_logic;
#endif
-- CH0 --
#if _ch0_mode == "TXONLY"
    hdoutp_ch0, hdoutn_ch0   :   out std_logic;
#elif _ch0_mode == "RXONLY"
    hdinp_ch0, hdinn_ch0    :   in std_logic;
#elif _ch0_mode == "RXTX"
    hdinp_ch0, hdinn_ch0    :   in std_logic;
    hdoutp_ch0, hdoutn_ch0   :   out std_logic;
#endif
#if _ch0_mode != "DISABLED"
#if _ch0_protocol_new == "PIPE"
    TxDetRx_Loopback_ch0    :   in std_logic;
    TxCompliance_ch0    :   in std_logic;
    RxPolarity_ch0    :   in std_logic;
    PowerDown_ch0    :   in std_logic_vector (1 downto 0);
    sxValid_ch0   :   out std_logic;
    PhyStatus_ch0   :   out std_logic;
#endif
#if _sci_ports == "ENABLED"
    sci_sel_ch0    :   in std_logic;
#endif
#if _ch0_rx_fifo == "ENABLED"
    rxiclk_ch0    :   in std_logic;
#endif
#if _ch0_mode == "RXTX" || _ch0_mode == "TXONLY"
    txiclk_ch0    :   in std_logic;
#endif
#if _ch0_mode == "RXTX" || _ch0_mode == "RXONLY"
    rx_full_clk_ch0   :   out std_logic;
    rx_half_clk_ch0   :   out std_logic;
#endif
#if (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY") || ((_ch0_ctc == "ENABLED" && _ch0_rx_fifo == "ENABLED") && (_ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"))
    tx_full_clk_ch0   :   out std_logic;
#endif
#if (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY") || ((_ch0_ctc == "ENABLED" && _ch0_rx_fifo == "ENABLED") && (_ch0_rx_data_width == "16" || _ch0_rx_data_width == "20"))
    tx_half_clk_ch0   :   out std_logic;
#endif
#if _ch0_pll_rxsrc == "REFCLK_CORE"
    fpga_rxrefclk_ch0    :   in std_logic;
#endif
#if _ch0_mode == "RXTX" || _ch0_mode == "TXONLY"
#if _ch0_protocol_new == "PIPE"
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
    TxData_ch0    :   in std_logic_vector (7 downto 0);
    TxDataK_ch0    :   in std_logic;
#else
    TxData_ch0    :   in std_logic_vector (15 downto 0);
    TxDataK_ch0    :   in std_logic_vector (1 downto 0);
#endif
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
    txdata_ch0    :   in std_logic_vector (9 downto 0);
#else
    txdata_ch0    :   in std_logic_vector (19 downto 0);
#endif
#elif _ch0_protocol_new == "8BSER"
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
    txdata_ch0    :   in std_logic_vector (7 downto 0);
#else
    txdata_ch0    :   in std_logic_vector (15 downto 0);
#endif
#elif _ch0_protocol_new == "XAUI"
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
    txdata_ch0    :   in std_logic_vector (7 downto 0);
    txc_ch0    :   in std_logic;
#else
    txdata_ch0    :   in std_logic_vector (15 downto 0);
    txc_ch0    :   in std_logic_vector (1 downto 0);
#endif
#else
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
    txdata_ch0    :   in std_logic_vector (7 downto 0);
    tx_k_ch0    :   in std_logic;
#else
    txdata_ch0    :   in std_logic_vector (15 downto 0);
    tx_k_ch0    :   in std_logic_vector (1 downto 0);
#endif
#endif
#if _ch0_protocol_new == "PIPE" || _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "G8B10B" || _ch0_protocol_new == "PCIE" || _ch0_protocol_new == "OBSAI" || _ch0_protocol_new == "FC" || _ch0_protocol_new == "SATA" || _ch0_protocol_new == "DISP_PORT"
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
    tx_force_disp_ch0    :   in std_logic;
#else
    tx_force_disp_ch0    :   in std_logic_vector (1 downto 0);
#endif
#endif
#if _ch0_protocol_new == "PIPE" || _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "G8B10B" || _ch0_protocol_new == "PCIE" || _ch0_protocol_new == "OBSAI" || _ch0_protocol_new == "FC" || _ch0_protocol_new == "SATA" || _ch0_protocol_new == "DISP_PORT"
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
    tx_disp_sel_ch0    :   in std_logic;
#else
    tx_disp_sel_ch0    :   in std_logic_vector (1 downto 0);
#endif
#elif _ch0_protocol_new == "GIGE" || _ch0_protocol_new == "SGMII" 
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
    xmit_ch0    :   in std_logic;
#else
    xmit_ch0    :   in std_logic_vector (1 downto 0);
#endif
#endif
#if _ch0_protocol_new == "FC" || _ch0_protocol_new == "GIGE" || _ch0_protocol_new == "SGMII" 
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
    tx_disp_correct_ch0    :   in std_logic;
#else
    tx_disp_correct_ch0    :   in std_logic_vector (1 downto 0);
#endif
#elif _ch0_protocol_new == "PCIE" || _ch0_protocol_new == "PIPE"
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
    pci_ei_en_ch0    :   in std_logic;
#else
    pci_ei_en_ch0    :   in std_logic_vector (1 downto 0);
#endif
#endif
#endif
#if _ch0_mode == "RXTX" || _ch0_mode == "RXONLY"
#if _ch0_protocol_new == "PIPE"
#if _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
    RxData_ch0   :   out std_logic_vector (7 downto 0);
    RxDataK_ch0   :   out std_logic;
#else
    RxData_ch0   :   out std_logic_vector (15 downto 0);
    RxDataK_ch0   :   out std_logic_vector (1 downto 0);
#endif
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
#if _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
    rxdata_ch0   :   out std_logic_vector (9 downto 0);
#else
    rxdata_ch0   :   out std_logic_vector (19 downto 0);
#endif
#elif _ch0_protocol_new == "8BSER"
#if _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
    rxdata_ch0   :   out std_logic_vector (7 downto 0);
#else
    rxdata_ch0   :   out std_logic_vector (15 downto 0);
#endif
#elif _ch0_protocol_new == "XAUI"
#if _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
    rxdata_ch0   :   out std_logic_vector (7 downto 0);
    rxc_ch0   :   out std_logic;
#else
    rxdata_ch0   :   out std_logic_vector (15 downto 0);
    rxc_ch0   :   out std_logic_vector (1 downto 0);
#endif
#else
#if _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
    rxdata_ch0   :   out std_logic_vector (7 downto 0);
    rx_k_ch0   :   out std_logic;
#else
    rxdata_ch0   :   out std_logic_vector (15 downto 0);
    rx_k_ch0   :   out std_logic_vector (1 downto 0);
#endif
#endif
#if _ch0_protocol_new == "SATA" || _ch0_protocol_new == "DISP_PORT" || _ch0_protocol_new == "G8B10B" || _ch0_protocol_new == "GIGE" || _ch0_protocol_new == "SGMII" || _ch0_protocol_new == "XAUI" || _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "OBSAI" || _ch0_protocol_new == "SRIO" || _ch0_protocol_new == "FC"
#if _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
    rx_disp_err_ch0   :   out std_logic;
#else
    rx_disp_err_ch0   :   out std_logic_vector (1 downto 0);
#endif
#elif _ch0_protocol_new == "PCIE" 
#if _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
    rxstatus0_ch0   :   out std_logic_vector (2 downto 0);
#else
    rxstatus0_ch0   :   out std_logic_vector (2 downto 0);
    rxstatus1_ch0   :   out std_logic_vector (2 downto 0);
#endif
#elif _ch0_protocol_new == "PIPE"
#if _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
    RxStatus0_ch0   :   out std_logic_vector (2 downto 0);
#else
    RxStatus0_ch0   :   out std_logic_vector (2 downto 0);
    RxStatus1_ch0   :   out std_logic_vector (2 downto 0);
#endif
#endif
#if _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "OBSAI" || _ch0_protocol_new == "G8B10B" || _ch0_protocol_new == "GIGE" || _ch0_protocol_new == "SGMII" || _ch0_protocol_new == "XAUI" || _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "OBSAI" || _ch0_protocol_new == "SRIO" || _ch0_protocol_new == "FC"
#if _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
    rx_cv_err_ch0   :   out std_logic;
#else
    rx_cv_err_ch0   :   out std_logic_vector (1 downto 0);
#endif
#endif
#endif
#if (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY") && _rst_gen == "DISABLED"
    rx_serdes_rst_ch0_c    :   in std_logic;
#endif
#if _ch0_protocol_new != "PIPE" && _ch0_mode == "RXTX" && _ch0_lbtype == "DISABLED"
    sb_felb_ch0_c    :   in std_logic;
#endif
#if _ch0_protocol_new != "PIPE" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY") && _ch0_ird == "ENABLED"
    rx_invert_ch0_c    :   in std_logic;
#endif
#if _ch0_protocol_new == "PCIE"
    pcie_ct_ch0_c    : in std_logic;
    pcie_det_en_ch0_c    : in std_logic;
#endif
#if _ch0_protocol_new != "PIPE" && _ch0_mode == "RXTX" && _ch0_lbtype == "DISABLED"
    sb_felb_rst_ch0_c    :   in std_logic;
#endif
#if _ch0_protocol_new != "PIPE" && _ch0_ilsm == "DISABLED" && _ch0_rxwa == "ENABLED"
    word_align_en_ch0_c    :   in std_logic;
#endif
#if _ch0_protocol_new == "SATA" || _ch0_protocol_new == "PCIE"
    tx_idle_ch0_c    : in std_logic;
#else
#if _ch0_teidle == "ENABLED"
#if _ch0_protocol_new == "SRIO" || _ch0_protocol_new == "G8B10B" || _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "OBSAI" && (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY")
    tx_idle_ch0_c    : in std_logic;
#endif
#endif
#endif
#if _ch0_protocol_new != "PIPE" && (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY")
#if _rst_gen == "DISABLED"
    tx_pcs_rst_ch0_c    :   in std_logic;
#endif
    tx_pwrup_ch0_c    :   in std_logic;
#endif
#if _ch0_protocol_new != "PIPE" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
#if _rst_gen == "DISABLED"
    rx_pcs_rst_ch0_c    :   in std_logic;
#endif
    rx_pwrup_ch0_c    :   in std_logic;
#if _los_threshold_mode0 == "LOS_E"
    rx_los_low_ch0_s   :   out std_logic;
#elif _los_threshold_mode0 == "LOS_EA"
    rx_los_high_ch0_s   :   out std_logic;
#endif
#elif _ch0_protocol_new == "PIPE" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
#if _los_threshold_mode0 == "LOS_EA"
    RxElecIdle_ch0   :   out std_logic;
#endif
#endif
#if _ch0_protocol_new == "PIPE" || _ch0_protocol_new == "PCIE"
    pcie_done_ch0_s   : out std_logic;
    pcie_con_ch0_s   : out std_logic;
#endif
#if _ch0_protocol_new != "PIPE" && _ch0_ilsm == "ENABLED" && _ch0_rxwa == "ENABLED" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
    lsm_status_ch0_s   :   out std_logic;
#endif
#if _ch0_protocol_new != "PIPE" && _ch0_ctc == "ENABLED" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
    ctc_urun_ch0_s   :   out std_logic;
    ctc_orun_ch0_s   :   out std_logic;
    ctc_ins_ch0_s   :   out std_logic;
    ctc_del_ch0_s   :   out std_logic;
#endif
#if _ch0_protocol_new != "PIPE" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
    rx_cdr_lol_ch0_s   :   out std_logic;
#endif
#if _ch0_protocol_new != "PIPE" && _ch0_ldr == "ENABLED" && (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY")
    txd_ldr_ch0    :   in std_logic;
#endif
#if _ch0_protocol_new != "PIPE" && _ch0_ldr == "ENABLED" && (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY")
    txd_ldr_en_ch0_c    :   in std_logic;
#endif
#if _ch0_protocol_new != "PIPE" && _ch0_ldr == "ENABLED" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
    rxd_ldr_ch0   :   out std_logic;
#endif
#if _ch0_protocol_new == "DISP_PORT"
    rx_cdr_trained_ch0_s   :   out std_logic;
#endif
#if _ch0_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X" && _refclk_mult == "20X" && (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY")
    tx_div11_mode_ch0_c    :   in std_logic;
#endif
#if (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY") && ((_ch0_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X") || (_ch0_protocol_new == "G8B10B") || (_ch0_protocol_new == "CPRI" && (_datarange == "MED" || _datarange == "MEDHIGH")) || (_ch0_protocol_new == "OBSAI" && (_datarange == "MED" || _datarange == "HIGH")) || (_ch0_protocol_new == "SRIO" && _datarange == "MEDHIGH") || (_ch0_protocol_new == "SATA" && _datarange == "HIGH") || (_ch0_protocol_new == "FC" && _datarange == "MEDHIGH") || (_ch0_protocol_new == "10BSER") || (_ch0_protocol_new == "8BSER"))
    tx_div2_mode_ch0_c   : in std_logic;
#endif
#if _ch0_protocol_new == "SDI" && _ch0_rx_datarange == "HIGH" && _refclk_mult == "20X" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
    rx_div11_mode_ch0_c   : in std_logic;
#endif
#if (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY") && ((_ch0_protocol_new == "SDI" && _ch0_rx_datarange == "HIGH" && _refclk_mult == "20X") || (_ch0_protocol_new == "G8B10B") || (_ch0_protocol_new == "CPRI" && (_ch0_rx_datarange == "MED" || _ch0_rx_datarange == "MEDHIGH")) || (_ch0_protocol_new == "OBSAI" && (_ch0_rx_datarange == "MED" || _ch0_rx_datarange == "HIGH")) || (_ch0_protocol_new == "SRIO" && _ch0_rx_datarange == "MEDHIGH") || (_ch0_protocol_new == "SATA" && _ch0_rx_datarange == "HIGH") || (_ch0_protocol_new == "FC" && _ch0_rx_datarange == "MEDHIGH") || (_ch0_protocol_new == "10BSER") || (_ch0_protocol_new == "8BSER"))
    rx_div2_mode_ch0_c   : in std_logic;
#endif
#endif
#if (_rst_gen == "ENABLED" && (_ch0_mode != "TXONLY" || _ch1_mode != "TXONLY" || _ch2_mode != "TXONLY" || _ch3_mode != "TXONLY"))
#if _ch0_mode == "RXONLY" || _ch0_mode == "RXTX"
#if _ch0_rx_lol_port == "EXTERNAL"
    ext_lol_in_ch0      : in std_logic;
#endif
#endif
#endif
-- CH1 --
#if _ch1_mode == "TXONLY"
    hdoutp_ch1, hdoutn_ch1   :   out std_logic;
#elif _ch1_mode == "RXONLY"
    hdinp_ch1, hdinn_ch1    :   in std_logic;
#elif _ch1_mode == "RXTX"
    hdinp_ch1, hdinn_ch1    :   in std_logic;
    hdoutp_ch1, hdoutn_ch1   :   out std_logic;
#endif
#if _ch1_mode != "DISABLED"
#if _ch1_protocol_new == "PIPE"
    TxDetRx_Loopback_ch1    :   in std_logic;
    TxCompliance_ch1    :   in std_logic;
    RxPolarity_ch1    :   in std_logic;
    PowerDown_ch1    :   in std_logic_vector (1 downto 0);
    RxValid_ch1   :   out std_logic;
    PhyStatus_ch1   :   out std_logic;
#endif
#if _sci_ports == "ENABLED"
    sci_sel_ch1    :   in std_logic;
#endif
#if _ch1_rx_fifo == "ENABLED"
    rxiclk_ch1    :   in std_logic;
#endif
#if _ch1_mode == "RXTX" || _ch1_mode == "TXONLY"
    txiclk_ch1    :   in std_logic;
#endif
#if _ch1_mode == "RXTX" || _ch1_mode == "RXONLY"
    rx_full_clk_ch1   :   out std_logic;
    rx_half_clk_ch1   :   out std_logic;
#endif
#if (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY") || ((_ch1_ctc == "ENABLED" && _ch1_rx_fifo == "ENABLED") && (_ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"))
    tx_full_clk_ch1   :   out std_logic;
#endif
#if (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY") || ((_ch1_ctc == "ENABLED" && _ch1_rx_fifo == "ENABLED") && (_ch1_rx_data_width == "16" || _ch1_rx_data_width == "20"))
    tx_half_clk_ch1   :   out std_logic;
#endif
#if _ch1_pll_rxsrc == "REFCLK_CORE"
    fpga_rxrefclk_ch1    :   in std_logic;
#endif
#if _ch1_mode == "RXTX" || _ch1_mode == "TXONLY"
#if _ch1_protocol_new == "PIPE"
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
    TxData_ch1    :   in std_logic_vector (7 downto 0);
    TxDataK_ch1    :   in std_logic;
#else
    TxData_ch1    :   in std_logic_vector (15 downto 0);
    TxDataK_ch1    :   in std_logic_vector (1 downto 0);
#endif
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
    txdata_ch1    :   in std_logic_vector (9 downto 0);
#else
    txdata_ch1    :   in std_logic_vector (19 downto 0);
#endif
#elif _ch1_protocol_new == "8BSER"
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
    txdata_ch1    :   in std_logic_vector (7 downto 0);
#else
    txdata_ch1    :   in std_logic_vector (15 downto 0);
#endif
#elif _ch1_protocol_new == "XAUI"
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
    txdata_ch1    :   in std_logic_vector (7 downto 0);
    txc_ch1    :   in std_logic;
#else
    txdata_ch1    :   in std_logic_vector (15 downto 0);
    txc_ch1    :   in std_logic_vector (1 downto 0);
#endif
#else
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
    txdata_ch1    :   in std_logic_vector (7 downto 0);
    tx_k_ch1    :   in std_logic;
#else
    txdata_ch1    :   in std_logic_vector (15 downto 0);
    tx_k_ch1    :   in std_logic_vector (1 downto 0);
#endif
#endif
#if _ch1_protocol_new == "PIPE" || _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "G8B10B" || _ch1_protocol_new == "PCIE" || _ch1_protocol_new == "OBSAI" || _ch1_protocol_new == "FC" || _ch1_protocol_new == "SATA" || _ch1_protocol_new == "DISP_PORT"
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
    tx_force_disp_ch1    :   in std_logic;
#else
    tx_force_disp_ch1    :   in std_logic_vector (1 downto 0);
#endif
#endif
#if _ch1_protocol_new == "PIPE" || _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "G8B10B" || _ch1_protocol_new == "PCIE" || _ch1_protocol_new == "OBSAI" || _ch1_protocol_new == "FC" || _ch1_protocol_new == "SATA" || _ch1_protocol_new == "DISP_PORT"
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
    tx_disp_sel_ch1    :   in std_logic;
#else
    tx_disp_sel_ch1    :   in std_logic_vector (1 downto 0);
#endif
#elif _ch1_protocol_new == "GIGE" || _ch1_protocol_new == "SGMII" 
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
    xmit_ch1    :   in std_logic;
#else
    xmit_ch1    :   in std_logic_vector (1 downto 0);
#endif
#endif
#if _ch1_protocol_new == "FC" || _ch1_protocol_new == "GIGE" || _ch1_protocol_new == "SGMII" 
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
    tx_disp_correct_ch1    :   in std_logic;
#else
    tx_disp_correct_ch1    :   in std_logic_vector (1 downto 0);
#endif
#elif _ch1_protocol_new == "PCIE" || _ch1_protocol_new == "PIPE"
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
    pci_ei_en_ch1    :   in std_logic;
#else
    pci_ei_en_ch1    :   in std_logic_vector (1 downto 0);
#endif
#endif
#endif
#if _ch1_mode == "RXTX" || _ch1_mode == "RXONLY"
#if _ch1_protocol_new == "PIPE"
#if _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
    RxData_ch1   :   out std_logic_vector (7 downto 0);
    RxDataK_ch1   :   out std_logic;
#else
    RxData_ch1   :   out std_logic_vector (15 downto 0);
    RxDataK_ch1   :   out std_logic_vector (1 downto 0);
#endif
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
#if _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
    rxdata_ch1   :   out std_logic_vector (9 downto 0);
#else
    rxdata_ch1   :   out std_logic_vector (19 downto 0);
#endif
#elif _ch1_protocol_new == "8BSER"
#if _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
    rxdata_ch1   :   out std_logic_vector (7 downto 0);
#else
    rxdata_ch1   :   out std_logic_vector (15 downto 0);
#endif
#elif _ch1_protocol_new == "XAUI"
#if _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
    rxdata_ch1   :   out std_logic_vector (7 downto 0);
    rxc_ch1   :   out std_logic;
#else
    rxdata_ch1   :   out std_logic_vector (15 downto 0);
    rxc_ch1   :   out std_logic_vector (1 downto 0);
#endif
#else
#if _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
    rxdata_ch1   :   out std_logic_vector (7 downto 0);
    rx_k_ch1   :   out std_logic;
#else
    rxdata_ch1   :   out std_logic_vector (15 downto 0);
    rx_k_ch1   :   out std_logic_vector (1 downto 0);
#endif
#endif
#if _ch1_protocol_new == "SATA" || _ch1_protocol_new == "DISP_PORT" || _ch1_protocol_new == "G8B10B" || _ch1_protocol_new == "GIGE" || _ch1_protocol_new == "SGMII" || _ch1_protocol_new == "XAUI" || _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "OBSAI" || _ch1_protocol_new == "SRIO" || _ch1_protocol_new == "FC"
#if _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
    rx_disp_err_ch1   :   out std_logic;
#else
    rx_disp_err_ch1   :   out std_logic_vector (1 downto 0);
#endif
#elif _ch1_protocol_new == "PCIE" 
#if _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
    rxstatus0_ch1   :   out std_logic_vector (2 downto 0);
#else
    rxstatus0_ch1   :   out std_logic_vector (2 downto 0);
    rxstatus1_ch1   :   out std_logic_vector (2 downto 0);
#endif
#elif _ch1_protocol_new == "PIPE"
#if _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
    RxStatus0_ch1   :   out std_logic_vector (2 downto 0);
#else
    RxStatus0_ch1   :   out std_logic_vector (2 downto 0);
    RxStatus1_ch1   :   out std_logic_vector (2 downto 0);
#endif
#endif
#if _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "OBSAI" || _ch1_protocol_new == "G8B10B" || _ch1_protocol_new == "GIGE" || _ch1_protocol_new == "SGMII" || _ch1_protocol_new == "XAUI" || _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "OBSAI" || _ch1_protocol_new == "SRIO" || _ch1_protocol_new == "FC"
#if _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
    rx_cv_err_ch1   :   out std_logic;
#else
    rx_cv_err_ch1   :   out std_logic_vector (1 downto 0);
#endif
#endif
#endif
#if (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY") && _rst_gen == "DISABLED"
    rx_serdes_rst_ch1_c    :   in std_logic;
#endif
#if _ch1_protocol_new != "PIPE" && _ch1_mode == "RXTX" && _ch1_lbtype == "DISABLED"
    sb_felb_ch1_c    :   in std_logic;
#endif
#if _ch1_protocol_new != "PIPE" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY") && _ch1_ird == "ENABLED"
    rx_invert_ch1_c    :   in std_logic;
#endif
#if _ch1_protocol_new == "PCIE"
    pcie_ct_ch1_c    : in std_logic;
    pcie_det_en_ch1_c    : in std_logic;
#endif
#if _ch1_protocol_new != "PIPE" && _ch1_mode == "RXTX" && _ch1_lbtype == "DISABLED"
    sb_felb_rst_ch1_c    :   in std_logic;
#endif
#if _ch1_protocol_new != "PIPE" && _ch1_ilsm == "DISABLED" && _ch1_rxwa == "ENABLED"
    word_align_en_ch1_c    :   in std_logic;
#endif
#if _ch1_protocol_new == "SATA" || _ch1_protocol_new == "PCIE"
    tx_idle_ch1_c    : in std_logic;
#else
#if _ch1_teidle == "ENABLED"
#if _ch1_protocol_new == "SRIO" || _ch1_protocol_new == "G8B10B" || _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "OBSAI" && (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY")
    tx_idle_ch1_c    : in std_logic;
#endif
#endif
#endif
#if _ch1_protocol_new != "PIPE" && (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY")
#if _rst_gen == "DISABLED"
    tx_pcs_rst_ch1_c    :   in std_logic;
#endif
    tx_pwrup_ch1_c    :   in std_logic;
#endif
#if _ch1_protocol_new != "PIPE" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
#if _rst_gen == "DISABLED"
    rx_pcs_rst_ch1_c    :   in std_logic;
#endif
    rx_pwrup_ch1_c    :   in std_logic;
#if _los_threshold_mode1 == "LOS_E"
    rx_los_low_ch1_s   :   out std_logic;
#elif _los_threshold_mode1 == "LOS_EA"
    rx_los_high_ch1_s   :   out std_logic;
#endif
#elif _ch1_protocol_new == "PIPE" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
#if _los_threshold_mode1 == "LOS_EA"
    RxElecIdle_ch1   :   out std_logic;
#endif
#endif
#if _ch1_protocol_new == "PIPE" || _ch1_protocol_new == "PCIE"
    pcie_done_ch1_s   : out std_logic;
    pcie_con_ch1_s   : out std_logic;
#endif
#if _ch1_protocol_new != "PIPE" && _ch1_ilsm == "ENABLED" && _ch1_rxwa == "ENABLED" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
    lsm_status_ch1_s   :   out std_logic;
#endif
#if _ch1_protocol_new != "PIPE" && _ch1_ctc == "ENABLED" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
    ctc_urun_ch1_s   :   out std_logic;
    ctc_orun_ch1_s   :   out std_logic;
    ctc_ins_ch1_s   :   out std_logic;
    ctc_del_ch1_s   :   out std_logic;
#endif
#if _ch1_protocol_new != "PIPE" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
    rx_cdr_lol_ch1_s   :   out std_logic;
#endif
#if _ch1_protocol_new != "PIPE" && _ch1_ldr == "ENABLED" && (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY")
    txd_ldr_ch1    :   in std_logic;
#endif
#if _ch1_protocol_new != "PIPE" && _ch1_ldr == "ENABLED" && (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY")
    txd_ldr_en_ch1_c    :   in std_logic;
#endif
#if _ch1_protocol_new != "PIPE" && _ch1_ldr == "ENABLED" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
    rxd_ldr_ch1   :   out std_logic;
#endif
#if _ch1_protocol_new == "DISP_PORT"
    rx_cdr_trained_ch1_s   :   out std_logic;
#endif
#if _ch1_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X" && _refclk_mult == "20X" && (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY")
    tx_div11_mode_ch1_c    :   in std_logic;
#endif
#if (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY") && ((_ch1_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X") || (_ch1_protocol_new == "G8B10B") || (_ch1_protocol_new == "CPRI" && (_datarange == "MED" || _datarange == "MEDHIGH")) || (_ch1_protocol_new == "OBSAI" && (_datarange == "MED" || _datarange == "HIGH")) || (_ch1_protocol_new == "SRIO" && _datarange == "MEDHIGH") || (_ch1_protocol_new == "SATA" && _datarange == "HIGH") || (_ch1_protocol_new == "FC" && _datarange == "MEDHIGH") || (_ch1_protocol_new == "10BSER") || (_ch1_protocol_new == "8BSER"))
    tx_div2_mode_ch1_c   : in std_logic;
#endif
#if _ch1_protocol_new == "SDI" && _ch1_rx_datarange == "HIGH" && _refclk_mult == "20X" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
    rx_div11_mode_ch1_c   : in std_logic;
#endif
#if (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY") && ((_ch1_protocol_new == "SDI" && _ch1_rx_datarange == "HIGH" && _refclk_mult == "20X") || (_ch1_protocol_new == "G8B10B") || (_ch1_protocol_new == "CPRI" && (_ch1_rx_datarange == "MED" || _ch1_rx_datarange == "MEDHIGH")) || (_ch1_protocol_new == "OBSAI" && (_ch1_rx_datarange == "MED" || _ch1_rx_datarange == "HIGH")) || (_ch1_protocol_new == "SRIO" && _ch1_rx_datarange == "MEDHIGH") || (_ch1_protocol_new == "SATA" && _ch1_rx_datarange == "HIGH") || (_ch1_protocol_new == "FC" && _ch1_rx_datarange == "MEDHIGH") || (_ch1_protocol_new == "10BSER") || (_ch1_protocol_new == "8BSER"))
    rx_div2_mode_ch1_c   : in std_logic;
#endif
#endif
#if (_rst_gen == "ENABLED" && (_ch0_mode != "TXONLY" || _ch1_mode != "TXONLY" || _ch2_mode != "TXONLY" || _ch3_mode != "TXONLY"))
#if _ch1_mode == "RXONLY" || _ch1_mode == "RXTX"
#if _ch1_rx_lol_port == "EXTERNAL"
    ext_lol_in_ch1      : in std_logic;
#endif
#endif
#endif
-- CH2 --
#if _ch2_mode == "TXONLY"
    hdoutp_ch2, hdoutn_ch2   :   out std_logic;
#elif _ch2_mode == "RXONLY"
    hdinp_ch2, hdinn_ch2    :   in std_logic;
#elif _ch2_mode == "RXTX"
    hdinp_ch2, hdinn_ch2    :   in std_logic;
    hdoutp_ch2, hdoutn_ch2   :   out std_logic;
#endif
#if _ch2_mode != "DISABLED"
#if _ch2_protocol_new == "PIPE"
    TxDetRx_Loopback_ch2    :   in std_logic;
    TxCompliance_ch2    :   in std_logic;
    RxPolarity_ch2    :   in std_logic;
    PowerDown_ch2    :   in std_logic_vector (1 downto 0);
    RxValid_ch2   :   out std_logic;
    PhyStatus_ch2   :   out std_logic;
#endif
#if _sci_ports == "ENABLED"
    sci_sel_ch2    :   in std_logic;
#endif
#if _ch2_rx_fifo == "ENABLED"
    rxiclk_ch2    :   in std_logic;
#endif
#if _ch2_mode == "RXTX" || _ch2_mode == "TXONLY"
    txiclk_ch2    :   in std_logic;
#endif
#if _ch2_mode == "RXTX" || _ch2_mode == "RXONLY"
    rx_full_clk_ch2   :   out std_logic;
    rx_half_clk_ch2   :   out std_logic;
#endif
#if (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY") || ((_ch2_ctc == "ENABLED" && _ch2_rx_fifo == "ENABLED") && (_ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"))
    tx_full_clk_ch2   :   out std_logic;
#endif
#if (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY") || ((_ch2_ctc == "ENABLED" && _ch2_rx_fifo == "ENABLED") && (_ch2_rx_data_width == "16" || _ch2_rx_data_width == "20"))
    tx_half_clk_ch2   :   out std_logic;
#endif
#if _ch2_pll_rxsrc == "REFCLK_CORE"
    fpga_rxrefclk_ch2    :   in std_logic;
#endif
#if _ch2_mode == "RXTX" || _ch2_mode == "TXONLY"
#if _ch2_protocol_new == "PIPE"
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
    TxData_ch2    :   in std_logic_vector (7 downto 0);
    TxDataK_ch2    :   in std_logic;
#else
    TxData_ch2    :   in std_logic_vector (15 downto 0);
    TxDataK_ch2    :   in std_logic_vector (1 downto 0);
#endif
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
    txdata_ch2    :   in std_logic_vector (9 downto 0);
#else
    txdata_ch2    :   in std_logic_vector (19 downto 0);
#endif
#elif _ch2_protocol_new == "8BSER"
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
    txdata_ch2    :   in std_logic_vector (7 downto 0);
#else
    txdata_ch2    :   in std_logic_vector (15 downto 0);
#endif
#elif _ch2_protocol_new == "XAUI"
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
    txdata_ch2    :   in std_logic_vector (7 downto 0);
    txc_ch2    :   in std_logic;
#else
    txdata_ch2    :   in std_logic_vector (15 downto 0);
    txc_ch2    :   in std_logic_vector (1 downto 0);
#endif
#else
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
    txdata_ch2    :   in std_logic_vector (7 downto 0);
    tx_k_ch2    :   in std_logic;
#else
    txdata_ch2    :   in std_logic_vector (15 downto 0);
    tx_k_ch2    :   in std_logic_vector (1 downto 0);
#endif
#endif
#if _ch2_protocol_new == "PIPE" || _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "G8B10B" || _ch2_protocol_new == "PCIE" || _ch2_protocol_new == "OBSAI" || _ch2_protocol_new == "FC" || _ch2_protocol_new == "SATA" || _ch2_protocol_new == "DISP_PORT"
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
    tx_force_disp_ch2    :   in std_logic;
#else
    tx_force_disp_ch2    :   in std_logic_vector (1 downto 0);
#endif
#endif
#if _ch2_protocol_new == "PIPE" || _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "G8B10B" || _ch2_protocol_new == "PCIE" || _ch2_protocol_new == "OBSAI" || _ch2_protocol_new == "FC" || _ch2_protocol_new == "SATA" || _ch2_protocol_new == "DISP_PORT"
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
    tx_disp_sel_ch2    :   in std_logic;
#else
    tx_disp_sel_ch2    :   in std_logic_vector (1 downto 0);
#endif
#elif _ch2_protocol_new == "GIGE" || _ch2_protocol_new == "SGMII" 
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
    xmit_ch2    :   in std_logic;
#else
    xmit_ch2    :   in std_logic_vector (1 downto 0);
#endif
#endif
#if _ch2_protocol_new == "FC" || _ch2_protocol_new == "GIGE" || _ch2_protocol_new == "SGMII" 
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
    tx_disp_correct_ch2    :   in std_logic;
#else
    tx_disp_correct_ch2    :   in std_logic_vector (1 downto 0);
#endif
#elif _ch2_protocol_new == "PCIE" || _ch2_protocol_new == "PIPE"
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
    pci_ei_en_ch2    :   in std_logic;
#else
    pci_ei_en_ch2    :   in std_logic_vector (1 downto 0);
#endif
#endif
#endif
#if _ch2_mode == "RXTX" || _ch2_mode == "RXONLY"
#if _ch2_protocol_new == "PIPE"
#if _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
    RxData_ch2   :   out std_logic_vector (7 downto 0);
    RxDataK_ch2   :   out std_logic;
#else
    RxData_ch2   :   out std_logic_vector (15 downto 0);
    RxDataK_ch2   :   out std_logic_vector (1 downto 0);
#endif
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
#if _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
    rxdata_ch2   :   out std_logic_vector (9 downto 0);
#else
    rxdata_ch2   :   out std_logic_vector (19 downto 0);
#endif
#elif _ch2_protocol_new == "8BSER"
#if _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
    rxdata_ch2   :   out std_logic_vector (7 downto 0);
#else
    rxdata_ch2   :   out std_logic_vector (15 downto 0);
#endif
#elif _ch2_protocol_new == "XAUI"
#if _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
    rxdata_ch2   :   out std_logic_vector (7 downto 0);
    rxc_ch2   :   out std_logic;
#else
    rxdata_ch2   :   out std_logic_vector (15 downto 0);
    rxc_ch2   :   out std_logic_vector (1 downto 0);
#endif
#else
#if _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
    rxdata_ch2   :   out std_logic_vector (7 downto 0);
    rx_k_ch2   :   out std_logic;
#else
    rxdata_ch2   :   out std_logic_vector (15 downto 0);
    rx_k_ch2   :   out std_logic_vector (1 downto 0);
#endif
#endif
#if _ch2_protocol_new == "SATA" || _ch2_protocol_new == "DISP_PORT" || _ch2_protocol_new == "G8B10B" || _ch2_protocol_new == "GIGE" || _ch2_protocol_new == "SGMII" || _ch2_protocol_new == "XAUI" || _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "OBSAI" || _ch2_protocol_new == "SRIO" || _ch2_protocol_new == "FC"
#if _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
    rx_disp_err_ch2   :   out std_logic;
#else
    rx_disp_err_ch2   :   out std_logic_vector (1 downto 0);
#endif
#elif _ch2_protocol_new == "PCIE" 
#if _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
    rxstatus0_ch2   :   out std_logic_vector (2 downto 0);
#else
    rxstatus0_ch2   :   out std_logic_vector (2 downto 0);
    rxstatus1_ch2   :   out std_logic_vector (2 downto 0);
#endif
#elif _ch2_protocol_new == "PIPE"
#if _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
    RxStatus0_ch2   :   out std_logic_vector (2 downto 0);
#else
    RxStatus0_ch2   :   out std_logic_vector (2 downto 0);
    RxStatus1_ch2   :   out std_logic_vector (2 downto 0);
#endif
#endif
#if _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "OBSAI" || _ch2_protocol_new == "G8B10B" || _ch2_protocol_new == "GIGE" || _ch2_protocol_new == "SGMII" || _ch2_protocol_new == "XAUI" || _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "OBSAI" || _ch2_protocol_new == "SRIO" || _ch2_protocol_new == "FC"
#if _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
    rx_cv_err_ch2   :   out std_logic;
#else
    rx_cv_err_ch2   :   out std_logic_vector (1 downto 0);
#endif
#endif
#endif
#if (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY") && _rst_gen == "DISABLED"
    rx_serdes_rst_ch2_c    :   in std_logic;
#endif
#if _ch2_protocol_new != "PIPE" && _ch2_mode == "RXTX" && _ch2_lbtype == "DISABLED"
    sb_felb_ch2_c    :   in std_logic;
#endif
#if _ch2_protocol_new != "PIPE" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY") && _ch2_ird == "ENABLED"
    rx_invert_ch2_c    :   in std_logic;
#endif
#if _ch2_protocol_new == "PCIE"
    pcie_ct_ch2_c    : in std_logic;
    pcie_det_en_ch2_c    : in std_logic;
#endif
#if _ch2_protocol_new != "PIPE" && _ch2_mode == "RXTX" && _ch2_lbtype == "DISABLED"
    sb_felb_rst_ch2_c    :   in std_logic;
#endif
#if _ch2_protocol_new != "PIPE" && _ch2_ilsm == "DISABLED" && _ch2_rxwa == "ENABLED"
    word_align_en_ch2_c    :   in std_logic;
#endif
#if _ch2_protocol_new == "SATA" || _ch2_protocol_new == "PCIE"
    tx_idle_ch2_c    : in std_logic;
#else
#if _ch2_teidle == "ENABLED"
#if _ch2_protocol_new == "SRIO" || _ch2_protocol_new == "G8B10B" || _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "OBSAI" && (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY")
    tx_idle_ch2_c    : in std_logic;
#endif
#endif
#endif
#if _ch2_protocol_new != "PIPE" && (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY")
#if _rst_gen == "DISABLED"
    tx_pcs_rst_ch2_c    :   in std_logic;
#endif
    tx_pwrup_ch2_c    :   in std_logic;
#endif
#if _ch2_protocol_new != "PIPE" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
#if _rst_gen == "DISABLED"
    rx_pcs_rst_ch2_c    :   in std_logic;
#endif
    rx_pwrup_ch2_c    :   in std_logic;
#if _los_threshold_mode2 == "LOS_E"
    rx_los_low_ch2_s   :   out std_logic;
#elif _los_threshold_mode2 == "LOS_EA"
    rx_los_high_ch2_s   :   out std_logic;
#endif
#elif _ch2_protocol_new == "PIPE" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
#if _los_threshold_mode2 == "LOS_EA"
    RxElecIdle_ch2   :   out std_logic;
#endif
#endif
#if _ch2_protocol_new == "PIPE" || _ch2_protocol_new == "PCIE"
    pcie_done_ch2_s   : out std_logic;
    pcie_con_ch2_s   : out std_logic;
#endif
#if _ch2_protocol_new != "PIPE" && _ch2_ilsm == "ENABLED" && _ch2_rxwa == "ENABLED" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
    lsm_status_ch2_s   :   out std_logic;
#endif
#if _ch2_protocol_new != "PIPE" && _ch2_ctc == "ENABLED" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
    ctc_urun_ch2_s   :   out std_logic;
    ctc_orun_ch2_s   :   out std_logic;
    ctc_ins_ch2_s   :   out std_logic;
    ctc_del_ch2_s   :   out std_logic;
#endif
#if _ch2_protocol_new != "PIPE" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
    rx_cdr_lol_ch2_s   :   out std_logic;
#endif
#if _ch2_protocol_new != "PIPE" && _ch2_ldr == "ENABLED" && (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY")
    txd_ldr_ch2    :   in std_logic;
#endif
#if _ch2_protocol_new != "PIPE" && _ch2_ldr == "ENABLED" && (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY")
    txd_ldr_en_ch2_c    :   in std_logic;
#endif
#if _ch2_protocol_new != "PIPE" && _ch2_ldr == "ENABLED" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
    rxd_ldr_ch2   :   out std_logic;
#endif
#if _ch2_protocol_new == "DISP_PORT"
    rx_cdr_trained_ch2_s   :   out std_logic;
#endif
#if _ch2_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X" && _refclk_mult == "20X" && (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY")
    tx_div11_mode_ch2_c    :   in std_logic;
#endif
#if (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY") && ((_ch2_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X") || (_ch2_protocol_new == "G8B10B") || (_ch2_protocol_new == "CPRI" && (_datarange == "MED" || _datarange == "MEDHIGH")) || (_ch2_protocol_new == "OBSAI" && (_datarange == "MED" || _datarange == "HIGH")) || (_ch2_protocol_new == "SRIO" && _datarange == "MEDHIGH") || (_ch2_protocol_new == "SATA" && _datarange == "HIGH") || (_ch2_protocol_new == "FC" && _datarange == "MEDHIGH") || (_ch2_protocol_new == "10BSER") || (_ch2_protocol_new == "8BSER"))
    tx_div2_mode_ch2_c   : in std_logic;
#endif
#if _ch2_protocol_new == "SDI" && _ch2_rx_datarange == "HIGH" && _refclk_mult == "20X" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
    rx_div11_mode_ch2_c   : in std_logic;
#endif
#if (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY") && ((_ch2_protocol_new == "SDI" && _ch2_rx_datarange == "HIGH" && _refclk_mult == "20X") || (_ch2_protocol_new == "G8B10B") || (_ch2_protocol_new == "CPRI" && (_ch2_rx_datarange == "MED" || _ch2_rx_datarange == "MEDHIGH")) || (_ch2_protocol_new == "OBSAI" && (_ch2_rx_datarange == "MED" || _ch2_rx_datarange == "HIGH")) || (_ch2_protocol_new == "SRIO" && _ch2_rx_datarange == "MEDHIGH") || (_ch2_protocol_new == "SATA" && _ch2_rx_datarange == "HIGH") || (_ch2_protocol_new == "FC" && _ch2_rx_datarange == "MEDHIGH") || (_ch2_protocol_new == "10BSER") || (_ch2_protocol_new == "8BSER"))
    rx_div2_mode_ch2_c   : in std_logic;
#endif
#endif
#if (_rst_gen == "ENABLED" && (_ch0_mode != "TXONLY" || _ch1_mode != "TXONLY" || _ch2_mode != "TXONLY" || _ch3_mode != "TXONLY"))
#if _ch2_mode == "RXONLY" || _ch2_mode == "RXTX"
#if _ch2_rx_lol_port == "EXTERNAL"
    ext_lol_in_ch2      : in std_logic;
#endif
#endif
#endif
-- CH3 --
#if _ch3_mode == "TXONLY"
    hdoutp_ch3, hdoutn_ch3   :   out std_logic;
#elif _ch3_mode == "RXONLY"
    hdinp_ch3, hdinn_ch3    :   in std_logic;
#elif _ch3_mode == "RXTX"
    hdinp_ch3, hdinn_ch3    :   in std_logic;
    hdoutp_ch3, hdoutn_ch3   :   out std_logic;
#endif
#if _ch3_mode != "DISABLED"
#if _ch3_protocol_new == "PIPE"
    TxDetRx_Loopback_ch3    :   in std_logic;
    TxCompliance_ch3    :   in std_logic;
    RxPolarity_ch3    :   in std_logic;
    PowerDown_ch3    :   in std_logic_vector (1 downto 0);
    RxValid_ch3   :   out std_logic;
    PhyStatus_ch3   :   out std_logic;
#endif
#if _sci_ports == "ENABLED"
    sci_sel_ch3    :   in std_logic;
#endif
#if _ch3_rx_fifo == "ENABLED"
    rxiclk_ch3    :   in std_logic;
#endif
#if _ch3_mode == "RXTX" || _ch3_mode == "TXONLY"
    txiclk_ch3    :   in std_logic;
#endif
#if _ch3_mode == "RXTX" || _ch3_mode == "RXONLY"
    rx_full_clk_ch3   :   out std_logic;
    rx_half_clk_ch3   :   out std_logic;
#endif
#if (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY") || ((_ch3_ctc == "ENABLED" && _ch3_rx_fifo == "ENABLED") && (_ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"))
    tx_full_clk_ch3   :   out std_logic;
#endif
#if (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY") || ((_ch3_ctc == "ENABLED" && _ch3_rx_fifo == "ENABLED") && (_ch3_rx_data_width == "16" || _ch3_rx_data_width == "20"))
    tx_half_clk_ch3   :   out std_logic;
#endif
#if _ch3_pll_rxsrc == "REFCLK_CORE"
    fpga_rxrefclk_ch3    :   in std_logic;
#endif
#if _ch3_mode == "RXTX" || _ch3_mode == "TXONLY"
#if _ch3_protocol_new == "PIPE"
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
    TxData_ch3    :   in std_logic_vector (7 downto 0);
    TxDataK_ch3    :   in std_logic;
#else
    TxData_ch3    :   in std_logic_vector (15 downto 0);
    TxDataK_ch3    :   in std_logic_vector (1 downto 0);
#endif
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
    txdata_ch3    :   in std_logic_vector (9 downto 0);
#else
    txdata_ch3    :   in std_logic_vector (19 downto 0);
#endif
#elif _ch3_protocol_new == "8BSER"
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
    txdata_ch3    :   in std_logic_vector (7 downto 0);
#else
    txdata_ch3    :   in std_logic_vector (15 downto 0);
#endif
#elif _ch3_protocol_new == "XAUI"
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
    txdata_ch3    :   in std_logic_vector (7 downto 0);
    txc_ch3    :   in std_logic;
#else
    txdata_ch3    :   in std_logic_vector (15 downto 0);
    txc_ch3    :   in std_logic_vector (1 downto 0);
#endif
#else
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
    txdata_ch3    :   in std_logic_vector (7 downto 0);
    tx_k_ch3    :   in std_logic;
#else
    txdata_ch3    :   in std_logic_vector (15 downto 0);
    tx_k_ch3    :   in std_logic_vector (1 downto 0);
#endif
#endif
#if _ch3_protocol_new == "PIPE" || _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "G8B10B" || _ch3_protocol_new == "PCIE" || _ch3_protocol_new == "OBSAI" || _ch3_protocol_new == "FC" || _ch3_protocol_new == "SATA" || _ch3_protocol_new == "DISP_PORT"
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
    tx_force_disp_ch3    :   in std_logic;
#else
    tx_force_disp_ch3    :   in std_logic_vector (1 downto 0);
#endif
#endif
#if _ch3_protocol_new == "PIPE" || _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "G8B10B" || _ch3_protocol_new == "PCIE" || _ch3_protocol_new == "OBSAI" || _ch3_protocol_new == "FC" || _ch3_protocol_new == "SATA" || _ch3_protocol_new == "DISP_PORT"
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
    tx_disp_sel_ch3    :   in std_logic;
#else
    tx_disp_sel_ch3    :   in std_logic_vector (1 downto 0);
#endif
#elif _ch3_protocol_new == "GIGE" || _ch3_protocol_new == "SGMII" 
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
    xmit_ch3    :   in std_logic;
#else
    xmit_ch3    :   in std_logic_vector (1 downto 0);
#endif
#endif
#if _ch3_protocol_new == "FC" || _ch3_protocol_new == "GIGE" || _ch3_protocol_new == "SGMII" 
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
    tx_disp_correct_ch3    :   in std_logic;
#else
    tx_disp_correct_ch3    :   in std_logic_vector (1 downto 0);
#endif
#elif _ch3_protocol_new == "PCIE" || _ch3_protocol_new == "PIPE"
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
    pci_ei_en_ch3    :   in std_logic;
#else
    pci_ei_en_ch3    :   in std_logic_vector (1 downto 0);
#endif
#endif
#endif
#if _ch3_mode == "RXTX" || _ch3_mode == "RXONLY"
#if _ch3_protocol_new == "PIPE"
#if _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
    RxData_ch3   :   out std_logic_vector (7 downto 0);
    RxDataK_ch3   :   out std_logic;
#else
    RxData_ch3   :   out std_logic_vector (15 downto 0);
    RxDataK_ch3   :   out std_logic_vector (1 downto 0);
#endif
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
#if _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
    rxdata_ch3   :   out std_logic_vector (9 downto 0);
#else
    rxdata_ch3   :   out std_logic_vector (19 downto 0);
#endif
#elif _ch3_protocol_new == "8BSER"
#if _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
    rxdata_ch3   :   out std_logic_vector (7 downto 0);
#else
    rxdata_ch3   :   out std_logic_vector (15 downto 0);
#endif
#elif _ch3_protocol_new == "XAUI"
#if _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
    rxdata_ch3   :   out std_logic_vector (7 downto 0);
    rxc_ch3   :   out std_logic;
#else
    rxdata_ch3   :   out std_logic_vector (15 downto 0);
    rxc_ch3   :   out std_logic_vector (1 downto 0);
#endif
#else
#if _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
    rxdata_ch3   :   out std_logic_vector (7 downto 0);
    rx_k_ch3   :   out std_logic;
#else
    rxdata_ch3   :   out std_logic_vector (15 downto 0);
    rx_k_ch3   :   out std_logic_vector (1 downto 0);
#endif
#endif
#if _ch3_protocol_new == "SATA" || _ch3_protocol_new == "DISP_PORT" || _ch3_protocol_new == "G8B10B" || _ch3_protocol_new == "GIGE" || _ch3_protocol_new == "SGMII" || _ch3_protocol_new == "XAUI" || _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "OBSAI" || _ch3_protocol_new == "SRIO" || _ch3_protocol_new == "FC"
#if _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
    rx_disp_err_ch3   :   out std_logic;
#else
    rx_disp_err_ch3   :   out std_logic_vector (1 downto 0);
#endif
#elif _ch3_protocol_new == "PCIE" 
#if _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
    rxstatus0_ch3   :   out std_logic_vector (2 downto 0);
#else
    rxstatus0_ch3   :   out std_logic_vector (2 downto 0);
    rxstatus1_ch3   :   out std_logic_vector (2 downto 0);
#endif
#elif _ch3_protocol_new == "PIPE"
#if _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
    RxStatus0_ch3   :   out std_logic_vector (2 downto 0);
#else
    RxStatus0_ch3   :   out std_logic_vector (2 downto 0);
    RxStatus1_ch3   :   out std_logic_vector (2 downto 0);
#endif
#endif
#if _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "OBSAI" || _ch3_protocol_new == "G8B10B" || _ch3_protocol_new == "GIGE" || _ch3_protocol_new == "SGMII" || _ch3_protocol_new == "XAUI" || _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "OBSAI" || _ch3_protocol_new == "SRIO" || _ch3_protocol_new == "FC"
#if _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
    rx_cv_err_ch3   :   out std_logic;
#else
    rx_cv_err_ch3   :   out std_logic_vector (1 downto 0);
#endif
#endif
#endif
#if (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY") && _rst_gen == "DISABLED"
    rx_serdes_rst_ch3_c    :   in std_logic;
#endif
#if _ch3_protocol_new != "PIPE" && _ch3_mode == "RXTX" && _ch3_lbtype == "DISABLED"
    sb_felb_ch3_c    :   in std_logic;
#endif
#if _ch3_protocol_new != "PIPE" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY") && _ch3_ird == "ENABLED"
    rx_invert_ch3_c    :   in std_logic;
#endif
#if _ch3_protocol_new == "PCIE"
    pcie_ct_ch3_c    : in std_logic;
    pcie_det_en_ch3_c    : in std_logic;
#endif
#if _ch3_protocol_new != "PIPE" && _ch3_mode == "RXTX" && _ch3_lbtype == "DISABLED"
    sb_felb_rst_ch3_c    :   in std_logic;
#endif
#if _ch3_protocol_new != "PIPE" && _ch3_ilsm == "DISABLED" && _ch3_rxwa == "ENABLED"
    word_align_en_ch3_c    :   in std_logic;
#endif
#if _ch3_protocol_new == "SATA" || _ch3_protocol_new == "PCIE"
    tx_idle_ch3_c    : in std_logic;
#else
#if _ch3_teidle == "ENABLED"
#if _ch3_protocol_new == "SRIO" || _ch3_protocol_new == "G8B10B" || _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "OBSAI" && (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY")
    tx_idle_ch3_c    : in std_logic;
#endif
#endif
#endif
#if _ch3_protocol_new != "PIPE" && (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY")
#if _rst_gen == "DISABLED"
    tx_pcs_rst_ch3_c    :   in std_logic;
#endif
    tx_pwrup_ch3_c    :   in std_logic;
#endif
#if _ch3_protocol_new != "PIPE" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
#if _rst_gen == "DISABLED"
    rx_pcs_rst_ch3_c    :   in std_logic;
#endif
    rx_pwrup_ch3_c    :   in std_logic;
#if _los_threshold_mode3 == "LOS_E"
    rx_los_low_ch3_s   :   out std_logic;
#elif _los_threshold_mode3 == "LOS_EA"
    rx_los_high_ch3_s   :   out std_logic;
#endif
#elif _ch3_protocol_new == "PIPE" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
#if _los_threshold_mode3 == "LOS_EA"
    RxElecIdle_ch3   :   out std_logic;
#endif
#endif
#if _ch3_protocol_new == "PIPE" || _ch3_protocol_new == "PCIE"
    pcie_done_ch3_s   : out std_logic;
    pcie_con_ch3_s   : out std_logic;
#endif
#if _ch3_protocol_new != "PIPE" && _ch3_ilsm == "ENABLED" && _ch3_rxwa == "ENABLED" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
    lsm_status_ch3_s   :   out std_logic;
#endif
#if _ch3_protocol_new != "PIPE" && _ch3_ctc == "ENABLED" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
    ctc_urun_ch3_s   :   out std_logic;
    ctc_orun_ch3_s   :   out std_logic;
    ctc_ins_ch3_s   :   out std_logic;
    ctc_del_ch3_s   :   out std_logic;
#endif
#if _ch3_protocol_new != "PIPE" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
    rx_cdr_lol_ch3_s   :   out std_logic;
#endif
#if _ch3_protocol_new != "PIPE" && _ch3_ldr == "ENABLED" && (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY")
    txd_ldr_ch3    :   in std_logic;
#endif
#if _ch3_protocol_new != "PIPE" && _ch3_ldr == "ENABLED" && (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY")
    txd_ldr_en_ch3_c    :   in std_logic;
#endif
#if _ch3_protocol_new != "PIPE" && _ch3_ldr == "ENABLED" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
    rxd_ldr_ch3   :   out std_logic;
#endif
#if _ch3_protocol_new == "DISP_PORT"
    rx_cdr_trained_ch3_s   :   out std_logic;
#endif
#if _ch3_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X" && _refclk_mult == "20X" && (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY")
    tx_div11_mode_ch3_c    :   in std_logic;
#endif
#if (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY") && ((_ch3_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X") || (_ch3_protocol_new == "G8B10B") || (_ch3_protocol_new == "CPRI" && (_datarange == "MED" || _datarange == "MEDHIGH")) || (_ch3_protocol_new == "OBSAI" && (_datarange == "MED" || _datarange == "HIGH")) || (_ch3_protocol_new == "SRIO" && _datarange == "MEDHIGH") || (_ch3_protocol_new == "SATA" && _datarange == "HIGH") || (_ch3_protocol_new == "FC" && _datarange == "MEDHIGH") || (_ch3_protocol_new == "10BSER") || (_ch3_protocol_new == "8BSER"))
    tx_div2_mode_ch3_c   : in std_logic;
#endif
#if _ch3_protocol_new == "SDI" && _ch3_rx_datarange == "HIGH" && _refclk_mult == "20X" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
    rx_div11_mode_ch3_c   : in std_logic;
#endif
#if (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY") && ((_ch3_protocol_new == "SDI" && _ch3_rx_datarange == "HIGH" && _refclk_mult == "20X") || (_ch3_protocol_new == "G8B10B") || (_ch3_protocol_new == "CPRI" && (_ch3_rx_datarange == "MED" || _ch3_rx_datarange == "MEDHIGH")) || (_ch3_protocol_new == "OBSAI" && (_ch3_rx_datarange == "MED" || _ch3_rx_datarange == "HIGH")) || (_ch3_protocol_new == "SRIO" && _ch3_rx_datarange == "MEDHIGH") || (_ch3_protocol_new == "SATA" && _ch3_rx_datarange == "HIGH") || (_ch3_protocol_new == "FC" && _ch3_rx_datarange == "MEDHIGH") || (_ch3_protocol_new == "10BSER") || (_ch3_protocol_new == "8BSER"))
    rx_div2_mode_ch3_c   : in std_logic;
#endif
#endif
#if (_rst_gen == "ENABLED" && (_ch0_mode != "TXONLY" || _ch1_mode != "TXONLY" || _ch2_mode != "TXONLY" || _ch3_mode != "TXONLY"))
#if _ch3_mode == "RXONLY" || _ch3_mode == "RXTX"
#if _ch3_rx_lol_port == "EXTERNAL"
    ext_lol_in_ch3      : in std_logic;
#endif
#endif
#endif
---- Miscillaneous ports
#if _sci_ports == "ENABLED"
    sci_wrdata    :   in std_logic_vector (7 downto 0);
    sci_addr    :   in std_logic_vector (5 downto 0);
    sci_rddata   :   out std_logic_vector (7 downto 0);
    sci_sel_quad    :   in std_logic;
    sci_rd    :   in std_logic;
    sci_wrn    :   in std_logic;
#if _sci_int_port == "ENABLED"
    sci_int    :   out std_logic;
#endif
#endif
#if _pll_txsrc == "REFCLK_CORE"
    fpga_txrefclk  :   in std_logic;
#endif
#if _ch0_mode == "RXTX" || _ch0_mode == "TXONLY" || _ch1_mode == "RXTX" || _ch1_mode == "TXONLY" || _ch2_mode == "RXTX" || _ch2_mode == "TXONLY" || _ch3_mode == "RXTX" || _ch3_mode == "TXONLY"
    tx_serdes_rst_c    :   in std_logic;
    tx_pll_lol_qd_s   :   out std_logic;
#endif
#if (_ch0_mode != "DISABLED" && (_ch1_mode != "DISABLED" || _ch2_mode != "DISABLED" || _ch3_mode != "DISABLED")) || (_ch1_mode != "DISABLED" && (_ch0_mode != "DISABLED" || _ch2_mode != "DISABLED" || _ch3_mode != "DISABLED")) || (_ch2_mode != "DISABLED" && (_ch1_mode != "DISABLED" || _ch0_mode != "DISABLED" || _ch3_mode != "DISABLED")) || (_ch3_mode != "DISABLED" && (_ch1_mode != "DISABLED" || _ch2_mode != "DISABLED" || _ch0_mode != "DISABLED"))
    tx_sync_qd_c    :   in std_logic;
#endif
#if _rst_gen == "DISABLED"
    rst_qd_c    :   in std_logic;
#endif
#if _refck2core == "ENABLED"
    refclk2fpga   :   out std_logic;
#endif
#if _rst_gen == "ENABLED"
    rst_n      :   in std_logic;
#endif
    serdes_rst_qd_c    :   in std_logic);

end _circuit_name;


architecture _circuit_name##_arch of _circuit_name is

component VLO
port (
   Z : out std_logic);
end component;

component VHI
port (
   Z : out std_logic);
end component;

#if (_rst_gen == "ENABLED" && (_ch0_mode == "RXONLY" || _ch0_mode == "RXTX" || _ch1_mode == "RXONLY" || _ch1_mode == "RXTX" || _ch2_mode == "RXONLY" || _ch2_mode == "RXTX" || _ch3_mode == "RXONLY" || _ch3_mode == "RXTX"))
component _rx_reset_sm_module
generic (count_index: integer :=18);
port (
   rst_n       : in std_logic;
   refclkdiv2        : in std_logic;
   tx_pll_lol_qd_s   : in std_logic;
   rx_serdes_rst_ch_c: out std_logic;
   rx_cdr_lol_ch_s   : in std_logic;
   rx_los_low_ch_s   : in std_logic;
   rx_pcs_rst_ch_c   : out std_logic
);
end component ;
#endif

#if (_rst_gen == "ENABLED" && (_ch0_mode == "TXONLY" || _ch0_mode == "RXTX" || _ch1_mode == "TXONLY" || _ch1_mode == "RXTX" || _ch2_mode == "TXONLY" || _ch2_mode == "RXTX" || _ch3_mode == "TXONLY" || _ch3_mode == "RXTX"))
component _tx_reset_sm_module
generic (count_index: integer :=18);
port (
   rst_n          : in std_logic;
   refclkdiv2      : in std_logic;
   tx_pll_lol_qd_s : in std_logic;
   rst_qd_c    : out std_logic;
   tx_pcs_rst_ch_c : out std_logic
   );
end component;
#endif

component PCSD
--synopsys translate_off
GENERIC(
  CONFIG_FILE : String;
  QUAD_MODE : String;
  CH0_CDR_SRC   : String := "REFCLK_EXT";
  CH1_CDR_SRC   : String := "REFCLK_EXT";
  CH2_CDR_SRC   : String := "REFCLK_EXT";
  CH3_CDR_SRC   : String := "REFCLK_EXT";
  PLL_SRC   : String
  );
--synopsys translate_on
port (
  HDINN0             : in std_logic;
  HDINN1             : in std_logic;
  HDINN2             : in std_logic;
  HDINN3             : in std_logic;
  HDINP0             : in std_logic;
  HDINP1             : in std_logic;
  HDINP2             : in std_logic;
  HDINP3             : in std_logic;
  REFCLKN             : in std_logic;
  REFCLKP             : in std_logic;
  CIN0             : in std_logic;
  CIN1             : in std_logic;
  CIN2             : in std_logic;
  CIN3             : in std_logic;
  CIN4             : in std_logic;
  CIN5             : in std_logic;
  CIN6             : in std_logic;
  CIN7             : in std_logic;
  CIN8             : in std_logic;
  CIN9             : in std_logic;
  CIN10             : in std_logic;
  CIN11             : in std_logic;
  CYAWSTN             : in std_logic;
  FF_EBRD_CLK_0             : in std_logic;
  FF_EBRD_CLK_1             : in std_logic;
  FF_EBRD_CLK_2             : in std_logic;
  FF_EBRD_CLK_3             : in std_logic;
  FF_RXI_CLK_0             : in std_logic;
  FF_RXI_CLK_1             : in std_logic;
  FF_RXI_CLK_2             : in std_logic;
  FF_RXI_CLK_3             : in std_logic;
  FF_TX_D_0_0             : in std_logic;
  FF_TX_D_0_1             : in std_logic;
  FF_TX_D_0_2             : in std_logic;
  FF_TX_D_0_3             : in std_logic;
  FF_TX_D_0_4             : in std_logic;
  FF_TX_D_0_5             : in std_logic;
  FF_TX_D_0_6             : in std_logic;
  FF_TX_D_0_7             : in std_logic;
  FF_TX_D_0_8             : in std_logic;
  FF_TX_D_0_9             : in std_logic;
  FF_TX_D_0_10             : in std_logic;
  FF_TX_D_0_11             : in std_logic;
  FF_TX_D_0_12             : in std_logic;
  FF_TX_D_0_13             : in std_logic;
  FF_TX_D_0_14             : in std_logic;
  FF_TX_D_0_15             : in std_logic;
  FF_TX_D_0_16             : in std_logic;
  FF_TX_D_0_17             : in std_logic;
  FF_TX_D_0_18             : in std_logic;
  FF_TX_D_0_19             : in std_logic;
  FF_TX_D_0_20             : in std_logic;
  FF_TX_D_0_21             : in std_logic;
  FF_TX_D_0_22             : in std_logic;
  FF_TX_D_0_23             : in std_logic;
  FF_TX_D_1_0             : in std_logic;
  FF_TX_D_1_1             : in std_logic;
  FF_TX_D_1_2             : in std_logic;
  FF_TX_D_1_3             : in std_logic;
  FF_TX_D_1_4             : in std_logic;
  FF_TX_D_1_5             : in std_logic;
  FF_TX_D_1_6             : in std_logic;
  FF_TX_D_1_7             : in std_logic;
  FF_TX_D_1_8             : in std_logic;
  FF_TX_D_1_9             : in std_logic;
  FF_TX_D_1_10             : in std_logic;
  FF_TX_D_1_11             : in std_logic;
  FF_TX_D_1_12             : in std_logic;
  FF_TX_D_1_13             : in std_logic;
  FF_TX_D_1_14             : in std_logic;
  FF_TX_D_1_15             : in std_logic;
  FF_TX_D_1_16             : in std_logic;
  FF_TX_D_1_17             : in std_logic;
  FF_TX_D_1_18             : in std_logic;
  FF_TX_D_1_19             : in std_logic;
  FF_TX_D_1_20             : in std_logic;
  FF_TX_D_1_21             : in std_logic;
  FF_TX_D_1_22             : in std_logic;
  FF_TX_D_1_23             : in std_logic;
  FF_TX_D_2_0             : in std_logic;
  FF_TX_D_2_1             : in std_logic;
  FF_TX_D_2_2             : in std_logic;
  FF_TX_D_2_3             : in std_logic;
  FF_TX_D_2_4             : in std_logic;
  FF_TX_D_2_5             : in std_logic;
  FF_TX_D_2_6             : in std_logic;
  FF_TX_D_2_7             : in std_logic;
  FF_TX_D_2_8             : in std_logic;
  FF_TX_D_2_9             : in std_logic;
  FF_TX_D_2_10             : in std_logic;
  FF_TX_D_2_11             : in std_logic;
  FF_TX_D_2_12             : in std_logic;
  FF_TX_D_2_13             : in std_logic;
  FF_TX_D_2_14             : in std_logic;
  FF_TX_D_2_15             : in std_logic;
  FF_TX_D_2_16             : in std_logic;
  FF_TX_D_2_17             : in std_logic;
  FF_TX_D_2_18             : in std_logic;
  FF_TX_D_2_19             : in std_logic;
  FF_TX_D_2_20             : in std_logic;
  FF_TX_D_2_21             : in std_logic;
  FF_TX_D_2_22             : in std_logic;
  FF_TX_D_2_23             : in std_logic;
  FF_TX_D_3_0             : in std_logic;
  FF_TX_D_3_1             : in std_logic;
  FF_TX_D_3_2             : in std_logic;
  FF_TX_D_3_3             : in std_logic;
  FF_TX_D_3_4             : in std_logic;
  FF_TX_D_3_5             : in std_logic;
  FF_TX_D_3_6             : in std_logic;
  FF_TX_D_3_7             : in std_logic;
  FF_TX_D_3_8             : in std_logic;
  FF_TX_D_3_9             : in std_logic;
  FF_TX_D_3_10             : in std_logic;
  FF_TX_D_3_11             : in std_logic;
  FF_TX_D_3_12             : in std_logic;
  FF_TX_D_3_13             : in std_logic;
  FF_TX_D_3_14             : in std_logic;
  FF_TX_D_3_15             : in std_logic;
  FF_TX_D_3_16             : in std_logic;
  FF_TX_D_3_17             : in std_logic;
  FF_TX_D_3_18             : in std_logic;
  FF_TX_D_3_19             : in std_logic;
  FF_TX_D_3_20             : in std_logic;
  FF_TX_D_3_21             : in std_logic;
  FF_TX_D_3_22             : in std_logic;
  FF_TX_D_3_23             : in std_logic;
  FF_TXI_CLK_0             : in std_logic;
  FF_TXI_CLK_1             : in std_logic;
  FF_TXI_CLK_2             : in std_logic;
  FF_TXI_CLK_3             : in std_logic;
  FFC_CK_CORE_RX_0         : in std_logic;
  FFC_CK_CORE_RX_1         : in std_logic;
  FFC_CK_CORE_RX_2         : in std_logic;
  FFC_CK_CORE_RX_3         : in std_logic;
  FFC_CK_CORE_TX           : in std_logic;
  FFC_EI_EN_0             : in std_logic;
  FFC_EI_EN_1             : in std_logic;
  FFC_EI_EN_2             : in std_logic;
  FFC_EI_EN_3             : in std_logic;
  FFC_ENABLE_CGALIGN_0             : in std_logic;
  FFC_ENABLE_CGALIGN_1             : in std_logic;
  FFC_ENABLE_CGALIGN_2             : in std_logic;
  FFC_ENABLE_CGALIGN_3             : in std_logic;
  FFC_FB_LOOPBACK_0             : in std_logic;
  FFC_FB_LOOPBACK_1             : in std_logic;
  FFC_FB_LOOPBACK_2             : in std_logic;
  FFC_FB_LOOPBACK_3             : in std_logic;
  FFC_LANE_RX_RST_0             : in std_logic;
  FFC_LANE_RX_RST_1             : in std_logic;
  FFC_LANE_RX_RST_2             : in std_logic;
  FFC_LANE_RX_RST_3             : in std_logic;
  FFC_LANE_TX_RST_0             : in std_logic;
  FFC_LANE_TX_RST_1             : in std_logic;
  FFC_LANE_TX_RST_2             : in std_logic;
  FFC_LANE_TX_RST_3             : in std_logic;
  FFC_MACRO_RST             : in std_logic;
  FFC_PCI_DET_EN_0             : in std_logic;
  FFC_PCI_DET_EN_1             : in std_logic;
  FFC_PCI_DET_EN_2             : in std_logic;
  FFC_PCI_DET_EN_3             : in std_logic;
  FFC_PCIE_CT_0             : in std_logic;
  FFC_PCIE_CT_1             : in std_logic;
  FFC_PCIE_CT_2             : in std_logic;
  FFC_PCIE_CT_3             : in std_logic;
  FFC_PFIFO_CLR_0             : in std_logic;
  FFC_PFIFO_CLR_1             : in std_logic;
  FFC_PFIFO_CLR_2             : in std_logic;
  FFC_PFIFO_CLR_3             : in std_logic;
  FFC_QUAD_RST             : in std_logic;
  FFC_RRST_0             : in std_logic;
  FFC_RRST_1             : in std_logic;
  FFC_RRST_2             : in std_logic;
  FFC_RRST_3             : in std_logic;
  FFC_RXPWDNB_0             : in std_logic;
  FFC_RXPWDNB_1             : in std_logic;
  FFC_RXPWDNB_2             : in std_logic;
  FFC_RXPWDNB_3             : in std_logic;
  FFC_SB_INV_RX_0             : in std_logic;
  FFC_SB_INV_RX_1             : in std_logic;
  FFC_SB_INV_RX_2             : in std_logic;
  FFC_SB_INV_RX_3             : in std_logic;
  FFC_SB_PFIFO_LP_0             : in std_logic;
  FFC_SB_PFIFO_LP_1             : in std_logic;
  FFC_SB_PFIFO_LP_2             : in std_logic;
  FFC_SB_PFIFO_LP_3             : in std_logic;
  FFC_SIGNAL_DETECT_0             : in std_logic;
  FFC_SIGNAL_DETECT_1             : in std_logic;
  FFC_SIGNAL_DETECT_2             : in std_logic;
  FFC_SIGNAL_DETECT_3             : in std_logic;
  FFC_SYNC_TOGGLE             : in std_logic;
  FFC_TRST             : in std_logic;
  FFC_TXPWDNB_0             : in std_logic;
  FFC_TXPWDNB_1             : in std_logic;
  FFC_TXPWDNB_2             : in std_logic;
  FFC_TXPWDNB_3             : in std_logic;
  FFC_RATE_MODE_RX_0        : in std_logic;
  FFC_RATE_MODE_RX_1        : in std_logic;
  FFC_RATE_MODE_RX_2        : in std_logic;
  FFC_RATE_MODE_RX_3        : in std_logic;
  FFC_RATE_MODE_TX_0        : in std_logic;
  FFC_RATE_MODE_TX_1        : in std_logic;
  FFC_RATE_MODE_TX_2        : in std_logic;
  FFC_RATE_MODE_TX_3        : in std_logic;
  FFC_DIV11_MODE_RX_0       : in std_logic;
  FFC_DIV11_MODE_RX_1       : in std_logic;
  FFC_DIV11_MODE_RX_2       : in std_logic;
  FFC_DIV11_MODE_RX_3       : in std_logic;
  FFC_DIV11_MODE_TX_0       : in std_logic;
  FFC_DIV11_MODE_TX_1       : in std_logic;
  FFC_DIV11_MODE_TX_2       : in std_logic;
  FFC_DIV11_MODE_TX_3       : in std_logic;
  LDR_CORE2TX_0             : in std_logic;
  LDR_CORE2TX_1             : in std_logic;
  LDR_CORE2TX_2             : in std_logic;
  LDR_CORE2TX_3             : in std_logic;
  FFC_LDR_CORE2TX_EN_0      : in std_logic;
  FFC_LDR_CORE2TX_EN_1      : in std_logic;
  FFC_LDR_CORE2TX_EN_2      : in std_logic;
  FFC_LDR_CORE2TX_EN_3      : in std_logic;
  PCIE_POWERDOWN_0_0      : in std_logic;
  PCIE_POWERDOWN_0_1      : in std_logic;
  PCIE_POWERDOWN_1_0      : in std_logic;
  PCIE_POWERDOWN_1_1      : in std_logic;
  PCIE_POWERDOWN_2_0      : in std_logic;
  PCIE_POWERDOWN_2_1      : in std_logic;
  PCIE_POWERDOWN_3_0      : in std_logic;
  PCIE_POWERDOWN_3_1      : in std_logic;
  PCIE_RXPOLARITY_0         : in std_logic;
  PCIE_RXPOLARITY_1         : in std_logic;
  PCIE_RXPOLARITY_2         : in std_logic;
  PCIE_RXPOLARITY_3         : in std_logic;
  PCIE_TXCOMPLIANCE_0       : in std_logic;
  PCIE_TXCOMPLIANCE_1       : in std_logic;
  PCIE_TXCOMPLIANCE_2       : in std_logic;
  PCIE_TXCOMPLIANCE_3       : in std_logic;
  PCIE_TXDETRX_PR2TLB_0     : in std_logic;
  PCIE_TXDETRX_PR2TLB_1     : in std_logic;
  PCIE_TXDETRX_PR2TLB_2     : in std_logic;
  PCIE_TXDETRX_PR2TLB_3     : in std_logic;
  SCIADDR0             : in std_logic;
  SCIADDR1             : in std_logic;
  SCIADDR2             : in std_logic;
  SCIADDR3             : in std_logic;
  SCIADDR4             : in std_logic;
  SCIADDR5             : in std_logic;
  SCIENAUX             : in std_logic;
  SCIENCH0             : in std_logic;
  SCIENCH1             : in std_logic;
  SCIENCH2             : in std_logic;
  SCIENCH3             : in std_logic;
  SCIRD                : in std_logic;
  SCISELAUX             : in std_logic;
  SCISELCH0             : in std_logic;
  SCISELCH1             : in std_logic;
  SCISELCH2             : in std_logic;
  SCISELCH3             : in std_logic;
  SCIWDATA0             : in std_logic;
  SCIWDATA1             : in std_logic;
  SCIWDATA2             : in std_logic;
  SCIWDATA3             : in std_logic;
  SCIWDATA4             : in std_logic;
  SCIWDATA5             : in std_logic;
  SCIWDATA6             : in std_logic;
  SCIWDATA7             : in std_logic;
  SCIWSTN               : in std_logic;
  REFCLK_FROM_NQ        : in std_logic;
  HDOUTN0             : out std_logic;
  HDOUTN1             : out std_logic;
  HDOUTN2             : out std_logic;
  HDOUTN3             : out std_logic;
  HDOUTP0             : out std_logic;
  HDOUTP1             : out std_logic;
  HDOUTP2             : out std_logic;
  HDOUTP3             : out std_logic;
  COUT0             : out std_logic;
  COUT1             : out std_logic;
  COUT2             : out std_logic;
  COUT3             : out std_logic;
  COUT4             : out std_logic;
  COUT5             : out std_logic;
  COUT6             : out std_logic;
  COUT7             : out std_logic;
  COUT8             : out std_logic;
  COUT9             : out std_logic;
  COUT10             : out std_logic;
  COUT11             : out std_logic;
  COUT12             : out std_logic;
  COUT13             : out std_logic;
  COUT14             : out std_logic;
  COUT15             : out std_logic;
  COUT16             : out std_logic;
  COUT17             : out std_logic;
  COUT18             : out std_logic;
  COUT19             : out std_logic;
  FF_RX_D_0_0             : out std_logic;
  FF_RX_D_0_1             : out std_logic;
  FF_RX_D_0_2             : out std_logic;
  FF_RX_D_0_3             : out std_logic;
  FF_RX_D_0_4             : out std_logic;
  FF_RX_D_0_5             : out std_logic;
  FF_RX_D_0_6             : out std_logic;
  FF_RX_D_0_7             : out std_logic;
  FF_RX_D_0_8             : out std_logic;
  FF_RX_D_0_9             : out std_logic;
  FF_RX_D_0_10             : out std_logic;
  FF_RX_D_0_11             : out std_logic;
  FF_RX_D_0_12             : out std_logic;
  FF_RX_D_0_13             : out std_logic;
  FF_RX_D_0_14             : out std_logic;
  FF_RX_D_0_15             : out std_logic;
  FF_RX_D_0_16             : out std_logic;
  FF_RX_D_0_17             : out std_logic;
  FF_RX_D_0_18             : out std_logic;
  FF_RX_D_0_19             : out std_logic;
  FF_RX_D_0_20             : out std_logic;
  FF_RX_D_0_21             : out std_logic;
  FF_RX_D_0_22             : out std_logic;
  FF_RX_D_0_23             : out std_logic;
  FF_RX_D_1_0             : out std_logic;
  FF_RX_D_1_1             : out std_logic;
  FF_RX_D_1_2             : out std_logic;
  FF_RX_D_1_3             : out std_logic;
  FF_RX_D_1_4             : out std_logic;
  FF_RX_D_1_5             : out std_logic;
  FF_RX_D_1_6             : out std_logic;
  FF_RX_D_1_7             : out std_logic;
  FF_RX_D_1_8             : out std_logic;
  FF_RX_D_1_9             : out std_logic;
  FF_RX_D_1_10             : out std_logic;
  FF_RX_D_1_11             : out std_logic;
  FF_RX_D_1_12             : out std_logic;
  FF_RX_D_1_13             : out std_logic;
  FF_RX_D_1_14             : out std_logic;
  FF_RX_D_1_15             : out std_logic;
  FF_RX_D_1_16             : out std_logic;
  FF_RX_D_1_17             : out std_logic;
  FF_RX_D_1_18             : out std_logic;
  FF_RX_D_1_19             : out std_logic;
  FF_RX_D_1_20             : out std_logic;
  FF_RX_D_1_21             : out std_logic;
  FF_RX_D_1_22             : out std_logic;
  FF_RX_D_1_23             : out std_logic;
  FF_RX_D_2_0             : out std_logic;
  FF_RX_D_2_1             : out std_logic;
  FF_RX_D_2_2             : out std_logic;
  FF_RX_D_2_3             : out std_logic;
  FF_RX_D_2_4             : out std_logic;
  FF_RX_D_2_5             : out std_logic;
  FF_RX_D_2_6             : out std_logic;
  FF_RX_D_2_7             : out std_logic;
  FF_RX_D_2_8             : out std_logic;
  FF_RX_D_2_9             : out std_logic;
  FF_RX_D_2_10             : out std_logic;
  FF_RX_D_2_11             : out std_logic;
  FF_RX_D_2_12             : out std_logic;
  FF_RX_D_2_13             : out std_logic;
  FF_RX_D_2_14             : out std_logic;
  FF_RX_D_2_15             : out std_logic;
  FF_RX_D_2_16             : out std_logic;
  FF_RX_D_2_17             : out std_logic;
  FF_RX_D_2_18             : out std_logic;
  FF_RX_D_2_19             : out std_logic;
  FF_RX_D_2_20             : out std_logic;
  FF_RX_D_2_21             : out std_logic;
  FF_RX_D_2_22             : out std_logic;
  FF_RX_D_2_23             : out std_logic;
  FF_RX_D_3_0             : out std_logic;
  FF_RX_D_3_1             : out std_logic;
  FF_RX_D_3_2             : out std_logic;
  FF_RX_D_3_3             : out std_logic;
  FF_RX_D_3_4             : out std_logic;
  FF_RX_D_3_5             : out std_logic;
  FF_RX_D_3_6             : out std_logic;
  FF_RX_D_3_7             : out std_logic;
  FF_RX_D_3_8             : out std_logic;
  FF_RX_D_3_9             : out std_logic;
  FF_RX_D_3_10             : out std_logic;
  FF_RX_D_3_11             : out std_logic;
  FF_RX_D_3_12             : out std_logic;
  FF_RX_D_3_13             : out std_logic;
  FF_RX_D_3_14             : out std_logic;
  FF_RX_D_3_15             : out std_logic;
  FF_RX_D_3_16             : out std_logic;
  FF_RX_D_3_17             : out std_logic;
  FF_RX_D_3_18             : out std_logic;
  FF_RX_D_3_19             : out std_logic;
  FF_RX_D_3_20             : out std_logic;
  FF_RX_D_3_21             : out std_logic;
  FF_RX_D_3_22             : out std_logic;
  FF_RX_D_3_23             : out std_logic;
  FF_RX_F_CLK_0             : out std_logic;
  FF_RX_F_CLK_1             : out std_logic;
  FF_RX_F_CLK_2             : out std_logic;
  FF_RX_F_CLK_3             : out std_logic;
  FF_RX_H_CLK_0             : out std_logic;
  FF_RX_H_CLK_1             : out std_logic;
  FF_RX_H_CLK_2             : out std_logic;
  FF_RX_H_CLK_3             : out std_logic;
  FF_TX_F_CLK_0             : out std_logic;
  FF_TX_F_CLK_1             : out std_logic;
  FF_TX_F_CLK_2             : out std_logic;
  FF_TX_F_CLK_3             : out std_logic;
  FF_TX_H_CLK_0             : out std_logic;
  FF_TX_H_CLK_1             : out std_logic;
  FF_TX_H_CLK_2             : out std_logic;
  FF_TX_H_CLK_3             : out std_logic;
  FFS_CC_OVERRUN_0             : out std_logic;
  FFS_CC_OVERRUN_1             : out std_logic;
  FFS_CC_OVERRUN_2             : out std_logic;
  FFS_CC_OVERRUN_3             : out std_logic;
  FFS_CC_UNDERRUN_0             : out std_logic;
  FFS_CC_UNDERRUN_1             : out std_logic;
  FFS_CC_UNDERRUN_2             : out std_logic;
  FFS_CC_UNDERRUN_3             : out std_logic;
  FFS_LS_SYNC_STATUS_0             : out std_logic;
  FFS_LS_SYNC_STATUS_1             : out std_logic;
  FFS_LS_SYNC_STATUS_2             : out std_logic;
  FFS_LS_SYNC_STATUS_3             : out std_logic;
  FFS_CDR_TRAIN_DONE_0             : out std_logic;
  FFS_CDR_TRAIN_DONE_1             : out std_logic;
  FFS_CDR_TRAIN_DONE_2             : out std_logic;
  FFS_CDR_TRAIN_DONE_3             : out std_logic;
  FFS_PCIE_CON_0             : out std_logic;
  FFS_PCIE_CON_1             : out std_logic;
  FFS_PCIE_CON_2             : out std_logic;
  FFS_PCIE_CON_3             : out std_logic;
  FFS_PCIE_DONE_0             : out std_logic;
  FFS_PCIE_DONE_1             : out std_logic;
  FFS_PCIE_DONE_2             : out std_logic;
  FFS_PCIE_DONE_3             : out std_logic;
  FFS_PLOL             : out std_logic;
  FFS_RLOL_0             : out std_logic;
  FFS_RLOL_1             : out std_logic;
  FFS_RLOL_2             : out std_logic;
  FFS_RLOL_3             : out std_logic;
  FFS_RLOS_HI_0             : out std_logic;
  FFS_RLOS_HI_1             : out std_logic;
  FFS_RLOS_HI_2             : out std_logic;
  FFS_RLOS_HI_3             : out std_logic;
  FFS_RLOS_LO_0             : out std_logic;
  FFS_RLOS_LO_1             : out std_logic;
  FFS_RLOS_LO_2             : out std_logic;
  FFS_RLOS_LO_3             : out std_logic;
  FFS_RXFBFIFO_ERROR_0             : out std_logic;
  FFS_RXFBFIFO_ERROR_1             : out std_logic;
  FFS_RXFBFIFO_ERROR_2             : out std_logic;
  FFS_RXFBFIFO_ERROR_3             : out std_logic;
  FFS_TXFBFIFO_ERROR_0             : out std_logic;
  FFS_TXFBFIFO_ERROR_1             : out std_logic;
  FFS_TXFBFIFO_ERROR_2             : out std_logic;
  FFS_TXFBFIFO_ERROR_3             : out std_logic;
  PCIE_PHYSTATUS_0             : out std_logic;
  PCIE_PHYSTATUS_1             : out std_logic;
  PCIE_PHYSTATUS_2             : out std_logic;
  PCIE_PHYSTATUS_3             : out std_logic;
  PCIE_RXVALID_0               : out std_logic;
  PCIE_RXVALID_1               : out std_logic;
  PCIE_RXVALID_2               : out std_logic;
  PCIE_RXVALID_3               : out std_logic;
  FFS_SKP_ADDED_0                  : out std_logic;
  FFS_SKP_ADDED_1                  : out std_logic;
  FFS_SKP_ADDED_2                  : out std_logic;
  FFS_SKP_ADDED_3                  : out std_logic;
  FFS_SKP_DELETED_0                : out std_logic;
  FFS_SKP_DELETED_1                : out std_logic;
  FFS_SKP_DELETED_2                : out std_logic;
  FFS_SKP_DELETED_3                : out std_logic;
  LDR_RX2CORE_0                    : out std_logic;
  LDR_RX2CORE_1                    : out std_logic;
  LDR_RX2CORE_2                    : out std_logic;
  LDR_RX2CORE_3                    : out std_logic;
  REFCK2CORE             : out std_logic;
  SCIINT                : out std_logic;
  SCIRDATA0             : out std_logic;
  SCIRDATA1             : out std_logic;
  SCIRDATA2             : out std_logic;
  SCIRDATA3             : out std_logic;
  SCIRDATA4             : out std_logic;
  SCIRDATA5             : out std_logic;
  SCIRDATA6             : out std_logic;
  SCIRDATA7             : out std_logic;
  REFCLK_TO_NQ          : out std_logic
);
end component;
   attribute CONFIG_FILE: string;
   attribute CONFIG_FILE of PCSD_INST : label is USER_CONFIG_FILE;
   attribute QUAD_MODE: string;
   attribute QUAD_MODE of PCSD_INST : label is "SINGLE";
   attribute PLL_SRC: string;
   attribute PLL_SRC of PCSD_INST : label is _pll_txsrc;
#if _ch0_mode != "DISABLED"
   attribute CH0_CDR_SRC: string;
   attribute CH0_CDR_SRC of PCSD_INST : label is _ch0_pll_rxsrc;
#endif
#if _ch1_mode != "DISABLED"
   attribute CH1_CDR_SRC: string;
   attribute CH1_CDR_SRC of PCSD_INST : label is _ch1_pll_rxsrc;
#endif
#if _ch2_mode != "DISABLED"
   attribute CH2_CDR_SRC: string;
   attribute CH2_CDR_SRC of PCSD_INST : label is _ch2_pll_rxsrc;
#endif
#if _ch3_mode != "DISABLED"
   attribute CH3_CDR_SRC: string;
   attribute CH3_CDR_SRC of PCSD_INST : label is _ch3_pll_rxsrc;
#endif
   attribute FREQUENCY_PIN_FF_RX_F_CLK_0: string;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_0 of PCSD_INST : label is #_ch0_rx_ficlk_rate_new;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_1: string;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_1 of PCSD_INST : label is #_ch1_rx_ficlk_rate_new;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_2: string;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_2 of PCSD_INST : label is #_ch2_rx_ficlk_rate_new;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_3: string;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_3 of PCSD_INST : label is #_ch3_rx_ficlk_rate_new;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_0: string;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_0 of PCSD_INST : label is #_ch0_rx_ficlk_rate_new_h;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_1: string;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_1 of PCSD_INST : label is #_ch1_rx_ficlk_rate_new_h;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_2: string;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_2 of PCSD_INST : label is #_ch2_rx_ficlk_rate_new_h;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_3: string;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_3 of PCSD_INST : label is #_ch3_rx_ficlk_rate_new_h;
   attribute FREQUENCY_PIN_FF_TX_F_CLK_0: string;
   attribute FREQUENCY_PIN_FF_TX_F_CLK_0 of PCSD_INST : label is #_ch0_tx_ficlk_rate_new;
   attribute FREQUENCY_PIN_FF_TX_F_CLK_1: string;
   attribute FREQUENCY_PIN_FF_TX_F_CLK_1 of PCSD_INST : label is #_ch1_tx_ficlk_rate_new;
   attribute FREQUENCY_PIN_FF_TX_F_CLK_2: string;
   attribute FREQUENCY_PIN_FF_TX_F_CLK_2 of PCSD_INST : label is #_ch2_tx_ficlk_rate_new;
   attribute FREQUENCY_PIN_FF_TX_F_CLK_3: string;
   attribute FREQUENCY_PIN_FF_TX_F_CLK_3 of PCSD_INST : label is #_ch3_tx_ficlk_rate_new;
   attribute FREQUENCY_PIN_FF_TX_H_CLK_0: string;
   attribute FREQUENCY_PIN_FF_TX_H_CLK_0 of PCSD_INST : label is #_ch0_tx_ficlk_rate_new_h;
   attribute FREQUENCY_PIN_FF_TX_H_CLK_1: string;
   attribute FREQUENCY_PIN_FF_TX_H_CLK_1 of PCSD_INST : label is #_ch1_tx_ficlk_rate_new_h;
   attribute FREQUENCY_PIN_FF_TX_H_CLK_2: string;
   attribute FREQUENCY_PIN_FF_TX_H_CLK_2 of PCSD_INST : label is #_ch2_tx_ficlk_rate_new_h;
   attribute FREQUENCY_PIN_FF_TX_H_CLK_3: string;
   attribute FREQUENCY_PIN_FF_TX_H_CLK_3 of PCSD_INST : label is #_ch3_tx_ficlk_rate_new_h;
#if _refck2core == "ENABLED"
   attribute FREQUENCY_PIN_REFCK2CORE: string;
   attribute FREQUENCY_PIN_REFCK2CORE of PCSD_INST : label is #_refclk_rate;
#endif
   attribute black_box_pad_pin: string;
   attribute black_box_pad_pin of PCSD : component is "HDINP0, HDINN0, HDINP1, HDINN1, HDINP2, HDINN2, HDINP3, HDINN3, HDOUTP0, HDOUTN0, HDOUTP1, HDOUTN1, HDOUTP2, HDOUTN2, HDOUTP3, HDOUTN3, REFCLKP, REFCLKN";

signal refclk_from_nq : std_logic := '0';
signal fpsc_vlo : std_logic := '0';
signal fpsc_vhi : std_logic := '1';
signal cin : std_logic_vector (11 downto 0) := "000000000000";
signal cout : std_logic_vector (19 downto 0);
#if (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY") || ((_ch0_ctc == "ENABLED" && _ch0_rx_fifo == "ENABLED") && (_ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"))
signal    tx_full_clk_ch0_sig   :   std_logic;
#endif
#if (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY") || ((_ch1_ctc == "ENABLED" && _ch1_rx_fifo == "ENABLED") && (_ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"))
signal    tx_full_clk_ch1_sig   :   std_logic;
#endif
#if (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY") || ((_ch2_ctc == "ENABLED" && _ch2_rx_fifo == "ENABLED") && (_ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"))
signal    tx_full_clk_ch2_sig   :   std_logic;
#endif
#if (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY") || ((_ch3_ctc == "ENABLED" && _ch3_rx_fifo == "ENABLED") && (_ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"))
signal    tx_full_clk_ch3_sig   :   std_logic;
#endif

signal    refclk2fpga_sig  :   std_logic;
signal    tx_pll_lol_qd_sig  :   std_logic;
signal    rx_los_low_ch0_sig  :   std_logic;
signal    rx_los_low_ch1_sig  :   std_logic;
signal    rx_los_low_ch2_sig  :   std_logic;
signal    rx_los_low_ch3_sig  :   std_logic;
signal    rx_cdr_lol_ch0_sig  :   std_logic;
signal    rx_cdr_lol_ch1_sig  :   std_logic;
signal    rx_cdr_lol_ch2_sig  :   std_logic;
signal    rx_cdr_lol_ch3_sig  :   std_logic;

#if (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY") && _rst_gen == "ENABLED"
signal    rx_serdes_rst_ch0_c  : std_logic;
#endif
#if (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY") && _rst_gen == "ENABLED"
signal    rx_serdes_rst_ch1_c  : std_logic;
#endif
#if (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY") && _rst_gen == "ENABLED"
signal    rx_serdes_rst_ch2_c  : std_logic;
#endif
#if (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY") && _rst_gen == "ENABLED"
signal    rx_serdes_rst_ch3_c  : std_logic;
#endif
#if (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY") && _rst_gen == "ENABLED"
signal    rx_pcs_rst_ch0_c  : std_logic;
#endif
#if (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY") && _rst_gen == "ENABLED"
signal    rx_pcs_rst_ch1_c  : std_logic;
#endif
#if (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY") && _rst_gen == "ENABLED"
signal    rx_pcs_rst_ch2_c  : std_logic;
#endif
#if (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY") && _rst_gen == "ENABLED"
signal    rx_pcs_rst_ch3_c  : std_logic;
#endif

#if (_rst_gen == "ENABLED" && (_ch0_mode != "TXONLY" || _ch1_mode != "TXONLY" || _ch2_mode != "TXONLY" || _ch3_mode != "TXONLY"))
-- reset sequence for rx
#if _ch0_mode == "RXONLY" || _ch0_mode == "RXTX"
signal    refclkdiv2_rx_ch0  :   std_logic;
#endif
#if _ch1_mode == "RXONLY" || _ch1_mode == "RXTX"
signal    refclkdiv2_rx_ch1  :   std_logic;
#endif
#if _ch2_mode == "RXONLY" || _ch2_mode == "RXTX"
signal    refclkdiv2_rx_ch2  :   std_logic;
#endif
#if _ch3_mode == "RXONLY" || _ch3_mode == "RXTX"
signal    refclkdiv2_rx_ch3  :   std_logic;
#endif
#endif

#if (_rst_gen == "ENABLED" && (_ch0_mode == "TXONLY" || _ch1_mode == "TXONLY" || _ch2_mode == "TXONLY" || _ch3_mode == "TXONLY" || _ch0_mode == "RXTX" || _ch1_mode == "RXTX" || _ch2_mode == "RXTX" || _ch3_mode == "RXTX"))
signal    refclkdiv2_tx_ch  :   std_logic;
signal    tx_pcs_rst_ch_c   :   std_logic;
signal    rst_qd_c   :   std_logic;
#endif


begin

vlo_inst : VLO port map(Z => fpsc_vlo);
vhi_inst : VHI port map(Z => fpsc_vhi);

#if _refck2core == "ENABLED"
  refclk2fpga <= refclk2fpga_sig;
#endif
#if _ch0_protocol_new != "PIPE" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
#if _los_threshold_mode0 == "LOS_E"
    rx_los_low_ch0_s <= rx_los_low_ch0_sig;
#endif
#endif
#if _ch1_protocol_new != "PIPE" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
#if _los_threshold_mode1 == "LOS_E"
    rx_los_low_ch1_s <= rx_los_low_ch1_sig;
#endif
#endif
#if _ch2_protocol_new != "PIPE" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
#if _los_threshold_mode2 == "LOS_E"
    rx_los_low_ch2_s <= rx_los_low_ch2_sig;
#endif
#endif
#if _ch3_protocol_new != "PIPE" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
#if _los_threshold_mode3 == "LOS_E"
    rx_los_low_ch3_s <= rx_los_low_ch3_sig;
#endif
#endif
#if _ch0_protocol_new != "PIPE" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
    rx_cdr_lol_ch0_s <= rx_cdr_lol_ch0_sig;
#endif
#if _ch1_protocol_new != "PIPE" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
    rx_cdr_lol_ch1_s <= rx_cdr_lol_ch1_sig;
#endif
#if _ch2_protocol_new != "PIPE" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
    rx_cdr_lol_ch2_s <= rx_cdr_lol_ch2_sig;
#endif
#if _ch3_protocol_new != "PIPE" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
    rx_cdr_lol_ch3_s <= rx_cdr_lol_ch3_sig;
#endif
#if _ch0_mode == "RXTX" || _ch0_mode == "TXONLY" || _ch1_mode == "RXTX" || _ch1_mode == "TXONLY" || _ch2_mode == "RXTX" || _ch2_mode == "TXONLY" || _ch3_mode == "RXTX" || _ch3_mode == "TXONLY"
  tx_pll_lol_qd_s <= tx_pll_lol_qd_sig;
#endif
#if _ch0_mode != "DISABLED"
#if (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY") || ((_ch0_ctc == "ENABLED" && _ch0_rx_fifo == "ENABLED") && (_ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"))
  tx_full_clk_ch0 <= tx_full_clk_ch0_sig;
#endif
#endif
#if _ch1_mode != "DISABLED" 
#if (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY") || ((_ch1_ctc == "ENABLED" && _ch1_rx_fifo == "ENABLED") && (_ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"))
  tx_full_clk_ch1 <= tx_full_clk_ch1_sig;
#endif
#endif
#if _ch2_mode != "DISABLED" 
#if (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY") || ((_ch2_ctc == "ENABLED" && _ch2_rx_fifo == "ENABLED") && (_ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"))
  tx_full_clk_ch2 <= tx_full_clk_ch2_sig;
#endif
#endif
#if _ch3_mode != "DISABLED" 
#if (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY") || ((_ch3_ctc == "ENABLED" && _ch3_rx_fifo == "ENABLED") && (_ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"))
  tx_full_clk_ch3 <= tx_full_clk_ch3_sig;
#endif
#endif

-- pcs_quad instance
PCSD_INST : PCSD
--synopsys translate_off
  generic map (CONFIG_FILE => USER_CONFIG_FILE,
               QUAD_MODE => "SINGLE",
#if _ch0_mode != "DISABLED"
               CH0_CDR_SRC => _ch0_pll_rxsrc,
#endif
#if _ch1_mode != "DISABLED"               
               CH1_CDR_SRC => _ch1_pll_rxsrc,
#endif
#if _ch2_mode != "DISABLED"               
               CH2_CDR_SRC => _ch2_pll_rxsrc,
#endif
#if _ch3_mode != "DISABLED"               
               CH3_CDR_SRC => _ch3_pll_rxsrc,
#endif
               PLL_SRC  => _pll_txsrc
  )
--synopsys translate_on
port map  (
#if _pll_txsrc == "REFCLK_EXT" || ((_ch0_mode == "RXTX" || _ch0_mode == "RXONLY") && _ch0_pll_rxsrc == "REFCLK_EXT") || ((_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")  && _ch1_pll_rxsrc == "REFCLK_EXT") || ((_ch2_mode == "RXTX" || _ch2_mode == "RXONLY") && _ch2_pll_rxsrc == "REFCLK_EXT") || ((_ch3_mode == "RXTX" || _ch3_mode == "RXONLY") && _ch3_pll_rxsrc == "REFCLK_EXT")
  REFCLKP => refclkp,
  REFCLKN => refclkn,
#else
  REFCLKP => fpsc_vlo,
  REFCLKN => fpsc_vlo,
#endif

----- CH0 -----
#if _ch0_mode == "TXONLY" || _ch0_mode == "RXTX"
  HDOUTP0 => hdoutp_ch0,
  HDOUTN0 => hdoutn_ch0,
#else
  HDOUTP0 => open,
  HDOUTN0 => open,
#endif
#if _ch0_mode == "RXONLY" || _ch0_mode == "RXTX"
  HDINP0 => hdinp_ch0,
  HDINN0 => hdinn_ch0,
#else
  HDINP0 => fpsc_vlo,
  HDINN0 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "PIPE" && _ch0_mode != "DISABLED"
  PCIE_TXDETRX_PR2TLB_0 => TxDetRx_Loopback_ch0,
#else
  PCIE_TXDETRX_PR2TLB_0 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "PIPE" && _ch0_mode != "DISABLED"
  PCIE_TXCOMPLIANCE_0 => TxCompliance_ch0,
  PCIE_RXPOLARITY_0 => RxPolarity_ch0,
  PCIE_POWERDOWN_0_0 => PowerDown_ch0(0),
  PCIE_POWERDOWN_0_1 => PowerDown_ch0(1),
  PCIE_RXVALID_0 => RxValid_ch0,
  PCIE_PHYSTATUS_0 => PhyStatus_ch0,
#else
  PCIE_TXCOMPLIANCE_0 => fpsc_vlo,
  PCIE_RXPOLARITY_0 => fpsc_vlo,
  PCIE_POWERDOWN_0_0 => fpsc_vlo,
  PCIE_POWERDOWN_0_1 => fpsc_vlo,
  PCIE_RXVALID_0 => open,
  PCIE_PHYSTATUS_0 => open,
#endif
#if _ch0_mode == "DISABLED"
  SCISELCH0 => fpsc_vlo,
  SCIENCH0 => fpsc_vlo,
#elif _sci_ports == "DISABLED"
  SCISELCH0 => fpsc_vlo,
  SCIENCH0 => fpsc_vlo,
#else
  SCISELCH0 => sci_sel_ch0,
  SCIENCH0 => fpsc_vhi,
#endif
#if _ch0_mode != "DISABLED" && _ch0_rx_fifo == "ENABLED"
  FF_RXI_CLK_0 => rxiclk_ch0,
#else
  FF_RXI_CLK_0 => fpsc_vlo,
#endif
#if _ch0_mode == "RXTX" || _ch0_mode == "TXONLY"
  FF_TXI_CLK_0 => txiclk_ch0,
#else
  FF_TXI_CLK_0 => fpsc_vlo,
#endif
#if _ch0_mode != "DISABLED"
#if (_ch0_ctc == "ENABLED" && ((_ch0_mode == "RXTX" || _ch0_mode == "TXONLY") || ((_ch0_ctc == "ENABLED" && _ch0_rx_fifo == "ENABLED") && (_ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"))))
  FF_EBRD_CLK_0 => tx_full_clk_ch0_sig,
#else
  FF_EBRD_CLK_0 => fpsc_vlo,
#endif
#else
  FF_EBRD_CLK_0 => fpsc_vlo,
#endif
#if _ch0_mode == "RXTX" || _ch0_mode == "RXONLY"
  FF_RX_F_CLK_0 => rx_full_clk_ch0,
#else
  FF_RX_F_CLK_0 => open,
#endif
#if _ch0_mode == "RXTX" || _ch0_mode == "RXONLY"
  FF_RX_H_CLK_0 => rx_half_clk_ch0,
#else
  FF_RX_H_CLK_0 => open,
#endif
#if (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY") || ((_ch0_ctc == "ENABLED" && _ch0_rx_fifo == "ENABLED") && (_ch0_rx_data_width == "8" || _ch0_rx_data_width == "10")) 
  FF_TX_F_CLK_0 => tx_full_clk_ch0_sig,
#else
  FF_TX_F_CLK_0 => open,
#endif
#if (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY") || ((_ch0_ctc == "ENABLED" && _ch0_rx_fifo == "ENABLED") && (_ch0_rx_data_width == "16" || _ch0_rx_data_width == "20"))
  FF_TX_H_CLK_0 => tx_half_clk_ch0,
#else
  FF_TX_H_CLK_0 => open,
#endif
#if _ch0_mode != "DISABLED" && _ch0_pll_rxsrc == "REFCLK_CORE"
  FFC_CK_CORE_RX_0 => fpga_rxrefclk_ch0,
#else
  FFC_CK_CORE_RX_0 => fpsc_vlo,
#endif
#if _ch0_mode == "RXONLY"
  FF_TX_D_0_0 => fpsc_vlo,
  FF_TX_D_0_1 => fpsc_vlo,
  FF_TX_D_0_2 => fpsc_vlo,
  FF_TX_D_0_3 => fpsc_vlo,
  FF_TX_D_0_4 => fpsc_vlo,
  FF_TX_D_0_5 => fpsc_vlo,
  FF_TX_D_0_6 => fpsc_vlo,
  FF_TX_D_0_7 => fpsc_vlo,
  FF_TX_D_0_8 => fpsc_vlo,
  FF_TX_D_0_9 => fpsc_vlo,
  FF_TX_D_0_10 => fpsc_vlo,
  FF_TX_D_0_11 => fpsc_vlo,
  FF_TX_D_0_12 => fpsc_vlo,
  FF_TX_D_0_13 => fpsc_vlo,
  FF_TX_D_0_14 => fpsc_vlo,
  FF_TX_D_0_15 => fpsc_vlo,
  FF_TX_D_0_16 => fpsc_vlo,
  FF_TX_D_0_17 => fpsc_vlo,
  FF_TX_D_0_18 => fpsc_vlo,
  FF_TX_D_0_19 => fpsc_vlo,
  FF_TX_D_0_20 => fpsc_vlo,
  FF_TX_D_0_21 => fpsc_vlo,
  FF_TX_D_0_22 => fpsc_vlo,
  FF_TX_D_0_23 => fpsc_vlo,
#else
#if _ch0_protocol_new == "DISABLED"
  FF_TX_D_0_0 => fpsc_vlo,
  FF_TX_D_0_1 => fpsc_vlo,
  FF_TX_D_0_2 => fpsc_vlo,
  FF_TX_D_0_3 => fpsc_vlo,
  FF_TX_D_0_4 => fpsc_vlo,
  FF_TX_D_0_5 => fpsc_vlo,
  FF_TX_D_0_6 => fpsc_vlo,
  FF_TX_D_0_7 => fpsc_vlo,
#elif _ch0_protocol_new == "PIPE"
  FF_TX_D_0_0 => TxData_ch0(0),
  FF_TX_D_0_1 => TxData_ch0(1),
  FF_TX_D_0_2 => TxData_ch0(2),
  FF_TX_D_0_3 => TxData_ch0(3),
  FF_TX_D_0_4 => TxData_ch0(4),
  FF_TX_D_0_5 => TxData_ch0(5),
  FF_TX_D_0_6 => TxData_ch0(6),
  FF_TX_D_0_7 => TxData_ch0(7),
#else
  FF_TX_D_0_0 => txdata_ch0(0),
  FF_TX_D_0_1 => txdata_ch0(1),
  FF_TX_D_0_2 => txdata_ch0(2),
  FF_TX_D_0_3 => txdata_ch0(3),
  FF_TX_D_0_4 => txdata_ch0(4),
  FF_TX_D_0_5 => txdata_ch0(5),
  FF_TX_D_0_6 => txdata_ch0(6),
  FF_TX_D_0_7 => txdata_ch0(7),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_protocol_new == "8BSER"
  FF_TX_D_0_8 => fpsc_vlo,
#elif _ch0_protocol_new == "PIPE"
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_8 => TxDataK_ch0,
#else
  FF_TX_D_0_8 => TxDataK_ch0(0),
#endif
#elif _ch0_protocol_new == "XAUI"
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_8 => txc_ch0,
#else
  FF_TX_D_0_8 => txc_ch0(0),
#endif
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_TX_D_0_8 => txdata_ch0(8),
#else
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_8 => tx_k_ch0,
#else
  FF_TX_D_0_8 => tx_k_ch0(0),
#endif
#endif
#if _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_TX_D_0_9 => txdata_ch0(9),
#elif _ch0_protocol_new == "PIPE" || _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "G8B10B" || _ch0_protocol_new == "PCIE" || _ch0_protocol_new == "OBSAI" || _ch0_protocol_new == "FC" || _ch0_protocol_new == "SATA" || _ch0_protocol_new == "DISP_PORT"
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_9 => tx_force_disp_ch0,
#else
  FF_TX_D_0_9 => tx_force_disp_ch0(0),
#endif
#else
  FF_TX_D_0_9 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "GIGE" || _ch0_protocol_new == "SGMII" 
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_10 => xmit_ch0,
#else
  FF_TX_D_0_10 => xmit_ch0(0),
#endif
#elif _ch0_protocol_new == "PIPE" || _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "G8B10B" || _ch0_protocol_new == "PCIE" || _ch0_protocol_new == "OBSAI" || _ch0_protocol_new == "FC" || _ch0_protocol_new == "SATA" || _ch0_protocol_new == "DISP_PORT"
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_10 => tx_disp_sel_ch0,
#else
  FF_TX_D_0_10 => tx_disp_sel_ch0(0),
#endif
#else
  FF_TX_D_0_10 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "FC" || _ch0_protocol_new == "GIGE" || _ch0_protocol_new == "SGMII" 
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_11 => tx_disp_correct_ch0,
#else
  FF_TX_D_0_11 => tx_disp_correct_ch0(0),
#endif
#elif _ch0_protocol_new == "PCIE" || _ch0_protocol_new == "PIPE"
#if _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_11 => pci_ei_en_ch0,
#else
  FF_TX_D_0_11 => pci_ei_en_ch0(0),
#endif
#else
  FF_TX_D_0_11 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_12 => fpsc_vlo,
#elif _ch0_protocol_new == "PIPE"
  FF_TX_D_0_12 => TxData_ch0(8),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_TX_D_0_12 => txdata_ch0(10),
#else
  FF_TX_D_0_12 => txdata_ch0(8),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_13 => fpsc_vlo,
#elif _ch0_protocol_new == "PIPE"
  FF_TX_D_0_13 => TxData_ch0(9),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_TX_D_0_13 => txdata_ch0(11),
#else
  FF_TX_D_0_13 => txdata_ch0(9),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_14 => fpsc_vlo,
#elif _ch0_protocol_new == "PIPE"
  FF_TX_D_0_14 => TxData_ch0(10),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_TX_D_0_14 => txdata_ch0(12),
#else
  FF_TX_D_0_14 => txdata_ch0(10),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_15 => fpsc_vlo,
#elif _ch0_protocol_new == "PIPE"
  FF_TX_D_0_15 => TxData_ch0(11),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_TX_D_0_15 => txdata_ch0(13),
#else
  FF_TX_D_0_15 => txdata_ch0(11),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_16 => fpsc_vlo,
#elif _ch0_protocol_new == "PIPE"
  FF_TX_D_0_16 => TxData_ch0(12),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_TX_D_0_16 => txdata_ch0(14),
#else
  FF_TX_D_0_16 => txdata_ch0(12),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_17 => fpsc_vlo,
#elif _ch0_protocol_new == "PIPE"
  FF_TX_D_0_17 => TxData_ch0(13),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_TX_D_0_17 => txdata_ch0(15),
#else
  FF_TX_D_0_17 => txdata_ch0(13),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_18 => fpsc_vlo,
#elif _ch0_protocol_new == "PIPE"
  FF_TX_D_0_18 => TxData_ch0(14),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_TX_D_0_18 => txdata_ch0(16),
#else
  FF_TX_D_0_18 => txdata_ch0(14),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_19 => fpsc_vlo,
#elif _ch0_protocol_new == "PIPE"
  FF_TX_D_0_19 => TxData_ch0(15),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_TX_D_0_19 => txdata_ch0(17),
#else
  FF_TX_D_0_19 => txdata_ch0(15),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_protocol_new == "8BSER" || _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_20 => fpsc_vlo,
#elif _ch0_protocol_new == "PIPE"
  FF_TX_D_0_20 => TxDataK_ch0(1),
#elif _ch0_protocol_new == "XAUI"
  FF_TX_D_0_20 => txc_ch0(1),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_TX_D_0_20 => txdata_ch0(18),
#else
  FF_TX_D_0_20 => tx_k_ch0(1),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_protocol_new == "8BSER" || _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_21 => fpsc_vlo,
#elif _ch0_protocol_new == "PIPE" || _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "G8B10B" || _ch0_protocol_new == "PCIE" || _ch0_protocol_new == "OBSAI" || _ch0_protocol_new == "FC" || _ch0_protocol_new == "SATA" || _ch0_protocol_new == "DISP_PORT"
  FF_TX_D_0_21 => tx_force_disp_ch0(1),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_TX_D_0_21 => txdata_ch0(19),
#else
  FF_TX_D_0_21 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_protocol_new == "8BSER" || _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_22 => fpsc_vlo,
#elif _ch0_protocol_new == "PIPE" || _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "G8B10B" || _ch0_protocol_new == "PCIE" || _ch0_protocol_new == "OBSAI" || _ch0_protocol_new == "FC" || _ch0_protocol_new == "SATA" || _ch0_protocol_new == "DISP_PORT"
  FF_TX_D_0_22 => tx_disp_sel_ch0(1),
#elif _ch0_protocol_new == "GIGE" || _ch0_protocol_new == "SGMII" 
  FF_TX_D_0_22 => xmit_ch0(1),
#else
  FF_TX_D_0_22 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_protocol_new == "8BSER" || _ch0_tx_data_width == "8" || _ch0_tx_data_width == "10"
  FF_TX_D_0_23 => fpsc_vlo,
#elif _ch0_protocol_new == "FC" || _ch0_protocol_new == "GIGE" || _ch0_protocol_new == "SGMII" 
  FF_TX_D_0_23 => tx_disp_correct_ch0(1),
#elif _ch0_protocol_new == "PCIE" || _ch0_protocol_new == "PIPE"
  FF_TX_D_0_23 => pci_ei_en_ch0(1),
#else
  FF_TX_D_0_23 => fpsc_vlo,
#endif
#endif
#if _ch0_mode == "TXONLY"
  FF_RX_D_0_0 => open,
  FF_RX_D_0_1 => open,
  FF_RX_D_0_2 => open,
  FF_RX_D_0_3 => open,
  FF_RX_D_0_4 => open,
  FF_RX_D_0_5 => open,
  FF_RX_D_0_6 => open,
  FF_RX_D_0_7 => open,
  FF_RX_D_0_8 => open,
  FF_RX_D_0_9 => open,
  FF_RX_D_0_10 => open,
  FF_RX_D_0_11 => open,
  FF_RX_D_0_12 => open,
  FF_RX_D_0_13 => open,
  FF_RX_D_0_14 => open,
  FF_RX_D_0_15 => open,
  FF_RX_D_0_16 => open,
  FF_RX_D_0_17 => open,
  FF_RX_D_0_18 => open,
  FF_RX_D_0_19 => open,
  FF_RX_D_0_20 => open,
  FF_RX_D_0_21 => open,
  FF_RX_D_0_22 => open,
  FF_RX_D_0_23 => open,
#else
#if _ch0_protocol_new == "DISABLED"
  FF_RX_D_0_0 => open,
  FF_RX_D_0_1 => open,
  FF_RX_D_0_2 => open,
  FF_RX_D_0_3 => open,
  FF_RX_D_0_4 => open,
  FF_RX_D_0_5 => open,
  FF_RX_D_0_6 => open,
  FF_RX_D_0_7 => open,
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_0 => RxData_ch0(0),
  FF_RX_D_0_1 => RxData_ch0(1),
  FF_RX_D_0_2 => RxData_ch0(2),
  FF_RX_D_0_3 => RxData_ch0(3),
  FF_RX_D_0_4 => RxData_ch0(4),
  FF_RX_D_0_5 => RxData_ch0(5),
  FF_RX_D_0_6 => RxData_ch0(6),
  FF_RX_D_0_7 => RxData_ch0(7),
#else
  FF_RX_D_0_0 => rxdata_ch0(0),
  FF_RX_D_0_1 => rxdata_ch0(1),
  FF_RX_D_0_2 => rxdata_ch0(2),
  FF_RX_D_0_3 => rxdata_ch0(3),
  FF_RX_D_0_4 => rxdata_ch0(4),
  FF_RX_D_0_5 => rxdata_ch0(5),
  FF_RX_D_0_6 => rxdata_ch0(6),
  FF_RX_D_0_7 => rxdata_ch0(7),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_protocol_new == "8BSER"
  FF_RX_D_0_8 => open,
#elif _ch0_protocol_new == "PIPE"
#if _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_8 => RxDataK_ch0,
#else
  FF_RX_D_0_8 => RxDataK_ch0(0),
#endif
#elif _ch0_protocol_new == "XAUI"
#if _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_8 => rxc_ch0,
#else
  FF_RX_D_0_8 => rxc_ch0(0),
#endif
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_RX_D_0_8 => rxdata_ch0(8),
#else
#if _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_8 => rx_k_ch0,
#else
  FF_RX_D_0_8 => rx_k_ch0(0),
#endif
#endif
#if _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_RX_D_0_9 => rxdata_ch0(9),
#elif _ch0_protocol_new == "SATA" || _ch0_protocol_new == "DISP_PORT" || _ch0_protocol_new == "G8B10B" || _ch0_protocol_new == "GIGE" || _ch0_protocol_new == "SGMII" || _ch0_protocol_new == "XAUI" || _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "SRIO" || _ch0_protocol_new == "OBSAI" || _ch0_protocol_new == "FC"
#if _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_9 => rx_disp_err_ch0,
#else
  FF_RX_D_0_9 => rx_disp_err_ch0(0),
#endif
#elif _ch0_protocol_new == "PCIE" 
  FF_RX_D_0_9 => rxstatus0_ch0(0),
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_9 => RxStatus0_ch0(0),
#else
  FF_RX_D_0_9 => open,
#endif
#if _ch0_protocol_new == "SATA" || _ch0_protocol_new == "DISP_PORT" || _ch0_protocol_new == "G8B10B" || _ch0_protocol_new == "GIGE" || _ch0_protocol_new == "SGMII" || _ch0_protocol_new == "XAUI" || _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "SRIO" || _ch0_protocol_new == "OBSAI" || _ch0_protocol_new ==  "FC"
#if _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_10 => rx_cv_err_ch0,
#else
  FF_RX_D_0_10 => rx_cv_err_ch0(0),
#endif
#elif _ch0_protocol_new == "PCIE" 
  FF_RX_D_0_10 => rxstatus0_ch0(1),
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_10 => RxStatus0_ch0(1),
#else
  FF_RX_D_0_10 => open,
#endif
#if _ch0_protocol_new == "PCIE" 
  FF_RX_D_0_11 => rxstatus0_ch0(2),
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_11 => RxStatus0_ch0(2),
#else
  FF_RX_D_0_11 => open,
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_12 => open,
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_12 => RxData_ch0(8),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_RX_D_0_12 => rxdata_ch0(10),
#else
  FF_RX_D_0_12 => rxdata_ch0(8),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_13 => open,
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_13 => RxData_ch0(9),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_RX_D_0_13 => rxdata_ch0(11),
#else
  FF_RX_D_0_13 => rxdata_ch0(9),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_14 => open,
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_14 => RxData_ch0(10),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_RX_D_0_14 => rxdata_ch0(12),
#else
  FF_RX_D_0_14 => rxdata_ch0(10),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_15 => open,
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_15 => RxData_ch0(11),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_RX_D_0_15 => rxdata_ch0(13),
#else
  FF_RX_D_0_15 => rxdata_ch0(11),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_16 => open,
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_16 => RxData_ch0(12),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_RX_D_0_16 => rxdata_ch0(14),
#else
  FF_RX_D_0_16 => rxdata_ch0(12),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_17 => open,
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_17 => RxData_ch0(13),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_RX_D_0_17 => rxdata_ch0(15),
#else
  FF_RX_D_0_17 => rxdata_ch0(13),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_18 => open,
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_18 => RxData_ch0(14),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_RX_D_0_18 => rxdata_ch0(16),
#else
  FF_RX_D_0_18 => rxdata_ch0(14),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_19 => open,
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_19 => RxData_ch0(15),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_RX_D_0_19 => rxdata_ch0(17),
#else
  FF_RX_D_0_19 => rxdata_ch0(15),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_protocol_new == "8BSER" || _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_20 => open,
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_20 => RxDataK_ch0(1),
#elif _ch0_protocol_new == "XAUI"
  FF_RX_D_0_20 => rxc_ch0(1),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_RX_D_0_20 => rxdata_ch0(18),
#else
  FF_RX_D_0_20 => rx_k_ch0(1),
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_protocol_new == "8BSER" || _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_21 => open,
#elif _ch0_protocol_new == "SATA" || _ch0_protocol_new == "DISP_PORT" || _ch0_protocol_new == "G8B10B" || _ch0_protocol_new == "GIGE" || _ch0_protocol_new == "SGMII" || _ch0_protocol_new == "XAUI" || _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "SRIO" || _ch0_protocol_new == "OBSAI" || _ch0_protocol_new == "FC"
  FF_RX_D_0_21 => rx_disp_err_ch0(1),
#elif _ch0_protocol_new == "PCIE" 
  FF_RX_D_0_21 => rxstatus1_ch0(0),
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_21 => RxStatus1_ch0(0),
#elif _ch0_protocol_new == "10BSER" || _ch0_protocol_new == "SDI"
  FF_RX_D_0_21 => rxdata_ch0(19),
#else
  FF_RX_D_0_21 => open,
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_protocol_new == "8BSER" || _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_22 => open,
#elif _ch0_protocol_new == "SATA" || _ch0_protocol_new == "DISP_PORT" || _ch0_protocol_new == "G8B10B" || _ch0_protocol_new == "GIGE" || _ch0_protocol_new == "SGMII" || _ch0_protocol_new == "XAUI" || _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "SRIO" || _ch0_protocol_new == "OBSAI" || _ch0_protocol_new == "FC"
  FF_RX_D_0_22 => rx_cv_err_ch0(1),
#elif _ch0_protocol_new == "PCIE" 
  FF_RX_D_0_22 => rxstatus1_ch0(1),
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_22 => RxStatus1_ch0(1),
#else
  FF_RX_D_0_22 => open,
#endif
#if _ch0_protocol_new == "DISABLED" || _ch0_protocol_new == "8BSER" || _ch0_rx_data_width == "8" || _ch0_rx_data_width == "10"
  FF_RX_D_0_23 => open,
#elif _ch0_protocol_new == "PCIE" 
  FF_RX_D_0_23 => rxstatus1_ch0(2),
#elif _ch0_protocol_new == "PIPE"
  FF_RX_D_0_23 => RxStatus1_ch0(2),
#else
  FF_RX_D_0_23 => open,
#endif
#endif

#if _ch0_mode == "RXTX" || _ch0_mode == "RXONLY"
  FFC_RRST_0 => rx_serdes_rst_ch0_c,
#else
  FFC_RRST_0 => fpsc_vlo,
#endif
  FFC_SIGNAL_DETECT_0 => fpsc_vlo,
#if _ch0_protocol_new == "DISABLED"
  FFC_SB_PFIFO_LP_0 => fpsc_vlo,
  FFC_PFIFO_CLR_0 => fpsc_vlo,
#elif _ch0_protocol_new != "PIPE" && _ch0_mode == "RXTX" 
#if _ch0_lbtype == "DISABLED"
  FFC_SB_PFIFO_LP_0 => sb_felb_ch0_c,
  FFC_PFIFO_CLR_0 => sb_felb_rst_ch0_c,
#else
  FFC_SB_PFIFO_LP_0 => fpsc_vlo,
  FFC_PFIFO_CLR_0 => fpsc_vlo,
#endif
#else
  FFC_SB_PFIFO_LP_0 => fpsc_vlo,
  FFC_PFIFO_CLR_0 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "DISABLED"
  FFC_SB_INV_RX_0 => fpsc_vlo,
#elif _ch0_protocol_new != "PIPE" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY") && _ch0_ird == "ENABLED"
  FFC_SB_INV_RX_0 => rx_invert_ch0_c,
#else
  FFC_SB_INV_RX_0 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "PCIE" && _ch0_mode != "DISABLED"
  FFC_PCIE_CT_0 => pcie_ct_ch0_c,
  FFC_PCI_DET_EN_0 => pcie_det_en_ch0_c,
#else
  FFC_PCIE_CT_0 => fpsc_vlo,
  FFC_PCI_DET_EN_0 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "DISABLED"
  FFC_FB_LOOPBACK_0 => fpsc_vlo,
#elif _ch0_protocol_new != "PIPE" && _ch0_lbtype == "Loopback parallel data after PCS block" && _ch0_mode == "RXTX"
  FFC_FB_LOOPBACK_0 => fb_felb_ch0_c,
#else
  FFC_FB_LOOPBACK_0 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "DISABLED"
  FFC_ENABLE_CGALIGN_0 => fpsc_vlo,
#elif _ch0_protocol_new != "PIPE" && _ch0_ilsm == "DISABLED" && _ch0_rxwa == "ENABLED"
  FFC_ENABLE_CGALIGN_0 => word_align_en_ch0_c,
#else
  FFC_ENABLE_CGALIGN_0 => fpsc_vlo,
#endif
#if (_ch0_protocol_new == "SATA" || _ch0_protocol_new == "PCIE") && _ch0_mode != "DISABLED"
  FFC_EI_EN_0 => tx_idle_ch0_c,
#elif _ch0_teidle == "ENABLED"
#if _ch0_protocol_new == "SRIO" || _ch0_protocol_new == "G8B10B" || _ch0_protocol_new == "CPRI" || _ch0_protocol_new == "OBSAI" && (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY")
  FFC_EI_EN_0 => tx_idle_ch0_c,
#else
  FFC_EI_EN_0 => fpsc_vlo,
#endif
#else
  FFC_EI_EN_0 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "DISABLED"
  FFC_LANE_TX_RST_0 => fpsc_vlo,
  FFC_TXPWDNB_0 => fpsc_vlo,
#elif _ch0_protocol_new != "PIPE" && (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY")
#if _rst_gen == "DISABLED"
  FFC_LANE_TX_RST_0 => tx_pcs_rst_ch0_c,
#else
  FFC_LANE_TX_RST_0 => tx_pcs_rst_ch_c,
#endif
  FFC_TXPWDNB_0 => tx_pwrup_ch0_c,
#else
  FFC_LANE_TX_RST_0 => fpsc_vlo,
  FFC_TXPWDNB_0 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "DISABLED"
  FFC_LANE_RX_RST_0 => fpsc_vlo,
  FFC_RXPWDNB_0 => fpsc_vlo,
  FFS_RLOS_LO_0 => open,
  FFS_RLOS_HI_0 => open,
#elif _ch0_protocol_new != "PIPE" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
  FFC_LANE_RX_RST_0 => rx_pcs_rst_ch0_c,
  FFC_RXPWDNB_0 => rx_pwrup_ch0_c,
#if _los_threshold_mode0 == "LOS_E"
  FFS_RLOS_LO_0 => rx_los_low_ch0_sig,
  FFS_RLOS_HI_0 => open,
#elif _los_threshold_mode0 == "LOS_EA"
  FFS_RLOS_LO_0 => open,
  FFS_RLOS_HI_0 => rx_los_high_ch0_s,
#endif
#elif _ch0_protocol_new == "PIPE" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
  FFC_LANE_RX_RST_0 => fpsc_vlo,
  FFC_RXPWDNB_0 => fpsc_vlo,
  FFS_RLOS_LO_0 => open,
#if _los_threshold_mode0 == "LOS_EA"
  FFS_RLOS_HI_0 => RxElecIdle_ch0,
#else
  FFS_RLOS_HI_0 => open,
#endif
#else
  FFC_LANE_RX_RST_0 => fpsc_vlo,
  FFC_RXPWDNB_0 => fpsc_vlo,
  FFS_RLOS_LO_0 => open,
  FFS_RLOS_HI_0 => open,
#endif
#if _ch0_mode != "DISABLED" && (_ch0_protocol_new == "PIPE" || _ch0_protocol_new == "PCIE")
  FFS_PCIE_CON_0 => pcie_con_ch0_s,
  FFS_PCIE_DONE_0 => pcie_done_ch0_s,
#else
  FFS_PCIE_CON_0 => open,
  FFS_PCIE_DONE_0 => open,
#endif
#if _ch0_protocol_new == "DISABLED"
  FFS_LS_SYNC_STATUS_0 => open,
#elif _ch0_protocol_new != "PIPE" && _ch0_ilsm == "ENABLED" && _ch0_rxwa == "ENABLED" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
  FFS_LS_SYNC_STATUS_0 => lsm_status_ch0_s,
#else
  FFS_LS_SYNC_STATUS_0 => open,
#endif
#if _ch0_protocol_new == "DISABLED"
  FFS_CC_OVERRUN_0 => open,
  FFS_CC_UNDERRUN_0 => open,
  FFS_SKP_ADDED_0 => open,
  FFS_SKP_DELETED_0 => open,
#elif _ch0_protocol_new != "PIPE" && _ch0_ctc == "ENABLED" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
  FFS_CC_OVERRUN_0 => ctc_orun_ch0_s,
  FFS_CC_UNDERRUN_0 => ctc_urun_ch0_s,
  FFS_SKP_ADDED_0 => ctc_ins_ch0_s,
  FFS_SKP_DELETED_0 => ctc_del_ch0_s,
#else
  FFS_CC_OVERRUN_0 => open,
  FFS_CC_UNDERRUN_0 => open,
  FFS_SKP_ADDED_0 => open,
  FFS_SKP_DELETED_0 => open,
#endif
#if _ch0_protocol_new == "DISABLED"
  FFS_RLOL_0 => open,
#elif _ch0_protocol_new != "PIPE" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
  FFS_RLOL_0 => rx_cdr_lol_ch0_sig,
#else
  FFS_RLOL_0 => open,
#endif
  FFS_RXFBFIFO_ERROR_0 => open,
  FFS_TXFBFIFO_ERROR_0 => open,
#if _ch0_protocol_new == "DISABLED"
  LDR_CORE2TX_0 => fpsc_vlo,
  FFC_LDR_CORE2TX_EN_0 => fpsc_vlo,
#elif _ch0_protocol_new != "PIPE" && _ch0_ldr == "ENABLED" && (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY")
  LDR_CORE2TX_0 => txd_ldr_ch0,
  FFC_LDR_CORE2TX_EN_0 => txd_ldr_en_ch0_c,
#else
  LDR_CORE2TX_0 => fpsc_vlo,
  FFC_LDR_CORE2TX_EN_0 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "DISABLED"
  LDR_RX2CORE_0 => open,
#elif _ch0_protocol_new != "PIPE" && _ch0_ldr == "ENABLED" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
  LDR_RX2CORE_0 => rxd_ldr_ch0,
#else
  LDR_RX2CORE_0 => open,
#endif
#if _ch0_protocol_new == "DISABLED"
  FFS_CDR_TRAIN_DONE_0 => open,
#elif _ch0_protocol_new == "DISP_PORT" && _ch0_mode != "DISABLED"
  FFS_CDR_TRAIN_DONE_0 => rx_cdr_trained_ch0_s,
#else
  FFS_CDR_TRAIN_DONE_0 => open,
#endif
#if _ch0_mode != "DISABLED" && _ch0_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X" && _refclk_mult == "20X" && (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY")
  FFC_DIV11_MODE_TX_0 => tx_div11_mode_ch0_c,
#else
  FFC_DIV11_MODE_TX_0 => fpsc_vlo,
#endif
#if (_ch0_mode == "RXTX" || _ch0_mode == "TXONLY") && ((_ch0_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X") || (_ch0_protocol_new == "G8B10B") || (_ch0_protocol_new == "CPRI" && (_datarange == "MED" || _datarange == "MEDHIGH")) || (_ch0_protocol_new == "OBSAI" && (_datarange == "MED" || _datarange == "HIGH")) || (_ch0_protocol_new == "SRIO" && _datarange == "MEDHIGH") || (_ch0_protocol_new == "SATA" && _datarange == "HIGH") || (_ch0_protocol_new == "FC" && _datarange == "MEDHIGH") || (_ch0_protocol_new == "10BSER") || (_ch0_protocol_new == "8BSER"))
  FFC_RATE_MODE_TX_0 => tx_div2_mode_ch0_c,
#else
  FFC_RATE_MODE_TX_0 => fpsc_vlo,
#endif
#if _ch0_protocol_new == "SDI" && _ch0_rx_datarange == "HIGH" && _refclk_mult == "20X" && (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY")
  FFC_DIV11_MODE_RX_0 => rx_div11_mode_ch0_c,
#else
  FFC_DIV11_MODE_RX_0 => fpsc_vlo,
#endif
#if (_ch0_mode == "RXTX" || _ch0_mode == "RXONLY") && ((_ch0_protocol_new == "SDI" && _ch0_rx_datarange == "HIGH" && _refclk_mult == "20X") || (_ch0_protocol_new == "G8B10B") || (_ch0_protocol_new == "CPRI" && (_ch0_rx_datarange == "MED" || _ch0_rx_datarange == "MEDHIGH")) || (_ch0_protocol_new == "OBSAI" && (_ch0_rx_datarange == "MED" || _ch0_rx_datarange == "HIGH")) || (_ch0_protocol_new == "SRIO" && _ch0_rx_datarange == "MEDHIGH") || (_ch0_protocol_new == "SATA" && _ch0_rx_datarange == "HIGH") || (_ch0_protocol_new == "FC" && _ch0_rx_datarange == "MEDHIGH") || (_ch0_protocol_new == "10BSER") || (_ch0_protocol_new == "8BSER"))
  FFC_RATE_MODE_RX_0 => rx_div2_mode_ch0_c,
#else
  FFC_RATE_MODE_RX_0 => fpsc_vlo,
#endif

----- CH1 -----
#if _ch1_mode == "TXONLY" || _ch1_mode == "RXTX"
  HDOUTP1 => hdoutp_ch1,
  HDOUTN1 => hdoutn_ch1,
#else
  HDOUTP1 => open,
  HDOUTN1 => open,
#endif
#if _ch1_mode == "RXONLY" || _ch1_mode == "RXTX"
  HDINP1 => hdinp_ch1,
  HDINN1 => hdinn_ch1,
#else
  HDINP1 => fpsc_vlo,
  HDINN1 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "PIPE" && _ch1_mode != "DISABLED"
  PCIE_TXDETRX_PR2TLB_1 => TxDetRx_Loopback_ch1,
#else
  PCIE_TXDETRX_PR2TLB_1 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "PIPE" && _ch1_mode != "DISABLED"
  PCIE_TXCOMPLIANCE_1 => TxCompliance_ch1,
  PCIE_RXPOLARITY_1 => RxPolarity_ch1,
  PCIE_POWERDOWN_1_0 => PowerDown_ch1(0),
  PCIE_POWERDOWN_1_1 => PowerDown_ch1(1),
  PCIE_RXVALID_1 => RxValid_ch1,
  PCIE_PHYSTATUS_1 => PhyStatus_ch1,
#else
  PCIE_TXCOMPLIANCE_1 => fpsc_vlo,
  PCIE_RXPOLARITY_1 => fpsc_vlo,
  PCIE_POWERDOWN_1_0 => fpsc_vlo,
  PCIE_POWERDOWN_1_1 => fpsc_vlo,
  PCIE_RXVALID_1 => open,
  PCIE_PHYSTATUS_1 => open,
#endif
#if _ch1_mode == "DISABLED"
  SCISELCH1 => fpsc_vlo,
  SCIENCH1 => fpsc_vlo,
#elif _sci_ports == "DISABLED"
  SCISELCH1 => fpsc_vlo,
  SCIENCH1 => fpsc_vlo,
#else
  SCISELCH1 => sci_sel_ch1,
  SCIENCH1 => fpsc_vhi,
#endif
#if _ch1_mode != "DISABLED" && _ch1_rx_fifo == "ENABLED"
  FF_RXI_CLK_1 => rxiclk_ch1,
#else
  FF_RXI_CLK_1 => fpsc_vlo,
#endif
#if _ch1_mode == "RXTX" || _ch1_mode == "TXONLY"
  FF_TXI_CLK_1 => txiclk_ch1,
#else
  FF_TXI_CLK_1 => fpsc_vlo,
#endif
#if _ch1_mode != "DISABLED"
#if (_ch1_ctc == "ENABLED" && ((_ch1_mode == "RXTX" || _ch1_mode == "TXONLY") || ((_ch1_ctc == "ENABLED" && _ch1_rx_fifo == "ENABLED") && (_ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"))))
  FF_EBRD_CLK_1 => tx_full_clk_ch1_sig,
#else
  FF_EBRD_CLK_1 => fpsc_vlo,
#endif
#else
  FF_EBRD_CLK_1 => fpsc_vlo,
#endif
#if _ch1_mode == "RXTX" || _ch1_mode == "RXONLY"
  FF_RX_F_CLK_1 => rx_full_clk_ch1,
#else
  FF_RX_F_CLK_1 => open,
#endif
#if _ch1_mode == "RXTX" || _ch1_mode == "RXONLY"
  FF_RX_H_CLK_1 => rx_half_clk_ch1,
#else
  FF_RX_H_CLK_1 => open,
#endif
#if (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY") || ((_ch1_ctc == "ENABLED" && _ch1_rx_fifo == "ENABLED") && (_ch1_rx_data_width == "8" || _ch1_rx_data_width == "10")) 
  FF_TX_F_CLK_1 => tx_full_clk_ch1_sig,
#else
  FF_TX_F_CLK_1 => open,
#endif
#if (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY") || ((_ch1_ctc == "ENABLED" && _ch1_rx_fifo == "ENABLED") && (_ch1_rx_data_width == "16" || _ch1_rx_data_width == "20"))
  FF_TX_H_CLK_1 => tx_half_clk_ch1,
#else
  FF_TX_H_CLK_1 => open,
#endif
#if _ch1_mode != "DISABLED" && _ch1_pll_rxsrc == "REFCLK_CORE"
  FFC_CK_CORE_RX_1 => fpga_rxrefclk_ch1,
#else
  FFC_CK_CORE_RX_1 => fpsc_vlo,
#endif
#if _ch1_mode == "RXONLY"
  FF_TX_D_1_0 => fpsc_vlo,
  FF_TX_D_1_1 => fpsc_vlo,
  FF_TX_D_1_2 => fpsc_vlo,
  FF_TX_D_1_3 => fpsc_vlo,
  FF_TX_D_1_4 => fpsc_vlo,
  FF_TX_D_1_5 => fpsc_vlo,
  FF_TX_D_1_6 => fpsc_vlo,
  FF_TX_D_1_7 => fpsc_vlo,
  FF_TX_D_1_8 => fpsc_vlo,
  FF_TX_D_1_9 => fpsc_vlo,
  FF_TX_D_1_10 => fpsc_vlo,
  FF_TX_D_1_11 => fpsc_vlo,
  FF_TX_D_1_12 => fpsc_vlo,
  FF_TX_D_1_13 => fpsc_vlo,
  FF_TX_D_1_14 => fpsc_vlo,
  FF_TX_D_1_15 => fpsc_vlo,
  FF_TX_D_1_16 => fpsc_vlo,
  FF_TX_D_1_17 => fpsc_vlo,
  FF_TX_D_1_18 => fpsc_vlo,
  FF_TX_D_1_19 => fpsc_vlo,
  FF_TX_D_1_20 => fpsc_vlo,
  FF_TX_D_1_21 => fpsc_vlo,
  FF_TX_D_1_22 => fpsc_vlo,
  FF_TX_D_1_23 => fpsc_vlo,
#else
#if _ch1_protocol_new == "DISABLED"
  FF_TX_D_1_0 => fpsc_vlo,
  FF_TX_D_1_1 => fpsc_vlo,
  FF_TX_D_1_2 => fpsc_vlo,
  FF_TX_D_1_3 => fpsc_vlo,
  FF_TX_D_1_4 => fpsc_vlo,
  FF_TX_D_1_5 => fpsc_vlo,
  FF_TX_D_1_6 => fpsc_vlo,
  FF_TX_D_1_7 => fpsc_vlo,
#elif _ch1_protocol_new == "PIPE"
  FF_TX_D_1_0 => TxData_ch1(0),
  FF_TX_D_1_1 => TxData_ch1(1),
  FF_TX_D_1_2 => TxData_ch1(2),
  FF_TX_D_1_3 => TxData_ch1(3),
  FF_TX_D_1_4 => TxData_ch1(4),
  FF_TX_D_1_5 => TxData_ch1(5),
  FF_TX_D_1_6 => TxData_ch1(6),
  FF_TX_D_1_7 => TxData_ch1(7),
#else
  FF_TX_D_1_0 => txdata_ch1(0),
  FF_TX_D_1_1 => txdata_ch1(1),
  FF_TX_D_1_2 => txdata_ch1(2),
  FF_TX_D_1_3 => txdata_ch1(3),
  FF_TX_D_1_4 => txdata_ch1(4),
  FF_TX_D_1_5 => txdata_ch1(5),
  FF_TX_D_1_6 => txdata_ch1(6),
  FF_TX_D_1_7 => txdata_ch1(7),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_protocol_new == "8BSER"
  FF_TX_D_1_8 => fpsc_vlo,
#elif _ch1_protocol_new == "PIPE"
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_8 => TxDataK_ch1,
#else
  FF_TX_D_1_8 => TxDataK_ch1(0),
#endif
#elif _ch1_protocol_new == "XAUI"
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_8 => txc_ch1,
#else
  FF_TX_D_1_8 => txc_ch1(0),
#endif
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_TX_D_1_8 => txdata_ch1(8),
#else
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_8 => tx_k_ch1,
#else
  FF_TX_D_1_8 => tx_k_ch1(0),
#endif
#endif
#if _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_TX_D_1_9 => txdata_ch1(9),
#elif _ch1_protocol_new == "PIPE" || _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "G8B10B" || _ch1_protocol_new == "PCIE" || _ch1_protocol_new == "OBSAI" || _ch1_protocol_new == "FC" || _ch1_protocol_new == "SATA" || _ch1_protocol_new == "DISP_PORT"
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_9 => tx_force_disp_ch1,
#else
  FF_TX_D_1_9 => tx_force_disp_ch1(0),
#endif
#else
  FF_TX_D_1_9 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "GIGE" || _ch1_protocol_new == "SGMII" 
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_10 => xmit_ch1,
#else
  FF_TX_D_1_10 => xmit_ch1(0),
#endif
#elif _ch1_protocol_new == "PIPE" || _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "G8B10B" || _ch1_protocol_new == "PCIE" || _ch1_protocol_new == "OBSAI" || _ch1_protocol_new == "FC" || _ch1_protocol_new == "SATA" || _ch1_protocol_new == "DISP_PORT"
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_10 => tx_disp_sel_ch1,
#else
  FF_TX_D_1_10 => tx_disp_sel_ch1(0),
#endif
#else
  FF_TX_D_1_10 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "FC" || _ch1_protocol_new == "GIGE" || _ch1_protocol_new == "SGMII" 
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_11 => tx_disp_correct_ch1,
#else
  FF_TX_D_1_11 => tx_disp_correct_ch1(0),
#endif
#elif _ch1_protocol_new == "PCIE" || _ch1_protocol_new == "PIPE"
#if _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_11 => pci_ei_en_ch1,
#else
  FF_TX_D_1_11 => pci_ei_en_ch1(0),
#endif
#else
  FF_TX_D_1_11 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_12 => fpsc_vlo,
#elif _ch1_protocol_new == "PIPE"
  FF_TX_D_1_12 => TxData_ch1(8),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_TX_D_1_12 => txdata_ch1(10),
#else
  FF_TX_D_1_12 => txdata_ch1(8),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_13 => fpsc_vlo,
#elif _ch1_protocol_new == "PIPE"
  FF_TX_D_1_13 => TxData_ch1(9),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_TX_D_1_13 => txdata_ch1(11),
#else
  FF_TX_D_1_13 => txdata_ch1(9),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_14 => fpsc_vlo,
#elif _ch1_protocol_new == "PIPE"
  FF_TX_D_1_14 => TxData_ch1(10),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_TX_D_1_14 => txdata_ch1(12),
#else
  FF_TX_D_1_14 => txdata_ch1(10),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_15 => fpsc_vlo,
#elif _ch1_protocol_new == "PIPE"
  FF_TX_D_1_15 => TxData_ch1(11),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_TX_D_1_15 => txdata_ch1(13),
#else
  FF_TX_D_1_15 => txdata_ch1(11),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_16 => fpsc_vlo,
#elif _ch1_protocol_new == "PIPE"
  FF_TX_D_1_16 => TxData_ch1(12),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_TX_D_1_16 => txdata_ch1(14),
#else
  FF_TX_D_1_16 => txdata_ch1(12),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_17 => fpsc_vlo,
#elif _ch1_protocol_new == "PIPE"
  FF_TX_D_1_17 => TxData_ch1(13),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_TX_D_1_17 => txdata_ch1(15),
#else
  FF_TX_D_1_17 => txdata_ch1(13),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_18 => fpsc_vlo,
#elif _ch1_protocol_new == "PIPE"
  FF_TX_D_1_18 => TxData_ch1(14),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_TX_D_1_18 => txdata_ch1(16),
#else
  FF_TX_D_1_18 => txdata_ch1(14),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_19 => fpsc_vlo,
#elif _ch1_protocol_new == "PIPE"
  FF_TX_D_1_19 => TxData_ch1(15),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_TX_D_1_19 => txdata_ch1(17),
#else
  FF_TX_D_1_19 => txdata_ch1(15),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_protocol_new == "8BSER" || _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_20 => fpsc_vlo,
#elif _ch1_protocol_new == "PIPE"
  FF_TX_D_1_20 => TxDataK_ch1(1),
#elif _ch1_protocol_new == "XAUI"
  FF_TX_D_1_20 => txc_ch1(1),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_TX_D_1_20 => txdata_ch1(18),
#else
  FF_TX_D_1_20 => tx_k_ch1(1),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_protocol_new == "8BSER" || _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_21 => fpsc_vlo,
#elif _ch1_protocol_new == "PIPE" || _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "G8B10B" || _ch1_protocol_new == "PCIE" || _ch1_protocol_new == "OBSAI" || _ch1_protocol_new == "FC" || _ch1_protocol_new == "SATA" || _ch1_protocol_new == "DISP_PORT"
  FF_TX_D_1_21 => tx_force_disp_ch1(1),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_TX_D_1_21 => txdata_ch1(19),
#else
  FF_TX_D_1_21 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_protocol_new == "8BSER" || _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_22 => fpsc_vlo,
#elif _ch1_protocol_new == "PIPE" || _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "G8B10B" || _ch1_protocol_new == "PCIE" || _ch1_protocol_new == "OBSAI" || _ch1_protocol_new == "FC" || _ch1_protocol_new == "SATA" || _ch1_protocol_new == "DISP_PORT"
  FF_TX_D_1_22 => tx_disp_sel_ch1(1),
#elif _ch1_protocol_new == "GIGE" || _ch1_protocol_new == "SGMII"
  FF_TX_D_1_22 => xmit_ch1(1),
#else
  FF_TX_D_1_22 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_protocol_new == "8BSER" || _ch1_tx_data_width == "8" || _ch1_tx_data_width == "10"
  FF_TX_D_1_23 => fpsc_vlo,
#elif _ch1_protocol_new == "FC" || _ch1_protocol_new == "GIGE" || _ch1_protocol_new == "SGMII" 
  FF_TX_D_1_23 => tx_disp_correct_ch1(1),
#elif _ch1_protocol_new == "PCIE" || _ch1_protocol_new == "PIPE"
  FF_TX_D_1_23 => pci_ei_en_ch1(1),
#else
  FF_TX_D_1_23 => fpsc_vlo,
#endif
#endif
#if _ch1_mode == "TXONLY"
  FF_RX_D_1_0 => open,
  FF_RX_D_1_1 => open,
  FF_RX_D_1_2 => open,
  FF_RX_D_1_3 => open,
  FF_RX_D_1_4 => open,
  FF_RX_D_1_5 => open,
  FF_RX_D_1_6 => open,
  FF_RX_D_1_7 => open,
  FF_RX_D_1_8 => open,
  FF_RX_D_1_9 => open,
  FF_RX_D_1_10 => open,
  FF_RX_D_1_11 => open,
  FF_RX_D_1_12 => open,
  FF_RX_D_1_13 => open,
  FF_RX_D_1_14 => open,
  FF_RX_D_1_15 => open,
  FF_RX_D_1_16 => open,
  FF_RX_D_1_17 => open,
  FF_RX_D_1_18 => open,
  FF_RX_D_1_19 => open,
  FF_RX_D_1_20 => open,
  FF_RX_D_1_21 => open,
  FF_RX_D_1_22 => open,
  FF_RX_D_1_23 => open,
#else
#if _ch1_protocol_new == "DISABLED"
  FF_RX_D_1_0 => open,
  FF_RX_D_1_1 => open,
  FF_RX_D_1_2 => open,
  FF_RX_D_1_3 => open,
  FF_RX_D_1_4 => open,
  FF_RX_D_1_5 => open,
  FF_RX_D_1_6 => open,
  FF_RX_D_1_7 => open,
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_0 => RxData_ch1(0),
  FF_RX_D_1_1 => RxData_ch1(1),
  FF_RX_D_1_2 => RxData_ch1(2),
  FF_RX_D_1_3 => RxData_ch1(3),
  FF_RX_D_1_4 => RxData_ch1(4),
  FF_RX_D_1_5 => RxData_ch1(5),
  FF_RX_D_1_6 => RxData_ch1(6),
  FF_RX_D_1_7 => RxData_ch1(7),
#else
  FF_RX_D_1_0 => rxdata_ch1(0),
  FF_RX_D_1_1 => rxdata_ch1(1),
  FF_RX_D_1_2 => rxdata_ch1(2),
  FF_RX_D_1_3 => rxdata_ch1(3),
  FF_RX_D_1_4 => rxdata_ch1(4),
  FF_RX_D_1_5 => rxdata_ch1(5),
  FF_RX_D_1_6 => rxdata_ch1(6),
  FF_RX_D_1_7 => rxdata_ch1(7),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_protocol_new == "8BSER"
  FF_RX_D_1_8 => open,
#elif _ch1_protocol_new == "PIPE"
#if _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_8 => RxDataK_ch1,
#else
  FF_RX_D_1_8 => RxDataK_ch1(0),
#endif
#elif _ch1_protocol_new == "XAUI"
#if _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_8 => rxc_ch1,
#else
  FF_RX_D_1_8 => rxc_ch1(0),
#endif
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_RX_D_1_8 => rxdata_ch1(8),
#else
#if _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_8 => rx_k_ch1,
#else
  FF_RX_D_1_8 => rx_k_ch1(0),
#endif
#endif
#if _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_RX_D_1_9 => rxdata_ch1(9),
#elif _ch1_protocol_new == "SATA" || _ch1_protocol_new == "DISP_PORT" || _ch1_protocol_new == "G8B10B" || _ch1_protocol_new == "GIGE" || _ch1_protocol_new == "SGMII" || _ch1_protocol_new == "XAUI" || _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "SRIO" || _ch1_protocol_new == "OBSAI" || _ch1_protocol_new == "FC"
#if _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_9 => rx_disp_err_ch1,
#else
  FF_RX_D_1_9 => rx_disp_err_ch1(0),
#endif
#elif _ch1_protocol_new == "PCIE" 
  FF_RX_D_1_9 => rxstatus0_ch1(0),
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_9 => RxStatus0_ch1(0),
#else
  FF_RX_D_1_9 => open,
#endif
#if _ch1_protocol_new == "SATA" || _ch1_protocol_new == "DISP_PORT" || _ch1_protocol_new == "G8B10B" || _ch1_protocol_new == "GIGE" || _ch1_protocol_new == "SGMII" || _ch1_protocol_new == "XAUI" || _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "SRIO" || _ch1_protocol_new == "OBSAI" || _ch1_protocol_new ==  "FC"
#if _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_10 => rx_cv_err_ch1,
#else
  FF_RX_D_1_10 => rx_cv_err_ch1(0),
#endif
#elif _ch1_protocol_new == "PCIE" 
  FF_RX_D_1_10 => rxstatus0_ch1(1),
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_10 => RxStatus0_ch1(1),
#else
  FF_RX_D_1_10 => open,
#endif
#if _ch1_protocol_new == "PCIE" 
  FF_RX_D_1_11 => rxstatus0_ch1(2),
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_11 => RxStatus0_ch1(2),
#else
  FF_RX_D_1_11 => open,
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_12 => open,
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_12 => RxData_ch1(8),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_RX_D_1_12 => rxdata_ch1(10),
#else
  FF_RX_D_1_12 => rxdata_ch1(8),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_13 => open,
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_13 => RxData_ch1(9),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_RX_D_1_13 => rxdata_ch1(11),
#else
  FF_RX_D_1_13 => rxdata_ch1(9),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_14 => open,
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_14 => RxData_ch1(10),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_RX_D_1_14 => rxdata_ch1(12),
#else
  FF_RX_D_1_14 => rxdata_ch1(10),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_15 => open,
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_15 => RxData_ch1(11),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_RX_D_1_15 => rxdata_ch1(13),
#else
  FF_RX_D_1_15 => rxdata_ch1(11),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_16 => open,
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_16 => RxData_ch1(12),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_RX_D_1_16 => rxdata_ch1(14),
#else
  FF_RX_D_1_16 => rxdata_ch1(12),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_17 => open,
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_17 => RxData_ch1(13),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_RX_D_1_17 => rxdata_ch1(15),
#else
  FF_RX_D_1_17 => rxdata_ch1(13),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_18 => open,
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_18 => RxData_ch1(14),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_RX_D_1_18 => rxdata_ch1(16),
#else
  FF_RX_D_1_18 => rxdata_ch1(14),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_19 => open,
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_19 => RxData_ch1(15),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_RX_D_1_19 => rxdata_ch1(17),
#else
  FF_RX_D_1_19 => rxdata_ch1(15),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_protocol_new == "8BSER" || _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_20 => open,
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_20 => RxDataK_ch1(1),
#elif _ch1_protocol_new == "XAUI"
  FF_RX_D_1_20 => rxc_ch1(1),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_RX_D_1_20 => rxdata_ch1(18),
#else
  FF_RX_D_1_20 => rx_k_ch1(1),
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_protocol_new == "8BSER" || _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_21 => open,
#elif _ch1_protocol_new == "SATA" || _ch1_protocol_new == "DISP_PORT" || _ch1_protocol_new == "G8B10B" || _ch1_protocol_new == "GIGE" || _ch1_protocol_new == "SGMII" || _ch1_protocol_new == "XAUI" || _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "SRIO" || _ch1_protocol_new == "OBSAI" || _ch1_protocol_new == "FC"
  FF_RX_D_1_21 => rx_disp_err_ch1(1),
#elif _ch1_protocol_new == "PCIE" 
  FF_RX_D_1_21 => rxstatus1_ch1(0),
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_21 => RxStatus1_ch1(0),
#elif _ch1_protocol_new == "10BSER" || _ch1_protocol_new == "SDI"
  FF_RX_D_1_21 => rxdata_ch1(19),
#else
  FF_RX_D_1_21 => open,
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_protocol_new == "8BSER" || _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_22 => open,
#elif _ch1_protocol_new == "SATA" || _ch1_protocol_new == "DISP_PORT" || _ch1_protocol_new == "G8B10B" || _ch1_protocol_new == "GIGE" || _ch1_protocol_new == "SGMII" || _ch1_protocol_new == "XAUI" || _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "SRIO" || _ch1_protocol_new == "OBSAI" || _ch1_protocol_new == "FC"
  FF_RX_D_1_22 => rx_cv_err_ch1(1),
#elif _ch1_protocol_new == "PCIE" 
  FF_RX_D_1_22 => rxstatus1_ch1(1),
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_22 => RxStatus1_ch1(1),
#else
  FF_RX_D_1_22 => open,
#endif
#if _ch1_protocol_new == "DISABLED" || _ch1_protocol_new == "8BSER" || _ch1_rx_data_width == "8" || _ch1_rx_data_width == "10"
  FF_RX_D_1_23 => open,
#elif _ch1_protocol_new == "PCIE" 
  FF_RX_D_1_23 => rxstatus1_ch1(2),
#elif _ch1_protocol_new == "PIPE"
  FF_RX_D_1_23 => RxStatus1_ch1(2),
#else
  FF_RX_D_1_23 => open,
#endif
#endif

#if _ch1_mode == "RXTX" || _ch1_mode == "RXONLY"
  FFC_RRST_1 => rx_serdes_rst_ch1_c,
#else
  FFC_RRST_1 => fpsc_vlo,
#endif
  FFC_SIGNAL_DETECT_1 => fpsc_vlo,
#if _ch1_protocol_new == "DISABLED"
  FFC_SB_PFIFO_LP_1 => fpsc_vlo,
  FFC_PFIFO_CLR_1 => fpsc_vlo,
#elif _ch1_protocol_new != "PIPE" && _ch1_mode == "RXTX" 
#if _ch1_lbtype == "DISABLED"
  FFC_SB_PFIFO_LP_1 => sb_felb_ch1_c,
  FFC_PFIFO_CLR_1 => sb_felb_rst_ch1_c,
#else
  FFC_SB_PFIFO_LP_1 => fpsc_vlo,
  FFC_PFIFO_CLR_1 => fpsc_vlo,
#endif
#else
  FFC_SB_PFIFO_LP_1 => fpsc_vlo,
  FFC_PFIFO_CLR_1 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "DISABLED"
  FFC_SB_INV_RX_1 => fpsc_vlo,
#elif _ch1_protocol_new != "PIPE" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY") && _ch1_ird == "ENABLED"
  FFC_SB_INV_RX_1 => rx_invert_ch1_c,
#else
  FFC_SB_INV_RX_1 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "PCIE" && _ch1_mode != "DISABLED"
  FFC_PCIE_CT_1 => pcie_ct_ch1_c,
  FFC_PCI_DET_EN_1 => pcie_det_en_ch1_c,
#else
  FFC_PCIE_CT_1 => fpsc_vlo,
  FFC_PCI_DET_EN_1 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "DISABLED"
  FFC_FB_LOOPBACK_1 => fpsc_vlo,
#elif _ch1_protocol_new != "PIPE" && _ch1_lbtype == "Loopback parallel data after PCS block" && _ch1_mode == "RXTX"
  FFC_FB_LOOPBACK_1 => fb_felb_ch1_c,
#else
  FFC_FB_LOOPBACK_1 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "DISABLED"
  FFC_ENABLE_CGALIGN_1 => fpsc_vlo,
#elif _ch1_protocol_new != "PIPE" && _ch1_ilsm == "DISABLED" && _ch1_rxwa == "ENABLED"
  FFC_ENABLE_CGALIGN_1 => word_align_en_ch1_c,
#else
  FFC_ENABLE_CGALIGN_1 => fpsc_vlo,
#endif
#if (_ch1_protocol_new == "SATA" || _ch1_protocol_new == "PCIE") && _ch1_mode != "DISABLED"
  FFC_EI_EN_1 => tx_idle_ch1_c,
#elif _ch1_teidle == "ENABLED"
#if _ch1_protocol_new == "SRIO" || _ch1_protocol_new == "G8B10B" || _ch1_protocol_new == "CPRI" || _ch1_protocol_new == "OBSAI" && (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY")
  FFC_EI_EN_1 => tx_idle_ch1_c,
#else
  FFC_EI_EN_1 => fpsc_vlo,
#endif
#else
  FFC_EI_EN_1 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "DISABLED"
  FFC_LANE_TX_RST_1 => fpsc_vlo,
  FFC_TXPWDNB_1 => fpsc_vlo,
#elif _ch1_protocol_new != "PIPE" && (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY")
#if _rst_gen == "DISABLED"
  FFC_LANE_TX_RST_1 => tx_pcs_rst_ch1_c,
#else
  FFC_LANE_TX_RST_1 => tx_pcs_rst_ch_c,
#endif
  FFC_TXPWDNB_1 => tx_pwrup_ch1_c,
#else
  FFC_LANE_TX_RST_1 => fpsc_vlo,
  FFC_TXPWDNB_1 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "DISABLED"
  FFC_LANE_RX_RST_1 => fpsc_vlo,
  FFC_RXPWDNB_1 => fpsc_vlo,
  FFS_RLOS_LO_1 => open,
  FFS_RLOS_HI_1 => open,
#elif _ch1_protocol_new != "PIPE" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
  FFC_LANE_RX_RST_1 => rx_pcs_rst_ch1_c,
  FFC_RXPWDNB_1 => rx_pwrup_ch1_c,
#if _los_threshold_mode1 == "LOS_E"
  FFS_RLOS_LO_1 => rx_los_low_ch1_sig,
  FFS_RLOS_HI_1 => open,
#elif _los_threshold_mode1 == "LOS_EA"
  FFS_RLOS_LO_1 => open,
  FFS_RLOS_HI_1 => rx_los_high_ch1_s,
#endif
#elif _ch1_protocol_new == "PIPE" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
  FFC_LANE_RX_RST_1 => fpsc_vlo,
  FFC_RXPWDNB_1 => fpsc_vlo,
  FFS_RLOS_LO_1 => open,
#if _los_threshold_mode1 == "LOS_EA"
  FFS_RLOS_HI_1 => RxElecIdle_ch1,
#else
  FFS_RLOS_HI_1 => open,
#endif
#else
  FFC_LANE_RX_RST_1 => fpsc_vlo,
  FFC_RXPWDNB_1 => fpsc_vlo,
  FFS_RLOS_LO_1 => open,
  FFS_RLOS_HI_1 => open,
#endif
#if _ch1_mode != "DISABLED" && (_ch1_protocol_new == "PIPE" || _ch1_protocol_new == "PCIE")
  FFS_PCIE_CON_1 => pcie_con_ch1_s,
  FFS_PCIE_DONE_1 => pcie_done_ch1_s,
#else
  FFS_PCIE_CON_1 => open,
  FFS_PCIE_DONE_1 => open,
#endif
#if _ch1_protocol_new == "DISABLED"
  FFS_LS_SYNC_STATUS_1 => open,
#elif _ch1_protocol_new != "PIPE" && _ch1_ilsm == "ENABLED" && _ch1_rxwa == "ENABLED" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
  FFS_LS_SYNC_STATUS_1 => lsm_status_ch1_s,
#else
  FFS_LS_SYNC_STATUS_1 => open,
#endif
#if _ch1_protocol_new == "DISABLED"
  FFS_CC_OVERRUN_1 => open,
  FFS_CC_UNDERRUN_1 => open,
  FFS_SKP_ADDED_1 => open,
  FFS_SKP_DELETED_1 => open,
#elif _ch1_protocol_new != "PIPE" && _ch1_ctc == "ENABLED" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
  FFS_CC_OVERRUN_1 => ctc_orun_ch1_s,
  FFS_CC_UNDERRUN_1 => ctc_urun_ch1_s,
  FFS_SKP_ADDED_1 => ctc_ins_ch1_s,
  FFS_SKP_DELETED_1 => ctc_del_ch1_s,
#else
  FFS_CC_OVERRUN_1 => open,
  FFS_CC_UNDERRUN_1 => open,
  FFS_SKP_ADDED_1 => open,
  FFS_SKP_DELETED_1 => open,
#endif
#if _ch1_protocol_new == "DISABLED"
  FFS_RLOL_1 => open,
#elif _ch1_protocol_new != "PIPE" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
  FFS_RLOL_1 => rx_cdr_lol_ch1_sig,
#else
  FFS_RLOL_1 => open,
#endif
  FFS_RXFBFIFO_ERROR_1 => open,
  FFS_TXFBFIFO_ERROR_1 => open,
#if _ch1_protocol_new == "DISABLED"
  LDR_CORE2TX_1 => fpsc_vlo,
  FFC_LDR_CORE2TX_EN_1 => fpsc_vlo,
#elif _ch1_protocol_new != "PIPE" && _ch1_ldr == "ENABLED" && (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY")
  LDR_CORE2TX_1 => txd_ldr_ch1,
  FFC_LDR_CORE2TX_EN_1 => txd_ldr_en_ch1_c,
#else
  LDR_CORE2TX_1 => fpsc_vlo,
  FFC_LDR_CORE2TX_EN_1 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "DISABLED"
  LDR_RX2CORE_1 => open,
#elif _ch1_protocol_new != "PIPE" && _ch1_ldr == "ENABLED" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
  LDR_RX2CORE_1 => rxd_ldr_ch1,
#else
  LDR_RX2CORE_1 => open,
#endif
#if _ch1_protocol_new == "DISABLED"
  FFS_CDR_TRAIN_DONE_1 => open,
#elif _ch1_protocol_new == "DISP_PORT" && _ch1_mode != "DISABLED"
  FFS_CDR_TRAIN_DONE_1 => rx_cdr_trained_ch1_s,
#else
  FFS_CDR_TRAIN_DONE_1 => open,
#endif
#if _ch1_mode != "DISABLED" && _ch1_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X" && _refclk_mult == "20X" && (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY")
  FFC_DIV11_MODE_TX_1 => tx_div11_mode_ch1_c,
#else
  FFC_DIV11_MODE_TX_1 => fpsc_vlo,
#endif
#if (_ch1_mode == "RXTX" || _ch1_mode == "TXONLY") && ((_ch1_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X") || (_ch1_protocol_new == "G8B10B") || (_ch1_protocol_new == "CPRI" && (_datarange == "MED" || _datarange == "MEDHIGH")) || (_ch1_protocol_new == "OBSAI" && (_datarange == "MED" || _datarange == "HIGH")) || (_ch1_protocol_new == "SRIO" && _datarange == "MEDHIGH") || (_ch1_protocol_new == "SATA" && _datarange == "HIGH") || (_ch1_protocol_new == "FC" && _datarange == "MEDHIGH") || (_ch1_protocol_new == "10BSER") || (_ch1_protocol_new == "8BSER"))
  FFC_RATE_MODE_TX_1 => tx_div2_mode_ch1_c,
#else
  FFC_RATE_MODE_TX_1 => fpsc_vlo,
#endif
#if _ch1_protocol_new == "SDI" && _ch1_rx_datarange == "HIGH" && _refclk_mult == "20X" && (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY")
  FFC_DIV11_MODE_RX_1 => rx_div11_mode_ch1_c,
#else
  FFC_DIV11_MODE_RX_1 => fpsc_vlo,
#endif
#if (_ch1_mode == "RXTX" || _ch1_mode == "RXONLY") && ((_ch1_protocol_new == "SDI" && _ch1_rx_datarange == "HIGH" && _refclk_mult == "20X") || (_ch1_protocol_new == "G8B10B") || (_ch1_protocol_new == "CPRI" && (_ch1_rx_datarange == "MED" || _ch1_rx_datarange == "MEDHIGH")) || (_ch1_protocol_new == "OBSAI" && (_ch1_rx_datarange == "MED" || _ch1_rx_datarange == "HIGH")) || (_ch1_protocol_new == "SRIO" && _ch1_rx_datarange == "MEDHIGH") || (_ch1_protocol_new == "SATA" && _ch1_rx_datarange == "HIGH") || (_ch1_protocol_new == "FC" && _ch1_rx_datarange == "MEDHIGH") || (_ch1_protocol_new == "10BSER") || (_ch1_protocol_new == "8BSER"))
  FFC_RATE_MODE_RX_1 => rx_div2_mode_ch1_c,
#else
  FFC_RATE_MODE_RX_1 => fpsc_vlo,
#endif

----- CH2 -----
#if _ch2_mode == "TXONLY" || _ch2_mode == "RXTX"
  HDOUTP2 => hdoutp_ch2,
  HDOUTN2 => hdoutn_ch2,
#else
  HDOUTP2 => open,
  HDOUTN2 => open,
#endif
#if _ch2_mode == "RXONLY" || _ch2_mode == "RXTX"
  HDINP2 => hdinp_ch2,
  HDINN2 => hdinn_ch2,
#else
  HDINP2 => fpsc_vlo,
  HDINN2 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "PIPE" && _ch2_mode != "DISABLED"
  PCIE_TXDETRX_PR2TLB_2 => TxDetRx_Loopback_ch2,
#else
  PCIE_TXDETRX_PR2TLB_2 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "PIPE" && _ch2_mode != "DISABLED"
  PCIE_TXCOMPLIANCE_2 => TxCompliance_ch2,
  PCIE_RXPOLARITY_2 => RxPolarity_ch2,
  PCIE_POWERDOWN_2_0 => PowerDown_ch2(0),
  PCIE_POWERDOWN_2_1 => PowerDown_ch2(1),
  PCIE_RXVALID_2 => RxValid_ch2,
  PCIE_PHYSTATUS_2 => PhyStatus_ch2,
#else
  PCIE_TXCOMPLIANCE_2 => fpsc_vlo,
  PCIE_RXPOLARITY_2 => fpsc_vlo,
  PCIE_POWERDOWN_2_0 => fpsc_vlo,
  PCIE_POWERDOWN_2_1 => fpsc_vlo,
  PCIE_RXVALID_2 => open,
  PCIE_PHYSTATUS_2 => open,
#endif
#if _ch2_mode == "DISABLED"
  SCISELCH2 => fpsc_vlo,
  SCIENCH2 => fpsc_vlo,
#elif _sci_ports == "DISABLED"
  SCISELCH2 => fpsc_vlo,
  SCIENCH2 => fpsc_vlo,
#else
  SCISELCH2 => sci_sel_ch2,
  SCIENCH2 => fpsc_vhi,
#endif
#if _ch2_mode != "DISABLED" && _ch2_rx_fifo == "ENABLED"
  FF_RXI_CLK_2 => rxiclk_ch2,
#else
  FF_RXI_CLK_2 => fpsc_vlo,
#endif
#if _ch2_mode == "RXTX" || _ch2_mode == "TXONLY"
  FF_TXI_CLK_2 => txiclk_ch2,
#else
  FF_TXI_CLK_2 => fpsc_vlo,
#endif
#if _ch2_mode != "DISABLED"
#if (_ch2_ctc == "ENABLED" && ((_ch2_mode == "RXTX" || _ch2_mode == "TXONLY") || ((_ch2_ctc == "ENABLED" && _ch2_rx_fifo == "ENABLED") && (_ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"))))
  FF_EBRD_CLK_2 => tx_full_clk_ch2_sig,
#else
  FF_EBRD_CLK_2 => fpsc_vlo,
#endif
#else
  FF_EBRD_CLK_2 => fpsc_vlo,
#endif
#if _ch2_mode == "RXTX" || _ch2_mode == "RXONLY"
  FF_RX_F_CLK_2 => rx_full_clk_ch2,
#else
  FF_RX_F_CLK_2 => open,
#endif
#if _ch2_mode == "RXTX" || _ch2_mode == "RXONLY"
  FF_RX_H_CLK_2 => rx_half_clk_ch2,
#else
  FF_RX_H_CLK_2 => open,
#endif
#if (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY") || ((_ch2_ctc == "ENABLED" && _ch2_rx_fifo == "ENABLED") && (_ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"))
  FF_TX_F_CLK_2 => tx_full_clk_ch2_sig,
#else
  FF_TX_F_CLK_2 => open,
#endif
#if (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY") || ((_ch2_ctc == "ENABLED" && _ch2_rx_fifo == "ENABLED") && (_ch2_rx_data_width == "16" || _ch2_rx_data_width == "20"))
  FF_TX_H_CLK_2 => tx_half_clk_ch2,
#else
  FF_TX_H_CLK_2 => open,
#endif
#if _ch2_mode != "DISABLED" && _ch2_pll_rxsrc == "REFCLK_CORE"
  FFC_CK_CORE_RX_2 => fpga_rxrefclk_ch2,
#else
  FFC_CK_CORE_RX_2 => fpsc_vlo,
#endif
#if _ch2_mode == "RXONLY"
  FF_TX_D_2_0 => fpsc_vlo,
  FF_TX_D_2_1 => fpsc_vlo,
  FF_TX_D_2_2 => fpsc_vlo,
  FF_TX_D_2_3 => fpsc_vlo,
  FF_TX_D_2_4 => fpsc_vlo,
  FF_TX_D_2_5 => fpsc_vlo,
  FF_TX_D_2_6 => fpsc_vlo,
  FF_TX_D_2_7 => fpsc_vlo,
  FF_TX_D_2_8 => fpsc_vlo,
  FF_TX_D_2_9 => fpsc_vlo,
  FF_TX_D_2_10 => fpsc_vlo,
  FF_TX_D_2_11 => fpsc_vlo,
  FF_TX_D_2_12 => fpsc_vlo,
  FF_TX_D_2_13 => fpsc_vlo,
  FF_TX_D_2_14 => fpsc_vlo,
  FF_TX_D_2_15 => fpsc_vlo,
  FF_TX_D_2_16 => fpsc_vlo,
  FF_TX_D_2_17 => fpsc_vlo,
  FF_TX_D_2_18 => fpsc_vlo,
  FF_TX_D_2_19 => fpsc_vlo,
  FF_TX_D_2_20 => fpsc_vlo,
  FF_TX_D_2_21 => fpsc_vlo,
  FF_TX_D_2_22 => fpsc_vlo,
  FF_TX_D_2_23 => fpsc_vlo,
#else
#if _ch2_protocol_new == "DISABLED"
  FF_TX_D_2_0 => fpsc_vlo,
  FF_TX_D_2_1 => fpsc_vlo,
  FF_TX_D_2_2 => fpsc_vlo,
  FF_TX_D_2_3 => fpsc_vlo,
  FF_TX_D_2_4 => fpsc_vlo,
  FF_TX_D_2_5 => fpsc_vlo,
  FF_TX_D_2_6 => fpsc_vlo,
  FF_TX_D_2_7 => fpsc_vlo,
#elif _ch2_protocol_new == "PIPE"
  FF_TX_D_2_0 => TxData_ch2(0),
  FF_TX_D_2_1 => TxData_ch2(1),
  FF_TX_D_2_2 => TxData_ch2(2),
  FF_TX_D_2_3 => TxData_ch2(3),
  FF_TX_D_2_4 => TxData_ch2(4),
  FF_TX_D_2_5 => TxData_ch2(5),
  FF_TX_D_2_6 => TxData_ch2(6),
  FF_TX_D_2_7 => TxData_ch2(7),
#else
  FF_TX_D_2_0 => txdata_ch2(0),
  FF_TX_D_2_1 => txdata_ch2(1),
  FF_TX_D_2_2 => txdata_ch2(2),
  FF_TX_D_2_3 => txdata_ch2(3),
  FF_TX_D_2_4 => txdata_ch2(4),
  FF_TX_D_2_5 => txdata_ch2(5),
  FF_TX_D_2_6 => txdata_ch2(6),
  FF_TX_D_2_7 => txdata_ch2(7),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_protocol_new == "8BSER"
  FF_TX_D_2_8 => fpsc_vlo,
#elif _ch2_protocol_new == "PIPE"
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_8 => TxDataK_ch2,
#else
  FF_TX_D_2_8 => TxDataK_ch2(0),
#endif
#elif _ch2_protocol_new == "XAUI"
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_8 => txc_ch2,
#else
  FF_TX_D_2_8 => txc_ch2(0),
#endif
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_TX_D_2_8 => txdata_ch2(8),
#else
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_8 => tx_k_ch2,
#else
  FF_TX_D_2_8 => tx_k_ch2(0),
#endif
#endif
#if _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_TX_D_2_9 => txdata_ch2(9),
#elif _ch2_protocol_new == "PIPE" || _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "G8B10B" || _ch2_protocol_new == "PCIE" || _ch2_protocol_new == "OBSAI" || _ch2_protocol_new == "FC" || _ch2_protocol_new == "SATA" || _ch2_protocol_new == "DISP_PORT"
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_9 => tx_force_disp_ch2,
#else
  FF_TX_D_2_9 => tx_force_disp_ch2(0),
#endif
#else
  FF_TX_D_2_9 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "GIGE" || _ch2_protocol_new == "SGMII" 
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_10 => xmit_ch2,
#else
  FF_TX_D_2_10 => xmit_ch2(0),
#endif
#elif _ch2_protocol_new == "PIPE" || _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "G8B10B" || _ch2_protocol_new == "PCIE" || _ch2_protocol_new == "OBSAI" || _ch2_protocol_new == "FC" || _ch2_protocol_new == "SATA" || _ch2_protocol_new == "DISP_PORT"
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_10 => tx_disp_sel_ch2,
#else
  FF_TX_D_2_10 => tx_disp_sel_ch2(0),
#endif
#else
  FF_TX_D_2_10 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "FC" || _ch2_protocol_new == "GIGE" || _ch2_protocol_new == "SGMII" 
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_11 => tx_disp_correct_ch2,
#else
  FF_TX_D_2_11 => tx_disp_correct_ch2(0),
#endif
#elif _ch2_protocol_new == "PCIE" || _ch2_protocol_new == "PIPE"
#if _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_11 => pci_ei_en_ch2,
#else
  FF_TX_D_2_11 => pci_ei_en_ch2(0),
#endif
#else
  FF_TX_D_2_11 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_12 => fpsc_vlo,
#elif _ch2_protocol_new == "PIPE"
  FF_TX_D_2_12 => TxData_ch2(8),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_TX_D_2_12 => txdata_ch2(10),
#else
  FF_TX_D_2_12 => txdata_ch2(8),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_13 => fpsc_vlo,
#elif _ch2_protocol_new == "PIPE"
  FF_TX_D_2_13 => TxData_ch2(9),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_TX_D_2_13 => txdata_ch2(11),
#else
  FF_TX_D_2_13 => txdata_ch2(9),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_14 => fpsc_vlo,
#elif _ch2_protocol_new == "PIPE"
  FF_TX_D_2_14 => TxData_ch2(10),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_TX_D_2_14 => txdata_ch2(12),
#else
  FF_TX_D_2_14 => txdata_ch2(10),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_15 => fpsc_vlo,
#elif _ch2_protocol_new == "PIPE"
  FF_TX_D_2_15 => TxData_ch2(11),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_TX_D_2_15 => txdata_ch2(13),
#else
  FF_TX_D_2_15 => txdata_ch2(11),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_16 => fpsc_vlo,
#elif _ch2_protocol_new == "PIPE"
  FF_TX_D_2_16 => TxData_ch2(12),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_TX_D_2_16 => txdata_ch2(14),
#else
  FF_TX_D_2_16 => txdata_ch2(12),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_17 => fpsc_vlo,
#elif _ch2_protocol_new == "PIPE"
  FF_TX_D_2_17 => TxData_ch2(13),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_TX_D_2_17 => txdata_ch2(15),
#else
  FF_TX_D_2_17 => txdata_ch2(13),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_18 => fpsc_vlo,
#elif _ch2_protocol_new == "PIPE"
  FF_TX_D_2_18 => TxData_ch2(14),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_TX_D_2_18 => txdata_ch2(16),
#else
  FF_TX_D_2_18 => txdata_ch2(14),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_19 => fpsc_vlo,
#elif _ch2_protocol_new == "PIPE"
  FF_TX_D_2_19 => TxData_ch2(15),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_TX_D_2_19 => txdata_ch2(17),
#else
  FF_TX_D_2_19 => txdata_ch2(15),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_protocol_new == "8BSER" || _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_20 => fpsc_vlo,
#elif _ch2_protocol_new == "PIPE"
  FF_TX_D_2_20 => TxDataK_ch2(1),
#elif _ch2_protocol_new == "XAUI"
  FF_TX_D_2_20 => txc_ch2(1),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_TX_D_2_20 => txdata_ch2(18),
#else
  FF_TX_D_2_20 => tx_k_ch2(1),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_protocol_new == "8BSER" || _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_21 => fpsc_vlo,
#elif _ch2_protocol_new == "PIPE" || _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "G8B10B" || _ch2_protocol_new == "PCIE" || _ch2_protocol_new == "OBSAI" || _ch2_protocol_new == "FC" || _ch2_protocol_new == "SATA" || _ch2_protocol_new == "DISP_PORT"
  FF_TX_D_2_21 => tx_force_disp_ch2(1),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_TX_D_2_21 => txdata_ch2(19),
#else
  FF_TX_D_2_21 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_protocol_new == "8BSER" || _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_22 => fpsc_vlo,
#elif _ch2_protocol_new == "PIPE" || _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "G8B10B" || _ch2_protocol_new == "PCIE" || _ch2_protocol_new == "OBSAI" || _ch2_protocol_new == "FC" || _ch2_protocol_new == "SATA" || _ch2_protocol_new == "DISP_PORT"
  FF_TX_D_2_22 => tx_disp_sel_ch2(1),
#elif _ch2_protocol_new == "GIGE" || _ch2_protocol_new == "SGMII" 
  FF_TX_D_2_22 => xmit_ch2(1),
#else
  FF_TX_D_2_22 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_protocol_new == "8BSER" || _ch2_tx_data_width == "8" || _ch2_tx_data_width == "10"
  FF_TX_D_2_23 => fpsc_vlo,
#elif _ch2_protocol_new == "FC" || _ch2_protocol_new == "GIGE" || _ch2_protocol_new == "SGMII" 
  FF_TX_D_2_23 => tx_disp_correct_ch2(1),
#elif _ch2_protocol_new == "PCIE" || _ch2_protocol_new == "PIPE"
  FF_TX_D_2_23 => pci_ei_en_ch2(1),
#else
  FF_TX_D_2_23 => fpsc_vlo,
#endif
#endif
#if _ch2_mode == "TXONLY"
  FF_RX_D_2_0 => open,
  FF_RX_D_2_1 => open,
  FF_RX_D_2_2 => open,
  FF_RX_D_2_3 => open,
  FF_RX_D_2_4 => open,
  FF_RX_D_2_5 => open,
  FF_RX_D_2_6 => open,
  FF_RX_D_2_7 => open,
  FF_RX_D_2_8 => open,
  FF_RX_D_2_9 => open,
  FF_RX_D_2_10 => open,
  FF_RX_D_2_11 => open,
  FF_RX_D_2_12 => open,
  FF_RX_D_2_13 => open,
  FF_RX_D_2_14 => open,
  FF_RX_D_2_15 => open,
  FF_RX_D_2_16 => open,
  FF_RX_D_2_17 => open,
  FF_RX_D_2_18 => open,
  FF_RX_D_2_19 => open,
  FF_RX_D_2_20 => open,
  FF_RX_D_2_21 => open,
  FF_RX_D_2_22 => open,
  FF_RX_D_2_23 => open,
#else
#if _ch2_protocol_new == "DISABLED"
  FF_RX_D_2_0 => open,
  FF_RX_D_2_1 => open,
  FF_RX_D_2_2 => open,
  FF_RX_D_2_3 => open,
  FF_RX_D_2_4 => open,
  FF_RX_D_2_5 => open,
  FF_RX_D_2_6 => open,
  FF_RX_D_2_7 => open,
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_0 => RxData_ch2(0),
  FF_RX_D_2_1 => RxData_ch2(1),
  FF_RX_D_2_2 => RxData_ch2(2),
  FF_RX_D_2_3 => RxData_ch2(3),
  FF_RX_D_2_4 => RxData_ch2(4),
  FF_RX_D_2_5 => RxData_ch2(5),
  FF_RX_D_2_6 => RxData_ch2(6),
  FF_RX_D_2_7 => RxData_ch2(7),
#else
  FF_RX_D_2_0 => rxdata_ch2(0),
  FF_RX_D_2_1 => rxdata_ch2(1),
  FF_RX_D_2_2 => rxdata_ch2(2),
  FF_RX_D_2_3 => rxdata_ch2(3),
  FF_RX_D_2_4 => rxdata_ch2(4),
  FF_RX_D_2_5 => rxdata_ch2(5),
  FF_RX_D_2_6 => rxdata_ch2(6),
  FF_RX_D_2_7 => rxdata_ch2(7),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_protocol_new == "8BSER"
  FF_RX_D_2_8 => open,
#elif _ch2_protocol_new == "PIPE"
#if _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_8 => RxDataK_ch2,
#else
  FF_RX_D_2_8 => RxDataK_ch2(0),
#endif
#elif _ch2_protocol_new == "XAUI"
#if _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_8 => rxc_ch2,
#else
  FF_RX_D_2_8 => rxc_ch2(0),
#endif
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_RX_D_2_8 => rxdata_ch2(8),
#else
#if _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_8 => rx_k_ch2,
#else
  FF_RX_D_2_8 => rx_k_ch2(0),
#endif
#endif
#if _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_RX_D_2_9 => rxdata_ch2(9),
#elif _ch2_protocol_new == "SATA" || _ch2_protocol_new == "DISP_PORT" || _ch2_protocol_new == "G8B10B" || _ch2_protocol_new == "GIGE" || _ch2_protocol_new == "SGMII" || _ch2_protocol_new == "XAUI" || _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "SRIO" || _ch2_protocol_new == "OBSAI" || _ch2_protocol_new == "FC"
#if _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_9 => rx_disp_err_ch2,
#else
  FF_RX_D_2_9 => rx_disp_err_ch2(0),
#endif
#elif _ch2_protocol_new == "PCIE" 
  FF_RX_D_2_9 => rxstatus0_ch2(0),
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_9 => RxStatus0_ch2(0),
#else
  FF_RX_D_2_9 => open,
#endif
#if _ch2_protocol_new == "SATA" || _ch2_protocol_new == "DISP_PORT" || _ch2_protocol_new == "G8B10B" || _ch2_protocol_new == "GIGE" || _ch2_protocol_new == "SGMII" || _ch2_protocol_new == "XAUI" || _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "SRIO" || _ch2_protocol_new == "OBSAI" || _ch2_protocol_new ==  "FC"
#if _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_10 => rx_cv_err_ch2,
#else
  FF_RX_D_2_10 => rx_cv_err_ch2(0),
#endif
#elif _ch2_protocol_new == "PCIE" 
  FF_RX_D_2_10 => rxstatus0_ch2(1),
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_10 => RxStatus0_ch2(1),
#else
  FF_RX_D_2_10 => open,
#endif
#if _ch2_protocol_new == "PCIE" 
  FF_RX_D_2_11 => rxstatus0_ch2(2),
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_11 => RxStatus0_ch2(2),
#else
  FF_RX_D_2_11 => open,
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_12 => open,
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_12 => RxData_ch2(8),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_RX_D_2_12 => rxdata_ch2(10),
#else
  FF_RX_D_2_12 => rxdata_ch2(8),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_13 => open,
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_13 => RxData_ch2(9),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_RX_D_2_13 => rxdata_ch2(11),
#else
  FF_RX_D_2_13 => rxdata_ch2(9),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_14 => open,
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_14 => RxData_ch2(10),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_RX_D_2_14 => rxdata_ch2(12),
#else
  FF_RX_D_2_14 => rxdata_ch2(10),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_15 => open,
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_15 => RxData_ch2(11),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_RX_D_2_15 => rxdata_ch2(13),
#else
  FF_RX_D_2_15 => rxdata_ch2(11),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_16 => open,
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_16 => RxData_ch2(12),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_RX_D_2_16 => rxdata_ch2(14),
#else
  FF_RX_D_2_16 => rxdata_ch2(12),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_17 => open,
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_17 => RxData_ch2(13),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_RX_D_2_17 => rxdata_ch2(15),
#else
  FF_RX_D_2_17 => rxdata_ch2(13),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_18 => open,
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_18 => RxData_ch2(14),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_RX_D_2_18 => rxdata_ch2(16),
#else
  FF_RX_D_2_18 => rxdata_ch2(14),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_19 => open,
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_19 => RxData_ch2(15),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_RX_D_2_19 => rxdata_ch2(17),
#else
  FF_RX_D_2_19 => rxdata_ch2(15),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_protocol_new == "8BSER" || _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_20 => open,
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_20 => RxDataK_ch2(1),
#elif _ch2_protocol_new == "XAUI"
  FF_RX_D_2_20 => rxc_ch2(1),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_RX_D_2_20 => rxdata_ch2(18),
#else
  FF_RX_D_2_20 => rx_k_ch2(1),
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_protocol_new == "8BSER" || _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_21 => open,
#elif _ch2_protocol_new == "SATA" || _ch2_protocol_new == "DISP_PORT" || _ch2_protocol_new == "G8B10B" || _ch2_protocol_new == "GIGE" || _ch2_protocol_new == "SGMII" || _ch2_protocol_new == "XAUI" || _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "SRIO" || _ch2_protocol_new == "OBSAI" || _ch2_protocol_new == "FC"
  FF_RX_D_2_21 => rx_disp_err_ch2(1),
#elif _ch2_protocol_new == "PCIE" 
  FF_RX_D_2_21 => rxstatus1_ch2(0),
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_21 => RxStatus1_ch2(0),
#elif _ch2_protocol_new == "10BSER" || _ch2_protocol_new == "SDI"
  FF_RX_D_2_21 => rxdata_ch2(19),
#else
  FF_RX_D_2_21 => open,
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_protocol_new == "8BSER" || _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_22 => open,
#elif _ch2_protocol_new == "SATA" || _ch2_protocol_new == "DISP_PORT" || _ch2_protocol_new == "G8B10B" || _ch2_protocol_new == "GIGE" || _ch2_protocol_new == "SGMII" || _ch2_protocol_new == "XAUI" || _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "SRIO" || _ch2_protocol_new == "OBSAI" || _ch2_protocol_new == "FC"
  FF_RX_D_2_22 => rx_cv_err_ch2(1),
#elif _ch2_protocol_new == "PCIE" 
  FF_RX_D_2_22 => rxstatus1_ch2(1),
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_22 => RxStatus1_ch2(1),
#else
  FF_RX_D_2_22 => open,
#endif
#if _ch2_protocol_new == "DISABLED" || _ch2_protocol_new == "8BSER" || _ch2_rx_data_width == "8" || _ch2_rx_data_width == "10"
  FF_RX_D_2_23 => open,
#elif _ch2_protocol_new == "PCIE" 
  FF_RX_D_2_23 => rxstatus1_ch2(2),
#elif _ch2_protocol_new == "PIPE"
  FF_RX_D_2_23 => RxStatus1_ch2(2),
#else
  FF_RX_D_2_23 => open,
#endif
#endif

#if _ch2_mode == "RXTX" || _ch2_mode == "RXONLY"
  FFC_RRST_2 => rx_serdes_rst_ch2_c,
#else
  FFC_RRST_2 => fpsc_vlo,
#endif
  FFC_SIGNAL_DETECT_2 => fpsc_vlo,
#if _ch2_protocol_new == "DISABLED"
  FFC_SB_PFIFO_LP_2 => fpsc_vlo,
  FFC_PFIFO_CLR_2 => fpsc_vlo,
#elif _ch2_protocol_new != "PIPE" && _ch2_mode == "RXTX" 
#if _ch2_lbtype == "DISABLED"
  FFC_SB_PFIFO_LP_2 => sb_felb_ch2_c,
  FFC_PFIFO_CLR_2 => sb_felb_rst_ch2_c,
#else
  FFC_SB_PFIFO_LP_2 => fpsc_vlo,
  FFC_PFIFO_CLR_2 => fpsc_vlo,
#endif
#else
  FFC_SB_PFIFO_LP_2 => fpsc_vlo,
  FFC_PFIFO_CLR_2 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "DISABLED"
  FFC_SB_INV_RX_2 => fpsc_vlo,
#elif _ch2_protocol_new != "PIPE" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY") && _ch2_ird == "ENABLED"
  FFC_SB_INV_RX_2 => rx_invert_ch2_c,
#else
  FFC_SB_INV_RX_2 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "PCIE" && _ch2_mode != "DISABLED"
  FFC_PCIE_CT_2 => pcie_ct_ch2_c,
  FFC_PCI_DET_EN_2 => pcie_det_en_ch2_c,
#else
  FFC_PCIE_CT_2 => fpsc_vlo,
  FFC_PCI_DET_EN_2 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "DISABLED"
  FFC_FB_LOOPBACK_2 => fpsc_vlo,
#elif _ch2_protocol_new != "PIPE" && _ch2_lbtype == "Loopback parallel data after PCS block" && _ch2_mode == "RXTX"
  FFC_FB_LOOPBACK_2 => fb_felb_ch2_c,
#else
  FFC_FB_LOOPBACK_2 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "DISABLED"
  FFC_ENABLE_CGALIGN_2 => fpsc_vlo,
#elif _ch2_protocol_new != "PIPE" && _ch2_ilsm == "DISABLED" && _ch2_rxwa == "ENABLED"
  FFC_ENABLE_CGALIGN_2 => word_align_en_ch2_c,
#else
  FFC_ENABLE_CGALIGN_2 => fpsc_vlo,
#endif
#if (_ch2_protocol_new == "SATA" || _ch2_protocol_new == "PCIE") && _ch2_mode != "DISABLED"
  FFC_EI_EN_2 => tx_idle_ch2_c,
#elif _ch2_teidle == "ENABLED"
#if _ch2_protocol_new == "SRIO" || _ch2_protocol_new == "G8B10B" || _ch2_protocol_new == "CPRI" || _ch2_protocol_new == "OBSAI" && (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY")
  FFC_EI_EN_2 => tx_idle_ch2_c,
#else
  FFC_EI_EN_2 => fpsc_vlo,
#endif
#else
  FFC_EI_EN_2 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "DISABLED"
  FFC_LANE_TX_RST_2 => fpsc_vlo,
  FFC_TXPWDNB_2 => fpsc_vlo,
#elif _ch2_protocol_new != "PIPE" && (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY")
#if _rst_gen == "DISABLED"
  FFC_LANE_TX_RST_2 => tx_pcs_rst_ch2_c,
#else
  FFC_LANE_TX_RST_2 => tx_pcs_rst_ch_c,
#endif
  FFC_TXPWDNB_2 => tx_pwrup_ch2_c,
#else
  FFC_LANE_TX_RST_2 => fpsc_vlo,
  FFC_TXPWDNB_2 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "DISABLED"
  FFC_LANE_RX_RST_2 => fpsc_vlo,
  FFC_RXPWDNB_2 => fpsc_vlo,
  FFS_RLOS_LO_2 => open,
  FFS_RLOS_HI_2 => open,
#elif _ch2_protocol_new != "PIPE" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
  FFC_LANE_RX_RST_2 => rx_pcs_rst_ch2_c,
  FFC_RXPWDNB_2 => rx_pwrup_ch2_c,
#if _los_threshold_mode2 == "LOS_E"
  FFS_RLOS_LO_2 => rx_los_low_ch2_sig,
  FFS_RLOS_HI_2 => open,
#elif _los_threshold_mode2 == "LOS_EA"
  FFS_RLOS_LO_2 => open,
  FFS_RLOS_HI_2 => rx_los_high_ch2_s,
#endif
#elif _ch2_protocol_new == "PIPE" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
  FFC_LANE_RX_RST_2 => fpsc_vlo,
  FFC_RXPWDNB_2 => fpsc_vlo,
  FFS_RLOS_LO_2 => open,
#if _los_threshold_mode2 == "LOS_EA"
  FFS_RLOS_HI_2 => RxElecIdle_ch2,
#else
  FFS_RLOS_HI_2 => open,
#endif
#else
  FFC_LANE_RX_RST_2 => fpsc_vlo,
  FFC_RXPWDNB_2 => fpsc_vlo,
  FFS_RLOS_LO_2 => open,
  FFS_RLOS_HI_2 => open,
#endif
#if _ch2_mode != "DISABLED" && (_ch2_protocol_new == "PIPE" || _ch2_protocol_new == "PCIE")
  FFS_PCIE_CON_2 => pcie_con_ch2_s,
  FFS_PCIE_DONE_2 => pcie_done_ch2_s,
#else
  FFS_PCIE_CON_2 => open,
  FFS_PCIE_DONE_2 => open,
#endif
#if _ch2_protocol_new == "DISABLED"
  FFS_LS_SYNC_STATUS_2 => open,
#elif _ch2_protocol_new != "PIPE" && _ch2_ilsm == "ENABLED" && _ch2_rxwa == "ENABLED" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
  FFS_LS_SYNC_STATUS_2 => lsm_status_ch2_s,
#else
  FFS_LS_SYNC_STATUS_2 => open,
#endif
#if _ch2_protocol_new == "DISABLED"
  FFS_CC_OVERRUN_2 => open,
  FFS_CC_UNDERRUN_2 => open,
  FFS_SKP_ADDED_2 => open,
  FFS_SKP_DELETED_2 => open,
#elif _ch2_protocol_new != "PIPE" && _ch2_ctc == "ENABLED" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
  FFS_CC_OVERRUN_2 => ctc_orun_ch2_s,
  FFS_CC_UNDERRUN_2 => ctc_urun_ch2_s,
  FFS_SKP_ADDED_2 => ctc_ins_ch2_s,
  FFS_SKP_DELETED_2 => ctc_del_ch2_s,
#else
  FFS_CC_OVERRUN_2 => open,
  FFS_CC_UNDERRUN_2 => open,
  FFS_SKP_ADDED_2 => open,
  FFS_SKP_DELETED_2 => open,
#endif
#if _ch2_protocol_new == "DISABLED"
  FFS_RLOL_2 => open,
#elif _ch2_protocol_new != "PIPE" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
  FFS_RLOL_2 => rx_cdr_lol_ch2_sig,
#else
  FFS_RLOL_2 => open,
#endif
  FFS_RXFBFIFO_ERROR_2 => open,
  FFS_TXFBFIFO_ERROR_2 => open,
#if _ch2_protocol_new == "DISABLED"
  LDR_CORE2TX_2 => fpsc_vlo,
  FFC_LDR_CORE2TX_EN_2 => fpsc_vlo,
#elif _ch2_protocol_new != "PIPE" && _ch2_ldr == "ENABLED" && (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY")
  LDR_CORE2TX_2 => txd_ldr_ch2,
  FFC_LDR_CORE2TX_EN_2 => txd_ldr_en_ch2_c,
#else
  LDR_CORE2TX_2 => fpsc_vlo,
  FFC_LDR_CORE2TX_EN_2 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "DISABLED"
  LDR_RX2CORE_2 => open,
#elif _ch2_protocol_new != "PIPE" && _ch2_ldr == "ENABLED" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
  LDR_RX2CORE_2 => rxd_ldr_ch2,
#else
  LDR_RX2CORE_2 => open,
#endif
#if _ch2_protocol_new == "DISABLED"
  FFS_CDR_TRAIN_DONE_2 => open,
#elif _ch2_protocol_new == "DISP_PORT" && _ch2_mode != "DISABLED"
  FFS_CDR_TRAIN_DONE_2 => rx_cdr_trained_ch2_s,
#else
  FFS_CDR_TRAIN_DONE_2 => open,
#endif
#if _ch2_mode != "DISABLED" && _ch2_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X" && _refclk_mult == "20X" && (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY")
  FFC_DIV11_MODE_TX_2 => tx_div11_mode_ch2_c,
#else
  FFC_DIV11_MODE_TX_2 => fpsc_vlo,
#endif
#if (_ch2_mode == "RXTX" || _ch2_mode == "TXONLY") && ((_ch2_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X") || (_ch2_protocol_new == "G8B10B") || (_ch2_protocol_new == "CPRI" && (_datarange == "MED" || _datarange == "MEDHIGH")) || (_ch2_protocol_new == "OBSAI" && (_datarange == "MED" || _datarange == "HIGH")) || (_ch2_protocol_new == "SRIO" && _datarange == "MEDHIGH") || (_ch2_protocol_new == "SATA" && _datarange == "HIGH") || (_ch2_protocol_new == "FC" && _datarange == "MEDHIGH") || (_ch2_protocol_new == "10BSER") || (_ch2_protocol_new == "8BSER"))
  FFC_RATE_MODE_TX_2 => tx_div2_mode_ch2_c,
#else
  FFC_RATE_MODE_TX_2 => fpsc_vlo,
#endif
#if _ch2_protocol_new == "SDI" && _ch2_rx_datarange == "HIGH" && _refclk_mult == "20X" && (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY")
  FFC_DIV11_MODE_RX_2 => rx_div11_mode_ch2_c,
#else
  FFC_DIV11_MODE_RX_2 => fpsc_vlo,
#endif
#if (_ch2_mode == "RXTX" || _ch2_mode == "RXONLY") && ((_ch2_protocol_new == "SDI" && _ch2_rx_datarange == "HIGH" && _refclk_mult == "20X") || (_ch2_protocol_new == "G8B10B") || (_ch2_protocol_new == "CPRI" && (_ch2_rx_datarange == "MED" || _ch2_rx_datarange == "MEDHIGH")) || (_ch2_protocol_new == "OBSAI" && (_ch2_rx_datarange == "MED" || _ch2_rx_datarange == "HIGH")) || (_ch2_protocol_new == "SRIO" && _ch2_rx_datarange == "MEDHIGH") || (_ch2_protocol_new == "SATA" && _ch2_rx_datarange == "HIGH") || (_ch2_protocol_new == "FC" && _ch2_rx_datarange == "MEDHIGH") || (_ch2_protocol_new == "10BSER") || (_ch2_protocol_new == "8BSER"))
  FFC_RATE_MODE_RX_2 => rx_div2_mode_ch2_c,
#else
  FFC_RATE_MODE_RX_2 => fpsc_vlo,
#endif

----- CH3 -----
#if _ch3_mode == "TXONLY" || _ch3_mode == "RXTX"
  HDOUTP3 => hdoutp_ch3,
  HDOUTN3 => hdoutn_ch3,
#else
  HDOUTP3 => open,
  HDOUTN3 => open,
#endif
#if _ch3_mode == "RXONLY" || _ch3_mode == "RXTX"
  HDINP3 => hdinp_ch3,
  HDINN3 => hdinn_ch3,
#else
  HDINP3 => fpsc_vlo,
  HDINN3 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "PIPE" && _ch3_mode != "DISABLED"
  PCIE_TXDETRX_PR2TLB_3 => TxDetRx_Loopback_ch3,
#else
  PCIE_TXDETRX_PR2TLB_3 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "PIPE" && _ch3_mode != "DISABLED"
  PCIE_TXCOMPLIANCE_3 => TxCompliance_ch3,
  PCIE_RXPOLARITY_3 => RxPolarity_ch3,
  PCIE_POWERDOWN_3_0 => PowerDown_ch3(0),
  PCIE_POWERDOWN_3_1 => PowerDown_ch3(1),
  PCIE_RXVALID_3 => RxValid_ch3,
  PCIE_PHYSTATUS_3 => PhyStatus_ch3,
#else
  PCIE_TXCOMPLIANCE_3 => fpsc_vlo,
  PCIE_RXPOLARITY_3 => fpsc_vlo,
  PCIE_POWERDOWN_3_0 => fpsc_vlo,
  PCIE_POWERDOWN_3_1 => fpsc_vlo,
  PCIE_RXVALID_3 => open,
  PCIE_PHYSTATUS_3 => open,
#endif
#if _ch3_mode == "DISABLED"
  SCISELCH3 => fpsc_vlo,
  SCIENCH3 => fpsc_vlo,
#elif _sci_ports == "DISABLED"
  SCISELCH3 => fpsc_vlo,
  SCIENCH3 => fpsc_vlo,
#else
  SCISELCH3 => sci_sel_ch3,
  SCIENCH3 => fpsc_vhi,
#endif
#if _ch3_mode != "DISABLED" && _ch3_rx_fifo == "ENABLED"
  FF_RXI_CLK_3 => rxiclk_ch3,
#else
  FF_RXI_CLK_3 => fpsc_vlo,
#endif
#if _ch3_mode == "RXTX" || _ch3_mode == "TXONLY"
  FF_TXI_CLK_3 => txiclk_ch3,
#else
  FF_TXI_CLK_3 => fpsc_vlo,
#endif
#if _ch3_mode != "DISABLED"
#if (_ch3_ctc == "ENABLED" && ((_ch3_mode == "RXTX" || _ch3_mode == "TXONLY") || ((_ch3_ctc == "ENABLED" && _ch3_rx_fifo == "ENABLED") && (_ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"))))
  FF_EBRD_CLK_3 => tx_full_clk_ch3_sig,
#else
  FF_EBRD_CLK_3 => fpsc_vlo,
#endif
#else
  FF_EBRD_CLK_3 => fpsc_vlo,
#endif
#if _ch3_mode == "RXTX" || _ch3_mode == "RXONLY"
  FF_RX_F_CLK_3 => rx_full_clk_ch3,
#else
  FF_RX_F_CLK_3 => open,
#endif
#if _ch3_mode == "RXTX" || _ch3_mode == "RXONLY"
  FF_RX_H_CLK_3 => rx_half_clk_ch3,
#else
  FF_RX_H_CLK_3 => open,
#endif
#if (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY") || ((_ch3_ctc == "ENABLED" && _ch3_rx_fifo == "ENABLED") && (_ch3_rx_data_width == "8" || _ch3_rx_data_width == "10")) 
  FF_TX_F_CLK_3 => tx_full_clk_ch3_sig,
#else
  FF_TX_F_CLK_3 => open,
#endif
#if (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY") || ((_ch3_ctc == "ENABLED" && _ch3_rx_fifo == "ENABLED") && (_ch3_rx_data_width == "16" || _ch3_rx_data_width == "20"))
  FF_TX_H_CLK_3 => tx_half_clk_ch3,
#else
  FF_TX_H_CLK_3 => open,
#endif
#if _ch3_mode != "DISABLED" && _ch3_pll_rxsrc == "REFCLK_CORE"
  FFC_CK_CORE_RX_3 => fpga_rxrefclk_ch3,
#else
  FFC_CK_CORE_RX_3 => fpsc_vlo,
#endif
#if _ch3_mode == "RXONLY"
  FF_TX_D_3_0 => fpsc_vlo,
  FF_TX_D_3_1 => fpsc_vlo,
  FF_TX_D_3_2 => fpsc_vlo,
  FF_TX_D_3_3 => fpsc_vlo,
  FF_TX_D_3_4 => fpsc_vlo,
  FF_TX_D_3_5 => fpsc_vlo,
  FF_TX_D_3_6 => fpsc_vlo,
  FF_TX_D_3_7 => fpsc_vlo,
  FF_TX_D_3_8 => fpsc_vlo,
  FF_TX_D_3_9 => fpsc_vlo,
  FF_TX_D_3_10 => fpsc_vlo,
  FF_TX_D_3_11 => fpsc_vlo,
  FF_TX_D_3_12 => fpsc_vlo,
  FF_TX_D_3_13 => fpsc_vlo,
  FF_TX_D_3_14 => fpsc_vlo,
  FF_TX_D_3_15 => fpsc_vlo,
  FF_TX_D_3_16 => fpsc_vlo,
  FF_TX_D_3_17 => fpsc_vlo,
  FF_TX_D_3_18 => fpsc_vlo,
  FF_TX_D_3_19 => fpsc_vlo,
  FF_TX_D_3_20 => fpsc_vlo,
  FF_TX_D_3_21 => fpsc_vlo,
  FF_TX_D_3_22 => fpsc_vlo,
  FF_TX_D_3_23 => fpsc_vlo,
#else
#if _ch3_protocol_new == "DISABLED"
  FF_TX_D_3_0 => fpsc_vlo,
  FF_TX_D_3_1 => fpsc_vlo,
  FF_TX_D_3_2 => fpsc_vlo,
  FF_TX_D_3_3 => fpsc_vlo,
  FF_TX_D_3_4 => fpsc_vlo,
  FF_TX_D_3_5 => fpsc_vlo,
  FF_TX_D_3_6 => fpsc_vlo,
  FF_TX_D_3_7 => fpsc_vlo,
#elif _ch3_protocol_new == "PIPE"
  FF_TX_D_3_0 => TxData_ch3(0),
  FF_TX_D_3_1 => TxData_ch3(1),
  FF_TX_D_3_2 => TxData_ch3(2),
  FF_TX_D_3_3 => TxData_ch3(3),
  FF_TX_D_3_4 => TxData_ch3(4),
  FF_TX_D_3_5 => TxData_ch3(5),
  FF_TX_D_3_6 => TxData_ch3(6),
  FF_TX_D_3_7 => TxData_ch3(7),
#else
  FF_TX_D_3_0 => txdata_ch3(0),
  FF_TX_D_3_1 => txdata_ch3(1),
  FF_TX_D_3_2 => txdata_ch3(2),
  FF_TX_D_3_3 => txdata_ch3(3),
  FF_TX_D_3_4 => txdata_ch3(4),
  FF_TX_D_3_5 => txdata_ch3(5),
  FF_TX_D_3_6 => txdata_ch3(6),
  FF_TX_D_3_7 => txdata_ch3(7),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_protocol_new == "8BSER"
  FF_TX_D_3_8 => fpsc_vlo,
#elif _ch3_protocol_new == "PIPE"
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_8 => TxDataK_ch3,
#else
  FF_TX_D_3_8 => TxDataK_ch3(0),
#endif
#elif _ch3_protocol_new == "XAUI"
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_8 => txc_ch3,
#else
  FF_TX_D_3_8 => txc_ch3(0),
#endif
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_TX_D_3_8 => txdata_ch3(8),
#else
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_8 => tx_k_ch3,
#else
  FF_TX_D_3_8 => tx_k_ch3(0),
#endif
#endif
#if _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_TX_D_3_9 => txdata_ch3(9),
#elif _ch3_protocol_new == "PIPE" || _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "G8B10B" || _ch3_protocol_new == "PCIE" || _ch3_protocol_new == "OBSAI" || _ch3_protocol_new == "FC" || _ch3_protocol_new == "SATA" || _ch3_protocol_new == "DISP_PORT"
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_9 => tx_force_disp_ch3,
#else
  FF_TX_D_3_9 => tx_force_disp_ch3(0),
#endif
#else
  FF_TX_D_3_9 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "GIGE" || _ch3_protocol_new == "SGMII" 
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_10 => xmit_ch3,
#else
  FF_TX_D_3_10 => xmit_ch3(0),
#endif
#elif _ch3_protocol_new == "PIPE" || _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "G8B10B" || _ch3_protocol_new == "PCIE" || _ch3_protocol_new == "OBSAI" || _ch3_protocol_new == "FC" || _ch3_protocol_new == "SATA" || _ch3_protocol_new == "DISP_PORT"
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_10 => tx_disp_sel_ch3,
#else
  FF_TX_D_3_10 => tx_disp_sel_ch3(0),
#endif
#else
  FF_TX_D_3_10 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "FC" || _ch3_protocol_new == "GIGE" || _ch3_protocol_new == "SGMII" 
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_11 => tx_disp_correct_ch3,
#else
  FF_TX_D_3_11 => tx_disp_correct_ch3(0),
#endif
#elif _ch3_protocol_new == "PCIE" || _ch3_protocol_new == "PIPE"
#if _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_11 => pci_ei_en_ch3,
#else
  FF_TX_D_3_11 => pci_ei_en_ch3(0),
#endif
#else
  FF_TX_D_3_11 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_12 => fpsc_vlo,
#elif _ch3_protocol_new == "PIPE"
  FF_TX_D_3_12 => TxData_ch3(8),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_TX_D_3_12 => txdata_ch3(10),
#else
  FF_TX_D_3_12 => txdata_ch3(8),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_13 => fpsc_vlo,
#elif _ch3_protocol_new == "PIPE"
  FF_TX_D_3_13 => TxData_ch3(9),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_TX_D_3_13 => txdata_ch3(11),
#else
  FF_TX_D_3_13 => txdata_ch3(9),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_14 => fpsc_vlo,
#elif _ch3_protocol_new == "PIPE"
  FF_TX_D_3_14 => TxData_ch3(10),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_TX_D_3_14 => txdata_ch3(12),
#else
  FF_TX_D_3_14 => txdata_ch3(10),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_15 => fpsc_vlo,
#elif _ch3_protocol_new == "PIPE"
  FF_TX_D_3_15 => TxData_ch3(11),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_TX_D_3_15 => txdata_ch3(13),
#else
  FF_TX_D_3_15 => txdata_ch3(11),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_16 => fpsc_vlo,
#elif _ch3_protocol_new == "PIPE"
  FF_TX_D_3_16 => TxData_ch3(12),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_TX_D_3_16 => txdata_ch3(14),
#else
  FF_TX_D_3_16 => txdata_ch3(12),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_17 => fpsc_vlo,
#elif _ch3_protocol_new == "PIPE"
  FF_TX_D_3_17 => TxData_ch3(13),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_TX_D_3_17 => txdata_ch3(15),
#else
  FF_TX_D_3_17 => txdata_ch3(13),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_18 => fpsc_vlo,
#elif _ch3_protocol_new == "PIPE"
  FF_TX_D_3_18 => TxData_ch3(14),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_TX_D_3_18 => txdata_ch3(16),
#else
  FF_TX_D_3_18 => txdata_ch3(14),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_19 => fpsc_vlo,
#elif _ch3_protocol_new == "PIPE"
  FF_TX_D_3_19 => TxData_ch3(15),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_TX_D_3_19 => txdata_ch3(17),
#else
  FF_TX_D_3_19 => txdata_ch3(15),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_protocol_new == "8BSER" || _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_20 => fpsc_vlo,
#elif _ch3_protocol_new == "PIPE"
  FF_TX_D_3_20 => TxDataK_ch3(1),
#elif _ch3_protocol_new == "XAUI"
  FF_TX_D_3_20 => txc_ch3(1),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_TX_D_3_20 => txdata_ch3(18),
#else
  FF_TX_D_3_20 => tx_k_ch3(1),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_protocol_new == "8BSER" || _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_21 => fpsc_vlo,
#elif _ch3_protocol_new == "PIPE" || _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "G8B10B" || _ch3_protocol_new == "PCIE" || _ch3_protocol_new == "OBSAI" || _ch3_protocol_new == "FC" || _ch3_protocol_new == "SATA" || _ch3_protocol_new == "DISP_PORT"
  FF_TX_D_3_21 => tx_force_disp_ch3(1),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_TX_D_3_21 => txdata_ch3(19),
#else
  FF_TX_D_3_21 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_protocol_new == "8BSER" || _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_22 => fpsc_vlo,
#elif _ch3_protocol_new == "PIPE" || _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "G8B10B" || _ch3_protocol_new == "PCIE" || _ch3_protocol_new == "OBSAI" || _ch3_protocol_new == "FC" || _ch3_protocol_new == "SATA" || _ch3_protocol_new == "DISP_PORT"
  FF_TX_D_3_22 => tx_disp_sel_ch3(1),
#elif _ch3_protocol_new == "GIGE" || _ch3_protocol_new == "SGMII" 
  FF_TX_D_3_22 => xmit_ch3(1),
#else
  FF_TX_D_3_22 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_protocol_new == "8BSER" || _ch3_tx_data_width == "8" || _ch3_tx_data_width == "10"
  FF_TX_D_3_23 => fpsc_vlo,
#elif _ch3_protocol_new == "FC" || _ch3_protocol_new == "GIGE" || _ch3_protocol_new == "SGMII" 
  FF_TX_D_3_23 => tx_disp_correct_ch3(1),
#elif _ch3_protocol_new == "PCIE" || _ch3_protocol_new == "PIPE"
  FF_TX_D_3_23 => pci_ei_en_ch3(1),
#else
  FF_TX_D_3_23 => fpsc_vlo,
#endif
#endif
#if _ch3_mode == "TXONLY"
  FF_RX_D_3_0 => open,
  FF_RX_D_3_1 => open,
  FF_RX_D_3_2 => open,
  FF_RX_D_3_3 => open,
  FF_RX_D_3_4 => open,
  FF_RX_D_3_5 => open,
  FF_RX_D_3_6 => open,
  FF_RX_D_3_7 => open,
  FF_RX_D_3_8 => open,
  FF_RX_D_3_9 => open,
  FF_RX_D_3_10 => open,
  FF_RX_D_3_11 => open,
  FF_RX_D_3_12 => open,
  FF_RX_D_3_13 => open,
  FF_RX_D_3_14 => open,
  FF_RX_D_3_15 => open,
  FF_RX_D_3_16 => open,
  FF_RX_D_3_17 => open,
  FF_RX_D_3_18 => open,
  FF_RX_D_3_19 => open,
  FF_RX_D_3_20 => open,
  FF_RX_D_3_21 => open,
  FF_RX_D_3_22 => open,
  FF_RX_D_3_23 => open,
#else
#if _ch3_protocol_new == "DISABLED"
  FF_RX_D_3_0 => open,
  FF_RX_D_3_1 => open,
  FF_RX_D_3_2 => open,
  FF_RX_D_3_3 => open,
  FF_RX_D_3_4 => open,
  FF_RX_D_3_5 => open,
  FF_RX_D_3_6 => open,
  FF_RX_D_3_7 => open,
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_0 => RxData_ch3(0),
  FF_RX_D_3_1 => RxData_ch3(1),
  FF_RX_D_3_2 => RxData_ch3(2),
  FF_RX_D_3_3 => RxData_ch3(3),
  FF_RX_D_3_4 => RxData_ch3(4),
  FF_RX_D_3_5 => RxData_ch3(5),
  FF_RX_D_3_6 => RxData_ch3(6),
  FF_RX_D_3_7 => RxData_ch3(7),
#else
  FF_RX_D_3_0 => rxdata_ch3(0),
  FF_RX_D_3_1 => rxdata_ch3(1),
  FF_RX_D_3_2 => rxdata_ch3(2),
  FF_RX_D_3_3 => rxdata_ch3(3),
  FF_RX_D_3_4 => rxdata_ch3(4),
  FF_RX_D_3_5 => rxdata_ch3(5),
  FF_RX_D_3_6 => rxdata_ch3(6),
  FF_RX_D_3_7 => rxdata_ch3(7),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_protocol_new == "8BSER"
  FF_RX_D_3_8 => open,
#elif _ch3_protocol_new == "PIPE"
#if _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_8 => RxDataK_ch3,
#else
  FF_RX_D_3_8 => RxDataK_ch3(0),
#endif
#elif _ch3_protocol_new == "XAUI"
#if _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_8 => rxc_ch3,
#else
  FF_RX_D_3_8 => rxc_ch3(0),
#endif
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_RX_D_3_8 => rxdata_ch3(8),
#else
#if _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_8 => rx_k_ch3,
#else
  FF_RX_D_3_8 => rx_k_ch3(0),
#endif
#endif
#if _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_RX_D_3_9 => rxdata_ch3(9),
#elif _ch3_protocol_new == "SATA" || _ch3_protocol_new == "DISP_PORT" || _ch3_protocol_new == "G8B10B" || _ch3_protocol_new == "GIGE" || _ch3_protocol_new == "SGMII" || _ch3_protocol_new == "XAUI" || _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "SRIO" || _ch3_protocol_new == "OBSAI" || _ch3_protocol_new == "FC"
#if _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_9 => rx_disp_err_ch3,
#else
  FF_RX_D_3_9 => rx_disp_err_ch3(0),
#endif
#elif _ch3_protocol_new == "PCIE" 
  FF_RX_D_3_9 => rxstatus0_ch3(0),
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_9 => RxStatus0_ch3(0),
#else
  FF_RX_D_3_9 => open,
#endif
#if _ch2_protocol_new == "SATA" || _ch2_protocol_new == "DISP_PORT" || _ch3_protocol_new == "G8B10B" || _ch3_protocol_new == "GIGE" || _ch3_protocol_new == "SGMII" || _ch3_protocol_new == "XAUI" || _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "SRIO" || _ch3_protocol_new == "OBSAI" || _ch3_protocol_new ==  "FC"
#if _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_10 => rx_cv_err_ch3,
#else
  FF_RX_D_3_10 => rx_cv_err_ch3(0),
#endif
#elif _ch3_protocol_new == "PCIE" 
  FF_RX_D_3_10 => rxstatus0_ch3(1),
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_10 => RxStatus0_ch3(1),
#else
  FF_RX_D_3_10 => open,
#endif
#if _ch3_protocol_new == "PCIE" 
  FF_RX_D_3_11 => rxstatus0_ch3(2),
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_11 => RxStatus0_ch3(2),
#else
  FF_RX_D_3_11 => open,
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_12 => open,
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_12 => RxData_ch3(8),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_RX_D_3_12 => rxdata_ch3(10),
#else
  FF_RX_D_3_12 => rxdata_ch3(8),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_13 => open,
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_13 => RxData_ch3(9),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_RX_D_3_13 => rxdata_ch3(11),
#else
  FF_RX_D_3_13 => rxdata_ch3(9),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_14 => open,
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_14 => RxData_ch3(10),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_RX_D_3_14 => rxdata_ch3(12),
#else
  FF_RX_D_3_14 => rxdata_ch3(10),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_15 => open,
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_15 => RxData_ch3(11),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_RX_D_3_15 => rxdata_ch3(13),
#else
  FF_RX_D_3_15 => rxdata_ch3(11),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_16 => open,
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_16 => RxData_ch3(12),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_RX_D_3_16 => rxdata_ch3(14),
#else
  FF_RX_D_3_16 => rxdata_ch3(12),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_17 => open,
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_17 => RxData_ch3(13),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_RX_D_3_17 => rxdata_ch3(15),
#else
  FF_RX_D_3_17 => rxdata_ch3(13),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_18 => open,
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_18 => RxData_ch3(14),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_RX_D_3_18 => rxdata_ch3(16),
#else
  FF_RX_D_3_18 => rxdata_ch3(14),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_19 => open,
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_19 => RxData_ch3(15),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_RX_D_3_19 => rxdata_ch3(17),
#else
  FF_RX_D_3_19 => rxdata_ch3(15),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_protocol_new == "8BSER" || _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_20 => open,
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_20 => RxDataK_ch3(1),
#elif _ch3_protocol_new == "XAUI"
  FF_RX_D_3_20 => rxc_ch3(1),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_RX_D_3_20 => rxdata_ch3(18),
#else
  FF_RX_D_3_20 => rx_k_ch3(1),
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_protocol_new == "8BSER" || _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_21 => open,
#elif _ch3_protocol_new == "SATA" || _ch3_protocol_new == "DISP_PORT" || _ch3_protocol_new == "G8B10B" || _ch3_protocol_new == "GIGE" || _ch3_protocol_new == "SGMII" || _ch3_protocol_new == "XAUI" || _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "SRIO" || _ch3_protocol_new == "OBSAI" || _ch3_protocol_new == "FC"
  FF_RX_D_3_21 => rx_disp_err_ch3(1),
#elif _ch3_protocol_new == "PCIE" 
  FF_RX_D_3_21 => rxstatus1_ch3(0),
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_21 => RxStatus1_ch3(0),
#elif _ch3_protocol_new == "10BSER" || _ch3_protocol_new == "SDI"
  FF_RX_D_3_21 => rxdata_ch3(19),
#else
  FF_RX_D_3_21 => open,
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_protocol_new == "8BSER" || _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_22 => open,
#elif _ch2_protocol_new == "SATA" || _ch2_protocol_new == "DISP_PORT" || _ch3_protocol_new == "G8B10B" || _ch3_protocol_new == "GIGE" || _ch3_protocol_new == "SGMII" || _ch3_protocol_new == "XAUI" || _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "SRIO" || _ch3_protocol_new == "OBSAI" || _ch3_protocol_new == "FC"
  FF_RX_D_3_22 => rx_cv_err_ch3(1),
#elif _ch3_protocol_new == "PCIE" 
  FF_RX_D_3_22 => rxstatus1_ch3(1),
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_22 => RxStatus1_ch3(1),
#else
  FF_RX_D_3_22 => open,
#endif
#if _ch3_protocol_new == "DISABLED" || _ch3_protocol_new == "8BSER" || _ch3_rx_data_width == "8" || _ch3_rx_data_width == "10"
  FF_RX_D_3_23 => open,
#elif _ch3_protocol_new == "PCIE" 
  FF_RX_D_3_23 => rxstatus1_ch3(2),
#elif _ch3_protocol_new == "PIPE"
  FF_RX_D_3_23 => RxStatus1_ch3(2),
#else
  FF_RX_D_3_23 => open,
#endif
#endif

#if _ch3_mode == "RXTX" || _ch3_mode == "RXONLY"
  FFC_RRST_3 => rx_serdes_rst_ch3_c,
#else
  FFC_RRST_3 => fpsc_vlo,
#endif
  FFC_SIGNAL_DETECT_3 => fpsc_vlo,
#if _ch3_protocol_new == "DISABLED"
  FFC_SB_PFIFO_LP_3 => fpsc_vlo,
  FFC_PFIFO_CLR_3 => fpsc_vlo,
#elif _ch3_protocol_new != "PIPE" && _ch3_mode == "RXTX" 
#if _ch3_lbtype == "DISABLED"
  FFC_SB_PFIFO_LP_3 => sb_felb_ch3_c,
  FFC_PFIFO_CLR_3 => sb_felb_rst_ch3_c,
#else
  FFC_SB_PFIFO_LP_3 => fpsc_vlo,
  FFC_PFIFO_CLR_3 => fpsc_vlo,
#endif
#else
  FFC_SB_PFIFO_LP_3 => fpsc_vlo,
  FFC_PFIFO_CLR_3 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "DISABLED"
  FFC_SB_INV_RX_3 => fpsc_vlo,
#elif _ch3_protocol_new != "PIPE" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY") && _ch3_ird == "ENABLED"
  FFC_SB_INV_RX_3 => rx_invert_ch3_c,
#else
  FFC_SB_INV_RX_3 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "PCIE" && _ch3_mode != "DISABLED"
  FFC_PCIE_CT_3 => pcie_ct_ch3_c,
  FFC_PCI_DET_EN_3 => pcie_det_en_ch3_c,
#else
  FFC_PCIE_CT_3 => fpsc_vlo,
  FFC_PCI_DET_EN_3 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "DISABLED"
  FFC_FB_LOOPBACK_3 => fpsc_vlo,
#elif _ch3_protocol_new != "PIPE" && _ch3_lbtype == "Loopback parallel data after PCS block" && _ch3_mode == "RXTX"
  FFC_FB_LOOPBACK_3 => fb_felb_ch3_c,
#else
  FFC_FB_LOOPBACK_3 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "DISABLED"
  FFC_ENABLE_CGALIGN_3 => fpsc_vlo,
#elif _ch3_protocol_new != "PIPE" && _ch3_ilsm == "DISABLED" && _ch3_rxwa == "ENABLED"
  FFC_ENABLE_CGALIGN_3 => word_align_en_ch3_c,
#else
  FFC_ENABLE_CGALIGN_3 => fpsc_vlo,
#endif
#if (_ch3_protocol_new == "SATA" || _ch3_protocol_new == "PCIE") && _ch3_mode != "DISABLED"
  FFC_EI_EN_3 => tx_idle_ch3_c,
#elif _ch3_teidle == "ENABLED"
#if _ch3_protocol_new == "SRIO" || _ch3_protocol_new == "G8B10B" || _ch3_protocol_new == "CPRI" || _ch3_protocol_new == "OBSAI" && (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY")
  FFC_EI_EN_3 => tx_idle_ch3_c,
#else
  FFC_EI_EN_3 => fpsc_vlo,
#endif
#else
  FFC_EI_EN_3 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "DISABLED"
  FFC_LANE_TX_RST_3 => fpsc_vlo,
  FFC_TXPWDNB_3 => fpsc_vlo,
#elif _ch3_protocol_new != "PIPE" && (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY")
#if _rst_gen == "DISABLED"
  FFC_LANE_TX_RST_3 => tx_pcs_rst_ch3_c,
#else
  FFC_LANE_TX_RST_3 => tx_pcs_rst_ch_c,
#endif
  FFC_TXPWDNB_3 => tx_pwrup_ch3_c,
#else
  FFC_LANE_TX_RST_3 => fpsc_vlo,
  FFC_TXPWDNB_3 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "DISABLED"
  FFC_LANE_RX_RST_3 => fpsc_vlo,
  FFC_RXPWDNB_3 => fpsc_vlo,
  FFS_RLOS_LO_3 => open,
  FFS_RLOS_HI_3 => open,
#elif _ch3_protocol_new != "PIPE" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
  FFC_LANE_RX_RST_3 => rx_pcs_rst_ch3_c,
  FFC_RXPWDNB_3 => rx_pwrup_ch3_c,
#if _los_threshold_mode3 == "LOS_E"
  FFS_RLOS_LO_3 => rx_los_low_ch3_sig,
  FFS_RLOS_HI_3 => open,
#elif _los_threshold_mode3 == "LOS_EA"
  FFS_RLOS_LO_3 => open,
  FFS_RLOS_HI_3 => rx_los_high_ch3_s,
#endif
#elif _ch3_protocol_new == "PIPE" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
  FFC_LANE_RX_RST_3 => fpsc_vlo,
  FFC_RXPWDNB_3 => fpsc_vlo,
  FFS_RLOS_LO_3 => open,
#if _los_threshold_mode3 == "LOS_EA"
  FFS_RLOS_HI_3 => RxElecIdle_ch3,
#else
  FFS_RLOS_HI_3 => open,
#endif
#else
  FFC_LANE_RX_RST_3 => fpsc_vlo,
  FFC_RXPWDNB_3 => fpsc_vlo,
  FFS_RLOS_LO_3 => open,
  FFS_RLOS_HI_3 => open,
#endif
#if _ch3_mode != "DISABLED" && (_ch3_protocol_new == "PIPE" || _ch3_protocol_new == "PCIE")
  FFS_PCIE_CON_3 => pcie_con_ch3_s,
  FFS_PCIE_DONE_3 => pcie_done_ch3_s,
#else
  FFS_PCIE_CON_3 => open,
  FFS_PCIE_DONE_3 => open,
#endif
#if _ch3_protocol_new == "DISABLED"
  FFS_LS_SYNC_STATUS_3 => open,
#elif _ch3_protocol_new != "PIPE" && _ch3_ilsm == "ENABLED" && _ch3_rxwa == "ENABLED" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
  FFS_LS_SYNC_STATUS_3 => lsm_status_ch3_s,
#else
  FFS_LS_SYNC_STATUS_3 => open,
#endif
#if _ch3_protocol_new == "DISABLED"
  FFS_CC_OVERRUN_3 => open,
  FFS_CC_UNDERRUN_3 => open,
  FFS_SKP_ADDED_3 => open,
  FFS_SKP_DELETED_3 => open,
#elif _ch3_protocol_new != "PIPE" && _ch3_ctc == "ENABLED" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
  FFS_CC_OVERRUN_3 => ctc_orun_ch3_s,
  FFS_CC_UNDERRUN_3 => ctc_urun_ch3_s,
  FFS_SKP_ADDED_3 => ctc_ins_ch3_s,
  FFS_SKP_DELETED_3 => ctc_del_ch3_s,
#else
  FFS_CC_OVERRUN_3 => open,
  FFS_CC_UNDERRUN_3 => open,
  FFS_SKP_ADDED_3 => open,
  FFS_SKP_DELETED_3 => open,
#endif
#if _ch3_protocol_new == "DISABLED"
  FFS_RLOL_3 => open,
#elif _ch3_protocol_new != "PIPE" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
  FFS_RLOL_3 => rx_cdr_lol_ch3_sig,
#else
  FFS_RLOL_3 => open,
#endif
  FFS_RXFBFIFO_ERROR_3 => open,
  FFS_TXFBFIFO_ERROR_3 => open,
#if _ch3_protocol_new == "DISABLED"
  LDR_CORE2TX_3 => fpsc_vlo,
  FFC_LDR_CORE2TX_EN_3 => fpsc_vlo,
#elif _ch3_protocol_new != "PIPE" && _ch3_ldr == "ENABLED" && (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY")
  LDR_CORE2TX_3 => txd_ldr_ch3,
  FFC_LDR_CORE2TX_EN_3 => txd_ldr_en_ch3_c,
#else
  LDR_CORE2TX_3 => fpsc_vlo,
  FFC_LDR_CORE2TX_EN_3 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "DISABLED"
  LDR_RX2CORE_3 => open,
#elif _ch3_protocol_new != "PIPE" && _ch3_ldr == "ENABLED" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
  LDR_RX2CORE_3 => rxd_ldr_ch3,
#else
  LDR_RX2CORE_3 => open,
#endif
#if _ch3_protocol_new == "DISABLED"
  FFS_CDR_TRAIN_DONE_3 => open,
#elif _ch3_protocol_new == "DISP_PORT" && _ch3_mode != "DISABLED"
  FFS_CDR_TRAIN_DONE_3 => rx_cdr_trained_ch3_s,
#else
  FFS_CDR_TRAIN_DONE_3 => open,
#endif
#if _ch3_mode != "DISABLED" && _ch3_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X" && _refclk_mult == "20X" && (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY")
  FFC_DIV11_MODE_TX_3 => tx_div11_mode_ch3_c,
#else
  FFC_DIV11_MODE_TX_3 => fpsc_vlo,
#endif
#if (_ch3_mode == "RXTX" || _ch3_mode == "TXONLY") && ((_ch3_protocol_new == "SDI" && _datarange == "HIGH" && _refclk_mult == "20X") || (_ch3_protocol_new == "G8B10B") || (_ch3_protocol_new == "CPRI" && (_datarange == "MED" || _datarange == "MEDHIGH")) || (_ch3_protocol_new == "OBSAI" && (_datarange == "MED" || _datarange == "HIGH")) || (_ch3_protocol_new == "SRIO" && _datarange == "MEDHIGH") || (_ch3_protocol_new == "SATA" && _datarange == "HIGH") || (_ch3_protocol_new == "FC" && _datarange == "MEDHIGH") || (_ch3_protocol_new == "10BSER") || (_ch3_protocol_new == "8BSER"))
  FFC_RATE_MODE_TX_3 => tx_div2_mode_ch3_c,
#else
  FFC_RATE_MODE_TX_3 => fpsc_vlo,
#endif
#if _ch3_protocol_new == "SDI" && _ch3_rx_datarange == "HIGH" && _refclk_mult == "20X" && (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY")
  FFC_DIV11_MODE_RX_3 => rx_div11_mode_ch3_c,
#else
  FFC_DIV11_MODE_RX_3 => fpsc_vlo,
#endif
#if (_ch3_mode == "RXTX" || _ch3_mode == "RXONLY") && ((_ch3_protocol_new == "SDI" && _ch3_rx_datarange == "HIGH" && _refclk_mult == "20X") || (_ch3_protocol_new == "G8B10B") || (_ch3_protocol_new == "CPRI" && (_ch3_rx_datarange == "MED" || _ch3_rx_datarange == "MEDHIGH")) || (_ch3_protocol_new == "OBSAI" && (_ch3_rx_datarange == "MED" || _ch3_rx_datarange == "HIGH")) || (_ch3_protocol_new == "SRIO" && _ch3_rx_datarange == "MEDHIGH") || (_ch3_protocol_new == "SATA" && _ch3_rx_datarange == "HIGH") || (_ch3_protocol_new == "FC" && _ch3_rx_datarange == "MEDHIGH") || (_ch3_protocol_new == "10BSER") || (_ch3_protocol_new == "8BSER"))
  FFC_RATE_MODE_RX_3 => rx_div2_mode_ch3_c,
#else
  FFC_RATE_MODE_RX_3 => fpsc_vlo,
#endif

----- Auxilliary ----
#if _sci_ports == "ENABLED"
  SCIWDATA7 => sci_wrdata(7),
  SCIWDATA6 => sci_wrdata(6),
  SCIWDATA5 => sci_wrdata(5),
  SCIWDATA4 => sci_wrdata(4),
  SCIWDATA3 => sci_wrdata(3),
  SCIWDATA2 => sci_wrdata(2),
  SCIWDATA1 => sci_wrdata(1),
  SCIWDATA0 => sci_wrdata(0),
  SCIADDR5 => sci_addr(5),
  SCIADDR4 => sci_addr(4),
  SCIADDR3 => sci_addr(3),
  SCIADDR2 => sci_addr(2),
  SCIADDR1 => sci_addr(1),
  SCIADDR0 => sci_addr(0),
  SCIRDATA7 => sci_rddata(7),
  SCIRDATA6 => sci_rddata(6),
  SCIRDATA5 => sci_rddata(5),
  SCIRDATA4 => sci_rddata(4),
  SCIRDATA3 => sci_rddata(3),
  SCIRDATA2 => sci_rddata(2),
  SCIRDATA1 => sci_rddata(1),
  SCIRDATA0 => sci_rddata(0),
  SCIENAUX => fpsc_vhi,
  SCISELAUX => sci_sel_quad,
  SCIRD => sci_rd,
  SCIWSTN => sci_wrn,
  CYAWSTN => fpsc_vlo,
#if _sci_int_port == "ENABLED"
  SCIINT => sci_int,
#else
  SCIINT => open,
#endif
#else
  SCIWDATA7 => fpsc_vlo,
  SCIWDATA6 => fpsc_vlo,
  SCIWDATA5 => fpsc_vlo,
  SCIWDATA4 => fpsc_vlo,
  SCIWDATA3 => fpsc_vlo,
  SCIWDATA2 => fpsc_vlo,
  SCIWDATA1 => fpsc_vlo,
  SCIWDATA0 => fpsc_vlo,
  SCIADDR5 => fpsc_vlo,
  SCIADDR4 => fpsc_vlo,
  SCIADDR3 => fpsc_vlo,
  SCIADDR2 => fpsc_vlo,
  SCIADDR1 => fpsc_vlo,
  SCIADDR0 => fpsc_vlo,
  SCIRDATA7 => open,
  SCIRDATA6 => open,
  SCIRDATA5 => open,
  SCIRDATA4 => open,
  SCIRDATA3 => open,
  SCIRDATA2 => open,
  SCIRDATA1 => open,
  SCIRDATA0 => open,
  SCIENAUX => fpsc_vlo,
  SCISELAUX => fpsc_vlo,
  SCIRD => fpsc_vlo,
  SCIWSTN => fpsc_vlo,
  CYAWSTN => fpsc_vlo,
  SCIINT => open,
#endif
#if _pll_txsrc == "REFCLK_CORE"
  FFC_CK_CORE_TX => fpga_txrefclk,
#else
  FFC_CK_CORE_TX => fpsc_vlo,
#endif
  FFC_MACRO_RST => serdes_rst_qd_c,
#if (_rst_gen == "ENABLED") 
#if _ch0_mode == "RXTX" || _ch0_mode == "TXONLY" || _ch1_mode == "RXTX" || _ch1_mode == "TXONLY" || _ch2_mode == "RXTX" || _ch2_mode == "TXONLY" || _ch3_mode == "RXTX" || _ch3_mode == "TXONLY"
  FFC_QUAD_RST => rst_qd_c,
#else
  FFC_QUAD_RST => fpsc_vlo,
#endif
#else
  FFC_QUAD_RST => rst_qd_c,
#endif
#if _ch0_mode == "RXTX" || _ch0_mode == "TXONLY" || _ch1_mode == "RXTX" || _ch1_mode == "TXONLY" || _ch2_mode == "RXTX" || _ch2_mode == "TXONLY" || _ch3_mode == "RXTX" || _ch3_mode == "TXONLY"
  FFC_TRST => tx_serdes_rst_c,
  FFS_PLOL => tx_pll_lol_qd_sig,
#else
  FFC_TRST => fpsc_vlo,
  FFS_PLOL => open,
#endif
#if (_ch0_mode != "DISABLED" && (_ch1_mode != "DISABLED" || _ch2_mode != "DISABLED" || _ch3_mode != "DISABLED")) || (_ch1_mode != "DISABLED" && (_ch0_mode != "DISABLED" || _ch2_mode != "DISABLED" || _ch3_mode != "DISABLED")) || (_ch2_mode != "DISABLED" && (_ch1_mode != "DISABLED" || _ch0_mode != "DISABLED" || _ch3_mode != "DISABLED")) || (_ch3_mode != "DISABLED" && (_ch1_mode != "DISABLED" || _ch2_mode != "DISABLED" || _ch0_mode != "DISABLED"))
  FFC_SYNC_TOGGLE => tx_sync_qd_c,
#else
  FFC_SYNC_TOGGLE => fpsc_vlo,
#endif
#if _refck2core == "ENABLED"
  REFCK2CORE => refclk2fpga_sig,
#else
  REFCK2CORE => refclk2fpga_sig,
#endif
  CIN0 => fpsc_vlo,
  CIN1 => fpsc_vlo,
  CIN2 => fpsc_vlo,
  CIN3 => fpsc_vlo,
  CIN4 => fpsc_vlo,
  CIN5 => fpsc_vlo,
  CIN6 => fpsc_vlo,
  CIN7 => fpsc_vlo,
  CIN8 => fpsc_vlo,
  CIN9 => fpsc_vlo,
  CIN10 => fpsc_vlo,
  CIN11 => fpsc_vlo,
  COUT0 => open,
  COUT1 => open,
  COUT2 => open,
  COUT3 => open,
  COUT4 => open,
  COUT5 => open,
  COUT6 => open,
  COUT7 => open,
  COUT8 => open,
  COUT9 => open,
  COUT10 => open,
  COUT11 => open,
  COUT12 => open,
  COUT13 => open,
  COUT14 => open,
  COUT15 => open,
  COUT16 => open,
  COUT17 => open,
  COUT18 => open,
  COUT19 => open,
  REFCLK_FROM_NQ => refclk_from_nq,
  REFCLK_TO_NQ => open);

#if (_rst_gen == "ENABLED" && (_ch0_mode != "TXONLY" || _ch1_mode != "TXONLY" || _ch2_mode != "TXONLY" || _ch3_mode != "TXONLY"))
-- reset sequence for rx
#if _ch0_mode == "RXONLY" || _ch0_mode == "RXTX"
                                                                                              
#if _ch0_pll_rxsrc == "REFCLK_CORE"
  P1 : PROCESS(fpga_rxrefclk_ch0, rst_n)
  BEGIN
     IF (rst_n = '0') THEN
         refclkdiv2_rx_ch0 <= '0';
     ELSIF (fpga_rxrefclk_ch0'event and fpga_rxrefclk_ch0 = '1') THEN 
         refclkdiv2_rx_ch0 <= not refclkdiv2_rx_ch0;
     END IF;
  END PROCESS;
#else
  P1 : PROCESS(refclk2fpga_sig, rst_n)
  BEGIN
     IF (rst_n = '0') THEN
         refclkdiv2_rx_ch0 <= '0';
     ELSIF (refclk2fpga_sig'event and refclk2fpga_sig = '1') THEN
         refclkdiv2_rx_ch0 <= not refclkdiv2_rx_ch0;
     END IF;
  END PROCESS;
#endif
                                                                                              
rx_reset_sm_ch0 : _rx_reset_sm_module 
--synopsys translate_off
  generic map (count_index => 4)
--synopsys translate_on
port map  (
#if _ch0_pll_rxsrc == "REFCLK_CORE"
  refclkdiv2 => refclkdiv2_rx_ch0,
#else
  refclkdiv2 => refclkdiv2_rx_ch0,
#endif
  rst_n => rst_n,
#if _ch0_rx_lol_port == "INTERNAL"
  rx_cdr_lol_ch_s => rx_cdr_lol_ch0_sig,
#else
  rx_cdr_lol_ch_s => ext_lol_in_ch0,  -- top port
#endif
  rx_los_low_ch_s => rx_los_low_ch0_sig,
#if _ch0_mode == "RXONLY"
  tx_pll_lol_qd_s => fpsc_vlo,
#else
  tx_pll_lol_qd_s => tx_pll_lol_qd_sig,
#endif
  rx_pcs_rst_ch_c => rx_pcs_rst_ch0_c,
  rx_serdes_rst_ch_c => rx_serdes_rst_ch0_c);
#endif
                                                                                              
#if _ch1_mode == "RXONLY" || _ch1_mode == "RXTX"
#if _ch1_pll_rxsrc == "REFCLK_CORE"
  P2 : PROCESS(fpga_rxrefclk_ch1, rst_n)
  BEGIN
     IF (rst_n = '0') THEN
         refclkdiv2_rx_ch1 <= '0';
     ELSIF (fpga_rxrefclk_ch1'event and fpga_rxrefclk_ch1 = '1') THEN
         refclkdiv2_rx_ch1 <= not refclkdiv2_rx_ch1;
     END IF;
  END PROCESS;
#else
  P2 : PROCESS(refclk2fpga_sig, rst_n)
  BEGIN
     IF (rst_n = '0') THEN
         refclkdiv2_rx_ch1 <= '0';
     ELSIF (refclk2fpga_sig'event and refclk2fpga_sig = '1') THEN
         refclkdiv2_rx_ch1 <= not refclkdiv2_rx_ch1;
     END IF;
  END PROCESS;
#endif
                                                                                              
rx_reset_sm_ch1 : _rx_reset_sm_module
--synopsys translate_off
  generic map (count_index => 4)
--synopsys translate_on
port map  (
#if _ch1_pll_rxsrc == "REFCLK_CORE"
  refclkdiv2 => refclkdiv2_rx_ch1,
#else
  refclkdiv2 => refclkdiv2_rx_ch1,
#endif
  rst_n => rst_n,
#if _ch1_rx_lol_port == "INTERNAL"
  rx_cdr_lol_ch_s => rx_cdr_lol_ch1_sig,
#else
  rx_cdr_lol_ch_s => ext_lol_in_ch1,  -- top port
#endif
  rx_los_low_ch_s => rx_los_low_ch1_sig,
#if _ch1_mode == "RXONLY"
  tx_pll_lol_qd_s => fpsc_vlo,
#else
  tx_pll_lol_qd_s => tx_pll_lol_qd_sig,
#endif
  rx_pcs_rst_ch_c => rx_pcs_rst_ch1_c,
  rx_serdes_rst_ch_c => rx_serdes_rst_ch1_c);
#endif
                                                                                              
#if _ch2_mode == "RXONLY" || _ch2_mode == "RXTX"
#if _ch2_pll_rxsrc == "REFCLK_CORE"
  P3 : PROCESS(fpga_rxrefclk_ch2, rst_n)
  BEGIN
     IF (rst_n = '0') THEN
         refclkdiv2_rx_ch2 <= '0';
     ELSIF (fpga_rxrefclk_ch2'event and fpga_rxrefclk_ch2 = '1') THEN
         refclkdiv2_rx_ch2 <= not refclkdiv2_rx_ch2;
     END IF;
  END PROCESS;
#else
  P3 : PROCESS(refclk2fpga_sig, rst_n)
  BEGIN
     IF (rst_n = '0') THEN
         refclkdiv2_rx_ch2 <= '0';
     ELSIF (refclk2fpga_sig'event and refclk2fpga_sig = '1') THEN
         refclkdiv2_rx_ch2 <= not refclkdiv2_rx_ch2;
     END IF;
  END PROCESS;
#endif

rx_reset_sm_ch2 : _rx_reset_sm_module
--synopsys translate_off
  generic map (count_index => 4)
--synopsys translate_on
port map  (
#if _ch2_pll_rxsrc == "REFCLK_CORE"
  refclkdiv2 => refclkdiv2_rx_ch2,
#else
  refclkdiv2 => refclkdiv2_rx_ch2,
#endif
  rst_n => rst_n,
#if _ch2_rx_lol_port == "INTERNAL"
  rx_cdr_lol_ch_s => rx_cdr_lol_ch2_sig,
#else
  rx_cdr_lol_ch_s => ext_lol_in_ch2,  -- top port
#endif
  rx_los_low_ch_s => rx_los_low_ch2_sig,
#if _ch2_mode == "RXONLY"
  tx_pll_lol_qd_s => fpsc_vlo,
#else
  tx_pll_lol_qd_s => tx_pll_lol_qd_sig,
#endif
  rx_pcs_rst_ch_c => rx_pcs_rst_ch2_c,
  rx_serdes_rst_ch_c => rx_serdes_rst_ch2_c);
#endif
                                                                                              
#if _ch3_mode == "RXONLY" || _ch3_mode == "RXTX"
#if _ch3_pll_rxsrc == "REFCLK_CORE"
  P4 : PROCESS(fpga_rxrefclk_ch3, rst_n)
  BEGIN
     IF (rst_n = '0') THEN
         refclkdiv2_rx_ch3 <= '0';
     ELSIF (fpga_rxrefclk_ch3'event and fpga_rxrefclk_ch3 = '1') THEN
         refclkdiv2_rx_ch3 <= not refclkdiv2_rx_ch3;
     END IF;
  END PROCESS;
#else
  P4 : PROCESS(refclk2fpga_sig, rst_n)
  BEGIN
     IF (rst_n = '0') THEN
         refclkdiv2_rx_ch3 <= '0';
     ELSIF (refclk2fpga_sig'event and refclk2fpga_sig = '1') THEN
         refclkdiv2_rx_ch3 <= not refclkdiv2_rx_ch3;
     END IF;
  END PROCESS;
#endif
                                                                                              
rx_reset_sm_ch3 : _rx_reset_sm_module
--synopsys translate_off
  generic map (count_index => 4)
--synopsys translate_on
port map  (
#if _ch3_pll_rxsrc == "REFCLK_CORE"
  refclkdiv2 => refclkdiv2_rx_ch3,
#else
  refclkdiv2 => refclkdiv2_rx_ch3,
#endif
  rst_n => rst_n,
#if _ch3_rx_lol_port == "INTERNAL"
  rx_cdr_lol_ch_s => rx_cdr_lol_ch3_sig,
#else
  rx_cdr_lol_ch_s => ext_lol_in_ch3,  -- top port
#endif
  rx_los_low_ch_s => rx_los_low_ch3_sig,
#if _ch3_mode == "RXONLY"
  tx_pll_lol_qd_s => fpsc_vlo,
#else
  tx_pll_lol_qd_s => tx_pll_lol_qd_sig,
#endif
  rx_pcs_rst_ch_c => rx_pcs_rst_ch3_c,
  rx_serdes_rst_ch_c => rx_serdes_rst_ch3_c);
#endif
#endif
                                                                                              
#if (_rst_gen == "ENABLED" && (_ch0_mode != "RXONLY" || _ch1_mode != "RXONLY" || _ch2_mode != "RXONLY" || _ch3_mode != "RXONLY"))
                                                                                              
#if _ch0_mode == "TXONLY" || _ch0_mode == "RXTX" || _ch1_mode == "TXONLY" || _ch1_mode == "RXTX" || _ch2_mode == "TXONLY" || _ch2_mode == "RXTX" || _ch3_mode == "TXONLY" || _ch3_mode == "RXTX"
#if _pll_txsrc == "REFCLK_CORE"
  P5 : PROCESS(fpga_txrefclk, rst_n)
  BEGIN
     IF (rst_n = '0') THEN
         refclkdiv2_tx_ch <= '0';
     ELSIF (fpga_txrefclk'event and fpga_txrefclk = '1') THEN
         refclkdiv2_tx_ch <= not refclkdiv2_tx_ch;
     END IF;
  END PROCESS;
#else
  P5 : PROCESS(refclk2fpga_sig, rst_n)
  BEGIN
     IF (rst_n = '0') THEN
         refclkdiv2_tx_ch <= '0';
     ELSIF (refclk2fpga_sig'event and refclk2fpga_sig = '1') THEN
         refclkdiv2_tx_ch <= not refclkdiv2_tx_ch;
     END IF;
  END PROCESS;
#endif

-- reset sequence for tx
tx_reset_sm_ch : _tx_reset_sm_module 
--synopsys translate_off
  generic map (count_index => 4)
--synopsys translate_on
port map  (
  rst_n => rst_n,
#if _pll_txsrc == "REFCLK_CORE" 
  refclkdiv2 => refclkdiv2_tx_ch,
#else
  refclkdiv2 => refclkdiv2_tx_ch,
#endif
  tx_pll_lol_qd_s => tx_pll_lol_qd_sig,
  rst_qd_c => rst_qd_c,
  tx_pcs_rst_ch_c => tx_pcs_rst_ch_c
  );
#endif
#endif
                                                                                              
                                                                                              
--synopsys translate_off
file_read : PROCESS
VARIABLE open_status : file_open_status;
FILE config : text;
BEGIN
   file_open (open_status, config, USER_CONFIG_FILE, read_mode);
   IF (open_status = name_error) THEN
      report "Auto configuration file for PCS module not found.  PCS internal configuration registers will not be initialized correctly during simulation!"
      severity ERROR;
   END IF;
   wait;
END PROCESS;
--synopsys translate_on
end _circuit_name##_arch ;
#include <pcs/pcsd.tft>

