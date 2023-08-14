#log _circuit_name.vhd

#define -r SLASH2 --
#macro converter1(arg1,arg2)
#define arg2 arg1##.txt
#endmacro
#converter1(_circuit_name, _circuit_name_new)
#if _freq == "LOW"
#define _MC1_SEL_WIDTH 0
#elif _freq == "MED" || _freq == "HIGH"
#define _MC1_SEL_WIDTH 1
#endif
#if _gsr == "DISABLED"
#define _MC1_GSRN_EN 0
#elif _gsr == "ENABLED"
#define _MC1_GSRN_EN 1
#endif
#if _freq == "LOW" || _freq == "MED"
#define _MC1_REFLOCK_ACC 00
#elif _freq == "HIGH"
#define _MC1_REFLOCK_ACC 01
#endif
#if _refclk_src == "EDGE"
#define _MC1_REFCLK_SEL 0
#elif _refclk_src == "PRIMARY"
#define _MC1_REFCLK_SEL 1
#endif
#if _bus_width == 1
#define _MC1_OUTPUT_WIDTH_ADC 00
#define _MC1_OUTPUT_WIDTH_BEF 00
#elif _bus_width == 2
#define _MC1_OUTPUT_WIDTH_ADC 01
#define _MC1_OUTPUT_WIDTH_BEF 01
#elif _bus_width == 4
#define _MC1_OUTPUT_WIDTH_ADC 11
#define _MC1_OUTPUT_WIDTH_BEF 11
#endif
#define _mib  0s0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111110010 ##_MC1_OUTPUT_WIDTH_BEF##0100111111010000000000000000000000111111110010 ##_MC1_OUTPUT_WIDTH_ADC##01001111111100000000 ##_MC1_REFCLK_SEL##0 ##_MC1_REFLOCK_ACC##_MC1_GSRN_EN##_MC1_SEL_WIDTH

--synopsys translate_off

library lscdr_work;
use lscdr_work.all;
library IEEE;
use IEEE.std_logic_1164.all;

entity LSCDR is
GENERIC(
  MIB_MEM : string  := #_mib
  );
port (
   REFCLK_EDGE      : in std_logic;
   REFCLK_PRIM      : in std_logic;
   RSTN             : in std_logic;
   FORCE_LOCK       : in std_logic;
   MASTER_HOLD      : in std_logic;
   MASTER_LOCK      : out std_logic;
   TEST_CLK         : out std_logic;
   DIN_A0_CIB       : in std_logic;
   DIN_A0_PAD       : in std_logic;
   DIN_A1_CIB       : in std_logic;
   DIN_A1_PAD       : in std_logic;
   DIN_A2_CIB       : in std_logic;
   DIN_A2_PAD       : in std_logic;
   DOUT_A0          : out std_logic_vector(3 downto 0);
   DOUT_A1          : out std_logic_vector(3 downto 0);
   DOUT_A2          : out std_logic_vector(3 downto 0);
   CLKOUT_A0        : out std_logic;
   CLKOUT_A1        : out std_logic;
   CLKOUT_A2        : out std_logic;
   LOCKED_A0        : out std_logic;
   LOCKED_A1        : out std_logic;
   LOCKED_A2        : out std_logic;
   CLKIN_A_P        : in std_logic;
   CLKIN_A1_S       : in std_logic;
   CLKIN_A2_S       : in std_logic;
   RSTN_A0          : in std_logic;
   RSTN_A1          : in std_logic;
   RSTN_A2          : in std_logic;
   CLK_PHASE_A_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_A_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_A_2     : out std_logic_vector(3 downto 0);

   DIN_B0_CIB       : in std_logic;
   DIN_B0_PAD       : in std_logic;
   DIN_B1_CIB       : in std_logic;
   DIN_B1_PAD       : in std_logic;
   DIN_B2_CIB       : in std_logic;
   DIN_B2_PAD       : in std_logic;
   DOUT_B0          : out std_logic_vector(3 downto 0);
   DOUT_B1          : out std_logic_vector(3 downto 0);
   DOUT_B2          : out std_logic_vector(3 downto 0);
   CLKOUT_B0        : out std_logic;
   CLKOUT_B1        : out std_logic;
   CLKOUT_B2        : out std_logic;
   LOCKED_B0        : out std_logic;
   LOCKED_B1        : out std_logic;
   LOCKED_B2        : out std_logic;
   CLKIN_B_P        : in std_logic;
   CLKIN_B1_S       : in std_logic;
   CLKIN_B2_S       : in std_logic;
   RSTN_B0          : in std_logic;
   RSTN_B1          : in std_logic;
   RSTN_B2          : in std_logic;
   CLK_PHASE_B_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_B_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_B_2     : out std_logic_vector(3 downto 0);

   DIN_C0_CIB       : in std_logic;
   DIN_C0_PAD       : in std_logic;
   DIN_C1_CIB       : in std_logic;
   DIN_C1_PAD       : in std_logic;
   DIN_C2_CIB       : in std_logic;
   DIN_C2_PAD       : in std_logic;
   DOUT_C0          : out std_logic_vector(3 downto 0);
   DOUT_C1          : out std_logic_vector(3 downto 0);
   DOUT_C2          : out std_logic_vector(3 downto 0);
   CLKOUT_C0        : out std_logic;
   CLKOUT_C1        : out std_logic;
   CLKOUT_C2        : out std_logic;
   LOCKED_C0        : out std_logic;
   LOCKED_C1        : out std_logic;
   LOCKED_C2        : out std_logic;
   CLKIN_C_P        : in std_logic;
   CLKIN_C1_S       : in std_logic;
   CLKIN_C2_S       : in std_logic;
   RSTN_C0          : in std_logic;
   RSTN_C1          : in std_logic;
   RSTN_C2          : in std_logic;
   CLK_PHASE_C_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_C_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_C_2     : out std_logic_vector(3 downto 0);

   DIN_D0_CIB       : in std_logic;
   DIN_D0_PAD       : in std_logic;
   DIN_D1_CIB       : in std_logic;
   DIN_D1_PAD       : in std_logic;
   DIN_D2_CIB       : in std_logic;
   DIN_D2_PAD       : in std_logic;
   DOUT_D0          : out std_logic_vector(3 downto 0);
   DOUT_D1          : out std_logic_vector(3 downto 0);
   DOUT_D2          : out std_logic_vector(3 downto 0);
   CLKOUT_D0        : out std_logic;
   CLKOUT_D1        : out std_logic;
   CLKOUT_D2        : out std_logic;
   LOCKED_D0        : out std_logic;
   LOCKED_D1        : out std_logic;
   LOCKED_D2        : out std_logic;
   CLKIN_D_P        : in std_logic;
   CLKIN_D1_S       : in std_logic;
   CLKIN_D2_S       : in std_logic;
   RSTN_D0          : in std_logic;
   RSTN_D1          : in std_logic;
   RSTN_D2          : in std_logic;
   CLK_PHASE_D_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_D_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_D_2     : out std_logic_vector(3 downto 0);

   DIN_E0_CIB       : in std_logic;
   DIN_E0_PAD       : in std_logic;
   DIN_E1_CIB       : in std_logic;
   DIN_E1_PAD       : in std_logic;
   DIN_E2_CIB       : in std_logic;
   DIN_E2_PAD       : in std_logic;
   DOUT_E0          : out std_logic_vector(3 downto 0);
   DOUT_E1          : out std_logic_vector(3 downto 0);
   DOUT_E2          : out std_logic_vector(3 downto 0);
   CLKOUT_E0        : out std_logic;
   CLKOUT_E1        : out std_logic;
   CLKOUT_E2        : out std_logic;
   LOCKED_E0        : out std_logic;
   LOCKED_E1        : out std_logic;
   LOCKED_E2        : out std_logic;
   CLKIN_E_P        : in std_logic;
   CLKIN_E1_S       : in std_logic;
   CLKIN_E2_S       : in std_logic;
   RSTN_E0          : in std_logic;
   RSTN_E1          : in std_logic;
   RSTN_E2          : in std_logic;
   CLK_PHASE_E_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_E_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_E_2     : out std_logic_vector(3 downto 0);

   DIN_F0_CIB       : in std_logic;
   DIN_F0_PAD       : in std_logic;
   DIN_F1_CIB       : in std_logic;
   DIN_F1_PAD       : in std_logic;
   DIN_F2_CIB       : in std_logic;
   DIN_F2_PAD       : in std_logic;
   DOUT_F0          : out std_logic_vector(3 downto 0);
   DOUT_F1          : out std_logic_vector(3 downto 0);
   DOUT_F2          : out std_logic_vector(3 downto 0);
   CLKOUT_F0        : out std_logic;
   CLKOUT_F1        : out std_logic;
   CLKOUT_F2        : out std_logic;
   LOCKED_F0        : out std_logic;
   LOCKED_F1        : out std_logic;
   LOCKED_F2        : out std_logic;
   CLKIN_F_P        : in std_logic;
   CLKIN_F1_S       : in std_logic;
   CLKIN_F2_S       : in std_logic;
   RSTN_F0          : in std_logic;
   RSTN_F1          : in std_logic;
   RSTN_F2          : in std_logic;
   CLK_PHASE_F_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_F_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_F_2     : out std_logic_vector(3 downto 0)  
   );

