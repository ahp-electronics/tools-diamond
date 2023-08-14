#log _circuit_name.vhd

#define -r SLASH2 --
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
#macro converter1(arg1,arg2)
#define arg2 arg1##.txt
#endmacro
#converter1(_circuit_name, _circuit_name_new)
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

--synopsys translate_off

library pcsc_work;
use pcsc_work.all;
library IEEE;
use IEEE.std_logic_1164.all;

entity PCSC is
GENERIC(
  CONFIG_FILE : String
--  CONFIG_FILE : String  := #_circuit_name_new
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
  FFC_CK_CORE_RX             : in std_logic;
  FFC_CK_CORE_TX             : in std_logic;
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
  FFC_TRST             : in std_logic;
  FFC_TXPWDNB_0             : in std_logic;
  FFC_TXPWDNB_1             : in std_logic;
  FFC_TXPWDNB_2             : in std_logic;
  FFC_TXPWDNB_3             : in std_logic;
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
  SCIRD             : in std_logic;
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
  SCIWSTN             : in std_logic;
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
  FF_RX_Q_CLK_0             : out std_logic;
  FF_RX_Q_CLK_1             : out std_logic;
  FF_RX_Q_CLK_2             : out std_logic;
  FF_RX_Q_CLK_3             : out std_logic;
  FF_TX_F_CLK             : out std_logic;
  FF_TX_H_CLK             : out std_logic;
  FF_TX_Q_CLK             : out std_logic;
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
  FFS_PCIE_CON_0             : out std_logic;
  FFS_PCIE_CON_1             : out std_logic;
  FFS_PCIE_CON_2             : out std_logic;
  FFS_PCIE_CON_3             : out std_logic;
  FFS_PCIE_DONE_0             : out std_logic;
  FFS_PCIE_DONE_1             : out std_logic;
  FFS_PCIE_DONE_2             : out std_logic;
  FFS_PCIE_DONE_3             : out std_logic;
  FFS_RLOS_LO_0             : out std_logic;
  FFS_RLOS_LO_1             : out std_logic;
  FFS_RLOS_LO_2             : out std_logic;
  FFS_RLOS_LO_3             : out std_logic;
  OOB_OUT_0             : out std_logic;
  OOB_OUT_1             : out std_logic;
  OOB_OUT_2             : out std_logic;
  OOB_OUT_3             : out std_logic;
  REFCK2CORE             : out std_logic;
  SCIINT             : out std_logic;
  SCIRDATA0             : out std_logic;
  SCIRDATA1             : out std_logic;
  SCIRDATA2             : out std_logic;
  SCIRDATA3             : out std_logic;
  SCIRDATA4             : out std_logic;
  SCIRDATA5             : out std_logic;
  SCIRDATA6             : out std_logic;
  SCIRDATA7             : out std_logic;
  FFS_PLOL             : out std_logic;
  FFS_RLOL_0             : out std_logic;
  FFS_RLOL_1             : out std_logic;
  FFS_RLOL_2             : out std_logic;
  FFS_RLOL_3             : out std_logic;
  FFS_RXFBFIFO_ERROR_0             : out std_logic;
  FFS_RXFBFIFO_ERROR_1             : out std_logic;
  FFS_RXFBFIFO_ERROR_2             : out std_logic;
  FFS_RXFBFIFO_ERROR_3             : out std_logic;
  FFS_TXFBFIFO_ERROR_0             : out std_logic;
  FFS_TXFBFIFO_ERROR_1             : out std_logic;
  FFS_TXFBFIFO_ERROR_2             : out std_logic;
  FFS_TXFBFIFO_ERROR_3             : out std_logic
);

end PCSC;

architecture PCSC_arch of PCSC is

component PCSC_sim
GENERIC(
  CONFIG_FILE : String
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
  FFC_CK_CORE_RX             : in std_logic;
  FFC_CK_CORE_TX             : in std_logic;
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
  FFC_TRST             : in std_logic;
  FFC_TXPWDNB_0             : in std_logic;
  FFC_TXPWDNB_1             : in std_logic;
  FFC_TXPWDNB_2             : in std_logic;
  FFC_TXPWDNB_3             : in std_logic;
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
  SCIRD             : in std_logic;
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
  SCIWSTN             : in std_logic;
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
  FF_RX_Q_CLK_0             : out std_logic;
  FF_RX_Q_CLK_1             : out std_logic;
  FF_RX_Q_CLK_2             : out std_logic;
  FF_RX_Q_CLK_3             : out std_logic;
  FF_TX_F_CLK             : out std_logic;
  FF_TX_H_CLK             : out std_logic;
  FF_TX_Q_CLK             : out std_logic;
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
  FFS_PCIE_CON_0             : out std_logic;
  FFS_PCIE_CON_1             : out std_logic;
  FFS_PCIE_CON_2             : out std_logic;
  FFS_PCIE_CON_3             : out std_logic;
  FFS_PCIE_DONE_0             : out std_logic;
  FFS_PCIE_DONE_1             : out std_logic;
  FFS_PCIE_DONE_2             : out std_logic;
  FFS_PCIE_DONE_3             : out std_logic;
  FFS_RLOS_LO_0             : out std_logic;
  FFS_RLOS_LO_1             : out std_logic;
  FFS_RLOS_LO_2             : out std_logic;
  FFS_RLOS_LO_3             : out std_logic;
  OOB_OUT_0             : out std_logic;
  OOB_OUT_1             : out std_logic;
  OOB_OUT_2             : out std_logic;
  OOB_OUT_3             : out std_logic;
  REFCK2CORE             : out std_logic;
  SCIINT             : out std_logic;
  SCIRDATA0             : out std_logic;
  SCIRDATA1             : out std_logic;
  SCIRDATA2             : out std_logic;
  SCIRDATA3             : out std_logic;
  SCIRDATA4             : out std_logic;
  SCIRDATA5             : out std_logic;
  SCIRDATA6             : out std_logic;
  SCIRDATA7             : out std_logic;
  FFS_PLOL             : out std_logic;
  FFS_RLOL_0             : out std_logic;
  FFS_RLOL_1             : out std_logic;
  FFS_RLOL_2             : out std_logic;
  FFS_RLOL_3             : out std_logic;
  FFS_RXFBFIFO_ERROR_0             : out std_logic;
  FFS_RXFBFIFO_ERROR_1             : out std_logic;
  FFS_RXFBFIFO_ERROR_2             : out std_logic;
  FFS_RXFBFIFO_ERROR_3             : out std_logic;
  FFS_TXFBFIFO_ERROR_0             : out std_logic;
  FFS_TXFBFIFO_ERROR_1             : out std_logic;
  FFS_TXFBFIFO_ERROR_2             : out std_logic;
  FFS_TXFBFIFO_ERROR_3             : out std_logic
);
end component;

begin

PCSC_sim_inst : PCSC_sim
generic map (
  CONFIG_FILE => CONFIG_FILE)
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
  FFC_CK_CORE_RX => FFC_CK_CORE_RX,
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
  FFC_TRST => FFC_TRST,
  FFC_TXPWDNB_0 => FFC_TXPWDNB_0,
  FFC_TXPWDNB_1 => FFC_TXPWDNB_1,
  FFC_TXPWDNB_2 => FFC_TXPWDNB_2,
  FFC_TXPWDNB_3 => FFC_TXPWDNB_3,
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
  FF_RX_Q_CLK_0 => FF_RX_Q_CLK_0,
  FF_RX_Q_CLK_1 => FF_RX_Q_CLK_1,
  FF_RX_Q_CLK_2 => FF_RX_Q_CLK_2,
  FF_RX_Q_CLK_3 => FF_RX_Q_CLK_3,
  FF_TX_F_CLK => FF_TX_F_CLK,
  FF_TX_H_CLK => FF_TX_H_CLK,
  FF_TX_Q_CLK => FF_TX_Q_CLK,
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
  FFS_PCIE_CON_0 => FFS_PCIE_CON_0,
  FFS_PCIE_CON_1 => FFS_PCIE_CON_1,
  FFS_PCIE_CON_2 => FFS_PCIE_CON_2,
  FFS_PCIE_CON_3 => FFS_PCIE_CON_3,
  FFS_PCIE_DONE_0 => FFS_PCIE_DONE_0,
  FFS_PCIE_DONE_1 => FFS_PCIE_DONE_1,
  FFS_PCIE_DONE_2 => FFS_PCIE_DONE_2,
  FFS_PCIE_DONE_3 => FFS_PCIE_DONE_3,
  FFS_RLOS_LO_0 => FFS_RLOS_LO_0,
  FFS_RLOS_LO_1 => FFS_RLOS_LO_1,
  FFS_RLOS_LO_2 => FFS_RLOS_LO_2,
  FFS_RLOS_LO_3 => FFS_RLOS_LO_3,
  FFS_PLOL => FFS_PLOL,
  FFS_RLOL_0 => FFS_RLOL_0,
  FFS_RLOL_1 => FFS_RLOL_1,
  FFS_RLOL_2 => FFS_RLOL_2,
  FFS_RLOL_3 => FFS_RLOL_3,
  FFS_RXFBFIFO_ERROR_0 => FFS_RXFBFIFO_ERROR_0,
  FFS_RXFBFIFO_ERROR_1 => FFS_RXFBFIFO_ERROR_1,
  FFS_RXFBFIFO_ERROR_2 => FFS_RXFBFIFO_ERROR_2,
  FFS_RXFBFIFO_ERROR_3 => FFS_RXFBFIFO_ERROR_3,
  FFS_TXFBFIFO_ERROR_0 => FFS_TXFBFIFO_ERROR_0,
  FFS_TXFBFIFO_ERROR_1 => FFS_TXFBFIFO_ERROR_1,
  FFS_TXFBFIFO_ERROR_2 => FFS_TXFBFIFO_ERROR_2,
  FFS_TXFBFIFO_ERROR_3 => FFS_TXFBFIFO_ERROR_3,
  OOB_OUT_0 => OOB_OUT_0,
  OOB_OUT_1 => OOB_OUT_1,
  OOB_OUT_2 => OOB_OUT_2,
  OOB_OUT_3 => OOB_OUT_3,
  REFCK2CORE => REFCK2CORE,
  SCIINT => SCIINT,
  SCIRDATA0 => SCIRDATA0,
  SCIRDATA1 => SCIRDATA1,
  SCIRDATA2 => SCIRDATA2,
  SCIRDATA3 => SCIRDATA3,
  SCIRDATA4 => SCIRDATA4,
  SCIRDATA5 => SCIRDATA5,
  SCIRDATA6 => SCIRDATA6,
  SCIRDATA7 => SCIRDATA7
   );

end PCSC_arch;

--synopsys translate_on

--synopsys translate_off
library ECP2;
use ECP2.components.all;
--synopsys translate_on

library IEEE, STD;
use IEEE.std_logic_1164.all;
use STD.TEXTIO.all;

entity _circuit_name is
   GENERIC (USER_CONFIG_FILE    :  String := #_circuit_name_new);
 port (
#if _pll_txsrc == "CORE_TXREFCLK"
   core_txrefclk : in std_logic;
#endif
#if _protocol_mode == "Quad Based Protocol Mode"
#if _pll_rxsrc == "CORE_RXREFCLK"
   core_rxrefclk : in std_logic;
#endif
#if _pll_txsrc == "REFCLK" || _pll_rxsrc == "REFCLK"
   refclkp, refclkn : in std_logic;
#endif
#elif _protocol_mode == "Channel Based Protocol Mode"
#if _ch0_pll_rxsrc == "CORE_RXREFCLK" || _ch1_pll_rxsrc == "CORE_RXREFCLK" || _ch2_pll_rxsrc == "CORE_RXREFCLK" || _ch3_pll_rxsrc == "CORE_RXREFCLK"
   core_rxrefclk : in std_logic;
#endif
#if _pll_txsrc == "REFCLK" || _ch0_pll_rxsrc == "REFCLK" || _ch1_pll_rxsrc == "REFCLK" || _ch2_pll_rxsrc == "REFCLK" || _ch3_pll_rxsrc == "REFCLK"
   refclkp, refclkn : in std_logic;
#endif
#endif
#if _ch0_mode != "DISABLE"
#if _sci_ports == "TRUE"
   scisel_ch0, scien_ch0 : in std_logic;
#endif
   hdinp0, hdinn0 : in std_logic;
   hdoutp0, hdoutn0 : out std_logic;
   ff_rxiclk_ch0, ff_txiclk_ch0, ff_ebrd_clk_0 : in std_logic;
#if _pllqclkports == "TRUE"
   ff_rxqtrclk_ch0 : out std_logic;
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
   ff_txdata_ch0 : in std_logic_vector (9 downto 0);
   ff_rxdata_ch0 : out std_logic_vector (9 downto 0);
#elif _protocol == "USERDEF"
   ff_txdata_ch0 : in std_logic_vector (11 downto 0);
   ff_rxdata_ch0 : out std_logic_vector (11 downto 0);
#elif _protocol == "PIPE"
   TxData_ch0    : in std_logic_vector (7 downto 0);
   RxData_ch0    : out std_logic_vector (7 downto 0);
#else
   ff_txdata_ch0 : in std_logic_vector (7 downto 0);
   ff_rxdata_ch0 : out std_logic_vector (7 downto 0);
#endif
#elif _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
   ff_txdata_ch0 : in std_logic_vector (19 downto 0);
   ff_rxdata_ch0 : out std_logic_vector (19 downto 0);
#elif _protocol == "USERDEF"
   ff_txdata_ch0 : in std_logic_vector (23 downto 0);
   ff_rxdata_ch0 : out std_logic_vector (23 downto 0);
#elif _protocol == "PIPE"
   TxData_ch0    : in std_logic_vector (15 downto 0);
   RxData_ch0    : out std_logic_vector (15 downto 0);
#else
   ff_txdata_ch0 : in std_logic_vector (15 downto 0);
   ff_rxdata_ch0 : out std_logic_vector (15 downto 0);
#endif
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   ff_tx_k_cntrl_ch0 : in std_logic;
   ff_rx_k_cntrl_ch0 : out std_logic;
#else
   ff_tx_k_cntrl_ch0 : in std_logic_vector (1 downto 0);
   ff_rx_k_cntrl_ch0 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "XAUI"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   ff_txc_ch0 : in std_logic;
   ff_rxc_ch0 : out std_logic;
#else
   ff_txc_ch0 : in std_logic_vector (1 downto 0);
   ff_rxc_ch0 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "PIPE"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   TxDataK_ch0 : in std_logic;
   RxDataK_ch0 : out std_logic;
#else
   TxDataK_ch0 : in std_logic_vector (1 downto 0);
   RxDataK_ch0 : out std_logic_vector (1 downto 0);
#endif
#endif
   ff_rxfullclk_ch0 : out std_logic;
#if _data_width_ch0 == "16" || _data_width_ch0 == "20" && _ch0_ctc_byp == "BYPASS"
   ff_rxhalfclk_ch0 : out std_logic;
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   ff_force_disp_ch0 : in std_logic;
#else
   ff_force_disp_ch0 : in std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   ff_xmit_ch0 : in std_logic;
#else
   ff_xmit_ch0 : in std_logic_vector (1 downto 0);
#endif
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   ff_disp_sel_ch0 : in std_logic;
#else
   ff_disp_sel_ch0 : in std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "PCIE" || _protocol == "PIPE"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   ff_pci_ei_en_ch0 : in std_logic;
#else
   ff_pci_ei_en_ch0 : in std_logic_vector (1 downto 0);
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   ff_correct_disp_ch0 : in std_logic;
#else
   ff_correct_disp_ch0 : in std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   ff_rxstatus0_ch0, ff_rxstatus1_ch0 : out std_logic;
#else
   ff_rxstatus0_ch0, ff_rxstatus1_ch0 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "SATA_I" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "XAUI" || _protocol == "GIGE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "OBSAI" || _protocol == "G8B10B"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   ff_disp_err_ch0, ff_cv_ch0 : out std_logic;
#else
   ff_disp_err_ch0, ff_cv_ch0 : out std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   ff_rxstatus2_ch0 : out std_logic;
#else
   ff_rxstatus2_ch0 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   ff_rx_even_ch0 : out std_logic;
#else
   ff_rx_even_ch0 : out std_logic_vector (1 downto 0);
#endif
#endif
   ffc_rrst_ch0 : in std_logic;
#if _ch0_elsm == "TRUE"
   ffc_signal_detect_ch0 : in std_logic;
   ffc_enable_cgalign_ch0 : in std_logic;
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
   ffc_pfifo_clr_ch0 : in std_logic;
#endif
#endif
#if _ch0_ird == "TRUE" && _protocol != "PIPE"
   ffc_sb_inv_rx_ch0 : in std_logic;
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
   ffc_pcie_ct_ch0 : in std_logic;
   ffc_pci_det_en_ch0 : in std_logic;
   ffs_pcie_done_ch0 : out std_logic;
   ffs_pcie_con_ch0 : out std_logic;
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch0_teidle == "TRUE")
   ffc_ei_en_ch0 : in std_logic;
#endif
   ffc_lane_tx_rst_ch0 : in std_logic;
   ffc_lane_rx_rst_ch0 : in std_logic;
   ffc_txpwdnb_ch0 : in std_logic;
   ffc_rxpwdnb_ch0 : in std_logic;
#if _protocol == "SATA_I"
   ffs_sata_oob_rx_ch0 : out std_logic;
#elif _protocol != "PIPE"
   ffs_rlos_lo_ch0 : out std_logic;
#endif
#if _protocol != "8BSER"
#if _comma_align == "AUTO"
   ffs_ls_sync_status_ch0 : out std_logic;
#endif
#endif
#if _errsports == "TRUE"
   ffs_cc_underrun_ch0 : out std_logic;
   ffs_cc_overrun_ch0 : out std_logic;
   ffs_txfbfifo_error_ch0 : out std_logic;
   ffs_rxfbfifo_error_ch0 : out std_logic;
#endif
   ffs_rlol_ch0 : out std_logic;
   oob_out_ch0 : out std_logic;
#if _protocol == "PIPE"
   TxCompliance_ch0 : in std_logic;
   TxElecIdle_ch0 : in std_logic;
   RxPolarity_ch0 : in std_logic;
   RxValid_ch0 : out std_logic;
   RxElecIdle_ch0 : out std_logic;
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   RxStatus0_ch0 : out std_logic_vector (2 downto 0);
#else
   RxStatus0_ch0 : out std_logic_vector (2 downto 0);
   RxStatus1_ch0 : out std_logic_vector (2 downto 0);
#endif
#endif
#endif
#if _ch1_mode != "DISABLE"
#if _sci_ports == "TRUE"
   scisel_ch1, scien_ch1 : in std_logic;
#endif
   hdinp1, hdinn1 : in std_logic;
   hdoutp1, hdoutn1 : out std_logic;
   ff_rxiclk_ch1, ff_txiclk_ch1, ff_ebrd_clk_1 : in std_logic;
#if _pllqclkports == "TRUE"
   ff_rxqtrclk_ch1 : out std_logic;
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
   ff_txdata_ch1 : in std_logic_vector (9 downto 0);
   ff_rxdata_ch1 : out std_logic_vector (9 downto 0);
#elif _protocol == "USERDEF"
   ff_txdata_ch1 : in std_logic_vector (11 downto 0);
   ff_rxdata_ch1 : out std_logic_vector (11 downto 0);
#elif _protocol == "PIPE"
   TxData_ch1    : in std_logic_vector (7 downto 0);
   RxData_ch1    : out std_logic_vector (7 downto 0);
#else
   ff_txdata_ch1 : in std_logic_vector (7 downto 0);
   ff_rxdata_ch1 : out std_logic_vector (7 downto 0);
#endif
#elif _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
   ff_txdata_ch1 : in std_logic_vector (19 downto 0);
   ff_rxdata_ch1 : out std_logic_vector (19 downto 0);
#elif _protocol == "USERDEF"
   ff_txdata_ch1 : in std_logic_vector (23 downto 0);
   ff_rxdata_ch1 : out std_logic_vector (23 downto 0);
#elif _protocol == "PIPE"
   TxData_ch1    : in std_logic_vector (15 downto 0);
   RxData_ch1    : out std_logic_vector (15 downto 0);
#else
   ff_txdata_ch1 : in std_logic_vector (15 downto 0);
   ff_rxdata_ch1 : out std_logic_vector (15 downto 0);
#endif
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
   ff_tx_k_cntrl_ch1 : in std_logic;
   ff_rx_k_cntrl_ch1 : out std_logic;
#else
   ff_tx_k_cntrl_ch1 : in std_logic_vector (1 downto 0);
   ff_rx_k_cntrl_ch1 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "XAUI"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
   ff_txc_ch1 : in std_logic;
   ff_rxc_ch1 : out std_logic;
#else
   ff_txc_ch1 : in std_logic_vector (1 downto 0);
   ff_rxc_ch1 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "PIPE"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
   TxDataK_ch1 : in std_logic;
   RxDataK_ch1 : out std_logic;
#else
   TxDataK_ch1 : in std_logic_vector (1 downto 0);
   RxDataK_ch1 : out std_logic_vector (1 downto 0);
#endif
#endif
   ff_rxfullclk_ch1 : out std_logic;
#if _data_width_ch1 == "16" || _data_width_ch1 == "20" && _ch1_ctc_byp == "BYPASS"
   ff_rxhalfclk_ch1 : out std_logic;
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
   ff_force_disp_ch1 : in std_logic;
#else
   ff_force_disp_ch1 : in std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
   ff_xmit_ch1 : in std_logic;
#else
   ff_xmit_ch1 : in std_logic_vector (1 downto 0);
#endif
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
   ff_disp_sel_ch1 : in std_logic;
#else
   ff_disp_sel_ch1 : in std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "PCIE" || _protocol == "PIPE"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
   ff_pci_ei_en_ch1 : in std_logic;
#else
   ff_pci_ei_en_ch1 : in std_logic_vector (1 downto 0);
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
   ff_correct_disp_ch1 : in std_logic;
#else
   ff_correct_disp_ch1 : in std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
   ff_rxstatus0_ch1, ff_rxstatus1_ch1 : out std_logic;
#else
   ff_rxstatus0_ch1, ff_rxstatus1_ch1 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "SATA_I" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "XAUI" || _protocol == "GIGE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "OBSAI" || _protocol == "G8B10B"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
   ff_disp_err_ch1, ff_cv_ch1 : out std_logic;
#else
   ff_disp_err_ch1, ff_cv_ch1 : out std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
   ff_rxstatus2_ch1 : out std_logic;
#else
   ff_rxstatus2_ch1 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
   ff_rx_even_ch1 : out std_logic;
#else
   ff_rx_even_ch1 : out std_logic_vector (1 downto 0);
#endif
#endif
   ffc_rrst_ch1 : in std_logic;
#if _ch1_elsm == "TRUE"
   ffc_signal_detect_ch1 : in std_logic;
   ffc_enable_cgalign_ch1 : in std_logic;
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
   ffc_pfifo_clr_ch1 : in std_logic;
#endif
#endif
#if _ch1_ird == "TRUE" && _protocol != "PIPE"
   ffc_sb_inv_rx_ch1 : in std_logic;
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
   ffc_pcie_ct_ch1 : in std_logic;
   ffc_pci_det_en_ch1 : in std_logic;
   ffs_pcie_done_ch1 : out std_logic;
   ffs_pcie_con_ch1 : out std_logic;
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch1_teidle == "TRUE")
   ffc_ei_en_ch1 : in std_logic;
