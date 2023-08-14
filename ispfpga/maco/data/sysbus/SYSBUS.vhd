#log _circuit_name.vhd

#ifndef _enable_orcastra
#define _enable_orcastra 0
#endif
#macro converter10(arg1,arg2)
#define arg2 arg1##.txt
#endmacro

#converter10(_circuit_name, _circuit_name_new)
--synopsys translate_off
library sysbusa_work;
use sysbusa_work.all;
library ieee;
use ieee.std_logic_1164.all;

entity SYSBUSA is
GENERIC(
  SYSBUS_CONFIG_FILE : String  := #_circuit_name_new;
  MPI_PARITY : String  := "DISABLED";
  MPI_BUS_WIDTH : Integer  := 8;
  SYS_CLK_SEL : String  := "MPI";
  MPI_PRIORITY : String  := "LOW";
  FPGA_PRIORITY : String  := "LOW";
  MPI_RST : String  := "DISABLED";
  MASTER_RST : String  := "DISABLED";
  PARITY : String  := "EVEN";
  MPI_SYNCMODE : String  := "SYNC";
  MASTER_SYNCMODE : String  := "ASYNC";
  MASTER_AUTORETRY : String  := "ENABLED";
  SLAVE_SYNCMODE : String  := "DISABLED";
  INTERRUPT_VECTOR1 : Integer := 0;
  INTERRUPT_VECTOR2 : Integer := 0;
  INTERRUPT_VECTOR3 : Integer := 0;
  INTERRUPT_VECTOR4 : Integer := 0;
  INTERRUPT_VECTOR5 : Integer := 0;
  INTERRUPT_VECTOR6 : Integer := 0
  );
port (
  CS0_N            : in std_logic;
  CS1              : in std_logic;
  MPI_CLK          : in std_logic;
  MPI_WR_N         : in std_logic;
  MPI_STRB_N       : in std_logic;
  MPI_BURST        : in std_logic;
  MPI_BDIP         : in std_logic;
  MPI_RST_N        : in std_logic;
  USR_CLK          : in std_logic;
  USER_IRQ_IN      : in std_logic;
  SYS_RST_N        : in std_logic;
  MPI_TSIZ_1       : in std_logic;
  MPI_TSIZ_0       : in std_logic;
  MPI_ADDR_14      : in std_logic;
  MPI_ADDR_15      : in std_logic;
  MPI_ADDR_16      : in std_logic;
  MPI_ADDR_17      : in std_logic;
  MPI_ADDR_18      : in std_logic;
  MPI_ADDR_19      : in std_logic;
  MPI_ADDR_20      : in std_logic;
  MPI_ADDR_21      : in std_logic;
  MPI_ADDR_22      : in std_logic;
  MPI_ADDR_23      : in std_logic;
  MPI_ADDR_24      : in std_logic;
  MPI_ADDR_25      : in std_logic;
  MPI_ADDR_26      : in std_logic;
  MPI_ADDR_27      : in std_logic;
  MPI_ADDR_28      : in std_logic;
  MPI_ADDR_29      : in std_logic;
  MPI_ADDR_30      : in std_logic;
  MPI_ADDR_31      : in std_logic;
  MPI_WR_DATA_31   : in std_logic;
  MPI_WR_DATA_30   : in std_logic;
  MPI_WR_DATA_29   : in std_logic;
  MPI_WR_DATA_28   : in std_logic;
  MPI_WR_DATA_27   : in std_logic;
  MPI_WR_DATA_26   : in std_logic;
  MPI_WR_DATA_25   : in std_logic;
  MPI_WR_DATA_24   : in std_logic;
  MPI_WR_DATA_23   : in std_logic;
  MPI_WR_DATA_22   : in std_logic;
  MPI_WR_DATA_21   : in std_logic;
  MPI_WR_DATA_20   : in std_logic;
  MPI_WR_DATA_19   : in std_logic;
  MPI_WR_DATA_18   : in std_logic;
  MPI_WR_DATA_17   : in std_logic;
  MPI_WR_DATA_16   : in std_logic;
  MPI_WR_DATA_15   : in std_logic;
  MPI_WR_DATA_14   : in std_logic;
  MPI_WR_DATA_13   : in std_logic;
  MPI_WR_DATA_12   : in std_logic;
  MPI_WR_DATA_11   : in std_logic;
  MPI_WR_DATA_10   : in std_logic;
  MPI_WR_DATA_9    : in std_logic;
  MPI_WR_DATA_8    : in std_logic;
  MPI_WR_DATA_7    : in std_logic;
  MPI_WR_DATA_6    : in std_logic;
  MPI_WR_DATA_5    : in std_logic;
  MPI_WR_DATA_4    : in std_logic;
  MPI_WR_DATA_3    : in std_logic;
  MPI_WR_DATA_2    : in std_logic;
  MPI_WR_DATA_1    : in std_logic;
  MPI_WR_DATA_0    : in std_logic;
  MPI_WR_PARITY_3  : in std_logic;
  MPI_WR_PARITY_2  : in std_logic;
  MPI_WR_PARITY_1  : in std_logic;
  MPI_WR_PARITY_0  : in std_logic;
  MPI_TA           : out std_logic;
  MPI_RETRY        : out std_logic;
  MPI_TEA          : out std_logic;
  PD2_0_TS         : out std_logic;
  PD7_3_TS         : out std_logic;
  PD15_8_TS        : out std_logic;
  PD31_16_TS       : out std_logic;
  MPI_IRQ_N        : out std_logic;
  MPI_CNTL_TS      : out std_logic;
  USER_IRQ_OUT     : out std_logic;
  HCLK_CIB         : out std_logic;
  MPI_RD_DATA_31   : out std_logic;
  MPI_RD_DATA_30   : out std_logic;
  MPI_RD_DATA_29   : out std_logic;
  MPI_RD_DATA_28   : out std_logic;
  MPI_RD_DATA_27   : out std_logic;
  MPI_RD_DATA_26   : out std_logic;
  MPI_RD_DATA_25   : out std_logic;
  MPI_RD_DATA_24   : out std_logic;
  MPI_RD_DATA_23   : out std_logic;
  MPI_RD_DATA_22   : out std_logic;
  MPI_RD_DATA_21   : out std_logic;
  MPI_RD_DATA_20   : out std_logic;
  MPI_RD_DATA_19   : out std_logic;
  MPI_RD_DATA_18   : out std_logic;
  MPI_RD_DATA_17   : out std_logic;
  MPI_RD_DATA_16   : out std_logic;
  MPI_RD_DATA_15   : out std_logic;
  MPI_RD_DATA_14   : out std_logic;
  MPI_RD_DATA_13   : out std_logic;
  MPI_RD_DATA_12   : out std_logic;
  MPI_RD_DATA_11   : out std_logic;
  MPI_RD_DATA_10   : out std_logic;
  MPI_RD_DATA_9    : out std_logic;
  MPI_RD_DATA_8    : out std_logic;
  MPI_RD_DATA_7    : out std_logic;
  MPI_RD_DATA_6    : out std_logic;
  MPI_RD_DATA_5    : out std_logic;
  MPI_RD_DATA_4    : out std_logic;
  MPI_RD_DATA_3    : out std_logic;
  MPI_RD_DATA_2    : out std_logic;
  MPI_RD_DATA_1    : out std_logic;
  MPI_RD_DATA_0    : out std_logic;
  MPI_RD_PARITY_3  : out std_logic;
  MPI_RD_PARITY_2  : out std_logic;
  MPI_RD_PARITY_1  : out std_logic;
  MPI_RD_PARITY_0  : out std_logic;
  MPI_DP_TS_0      : out std_logic;
  MPI_DP_TS_1      : out std_logic;
  MPI_DP_TS_2      : out std_logic;
  SMI_RDATA_63     : in  std_logic;
  SMI_RDATA_62     : in  std_logic;
  SMI_RDATA_61     : in  std_logic;
  SMI_RDATA_60     : in  std_logic;
  SMI_RDATA_59     : in  std_logic;
  SMI_RDATA_58     : in  std_logic;
  SMI_RDATA_57     : in  std_logic;
  SMI_RDATA_56     : in  std_logic;
  SMI_RDATA_55     : in  std_logic;
  SMI_RDATA_54     : in  std_logic;
  SMI_RDATA_53     : in  std_logic;
  SMI_RDATA_52     : in  std_logic;
  SMI_RDATA_51     : in  std_logic;
  SMI_RDATA_50     : in  std_logic;
  SMI_RDATA_49     : in  std_logic;
  SMI_RDATA_48     : in  std_logic;
  SMI_RDATA_47     : in  std_logic;
  SMI_RDATA_46     : in  std_logic;
  SMI_RDATA_45     : in  std_logic;
  SMI_RDATA_44     : in  std_logic;
  SMI_RDATA_43     : in  std_logic;
  SMI_RDATA_42     : in  std_logic;
  SMI_RDATA_41     : in  std_logic;
  SMI_RDATA_40     : in  std_logic;
  SMI_RDATA_39     : in  std_logic;
  SMI_RDATA_38     : in  std_logic;
  SMI_RDATA_37     : in  std_logic;
  SMI_RDATA_36     : in  std_logic;
  SMI_RDATA_35     : in  std_logic;
  SMI_RDATA_34     : in  std_logic;
  SMI_RDATA_33     : in  std_logic;
  SMI_RDATA_32     : in  std_logic;
  SMI_RDATA_31     : in  std_logic;
  SMI_RDATA_30     : in  std_logic;
  SMI_RDATA_29     : in  std_logic;
  SMI_RDATA_28     : in  std_logic;
  SMI_RDATA_27     : in  std_logic;
  SMI_RDATA_26     : in  std_logic;
  SMI_RDATA_25     : in  std_logic;
  SMI_RDATA_24     : in  std_logic;
  SMI_RDATA_23     : in  std_logic;
  SMI_RDATA_22     : in  std_logic;
  SMI_RDATA_21     : in  std_logic;
  SMI_RDATA_20     : in  std_logic;
  SMI_RDATA_19     : in  std_logic;
  SMI_RDATA_18     : in  std_logic;
  SMI_RDATA_17     : in  std_logic;
  SMI_RDATA_16     : in  std_logic;
  SMI_RDATA_15     : in  std_logic;
  SMI_RDATA_14     : in  std_logic;
  SMI_RDATA_13     : in  std_logic;
  SMI_RDATA_12     : in  std_logic;
  SMI_RDATA_11     : in  std_logic;
  SMI_RDATA_10     : in  std_logic;
  SMI_RDATA_9      : in  std_logic;
  SMI_RDATA_8      : in  std_logic;
  SMI_RDATA_7      : in  std_logic;
  SMI_RDATA_6      : in  std_logic;
  SMI_RDATA_5      : in  std_logic;
  SMI_RDATA_4      : in  std_logic;
  SMI_RDATA_3      : in  std_logic;
  SMI_RDATA_2      : in  std_logic;
  SMI_RDATA_1      : in  std_logic;
  SMI_RDATA_0      : in  std_logic;
  SMI_ADDR_9       : out std_logic;
  SMI_ADDR_8       : out std_logic;
  SMI_ADDR_7       : out std_logic;
  SMI_ADDR_6       : out std_logic;
  SMI_ADDR_5       : out std_logic;
  SMI_ADDR_4       : out std_logic;
  SMI_ADDR_3       : out std_logic;
  SMI_ADDR_2       : out std_logic;
  SMI_ADDR_1       : out std_logic;
  SMI_ADDR_0       : out std_logic;
  SMI_CLK          : out std_logic;
  SMI_RD           : out std_logic;
  SMI_RST_N        : out std_logic;
  SMI_WDATA        : out std_logic;
  SMI_WR           : out std_logic;
  FMADDR_17        : in  std_logic;
  FMADDR_16        : in  std_logic;
  FMADDR_15        : in  std_logic;
  FMADDR_14        : in  std_logic;
  FMADDR_13        : in  std_logic;
  FMADDR_12        : in  std_logic;
  FMADDR_11        : in  std_logic;
  FMADDR_10        : in  std_logic;
  FMADDR_9         : in  std_logic;
  FMADDR_8         : in  std_logic;
  FMADDR_7         : in  std_logic;
  FMADDR_6         : in  std_logic;
  FMADDR_5         : in  std_logic;
  FMADDR_4         : in  std_logic;
  FMADDR_3         : in  std_logic;
  FMADDR_2         : in  std_logic;
  FMADDR_1         : in  std_logic;
  FMADDR_0         : in  std_logic;
  FMWDATA_35       : in  std_logic;
  FMWDATA_34       : in  std_logic;
  FMWDATA_33       : in  std_logic;
  FMWDATA_32       : in  std_logic;
  FMWDATA_31       : in  std_logic;
  FMWDATA_30       : in  std_logic;
  FMWDATA_29       : in  std_logic;
  FMWDATA_28       : in  std_logic;
  FMWDATA_27       : in  std_logic;
  FMWDATA_26       : in  std_logic;
  FMWDATA_25       : in  std_logic;
  FMWDATA_24       : in  std_logic;
  FMWDATA_23       : in  std_logic;
  FMWDATA_22       : in  std_logic;
  FMWDATA_21       : in  std_logic;
  FMWDATA_20       : in  std_logic;
  FMWDATA_19       : in  std_logic;
  FMWDATA_18       : in  std_logic;
  FMWDATA_17       : in  std_logic;
  FMWDATA_16       : in  std_logic;
  FMWDATA_15       : in  std_logic;
  FMWDATA_14       : in  std_logic;
  FMWDATA_13       : in  std_logic;
  FMWDATA_12       : in  std_logic;
  FMWDATA_11       : in  std_logic;
  FMWDATA_10       : in  std_logic;
  FMWDATA_9        : in  std_logic;
  FMWDATA_8        : in  std_logic;
  FMWDATA_7        : in  std_logic;
  FMWDATA_6        : in  std_logic;
  FMWDATA_5        : in  std_logic;
  FMWDATA_4        : in  std_logic;
  FMWDATA_3        : in  std_logic;
  FMWDATA_2        : in  std_logic;
  FMWDATA_1        : in  std_logic;
  FMWDATA_0        : in  std_logic;
  FMSIZE_0         : in  std_logic;
  FMSIZE_1         : in  std_logic;
  FMCLK            : in  std_logic;
  FMRESET_N        : in  std_logic;
  FMWRN            : in  std_logic;
  FMBURST          : in  std_logic;
  FMRDY            : in  std_logic;
  FMLOCK           : in  std_logic;
  FMIRQ            : in  std_logic;
  FMRDATA_35       : out std_logic;
  FMRDATA_34       : out std_logic;
  FMRDATA_33       : out std_logic;
  FMRDATA_32       : out std_logic;
  FMRDATA_31       : out std_logic;
  FMRDATA_30       : out std_logic;
  FMRDATA_29       : out std_logic;
  FMRDATA_28       : out std_logic;
  FMRDATA_27       : out std_logic;
  FMRDATA_26       : out std_logic;
  FMRDATA_25       : out std_logic;
  FMRDATA_24       : out std_logic;
  FMRDATA_23       : out std_logic;
  FMRDATA_22       : out std_logic;
  FMRDATA_21       : out std_logic;
  FMRDATA_20       : out std_logic;
  FMRDATA_19       : out std_logic;
  FMRDATA_18       : out std_logic;
  FMRDATA_17       : out std_logic;
  FMRDATA_16       : out std_logic;
  FMRDATA_15       : out std_logic;
  FMRDATA_14       : out std_logic;
  FMRDATA_13       : out std_logic;
  FMRDATA_12       : out std_logic;
  FMRDATA_11       : out std_logic;
  FMRDATA_10       : out std_logic;
  FMRDATA_9        : out std_logic;
  FMRDATA_8        : out std_logic;
  FMRDATA_7        : out std_logic;
  FMRDATA_6        : out std_logic;
  FMRDATA_5        : out std_logic;
  FMRDATA_4        : out std_logic;
  FMRDATA_3        : out std_logic;
  FMRDATA_2        : out std_logic;
  FMRDATA_1        : out std_logic;
  FMRDATA_0        : out std_logic;
  FMACK            : out std_logic;
  FMRETRY          : out std_logic;
  FMERR            : out std_logic;
  FSRDATA_35       : in  std_logic;
  FSRDATA_34       : in  std_logic;
  FSRDATA_33       : in  std_logic;
  FSRDATA_32       : in  std_logic;
  FSRDATA_31       : in  std_logic;
  FSRDATA_30       : in  std_logic;
  FSRDATA_29       : in  std_logic;
  FSRDATA_28       : in  std_logic;
  FSRDATA_27       : in  std_logic;
  FSRDATA_26       : in  std_logic;
  FSRDATA_25       : in  std_logic;
  FSRDATA_24       : in  std_logic;
  FSRDATA_23       : in  std_logic;
  FSRDATA_22       : in  std_logic;
  FSRDATA_21       : in  std_logic;
  FSRDATA_20       : in  std_logic;
  FSRDATA_19       : in  std_logic;
  FSRDATA_18       : in  std_logic;
  FSRDATA_17       : in  std_logic;
  FSRDATA_16       : in  std_logic;
  FSRDATA_15       : in  std_logic;
  FSRDATA_14       : in  std_logic;
  FSRDATA_13       : in  std_logic;
  FSRDATA_12       : in  std_logic;
  FSRDATA_11       : in  std_logic;
  FSRDATA_10       : in  std_logic;
  FSRDATA_9        : in  std_logic;
  FSRDATA_8        : in  std_logic;
  FSRDATA_7        : in  std_logic;
  FSRDATA_6        : in  std_logic;
  FSRDATA_5        : in  std_logic;
  FSRDATA_4        : in  std_logic;
  FSRDATA_3        : in  std_logic;
  FSRDATA_2        : in  std_logic;
  FSRDATA_1        : in  std_logic;
  FSRDATA_0        : in  std_logic;
  FSCLK            : in  std_logic;
  FSRESET_N        : in  std_logic;
  FSACK            : in  std_logic;
  FSRETRY          : in  std_logic;
  FSERR            : in  std_logic;
  FSIRQ            : in  std_logic;
  FSWDATA_35       : out std_logic;
  FSWDATA_34       : out std_logic;
  FSWDATA_33       : out std_logic;
  FSWDATA_32       : out std_logic;
  FSWDATA_31       : out std_logic;
  FSWDATA_30       : out std_logic;
  FSWDATA_29       : out std_logic;
  FSWDATA_28       : out std_logic;
  FSWDATA_27       : out std_logic;
  FSWDATA_26       : out std_logic;
  FSWDATA_25       : out std_logic;
  FSWDATA_24       : out std_logic;
  FSWDATA_23       : out std_logic;
  FSWDATA_22       : out std_logic;
  FSWDATA_21       : out std_logic;
  FSWDATA_20       : out std_logic;
  FSWDATA_19       : out std_logic;
  FSWDATA_18       : out std_logic;
  FSWDATA_17       : out std_logic;
  FSWDATA_16       : out std_logic;
  FSWDATA_15       : out std_logic;
  FSWDATA_14       : out std_logic;
  FSWDATA_13       : out std_logic;
  FSWDATA_12       : out std_logic;
  FSWDATA_11       : out std_logic;
  FSWDATA_10       : out std_logic;
  FSWDATA_9        : out std_logic;
  FSWDATA_8        : out std_logic;
  FSWDATA_7        : out std_logic;
  FSWDATA_6        : out std_logic;
  FSWDATA_5        : out std_logic;
  FSWDATA_4        : out std_logic;
  FSWDATA_3        : out std_logic;
  FSWDATA_2        : out std_logic;
  FSWDATA_1        : out std_logic;
  FSWDATA_0        : out std_logic;
  FSADDR_17        : out std_logic;
  FSADDR_16        : out std_logic;
  FSADDR_15        : out std_logic;
  FSADDR_14        : out std_logic;
  FSADDR_13        : out std_logic;
  FSADDR_12        : out std_logic;
  FSADDR_11        : out std_logic;
  FSADDR_10        : out std_logic;
  FSADDR_9         : out std_logic;
  FSADDR_8         : out std_logic;
  FSADDR_7         : out std_logic;
  FSADDR_6         : out std_logic;
  FSADDR_5         : out std_logic;
  FSADDR_4         : out std_logic;
  FSADDR_3         : out std_logic;
  FSADDR_2         : out std_logic;
  FSADDR_1         : out std_logic;
  FSADDR_0         : out std_logic;
  FSSIZE_0         : out std_logic;
  FSSIZE_1         : out std_logic;
  FSRDY            : out std_logic;
  FSWRN            : out std_logic;
  HADDR_LASBM_17   : in  std_logic;
  HADDR_LASBM_16   : in  std_logic;
  HADDR_LASBM_15   : in  std_logic;
  HADDR_LASBM_14   : in  std_logic;
  HADDR_LASBM_13   : in  std_logic;
  HADDR_LASBM_12   : in  std_logic;
  HADDR_LASBM_11   : in  std_logic;
  HADDR_LASBM_10   : in  std_logic;
  HADDR_LASBM_9    : in  std_logic;
  HADDR_LASBM_8    : in  std_logic;
  HADDR_LASBM_7    : in  std_logic;
  HADDR_LASBM_6    : in  std_logic;
  HADDR_LASBM_5    : in  std_logic;
  HADDR_LASBM_4    : in  std_logic;
  HADDR_LASBM_3    : in  std_logic;
  HADDR_LASBM_2    : in  std_logic;
  HADDR_LASBM_1    : in  std_logic;
  HADDR_LASBM_0    : in  std_logic;
  HSIZE_LASBM_1    : in  std_logic;
  HSIZE_LASBM_0    : in  std_logic;
  HTRANS_LASBM_1   : in  std_logic; 
  HTRANS_LASBM_0   : in  std_logic; 
  HWDATA_LASBM_35  : in  std_logic;
  HWDATA_LASBM_34  : in  std_logic;
  HWDATA_LASBM_33  : in  std_logic;
  HWDATA_LASBM_32  : in  std_logic;
  HWDATA_LASBM_31  : in  std_logic;
  HWDATA_LASBM_30  : in  std_logic;
  HWDATA_LASBM_29  : in  std_logic;
  HWDATA_LASBM_28  : in  std_logic;
  HWDATA_LASBM_27  : in  std_logic;
  HWDATA_LASBM_26  : in  std_logic;
  HWDATA_LASBM_25  : in  std_logic;
  HWDATA_LASBM_24  : in  std_logic;
  HWDATA_LASBM_23  : in  std_logic;
  HWDATA_LASBM_22  : in  std_logic;
  HWDATA_LASBM_21  : in  std_logic;
  HWDATA_LASBM_20  : in  std_logic;
  HWDATA_LASBM_19  : in  std_logic;
  HWDATA_LASBM_18  : in  std_logic;
  HWDATA_LASBM_17  : in  std_logic;
  HWDATA_LASBM_16  : in  std_logic;
  HWDATA_LASBM_15  : in  std_logic;
  HWDATA_LASBM_14  : in  std_logic;
  HWDATA_LASBM_13  : in  std_logic;
  HWDATA_LASBM_12  : in  std_logic;
  HWDATA_LASBM_11  : in  std_logic;
  HWDATA_LASBM_10  : in  std_logic;
  HWDATA_LASBM_9   : in  std_logic;
  HWDATA_LASBM_8   : in  std_logic;
  HWDATA_LASBM_7   : in  std_logic;
  HWDATA_LASBM_6   : in  std_logic;
  HWDATA_LASBM_5   : in  std_logic;
  HWDATA_LASBM_4   : in  std_logic;
  HWDATA_LASBM_3   : in  std_logic;
  HWDATA_LASBM_2   : in  std_logic;
  HWDATA_LASBM_1   : in  std_logic;
  HWDATA_LASBM_0   : in  std_logic;
  HBURST_LASBM     : in  std_logic;
  HWRITE_LASBM     : in  std_logic;
  LASB_CLK         : in  std_logic;
  LASB_GSR         : in  std_logic;
  LASB_IRQ_MASTER  : in  std_logic;
  HRDATA_LASBM_35  : out std_logic;
  HRDATA_LASBM_34  : out std_logic;
  HRDATA_LASBM_33  : out std_logic;
  HRDATA_LASBM_32  : out std_logic;
  HRDATA_LASBM_31  : out std_logic;
  HRDATA_LASBM_30  : out std_logic;
  HRDATA_LASBM_29  : out std_logic;
  HRDATA_LASBM_28  : out std_logic;
  HRDATA_LASBM_27  : out std_logic;
  HRDATA_LASBM_26  : out std_logic;
  HRDATA_LASBM_25  : out std_logic;
  HRDATA_LASBM_24  : out std_logic;
  HRDATA_LASBM_23  : out std_logic;
  HRDATA_LASBM_22  : out std_logic;
  HRDATA_LASBM_21  : out std_logic;
  HRDATA_LASBM_20  : out std_logic;
  HRDATA_LASBM_19  : out std_logic;
  HRDATA_LASBM_18  : out std_logic;
  HRDATA_LASBM_17  : out std_logic;
  HRDATA_LASBM_16  : out std_logic;
  HRDATA_LASBM_15  : out std_logic;
  HRDATA_LASBM_14  : out std_logic;
  HRDATA_LASBM_13  : out std_logic;
  HRDATA_LASBM_12  : out std_logic;
  HRDATA_LASBM_11  : out std_logic;
  HRDATA_LASBM_10  : out std_logic;
  HRDATA_LASBM_9   : out std_logic;
  HRDATA_LASBM_8   : out std_logic;
  HRDATA_LASBM_7   : out std_logic;
  HRDATA_LASBM_6   : out std_logic;
  HRDATA_LASBM_5   : out std_logic;
  HRDATA_LASBM_4   : out std_logic;
  HRDATA_LASBM_3   : out std_logic;
  HRDATA_LASBM_2   : out std_logic;
  HRDATA_LASBM_1   : out std_logic;
  HRDATA_LASBM_0   : out std_logic;
  HRESP_LASBM_1    : out std_logic;
  HRESP_LASBM_0    : out std_logic;
  HCLK_LASB        : out std_logic;
  HREADY_LASB      : out std_logic;
  HRESET_N_LASB    : out std_logic;
  LASB_DONE        : out std_logic;
  LASB_GSR_N       : out std_logic;
  LASB_IRQ_OUT     : out std_logic;
  HADDR_RASBM_17   : in  std_logic;
  HADDR_RASBM_16   : in  std_logic;
  HADDR_RASBM_15   : in  std_logic;
  HADDR_RASBM_14   : in  std_logic;
  HADDR_RASBM_13   : in  std_logic;
  HADDR_RASBM_12   : in  std_logic;
  HADDR_RASBM_11   : in  std_logic;
  HADDR_RASBM_10   : in  std_logic;
  HADDR_RASBM_9    : in  std_logic;
  HADDR_RASBM_8    : in  std_logic;
  HADDR_RASBM_7    : in  std_logic;
  HADDR_RASBM_6    : in  std_logic;
  HADDR_RASBM_5    : in  std_logic;
  HADDR_RASBM_4    : in  std_logic;
  HADDR_RASBM_3    : in  std_logic;
  HADDR_RASBM_2    : in  std_logic;
  HADDR_RASBM_1    : in  std_logic;
  HADDR_RASBM_0    : in  std_logic;
  HSIZE_RASBM_1    : in  std_logic;
  HSIZE_RASBM_0    : in  std_logic;
  HTRANS_RASBM_1   : in  std_logic; 
  HTRANS_RASBM_0   : in  std_logic; 
  HWDATA_RASBM_35  : in  std_logic;
  HWDATA_RASBM_34  : in  std_logic;
  HWDATA_RASBM_33  : in  std_logic;
  HWDATA_RASBM_32  : in  std_logic;
  HWDATA_RASBM_31  : in  std_logic;
  HWDATA_RASBM_30  : in  std_logic;
  HWDATA_RASBM_29  : in  std_logic;
  HWDATA_RASBM_28  : in  std_logic;
  HWDATA_RASBM_27  : in  std_logic;
  HWDATA_RASBM_26  : in  std_logic;
  HWDATA_RASBM_25  : in  std_logic;
  HWDATA_RASBM_24  : in  std_logic;
  HWDATA_RASBM_23  : in  std_logic;
  HWDATA_RASBM_22  : in  std_logic;
  HWDATA_RASBM_21  : in  std_logic;
  HWDATA_RASBM_20  : in  std_logic;
  HWDATA_RASBM_19  : in  std_logic;
  HWDATA_RASBM_18  : in  std_logic;
  HWDATA_RASBM_17  : in  std_logic;
  HWDATA_RASBM_16  : in  std_logic;
  HWDATA_RASBM_15  : in  std_logic;
  HWDATA_RASBM_14  : in  std_logic;
  HWDATA_RASBM_13  : in  std_logic;
  HWDATA_RASBM_12  : in  std_logic;
  HWDATA_RASBM_11  : in  std_logic;
  HWDATA_RASBM_10  : in  std_logic;
  HWDATA_RASBM_9   : in  std_logic;
  HWDATA_RASBM_8   : in  std_logic;
  HWDATA_RASBM_7   : in  std_logic;
  HWDATA_RASBM_6   : in  std_logic;
  HWDATA_RASBM_5   : in  std_logic;
  HWDATA_RASBM_4   : in  std_logic;
  HWDATA_RASBM_3   : in  std_logic;
  HWDATA_RASBM_2   : in  std_logic;
  HWDATA_RASBM_1   : in  std_logic;
  HWDATA_RASBM_0   : in  std_logic;
  HBURST_RASBM     : in  std_logic;
  HWRITE_RASBM     : in  std_logic;
  RASB_CLK         : in  std_logic;
  RASB_GSR         : in  std_logic;
  RASB_IRQ_MASTER  : in  std_logic;
  HRDATA_RASBM_35  : out std_logic;
  HRDATA_RASBM_34  : out std_logic;
  HRDATA_RASBM_33  : out std_logic;
  HRDATA_RASBM_32  : out std_logic;
  HRDATA_RASBM_31  : out std_logic;
  HRDATA_RASBM_30  : out std_logic;
  HRDATA_RASBM_29  : out std_logic;
  HRDATA_RASBM_28  : out std_logic;
  HRDATA_RASBM_27  : out std_logic;
  HRDATA_RASBM_26  : out std_logic;
  HRDATA_RASBM_25  : out std_logic;
  HRDATA_RASBM_24  : out std_logic;
  HRDATA_RASBM_23  : out std_logic;
  HRDATA_RASBM_22  : out std_logic;
  HRDATA_RASBM_21  : out std_logic;
  HRDATA_RASBM_20  : out std_logic;
  HRDATA_RASBM_19  : out std_logic;
  HRDATA_RASBM_18  : out std_logic;
  HRDATA_RASBM_17  : out std_logic;
  HRDATA_RASBM_16  : out std_logic;
  HRDATA_RASBM_15  : out std_logic;
  HRDATA_RASBM_14  : out std_logic;
  HRDATA_RASBM_13  : out std_logic;
  HRDATA_RASBM_12  : out std_logic;
  HRDATA_RASBM_11  : out std_logic;
  HRDATA_RASBM_10  : out std_logic;
  HRDATA_RASBM_9   : out std_logic;
  HRDATA_RASBM_8   : out std_logic;
  HRDATA_RASBM_7   : out std_logic;
  HRDATA_RASBM_6   : out std_logic;
  HRDATA_RASBM_5   : out std_logic;
  HRDATA_RASBM_4   : out std_logic;
  HRDATA_RASBM_3   : out std_logic;
  HRDATA_RASBM_2   : out std_logic;
  HRDATA_RASBM_1   : out std_logic;
  HRDATA_RASBM_0   : out std_logic;
  HRESP_RASBM_1    : out std_logic;
  HRESP_RASBM_0    : out std_logic;
  HCLK_RASB        : out std_logic;
  HREADY_RASB      : out std_logic;
  HRESET_N_RASB    : out std_logic;
  RASB_DONE        : out std_logic;
  RASB_GSR_N       : out std_logic;
  RASB_IRQ_OUT     : out std_logic;
  EXT_CLK_P1_IN    : in  std_logic;
  EXT_CLK_P2_IN    : in  std_logic;
  EXT_DONE_IN      : in  std_logic;
  QUAD_AND_FP0_7   : in  std_logic;
  QUAD_AND_FP0_6   : in  std_logic;
  QUAD_AND_FP0_5   : in  std_logic;
  QUAD_AND_FP0_4   : in  std_logic;
  QUAD_AND_FP0_3   : in  std_logic;
  QUAD_AND_FP0_2   : in  std_logic;
  QUAD_AND_FP0_1   : in  std_logic;
  QUAD_AND_FP0_0   : in  std_logic;
  QUAD_AND_FP1_7   : in  std_logic;
  QUAD_AND_FP1_6   : in  std_logic;
  QUAD_AND_FP1_5   : in  std_logic;
  QUAD_AND_FP1_4   : in  std_logic;
  QUAD_AND_FP1_3   : in  std_logic;
  QUAD_AND_FP1_2   : in  std_logic;
  QUAD_AND_FP1_1   : in  std_logic;
  QUAD_AND_FP1_0   : in  std_logic;
  QUAD_CLK_7       : in  std_logic;
  QUAD_CLK_6       : in  std_logic;
  QUAD_CLK_5       : in  std_logic;
  QUAD_CLK_4       : in  std_logic;
  QUAD_CLK_3       : in  std_logic;
  QUAD_CLK_2       : in  std_logic;
  QUAD_CLK_1       : in  std_logic;
  QUAD_CLK_0       : in  std_logic;
  QUAD_DONE_7      : in  std_logic;
  QUAD_DONE_6      : in  std_logic;
  QUAD_DONE_5      : in  std_logic;
  QUAD_DONE_4      : in  std_logic;
  QUAD_DONE_3      : in  std_logic;
  QUAD_DONE_2      : in  std_logic;
  QUAD_DONE_1      : in  std_logic;
  QUAD_DONE_0      : in  std_logic;
  QUAD_OR_FP0_7    : in  std_logic;
  QUAD_OR_FP0_6    : in  std_logic;
  QUAD_OR_FP0_5    : in  std_logic;
  QUAD_OR_FP0_4    : in  std_logic;
  QUAD_OR_FP0_3    : in  std_logic;
  QUAD_OR_FP0_2    : in  std_logic;
  QUAD_OR_FP0_1    : in  std_logic;
  QUAD_OR_FP0_0    : in  std_logic;
  QUAD_OR_FP1_7    : in  std_logic;
  QUAD_OR_FP1_6    : in  std_logic;
  QUAD_OR_FP1_5    : in  std_logic;
  QUAD_OR_FP1_4    : in  std_logic;
  QUAD_OR_FP1_3    : in  std_logic;
  QUAD_OR_FP1_2    : in  std_logic;
  QUAD_OR_FP1_1    : in  std_logic;
  QUAD_OR_FP1_0    : in  std_logic;
  QUAD_RST_N_7     : in  std_logic;
  QUAD_RST_N_6     : in  std_logic;
  QUAD_RST_N_5     : in  std_logic;
  QUAD_RST_N_4     : in  std_logic;
  QUAD_RST_N_3     : in  std_logic;
  QUAD_RST_N_2     : in  std_logic;
  QUAD_RST_N_1     : in  std_logic;
  QUAD_RST_N_0     : in  std_logic;
  QUAD_START_7     : in  std_logic;
  QUAD_START_6     : in  std_logic;
  QUAD_START_5     : in  std_logic;
  QUAD_START_4     : in  std_logic;
  QUAD_START_3     : in  std_logic;
  QUAD_START_2     : in  std_logic;
  QUAD_START_1     : in  std_logic;
  QUAD_START_0     : in  std_logic;
  EXT_CLK_P1_OUT   : out std_logic;
  EXT_CLK_P2_OUT   : out std_logic;
  EXT_DONE_OUT     : out std_logic;
  GRP_CLK_P1_L_3     : out std_logic;
  GRP_CLK_P1_L_2     : out std_logic;
  GRP_CLK_P1_L_1     : out std_logic;
  GRP_CLK_P1_L_0     : out std_logic;
  GRP_CLK_P2_L_3     : out std_logic;
  GRP_CLK_P2_L_2     : out std_logic;
  GRP_CLK_P2_L_1     : out std_logic;
  GRP_CLK_P2_L_0     : out std_logic;
  GRP_DESKEW_ERROR_L_3   : out std_logic;
  GRP_DESKEW_ERROR_L_2   : out std_logic;
  GRP_DESKEW_ERROR_L_1   : out std_logic;
  GRP_DESKEW_ERROR_L_0   : out std_logic;
  GRP_DONE_L_3       : out std_logic;
  GRP_DONE_L_2       : out std_logic;
  GRP_DONE_L_1       : out std_logic;
  GRP_DONE_L_0       : out std_logic;
  GRP_START_L_3      : out std_logic;
  GRP_START_L_2      : out std_logic;
  GRP_START_L_1      : out std_logic;
  GRP_START_L_0      : out std_logic;
  GRP_CLK_P1_R_3     : out std_logic;
  GRP_CLK_P1_R_2     : out std_logic;
  GRP_CLK_P1_R_1     : out std_logic;
  GRP_CLK_P1_R_0     : out std_logic;
  GRP_CLK_P2_R_3     : out std_logic;
  GRP_CLK_P2_R_2     : out std_logic;
  GRP_CLK_P2_R_1     : out std_logic;
  GRP_CLK_P2_R_0     : out std_logic;
  GRP_DESKEW_ERROR_R_3   : out std_logic;
  GRP_DESKEW_ERROR_R_2   : out std_logic;
  GRP_DESKEW_ERROR_R_1   : out std_logic;
  GRP_DESKEW_ERROR_R_0   : out std_logic;
  GRP_DONE_R_3       : out std_logic;
  GRP_DONE_R_2       : out std_logic;
  GRP_DONE_R_1       : out std_logic;
  GRP_DONE_R_0       : out std_logic;
  GRP_START_R_3      : out std_logic;
  GRP_START_R_2      : out std_logic;
  GRP_START_R_1      : out std_logic;
  GRP_START_R_0      : out std_logic;
  LPCS_INT_3       : in  std_logic;
  LPCS_INT_2       : in  std_logic;
  LPCS_INT_1       : in  std_logic;
  LPCS_INT_0       : in  std_logic;
  LPCS_RDATA_Q0_7  : in  std_logic;
  LPCS_RDATA_Q0_6  : in  std_logic;
  LPCS_RDATA_Q0_5  : in  std_logic;
  LPCS_RDATA_Q0_4  : in  std_logic;
  LPCS_RDATA_Q0_3  : in  std_logic;
  LPCS_RDATA_Q0_2  : in  std_logic;
  LPCS_RDATA_Q0_1  : in  std_logic;
  LPCS_RDATA_Q0_0  : in  std_logic;
  LPCS_RDATA_Q1_7  : in  std_logic;
  LPCS_RDATA_Q1_6  : in  std_logic;
  LPCS_RDATA_Q1_5  : in  std_logic;
  LPCS_RDATA_Q1_4  : in  std_logic;
  LPCS_RDATA_Q1_3  : in  std_logic;
  LPCS_RDATA_Q1_2  : in  std_logic;
  LPCS_RDATA_Q1_1  : in  std_logic;
  LPCS_RDATA_Q1_0  : in  std_logic;
  LPCS_RDATA_Q2_7  : in  std_logic;
  LPCS_RDATA_Q2_6  : in  std_logic;
  LPCS_RDATA_Q2_5  : in  std_logic;
  LPCS_RDATA_Q2_4  : in  std_logic;
  LPCS_RDATA_Q2_3  : in  std_logic;
  LPCS_RDATA_Q2_2  : in  std_logic;
  LPCS_RDATA_Q2_1  : in  std_logic;
  LPCS_RDATA_Q2_0  : in  std_logic;
  LPCS_RDATA_Q3_7  : in  std_logic;
  LPCS_RDATA_Q3_6  : in  std_logic;
  LPCS_RDATA_Q3_5  : in  std_logic;
  LPCS_RDATA_Q3_4  : in  std_logic;
  LPCS_RDATA_Q3_3  : in  std_logic;
  LPCS_RDATA_Q3_2  : in  std_logic;
  LPCS_RDATA_Q3_1  : in  std_logic;
  LPCS_RDATA_Q3_0  : in  std_logic;
  LPCS_ADDR_7      : out std_logic;
  LPCS_ADDR_6      : out std_logic;
  LPCS_ADDR_5      : out std_logic;
  LPCS_ADDR_4      : out std_logic;
  LPCS_ADDR_3      : out std_logic;
  LPCS_ADDR_2      : out std_logic;
  LPCS_ADDR_1      : out std_logic;
  LPCS_ADDR_0      : out std_logic;
  LPCS_WDATA_7     : out std_logic;
  LPCS_WDATA_6     : out std_logic;
  LPCS_WDATA_5     : out std_logic;
  LPCS_WDATA_4     : out std_logic;
  LPCS_WDATA_3     : out std_logic;
  LPCS_WDATA_2     : out std_logic;
  LPCS_WDATA_1     : out std_logic;
  LPCS_WDATA_0     : out std_logic;
  LPCS_C_15        : out std_logic;
  LPCS_C_14        : out std_logic;
  LPCS_C_13        : out std_logic;
  LPCS_C_12        : out std_logic;
  LPCS_C_11        : out std_logic;
  LPCS_C_10        : out std_logic;
  LPCS_C_9         : out std_logic;
  LPCS_C_8         : out std_logic;
  LPCS_C_7         : out std_logic;
  LPCS_C_6         : out std_logic;
  LPCS_C_5         : out std_logic;
  LPCS_C_4         : out std_logic;
  LPCS_C_3         : out std_logic;
  LPCS_C_2         : out std_logic;
  LPCS_C_1         : out std_logic;
  LPCS_C_0         : out std_logic;
  LPCS_Q_3         : out std_logic;
  LPCS_Q_2         : out std_logic;
  LPCS_Q_1         : out std_logic;
  LPCS_Q_0         : out std_logic;
  LPCS_RD          : out std_logic;
  LPCS_WSTB        : out std_logic;
  LPCS_QUAD_ID0_1  : out std_logic;
  LPCS_QUAD_ID0_0  : out std_logic;
  LPCS_QUAD_ID1_1  : out std_logic;
  LPCS_QUAD_ID1_0  : out std_logic;
  LPCS_QUAD_ID2_1  : out std_logic;
  LPCS_QUAD_ID2_0  : out std_logic;
  LPCS_QUAD_ID3_1  : out std_logic;
  LPCS_QUAD_ID3_0  : out std_logic;
  RPCS_INT_3       : in  std_logic;
  RPCS_INT_2       : in  std_logic;
  RPCS_INT_1       : in  std_logic;
  RPCS_INT_0       : in  std_logic;
  RPCS_RDATA_Q0_7  : in  std_logic;
  RPCS_RDATA_Q0_6  : in  std_logic;
  RPCS_RDATA_Q0_5  : in  std_logic;
  RPCS_RDATA_Q0_4  : in  std_logic;
  RPCS_RDATA_Q0_3  : in  std_logic;
  RPCS_RDATA_Q0_2  : in  std_logic;
  RPCS_RDATA_Q0_1  : in  std_logic;
  RPCS_RDATA_Q0_0  : in  std_logic;
  RPCS_RDATA_Q1_7  : in  std_logic;
  RPCS_RDATA_Q1_6  : in  std_logic;
  RPCS_RDATA_Q1_5  : in  std_logic;
  RPCS_RDATA_Q1_4  : in  std_logic;
  RPCS_RDATA_Q1_3  : in  std_logic;
  RPCS_RDATA_Q1_2  : in  std_logic;
  RPCS_RDATA_Q1_1  : in  std_logic;
  RPCS_RDATA_Q1_0  : in  std_logic;
  RPCS_RDATA_Q2_7  : in  std_logic;
  RPCS_RDATA_Q2_6  : in  std_logic;
  RPCS_RDATA_Q2_5  : in  std_logic;
  RPCS_RDATA_Q2_4  : in  std_logic;
  RPCS_RDATA_Q2_3  : in  std_logic;
  RPCS_RDATA_Q2_2  : in  std_logic;
  RPCS_RDATA_Q2_1  : in  std_logic;
  RPCS_RDATA_Q2_0  : in  std_logic;
  RPCS_RDATA_Q3_7  : in  std_logic;
  RPCS_RDATA_Q3_6  : in  std_logic;
  RPCS_RDATA_Q3_5  : in  std_logic;
  RPCS_RDATA_Q3_4  : in  std_logic;
  RPCS_RDATA_Q3_3  : in  std_logic;
  RPCS_RDATA_Q3_2  : in  std_logic;
  RPCS_RDATA_Q3_1  : in  std_logic;
  RPCS_RDATA_Q3_0  : in  std_logic;
  RPCS_ADDR_7      : out std_logic;
  RPCS_ADDR_6      : out std_logic;
  RPCS_ADDR_5      : out std_logic;
  RPCS_ADDR_4      : out std_logic;
  RPCS_ADDR_3      : out std_logic;
  RPCS_ADDR_2      : out std_logic;
  RPCS_ADDR_1      : out std_logic;
  RPCS_ADDR_0      : out std_logic;
  RPCS_WDATA_7     : out std_logic;
  RPCS_WDATA_6     : out std_logic;
  RPCS_WDATA_5     : out std_logic;
  RPCS_WDATA_4     : out std_logic;
  RPCS_WDATA_3     : out std_logic;
  RPCS_WDATA_2     : out std_logic;
  RPCS_WDATA_1     : out std_logic;
  RPCS_WDATA_0     : out std_logic;
  RPCS_C_15        : out std_logic;
  RPCS_C_14        : out std_logic;
  RPCS_C_13        : out std_logic;
  RPCS_C_12        : out std_logic;
  RPCS_C_11        : out std_logic;
  RPCS_C_10        : out std_logic;
  RPCS_C_9         : out std_logic;
  RPCS_C_8         : out std_logic;
  RPCS_C_7         : out std_logic;
  RPCS_C_6         : out std_logic;
  RPCS_C_5         : out std_logic;
  RPCS_C_4         : out std_logic;
  RPCS_C_3         : out std_logic;
  RPCS_C_2         : out std_logic;
  RPCS_C_1         : out std_logic;
  RPCS_C_0         : out std_logic;
  RPCS_Q_3         : out std_logic;
  RPCS_Q_2         : out std_logic;
  RPCS_Q_1         : out std_logic;
  RPCS_Q_0         : out std_logic;
  RPCS_RD          : out std_logic;
  RPCS_WSTB        : out std_logic;
  RPCS_QUAD_ID0_1  : out std_logic;
  RPCS_QUAD_ID0_0  : out std_logic;
  RPCS_QUAD_ID1_1  : out std_logic;
  RPCS_QUAD_ID1_0  : out std_logic;
  RPCS_QUAD_ID2_1  : out std_logic;
  RPCS_QUAD_ID2_0  : out std_logic;
  RPCS_QUAD_ID3_1  : out std_logic;
  RPCS_QUAD_ID3_0  : out std_logic;
  DMA_RD_DATA_31   : in  std_logic;
  DMA_RD_DATA_30   : in  std_logic;
  DMA_RD_DATA_29   : in  std_logic;
  DMA_RD_DATA_28   : in  std_logic;
  DMA_RD_DATA_27   : in  std_logic;
  DMA_RD_DATA_26   : in  std_logic;
  DMA_RD_DATA_25   : in  std_logic;
  DMA_RD_DATA_24   : in  std_logic;
  DMA_RD_DATA_23   : in  std_logic;
  DMA_RD_DATA_22   : in  std_logic;
  DMA_RD_DATA_21   : in  std_logic;
  DMA_RD_DATA_20   : in  std_logic;
  DMA_RD_DATA_19   : in  std_logic;
  DMA_RD_DATA_18   : in  std_logic;
  DMA_RD_DATA_17   : in  std_logic;
  DMA_RD_DATA_16   : in  std_logic;
  DMA_RD_DATA_15   : in  std_logic;
  DMA_RD_DATA_14   : in  std_logic;
  DMA_RD_DATA_13   : in  std_logic;
  DMA_RD_DATA_12   : in  std_logic;
  DMA_RD_DATA_11   : in  std_logic;
  DMA_RD_DATA_10   : in  std_logic;
  DMA_RD_DATA_9    : in  std_logic;
  DMA_RD_DATA_8    : in  std_logic;
  DMA_RD_DATA_7    : in  std_logic;
  DMA_RD_DATA_6    : in  std_logic;
  DMA_RD_DATA_5    : in  std_logic;
  DMA_RD_DATA_4    : in  std_logic;
  DMA_RD_DATA_3    : in  std_logic;
  DMA_RD_DATA_2    : in  std_logic;
  DMA_RD_DATA_1    : in  std_logic;
  DMA_RD_DATA_0    : in  std_logic;
  DMA_RD_PARITY_3  : in  std_logic;
  DMA_RD_PARITY_2  : in  std_logic;
  DMA_RD_PARITY_1  : in  std_logic;
  DMA_RD_PARITY_0  : in  std_logic;
  DMA_RETRY        : in  std_logic;
  DMA_TA           : in  std_logic;
  DMA_TEA          : in  std_logic;
  DMA_TRI_CTL      : in  std_logic;
  DMA_TRI_DATA     : in  std_logic);

end SYSBUSA;

architecture SYSBUSA_arch of SYSBUSA is

component SYSBUSA_sim
GENERIC(
  SYSBUS_CONFIG_FILE : String;
  MPI_PARITY : String;
  MPI_BUS_WIDTH : Integer;
  SYS_CLK_SEL : String;
  MPI_PRIORITY : String;
  FPGA_PRIORITY : String;
  MPI_RST : String;
  MASTER_RST : String;
  PARITY : String;
  MPI_SYNCMODE : String;
  MASTER_SYNCMODE : String;
  MASTER_AUTORETRY : String;
  SLAVE_SYNCMODE : String;
  INTERRUPT_VECTOR1 : Integer;
  INTERRUPT_VECTOR2 : Integer;
  INTERRUPT_VECTOR3 : Integer;
  INTERRUPT_VECTOR4 : Integer;
  INTERRUPT_VECTOR5 : Integer;
  INTERRUPT_VECTOR6 : Integer
  );
port (
  CS0_N            : in std_logic;
  CS1              : in std_logic;
  MPI_CLK          : in std_logic;
  MPI_WR_N         : in std_logic;
  MPI_STRB_N       : in std_logic;
  MPI_BURST        : in std_logic;
  MPI_BDIP         : in std_logic;
  MPI_RST_N        : in std_logic;
  USR_CLK          : in std_logic;
  USER_IRQ_IN      : in std_logic;
  SYS_RST_N        : in std_logic;
  MPI_TSIZ_1       : in std_logic;
  MPI_TSIZ_0       : in std_logic;
  MPI_ADDR_14      : in std_logic;
  MPI_ADDR_15      : in std_logic;
  MPI_ADDR_16      : in std_logic;
  MPI_ADDR_17      : in std_logic;
  MPI_ADDR_18      : in std_logic;
  MPI_ADDR_19      : in std_logic;
  MPI_ADDR_20      : in std_logic;
  MPI_ADDR_21      : in std_logic;
  MPI_ADDR_22      : in std_logic;
  MPI_ADDR_23      : in std_logic;
  MPI_ADDR_24      : in std_logic;
  MPI_ADDR_25      : in std_logic;
  MPI_ADDR_26      : in std_logic;
  MPI_ADDR_27      : in std_logic;
  MPI_ADDR_28      : in std_logic;
  MPI_ADDR_29      : in std_logic;
  MPI_ADDR_30      : in std_logic;
  MPI_ADDR_31      : in std_logic;
  MPI_WR_DATA_31   : in std_logic;
  MPI_WR_DATA_30   : in std_logic;
  MPI_WR_DATA_29   : in std_logic;
  MPI_WR_DATA_28   : in std_logic;
  MPI_WR_DATA_27   : in std_logic;
  MPI_WR_DATA_26   : in std_logic;
  MPI_WR_DATA_25   : in std_logic;
  MPI_WR_DATA_24   : in std_logic;
  MPI_WR_DATA_23   : in std_logic;
  MPI_WR_DATA_22   : in std_logic;
  MPI_WR_DATA_21   : in std_logic;
  MPI_WR_DATA_20   : in std_logic;
  MPI_WR_DATA_19   : in std_logic;
  MPI_WR_DATA_18   : in std_logic;
  MPI_WR_DATA_17   : in std_logic;
  MPI_WR_DATA_16   : in std_logic;
  MPI_WR_DATA_15   : in std_logic;
  MPI_WR_DATA_14   : in std_logic;
  MPI_WR_DATA_13   : in std_logic;
  MPI_WR_DATA_12   : in std_logic;
  MPI_WR_DATA_11   : in std_logic;
  MPI_WR_DATA_10   : in std_logic;
  MPI_WR_DATA_9    : in std_logic;
  MPI_WR_DATA_8    : in std_logic;
  MPI_WR_DATA_7    : in std_logic;
  MPI_WR_DATA_6    : in std_logic;
  MPI_WR_DATA_5    : in std_logic;
  MPI_WR_DATA_4    : in std_logic;
  MPI_WR_DATA_3    : in std_logic;
  MPI_WR_DATA_2    : in std_logic;
  MPI_WR_DATA_1    : in std_logic;
  MPI_WR_DATA_0    : in std_logic;
  MPI_WR_PARITY_3  : in std_logic;
  MPI_WR_PARITY_2  : in std_logic;
  MPI_WR_PARITY_1  : in std_logic;
  MPI_WR_PARITY_0  : in std_logic;
  MPI_TA           : out std_logic;
  MPI_RETRY        : out std_logic;
  MPI_TEA          : out std_logic;
  PD2_0_TS         : out std_logic;
  PD7_3_TS         : out std_logic;
  PD15_8_TS        : out std_logic;
  PD31_16_TS       : out std_logic;
  MPI_IRQ_N        : out std_logic;
  MPI_CNTL_TS      : out std_logic;
  USER_IRQ_OUT     : out std_logic;
  HCLK_CIB         : out std_logic;
  MPI_RD_DATA_31   : out std_logic;
  MPI_RD_DATA_30   : out std_logic;
  MPI_RD_DATA_29   : out std_logic;
  MPI_RD_DATA_28   : out std_logic;
  MPI_RD_DATA_27   : out std_logic;
  MPI_RD_DATA_26   : out std_logic;
  MPI_RD_DATA_25   : out std_logic;
  MPI_RD_DATA_24   : out std_logic;
  MPI_RD_DATA_23   : out std_logic;
  MPI_RD_DATA_22   : out std_logic;
  MPI_RD_DATA_21   : out std_logic;
  MPI_RD_DATA_20   : out std_logic;
  MPI_RD_DATA_19   : out std_logic;
  MPI_RD_DATA_18   : out std_logic;
  MPI_RD_DATA_17   : out std_logic;
  MPI_RD_DATA_16   : out std_logic;
  MPI_RD_DATA_15   : out std_logic;
  MPI_RD_DATA_14   : out std_logic;
  MPI_RD_DATA_13   : out std_logic;
  MPI_RD_DATA_12   : out std_logic;
  MPI_RD_DATA_11   : out std_logic;
  MPI_RD_DATA_10   : out std_logic;
  MPI_RD_DATA_9    : out std_logic;
  MPI_RD_DATA_8    : out std_logic;
  MPI_RD_DATA_7    : out std_logic;
  MPI_RD_DATA_6    : out std_logic;
  MPI_RD_DATA_5    : out std_logic;
  MPI_RD_DATA_4    : out std_logic;
  MPI_RD_DATA_3    : out std_logic;
  MPI_RD_DATA_2    : out std_logic;
  MPI_RD_DATA_1    : out std_logic;
  MPI_RD_DATA_0    : out std_logic;
  MPI_RD_PARITY_3  : out std_logic;
  MPI_RD_PARITY_2  : out std_logic;
  MPI_RD_PARITY_1  : out std_logic;
  MPI_RD_PARITY_0  : out std_logic;
  MPI_DP_TS_0      : out std_logic;
  MPI_DP_TS_1      : out std_logic;
  MPI_DP_TS_2      : out std_logic;
  SMI_RDATA_63     : in  std_logic;
  SMI_RDATA_62     : in  std_logic;
  SMI_RDATA_61     : in  std_logic;
  SMI_RDATA_60     : in  std_logic;
  SMI_RDATA_59     : in  std_logic;
  SMI_RDATA_58     : in  std_logic;
  SMI_RDATA_57     : in  std_logic;
  SMI_RDATA_56     : in  std_logic;
  SMI_RDATA_55     : in  std_logic;
  SMI_RDATA_54     : in  std_logic;
  SMI_RDATA_53     : in  std_logic;
  SMI_RDATA_52     : in  std_logic;
  SMI_RDATA_51     : in  std_logic;
  SMI_RDATA_50     : in  std_logic;
  SMI_RDATA_49     : in  std_logic;
  SMI_RDATA_48     : in  std_logic;
  SMI_RDATA_47     : in  std_logic;
  SMI_RDATA_46     : in  std_logic;
  SMI_RDATA_45     : in  std_logic;
  SMI_RDATA_44     : in  std_logic;
  SMI_RDATA_43     : in  std_logic;
  SMI_RDATA_42     : in  std_logic;
  SMI_RDATA_41     : in  std_logic;
  SMI_RDATA_40     : in  std_logic;
  SMI_RDATA_39     : in  std_logic;
  SMI_RDATA_38     : in  std_logic;
  SMI_RDATA_37     : in  std_logic;
  SMI_RDATA_36     : in  std_logic;
  SMI_RDATA_35     : in  std_logic;
  SMI_RDATA_34     : in  std_logic;
  SMI_RDATA_33     : in  std_logic;
  SMI_RDATA_32     : in  std_logic;
  SMI_RDATA_31     : in  std_logic;
  SMI_RDATA_30     : in  std_logic;
  SMI_RDATA_29     : in  std_logic;
  SMI_RDATA_28     : in  std_logic;
  SMI_RDATA_27     : in  std_logic;
  SMI_RDATA_26     : in  std_logic;
  SMI_RDATA_25     : in  std_logic;
  SMI_RDATA_24     : in  std_logic;
  SMI_RDATA_23     : in  std_logic;
  SMI_RDATA_22     : in  std_logic;
  SMI_RDATA_21     : in  std_logic;
  SMI_RDATA_20     : in  std_logic;
  SMI_RDATA_19     : in  std_logic;
  SMI_RDATA_18     : in  std_logic;
  SMI_RDATA_17     : in  std_logic;
  SMI_RDATA_16     : in  std_logic;
  SMI_RDATA_15     : in  std_logic;
  SMI_RDATA_14     : in  std_logic;
  SMI_RDATA_13     : in  std_logic;
  SMI_RDATA_12     : in  std_logic;
  SMI_RDATA_11     : in  std_logic;
  SMI_RDATA_10     : in  std_logic;
  SMI_RDATA_9      : in  std_logic;
  SMI_RDATA_8      : in  std_logic;
  SMI_RDATA_7      : in  std_logic;
  SMI_RDATA_6      : in  std_logic;
  SMI_RDATA_5      : in  std_logic;
  SMI_RDATA_4      : in  std_logic;
  SMI_RDATA_3      : in  std_logic;
  SMI_RDATA_2      : in  std_logic;
  SMI_RDATA_1      : in  std_logic;
  SMI_RDATA_0      : in  std_logic;
  SMI_ADDR_9       : out std_logic;
  SMI_ADDR_8       : out std_logic;
  SMI_ADDR_7       : out std_logic;
  SMI_ADDR_6       : out std_logic;
  SMI_ADDR_5       : out std_logic;
  SMI_ADDR_4       : out std_logic;
  SMI_ADDR_3       : out std_logic;
  SMI_ADDR_2       : out std_logic;
  SMI_ADDR_1       : out std_logic;
  SMI_ADDR_0       : out std_logic;
  SMI_CLK          : out std_logic;
  SMI_RD           : out std_logic;
  SMI_RST_N        : out std_logic;
  SMI_WDATA        : out std_logic;
  SMI_WR           : out std_logic;
  FMADDR_17        : in  std_logic;
  FMADDR_16        : in  std_logic;
  FMADDR_15        : in  std_logic;
  FMADDR_14        : in  std_logic;
  FMADDR_13        : in  std_logic;
  FMADDR_12        : in  std_logic;
  FMADDR_11        : in  std_logic;
  FMADDR_10        : in  std_logic;
  FMADDR_9         : in  std_logic;
  FMADDR_8         : in  std_logic;
  FMADDR_7         : in  std_logic;
  FMADDR_6         : in  std_logic;
  FMADDR_5         : in  std_logic;
  FMADDR_4         : in  std_logic;
  FMADDR_3         : in  std_logic;
  FMADDR_2         : in  std_logic;
  FMADDR_1         : in  std_logic;
  FMADDR_0         : in  std_logic;
  FMWDATA_35       : in  std_logic;
  FMWDATA_34       : in  std_logic;
  FMWDATA_33       : in  std_logic;
  FMWDATA_32       : in  std_logic;
  FMWDATA_31       : in  std_logic;
  FMWDATA_30       : in  std_logic;
  FMWDATA_29       : in  std_logic;
  FMWDATA_28       : in  std_logic;
  FMWDATA_27       : in  std_logic;
  FMWDATA_26       : in  std_logic;
  FMWDATA_25       : in  std_logic;
  FMWDATA_24       : in  std_logic;
  FMWDATA_23       : in  std_logic;
  FMWDATA_22       : in  std_logic;
  FMWDATA_21       : in  std_logic;
  FMWDATA_20       : in  std_logic;
  FMWDATA_19       : in  std_logic;
  FMWDATA_18       : in  std_logic;
  FMWDATA_17       : in  std_logic;
  FMWDATA_16       : in  std_logic;
  FMWDATA_15       : in  std_logic;
  FMWDATA_14       : in  std_logic;
  FMWDATA_13       : in  std_logic;
  FMWDATA_12       : in  std_logic;
  FMWDATA_11       : in  std_logic;
  FMWDATA_10       : in  std_logic;
  FMWDATA_9        : in  std_logic;
  FMWDATA_8        : in  std_logic;
  FMWDATA_7        : in  std_logic;
  FMWDATA_6        : in  std_logic;
  FMWDATA_5        : in  std_logic;
  FMWDATA_4        : in  std_logic;
  FMWDATA_3        : in  std_logic;
  FMWDATA_2        : in  std_logic;
  FMWDATA_1        : in  std_logic;
  FMWDATA_0        : in  std_logic;
  FMSIZE_0         : in  std_logic;
  FMSIZE_1         : in  std_logic;
  FMCLK            : in  std_logic;
  FMRESET_N        : in  std_logic;
  FMWRN            : in  std_logic;
  FMBURST          : in  std_logic;
  FMRDY            : in  std_logic;
  FMLOCK           : in  std_logic;
  FMIRQ            : in  std_logic;
  FMRDATA_35       : out std_logic;
  FMRDATA_34       : out std_logic;
  FMRDATA_33       : out std_logic;
  FMRDATA_32       : out std_logic;
  FMRDATA_31       : out std_logic;
  FMRDATA_30       : out std_logic;
  FMRDATA_29       : out std_logic;
  FMRDATA_28       : out std_logic;
  FMRDATA_27       : out std_logic;
  FMRDATA_26       : out std_logic;
  FMRDATA_25       : out std_logic;
  FMRDATA_24       : out std_logic;
  FMRDATA_23       : out std_logic;
  FMRDATA_22       : out std_logic;
  FMRDATA_21       : out std_logic;
  FMRDATA_20       : out std_logic;
  FMRDATA_19       : out std_logic;
  FMRDATA_18       : out std_logic;
  FMRDATA_17       : out std_logic;
  FMRDATA_16       : out std_logic;
  FMRDATA_15       : out std_logic;
  FMRDATA_14       : out std_logic;
  FMRDATA_13       : out std_logic;
  FMRDATA_12       : out std_logic;
  FMRDATA_11       : out std_logic;
  FMRDATA_10       : out std_logic;
  FMRDATA_9        : out std_logic;
  FMRDATA_8        : out std_logic;
  FMRDATA_7        : out std_logic;
  FMRDATA_6        : out std_logic;
  FMRDATA_5        : out std_logic;
  FMRDATA_4        : out std_logic;
  FMRDATA_3        : out std_logic;
  FMRDATA_2        : out std_logic;
  FMRDATA_1        : out std_logic;
  FMRDATA_0        : out std_logic;
  FMACK            : out std_logic;
  FMRETRY          : out std_logic;
  FMERR            : out std_logic;
  FSRDATA_35       : in  std_logic;
  FSRDATA_34       : in  std_logic;
  FSRDATA_33       : in  std_logic;
  FSRDATA_32       : in  std_logic;
  FSRDATA_31       : in  std_logic;
  FSRDATA_30       : in  std_logic;
  FSRDATA_29       : in  std_logic;
  FSRDATA_28       : in  std_logic;
  FSRDATA_27       : in  std_logic;
  FSRDATA_26       : in  std_logic;
  FSRDATA_25       : in  std_logic;
  FSRDATA_24       : in  std_logic;
  FSRDATA_23       : in  std_logic;
  FSRDATA_22       : in  std_logic;
  FSRDATA_21       : in  std_logic;
  FSRDATA_20       : in  std_logic;
  FSRDATA_19       : in  std_logic;
  FSRDATA_18       : in  std_logic;
  FSRDATA_17       : in  std_logic;
  FSRDATA_16       : in  std_logic;
  FSRDATA_15       : in  std_logic;
  FSRDATA_14       : in  std_logic;
  FSRDATA_13       : in  std_logic;
  FSRDATA_12       : in  std_logic;
  FSRDATA_11       : in  std_logic;
  FSRDATA_10       : in  std_logic;
  FSRDATA_9        : in  std_logic;
  FSRDATA_8        : in  std_logic;
  FSRDATA_7        : in  std_logic;
  FSRDATA_6        : in  std_logic;
  FSRDATA_5        : in  std_logic;
  FSRDATA_4        : in  std_logic;
  FSRDATA_3        : in  std_logic;
  FSRDATA_2        : in  std_logic;
  FSRDATA_1        : in  std_logic;
  FSRDATA_0        : in  std_logic;
  FSCLK            : in  std_logic;
  FSRESET_N        : in  std_logic;
  FSACK            : in  std_logic;
  FSRETRY          : in  std_logic;
  FSERR            : in  std_logic;
  FSIRQ            : in  std_logic;
  FSWDATA_35       : out std_logic;
  FSWDATA_34       : out std_logic;
  FSWDATA_33       : out std_logic;
  FSWDATA_32       : out std_logic;
  FSWDATA_31       : out std_logic;
  FSWDATA_30       : out std_logic;
  FSWDATA_29       : out std_logic;
  FSWDATA_28       : out std_logic;
  FSWDATA_27       : out std_logic;
  FSWDATA_26       : out std_logic;
  FSWDATA_25       : out std_logic;
  FSWDATA_24       : out std_logic;
  FSWDATA_23       : out std_logic;
  FSWDATA_22       : out std_logic;
  FSWDATA_21       : out std_logic;
  FSWDATA_20       : out std_logic;
  FSWDATA_19       : out std_logic;
  FSWDATA_18       : out std_logic;
  FSWDATA_17       : out std_logic;
  FSWDATA_16       : out std_logic;
  FSWDATA_15       : out std_logic;
  FSWDATA_14       : out std_logic;
  FSWDATA_13       : out std_logic;
  FSWDATA_12       : out std_logic;
  FSWDATA_11       : out std_logic;
  FSWDATA_10       : out std_logic;
  FSWDATA_9        : out std_logic;
  FSWDATA_8        : out std_logic;
  FSWDATA_7        : out std_logic;
  FSWDATA_6        : out std_logic;
  FSWDATA_5        : out std_logic;
  FSWDATA_4        : out std_logic;
  FSWDATA_3        : out std_logic;
  FSWDATA_2        : out std_logic;
  FSWDATA_1        : out std_logic;
  FSWDATA_0        : out std_logic;
  FSADDR_17        : out std_logic;
  FSADDR_16        : out std_logic;
  FSADDR_15        : out std_logic;
  FSADDR_14        : out std_logic;
  FSADDR_13        : out std_logic;
  FSADDR_12        : out std_logic;
  FSADDR_11        : out std_logic;
  FSADDR_10        : out std_logic;
  FSADDR_9         : out std_logic;
  FSADDR_8         : out std_logic;
  FSADDR_7         : out std_logic;
  FSADDR_6         : out std_logic;
  FSADDR_5         : out std_logic;
  FSADDR_4         : out std_logic;
  FSADDR_3         : out std_logic;
  FSADDR_2         : out std_logic;
  FSADDR_1         : out std_logic;
  FSADDR_0         : out std_logic;
  FSSIZE_0         : out std_logic;
  FSSIZE_1         : out std_logic;
  FSRDY            : out std_logic;
  FSWRN            : out std_logic;
  HADDR_LASBM_17   : in  std_logic;
  HADDR_LASBM_16   : in  std_logic;
  HADDR_LASBM_15   : in  std_logic;
  HADDR_LASBM_14   : in  std_logic;
  HADDR_LASBM_13   : in  std_logic;
  HADDR_LASBM_12   : in  std_logic;
  HADDR_LASBM_11   : in  std_logic;
  HADDR_LASBM_10   : in  std_logic;
  HADDR_LASBM_9    : in  std_logic;
  HADDR_LASBM_8    : in  std_logic;
  HADDR_LASBM_7    : in  std_logic;
  HADDR_LASBM_6    : in  std_logic;
  HADDR_LASBM_5    : in  std_logic;
  HADDR_LASBM_4    : in  std_logic;
  HADDR_LASBM_3    : in  std_logic;
  HADDR_LASBM_2    : in  std_logic;
  HADDR_LASBM_1    : in  std_logic;
  HADDR_LASBM_0    : in  std_logic;
  HSIZE_LASBM_1    : in  std_logic;
  HSIZE_LASBM_0    : in  std_logic;
  HTRANS_LASBM_1   : in  std_logic; 
  HTRANS_LASBM_0   : in  std_logic; 
  HWDATA_LASBM_35  : in  std_logic;
  HWDATA_LASBM_34  : in  std_logic;
  HWDATA_LASBM_33  : in  std_logic;
  HWDATA_LASBM_32  : in  std_logic;
  HWDATA_LASBM_31  : in  std_logic;
  HWDATA_LASBM_30  : in  std_logic;
  HWDATA_LASBM_29  : in  std_logic;
  HWDATA_LASBM_28  : in  std_logic;
  HWDATA_LASBM_27  : in  std_logic;
  HWDATA_LASBM_26  : in  std_logic;
  HWDATA_LASBM_25  : in  std_logic;
  HWDATA_LASBM_24  : in  std_logic;
  HWDATA_LASBM_23  : in  std_logic;
  HWDATA_LASBM_22  : in  std_logic;
  HWDATA_LASBM_21  : in  std_logic;
  HWDATA_LASBM_20  : in  std_logic;
  HWDATA_LASBM_19  : in  std_logic;
  HWDATA_LASBM_18  : in  std_logic;
  HWDATA_LASBM_17  : in  std_logic;
  HWDATA_LASBM_16  : in  std_logic;
  HWDATA_LASBM_15  : in  std_logic;
  HWDATA_LASBM_14  : in  std_logic;
  HWDATA_LASBM_13  : in  std_logic;
  HWDATA_LASBM_12  : in  std_logic;
  HWDATA_LASBM_11  : in  std_logic;
  HWDATA_LASBM_10  : in  std_logic;
  HWDATA_LASBM_9   : in  std_logic;
  HWDATA_LASBM_8   : in  std_logic;
  HWDATA_LASBM_7   : in  std_logic;
  HWDATA_LASBM_6   : in  std_logic;
  HWDATA_LASBM_5   : in  std_logic;
  HWDATA_LASBM_4   : in  std_logic;
  HWDATA_LASBM_3   : in  std_logic;
  HWDATA_LASBM_2   : in  std_logic;
  HWDATA_LASBM_1   : in  std_logic;
  HWDATA_LASBM_0   : in  std_logic;
  HBURST_LASBM     : in  std_logic;
  HWRITE_LASBM     : in  std_logic;
  LASB_CLK         : in  std_logic;
  LASB_GSR         : in  std_logic;
  LASB_IRQ_MASTER  : in  std_logic;
  HRDATA_LASBM_35  : out std_logic;
  HRDATA_LASBM_34  : out std_logic;
  HRDATA_LASBM_33  : out std_logic;
  HRDATA_LASBM_32  : out std_logic;
  HRDATA_LASBM_31  : out std_logic;
  HRDATA_LASBM_30  : out std_logic;
  HRDATA_LASBM_29  : out std_logic;
  HRDATA_LASBM_28  : out std_logic;
  HRDATA_LASBM_27  : out std_logic;
  HRDATA_LASBM_26  : out std_logic;
  HRDATA_LASBM_25  : out std_logic;
  HRDATA_LASBM_24  : out std_logic;
  HRDATA_LASBM_23  : out std_logic;
  HRDATA_LASBM_22  : out std_logic;
  HRDATA_LASBM_21  : out std_logic;
  HRDATA_LASBM_20  : out std_logic;
  HRDATA_LASBM_19  : out std_logic;
  HRDATA_LASBM_18  : out std_logic;
  HRDATA_LASBM_17  : out std_logic;
  HRDATA_LASBM_16  : out std_logic;
  HRDATA_LASBM_15  : out std_logic;
  HRDATA_LASBM_14  : out std_logic;
  HRDATA_LASBM_13  : out std_logic;
  HRDATA_LASBM_12  : out std_logic;
  HRDATA_LASBM_11  : out std_logic;
  HRDATA_LASBM_10  : out std_logic;
  HRDATA_LASBM_9   : out std_logic;
  HRDATA_LASBM_8   : out std_logic;
  HRDATA_LASBM_7   : out std_logic;
  HRDATA_LASBM_6   : out std_logic;
  HRDATA_LASBM_5   : out std_logic;
  HRDATA_LASBM_4   : out std_logic;
  HRDATA_LASBM_3   : out std_logic;
  HRDATA_LASBM_2   : out std_logic;
  HRDATA_LASBM_1   : out std_logic;
  HRDATA_LASBM_0   : out std_logic;
  HRESP_LASBM_1    : out std_logic;
  HRESP_LASBM_0    : out std_logic;
  HCLK_LASB        : out std_logic;
  HREADY_LASB      : out std_logic;
  HRESET_N_LASB    : out std_logic;
  LASB_DONE        : out std_logic;
  LASB_GSR_N       : out std_logic;
  LASB_IRQ_OUT     : out std_logic;
  HADDR_RASBM_17   : in  std_logic;
  HADDR_RASBM_16   : in  std_logic;
  HADDR_RASBM_15   : in  std_logic;
  HADDR_RASBM_14   : in  std_logic;
  HADDR_RASBM_13   : in  std_logic;
  HADDR_RASBM_12   : in  std_logic;
  HADDR_RASBM_11   : in  std_logic;
  HADDR_RASBM_10   : in  std_logic;
  HADDR_RASBM_9    : in  std_logic;
  HADDR_RASBM_8    : in  std_logic;
  HADDR_RASBM_7    : in  std_logic;
  HADDR_RASBM_6    : in  std_logic;
  HADDR_RASBM_5    : in  std_logic;
  HADDR_RASBM_4    : in  std_logic;
  HADDR_RASBM_3    : in  std_logic;
  HADDR_RASBM_2    : in  std_logic;
  HADDR_RASBM_1    : in  std_logic;
  HADDR_RASBM_0    : in  std_logic;
  HSIZE_RASBM_1    : in  std_logic;
  HSIZE_RASBM_0    : in  std_logic;
  HTRANS_RASBM_1   : in  std_logic; 
  HTRANS_RASBM_0   : in  std_logic; 
  HWDATA_RASBM_35  : in  std_logic;
  HWDATA_RASBM_34  : in  std_logic;
  HWDATA_RASBM_33  : in  std_logic;
  HWDATA_RASBM_32  : in  std_logic;
  HWDATA_RASBM_31  : in  std_logic;
  HWDATA_RASBM_30  : in  std_logic;
  HWDATA_RASBM_29  : in  std_logic;
  HWDATA_RASBM_28  : in  std_logic;
  HWDATA_RASBM_27  : in  std_logic;
  HWDATA_RASBM_26  : in  std_logic;
  HWDATA_RASBM_25  : in  std_logic;
  HWDATA_RASBM_24  : in  std_logic;
  HWDATA_RASBM_23  : in  std_logic;
  HWDATA_RASBM_22  : in  std_logic;
  HWDATA_RASBM_21  : in  std_logic;
  HWDATA_RASBM_20  : in  std_logic;
  HWDATA_RASBM_19  : in  std_logic;
  HWDATA_RASBM_18  : in  std_logic;
  HWDATA_RASBM_17  : in  std_logic;
  HWDATA_RASBM_16  : in  std_logic;
  HWDATA_RASBM_15  : in  std_logic;
  HWDATA_RASBM_14  : in  std_logic;
  HWDATA_RASBM_13  : in  std_logic;
  HWDATA_RASBM_12  : in  std_logic;
  HWDATA_RASBM_11  : in  std_logic;
  HWDATA_RASBM_10  : in  std_logic;
  HWDATA_RASBM_9   : in  std_logic;
  HWDATA_RASBM_8   : in  std_logic;
  HWDATA_RASBM_7   : in  std_logic;
  HWDATA_RASBM_6   : in  std_logic;
  HWDATA_RASBM_5   : in  std_logic;
  HWDATA_RASBM_4   : in  std_logic;
  HWDATA_RASBM_3   : in  std_logic;
  HWDATA_RASBM_2   : in  std_logic;
  HWDATA_RASBM_1   : in  std_logic;
  HWDATA_RASBM_0   : in  std_logic;
  HBURST_RASBM     : in  std_logic;
  HWRITE_RASBM     : in  std_logic;
  RASB_CLK         : in  std_logic;
  RASB_GSR         : in  std_logic;
  RASB_IRQ_MASTER  : in  std_logic;
  HRDATA_RASBM_35  : out std_logic;
  HRDATA_RASBM_34  : out std_logic;
  HRDATA_RASBM_33  : out std_logic;
  HRDATA_RASBM_32  : out std_logic;
  HRDATA_RASBM_31  : out std_logic;
  HRDATA_RASBM_30  : out std_logic;
  HRDATA_RASBM_29  : out std_logic;
  HRDATA_RASBM_28  : out std_logic;
  HRDATA_RASBM_27  : out std_logic;
  HRDATA_RASBM_26  : out std_logic;
  HRDATA_RASBM_25  : out std_logic;
  HRDATA_RASBM_24  : out std_logic;
  HRDATA_RASBM_23  : out std_logic;
  HRDATA_RASBM_22  : out std_logic;
  HRDATA_RASBM_21  : out std_logic;
  HRDATA_RASBM_20  : out std_logic;
  HRDATA_RASBM_19  : out std_logic;
  HRDATA_RASBM_18  : out std_logic;
  HRDATA_RASBM_17  : out std_logic;
  HRDATA_RASBM_16  : out std_logic;
  HRDATA_RASBM_15  : out std_logic;
  HRDATA_RASBM_14  : out std_logic;
  HRDATA_RASBM_13  : out std_logic;
  HRDATA_RASBM_12  : out std_logic;
  HRDATA_RASBM_11  : out std_logic;
  HRDATA_RASBM_10  : out std_logic;
  HRDATA_RASBM_9   : out std_logic;
  HRDATA_RASBM_8   : out std_logic;
  HRDATA_RASBM_7   : out std_logic;
  HRDATA_RASBM_6   : out std_logic;
  HRDATA_RASBM_5   : out std_logic;
  HRDATA_RASBM_4   : out std_logic;
  HRDATA_RASBM_3   : out std_logic;
  HRDATA_RASBM_2   : out std_logic;
  HRDATA_RASBM_1   : out std_logic;
  HRDATA_RASBM_0   : out std_logic;
  HRESP_RASBM_1    : out std_logic;
  HRESP_RASBM_0    : out std_logic;
  HCLK_RASB        : out std_logic;
  HREADY_RASB      : out std_logic;
  HRESET_N_RASB    : out std_logic;
  RASB_DONE        : out std_logic;
  RASB_GSR_N       : out std_logic;
  RASB_IRQ_OUT     : out std_logic;
  EXT_CLK_P1_IN    : in  std_logic;
  EXT_CLK_P2_IN    : in  std_logic;
  EXT_DONE_IN      : in  std_logic;
  QUAD_AND_FP0_7   : in  std_logic;
  QUAD_AND_FP0_6   : in  std_logic;
  QUAD_AND_FP0_5   : in  std_logic;
  QUAD_AND_FP0_4   : in  std_logic;
  QUAD_AND_FP0_3   : in  std_logic;
  QUAD_AND_FP0_2   : in  std_logic;
  QUAD_AND_FP0_1   : in  std_logic;
  QUAD_AND_FP0_0   : in  std_logic;
  QUAD_AND_FP1_7   : in  std_logic;
  QUAD_AND_FP1_6   : in  std_logic;
  QUAD_AND_FP1_5   : in  std_logic;
  QUAD_AND_FP1_4   : in  std_logic;
  QUAD_AND_FP1_3   : in  std_logic;
  QUAD_AND_FP1_2   : in  std_logic;
  QUAD_AND_FP1_1   : in  std_logic;
  QUAD_AND_FP1_0   : in  std_logic;
  QUAD_CLK_7       : in  std_logic;
  QUAD_CLK_6       : in  std_logic;
  QUAD_CLK_5       : in  std_logic;
  QUAD_CLK_4       : in  std_logic;
  QUAD_CLK_3       : in  std_logic;
  QUAD_CLK_2       : in  std_logic;
  QUAD_CLK_1       : in  std_logic;
  QUAD_CLK_0       : in  std_logic;
  QUAD_DONE_7      : in  std_logic;
  QUAD_DONE_6      : in  std_logic;
  QUAD_DONE_5      : in  std_logic;
  QUAD_DONE_4      : in  std_logic;
  QUAD_DONE_3      : in  std_logic;
  QUAD_DONE_2      : in  std_logic;
  QUAD_DONE_1      : in  std_logic;
  QUAD_DONE_0      : in  std_logic;
  QUAD_OR_FP0_7    : in  std_logic;
  QUAD_OR_FP0_6    : in  std_logic;
  QUAD_OR_FP0_5    : in  std_logic;
  QUAD_OR_FP0_4    : in  std_logic;
  QUAD_OR_FP0_3    : in  std_logic;
  QUAD_OR_FP0_2    : in  std_logic;
  QUAD_OR_FP0_1    : in  std_logic;
  QUAD_OR_FP0_0    : in  std_logic;
  QUAD_OR_FP1_7    : in  std_logic;
  QUAD_OR_FP1_6    : in  std_logic;
  QUAD_OR_FP1_5    : in  std_logic;
  QUAD_OR_FP1_4    : in  std_logic;
  QUAD_OR_FP1_3    : in  std_logic;
  QUAD_OR_FP1_2    : in  std_logic;
  QUAD_OR_FP1_1    : in  std_logic;
  QUAD_OR_FP1_0    : in  std_logic;
  QUAD_RST_N_7     : in  std_logic;
  QUAD_RST_N_6     : in  std_logic;
  QUAD_RST_N_5     : in  std_logic;
  QUAD_RST_N_4     : in  std_logic;
  QUAD_RST_N_3     : in  std_logic;
  QUAD_RST_N_2     : in  std_logic;
  QUAD_RST_N_1     : in  std_logic;
  QUAD_RST_N_0     : in  std_logic;
  QUAD_START_7     : in  std_logic;
  QUAD_START_6     : in  std_logic;
  QUAD_START_5     : in  std_logic;
  QUAD_START_4     : in  std_logic;
  QUAD_START_3     : in  std_logic;
  QUAD_START_2     : in  std_logic;
  QUAD_START_1     : in  std_logic;
  QUAD_START_0     : in  std_logic;
  EXT_CLK_P1_OUT   : out std_logic;
  EXT_CLK_P2_OUT   : out std_logic;
  EXT_DONE_OUT     : out std_logic;
  GRP_CLK_P1_L_3     : out std_logic;
  GRP_CLK_P1_L_2     : out std_logic;
  GRP_CLK_P1_L_1     : out std_logic;
  GRP_CLK_P1_L_0     : out std_logic;
  GRP_CLK_P2_L_3     : out std_logic;
  GRP_CLK_P2_L_2     : out std_logic;
  GRP_CLK_P2_L_1     : out std_logic;
  GRP_CLK_P2_L_0     : out std_logic;
  GRP_DESKEW_ERROR_L_3   : out std_logic;
  GRP_DESKEW_ERROR_L_2   : out std_logic;
  GRP_DESKEW_ERROR_L_1   : out std_logic;
  GRP_DESKEW_ERROR_L_0   : out std_logic;
  GRP_DONE_L_3       : out std_logic;
  GRP_DONE_L_2       : out std_logic;
  GRP_DONE_L_1       : out std_logic;
  GRP_DONE_L_0       : out std_logic;
  GRP_START_L_3      : out std_logic;
  GRP_START_L_2      : out std_logic;
  GRP_START_L_1      : out std_logic;
  GRP_START_L_0      : out std_logic;
  GRP_CLK_P1_R_3     : out std_logic;
  GRP_CLK_P1_R_2     : out std_logic;
  GRP_CLK_P1_R_1     : out std_logic;
  GRP_CLK_P1_R_0     : out std_logic;
  GRP_CLK_P2_R_3     : out std_logic;
  GRP_CLK_P2_R_2     : out std_logic;
  GRP_CLK_P2_R_1     : out std_logic;
  GRP_CLK_P2_R_0     : out std_logic;
  GRP_DESKEW_ERROR_R_3   : out std_logic;
  GRP_DESKEW_ERROR_R_2   : out std_logic;
  GRP_DESKEW_ERROR_R_1   : out std_logic;
  GRP_DESKEW_ERROR_R_0   : out std_logic;
  GRP_DONE_R_3       : out std_logic;
  GRP_DONE_R_2       : out std_logic;
  GRP_DONE_R_1       : out std_logic;
  GRP_DONE_R_0       : out std_logic;
  GRP_START_R_3      : out std_logic;
  GRP_START_R_2      : out std_logic;
  GRP_START_R_1      : out std_logic;
  GRP_START_R_0      : out std_logic;
  LPCS_INT_3       : in  std_logic;
  LPCS_INT_2       : in  std_logic;
  LPCS_INT_1       : in  std_logic;
  LPCS_INT_0       : in  std_logic;
  LPCS_RDATA_Q0_7  : in  std_logic;
  LPCS_RDATA_Q0_6  : in  std_logic;
  LPCS_RDATA_Q0_5  : in  std_logic;
  LPCS_RDATA_Q0_4  : in  std_logic;
  LPCS_RDATA_Q0_3  : in  std_logic;
  LPCS_RDATA_Q0_2  : in  std_logic;
  LPCS_RDATA_Q0_1  : in  std_logic;
  LPCS_RDATA_Q0_0  : in  std_logic;
  LPCS_RDATA_Q1_7  : in  std_logic;
  LPCS_RDATA_Q1_6  : in  std_logic;
  LPCS_RDATA_Q1_5  : in  std_logic;
  LPCS_RDATA_Q1_4  : in  std_logic;
  LPCS_RDATA_Q1_3  : in  std_logic;
  LPCS_RDATA_Q1_2  : in  std_logic;
  LPCS_RDATA_Q1_1  : in  std_logic;
  LPCS_RDATA_Q1_0  : in  std_logic;
  LPCS_RDATA_Q2_7  : in  std_logic;
  LPCS_RDATA_Q2_6  : in  std_logic;
  LPCS_RDATA_Q2_5  : in  std_logic;
  LPCS_RDATA_Q2_4  : in  std_logic;
  LPCS_RDATA_Q2_3  : in  std_logic;
  LPCS_RDATA_Q2_2  : in  std_logic;
  LPCS_RDATA_Q2_1  : in  std_logic;
  LPCS_RDATA_Q2_0  : in  std_logic;
  LPCS_RDATA_Q3_7  : in  std_logic;
  LPCS_RDATA_Q3_6  : in  std_logic;
  LPCS_RDATA_Q3_5  : in  std_logic;
  LPCS_RDATA_Q3_4  : in  std_logic;
  LPCS_RDATA_Q3_3  : in  std_logic;
  LPCS_RDATA_Q3_2  : in  std_logic;
  LPCS_RDATA_Q3_1  : in  std_logic;
  LPCS_RDATA_Q3_0  : in  std_logic;
  LPCS_ADDR_7      : out std_logic;
  LPCS_ADDR_6      : out std_logic;
  LPCS_ADDR_5      : out std_logic;
  LPCS_ADDR_4      : out std_logic;
  LPCS_ADDR_3      : out std_logic;
  LPCS_ADDR_2      : out std_logic;
  LPCS_ADDR_1      : out std_logic;
  LPCS_ADDR_0      : out std_logic;
  LPCS_WDATA_7     : out std_logic;
  LPCS_WDATA_6     : out std_logic;
  LPCS_WDATA_5     : out std_logic;
  LPCS_WDATA_4     : out std_logic;
  LPCS_WDATA_3     : out std_logic;
  LPCS_WDATA_2     : out std_logic;
  LPCS_WDATA_1     : out std_logic;
  LPCS_WDATA_0     : out std_logic;
  LPCS_C_15        : out std_logic;
  LPCS_C_14        : out std_logic;
  LPCS_C_13        : out std_logic;
  LPCS_C_12        : out std_logic;
  LPCS_C_11        : out std_logic;
  LPCS_C_10        : out std_logic;
  LPCS_C_9         : out std_logic;
  LPCS_C_8         : out std_logic;
  LPCS_C_7         : out std_logic;
  LPCS_C_6         : out std_logic;
  LPCS_C_5         : out std_logic;
  LPCS_C_4         : out std_logic;
  LPCS_C_3         : out std_logic;
  LPCS_C_2         : out std_logic;
  LPCS_C_1         : out std_logic;
  LPCS_C_0         : out std_logic;
  LPCS_Q_3         : out std_logic;
  LPCS_Q_2         : out std_logic;
  LPCS_Q_1         : out std_logic;
  LPCS_Q_0         : out std_logic;
  LPCS_RD          : out std_logic;
  LPCS_WSTB        : out std_logic;
  LPCS_QUAD_ID0_1  : out std_logic;
  LPCS_QUAD_ID0_0  : out std_logic;
  LPCS_QUAD_ID1_1  : out std_logic;
  LPCS_QUAD_ID1_0  : out std_logic;
  LPCS_QUAD_ID2_1  : out std_logic;
  LPCS_QUAD_ID2_0  : out std_logic;
  LPCS_QUAD_ID3_1  : out std_logic;
  LPCS_QUAD_ID3_0  : out std_logic;
  RPCS_INT_3       : in  std_logic;
  RPCS_INT_2       : in  std_logic;
  RPCS_INT_1       : in  std_logic;
  RPCS_INT_0       : in  std_logic;
  RPCS_RDATA_Q0_7  : in  std_logic;
  RPCS_RDATA_Q0_6  : in  std_logic;
  RPCS_RDATA_Q0_5  : in  std_logic;
  RPCS_RDATA_Q0_4  : in  std_logic;
  RPCS_RDATA_Q0_3  : in  std_logic;
  RPCS_RDATA_Q0_2  : in  std_logic;
  RPCS_RDATA_Q0_1  : in  std_logic;
  RPCS_RDATA_Q0_0  : in  std_logic;
  RPCS_RDATA_Q1_7  : in  std_logic;
  RPCS_RDATA_Q1_6  : in  std_logic;
  RPCS_RDATA_Q1_5  : in  std_logic;
  RPCS_RDATA_Q1_4  : in  std_logic;
  RPCS_RDATA_Q1_3  : in  std_logic;
  RPCS_RDATA_Q1_2  : in  std_logic;
  RPCS_RDATA_Q1_1  : in  std_logic;
  RPCS_RDATA_Q1_0  : in  std_logic;
  RPCS_RDATA_Q2_7  : in  std_logic;
  RPCS_RDATA_Q2_6  : in  std_logic;
  RPCS_RDATA_Q2_5  : in  std_logic;
  RPCS_RDATA_Q2_4  : in  std_logic;
  RPCS_RDATA_Q2_3  : in  std_logic;
  RPCS_RDATA_Q2_2  : in  std_logic;
  RPCS_RDATA_Q2_1  : in  std_logic;
  RPCS_RDATA_Q2_0  : in  std_logic;
  RPCS_RDATA_Q3_7  : in  std_logic;
  RPCS_RDATA_Q3_6  : in  std_logic;
  RPCS_RDATA_Q3_5  : in  std_logic;
  RPCS_RDATA_Q3_4  : in  std_logic;
  RPCS_RDATA_Q3_3  : in  std_logic;
  RPCS_RDATA_Q3_2  : in  std_logic;
  RPCS_RDATA_Q3_1  : in  std_logic;
  RPCS_RDATA_Q3_0  : in  std_logic;
  RPCS_ADDR_7      : out std_logic;
  RPCS_ADDR_6      : out std_logic;
  RPCS_ADDR_5      : out std_logic;
  RPCS_ADDR_4      : out std_logic;
  RPCS_ADDR_3      : out std_logic;
  RPCS_ADDR_2      : out std_logic;
  RPCS_ADDR_1      : out std_logic;
  RPCS_ADDR_0      : out std_logic;
  RPCS_WDATA_7     : out std_logic;
  RPCS_WDATA_6     : out std_logic;
  RPCS_WDATA_5     : out std_logic;
  RPCS_WDATA_4     : out std_logic;
  RPCS_WDATA_3     : out std_logic;
  RPCS_WDATA_2     : out std_logic;
  RPCS_WDATA_1     : out std_logic;
  RPCS_WDATA_0     : out std_logic;
  RPCS_C_15        : out std_logic;
  RPCS_C_14        : out std_logic;
  RPCS_C_13        : out std_logic;
  RPCS_C_12        : out std_logic;
  RPCS_C_11        : out std_logic;
  RPCS_C_10        : out std_logic;
  RPCS_C_9         : out std_logic;
  RPCS_C_8         : out std_logic;
  RPCS_C_7         : out std_logic;
  RPCS_C_6         : out std_logic;
  RPCS_C_5         : out std_logic;
  RPCS_C_4         : out std_logic;
  RPCS_C_3         : out std_logic;
  RPCS_C_2         : out std_logic;
  RPCS_C_1         : out std_logic;
  RPCS_C_0         : out std_logic;
  RPCS_Q_3         : out std_logic;
  RPCS_Q_2         : out std_logic;
  RPCS_Q_1         : out std_logic;
  RPCS_Q_0         : out std_logic;
  RPCS_RD          : out std_logic;
  RPCS_WSTB        : out std_logic;
  RPCS_QUAD_ID0_1  : out std_logic;
  RPCS_QUAD_ID0_0  : out std_logic;
  RPCS_QUAD_ID1_1  : out std_logic;
  RPCS_QUAD_ID1_0  : out std_logic;
  RPCS_QUAD_ID2_1  : out std_logic;
  RPCS_QUAD_ID2_0  : out std_logic;
  RPCS_QUAD_ID3_1  : out std_logic;
  RPCS_QUAD_ID3_0  : out std_logic;
  DMA_RD_DATA_31   : in  std_logic;
  DMA_RD_DATA_30   : in  std_logic;
  DMA_RD_DATA_29   : in  std_logic;
  DMA_RD_DATA_28   : in  std_logic;
  DMA_RD_DATA_27   : in  std_logic;
  DMA_RD_DATA_26   : in  std_logic;
  DMA_RD_DATA_25   : in  std_logic;
  DMA_RD_DATA_24   : in  std_logic;
  DMA_RD_DATA_23   : in  std_logic;
  DMA_RD_DATA_22   : in  std_logic;
  DMA_RD_DATA_21   : in  std_logic;
  DMA_RD_DATA_20   : in  std_logic;
  DMA_RD_DATA_19   : in  std_logic;
  DMA_RD_DATA_18   : in  std_logic;
  DMA_RD_DATA_17   : in  std_logic;
  DMA_RD_DATA_16   : in  std_logic;
  DMA_RD_DATA_15   : in  std_logic;
  DMA_RD_DATA_14   : in  std_logic;
  DMA_RD_DATA_13   : in  std_logic;
  DMA_RD_DATA_12   : in  std_logic;
  DMA_RD_DATA_11   : in  std_logic;
  DMA_RD_DATA_10   : in  std_logic;
  DMA_RD_DATA_9    : in  std_logic;
  DMA_RD_DATA_8    : in  std_logic;
  DMA_RD_DATA_7    : in  std_logic;
  DMA_RD_DATA_6    : in  std_logic;
  DMA_RD_DATA_5    : in  std_logic;
  DMA_RD_DATA_4    : in  std_logic;
  DMA_RD_DATA_3    : in  std_logic;
  DMA_RD_DATA_2    : in  std_logic;
  DMA_RD_DATA_1    : in  std_logic;
  DMA_RD_DATA_0    : in  std_logic;
  DMA_RD_PARITY_3  : in  std_logic;
  DMA_RD_PARITY_2  : in  std_logic;
  DMA_RD_PARITY_1  : in  std_logic;
  DMA_RD_PARITY_0  : in  std_logic;
  DMA_RETRY        : in  std_logic;
  DMA_TA           : in  std_logic;
  DMA_TEA          : in  std_logic;
  DMA_TRI_CTL      : in  std_logic;
  DMA_TRI_DATA     : in  std_logic);
end component;

begin

SYSBUSA_sim_inst : SYSBUSA_sim
generic map (
  SYSBUS_CONFIG_FILE => SYSBUS_CONFIG_FILE,
  MPI_PARITY       =>  MPI_PARITY,
  MPI_BUS_WIDTH    =>  MPI_BUS_WIDTH,
  SYS_CLK_SEL      =>  SYS_CLK_SEL,
  MPI_PRIORITY     =>  MPI_PRIORITY,
  FPGA_PRIORITY    =>  FPGA_PRIORITY,
  MPI_RST          =>  MPI_RST,
  MASTER_RST       =>  MASTER_RST,
  PARITY           =>  PARITY,
  MPI_SYNCMODE     =>  MPI_SYNCMODE,
  MASTER_SYNCMODE  =>  MASTER_SYNCMODE,
  MASTER_AUTORETRY =>  MASTER_AUTORETRY,
  SLAVE_SYNCMODE   =>  SLAVE_SYNCMODE,
  INTERRUPT_VECTOR1 =>  INTERRUPT_VECTOR1,
  INTERRUPT_VECTOR2 =>  INTERRUPT_VECTOR2,
  INTERRUPT_VECTOR3 =>  INTERRUPT_VECTOR3,
  INTERRUPT_VECTOR4 =>  INTERRUPT_VECTOR4,
  INTERRUPT_VECTOR5 =>  INTERRUPT_VECTOR5,
  INTERRUPT_VECTOR6 =>  INTERRUPT_VECTOR6)
 port map (
  CS0_N            => CS0_N,
  CS1              => CS1,
  MPI_CLK          => MPI_CLK,
  MPI_WR_N         => MPI_WR_N,
  MPI_STRB_N       => MPI_STRB_N,
  MPI_BURST        => MPI_BURST,
  MPI_BDIP         => MPI_BDIP,
  MPI_RST_N        => MPI_RST_N,
  USR_CLK          => USR_CLK,
  USER_IRQ_IN      => USER_IRQ_IN,
  SYS_RST_N        => SYS_RST_N,
  MPI_TSIZ_1       => MPI_TSIZ_1,
  MPI_TSIZ_0       => MPI_TSIZ_0,
  MPI_ADDR_14      => MPI_ADDR_14,
  MPI_ADDR_15      => MPI_ADDR_15,
  MPI_ADDR_16      => MPI_ADDR_16,
  MPI_ADDR_17      => MPI_ADDR_17,
  MPI_ADDR_18      => MPI_ADDR_18,
  MPI_ADDR_19      => MPI_ADDR_19,
  MPI_ADDR_20      => MPI_ADDR_20,
  MPI_ADDR_21      => MPI_ADDR_21,
  MPI_ADDR_22      => MPI_ADDR_22,
  MPI_ADDR_23      => MPI_ADDR_23,
  MPI_ADDR_24      => MPI_ADDR_24,
  MPI_ADDR_25      => MPI_ADDR_25,
  MPI_ADDR_26      => MPI_ADDR_26,
  MPI_ADDR_27      => MPI_ADDR_27,
  MPI_ADDR_28      => MPI_ADDR_28,
  MPI_ADDR_29      => MPI_ADDR_29,
  MPI_ADDR_30      => MPI_ADDR_30,
  MPI_ADDR_31      => MPI_ADDR_31,
  MPI_WR_DATA_31   => MPI_WR_DATA_31,
  MPI_WR_DATA_30   => MPI_WR_DATA_30,
  MPI_WR_DATA_29   => MPI_WR_DATA_29,
  MPI_WR_DATA_28   => MPI_WR_DATA_28,
  MPI_WR_DATA_27   => MPI_WR_DATA_27,
  MPI_WR_DATA_26   => MPI_WR_DATA_26,
  MPI_WR_DATA_25   => MPI_WR_DATA_25,
  MPI_WR_DATA_24   => MPI_WR_DATA_24,
  MPI_WR_DATA_23   => MPI_WR_DATA_23,
  MPI_WR_DATA_22   => MPI_WR_DATA_22,
  MPI_WR_DATA_21   => MPI_WR_DATA_21,
  MPI_WR_DATA_20   => MPI_WR_DATA_20,
  MPI_WR_DATA_19   => MPI_WR_DATA_19,
  MPI_WR_DATA_18   => MPI_WR_DATA_18,
  MPI_WR_DATA_17   => MPI_WR_DATA_17,
  MPI_WR_DATA_16   => MPI_WR_DATA_16,
  MPI_WR_DATA_15   => MPI_WR_DATA_15,
  MPI_WR_DATA_14   => MPI_WR_DATA_14,
  MPI_WR_DATA_13   => MPI_WR_DATA_13,
  MPI_WR_DATA_12   => MPI_WR_DATA_12,
  MPI_WR_DATA_11   => MPI_WR_DATA_11,
  MPI_WR_DATA_10   => MPI_WR_DATA_10,
  MPI_WR_DATA_9    => MPI_WR_DATA_9,
  MPI_WR_DATA_8    => MPI_WR_DATA_8,
  MPI_WR_DATA_7    => MPI_WR_DATA_7,
  MPI_WR_DATA_6    => MPI_WR_DATA_6,
  MPI_WR_DATA_5    => MPI_WR_DATA_5,
  MPI_WR_DATA_4    => MPI_WR_DATA_4,
  MPI_WR_DATA_3    => MPI_WR_DATA_3,
  MPI_WR_DATA_2    => MPI_WR_DATA_2,
  MPI_WR_DATA_1    => MPI_WR_DATA_1,
  MPI_WR_DATA_0    => MPI_WR_DATA_0,
  MPI_WR_PARITY_3  => MPI_WR_PARITY_3,
  MPI_WR_PARITY_2  => MPI_WR_PARITY_2,
  MPI_WR_PARITY_1  => MPI_WR_PARITY_1,
  MPI_WR_PARITY_0  => MPI_WR_PARITY_0,
  MPI_TA           => MPI_TA,
  MPI_RETRY        => MPI_RETRY,
  MPI_TEA          => MPI_TEA,
  PD2_0_TS         => PD2_0_TS,
  PD7_3_TS         => PD7_3_TS,
  PD15_8_TS        => PD15_8_TS,
  PD31_16_TS       => PD31_16_TS,
  MPI_IRQ_N        => MPI_IRQ_N,
  MPI_CNTL_TS      => MPI_CNTL_TS,
  USER_IRQ_OUT     => USER_IRQ_OUT,
  HCLK_CIB         => HCLK_CIB,
  MPI_RD_DATA_31   => MPI_RD_DATA_31,
  MPI_RD_DATA_30   => MPI_RD_DATA_30,
  MPI_RD_DATA_29   => MPI_RD_DATA_29,
  MPI_RD_DATA_28   => MPI_RD_DATA_28,
  MPI_RD_DATA_27   => MPI_RD_DATA_27,
  MPI_RD_DATA_26   => MPI_RD_DATA_26,
  MPI_RD_DATA_25   => MPI_RD_DATA_25,
  MPI_RD_DATA_24   => MPI_RD_DATA_24,
  MPI_RD_DATA_23   => MPI_RD_DATA_23,
  MPI_RD_DATA_22   => MPI_RD_DATA_22,
  MPI_RD_DATA_21   => MPI_RD_DATA_21,
  MPI_RD_DATA_20   => MPI_RD_DATA_20,
  MPI_RD_DATA_19   => MPI_RD_DATA_19,
  MPI_RD_DATA_18   => MPI_RD_DATA_18,
  MPI_RD_DATA_17   => MPI_RD_DATA_17,
  MPI_RD_DATA_16   => MPI_RD_DATA_16,
  MPI_RD_DATA_15   => MPI_RD_DATA_15,
  MPI_RD_DATA_14   => MPI_RD_DATA_14,
  MPI_RD_DATA_13   => MPI_RD_DATA_13,
  MPI_RD_DATA_12   => MPI_RD_DATA_12,
  MPI_RD_DATA_11   => MPI_RD_DATA_11,
  MPI_RD_DATA_10   => MPI_RD_DATA_10,
  MPI_RD_DATA_9    => MPI_RD_DATA_9,
  MPI_RD_DATA_8    => MPI_RD_DATA_8,
  MPI_RD_DATA_7    => MPI_RD_DATA_7,
  MPI_RD_DATA_6    => MPI_RD_DATA_6,
  MPI_RD_DATA_5    => MPI_RD_DATA_5,
  MPI_RD_DATA_4    => MPI_RD_DATA_4,
  MPI_RD_DATA_3    => MPI_RD_DATA_3,
  MPI_RD_DATA_2    => MPI_RD_DATA_2,
  MPI_RD_DATA_1    => MPI_RD_DATA_1,
  MPI_RD_DATA_0    => MPI_RD_DATA_0,
  MPI_RD_PARITY_3  => MPI_RD_PARITY_3,
  MPI_RD_PARITY_2  => MPI_RD_PARITY_2,
  MPI_RD_PARITY_1  => MPI_RD_PARITY_1,
  MPI_RD_PARITY_0  => MPI_RD_PARITY_0,
  MPI_DP_TS_0      => MPI_DP_TS_0,
  MPI_DP_TS_1      => MPI_DP_TS_1,
  MPI_DP_TS_2      => MPI_DP_TS_2,
  SMI_RDATA_63     => SMI_RDATA_63,
  SMI_RDATA_62     => SMI_RDATA_62,
  SMI_RDATA_61     => SMI_RDATA_61,
  SMI_RDATA_60     => SMI_RDATA_60,
  SMI_RDATA_59     => SMI_RDATA_59,
  SMI_RDATA_58     => SMI_RDATA_58,
  SMI_RDATA_57     => SMI_RDATA_57,
  SMI_RDATA_56     => SMI_RDATA_56,
  SMI_RDATA_55     => SMI_RDATA_55,
  SMI_RDATA_54     => SMI_RDATA_54,
  SMI_RDATA_53     => SMI_RDATA_53,
  SMI_RDATA_52     => SMI_RDATA_52,
  SMI_RDATA_51     => SMI_RDATA_51,
  SMI_RDATA_50     => SMI_RDATA_50,
  SMI_RDATA_49     => SMI_RDATA_49,
  SMI_RDATA_48     => SMI_RDATA_48,
  SMI_RDATA_47     => SMI_RDATA_47,
  SMI_RDATA_46     => SMI_RDATA_46,
  SMI_RDATA_45     => SMI_RDATA_45,
  SMI_RDATA_44     => SMI_RDATA_44,
  SMI_RDATA_43     => SMI_RDATA_43,
  SMI_RDATA_42     => SMI_RDATA_42,
  SMI_RDATA_41     => SMI_RDATA_41,
  SMI_RDATA_40     => SMI_RDATA_40,
  SMI_RDATA_39     => SMI_RDATA_39,
  SMI_RDATA_38     => SMI_RDATA_38,
  SMI_RDATA_37     => SMI_RDATA_37,
  SMI_RDATA_36     => SMI_RDATA_36,
  SMI_RDATA_35     => SMI_RDATA_35,
  SMI_RDATA_34     => SMI_RDATA_34,
  SMI_RDATA_33     => SMI_RDATA_33,
  SMI_RDATA_32     => SMI_RDATA_32,
  SMI_RDATA_31     => SMI_RDATA_31,
  SMI_RDATA_30     => SMI_RDATA_30,
  SMI_RDATA_29     => SMI_RDATA_29,
  SMI_RDATA_28     => SMI_RDATA_28,
  SMI_RDATA_27     => SMI_RDATA_27,
  SMI_RDATA_26     => SMI_RDATA_26,
  SMI_RDATA_25     => SMI_RDATA_25,
  SMI_RDATA_24     => SMI_RDATA_24,
  SMI_RDATA_23     => SMI_RDATA_23,
  SMI_RDATA_22     => SMI_RDATA_22,
  SMI_RDATA_21     => SMI_RDATA_21,
  SMI_RDATA_20     => SMI_RDATA_20,
  SMI_RDATA_19     => SMI_RDATA_19,
  SMI_RDATA_18     => SMI_RDATA_18,
  SMI_RDATA_17     => SMI_RDATA_17,
  SMI_RDATA_16     => SMI_RDATA_16,
  SMI_RDATA_15     => SMI_RDATA_15,
  SMI_RDATA_14     => SMI_RDATA_14,
  SMI_RDATA_13     => SMI_RDATA_13,
  SMI_RDATA_12     => SMI_RDATA_12,
  SMI_RDATA_11     => SMI_RDATA_11,
  SMI_RDATA_10     => SMI_RDATA_10,
  SMI_RDATA_9      => SMI_RDATA_9,
  SMI_RDATA_8      => SMI_RDATA_8,
  SMI_RDATA_7      => SMI_RDATA_7,
  SMI_RDATA_6      => SMI_RDATA_6,
  SMI_RDATA_5      => SMI_RDATA_5,
  SMI_RDATA_4      => SMI_RDATA_4,
  SMI_RDATA_3      => SMI_RDATA_3,
  SMI_RDATA_2      => SMI_RDATA_2,
  SMI_RDATA_1      => SMI_RDATA_1,
  SMI_RDATA_0      => SMI_RDATA_0,
  SMI_ADDR_9       => SMI_ADDR_9,
  SMI_ADDR_8       => SMI_ADDR_8,
  SMI_ADDR_7       => SMI_ADDR_7,
  SMI_ADDR_6       => SMI_ADDR_6,
  SMI_ADDR_5       => SMI_ADDR_5,
  SMI_ADDR_4       => SMI_ADDR_4,
  SMI_ADDR_3       => SMI_ADDR_3,
  SMI_ADDR_2       => SMI_ADDR_2,
  SMI_ADDR_1       => SMI_ADDR_1,
  SMI_ADDR_0       => SMI_ADDR_0,
  SMI_CLK          => SMI_CLK,
  SMI_RD           => SMI_RD,
  SMI_RST_N        => SMI_RST_N,
  SMI_WDATA        => SMI_WDATA,
  SMI_WR           => SMI_WR,
  FMADDR_17        => FMADDR_17,
  FMADDR_16        => FMADDR_16,
  FMADDR_15        => FMADDR_15,
  FMADDR_14        => FMADDR_14,
  FMADDR_13        => FMADDR_13,
  FMADDR_12        => FMADDR_12,
  FMADDR_11        => FMADDR_11,
  FMADDR_10        => FMADDR_10,
  FMADDR_9         => FMADDR_9,
  FMADDR_8         => FMADDR_8,
  FMADDR_7         => FMADDR_7,
  FMADDR_6         => FMADDR_6,
  FMADDR_5         => FMADDR_5,
  FMADDR_4         => FMADDR_4,
  FMADDR_3         => FMADDR_3,
  FMADDR_2         => FMADDR_2,
  FMADDR_1         => FMADDR_1,
  FMADDR_0         => FMADDR_0,
  FMWDATA_35       => FMWDATA_35,
  FMWDATA_34       => FMWDATA_34,
  FMWDATA_33       => FMWDATA_33,
  FMWDATA_32       => FMWDATA_32,
  FMWDATA_31       => FMWDATA_31,
  FMWDATA_30       => FMWDATA_30,
  FMWDATA_29       => FMWDATA_29,
  FMWDATA_28       => FMWDATA_28,
  FMWDATA_27       => FMWDATA_27,
  FMWDATA_26       => FMWDATA_26,
  FMWDATA_25       => FMWDATA_25,
  FMWDATA_24       => FMWDATA_24,
  FMWDATA_23       => FMWDATA_23,
  FMWDATA_22       => FMWDATA_22,
  FMWDATA_21       => FMWDATA_21,
  FMWDATA_20       => FMWDATA_20,
  FMWDATA_19       => FMWDATA_19,
  FMWDATA_18       => FMWDATA_18,
  FMWDATA_17       => FMWDATA_17,
  FMWDATA_16       => FMWDATA_16,
  FMWDATA_15       => FMWDATA_15,
  FMWDATA_14       => FMWDATA_14,
  FMWDATA_13       => FMWDATA_13,
  FMWDATA_12       => FMWDATA_12,
  FMWDATA_11       => FMWDATA_11,
  FMWDATA_10       => FMWDATA_10,
  FMWDATA_9        => FMWDATA_9,
  FMWDATA_8        => FMWDATA_8,
  FMWDATA_7        => FMWDATA_7,
  FMWDATA_6        => FMWDATA_6,
  FMWDATA_5        => FMWDATA_5,
  FMWDATA_4        => FMWDATA_4,
  FMWDATA_3        => FMWDATA_3,
  FMWDATA_2        => FMWDATA_2,
  FMWDATA_1        => FMWDATA_1,
  FMWDATA_0        => FMWDATA_0,
  FMSIZE_0         => FMSIZE_0,
  FMSIZE_1         => FMSIZE_1,
  FMCLK            => FMCLK,
  FMRESET_N        => FMRESET_N,
  FMWRN            => FMWRN,
  FMBURST          => FMBURST,
  FMRDY            => FMRDY,
  FMLOCK           => FMLOCK,
  FMIRQ            => FMIRQ,
  FMRDATA_35       => FMRDATA_35,
  FMRDATA_34       => FMRDATA_34,
  FMRDATA_33       => FMRDATA_33,
  FMRDATA_32       => FMRDATA_32,
  FMRDATA_31       => FMRDATA_31,
  FMRDATA_30       => FMRDATA_30,
  FMRDATA_29       => FMRDATA_29,
  FMRDATA_28       => FMRDATA_28,
  FMRDATA_27       => FMRDATA_27,
  FMRDATA_26       => FMRDATA_26,
  FMRDATA_25       => FMRDATA_25,
  FMRDATA_24       => FMRDATA_24,
  FMRDATA_23       => FMRDATA_23,
  FMRDATA_22       => FMRDATA_22,
  FMRDATA_21       => FMRDATA_21,
  FMRDATA_20       => FMRDATA_20,
  FMRDATA_19       => FMRDATA_19,
  FMRDATA_18       => FMRDATA_18,
  FMRDATA_17       => FMRDATA_17,
  FMRDATA_16       => FMRDATA_16,
  FMRDATA_15       => FMRDATA_15,
  FMRDATA_14       => FMRDATA_14,
  FMRDATA_13       => FMRDATA_13,
  FMRDATA_12       => FMRDATA_12,
  FMRDATA_11       => FMRDATA_11,
  FMRDATA_10       => FMRDATA_10,
  FMRDATA_9        => FMRDATA_9,
  FMRDATA_8        => FMRDATA_8,
  FMRDATA_7        => FMRDATA_7,
  FMRDATA_6        => FMRDATA_6,
  FMRDATA_5        => FMRDATA_5,
  FMRDATA_4        => FMRDATA_4,
  FMRDATA_3        => FMRDATA_3,
  FMRDATA_2        => FMRDATA_2,
  FMRDATA_1        => FMRDATA_1,
  FMRDATA_0        => FMRDATA_0,
  FMACK            => FMACK,
  FMRETRY          => FMRETRY,
  FMERR            => FMERR,
  FSRDATA_35       => FSRDATA_35,
  FSRDATA_34       => FSRDATA_34,
  FSRDATA_33       => FSRDATA_33,
  FSRDATA_32       => FSRDATA_32,
  FSRDATA_31       => FSRDATA_31,
  FSRDATA_30       => FSRDATA_30,
  FSRDATA_29       => FSRDATA_29,
  FSRDATA_28       => FSRDATA_28,
  FSRDATA_27       => FSRDATA_27,
  FSRDATA_26       => FSRDATA_26,
  FSRDATA_25       => FSRDATA_25,
  FSRDATA_24       => FSRDATA_24,
  FSRDATA_23       => FSRDATA_23,
  FSRDATA_22       => FSRDATA_22,
  FSRDATA_21       => FSRDATA_21,
  FSRDATA_20       => FSRDATA_20,
  FSRDATA_19       => FSRDATA_19,
  FSRDATA_18       => FSRDATA_18,
  FSRDATA_17       => FSRDATA_17,
  FSRDATA_16       => FSRDATA_16,
  FSRDATA_15       => FSRDATA_15,
  FSRDATA_14       => FSRDATA_14,
  FSRDATA_13       => FSRDATA_13,
  FSRDATA_12       => FSRDATA_12,
  FSRDATA_11       => FSRDATA_11,
  FSRDATA_10       => FSRDATA_10,
  FSRDATA_9        => FSRDATA_9,
  FSRDATA_8        => FSRDATA_8,
  FSRDATA_7        => FSRDATA_7,
  FSRDATA_6        => FSRDATA_6,
  FSRDATA_5        => FSRDATA_5,
  FSRDATA_4        => FSRDATA_4,
  FSRDATA_3        => FSRDATA_3,
  FSRDATA_2        => FSRDATA_2,
  FSRDATA_1        => FSRDATA_1,
  FSRDATA_0        => FSRDATA_0,
  FSCLK            => FSCLK,
  FSRESET_N        => FSRESET_N,
  FSACK            => FSACK,
  FSRETRY          => FSRETRY,
  FSERR            => FSERR,
  FSIRQ            => FSIRQ,
  FSWDATA_35       => FSWDATA_35,
  FSWDATA_34       => FSWDATA_34,
  FSWDATA_33       => FSWDATA_33,
  FSWDATA_32       => FSWDATA_32,
  FSWDATA_31       => FSWDATA_31,
  FSWDATA_30       => FSWDATA_30,
  FSWDATA_29       => FSWDATA_29,
  FSWDATA_28       => FSWDATA_28,
  FSWDATA_27       => FSWDATA_27,
  FSWDATA_26       => FSWDATA_26,
  FSWDATA_25       => FSWDATA_25,
  FSWDATA_24       => FSWDATA_24,
  FSWDATA_23       => FSWDATA_23,
  FSWDATA_22       => FSWDATA_22,
  FSWDATA_21       => FSWDATA_21,
  FSWDATA_20       => FSWDATA_20,
  FSWDATA_19       => FSWDATA_19,
  FSWDATA_18       => FSWDATA_18,
  FSWDATA_17       => FSWDATA_17,
  FSWDATA_16       => FSWDATA_16,
  FSWDATA_15       => FSWDATA_15,
  FSWDATA_14       => FSWDATA_14,
  FSWDATA_13       => FSWDATA_13,
  FSWDATA_12       => FSWDATA_12,
  FSWDATA_11       => FSWDATA_11,
  FSWDATA_10       => FSWDATA_10,
  FSWDATA_9        => FSWDATA_9,
  FSWDATA_8        => FSWDATA_8,
  FSWDATA_7        => FSWDATA_7,
  FSWDATA_6        => FSWDATA_6,
  FSWDATA_5        => FSWDATA_5,
  FSWDATA_4        => FSWDATA_4,
  FSWDATA_3        => FSWDATA_3,
  FSWDATA_2        => FSWDATA_2,
  FSWDATA_1        => FSWDATA_1,
  FSWDATA_0        => FSWDATA_0,
  FSADDR_17        => FSADDR_17,
  FSADDR_16        => FSADDR_16,
  FSADDR_15        => FSADDR_15,
  FSADDR_14        => FSADDR_14,
  FSADDR_13        => FSADDR_13,
  FSADDR_12        => FSADDR_12,
  FSADDR_11        => FSADDR_11,
  FSADDR_10        => FSADDR_10,
  FSADDR_9         => FSADDR_9,
  FSADDR_8         => FSADDR_8,
  FSADDR_7         => FSADDR_7,
  FSADDR_6         => FSADDR_6,
  FSADDR_5         => FSADDR_5,
  FSADDR_4         => FSADDR_4,
  FSADDR_3         => FSADDR_3,
  FSADDR_2         => FSADDR_2,
  FSADDR_1         => FSADDR_1,
  FSADDR_0         => FSADDR_0,
  FSSIZE_0         => FSSIZE_0,
  FSSIZE_1         => FSSIZE_1,
  FSRDY            => FSRDY,
  FSWRN            => FSWRN,
  HADDR_LASBM_17   => HADDR_LASBM_17,
  HADDR_LASBM_16   => HADDR_LASBM_16,
  HADDR_LASBM_15   => HADDR_LASBM_15,
  HADDR_LASBM_14   => HADDR_LASBM_14,
  HADDR_LASBM_13   => HADDR_LASBM_13,
  HADDR_LASBM_12   => HADDR_LASBM_12,
  HADDR_LASBM_11   => HADDR_LASBM_11,
  HADDR_LASBM_10   => HADDR_LASBM_10,
  HADDR_LASBM_9    => HADDR_LASBM_9,
  HADDR_LASBM_8    => HADDR_LASBM_8,
  HADDR_LASBM_7    => HADDR_LASBM_7,
  HADDR_LASBM_6    => HADDR_LASBM_6,
  HADDR_LASBM_5    => HADDR_LASBM_5,
  HADDR_LASBM_4    => HADDR_LASBM_4,
  HADDR_LASBM_3    => HADDR_LASBM_3,
  HADDR_LASBM_2    => HADDR_LASBM_2,
  HADDR_LASBM_1    => HADDR_LASBM_1,
  HADDR_LASBM_0    => HADDR_LASBM_0,
  HSIZE_LASBM_1    => HSIZE_LASBM_1,
  HSIZE_LASBM_0    => HSIZE_LASBM_0,
  HTRANS_LASBM_1   => HTRANS_LASBM_1,
  HTRANS_LASBM_0   => HTRANS_LASBM_0,
  HWDATA_LASBM_35  => HWDATA_LASBM_35,
  HWDATA_LASBM_34  => HWDATA_LASBM_34,
  HWDATA_LASBM_33  => HWDATA_LASBM_33,
  HWDATA_LASBM_32  => HWDATA_LASBM_32,
  HWDATA_LASBM_31  => HWDATA_LASBM_31,
  HWDATA_LASBM_30  => HWDATA_LASBM_30,
  HWDATA_LASBM_29  => HWDATA_LASBM_29,
  HWDATA_LASBM_28  => HWDATA_LASBM_28,
  HWDATA_LASBM_27  => HWDATA_LASBM_27,
  HWDATA_LASBM_26  => HWDATA_LASBM_26,
  HWDATA_LASBM_25  => HWDATA_LASBM_25,
  HWDATA_LASBM_24  => HWDATA_LASBM_24,
  HWDATA_LASBM_23  => HWDATA_LASBM_23,
  HWDATA_LASBM_22  => HWDATA_LASBM_22,
  HWDATA_LASBM_21  => HWDATA_LASBM_21,
  HWDATA_LASBM_20  => HWDATA_LASBM_20,
  HWDATA_LASBM_19  => HWDATA_LASBM_19,
  HWDATA_LASBM_18  => HWDATA_LASBM_18,
  HWDATA_LASBM_17  => HWDATA_LASBM_17,
  HWDATA_LASBM_16  => HWDATA_LASBM_16,
  HWDATA_LASBM_15  => HWDATA_LASBM_15,
  HWDATA_LASBM_14  => HWDATA_LASBM_14,
  HWDATA_LASBM_13  => HWDATA_LASBM_13,
  HWDATA_LASBM_12  => HWDATA_LASBM_12,
  HWDATA_LASBM_11  => HWDATA_LASBM_11,
  HWDATA_LASBM_10  => HWDATA_LASBM_10,
  HWDATA_LASBM_9   => HWDATA_LASBM_9,
  HWDATA_LASBM_8   => HWDATA_LASBM_8,
  HWDATA_LASBM_7   => HWDATA_LASBM_7,
  HWDATA_LASBM_6   => HWDATA_LASBM_6,
  HWDATA_LASBM_5   => HWDATA_LASBM_5,
  HWDATA_LASBM_4   => HWDATA_LASBM_4,
  HWDATA_LASBM_3   => HWDATA_LASBM_3,
  HWDATA_LASBM_2   => HWDATA_LASBM_2,
  HWDATA_LASBM_1   => HWDATA_LASBM_1,
  HWDATA_LASBM_0   => HWDATA_LASBM_0,
  HBURST_LASBM     => HBURST_LASBM,
  HWRITE_LASBM     => HWRITE_LASBM,
  LASB_CLK         => LASB_CLK,
  LASB_GSR         => LASB_GSR,
  LASB_IRQ_MASTER  => LASB_IRQ_MASTER,
  HRDATA_LASBM_35  => HRDATA_LASBM_35,
  HRDATA_LASBM_34  => HRDATA_LASBM_34,
  HRDATA_LASBM_33  => HRDATA_LASBM_33,
  HRDATA_LASBM_32  => HRDATA_LASBM_32,
  HRDATA_LASBM_31  => HRDATA_LASBM_31,
  HRDATA_LASBM_30  => HRDATA_LASBM_30,
  HRDATA_LASBM_29  => HRDATA_LASBM_29,
  HRDATA_LASBM_28  => HRDATA_LASBM_28,
  HRDATA_LASBM_27  => HRDATA_LASBM_27,
  HRDATA_LASBM_26  => HRDATA_LASBM_26,
  HRDATA_LASBM_25  => HRDATA_LASBM_25,
  HRDATA_LASBM_24  => HRDATA_LASBM_24,
  HRDATA_LASBM_23  => HRDATA_LASBM_23,
  HRDATA_LASBM_22  => HRDATA_LASBM_22,
  HRDATA_LASBM_21  => HRDATA_LASBM_21,
  HRDATA_LASBM_20  => HRDATA_LASBM_20,
  HRDATA_LASBM_19  => HRDATA_LASBM_19,
  HRDATA_LASBM_18  => HRDATA_LASBM_18,
  HRDATA_LASBM_17  => HRDATA_LASBM_17,
  HRDATA_LASBM_16  => HRDATA_LASBM_16,
  HRDATA_LASBM_15  => HRDATA_LASBM_15,
  HRDATA_LASBM_14  => HRDATA_LASBM_14,
  HRDATA_LASBM_13  => HRDATA_LASBM_13,
  HRDATA_LASBM_12  => HRDATA_LASBM_12,
  HRDATA_LASBM_11  => HRDATA_LASBM_11,
  HRDATA_LASBM_10  => HRDATA_LASBM_10,
  HRDATA_LASBM_9   => HRDATA_LASBM_9,
  HRDATA_LASBM_8   => HRDATA_LASBM_8,
  HRDATA_LASBM_7   => HRDATA_LASBM_7,
  HRDATA_LASBM_6   => HRDATA_LASBM_6,
  HRDATA_LASBM_5   => HRDATA_LASBM_5,
  HRDATA_LASBM_4   => HRDATA_LASBM_4,
  HRDATA_LASBM_3   => HRDATA_LASBM_3,
  HRDATA_LASBM_2   => HRDATA_LASBM_2,
  HRDATA_LASBM_1   => HRDATA_LASBM_1,
  HRDATA_LASBM_0   => HRDATA_LASBM_0,
  HRESP_LASBM_1    => HRESP_LASBM_1,
  HRESP_LASBM_0    => HRESP_LASBM_0,
  HCLK_LASB        => HCLK_LASB,
  HREADY_LASB      => HREADY_LASB,
  HRESET_N_LASB    => HRESET_N_LASB,
  LASB_DONE        => LASB_DONE,
  LASB_GSR_N       => LASB_GSR_N,
  LASB_IRQ_OUT     => LASB_IRQ_OUT,
  HADDR_RASBM_17   => HADDR_RASBM_17,
  HADDR_RASBM_16   => HADDR_RASBM_16,
  HADDR_RASBM_15   => HADDR_RASBM_15,
  HADDR_RASBM_14   => HADDR_RASBM_14,
  HADDR_RASBM_13   => HADDR_RASBM_13,
  HADDR_RASBM_12   => HADDR_RASBM_12,
  HADDR_RASBM_11   => HADDR_RASBM_11,
  HADDR_RASBM_10   => HADDR_RASBM_10,
  HADDR_RASBM_9    => HADDR_RASBM_9,
  HADDR_RASBM_8    => HADDR_RASBM_8,
  HADDR_RASBM_7    => HADDR_RASBM_7,
  HADDR_RASBM_6    => HADDR_RASBM_6,
  HADDR_RASBM_5    => HADDR_RASBM_5,
  HADDR_RASBM_4    => HADDR_RASBM_4,
  HADDR_RASBM_3    => HADDR_RASBM_3,
  HADDR_RASBM_2    => HADDR_RASBM_2,
  HADDR_RASBM_1    => HADDR_RASBM_1,
  HADDR_RASBM_0    => HADDR_RASBM_0,
  HSIZE_RASBM_1    => HSIZE_RASBM_1,
  HSIZE_RASBM_0    => HSIZE_RASBM_0,
  HTRANS_RASBM_1   => HTRANS_RASBM_1,
  HTRANS_RASBM_0   => HTRANS_RASBM_0,
  HWDATA_RASBM_35  => HWDATA_RASBM_35,
  HWDATA_RASBM_34  => HWDATA_RASBM_34,
  HWDATA_RASBM_33  => HWDATA_RASBM_33,
  HWDATA_RASBM_32  => HWDATA_RASBM_32,
  HWDATA_RASBM_31  => HWDATA_RASBM_31,
  HWDATA_RASBM_30  => HWDATA_RASBM_30,
  HWDATA_RASBM_29  => HWDATA_RASBM_29,
  HWDATA_RASBM_28  => HWDATA_RASBM_28,
  HWDATA_RASBM_27  => HWDATA_RASBM_27,
  HWDATA_RASBM_26  => HWDATA_RASBM_26,
  HWDATA_RASBM_25  => HWDATA_RASBM_25,
  HWDATA_RASBM_24  => HWDATA_RASBM_24,
  HWDATA_RASBM_23  => HWDATA_RASBM_23,
  HWDATA_RASBM_22  => HWDATA_RASBM_22,
  HWDATA_RASBM_21  => HWDATA_RASBM_21,
  HWDATA_RASBM_20  => HWDATA_RASBM_20,
  HWDATA_RASBM_19  => HWDATA_RASBM_19,
  HWDATA_RASBM_18  => HWDATA_RASBM_18,
  HWDATA_RASBM_17  => HWDATA_RASBM_17,
  HWDATA_RASBM_16  => HWDATA_RASBM_16,
  HWDATA_RASBM_15  => HWDATA_RASBM_15,
  HWDATA_RASBM_14  => HWDATA_RASBM_14,
  HWDATA_RASBM_13  => HWDATA_RASBM_13,
  HWDATA_RASBM_12  => HWDATA_RASBM_12,
  HWDATA_RASBM_11  => HWDATA_RASBM_11,
  HWDATA_RASBM_10  => HWDATA_RASBM_10,
  HWDATA_RASBM_9   => HWDATA_RASBM_9,
  HWDATA_RASBM_8   => HWDATA_RASBM_8,
  HWDATA_RASBM_7   => HWDATA_RASBM_7,
  HWDATA_RASBM_6   => HWDATA_RASBM_6,
  HWDATA_RASBM_5   => HWDATA_RASBM_5,
  HWDATA_RASBM_4   => HWDATA_RASBM_4,
  HWDATA_RASBM_3   => HWDATA_RASBM_3,
  HWDATA_RASBM_2   => HWDATA_RASBM_2,
  HWDATA_RASBM_1   => HWDATA_RASBM_1,
  HWDATA_RASBM_0   => HWDATA_RASBM_0,
  HBURST_RASBM     => HBURST_RASBM,
  HWRITE_RASBM     => HWRITE_RASBM,
  RASB_CLK         => RASB_CLK,
  RASB_GSR         => RASB_GSR,
  RASB_IRQ_MASTER  => RASB_IRQ_MASTER,
  HRDATA_RASBM_35  => HRDATA_RASBM_35,
  HRDATA_RASBM_34  => HRDATA_RASBM_34,
  HRDATA_RASBM_33  => HRDATA_RASBM_33,
  HRDATA_RASBM_32  => HRDATA_RASBM_32,
  HRDATA_RASBM_31  => HRDATA_RASBM_31,
  HRDATA_RASBM_30  => HRDATA_RASBM_30,
  HRDATA_RASBM_29  => HRDATA_RASBM_29,
  HRDATA_RASBM_28  => HRDATA_RASBM_28,
  HRDATA_RASBM_27  => HRDATA_RASBM_27,
  HRDATA_RASBM_26  => HRDATA_RASBM_26,
  HRDATA_RASBM_25  => HRDATA_RASBM_25,
  HRDATA_RASBM_24  => HRDATA_RASBM_24,
  HRDATA_RASBM_23  => HRDATA_RASBM_23,
  HRDATA_RASBM_22  => HRDATA_RASBM_22,
  HRDATA_RASBM_21  => HRDATA_RASBM_21,
  HRDATA_RASBM_20  => HRDATA_RASBM_20,
  HRDATA_RASBM_19  => HRDATA_RASBM_19,
  HRDATA_RASBM_18  => HRDATA_RASBM_18,
  HRDATA_RASBM_17  => HRDATA_RASBM_17,
  HRDATA_RASBM_16  => HRDATA_RASBM_16,
  HRDATA_RASBM_15  => HRDATA_RASBM_15,
  HRDATA_RASBM_14  => HRDATA_RASBM_14,
  HRDATA_RASBM_13  => HRDATA_RASBM_13,
  HRDATA_RASBM_12  => HRDATA_RASBM_12,
  HRDATA_RASBM_11  => HRDATA_RASBM_11,
  HRDATA_RASBM_10  => HRDATA_RASBM_10,
  HRDATA_RASBM_9   => HRDATA_RASBM_9,
  HRDATA_RASBM_8   => HRDATA_RASBM_8,
  HRDATA_RASBM_7   => HRDATA_RASBM_7,
  HRDATA_RASBM_6   => HRDATA_RASBM_6,
  HRDATA_RASBM_5   => HRDATA_RASBM_5,
  HRDATA_RASBM_4   => HRDATA_RASBM_4,
  HRDATA_RASBM_3   => HRDATA_RASBM_3,
  HRDATA_RASBM_2   => HRDATA_RASBM_2,
  HRDATA_RASBM_1   => HRDATA_RASBM_1,
  HRDATA_RASBM_0   => HRDATA_RASBM_0,
  HRESP_RASBM_1    => HRESP_RASBM_1,
  HRESP_RASBM_0    => HRESP_RASBM_0,
  HCLK_RASB        => HCLK_RASB,
  HREADY_RASB      => HREADY_RASB,
  HRESET_N_RASB    => HRESET_N_RASB,
  RASB_DONE        => RASB_DONE,
  RASB_GSR_N       => RASB_GSR_N,
  RASB_IRQ_OUT     => RASB_IRQ_OUT,
  EXT_CLK_P1_IN    => EXT_CLK_P1_IN,
  EXT_CLK_P2_IN    => EXT_CLK_P2_IN,
  EXT_DONE_IN      => EXT_DONE_IN,
  QUAD_AND_FP0_7   => QUAD_AND_FP0_7,
  QUAD_AND_FP0_6   => QUAD_AND_FP0_6,
  QUAD_AND_FP0_5   => QUAD_AND_FP0_5,
  QUAD_AND_FP0_4   => QUAD_AND_FP0_4,
  QUAD_AND_FP0_3   => QUAD_AND_FP0_3,
  QUAD_AND_FP0_2   => QUAD_AND_FP0_2,
  QUAD_AND_FP0_1   => QUAD_AND_FP0_1,
  QUAD_AND_FP0_0   => QUAD_AND_FP0_0,
  QUAD_AND_FP1_7   => QUAD_AND_FP1_7,
  QUAD_AND_FP1_6   => QUAD_AND_FP1_6,
  QUAD_AND_FP1_5   => QUAD_AND_FP1_5,
  QUAD_AND_FP1_4   => QUAD_AND_FP1_4,
  QUAD_AND_FP1_3   => QUAD_AND_FP1_3,
  QUAD_AND_FP1_2   => QUAD_AND_FP1_2,
  QUAD_AND_FP1_1   => QUAD_AND_FP1_1,
  QUAD_AND_FP1_0   => QUAD_AND_FP1_0,
  QUAD_CLK_7       => QUAD_CLK_7,
  QUAD_CLK_6       => QUAD_CLK_6,
  QUAD_CLK_5       => QUAD_CLK_5,
  QUAD_CLK_4       => QUAD_CLK_4,
  QUAD_CLK_3       => QUAD_CLK_3,
  QUAD_CLK_2       => QUAD_CLK_2,
  QUAD_CLK_1       => QUAD_CLK_1,
  QUAD_CLK_0       => QUAD_CLK_0,
  QUAD_DONE_7      => QUAD_DONE_7,
  QUAD_DONE_6      => QUAD_DONE_6,
  QUAD_DONE_5      => QUAD_DONE_5,
  QUAD_DONE_4      => QUAD_DONE_4,
  QUAD_DONE_3      => QUAD_DONE_3,
  QUAD_DONE_2      => QUAD_DONE_2,
  QUAD_DONE_1      => QUAD_DONE_1,
  QUAD_DONE_0      => QUAD_DONE_0,
  QUAD_OR_FP0_7    => QUAD_OR_FP0_7,
  QUAD_OR_FP0_6    => QUAD_OR_FP0_6,
  QUAD_OR_FP0_5    => QUAD_OR_FP0_5,
  QUAD_OR_FP0_4    => QUAD_OR_FP0_4,
  QUAD_OR_FP0_3    => QUAD_OR_FP0_3,
  QUAD_OR_FP0_2    => QUAD_OR_FP0_2,
  QUAD_OR_FP0_1    => QUAD_OR_FP0_1,
  QUAD_OR_FP0_0    => QUAD_OR_FP0_0,
  QUAD_OR_FP1_7    => QUAD_OR_FP1_7,
  QUAD_OR_FP1_6    => QUAD_OR_FP1_6,
  QUAD_OR_FP1_5    => QUAD_OR_FP1_5,
  QUAD_OR_FP1_4    => QUAD_OR_FP1_4,
  QUAD_OR_FP1_3    => QUAD_OR_FP1_3,
  QUAD_OR_FP1_2    => QUAD_OR_FP1_2,
  QUAD_OR_FP1_1    => QUAD_OR_FP1_1,
  QUAD_OR_FP1_0    => QUAD_OR_FP1_0,
  QUAD_RST_N_7     => QUAD_RST_N_7,
  QUAD_RST_N_6     => QUAD_RST_N_6,
  QUAD_RST_N_5     => QUAD_RST_N_5,
  QUAD_RST_N_4     => QUAD_RST_N_4,
  QUAD_RST_N_3     => QUAD_RST_N_3,
  QUAD_RST_N_2     => QUAD_RST_N_2,
  QUAD_RST_N_1     => QUAD_RST_N_1,
  QUAD_RST_N_0     => QUAD_RST_N_0,
  QUAD_START_7     => QUAD_START_7,
  QUAD_START_6     => QUAD_START_6,
  QUAD_START_5     => QUAD_START_5,
  QUAD_START_4     => QUAD_START_4,
  QUAD_START_3     => QUAD_START_3,
  QUAD_START_2     => QUAD_START_2,
  QUAD_START_1     => QUAD_START_1,
  QUAD_START_0     => QUAD_START_0,
  EXT_CLK_P1_OUT   => EXT_CLK_P1_OUT,
  EXT_CLK_P2_OUT   => EXT_CLK_P2_OUT,
  EXT_DONE_OUT     => EXT_DONE_OUT,
  GRP_CLK_P1_L_3     => GRP_CLK_P1_L_3,
  GRP_CLK_P1_L_2     => GRP_CLK_P1_L_2,
  GRP_CLK_P1_L_1     => GRP_CLK_P1_L_1,
  GRP_CLK_P1_L_0     => GRP_CLK_P1_L_0,
  GRP_CLK_P2_L_3     => GRP_CLK_P2_L_3,
  GRP_CLK_P2_L_2     => GRP_CLK_P2_L_2,
  GRP_CLK_P2_L_1     => GRP_CLK_P2_L_1,
  GRP_CLK_P2_L_0     => GRP_CLK_P2_L_0,
  GRP_DESKEW_ERROR_L_3   => GRP_DESKEW_ERROR_L_3,
  GRP_DESKEW_ERROR_L_2   => GRP_DESKEW_ERROR_L_2,
  GRP_DESKEW_ERROR_L_1   => GRP_DESKEW_ERROR_L_1,
  GRP_DESKEW_ERROR_L_0   => GRP_DESKEW_ERROR_L_0,
  GRP_DONE_L_3       => GRP_DONE_L_3,
  GRP_DONE_L_2       => GRP_DONE_L_2,
  GRP_DONE_L_1       => GRP_DONE_L_1,
  GRP_DONE_L_0       => GRP_DONE_L_0,
  GRP_START_L_3      => GRP_START_L_3,
  GRP_START_L_2      => GRP_START_L_2,
  GRP_START_L_1      => GRP_START_L_1,
  GRP_START_L_0      => GRP_START_L_0,
  GRP_CLK_P1_R_3     => GRP_CLK_P1_R_3,
  GRP_CLK_P1_R_2     => GRP_CLK_P1_R_2,
  GRP_CLK_P1_R_1     => GRP_CLK_P1_R_1,
  GRP_CLK_P1_R_0     => GRP_CLK_P1_R_0,
  GRP_CLK_P2_R_3     => GRP_CLK_P2_R_3,
  GRP_CLK_P2_R_2     => GRP_CLK_P2_R_2,
  GRP_CLK_P2_R_1     => GRP_CLK_P2_R_1,
  GRP_CLK_P2_R_0     => GRP_CLK_P2_R_0,
  GRP_DESKEW_ERROR_R_3   => GRP_DESKEW_ERROR_R_3,
  GRP_DESKEW_ERROR_R_2   => GRP_DESKEW_ERROR_R_2,
  GRP_DESKEW_ERROR_R_1   => GRP_DESKEW_ERROR_R_1,
  GRP_DESKEW_ERROR_R_0   => GRP_DESKEW_ERROR_R_0,
  GRP_DONE_R_3       => GRP_DONE_R_3,
  GRP_DONE_R_2       => GRP_DONE_R_2,
  GRP_DONE_R_1       => GRP_DONE_R_1,
  GRP_DONE_R_0       => GRP_DONE_R_0,
  GRP_START_R_3      => GRP_START_R_3,
  GRP_START_R_2      => GRP_START_R_2,
  GRP_START_R_1      => GRP_START_R_1,
  GRP_START_R_0      => GRP_START_R_0,
  LPCS_INT_3       => LPCS_INT_3,
  LPCS_INT_2       => LPCS_INT_2,
  LPCS_INT_1       => LPCS_INT_1,
  LPCS_INT_0       => LPCS_INT_0,
  LPCS_RDATA_Q0_7  => LPCS_RDATA_Q0_7,
  LPCS_RDATA_Q0_6  => LPCS_RDATA_Q0_6,
  LPCS_RDATA_Q0_5  => LPCS_RDATA_Q0_5,
  LPCS_RDATA_Q0_4  => LPCS_RDATA_Q0_4,
  LPCS_RDATA_Q0_3  => LPCS_RDATA_Q0_3,
  LPCS_RDATA_Q0_2  => LPCS_RDATA_Q0_2,
  LPCS_RDATA_Q0_1  => LPCS_RDATA_Q0_1,
  LPCS_RDATA_Q0_0  => LPCS_RDATA_Q0_0,
  LPCS_RDATA_Q1_7  => LPCS_RDATA_Q1_7,
  LPCS_RDATA_Q1_6  => LPCS_RDATA_Q1_6,
  LPCS_RDATA_Q1_5  => LPCS_RDATA_Q1_5,
  LPCS_RDATA_Q1_4  => LPCS_RDATA_Q1_4,
  LPCS_RDATA_Q1_3  => LPCS_RDATA_Q1_3,
  LPCS_RDATA_Q1_2  => LPCS_RDATA_Q1_2,
  LPCS_RDATA_Q1_1  => LPCS_RDATA_Q1_1,
  LPCS_RDATA_Q1_0  => LPCS_RDATA_Q1_0,
  LPCS_RDATA_Q2_7  => LPCS_RDATA_Q2_7,
  LPCS_RDATA_Q2_6  => LPCS_RDATA_Q2_6,
  LPCS_RDATA_Q2_5  => LPCS_RDATA_Q2_5,
  LPCS_RDATA_Q2_4  => LPCS_RDATA_Q2_4,
  LPCS_RDATA_Q2_3  => LPCS_RDATA_Q2_3,
  LPCS_RDATA_Q2_2  => LPCS_RDATA_Q2_2,
  LPCS_RDATA_Q2_1  => LPCS_RDATA_Q2_1,
  LPCS_RDATA_Q2_0  => LPCS_RDATA_Q2_0,
  LPCS_RDATA_Q3_7  => LPCS_RDATA_Q3_7,
  LPCS_RDATA_Q3_6  => LPCS_RDATA_Q3_6,
  LPCS_RDATA_Q3_5  => LPCS_RDATA_Q3_5,
  LPCS_RDATA_Q3_4  => LPCS_RDATA_Q3_4,
  LPCS_RDATA_Q3_3  => LPCS_RDATA_Q3_3,
  LPCS_RDATA_Q3_2  => LPCS_RDATA_Q3_2,
  LPCS_RDATA_Q3_1  => LPCS_RDATA_Q3_1,
  LPCS_RDATA_Q3_0  => LPCS_RDATA_Q3_0,
  LPCS_ADDR_7      => LPCS_ADDR_7,
  LPCS_ADDR_6      => LPCS_ADDR_6,
  LPCS_ADDR_5      => LPCS_ADDR_5,
  LPCS_ADDR_4      => LPCS_ADDR_4,
  LPCS_ADDR_3      => LPCS_ADDR_3,
  LPCS_ADDR_2      => LPCS_ADDR_2,
  LPCS_ADDR_1      => LPCS_ADDR_1,
  LPCS_ADDR_0      => LPCS_ADDR_0,
  LPCS_WDATA_7     => LPCS_WDATA_7,
  LPCS_WDATA_6     => LPCS_WDATA_6,
  LPCS_WDATA_5     => LPCS_WDATA_5,
  LPCS_WDATA_4     => LPCS_WDATA_4,
  LPCS_WDATA_3     => LPCS_WDATA_3,
  LPCS_WDATA_2     => LPCS_WDATA_2,
  LPCS_WDATA_1     => LPCS_WDATA_1,
  LPCS_WDATA_0     => LPCS_WDATA_0,
  LPCS_C_15        => LPCS_C_15,
  LPCS_C_14        => LPCS_C_14,
  LPCS_C_13        => LPCS_C_13,
  LPCS_C_12        => LPCS_C_12,
  LPCS_C_11        => LPCS_C_11,
  LPCS_C_10        => LPCS_C_10,
  LPCS_C_9         => LPCS_C_9,
  LPCS_C_8         => LPCS_C_8,
  LPCS_C_7         => LPCS_C_7,
  LPCS_C_6         => LPCS_C_6,
  LPCS_C_5         => LPCS_C_5,
  LPCS_C_4         => LPCS_C_4,
  LPCS_C_3         => LPCS_C_3,
  LPCS_C_2         => LPCS_C_2,
  LPCS_C_1         => LPCS_C_1,
  LPCS_C_0         => LPCS_C_0,
  LPCS_Q_3         => LPCS_Q_3,
  LPCS_Q_2         => LPCS_Q_2,
  LPCS_Q_1         => LPCS_Q_1,
  LPCS_Q_0         => LPCS_Q_0,
  LPCS_RD          => LPCS_RD,
  LPCS_WSTB        => LPCS_WSTB,
  LPCS_QUAD_ID0_1  => LPCS_QUAD_ID0_1,
  LPCS_QUAD_ID0_0  => LPCS_QUAD_ID0_0,
  LPCS_QUAD_ID1_1  => LPCS_QUAD_ID1_1,
  LPCS_QUAD_ID1_0  => LPCS_QUAD_ID1_0,
  LPCS_QUAD_ID2_1  => LPCS_QUAD_ID2_1,
  LPCS_QUAD_ID2_0  => LPCS_QUAD_ID2_0,
  LPCS_QUAD_ID3_1  => LPCS_QUAD_ID3_1,
  LPCS_QUAD_ID3_0  => LPCS_QUAD_ID3_0,
  RPCS_INT_3       => RPCS_INT_3,
  RPCS_INT_2       => RPCS_INT_2,
  RPCS_INT_1       => RPCS_INT_1,
  RPCS_INT_0       => RPCS_INT_0,
  RPCS_RDATA_Q0_7  => RPCS_RDATA_Q0_7,
  RPCS_RDATA_Q0_6  => RPCS_RDATA_Q0_6,
  RPCS_RDATA_Q0_5  => RPCS_RDATA_Q0_5,
  RPCS_RDATA_Q0_4  => RPCS_RDATA_Q0_4,
  RPCS_RDATA_Q0_3  => RPCS_RDATA_Q0_3,
  RPCS_RDATA_Q0_2  => RPCS_RDATA_Q0_2,
  RPCS_RDATA_Q0_1  => RPCS_RDATA_Q0_1,
  RPCS_RDATA_Q0_0  => RPCS_RDATA_Q0_0,
  RPCS_RDATA_Q1_7  => RPCS_RDATA_Q1_7,
  RPCS_RDATA_Q1_6  => RPCS_RDATA_Q1_6,
  RPCS_RDATA_Q1_5  => RPCS_RDATA_Q1_5,
  RPCS_RDATA_Q1_4  => RPCS_RDATA_Q1_4,
  RPCS_RDATA_Q1_3  => RPCS_RDATA_Q1_3,
  RPCS_RDATA_Q1_2  => RPCS_RDATA_Q1_2,
  RPCS_RDATA_Q1_1  => RPCS_RDATA_Q1_1,
  RPCS_RDATA_Q1_0  => RPCS_RDATA_Q1_0,
  RPCS_RDATA_Q2_7  => RPCS_RDATA_Q2_7,
  RPCS_RDATA_Q2_6  => RPCS_RDATA_Q2_6,
  RPCS_RDATA_Q2_5  => RPCS_RDATA_Q2_5,
  RPCS_RDATA_Q2_4  => RPCS_RDATA_Q2_4,
  RPCS_RDATA_Q2_3  => RPCS_RDATA_Q2_3,
  RPCS_RDATA_Q2_2  => RPCS_RDATA_Q2_2,
  RPCS_RDATA_Q2_1  => RPCS_RDATA_Q2_1,
  RPCS_RDATA_Q2_0  => RPCS_RDATA_Q2_0,
  RPCS_RDATA_Q3_7  => RPCS_RDATA_Q3_7,
  RPCS_RDATA_Q3_6  => RPCS_RDATA_Q3_6,
  RPCS_RDATA_Q3_5  => RPCS_RDATA_Q3_5,
  RPCS_RDATA_Q3_4  => RPCS_RDATA_Q3_4,
  RPCS_RDATA_Q3_3  => RPCS_RDATA_Q3_3,
  RPCS_RDATA_Q3_2  => RPCS_RDATA_Q3_2,
  RPCS_RDATA_Q3_1  => RPCS_RDATA_Q3_1,
  RPCS_RDATA_Q3_0  => RPCS_RDATA_Q3_0,
  RPCS_ADDR_7      => RPCS_ADDR_7,
  RPCS_ADDR_6      => RPCS_ADDR_6,
  RPCS_ADDR_5      => RPCS_ADDR_5,
  RPCS_ADDR_4      => RPCS_ADDR_4,
  RPCS_ADDR_3      => RPCS_ADDR_3,
  RPCS_ADDR_2      => RPCS_ADDR_2,
  RPCS_ADDR_1      => RPCS_ADDR_1,
  RPCS_ADDR_0      => RPCS_ADDR_0,
  RPCS_WDATA_7     => RPCS_WDATA_7,
  RPCS_WDATA_6     => RPCS_WDATA_6,
  RPCS_WDATA_5     => RPCS_WDATA_5,
  RPCS_WDATA_4     => RPCS_WDATA_4,
  RPCS_WDATA_3     => RPCS_WDATA_3,
  RPCS_WDATA_2     => RPCS_WDATA_2,
  RPCS_WDATA_1     => RPCS_WDATA_1,
  RPCS_WDATA_0     => RPCS_WDATA_0,
  RPCS_C_15        => RPCS_C_15,
  RPCS_C_14        => RPCS_C_14,
  RPCS_C_13        => RPCS_C_13,
  RPCS_C_12        => RPCS_C_12,
  RPCS_C_11        => RPCS_C_11,
  RPCS_C_10        => RPCS_C_10,
  RPCS_C_9         => RPCS_C_9,
  RPCS_C_8         => RPCS_C_8,
  RPCS_C_7         => RPCS_C_7,
  RPCS_C_6         => RPCS_C_6,
  RPCS_C_5         => RPCS_C_5,
  RPCS_C_4         => RPCS_C_4,
  RPCS_C_3         => RPCS_C_3,
  RPCS_C_2         => RPCS_C_2,
  RPCS_C_1         => RPCS_C_1,
  RPCS_C_0         => RPCS_C_0,
  RPCS_Q_3         => RPCS_Q_3,
  RPCS_Q_2         => RPCS_Q_2,
  RPCS_Q_1         => RPCS_Q_1,
  RPCS_Q_0         => RPCS_Q_0,
  RPCS_RD          => RPCS_RD,
  RPCS_WSTB        => RPCS_WSTB,
  RPCS_QUAD_ID0_1  => RPCS_QUAD_ID0_1,
  RPCS_QUAD_ID0_0  => RPCS_QUAD_ID0_0,
  RPCS_QUAD_ID1_1  => RPCS_QUAD_ID1_1,
  RPCS_QUAD_ID1_0  => RPCS_QUAD_ID1_0,
  RPCS_QUAD_ID2_1  => RPCS_QUAD_ID2_1,
  RPCS_QUAD_ID2_0  => RPCS_QUAD_ID2_0,
  RPCS_QUAD_ID3_1  => RPCS_QUAD_ID3_1,
  RPCS_QUAD_ID3_0  => RPCS_QUAD_ID3_0,
  DMA_RD_DATA_31   => DMA_RD_DATA_31,
  DMA_RD_DATA_30   => DMA_RD_DATA_30,
  DMA_RD_DATA_29   => DMA_RD_DATA_29,
  DMA_RD_DATA_28   => DMA_RD_DATA_28,
  DMA_RD_DATA_27   => DMA_RD_DATA_27,
  DMA_RD_DATA_26   => DMA_RD_DATA_26,
  DMA_RD_DATA_25   => DMA_RD_DATA_25,
  DMA_RD_DATA_24   => DMA_RD_DATA_24,
  DMA_RD_DATA_23   => DMA_RD_DATA_23,
  DMA_RD_DATA_22   => DMA_RD_DATA_22,
  DMA_RD_DATA_21   => DMA_RD_DATA_21,
  DMA_RD_DATA_20   => DMA_RD_DATA_20,
  DMA_RD_DATA_19   => DMA_RD_DATA_19,
  DMA_RD_DATA_18   => DMA_RD_DATA_18,
  DMA_RD_DATA_17   => DMA_RD_DATA_17,
  DMA_RD_DATA_16   => DMA_RD_DATA_16,
  DMA_RD_DATA_15   => DMA_RD_DATA_15,
  DMA_RD_DATA_14   => DMA_RD_DATA_14,
  DMA_RD_DATA_13   => DMA_RD_DATA_13,
  DMA_RD_DATA_12   => DMA_RD_DATA_12,
  DMA_RD_DATA_11   => DMA_RD_DATA_11,
  DMA_RD_DATA_10   => DMA_RD_DATA_10,
  DMA_RD_DATA_9    => DMA_RD_DATA_9,
  DMA_RD_DATA_8    => DMA_RD_DATA_8,
  DMA_RD_DATA_7    => DMA_RD_DATA_7,
  DMA_RD_DATA_6    => DMA_RD_DATA_6,
  DMA_RD_DATA_5    => DMA_RD_DATA_5,
  DMA_RD_DATA_4    => DMA_RD_DATA_4,
  DMA_RD_DATA_3    => DMA_RD_DATA_3,
  DMA_RD_DATA_2    => DMA_RD_DATA_2,
  DMA_RD_DATA_1    => DMA_RD_DATA_1,
  DMA_RD_DATA_0    => DMA_RD_DATA_0,
  DMA_RD_PARITY_3  => DMA_RD_PARITY_3,
  DMA_RD_PARITY_2  => DMA_RD_PARITY_2,
  DMA_RD_PARITY_1  => DMA_RD_PARITY_1,
  DMA_RD_PARITY_0  => DMA_RD_PARITY_0,
  DMA_RETRY        => DMA_RETRY,
  DMA_TA           => DMA_TA,
  DMA_TEA          => DMA_TEA,
  DMA_TRI_CTL      => DMA_TRI_CTL,
  DMA_TRI_DATA     => DMA_TRI_DATA);

end SYSBUSA_arch;


--synopsys translate_on

--synopsys translate_off

library SC;
use SC.components.all;

--synopsys translate_on

-- This interface file generated using SYSBUSA GUI:
#macro converter8(arg1,arg2)
#if #arg1 == "on" || #arg1 == "group_0" || #arg1 == "group_1" || #arg1 == "group_2" || #arg1 == "group_3"
#define arg2 1
#elif #arg1 == "off"
#define arg2 0
#endif
#endmacro

#converter8(_pcs_360, _enable_lpcs_0)
#converter8(_pcs_361, _enable_lpcs_1)
#converter8(_pcs_362, _enable_lpcs_2)
#converter8(_pcs_363, _enable_lpcs_3)
#converter8(_pcs_3e0, _enable_rpcs_0)
#converter8(_pcs_3e1, _enable_rpcs_1)
#converter8(_pcs_3e2, _enable_rpcs_2)
#converter8(_pcs_3e3, _enable_rpcs_3)

library IEEE, STD;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use STD.TEXTIO.all;

entity _circuit_name is
   GENERIC (USER_CONFIG_FILE    :  String := #_circuit_name_new);
 port (
#if _enable_mpi == 1
  mpi_cs0n, mpi_cs1, mpi_clk, mpi_wr_n, mpi_strb_n, mpi_burst, mpi_bdip, mpi_rst_n : in std_logic;
  mpi_tsiz   : in std_logic_vector (0 to 1);
  mpi_addr   : in std_logic_vector (14 to 31);
  mpi_ta, mpi_retry, mpi_tea, mpi_irq_n : out std_logic;
#if _bus_width == 8
  mpi_data   : inout std_logic_vector (0 to 7);
#if _parity_enable == 1
  mpi_par : inout std_logic_vector (0 to 0);
#endif
#endif
#if _bus_width == 16
  mpi_data   : inout std_logic_vector (0 to 15);
#if _parity_enable == 1
  mpi_par : inout std_logic_vector (0 to 1);
#endif
#endif
#if _bus_width == 32
  mpi_data   : inout std_logic_vector (0 to 31);
#if _parity_enable == 1
  mpi_par : inout std_logic_vector (0 to 3);
#endif
#endif
#endif
#if _sys_clock == "USER"
  usr_clk : in std_logic;
#endif
  usr_irq_in : in std_logic;
  usr_irq_out, sync_clk : out std_logic;
#if _enable_umi == 1
#if _enable_orcastra == 1
  tck, tdi, tms, rstn, umi_clk : in std_logic;
  tdo         : out std_logic;
#else
  umi_addr    : in std_logic_vector (17 downto 0);
  umi_wdata   : in std_logic_vector (35 downto 0);
  umi_size    : in std_logic_vector (1 downto 0);
  umi_clk, umi_rst_n, umi_wr_n, umi_burst, umi_rdy, umi_lock, umi_irq : in std_logic;
  umi_ack, umi_retry, umi_err : out std_logic;
  umi_rdata   : out std_logic_vector (35 downto 0);
#endif
#endif
#if _enable_usi == 1
  usi_rdata   : in std_logic_vector (35 downto 0);
  usi_clk, usi_rst_n, usi_ack, usi_retry, usi_err, usi_irq : in std_logic;
  usi_wdata   : out std_logic_vector (35 downto 0);
  usi_addr    : out std_logic_vector (17 downto 0);
  usi_size    : out std_logic_vector (1 downto 0);
  usi_rdy, usi_wr_n : out std_logic;
#endif
#if _enable_smi == 1
#if _enable_smi_port_0x410 == 1
  smi_rdata_0x410 : in std_logic;
#endif
#if _enable_smi_port_0x420 == 1
  smi_rdata_0x420 : in std_logic;
#endif
#if _enable_smi_port_0x430 == 1
  smi_rdata_0x430 : in std_logic;
#endif
#if _enable_smi_port_0x440 == 1
  smi_rdata_0x440 : in std_logic;
#endif
#if _enable_smi_port_0x450 == 1
  smi_rdata_0x450 : in std_logic;
#endif
#if _enable_smi_port_0x460 == 1
  smi_rdata_0x460 : in std_logic;
#endif
#if _enable_smi_port_0x470 == 1
  smi_rdata_0x470 : in std_logic;
#endif
#if _enable_smi_port_0x480 == 1
  smi_rdata_0x480 : in std_logic;
#endif
#if _enable_smi_port_0x490 == 1
  smi_rdata_0x490 : in std_logic;
#endif
#if _enable_smi_port_0x4a0 == 1
  smi_rdata_0x4a0 : in std_logic;
#endif
#if _enable_smi_port_0x4b0 == 1
  smi_rdata_0x4b0 : in std_logic;
#endif
#if _enable_smi_port_0x4c0 == 1
  smi_rdata_0x4c0 : in std_logic;
#endif
#if _enable_smi_port_0x4d0 == 1
  smi_rdata_0x4d0 : in std_logic;
#endif
#if _enable_smi_port_0x4e0 == 1
  smi_rdata_0x4e0 : in std_logic;
#endif
#if _enable_smi_port_0x4f0 == 1
  smi_rdata_0x4f0 : in std_logic;
#endif
#if _enable_smi_port_0x500 == 1
  smi_rdata_0x500 : in std_logic;
#endif
#if _enable_smi_port_0x510 == 1
  smi_rdata_0x510 : in std_logic;
#endif
#if _enable_smi_port_0x520 == 1
  smi_rdata_0x520 : in std_logic;
#endif
#if _enable_smi_port_0x530 == 1
  smi_rdata_0x530 : in std_logic;
#endif
#if _enable_smi_port_0x540 == 1
  smi_rdata_0x540 : in std_logic;
#endif
#if _enable_smi_port_0x550 == 1
  smi_rdata_0x550 : in std_logic;
#endif
#if _enable_smi_port_0x560 == 1
  smi_rdata_0x560 : in std_logic;
#endif
#if _enable_smi_port_0x570 == 1
  smi_rdata_0x570 : in std_logic;
#endif
#if _enable_smi_port_0x580 == 1
  smi_rdata_0x580 : in std_logic;
#endif
#if _enable_smi_port_0x590 == 1
  smi_rdata_0x590 : in std_logic;
#endif
#if _enable_smi_port_0x5a0 == 1
  smi_rdata_0x5a0 : in std_logic;
#endif
#if _enable_smi_port_0x5b0 == 1
  smi_rdata_0x5b0 : in std_logic;
#endif
#if _enable_smi_port_0x5c0 == 1
  smi_rdata_0x5c0 : in std_logic;
#endif
#if _enable_smi_port_0x5d0 == 1
  smi_rdata_0x5d0 : in std_logic;
#endif
#if _enable_smi_port_0x5e0 == 1
  smi_rdata_0x5e0 : in std_logic;
#endif
#if _enable_smi_port_0x5f0 == 1
  smi_rdata_0x5f0 : in std_logic;
#endif
#if _enable_smi_port_0x600 == 1
  smi_rdata_0x600 : in std_logic;
#endif
#if _enable_smi_port_0x610 == 1
  smi_rdata_0x610 : in std_logic;
#endif
#if _enable_smi_port_0x620 == 1
  smi_rdata_0x620 : in std_logic;
#endif
#if _enable_smi_port_0x630 == 1
  smi_rdata_0x630 : in std_logic;
#endif
#if _enable_smi_port_0x640 == 1
  smi_rdata_0x640 : in std_logic;
#endif
#if _enable_smi_port_0x650 == 1
  smi_rdata_0x650 : in std_logic;
#endif
#if _enable_smi_port_0x660 == 1
  smi_rdata_0x660 : in std_logic;
#endif
#if _enable_smi_port_0x670 == 1
  smi_rdata_0x670 : in std_logic;
#endif
#if _enable_smi_port_0x680 == 1
  smi_rdata_0x680 : in std_logic;
#endif
#if _enable_smi_port_0x690 == 1
  smi_rdata_0x690 : in std_logic;
#endif
#if _enable_smi_port_0x6a0 == 1
  smi_rdata_0x6a0 : in std_logic;
#endif
#if _enable_smi_port_0x6b0 == 1
  smi_rdata_0x6b0 : in std_logic;
#endif
#if _enable_smi_port_0x6c0 == 1
  smi_rdata_0x6c0 : in std_logic;
#endif
#if _enable_smi_port_0x6d0 == 1
  smi_rdata_0x6d0 : in std_logic;
#endif
#if _enable_smi_port_0x6e0 == 1
  smi_rdata_0x6e0 : in std_logic;
#endif
#if _enable_smi_port_0x6f0 == 1
  smi_rdata_0x6f0 : in std_logic;
#endif
#if _enable_smi_port_0x700 == 1
  smi_rdata_0x700 : in std_logic;
#endif
#if _enable_smi_port_0x710 == 1
  smi_rdata_0x710 : in std_logic;
#endif
#if _enable_smi_port_0x720 == 1
  smi_rdata_0x720 : in std_logic;
#endif
#if _enable_smi_port_0x730 == 1
  smi_rdata_0x730 : in std_logic;
#endif
#if _enable_smi_port_0x740 == 1
  smi_rdata_0x740 : in std_logic;
#endif
#if _enable_smi_port_0x750 == 1
  smi_rdata_0x750 : in std_logic;
#endif
#if _enable_smi_port_0x760 == 1
  smi_rdata_0x760 : in std_logic;
#endif
#if _enable_smi_port_0x770 == 1
  smi_rdata_0x770 : in std_logic;
#endif
#if _enable_smi_port_0x780 == 1
  smi_rdata_0x780 : in std_logic;
#endif
#if _enable_smi_port_0x790 == 1
  smi_rdata_0x790 : in std_logic;
#endif
#if _enable_smi_port_0x7a0 == 1
  smi_rdata_0x7a0 : in std_logic;
#endif
#if _enable_smi_port_0x7b0 == 1
  smi_rdata_0x7b0 : in std_logic;
#endif
#if _enable_smi_port_0x7c0 == 1
  smi_rdata_0x7c0 : in std_logic;
#endif
#if _enable_smi_port_0x7d0 == 1
  smi_rdata_0x7d0 : in std_logic;
#endif
#if _enable_smi_port_0x7e0 == 1
  smi_rdata_0x7e0 : in std_logic;
#endif
#if _enable_smi_port_0x7f0 == 1
  smi_rdata_0x7f0 : in std_logic;
#endif
  smi_addr  : out std_logic_vector (9 downto 0);
  smi_clk, smi_rd, smi_rst_n, smi_wdata, smi_wr : out std_logic; 
#endif
#if _enable_lpcs_0 == 1
  pcs360_in : in std_logic_vector (16 downto 0);
  pcs360_out   : out std_logic_vector (44 downto 0);
#endif
#if _enable_lpcs_1 == 1
  pcs361_in : in std_logic_vector (16 downto 0);
  pcs361_out   : out std_logic_vector (44 downto 0);
#endif
#if _enable_lpcs_2 == 1
  pcs362_in : in std_logic_vector (16 downto 0);
  pcs362_out   : out std_logic_vector (44 downto 0);
#endif
#if _enable_lpcs_3 == 1
  pcs363_in : in std_logic_vector (16 downto 0);
  pcs363_out   : out std_logic_vector (44 downto 0);
#endif
#if _enable_rpcs_0 == 1
  pcs3e0_in : in std_logic_vector (16 downto 0);
  pcs3e0_out   : out std_logic_vector (44 downto 0);
#endif
#if _enable_rpcs_1 == 1
  pcs3e1_in : in std_logic_vector (16 downto 0);
  pcs3e1_out   : out std_logic_vector (44 downto 0);
#endif
#if _enable_rpcs_2 == 1
  pcs3e2_in : in std_logic_vector (16 downto 0);
  pcs3e2_out   : out std_logic_vector (44 downto 0);
#endif
#if _enable_rpcs_3 == 1
  pcs3e3_in : in std_logic_vector (16 downto 0);
  pcs3e3_out   : out std_logic_vector (44 downto 0);
#endif
#if _dma_interface == 1
#if _enable_mpi == 1
#if _bus_width == 32
  dfa_rd_data    : in std_logic_vector (0 to 31);
  dfa_wr_data    : out std_logic_vector (0 to 31);
  dfa_rd_parity  : in std_logic_vector (0 to 3);
#elif _bus_width == 16
  dfa_rd_data    : in std_logic_vector (0 to 15);
  dfa_wr_data    : out std_logic_vector (0 to 15);
  dfa_rd_parity  : in std_logic_vector (0 to 1);
#elif _bus_width == 8
  dfa_rd_data    : in std_logic_vector (0 to 7);
  dfa_wr_data    : out std_logic_vector (0 to 7);
  dfa_rd_parity  : in std_logic;
#endif
  dfa_retry, dfa_ta, dfa_tea, dfa_tri_ctl, dfa_tri_data : in std_logic;
  dfa_addr : out std_logic_vector (14 to 31);
  dfa_cs1  : out std_logic;
  dfa_cs0n  : out std_logic;
  dfa_wr_n  : out std_logic;
  dfa_bdip  : out std_logic;
  dfa_burst  : out std_logic;
  dfa_strb_n  : out std_logic;
  dfa_tsiz  : out std_logic_vector (0 to 1);
#endif
#endif
#if _enable_multi_align == 1
  mca_clk_p1_in, mca_clk_p2_in, mca_done_in : in std_logic;
  mca_clk_p1_out, mca_clk_p2_out, mca_done_out : out std_logic;
#endif
  sysbus_rst_n : in std_logic);

end _circuit_name;

architecture _circuit_name##_arch of _circuit_name is

component VLO
port (
   Z : out std_logic);
end component;

#if _enable_mpi == 1
component IB
port(
        I:  IN std_logic;
        O:  OUT std_logic);
end component;

component OB
port(
        I:  IN std_logic;
        O:  OUT std_logic);
end component;

component BB
port(
        B:  INOUT std_logic;
        I:  IN std_logic;
        T:  IN std_logic;
        O:  OUT std_logic);
end component;

component OBZ
port(
        I:  IN std_logic;
        T:  IN std_logic;
        O:  OUT std_logic);
end component;
#endif
#if _enable_umi == 1
#if _enable_orcastra == 1
component JTAGA
PORT(
      tck            : IN    std_logic;
      tms            : IN    std_logic;
      tdi            : IN    std_logic;
      psrout1        : IN    std_logic;
      psrout2        : IN    std_logic;
      psrout3        : IN    std_logic;
      jtdo1          : IN    std_logic;
      jtdo2          : IN    std_logic;
      jtdo3          : IN    std_logic;
      jtdo4          : IN    std_logic;
      jtdo5          : IN    std_logic;
      jtdo6          : IN    std_logic;
      jtdo7          : IN    std_logic;
      jtdo8          : IN    std_logic;
      tdo                :      OUT  std_logic;
      treset             :      OUT  std_logic;
      psrsftn            :      OUT  std_logic;
      psrcap             :      OUT  std_logic;
      psrenable1         :      OUT  std_logic;
      psrenable2         :      OUT  std_logic;
      psrenable3         :      OUT  std_logic;
      scanenable1        :      OUT  std_logic;
      scanenable2        :      OUT  std_logic;
      scanenable3        :      OUT  std_logic;
      scanenable4        :      OUT  std_logic;
      scanenable5        :      OUT  std_logic;
      scanenable6        :      OUT  std_logic;
      scanenable7        :      OUT  std_logic;
      scanenable8        :      OUT  std_logic;
      scani              :      OUT  std_logic;
      jtck               :      OUT  std_logic;
      jtdi               :      OUT  std_logic;
      jshift             :      OUT  std_logic;
      jupdate            :      OUT  std_logic;
      jrstn              :      OUT  std_logic;
      jce1               :      OUT  std_logic;
      jce2               :      OUT  std_logic;
      jce3               :      OUT  std_logic;
      jce4               :      OUT  std_logic;
      jce5               :      OUT  std_logic;
      jce6               :      OUT  std_logic;
      jce7               :      OUT  std_logic;
      jce8               :      OUT  std_logic;
      jrti1              :      OUT  std_logic;
      jrti2              :      OUT  std_logic;
      jrti3              :      OUT  std_logic;
      jrti4              :      OUT  std_logic;
      jrti5              :      OUT  std_logic;
      jrti6              :      OUT  std_logic;
      jrti7              :      OUT  std_logic;
      jrti8              :      OUT  std_logic);
end component;
#endif
#endif
component SYSBUSA
--synopsys translate_off
GENERIC(
  SYSBUS_CONFIG_FILE : String;
  MPI_PARITY : String;
  MPI_BUS_WIDTH : Integer;
  SYS_CLK_SEL : String;
  MPI_PRIORITY : String;
  FPGA_PRIORITY : String;
  MPI_RST : String;
  MASTER_RST : String;
  PARITY : String;
  MPI_SYNCMODE : String;
  MASTER_SYNCMODE : String;
  MASTER_AUTORETRY : String;
  SLAVE_SYNCMODE : String;
  INTERRUPT_VECTOR1 : Integer;
  INTERRUPT_VECTOR2 : Integer;
  INTERRUPT_VECTOR3 : Integer;
  INTERRUPT_VECTOR4 : Integer;
  INTERRUPT_VECTOR5 : Integer;
  INTERRUPT_VECTOR6 : Integer
  );  
--synopsys translate_on
port (
  CS0_N            : in std_logic;
  CS1              : in std_logic;
  MPI_CLK          : in std_logic;
  MPI_WR_N         : in std_logic;
  MPI_STRB_N       : in std_logic;
  MPI_BURST        : in std_logic;
  MPI_BDIP         : in std_logic;
  MPI_RST_N        : in std_logic;
  USR_CLK          : in std_logic;
  USER_IRQ_IN      : in std_logic;
  SYS_RST_N        : in std_logic;
  MPI_TSIZ_1       : in std_logic;
  MPI_TSIZ_0       : in std_logic;
  MPI_ADDR_14      : in std_logic;
  MPI_ADDR_15      : in std_logic;
  MPI_ADDR_16      : in std_logic;
  MPI_ADDR_17      : in std_logic;
  MPI_ADDR_18      : in std_logic;
  MPI_ADDR_19      : in std_logic;
  MPI_ADDR_20      : in std_logic;
  MPI_ADDR_21      : in std_logic;
  MPI_ADDR_22      : in std_logic;
  MPI_ADDR_23      : in std_logic;
  MPI_ADDR_24      : in std_logic;
  MPI_ADDR_25      : in std_logic;
  MPI_ADDR_26      : in std_logic;
  MPI_ADDR_27      : in std_logic;
  MPI_ADDR_28      : in std_logic;
  MPI_ADDR_29      : in std_logic;
  MPI_ADDR_30      : in std_logic;
  MPI_ADDR_31      : in std_logic;
  MPI_WR_DATA_31   : in std_logic;
  MPI_WR_DATA_30   : in std_logic;
  MPI_WR_DATA_29   : in std_logic;
  MPI_WR_DATA_28   : in std_logic;
  MPI_WR_DATA_27   : in std_logic;
  MPI_WR_DATA_26   : in std_logic;
  MPI_WR_DATA_25   : in std_logic;
  MPI_WR_DATA_24   : in std_logic;
  MPI_WR_DATA_23   : in std_logic;
  MPI_WR_DATA_22   : in std_logic;
  MPI_WR_DATA_21   : in std_logic;
  MPI_WR_DATA_20   : in std_logic;
  MPI_WR_DATA_19   : in std_logic;
  MPI_WR_DATA_18   : in std_logic;
  MPI_WR_DATA_17   : in std_logic;
  MPI_WR_DATA_16   : in std_logic;
  MPI_WR_DATA_15   : in std_logic;
  MPI_WR_DATA_14   : in std_logic;
  MPI_WR_DATA_13   : in std_logic;
  MPI_WR_DATA_12   : in std_logic;
  MPI_WR_DATA_11   : in std_logic;
  MPI_WR_DATA_10   : in std_logic;
  MPI_WR_DATA_9    : in std_logic;
  MPI_WR_DATA_8    : in std_logic;
  MPI_WR_DATA_7    : in std_logic;
  MPI_WR_DATA_6    : in std_logic;
  MPI_WR_DATA_5    : in std_logic;
  MPI_WR_DATA_4    : in std_logic;
  MPI_WR_DATA_3    : in std_logic;
  MPI_WR_DATA_2    : in std_logic;
  MPI_WR_DATA_1    : in std_logic;
  MPI_WR_DATA_0    : in std_logic;
  MPI_WR_PARITY_3  : in std_logic;
  MPI_WR_PARITY_2  : in std_logic;
  MPI_WR_PARITY_1  : in std_logic;
  MPI_WR_PARITY_0  : in std_logic;
  MPI_TA           : out std_logic;
  MPI_RETRY        : out std_logic;
  MPI_TEA          : out std_logic;
  PD2_0_TS         : out std_logic;
  PD7_3_TS         : out std_logic;
  PD15_8_TS        : out std_logic;
  PD31_16_TS       : out std_logic;
  MPI_IRQ_N        : out std_logic;
  MPI_CNTL_TS      : out std_logic;
  USER_IRQ_OUT     : out std_logic;
  HCLK_CIB         : out std_logic;
  MPI_RD_DATA_31   : out std_logic;
  MPI_RD_DATA_30   : out std_logic;
  MPI_RD_DATA_29   : out std_logic;
  MPI_RD_DATA_28   : out std_logic;
  MPI_RD_DATA_27   : out std_logic;
  MPI_RD_DATA_26   : out std_logic;
  MPI_RD_DATA_25   : out std_logic;
  MPI_RD_DATA_24   : out std_logic;
  MPI_RD_DATA_23   : out std_logic;
  MPI_RD_DATA_22   : out std_logic;
  MPI_RD_DATA_21   : out std_logic;
  MPI_RD_DATA_20   : out std_logic;
  MPI_RD_DATA_19   : out std_logic;
  MPI_RD_DATA_18   : out std_logic;
  MPI_RD_DATA_17   : out std_logic;
  MPI_RD_DATA_16   : out std_logic;
  MPI_RD_DATA_15   : out std_logic;
  MPI_RD_DATA_14   : out std_logic;
  MPI_RD_DATA_13   : out std_logic;
  MPI_RD_DATA_12   : out std_logic;
  MPI_RD_DATA_11   : out std_logic;
  MPI_RD_DATA_10   : out std_logic;
  MPI_RD_DATA_9    : out std_logic;
  MPI_RD_DATA_8    : out std_logic;
  MPI_RD_DATA_7    : out std_logic;
  MPI_RD_DATA_6    : out std_logic;
  MPI_RD_DATA_5    : out std_logic;
  MPI_RD_DATA_4    : out std_logic;
  MPI_RD_DATA_3    : out std_logic;
  MPI_RD_DATA_2    : out std_logic;
  MPI_RD_DATA_1    : out std_logic;
  MPI_RD_DATA_0    : out std_logic;
  MPI_RD_PARITY_3  : out std_logic;
  MPI_RD_PARITY_2  : out std_logic;
  MPI_RD_PARITY_1  : out std_logic;
  MPI_RD_PARITY_0  : out std_logic;
  MPI_DP_TS_0      : out std_logic;
  MPI_DP_TS_1      : out std_logic;
  MPI_DP_TS_2      : out std_logic;
  SMI_RDATA_63     : in  std_logic;
  SMI_RDATA_62     : in  std_logic;
  SMI_RDATA_61     : in  std_logic;
  SMI_RDATA_60     : in  std_logic;
  SMI_RDATA_59     : in  std_logic;
  SMI_RDATA_58     : in  std_logic;
  SMI_RDATA_57     : in  std_logic;
  SMI_RDATA_56     : in  std_logic;
  SMI_RDATA_55     : in  std_logic;
  SMI_RDATA_54     : in  std_logic;
  SMI_RDATA_53     : in  std_logic;
  SMI_RDATA_52     : in  std_logic;
  SMI_RDATA_51     : in  std_logic;
  SMI_RDATA_50     : in  std_logic;
  SMI_RDATA_49     : in  std_logic;
  SMI_RDATA_48     : in  std_logic;
  SMI_RDATA_47     : in  std_logic;
  SMI_RDATA_46     : in  std_logic;
  SMI_RDATA_45     : in  std_logic;
  SMI_RDATA_44     : in  std_logic;
  SMI_RDATA_43     : in  std_logic;
  SMI_RDATA_42     : in  std_logic;
  SMI_RDATA_41     : in  std_logic;
  SMI_RDATA_40     : in  std_logic;
  SMI_RDATA_39     : in  std_logic;
  SMI_RDATA_38     : in  std_logic;
  SMI_RDATA_37     : in  std_logic;
  SMI_RDATA_36     : in  std_logic;
  SMI_RDATA_35     : in  std_logic;
  SMI_RDATA_34     : in  std_logic;
  SMI_RDATA_33     : in  std_logic;
  SMI_RDATA_32     : in  std_logic;
  SMI_RDATA_31     : in  std_logic;
  SMI_RDATA_30     : in  std_logic;
  SMI_RDATA_29     : in  std_logic;
  SMI_RDATA_28     : in  std_logic;
  SMI_RDATA_27     : in  std_logic;
  SMI_RDATA_26     : in  std_logic;
  SMI_RDATA_25     : in  std_logic;
  SMI_RDATA_24     : in  std_logic;
  SMI_RDATA_23     : in  std_logic;
  SMI_RDATA_22     : in  std_logic;
  SMI_RDATA_21     : in  std_logic;
  SMI_RDATA_20     : in  std_logic;
  SMI_RDATA_19     : in  std_logic;
  SMI_RDATA_18     : in  std_logic;
  SMI_RDATA_17     : in  std_logic;
  SMI_RDATA_16     : in  std_logic;
  SMI_RDATA_15     : in  std_logic;
  SMI_RDATA_14     : in  std_logic;
  SMI_RDATA_13     : in  std_logic;
  SMI_RDATA_12     : in  std_logic;
  SMI_RDATA_11     : in  std_logic;
  SMI_RDATA_10     : in  std_logic;
  SMI_RDATA_9      : in  std_logic;
  SMI_RDATA_8      : in  std_logic;
  SMI_RDATA_7      : in  std_logic;
  SMI_RDATA_6      : in  std_logic;
  SMI_RDATA_5      : in  std_logic;
  SMI_RDATA_4      : in  std_logic;
  SMI_RDATA_3      : in  std_logic;
  SMI_RDATA_2      : in  std_logic;
  SMI_RDATA_1      : in  std_logic;
  SMI_RDATA_0      : in  std_logic;
  SMI_ADDR_9       : out std_logic;
  SMI_ADDR_8       : out std_logic;
  SMI_ADDR_7       : out std_logic;
  SMI_ADDR_6       : out std_logic;
  SMI_ADDR_5       : out std_logic;
  SMI_ADDR_4       : out std_logic;
  SMI_ADDR_3       : out std_logic;
  SMI_ADDR_2       : out std_logic;
  SMI_ADDR_1       : out std_logic;
  SMI_ADDR_0       : out std_logic;
  SMI_CLK          : out std_logic;
  SMI_RD           : out std_logic;
  SMI_RST_N        : out std_logic;
  SMI_WDATA        : out std_logic;
  SMI_WR           : out std_logic;
  FMADDR_17        : in  std_logic;
  FMADDR_16        : in  std_logic;
  FMADDR_15        : in  std_logic;
  FMADDR_14        : in  std_logic;
  FMADDR_13        : in  std_logic;
  FMADDR_12        : in  std_logic;
  FMADDR_11        : in  std_logic;
  FMADDR_10        : in  std_logic;
  FMADDR_9         : in  std_logic;
  FMADDR_8         : in  std_logic;
  FMADDR_7         : in  std_logic;
  FMADDR_6         : in  std_logic;
  FMADDR_5         : in  std_logic;
  FMADDR_4         : in  std_logic;
  FMADDR_3         : in  std_logic;
  FMADDR_2         : in  std_logic;
  FMADDR_1         : in  std_logic;
  FMADDR_0         : in  std_logic;
  FMWDATA_35       : in  std_logic;
  FMWDATA_34       : in  std_logic;
  FMWDATA_33       : in  std_logic;
  FMWDATA_32       : in  std_logic;
  FMWDATA_31       : in  std_logic;
  FMWDATA_30       : in  std_logic;
  FMWDATA_29       : in  std_logic;
  FMWDATA_28       : in  std_logic;
  FMWDATA_27       : in  std_logic;
  FMWDATA_26       : in  std_logic;
  FMWDATA_25       : in  std_logic;
  FMWDATA_24       : in  std_logic;
  FMWDATA_23       : in  std_logic;
  FMWDATA_22       : in  std_logic;
  FMWDATA_21       : in  std_logic;
  FMWDATA_20       : in  std_logic;
  FMWDATA_19       : in  std_logic;
  FMWDATA_18       : in  std_logic;
  FMWDATA_17       : in  std_logic;
  FMWDATA_16       : in  std_logic;
  FMWDATA_15       : in  std_logic;
  FMWDATA_14       : in  std_logic;
  FMWDATA_13       : in  std_logic;
  FMWDATA_12       : in  std_logic;
  FMWDATA_11       : in  std_logic;
  FMWDATA_10       : in  std_logic;
  FMWDATA_9        : in  std_logic;
  FMWDATA_8        : in  std_logic;
  FMWDATA_7        : in  std_logic;
  FMWDATA_6        : in  std_logic;
  FMWDATA_5        : in  std_logic;
  FMWDATA_4        : in  std_logic;
  FMWDATA_3        : in  std_logic;
  FMWDATA_2        : in  std_logic;
  FMWDATA_1        : in  std_logic;
  FMWDATA_0        : in  std_logic;
  FMSIZE_0         : in  std_logic;
  FMSIZE_1         : in  std_logic;
  FMCLK            : in  std_logic;
  FMRESET_N        : in  std_logic;
  FMWRN            : in  std_logic;
  FMBURST          : in  std_logic;
  FMRDY            : in  std_logic;
  FMLOCK           : in  std_logic;
  FMIRQ            : in  std_logic;
  FMRDATA_35       : out std_logic;
  FMRDATA_34       : out std_logic;
  FMRDATA_33       : out std_logic;
  FMRDATA_32       : out std_logic;
  FMRDATA_31       : out std_logic;
  FMRDATA_30       : out std_logic;
  FMRDATA_29       : out std_logic;
  FMRDATA_28       : out std_logic;
  FMRDATA_27       : out std_logic;
  FMRDATA_26       : out std_logic;
  FMRDATA_25       : out std_logic;
  FMRDATA_24       : out std_logic;
  FMRDATA_23       : out std_logic;
  FMRDATA_22       : out std_logic;
  FMRDATA_21       : out std_logic;
  FMRDATA_20       : out std_logic;
  FMRDATA_19       : out std_logic;
  FMRDATA_18       : out std_logic;
  FMRDATA_17       : out std_logic;
  FMRDATA_16       : out std_logic;
  FMRDATA_15       : out std_logic;
  FMRDATA_14       : out std_logic;
  FMRDATA_13       : out std_logic;
  FMRDATA_12       : out std_logic;
  FMRDATA_11       : out std_logic;
  FMRDATA_10       : out std_logic;
  FMRDATA_9        : out std_logic;
  FMRDATA_8        : out std_logic;
  FMRDATA_7        : out std_logic;
  FMRDATA_6        : out std_logic;
  FMRDATA_5        : out std_logic;
  FMRDATA_4        : out std_logic;
  FMRDATA_3        : out std_logic;
  FMRDATA_2        : out std_logic;
  FMRDATA_1        : out std_logic;
  FMRDATA_0        : out std_logic;
  FMACK            : out std_logic;
  FMRETRY          : out std_logic;
  FMERR            : out std_logic;
  FSRDATA_35       : in  std_logic;
  FSRDATA_34       : in  std_logic;
  FSRDATA_33       : in  std_logic;
  FSRDATA_32       : in  std_logic;
  FSRDATA_31       : in  std_logic;
  FSRDATA_30       : in  std_logic;
  FSRDATA_29       : in  std_logic;
  FSRDATA_28       : in  std_logic;
  FSRDATA_27       : in  std_logic;
  FSRDATA_26       : in  std_logic;
  FSRDATA_25       : in  std_logic;
  FSRDATA_24       : in  std_logic;
  FSRDATA_23       : in  std_logic;
  FSRDATA_22       : in  std_logic;
  FSRDATA_21       : in  std_logic;
  FSRDATA_20       : in  std_logic;
  FSRDATA_19       : in  std_logic;
  FSRDATA_18       : in  std_logic;
  FSRDATA_17       : in  std_logic;
  FSRDATA_16       : in  std_logic;
  FSRDATA_15       : in  std_logic;
  FSRDATA_14       : in  std_logic;
  FSRDATA_13       : in  std_logic;
  FSRDATA_12       : in  std_logic;
  FSRDATA_11       : in  std_logic;
  FSRDATA_10       : in  std_logic;
  FSRDATA_9        : in  std_logic;
  FSRDATA_8        : in  std_logic;
  FSRDATA_7        : in  std_logic;
  FSRDATA_6        : in  std_logic;
  FSRDATA_5        : in  std_logic;
  FSRDATA_4        : in  std_logic;
  FSRDATA_3        : in  std_logic;
  FSRDATA_2        : in  std_logic;
  FSRDATA_1        : in  std_logic;
  FSRDATA_0        : in  std_logic;
  FSCLK            : in  std_logic;
  FSRESET_N        : in  std_logic;
  FSACK            : in  std_logic;
  FSRETRY          : in  std_logic;
  FSERR            : in  std_logic;
  FSIRQ            : in  std_logic;
  FSWDATA_35       : out std_logic;
  FSWDATA_34       : out std_logic;
  FSWDATA_33       : out std_logic;
  FSWDATA_32       : out std_logic;
  FSWDATA_31       : out std_logic;
  FSWDATA_30       : out std_logic;
  FSWDATA_29       : out std_logic;
  FSWDATA_28       : out std_logic;
  FSWDATA_27       : out std_logic;
  FSWDATA_26       : out std_logic;
  FSWDATA_25       : out std_logic;
  FSWDATA_24       : out std_logic;
  FSWDATA_23       : out std_logic;
  FSWDATA_22       : out std_logic;
  FSWDATA_21       : out std_logic;
  FSWDATA_20       : out std_logic;
  FSWDATA_19       : out std_logic;
  FSWDATA_18       : out std_logic;
  FSWDATA_17       : out std_logic;
  FSWDATA_16       : out std_logic;
  FSWDATA_15       : out std_logic;
  FSWDATA_14       : out std_logic;
  FSWDATA_13       : out std_logic;
  FSWDATA_12       : out std_logic;
  FSWDATA_11       : out std_logic;
  FSWDATA_10       : out std_logic;
  FSWDATA_9        : out std_logic;
  FSWDATA_8        : out std_logic;
  FSWDATA_7        : out std_logic;
  FSWDATA_6        : out std_logic;
  FSWDATA_5        : out std_logic;
  FSWDATA_4        : out std_logic;
  FSWDATA_3        : out std_logic;
  FSWDATA_2        : out std_logic;
  FSWDATA_1        : out std_logic;
  FSWDATA_0        : out std_logic;
  FSADDR_17        : out std_logic;
  FSADDR_16        : out std_logic;
  FSADDR_15        : out std_logic;
  FSADDR_14        : out std_logic;
  FSADDR_13        : out std_logic;
  FSADDR_12        : out std_logic;
  FSADDR_11        : out std_logic;
  FSADDR_10        : out std_logic;
  FSADDR_9         : out std_logic;
  FSADDR_8         : out std_logic;
  FSADDR_7         : out std_logic;
  FSADDR_6         : out std_logic;
  FSADDR_5         : out std_logic;
  FSADDR_4         : out std_logic;
  FSADDR_3         : out std_logic;
  FSADDR_2         : out std_logic;
  FSADDR_1         : out std_logic;
  FSADDR_0         : out std_logic;
  FSSIZE_0         : out std_logic;
  FSSIZE_1         : out std_logic;
  FSRDY            : out std_logic;
  FSWRN            : out std_logic;
  HADDR_LASBM_17   : in  std_logic;
  HADDR_LASBM_16   : in  std_logic;
  HADDR_LASBM_15   : in  std_logic;
  HADDR_LASBM_14   : in  std_logic;
  HADDR_LASBM_13   : in  std_logic;
  HADDR_LASBM_12   : in  std_logic;
  HADDR_LASBM_11   : in  std_logic;
  HADDR_LASBM_10   : in  std_logic;
  HADDR_LASBM_9    : in  std_logic;
  HADDR_LASBM_8    : in  std_logic;
  HADDR_LASBM_7    : in  std_logic;
  HADDR_LASBM_6    : in  std_logic;
  HADDR_LASBM_5    : in  std_logic;
  HADDR_LASBM_4    : in  std_logic;
  HADDR_LASBM_3    : in  std_logic;
  HADDR_LASBM_2    : in  std_logic;
  HADDR_LASBM_1    : in  std_logic;
  HADDR_LASBM_0    : in  std_logic;
  HSIZE_LASBM_1    : in  std_logic;
  HSIZE_LASBM_0    : in  std_logic;
  HTRANS_LASBM_1   : in  std_logic; 
  HTRANS_LASBM_0   : in  std_logic; 
  HWDATA_LASBM_35  : in  std_logic;
  HWDATA_LASBM_34  : in  std_logic;
  HWDATA_LASBM_33  : in  std_logic;
  HWDATA_LASBM_32  : in  std_logic;
  HWDATA_LASBM_31  : in  std_logic;
  HWDATA_LASBM_30  : in  std_logic;
  HWDATA_LASBM_29  : in  std_logic;
  HWDATA_LASBM_28  : in  std_logic;
  HWDATA_LASBM_27  : in  std_logic;
  HWDATA_LASBM_26  : in  std_logic;
  HWDATA_LASBM_25  : in  std_logic;
  HWDATA_LASBM_24  : in  std_logic;
  HWDATA_LASBM_23  : in  std_logic;
  HWDATA_LASBM_22  : in  std_logic;
  HWDATA_LASBM_21  : in  std_logic;
  HWDATA_LASBM_20  : in  std_logic;
  HWDATA_LASBM_19  : in  std_logic;
  HWDATA_LASBM_18  : in  std_logic;
  HWDATA_LASBM_17  : in  std_logic;
  HWDATA_LASBM_16  : in  std_logic;
  HWDATA_LASBM_15  : in  std_logic;
  HWDATA_LASBM_14  : in  std_logic;
  HWDATA_LASBM_13  : in  std_logic;
  HWDATA_LASBM_12  : in  std_logic;
  HWDATA_LASBM_11  : in  std_logic;
  HWDATA_LASBM_10  : in  std_logic;
  HWDATA_LASBM_9   : in  std_logic;
  HWDATA_LASBM_8   : in  std_logic;
  HWDATA_LASBM_7   : in  std_logic;
  HWDATA_LASBM_6   : in  std_logic;
  HWDATA_LASBM_5   : in  std_logic;
  HWDATA_LASBM_4   : in  std_logic;
  HWDATA_LASBM_3   : in  std_logic;
  HWDATA_LASBM_2   : in  std_logic;
  HWDATA_LASBM_1   : in  std_logic;
  HWDATA_LASBM_0   : in  std_logic;
  HBURST_LASBM     : in  std_logic;
  HWRITE_LASBM     : in  std_logic;
  LASB_CLK         : in  std_logic;
  LASB_GSR         : in  std_logic;
  LASB_IRQ_MASTER  : in  std_logic;
  HRDATA_LASBM_35  : out std_logic;
  HRDATA_LASBM_34  : out std_logic;
  HRDATA_LASBM_33  : out std_logic;
  HRDATA_LASBM_32  : out std_logic;
  HRDATA_LASBM_31  : out std_logic;
  HRDATA_LASBM_30  : out std_logic;
  HRDATA_LASBM_29  : out std_logic;
  HRDATA_LASBM_28  : out std_logic;
  HRDATA_LASBM_27  : out std_logic;
  HRDATA_LASBM_26  : out std_logic;
  HRDATA_LASBM_25  : out std_logic;
  HRDATA_LASBM_24  : out std_logic;
  HRDATA_LASBM_23  : out std_logic;
  HRDATA_LASBM_22  : out std_logic;
  HRDATA_LASBM_21  : out std_logic;
  HRDATA_LASBM_20  : out std_logic;
  HRDATA_LASBM_19  : out std_logic;
  HRDATA_LASBM_18  : out std_logic;
  HRDATA_LASBM_17  : out std_logic;
  HRDATA_LASBM_16  : out std_logic;
  HRDATA_LASBM_15  : out std_logic;
  HRDATA_LASBM_14  : out std_logic;
  HRDATA_LASBM_13  : out std_logic;
  HRDATA_LASBM_12  : out std_logic;
  HRDATA_LASBM_11  : out std_logic;
  HRDATA_LASBM_10  : out std_logic;
  HRDATA_LASBM_9   : out std_logic;
  HRDATA_LASBM_8   : out std_logic;
  HRDATA_LASBM_7   : out std_logic;
  HRDATA_LASBM_6   : out std_logic;
  HRDATA_LASBM_5   : out std_logic;
  HRDATA_LASBM_4   : out std_logic;
  HRDATA_LASBM_3   : out std_logic;
  HRDATA_LASBM_2   : out std_logic;
  HRDATA_LASBM_1   : out std_logic;
  HRDATA_LASBM_0   : out std_logic;
  HRESP_LASBM_1    : out std_logic;
  HRESP_LASBM_0    : out std_logic;
  HCLK_LASB        : out std_logic;
  HREADY_LASB      : out std_logic;
  HRESET_N_LASB    : out std_logic;
  LASB_DONE        : out std_logic;
  LASB_GSR_N       : out std_logic;
  LASB_IRQ_OUT     : out std_logic;
  HADDR_RASBM_17   : in  std_logic;
  HADDR_RASBM_16   : in  std_logic;
  HADDR_RASBM_15   : in  std_logic;
  HADDR_RASBM_14   : in  std_logic;
  HADDR_RASBM_13   : in  std_logic;
  HADDR_RASBM_12   : in  std_logic;
  HADDR_RASBM_11   : in  std_logic;
  HADDR_RASBM_10   : in  std_logic;
  HADDR_RASBM_9    : in  std_logic;
  HADDR_RASBM_8    : in  std_logic;
  HADDR_RASBM_7    : in  std_logic;
  HADDR_RASBM_6    : in  std_logic;
  HADDR_RASBM_5    : in  std_logic;
  HADDR_RASBM_4    : in  std_logic;
  HADDR_RASBM_3    : in  std_logic;
  HADDR_RASBM_2    : in  std_logic;
  HADDR_RASBM_1    : in  std_logic;
  HADDR_RASBM_0    : in  std_logic;
  HSIZE_RASBM_1    : in  std_logic;
  HSIZE_RASBM_0    : in  std_logic;
  HTRANS_RASBM_1   : in  std_logic; 
  HTRANS_RASBM_0   : in  std_logic; 
  HWDATA_RASBM_35  : in  std_logic;
  HWDATA_RASBM_34  : in  std_logic;
  HWDATA_RASBM_33  : in  std_logic;
  HWDATA_RASBM_32  : in  std_logic;
  HWDATA_RASBM_31  : in  std_logic;
  HWDATA_RASBM_30  : in  std_logic;
  HWDATA_RASBM_29  : in  std_logic;
  HWDATA_RASBM_28  : in  std_logic;
  HWDATA_RASBM_27  : in  std_logic;
  HWDATA_RASBM_26  : in  std_logic;
  HWDATA_RASBM_25  : in  std_logic;
  HWDATA_RASBM_24  : in  std_logic;
  HWDATA_RASBM_23  : in  std_logic;
  HWDATA_RASBM_22  : in  std_logic;
  HWDATA_RASBM_21  : in  std_logic;
  HWDATA_RASBM_20  : in  std_logic;
  HWDATA_RASBM_19  : in  std_logic;
  HWDATA_RASBM_18  : in  std_logic;
  HWDATA_RASBM_17  : in  std_logic;
  HWDATA_RASBM_16  : in  std_logic;
  HWDATA_RASBM_15  : in  std_logic;
  HWDATA_RASBM_14  : in  std_logic;
  HWDATA_RASBM_13  : in  std_logic;
  HWDATA_RASBM_12  : in  std_logic;
  HWDATA_RASBM_11  : in  std_logic;
  HWDATA_RASBM_10  : in  std_logic;
  HWDATA_RASBM_9   : in  std_logic;
  HWDATA_RASBM_8   : in  std_logic;
  HWDATA_RASBM_7   : in  std_logic;
  HWDATA_RASBM_6   : in  std_logic;
  HWDATA_RASBM_5   : in  std_logic;
  HWDATA_RASBM_4   : in  std_logic;
  HWDATA_RASBM_3   : in  std_logic;
  HWDATA_RASBM_2   : in  std_logic;
  HWDATA_RASBM_1   : in  std_logic;
  HWDATA_RASBM_0   : in  std_logic;
  HBURST_RASBM     : in  std_logic;
  HWRITE_RASBM     : in  std_logic;
  RASB_CLK         : in  std_logic;
  RASB_GSR         : in  std_logic;
  RASB_IRQ_MASTER  : in  std_logic;
  HRDATA_RASBM_35  : out std_logic;
  HRDATA_RASBM_34  : out std_logic;
  HRDATA_RASBM_33  : out std_logic;
  HRDATA_RASBM_32  : out std_logic;
  HRDATA_RASBM_31  : out std_logic;
  HRDATA_RASBM_30  : out std_logic;
  HRDATA_RASBM_29  : out std_logic;
  HRDATA_RASBM_28  : out std_logic;
  HRDATA_RASBM_27  : out std_logic;
  HRDATA_RASBM_26  : out std_logic;
  HRDATA_RASBM_25  : out std_logic;
  HRDATA_RASBM_24  : out std_logic;
  HRDATA_RASBM_23  : out std_logic;
  HRDATA_RASBM_22  : out std_logic;
  HRDATA_RASBM_21  : out std_logic;
  HRDATA_RASBM_20  : out std_logic;
  HRDATA_RASBM_19  : out std_logic;
  HRDATA_RASBM_18  : out std_logic;
  HRDATA_RASBM_17  : out std_logic;
  HRDATA_RASBM_16  : out std_logic;
  HRDATA_RASBM_15  : out std_logic;
  HRDATA_RASBM_14  : out std_logic;
  HRDATA_RASBM_13  : out std_logic;
  HRDATA_RASBM_12  : out std_logic;
  HRDATA_RASBM_11  : out std_logic;
  HRDATA_RASBM_10  : out std_logic;
  HRDATA_RASBM_9   : out std_logic;
  HRDATA_RASBM_8   : out std_logic;
  HRDATA_RASBM_7   : out std_logic;
  HRDATA_RASBM_6   : out std_logic;
  HRDATA_RASBM_5   : out std_logic;
  HRDATA_RASBM_4   : out std_logic;
  HRDATA_RASBM_3   : out std_logic;
  HRDATA_RASBM_2   : out std_logic;
  HRDATA_RASBM_1   : out std_logic;
  HRDATA_RASBM_0   : out std_logic;
  HRESP_RASBM_1    : out std_logic;
  HRESP_RASBM_0    : out std_logic;
  HCLK_RASB        : out std_logic;
  HREADY_RASB      : out std_logic;
  HRESET_N_RASB    : out std_logic;
  RASB_DONE        : out std_logic;
  RASB_GSR_N       : out std_logic;
  RASB_IRQ_OUT     : out std_logic;
  EXT_CLK_P1_IN    : in  std_logic;
  EXT_CLK_P2_IN    : in  std_logic;
  EXT_DONE_IN      : in  std_logic;
  QUAD_AND_FP0_7   : in  std_logic;
  QUAD_AND_FP0_6   : in  std_logic;
  QUAD_AND_FP0_5   : in  std_logic;
  QUAD_AND_FP0_4   : in  std_logic;
  QUAD_AND_FP0_3   : in  std_logic;
  QUAD_AND_FP0_2   : in  std_logic;
  QUAD_AND_FP0_1   : in  std_logic;
  QUAD_AND_FP0_0   : in  std_logic;
  QUAD_AND_FP1_7   : in  std_logic;
  QUAD_AND_FP1_6   : in  std_logic;
  QUAD_AND_FP1_5   : in  std_logic;
  QUAD_AND_FP1_4   : in  std_logic;
  QUAD_AND_FP1_3   : in  std_logic;
  QUAD_AND_FP1_2   : in  std_logic;
  QUAD_AND_FP1_1   : in  std_logic;
  QUAD_AND_FP1_0   : in  std_logic;
  QUAD_CLK_7       : in  std_logic;
  QUAD_CLK_6       : in  std_logic;
  QUAD_CLK_5       : in  std_logic;
  QUAD_CLK_4       : in  std_logic;
  QUAD_CLK_3       : in  std_logic;
  QUAD_CLK_2       : in  std_logic;
  QUAD_CLK_1       : in  std_logic;
  QUAD_CLK_0       : in  std_logic;
  QUAD_DONE_7      : in  std_logic;
  QUAD_DONE_6      : in  std_logic;
  QUAD_DONE_5      : in  std_logic;
  QUAD_DONE_4      : in  std_logic;
  QUAD_DONE_3      : in  std_logic;
  QUAD_DONE_2      : in  std_logic;
  QUAD_DONE_1      : in  std_logic;
  QUAD_DONE_0      : in  std_logic;
  QUAD_OR_FP0_7    : in  std_logic;
  QUAD_OR_FP0_6    : in  std_logic;
  QUAD_OR_FP0_5    : in  std_logic;
  QUAD_OR_FP0_4    : in  std_logic;
  QUAD_OR_FP0_3    : in  std_logic;
  QUAD_OR_FP0_2    : in  std_logic;
  QUAD_OR_FP0_1    : in  std_logic;
  QUAD_OR_FP0_0    : in  std_logic;
  QUAD_OR_FP1_7    : in  std_logic;
  QUAD_OR_FP1_6    : in  std_logic;
  QUAD_OR_FP1_5    : in  std_logic;
  QUAD_OR_FP1_4    : in  std_logic;
  QUAD_OR_FP1_3    : in  std_logic;
  QUAD_OR_FP1_2    : in  std_logic;
  QUAD_OR_FP1_1    : in  std_logic;
  QUAD_OR_FP1_0    : in  std_logic;
  QUAD_RST_N_7     : in  std_logic;
  QUAD_RST_N_6     : in  std_logic;
  QUAD_RST_N_5     : in  std_logic;
  QUAD_RST_N_4     : in  std_logic;
  QUAD_RST_N_3     : in  std_logic;
  QUAD_RST_N_2     : in  std_logic;
  QUAD_RST_N_1     : in  std_logic;
  QUAD_RST_N_0     : in  std_logic;
  QUAD_START_7     : in  std_logic;
  QUAD_START_6     : in  std_logic;
  QUAD_START_5     : in  std_logic;
  QUAD_START_4     : in  std_logic;
  QUAD_START_3     : in  std_logic;
  QUAD_START_2     : in  std_logic;
  QUAD_START_1     : in  std_logic;
  QUAD_START_0     : in  std_logic;
  EXT_CLK_P1_OUT   : out std_logic;
  EXT_CLK_P2_OUT   : out std_logic;
  EXT_DONE_OUT     : out std_logic;
  GRP_CLK_P1_L_3     : out std_logic;
  GRP_CLK_P1_L_2     : out std_logic;
  GRP_CLK_P1_L_1     : out std_logic;
  GRP_CLK_P1_L_0     : out std_logic;
  GRP_CLK_P2_L_3     : out std_logic;
  GRP_CLK_P2_L_2     : out std_logic;
  GRP_CLK_P2_L_1     : out std_logic;
  GRP_CLK_P2_L_0     : out std_logic;
  GRP_DESKEW_ERROR_L_3   : out std_logic;
  GRP_DESKEW_ERROR_L_2   : out std_logic;
  GRP_DESKEW_ERROR_L_1   : out std_logic;
  GRP_DESKEW_ERROR_L_0   : out std_logic;
  GRP_DONE_L_3       : out std_logic;
  GRP_DONE_L_2       : out std_logic;
  GRP_DONE_L_1       : out std_logic;
  GRP_DONE_L_0       : out std_logic;
  GRP_START_L_3      : out std_logic;
  GRP_START_L_2      : out std_logic;
  GRP_START_L_1      : out std_logic;
  GRP_START_L_0      : out std_logic;
  GRP_CLK_P1_R_3     : out std_logic;
  GRP_CLK_P1_R_2     : out std_logic;
  GRP_CLK_P1_R_1     : out std_logic;
  GRP_CLK_P1_R_0     : out std_logic;
  GRP_CLK_P2_R_3     : out std_logic;
  GRP_CLK_P2_R_2     : out std_logic;
  GRP_CLK_P2_R_1     : out std_logic;
  GRP_CLK_P2_R_0     : out std_logic;
  GRP_DESKEW_ERROR_R_3   : out std_logic;
  GRP_DESKEW_ERROR_R_2   : out std_logic;
  GRP_DESKEW_ERROR_R_1   : out std_logic;
  GRP_DESKEW_ERROR_R_0   : out std_logic;
  GRP_DONE_R_3       : out std_logic;
  GRP_DONE_R_2       : out std_logic;
  GRP_DONE_R_1       : out std_logic;
  GRP_DONE_R_0       : out std_logic;
  GRP_START_R_3      : out std_logic;
  GRP_START_R_2      : out std_logic;
  GRP_START_R_1      : out std_logic;
  GRP_START_R_0      : out std_logic;
  LPCS_INT_3       : in  std_logic;
  LPCS_INT_2       : in  std_logic;
  LPCS_INT_1       : in  std_logic;
  LPCS_INT_0       : in  std_logic;
  LPCS_RDATA_Q0_7  : in  std_logic;
  LPCS_RDATA_Q0_6  : in  std_logic;
  LPCS_RDATA_Q0_5  : in  std_logic;
  LPCS_RDATA_Q0_4  : in  std_logic;
  LPCS_RDATA_Q0_3  : in  std_logic;
  LPCS_RDATA_Q0_2  : in  std_logic;
  LPCS_RDATA_Q0_1  : in  std_logic;
  LPCS_RDATA_Q0_0  : in  std_logic;
  LPCS_RDATA_Q1_7  : in  std_logic;
  LPCS_RDATA_Q1_6  : in  std_logic;
  LPCS_RDATA_Q1_5  : in  std_logic;
  LPCS_RDATA_Q1_4  : in  std_logic;
  LPCS_RDATA_Q1_3  : in  std_logic;
  LPCS_RDATA_Q1_2  : in  std_logic;
  LPCS_RDATA_Q1_1  : in  std_logic;
  LPCS_RDATA_Q1_0  : in  std_logic;
  LPCS_RDATA_Q2_7  : in  std_logic;
  LPCS_RDATA_Q2_6  : in  std_logic;
  LPCS_RDATA_Q2_5  : in  std_logic;
  LPCS_RDATA_Q2_4  : in  std_logic;
  LPCS_RDATA_Q2_3  : in  std_logic;
  LPCS_RDATA_Q2_2  : in  std_logic;
  LPCS_RDATA_Q2_1  : in  std_logic;
  LPCS_RDATA_Q2_0  : in  std_logic;
  LPCS_RDATA_Q3_7  : in  std_logic;
  LPCS_RDATA_Q3_6  : in  std_logic;
  LPCS_RDATA_Q3_5  : in  std_logic;
  LPCS_RDATA_Q3_4  : in  std_logic;
  LPCS_RDATA_Q3_3  : in  std_logic;
  LPCS_RDATA_Q3_2  : in  std_logic;
  LPCS_RDATA_Q3_1  : in  std_logic;
  LPCS_RDATA_Q3_0  : in  std_logic;
  LPCS_ADDR_7      : out std_logic;
  LPCS_ADDR_6      : out std_logic;
  LPCS_ADDR_5      : out std_logic;
  LPCS_ADDR_4      : out std_logic;
  LPCS_ADDR_3      : out std_logic;
  LPCS_ADDR_2      : out std_logic;
  LPCS_ADDR_1      : out std_logic;
  LPCS_ADDR_0      : out std_logic;
  LPCS_WDATA_7     : out std_logic;
  LPCS_WDATA_6     : out std_logic;
  LPCS_WDATA_5     : out std_logic;
  LPCS_WDATA_4     : out std_logic;
  LPCS_WDATA_3     : out std_logic;
  LPCS_WDATA_2     : out std_logic;
  LPCS_WDATA_1     : out std_logic;
  LPCS_WDATA_0     : out std_logic;
  LPCS_C_15        : out std_logic;
  LPCS_C_14        : out std_logic;
  LPCS_C_13        : out std_logic;
  LPCS_C_12        : out std_logic;
  LPCS_C_11        : out std_logic;
  LPCS_C_10        : out std_logic;
  LPCS_C_9         : out std_logic;
  LPCS_C_8         : out std_logic;
  LPCS_C_7         : out std_logic;
  LPCS_C_6         : out std_logic;
  LPCS_C_5         : out std_logic;
  LPCS_C_4         : out std_logic;
  LPCS_C_3         : out std_logic;
  LPCS_C_2         : out std_logic;
  LPCS_C_1         : out std_logic;
  LPCS_C_0         : out std_logic;
  LPCS_Q_3         : out std_logic;
  LPCS_Q_2         : out std_logic;
  LPCS_Q_1         : out std_logic;
  LPCS_Q_0         : out std_logic;
  LPCS_RD          : out std_logic;
  LPCS_WSTB        : out std_logic;
  LPCS_QUAD_ID0_1  : out std_logic;
  LPCS_QUAD_ID0_0  : out std_logic;
  LPCS_QUAD_ID1_1  : out std_logic;
  LPCS_QUAD_ID1_0  : out std_logic;
  LPCS_QUAD_ID2_1  : out std_logic;
  LPCS_QUAD_ID2_0  : out std_logic;
  LPCS_QUAD_ID3_1  : out std_logic;
  LPCS_QUAD_ID3_0  : out std_logic;
  RPCS_INT_3       : in  std_logic;
  RPCS_INT_2       : in  std_logic;
  RPCS_INT_1       : in  std_logic;
  RPCS_INT_0       : in  std_logic;
  RPCS_RDATA_Q0_7  : in  std_logic;
  RPCS_RDATA_Q0_6  : in  std_logic;
  RPCS_RDATA_Q0_5  : in  std_logic;
  RPCS_RDATA_Q0_4  : in  std_logic;
  RPCS_RDATA_Q0_3  : in  std_logic;
  RPCS_RDATA_Q0_2  : in  std_logic;
  RPCS_RDATA_Q0_1  : in  std_logic;
  RPCS_RDATA_Q0_0  : in  std_logic;
  RPCS_RDATA_Q1_7  : in  std_logic;
  RPCS_RDATA_Q1_6  : in  std_logic;
  RPCS_RDATA_Q1_5  : in  std_logic;
  RPCS_RDATA_Q1_4  : in  std_logic;
  RPCS_RDATA_Q1_3  : in  std_logic;
  RPCS_RDATA_Q1_2  : in  std_logic;
  RPCS_RDATA_Q1_1  : in  std_logic;
  RPCS_RDATA_Q1_0  : in  std_logic;
  RPCS_RDATA_Q2_7  : in  std_logic;
  RPCS_RDATA_Q2_6  : in  std_logic;
  RPCS_RDATA_Q2_5  : in  std_logic;
  RPCS_RDATA_Q2_4  : in  std_logic;
  RPCS_RDATA_Q2_3  : in  std_logic;
  RPCS_RDATA_Q2_2  : in  std_logic;
  RPCS_RDATA_Q2_1  : in  std_logic;
  RPCS_RDATA_Q2_0  : in  std_logic;
  RPCS_RDATA_Q3_7  : in  std_logic;
  RPCS_RDATA_Q3_6  : in  std_logic;
  RPCS_RDATA_Q3_5  : in  std_logic;
  RPCS_RDATA_Q3_4  : in  std_logic;
  RPCS_RDATA_Q3_3  : in  std_logic;
  RPCS_RDATA_Q3_2  : in  std_logic;
  RPCS_RDATA_Q3_1  : in  std_logic;
  RPCS_RDATA_Q3_0  : in  std_logic;
  RPCS_ADDR_7      : out std_logic;
  RPCS_ADDR_6      : out std_logic;
  RPCS_ADDR_5      : out std_logic;
  RPCS_ADDR_4      : out std_logic;
  RPCS_ADDR_3      : out std_logic;
  RPCS_ADDR_2      : out std_logic;
  RPCS_ADDR_1      : out std_logic;
  RPCS_ADDR_0      : out std_logic;
  RPCS_WDATA_7     : out std_logic;
  RPCS_WDATA_6     : out std_logic;
  RPCS_WDATA_5     : out std_logic;
  RPCS_WDATA_4     : out std_logic;
  RPCS_WDATA_3     : out std_logic;
  RPCS_WDATA_2     : out std_logic;
  RPCS_WDATA_1     : out std_logic;
  RPCS_WDATA_0     : out std_logic;
  RPCS_C_15        : out std_logic;
  RPCS_C_14        : out std_logic;
  RPCS_C_13        : out std_logic;
  RPCS_C_12        : out std_logic;
  RPCS_C_11        : out std_logic;
  RPCS_C_10        : out std_logic;
  RPCS_C_9         : out std_logic;
  RPCS_C_8         : out std_logic;
  RPCS_C_7         : out std_logic;
  RPCS_C_6         : out std_logic;
  RPCS_C_5         : out std_logic;
  RPCS_C_4         : out std_logic;
  RPCS_C_3         : out std_logic;
  RPCS_C_2         : out std_logic;
  RPCS_C_1         : out std_logic;
  RPCS_C_0         : out std_logic;
  RPCS_Q_3         : out std_logic;
  RPCS_Q_2         : out std_logic;
  RPCS_Q_1         : out std_logic;
  RPCS_Q_0         : out std_logic;
  RPCS_RD          : out std_logic;
  RPCS_WSTB        : out std_logic;
  RPCS_QUAD_ID0_1  : out std_logic;
  RPCS_QUAD_ID0_0  : out std_logic;
  RPCS_QUAD_ID1_1  : out std_logic;
  RPCS_QUAD_ID1_0  : out std_logic;
  RPCS_QUAD_ID2_1  : out std_logic;
  RPCS_QUAD_ID2_0  : out std_logic;
  RPCS_QUAD_ID3_1  : out std_logic;
  RPCS_QUAD_ID3_0  : out std_logic;
  DMA_RD_DATA_31   : in  std_logic;
  DMA_RD_DATA_30   : in  std_logic;
  DMA_RD_DATA_29   : in  std_logic;
  DMA_RD_DATA_28   : in  std_logic;
  DMA_RD_DATA_27   : in  std_logic;
  DMA_RD_DATA_26   : in  std_logic;
  DMA_RD_DATA_25   : in  std_logic;
  DMA_RD_DATA_24   : in  std_logic;
  DMA_RD_DATA_23   : in  std_logic;
  DMA_RD_DATA_22   : in  std_logic;
  DMA_RD_DATA_21   : in  std_logic;
  DMA_RD_DATA_20   : in  std_logic;
  DMA_RD_DATA_19   : in  std_logic;
  DMA_RD_DATA_18   : in  std_logic;
  DMA_RD_DATA_17   : in  std_logic;
  DMA_RD_DATA_16   : in  std_logic;
  DMA_RD_DATA_15   : in  std_logic;
  DMA_RD_DATA_14   : in  std_logic;
  DMA_RD_DATA_13   : in  std_logic;
  DMA_RD_DATA_12   : in  std_logic;
  DMA_RD_DATA_11   : in  std_logic;
  DMA_RD_DATA_10   : in  std_logic;
  DMA_RD_DATA_9    : in  std_logic;
  DMA_RD_DATA_8    : in  std_logic;
  DMA_RD_DATA_7    : in  std_logic;
  DMA_RD_DATA_6    : in  std_logic;
  DMA_RD_DATA_5    : in  std_logic;
  DMA_RD_DATA_4    : in  std_logic;
  DMA_RD_DATA_3    : in  std_logic;
  DMA_RD_DATA_2    : in  std_logic;
  DMA_RD_DATA_1    : in  std_logic;
  DMA_RD_DATA_0    : in  std_logic;
  DMA_RD_PARITY_3  : in  std_logic;
  DMA_RD_PARITY_2  : in  std_logic;
  DMA_RD_PARITY_1  : in  std_logic;
  DMA_RD_PARITY_0  : in  std_logic;
  DMA_RETRY        : in  std_logic;
  DMA_TA           : in  std_logic;
  DMA_TEA          : in  std_logic;
  DMA_TRI_CTL      : in  std_logic;
  DMA_TRI_DATA     : in  std_logic);

end component;
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

   attribute IS_ASB: string;
   attribute IS_ASB of SYSBUSA_INST : label is "or5s00/data/or5s00.acd";
   attribute SYSBUS_CONFIG_FILE: string;
   attribute SYSBUS_CONFIG_FILE of SYSBUSA_INST : label is USER_CONFIG_FILE;
   attribute MPI_BUS_WIDTH: string;
   attribute SYS_CLK_SEL: string;
   attribute MPI_PRIORITY: string;
   attribute FPGA_PRIORITY: string;
   attribute PARITY: string;
   attribute MPI_PARITY: string;
   attribute MPI_RST: string;
   attribute MASTER_RST: string;
   attribute MPI_SYNCMODE: string;
   attribute MASTER_SYNCMODE: string;
   attribute MASTER_AUTORETRY: string;
   attribute SLAVE_SYNCMODE: string;
   attribute INTERRUPT_VECTOR1: String;
   attribute INTERRUPT_VECTOR2: String;
   attribute INTERRUPT_VECTOR3: String;
   attribute INTERRUPT_VECTOR4: String;
   attribute INTERRUPT_VECTOR5: String;
   attribute INTERRUPT_VECTOR6: String;
   attribute MPI_BUS_WIDTH of SYSBUSA_INST : label is #_bus_width;
   attribute SYS_CLK_SEL of SYSBUSA_INST : label is _sys_clock;
   attribute MPI_PRIORITY of SYSBUSA_INST : label is _mpi_priority;
   attribute FPGA_PRIORITY of SYSBUSA_INST : label is _umi_priority;
   attribute PARITY of SYSBUSA_INST : label is _read_parity;
   attribute MPI_PARITY of SYSBUSA_INST : label is #_parity_enable_new;
   attribute MPI_RST of SYSBUSA_INST : label is #_mpi_sys_reset_new;
   attribute MASTER_RST of SYSBUSA_INST : label is #_umi_sys_reset_new;
   attribute MPI_SYNCMODE of SYSBUSA_INST : label is #_mpi_clk_async_new;
   attribute MASTER_SYNCMODE of SYSBUSA_INST : label is #_umi_sync_hclk_new;
   attribute MASTER_AUTORETRY of SYSBUSA_INST : label is #_auto_retry_new;
   attribute SLAVE_SYNCMODE of SYSBUSA_INST : label is #_usi_sync_hclk_new;
   attribute INTERRUPT_VECTOR1 of SYSBUSA_INST : label is #_interrupt_vec1_new;
   attribute INTERRUPT_VECTOR2 of SYSBUSA_INST : label is #_interrupt_vec2_new;
   attribute INTERRUPT_VECTOR3 of SYSBUSA_INST : label is #_interrupt_vec3_new;
   attribute INTERRUPT_VECTOR4 of SYSBUSA_INST : label is #_interrupt_vec4_new;
   attribute INTERRUPT_VECTOR5 of SYSBUSA_INST : label is #_interrupt_vec5_new;
   attribute INTERRUPT_VECTOR6 of SYSBUSA_INST : label is #_interrupt_vec6_new;

signal scuba_vlo : std_logic;
signal scuba_vhi : std_logic;
signal to_lpcsa  : std_logic_vector(17 downto 0);
signal to_rpcsa  : std_logic_vector(17 downto 0);
signal to_lpcsa_grp   : std_logic_vector(19 downto 0);
signal to_rpcsa_grp   : std_logic_vector(19 downto 0);
#if _enable_mpi == 1
signal buf_mpi_addr : std_logic_vector(14 to 31);
signal buf_mpi_tsiz : std_logic_vector(0 to 1);
signal buf_cs1 : std_logic;
signal buf_cs0n : std_logic;
signal buf_mpi_bdip : std_logic;
signal buf_mpi_burst : std_logic;
signal buf_mpi_strb_n : std_logic;
signal buf_mpi_wr_n : std_logic;
signal buf_mpi_clk : std_logic;
signal buf_mpi_irq_n : std_logic;
signal buf_mpi_tea : std_logic;
signal buf_mpi_retry : std_logic;
signal buf_mpi_ta : std_logic;
signal mpi_cntl_ts : std_logic;
#if _bus_width == 32
signal mpi_rd_data : std_logic_vector(0 to 31);
signal mpi_wr_data : std_logic_vector(0 to 31);
#if _parity_enable == 1
signal mpi_wr_parity3 : std_logic;
signal mpi_rd_parity3 : std_logic;
signal mpi_wr_parity2 : std_logic;
signal mpi_rd_parity2 : std_logic;
signal mpi_wr_parity1 : std_logic;
signal mpi_rd_parity1 : std_logic;
signal mpi_wr_parity0 : std_logic;
signal mpi_rd_parity0 : std_logic;
#endif
#endif
#if _bus_width == 16
signal mpi_rd_data : std_logic_vector(0 to 15);
signal mpi_wr_data : std_logic_vector(0 to 15);
#if _parity_enable == 1
signal mpi_wr_parity1 : std_logic;
signal mpi_rd_parity1 : std_logic;
signal mpi_wr_parity0 : std_logic;
signal mpi_rd_parity0 : std_logic;
#endif
#endif
#if _bus_width == 8
signal mpi_rd_data : std_logic_vector(0 to 7);
signal mpi_wr_data : std_logic_vector(0 to 7);
#if _parity_enable == 1
signal mpi_wr_parity0 : std_logic;
signal mpi_rd_parity0 : std_logic;
#endif
#endif
signal pd31_16_ts : std_logic;
signal pd15_8_ts : std_logic;
signal pd7_3_ts : std_logic;
signal pd2_0_ts : std_logic;
#if _parity_enable == 1
signal mpi_dp_ts_2 : std_logic;
signal mpi_dp_ts_1 : std_logic;
signal mpi_dp_ts_0 : std_logic;
#endif
#endif
#if _enable_umi == 1
#if _enable_orcastra == 1
signal umi_addr        : std_logic_vector (17 downto 0);
signal umi_wdata       : std_logic_vector (35 downto 0);
signal umi_rdata       : std_logic_vector (35 downto 0);
signal umi_ack  :std_logic;
signal umi_retry  :std_logic;
signal umi_err  :std_logic;
signal umi_wr_n  :std_logic;
signal umi_rdy  :std_logic;
signal PSR_Out1  :std_logic;
signal JTDO  :std_logic;
signal Shift_DR  :std_logic;
signal Capture_DR  :std_logic;
signal PSR_Enable1  :std_logic;
signal JTCK  :std_logic;
signal JTDI  :std_logic;
signal PC_Read : std_logic;

signal PC_Ready : std_logic;
signal BSRing1  : std_logic_vector(31 downto 0);
signal DataInReg : std_logic_vector(26 downto 0);
signal c        : std_logic_vector(4 downto 0);
signal UMackReg : std_logic;
signal UMretryReg : std_logic;
signal UMerrReg : std_logic;
signal UMready2 : std_logic;
signal PCready2 : std_logic;
signal PCready3 : std_logic;
signal PCready4 : std_logic;
signal UMset : std_logic;
signal UMclear : std_logic;
signal UMlockI : std_logic;
#endif
#endif

begin

vlo_inst : VLO port map(Z => scuba_vlo);

#if _enable_mpi == 1
  #for (i=14; i<=31; i=i+1)
  I_##i : IB port map(I => mpi_addr(##i), O => buf_mpi_addr(##i));
  #endfor

  I_cs1 : IB port map(I => mpi_cs1, O => buf_cs1);
  I_cs0n : IB port map(I => mpi_cs0n, O => buf_cs0n);
  I_mpi_bdip : IB port map(I => mpi_bdip, O => buf_mpi_bdip);
  I_mpi_burst : IB port map(I => mpi_burst, O => buf_mpi_burst);
  I_mpi_tsiz0 : IB port map(I => mpi_tsiz(0), O => buf_mpi_tsiz(0));
  I_mpi_tsiz1 : IB port map(I => mpi_tsiz(1), O => buf_mpi_tsiz(1));
  I_mpi_strb_n : IB port map(I => mpi_strb_n, O => buf_mpi_strb_n);
  I_mpi_wr_n : IB port map(I => mpi_wr_n, O => buf_mpi_wr_n);
  I_mpi_clk : IB port map(I => mpi_clk, O => buf_mpi_clk);
  I_mpi_irq_n : OB port map(I => buf_mpi_irq_n, O => mpi_irq_n);
  I_mpi_tea : OBZ port map(I => buf_mpi_tea, T => mpi_cntl_ts, O => mpi_tea);
  I_mpi_retry : OBZ port map(I => buf_mpi_retry, T => mpi_cntl_ts, O => mpi_retry);
  I_mpi_ta : OBZ port map(I => buf_mpi_ta, T => mpi_cntl_ts, O => mpi_ta);
#if _bus_width == 32
  I_mpi_data_31 : BB port map(I => mpi_rd_data(31), T => pd31_16_ts,
                              O => mpi_wr_data(31), B => mpi_data(31));
  I_mpi_data_30 : BB port map(I => mpi_rd_data(30), T => pd31_16_ts,
                              O => mpi_wr_data(30), B => mpi_data(30));
  I_mpi_data_29 : BB port map(I => mpi_rd_data(29), T => pd31_16_ts,
                              O => mpi_wr_data(29), B => mpi_data(29));
  I_mpi_data_28 : BB port map(I => mpi_rd_data(28), T => pd31_16_ts,
                              O => mpi_wr_data(28), B => mpi_data(28));
  I_mpi_data_27 : BB port map(I => mpi_rd_data(27), T => pd31_16_ts,
                              O => mpi_wr_data(27), B => mpi_data(27));
  I_mpi_data_26 : BB port map(I => mpi_rd_data(26), T => pd31_16_ts,
                              O => mpi_wr_data(26), B => mpi_data(26));
  I_mpi_data_25 : BB port map(I => mpi_rd_data(25), T => pd31_16_ts,
                              O => mpi_wr_data(25), B => mpi_data(25));
  I_mpi_data_24 : BB port map(I => mpi_rd_data(24), T => pd31_16_ts,
                              O => mpi_wr_data(24), B => mpi_data(24));
  I_mpi_data_23 : BB port map(I => mpi_rd_data(23), T => pd31_16_ts,
                              O => mpi_wr_data(23), B => mpi_data(23));
  I_mpi_data_22 : BB port map(I => mpi_rd_data(22), T => pd31_16_ts,
                              O => mpi_wr_data(22), B => mpi_data(22));
  I_mpi_data_21 : BB port map(I => mpi_rd_data(21), T => pd31_16_ts,
                              O => mpi_wr_data(21), B => mpi_data(21));
  I_mpi_data_20 : BB port map(I => mpi_rd_data(20), T => pd31_16_ts,
                              O => mpi_wr_data(20), B => mpi_data(20));
  I_mpi_data_19 : BB port map(I => mpi_rd_data(19), T => pd31_16_ts,
                              O => mpi_wr_data(19), B => mpi_data(19));
  I_mpi_data_18 : BB port map(I => mpi_rd_data(18), T => pd31_16_ts,
                              O => mpi_wr_data(18), B => mpi_data(18));
  I_mpi_data_17 : BB port map(I => mpi_rd_data(17), T => pd31_16_ts,
                              O => mpi_wr_data(17), B => mpi_data(17));
  I_mpi_data_16 : BB port map(I => mpi_rd_data(16), T => pd31_16_ts,
                              O => mpi_wr_data(16), B => mpi_data(16));
#if _parity_enable == 1
  I_mpi_parity3 : BB port map(I => mpi_rd_parity3, T => mpi_dp_ts_2,
                              O => mpi_wr_parity3, B => mpi_par(3));
  I_mpi_parity2 : BB port map(I => mpi_rd_parity2, T => mpi_dp_ts_2,
                              O => mpi_wr_parity2, B => mpi_par(2));
#endif
#endif
#if _bus_width == 32 || _bus_width == 16
  I_mpi_data_15 : BB port map(I => mpi_rd_data(15), T => pd15_8_ts,
                              O => mpi_wr_data(15), B => mpi_data(15));
  I_mpi_data_14 : BB port map(I => mpi_rd_data(14), T => pd15_8_ts,
                              O => mpi_wr_data(14), B => mpi_data(14));
  I_mpi_data_13 : BB port map(I => mpi_rd_data(13), T => pd15_8_ts,
                              O => mpi_wr_data(13), B => mpi_data(13));
  I_mpi_data_12 : BB port map(I => mpi_rd_data(12), T => pd15_8_ts,
                              O => mpi_wr_data(12), B => mpi_data(12));
  I_mpi_data_11 : BB port map(I => mpi_rd_data(11), T => pd15_8_ts,
                              O => mpi_wr_data(11), B => mpi_data(11));
  I_mpi_data_10 : BB port map(I => mpi_rd_data(10), T => pd15_8_ts,
                              O => mpi_wr_data(10), B => mpi_data(10));
  I_mpi_data_9  : BB port map(I => mpi_rd_data(9), T => pd15_8_ts,
                              O => mpi_wr_data(9), B => mpi_data(9));
  I_mpi_data_8  : BB port map(I => mpi_rd_data(8), T => pd15_8_ts,
                              O => mpi_wr_data(8), B => mpi_data(8));
#if _parity_enable == 1
  I_mpi_parity1  : BB port map(I => mpi_rd_parity1, T => mpi_dp_ts_1,
                              O => mpi_wr_parity1, B => mpi_par(1));
#endif
#endif
#if _bus_width == 32 || _bus_width == 16 || _bus_width == 8
  I_mpi_data_7  : BB port map(I => mpi_rd_data(7), T => pd7_3_ts,
                              O => mpi_wr_data(7), B => mpi_data(7));
  I_mpi_data_6  : BB port map(I => mpi_rd_data(6), T => pd7_3_ts,
                              O => mpi_wr_data(6), B => mpi_data(6));
  I_mpi_data_5  : BB port map(I => mpi_rd_data(5), T => pd7_3_ts,
                              O => mpi_wr_data(5), B => mpi_data(5));
  I_mpi_data_4  : BB port map(I => mpi_rd_data(4), T => pd7_3_ts,
                              O => mpi_wr_data(4), B => mpi_data(4));
  I_mpi_data_3  : BB port map(I => mpi_rd_data(3), T => pd7_3_ts,
                              O => mpi_wr_data(3), B => mpi_data(3));
  I_mpi_data_2  : BB port map(I => mpi_rd_data(2), T => pd2_0_ts,
                              O => mpi_wr_data(2), B => mpi_data(2));
  I_mpi_data_1  : BB port map(I => mpi_rd_data(1), T => pd2_0_ts,
                              O => mpi_wr_data(1), B => mpi_data(1));
  I_mpi_data_0  : BB port map(I => mpi_rd_data(0), T => pd2_0_ts,
                              O => mpi_wr_data(0), B => mpi_data(0));
#if _parity_enable == 1
  I_mpi_parity0  : BB port map(I => mpi_rd_parity0, T => mpi_dp_ts_0,
                              O => mpi_wr_parity0, B => mpi_par(0));
#endif
#endif
#endif     -- end of if enable_mpi

#if _dma_interface == 1
#if _enable_mpi == 1
  dfa_addr <= buf_mpi_addr;
  dfa_wr_data <= mpi_wr_data;
  dfa_cs1 <= buf_cs1;
  dfa_cs0n <= buf_cs0n;
  dfa_wr_n <= buf_mpi_wr_n;
  dfa_bdip <= buf_mpi_bdip;
  dfa_burst <= buf_mpi_burst;
  dfa_tsiz <= buf_mpi_tsiz;
  dfa_strb_n <= buf_mpi_strb_n;
#endif
#endif

  SYSBUSA_INST : SYSBUSA
--synopsys translate_off
  generic map (MPI_PARITY => #_parity_enable_new,
               SYSBUS_CONFIG_FILE => USER_CONFIG_FILE,
               MPI_BUS_WIDTH => _bus_width,
               SYS_CLK_SEL => _sys_clock,
               MPI_PRIORITY => _mpi_priority,
               FPGA_PRIORITY => _umi_priority,
               MPI_RST => #_mpi_sys_reset_new,
               MASTER_RST => #_umi_sys_reset_new,
               PARITY => _read_parity,
               MPI_SYNCMODE => #_mpi_clk_async_new,
               MASTER_SYNCMODE => #_umi_sync_hclk_new,
               MASTER_AUTORETRY => #_auto_retry_new,
               INTERRUPT_VECTOR1 => conv_integer(#_interrupt_vec1),
               INTERRUPT_VECTOR2 => conv_integer(#_interrupt_vec2),
               INTERRUPT_VECTOR3 => conv_integer(#_interrupt_vec3),
               INTERRUPT_VECTOR4 => conv_integer(#_interrupt_vec4),
               INTERRUPT_VECTOR5 => conv_integer(#_interrupt_vec5),
               INTERRUPT_VECTOR6 => conv_integer(#_interrupt_vec6),
               SLAVE_SYNCMODE => #_usi_sync_hclk_new)
--synopsys translate_on
  port map ( 
#if _enable_mpi == 1
  CS0_N => buf_cs0n,
  CS1 => buf_cs1,
  MPI_CLK => buf_mpi_clk,
  MPI_WR_N => buf_mpi_wr_n,
  MPI_STRB_N => buf_mpi_strb_n,
  MPI_TSIZ_0 => buf_mpi_tsiz(0),
  MPI_TSIZ_1 => buf_mpi_tsiz(1),
  MPI_BURST => buf_mpi_burst,
  MPI_BDIP => buf_mpi_bdip,
  MPI_ADDR_14 => buf_mpi_addr(14),
  MPI_ADDR_15 => buf_mpi_addr(15),
  MPI_ADDR_16 => buf_mpi_addr(16),
  MPI_ADDR_17 => buf_mpi_addr(17),
  MPI_ADDR_18 => buf_mpi_addr(18),
  MPI_ADDR_19 => buf_mpi_addr(19),
  MPI_ADDR_20 => buf_mpi_addr(20),
  MPI_ADDR_21 => buf_mpi_addr(21),
  MPI_ADDR_22 => buf_mpi_addr(22),
  MPI_ADDR_23 => buf_mpi_addr(23),
  MPI_ADDR_24 => buf_mpi_addr(24),
  MPI_ADDR_25 => buf_mpi_addr(25),
  MPI_ADDR_26 => buf_mpi_addr(26),
  MPI_ADDR_27 => buf_mpi_addr(27),
  MPI_ADDR_28 => buf_mpi_addr(28),
  MPI_ADDR_29 => buf_mpi_addr(29),
  MPI_ADDR_30 => buf_mpi_addr(30),
  MPI_ADDR_31 => buf_mpi_addr(31),
#if _bus_width == 32 
  MPI_WR_DATA_31 => mpi_wr_data(31),
  MPI_WR_DATA_30 => mpi_wr_data(30),
  MPI_WR_DATA_29 => mpi_wr_data(29),
  MPI_WR_DATA_28 => mpi_wr_data(28),
  MPI_WR_DATA_27 => mpi_wr_data(27),
  MPI_WR_DATA_26 => mpi_wr_data(26),
  MPI_WR_DATA_25 => mpi_wr_data(25),
  MPI_WR_DATA_24 => mpi_wr_data(24),
  MPI_WR_DATA_23 => mpi_wr_data(23),
  MPI_WR_DATA_22 => mpi_wr_data(22),
  MPI_WR_DATA_21 => mpi_wr_data(21),
  MPI_WR_DATA_20 => mpi_wr_data(20),
  MPI_WR_DATA_19 => mpi_wr_data(19),
  MPI_WR_DATA_18 => mpi_wr_data(18),
  MPI_WR_DATA_17 => mpi_wr_data(17),
  MPI_WR_DATA_16 => mpi_wr_data(16),
#if _parity_enable == 1
  MPI_WR_PARITY_3 => mpi_wr_parity3,
  MPI_WR_PARITY_2 => mpi_wr_parity2,
#else
  MPI_WR_PARITY_3 => scuba_vlo,
  MPI_WR_PARITY_2 => scuba_vlo,
#endif
  MPI_WR_DATA_15 => mpi_wr_data(15),
  MPI_WR_DATA_14 => mpi_wr_data(14),
  MPI_WR_DATA_13 => mpi_wr_data(13),
  MPI_WR_DATA_12 => mpi_wr_data(12),
  MPI_WR_DATA_11 => mpi_wr_data(11),
  MPI_WR_DATA_10 => mpi_wr_data(10),
  MPI_WR_DATA_9 => mpi_wr_data(9),
  MPI_WR_DATA_8 => mpi_wr_data(8),
#if _parity_enable == 1
  MPI_WR_PARITY_1 => mpi_wr_parity1,
#else
  MPI_WR_PARITY_1 => scuba_vlo,
#endif
  MPI_WR_DATA_7 => mpi_wr_data(7),
  MPI_WR_DATA_6 => mpi_wr_data(6),
  MPI_WR_DATA_5 => mpi_wr_data(5),
  MPI_WR_DATA_4 => mpi_wr_data(4),
  MPI_WR_DATA_3 => mpi_wr_data(3),
  MPI_WR_DATA_2 => mpi_wr_data(2),
  MPI_WR_DATA_1 => mpi_wr_data(1),
  MPI_WR_DATA_0 => mpi_wr_data(0),
#if _parity_enable == 1
  MPI_WR_PARITY_0 => mpi_wr_parity0,
#else
  MPI_WR_PARITY_0 => scuba_vlo,
#endif
#endif
#if _bus_width == 16 
  MPI_WR_DATA_31 => scuba_vlo,
  MPI_WR_DATA_30 => scuba_vlo,
  MPI_WR_DATA_29 => scuba_vlo,
  MPI_WR_DATA_28 => scuba_vlo,
  MPI_WR_DATA_27 => scuba_vlo,
  MPI_WR_DATA_26 => scuba_vlo,
  MPI_WR_DATA_25 => scuba_vlo,
  MPI_WR_DATA_24 => scuba_vlo,
  MPI_WR_DATA_23 => scuba_vlo,
  MPI_WR_DATA_22 => scuba_vlo,
  MPI_WR_DATA_21 => scuba_vlo,
  MPI_WR_DATA_20 => scuba_vlo,
  MPI_WR_DATA_19 => scuba_vlo,
  MPI_WR_DATA_18 => scuba_vlo,
  MPI_WR_DATA_17 => scuba_vlo,
  MPI_WR_DATA_16 => scuba_vlo,
  MPI_WR_PARITY_3 => scuba_vlo,
  MPI_WR_PARITY_2 => scuba_vlo,
  MPI_WR_DATA_15 => mpi_wr_data(15),
  MPI_WR_DATA_14 => mpi_wr_data(14),
  MPI_WR_DATA_13 => mpi_wr_data(13),
  MPI_WR_DATA_12 => mpi_wr_data(12),
  MPI_WR_DATA_11 => mpi_wr_data(11),
  MPI_WR_DATA_10 => mpi_wr_data(10),
  MPI_WR_DATA_9 => mpi_wr_data(9),
  MPI_WR_DATA_8 => mpi_wr_data(8),
#if _parity_enable == 1
  MPI_WR_PARITY_1 => mpi_wr_parity1,
#else
  MPI_WR_PARITY_1 => scuba_vlo,
#endif
  MPI_WR_DATA_7 => mpi_wr_data(7),
  MPI_WR_DATA_6 => mpi_wr_data(6),
  MPI_WR_DATA_5 => mpi_wr_data(5),
  MPI_WR_DATA_4 => mpi_wr_data(4),
  MPI_WR_DATA_3 => mpi_wr_data(3),
  MPI_WR_DATA_2 => mpi_wr_data(2),
  MPI_WR_DATA_1 => mpi_wr_data(1),
  MPI_WR_DATA_0 => mpi_wr_data(0),
#if _parity_enable == 1
  MPI_WR_PARITY_0 => mpi_wr_parity0,
#else
  MPI_WR_PARITY_0 => scuba_vlo,
#endif
#endif
#if _bus_width == 8 
  MPI_WR_DATA_31 => scuba_vlo,
  MPI_WR_DATA_30 => scuba_vlo,
  MPI_WR_DATA_29 => scuba_vlo,
  MPI_WR_DATA_28 => scuba_vlo,
  MPI_WR_DATA_27 => scuba_vlo,
  MPI_WR_DATA_26 => scuba_vlo,
  MPI_WR_DATA_25 => scuba_vlo,
  MPI_WR_DATA_24 => scuba_vlo,
  MPI_WR_DATA_23 => scuba_vlo,
  MPI_WR_DATA_22 => scuba_vlo,
  MPI_WR_DATA_21 => scuba_vlo,
  MPI_WR_DATA_20 => scuba_vlo,
  MPI_WR_DATA_19 => scuba_vlo,
  MPI_WR_DATA_18 => scuba_vlo,
  MPI_WR_DATA_17 => scuba_vlo,
  MPI_WR_DATA_16 => scuba_vlo,
  MPI_WR_PARITY_3 => scuba_vlo,
  MPI_WR_PARITY_2 => scuba_vlo,
  MPI_WR_DATA_15 => scuba_vlo,
  MPI_WR_DATA_14 => scuba_vlo,
  MPI_WR_DATA_13 => scuba_vlo,
  MPI_WR_DATA_12 => scuba_vlo,
  MPI_WR_DATA_11 => scuba_vlo,
  MPI_WR_DATA_10 => scuba_vlo,
  MPI_WR_DATA_9 => scuba_vlo,
  MPI_WR_DATA_8 => scuba_vlo,
  MPI_WR_PARITY_1 => scuba_vlo,
  MPI_WR_DATA_7 => mpi_wr_data(7),
  MPI_WR_DATA_6 => mpi_wr_data(6),
  MPI_WR_DATA_5 => mpi_wr_data(5),
  MPI_WR_DATA_4 => mpi_wr_data(4),
  MPI_WR_DATA_3 => mpi_wr_data(3),
  MPI_WR_DATA_2 => mpi_wr_data(2),
  MPI_WR_DATA_1 => mpi_wr_data(1),
  MPI_WR_DATA_0 => mpi_wr_data(0),
#if _parity_enable == 1
  MPI_WR_PARITY_0 => mpi_wr_parity0,
#else
  MPI_WR_PARITY_0 => scuba_vlo,
#endif
#endif
  MPI_RST_N => mpi_rst_n,
  MPI_TA => buf_mpi_ta,
  MPI_RETRY => buf_mpi_retry,
  MPI_TEA => buf_mpi_tea,
#if _bus_width == 32
  MPI_RD_DATA_31 => mpi_rd_data(31),
  MPI_RD_DATA_30 => mpi_rd_data(30),
  MPI_RD_DATA_29 => mpi_rd_data(29),
  MPI_RD_DATA_28 => mpi_rd_data(28),
  MPI_RD_DATA_27 => mpi_rd_data(27),
  MPI_RD_DATA_26 => mpi_rd_data(26),
  MPI_RD_DATA_25 => mpi_rd_data(25),
  MPI_RD_DATA_24 => mpi_rd_data(24),
  MPI_RD_DATA_23 => mpi_rd_data(23),
  MPI_RD_DATA_22 => mpi_rd_data(22),
  MPI_RD_DATA_21 => mpi_rd_data(21),
  MPI_RD_DATA_20 => mpi_rd_data(20),
  MPI_RD_DATA_19 => mpi_rd_data(19),
  MPI_RD_DATA_18 => mpi_rd_data(18),
  MPI_RD_DATA_17 => mpi_rd_data(17),
  MPI_RD_DATA_16 => mpi_rd_data(16),
#if _parity_enable == 1
  MPI_RD_PARITY_3 => mpi_rd_parity3,
  MPI_RD_PARITY_2 => mpi_rd_parity2,
#else
  MPI_RD_PARITY_3 => open,
  MPI_RD_PARITY_2 => open,
#endif
  MPI_RD_DATA_15 => mpi_rd_data(15),
  MPI_RD_DATA_14 => mpi_rd_data(14),
  MPI_RD_DATA_13 => mpi_rd_data(13),
  MPI_RD_DATA_12 => mpi_rd_data(12),
  MPI_RD_DATA_11 => mpi_rd_data(11),
  MPI_RD_DATA_10 => mpi_rd_data(10),
  MPI_RD_DATA_9 => mpi_rd_data(9),
  MPI_RD_DATA_8 => mpi_rd_data(8),
#if _parity_enable == 1
  MPI_RD_PARITY_1 => mpi_rd_parity1,
#else
  MPI_RD_PARITY_1 => open,
#endif
  MPI_RD_DATA_7 => mpi_rd_data(7),
  MPI_RD_DATA_6 => mpi_rd_data(6),
  MPI_RD_DATA_5 => mpi_rd_data(5),
  MPI_RD_DATA_4 => mpi_rd_data(4),
  MPI_RD_DATA_3 => mpi_rd_data(3),
  MPI_RD_DATA_2 => mpi_rd_data(2),
  MPI_RD_DATA_1 => mpi_rd_data(1),
  MPI_RD_DATA_0 => mpi_rd_data(0),
#if _parity_enable == 1
  MPI_RD_PARITY_0 => mpi_rd_parity0,
#else
  MPI_RD_PARITY_0 => open,
#endif
#endif
#if _bus_width == 16
  MPI_RD_DATA_31 => open,
  MPI_RD_DATA_30 => open,
  MPI_RD_DATA_29 => open,
  MPI_RD_DATA_28 => open,
  MPI_RD_DATA_27 => open,
  MPI_RD_DATA_26 => open,
  MPI_RD_DATA_25 => open,
  MPI_RD_DATA_24 => open,
  MPI_RD_DATA_23 => open,
  MPI_RD_DATA_22 => open,
  MPI_RD_DATA_21 => open,
  MPI_RD_DATA_20 => open,
  MPI_RD_DATA_19 => open,
  MPI_RD_DATA_18 => open,
  MPI_RD_DATA_17 => open,
  MPI_RD_DATA_16 => open,
  MPI_RD_PARITY_3 => open,
  MPI_RD_PARITY_2 => open,
  MPI_RD_DATA_15 => mpi_rd_data(15),
  MPI_RD_DATA_14 => mpi_rd_data(14),
  MPI_RD_DATA_13 => mpi_rd_data(13),
  MPI_RD_DATA_12 => mpi_rd_data(12),
  MPI_RD_DATA_11 => mpi_rd_data(11),
  MPI_RD_DATA_10 => mpi_rd_data(10),
  MPI_RD_DATA_9 => mpi_rd_data(9),
  MPI_RD_DATA_8 => mpi_rd_data(8),
#if _parity_enable == 1
  MPI_RD_PARITY_1 => mpi_rd_parity1,
#else
  MPI_RD_PARITY_1 => open,
#endif
  MPI_RD_DATA_7 => mpi_rd_data(7),
  MPI_RD_DATA_6 => mpi_rd_data(6),
  MPI_RD_DATA_5 => mpi_rd_data(5),
  MPI_RD_DATA_4 => mpi_rd_data(4),
  MPI_RD_DATA_3 => mpi_rd_data(3),
  MPI_RD_DATA_2 => mpi_rd_data(2),
  MPI_RD_DATA_1 => mpi_rd_data(1),
  MPI_RD_DATA_0 => mpi_rd_data(0),
#if _parity_enable == 1
  MPI_RD_PARITY_0 => mpi_rd_parity0,
#else
  MPI_RD_PARITY_0 => open,
#endif
#endif
#if _bus_width == 8
  MPI_RD_DATA_31 => open,
  MPI_RD_DATA_30 => open,
  MPI_RD_DATA_29 => open,
  MPI_RD_DATA_28 => open,
  MPI_RD_DATA_27 => open,
  MPI_RD_DATA_26 => open,
  MPI_RD_DATA_25 => open,
  MPI_RD_DATA_24 => open,
  MPI_RD_DATA_23 => open,
  MPI_RD_DATA_22 => open,
  MPI_RD_DATA_21 => open,
  MPI_RD_DATA_20 => open,
  MPI_RD_DATA_19 => open,
  MPI_RD_DATA_18 => open,
  MPI_RD_DATA_17 => open,
  MPI_RD_DATA_16 => open,
  MPI_RD_PARITY_3 => open,
  MPI_RD_PARITY_2 => open,
  MPI_RD_DATA_15 => open,
  MPI_RD_DATA_14 => open,
  MPI_RD_DATA_13 => open,
  MPI_RD_DATA_12 => open,
  MPI_RD_DATA_11 => open,
  MPI_RD_DATA_10 => open,
  MPI_RD_DATA_9 => open,
  MPI_RD_DATA_8 => open,
  MPI_RD_PARITY_1 => open,
  MPI_RD_DATA_7 => mpi_rd_data(7),
  MPI_RD_DATA_6 => mpi_rd_data(6),
  MPI_RD_DATA_5 => mpi_rd_data(5),
  MPI_RD_DATA_4 => mpi_rd_data(4),
  MPI_RD_DATA_3 => mpi_rd_data(3),
  MPI_RD_DATA_2 => mpi_rd_data(2),
  MPI_RD_DATA_1 => mpi_rd_data(1),
  MPI_RD_DATA_0 => mpi_rd_data(0),
#if _parity_enable == 1
  MPI_RD_PARITY_0 => mpi_rd_parity0,
#else
  MPI_RD_PARITY_0 => open,
#endif
#endif
  PD2_0_TS => pd2_0_ts,
  PD7_3_TS => pd7_3_ts,
  PD15_8_TS => pd15_8_ts,
  PD31_16_TS => pd31_16_ts,
#if _parity_enable == 1
  MPI_DP_TS_0 => mpi_dp_ts_0,
  MPI_DP_TS_1 => mpi_dp_ts_1,
  MPI_DP_TS_2 => mpi_dp_ts_2,
#else
  MPI_DP_TS_0 => open,
  MPI_DP_TS_1 => open,
  MPI_DP_TS_2 => open,
#endif
  MPI_IRQ_N => buf_mpi_irq_n,
  MPI_CNTL_TS => mpi_cntl_ts,
#elif _enable_mpi == 0
  CS0_N => scuba_vlo,
  CS1 => scuba_vlo,
  MPI_CLK => scuba_vlo,
  MPI_WR_N => scuba_vlo,
  MPI_STRB_N => scuba_vlo,
  MPI_TSIZ_0 => scuba_vlo,
  MPI_TSIZ_1 => scuba_vlo,
  MPI_BURST => scuba_vlo,
  MPI_BDIP => scuba_vlo,
  MPI_ADDR_14 => scuba_vlo,
  MPI_ADDR_15 => scuba_vlo,
  MPI_ADDR_16 => scuba_vlo,
  MPI_ADDR_17 => scuba_vlo,
  MPI_ADDR_18 => scuba_vlo,
  MPI_ADDR_19 => scuba_vlo,
  MPI_ADDR_20 => scuba_vlo,
  MPI_ADDR_21 => scuba_vlo,
  MPI_ADDR_22 => scuba_vlo,
  MPI_ADDR_23 => scuba_vlo,
  MPI_ADDR_24 => scuba_vlo,
  MPI_ADDR_25 => scuba_vlo,
  MPI_ADDR_26 => scuba_vlo,
  MPI_ADDR_27 => scuba_vlo,
  MPI_ADDR_28 => scuba_vlo,
  MPI_ADDR_29 => scuba_vlo,
  MPI_ADDR_30 => scuba_vlo,
  MPI_ADDR_31 => scuba_vlo,
  MPI_WR_DATA_31 => scuba_vlo,
  MPI_WR_DATA_30 => scuba_vlo,
  MPI_WR_DATA_29 => scuba_vlo,
  MPI_WR_DATA_28 => scuba_vlo,
  MPI_WR_DATA_27 => scuba_vlo,
  MPI_WR_DATA_26 => scuba_vlo,
  MPI_WR_DATA_25 => scuba_vlo,
  MPI_WR_DATA_24 => scuba_vlo,
  MPI_WR_DATA_23 => scuba_vlo,
  MPI_WR_DATA_22 => scuba_vlo,
  MPI_WR_DATA_21 => scuba_vlo,
  MPI_WR_DATA_20 => scuba_vlo,
  MPI_WR_DATA_19 => scuba_vlo,
  MPI_WR_DATA_18 => scuba_vlo,
  MPI_WR_DATA_17 => scuba_vlo,
  MPI_WR_DATA_16 => scuba_vlo,
  MPI_WR_PARITY_3 => scuba_vlo,
  MPI_WR_PARITY_2 => scuba_vlo,
  MPI_WR_DATA_15 => scuba_vlo,
  MPI_WR_DATA_14 => scuba_vlo,
  MPI_WR_DATA_13 => scuba_vlo,
  MPI_WR_DATA_12 => scuba_vlo,
  MPI_WR_DATA_11 => scuba_vlo,
  MPI_WR_DATA_10 => scuba_vlo,
  MPI_WR_DATA_9 => scuba_vlo,
  MPI_WR_DATA_8 => scuba_vlo,
  MPI_WR_PARITY_1 => scuba_vlo,
  MPI_WR_DATA_7 => scuba_vlo,
  MPI_WR_DATA_6 => scuba_vlo,
  MPI_WR_DATA_5 => scuba_vlo,
  MPI_WR_DATA_4 => scuba_vlo,
  MPI_WR_DATA_3 => scuba_vlo,
  MPI_WR_DATA_2 => scuba_vlo,
  MPI_WR_DATA_1 => scuba_vlo,
  MPI_WR_DATA_0 => scuba_vlo,
  MPI_WR_PARITY_0 => scuba_vlo,
  MPI_RST_N => scuba_vlo,
  MPI_RD_DATA_31 => open,
  MPI_RD_DATA_30 => open,
  MPI_RD_DATA_29 => open,
  MPI_RD_DATA_28 => open,
  MPI_RD_DATA_27 => open,
  MPI_RD_DATA_26 => open,
  MPI_RD_DATA_25 => open,
  MPI_RD_DATA_24 => open,
  MPI_RD_DATA_23 => open,
  MPI_RD_DATA_22 => open,
  MPI_RD_DATA_21 => open,
  MPI_RD_DATA_20 => open,
  MPI_RD_DATA_19 => open,
  MPI_RD_DATA_18 => open,
  MPI_RD_DATA_17 => open,
  MPI_RD_DATA_16 => open,
  MPI_RD_PARITY_3 => open,
  MPI_RD_PARITY_2 => open,
  MPI_RD_DATA_15 => open,
  MPI_RD_DATA_14 => open,
  MPI_RD_DATA_13 => open,
  MPI_RD_DATA_12 => open,
  MPI_RD_DATA_11 => open,
  MPI_RD_DATA_10 => open,
  MPI_RD_DATA_9 => open,
  MPI_RD_DATA_8 => open,
  MPI_RD_PARITY_1 => open,
  MPI_RD_DATA_7 => open,
  MPI_RD_DATA_6 => open,
  MPI_RD_DATA_5 => open,
  MPI_RD_DATA_4 => open,
  MPI_RD_DATA_3 => open,
  MPI_RD_DATA_2 => open,
  MPI_RD_DATA_1 => open,
  MPI_RD_DATA_0 => open,
  MPI_RD_PARITY_0 => open,
  PD2_0_TS => open,
  PD7_3_TS => open,
  PD15_8_TS => open,
  PD31_16_TS => open,
  MPI_DP_TS_0 => open,
  MPI_DP_TS_1 => open,
  MPI_DP_TS_2 => open,
  MPI_IRQ_N => open,
  MPI_CNTL_TS => open,
  MPI_TA => open,
  MPI_RETRY => open,
  MPI_TEA => open,
#endif
#if _sys_clock == "USER"
  USR_CLK => usr_clk,
#else
  USR_CLK => scuba_vlo,
#endif
  USER_IRQ_IN => usr_irq_in,
  USER_IRQ_OUT => usr_irq_out,
  HCLK_CIB => sync_clk,
#if _enable_smi == 1
#if _enable_smi_port_0x7f0 == 1
  SMI_RDATA_63 => smi_rdata_0x7f0,
#else
  SMI_RDATA_63 => scuba_vlo,
#endif
#if _enable_smi_port_0x7e0 == 1
  SMI_RDATA_62 => smi_rdata_0x7e0,
#else
  SMI_RDATA_62 => scuba_vlo,
#endif
#if _enable_smi_port_0x7d0 == 1
  SMI_RDATA_61 => smi_rdata_0x7d0,
#else
  SMI_RDATA_61 => scuba_vlo,
#endif
#if _enable_smi_port_0x7c0 == 1
  SMI_RDATA_60 => smi_rdata_0x7c0,
#else
  SMI_RDATA_60 => scuba_vlo,
#endif
#if _enable_smi_port_0x7b0 == 1
  SMI_RDATA_59 => smi_rdata_0x7b0,
#else
  SMI_RDATA_59 => scuba_vlo,
#endif
#if _enable_smi_port_0x7a0 == 1
  SMI_RDATA_58 => smi_rdata_0x7a0,
#else
  SMI_RDATA_58 => scuba_vlo,
#endif
#if _enable_smi_port_0x790 == 1
  SMI_RDATA_57 => smi_rdata_0x790,
#else
  SMI_RDATA_57 => scuba_vlo,
#endif
#if _enable_smi_port_0x780 == 1
  SMI_RDATA_56 => smi_rdata_0x780,
#else
  SMI_RDATA_56 => scuba_vlo,
#endif
#if _enable_smi_port_0x770 == 1
  SMI_RDATA_55 => smi_rdata_0x770,
#else
  SMI_RDATA_55 => scuba_vlo,
#endif
#if _enable_smi_port_0x760 == 1
  SMI_RDATA_54 => smi_rdata_0x760,
#else
  SMI_RDATA_54 => scuba_vlo,
#endif
#if _enable_smi_port_0x750 == 1
  SMI_RDATA_53 => smi_rdata_0x750,
#else
  SMI_RDATA_53 => scuba_vlo,
#endif
#if _enable_smi_port_0x740 == 1
  SMI_RDATA_52 => smi_rdata_0x740,
#else
  SMI_RDATA_52 => scuba_vlo,
#endif
#if _enable_smi_port_0x730 == 1
  SMI_RDATA_51 => smi_rdata_0x730,
#else
  SMI_RDATA_51 => scuba_vlo,
#endif
#if _enable_smi_port_0x720 == 1
  SMI_RDATA_50 => smi_rdata_0x720,
#else
  SMI_RDATA_50 => scuba_vlo,
#endif
#if _enable_smi_port_0x710 == 1
  SMI_RDATA_49 => smi_rdata_0x710,
#else
  SMI_RDATA_49 => scuba_vlo,
#endif
#if _enable_smi_port_0x700 == 1
  SMI_RDATA_48 => smi_rdata_0x700,
#else
  SMI_RDATA_48 => scuba_vlo,
#endif
#if _enable_smi_port_0x6f0 == 1
  SMI_RDATA_47 => smi_rdata_0x6f0,
#else
  SMI_RDATA_47 => scuba_vlo,
#endif
#if _enable_smi_port_0x6e0 == 1
  SMI_RDATA_46 => smi_rdata_0x6e0,
#else
  SMI_RDATA_46 => scuba_vlo,
#endif
#if _enable_smi_port_0x6d0 == 1
  SMI_RDATA_45 => smi_rdata_0x6d0,
#else
  SMI_RDATA_45 => scuba_vlo,
#endif
#if _enable_smi_port_0x6c0 == 1
  SMI_RDATA_44 => smi_rdata_0x6c0,
#else
  SMI_RDATA_44 => scuba_vlo,
#endif
#if _enable_smi_port_0x6b0 == 1
  SMI_RDATA_43 => smi_rdata_0x6b0,
#else
  SMI_RDATA_43 => scuba_vlo,
#endif
#if _enable_smi_port_0x6a0 == 1
  SMI_RDATA_42 => smi_rdata_0x6a0,
#else
  SMI_RDATA_42 => scuba_vlo,
#endif
#if _enable_smi_port_0x690 == 1
  SMI_RDATA_41 => smi_rdata_0x690,
#else
  SMI_RDATA_41 => scuba_vlo,
#endif
#if _enable_smi_port_0x680 == 1
  SMI_RDATA_40 => smi_rdata_0x680,
#else
  SMI_RDATA_40 => scuba_vlo,
#endif
#if _enable_smi_port_0x670 == 1
  SMI_RDATA_39 => smi_rdata_0x670,
#else
  SMI_RDATA_39 => scuba_vlo,
#endif
#if _enable_smi_port_0x660 == 1
  SMI_RDATA_38 => smi_rdata_0x660,
#else
  SMI_RDATA_38 => scuba_vlo,
#endif
#if _enable_smi_port_0x650 == 1
  SMI_RDATA_37 => smi_rdata_0x650,
#else
  SMI_RDATA_37 => scuba_vlo,
#endif
#if _enable_smi_port_0x640 == 1
  SMI_RDATA_36 => smi_rdata_0x640,
#else
  SMI_RDATA_36 => scuba_vlo,
#endif
#if _enable_smi_port_0x630 == 1
  SMI_RDATA_35 => smi_rdata_0x630,
#else
  SMI_RDATA_35 => scuba_vlo,
#endif
#if _enable_smi_port_0x620 == 1
  SMI_RDATA_34 => smi_rdata_0x620,
#else
  SMI_RDATA_34 => scuba_vlo,
#endif
#if _enable_smi_port_0x610 == 1
  SMI_RDATA_33 => smi_rdata_0x610,
#else
  SMI_RDATA_33 => scuba_vlo,
#endif
#if _enable_smi_port_0x600 == 1
  SMI_RDATA_32 => smi_rdata_0x600,
#else
  SMI_RDATA_32 => scuba_vlo,
#endif
#if _enable_smi_port_0x5f0 == 1
  SMI_RDATA_31 => smi_rdata_0x5f0,
#else
  SMI_RDATA_31 => scuba_vlo,
#endif
#if _enable_smi_port_0x5e0 == 1
  SMI_RDATA_30 => smi_rdata_0x5e0,
#else
  SMI_RDATA_30 => scuba_vlo,
#endif
#if _enable_smi_port_0x5d0 == 1
  SMI_RDATA_29 => smi_rdata_0x5d0,
#else
  SMI_RDATA_29 => scuba_vlo,
#endif
#if _enable_smi_port_0x5c0 == 1
  SMI_RDATA_28 => smi_rdata_0x5c0,
#else
  SMI_RDATA_28 => scuba_vlo,
#endif
#if _enable_smi_port_0x5b0 == 1
  SMI_RDATA_27 => smi_rdata_0x5b0,
#else
  SMI_RDATA_27 => scuba_vlo,
#endif
#if _enable_smi_port_0x5a0 == 1
  SMI_RDATA_26 => smi_rdata_0x5a0,
#else
  SMI_RDATA_26 => scuba_vlo,
#endif
#if _enable_smi_port_0x590 == 1
  SMI_RDATA_25 => smi_rdata_0x590,
#else
  SMI_RDATA_25 => scuba_vlo,
#endif
#if _enable_smi_port_0x580 == 1
  SMI_RDATA_24 => smi_rdata_0x580,
#else
  SMI_RDATA_24 => scuba_vlo,
#endif
#if _enable_smi_port_0x570 == 1
  SMI_RDATA_23 => smi_rdata_0x570,
#else
  SMI_RDATA_23 => scuba_vlo,
#endif
#if _enable_smi_port_0x560 == 1
  SMI_RDATA_22 => smi_rdata_0x560,
#else
  SMI_RDATA_22 => scuba_vlo,
#endif
#if _enable_smi_port_0x550 == 1
  SMI_RDATA_21 => smi_rdata_0x550,
#else
  SMI_RDATA_21 => scuba_vlo,
#endif
#if _enable_smi_port_0x540 == 1
  SMI_RDATA_20 => smi_rdata_0x540,
#else
  SMI_RDATA_20 => scuba_vlo,
#endif
#if _enable_smi_port_0x530 == 1
  SMI_RDATA_19 => smi_rdata_0x530,
#else
  SMI_RDATA_19 => scuba_vlo,
#endif
#if _enable_smi_port_0x520 == 1
  SMI_RDATA_18 => smi_rdata_0x520,
#else
  SMI_RDATA_18 => scuba_vlo,
#endif
#if _enable_smi_port_0x510 == 1
  SMI_RDATA_17 => smi_rdata_0x510,
#else
  SMI_RDATA_17 => scuba_vlo,
#endif
#if _enable_smi_port_0x500 == 1
  SMI_RDATA_16 => smi_rdata_0x500,
#else
  SMI_RDATA_16 => scuba_vlo,
#endif
#if _enable_smi_port_0x4f0 == 1
  SMI_RDATA_15 => smi_rdata_0x4f0,
#else
  SMI_RDATA_15 => scuba_vlo,
#endif
#if _enable_smi_port_0x4e0 == 1
  SMI_RDATA_14 => smi_rdata_0x4e0,
#else
  SMI_RDATA_14 => scuba_vlo,
#endif
#if _enable_smi_port_0x4d0 == 1
  SMI_RDATA_13 => smi_rdata_0x4d0,
#else
  SMI_RDATA_13 => scuba_vlo,
#endif
#if _enable_smi_port_0x4c0 == 1
  SMI_RDATA_12 => smi_rdata_0x4c0,
#else
  SMI_RDATA_12 => scuba_vlo,
#endif
#if _enable_smi_port_0x4b0 == 1
  SMI_RDATA_11 => smi_rdata_0x4b0,
#else
  SMI_RDATA_11 => scuba_vlo,
#endif
#if _enable_smi_port_0x4a0 == 1
  SMI_RDATA_10 => smi_rdata_0x4a0,
#else
  SMI_RDATA_10 => scuba_vlo,
#endif
#if _enable_smi_port_0x490 == 1
  SMI_RDATA_9 => smi_rdata_0x490,
#else
  SMI_RDATA_9 => scuba_vlo,
#endif
#if _enable_smi_port_0x480 == 1
  SMI_RDATA_8 => smi_rdata_0x480,
#else
  SMI_RDATA_8 => scuba_vlo,
#endif
#if _enable_smi_port_0x470 == 1
  SMI_RDATA_7 => smi_rdata_0x470,
#else
  SMI_RDATA_7 => scuba_vlo,
#endif
#if _enable_smi_port_0x460 == 1
  SMI_RDATA_6 => smi_rdata_0x460,
#else
  SMI_RDATA_6 => scuba_vlo,
#endif
#if _enable_smi_port_0x450 == 1
  SMI_RDATA_5 => smi_rdata_0x450,
#else
  SMI_RDATA_5 => scuba_vlo,
#endif
#if _enable_smi_port_0x440 == 1
  SMI_RDATA_4 => smi_rdata_0x440,
#else
  SMI_RDATA_4 => scuba_vlo,
#endif
#if _enable_smi_port_0x430 == 1
  SMI_RDATA_3 => smi_rdata_0x430,
#else
  SMI_RDATA_3 => scuba_vlo,
#endif
#if _enable_smi_port_0x420 == 1
  SMI_RDATA_2 => smi_rdata_0x420,
#else
  SMI_RDATA_2 => scuba_vlo,
#endif
#if _enable_smi_port_0x410 == 1
  SMI_RDATA_1 => smi_rdata_0x410,
#else
  SMI_RDATA_1 => scuba_vlo,
#endif
  SMI_RDATA_0 => scuba_vlo,
  SMI_ADDR_9 => smi_addr(9),
  SMI_ADDR_8 => smi_addr(8),
  SMI_ADDR_7 => smi_addr(7),
  SMI_ADDR_6 => smi_addr(6),
  SMI_ADDR_5 => smi_addr(5),
  SMI_ADDR_4 => smi_addr(4),
  SMI_ADDR_3 => smi_addr(3),
  SMI_ADDR_2 => smi_addr(2),
  SMI_ADDR_1 => smi_addr(1),
  SMI_ADDR_0 => smi_addr(0),
  SMI_CLK => smi_clk,
  SMI_RD => smi_rd,
  SMI_RST_N => smi_rst_n,
  SMI_WDATA => smi_wdata,
  SMI_WR => smi_wr,
#elif _enable_smi == 0
  SMI_RDATA_63 => scuba_vlo,
  SMI_RDATA_62 => scuba_vlo,
  SMI_RDATA_61 => scuba_vlo,
  SMI_RDATA_60 => scuba_vlo,
  SMI_RDATA_59 => scuba_vlo,
  SMI_RDATA_58 => scuba_vlo,
  SMI_RDATA_57 => scuba_vlo,
  SMI_RDATA_56 => scuba_vlo,
  SMI_RDATA_55 => scuba_vlo,
  SMI_RDATA_54 => scuba_vlo,
  SMI_RDATA_53 => scuba_vlo,
  SMI_RDATA_52 => scuba_vlo,
  SMI_RDATA_51 => scuba_vlo,
  SMI_RDATA_50 => scuba_vlo,
  SMI_RDATA_49 => scuba_vlo,
  SMI_RDATA_48 => scuba_vlo,
  SMI_RDATA_47 => scuba_vlo,
  SMI_RDATA_46 => scuba_vlo,
  SMI_RDATA_45 => scuba_vlo,
  SMI_RDATA_44 => scuba_vlo,
  SMI_RDATA_43 => scuba_vlo,
  SMI_RDATA_42 => scuba_vlo,
  SMI_RDATA_41 => scuba_vlo,
  SMI_RDATA_40 => scuba_vlo,
  SMI_RDATA_39 => scuba_vlo,
  SMI_RDATA_38 => scuba_vlo,
  SMI_RDATA_37 => scuba_vlo,
  SMI_RDATA_36 => scuba_vlo,
  SMI_RDATA_35 => scuba_vlo,
  SMI_RDATA_34 => scuba_vlo,
  SMI_RDATA_33 => scuba_vlo,
  SMI_RDATA_32 => scuba_vlo,
  SMI_RDATA_31 => scuba_vlo,
  SMI_RDATA_30 => scuba_vlo,
  SMI_RDATA_29 => scuba_vlo,
  SMI_RDATA_28 => scuba_vlo,
  SMI_RDATA_27 => scuba_vlo,
  SMI_RDATA_26 => scuba_vlo,
  SMI_RDATA_25 => scuba_vlo,
  SMI_RDATA_24 => scuba_vlo,
  SMI_RDATA_23 => scuba_vlo,
  SMI_RDATA_22 => scuba_vlo,
  SMI_RDATA_21 => scuba_vlo,
  SMI_RDATA_20 => scuba_vlo,
  SMI_RDATA_19 => scuba_vlo,
  SMI_RDATA_18 => scuba_vlo,
  SMI_RDATA_17 => scuba_vlo,
  SMI_RDATA_16 => scuba_vlo,
  SMI_RDATA_15 => scuba_vlo,
  SMI_RDATA_14 => scuba_vlo,
  SMI_RDATA_13 => scuba_vlo,
  SMI_RDATA_12 => scuba_vlo,
  SMI_RDATA_11 => scuba_vlo,
  SMI_RDATA_10 => scuba_vlo,
  SMI_RDATA_9 => scuba_vlo,
  SMI_RDATA_8 => scuba_vlo,
  SMI_RDATA_7 => scuba_vlo,
  SMI_RDATA_6 => scuba_vlo,
  SMI_RDATA_5 => scuba_vlo,
  SMI_RDATA_4 => scuba_vlo,
  SMI_RDATA_3 => scuba_vlo,
  SMI_RDATA_2 => scuba_vlo,
  SMI_RDATA_1 => scuba_vlo,
  SMI_RDATA_0 => scuba_vlo,
  SMI_ADDR_9 => open,
  SMI_ADDR_8 => open,
  SMI_ADDR_7 => open,
  SMI_ADDR_6 => open,
  SMI_ADDR_5 => open,
  SMI_ADDR_4 => open,
  SMI_ADDR_3 => open,
  SMI_ADDR_2 => open,
  SMI_ADDR_1 => open,
  SMI_ADDR_0 => open,
  SMI_CLK => open,
  SMI_RD => open,
  SMI_RST_N => open,
  SMI_WDATA => open,
  SMI_WR => open,
#endif
#if _enable_umi == 1
#if _enable_orcastra == 1
  FMADDR_17 => umi_addr(17),
  FMADDR_16 => umi_addr(16),
  FMADDR_15 => umi_addr(15),
  FMADDR_14 => umi_addr(14),
  FMADDR_13 => umi_addr(13),
  FMADDR_12 => umi_addr(12),
  FMADDR_11 => umi_addr(11),
  FMADDR_10 => umi_addr(10),
  FMADDR_9 => umi_addr(9),
  FMADDR_8 => umi_addr(8),
  FMADDR_7 => umi_addr(7),
  FMADDR_6 => umi_addr(6),
  FMADDR_5 => umi_addr(5),
  FMADDR_4 => umi_addr(4),
  FMADDR_3 => umi_addr(3),
  FMADDR_2 => umi_addr(2),
  FMADDR_1 => umi_addr(1),
  FMADDR_0 => umi_addr(0),
  FMWDATA_35 => scuba_vlo,
  FMWDATA_34 => scuba_vlo,
  FMWDATA_33 => scuba_vlo,
  FMWDATA_32 => scuba_vlo,
  FMWDATA_31 => umi_wdata(7),
  FMWDATA_30 => umi_wdata(6),
  FMWDATA_29 => umi_wdata(5),
  FMWDATA_28 => umi_wdata(4),
  FMWDATA_27 => umi_wdata(3),
  FMWDATA_26 => umi_wdata(2),
  FMWDATA_25 => umi_wdata(1),
  FMWDATA_24 => umi_wdata(0),
  FMWDATA_23 => umi_wdata(7),
  FMWDATA_22 => umi_wdata(6),
  FMWDATA_21 => umi_wdata(5),
  FMWDATA_20 => umi_wdata(4),
  FMWDATA_19 => umi_wdata(3),
  FMWDATA_18 => umi_wdata(2),
  FMWDATA_17 => umi_wdata(1),
  FMWDATA_16 => umi_wdata(0),
  FMWDATA_15 => umi_wdata(7),
  FMWDATA_14 => umi_wdata(6),
  FMWDATA_13 => umi_wdata(5),
  FMWDATA_12 => umi_wdata(4),
  FMWDATA_11 => umi_wdata(3),
  FMWDATA_10 => umi_wdata(2),
  FMWDATA_9 => umi_wdata(1),
  FMWDATA_8 => umi_wdata(0),
  FMWDATA_7 => umi_wdata(7),
  FMWDATA_6 => umi_wdata(6),
  FMWDATA_5 => umi_wdata(5),
  FMWDATA_4 => umi_wdata(4),
  FMWDATA_3 => umi_wdata(3),
  FMWDATA_2 => umi_wdata(2),
  FMWDATA_1 => umi_wdata(1),
  FMWDATA_0 => umi_wdata(0),
  FMCLK => umi_clk,
  FMRESET_N => rstn,
  FMWRN => umi_wr_n,
  FMBURST => scuba_vlo,
  FMRDY => umi_rdy,
  FMSIZE_1 => scuba_vlo,
  FMSIZE_0 => scuba_vlo,
  FMLOCK => scuba_vlo,
  FMIRQ => scuba_vlo,
  FMRDATA_35 => umi_rdata(35),
  FMRDATA_34 => umi_rdata(34),
  FMRDATA_33 => umi_rdata(33),
  FMRDATA_32 => umi_rdata(32),
  FMRDATA_31 => umi_rdata(31),
  FMRDATA_30 => umi_rdata(30),
  FMRDATA_29 => umi_rdata(29),
  FMRDATA_28 => umi_rdata(28),
  FMRDATA_27 => umi_rdata(27),
  FMRDATA_26 => umi_rdata(26),
  FMRDATA_25 => umi_rdata(25),
  FMRDATA_24 => umi_rdata(24),
  FMRDATA_23 => umi_rdata(23),
  FMRDATA_22 => umi_rdata(22),
  FMRDATA_21 => umi_rdata(21),
  FMRDATA_20 => umi_rdata(20),
  FMRDATA_19 => umi_rdata(19),
  FMRDATA_18 => umi_rdata(18),
  FMRDATA_17 => umi_rdata(17),
  FMRDATA_16 => umi_rdata(16),
  FMRDATA_15 => umi_rdata(15),
  FMRDATA_14 => umi_rdata(14),
  FMRDATA_13 => umi_rdata(13),
  FMRDATA_12 => umi_rdata(12),
  FMRDATA_11 => umi_rdata(11),
  FMRDATA_10 => umi_rdata(10),
  FMRDATA_9 => umi_rdata(9),
  FMRDATA_8 => umi_rdata(8),
  FMRDATA_7 => umi_rdata(7),
  FMRDATA_6 => umi_rdata(6),
  FMRDATA_5 => umi_rdata(5),
  FMRDATA_4 => umi_rdata(4),
  FMRDATA_3 => umi_rdata(3),
  FMRDATA_2 => umi_rdata(2),
  FMRDATA_1 => umi_rdata(1),
  FMRDATA_0 => umi_rdata(0),
  FMACK => umi_ack,
  FMRETRY => umi_retry,
  FMERR => umi_err,
#else
  FMADDR_17 => umi_addr(17),
  FMADDR_16 => umi_addr(16),
  FMADDR_15 => umi_addr(15),
  FMADDR_14 => umi_addr(14),
  FMADDR_13 => umi_addr(13),
  FMADDR_12 => umi_addr(12),
  FMADDR_11 => umi_addr(11),
  FMADDR_10 => umi_addr(10),
  FMADDR_9 => umi_addr(9),
  FMADDR_8 => umi_addr(8),
  FMADDR_7 => umi_addr(7),
  FMADDR_6 => umi_addr(6),
  FMADDR_5 => umi_addr(5),
  FMADDR_4 => umi_addr(4),
  FMADDR_3 => umi_addr(3),
  FMADDR_2 => umi_addr(2),
  FMADDR_1 => umi_addr(1),
  FMADDR_0 => umi_addr(0),
  FMWDATA_35 => umi_wdata(35),
  FMWDATA_34 => umi_wdata(34),
  FMWDATA_33 => umi_wdata(33),
  FMWDATA_32 => umi_wdata(32),
  FMWDATA_31 => umi_wdata(31),
  FMWDATA_30 => umi_wdata(30),
  FMWDATA_29 => umi_wdata(29),
  FMWDATA_28 => umi_wdata(28),
  FMWDATA_27 => umi_wdata(27),
  FMWDATA_26 => umi_wdata(26),
  FMWDATA_25 => umi_wdata(25),
  FMWDATA_24 => umi_wdata(24),
  FMWDATA_23 => umi_wdata(23),
  FMWDATA_22 => umi_wdata(22),
  FMWDATA_21 => umi_wdata(21),
  FMWDATA_20 => umi_wdata(20),
  FMWDATA_19 => umi_wdata(19),
  FMWDATA_18 => umi_wdata(18),
  FMWDATA_17 => umi_wdata(17),
  FMWDATA_16 => umi_wdata(16),
  FMWDATA_15 => umi_wdata(15),
  FMWDATA_14 => umi_wdata(14),
  FMWDATA_13 => umi_wdata(13),
  FMWDATA_12 => umi_wdata(12),
  FMWDATA_11 => umi_wdata(11),
  FMWDATA_10 => umi_wdata(10),
  FMWDATA_9 => umi_wdata(9),
  FMWDATA_8 => umi_wdata(8),
  FMWDATA_7 => umi_wdata(7),
  FMWDATA_6 => umi_wdata(6),
  FMWDATA_5 => umi_wdata(5),
  FMWDATA_4 => umi_wdata(4),
  FMWDATA_3 => umi_wdata(3),
  FMWDATA_2 => umi_wdata(2),
  FMWDATA_1 => umi_wdata(1),
  FMWDATA_0 => umi_wdata(0),
  FMCLK => umi_clk,
  FMRESET_N => umi_rst_n,
  FMWRN => umi_wr_n,
  FMBURST => umi_burst,
  FMRDY => umi_rdy,
  FMSIZE_1 => umi_size(1),
  FMSIZE_0 => umi_size(0),
  FMLOCK => umi_lock,
  FMIRQ => umi_irq,
  FMRDATA_35 => umi_rdata(35),
  FMRDATA_34 => umi_rdata(34),
  FMRDATA_33 => umi_rdata(33),
  FMRDATA_32 => umi_rdata(32),
  FMRDATA_31 => umi_rdata(31),
  FMRDATA_30 => umi_rdata(30),
  FMRDATA_29 => umi_rdata(29),
  FMRDATA_28 => umi_rdata(28),
  FMRDATA_27 => umi_rdata(27),
  FMRDATA_26 => umi_rdata(26),
  FMRDATA_25 => umi_rdata(25),
  FMRDATA_24 => umi_rdata(24),
  FMRDATA_23 => umi_rdata(23),
  FMRDATA_22 => umi_rdata(22),
  FMRDATA_21 => umi_rdata(21),
  FMRDATA_20 => umi_rdata(20),
  FMRDATA_19 => umi_rdata(19),
  FMRDATA_18 => umi_rdata(18),
  FMRDATA_17 => umi_rdata(17),
  FMRDATA_16 => umi_rdata(16),
  FMRDATA_15 => umi_rdata(15),
  FMRDATA_14 => umi_rdata(14),
  FMRDATA_13 => umi_rdata(13),
  FMRDATA_12 => umi_rdata(12),
  FMRDATA_11 => umi_rdata(11),
  FMRDATA_10 => umi_rdata(10),
  FMRDATA_9 => umi_rdata(9),
  FMRDATA_8 => umi_rdata(8),
  FMRDATA_7 => umi_rdata(7),
  FMRDATA_6 => umi_rdata(6),
  FMRDATA_5 => umi_rdata(5),
  FMRDATA_4 => umi_rdata(4),
  FMRDATA_3 => umi_rdata(3),
  FMRDATA_2 => umi_rdata(2),
  FMRDATA_1 => umi_rdata(1),
  FMRDATA_0 => umi_rdata(0),
  FMACK => umi_ack,
  FMRETRY => umi_retry,
  FMERR => umi_err,
#endif
#elif _enable_umi == 0
  FMADDR_17 => scuba_vlo,
  FMADDR_16 => scuba_vlo,
  FMADDR_15 => scuba_vlo,
  FMADDR_14 => scuba_vlo,
  FMADDR_13 => scuba_vlo,
  FMADDR_12 => scuba_vlo,
  FMADDR_11 => scuba_vlo,
  FMADDR_10 => scuba_vlo,
  FMADDR_9 => scuba_vlo,
  FMADDR_8 => scuba_vlo,
  FMADDR_7 => scuba_vlo,
  FMADDR_6 => scuba_vlo,
  FMADDR_5 => scuba_vlo,
  FMADDR_4 => scuba_vlo,
  FMADDR_3 => scuba_vlo,
  FMADDR_2 => scuba_vlo,
  FMADDR_1 => scuba_vlo,
  FMADDR_0 => scuba_vlo,
  FMWDATA_35 => scuba_vlo,
  FMWDATA_34 => scuba_vlo,
  FMWDATA_33 => scuba_vlo,
  FMWDATA_32 => scuba_vlo,
  FMWDATA_31 => scuba_vlo,
  FMWDATA_30 => scuba_vlo,
  FMWDATA_29 => scuba_vlo,
  FMWDATA_28 => scuba_vlo,
  FMWDATA_27 => scuba_vlo,
  FMWDATA_26 => scuba_vlo,
  FMWDATA_25 => scuba_vlo,
  FMWDATA_24 => scuba_vlo,
  FMWDATA_23 => scuba_vlo,
  FMWDATA_22 => scuba_vlo,
  FMWDATA_21 => scuba_vlo,
  FMWDATA_20 => scuba_vlo,
  FMWDATA_19 => scuba_vlo,
  FMWDATA_18 => scuba_vlo,
  FMWDATA_17 => scuba_vlo,
  FMWDATA_16 => scuba_vlo,
  FMWDATA_15 => scuba_vlo,
  FMWDATA_14 => scuba_vlo,
  FMWDATA_13 => scuba_vlo,
  FMWDATA_12 => scuba_vlo,
  FMWDATA_11 => scuba_vlo,
  FMWDATA_10 => scuba_vlo,
  FMWDATA_9 => scuba_vlo,
  FMWDATA_8 => scuba_vlo,
  FMWDATA_7 => scuba_vlo,
  FMWDATA_6 => scuba_vlo,
  FMWDATA_5 => scuba_vlo,
  FMWDATA_4 => scuba_vlo,
  FMWDATA_3 => scuba_vlo,
  FMWDATA_2 => scuba_vlo,
  FMWDATA_1 => scuba_vlo,
  FMWDATA_0 => scuba_vlo,
  FMCLK => scuba_vlo,
  FMRESET_N => scuba_vlo,
  FMWRN => scuba_vlo,
  FMBURST => scuba_vlo,
  FMRDY => scuba_vlo,
  FMSIZE_1 => scuba_vlo,
  FMSIZE_0 => scuba_vlo,
  FMLOCK => scuba_vlo,
  FMIRQ => scuba_vlo,
  FMRDATA_35 => open,
  FMRDATA_34 => open,
  FMRDATA_33 => open,
  FMRDATA_32 => open,
  FMRDATA_31 => open,
  FMRDATA_30 => open,
  FMRDATA_29 => open,
  FMRDATA_28 => open,
  FMRDATA_27 => open,
  FMRDATA_26 => open,
  FMRDATA_25 => open,
  FMRDATA_24 => open,
  FMRDATA_23 => open,
  FMRDATA_22 => open,
  FMRDATA_21 => open,
  FMRDATA_20 => open,
  FMRDATA_19 => open,
  FMRDATA_18 => open,
  FMRDATA_17 => open,
  FMRDATA_16 => open,
  FMRDATA_15 => open,
  FMRDATA_14 => open,
  FMRDATA_13 => open,
  FMRDATA_12 => open,
  FMRDATA_11 => open,
  FMRDATA_10 => open,
  FMRDATA_9 => open,
  FMRDATA_8 => open,
  FMRDATA_7 => open,
  FMRDATA_6 => open,
  FMRDATA_5 => open,
  FMRDATA_4 => open,
  FMRDATA_3 => open,
  FMRDATA_2 => open,
  FMRDATA_1 => open,
  FMRDATA_0 => open,
  FMACK => open,
  FMRETRY => open,
  FMERR => open,
#endif
#if _enable_usi == 1
  FSRDATA_35 => usi_rdata(35),
  FSRDATA_34 => usi_rdata(34),
  FSRDATA_33 => usi_rdata(33),
  FSRDATA_32 => usi_rdata(32),
  FSRDATA_31 => usi_rdata(31),
  FSRDATA_30 => usi_rdata(30),
  FSRDATA_29 => usi_rdata(29),
  FSRDATA_28 => usi_rdata(28),
  FSRDATA_27 => usi_rdata(27),
  FSRDATA_26 => usi_rdata(26),
  FSRDATA_25 => usi_rdata(25),
  FSRDATA_24 => usi_rdata(24),
  FSRDATA_23 => usi_rdata(23),
  FSRDATA_22 => usi_rdata(22),
  FSRDATA_21 => usi_rdata(21),
  FSRDATA_20 => usi_rdata(20),
  FSRDATA_19 => usi_rdata(19),
  FSRDATA_18 => usi_rdata(18),
  FSRDATA_17 => usi_rdata(17),
  FSRDATA_16 => usi_rdata(16),
  FSRDATA_15 => usi_rdata(15),
  FSRDATA_14 => usi_rdata(14),
  FSRDATA_13 => usi_rdata(13),
  FSRDATA_12 => usi_rdata(12),
  FSRDATA_11 => usi_rdata(11),
  FSRDATA_10 => usi_rdata(10),
  FSRDATA_9 => usi_rdata(9),
  FSRDATA_8 => usi_rdata(8),
  FSRDATA_7 => usi_rdata(7),
  FSRDATA_6 => usi_rdata(6),
  FSRDATA_5 => usi_rdata(5),
  FSRDATA_4 => usi_rdata(4),
  FSRDATA_3 => usi_rdata(3),
  FSRDATA_2 => usi_rdata(2),
  FSRDATA_1 => usi_rdata(1),
  FSRDATA_0 => usi_rdata(0),
  FSCLK => usi_clk,
  FSRESET_N => usi_rst_n,
  FSACK => usi_ack,
  FSRETRY => usi_retry,
  FSERR => usi_err,
  FSIRQ => usi_irq,
  FSWDATA_35 => usi_wdata(35),
  FSWDATA_34 => usi_wdata(34),
  FSWDATA_33 => usi_wdata(33),
  FSWDATA_32 => usi_wdata(32),
  FSWDATA_31 => usi_wdata(31),
  FSWDATA_30 => usi_wdata(30),
  FSWDATA_29 => usi_wdata(29),
  FSWDATA_28 => usi_wdata(28),
  FSWDATA_27 => usi_wdata(27),
  FSWDATA_26 => usi_wdata(26),
  FSWDATA_25 => usi_wdata(25),
  FSWDATA_24 => usi_wdata(24),
  FSWDATA_23 => usi_wdata(23),
  FSWDATA_22 => usi_wdata(22),
  FSWDATA_21 => usi_wdata(21),
  FSWDATA_20 => usi_wdata(20),
  FSWDATA_19 => usi_wdata(19),
  FSWDATA_18 => usi_wdata(18),
  FSWDATA_17 => usi_wdata(17),
  FSWDATA_16 => usi_wdata(16),
  FSWDATA_15 => usi_wdata(15),
  FSWDATA_14 => usi_wdata(14),
  FSWDATA_13 => usi_wdata(13),
  FSWDATA_12 => usi_wdata(12),
  FSWDATA_11 => usi_wdata(11),
  FSWDATA_10 => usi_wdata(10),
  FSWDATA_9 => usi_wdata(9),
  FSWDATA_8 => usi_wdata(8),
  FSWDATA_7 => usi_wdata(7),
  FSWDATA_6 => usi_wdata(6),
  FSWDATA_5 => usi_wdata(5),
  FSWDATA_4 => usi_wdata(4),
  FSWDATA_3 => usi_wdata(3),
  FSWDATA_2 => usi_wdata(2),
  FSWDATA_1 => usi_wdata(1),
  FSWDATA_0 => usi_wdata(0),
  FSADDR_17 => usi_addr(17),
  FSADDR_16 => usi_addr(16),
  FSADDR_15 => usi_addr(15),
  FSADDR_14 => usi_addr(14),
  FSADDR_13 => usi_addr(13),
  FSADDR_12 => usi_addr(12),
  FSADDR_11 => usi_addr(11),
  FSADDR_10 => usi_addr(10),
  FSADDR_9 => usi_addr(9),
  FSADDR_8 => usi_addr(8),
  FSADDR_7 => usi_addr(7),
  FSADDR_6 => usi_addr(6),
  FSADDR_5 => usi_addr(5),
  FSADDR_4 => usi_addr(4),
  FSADDR_3 => usi_addr(3),
  FSADDR_2 => usi_addr(2),
  FSADDR_1 => usi_addr(1),
  FSADDR_0 => usi_addr(0),
  FSRDY => usi_rdy,
  FSWRN => usi_wr_n,
  FSSIZE_1 => usi_size(1),
  FSSIZE_0 => usi_size(0),
#elif _enable_usi == 0
  FSRDATA_35 => scuba_vlo,
  FSRDATA_34 => scuba_vlo,
  FSRDATA_33 => scuba_vlo,
  FSRDATA_32 => scuba_vlo,
  FSRDATA_31 => scuba_vlo,
  FSRDATA_30 => scuba_vlo,
  FSRDATA_29 => scuba_vlo,
  FSRDATA_28 => scuba_vlo,
  FSRDATA_27 => scuba_vlo,
  FSRDATA_26 => scuba_vlo,
  FSRDATA_25 => scuba_vlo,
  FSRDATA_24 => scuba_vlo,
  FSRDATA_23 => scuba_vlo,
  FSRDATA_22 => scuba_vlo,
  FSRDATA_21 => scuba_vlo,
  FSRDATA_20 => scuba_vlo,
  FSRDATA_19 => scuba_vlo,
  FSRDATA_18 => scuba_vlo,
  FSRDATA_17 => scuba_vlo,
  FSRDATA_16 => scuba_vlo,
  FSRDATA_15 => scuba_vlo,
  FSRDATA_14 => scuba_vlo,
  FSRDATA_13 => scuba_vlo,
  FSRDATA_12 => scuba_vlo,
  FSRDATA_11 => scuba_vlo,
  FSRDATA_10 => scuba_vlo,
  FSRDATA_9 => scuba_vlo,
  FSRDATA_8 => scuba_vlo,
  FSRDATA_7 => scuba_vlo,
  FSRDATA_6 => scuba_vlo,
  FSRDATA_5 => scuba_vlo,
  FSRDATA_4 => scuba_vlo,
  FSRDATA_3 => scuba_vlo,
  FSRDATA_2 => scuba_vlo,
  FSRDATA_1 => scuba_vlo,
  FSRDATA_0 => scuba_vlo,
  FSCLK => scuba_vlo,
  FSRESET_N => scuba_vlo,
  FSACK => scuba_vlo,
  FSRETRY => scuba_vlo,
  FSERR => scuba_vlo,
  FSIRQ => scuba_vlo,
  FSWDATA_35 => open,
  FSWDATA_34 => open,
  FSWDATA_33 => open,
  FSWDATA_32 => open,
  FSWDATA_31 => open,
  FSWDATA_30 => open,
  FSWDATA_29 => open,
  FSWDATA_28 => open,
  FSWDATA_27 => open,
  FSWDATA_26 => open,
  FSWDATA_25 => open,
  FSWDATA_24 => open,
  FSWDATA_23 => open,
  FSWDATA_22 => open,
  FSWDATA_21 => open,
  FSWDATA_20 => open,
  FSWDATA_19 => open,
  FSWDATA_18 => open,
  FSWDATA_17 => open,
  FSWDATA_16 => open,
  FSWDATA_15 => open,
  FSWDATA_14 => open,
  FSWDATA_13 => open,
  FSWDATA_12 => open,
  FSWDATA_11 => open,
  FSWDATA_10 => open,
  FSWDATA_9 => open,
  FSWDATA_8 => open,
  FSWDATA_7 => open,
  FSWDATA_6 => open,
  FSWDATA_5 => open,
  FSWDATA_4 => open,
  FSWDATA_3 => open,
  FSWDATA_2 => open,
  FSWDATA_1 => open,
  FSWDATA_0 => open,
  FSADDR_17 => open,
  FSADDR_16 => open,
  FSADDR_15 => open,
  FSADDR_14 => open,
  FSADDR_13 => open,
  FSADDR_12 => open,
  FSADDR_11 => open,
  FSADDR_10 => open,
  FSADDR_9 => open,
  FSADDR_8 => open,
  FSADDR_7 => open,
  FSADDR_6 => open,
  FSADDR_5 => open,
  FSADDR_4 => open,
  FSADDR_3 => open,
  FSADDR_2 => open,
  FSADDR_1 => open,
  FSADDR_0 => open,
  FSRDY => open,
  FSWRN => open,
  FSSIZE_1 => open,
  FSSIZE_0 => open,
#endif
  HADDR_LASBM_17 => scuba_vlo,
  HADDR_LASBM_16 => scuba_vlo,
  HADDR_LASBM_15 => scuba_vlo,
  HADDR_LASBM_14 => scuba_vlo,
  HADDR_LASBM_13 => scuba_vlo,
  HADDR_LASBM_12 => scuba_vlo,
  HADDR_LASBM_11 => scuba_vlo,
  HADDR_LASBM_10 => scuba_vlo,
  HADDR_LASBM_9 => scuba_vlo,
  HADDR_LASBM_8 => scuba_vlo,
  HADDR_LASBM_7 => scuba_vlo,
  HADDR_LASBM_6 => scuba_vlo,
  HADDR_LASBM_5 => scuba_vlo,
  HADDR_LASBM_4 => scuba_vlo,
  HADDR_LASBM_3 => scuba_vlo,
  HADDR_LASBM_2 => scuba_vlo,
  HADDR_LASBM_1 => scuba_vlo,
  HADDR_LASBM_0 => scuba_vlo,
  HSIZE_LASBM_1 => scuba_vlo,
  HSIZE_LASBM_0 => scuba_vlo,
  HTRANS_LASBM_1 => scuba_vlo,
  HTRANS_LASBM_0 => scuba_vlo,
  HWDATA_LASBM_35 => scuba_vlo,
  HWDATA_LASBM_34 => scuba_vlo,
  HWDATA_LASBM_33 => scuba_vlo,
  HWDATA_LASBM_32 => scuba_vlo,
  HWDATA_LASBM_31 => scuba_vlo,
  HWDATA_LASBM_30 => scuba_vlo,
  HWDATA_LASBM_29 => scuba_vlo,
  HWDATA_LASBM_28 => scuba_vlo,
  HWDATA_LASBM_27 => scuba_vlo,
  HWDATA_LASBM_26 => scuba_vlo,
  HWDATA_LASBM_25 => scuba_vlo,
  HWDATA_LASBM_24 => scuba_vlo,
  HWDATA_LASBM_23 => scuba_vlo,
  HWDATA_LASBM_22 => scuba_vlo,
  HWDATA_LASBM_21 => scuba_vlo,
  HWDATA_LASBM_20 => scuba_vlo,
  HWDATA_LASBM_19 => scuba_vlo,
  HWDATA_LASBM_18 => scuba_vlo,
  HWDATA_LASBM_17 => scuba_vlo,
  HWDATA_LASBM_16 => scuba_vlo,
  HWDATA_LASBM_15 => scuba_vlo,
  HWDATA_LASBM_14 => scuba_vlo,
  HWDATA_LASBM_13 => scuba_vlo,
  HWDATA_LASBM_12 => scuba_vlo,
  HWDATA_LASBM_11 => scuba_vlo,
  HWDATA_LASBM_10 => scuba_vlo,
  HWDATA_LASBM_9 => scuba_vlo,
  HWDATA_LASBM_8 => scuba_vlo,
  HWDATA_LASBM_7 => scuba_vlo,
  HWDATA_LASBM_6 => scuba_vlo,
  HWDATA_LASBM_5 => scuba_vlo,
  HWDATA_LASBM_4 => scuba_vlo,
  HWDATA_LASBM_3 => scuba_vlo,
  HWDATA_LASBM_2 => scuba_vlo,
  HWDATA_LASBM_1 => scuba_vlo,
  HWDATA_LASBM_0 => scuba_vlo,
  HBURST_LASBM => scuba_vlo,
  HWRITE_LASBM => scuba_vlo,
  LASB_CLK => scuba_vlo,
  LASB_GSR => scuba_vlo,
  LASB_IRQ_MASTER => scuba_vlo,
  HRDATA_LASBM_35 => open,
  HRDATA_LASBM_34 => open,
  HRDATA_LASBM_33 => open,
  HRDATA_LASBM_32 => open,
  HRDATA_LASBM_31 => open,
  HRDATA_LASBM_30 => open,
  HRDATA_LASBM_29 => open,
  HRDATA_LASBM_28 => open,
  HRDATA_LASBM_27 => open,
  HRDATA_LASBM_26 => open,
  HRDATA_LASBM_25 => open,
  HRDATA_LASBM_24 => open,
  HRDATA_LASBM_23 => open,
  HRDATA_LASBM_22 => open,
  HRDATA_LASBM_21 => open,
  HRDATA_LASBM_20 => open,
  HRDATA_LASBM_19 => open,
  HRDATA_LASBM_18 => open,
  HRDATA_LASBM_17 => open,
  HRDATA_LASBM_16 => open,
  HRDATA_LASBM_15 => open,
  HRDATA_LASBM_14 => open,
  HRDATA_LASBM_13 => open,
  HRDATA_LASBM_12 => open,
  HRDATA_LASBM_11 => open,
  HRDATA_LASBM_10 => open,
  HRDATA_LASBM_9 => open,
  HRDATA_LASBM_8 => open,
  HRDATA_LASBM_7 => open,
  HRDATA_LASBM_6 => open,
  HRDATA_LASBM_5 => open,
  HRDATA_LASBM_4 => open,
  HRDATA_LASBM_3 => open,
  HRDATA_LASBM_2 => open,
  HRDATA_LASBM_1 => open,
  HRDATA_LASBM_0 => open,
  HRESP_LASBM_1 => open,
  HRESP_LASBM_0 => open,
  HCLK_LASB => open,
  HREADY_LASB => open,
  HRESET_N_LASB => open,
  LASB_DONE => open,
  LASB_GSR_N => open,
  LASB_IRQ_OUT => open,
  HADDR_RASBM_17 => scuba_vlo,
  HADDR_RASBM_16 => scuba_vlo,
  HADDR_RASBM_15 => scuba_vlo,
  HADDR_RASBM_14 => scuba_vlo,
  HADDR_RASBM_13 => scuba_vlo,
  HADDR_RASBM_12 => scuba_vlo,
  HADDR_RASBM_11 => scuba_vlo,
  HADDR_RASBM_10 => scuba_vlo,
  HADDR_RASBM_9 => scuba_vlo,
  HADDR_RASBM_8 => scuba_vlo,
  HADDR_RASBM_7 => scuba_vlo,
  HADDR_RASBM_6 => scuba_vlo,
  HADDR_RASBM_5 => scuba_vlo,
  HADDR_RASBM_4 => scuba_vlo,
  HADDR_RASBM_3 => scuba_vlo,
  HADDR_RASBM_2 => scuba_vlo,
  HADDR_RASBM_1 => scuba_vlo,
  HADDR_RASBM_0 => scuba_vlo,
  HSIZE_RASBM_1 => scuba_vlo,
  HSIZE_RASBM_0 => scuba_vlo,
  HTRANS_RASBM_1 => scuba_vlo,
  HTRANS_RASBM_0 => scuba_vlo,
  HWDATA_RASBM_35 => scuba_vlo,
  HWDATA_RASBM_34 => scuba_vlo,
  HWDATA_RASBM_33 => scuba_vlo,
  HWDATA_RASBM_32 => scuba_vlo,
  HWDATA_RASBM_31 => scuba_vlo,
  HWDATA_RASBM_30 => scuba_vlo,
  HWDATA_RASBM_29 => scuba_vlo,
  HWDATA_RASBM_28 => scuba_vlo,
  HWDATA_RASBM_27 => scuba_vlo,
  HWDATA_RASBM_26 => scuba_vlo,
  HWDATA_RASBM_25 => scuba_vlo,
  HWDATA_RASBM_24 => scuba_vlo,
  HWDATA_RASBM_23 => scuba_vlo,
  HWDATA_RASBM_22 => scuba_vlo,
  HWDATA_RASBM_21 => scuba_vlo,
  HWDATA_RASBM_20 => scuba_vlo,
  HWDATA_RASBM_19 => scuba_vlo,
  HWDATA_RASBM_18 => scuba_vlo,
  HWDATA_RASBM_17 => scuba_vlo,
  HWDATA_RASBM_16 => scuba_vlo,
  HWDATA_RASBM_15 => scuba_vlo,
  HWDATA_RASBM_14 => scuba_vlo,
  HWDATA_RASBM_13 => scuba_vlo,
  HWDATA_RASBM_12 => scuba_vlo,
  HWDATA_RASBM_11 => scuba_vlo,
  HWDATA_RASBM_10 => scuba_vlo,
  HWDATA_RASBM_9 => scuba_vlo,
  HWDATA_RASBM_8 => scuba_vlo,
  HWDATA_RASBM_7 => scuba_vlo,
  HWDATA_RASBM_6 => scuba_vlo,
  HWDATA_RASBM_5 => scuba_vlo,
  HWDATA_RASBM_4 => scuba_vlo,
  HWDATA_RASBM_3 => scuba_vlo,
  HWDATA_RASBM_2 => scuba_vlo,
  HWDATA_RASBM_1 => scuba_vlo,
  HWDATA_RASBM_0 => scuba_vlo,
  HBURST_RASBM => scuba_vlo,
  HWRITE_RASBM => scuba_vlo,
  RASB_CLK => scuba_vlo,
  RASB_GSR => scuba_vlo,
  RASB_IRQ_MASTER => scuba_vlo,
  HRDATA_RASBM_35 => open,
  HRDATA_RASBM_34 => open,
  HRDATA_RASBM_33 => open,
  HRDATA_RASBM_32 => open,
  HRDATA_RASBM_31 => open,
  HRDATA_RASBM_30 => open,
  HRDATA_RASBM_29 => open,
  HRDATA_RASBM_28 => open,
  HRDATA_RASBM_27 => open,
  HRDATA_RASBM_26 => open,
  HRDATA_RASBM_25 => open,
  HRDATA_RASBM_24 => open,
  HRDATA_RASBM_23 => open,
  HRDATA_RASBM_22 => open,
  HRDATA_RASBM_21 => open,
  HRDATA_RASBM_20 => open,
  HRDATA_RASBM_19 => open,
  HRDATA_RASBM_18 => open,
  HRDATA_RASBM_17 => open,
  HRDATA_RASBM_16 => open,
  HRDATA_RASBM_15 => open,
  HRDATA_RASBM_14 => open,
  HRDATA_RASBM_13 => open,
  HRDATA_RASBM_12 => open,
  HRDATA_RASBM_11 => open,
  HRDATA_RASBM_10 => open,
  HRDATA_RASBM_9 => open,
  HRDATA_RASBM_8 => open,
  HRDATA_RASBM_7 => open,
  HRDATA_RASBM_6 => open,
  HRDATA_RASBM_5 => open,
  HRDATA_RASBM_4 => open,
  HRDATA_RASBM_3 => open,
  HRDATA_RASBM_2 => open,
  HRDATA_RASBM_1 => open,
  HRDATA_RASBM_0 => open,
  HRESP_RASBM_1 => open,
  HRESP_RASBM_0 => open,
  HCLK_RASB => open,
  HREADY_RASB => open,
  HRESET_N_RASB => open,
  RASB_DONE => open,
  RASB_GSR_N => open,
  RASB_IRQ_OUT => open,
#if _dma_interface == 1
#if _enable_mpi == 1
#if _bus_width == 32
  DMA_RD_DATA_31 => dfa_rd_data(31),
  DMA_RD_DATA_30 => dfa_rd_data(30),
  DMA_RD_DATA_29 => dfa_rd_data(29),
  DMA_RD_DATA_28 => dfa_rd_data(28),
  DMA_RD_DATA_27 => dfa_rd_data(27),
  DMA_RD_DATA_26 => dfa_rd_data(26),
  DMA_RD_DATA_25 => dfa_rd_data(25),
  DMA_RD_DATA_24 => dfa_rd_data(24),
  DMA_RD_DATA_23 => dfa_rd_data(23),
  DMA_RD_DATA_22 => dfa_rd_data(22),
  DMA_RD_DATA_21 => dfa_rd_data(21),
  DMA_RD_DATA_20 => dfa_rd_data(20),
  DMA_RD_DATA_19 => dfa_rd_data(19),
  DMA_RD_DATA_18 => dfa_rd_data(18),
  DMA_RD_DATA_17 => dfa_rd_data(17),
  DMA_RD_DATA_16 => dfa_rd_data(16),
  DMA_RD_DATA_15 => dfa_rd_data(15),
  DMA_RD_DATA_14 => dfa_rd_data(14),
  DMA_RD_DATA_13 => dfa_rd_data(13),
  DMA_RD_DATA_12 => dfa_rd_data(12),
  DMA_RD_DATA_11 => dfa_rd_data(11),
  DMA_RD_DATA_10 => dfa_rd_data(10),
  DMA_RD_DATA_9 => dfa_rd_data(9),
  DMA_RD_DATA_8 => dfa_rd_data(8),
  DMA_RD_DATA_7 => dfa_rd_data(7),
  DMA_RD_DATA_6 => dfa_rd_data(6),
  DMA_RD_DATA_5 => dfa_rd_data(5),
  DMA_RD_DATA_4 => dfa_rd_data(4),
  DMA_RD_DATA_3 => dfa_rd_data(3),
  DMA_RD_DATA_2 => dfa_rd_data(2),
  DMA_RD_DATA_1 => dfa_rd_data(1),
  DMA_RD_DATA_0 => dfa_rd_data(0),
  DMA_RD_PARITY_3 => dfa_rd_parity(3),
  DMA_RD_PARITY_2 => dfa_rd_parity(2),
  DMA_RD_PARITY_1 => dfa_rd_parity(1),
  DMA_RD_PARITY_0 => dfa_rd_parity(0),
#elif _bus_width == 16
  DMA_RD_DATA_31 => scuba_vlo,
  DMA_RD_DATA_30 => scuba_vlo,
  DMA_RD_DATA_29 => scuba_vlo,
  DMA_RD_DATA_28 => scuba_vlo,
  DMA_RD_DATA_27 => scuba_vlo,
  DMA_RD_DATA_26 => scuba_vlo,
  DMA_RD_DATA_25 => scuba_vlo,
  DMA_RD_DATA_24 => scuba_vlo,
  DMA_RD_DATA_23 => scuba_vlo,
  DMA_RD_DATA_22 => scuba_vlo,
  DMA_RD_DATA_21 => scuba_vlo,
  DMA_RD_DATA_20 => scuba_vlo,
  DMA_RD_DATA_19 => scuba_vlo,
  DMA_RD_DATA_18 => scuba_vlo,
  DMA_RD_DATA_17 => scuba_vlo,
  DMA_RD_DATA_16 => scuba_vlo,
  DMA_RD_DATA_15 => dfa_rd_data(15),
  DMA_RD_DATA_14 => dfa_rd_data(14),
  DMA_RD_DATA_13 => dfa_rd_data(13),
  DMA_RD_DATA_12 => dfa_rd_data(12),
  DMA_RD_DATA_11 => dfa_rd_data(11),
  DMA_RD_DATA_10 => dfa_rd_data(10),
  DMA_RD_DATA_9 => dfa_rd_data(9),
  DMA_RD_DATA_8 => dfa_rd_data(8),
  DMA_RD_DATA_7 => dfa_rd_data(7),
  DMA_RD_DATA_6 => dfa_rd_data(6),
  DMA_RD_DATA_5 => dfa_rd_data(5),
  DMA_RD_DATA_4 => dfa_rd_data(4),
  DMA_RD_DATA_3 => dfa_rd_data(3),
  DMA_RD_DATA_2 => dfa_rd_data(2),
  DMA_RD_DATA_1 => dfa_rd_data(1),
  DMA_RD_DATA_0 => dfa_rd_data(0),
  DMA_RD_PARITY_3 => scuba_vlo,
  DMA_RD_PARITY_2 => scuba_vlo,
  DMA_RD_PARITY_1 => dfa_rd_parity(1),
  DMA_RD_PARITY_0 => dfa_rd_parity(0),
#elif _bus_width == 8
  DMA_RD_DATA_31 => scuba_vlo,
  DMA_RD_DATA_30 => scuba_vlo,
  DMA_RD_DATA_29 => scuba_vlo,
  DMA_RD_DATA_28 => scuba_vlo,
  DMA_RD_DATA_27 => scuba_vlo,
  DMA_RD_DATA_26 => scuba_vlo,
  DMA_RD_DATA_25 => scuba_vlo,
  DMA_RD_DATA_24 => scuba_vlo,
  DMA_RD_DATA_23 => scuba_vlo,
  DMA_RD_DATA_22 => scuba_vlo,
  DMA_RD_DATA_21 => scuba_vlo,
  DMA_RD_DATA_20 => scuba_vlo,
  DMA_RD_DATA_19 => scuba_vlo,
  DMA_RD_DATA_18 => scuba_vlo,
  DMA_RD_DATA_17 => scuba_vlo,
  DMA_RD_DATA_16 => scuba_vlo,
  DMA_RD_DATA_15 => scuba_vlo,
  DMA_RD_DATA_14 => scuba_vlo,
  DMA_RD_DATA_13 => scuba_vlo,
  DMA_RD_DATA_12 => scuba_vlo,
  DMA_RD_DATA_11 => scuba_vlo,
  DMA_RD_DATA_10 => scuba_vlo,
  DMA_RD_DATA_9 => scuba_vlo,
  DMA_RD_DATA_8 => scuba_vlo,
  DMA_RD_DATA_7 => dfa_rd_data(7),
  DMA_RD_DATA_6 => dfa_rd_data(6),
  DMA_RD_DATA_5 => dfa_rd_data(5),
  DMA_RD_DATA_4 => dfa_rd_data(4),
  DMA_RD_DATA_3 => dfa_rd_data(3),
  DMA_RD_DATA_2 => dfa_rd_data(2),
  DMA_RD_DATA_1 => dfa_rd_data(1),
  DMA_RD_DATA_0 => dfa_rd_data(0),
  DMA_RD_PARITY_3 => scuba_vlo,
  DMA_RD_PARITY_2 => scuba_vlo,
  DMA_RD_PARITY_1 => scuba_vlo,
  DMA_RD_PARITY_0 => dfa_rd_parity,
#endif
  DMA_RETRY => dfa_retry,
  DMA_TA => dfa_ta,
  DMA_TEA => dfa_tea,
  DMA_TRI_CTL => dfa_tri_ctl,
  DMA_TRI_DATA => dfa_tri_data,
#elif _enable_mpi == 0
  DMA_RD_DATA_31 => scuba_vlo,
  DMA_RD_DATA_30 => scuba_vlo,
  DMA_RD_DATA_29 => scuba_vlo,
  DMA_RD_DATA_28 => scuba_vlo,
  DMA_RD_DATA_27 => scuba_vlo,
  DMA_RD_DATA_26 => scuba_vlo,
  DMA_RD_DATA_25 => scuba_vlo,
  DMA_RD_DATA_24 => scuba_vlo,
  DMA_RD_DATA_23 => scuba_vlo,
  DMA_RD_DATA_22 => scuba_vlo,
  DMA_RD_DATA_21 => scuba_vlo,
  DMA_RD_DATA_20 => scuba_vlo,
  DMA_RD_DATA_19 => scuba_vlo,
  DMA_RD_DATA_18 => scuba_vlo,
  DMA_RD_DATA_17 => scuba_vlo,
  DMA_RD_DATA_16 => scuba_vlo,
  DMA_RD_DATA_15 => scuba_vlo,
  DMA_RD_DATA_14 => scuba_vlo,
  DMA_RD_DATA_13 => scuba_vlo,
  DMA_RD_DATA_12 => scuba_vlo,
  DMA_RD_DATA_11 => scuba_vlo,
  DMA_RD_DATA_10 => scuba_vlo,
  DMA_RD_DATA_9 => scuba_vlo,
  DMA_RD_DATA_8 => scuba_vlo,
  DMA_RD_DATA_7 => scuba_vlo,
  DMA_RD_DATA_6 => scuba_vlo,
  DMA_RD_DATA_5 => scuba_vlo,
  DMA_RD_DATA_4 => scuba_vlo,
  DMA_RD_DATA_3 => scuba_vlo,
  DMA_RD_DATA_2 => scuba_vlo,
  DMA_RD_DATA_1 => scuba_vlo,
  DMA_RD_DATA_0 => scuba_vlo,
  DMA_RD_PARITY_3 => scuba_vlo,
  DMA_RD_PARITY_2 => scuba_vlo,
  DMA_RD_PARITY_1 => scuba_vlo,
  DMA_RD_PARITY_0 => scuba_vlo,
  DMA_RETRY => scuba_vlo,
  DMA_TA => scuba_vlo,
  DMA_TEA => scuba_vlo,
  DMA_TRI_CTL => scuba_vlo,
  DMA_TRI_DATA => scuba_vlo,
#endif
#elif _dma_interface == 0
  DMA_RD_DATA_31 => scuba_vlo,
  DMA_RD_DATA_30 => scuba_vlo,
  DMA_RD_DATA_29 => scuba_vlo,
  DMA_RD_DATA_28 => scuba_vlo,
  DMA_RD_DATA_27 => scuba_vlo,
  DMA_RD_DATA_26 => scuba_vlo,
  DMA_RD_DATA_25 => scuba_vlo,
  DMA_RD_DATA_24 => scuba_vlo,
  DMA_RD_DATA_23 => scuba_vlo,
  DMA_RD_DATA_22 => scuba_vlo,
  DMA_RD_DATA_21 => scuba_vlo,
  DMA_RD_DATA_20 => scuba_vlo,
  DMA_RD_DATA_19 => scuba_vlo,
  DMA_RD_DATA_18 => scuba_vlo,
  DMA_RD_DATA_17 => scuba_vlo,
  DMA_RD_DATA_16 => scuba_vlo,
  DMA_RD_DATA_15 => scuba_vlo,
  DMA_RD_DATA_14 => scuba_vlo,
  DMA_RD_DATA_13 => scuba_vlo,
  DMA_RD_DATA_12 => scuba_vlo,
  DMA_RD_DATA_11 => scuba_vlo,
  DMA_RD_DATA_10 => scuba_vlo,
  DMA_RD_DATA_9 => scuba_vlo,
  DMA_RD_DATA_8 => scuba_vlo,
  DMA_RD_DATA_7 => scuba_vlo,
  DMA_RD_DATA_6 => scuba_vlo,
  DMA_RD_DATA_5 => scuba_vlo,
  DMA_RD_DATA_4 => scuba_vlo,
  DMA_RD_DATA_3 => scuba_vlo,
  DMA_RD_DATA_2 => scuba_vlo,
  DMA_RD_DATA_1 => scuba_vlo,
  DMA_RD_DATA_0 => scuba_vlo,
  DMA_RD_PARITY_3 => scuba_vlo,
  DMA_RD_PARITY_2 => scuba_vlo,
  DMA_RD_PARITY_1 => scuba_vlo,
  DMA_RD_PARITY_0 => scuba_vlo,
  DMA_RETRY => scuba_vlo,
  DMA_TA => scuba_vlo,
  DMA_TEA => scuba_vlo,
  DMA_TRI_CTL => scuba_vlo,
  DMA_TRI_DATA => scuba_vlo,
#endif
#if _enable_multi_align == 1
  EXT_CLK_P1_IN => mca_clk_p1_in,
  EXT_CLK_P2_IN => mca_clk_p2_in,
  EXT_DONE_IN => mca_done_in,
  EXT_CLK_P1_OUT => mca_clk_p1_out,
  EXT_CLK_P2_OUT => mca_clk_p2_out,
  EXT_DONE_OUT => mca_done_out,
#elif _enable_multi_align == 0
  EXT_CLK_P1_IN => scuba_vlo,
  EXT_CLK_P2_IN => scuba_vlo,
  EXT_DONE_IN => scuba_vlo,
  EXT_CLK_P1_OUT => open,
  EXT_CLK_P2_OUT => open,
  EXT_DONE_OUT => open,
#endif
#if _enable_lpcs_0 == 1
  LPCS_C_0 => pcs360_out(0),
  LPCS_C_1 => pcs360_out(1),
  LPCS_C_2 => pcs360_out(2),
  LPCS_C_3 => pcs360_out(3),
  LPCS_Q_0 => pcs360_out(4),
  LPCS_QUAD_ID0_0 => pcs360_out(5),
  LPCS_QUAD_ID0_1 => pcs360_out(6),
#elif _enable_lpcs_0 == 0
  LPCS_C_0 => open,
  LPCS_C_1 => open,
  LPCS_C_2 => open,
  LPCS_C_3 => open,
  LPCS_Q_0 => open,
  LPCS_QUAD_ID0_0 => open,
  LPCS_QUAD_ID0_1 => open,
#endif
#if _enable_lpcs_1 == 1
  LPCS_C_4 => pcs361_out(0),
  LPCS_C_5 => pcs361_out(1),
  LPCS_C_6 => pcs361_out(2),
  LPCS_C_7 => pcs361_out(3),
  LPCS_Q_1 => pcs361_out(4),
  LPCS_QUAD_ID1_0 => pcs361_out(5),
  LPCS_QUAD_ID1_1 => pcs361_out(6),
#elif _enable_lpcs_1 == 0
  LPCS_C_4 => open,
  LPCS_C_5 => open,
  LPCS_C_6 => open,
  LPCS_C_7 => open,
  LPCS_Q_1 => open,
  LPCS_QUAD_ID1_0 => open,
  LPCS_QUAD_ID1_1 => open,
#endif
#if _enable_lpcs_2 == 1
  LPCS_C_8 => pcs362_out(0),
  LPCS_C_9 => pcs362_out(1),
  LPCS_C_10 => pcs362_out(2),
  LPCS_C_11 => pcs362_out(3),
  LPCS_Q_2 => pcs362_out(4),
  LPCS_QUAD_ID2_0 => pcs362_out(5),
  LPCS_QUAD_ID2_1 => pcs362_out(6),
#elif _enable_lpcs_2 == 0
  LPCS_C_8 => open,
  LPCS_C_9 => open,
  LPCS_C_10 => open,
  LPCS_C_11 => open,
  LPCS_Q_2 => open,
  LPCS_QUAD_ID2_0 => open,
  LPCS_QUAD_ID2_1 => open,
#endif
#if _enable_lpcs_3 == 1
  LPCS_C_12 => pcs363_out(0),
  LPCS_C_13 => pcs363_out(1),
  LPCS_C_14 => pcs363_out(2),
  LPCS_C_15 => pcs363_out(3),
  LPCS_Q_3 => pcs363_out(4),
  LPCS_QUAD_ID3_0 => pcs363_out(5),
  LPCS_QUAD_ID3_1 => pcs363_out(6),
#elif _enable_lpcs_3 == 0
  LPCS_C_12 => open,
  LPCS_C_13 => open,
  LPCS_C_14 => open,
  LPCS_C_15 => open,
  LPCS_Q_3 => open,
  LPCS_QUAD_ID3_0 => open,
  LPCS_QUAD_ID3_1 => open,
#endif
#if _enable_rpcs_0 == 1
  RPCS_C_0 => pcs3e0_out(0),
  RPCS_C_1 => pcs3e0_out(1),
  RPCS_C_2 => pcs3e0_out(2),
  RPCS_C_3 => pcs3e0_out(3),
  RPCS_Q_0 => pcs3e0_out(4),
  RPCS_QUAD_ID0_0 => pcs3e0_out(5),
  RPCS_QUAD_ID0_1 => pcs3e0_out(6),
#elif _enable_rpcs_0 == 0
  RPCS_C_0 => open,
  RPCS_C_1 => open,
  RPCS_C_2 => open,
  RPCS_C_3 => open,
  RPCS_Q_0 => open,
  RPCS_QUAD_ID0_0 => open,
  RPCS_QUAD_ID0_1 => open,
#endif
#if _enable_rpcs_1 == 1
  RPCS_C_4 => pcs3e1_out(0),
  RPCS_C_5 => pcs3e1_out(1),
  RPCS_C_6 => pcs3e1_out(2),
  RPCS_C_7 => pcs3e1_out(3),
  RPCS_Q_1 => pcs3e1_out(4),
  RPCS_QUAD_ID1_0 => pcs3e1_out(5),
  RPCS_QUAD_ID1_1 => pcs3e1_out(6),
#elif _enable_rpcs_1 == 0
  RPCS_C_4 => open,
  RPCS_C_5 => open,
  RPCS_C_6 => open,
  RPCS_C_7 => open,
  RPCS_Q_1 => open,
  RPCS_QUAD_ID1_0 => open,
  RPCS_QUAD_ID1_1 => open,
#endif
#if _enable_rpcs_2 == 1
  RPCS_C_8 => pcs3e2_out(0),
  RPCS_C_9 => pcs3e2_out(1),
  RPCS_C_10 => pcs3e2_out(2),
  RPCS_C_11 => pcs3e2_out(3),
  RPCS_Q_2 => pcs3e2_out(4),
  RPCS_QUAD_ID2_0 => pcs3e2_out(5),
  RPCS_QUAD_ID2_1 => pcs3e2_out(6),
#elif _enable_rpcs_2 == 0
  RPCS_C_8 => open,
  RPCS_C_9 => open,
  RPCS_C_10 => open,
  RPCS_C_11 => open,
  RPCS_Q_2 => open,
  RPCS_QUAD_ID2_0 => open,
  RPCS_QUAD_ID2_1 => open,
#endif
#if _enable_rpcs_3 == 1
  RPCS_C_12 => pcs3e3_out(0),
  RPCS_C_13 => pcs3e3_out(1),
  RPCS_C_14 => pcs3e3_out(2),
  RPCS_C_15 => pcs3e3_out(3),
  RPCS_Q_3 => pcs3e3_out(4),
  RPCS_QUAD_ID3_0 => pcs3e3_out(5),
  RPCS_QUAD_ID3_1 => pcs3e3_out(6),
#elif _enable_rpcs_3 == 0
  RPCS_C_12 => open,
  RPCS_C_13 => open,
  RPCS_C_14 => open,
  RPCS_C_15 => open,
  RPCS_Q_3 => open,
  RPCS_QUAD_ID3_0 => open,
  RPCS_QUAD_ID3_1 => open,
#endif
  LPCS_ADDR_0 => to_lpcsa(0),
  LPCS_ADDR_1 => to_lpcsa(1),
  LPCS_ADDR_2 => to_lpcsa(2),
  LPCS_ADDR_3 => to_lpcsa(3),
  LPCS_ADDR_4 => to_lpcsa(4),
  LPCS_ADDR_5 => to_lpcsa(5),
  LPCS_ADDR_6 => to_lpcsa(6),
  LPCS_ADDR_7 => to_lpcsa(7),
  LPCS_WDATA_0 => to_lpcsa(8),
  LPCS_WDATA_1 => to_lpcsa(9),
  LPCS_WDATA_2 => to_lpcsa(10),
  LPCS_WDATA_3 => to_lpcsa(11),
  LPCS_WDATA_4 => to_lpcsa(12),
  LPCS_WDATA_5 => to_lpcsa(13),
  LPCS_WDATA_6 => to_lpcsa(14),
  LPCS_WDATA_7 => to_lpcsa(15),
  LPCS_RD => to_lpcsa(16),
  LPCS_WSTB => to_lpcsa(17),
  RPCS_ADDR_0 => to_rpcsa(0),
  RPCS_ADDR_1 => to_rpcsa(1),
  RPCS_ADDR_2 => to_rpcsa(2),
  RPCS_ADDR_3 => to_rpcsa(3),
  RPCS_ADDR_4 => to_rpcsa(4),
  RPCS_ADDR_5 => to_rpcsa(5),
  RPCS_ADDR_6 => to_rpcsa(6),
  RPCS_ADDR_7 => to_rpcsa(7),
  RPCS_WDATA_0 => to_rpcsa(8),
  RPCS_WDATA_1 => to_rpcsa(9),
  RPCS_WDATA_2 => to_rpcsa(10),
  RPCS_WDATA_3 => to_rpcsa(11),
  RPCS_WDATA_4 => to_rpcsa(12),
  RPCS_WDATA_5 => to_rpcsa(13),
  RPCS_WDATA_6 => to_rpcsa(14),
  RPCS_WDATA_7 => to_rpcsa(15),
  RPCS_RD => to_rpcsa(16),
  RPCS_WSTB => to_rpcsa(17),
  GRP_CLK_P1_L_0 => to_lpcsa_grp(0),
  GRP_CLK_P1_L_1 => to_lpcsa_grp(1),
  GRP_CLK_P1_L_2 => to_lpcsa_grp(2),
  GRP_CLK_P1_L_3 => to_lpcsa_grp(3),
  GRP_CLK_P2_L_0 => to_lpcsa_grp(4),
  GRP_CLK_P2_L_1 => to_lpcsa_grp(5),
  GRP_CLK_P2_L_2 => to_lpcsa_grp(6),
  GRP_CLK_P2_L_3 => to_lpcsa_grp(7),
  GRP_START_L_0 => to_lpcsa_grp(8),
  GRP_START_L_1 => to_lpcsa_grp(9),
  GRP_START_L_2 => to_lpcsa_grp(10),
  GRP_START_L_3 => to_lpcsa_grp(11),
  GRP_DONE_L_0 => to_lpcsa_grp(12),
  GRP_DONE_L_1 => to_lpcsa_grp(13),
  GRP_DONE_L_2 => to_lpcsa_grp(14),
  GRP_DONE_L_3 => to_lpcsa_grp(15),
  GRP_DESKEW_ERROR_L_0 => to_lpcsa_grp(16),
  GRP_DESKEW_ERROR_L_1 => to_lpcsa_grp(17),
  GRP_DESKEW_ERROR_L_2 => to_lpcsa_grp(18),
  GRP_DESKEW_ERROR_L_3 => to_lpcsa_grp(19),
  GRP_CLK_P1_R_0 => to_rpcsa_grp(0),
  GRP_CLK_P1_R_1 => to_rpcsa_grp(1),
  GRP_CLK_P1_R_2 => to_rpcsa_grp(2),
  GRP_CLK_P1_R_3 => to_rpcsa_grp(3),
  GRP_CLK_P2_R_0 => to_rpcsa_grp(4),
  GRP_CLK_P2_R_1 => to_rpcsa_grp(5),
  GRP_CLK_P2_R_2 => to_rpcsa_grp(6),
  GRP_CLK_P2_R_3 => to_rpcsa_grp(7),
  GRP_START_R_0 => to_rpcsa_grp(8),
  GRP_START_R_1 => to_rpcsa_grp(9),
  GRP_START_R_2 => to_rpcsa_grp(10),
  GRP_START_R_3 => to_rpcsa_grp(11),
  GRP_DONE_R_0 => to_rpcsa_grp(12),
  GRP_DONE_R_1 => to_rpcsa_grp(13),
  GRP_DONE_R_2 => to_rpcsa_grp(14),
  GRP_DONE_R_3 => to_rpcsa_grp(15),
  GRP_DESKEW_ERROR_R_0 => to_rpcsa_grp(16),
  GRP_DESKEW_ERROR_R_1 => to_rpcsa_grp(17),
  GRP_DESKEW_ERROR_R_2 => to_rpcsa_grp(18),
  GRP_DESKEW_ERROR_R_3 => to_rpcsa_grp(19),
#if _enable_lpcs_0 == 1
  LPCS_RDATA_Q0_0 => pcs360_in(0),
  LPCS_RDATA_Q0_1 => pcs360_in(1),
  LPCS_RDATA_Q0_2 => pcs360_in(2),
  LPCS_RDATA_Q0_3 => pcs360_in(3),
  LPCS_RDATA_Q0_4 => pcs360_in(4),
  LPCS_RDATA_Q0_5 => pcs360_in(5),
  LPCS_RDATA_Q0_6 => pcs360_in(6),
  LPCS_RDATA_Q0_7 => pcs360_in(7),
  LPCS_INT_0 => pcs360_in(8),
  QUAD_CLK_0 => pcs360_in(9),
  QUAD_START_0 => pcs360_in(10),
  QUAD_DONE_0 => pcs360_in(11),
  QUAD_AND_FP1_0 => pcs360_in(12),
  QUAD_AND_FP0_0 => pcs360_in(13),
  QUAD_OR_FP1_0 => pcs360_in(14),
  QUAD_OR_FP0_0 => pcs360_in(15),
  QUAD_RST_N_0 => pcs360_in(16),
#elif _enable_lpcs_0 == 0
  LPCS_RDATA_Q0_0 => scuba_vlo,
  LPCS_RDATA_Q0_1 => scuba_vlo,
  LPCS_RDATA_Q0_2 => scuba_vlo,
  LPCS_RDATA_Q0_3 => scuba_vlo,
  LPCS_RDATA_Q0_4 => scuba_vlo,
  LPCS_RDATA_Q0_5 => scuba_vlo,
  LPCS_RDATA_Q0_6 => scuba_vlo,
  LPCS_RDATA_Q0_7 => scuba_vlo,
  LPCS_INT_0 => scuba_vlo,
  QUAD_CLK_0 => scuba_vlo,
  QUAD_START_0 => scuba_vlo,
  QUAD_DONE_0 => scuba_vlo,
  QUAD_AND_FP1_0 => scuba_vlo,
  QUAD_AND_FP0_0 => scuba_vlo,
  QUAD_OR_FP1_0 => scuba_vlo,
  QUAD_OR_FP0_0 => scuba_vlo,
  QUAD_RST_N_0 => scuba_vlo,
#endif
#if _enable_lpcs_1 == 1
  LPCS_RDATA_Q1_0 => pcs361_in(0),
  LPCS_RDATA_Q1_1 => pcs361_in(1),
  LPCS_RDATA_Q1_2 => pcs361_in(2),
  LPCS_RDATA_Q1_3 => pcs361_in(3),
  LPCS_RDATA_Q1_4 => pcs361_in(4),
  LPCS_RDATA_Q1_5 => pcs361_in(5),
  LPCS_RDATA_Q1_6 => pcs361_in(6),
  LPCS_RDATA_Q1_7 => pcs361_in(7),
  LPCS_INT_1 => pcs361_in(8),
  QUAD_CLK_1 => pcs361_in(9),
  QUAD_START_1 => pcs361_in(10),
  QUAD_DONE_1 => pcs361_in(11),
  QUAD_AND_FP1_1 => pcs361_in(12),
  QUAD_AND_FP0_1 => pcs361_in(13),
  QUAD_OR_FP1_1 => pcs361_in(14),
  QUAD_OR_FP0_1 => pcs361_in(15),
  QUAD_RST_N_1 => pcs361_in(16),
#elif _enable_lpcs_1 == 0
  LPCS_RDATA_Q1_0 => scuba_vlo,
  LPCS_RDATA_Q1_1 => scuba_vlo,
  LPCS_RDATA_Q1_2 => scuba_vlo,
  LPCS_RDATA_Q1_3 => scuba_vlo,
  LPCS_RDATA_Q1_4 => scuba_vlo,
  LPCS_RDATA_Q1_5 => scuba_vlo,
  LPCS_RDATA_Q1_6 => scuba_vlo,
  LPCS_RDATA_Q1_7 => scuba_vlo,
  LPCS_INT_1 => scuba_vlo,
  QUAD_CLK_1 => scuba_vlo,
  QUAD_START_1 => scuba_vlo,
  QUAD_DONE_1 => scuba_vlo,
  QUAD_AND_FP1_1 => scuba_vlo,
  QUAD_AND_FP0_1 => scuba_vlo,
  QUAD_OR_FP1_1 => scuba_vlo,
  QUAD_OR_FP0_1 => scuba_vlo,
  QUAD_RST_N_1 => scuba_vlo,
#endif
#if _enable_lpcs_2 == 1
  LPCS_RDATA_Q2_0 => pcs362_in(0),
  LPCS_RDATA_Q2_1 => pcs362_in(1),
  LPCS_RDATA_Q2_2 => pcs362_in(2),
  LPCS_RDATA_Q2_3 => pcs362_in(3),
  LPCS_RDATA_Q2_4 => pcs362_in(4),
  LPCS_RDATA_Q2_5 => pcs362_in(5),
  LPCS_RDATA_Q2_6 => pcs362_in(6),
  LPCS_RDATA_Q2_7 => pcs362_in(7),
  LPCS_INT_2 => pcs362_in(8),
  QUAD_CLK_2 => pcs362_in(9),
  QUAD_START_2 => pcs362_in(10),
  QUAD_DONE_2 => pcs362_in(11),
  QUAD_AND_FP1_2 => pcs362_in(12),
  QUAD_AND_FP0_2 => pcs362_in(13),
  QUAD_OR_FP1_2 => pcs362_in(14),
  QUAD_OR_FP0_2 => pcs362_in(15),
  QUAD_RST_N_2 => pcs362_in(16),
#elif _enable_lpcs_2 == 0
  LPCS_RDATA_Q2_0 => scuba_vlo,
  LPCS_RDATA_Q2_1 => scuba_vlo,
  LPCS_RDATA_Q2_2 => scuba_vlo,
  LPCS_RDATA_Q2_3 => scuba_vlo,
  LPCS_RDATA_Q2_4 => scuba_vlo,
  LPCS_RDATA_Q2_5 => scuba_vlo,
  LPCS_RDATA_Q2_6 => scuba_vlo,
  LPCS_RDATA_Q2_7 => scuba_vlo,
  LPCS_INT_2 => scuba_vlo,
  QUAD_CLK_2 => scuba_vlo,
  QUAD_START_2 => scuba_vlo,
  QUAD_DONE_2 => scuba_vlo,
  QUAD_AND_FP1_2 => scuba_vlo,
  QUAD_AND_FP0_2 => scuba_vlo,
  QUAD_OR_FP1_2 => scuba_vlo,
  QUAD_OR_FP0_2 => scuba_vlo,
  QUAD_RST_N_2 => scuba_vlo,
#endif
#if _enable_lpcs_3 == 1
  LPCS_RDATA_Q3_0 => pcs363_in(0),
  LPCS_RDATA_Q3_1 => pcs363_in(1),
  LPCS_RDATA_Q3_2 => pcs363_in(2),
  LPCS_RDATA_Q3_3 => pcs363_in(3),
  LPCS_RDATA_Q3_4 => pcs363_in(4),
  LPCS_RDATA_Q3_5 => pcs363_in(5),
  LPCS_RDATA_Q3_6 => pcs363_in(6),
  LPCS_RDATA_Q3_7 => pcs363_in(7),
  LPCS_INT_3 => pcs363_in(8),
  QUAD_CLK_3 => pcs363_in(9),
  QUAD_START_3 => pcs363_in(10),
  QUAD_DONE_3 => pcs363_in(11),
  QUAD_AND_FP1_3 => pcs363_in(12),
  QUAD_AND_FP0_3 => pcs363_in(13),
  QUAD_OR_FP1_3 => pcs363_in(14),
  QUAD_OR_FP0_3 => pcs363_in(15),
  QUAD_RST_N_3 => pcs363_in(16),
#elif _enable_lpcs_3 == 0
  LPCS_RDATA_Q3_0 => scuba_vlo,
  LPCS_RDATA_Q3_1 => scuba_vlo,
  LPCS_RDATA_Q3_2 => scuba_vlo,
  LPCS_RDATA_Q3_3 => scuba_vlo,
  LPCS_RDATA_Q3_4 => scuba_vlo,
  LPCS_RDATA_Q3_5 => scuba_vlo,
  LPCS_RDATA_Q3_6 => scuba_vlo,
  LPCS_RDATA_Q3_7 => scuba_vlo,
  LPCS_INT_3 => scuba_vlo,
  QUAD_CLK_3 => scuba_vlo,
  QUAD_START_3 => scuba_vlo,
  QUAD_DONE_3 => scuba_vlo,
  QUAD_AND_FP1_3 => scuba_vlo,
  QUAD_AND_FP0_3 => scuba_vlo,
  QUAD_OR_FP1_3 => scuba_vlo,
  QUAD_OR_FP0_3 => scuba_vlo,
  QUAD_RST_N_3 => scuba_vlo,
#endif
#if _enable_rpcs_0 == 1
  RPCS_RDATA_Q0_0 => pcs3e0_in(0),
  RPCS_RDATA_Q0_1 => pcs3e0_in(1),
  RPCS_RDATA_Q0_2 => pcs3e0_in(2),
  RPCS_RDATA_Q0_3 => pcs3e0_in(3),
  RPCS_RDATA_Q0_4 => pcs3e0_in(4),
  RPCS_RDATA_Q0_5 => pcs3e0_in(5),
  RPCS_RDATA_Q0_6 => pcs3e0_in(6),
  RPCS_RDATA_Q0_7 => pcs3e0_in(7),
  RPCS_INT_0 => pcs3e0_in(8),
  QUAD_CLK_4 => pcs3e0_in(9),
  QUAD_START_4 => pcs3e0_in(10),
  QUAD_DONE_4 => pcs3e0_in(11),
  QUAD_AND_FP1_4 => pcs3e0_in(12),
  QUAD_AND_FP0_4 => pcs3e0_in(13),
  QUAD_OR_FP1_4 => pcs3e0_in(14),
  QUAD_OR_FP0_4 => pcs3e0_in(15),
  QUAD_RST_N_4 => pcs3e0_in(16),
#elif _enable_rpcs_0 == 0
  RPCS_RDATA_Q0_0 => scuba_vlo,
  RPCS_RDATA_Q0_1 => scuba_vlo,
  RPCS_RDATA_Q0_2 => scuba_vlo,
  RPCS_RDATA_Q0_3 => scuba_vlo,
  RPCS_RDATA_Q0_4 => scuba_vlo,
  RPCS_RDATA_Q0_5 => scuba_vlo,
  RPCS_RDATA_Q0_6 => scuba_vlo,
  RPCS_RDATA_Q0_7 => scuba_vlo,
  RPCS_INT_0 => scuba_vlo,
  QUAD_CLK_4 => scuba_vlo,
  QUAD_START_4 => scuba_vlo,
  QUAD_DONE_4 => scuba_vlo,
  QUAD_AND_FP1_4 => scuba_vlo,
  QUAD_AND_FP0_4 => scuba_vlo,
  QUAD_OR_FP1_4 => scuba_vlo,
  QUAD_OR_FP0_4 => scuba_vlo,
  QUAD_RST_N_4 => scuba_vlo,
#endif
#if _enable_rpcs_1 == 1
  RPCS_RDATA_Q1_0 => pcs3e1_in(0),
  RPCS_RDATA_Q1_1 => pcs3e1_in(1),
  RPCS_RDATA_Q1_2 => pcs3e1_in(2),
  RPCS_RDATA_Q1_3 => pcs3e1_in(3),
  RPCS_RDATA_Q1_4 => pcs3e1_in(4),
  RPCS_RDATA_Q1_5 => pcs3e1_in(5),
  RPCS_RDATA_Q1_6 => pcs3e1_in(6),
  RPCS_RDATA_Q1_7 => pcs3e1_in(7),
  RPCS_INT_1 => pcs3e1_in(8),
  QUAD_CLK_5 => pcs3e1_in(9),
  QUAD_START_5 => pcs3e1_in(10),
  QUAD_DONE_5 => pcs3e1_in(11),
  QUAD_AND_FP1_5 => pcs3e1_in(12),
  QUAD_AND_FP0_5 => pcs3e1_in(13),
  QUAD_OR_FP1_5 => pcs3e1_in(14),
  QUAD_OR_FP0_5 => pcs3e1_in(15),
  QUAD_RST_N_5 => pcs3e1_in(16),
#elif _enable_rpcs_1 == 0
  RPCS_RDATA_Q1_0 => scuba_vlo,
  RPCS_RDATA_Q1_1 => scuba_vlo,
  RPCS_RDATA_Q1_2 => scuba_vlo,
  RPCS_RDATA_Q1_3 => scuba_vlo,
  RPCS_RDATA_Q1_4 => scuba_vlo,
  RPCS_RDATA_Q1_5 => scuba_vlo,
  RPCS_RDATA_Q1_6 => scuba_vlo,
  RPCS_RDATA_Q1_7 => scuba_vlo,
  RPCS_INT_1 => scuba_vlo,
  QUAD_CLK_5 => scuba_vlo,
  QUAD_START_5 => scuba_vlo,
  QUAD_DONE_5 => scuba_vlo,
  QUAD_AND_FP1_5 => scuba_vlo,
  QUAD_AND_FP0_5 => scuba_vlo,
  QUAD_OR_FP1_5 => scuba_vlo,
  QUAD_OR_FP0_5 => scuba_vlo,
  QUAD_RST_N_5 => scuba_vlo,
#endif
#if _enable_rpcs_2 == 1
  RPCS_RDATA_Q2_0 => pcs3e2_in(0),
  RPCS_RDATA_Q2_1 => pcs3e2_in(1),
  RPCS_RDATA_Q2_2 => pcs3e2_in(2),
  RPCS_RDATA_Q2_3 => pcs3e2_in(3),
  RPCS_RDATA_Q2_4 => pcs3e2_in(4),
  RPCS_RDATA_Q2_5 => pcs3e2_in(5),
  RPCS_RDATA_Q2_6 => pcs3e2_in(6),
  RPCS_RDATA_Q2_7 => pcs3e2_in(7),
  RPCS_INT_2 => pcs3e2_in(8),
  QUAD_CLK_6 => pcs3e2_in(9),
  QUAD_START_6 => pcs3e2_in(10),
  QUAD_DONE_6 => pcs3e2_in(11),
  QUAD_AND_FP1_6 => pcs3e2_in(12),
  QUAD_AND_FP0_6 => pcs3e2_in(13),
  QUAD_OR_FP1_6 => pcs3e2_in(14),
  QUAD_OR_FP0_6 => pcs3e2_in(15),
  QUAD_RST_N_6 => pcs3e2_in(16),
#elif _enable_rpcs_2 == 0
  RPCS_RDATA_Q2_0 => scuba_vlo,
  RPCS_RDATA_Q2_1 => scuba_vlo,
  RPCS_RDATA_Q2_2 => scuba_vlo,
  RPCS_RDATA_Q2_3 => scuba_vlo,
  RPCS_RDATA_Q2_4 => scuba_vlo,
  RPCS_RDATA_Q2_5 => scuba_vlo,
  RPCS_RDATA_Q2_6 => scuba_vlo,
  RPCS_RDATA_Q2_7 => scuba_vlo,
  RPCS_INT_2 => scuba_vlo,
  QUAD_CLK_6 => scuba_vlo,
  QUAD_START_6 => scuba_vlo,
  QUAD_DONE_6 => scuba_vlo,
  QUAD_AND_FP1_6 => scuba_vlo,
  QUAD_AND_FP0_6 => scuba_vlo,
  QUAD_OR_FP1_6 => scuba_vlo,
  QUAD_OR_FP0_6 => scuba_vlo,
  QUAD_RST_N_6 => scuba_vlo,
#endif
#if _enable_rpcs_3 == 1
  RPCS_RDATA_Q3_0 => pcs3e3_in(0),
  RPCS_RDATA_Q3_1 => pcs3e3_in(1),
  RPCS_RDATA_Q3_2 => pcs3e3_in(2),
  RPCS_RDATA_Q3_3 => pcs3e3_in(3),
  RPCS_RDATA_Q3_4 => pcs3e3_in(4),
  RPCS_RDATA_Q3_5 => pcs3e3_in(5),
  RPCS_RDATA_Q3_6 => pcs3e3_in(6),
  RPCS_RDATA_Q3_7 => pcs3e3_in(7),
  RPCS_INT_3 => pcs3e3_in(8),
  QUAD_CLK_7 => pcs3e3_in(9),
  QUAD_START_7 => pcs3e3_in(10),
  QUAD_DONE_7 => pcs3e3_in(11),
  QUAD_AND_FP1_7 => pcs3e3_in(12),
  QUAD_AND_FP0_7 => pcs3e3_in(13),
  QUAD_OR_FP1_7 => pcs3e3_in(14),
  QUAD_OR_FP0_7 => pcs3e3_in(15),
  QUAD_RST_N_7 => pcs3e3_in(16),
#elif _enable_rpcs_3 == 0
  RPCS_RDATA_Q3_0 => scuba_vlo,
  RPCS_RDATA_Q3_1 => scuba_vlo,
  RPCS_RDATA_Q3_2 => scuba_vlo,
  RPCS_RDATA_Q3_3 => scuba_vlo,
  RPCS_RDATA_Q3_4 => scuba_vlo,
  RPCS_RDATA_Q3_5 => scuba_vlo,
  RPCS_RDATA_Q3_6 => scuba_vlo,
  RPCS_RDATA_Q3_7 => scuba_vlo,
  RPCS_INT_3 => scuba_vlo,
  QUAD_CLK_7 => scuba_vlo,
  QUAD_START_7 => scuba_vlo,
  QUAD_DONE_7 => scuba_vlo,
  QUAD_AND_FP1_7 => scuba_vlo,
  QUAD_AND_FP0_7 => scuba_vlo,
  QUAD_OR_FP1_7 => scuba_vlo,
  QUAD_OR_FP0_7 => scuba_vlo,
  QUAD_RST_N_7 => scuba_vlo,
#endif
  SYS_RST_N => sysbus_rst_n);

#if _enable_umi == 1
#if _enable_orcastra == 1
jtaga_inst : JTAGA port map
             (TCK => tck,
             TDI => tdi,
             TDO => tdo,
             TMS => tms,
             PSROUT1 => PSR_Out1,
             PSROUT2 => scuba_vlo,
             PSROUT3 => scuba_vlo,
             JTDO1 => JTDO,
             JTDO2 => scuba_vlo,
             JTDO3 => scuba_vlo,
             JTDO4 => scuba_vlo,
             JTDO5 => scuba_vlo,
             JTDO6 => scuba_vlo,
             JTDO7 => scuba_vlo,
             JTDO8 => scuba_vlo,
             TRESET => open,
             PSRSFTN => Shift_DR,
             PSRCAP => Capture_DR,
             PSRENABLE1 => PSR_Enable1,
             PSRENABLE2 => open,
             PSRENABLE3 => open,
             SCANENABLE1 => open,
             SCANENABLE2 => open,
             SCANENABLE3 => open,
             SCANENABLE4 => open,
             SCANENABLE5 => open,
             SCANENABLE6 => open,
             SCANENABLE7 => open,
             SCANENABLE8 => open,
             SCANI => open,
             JTCK => JTCK,
             JTDI => JTDI,
             JSHIFT => open,
             JUPDATE => open,
             JRSTN => open,
             JCE1 => open,
             JCE2 => open,
             JCE3 => open,
             JCE4 => open,
             JCE5 => open,
             JCE6 => open,
             JCE7 => open,
             JCE8 => open,
             JRTI1 => open,
             JRTI2 => open,
             JRTI3 => open,
             JRTI4 => open,
             JRTI5 => open,
             JRTI6 => open,
             JRTI7 => open,
             JRTI8 => open);

P1 : PROCESS (JTCK, Capture_DR)
BEGIN
   IF (Capture_DR = '1') THEN
      c <= "00000";
   ELSIF (JTCK'event and JTCK = '1') THEN
      IF ((Shift_DR = '0') and PSR_Enable1 = '1') THEN
         c <= c + 1;
      END IF;
   END IF;
END PROCESS;

P2 : PROCESS (JTCK, rstn)
BEGIN
   IF (rstn = '0') THEN
      PC_Ready <= '0';
      DataInReg <= (others => '0');
      BSRing1 <= (others => '0');
   ELSIF (JTCK'event and JTCK = '1') THEN
      IF (PSR_Enable1 = '1' and Shift_DR = '0') THEN
         IF (c = "11110") THEN
            PC_Ready <= '0';
            DataInReg <= BSRing1(29 downto 3);
         ELSIF (c = "11111") THEN
            PC_Ready <= BSRing1(30);
            BSRing1 <= ("0000000000000000000" & UMackReg & UMackReg & UMretryReg & UMerrReg &
                       umi_rdata(7 downto 0) & '0');
         ELSE
            BSRing1 <= (JTDI & BSRing1(31 downto 1));
         END IF;
      END IF;
   END IF;
END PROCESS;

PSR_Out1 <= BSRing1(0);
umi_wdata <= ("0000" & DataInReg(7 downto 0) & DataInReg(7 downto 0) & DataInReg(7 downto 0) &
             DataInReg(7 downto 0));
umi_addr <= DataInReg(25 downto 8);
PC_Read <= DataInReg(26);
UMset <= (PCready3 and (not PCready4));
UMclear <= ((not PCready3) and PCready4);

P3 : PROCESS (umi_clk, rstn)
BEGIN
   IF (rstn = '0') THEN
      PCready2 <= '0';
      PCready3 <= '0';
      PCready4 <= '0';
      umi_rdy <= '0';
   ELSIF (umi_clk'event and umi_clk = '1') THEN
      PCready2 <= PC_Ready;
      PCready3 <= PCready2;
      PCready4 <= PCready3;
      umi_rdy <= (UMlockI and umi_ack and (not UMready2));
   END IF;
END PROCESS;

P4 : PROCESS (umi_clk, rstn)
BEGIN
   IF (rstn = '0') THEN
      UMready2 <= '0';
   ELSIF (umi_clk'event and umi_clk = '1') THEN
      IF (UMclear = '1') THEN
         UMready2 <= '0';
      ELSIF ((UMlockI and umi_ack) = '1') THEN
         UMready2 <= '1';
      ELSIF ((umi_ack and (not umi_rdy) and UMready2) = '1') THEN
         UMready2 <= '0';
      END IF;
   END IF;
END PROCESS;

P5 : PROCESS (umi_clk, rstn)
BEGIN
   IF (rstn = '0') THEN
      umi_wr_n <= '0';
      UMlockI <= '0';
   ELSIF (umi_clk'event and umi_clk = '1') THEN
      IF (UMclear = '1') THEN
         umi_wr_n <= '0';
         UMlockI <= '0';
      ELSIF (UMset = '1') THEN
         umi_wr_n <= not PC_Read;
         UMlockI <= '1';
      ELSIF ((umi_ack and (not umi_rdy) and UMready2) = '1') THEN
         umi_wr_n <= '0';
         UMlockI <= '0';
      END IF;
   END IF;
END PROCESS;

P6 : PROCESS (umi_clk, rstn)
BEGIN
   IF (rstn = '0') THEN
      UMackReg <= '0';
      UMretryReg <= '0';
      UMerrReg <= '0';
   ELSIF (umi_clk'event and umi_clk = '1') THEN
      IF (UMclear = '1') THEN
         UMackReg <= '0';
         UMretryReg <= '0';
         UMerrReg <= '0';
      ELSIF ((umi_ack and (not umi_rdy) and UMready2) = '1') THEN
         UMackReg <= '1';
         UMretryReg <= umi_retry;
         UMerrReg <= umi_err;
      END IF;
   END IF;
END PROCESS;
#endif
#endif
  
#if _enable_lpcs_0 == 1
  pcs360_out(44 downto 7) <= (to_lpcsa_grp & to_lpcsa);
#endif
#if _enable_lpcs_1 == 1
  pcs361_out(44 downto 7) <= (to_lpcsa_grp & to_lpcsa);
#endif
#if _enable_lpcs_2 == 1
  pcs362_out(44 downto 7) <= (to_lpcsa_grp & to_lpcsa);
#endif
#if _enable_lpcs_3 == 1
  pcs363_out(44 downto 7) <= (to_lpcsa_grp & to_lpcsa);
#endif
#if _enable_rpcs_0 == 1
  pcs3e0_out(44 downto 7) <= (to_rpcsa_grp & to_rpcsa);
#endif
#if _enable_rpcs_1 == 1
  pcs3e1_out(44 downto 7) <= (to_rpcsa_grp & to_rpcsa);
#endif
#if _enable_rpcs_2 == 1
  pcs3e2_out(44 downto 7) <= (to_rpcsa_grp & to_rpcsa);
#endif
#if _enable_rpcs_3 == 1
  pcs3e3_out(44 downto 7) <= (to_rpcsa_grp & to_rpcsa);
#endif

--synopsys translate_off

file_read : PROCESS
VARIABLE open_status : file_open_status;
FILE config : text;
BEGIN
   file_open (open_status, config, USER_CONFIG_FILE, read_mode);
   IF (open_status = name_error) THEN
      report "Auto configuration file for SYSBUSA module not found.  SYSBUSA internal configuration registers required for multi quad PCS alignment will not be initialized correctly during simulation!" 
      severity WARNING;
   END IF;
   wait;
END PROCESS;
--synopsys translate_on

end _circuit_name##_arch ;
#include <sysbus/sysbus.tft>