end LSCDR;

architecture LSCDR_arch of LSCDR is

component LSCDR_sim
GENERIC(
  MIB_MEM : string := #_mib
  );
port (
   REFCLK_EDGE      : in std_logic;
   REFCLK_PRIM      : in std_logic;
   RSTN             : in std_logic;
   FORCE_LOCK       : in std_logic;
   MASTER_HOLD      : in std_logic;
   MASTER_LOCK      : out std_logic;
   TEST_CLK         : out std_logic;
   DIN_A0_CIB       : in std_logic;
   DIN_A0_PAD       : in std_logic;
   DIN_A1_CIB       : in std_logic;
   DIN_A1_PAD       : in std_logic;
   DIN_A2_CIB       : in std_logic;
   DIN_A2_PAD       : in std_logic;
   DOUT_A0          : out std_logic_vector(3 downto 0);
   DOUT_A1          : out std_logic_vector(3 downto 0);
   DOUT_A2          : out std_logic_vector(3 downto 0);
   CLKOUT_A0        : out std_logic;
   CLKOUT_A1        : out std_logic;
   CLKOUT_A2        : out std_logic;
   LOCKED_A0        : out std_logic;
   LOCKED_A1        : out std_logic;
   LOCKED_A2        : out std_logic;
   CLKIN_A_P        : in std_logic;
   CLKIN_A1_S       : in std_logic;
   CLKIN_A2_S       : in std_logic;
   RSTN_A0          : in std_logic;
   RSTN_A1          : in std_logic;
   RSTN_A2          : in std_logic;
   CLK_PHASE_A_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_A_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_A_2     : out std_logic_vector(3 downto 0);

   DIN_B0_CIB       : in std_logic;
   DIN_B0_PAD       : in std_logic;
   DIN_B1_CIB       : in std_logic;
   DIN_B1_PAD       : in std_logic;
   DIN_B2_CIB       : in std_logic;
   DIN_B2_PAD       : in std_logic;
   DOUT_B0          : out std_logic_vector(3 downto 0);
   DOUT_B1          : out std_logic_vector(3 downto 0);
   DOUT_B2          : out std_logic_vector(3 downto 0);
   CLKOUT_B0        : out std_logic;
   CLKOUT_B1        : out std_logic;
   CLKOUT_B2        : out std_logic;
   LOCKED_B0        : out std_logic;
   LOCKED_B1        : out std_logic;
   LOCKED_B2        : out std_logic;
   CLKIN_B_P        : in std_logic;
   CLKIN_B1_S       : in std_logic;
   CLKIN_B2_S       : in std_logic;
   RSTN_B0          : in std_logic;
   RSTN_B1          : in std_logic;
   RSTN_B2          : in std_logic;
   CLK_PHASE_B_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_B_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_B_2     : out std_logic_vector(3 downto 0);

   DIN_C0_CIB       : in std_logic;
   DIN_C0_PAD       : in std_logic;
   DIN_C1_CIB       : in std_logic;
   DIN_C1_PAD       : in std_logic;
   DIN_C2_CIB       : in std_logic;
   DIN_C2_PAD       : in std_logic;
   DOUT_C0          : out std_logic_vector(3 downto 0);
   DOUT_C1          : out std_logic_vector(3 downto 0);
   DOUT_C2          : out std_logic_vector(3 downto 0);
   CLKOUT_C0        : out std_logic;
   CLKOUT_C1        : out std_logic;
   CLKOUT_C2        : out std_logic;
   LOCKED_C0        : out std_logic;
   LOCKED_C1        : out std_logic;
   LOCKED_C2        : out std_logic;
   CLKIN_C_P        : in std_logic;
   CLKIN_C1_S       : in std_logic;
   CLKIN_C2_S       : in std_logic;
   RSTN_C0          : in std_logic;
   RSTN_C1          : in std_logic;
   RSTN_C2          : in std_logic;
   CLK_PHASE_C_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_C_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_C_2     : out std_logic_vector(3 downto 0);

   DIN_D0_CIB       : in std_logic;
   DIN_D0_PAD       : in std_logic;
   DIN_D1_CIB       : in std_logic;
   DIN_D1_PAD       : in std_logic;
   DIN_D2_CIB       : in std_logic;
   DIN_D2_PAD       : in std_logic;
   DOUT_D0          : out std_logic_vector(3 downto 0);
   DOUT_D1          : out std_logic_vector(3 downto 0);
   DOUT_D2          : out std_logic_vector(3 downto 0);
   CLKOUT_D0        : out std_logic;
   CLKOUT_D1        : out std_logic;
   CLKOUT_D2        : out std_logic;
   LOCKED_D0        : out std_logic;
   LOCKED_D1        : out std_logic;
   LOCKED_D2        : out std_logic;
   CLKIN_D_P        : in std_logic;
   CLKIN_D1_S       : in std_logic;
   CLKIN_D2_S       : in std_logic;
   RSTN_D0          : in std_logic;
   RSTN_D1          : in std_logic;
   RSTN_D2          : in std_logic;
   CLK_PHASE_D_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_D_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_D_2     : out std_logic_vector(3 downto 0);

   DIN_E0_CIB       : in std_logic;
   DIN_E0_PAD       : in std_logic;
   DIN_E1_CIB       : in std_logic;
   DIN_E1_PAD       : in std_logic;
   DIN_E2_CIB       : in std_logic;
   DIN_E2_PAD       : in std_logic;
   DOUT_E0          : out std_logic_vector(3 downto 0);
   DOUT_E1          : out std_logic_vector(3 downto 0);
   DOUT_E2          : out std_logic_vector(3 downto 0);
   CLKOUT_E0        : out std_logic;
   CLKOUT_E1        : out std_logic;
   CLKOUT_E2        : out std_logic;
   LOCKED_E0        : out std_logic;
   LOCKED_E1        : out std_logic;
   LOCKED_E2        : out std_logic;
   CLKIN_E_P        : in std_logic;
   CLKIN_E1_S       : in std_logic;
   CLKIN_E2_S       : in std_logic;
   RSTN_E0          : in std_logic;
   RSTN_E1          : in std_logic;
   RSTN_E2          : in std_logic;
   CLK_PHASE_E_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_E_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_E_2     : out std_logic_vector(3 downto 0);

   DIN_F0_CIB       : in std_logic;
   DIN_F0_PAD       : in std_logic;
   DIN_F1_CIB       : in std_logic;
   DIN_F1_PAD       : in std_logic;
   DIN_F2_CIB       : in std_logic;
   DIN_F2_PAD       : in std_logic;
   DOUT_F0          : out std_logic_vector(3 downto 0);
   DOUT_F1          : out std_logic_vector(3 downto 0);
   DOUT_F2          : out std_logic_vector(3 downto 0);
   CLKOUT_F0        : out std_logic;
   CLKOUT_F1        : out std_logic;
   CLKOUT_F2        : out std_logic;
   LOCKED_F0        : out std_logic;
   LOCKED_F1        : out std_logic;
   LOCKED_F2        : out std_logic;
   CLKIN_F_P        : in std_logic;
   CLKIN_F1_S       : in std_logic;
   CLKIN_F2_S       : in std_logic;
   RSTN_F0          : in std_logic;
   RSTN_F1          : in std_logic;
   RSTN_F2          : in std_logic;
   CLK_PHASE_F_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_F_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_F_2     : out std_logic_vector(3 downto 0)  
);
end component;