#endif
   ffc_lane_tx_rst_ch1 : in std_logic;
   ffc_lane_rx_rst_ch1 : in std_logic;
   ffc_txpwdnb_ch1 : in std_logic;
   ffc_rxpwdnb_ch1 : in std_logic;
#if _protocol == "SATA_I"
   ffs_sata_oob_rx_ch1 : out std_logic;
#elif _protocol != "PIPE"
   ffs_rlos_lo_ch1 : out std_logic;
#endif
#if _protocol != "8BSER"
#if _comma_align == "AUTO"
   ffs_ls_sync_status_ch1 : out std_logic;
#endif
#endif
#if _errsports == "TRUE"
   ffs_cc_underrun_ch1 : out std_logic;
   ffs_cc_overrun_ch1 : out std_logic;
   ffs_txfbfifo_error_ch1 : out std_logic;
   ffs_rxfbfifo_error_ch1 : out std_logic;
#endif
   ffs_rlol_ch1 : out std_logic;
   oob_out_ch1 : out std_logic;
#if _protocol == "PIPE"
   TxCompliance_ch1 : in std_logic;
   TxElecIdle_ch1 : in std_logic;
   RxPolarity_ch1 : in std_logic;
   RxValid_ch1 : out std_logic;
   RxElecIdle_ch1 : out std_logic;
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   RxStatus0_ch1 : out std_logic_vector (2 downto 0);
#else
   RxStatus0_ch1 : out std_logic_vector (2 downto 0);
   RxStatus1_ch1 : out std_logic_vector (2 downto 0);
#endif
#endif
#endif
#if _ch2_mode != "DISABLE"
#if _sci_ports == "TRUE"
   scisel_ch2, scien_ch2 : in std_logic;
#endif
   hdinp2, hdinn2 : in std_logic;
   hdoutp2, hdoutn2 : out std_logic;
   ff_rxiclk_ch2, ff_txiclk_ch2, ff_ebrd_clk_2 : in std_logic;
#if _pllqclkports == "TRUE"
   ff_rxqtrclk_ch2 : out std_logic;
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
   ff_txdata_ch2 : in std_logic_vector (9 downto 0);
   ff_rxdata_ch2 : out std_logic_vector (9 downto 0);
#elif _protocol == "USERDEF"
   ff_txdata_ch2 : in std_logic_vector (11 downto 0);
   ff_rxdata_ch2 : out std_logic_vector (11 downto 0);
#elif _protocol == "PIPE"
   TxData_ch2    : in std_logic_vector (7 downto 0);
   RxData_ch2    : out std_logic_vector (7 downto 0);
#else
   ff_txdata_ch2 : in std_logic_vector (7 downto 0);
   ff_rxdata_ch2 : out std_logic_vector (7 downto 0);
#endif
#elif _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
   ff_txdata_ch2 : in std_logic_vector (19 downto 0);
   ff_rxdata_ch2 : out std_logic_vector (19 downto 0);
#elif _protocol == "USERDEF"
   ff_txdata_ch2 : in std_logic_vector (23 downto 0);
   ff_rxdata_ch2 : out std_logic_vector (23 downto 0);
#elif _protocol == "PIPE"
   TxData_ch2    : in std_logic_vector (15 downto 0);
   RxData_ch2    : out std_logic_vector (15 downto 0);
#else
   ff_txdata_ch2 : in std_logic_vector (15 downto 0);
   ff_rxdata_ch2 : out std_logic_vector (15 downto 0);
#endif
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
   ff_tx_k_cntrl_ch2 : in std_logic;
   ff_rx_k_cntrl_ch2 : out std_logic;
#else
   ff_tx_k_cntrl_ch2 : in std_logic_vector (1 downto 0);
   ff_rx_k_cntrl_ch2 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "XAUI"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
   ff_txc_ch2 : in std_logic;
   ff_rxc_ch2 : out std_logic;
#else
   ff_txc_ch2 : in std_logic_vector (1 downto 0);
   ff_rxc_ch2 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "PIPE"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
   TxDataK_ch2 : in std_logic;
   RxDataK_ch2 : out std_logic;
#else
   TxDataK_ch2 : in std_logic_vector (1 downto 0);
   RxDataK_ch2 : out std_logic_vector (1 downto 0);
#endif
#endif
   ff_rxfullclk_ch2 : out std_logic;
#if _data_width_ch2 == "16" || _data_width_ch2 == "20" && _ch2_ctc_byp == "BYPASS"
   ff_rxhalfclk_ch2 : out std_logic;
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
   ff_force_disp_ch2 : in std_logic;
#else
   ff_force_disp_ch2 : in std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
   ff_xmit_ch2 : in std_logic;
#else
   ff_xmit_ch2 : in std_logic_vector (1 downto 0);
#endif
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
   ff_disp_sel_ch2 : in std_logic;
#else
   ff_disp_sel_ch2 : in std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "PCIE" || _protocol == "PIPE"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
   ff_pci_ei_en_ch2 : in std_logic;
#else
   ff_pci_ei_en_ch2 : in std_logic_vector (1 downto 0);
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
   ff_correct_disp_ch2 : in std_logic;
#else
   ff_correct_disp_ch2 : in std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
   ff_rxstatus0_ch2, ff_rxstatus1_ch2 : out std_logic;
#else
   ff_rxstatus0_ch2, ff_rxstatus1_ch2 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "SATA_I" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "XAUI" || _protocol == "GIGE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "OBSAI" || _protocol == "G8B10B"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
   ff_disp_err_ch2, ff_cv_ch2 : out std_logic;
#else
   ff_disp_err_ch2, ff_cv_ch2 : out std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
   ff_rxstatus2_ch2 : out std_logic;
#else
   ff_rxstatus2_ch2 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
   ff_rx_even_ch2 : out std_logic;
#else
   ff_rx_even_ch2 : out std_logic_vector (1 downto 0);
#endif
#endif
   ffc_rrst_ch2 : in std_logic;
#if _ch2_elsm == "TRUE"
   ffc_signal_detect_ch2 : in std_logic;
   ffc_enable_cgalign_ch2 : in std_logic;
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
   ffc_pfifo_clr_ch2 : in std_logic;
#endif
#endif
#if _ch2_ird == "TRUE" && _protocol != "PIPE"
   ffc_sb_inv_rx_ch2 : in std_logic;
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
   ffc_pcie_ct_ch2 : in std_logic;
   ffc_pci_det_en_ch2 : in std_logic;
   ffs_pcie_done_ch2 : out std_logic;
   ffs_pcie_con_ch2 : out std_logic;
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch2_teidle == "TRUE")
   ffc_ei_en_ch2 : in std_logic;
#endif
   ffc_lane_tx_rst_ch2 : in std_logic;
   ffc_lane_rx_rst_ch2 : in std_logic;
   ffc_txpwdnb_ch2 : in std_logic;
   ffc_rxpwdnb_ch2 : in std_logic;
#if _protocol == "SATA_I"
   ffs_sata_oob_rx_ch2 : out std_logic;
#elif _protocol != "PIPE"
   ffs_rlos_lo_ch2 : out std_logic;
#endif
#if _protocol != "8BSER"
#if _comma_align == "AUTO"
   ffs_ls_sync_status_ch2 : out std_logic;
#endif
#endif
#if _errsports == "TRUE"
   ffs_cc_underrun_ch2 : out std_logic;
   ffs_cc_overrun_ch2 : out std_logic;
   ffs_txfbfifo_error_ch2 : out std_logic;
   ffs_rxfbfifo_error_ch2 : out std_logic;
#endif
   ffs_rlol_ch2 : out std_logic;
   oob_out_ch2 : out std_logic;
#if _protocol == "PIPE"
   TxCompliance_ch2 : in std_logic;
   TxElecIdle_ch2 : in std_logic;
   RxPolarity_ch2 : in std_logic;
   RxValid_ch2 : out std_logic;
   RxElecIdle_ch2 : out std_logic;
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   RxStatus0_ch2 : out std_logic_vector (2 downto 0);
#else
   RxStatus0_ch2 : out std_logic_vector (2 downto 0);
   RxStatus1_ch2 : out std_logic_vector (2 downto 0);
#endif
#endif
#endif
#if _ch3_mode != "DISABLE"
#if _sci_ports == "TRUE"
   scisel_ch3, scien_ch3 : in std_logic;
#endif
   hdinp3, hdinn3 : in std_logic;
   hdoutp3, hdoutn3 : out std_logic;
   ff_rxiclk_ch3, ff_txiclk_ch3, ff_ebrd_clk_3 : in std_logic;
#if _pllqclkports == "TRUE"
   ff_rxqtrclk_ch3 : out std_logic;
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
   ff_txdata_ch3 : in std_logic_vector (9 downto 0);
   ff_rxdata_ch3 : out std_logic_vector (9 downto 0);
#elif _protocol == "USERDEF"
   ff_txdata_ch3 : in std_logic_vector (11 downto 0);
   ff_rxdata_ch3 : out std_logic_vector (11 downto 0);
#elif _protocol == "PIPE"
   TxData_ch3    : in std_logic_vector (7 downto 0);
   RxData_ch3    : out std_logic_vector (7 downto 0);
#else
   ff_txdata_ch3 : in std_logic_vector (7 downto 0);
   ff_rxdata_ch3 : out std_logic_vector (7 downto 0);
#endif
#elif _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
   ff_txdata_ch3 : in std_logic_vector (19 downto 0);
   ff_rxdata_ch3 : out std_logic_vector (19 downto 0);
#elif _protocol == "USERDEF"
   ff_txdata_ch3 : in std_logic_vector (23 downto 0);
   ff_rxdata_ch3 : out std_logic_vector (23 downto 0);
#elif _protocol == "PIPE"
   TxData_ch3    : in std_logic_vector (15 downto 0);
   RxData_ch3    : out std_logic_vector (15 downto 0);
#else
   ff_txdata_ch3 : in std_logic_vector (15 downto 0);
   ff_rxdata_ch3 : out std_logic_vector (15 downto 0);
#endif
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
   ff_tx_k_cntrl_ch3 : in std_logic;
   ff_rx_k_cntrl_ch3 : out std_logic;
#else
   ff_tx_k_cntrl_ch3 : in std_logic_vector (1 downto 0);
   ff_rx_k_cntrl_ch3 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "XAUI"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
   ff_txc_ch3 : in std_logic;
   ff_rxc_ch3 : out std_logic;
#else
   ff_txc_ch3 : in std_logic_vector (1 downto 0);
   ff_rxc_ch3 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "PIPE"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
   TxDataK_ch3 : in std_logic;
   RxDataK_ch3 : out std_logic;
#else
   TxDataK_ch3 : in std_logic_vector (1 downto 0);
   RxDataK_ch3 : out std_logic_vector (1 downto 0);
#endif
#endif
   ff_rxfullclk_ch3 : out std_logic;
#if _data_width_ch3 == "16" || _data_width_ch3 == "20" && _ch3_ctc_byp == "BYPASS"
   ff_rxhalfclk_ch3 : out std_logic;
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
   ff_force_disp_ch3 : in std_logic;
#else
   ff_force_disp_ch3 : in std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
   ff_xmit_ch3 : in std_logic;
#else
   ff_xmit_ch3 : in std_logic_vector (1 downto 0);
#endif
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
   ff_disp_sel_ch3 : in std_logic;
#else
   ff_disp_sel_ch3 : in std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "PCIE" || _protocol == "PIPE"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
   ff_pci_ei_en_ch3 : in std_logic;
#else
   ff_pci_ei_en_ch3 : in std_logic_vector (1 downto 0);
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
   ff_correct_disp_ch3 : in std_logic;
#else
   ff_correct_disp_ch3 : in std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
   ff_rxstatus0_ch3, ff_rxstatus1_ch3 : out std_logic;
#else
   ff_rxstatus0_ch3, ff_rxstatus1_ch3 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "SATA_I" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "XAUI" || _protocol == "GIGE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "OBSAI" || _protocol == "G8B10B"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
   ff_disp_err_ch3, ff_cv_ch3 : out std_logic;
#else
   ff_disp_err_ch3, ff_cv_ch3 : out std_logic_vector (1 downto 0);
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
   ff_rxstatus2_ch3 : out std_logic;
#else
   ff_rxstatus2_ch3 : out std_logic_vector (1 downto 0);
#endif
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
   ff_rx_even_ch3 : out std_logic;
#else
   ff_rx_even_ch3 : out std_logic_vector (1 downto 0);
#endif
#endif
   ffc_rrst_ch3 : in std_logic;
#if _ch3_elsm == "TRUE"
   ffc_signal_detect_ch3 : in std_logic;
   ffc_enable_cgalign_ch3 : in std_logic;
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
   ffc_pfifo_clr_ch3 : in std_logic;
#endif
#endif
#if _ch3_ird == "TRUE" && _protocol != "PIPE"
   ffc_sb_inv_rx_ch3 : in std_logic;
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
   ffc_pcie_ct_ch3 : in std_logic;
   ffc_pci_det_en_ch3 : in std_logic;
   ffs_pcie_done_ch3 : out std_logic;
   ffs_pcie_con_ch3 : out std_logic;
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch3_teidle == "TRUE")
   ffc_ei_en_ch3 : in std_logic;
#endif
   ffc_lane_tx_rst_ch3 : in std_logic;
   ffc_lane_rx_rst_ch3 : in std_logic;
   ffc_txpwdnb_ch3 : in std_logic;
   ffc_rxpwdnb_ch3 : in std_logic;
#if _protocol == "SATA_I"
   ffs_sata_oob_rx_ch3 : out std_logic;