begin
LSCDR_sim_inst : LSCDR_sim
generic map (
  MIB_MEM => MIB_MEM)
port map (
   REFCLK_EDGE => REFCLK_EDGE,
   REFCLK_PRIM => REFCLK_PRIM,
   RSTN => RSTN,
   FORCE_LOCK => FORCE_LOCK,
   MASTER_HOLD => MASTER_HOLD,
   MASTER_LOCK => MASTER_LOCK,
   TEST_CLK => TEST_CLK,
   DIN_A0_CIB => DIN_A0_CIB,
   DIN_A0_PAD => DIN_A0_PAD,
   DIN_A1_CIB => DIN_A1_CIB,
   DIN_A1_PAD => DIN_A1_PAD,
   DIN_A2_CIB => DIN_A2_CIB,
   DIN_A2_PAD => DIN_A2_PAD,
   DOUT_A0 => DOUT_A0,
   DOUT_A1 => DOUT_A1,
   DOUT_A2 => DOUT_A2,
   CLKOUT_A0 => CLKOUT_A0,
   CLKOUT_A1 => CLKOUT_A1,
   CLKOUT_A2 => CLKOUT_A2,
   LOCKED_A0 => LOCKED_A0,
   LOCKED_A1 => LOCKED_A1,
   LOCKED_A2 => LOCKED_A2,
   CLKIN_A_P => CLKIN_A_P,
   CLKIN_A1_S => CLKIN_A1_S,
   CLKIN_A2_S => CLKIN_A2_S,
   RSTN_A0 => RSTN_A0,
   RSTN_A1 => RSTN_A1,
   RSTN_A2 => RSTN_A2,
   CLK_PHASE_A_0 => CLK_PHASE_A_0,
   CLK_PHASE_A_1 => CLK_PHASE_A_1,
   CLK_PHASE_A_2 => CLK_PHASE_A_2,

   DIN_B0_CIB => DIN_B0_CIB,
   DIN_B0_PAD => DIN_B0_PAD,
   DIN_B1_CIB => DIN_B1_CIB,
   DIN_B1_PAD => DIN_B1_PAD,
   DIN_B2_CIB => DIN_B2_CIB,
   DIN_B2_PAD => DIN_B2_PAD,
   DOUT_B0 => DOUT_B0,
   DOUT_B1 => DOUT_B1,
   DOUT_B2 => DOUT_B2,
   CLKOUT_B0 => CLKOUT_B0,
   CLKOUT_B1 => CLKOUT_B1,
   CLKOUT_B2 => CLKOUT_B2,
   LOCKED_B0 => LOCKED_B0,
   LOCKED_B1 => LOCKED_B1,
   LOCKED_B2 => LOCKED_B2,
   CLKIN_B_P => CLKIN_B_P,
   CLKIN_B1_S => CLKIN_B1_S,
   CLKIN_B2_S => CLKIN_B2_S,
   RSTN_B0 => RSTN_B0,
   RSTN_B1 => RSTN_B1,
   RSTN_B2 => RSTN_B2,
   CLK_PHASE_B_0 => CLK_PHASE_B_0,
   CLK_PHASE_B_1 => CLK_PHASE_B_1,
   CLK_PHASE_B_2 => CLK_PHASE_B_2,

   DIN_C0_CIB => DIN_C0_CIB,
   DIN_C0_PAD => DIN_C0_PAD,
   DIN_C1_CIB => DIN_C1_CIB,
   DIN_C1_PAD => DIN_C1_PAD,
   DIN_C2_CIB => DIN_C2_CIB,
   DIN_C2_PAD => DIN_C2_PAD,
   DOUT_C0 => DOUT_C0,
   DOUT_C1 => DOUT_C1,
   DOUT_C2 => DOUT_C2,
   CLKOUT_C0 => CLKOUT_C0,
   CLKOUT_C1 => CLKOUT_C1,
   CLKOUT_C2 => CLKOUT_C2,
   LOCKED_C0 => LOCKED_C0,
   LOCKED_C1 => LOCKED_C1,
   LOCKED_C2 => LOCKED_C2,
   CLKIN_C_P => CLKIN_C_P,
   CLKIN_C1_S => CLKIN_C1_S,
   CLKIN_C2_S => CLKIN_C2_S,
   RSTN_C0 => RSTN_C0,
   RSTN_C1 => RSTN_C1,
   RSTN_C2 => RSTN_C2,
   CLK_PHASE_C_0 => CLK_PHASE_C_0,
   CLK_PHASE_C_1 => CLK_PHASE_C_1,
   CLK_PHASE_C_2 => CLK_PHASE_C_2,

   DIN_D0_CIB => DIN_D0_CIB,
   DIN_D0_PAD => DIN_D0_PAD,
   DIN_D1_CIB => DIN_D1_CIB,
   DIN_D1_PAD => DIN_D1_PAD,
   DIN_D2_CIB => DIN_D2_CIB,
   DIN_D2_PAD => DIN_D2_PAD,
   DOUT_D0 => DOUT_D0,
   DOUT_D1 => DOUT_D1,
   DOUT_D2 => DOUT_D2,
   CLKOUT_D0 => CLKOUT_D0,
   CLKOUT_D1 => CLKOUT_D1,
   CLKOUT_D2 => CLKOUT_D2,
   LOCKED_D0 => LOCKED_D0,
   LOCKED_D1 => LOCKED_D1,
   LOCKED_D2 => LOCKED_D2,
   CLKIN_D_P => CLKIN_D_P,
   CLKIN_D1_S => CLKIN_D1_S,
   CLKIN_D2_S => CLKIN_D2_S,
   RSTN_D0 => RSTN_D0,
   RSTN_D1 => RSTN_D1,
   RSTN_D2 => RSTN_D2,
   CLK_PHASE_D_0 => CLK_PHASE_D_0,
   CLK_PHASE_D_1 => CLK_PHASE_D_1,
   CLK_PHASE_D_2 => CLK_PHASE_D_2,

   DIN_E0_CIB => DIN_E0_CIB,
   DIN_E0_PAD => DIN_E0_PAD,
   DIN_E1_CIB => DIN_E1_CIB,
   DIN_E1_PAD => DIN_E1_PAD,
   DIN_E2_CIB => DIN_E2_CIB,
   DIN_E2_PAD => DIN_E2_PAD,
   DOUT_E0 => DOUT_E0,
   DOUT_E1 => DOUT_E1,
   DOUT_E2 => DOUT_E2,
   CLKOUT_E0 => CLKOUT_E0,
   CLKOUT_E1 => CLKOUT_E1,
   CLKOUT_E2 => CLKOUT_E2,
   LOCKED_E0 => LOCKED_E0,
   LOCKED_E1 => LOCKED_E1,
   LOCKED_E2 => LOCKED_E2,
   CLKIN_E_P => CLKIN_E_P,
   CLKIN_E1_S => CLKIN_E1_S,
   CLKIN_E2_S => CLKIN_E2_S,
   RSTN_E0 => RSTN_E0,
   RSTN_E1 => RSTN_E1,
   RSTN_E2 => RSTN_E2,
   CLK_PHASE_E_0 => CLK_PHASE_E_0,
   CLK_PHASE_E_1 => CLK_PHASE_E_1,
   CLK_PHASE_E_2 => CLK_PHASE_E_2,

   DIN_F0_CIB => DIN_F0_CIB,
   DIN_F0_PAD => DIN_F0_PAD,
   DIN_F1_CIB => DIN_F1_CIB,
   DIN_F1_PAD => DIN_F1_PAD,
   DIN_F2_CIB => DIN_F2_CIB,
   DIN_F2_PAD => DIN_F2_PAD,
   DOUT_F0 => DOUT_F0,
   DOUT_F1 => DOUT_F1,
   DOUT_F2 => DOUT_F2,
   CLKOUT_F0 => CLKOUT_F0,
   CLKOUT_F1 => CLKOUT_F1,
   CLKOUT_F2 => CLKOUT_F2,
   LOCKED_F0 => LOCKED_F0,
   LOCKED_F1 => LOCKED_F1,
   LOCKED_F2 => LOCKED_F2,
   CLKIN_F_P => CLKIN_F_P,
   CLKIN_F1_S => CLKIN_F1_S,
   CLKIN_F2_S => CLKIN_F2_S,
   RSTN_F0 => RSTN_F0,
   RSTN_F1 => RSTN_F1,
   RSTN_F2 => RSTN_F2,
   CLK_PHASE_F_0 => CLK_PHASE_F_0,
   CLK_PHASE_F_1 => CLK_PHASE_F_1,
   CLK_PHASE_F_2 => CLK_PHASE_F_2
   );