#elif _protocol != "PIPE"
   ffs_rlos_lo_ch3 : out std_logic;
#endif
#if _protocol != "8BSER"
#if _comma_align == "AUTO"
   ffs_ls_sync_status_ch3 : out std_logic;
#endif
#endif
#if _errsports == "TRUE"
   ffs_cc_underrun_ch3 : out std_logic;
   ffs_cc_overrun_ch3 : out std_logic;
   ffs_txfbfifo_error_ch3 : out std_logic;
   ffs_rxfbfifo_error_ch3 : out std_logic;
#endif
   ffs_rlol_ch3 : out std_logic;
   oob_out_ch3 : out std_logic;
#if _protocol == "PIPE"
   TxCompliance_ch3 : in std_logic;
   TxElecIdle_ch3 : in std_logic;
   RxPolarity_ch3 : in std_logic;
   RxValid_ch3 : out std_logic;
   RxElecIdle_ch3 : out std_logic;
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
   RxStatus0_ch3 : out std_logic_vector (2 downto 0);
#else
   RxStatus0_ch3 : out std_logic_vector (2 downto 0);
   RxStatus1_ch3 : out std_logic_vector (2 downto 0);
#endif
#endif
#endif
#if _sci_ports == "TRUE"
   sciwritedata : in std_logic_vector (7 downto 0);
   sciaddress : in std_logic_vector (5 downto 0);
   scireaddata : out std_logic_vector (7 downto 0);
   scienaux : in std_logic;
   sciselaux : in std_logic;
   scird : in std_logic;
   sciwstn : in std_logic;
   cyawstn : in std_logic;
#if _sci_int_port == "TRUE"
   sciinterrupt : out std_logic;
#endif
#endif
   ffc_macro_rst : in std_logic;
   ffc_quad_rst : in std_logic;
   ffc_trst : in std_logic;
   ff_txfullclk : out std_logic;
   ff_txhalfclk : out std_logic;
#if _pllqclkports == "TRUE"
   ff_txqtrclk : out std_logic;
#endif
#if _refck2core == "TRUE"
   refck2core : out std_logic;
#endif
#if _protocol == "PIPE"
   TxDetectRx_Loopback : in std_logic;
   PhyStatus : out std_logic;
   PowerDown : in std_logic_vector (1 downto 0);
#endif
#if _protocol == "CPRI"
   ff_txser_clk : out std_logic;
#endif
   ffs_plol : out std_logic);

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
component PCSC
--synopsys translate_off
GENERIC(
  CONFIG_FILE : String
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
  FFC_CK_CORE_RX             : in std_logic;
  FFC_CK_CORE_TX             : in std_logic;
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
  FFC_TRST             : in std_logic;
  FFC_TXPWDNB_0             : in std_logic;
  FFC_TXPWDNB_1             : in std_logic;
  FFC_TXPWDNB_2             : in std_logic;
  FFC_TXPWDNB_3             : in std_logic;
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
  SCIRD             : in std_logic;
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
  SCIWSTN             : in std_logic;
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
  FF_RX_Q_CLK_0             : out std_logic;
  FF_RX_Q_CLK_1             : out std_logic;
  FF_RX_Q_CLK_2             : out std_logic;
  FF_RX_Q_CLK_3             : out std_logic;
  FF_TX_F_CLK             : out std_logic;
  FF_TX_H_CLK             : out std_logic;
  FF_TX_Q_CLK             : out std_logic;
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
  FFS_PCIE_CON_0             : out std_logic;
  FFS_PCIE_CON_1             : out std_logic;
  FFS_PCIE_CON_2             : out std_logic;
  FFS_PCIE_CON_3             : out std_logic;
  FFS_PCIE_DONE_0             : out std_logic;
  FFS_PCIE_DONE_1             : out std_logic;
  FFS_PCIE_DONE_2             : out std_logic;
  FFS_PCIE_DONE_3             : out std_logic;
  FFS_RLOS_LO_0             : out std_logic;
  FFS_RLOS_LO_1             : out std_logic;
  FFS_RLOS_LO_2             : out std_logic;
  FFS_RLOS_LO_3             : out std_logic;
  OOB_OUT_0             : out std_logic;
  OOB_OUT_1             : out std_logic;
  OOB_OUT_2             : out std_logic;
  OOB_OUT_3             : out std_logic;
  REFCK2CORE             : out std_logic;
  SCIINT             : out std_logic;
  SCIRDATA0             : out std_logic;
  SCIRDATA1             : out std_logic;
  SCIRDATA2             : out std_logic;
  SCIRDATA3             : out std_logic;
  SCIRDATA4             : out std_logic;
  SCIRDATA5             : out std_logic;
  SCIRDATA6             : out std_logic;
  SCIRDATA7             : out std_logic;
  FFS_PLOL             : out std_logic;
  FFS_RLOL_0             : out std_logic;
  FFS_RLOL_1             : out std_logic;
  FFS_RLOL_2             : out std_logic;
  FFS_RLOL_3             : out std_logic;
  FFS_RXFBFIFO_ERROR_0             : out std_logic;
  FFS_RXFBFIFO_ERROR_1             : out std_logic;
  FFS_RXFBFIFO_ERROR_2             : out std_logic;
  FFS_RXFBFIFO_ERROR_3             : out std_logic;
  FFS_TXFBFIFO_ERROR_0             : out std_logic;
  FFS_TXFBFIFO_ERROR_1             : out std_logic;
  FFS_TXFBFIFO_ERROR_2             : out std_logic;
  FFS_TXFBFIFO_ERROR_3             : out std_logic
);
end component;
   attribute CONFIG_FILE: string;
   attribute CONFIG_FILE of PCSC_INST : label is USER_CONFIG_FILE;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_0: string;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_0 of PCSC_INST : label is #_ch0_rx_ficlk_rate;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_1: string;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_1 of PCSC_INST : label is #_ch0_rx_ficlk_rate;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_2: string;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_2 of PCSC_INST : label is #_ch0_rx_ficlk_rate;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_3: string;
   attribute FREQUENCY_PIN_FF_RX_F_CLK_3 of PCSC_INST : label is #_ch0_rx_ficlk_rate;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_0: string;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_0 of PCSC_INST : label is #_ch0_rx_hiclk_rate;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_1: string;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_1 of PCSC_INST : label is #_ch0_rx_hiclk_rate;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_2: string;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_2 of PCSC_INST : label is #_ch0_rx_hiclk_rate;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_3: string;
   attribute FREQUENCY_PIN_FF_RX_H_CLK_3 of PCSC_INST : label is #_ch0_rx_hiclk_rate;
   attribute FREQUENCY_PIN_FF_TX_F_CLK: string;
   attribute FREQUENCY_PIN_FF_TX_F_CLK of PCSC_INST : label is #_tx_ficlk_rate;
   attribute FREQUENCY_PIN_FF_TX_H_CLK: string;
   attribute FREQUENCY_PIN_FF_TX_H_CLK of PCSC_INST : label is #_tx_hiclk_rate; 
   attribute black_box_pad_pin: string;
   attribute black_box_pad_pin of PCSC : component is "HDINP0, HDINN0, HDINP1, HDINN1, HDINP2, HDINN2, HDINP3, HDINN3, HDOUTP0, HDOUTN0, HDOUTP1, HDOUTN1, HDOUTP2, HDOUTN2, HDOUTP3, HDOUTN3, REFCLKP, REFCLKN";

signal fpsc_vlo : std_logic := '0';
signal cin : std_logic_vector (11 downto 0) := "000000000000";
#if _protocol == "CPRI"
signal cout : std_logic_vector (18 downto 0);
#else
signal cout : std_logic_vector (19 downto 0);
#endif

begin

vlo_inst : VLO port map(Z => fpsc_vlo);

-- pcs_quad instance
PCSC_INST : PCSC
--synopsys translate_off
  generic map (CONFIG_FILE => USER_CONFIG_FILE)