end LSCDR_arch;

--synopsys translate_on

--synopsys translate_off
library SCM;
use SCM.components.all;
--synopsys translate_on

library IEEE, STD;
use IEEE.std_logic_1164.all;
use STD.TEXTIO.all;

entity _circuit_name is
 port (
   refclk          : in std_logic;
   rstn            : in std_logic;
   force_lock      : in std_logic;
   master_hold     : in std_logic;
#if _num_slave_grps == 1 || _num_slave_grps == 2 || _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
   din_a0          : in std_logic;
   din_a1          : in std_logic;
   din_a2          : in std_logic;
#if _bus_width == 1
   dout_a0          : out std_logic;
#elif _bus_width == 2
   dout_a0          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_a0          : out std_logic_vector(3 downto 0);
#endif
#if _bus_width == 1
   dout_a1          : out std_logic;
#elif _bus_width == 2
   dout_a1          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_a1          : out std_logic_vector(3 downto 0);
#endif
#if _bus_width == 1
   dout_a2          : out std_logic;
#elif _bus_width == 2
   dout_a2          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_a2          : out std_logic_vector(3 downto 0);
#endif
   clkout_a0        : out std_logic;
   clkout_a1        : out std_logic;
   clkout_a2        : out std_logic;
   locked_a0        : out std_logic;
   locked_a1        : out std_logic;
   locked_a2        : out std_logic;
   clkin_a_p        : in std_logic;
   rstn_a0          : in std_logic;
   rstn_a1          : in std_logic;
   rstn_a2          : in std_logic;
#endif

#if _num_slave_grps == 2 || _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
   din_b0          : in std_logic;
   din_b1          : in std_logic;
   din_b2          : in std_logic;
#if _bus_width == 1
   dout_b0          : out std_logic;
#elif _bus_width == 2
   dout_b0          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_b0          : out std_logic_vector(3 downto 0);
#endif
#if _bus_width == 1
   dout_b1          : out std_logic;
#elif _bus_width == 2
   dout_b1          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_b1          : out std_logic_vector(3 downto 0);
#endif
#if _bus_width == 1
   dout_b2          : out std_logic;
#elif _bus_width == 2
   dout_b2          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_b2          : out std_logic_vector(3 downto 0);
#endif
   clkout_b0        : out std_logic;
   clkout_b1        : out std_logic;
   clkout_b2        : out std_logic;
   locked_b0        : out std_logic;
   locked_b1        : out std_logic;
   locked_b2        : out std_logic;
   clkin_b_p        : in std_logic;
   rstn_b0          : in std_logic;
   rstn_b1          : in std_logic;
   rstn_b2          : in std_logic;
#endif

#if _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
   din_c0          : in std_logic;
   din_c1          : in std_logic;
   din_c2          : in std_logic;
#if _bus_width == 1
   dout_c0          : out std_logic;
#elif _bus_width == 2
   dout_c0          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_c0          : out std_logic_vector(3 downto 0);
#endif
#if _bus_width == 1
   dout_c1          : out std_logic;
#elif _bus_width == 2
   dout_c1          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_c1          : out std_logic_vector(3 downto 0);
#endif
#if _bus_width == 1
   dout_c2          : out std_logic;
#elif _bus_width == 2
   dout_c2          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_c2          : out std_logic_vector(3 downto 0);
#endif
   clkout_c0        : out std_logic;
   clkout_c1        : out std_logic;
   clkout_c2        : out std_logic;
   locked_c0        : out std_logic;
   locked_c1        : out std_logic;
   locked_c2        : out std_logic;
   clkin_c_p        : in std_logic;
   rstn_c0          : in std_logic;
   rstn_c1          : in std_logic;
   rstn_c2          : in std_logic;
#endif

#if _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
   din_d0          : in std_logic;
   din_d1          : in std_logic;
   din_d2          : in std_logic;
#if _bus_width == 1
   dout_d0          : out std_logic;
#elif _bus_width == 2
   dout_d0          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_d0          : out std_logic_vector(3 downto 0);
#endif
#if _bus_width == 1
   dout_d1          : out std_logic;
#elif _bus_width == 2
   dout_d1          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_d1          : out std_logic_vector(3 downto 0);
#endif
#if _bus_width == 1
   dout_d2          : out std_logic;
#elif _bus_width == 2
   dout_d2          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_d2          : out std_logic_vector(3 downto 0);
#endif
   clkout_d0        : out std_logic;
   clkout_d1        : out std_logic;
   clkout_d2        : out std_logic;
   locked_d0        : out std_logic;
   locked_d1        : out std_logic;
   locked_d2        : out std_logic;
   clkin_d_p        : in std_logic;
   rstn_d0          : in std_logic;
   rstn_d1          : in std_logic;
   rstn_d2          : in std_logic;
#endif

#if _num_slave_grps == 5 || _num_slave_grps == 6
   din_e0          : in std_logic;
   din_e1          : in std_logic;
   din_e2          : in std_logic;
#if _bus_width == 1
   dout_e0          : out std_logic;
#elif _bus_width == 2
   dout_e0          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_e0          : out std_logic_vector(3 downto 0);
#endif
#if _bus_width == 1
   dout_e1          : out std_logic;
#elif _bus_width == 2
   dout_e1          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_e1          : out std_logic_vector(3 downto 0);
#endif
#if _bus_width == 1
   dout_e2          : out std_logic;
#elif _bus_width == 2
   dout_e2          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_e2          : out std_logic_vector(3 downto 0);
#endif
   clkout_e0        : out std_logic;
   clkout_e1        : out std_logic;
   clkout_e2        : out std_logic;
   locked_e0        : out std_logic;
   locked_e1        : out std_logic;
   locked_e2        : out std_logic;
   clkin_e_p        : in std_logic;
   rstn_e0          : in std_logic;
   rstn_e1          : in std_logic;
   rstn_e2          : in std_logic;
#endif

#if _num_slave_grps == 6
   din_f0          : in std_logic;
   din_f1          : in std_logic;
   din_f2          : in std_logic;
#if _bus_width == 1
   dout_f0          : out std_logic;
#elif _bus_width == 2
   dout_f0          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_f0          : out std_logic_vector(3 downto 0);
#endif
#if _bus_width == 1
   dout_f1          : out std_logic;
#elif _bus_width == 2
   dout_f1          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_f1          : out std_logic_vector(3 downto 0);
#endif
#if _bus_width == 1
   dout_f2          : out std_logic;
#elif _bus_width == 2
   dout_f2          : out std_logic_vector(1 downto 0);
#elif _bus_width == 4
   dout_f2          : out std_logic_vector(3 downto 0);
#endif
   clkout_f0        : out std_logic;
   clkout_f1        : out std_logic;
   clkout_f2        : out std_logic;
   locked_f0        : out std_logic;
   locked_f1        : out std_logic;
   locked_f2        : out std_logic;
   clkin_f_p        : in std_logic;
   rstn_f0          : in std_logic;
   rstn_f1          : in std_logic;
   rstn_f2          : in std_logic;
#endif
   master_locked    : out std_logic);

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
component LSCDR
--synopsys translate_off
GENERIC(
  MIB_MEM : string
  );