--synopsys translate_on
port map  (
#if _pll_txsrc == "CORE_TXREFCLK"
  FFC_CK_CORE_TX => core_txrefclk,
#else
  FFC_CK_CORE_TX => fpsc_vlo,
#endif
#if _protocol_mode == "Quad Based Protocol Mode"
#if _pll_rxsrc == "CORE_RXREFCLK"
  FFC_CK_CORE_RX => core_rxrefclk,
#else
  FFC_CK_CORE_RX => fpsc_vlo,
#endif
#if _pll_txsrc == "REFCLK" || _pll_rxsrc == "REFCLK"
  REFCLKP => refclkp,
  REFCLKN => refclkn,
#else
  REFCLKP => fpsc_vlo,
  REFCLKN => fpsc_vlo,
#endif
#elif _protocol_mode == "Channel Based Protocol Mode"
#if _ch0_pll_rxsrc == "CORE_RXREFCLK" || _ch1_pll_rxsrc == "CORE_RXREFCLK" || _ch2_pll_rxsrc == "CORE_RXREFCLK" || _ch3_pll_rxsrc == "CORE_RXREFCLK"
  FFC_CK_CORE_RX => core_rxrefclk,
#else
  FFC_CK_CORE_RX => fpsc_vlo,
#endif
#if _pll_txsrc == "REFCLK" || _ch0_pll_rxsrc == "REFCLK" || _ch1_pll_rxsrc == "REFCLK" || _ch2_pll_rxsrc == "REFCLK" || _ch3_pll_rxsrc == "REFCLK"
  REFCLKP => refclkp,
  REFCLKN => refclkn,
#else
  REFCLKP => fpsc_vlo,
  REFCLKN => fpsc_vlo,
#endif
#endif
#if _ch0_mode == "DISABLE" 
  HDINP0 => fpsc_vlo,
  HDINN0 => fpsc_vlo,
  HDOUTP0 => open,
  HDOUTN0 => open,
  SCISELCH0 => fpsc_vlo,
  SCIENCH0 => fpsc_vlo,
  FF_RXI_CLK_0 => fpsc_vlo,
  FF_TXI_CLK_0 => fpsc_vlo,
  FF_EBRD_CLK_0 => fpsc_vlo,
  FF_RX_F_CLK_0 => open,
  FF_RX_H_CLK_0 => open,
  FF_RX_Q_CLK_0 => open,
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
  FFC_RRST_0 => fpsc_vlo,
  FFC_SIGNAL_DETECT_0 => fpsc_vlo,
  FFC_SB_PFIFO_LP_0 => fpsc_vlo,
  FFC_SB_INV_RX_0 => fpsc_vlo,
  FFC_PFIFO_CLR_0 => fpsc_vlo,
  FFC_PCIE_CT_0 => fpsc_vlo,
  FFC_PCI_DET_EN_0 => fpsc_vlo,
  FFC_FB_LOOPBACK_0 => fpsc_vlo,
  FFC_ENABLE_CGALIGN_0 => fpsc_vlo,
  FFC_EI_EN_0 => fpsc_vlo,
  FFC_LANE_TX_RST_0 => fpsc_vlo,
  FFC_LANE_RX_RST_0 => fpsc_vlo,
  FFC_TXPWDNB_0 => fpsc_vlo,
  FFC_RXPWDNB_0 => fpsc_vlo,
  FFS_RLOS_LO_0 => open,
  FFS_PCIE_DONE_0 => open,
  FFS_PCIE_CON_0 => open,
  FFS_LS_SYNC_STATUS_0 => open,
  FFS_CC_UNDERRUN_0 => open,
  FFS_CC_OVERRUN_0 => open,
  FFS_RLOL_0 => open,
  FFS_RXFBFIFO_ERROR_0 => open,
  FFS_TXFBFIFO_ERROR_0 => open,
  OOB_OUT_0 => open,
#else
  HDINP0 => hdinp0,
  HDINN0 => hdinn0,
  HDOUTP0 => hdoutp0,
  HDOUTN0 => hdoutn0,
#if _sci_ports == "TRUE"
  SCISELCH0 => scisel_ch0,
  SCIENCH0 => scien_ch0,
#else
  SCISELCH0 => fpsc_vlo,
  SCIENCH0 => fpsc_vlo,
#endif
  FF_RXI_CLK_0 => ff_rxiclk_ch0,
  FF_TXI_CLK_0 => ff_txiclk_ch0,
  FF_EBRD_CLK_0 => ff_ebrd_clk_0,
  FF_RX_F_CLK_0 => ff_rxfullclk_ch0,
#if _data_width_ch0 == "8" || _data_width_ch0 == "10" && _ch0_ctc_byp == "BYPASS"
  FF_RX_H_CLK_0 => open,
#elif _data_width_ch0 == "16" || _data_width_ch0 == "20" && _ch0_ctc_byp == "BYPASS"
  FF_RX_H_CLK_0 => ff_rxhalfclk_ch0,
#endif
#if _pllqclkports == "TRUE"
  FF_RX_Q_CLK_0 => ff_rxqtrclk_ch0,
#else
  FF_RX_Q_CLK_0 => open,
#endif
#if _protocol == "PIPE"
  FF_TX_D_0_0 => TxData_ch0(0),
  FF_TX_D_0_1 => TxData_ch0(1),
  FF_TX_D_0_2 => TxData_ch0(2),
  FF_TX_D_0_3 => TxData_ch0(3),
  FF_TX_D_0_4 => TxData_ch0(4),
  FF_TX_D_0_5 => TxData_ch0(5),
  FF_TX_D_0_6 => TxData_ch0(6),
  FF_TX_D_0_7 => TxData_ch0(7),
#else
  FF_TX_D_0_0 => ff_txdata_ch0(0),
  FF_TX_D_0_1 => ff_txdata_ch0(1),
  FF_TX_D_0_2 => ff_txdata_ch0(2),
  FF_TX_D_0_3 => ff_txdata_ch0(3),
  FF_TX_D_0_4 => ff_txdata_ch0(4),
  FF_TX_D_0_5 => ff_txdata_ch0(5),
  FF_TX_D_0_6 => ff_txdata_ch0(6),
  FF_TX_D_0_7 => ff_txdata_ch0(7),
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_TX_D_0_8 => ff_tx_k_cntrl_ch0,
#else
  FF_TX_D_0_8 => ff_tx_k_cntrl_ch0(0),
#endif
#elif _protocol == "XAUI"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_TX_D_0_8 => ff_txc_ch0,
#else
  FF_TX_D_0_8 => ff_txc_ch0(0),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_TX_D_0_8 => TxDataK_ch0,
#else
  FF_TX_D_0_8 => TxDataK_ch0(0),
#endif
#elif _protocol == "8BSER"
  FF_TX_D_0_8 => fpsc_vlo,
#else
  FF_TX_D_0_8 => ff_txdata_ch0(8),
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_TX_D_0_9 => ff_force_disp_ch0,
#else
  FF_TX_D_0_9 => ff_force_disp_ch0(0),
#endif
#elif _protocol == "10BSER" || _protocol == "USERDEF" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "CPRI"
  FF_TX_D_0_9 => ff_txdata_ch0(9),
#elif _protocol == "PIPE"
  FF_TX_D_0_9 => ,
#else
  FF_TX_D_0_9 => fpsc_vlo,
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_TX_D_0_10 => ff_disp_sel_ch0,
#else
  FF_TX_D_0_10 => ff_disp_sel_ch0(0),
#endif
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_TX_D_0_10 => ff_xmit_ch0,
#else
  FF_TX_D_0_10 => ff_xmit_ch0(0),
#endif
#elif _protocol == "USERDEF"
  FF_TX_D_0_10 => ff_txdata_ch0(10),
#elif _protocol == "PIPE"
  FF_TX_D_0_10 => ,
#else
  FF_TX_D_0_10 => fpsc_vlo,
#endif
#if _protocol == "PCIE" || _protocol == "PIPE"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_TX_D_0_11 => ff_pci_ei_en_ch0,
#else
  FF_TX_D_0_11 => ff_pci_ei_en_ch0(0),
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_TX_D_0_11 => ff_correct_disp_ch0,
#else
  FF_TX_D_0_11 => ff_correct_disp_ch0(0),
#endif
#elif _protocol == "USERDEF"
  FF_TX_D_0_11 => ff_txdata_ch0(11),
#else
  FF_TX_D_0_11 => fpsc_vlo,
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_0_12 => ff_txdata_ch0(12),
#elif _protocol == "PIPE"
  FF_TX_D_0_12 => TxData_ch0(8),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_0_12 => ff_txdata_ch0(10),
#else
  FF_TX_D_0_12 => ff_txdata_ch0(8),
#endif
#else
  FF_TX_D_0_12 => fpsc_vlo,
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_0_13 => ff_txdata_ch0(13),
#elif _protocol == "PIPE"
  FF_TX_D_0_13 => TxData_ch0(9),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_0_13 => ff_txdata_ch0(11),
#else
  FF_TX_D_0_13 => ff_txdata_ch0(9),
#endif
#else
  FF_TX_D_0_13 => fpsc_vlo,
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_0_14 => ff_txdata_ch0(14),
#elif _protocol == "PIPE"
  FF_TX_D_0_14 => TxData_ch0(10),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_0_14 => ff_txdata_ch0(12),
#else
  FF_TX_D_0_14 => ff_txdata_ch0(10),
#endif
#else
  FF_TX_D_0_14 => fpsc_vlo,
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_0_15 => ff_txdata_ch0(15),
#elif _protocol == "PIPE"
  FF_TX_D_0_15 => TxData_ch0(11),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_0_15 => ff_txdata_ch0(13),
#else
  FF_TX_D_0_15 => ff_txdata_ch0(11),
#endif
#else
  FF_TX_D_0_15 => fpsc_vlo,
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_0_16 => ff_txdata_ch0(16),
#elif _protocol == "PIPE"
  FF_TX_D_0_16 => TxData_ch0(12),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_0_16 => ff_txdata_ch0(14),
#else
  FF_TX_D_0_16 => ff_txdata_ch0(12),
#endif
#else
  FF_TX_D_0_16 => fpsc_vlo,
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_0_17 => ff_txdata_ch0(17),
#elif _protocol == "PIPE"
  FF_TX_D_0_17 => TxData_ch0(13),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_0_17 => ff_txdata_ch0(15),
#else
  FF_TX_D_0_17 => ff_txdata_ch0(13),
#endif
#else
  FF_TX_D_0_17 => fpsc_vlo,
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_0_18 => ff_txdata_ch0(18),
#elif _protocol == "PIPE"
  FF_TX_D_0_18 => TxData_ch0(14),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_0_18 => ff_txdata_ch0(16),
#else
  FF_TX_D_0_18 => ff_txdata_ch0(14),
#endif
#else
  FF_TX_D_0_18 => fpsc_vlo,
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_0_19 => ff_txdata_ch0(19),
#elif _protocol == "PIPE"
  FF_TX_D_0_19 => TxData_ch0(15),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_0_19 => ff_txdata_ch0(17),
#else
  FF_TX_D_0_19 => ff_txdata_ch0(15),
#endif
#else
  FF_TX_D_0_19 => fpsc_vlo,
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_0_20 => ff_txdata_ch0(20),
#elif _protocol == "XAUI"
  FF_TX_D_0_20 => ff_txc_ch0(1),
#elif _protocol == "PIPE"
  FF_TX_D_0_20 => TxDataK_ch0(1),
#elif _protocol == "8BSER"
  FF_TX_D_0_20 => fpsc_vlo,
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_TX_D_0_20 => ff_txdata_ch0(18),
#else
  FF_TX_D_0_20 => ff_tx_k_cntrl_ch0(1),
#endif
#else
  FF_TX_D_0_20 => fpsc_vlo,
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_0_21 => ff_txdata_ch0(21),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_TX_D_0_21 => ff_txdata_ch0(19),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
  FF_TX_D_0_21 => ff_force_disp_ch0(1),
#else
  FF_TX_D_0_21 => fpsc_vlo,
#endif
#else
  FF_TX_D_0_21 => fpsc_vlo,
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_0_22 => ff_txdata_ch0(22),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
  FF_TX_D_0_22 => ff_xmit_ch0(1),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
  FF_TX_D_0_22 => ff_disp_sel_ch0(1),
#else
  FF_TX_D_0_22 => fpsc_vlo,
#endif
#else
  FF_TX_D_0_22 => fpsc_vlo,
#endif
#if _data_width_ch0 == "16" || _data_width_ch0 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_0_23 => ff_txdata_ch0(23),
#elif _protocol == "PCIE" || _protocol == "PIPE"
  FF_TX_D_0_23 => ff_pci_ei_en_ch0(1),
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
  FF_TX_D_0_23 => ff_correct_disp_ch0(1),
#else
  FF_TX_D_0_23 => fpsc_vlo,
#endif
#else
  FF_TX_D_0_23 => fpsc_vlo,
#endif
#if _protocol == "PIPE"
  FF_RX_D_0_0 => RxData_ch0(0),
  FF_RX_D_0_1 => RxData_ch0(1),
  FF_RX_D_0_2 => RxData_ch0(2),
  FF_RX_D_0_3 => RxData_ch0(3),
  FF_RX_D_0_4 => RxData_ch0(4),
  FF_RX_D_0_5 => RxData_ch0(5),
  FF_RX_D_0_6 => RxData_ch0(6),
  FF_RX_D_0_7 => RxData_ch0(7),
#else
  FF_RX_D_0_0 => ff_rxdata_ch0(0),
  FF_RX_D_0_1 => ff_rxdata_ch0(1),
  FF_RX_D_0_2 => ff_rxdata_ch0(2),
  FF_RX_D_0_3 => ff_rxdata_ch0(3),
  FF_RX_D_0_4 => ff_rxdata_ch0(4),
  FF_RX_D_0_5 => ff_rxdata_ch0(5),
  FF_RX_D_0_6 => ff_rxdata_ch0(6),
  FF_RX_D_0_7 => ff_rxdata_ch0(7),
#endif
#if _protocol == "XAUI"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_8 => ff_rxc_ch0,
#else
  FF_RX_D_0_8 => ff_rxc_ch0(0),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_8 => RxDataK_ch0,
#else
  FF_RX_D_0_8 => RxDataK_ch0(0),
#endif
#elif _protocol == "8BSER"
  FF_RX_D_0_8 => open,
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
  FF_RX_D_0_8 => ff_rxdata_ch0(8),
#else
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_8 => ff_rx_k_cntrl_ch0,
#else
  FF_RX_D_0_8 => ff_rx_k_cntrl_ch0(0),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_9 => ff_rxstatus0_ch0,
#else
  FF_RX_D_0_9 => ff_rxstatus0_ch0(0),
#endif
#elif _protocol == "PIPE"
  FF_RX_D_0_9 => RxStatus0_ch0(0),
#elif _protocol == "8BSER" 
  FF_RX_D_0_9 => open,
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
  FF_RX_D_0_9 => ff_rxdata_ch0(9),
#else
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_9 => ff_disp_err_ch0,
#else
  FF_RX_D_0_9 => ff_disp_err_ch0(0),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_10 => ff_rxstatus1_ch0,
#else
  FF_RX_D_0_10 => ff_rxstatus1_ch0(0),
#endif
#elif _protocol == "PIPE"
  FF_RX_D_0_10 => RxStatus0_ch0(1),
#elif _protocol == "USERDEF"
  FF_RX_D_0_10 => ff_rxdata_ch0(10),
#elif _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_0_10 => open,
#else
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_10 => ff_cv_ch0,
#else
  FF_RX_D_0_10 => ff_cv_ch0(0),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_11 => ff_rxstatus2_ch0,
#else
  FF_RX_D_0_11 => ff_rxstatus2_ch0(0),
#endif
#elif _protocol == "PIPE"
  FF_RX_D_0_11 => RxStatus0_ch0(2),
#elif _protocol == "USERDEF"
  FF_RX_D_0_11 => ff_rxdata_ch0(11),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_11 => ff_rx_even_ch0,
#else
  FF_RX_D_0_11 => ff_rx_even_ch0(0),
#endif
#else
  FF_RX_D_0_11 => open,
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_12 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_0_12 => ff_rxdata_ch0(10),
#elif _protocol == "USERDEF"
  FF_RX_D_0_12 => ff_rxdata_ch0(12),
#elif _protocol == "PIPE"
  FF_RX_D_0_12 => RxData_ch0(8),
#else
  FF_RX_D_0_12 => ff_rxdata_ch0(8),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_13 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_0_13 => ff_rxdata_ch0(11),
#elif _protocol == "USERDEF"
  FF_RX_D_0_13 => ff_rxdata_ch0(13),
#elif _protocol == "PIPE"
  FF_RX_D_0_13 => RxData_ch0(9),
#else
  FF_RX_D_0_13 => ff_rxdata_ch0(9),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_14 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_0_14 => ff_rxdata_ch0(12),
#elif _protocol == "USERDEF"
  FF_RX_D_0_14 => ff_rxdata_ch0(14),
#elif _protocol == "PIPE"
  FF_RX_D_0_14 => RxData_ch0(10),
#else
  FF_RX_D_0_14 => ff_rxdata_ch0(10),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_15 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_0_15 => ff_rxdata_ch0(13),
#elif _protocol == "USERDEF"
  FF_RX_D_0_15 => ff_rxdata_ch0(15),
#elif _protocol == "PIPE"
  FF_RX_D_0_15 => RxData_ch0(11),
#else
  FF_RX_D_0_15 => ff_rxdata_ch0(11),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_16 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_0_16 => ff_rxdata_ch0(14),
#elif _protocol == "USERDEF"
  FF_RX_D_0_16 => ff_rxdata_ch0(16),
#elif _protocol == "PIPE"
  FF_RX_D_0_16 => RxData_ch0(12),
#else
  FF_RX_D_0_16 => ff_rxdata_ch0(12),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_17 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_0_17 => ff_rxdata_ch0(15),
#elif _protocol == "USERDEF"
  FF_RX_D_0_17 => ff_rxdata_ch0(17),
#elif _protocol == "PIPE"
  FF_RX_D_0_17 => RxData_ch0(13),
#else
  FF_RX_D_0_17 => ff_rxdata_ch0(13),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_18 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_0_18 => ff_rxdata_ch0(16),
#elif _protocol == "USERDEF"
  FF_RX_D_0_18 => ff_rxdata_ch0(18),
#elif _protocol == "PIPE"
  FF_RX_D_0_18 => RxData_ch0(14),
#else
  FF_RX_D_0_18 => ff_rxdata_ch0(14),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_19 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_0_19 => ff_rxdata_ch0(17),
#elif _protocol == "USERDEF"
  FF_RX_D_0_19 => ff_rxdata_ch0(19),
#elif _protocol == "PIPE"
  FF_RX_D_0_19 => RxData_ch0(15),
#else
  FF_RX_D_0_19 => ff_rxdata_ch0(15),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_20 => open,
#else
#if _protocol == "8BSER"
  FF_RX_D_0_20 => open,
#elif _protocol == "USERDEF"
  FF_RX_D_0_20 => ff_rxdata_ch0(20),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_0_20 => ff_rxdata_ch0(18),
#elif _protocol == "XAUI"
  FF_RX_D_0_20 => ff_rxc_ch0(1),
#elif _protocol == "PIPE"
  FF_RX_D_0_20 => RxDataK_ch0(1),
#else
  FF_RX_D_0_20 => ff_rx_k_cntrl_ch0(1),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_21 => open,
#else
#if _protocol == "8BSER" 
  FF_RX_D_0_21 => open,
#elif _protocol == "USERDEF"
  FF_RX_D_0_21 => ff_rxdata_ch0(21),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_0_21 => ff_rxdata_ch0(19),
#elif _protocol == "PCIE" 
  FF_RX_D_0_21 => ff_rxstatus0_ch0(1),
#elif _protocol == "PIPE"
  FF_RX_D_0_21 => RxStatus1_ch0(0),
#else
  FF_RX_D_0_21 => ff_disp_err_ch0(1),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_22 => open,
#else
#if _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_0_22 => open,
#elif _protocol == "USERDEF"
  FF_RX_D_0_22 => ff_rxdata_ch0(22),
#elif _protocol == "PCIE" 
  FF_RX_D_0_22 => ff_rxstatus1_ch0(1),
#elif _protocol == "PIPE"
  FF_RX_D_0_22 => RxStatus1_ch0(1),
#else
  FF_RX_D_0_22 => ff_cv_ch0(1),
#endif
#endif
#if _data_width_ch0 == "8" || _data_width_ch0 == "10"
  FF_RX_D_0_23 => open,
#else
#if _protocol == "GIGE" || _protocol == "OBSAI" 
  FF_RX_D_0_23 => ff_rx_even_ch0(1),
#elif _protocol == "USERDEF"
  FF_RX_D_0_23 => ff_rxdata_ch0(23),
#elif _protocol == "PCIE" 
  FF_RX_D_0_23 => ff_rxstatus2_ch0(1),
#elif _protocol == "PIPE"
  FF_RX_D_0_23 => RxStatus1_ch0(2),
#else
  FF_RX_D_0_23 => open,
#endif
#endif
  FFC_RRST_0 => ffc_rrst_ch0,
#if _ch0_elsm == "TRUE"
  FFC_SIGNAL_DETECT_0 => ffc_signal_detect_ch0,
  FFC_ENABLE_CGALIGN_0 => ffc_enable_cgalign_ch0,
#else
  FFC_SIGNAL_DETECT_0 => fpsc_vlo,
  FFC_ENABLE_CGALIGN_0 => fpsc_vlo,
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
  FFC_SB_PFIFO_LP_0 => fpsc_vlo,
  FFC_PFIFO_CLR_0 => ffc_pfifo_clr_ch0,
  FFC_FB_LOOPBACK_0 => fpsc_vlo,
#elif _lbtype == "PCS Parallel Loopback"
  FFC_SB_PFIFO_LP_0 => fpsc_vlo,
  FFC_PFIFO_CLR_0 => fpsc_vlo,
#if _protocol != "PIPE"
  FFC_FB_LOOPBACK_0 => fpsc_vlo,
#else
  FFC_FB_LOOPBACK_0 => fpsc_vlo,
#endif
#else
  FFC_SB_PFIFO_LP_0 => fpsc_vlo,
  FFC_PFIFO_CLR_0 => fpsc_vlo,
  FFC_FB_LOOPBACK_0 => fpsc_vlo,
#endif
#else
  FFC_SB_PFIFO_LP_0 => fpsc_vlo,
  FFC_PFIFO_CLR_0 => fpsc_vlo,
  FFC_FB_LOOPBACK_0 => fpsc_vlo,
#endif
#if _ch0_ird == "TRUE"
#if _protocol == "PIPE"
  FFC_SB_INV_RX_0 => ,
#else
  FFC_SB_INV_RX_0 => ffc_sb_inv_rx_ch0,
#endif
#else
  FFC_SB_INV_RX_0 => fpsc_vlo,
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
  FFC_PCIE_CT_0 => ffc_pcie_ct_ch0,
  FFC_PCI_DET_EN_0 => ffc_pci_det_en_ch0,
  FFS_PCIE_DONE_0 => ffs_pcie_done_ch0,
  FFS_PCIE_CON_0 => ffs_pcie_con_ch0,
#elif _protocol == "PIPE"
  FFC_PCIE_CT_0 => ,
  FFC_PCI_DET_EN_0 => ,
  FFS_PCIE_DONE_0 => ,
  FFS_PCIE_CON_0 => ,
#else
  FFC_PCIE_CT_0 => fpsc_vlo,
  FFC_PCI_DET_EN_0 => fpsc_vlo,
  FFS_PCIE_DONE_0 => open,
  FFS_PCIE_CON_0 => open,
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch0_teidle == "TRUE")
  FFC_EI_EN_0 => ffc_ei_en_ch0,
#else
  FFC_EI_EN_0 => fpsc_vlo,
#endif
  FFC_LANE_TX_RST_0 => ffc_lane_tx_rst_ch0,
  FFC_LANE_RX_RST_0 => ffc_lane_rx_rst_ch0,
  FFC_TXPWDNB_0 => ffc_txpwdnb_ch0,
  FFC_RXPWDNB_0 => ffc_rxpwdnb_ch0,
#if _protocol == "PIPE"
  FFS_RLOS_LO_0 => ,
#elif _protocol == "SATA_I"
  FFS_RLOS_LO_0 => ffs_sata_oob_rx_ch0,
#else
  FFS_RLOS_LO_0 => ffs_rlos_lo_ch0,
#endif
#if _protocol == "8BSER"
  FFS_LS_SYNC_STATUS_0 => open,
#else
#if _comma_align == "AUTO"
  FFS_LS_SYNC_STATUS_0 => ffs_ls_sync_status_ch0,
#else
  FFS_LS_SYNC_STATUS_0 => open,
#endif
#endif
#if _errsports == "TRUE"
  FFS_CC_UNDERRUN_0 => ffs_cc_underrun_ch0,
  FFS_CC_OVERRUN_0 => ffs_cc_overrun_ch0,
  FFS_RXFBFIFO_ERROR_0 => ffs_rxfbfifo_error_ch0,
  FFS_TXFBFIFO_ERROR_0 => ffs_txfbfifo_error_ch0,
#else
  FFS_CC_UNDERRUN_0 => open,
  FFS_CC_OVERRUN_0 => open,
  FFS_RXFBFIFO_ERROR_0 => open,
  FFS_TXFBFIFO_ERROR_0 => open,
#endif
  FFS_RLOL_0 => ffs_rlol_ch0,
  OOB_OUT_0 => oob_out_ch0,
#endif
#if _ch1_mode == "DISABLE" 
  HDINP1 => fpsc_vlo,
  HDINN1 => fpsc_vlo,
  HDOUTP1 => open,
  HDOUTN1 => open,
  SCISELCH1 => fpsc_vlo,
  SCIENCH1 => fpsc_vlo,
  FF_RXI_CLK_1 => fpsc_vlo,
  FF_TXI_CLK_1 => fpsc_vlo,
  FF_EBRD_CLK_1 => fpsc_vlo,
  FF_RX_F_CLK_1 => open,
  FF_RX_H_CLK_1 => open,
  FF_RX_Q_CLK_1 => open,
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
  FFC_RRST_1 => fpsc_vlo,
  FFC_SIGNAL_DETECT_1 => fpsc_vlo,
  FFC_SB_PFIFO_LP_1 => fpsc_vlo,
  FFC_SB_INV_RX_1 => fpsc_vlo,
  FFC_PFIFO_CLR_1 => fpsc_vlo,
  FFC_PCIE_CT_1 => fpsc_vlo,
  FFC_PCI_DET_EN_1 => fpsc_vlo,
  FFC_FB_LOOPBACK_1 => fpsc_vlo,
  FFC_ENABLE_CGALIGN_1 => fpsc_vlo,
  FFC_EI_EN_1 => fpsc_vlo,
  FFC_LANE_TX_RST_1 => fpsc_vlo,
  FFC_LANE_RX_RST_1 => fpsc_vlo,
  FFC_TXPWDNB_1 => fpsc_vlo,
  FFC_RXPWDNB_1 => fpsc_vlo,
  FFS_RLOS_LO_1 => open,
  FFS_PCIE_DONE_1 => open,
  FFS_PCIE_CON_1 => open,
  FFS_LS_SYNC_STATUS_1 => open,
  FFS_CC_UNDERRUN_1 => open,
  FFS_CC_OVERRUN_1 => open,
  FFS_RLOL_1 => open,
  FFS_RXFBFIFO_ERROR_1 => open,
  FFS_TXFBFIFO_ERROR_1 => open,
  OOB_OUT_1 => open,
#else
  HDINP1 => hdinp1,
  HDINN1 => hdinn1,
  HDOUTP1 => hdoutp1,
  HDOUTN1 => hdoutn1,
#if _sci_ports == "TRUE"
  SCISELCH1 => scisel_ch1,
  SCIENCH1 => scien_ch1,
#else
  SCISELCH1 => fpsc_vlo,
  SCIENCH1 => fpsc_vlo,
#endif
  FF_RXI_CLK_1 => ff_rxiclk_ch1,
  FF_TXI_CLK_1 => ff_txiclk_ch1,
  FF_EBRD_CLK_1 => ff_ebrd_clk_1,
  FF_RX_F_CLK_1 => ff_rxfullclk_ch1,
#if _data_width_ch1 == "8" || _data_width_ch1 == "10" && _ch1_ctc_byp == "BYPASS"
  FF_RX_H_CLK_1 => open,
#elif _data_width_ch1 == "16" || _data_width_ch1 == "20" && _ch1_ctc_byp == "BYPASS"
  FF_RX_H_CLK_1 => ff_rxhalfclk_ch1,
#endif
#if _pllqclkports == "TRUE"
  FF_RX_Q_CLK_1 => ff_rxqtrclk_ch1,
#else
  FF_RX_Q_CLK_1 => open,
#endif
#if _protocol == "PIPE"
  FF_TX_D_1_0 => TxData_ch1(0),
  FF_TX_D_1_1 => TxData_ch1(1),
  FF_TX_D_1_2 => TxData_ch1(2),
  FF_TX_D_1_3 => TxData_ch1(3),
  FF_TX_D_1_4 => TxData_ch1(4),
  FF_TX_D_1_5 => TxData_ch1(5),
  FF_TX_D_1_6 => TxData_ch1(6),
  FF_TX_D_1_7 => TxData_ch1(7),
#else
  FF_TX_D_1_0 => ff_txdata_ch1(0),
  FF_TX_D_1_1 => ff_txdata_ch1(1),
  FF_TX_D_1_2 => ff_txdata_ch1(2),
  FF_TX_D_1_3 => ff_txdata_ch1(3),
  FF_TX_D_1_4 => ff_txdata_ch1(4),
  FF_TX_D_1_5 => ff_txdata_ch1(5),
  FF_TX_D_1_6 => ff_txdata_ch1(6),
  FF_TX_D_1_7 => ff_txdata_ch1(7),
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_TX_D_1_8 => ff_tx_k_cntrl_ch1,
#else
  FF_TX_D_1_8 => ff_tx_k_cntrl_ch1(0),
#endif
#elif _protocol == "XAUI"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_TX_D_1_8 => ff_txc_ch1,
#else
  FF_TX_D_1_8 => ff_txc_ch1(0),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_TX_D_1_8 => TxDataK_ch1,
#else
  FF_TX_D_1_8 => TxDataK_ch1(0),
#endif
#elif _protocol == "8BSER"
  FF_TX_D_1_8 => fpsc_vlo,
#else
  FF_TX_D_1_8 => ff_txdata_ch1(8),
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_TX_D_1_9 => ff_force_disp_ch1,
#else
  FF_TX_D_1_9 => ff_force_disp_ch1(0),
#endif
#elif _protocol == "10BSER" || _protocol == "USERDEF" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "CPRI"
  FF_TX_D_1_9 => ff_txdata_ch1(9),
#elif _protocol == "PIPE"
  FF_TX_D_1_9 => ,
#else
  FF_TX_D_1_9 => fpsc_vlo,
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_TX_D_1_10 => ff_disp_sel_ch1,
#else
  FF_TX_D_1_10 => ff_disp_sel_ch1(0),
#endif
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_TX_D_1_10 => ff_xmit_ch1,
#else
  FF_TX_D_1_10 => ff_xmit_ch1(0),
#endif
#elif _protocol == "USERDEF"
  FF_TX_D_1_10 => ff_txdata_ch1(10),
#elif _protocol == "PIPE"
  FF_TX_D_1_10 => ,
#else
  FF_TX_D_1_10 => fpsc_vlo,
#endif
#if _protocol == "PCIE" || _protocol == "PIPE"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_TX_D_1_11 => ff_pci_ei_en_ch1,
#else
  FF_TX_D_1_11 => ff_pci_ei_en_ch1(0),
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_TX_D_1_11 => ff_correct_disp_ch1,
#else
  FF_TX_D_1_11 => ff_correct_disp_ch1(0),
#endif
#elif _protocol == "USERDEF"
  FF_TX_D_1_11 => ff_txdata_ch1(11),
#else
  FF_TX_D_1_11 => fpsc_vlo,
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_1_12 => ff_txdata_ch1(12),
#elif _protocol == "PIPE"
  FF_TX_D_1_12 => TxData_ch1(8),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_1_12 => ff_txdata_ch1(10),
#else
  FF_TX_D_1_12 => ff_txdata_ch1(8),
#endif
#else
  FF_TX_D_1_12 => fpsc_vlo,
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_1_13 => ff_txdata_ch1(13),
#elif _protocol == "PIPE"
  FF_TX_D_1_13 => TxData_ch1(9),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_1_13 => ff_txdata_ch1(11),
#else
  FF_TX_D_1_13 => ff_txdata_ch1(9),
#endif
#else
  FF_TX_D_1_13 => fpsc_vlo,
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_1_14 => ff_txdata_ch1(14),
#elif _protocol == "PIPE"
  FF_TX_D_1_14 => TxData_ch1(10),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_1_14 => ff_txdata_ch1(12),
#else
  FF_TX_D_1_14 => ff_txdata_ch1(10),
#endif
#else
  FF_TX_D_1_14 => fpsc_vlo,
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_1_15 => ff_txdata_ch1(15),
#elif _protocol == "PIPE"
  FF_TX_D_1_15 => TxData_ch1(11),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_1_15 => ff_txdata_ch1(13),
#else
  FF_TX_D_1_15 => ff_txdata_ch1(11),
#endif
#else
  FF_TX_D_1_15 => fpsc_vlo,
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_1_16 => ff_txdata_ch1(16),
#elif _protocol == "PIPE"
  FF_TX_D_1_16 => TxData_ch1(12),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_1_16 => ff_txdata_ch1(14),
#else
  FF_TX_D_1_16 => ff_txdata_ch1(12),
#endif
#else
  FF_TX_D_1_16 => fpsc_vlo,
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_1_17 => ff_txdata_ch1(17),
#elif _protocol == "PIPE"
  FF_TX_D_1_17 => TxData_ch1(13),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_1_17 => ff_txdata_ch1(15),
#else
  FF_TX_D_1_17 => ff_txdata_ch1(13),
#endif
#else
  FF_TX_D_1_17 => fpsc_vlo,
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_1_18 => ff_txdata_ch1(18),
#elif _protocol == "PIPE"
  FF_TX_D_1_18 => TxData_ch1(14),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_1_18 => ff_txdata_ch1(16),
#else
  FF_TX_D_1_18 => ff_txdata_ch1(14),
#endif
#else
  FF_TX_D_1_18 => fpsc_vlo,
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_1_19 => ff_txdata_ch1(19),
#elif _protocol == "PIPE"
  FF_TX_D_1_19 => TxData_ch1(15),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_1_19 => ff_txdata_ch1(17),
#else
  FF_TX_D_1_19 => ff_txdata_ch1(15),
#endif
#else
  FF_TX_D_1_19 => fpsc_vlo,
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_1_20 => ff_txdata_ch1(20),
#elif _protocol == "XAUI"
  FF_TX_D_1_20 => ff_txc_ch1(1),
#elif _protocol == "PIPE"
  FF_TX_D_1_20 => TxDataK_ch1(1),
#elif _protocol == "8BSER"
  FF_TX_D_1_20 => fpsc_vlo,
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_TX_D_1_20 => ff_txdata_ch1(18),
#else
  FF_TX_D_1_20 => ff_tx_k_cntrl_ch1(1),
#endif
#else
  FF_TX_D_1_20 => fpsc_vlo,
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_1_21 => ff_txdata_ch1(21),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_TX_D_1_21 => ff_txdata_ch1(19),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
  FF_TX_D_1_21 => ff_force_disp_ch1(1),
#else
  FF_TX_D_1_21 => fpsc_vlo,
#endif
#else
  FF_TX_D_1_21 => fpsc_vlo,
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_1_22 => ff_txdata_ch1(22),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
  FF_TX_D_1_22 => ff_xmit_ch1(1),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
  FF_TX_D_1_22 => ff_disp_sel_ch1(1),
#else
  FF_TX_D_1_22 => fpsc_vlo,
#endif
#else
  FF_TX_D_1_22 => fpsc_vlo,
#endif
#if _data_width_ch1 == "16" || _data_width_ch1 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_1_23 => ff_txdata_ch1(23),
#elif _protocol == "PCIE" || _protocol == "PIPE"
  FF_TX_D_1_23 => ff_pci_ei_en_ch1(1),
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
  FF_TX_D_1_23 => ff_correct_disp_ch1(1),
#else
  FF_TX_D_1_23 => fpsc_vlo,
#endif
#else
  FF_TX_D_1_23 => fpsc_vlo,
#endif
#if _protocol == "PIPE"
  FF_RX_D_1_0 => RxData_ch1(0),
  FF_RX_D_1_1 => RxData_ch1(1),
  FF_RX_D_1_2 => RxData_ch1(2),
  FF_RX_D_1_3 => RxData_ch1(3),
  FF_RX_D_1_4 => RxData_ch1(4),
  FF_RX_D_1_5 => RxData_ch1(5),
  FF_RX_D_1_6 => RxData_ch1(6),
  FF_RX_D_1_7 => RxData_ch1(7),
#else
  FF_RX_D_1_0 => ff_rxdata_ch1(0),
  FF_RX_D_1_1 => ff_rxdata_ch1(1),
  FF_RX_D_1_2 => ff_rxdata_ch1(2),
  FF_RX_D_1_3 => ff_rxdata_ch1(3),
  FF_RX_D_1_4 => ff_rxdata_ch1(4),
  FF_RX_D_1_5 => ff_rxdata_ch1(5),
  FF_RX_D_1_6 => ff_rxdata_ch1(6),
  FF_RX_D_1_7 => ff_rxdata_ch1(7),
#endif
#if _protocol == "XAUI"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_8 => ff_rxc_ch1,
#else
  FF_RX_D_1_8 => ff_rxc_ch1(0),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_8 => RxDataK_ch1,
#else
  FF_RX_D_1_8 => RxDataK_ch1(0),
#endif
#elif _protocol == "8BSER"
  FF_RX_D_1_8 => open,
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
  FF_RX_D_1_8 => ff_rxdata_ch1(8),
#else
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_8 => ff_rx_k_cntrl_ch1,
#else
  FF_RX_D_1_8 => ff_rx_k_cntrl_ch1(0),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_9 => ff_rxstatus0_ch1,
#else
  FF_RX_D_1_9 => ff_rxstatus0_ch1(0),
#endif
#elif _protocol == "PIPE"
  FF_RX_D_1_9 => RxStatus0_ch1(0),
#elif _protocol == "8BSER" 
  FF_RX_D_1_9 => open,
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
  FF_RX_D_1_9 => ff_rxdata_ch1(9),
#else
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_9 => ff_disp_err_ch1,
#else
  FF_RX_D_1_9 => ff_disp_err_ch1(0),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_10 => ff_rxstatus1_ch1,
#else
  FF_RX_D_1_10 => ff_rxstatus1_ch1(0),
#endif
#elif _protocol == "PIPE"
  FF_RX_D_1_10 => RxStatus0_ch1(1),
#elif _protocol == "USERDEF"
  FF_RX_D_1_10 => ff_rxdata_ch1(10),
#elif _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_1_10 => open,
#else
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_10 => ff_cv_ch1,
#else
  FF_RX_D_1_10 => ff_cv_ch1(0),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_11 => ff_rxstatus2_ch1,
#else
  FF_RX_D_1_11 => ff_rxstatus2_ch1(0),
#endif
#elif _protocol == "PIPE"
  FF_RX_D_1_11 => RxStatus0_ch1(2),
#elif _protocol == "USERDEF"
  FF_RX_D_1_11 => ff_rxdata_ch1(11),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_11 => ff_rx_even_ch1,
#else
  FF_RX_D_1_11 => ff_rx_even_ch1(0),
#endif
#else
  FF_RX_D_1_11 => open,
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_12 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_1_12 => ff_rxdata_ch1(10),
#elif _protocol == "USERDEF"
  FF_RX_D_1_12 => ff_rxdata_ch1(12),
#elif _protocol == "PIPE"
  FF_RX_D_1_12 => RxData_ch1(8),
#else
  FF_RX_D_1_12 => ff_rxdata_ch1(8),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_13 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_1_13 => ff_rxdata_ch1(11),
#elif _protocol == "USERDEF"
  FF_RX_D_1_13 => ff_rxdata_ch1(13),
#elif _protocol == "PIPE"
  FF_RX_D_1_13 => RxData_ch1(9),
#else
  FF_RX_D_1_13 => ff_rxdata_ch1(9),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_14 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_1_14 => ff_rxdata_ch1(12),
#elif _protocol == "USERDEF"
  FF_RX_D_1_14 => ff_rxdata_ch1(14),
#elif _protocol == "PIPE"
  FF_RX_D_1_14 => RxData_ch1(10),
#else
  FF_RX_D_1_14 => ff_rxdata_ch1(10),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_15 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_1_15 => ff_rxdata_ch1(13),
#elif _protocol == "USERDEF"
  FF_RX_D_1_15 => ff_rxdata_ch1(15),
#elif _protocol == "PIPE"
  FF_RX_D_1_15 => RxData_ch1(11),
#else
  FF_RX_D_1_15 => ff_rxdata_ch1(11),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_16 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_1_16 => ff_rxdata_ch1(14),
#elif _protocol == "USERDEF"
  FF_RX_D_1_16 => ff_rxdata_ch1(16),
#elif _protocol == "PIPE"
  FF_RX_D_1_16 => RxData_ch1(12),
#else
  FF_RX_D_1_16 => ff_rxdata_ch1(12),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_17 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_1_17 => ff_rxdata_ch1(15),
#elif _protocol == "USERDEF"
  FF_RX_D_1_17 => ff_rxdata_ch1(17),
#elif _protocol == "PIPE"
  FF_RX_D_1_17 => RxData_ch1(13),
#else
  FF_RX_D_1_17 => ff_rxdata_ch1(13),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_18 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_1_18 => ff_rxdata_ch1(16),
#elif _protocol == "USERDEF"
  FF_RX_D_1_18 => ff_rxdata_ch1(18),
#elif _protocol == "PIPE"
  FF_RX_D_1_18 => RxData_ch1(14),
#else
  FF_RX_D_1_18 => ff_rxdata_ch1(14),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_19 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_1_19 => ff_rxdata_ch1(17),
#elif _protocol == "USERDEF"
  FF_RX_D_1_19 => ff_rxdata_ch1(19),
#elif _protocol == "PIPE"
  FF_RX_D_1_19 => RxData_ch1(15),
#else
  FF_RX_D_1_19 => ff_rxdata_ch1(15),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_20 => open,
#else
#if _protocol == "8BSER"
  FF_RX_D_1_20 => open,
#elif _protocol == "USERDEF"
  FF_RX_D_1_20 => ff_rxdata_ch1(20),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_1_20 => ff_rxdata_ch1(18),
#elif _protocol == "XAUI"
  FF_RX_D_1_20 => ff_rxc_ch1(1),
#elif _protocol == "PIPE"
  FF_RX_D_1_20 => RxDataK_ch1(1),
#else
  FF_RX_D_1_20 => ff_rx_k_cntrl_ch1(1),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_21 => open,
#else
#if _protocol == "8BSER" 
  FF_RX_D_1_21 => open,
#elif _protocol == "USERDEF"
  FF_RX_D_1_21 => ff_rxdata_ch1(21),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_1_21 => ff_rxdata_ch1(19),
#elif _protocol == "PCIE" 
  FF_RX_D_1_21 => ff_rxstatus0_ch1(1),
#elif _protocol == "PIPE"
  FF_RX_D_1_21 => RxStatus1_ch1(0),
#else
  FF_RX_D_1_21 => ff_disp_err_ch1(1),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_22 => open,
#else
#if _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_1_22 => open,
#elif _protocol == "USERDEF"
  FF_RX_D_1_22 => ff_rxdata_ch1(22),
#elif _protocol == "PCIE" 
  FF_RX_D_1_22 => ff_rxstatus1_ch1(1),
#elif _protocol == "PIPE"
  FF_RX_D_1_22 => RxStatus1_ch1(1),
#else
  FF_RX_D_1_22 => ff_cv_ch1(1),
#endif
#endif
#if _data_width_ch1 == "8" || _data_width_ch1 == "10"
  FF_RX_D_1_23 => open,
#else
#if _protocol == "GIGE" || _protocol == "OBSAI" 
  FF_RX_D_1_23 => ff_rx_even_ch1(1),
#elif _protocol == "USERDEF"
  FF_RX_D_1_23 => ff_rxdata_ch1(23),
#elif _protocol == "PCIE" 
  FF_RX_D_1_23 => ff_rxstatus2_ch1(1),
#elif _protocol == "PIPE"
  FF_RX_D_1_23 => RxStatus1_ch1(2),
#else
  FF_RX_D_1_23 => open,
#endif
#endif
  FFC_RRST_1 => ffc_rrst_ch1,
#if _ch1_elsm == "TRUE"
  FFC_SIGNAL_DETECT_1 => ffc_signal_detect_ch1,
  FFC_ENABLE_CGALIGN_1 => ffc_enable_cgalign_ch1,
#else
  FFC_SIGNAL_DETECT_1 => fpsc_vlo,
  FFC_ENABLE_CGALIGN_1 => fpsc_vlo,
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
  FFC_SB_PFIFO_LP_1 => fpsc_vlo,
  FFC_PFIFO_CLR_1 => ffc_pfifo_clr_ch1,
  FFC_FB_LOOPBACK_1 => fpsc_vlo,
#elif _lbtype == "PCS Parallel Loopback"
  FFC_SB_PFIFO_LP_1 => fpsc_vlo,
  FFC_PFIFO_CLR_1 => fpsc_vlo,
#if _protocol != "PIPE"
  FFC_FB_LOOPBACK_1 => fpsc_vlo,
#else
  FFC_FB_LOOPBACK_1 => fpsc_vlo,
#endif
#else
  FFC_SB_PFIFO_LP_1 => fpsc_vlo,
  FFC_PFIFO_CLR_1 => fpsc_vlo,
  FFC_FB_LOOPBACK_1 => fpsc_vlo,
#endif
#else
  FFC_SB_PFIFO_LP_1 => fpsc_vlo,
  FFC_PFIFO_CLR_1 => fpsc_vlo,
  FFC_FB_LOOPBACK_1 => fpsc_vlo,
#endif
#if _ch1_ird == "TRUE"
#if _protocol == "PIPE"
  FFC_SB_INV_RX_1 => ,
#else
  FFC_SB_INV_RX_1 => ffc_sb_inv_rx_ch1,
#endif
#else
  FFC_SB_INV_RX_1 => fpsc_vlo,
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
  FFC_PCIE_CT_1 => ffc_pcie_ct_ch1,
  FFC_PCI_DET_EN_1 => ffc_pci_det_en_ch1,
  FFS_PCIE_DONE_1 => ffs_pcie_done_ch1,
  FFS_PCIE_CON_1 => ffs_pcie_con_ch1,
#elif _protocol == "PIPE"
  FFC_PCIE_CT_1 => ,
  FFC_PCI_DET_EN_1 => ,
  FFS_PCIE_DONE_1 => ,
  FFS_PCIE_CON_1 => ,
#else
  FFC_PCIE_CT_1 => fpsc_vlo,
  FFC_PCI_DET_EN_1 => fpsc_vlo,
  FFS_PCIE_DONE_1 => open,
  FFS_PCIE_CON_1 => open,
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch1_teidle == "TRUE")
  FFC_EI_EN_1 => ffc_ei_en_ch1,