--synopsys translate_on
port (
   REFCLK_EDGE      : in std_logic;
   REFCLK_PRIM      : in std_logic;
   RSTN             : in std_logic;
   FORCE_LOCK       : in std_logic;
   MASTER_HOLD      : in std_logic;
   MASTER_LOCK      : out std_logic;
   TEST_CLK         : out std_logic;
   DIN_A0_CIB       : in std_logic;
   DIN_A0_PAD       : in std_logic;
   DIN_A1_CIB       : in std_logic;
   DIN_A1_PAD       : in std_logic;
   DIN_A2_CIB       : in std_logic;
   DIN_A2_PAD       : in std_logic;
   DOUT_A0          : out std_logic_vector(3 downto 0);
   DOUT_A1          : out std_logic_vector(3 downto 0);
   DOUT_A2          : out std_logic_vector(3 downto 0);
   CLKOUT_A0        : out std_logic;
   CLKOUT_A1        : out std_logic;
   CLKOUT_A2        : out std_logic;
   LOCKED_A0        : out std_logic;
   LOCKED_A1        : out std_logic;
   LOCKED_A2        : out std_logic;
   CLKIN_A_P        : in std_logic;
   CLKIN_A1_S       : in std_logic;
   CLKIN_A2_S       : in std_logic;
   RSTN_A0          : in std_logic;
   RSTN_A1          : in std_logic;
   RSTN_A2          : in std_logic;
   CLK_PHASE_A_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_A_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_A_2     : out std_logic_vector(3 downto 0);

   DIN_B0_CIB       : in std_logic;
   DIN_B0_PAD       : in std_logic;
   DIN_B1_CIB       : in std_logic;
   DIN_B1_PAD       : in std_logic;
   DIN_B2_CIB       : in std_logic;
   DIN_B2_PAD       : in std_logic;
   DOUT_B0          : out std_logic_vector(3 downto 0);
   DOUT_B1          : out std_logic_vector(3 downto 0);
   DOUT_B2          : out std_logic_vector(3 downto 0);
   CLKOUT_B0        : out std_logic;
   CLKOUT_B1        : out std_logic;
   CLKOUT_B2        : out std_logic;
   LOCKED_B0        : out std_logic;
   LOCKED_B1        : out std_logic;
   LOCKED_B2        : out std_logic;
   CLKIN_B_P        : in std_logic;
   CLKIN_B1_S       : in std_logic;
   CLKIN_B2_S       : in std_logic;
   RSTN_B0          : in std_logic;
   RSTN_B1          : in std_logic;
   RSTN_B2          : in std_logic;
   CLK_PHASE_B_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_B_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_B_2     : out std_logic_vector(3 downto 0);

   DIN_C0_CIB       : in std_logic;
   DIN_C0_PAD       : in std_logic;
   DIN_C1_CIB       : in std_logic;
   DIN_C1_PAD       : in std_logic;
   DIN_C2_CIB       : in std_logic;
   DIN_C2_PAD       : in std_logic;
   DOUT_C0          : out std_logic_vector(3 downto 0);
   DOUT_C1          : out std_logic_vector(3 downto 0);
   DOUT_C2          : out std_logic_vector(3 downto 0);
   CLKOUT_C0        : out std_logic;
   CLKOUT_C1        : out std_logic;
   CLKOUT_C2        : out std_logic;
   LOCKED_C0        : out std_logic;
   LOCKED_C1        : out std_logic;
   LOCKED_C2        : out std_logic;
   CLKIN_C_P        : in std_logic;
   CLKIN_C1_S       : in std_logic;
   CLKIN_C2_S       : in std_logic;
   RSTN_C0          : in std_logic;
   RSTN_C1          : in std_logic;
   RSTN_C2          : in std_logic;
   CLK_PHASE_C_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_C_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_C_2     : out std_logic_vector(3 downto 0);

   DIN_D0_CIB       : in std_logic;
   DIN_D0_PAD       : in std_logic;
   DIN_D1_CIB       : in std_logic;
   DIN_D1_PAD       : in std_logic;
   DIN_D2_CIB       : in std_logic;
   DIN_D2_PAD       : in std_logic;
   DOUT_D0          : out std_logic_vector(3 downto 0);
   DOUT_D1          : out std_logic_vector(3 downto 0);
   DOUT_D2          : out std_logic_vector(3 downto 0);
   CLKOUT_D0        : out std_logic;
   CLKOUT_D1        : out std_logic;
   CLKOUT_D2        : out std_logic;
   LOCKED_D0        : out std_logic;
   LOCKED_D1        : out std_logic;
   LOCKED_D2        : out std_logic;
   CLKIN_D_P        : in std_logic;
   CLKIN_D1_S       : in std_logic;
   CLKIN_D2_S       : in std_logic;
   RSTN_D0          : in std_logic;
   RSTN_D1          : in std_logic;
   RSTN_D2          : in std_logic;
   CLK_PHASE_D_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_D_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_D_2     : out std_logic_vector(3 downto 0);

   DIN_E0_CIB       : in std_logic;
   DIN_E0_PAD       : in std_logic;
   DIN_E1_CIB       : in std_logic;
   DIN_E1_PAD       : in std_logic;
   DIN_E2_CIB       : in std_logic;
   DIN_E2_PAD       : in std_logic;
   DOUT_E0          : out std_logic_vector(3 downto 0);
   DOUT_E1          : out std_logic_vector(3 downto 0);
   DOUT_E2          : out std_logic_vector(3 downto 0);
   CLKOUT_E0        : out std_logic;
   CLKOUT_E1        : out std_logic;
   CLKOUT_E2        : out std_logic;
   LOCKED_E0        : out std_logic;
   LOCKED_E1        : out std_logic;
   LOCKED_E2        : out std_logic;
   CLKIN_E_P        : in std_logic;
   CLKIN_E1_S       : in std_logic;
   CLKIN_E2_S       : in std_logic;
   RSTN_E0          : in std_logic;
   RSTN_E1          : in std_logic;
   RSTN_E2          : in std_logic;
   CLK_PHASE_E_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_E_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_E_2     : out std_logic_vector(3 downto 0);

   DIN_F0_CIB       : in std_logic;
   DIN_F0_PAD       : in std_logic;
   DIN_F1_CIB       : in std_logic;
   DIN_F1_PAD       : in std_logic;
   DIN_F2_CIB       : in std_logic;
   DIN_F2_PAD       : in std_logic;
   DOUT_F0          : out std_logic_vector(3 downto 0);
   DOUT_F1          : out std_logic_vector(3 downto 0);
   DOUT_F2          : out std_logic_vector(3 downto 0);
   CLKOUT_F0        : out std_logic;
   CLKOUT_F1        : out std_logic;
   CLKOUT_F2        : out std_logic;
   LOCKED_F0        : out std_logic;
   LOCKED_F1        : out std_logic;
   LOCKED_F2        : out std_logic;
   CLKIN_F_P        : in std_logic;
   CLKIN_F1_S       : in std_logic;
   CLKIN_F2_S       : in std_logic;
   RSTN_F0          : in std_logic;
   RSTN_F1          : in std_logic;
   RSTN_F2          : in std_logic;
   CLK_PHASE_F_0     : out std_logic_vector(3 downto 0);
   CLK_PHASE_F_1     : out std_logic_vector(3 downto 0);
   CLK_PHASE_F_2     : out std_logic_vector(3 downto 0)  
   );