#else
  FFC_EI_EN_1 => fpsc_vlo,
#endif
  FFC_LANE_TX_RST_1 => ffc_lane_tx_rst_ch1,
  FFC_LANE_RX_RST_1 => ffc_lane_rx_rst_ch1,
  FFC_TXPWDNB_1 => ffc_txpwdnb_ch1,
  FFC_RXPWDNB_1 => ffc_rxpwdnb_ch1,
#if _protocol == "PIPE"
  FFS_RLOS_LO_1 => ,
#elif _protocol == "SATA_I"
  FFS_RLOS_LO_1 => ffs_sata_oob_rx_ch1,
#else
  FFS_RLOS_LO_1 => ffs_rlos_lo_ch1,
#endif
#if _protocol == "8BSER"
  FFS_LS_SYNC_STATUS_1 => open,
#else
#if _comma_align == "AUTO"
  FFS_LS_SYNC_STATUS_1 => ffs_ls_sync_status_ch1,
#else
  FFS_LS_SYNC_STATUS_1 => open,
#endif
#endif
#if _errsports == "TRUE"
  FFS_CC_UNDERRUN_1 => ffs_cc_underrun_ch1,
  FFS_CC_OVERRUN_1 => ffs_cc_overrun_ch1,
  FFS_RXFBFIFO_ERROR_1 => ffs_rxfbfifo_error_ch1,
  FFS_TXFBFIFO_ERROR_1 => ffs_txfbfifo_error_ch1,
#else
  FFS_CC_UNDERRUN_1 => open,
  FFS_CC_OVERRUN_1 => open,
  FFS_RXFBFIFO_ERROR_1 => open,
  FFS_TXFBFIFO_ERROR_1 => open,
#endif
  FFS_RLOL_1 => ffs_rlol_ch1,
  OOB_OUT_1 => oob_out_ch1,
#endif
#if _ch2_mode == "DISABLE" 
  HDINP2 => fpsc_vlo,
  HDINN2 => fpsc_vlo,
  HDOUTP2 => open,
  HDOUTN2 => open,
  SCISELCH2 => fpsc_vlo,
  SCIENCH2 => fpsc_vlo,
  FF_RXI_CLK_2 => fpsc_vlo,
  FF_TXI_CLK_2 => fpsc_vlo,
  FF_EBRD_CLK_2 => fpsc_vlo,
  FF_RX_F_CLK_2 => open,
  FF_RX_H_CLK_2 => open,
  FF_RX_Q_CLK_2 => open,
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
  FFC_RRST_2 => fpsc_vlo,
  FFC_SIGNAL_DETECT_2 => fpsc_vlo,
  FFC_SB_PFIFO_LP_2 => fpsc_vlo,
  FFC_SB_INV_RX_2 => fpsc_vlo,
  FFC_PFIFO_CLR_2 => fpsc_vlo,
  FFC_PCIE_CT_2 => fpsc_vlo,
  FFC_PCI_DET_EN_2 => fpsc_vlo,
  FFC_FB_LOOPBACK_2 => fpsc_vlo,
  FFC_ENABLE_CGALIGN_2 => fpsc_vlo,
  FFC_EI_EN_2 => fpsc_vlo,
  FFC_LANE_TX_RST_2 => fpsc_vlo,
  FFC_LANE_RX_RST_2 => fpsc_vlo,
  FFC_TXPWDNB_2 => fpsc_vlo,
  FFC_RXPWDNB_2 => fpsc_vlo,
  FFS_RLOS_LO_2 => open,
  FFS_PCIE_DONE_2 => open,
  FFS_PCIE_CON_2 => open,
  FFS_LS_SYNC_STATUS_2 => open,
  FFS_CC_UNDERRUN_2 => open,
  FFS_CC_OVERRUN_2 => open,
  FFS_RLOL_2 => open,
  FFS_RXFBFIFO_ERROR_2 => open,
  FFS_TXFBFIFO_ERROR_2 => open,
  OOB_OUT_2 => open,
#else
  HDINP2 => hdinp2,
  HDINN2 => hdinn2,
  HDOUTP2 => hdoutp2,
  HDOUTN2 => hdoutn2,
#if _sci_ports == "TRUE"
  SCISELCH2 => scisel_ch2,
  SCIENCH2 => scien_ch2,
#else
  SCISELCH2 => fpsc_vlo,
  SCIENCH2 => fpsc_vlo,
#endif
  FF_RXI_CLK_2 => ff_rxiclk_ch2,
  FF_TXI_CLK_2 => ff_txiclk_ch2,
  FF_EBRD_CLK_2 => ff_ebrd_clk_2,
  FF_RX_F_CLK_2 => ff_rxfullclk_ch2,
#if _data_width_ch2 == "8" || _data_width_ch2 == "10" && _ch2_ctc_byp == "BYPASS"
  FF_RX_H_CLK_2 => open,
#elif _data_width_ch2 == "16" || _data_width_ch2 == "20" && _ch2_ctc_byp == "BYPASS"
  FF_RX_H_CLK_2 => ff_rxhalfclk_ch2,
#endif
#if _pllqclkports == "TRUE"
  FF_RX_Q_CLK_2 => ff_rxqtrclk_ch2,
#else
  FF_RX_Q_CLK_2 => open,
#endif
#if _protocol == "PIPE"
  FF_TX_D_2_0 => TxData_ch2(0),
  FF_TX_D_2_1 => TxData_ch2(1),
  FF_TX_D_2_2 => TxData_ch2(2),
  FF_TX_D_2_3 => TxData_ch2(3),
  FF_TX_D_2_4 => TxData_ch2(4),
  FF_TX_D_2_5 => TxData_ch2(5),
  FF_TX_D_2_6 => TxData_ch2(6),
  FF_TX_D_2_7 => TxData_ch2(7),
#else
  FF_TX_D_2_0 => ff_txdata_ch2(0),
  FF_TX_D_2_1 => ff_txdata_ch2(1),
  FF_TX_D_2_2 => ff_txdata_ch2(2),
  FF_TX_D_2_3 => ff_txdata_ch2(3),
  FF_TX_D_2_4 => ff_txdata_ch2(4),
  FF_TX_D_2_5 => ff_txdata_ch2(5),
  FF_TX_D_2_6 => ff_txdata_ch2(6),
  FF_TX_D_2_7 => ff_txdata_ch2(7),
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_TX_D_2_8 => ff_tx_k_cntrl_ch2,
#else
  FF_TX_D_2_8 => ff_tx_k_cntrl_ch2(0),
#endif
#elif _protocol == "XAUI"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_TX_D_2_8 => ff_txc_ch2,
#else
  FF_TX_D_2_8 => ff_txc_ch2(0),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_TX_D_2_8 => TxDataK_ch2,
#else
  FF_TX_D_2_8 => TxDataK_ch2(0),
#endif
#elif _protocol == "8BSER"
  FF_TX_D_2_8 => fpsc_vlo,
#else
  FF_TX_D_2_8 => ff_txdata_ch2(8),
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_TX_D_2_9 => ff_force_disp_ch2,
#else
  FF_TX_D_2_9 => ff_force_disp_ch2(0),
#endif
#elif _protocol == "10BSER" || _protocol == "USERDEF" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "CPRI"
  FF_TX_D_2_9 => ff_txdata_ch2(9),
#elif _protocol == "PIPE"
  FF_TX_D_2_9 => ,
#else
  FF_TX_D_2_9 => fpsc_vlo,
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_TX_D_2_10 => ff_disp_sel_ch2,
#else
  FF_TX_D_2_10 => ff_disp_sel_ch2(0),
#endif
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_TX_D_2_10 => ff_xmit_ch2,
#else
  FF_TX_D_2_10 => ff_xmit_ch2(0),
#endif
#elif _protocol == "USERDEF"
  FF_TX_D_2_10 => ff_txdata_ch2(10),
#elif _protocol == "PIPE"
  FF_TX_D_2_10 => ,
#else
  FF_TX_D_2_10 => fpsc_vlo,
#endif
#if _protocol == "PCIE" || _protocol == "PIPE"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_TX_D_2_11 => ff_pci_ei_en_ch2,
#else
  FF_TX_D_2_11 => ff_pci_ei_en_ch2(0),
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_TX_D_2_11 => ff_correct_disp_ch2,
#else
  FF_TX_D_2_11 => ff_correct_disp_ch2(0),
#endif
#elif _protocol == "USERDEF"
  FF_TX_D_2_11 => ff_txdata_ch2(11),
#else
  FF_TX_D_2_11 => fpsc_vlo,
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_2_12 => ff_txdata_ch2(12),
#elif _protocol == "PIPE"
  FF_TX_D_2_12 => TxData_ch2(8),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_2_12 => ff_txdata_ch2(10),
#else
  FF_TX_D_2_12 => ff_txdata_ch2(8),
#endif
#else
  FF_TX_D_2_12 => fpsc_vlo,
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_2_13 => ff_txdata_ch2(13),
#elif _protocol == "PIPE"
  FF_TX_D_2_13 => TxData_ch2(9),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_2_13 => ff_txdata_ch2(11),
#else
  FF_TX_D_2_13 => ff_txdata_ch2(9),
#endif
#else
  FF_TX_D_2_13 => fpsc_vlo,
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_2_14 => ff_txdata_ch2(14),
#elif _protocol == "PIPE"
  FF_TX_D_2_14 => TxData_ch2(10),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_2_14 => ff_txdata_ch2(12),
#else
  FF_TX_D_2_14 => ff_txdata_ch2(10),
#endif
#else
  FF_TX_D_2_14 => fpsc_vlo,
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_2_15 => ff_txdata_ch2(15),
#elif _protocol == "PIPE"
  FF_TX_D_2_15 => TxData_ch2(11),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_2_15 => ff_txdata_ch2(13),
#else
  FF_TX_D_2_15 => ff_txdata_ch2(11),
#endif
#else
  FF_TX_D_2_15 => fpsc_vlo,
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_2_16 => ff_txdata_ch2(16),
#elif _protocol == "PIPE"
  FF_TX_D_2_16 => TxData_ch2(12),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_2_16 => ff_txdata_ch2(14),
#else
  FF_TX_D_2_16 => ff_txdata_ch2(12),
#endif
#else
  FF_TX_D_2_16 => fpsc_vlo,
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_2_17 => ff_txdata_ch2(17),
#elif _protocol == "PIPE"
  FF_TX_D_2_17 => TxData_ch2(13),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_2_17 => ff_txdata_ch2(15),
#else
  FF_TX_D_2_17 => ff_txdata_ch2(13),
#endif
#else
  FF_TX_D_2_17 => fpsc_vlo,
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_2_18 => ff_txdata_ch2(18),
#elif _protocol == "PIPE"
  FF_TX_D_2_18 => TxData_ch2(14),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_2_18 => ff_txdata_ch2(16),
#else
  FF_TX_D_2_18 => ff_txdata_ch2(14),
#endif
#else
  FF_TX_D_2_18 => fpsc_vlo,
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_2_19 => ff_txdata_ch2(19),
#elif _protocol == "PIPE"
  FF_TX_D_2_19 => TxData_ch2(15),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_2_19 => ff_txdata_ch2(17),
#else
  FF_TX_D_2_19 => ff_txdata_ch2(15),
#endif
#else
  FF_TX_D_2_19 => fpsc_vlo,
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_2_20 => ff_txdata_ch2(20),
#elif _protocol == "XAUI"
  FF_TX_D_2_20 => ff_txc_ch2(1),
#elif _protocol == "PIPE"
  FF_TX_D_2_20 => TxDataK_ch2(1),
#elif _protocol == "8BSER"
  FF_TX_D_2_20 => fpsc_vlo,
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_TX_D_2_20 => ff_txdata_ch2(18),
#else
  FF_TX_D_2_20 => ff_tx_k_cntrl_ch2(1),
#endif
#else
  FF_TX_D_2_20 => fpsc_vlo,
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_2_21 => ff_txdata_ch2(21),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_TX_D_2_21 => ff_txdata_ch2(19),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
  FF_TX_D_2_21 => ff_force_disp_ch2(1),
#else
  FF_TX_D_2_21 => fpsc_vlo,
#endif
#else
  FF_TX_D_2_21 => fpsc_vlo,
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_2_22 => ff_txdata_ch2(22),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
  FF_TX_D_2_22 => ff_xmit_ch2(1),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
  FF_TX_D_2_22 => ff_disp_sel_ch2(1),
#else
  FF_TX_D_2_22 => fpsc_vlo,
#endif
#else
  FF_TX_D_2_22 => fpsc_vlo,
#endif
#if _data_width_ch2 == "16" || _data_width_ch2 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_2_23 => ff_txdata_ch2(23),
#elif _protocol == "PCIE" || _protocol == "PIPE"
  FF_TX_D_2_23 => ff_pci_ei_en_ch2(1),
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI"
  FF_TX_D_2_23 => ff_correct_disp_ch2(1),
#else
  FF_TX_D_2_23 => fpsc_vlo,
#endif
#else
  FF_TX_D_2_23 => fpsc_vlo,
#endif
#if _protocol == "PIPE"
  FF_RX_D_2_0 => RxData_ch2(0),
  FF_RX_D_2_1 => RxData_ch2(1),
  FF_RX_D_2_2 => RxData_ch2(2),
  FF_RX_D_2_3 => RxData_ch2(3),
  FF_RX_D_2_4 => RxData_ch2(4),
  FF_RX_D_2_5 => RxData_ch2(5),
  FF_RX_D_2_6 => RxData_ch2(6),
  FF_RX_D_2_7 => RxData_ch2(7),
#else
  FF_RX_D_2_0 => ff_rxdata_ch2(0),
  FF_RX_D_2_1 => ff_rxdata_ch2(1),
  FF_RX_D_2_2 => ff_rxdata_ch2(2),
  FF_RX_D_2_3 => ff_rxdata_ch2(3),
  FF_RX_D_2_4 => ff_rxdata_ch2(4),
  FF_RX_D_2_5 => ff_rxdata_ch2(5),
  FF_RX_D_2_6 => ff_rxdata_ch2(6),
  FF_RX_D_2_7 => ff_rxdata_ch2(7),
#endif
#if _protocol == "XAUI"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_8 => ff_rxc_ch2,
#else
  FF_RX_D_2_8 => ff_rxc_ch2(0),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_8 => RxDataK_ch2,
#else
  FF_RX_D_2_8 => RxDataK_ch2(0),
#endif
#elif _protocol == "8BSER"
  FF_RX_D_2_8 => open,
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
  FF_RX_D_2_8 => ff_rxdata_ch2(8),
#else
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_8 => ff_rx_k_cntrl_ch2,
#else
  FF_RX_D_2_8 => ff_rx_k_cntrl_ch2(0),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_9 => ff_rxstatus0_ch2,
#else
  FF_RX_D_2_9 => ff_rxstatus0_ch2(0),
#endif
#elif _protocol == "PIPE"
  FF_RX_D_2_9 => RxStatus0_ch2(0),
#elif _protocol == "8BSER" 
  FF_RX_D_2_9 => open,
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
  FF_RX_D_2_9 => ff_rxdata_ch2(9),
#else
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_9 => ff_disp_err_ch2,
#else
  FF_RX_D_2_9 => ff_disp_err_ch2(0),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_10 => ff_rxstatus1_ch2,
#else
  FF_RX_D_2_10 => ff_rxstatus1_ch2(0),
#endif
#elif _protocol == "PIPE"
  FF_RX_D_2_10 => RxStatus0_ch2(1),
#elif _protocol == "USERDEF"
  FF_RX_D_2_10 => ff_rxdata_ch2(10),
#elif _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_2_10 => open,
#else
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_10 => ff_cv_ch2,
#else
  FF_RX_D_2_10 => ff_cv_ch2(0),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_11 => ff_rxstatus2_ch2,
#else
  FF_RX_D_2_11 => ff_rxstatus2_ch2(0),
#endif
#elif _protocol == "PIPE"
  FF_RX_D_2_11 => RxStatus0_ch2(2),
#elif _protocol == "USERDEF"
  FF_RX_D_2_11 => ff_rxdata_ch2(11),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_11 => ff_rx_even_ch2,
#else
  FF_RX_D_2_11 => ff_rx_even_ch2(0),
#endif
#else
  FF_RX_D_2_11 => open,
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_12 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_2_12 => ff_rxdata_ch2(10),
#elif _protocol == "USERDEF"
  FF_RX_D_2_12 => ff_rxdata_ch2(12),
#elif _protocol == "PIPE"
  FF_RX_D_2_12 => RxData_ch2(8),
#else
  FF_RX_D_2_12 => ff_rxdata_ch2(8),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_13 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_2_13 => ff_rxdata_ch2(11),
#elif _protocol == "USERDEF"
  FF_RX_D_2_13 => ff_rxdata_ch2(13),
#elif _protocol == "PIPE"
  FF_RX_D_2_13 => RxData_ch2(9),
#else
  FF_RX_D_2_13 => ff_rxdata_ch2(9),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_14 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_2_14 => ff_rxdata_ch2(12),
#elif _protocol == "USERDEF"
  FF_RX_D_2_14 => ff_rxdata_ch2(14),
#elif _protocol == "PIPE"
  FF_RX_D_2_14 => RxData_ch2(10),
#else
  FF_RX_D_2_14 => ff_rxdata_ch2(10),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_15 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_2_15 => ff_rxdata_ch2(13),
#elif _protocol == "USERDEF"
  FF_RX_D_2_15 => ff_rxdata_ch2(15),
#elif _protocol == "PIPE"
  FF_RX_D_2_15 => RxData_ch2(11),
#else
  FF_RX_D_2_15 => ff_rxdata_ch2(11),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_16 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_2_16 => ff_rxdata_ch2(14),
#elif _protocol == "USERDEF"
  FF_RX_D_2_16 => ff_rxdata_ch2(16),
#elif _protocol == "PIPE"
  FF_RX_D_2_16 => RxData_ch2(12),
#else
  FF_RX_D_2_16 => ff_rxdata_ch2(12),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_17 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_2_17 => ff_rxdata_ch2(15),
#elif _protocol == "USERDEF"
  FF_RX_D_2_17 => ff_rxdata_ch2(17),
#elif _protocol == "PIPE"
  FF_RX_D_2_17 => RxData_ch2(13),
#else
  FF_RX_D_2_17 => ff_rxdata_ch2(13),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_18 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_2_18 => ff_rxdata_ch2(16),
#elif _protocol == "USERDEF"
  FF_RX_D_2_18 => ff_rxdata_ch2(18),
#elif _protocol == "PIPE"
  FF_RX_D_2_18 => RxData_ch2(14),
#else
  FF_RX_D_2_18 => ff_rxdata_ch2(14),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_19 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_2_19 => ff_rxdata_ch2(17),
#elif _protocol == "USERDEF"
  FF_RX_D_2_19 => ff_rxdata_ch2(19),
#elif _protocol == "PIPE"
  FF_RX_D_2_19 => RxData_ch2(15),
#else
  FF_RX_D_2_19 => ff_rxdata_ch2(15),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_20 => open,
#else
#if _protocol == "8BSER"
  FF_RX_D_2_20 => open,
#elif _protocol == "USERDEF"
  FF_RX_D_2_20 => ff_rxdata_ch2(20),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_2_20 => ff_rxdata_ch2(18),
#elif _protocol == "XAUI"
  FF_RX_D_2_20 => ff_rxc_ch2(1),
#elif _protocol == "PIPE"
  FF_RX_D_2_20 => RxDataK_ch2(1),
#else
  FF_RX_D_2_20 => ff_rx_k_cntrl_ch2(1),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_21 => open,
#else
#if _protocol == "8BSER" 
  FF_RX_D_2_21 => open,
#elif _protocol == "USERDEF"
  FF_RX_D_2_21 => ff_rxdata_ch2(21),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_2_21 => ff_rxdata_ch2(19),
#elif _protocol == "PCIE" 
  FF_RX_D_2_21 => ff_rxstatus0_ch2(1),
#elif _protocol == "PIPE"
  FF_RX_D_2_21 => RxStatus1_ch2(0),
#else
  FF_RX_D_2_21 => ff_disp_err_ch2(1),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_22 => open,
#else
#if _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_2_22 => open,
#elif _protocol == "USERDEF"
  FF_RX_D_2_22 => ff_rxdata_ch2(22),
#elif _protocol == "PCIE" 
  FF_RX_D_2_22 => ff_rxstatus1_ch2(1),
#elif _protocol == "PIPE"
  FF_RX_D_2_22 => RxStatus1_ch2(1),
#else
  FF_RX_D_2_22 => ff_cv_ch2(1),
#endif
#endif
#if _data_width_ch2 == "8" || _data_width_ch2 == "10"
  FF_RX_D_2_23 => open,
#else
#if _protocol == "GIGE" || _protocol == "OBSAI" 
  FF_RX_D_2_23 => ff_rx_even_ch2(1),
#elif _protocol == "USERDEF"
  FF_RX_D_2_23 => ff_rxdata_ch2(23),
#elif _protocol == "PCIE" 
  FF_RX_D_2_23 => ff_rxstatus2_ch2(1),
#elif _protocol == "PIPE"
  FF_RX_D_2_23 => RxStatus1_ch2(2),
#else
  FF_RX_D_2_23 => open,
#endif
#endif
  FFC_RRST_2 => ffc_rrst_ch2,
#if _ch2_elsm == "TRUE"
  FFC_SIGNAL_DETECT_2 => ffc_signal_detect_ch2,
  FFC_ENABLE_CGALIGN_2 => ffc_enable_cgalign_ch2,
#else
  FFC_SIGNAL_DETECT_2 => fpsc_vlo,
  FFC_ENABLE_CGALIGN_2 => fpsc_vlo,
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
  FFC_SB_PFIFO_LP_2 => fpsc_vlo,
  FFC_PFIFO_CLR_2 => ffc_pfifo_clr_ch2,
  FFC_FB_LOOPBACK_2 => fpsc_vlo,
#elif _lbtype == "PCS Parallel Loopback"
  FFC_SB_PFIFO_LP_2 => fpsc_vlo,
  FFC_PFIFO_CLR_2 => fpsc_vlo,
#if _protocol != "PIPE"
  FFC_FB_LOOPBACK_2 => fpsc_vlo,
#else
  FFC_FB_LOOPBACK_2 => fpsc_vlo,
#endif
#else
  FFC_SB_PFIFO_LP_2 => fpsc_vlo,
  FFC_PFIFO_CLR_2 => fpsc_vlo,
  FFC_FB_LOOPBACK_2 => fpsc_vlo,
#endif
#else
  FFC_SB_PFIFO_LP_2 => fpsc_vlo,
  FFC_PFIFO_CLR_2 => fpsc_vlo,
  FFC_FB_LOOPBACK_2 => fpsc_vlo,
#endif
#if _ch2_ird == "TRUE"
#if _protocol == "PIPE"
  FFC_SB_INV_RX_2 => ,
#else
  FFC_SB_INV_RX_2 => ffc_sb_inv_rx_ch2,
#endif
#else
  FFC_SB_INV_RX_2 => fpsc_vlo,
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
  FFC_PCIE_CT_2 => ffc_pcie_ct_ch2,
  FFC_PCI_DET_EN_2 => ffc_pci_det_en_ch2,
  FFS_PCIE_DONE_2 => ffs_pcie_done_ch2,
  FFS_PCIE_CON_2 => ffs_pcie_con_ch2,
#elif _protocol == "PIPE"
  FFC_PCIE_CT_2 => ,
  FFC_PCI_DET_EN_2 => ,
  FFS_PCIE_DONE_2 => ,
  FFS_PCIE_CON_2 => ,
#else
  FFC_PCIE_CT_2 => fpsc_vlo,
  FFC_PCI_DET_EN_2 => fpsc_vlo,
  FFS_PCIE_DONE_2 => open,
  FFS_PCIE_CON_2 => open,
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch2_teidle == "TRUE")
  FFC_EI_EN_2 => ffc_ei_en_ch2,
#else
  FFC_EI_EN_2 => fpsc_vlo,
#endif
  FFC_LANE_TX_RST_2 => ffc_lane_tx_rst_ch2,
  FFC_LANE_RX_RST_2 => ffc_lane_rx_rst_ch2,
  FFC_TXPWDNB_2 => ffc_txpwdnb_ch2,
  FFC_RXPWDNB_2 => ffc_rxpwdnb_ch2,
#if _protocol == "PIPE"
  FFS_RLOS_LO_2 => ,
#elif _protocol == "SATA_I"
  FFS_RLOS_LO_2 => ffs_sata_oob_rx_ch2,
#else
  FFS_RLOS_LO_2 => ffs_rlos_lo_ch2,
#endif
#if _protocol == "8BSER"
  FFS_LS_SYNC_STATUS_2 => open,
#else
#if _comma_align == "AUTO"
  FFS_LS_SYNC_STATUS_2 => ffs_ls_sync_status_ch2,
#else
  FFS_LS_SYNC_STATUS_2 => open,
#endif
#endif
#if _errsports == "TRUE"
  FFS_CC_UNDERRUN_2 => ffs_cc_underrun_ch2,
  FFS_CC_OVERRUN_2 => ffs_cc_overrun_ch2,
  FFS_RXFBFIFO_ERROR_2 => ffs_rxfbfifo_error_ch2,
  FFS_TXFBFIFO_ERROR_2 => ffs_txfbfifo_error_ch2,
#else
  FFS_CC_UNDERRUN_2 => open,
  FFS_CC_OVERRUN_2 => open,
  FFS_RXFBFIFO_ERROR_2 => open,
  FFS_TXFBFIFO_ERROR_2 => open,
#endif
  FFS_RLOL_2 => ffs_rlol_ch2,
  OOB_OUT_2 => oob_out_ch2,
#endif
#if _ch3_mode == "DISABLE" 
  HDINP3 => fpsc_vlo,
  HDINN3 => fpsc_vlo,
  HDOUTP3 => open,
  HDOUTN3 => open,
  SCISELCH3 => fpsc_vlo,
  SCIENCH3 => fpsc_vlo,
  FF_RXI_CLK_3 => fpsc_vlo,
  FF_TXI_CLK_3 => fpsc_vlo,
  FF_EBRD_CLK_3 => fpsc_vlo,
  FF_RX_F_CLK_3 => open,
  FF_RX_H_CLK_3 => open,
  FF_RX_Q_CLK_3 => open,
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
  FFC_RRST_3 => fpsc_vlo,
  FFC_SIGNAL_DETECT_3 => fpsc_vlo,
  FFC_SB_PFIFO_LP_3 => fpsc_vlo,
  FFC_SB_INV_RX_3 => fpsc_vlo,
  FFC_PFIFO_CLR_3 => fpsc_vlo,
  FFC_PCIE_CT_3 => fpsc_vlo,
  FFC_PCI_DET_EN_3 => fpsc_vlo,
  FFC_FB_LOOPBACK_3 => fpsc_vlo,
  FFC_ENABLE_CGALIGN_3 => fpsc_vlo,
  FFC_EI_EN_3 => fpsc_vlo,
  FFC_LANE_TX_RST_3 => fpsc_vlo,
  FFC_LANE_RX_RST_3 => fpsc_vlo,
  FFC_TXPWDNB_3 => fpsc_vlo,
  FFC_RXPWDNB_3 => fpsc_vlo,
  FFS_RLOS_LO_3 => open,
  FFS_PCIE_DONE_3 => open,
  FFS_PCIE_CON_3 => open,
  FFS_LS_SYNC_STATUS_3 => open,
  FFS_CC_UNDERRUN_3 => open,
  FFS_CC_OVERRUN_3 => open,
  FFS_RLOL_3 => open,
  FFS_RXFBFIFO_ERROR_3 => open,
  FFS_TXFBFIFO_ERROR_3 => open,
  OOB_OUT_3 => open,
#else
  HDINP3 => hdinp3,
  HDINN3 => hdinn3,
  HDOUTP3 => hdoutp3,
  HDOUTN3 => hdoutn3,
#if _sci_ports == "TRUE"
  SCISELCH3 => scisel_ch3,
  SCIENCH3 => scien_ch3,
#else
  SCISELCH3 => fpsc_vlo,
  SCIENCH3 => fpsc_vlo,
#endif
  FF_RXI_CLK_3 => ff_rxiclk_ch3,
  FF_TXI_CLK_3 => ff_txiclk_ch3,
  FF_EBRD_CLK_3 => ff_ebrd_clk_3,
  FF_RX_F_CLK_3 => ff_rxfullclk_ch3,
#if _data_width_ch3 == "8" || _data_width_ch3 == "10" && _ch3_ctc_byp == "BYPASS"
  FF_RX_H_CLK_3 => open,
#elif _data_width_ch3 == "16" || _data_width_ch3 == "20" && _ch3_ctc_byp == "BYPASS"
  FF_RX_H_CLK_3 => ff_rxhalfclk_ch3,
#endif
#if _pllqclkports == "TRUE"
  FF_RX_Q_CLK_3 => ff_rxqtrclk_ch3,
#else
  FF_RX_Q_CLK_3 => open,
#endif
#if _protocol == "PIPE"
  FF_TX_D_3_0 => TxData_ch3(0),
  FF_TX_D_3_1 => TxData_ch3(1),
  FF_TX_D_3_2 => TxData_ch3(2),
  FF_TX_D_3_3 => TxData_ch3(3),
  FF_TX_D_3_4 => TxData_ch3(4),
  FF_TX_D_3_5 => TxData_ch3(5),
  FF_TX_D_3_6 => TxData_ch3(6),
  FF_TX_D_3_7 => TxData_ch3(7),
#else
  FF_TX_D_3_0 => ff_txdata_ch3(0),
  FF_TX_D_3_1 => ff_txdata_ch3(1),
  FF_TX_D_3_2 => ff_txdata_ch3(2),
  FF_TX_D_3_3 => ff_txdata_ch3(3),
  FF_TX_D_3_4 => ff_txdata_ch3(4),
  FF_TX_D_3_5 => ff_txdata_ch3(5),
  FF_TX_D_3_6 => ff_txdata_ch3(6),
  FF_TX_D_3_7 => ff_txdata_ch3(7),
#endif
#if _protocol == "CPRI" || _protocol == "GIGE" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "OBSAI" || _protocol == "SATA_I" || _protocol == "SATA_II" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_TX_D_3_8 => ff_tx_k_cntrl_ch3,
#else
  FF_TX_D_3_8 => ff_tx_k_cntrl_ch3(0),
#endif
#elif _protocol == "XAUI"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_TX_D_3_8 => ff_txc_ch3,
#else
  FF_TX_D_3_8 => ff_txc_ch3(0),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_TX_D_3_8 => TxDataK_ch3,
#else
  FF_TX_D_3_8 => TxDataK_ch3(0),
#endif
#elif _protocol == "8BSER"
  FF_TX_D_3_8 => fpsc_vlo,
#else
  FF_TX_D_3_8 => ff_txdata_ch3(8),
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_TX_D_3_9 => ff_force_disp_ch3,
#else
  FF_TX_D_3_9 => ff_force_disp_ch3(0),
#endif
#elif _protocol == "10BSER" || _protocol == "USERDEF" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "CPRI"
  FF_TX_D_3_9 => ff_txdata_ch3(9),
#elif _protocol == "PIPE"
  FF_TX_D_3_9 => ,
#else
  FF_TX_D_3_9 => fpsc_vlo,
#endif
#if _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_TX_D_3_10 => ff_disp_sel_ch3,
#else
  FF_TX_D_3_10 => ff_disp_sel_ch3(0),
#endif
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_TX_D_3_10 => ff_xmit_ch3,
#else
  FF_TX_D_3_10 => ff_xmit_ch3(0),
#endif
#elif _protocol == "USERDEF"
  FF_TX_D_3_10 => ff_txdata_ch3(10),
#elif _protocol == "PIPE"
  FF_TX_D_3_10 => ,
#else
  FF_TX_D_3_10 => fpsc_vlo,
#endif
#if _protocol == "PCIE" || _protocol == "PIPE"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_TX_D_3_11 => ff_pci_ei_en_ch3,
#else
  FF_TX_D_3_11 => ff_pci_ei_en_ch3(0),
#endif
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_TX_D_3_11 => ff_correct_disp_ch3,
#else
  FF_TX_D_3_11 => ff_correct_disp_ch3(0),
#endif
#elif _protocol == "USERDEF"
  FF_TX_D_3_11 => ff_txdata_ch3(11),
#else
  FF_TX_D_3_11 => fpsc_vlo,
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_3_12 => ff_txdata_ch3(12),
#elif _protocol == "PIPE"
  FF_TX_D_3_12 => TxData_ch3(8),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_3_12 => ff_txdata_ch3(10),
#else
  FF_TX_D_3_12 => ff_txdata_ch3(8),
#endif
#else
  FF_TX_D_3_12 => fpsc_vlo,
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_3_13 => ff_txdata_ch3(13),
#elif _protocol == "PIPE"
  FF_TX_D_3_13 => TxData_ch3(9),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_3_13 => ff_txdata_ch3(11),
#else
  FF_TX_D_3_13 => ff_txdata_ch3(9),
#endif
#else
  FF_TX_D_3_13 => fpsc_vlo,
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_3_14 => ff_txdata_ch3(14),
#elif _protocol == "PIPE"
  FF_TX_D_3_14 => TxData_ch3(10),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_3_14 => ff_txdata_ch3(12),
#else
  FF_TX_D_3_14 => ff_txdata_ch3(10),
#endif
#else
  FF_TX_D_3_14 => fpsc_vlo,
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_3_15 => ff_txdata_ch3(15),
#elif _protocol == "PIPE"
  FF_TX_D_3_15 => TxData_ch3(11),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_3_15 => ff_txdata_ch3(13),
#else
  FF_TX_D_3_15 => ff_txdata_ch3(11),
#endif
#else
  FF_TX_D_3_15 => fpsc_vlo,
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_3_16 => ff_txdata_ch3(16),
#elif _protocol == "PIPE"
  FF_TX_D_3_16 => TxData_ch3(12),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_3_16 => ff_txdata_ch3(14),
#else
  FF_TX_D_3_16 => ff_txdata_ch3(12),
#endif
#else
  FF_TX_D_3_16 => fpsc_vlo,
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_3_17 => ff_txdata_ch3(17),
#elif _protocol == "PIPE"
  FF_TX_D_3_17 => TxData_ch3(13),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_3_17 => ff_txdata_ch3(15),
#else
  FF_TX_D_3_17 => ff_txdata_ch3(13),
#endif
#else
  FF_TX_D_3_17 => fpsc_vlo,
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_3_18 => ff_txdata_ch3(18),
#elif _protocol == "PIPE"
  FF_TX_D_3_18 => TxData_ch3(14),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_3_18 => ff_txdata_ch3(16),
#else
  FF_TX_D_3_18 => ff_txdata_ch3(14),
#endif
#else
  FF_TX_D_3_18 => fpsc_vlo,
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_3_19 => ff_txdata_ch3(19),
#elif _protocol == "PIPE"
  FF_TX_D_3_19 => TxData_ch3(15),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_TX_D_3_19 => ff_txdata_ch3(17),
#else
  FF_TX_D_3_19 => ff_txdata_ch3(15),
#endif
#else
  FF_TX_D_3_19 => fpsc_vlo,
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_3_20 => ff_txdata_ch3(20),
#elif _protocol == "XAUI"
  FF_TX_D_3_20 => ff_txc_ch3(1),
#elif _protocol == "PIPE"
  FF_TX_D_3_20 => TxDataK_ch3(1),
#elif _protocol == "8BSER"
  FF_TX_D_3_20 => fpsc_vlo,
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_TX_D_3_20 => ff_txdata_ch3(18),
#else
  FF_TX_D_3_20 => ff_tx_k_cntrl_ch3(1),
#endif
#else
  FF_TX_D_3_20 => fpsc_vlo,
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_3_21 => ff_txdata_ch3(21),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_TX_D_3_21 => ff_txdata_ch3(19),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
  FF_TX_D_3_21 => ff_force_disp_ch3(1),
#else
  FF_TX_D_3_21 => fpsc_vlo,
#endif
#else
  FF_TX_D_3_21 => fpsc_vlo,
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_3_22 => ff_txdata_ch3(22),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
  FF_TX_D_3_22 => ff_xmit_ch3(1),
#elif _protocol == "PIPE" || _protocol == "CPRI" || _protocol == "SRIOT1" || _protocol == "SRIOT2" || _protocol == "SRIOT3" || _protocol == "PCIE" || _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "G8B10B" || _protocol == "SATA_I"
  FF_TX_D_3_22 => ff_disp_sel_ch3(1),
#else
  FF_TX_D_3_22 => fpsc_vlo,
#endif
#else
  FF_TX_D_3_22 => fpsc_vlo,
#endif
#if _data_width_ch3 == "16" || _data_width_ch3 == "20"
#if _protocol == "USERDEF"
  FF_TX_D_3_23 => ff_txdata_ch3(23),