end component;
   attribute IS_ASB: string;
   attribute IS_ASB of LSCDR_INST : label is "TRUE";
   attribute IS_MACO: string;
   attribute IS_MACO of LSCDR_INST : label is "SYSTEM";
   attribute MIB_MEM: string;
   attribute MIB_MEM of LSCDR_INST : label is #_mib;

signal fpsc_vlo : std_logic := '0';
#if _bus_width == 1
signal dout_a0_int : std_logic_vector(2 downto 0);
signal dout_a1_int : std_logic_vector(2 downto 0);
signal dout_a2_int : std_logic_vector(2 downto 0);
#elif _bus_width == 2
signal dout_a0_int : std_logic_vector(1 downto 0);
signal dout_a1_int : std_logic_vector(1 downto 0);
signal dout_a2_int : std_logic_vector(1 downto 0);
#endif
#if _bus_width == 1
signal dout_b0_int : std_logic_vector(2 downto 0);
signal dout_b1_int : std_logic_vector(2 downto 0);
signal dout_b2_int : std_logic_vector(2 downto 0);
#elif _bus_width == 2
signal dout_b0_int : std_logic_vector(1 downto 0);
signal dout_b1_int : std_logic_vector(1 downto 0);
signal dout_b2_int : std_logic_vector(1 downto 0);
#endif
#if _bus_width == 1
signal dout_c0_int : std_logic_vector(2 downto 0);
signal dout_c1_int : std_logic_vector(2 downto 0);
signal dout_c2_int : std_logic_vector(2 downto 0);
#elif _bus_width == 2
signal dout_c0_int : std_logic_vector(1 downto 0);
signal dout_c1_int : std_logic_vector(1 downto 0);
signal dout_c2_int : std_logic_vector(1 downto 0);
#endif
#if _bus_width == 1
signal dout_d0_int : std_logic_vector(2 downto 0);
signal dout_d1_int : std_logic_vector(2 downto 0);
signal dout_d2_int : std_logic_vector(2 downto 0);
#elif _bus_width == 2
signal dout_d0_int : std_logic_vector(1 downto 0);
signal dout_d1_int : std_logic_vector(1 downto 0);
signal dout_d2_int : std_logic_vector(1 downto 0);
#endif
#if _bus_width == 1
signal dout_e0_int : std_logic_vector(2 downto 0);
signal dout_e1_int : std_logic_vector(2 downto 0);
signal dout_e2_int : std_logic_vector(2 downto 0);
#elif _bus_width == 2
signal dout_e0_int : std_logic_vector(1 downto 0);
signal dout_e1_int : std_logic_vector(1 downto 0);
signal dout_e2_int : std_logic_vector(1 downto 0);
#endif
#if _bus_width == 1
signal dout_f0_int : std_logic_vector(2 downto 0);
signal dout_f1_int : std_logic_vector(2 downto 0);
signal dout_f2_int : std_logic_vector(2 downto 0);
#elif _bus_width == 2
signal dout_f0_int : std_logic_vector(1 downto 0);
signal dout_f1_int : std_logic_vector(1 downto 0);
signal dout_f2_int : std_logic_vector(1 downto 0);
#endif

begin

vlo_inst : VLO port map(Z => fpsc_vlo);

-- lscdr instance
LSCDR_INST : LSCDR
--synopsys translate_off
  generic map (MIB_MEM => #_mib
  )
--synopsys translate_on
port map  (
  RSTN => rstn,
#if _refclk_src == "EDGE"
  REFCLK_EDGE => refclk,
  REFCLK_PRIM => fpsc_vlo,
#elif _refclk_src == "PRIMARY"
  REFCLK_EDGE => fpsc_vlo,
  REFCLK_PRIM => refclk,
#endif
  FORCE_LOCK => force_lock,
  MASTER_HOLD => master_hold,
  MASTER_LOCK => master_locked,
#if _num_slave_grps == 1 || _num_slave_grps == 2 || _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
  DIN_A0_CIB => din_a0,
  DIN_A1_CIB => din_a1,
  DIN_A2_CIB => din_a2,
#if _bus_width == 1
  DOUT_A0(0) => dout_a0,
  DOUT_A0(3 downto 1) => dout_a0_int,
#elif _bus_width == 2
  DOUT_A0(1 downto 0) => dout_a0,
  DOUT_A0(3 downto 2) => dout_a0_int,
#elif _bus_width == 4
  DOUT_A0 => dout_a0,
#endif
#if _bus_width == 1
  DOUT_A1(0) => dout_a1,
  DOUT_A1(3 downto 1) => dout_a1_int,
#elif _bus_width == 2
  DOUT_A1(1 downto 0) => dout_a1,
  DOUT_A1(3 downto 2) => dout_a1_int,
#elif _bus_width == 4
  DOUT_A1 => dout_a1,
#endif
#if _bus_width == 1
  DOUT_A2(0) => dout_a2,
  DOUT_A2(3 downto 1) => dout_a2_int,
#elif _bus_width == 2
  DOUT_A2(1 downto 0) => dout_a2,
  DOUT_A2(3 downto 2) => dout_a2_int,
#elif _bus_width == 4
  DOUT_A2 => dout_a2,
#endif
  CLKOUT_A0 => clkout_a0,
  CLKOUT_A1 => clkout_a1,
  CLKOUT_A2 => clkout_a2,
  LOCKED_A0 => locked_a0,
  LOCKED_A1 => locked_a1,
  LOCKED_A2 => locked_a2,
  CLKIN_A_P => clkin_a_p,
  RSTN_A0 => rstn_a0,
  RSTN_A1 => rstn_a1,
  RSTN_A2 => rstn_a2,
#else
  DIN_A0_CIB => fpsc_vlo,
  DIN_A1_CIB => fpsc_vlo,
  DIN_A2_CIB => fpsc_vlo,
  DOUT_A0 => open,
  DOUT_A1 => open,
  DOUT_A2 => open,
  CLKOUT_A0 => open,
  CLKOUT_A1 => open,
  CLKOUT_A2 => open,
  LOCKED_A0 => open,
  LOCKED_A1 => open,
  LOCKED_A2 => open,
  CLKIN_A_P => fpsc_vlo,
  RSTN_A0 => fpsc_vlo,
  RSTN_A1 => fpsc_vlo,
  RSTN_A2 => fpsc_vlo,
#endif

#if _num_slave_grps == 2 || _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
  DIN_B0_CIB => din_b0,
  DIN_B1_CIB => din_b1,
  DIN_B2_CIB => din_b2,
#if _bus_width == 1
  DOUT_B0(0) => dout_b0,
  DOUT_B0(3 downto 1) => dout_b0_int,
#elif _bus_width == 2
  DOUT_B0(1 downto 0) => dout_b0,
  DOUT_B0(3 downto 2) => dout_b0_int,
#elif _bus_width == 4
  DOUT_B0 => dout_b0,
#endif
#if _bus_width == 1
  DOUT_B1(0) => dout_b1,
  DOUT_B1(3 downto 1) => dout_b1_int,
#elif _bus_width == 2
  DOUT_B1(1 downto 0) => dout_b1,
  DOUT_B1(3 downto 2) => dout_b1_int,
#elif _bus_width == 4
  DOUT_B1 => dout_b1,
#endif
#if _bus_width == 1
  DOUT_B2(0) => dout_b2,
  DOUT_B2(3 downto 1) => dout_b2_int,
#elif _bus_width == 2
  DOUT_B2(1 downto 0) => dout_b2,
  DOUT_B2(3 downto 2) => dout_b2_int,
#elif _bus_width == 4
  DOUT_B2 => dout_b2,
#endif
  CLKOUT_B0 => clkout_b0,
  CLKOUT_B1 => clkout_b1,
  CLKOUT_B2 => clkout_b2,
  LOCKED_B0 => locked_b0,
  LOCKED_B1 => locked_b1,
  LOCKED_B2 => locked_b2,
  CLKIN_B_P => clkin_b_p,
  RSTN_B0 => rstn_b0,
  RSTN_B1 => rstn_b1,
  RSTN_B2 => rstn_b2,
#else
  DIN_B0_CIB => fpsc_vlo,
  DIN_B1_CIB => fpsc_vlo,
  DIN_B2_CIB => fpsc_vlo,
  DOUT_B0 => open,
  DOUT_B1 => open,
  DOUT_B2 => open,
  CLKOUT_B0 => open,
  CLKOUT_B1 => open,
  CLKOUT_B2 => open,
  LOCKED_B0 => open,
  LOCKED_B1 => open,
  LOCKED_B2 => open,
  CLKIN_B_P => fpsc_vlo,
  RSTN_B0 => fpsc_vlo,
  RSTN_B1 => fpsc_vlo,
  RSTN_B2 => fpsc_vlo,
#endif

#if _num_slave_grps == 3 || _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
  DIN_C0_CIB => din_c0,
  DIN_C1_CIB => din_c1,
  DIN_C2_CIB => din_c2,
#if _bus_width == 1
  DOUT_C0(0) => dout_c0,
  DOUT_C0(3 downto 1) => dout_c0_int,
#elif _bus_width == 2
  DOUT_C0(1 downto 0) => dout_c0,
  DOUT_C0(3 downto 2) => dout_c0_int,
#elif _bus_width == 4
  DOUT_C0 => dout_c0,
#endif
#if _bus_width == 1
  DOUT_C1(0) => dout_c1,
  DOUT_C1(3 downto 1) => dout_c1_int,
#elif _bus_width == 2
  DOUT_C1(1 downto 0) => dout_c1,
  DOUT_C1(3 downto 2) => dout_c1_int,
#elif _bus_width == 4
  DOUT_C1 => dout_c1,
#endif
#if _bus_width == 1
  DOUT_C2(0) => dout_c2,
  DOUT_C2(3 downto 1) => dout_c2_int,
#elif _bus_width == 2
  DOUT_C2(1 downto 0) => dout_c2,
  DOUT_C2(3 downto 2) => dout_c2_int,
#elif _bus_width == 4
  DOUT_C2 => dout_c2,
#endif
  CLKOUT_C0 => clkout_c0,
  CLKOUT_C1 => clkout_c1,
  CLKOUT_C2 => clkout_c2,
  LOCKED_C0 => locked_c0,
  LOCKED_C1 => locked_c1,
  LOCKED_C2 => locked_c2,
  CLKIN_C_P => clkin_c_p,
  RSTN_C0 => rstn_c0,
  RSTN_C1 => rstn_c1,
  RSTN_C2 => rstn_c2,
#else
  DIN_C0_CIB => fpsc_vlo,
  DIN_C1_CIB => fpsc_vlo,
  DIN_C2_CIB => fpsc_vlo,
  DOUT_C0 => open,
  DOUT_C1 => open,
  DOUT_C2 => open,
  CLKOUT_C0 => open,
  CLKOUT_C1 => open,
  CLKOUT_C2 => open,
  LOCKED_C0 => open,
  LOCKED_C1 => open,
  LOCKED_C2 => open,
  CLKIN_C_P => fpsc_vlo,
  RSTN_C0 => fpsc_vlo,
  RSTN_C1 => fpsc_vlo,
  RSTN_C2 => fpsc_vlo,
#endif

#if _num_slave_grps == 4 || _num_slave_grps == 5 || _num_slave_grps == 6
  DIN_D0_CIB => din_d0,
  DIN_D1_CIB => din_d1,
  DIN_D2_CIB => din_d2,
#if _bus_width == 1
  DOUT_D0(0) => dout_d0,
  DOUT_D0(3 downto 1) => dout_d0_int,
#elif _bus_width == 2
  DOUT_D0(1 downto 0) => dout_d0,
  DOUT_D0(3 downto 2) => dout_d0_int,
#elif _bus_width == 4
  DOUT_D0 => dout_d0,
#endif
#if _bus_width == 1
  DOUT_D1(0) => dout_d1,
  DOUT_D1(3 downto 1) => dout_d1_int,
#elif _bus_width == 2
  DOUT_D1(1 downto 0) => dout_d1,
  DOUT_D1(3 downto 2) => dout_d1_int,
#elif _bus_width == 4
  DOUT_D1 => dout_d1,
#endif
#if _bus_width == 1
  DOUT_D2(0) => dout_d2,
  DOUT_D2(3 downto 1) => dout_d2_int,
#elif _bus_width == 2
  DOUT_D2(1 downto 0) => dout_d2,
  DOUT_D2(3 downto 2) => dout_d2_int,
#elif _bus_width == 4
  DOUT_D2 => dout_d2,
#endif
  CLKOUT_D0 => clkout_d0,
  CLKOUT_D1 => clkout_d1,
  CLKOUT_D2 => clkout_d2,
  LOCKED_D0 => locked_d0,
  LOCKED_D1 => locked_d1,
  LOCKED_D2 => locked_d2,
  CLKIN_D_P => clkin_d_p,
  RSTN_D0 => rstn_d0,
  RSTN_D1 => rstn_d1,
  RSTN_D2 => rstn_d2,
#else
  DIN_D0_CIB => fpsc_vlo,
  DIN_D1_CIB => fpsc_vlo,
  DIN_D2_CIB => fpsc_vlo,
  DOUT_D0 => open,
  DOUT_D1 => open,
  DOUT_D2 => open,
  CLKOUT_D0 => open,
  CLKOUT_D1 => open,
  CLKOUT_D2 => open,
  LOCKED_D0 => open,
  LOCKED_D1 => open,
  LOCKED_D2 => open,
  CLKIN_D_P => fpsc_vlo,
  RSTN_D0 => fpsc_vlo,
  RSTN_D1 => fpsc_vlo,
  RSTN_D2 => fpsc_vlo,
#endif

#if _num_slave_grps == 5 || _num_slave_grps == 6
  DIN_E0_CIB => din_e0,
  DIN_E1_CIB => din_e1,
  DIN_E2_CIB => din_e2,
#if _bus_width == 1
  DOUT_E0(0) => dout_e0,
  DOUT_E0(3 downto 1) => dout_e0_int,
#elif _bus_width == 2
  DOUT_E0(1 downto 0) => dout_e0,
  DOUT_E0(3 downto 2) => dout_e0_int,
#elif _bus_width == 4
  DOUT_E0 => dout_e0,
#endif
#if _bus_width == 1
  DOUT_E1(0) => dout_e1,
  DOUT_E1(3 downto 1) => dout_e1_int,
#elif _bus_width == 2
  DOUT_E1(1 downto 0) => dout_e1,
  DOUT_E1(3 downto 2) => dout_e1_int,
#elif _bus_width == 4
  DOUT_E1 => dout_e1,
#endif
#if _bus_width == 1
  DOUT_E2(0) => dout_e2,
  DOUT_E2(3 downto 1) => dout_e2_int,
#elif _bus_width == 2
  DOUT_E2(1 downto 0) => dout_e2,
  DOUT_E2(3 downto 2) => dout_e2_int,
#elif _bus_width == 4
  DOUT_E2 => dout_e2,
#endif
  CLKOUT_E0 => clkout_e0,
  CLKOUT_E1 => clkout_e1,
  CLKOUT_E2 => clkout_e2,
  LOCKED_E0 => locked_e0,
  LOCKED_E1 => locked_e1,
  LOCKED_E2 => locked_e2,
  CLKIN_E_P => clkin_e_p,
  RSTN_E0 => rstn_e0,
  RSTN_E1 => rstn_e1,
  RSTN_E2 => rstn_e2,
#else
  DIN_E0_CIB => fpsc_vlo,
  DIN_E1_CIB => fpsc_vlo,
  DIN_E2_CIB => fpsc_vlo,
  DOUT_E0 => open,
  DOUT_E1 => open,
  DOUT_E2 => open,
  CLKOUT_E0 => open,
  CLKOUT_E1 => open,
  CLKOUT_E2 => open,
  LOCKED_E0 => open,
  LOCKED_E1 => open,
  LOCKED_E2 => open,
  CLKIN_E_P => fpsc_vlo,
  RSTN_E0 => fpsc_vlo,
  RSTN_E1 => fpsc_vlo,
  RSTN_E2 => fpsc_vlo,
#endif

#if _num_slave_grps == 6
  DIN_F0_CIB => din_f0,
  DIN_F1_CIB => din_f1,
  DIN_F2_CIB => din_f2,
#if _bus_width == 1
  DOUT_F0(0) => dout_f0,
  DOUT_F0(3 downto 1) => dout_f0_int,
#elif _bus_width == 2
  DOUT_F0(1 downto 0) => dout_f0,
  DOUT_F0(3 downto 2) => dout_f0_int,
#elif _bus_width == 4
  DOUT_F0 => dout_f0,
#endif
#if _bus_width == 1
  DOUT_F1(0) => dout_f1,
  DOUT_F1(3 downto 1) => dout_f1_int,
#elif _bus_width == 2
  DOUT_F1(1 downto 0) => dout_f1,
  DOUT_F1(3 downto 2) => dout_f1_int,
#elif _bus_width == 4
  DOUT_F1 => dout_f1,
#endif
#if _bus_width == 1
  DOUT_F2(0) => dout_f2,
  DOUT_F2(3 downto 1) => dout_f2_int,
#elif _bus_width == 2
  DOUT_F2(1 downto 0) => dout_f2,
  DOUT_F2(3 downto 2) => dout_f2_int,
#elif _bus_width == 4
  DOUT_F2 => dout_f2,
#endif
  CLKOUT_F0 => clkout_f0,
  CLKOUT_F1 => clkout_f1,
  CLKOUT_F2 => clkout_f2,
  LOCKED_F0 => locked_f0,
  LOCKED_F1 => locked_f1,
  LOCKED_F2 => locked_f2,
  CLKIN_F_P => clkin_f_p,
  RSTN_F0 => rstn_f0,
  RSTN_F1 => rstn_f1,
  RSTN_F2 => rstn_f2,
#else
  DIN_F0_CIB => fpsc_vlo,
  DIN_F1_CIB => fpsc_vlo,
  DIN_F2_CIB => fpsc_vlo,
  DOUT_F0 => open,
  DOUT_F1 => open,
  DOUT_F2 => open,
  CLKOUT_F0 => open,
  CLKOUT_F1 => open,
  CLKOUT_F2 => open,
  LOCKED_F0 => open,
  LOCKED_F1 => open,
  LOCKED_F2 => open,
  CLKIN_F_P => fpsc_vlo,
  RSTN_F0 => fpsc_vlo,
  RSTN_F1 => fpsc_vlo,
  RSTN_F2 => fpsc_vlo,
#endif

  TEST_CLK => open,
  DIN_A0_PAD => fpsc_vlo,
  DIN_A1_PAD => fpsc_vlo,
  DIN_A2_PAD => fpsc_vlo,
  CLKIN_A1_S => fpsc_vlo,
  CLKIN_A2_S => fpsc_vlo,
  CLK_PHASE_A_0 => open,
  CLK_PHASE_A_1 => open,
  CLK_PHASE_A_2 => open,

  DIN_B0_PAD => fpsc_vlo,
  DIN_B1_PAD => fpsc_vlo,
  DIN_B2_PAD => fpsc_vlo,
  CLKIN_B1_S => fpsc_vlo,
  CLKIN_B2_S => fpsc_vlo,
  CLK_PHASE_B_0 => open,
  CLK_PHASE_B_1 => open,
  CLK_PHASE_B_2 => open,

  DIN_C0_PAD => fpsc_vlo,
  DIN_C1_PAD => fpsc_vlo,
  DIN_C2_PAD => fpsc_vlo,
  CLKIN_C1_S => fpsc_vlo,
  CLKIN_C2_S => fpsc_vlo,
  CLK_PHASE_C_0 => open,
  CLK_PHASE_C_1 => open,
  CLK_PHASE_C_2 => open,

  DIN_D0_PAD => fpsc_vlo,
  DIN_D1_PAD => fpsc_vlo,
  DIN_D2_PAD => fpsc_vlo,
  CLKIN_D1_S => fpsc_vlo,
  CLKIN_D2_S => fpsc_vlo,
  CLK_PHASE_D_0 => open,
  CLK_PHASE_D_1 => open,
  CLK_PHASE_D_2 => open,

  DIN_E0_PAD => fpsc_vlo,
  DIN_E1_PAD => fpsc_vlo,
  DIN_E2_PAD => fpsc_vlo,
  CLKIN_E1_S => fpsc_vlo,
  CLKIN_E2_S => fpsc_vlo,
  CLK_PHASE_E_0 => open,
  CLK_PHASE_E_1 => open,
  CLK_PHASE_E_2 => open,

  DIN_F0_PAD => fpsc_vlo,
  DIN_F1_PAD => fpsc_vlo,
  DIN_F2_PAD => fpsc_vlo,
  CLKIN_F1_S => fpsc_vlo,
  CLKIN_F2_S => fpsc_vlo,
  CLK_PHASE_F_0 => open,
  CLK_PHASE_F_1 => open,
  CLK_PHASE_F_2 => open);

end _circuit_name##_arch ;
#include <pcs/lscdr.tft>