#elif _protocol == "PCIE" || _protocol == "PIPE"
  FF_TX_D_3_23 => ff_pci_ei_en_ch3(1),
#elif _protocol == "1GFC" || _protocol == "2GFC" || _protocol == "GIGE" || _protocol == "OBSAI" 
  FF_TX_D_3_23 => ff_correct_disp_ch3(1),
#else
  FF_TX_D_3_23 => fpsc_vlo,
#endif
#else
  FF_TX_D_3_23 => fpsc_vlo,
#endif
#if _protocol == "PIPE"
  FF_RX_D_3_0 => RxData_ch3(0),
  FF_RX_D_3_1 => RxData_ch3(1),
  FF_RX_D_3_2 => RxData_ch3(2),
  FF_RX_D_3_3 => RxData_ch3(3),
  FF_RX_D_3_4 => RxData_ch3(4),
  FF_RX_D_3_5 => RxData_ch3(5),
  FF_RX_D_3_6 => RxData_ch3(6),
  FF_RX_D_3_7 => RxData_ch3(7),
#else
  FF_RX_D_3_0 => ff_rxdata_ch3(0),
  FF_RX_D_3_1 => ff_rxdata_ch3(1),
  FF_RX_D_3_2 => ff_rxdata_ch3(2),
  FF_RX_D_3_3 => ff_rxdata_ch3(3),
  FF_RX_D_3_4 => ff_rxdata_ch3(4),
  FF_RX_D_3_5 => ff_rxdata_ch3(5),
  FF_RX_D_3_6 => ff_rxdata_ch3(6),
  FF_RX_D_3_7 => ff_rxdata_ch3(7),
#endif
#if _protocol == "XAUI"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_8 => ff_rxc_ch3,
#else
  FF_RX_D_3_8 => ff_rxc_ch3(0),
#endif
#elif _protocol == "PIPE"
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_8 => RxDataK_ch3,
#else
  FF_RX_D_3_8 => RxDataK_ch3(0),
#endif
#elif _protocol == "8BSER"
  FF_RX_D_3_8 => open,
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
  FF_RX_D_3_8 => ff_rxdata_ch3(8),
#else
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_8 => ff_rx_k_cntrl_ch3,
#else
  FF_RX_D_3_8 => ff_rx_k_cntrl_ch3(0),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_9 => ff_rxstatus0_ch3,
#else
  FF_RX_D_3_9 => ff_rxstatus0_ch3(0),
#endif
#elif _protocol == "PIPE"
  FF_RX_D_3_9 => RxStatus0_ch3(0),
#elif _protocol == "8BSER" 
  FF_RX_D_3_9 => open,
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "USERDEF" 
  FF_RX_D_3_9 => ff_rxdata_ch3(9),
#else
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_9 => ff_disp_err_ch3,
#else
  FF_RX_D_3_9 => ff_disp_err_ch3(0),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_10 => ff_rxstatus1_ch3,
#else
  FF_RX_D_3_10 => ff_rxstatus1_ch3(0),
#endif
#elif _protocol == "PIPE"
  FF_RX_D_3_10 => RxStatus0_ch3(1),
#elif _protocol == "USERDEF"
  FF_RX_D_3_10 => ff_rxdata_ch3(10),
#elif _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_3_10 => open,
#else
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_10 => ff_cv_ch3,
#else
  FF_RX_D_3_10 => ff_cv_ch3(0),
#endif
#endif
#if _protocol == "PCIE" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_11 => ff_rxstatus2_ch3,
#else
  FF_RX_D_3_11 => ff_rxstatus2_ch3(0),
#endif
#elif _protocol == "PIPE"
  FF_RX_D_3_11 => RxStatus0_ch3(2),
#elif _protocol == "USERDEF"
  FF_RX_D_3_11 => ff_rxdata_ch3(11),
#elif _protocol == "GIGE" || _protocol == "OBSAI" 
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_11 => ff_rx_even_ch3,
#else
  FF_RX_D_3_11 => ff_rx_even_ch3(0),
#endif
#else
  FF_RX_D_3_11 => open,
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_12 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_3_12 => ff_rxdata_ch3(10),
#elif _protocol == "USERDEF"
  FF_RX_D_3_12 => ff_rxdata_ch3(12),
#elif _protocol == "PIPE"
  FF_RX_D_3_12 => RxData_ch3(8),
#else
  FF_RX_D_3_12 => ff_rxdata_ch3(8),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_13 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_3_13 => ff_rxdata_ch3(11),
#elif _protocol == "USERDEF"
  FF_RX_D_3_13 => ff_rxdata_ch3(13),
#elif _protocol == "PIPE"
  FF_RX_D_3_13 => RxData_ch3(9),
#else
  FF_RX_D_3_13 => ff_rxdata_ch3(9),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_14 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_3_14 => ff_rxdata_ch3(12),
#elif _protocol == "USERDEF"
  FF_RX_D_3_14 => ff_rxdata_ch3(14),
#elif _protocol == "PIPE"
  FF_RX_D_3_14 => RxData_ch3(10),
#else
  FF_RX_D_3_14 => ff_rxdata_ch3(10),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_15 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_3_15 => ff_rxdata_ch3(13),
#elif _protocol == "USERDEF"
  FF_RX_D_3_15 => ff_rxdata_ch3(15),
#elif _protocol == "PIPE"
  FF_RX_D_3_15 => RxData_ch3(11),
#else
  FF_RX_D_3_15 => ff_rxdata_ch3(11),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_16 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_3_16 => ff_rxdata_ch3(14),
#elif _protocol == "USERDEF"
  FF_RX_D_3_16 => ff_rxdata_ch3(16),
#elif _protocol == "PIPE"
  FF_RX_D_3_16 => RxData_ch3(12),
#else
  FF_RX_D_3_16 => ff_rxdata_ch3(12),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_17 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_3_17 => ff_rxdata_ch3(15),
#elif _protocol == "USERDEF"
  FF_RX_D_3_17 => ff_rxdata_ch3(17),
#elif _protocol == "PIPE"
  FF_RX_D_3_17 => RxData_ch3(13),
#else
  FF_RX_D_3_17 => ff_rxdata_ch3(13),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_18 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_3_18 => ff_rxdata_ch3(16),
#elif _protocol == "USERDEF"
  FF_RX_D_3_18 => ff_rxdata_ch3(18),
#elif _protocol == "PIPE"
  FF_RX_D_3_18 => RxData_ch3(14),
#else
  FF_RX_D_3_18 => ff_rxdata_ch3(14),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_19 => open,
#else
#if _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" || _protocol == "CPRI"
  FF_RX_D_3_19 => ff_rxdata_ch3(17),
#elif _protocol == "USERDEF"
  FF_RX_D_3_19 => ff_rxdata_ch3(19),
#elif _protocol == "PIPE"
  FF_RX_D_3_19 => RxData_ch3(15),
#else
  FF_RX_D_3_19 => ff_rxdata_ch3(15),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_20 => open,
#else
#if _protocol == "8BSER"
  FF_RX_D_3_20 => open,
#elif _protocol == "USERDEF"
  FF_RX_D_3_20 => ff_rxdata_ch3(20),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_3_20 => ff_rxdata_ch3(18),
#elif _protocol == "XAUI"
  FF_RX_D_3_20 => ff_rxc_ch3(1),
#elif _protocol == "PIPE"
  FF_RX_D_3_20 => RxDataK_ch3(1),
#else
  FF_RX_D_3_20 => ff_rx_k_cntrl_ch3(1),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_21 => open,
#else
#if _protocol == "8BSER" 
  FF_RX_D_3_21 => open,
#elif _protocol == "USERDEF"
  FF_RX_D_3_21 => ff_rxdata_ch3(21),
#elif _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_3_21 => ff_rxdata_ch3(19),
#elif _protocol == "PCIE" 
  FF_RX_D_3_21 => ff_rxstatus0_ch3(1),
#elif _protocol == "PIPE"
  FF_RX_D_3_21 => RxStatus1_ch3(0),
#else
  FF_RX_D_3_21 => ff_disp_err_ch3(1),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_22 => open,
#else
#if  _protocol == "8BSER" || _protocol == "SDSDI" || _protocol == "HDSDI" || _protocol == "3GSDI" || _protocol == "10BSER" 
  FF_RX_D_3_22 => open,
#elif _protocol == "USERDEF"
  FF_RX_D_3_22 => ff_rxdata_ch3(22),
#elif _protocol == "PCIE" 
  FF_RX_D_3_22 => ff_rxstatus1_ch3(1),
#elif _protocol == "PIPE"
  FF_RX_D_3_22 => RxStatus1_ch3(1),
#else
  FF_RX_D_3_22 => ff_cv_ch3(1),
#endif
#endif
#if _data_width_ch3 == "8" || _data_width_ch3 == "10"
  FF_RX_D_3_23 => open,
#else
#if _protocol == "GIGE" || _protocol == "OBSAI" 
  FF_RX_D_3_23 => ff_rx_even_ch3(1),
#elif _protocol == "USERDEF"
  FF_RX_D_3_23 => ff_rxdata_ch3(23),
#elif _protocol == "PCIE" 
  FF_RX_D_3_23 => ff_rxstatus2_ch3(1),
#elif _protocol == "PIPE"
  FF_RX_D_3_23 => RxStatus1_ch3(2),
#else
  FF_RX_D_3_23 => open,
#endif
#endif
  FFC_RRST_3 => ffc_rrst_ch3,
#if _ch3_elsm == "TRUE"
  FFC_SIGNAL_DETECT_3 => ffc_signal_detect_ch3,
  FFC_ENABLE_CGALIGN_3 => ffc_enable_cgalign_ch3,
#else
  FFC_SIGNAL_DETECT_3 => fpsc_vlo,
  FFC_ENABLE_CGALIGN_3 => fpsc_vlo,
#endif
#if _loopback == "TRUE"
#if _lbtype == "SerDes Parallel Loopback"
  FFC_SB_PFIFO_LP_3 => fpsc_vlo,
  FFC_PFIFO_CLR_3 => ffc_pfifo_clr_ch3,
  FFC_FB_LOOPBACK_3 => fpsc_vlo,
#elif _lbtype == "PCS Parallel Loopback"
  FFC_SB_PFIFO_LP_3 => fpsc_vlo,
  FFC_PFIFO_CLR_3 => fpsc_vlo,
#if _protocol != "PIPE"
  FFC_FB_LOOPBACK_3 => fpsc_vlo,
#else
  FFC_FB_LOOPBACK_3 => fpsc_vlo,
#endif
#else
  FFC_SB_PFIFO_LP_3 => fpsc_vlo,
  FFC_PFIFO_CLR_3 => fpsc_vlo,
  FFC_FB_LOOPBACK_3 => fpsc_vlo,
#endif
#else
  FFC_SB_PFIFO_LP_3 => fpsc_vlo,
  FFC_PFIFO_CLR_3 => fpsc_vlo,
  FFC_FB_LOOPBACK_3 => fpsc_vlo,
#endif
#if _ch3_ird == "TRUE"
#if _protocol == "PIPE"
  FFC_SB_INV_RX_3 => ,
#else
  FFC_SB_INV_RX_3 => ffc_sb_inv_rx_ch3,
#endif
#else
  FFC_SB_INV_RX_3 => fpsc_vlo,
#endif
#if _protocol == "PCIE" || _protocol == "USERDEF"
  FFC_PCIE_CT_3 => ffc_pcie_ct_ch3,
  FFC_PCI_DET_EN_3 => ffc_pci_det_en_ch3,
  FFS_PCIE_DONE_3 => ffs_pcie_done_ch3,
  FFS_PCIE_CON_3 => ffs_pcie_con_ch3,
#elif _protocol == "PIPE"
  FFC_PCIE_CT_3 => ,
  FFC_PCI_DET_EN_3 => ,
  FFS_PCIE_DONE_3 => ,
  FFS_PCIE_CON_3 => ,
#else
  FFC_PCIE_CT_3 => fpsc_vlo,
  FFC_PCI_DET_EN_3 => fpsc_vlo,
  FFS_PCIE_DONE_3 => open,
  FFS_PCIE_CON_3 => open,
#endif
#if _protocol == "PCIE" || _protocol == "SATA_I" || ((_protocol == "CPRI" || _protocol == "G8B10B") && _ch3_teidle == "TRUE")
  FFC_EI_EN_3 => ffc_ei_en_ch3,
#else
  FFC_EI_EN_3 => fpsc_vlo,
#endif
  FFC_LANE_TX_RST_3 => ffc_lane_tx_rst_ch3,
  FFC_LANE_RX_RST_3 => ffc_lane_rx_rst_ch3,
  FFC_TXPWDNB_3 => ffc_txpwdnb_ch3,
  FFC_RXPWDNB_3 => ffc_rxpwdnb_ch3,
#if _protocol == "PIPE"
  FFS_RLOS_LO_3 => ,
#elif _protocol == "SATA_I"
  FFS_RLOS_LO_3 => ffs_sata_oob_rx_ch3,
#else
  FFS_RLOS_LO_3 => ffs_rlos_lo_ch3,
#endif
#if _protocol == "8BSER"
  FFS_LS_SYNC_STATUS_3 => open,
#else
#if _comma_align == "AUTO"
  FFS_LS_SYNC_STATUS_3 => ffs_ls_sync_status_ch3,
#else
  FFS_LS_SYNC_STATUS_3 => open,
#endif
#endif
#if _errsports == "TRUE"
  FFS_CC_UNDERRUN_3 => ffs_cc_underrun_ch3,
  FFS_CC_OVERRUN_3 => ffs_cc_overrun_ch3,
  FFS_RXFBFIFO_ERROR_3 => ffs_rxfbfifo_error_ch3,
  FFS_TXFBFIFO_ERROR_3 => ffs_txfbfifo_error_ch3,
#else
  FFS_CC_UNDERRUN_3 => open,
  FFS_CC_OVERRUN_3 => open,
  FFS_RXFBFIFO_ERROR_3 => open,
  FFS_TXFBFIFO_ERROR_3 => open,
#endif
  FFS_RLOL_3 => ffs_rlol_ch3,
  OOB_OUT_3 => oob_out_ch3,
#endif
#if _sci_ports == "TRUE"
  SCIWDATA0 => sciwritedata(0),
  SCIWDATA1 => sciwritedata(1),
  SCIWDATA2 => sciwritedata(2),
  SCIWDATA3 => sciwritedata(3),
  SCIWDATA4 => sciwritedata(4),
  SCIWDATA5 => sciwritedata(5),
  SCIWDATA6 => sciwritedata(6),
  SCIWDATA7 => sciwritedata(7),
  SCIADDR0 => sciaddress(0),
  SCIADDR1 => sciaddress(1),
  SCIADDR2 => sciaddress(2),
  SCIADDR3 => sciaddress(3),
  SCIADDR4 => sciaddress(4),
  SCIADDR5 => sciaddress(5),
  SCIRDATA0 => scireaddata(0),
  SCIRDATA1 => scireaddata(1),
  SCIRDATA2 => scireaddata(2),
  SCIRDATA3 => scireaddata(3),
  SCIRDATA4 => scireaddata(4),
  SCIRDATA5 => scireaddata(5),
  SCIRDATA6 => scireaddata(6),
  SCIRDATA7 => scireaddata(7),
  SCIENAUX => scienaux,
  SCISELAUX => sciselaux,
  SCIRD => scird,
  SCIWSTN => sciwstn,
  CYAWSTN => cyawstn,
#if _sci_int_port == "TRUE"
  SCIINT => sciinterrupt,
#endif
#else
  SCIWDATA0 => fpsc_vlo,
  SCIWDATA1 => fpsc_vlo,
  SCIWDATA2 => fpsc_vlo,
  SCIWDATA3 => fpsc_vlo,
  SCIWDATA4 => fpsc_vlo,
  SCIWDATA5 => fpsc_vlo,
  SCIWDATA6 => fpsc_vlo,
  SCIWDATA7 => fpsc_vlo,
  SCIADDR0 => fpsc_vlo,
  SCIADDR1 => fpsc_vlo,
  SCIADDR2 => fpsc_vlo,
  SCIADDR3 => fpsc_vlo,
  SCIADDR4 => fpsc_vlo,
  SCIADDR5 => fpsc_vlo,
  SCIRDATA0 => open,
  SCIRDATA1 => open,
  SCIRDATA2 => open,
  SCIRDATA3 => open,
  SCIRDATA4 => open,
  SCIRDATA5 => open,
  SCIRDATA6 => open,
  SCIRDATA7 => open,
  SCIENAUX => fpsc_vlo,
  SCISELAUX => fpsc_vlo,
  SCIRD => fpsc_vlo,
  SCIWSTN => fpsc_vlo,
  CYAWSTN => fpsc_vlo,
  SCIINT => open,
#endif
  FFC_MACRO_RST => ffc_macro_rst,
  FFC_QUAD_RST => ffc_quad_rst,
  FFC_TRST => ffc_trst,
  FF_TX_F_CLK => ff_txfullclk,
  FF_TX_H_CLK => ff_txhalfclk,
#if _pllqclkports == "TRUE"
  FF_TX_Q_CLK => ff_txqtrclk,
#else
  FF_TX_Q_CLK => open,
#endif
#if _refck2core == "TRUE"
  REFCK2CORE => refck2core,
#else
  REFCK2CORE => open,
#endif
  CIN0 => cin(0),
  CIN1 => cin(1),
  CIN2 => cin(2),
  CIN3 => cin(3),
  CIN4 => cin(4),
  CIN5 => cin(5),
  CIN6 => cin(6),
  CIN7 => cin(7),
  CIN8 => cin(8),
  CIN9 => cin(9),
  CIN10 => cin(10),
  CIN11 => cin(11),
  COUT0 => cout(0),
  COUT1 => cout(1),
  COUT2 => cout(2),
  COUT3 => cout(3),
  COUT4 => cout(4),
  COUT5 => cout(5),
  COUT6 => cout(6),
  COUT7 => cout(7),
  COUT8 => cout(8),
  COUT9 => cout(9),
  COUT10 => cout(10),
  COUT11 => cout(11),
  COUT12 => cout(12),
  COUT13 => cout(13),
  COUT14 => cout(14),
  COUT15 => cout(15),
  COUT16 => cout(16),
  COUT17 => cout(17),
  COUT18 => cout(18),
#if _protocol == "CPRI"
  COUT19 => ff_txser_clk,
#else
  COUT19 => cout(19),
#endif
  FFS_PLOL => ffs_plol);

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
#include <pcs/pcsc.tft>
