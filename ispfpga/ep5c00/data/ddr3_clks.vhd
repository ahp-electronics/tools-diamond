library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library synplify;
use synplify.components.all;
library ecp3;
use ecp3.components.all;

entity ddr3_clks_jitter_filter_1 is
port(
  align_status_sig : in std_logic_vector(1 downto 1);
  align_status : out std_logic_vector(1 downto 1);
  GND :  in std_logic;
  VCC :  in std_logic;
  reset_filter_1_0_i :  in std_logic;
  sclk :  in std_logic);
end ddr3_clks_jitter_filter_1;

architecture beh of ddr3_clks_jitter_filter_1 is
  signal COUNTER_S : std_logic_vector(6 downto 0);
  signal COUNTER : std_logic_vector(6 downto 0);
  signal COUNTER_QN : std_logic_vector(6 downto 0);
  signal COUNTER_CRY : std_logic_vector(4 downto 0);
  signal COUNTER_CRY_0_S0_0 : std_logic_vector(0 to 0);
  signal COUNTER_CRY_0_COUT_0 : std_logic_vector(5 to 5);
  signal OUT_QE_0 : std_logic ;
  signal OUT_Q_QN : std_logic ;
  signal OUT_Q5_I : std_logic ;
  signal ANY1_1_SQMUXA_I : std_logic ;
  signal ANY1 : std_logic ;
  signal ANY1_QN : std_logic ;
  signal OUT_Q5_4 : std_logic ;
  signal G0_0_0 : std_logic ;
  signal G0_0_4 : std_logic ;
  signal \ALIGN_STATUS_\ : std_logic ;
  signal OUT_QE_1 : std_logic ;
  signal GND_0 : std_logic ;
  signal VCC_0 : std_logic ;
begin
OUT_Q_REG_Z54: FD1S3DX port map (
    D => OUT_QE_0,
    CK => sclk,
    CD => reset_filter_1_0_i,
    Q => \ALIGN_STATUS_\);
\COUNTER[0]_REG_Z56\: FD1S3DX port map (
    D => COUNTER_S(0),
    CK => sclk,
    CD => reset_filter_1_0_i,
    Q => COUNTER(0));
\COUNTER[1]_REG_Z58\: FD1S3DX port map (
    D => COUNTER_S(1),
    CK => sclk,
    CD => reset_filter_1_0_i,
    Q => COUNTER(1));
\COUNTER[2]_REG_Z60\: FD1S3DX port map (
    D => COUNTER_S(2),
    CK => sclk,
    CD => reset_filter_1_0_i,
    Q => COUNTER(2));
\COUNTER[3]_REG_Z62\: FD1S3DX port map (
    D => COUNTER_S(3),
    CK => sclk,
    CD => reset_filter_1_0_i,
    Q => COUNTER(3));
\COUNTER[4]_REG_Z64\: FD1S3DX port map (
    D => COUNTER_S(4),
    CK => sclk,
    CD => reset_filter_1_0_i,
    Q => COUNTER(4));
\COUNTER[5]_REG_Z66\: FD1S3DX port map (
    D => COUNTER_S(5),
    CK => sclk,
    CD => reset_filter_1_0_i,
    Q => COUNTER(5));
\COUNTER[6]_REG_Z68\: FD1S3DX port map (
    D => COUNTER_S(6),
    CK => sclk,
    CD => reset_filter_1_0_i,
    Q => COUNTER(6));
ANY1_REG_Z70: FD1P3DX port map (
    D => OUT_Q5_I,
    SP => ANY1_1_SQMUXA_I,
    CK => sclk,
    CD => reset_filter_1_0_i,
    Q => ANY1);
OUT_Q5_I <= (not OUT_Q5_4) or 
	(not COUNTER(2)) or 
	(not COUNTER(1)) or 
	(not COUNTER(0));
ANY1_1_SQMUXA_I <= (align_status_sig(1)) or 
	(COUNTER(1) and G0_0_0 and G0_0_4);
OUT_Q5_4 <= COUNTER(3) and COUNTER(4) and COUNTER(5) and COUNTER(6);
G0_0_4 <= COUNTER(0) and COUNTER(3) and COUNTER(4) and COUNTER(6);
G0_0_0 <= COUNTER(2) and COUNTER(5);
OUT_QE_1 <= (not \ALIGN_STATUS_\ and not COUNTER(1)) or 
	(not ANY1 and COUNTER(1));
OUT_QE_0 <= (G0_0_0 and G0_0_4 and not OUT_QE_1) or 
	(\ALIGN_STATUS_\ and not G0_0_4) or 
	(\ALIGN_STATUS_\ and not G0_0_0);
\COUNTER_CRY_0[0]\: CCU2C 
generic map(
  INIT0 => X"0a0c",
  INIT1 => X"0600",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
  A0 => GND,
  B0 => VCC,
  C0 => GND,
  D0 => VCC,
  A1 => COUNTER(0),
  B1 => GND,
  C1 => GND,
  D1 => VCC,
  CIN => GND,
  COUT => COUNTER_CRY(0),
  S0 => COUNTER_CRY_0_S0_0(0),
  S1 => COUNTER_S(0));
\COUNTER_CRY_0[1]\: CCU2C 
generic map(
  INIT0 => X"0600",
  INIT1 => X"0600",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
  A0 => COUNTER(1),
  B0 => GND,
  C0 => GND,
  D0 => VCC,
  A1 => COUNTER(2),
  B1 => GND,
  C1 => GND,
  D1 => VCC,
  CIN => COUNTER_CRY(0),
  COUT => COUNTER_CRY(2),
  S0 => COUNTER_S(1),
  S1 => COUNTER_S(2));
\COUNTER_CRY_0[3]\: CCU2C 
generic map(
  INIT0 => X"0600",
  INIT1 => X"0600",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
  A0 => COUNTER(3),
  B0 => GND,
  C0 => GND,
  D0 => VCC,
  A1 => COUNTER(4),
  B1 => GND,
  C1 => GND,
  D1 => VCC,
  CIN => COUNTER_CRY(2),
  COUT => COUNTER_CRY(4),
  S0 => COUNTER_S(3),
  S1 => COUNTER_S(4));
\COUNTER_CRY_0[5]\: CCU2C 
generic map(
  INIT0 => X"0600",
  INIT1 => X"060a",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
  A0 => COUNTER(5),
  B0 => GND,
  C0 => GND,
  D0 => VCC,
  A1 => COUNTER(6),
  B1 => GND,
  C1 => GND,
  D1 => VCC,
  CIN => COUNTER_CRY(4),
  COUT => COUNTER_CRY_0_COUT_0(5),
  S0 => COUNTER_S(5),
  S1 => COUNTER_S(6));
GND_0 <= '0';
VCC_0 <= '1';
align_status(1) <= \ALIGN_STATUS_\;
end beh;

--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library synplify;
use synplify.components.all;
library ecp3;
use ecp3.components.all;

entity ddr3_clks_jitter_filter is
port(
align_status_sig : in std_logic_vector(0 downto 0);
align_status : out std_logic_vector(0 downto 0);
GND :  in std_logic;
VCC :  in std_logic;
reset :  in std_logic;
sclk :  in std_logic);
end ddr3_clks_jitter_filter;

architecture beh of ddr3_clks_jitter_filter is
signal COUNTER_S : std_logic_vector(6 downto 0);
signal COUNTER : std_logic_vector(6 downto 0);
signal COUNTER_QN_0 : std_logic_vector(6 downto 0);
signal COUNTER_CRY : std_logic_vector(4 downto 0);
signal COUNTER_CRY_0_S0 : std_logic_vector(0 to 0);
signal COUNTER_CRY_0_COUT : std_logic_vector(5 to 5);
signal OUT_QE_0 : std_logic ;
signal OUT_Q_QN_0 : std_logic ;
signal OUT_Q5_I : std_logic ;
signal ANY1_1_SQMUXA_I : std_logic ;
signal ANY1 : std_logic ;
signal ANY1_QN_0 : std_logic ;
signal OUT_Q5_4 : std_logic ;
signal G0_0_0 : std_logic ;
signal G0_0_4 : std_logic ;
signal \ALIGN_STATUS_\ : std_logic ;
signal OUT_QE_1 : std_logic ;
signal GND_0 : std_logic ;
signal VCC_0 : std_logic ;
begin
OUT_Q_REG_Z54: FD1S3DX port map (
  D => OUT_QE_0,
  CK => sclk,
  CD => reset,
  Q => \ALIGN_STATUS_\);
\COUNTER[0]_REG_Z56\: FD1S3DX port map (
  D => COUNTER_S(0),
  CK => sclk,
  CD => reset,
  Q => COUNTER(0));
\COUNTER[1]_REG_Z58\: FD1S3DX port map (
  D => COUNTER_S(1),
  CK => sclk,
  CD => reset,
  Q => COUNTER(1));
\COUNTER[2]_REG_Z60\: FD1S3DX port map (
  D => COUNTER_S(2),
  CK => sclk,
  CD => reset,
  Q => COUNTER(2));
\COUNTER[3]_REG_Z62\: FD1S3DX port map (
  D => COUNTER_S(3),
  CK => sclk,
  CD => reset,
  Q => COUNTER(3));
\COUNTER[4]_REG_Z64\: FD1S3DX port map (
  D => COUNTER_S(4),
  CK => sclk,
  CD => reset,
  Q => COUNTER(4));
\COUNTER[5]_REG_Z66\: FD1S3DX port map (
  D => COUNTER_S(5),
  CK => sclk,
  CD => reset,
  Q => COUNTER(5));
\COUNTER[6]_REG_Z68\: FD1S3DX port map (
  D => COUNTER_S(6),
  CK => sclk,
  CD => reset,
  Q => COUNTER(6));
ANY1_REG_Z70: FD1P3DX port map (
  D => OUT_Q5_I,
  SP => ANY1_1_SQMUXA_I,
  CK => sclk,
  CD => reset,
  Q => ANY1);
OUT_Q5_I <= (not OUT_Q5_4) or 
	(not COUNTER(2)) or 
	(not COUNTER(1)) or 
	(not COUNTER(0));
ANY1_1_SQMUXA_I <= (align_status_sig(0)) or 
	(COUNTER(1) and G0_0_0 and G0_0_4);
OUT_Q5_4 <= COUNTER(3) and COUNTER(4) and COUNTER(5) and COUNTER(6);
G0_0_4 <= COUNTER(0) and COUNTER(3) and COUNTER(4) and COUNTER(6);
G0_0_0 <= COUNTER(2) and COUNTER(5);
OUT_QE_1 <= (not \ALIGN_STATUS_\ and not COUNTER(1)) or 
	(not ANY1 and COUNTER(1));
OUT_QE_0 <= (G0_0_0 and G0_0_4 and not OUT_QE_1) or 
	(\ALIGN_STATUS_\ and not G0_0_4) or 
	(\ALIGN_STATUS_\ and not G0_0_0);
\COUNTER_CRY_0[0]\: CCU2C 
generic map(
  INIT0 => X"0a0c",
  INIT1 => X"0600",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
A0 => GND,
B0 => VCC,
C0 => GND,
D0 => VCC,
A1 => COUNTER(0),
B1 => GND,
C1 => GND,
D1 => VCC,
CIN => GND,
COUT => COUNTER_CRY(0),
S0 => COUNTER_CRY_0_S0(0),
S1 => COUNTER_S(0));
\COUNTER_CRY_0[1]\: CCU2C 
generic map(
  INIT0 => X"0600",
  INIT1 => X"0600",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
A0 => COUNTER(1),
B0 => GND,
C0 => GND,
D0 => VCC,
A1 => COUNTER(2),
B1 => GND,
C1 => GND,
D1 => VCC,
CIN => COUNTER_CRY(0),
COUT => COUNTER_CRY(2),
S0 => COUNTER_S(1),
S1 => COUNTER_S(2));
\COUNTER_CRY_0[3]\: CCU2C 
generic map(
  INIT0 => X"0600",
  INIT1 => X"0600",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
A0 => COUNTER(3),
B0 => GND,
C0 => GND,
D0 => VCC,
A1 => COUNTER(4),
B1 => GND,
C1 => GND,
D1 => VCC,
CIN => COUNTER_CRY(2),
COUT => COUNTER_CRY(4),
S0 => COUNTER_S(3),
S1 => COUNTER_S(4));
\COUNTER_CRY_0[5]\: CCU2C 
generic map(
  INIT0 => X"0600",
  INIT1 => X"060a",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
A0 => COUNTER(5),
B0 => GND,
C0 => GND,
D0 => VCC,
A1 => COUNTER(6),
B1 => GND,
C1 => GND,
D1 => VCC,
CIN => COUNTER_CRY(4),
COUT => COUNTER_CRY_0_COUT(5),
S0 => COUNTER_S(5),
S1 => COUNTER_S(6));
GND_0 <= '0';
VCC_0 <= '1';
align_status(0) <= \ALIGN_STATUS_\;
end beh;

--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library synplify;
use synplify.components.all;
library ecp3;
use ecp3.components.all;

entity ddr3_clks_clk_phase is
port(
align_status_sig : out std_logic_vector(1 downto 0);
sclk :  in std_logic;
clkos_1 :  in std_logic;
VCC :  in std_logic;
reset_datapath_out :  in std_logic;
eclk :  in std_logic);
end ddr3_clks_clk_phase;

architecture beh of ddr3_clks_clk_phase is
signal DQCLK1BAR_FF : std_logic ;
signal DQCLK1BAR_FF_I : std_logic ;
signal DQCLK1BAR_FF_INST_Q : std_logic ;
signal DQCLK1BAR_FF_INST_QN : std_logic ;
signal PHASE_FF_0_INST_QN : std_logic ;
signal PHASE_FF_1_INST_QN : std_logic ;
signal GND : std_logic ;
signal VCC_0 : std_logic ;
attribute HGROUP : string;
attribute PBBOX : string;
attribute HGROUP of DQCLK1BAR_FF_INST_REG_Z18 : label is "clk_phase1a";
attribute PBBOX of DQCLK1BAR_FF_INST_REG_Z18 : label is "1,1";
attribute HGROUP of PHASE_FF_0_INST_REG_Z20 : label is "clk_phase0";
attribute PBBOX of PHASE_FF_0_INST_REG_Z20 : label is "1,1";
attribute HGROUP of PHASE_FF_1_INST_REG_Z22 : label is "clk_phase1b";
attribute PBBOX of PHASE_FF_1_INST_REG_Z22 : label is "1,1";
begin
DQCLK1BAR_FF_INST_RNO: INV port map (
A => DQCLK1BAR_FF,
Z => DQCLK1BAR_FF_I);
DQCLK1BAR_FF_INST_REG_Z18: FD1S3DX port map (
D => DQCLK1BAR_FF_I,
CK => eclk,
CD => reset_datapath_out,
Q => DQCLK1BAR_FF_INST_Q);
PHASE_FF_0_INST_REG_Z20: FD1S3DX port map (
D => clkos_1,
CK => sclk,
CD => reset_datapath_out,
Q => align_status_sig(0));
PHASE_FF_1_INST_REG_Z22: FD1S3DX port map (
D => DQCLK1BAR_FF,
CK => sclk,
CD => reset_datapath_out,
Q => align_status_sig(1));
DQCLK1BAR_FF <= DQCLK1BAR_FF_INST_Q;
GND <= '0';
VCC_0 <= '1';
end beh;

--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library synplify;
use synplify.components.all;
library ecp3;
use ecp3.components.all;

entity ddr3_clks_clk_stop is
port(
stop_0 :  out std_logic;
reset_filter_1_0_i :  out std_logic;
GND :  in std_logic;
pll_stop :  in std_logic;
reset_datapath_out :  out std_logic;
pll_reset_datapath :  in std_logic;
VCC :  in std_logic;
reset :  in std_logic;
clkos_1 :  in std_logic);
end ddr3_clks_clk_stop;

architecture beh of ddr3_clks_clk_stop is
signal STOP_MEM : std_logic_vector(1 downto 0);
signal STOP_MEM_I : std_logic_vector(1 to 1);
signal STOP_MEM_QN : std_logic_vector(1 downto 0);
signal STOP_MEME_0 : std_logic_vector(1 to 1);
signal STOP_REF : std_logic ;
signal STOP_REF_I : std_logic ;
signal CN : std_logic ;
signal STOP_REF_QN : std_logic ;
signal STOP_MEM18 : std_logic ;
signal STOP_GATE_FF : std_logic ;
signal STOP_GATE_FF_POS : std_logic ;
signal STOP_GATE_FF_POS_QN : std_logic ;
signal PLL_STOP_FF : std_logic ;
signal N_6 : std_logic ;
signal STOP_GATE_FF_QN : std_logic ;
signal RESET_DATAPATH_FF_FAST : std_logic ;
signal RESET_DATAPATH_FF_FAST_QN : std_logic ;
signal RESET_DATAPATH_FF2 : std_logic ;
signal RESET_DATAPATH_FF2_QN : std_logic ;
signal RESET_DATAPATH_OUT_8 : std_logic ;
signal RESET_DATAPATH_FF_QN_0 : std_logic ;
signal PLL_STOP_FF_QN : std_logic ;
signal N_14 : std_logic ;
signal N_13 : std_logic ;
signal N_12 : std_logic ;
signal N_11 : std_logic ;
signal GND_0 : std_logic ;
signal VCC_0 : std_logic ;
begin
STOP_REF_RNO: INV port map (
A => STOP_REF,
Z => STOP_REF_I);
\STOP_MEM_RNO[0]\: INV port map (
A => STOP_MEM(1),
Z => STOP_MEM_I(1));
\STOP_MEM_1_.CN\: INV port map (
A => clkos_1,
Z => CN);
STOP_REF_REG_Z47: FD1S3DX port map (
D => STOP_REF_I,
CK => CN,
CD => reset,
Q => STOP_REF);
\STOP_MEM[0]_REG_Z49\: FD1P3DX port map (
D => STOP_MEM_I(1),
SP => STOP_MEM18,
CK => CN,
CD => reset,
Q => STOP_MEM(0));
\STOP_MEM[1]_REG_Z51\: FD1S3DX port map (
D => STOP_MEME_0(1),
CK => CN,
CD => reset,
Q => STOP_MEM(1));
STOP_GATE_FF_POS_REG_Z53: FD1S3DX port map (
D => STOP_GATE_FF,
CK => clkos_1,
CD => reset,
Q => STOP_GATE_FF_POS);
STOP_GATE_FF_REG_Z55: FD1P3DX port map (
D => PLL_STOP_FF,
SP => N_6,
CK => CN,
CD => reset,
Q => STOP_GATE_FF);
RESET_DATAPATH_FF_FAST_REG_Z57: FD1S3BX port map (
D => pll_reset_datapath,
CK => CN,
PD => reset,
Q => RESET_DATAPATH_FF_FAST);
RESET_DATAPATH_FF2_REG_Z59: FD1S3BX port map (
D => RESET_DATAPATH_OUT_8,
CK => CN,
PD => reset,
Q => RESET_DATAPATH_FF2);
RESET_DATAPATH_FF_REG_Z61: FD1S3BX port map (
D => pll_reset_datapath,
CK => CN,
PD => reset,
Q => RESET_DATAPATH_OUT_8);
PLL_STOP_FF_REG_Z63: FD1S3BX port map (
D => pll_stop,
CK => CN,
PD => reset,
Q => PLL_STOP_FF);
reset_filter_1_0_i <= (reset) or 
	(RESET_DATAPATH_OUT_8);
N_6 <= (not STOP_MEM(1) and not STOP_REF) or 
	(PLL_STOP_FF) or 
	(STOP_MEM(1) and STOP_REF);
stop_0 <= (STOP_GATE_FF and not STOP_MEM(0)) or 
	(STOP_GATE_FF_POS and STOP_MEM(0));
STOP_MEM18 <= RESET_DATAPATH_FF2 and not RESET_DATAPATH_FF_FAST;
STOP_MEME_0(1) <= (RESET_DATAPATH_FF2 and not RESET_DATAPATH_FF_FAST and STOP_MEM(0)) or 
	(not RESET_DATAPATH_FF2 and STOP_MEM(1)) or 
	(RESET_DATAPATH_FF_FAST and STOP_MEM(1));
GND_0 <= '0';
VCC_0 <= '1';
reset_datapath_out <= RESET_DATAPATH_OUT_8;
end beh;

--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library synplify;
use synplify.components.all;
library ecp3;
use ecp3.components.all;

entity ddr3_clks_pll_control is
port(
align_status : in std_logic_vector(1 downto 0);
phase_Q : out std_logic_vector(3 downto 0);
pll_stop :  out std_logic;
pll_reset_datapath :  out std_logic;
GND :  in std_logic;
good_out :  out std_logic;
all_lock :  in std_logic;
reset_datapath :  in std_logic;
err :  out std_logic;
VCC :  in std_logic;
reset :  in std_logic;
refclk :  in std_logic);
end ddr3_clks_pll_control;

architecture beh of ddr3_clks_pll_control is
signal TIMER : std_logic_vector(7 downto 0);
signal TIMER_RNI1DJP : std_logic_vector(5 to 5);
signal TIMER_RNIND5J1 : std_logic_vector(1 to 1);
signal TIMER_LM : std_logic_vector(7 downto 0);
signal TIMER_QN : std_logic_vector(7 downto 0);
signal STATE_FAST : std_logic_vector(6 downto 0);
signal STATE_FAST_QN : std_logic_vector(6 downto 0);
signal STATE : std_logic_vector(6 downto 0);
signal STATE_QN : std_logic_vector(7 downto 0);
signal RETRY_CNT_LM : std_logic_vector(7 downto 0);
signal RETRY_CNT : std_logic_vector(7 downto 0);
signal RETRY_CNT_QN : std_logic_vector(7 downto 0);
signal PHASE_QN : std_logic_vector(3 downto 0);
signal PHASEE_0 : std_logic_vector(3 downto 1);
signal LAST_ALIGN_STATUS_0_8 : std_logic_vector(5 downto 0);
signal LAST_ALIGN_STATUS_0 : std_logic_vector(5 downto 0);
signal LAST_ALIGN_STATUS_0_QN : std_logic_vector(5 downto 0);
signal ALIGN_STATUS_FF : std_logic_vector(1 downto 0);
signal ALIGN_STATUS_FF_QN : std_logic_vector(1 downto 0);
signal STATE_NS_0_I_S_0 : std_logic_vector(6 downto 5);
signal STATE_NS_0_I_A2_1_1 : std_logic_vector(4 to 4);
signal STATE_NS_0_I_A2_1_2 : std_logic_vector(4 to 4);
signal RETRY_CNT_S : std_logic_vector(7 downto 0);
signal TIMER_S : std_logic_vector(7 downto 0);
signal STATE_NS_I_I_0 : std_logic_vector(1 to 1);
signal STATE_NS_0_I_O2_RNO : std_logic_vector(5 to 5);
signal TIMER_CRY : std_logic_vector(6 downto 0);
signal TIMER_CRY_0_S0 : std_logic_vector(0 to 0);
signal TIMER_S_0_COUT : std_logic_vector(7 to 7);
signal TIMER_S_0_S1 : std_logic_vector(7 to 7);
signal RETRY_CNT_CRY : std_logic_vector(6 downto 0);
signal RETRY_CNT_CRY_0_S0 : std_logic_vector(0 to 0);
signal RETRY_CNT_S_0_COUT : std_logic_vector(7 to 7);
signal RETRY_CNT_S_0_S1 : std_logic_vector(7 to 7);
signal TIMERE_0_I : std_logic ;
signal N_19_FAST : std_logic ;
signal N_33_REP1 : std_logic ;
signal STATE_6_REP1 : std_logic ;
signal STATE_6_REP1_QN : std_logic ;
signal N_19_REP1 : std_logic ;
signal STATE_0_REP1 : std_logic ;
signal STATE_0_REP1_QN : std_logic ;
signal N_19 : std_logic ;
signal N_25_I : std_logic ;
signal N_256_0 : std_logic ;
signal N_258_0 : std_logic ;
signal N_29 : std_logic ;
signal N_31 : std_logic ;
signal N_33 : std_logic ;
signal N_33_FAST : std_logic ;
signal N_21 : std_logic ;
signal N_8 : std_logic ;
signal RESET_DATAPATH_FF : std_logic ;
signal RESET_DATAPATH_FF_QN : std_logic ;
signal N_61_I_I : std_logic ;
signal LOCK_REG : std_logic ;
signal LOCK_REG_QN : std_logic ;
signal N_5 : std_logic ;
signal UN1_GOOD_INT_0_A2 : std_logic ;
signal GOOD_INT_QN : std_logic ;
signal N_48 : std_logic ;
signal PHASE11_0_O2_0 : std_logic ;
signal UN1_STATE_4_I_O2_1 : std_logic ;
signal \PHASE_Q_\ : std_logic ;
signal N_60 : std_logic ;
signal NEXT_STATE10 : std_logic ;
signal N_50 : std_logic ;
signal N_40 : std_logic ;
signal ERR_7 : std_logic ;
signal N_88 : std_logic ;
signal N_89 : std_logic ;
signal PHASE_Q_4 : std_logic ;
signal PHASE_Q_5 : std_logic ;
signal PHASE_Q_6 : std_logic ;
signal N_63_I_I : std_logic ;
signal RST_DP_IN : std_logic ;
signal N_59_I_I : std_logic ;
signal N_53 : std_logic ;
signal RST_DP_IN_STOP : std_logic ;
signal M11_E_4 : std_logic ;
signal M11_E_5 : std_logic ;
signal G_11_0_A3_5 : std_logic ;
signal G_11_0_1 : std_logic ;
signal G0_4 : std_logic ;
signal G0_5 : std_logic ;
signal G0_4_0 : std_logic ;
signal G0_5_0 : std_logic ;
signal G0_4_4 : std_logic ;
signal G0_4_5 : std_logic ;
signal N_82_0_0_0 : std_logic ;
signal G0_0_1 : std_logic ;
signal G0_0_1_0 : std_logic ;
signal G_11_0_1_1 : std_logic ;
signal G_11_0_1_0 : std_logic ;
signal G0_13_SX : std_logic ;
signal UN1_STATE_4_I_1 : std_logic ;
signal G0_1 : std_logic ;
signal G0_0_1_0_1 : std_logic ;
signal N_36 : std_logic ;
signal N_35 : std_logic ;
signal N_34 : std_logic ;
signal N_33_0 : std_logic ;
signal N_32 : std_logic ;
signal N_31_0 : std_logic ;
signal N_30 : std_logic ;
signal N_29_0 : std_logic ;
signal RST_DP_OUT_INST_QN : std_logic ;
signal RST_DP_STOP_INST_QN : std_logic ;
signal GND_0 : std_logic ;
signal VCC_0 : std_logic ;
attribute HGROUP : string;
attribute PBBOX : string;
attribute HGROUP of RST_DP_OUT_INST_REG_Z443 : label is "rst_dp_out";
attribute PBBOX of RST_DP_OUT_INST_REG_Z443 : label is "1,1";
begin
TIMER_RNIND5J1(1) <= not TIMER(4) and not TIMER_RNI1DJP(5) and TIMER(2) and not TIMER(1);
\TIMER[0]_REG_Z264\: FD1P3DX port map (
D => TIMER_LM(0),
SP => TIMERE_0_I,
CK => refclk,
CD => reset,
Q => TIMER(0));
\TIMER[1]_REG_Z266\: FD1P3DX port map (
D => TIMER_LM(1),
SP => TIMERE_0_I,
CK => refclk,
CD => reset,
Q => TIMER(1));
\TIMER[2]_REG_Z268\: FD1P3DX port map (
D => TIMER_LM(2),
SP => TIMERE_0_I,
CK => refclk,
CD => reset,
Q => TIMER(2));
\TIMER[3]_REG_Z270\: FD1P3DX port map (
D => TIMER_LM(3),
SP => TIMERE_0_I,
CK => refclk,
CD => reset,
Q => TIMER(3));
\TIMER[4]_REG_Z272\: FD1P3DX port map (
D => TIMER_LM(4),
SP => TIMERE_0_I,
CK => refclk,
CD => reset,
Q => TIMER(4));
\TIMER[5]_REG_Z274\: FD1P3DX port map (
D => TIMER_LM(5),
SP => TIMERE_0_I,
CK => refclk,
CD => reset,
Q => TIMER(5));
\TIMER[6]_REG_Z276\: FD1P3DX port map (
D => TIMER_LM(6),
SP => TIMERE_0_I,
CK => refclk,
CD => reset,
Q => TIMER(6));
\TIMER[7]_REG_Z278\: FD1P3DX port map (
D => TIMER_LM(7),
SP => TIMERE_0_I,
CK => refclk,
CD => reset,
Q => TIMER(7));
\STATE_FAST[0]_REG_Z280\: FD1S3BX port map (
D => N_19_FAST,
CK => refclk,
PD => reset,
Q => STATE_FAST(0));
STATE_6_REP1_REG_Z282: FD1S3DX port map (
D => N_33_REP1,
CK => refclk,
CD => reset,
Q => STATE_6_REP1);
STATE_0_REP1_REG_Z284: FD1S3BX port map (
D => N_19_REP1,
CK => refclk,
PD => reset,
Q => STATE_0_REP1);
\STATE[0]_REG_Z286\: FD1S3BX port map (
D => N_19,
CK => refclk,
PD => reset,
Q => STATE(0));
\STATE[1]_REG_Z288\: FD1S3DX port map (
D => N_25_I,
CK => refclk,
CD => reset,
Q => STATE(1));
\STATE[2]_REG_Z290\: FD1S3DX port map (
D => N_256_0,
CK => refclk,
CD => reset,
Q => STATE(2));
\STATE[3]_REG_Z292\: FD1S3DX port map (
D => N_258_0,
CK => refclk,
CD => reset,
Q => STATE(3));
\STATE[4]_REG_Z294\: FD1S3DX port map (
D => N_29,
CK => refclk,
CD => reset,
Q => STATE(4));
\STATE[5]_REG_Z296\: FD1S3DX port map (
D => N_31,
CK => refclk,
CD => reset,
Q => STATE(5));
\STATE[6]_REG_Z298\: FD1S3DX port map (
D => N_33,
CK => refclk,
CD => reset,
Q => STATE(6));
\STATE_FAST[6]_REG_Z300\: FD1S3DX port map (
D => N_33_FAST,
CK => refclk,
CD => reset,
Q => STATE_FAST(6));
\STATE[7]_REG_Z302\: FD1S3DX port map (
D => N_21,
CK => refclk,
CD => reset,
Q => ERR_7);
\RETRY_CNT[0]_REG_Z304\: FD1P3DX port map (
D => RETRY_CNT_LM(0),
SP => N_8,
CK => refclk,
CD => reset,
Q => RETRY_CNT(0));
\RETRY_CNT[1]_REG_Z306\: FD1P3DX port map (
D => RETRY_CNT_LM(1),
SP => N_8,
CK => refclk,
CD => reset,
Q => RETRY_CNT(1));
\RETRY_CNT[2]_REG_Z308\: FD1P3DX port map (
D => RETRY_CNT_LM(2),
SP => N_8,
CK => refclk,
CD => reset,
Q => RETRY_CNT(2));
\RETRY_CNT[3]_REG_Z310\: FD1P3DX port map (
D => RETRY_CNT_LM(3),
SP => N_8,
CK => refclk,
CD => reset,
Q => RETRY_CNT(3));
\RETRY_CNT[4]_REG_Z312\: FD1P3DX port map (
D => RETRY_CNT_LM(4),
SP => N_8,
CK => refclk,
CD => reset,
Q => RETRY_CNT(4));
\RETRY_CNT[5]_REG_Z314\: FD1P3DX port map (
D => RETRY_CNT_LM(5),
SP => N_8,
CK => refclk,
CD => reset,
Q => RETRY_CNT(5));
\RETRY_CNT[6]_REG_Z316\: FD1P3DX port map (
D => RETRY_CNT_LM(6),
SP => N_8,
CK => refclk,
CD => reset,
Q => RETRY_CNT(6));
\RETRY_CNT[7]_REG_Z318\: FD1P3DX port map (
D => RETRY_CNT_LM(7),
SP => N_8,
CK => refclk,
CD => reset,
Q => RETRY_CNT(7));
RESET_DATAPATH_FF_REG_Z320: FD1S3DX port map (
D => reset_datapath,
CK => refclk,
CD => reset,
Q => RESET_DATAPATH_FF);
\PHASE[0]_REG_Z322\: FD1S3DX port map (
D => N_61_I_I,
CK => refclk,
CD => reset,
Q => \PHASE_Q_\);
\PHASE[1]_REG_Z324\: FD1S3DX port map (
D => PHASEE_0(1),
CK => refclk,
CD => reset,
Q => PHASE_Q_4);
\PHASE[2]_REG_Z326\: FD1S3DX port map (
D => PHASEE_0(2),
CK => refclk,
CD => reset,
Q => PHASE_Q_5);
\PHASE[3]_REG_Z328\: FD1S3DX port map (
D => PHASEE_0(3),
CK => refclk,
CD => reset,
Q => PHASE_Q_6);
LOCK_REG_REG_Z330: FD1S3DX port map (
D => all_lock,
CK => refclk,
CD => reset,
Q => LOCK_REG);
\LAST_ALIGN_STATUS_0[0]_REG_Z332\: FD1P3DX port map (
D => LAST_ALIGN_STATUS_0_8(0),
SP => N_5,
CK => refclk,
CD => reset,
Q => LAST_ALIGN_STATUS_0(0));
\LAST_ALIGN_STATUS_0[1]_REG_Z334\: FD1P3DX port map (
D => LAST_ALIGN_STATUS_0_8(1),
SP => N_5,
CK => refclk,
CD => reset,
Q => LAST_ALIGN_STATUS_0(1));
\LAST_ALIGN_STATUS_0[2]_REG_Z336\: FD1P3DX port map (
D => LAST_ALIGN_STATUS_0_8(2),
SP => N_5,
CK => refclk,
CD => reset,
Q => LAST_ALIGN_STATUS_0(2));
\LAST_ALIGN_STATUS_0[3]_REG_Z338\: FD1P3DX port map (
D => LAST_ALIGN_STATUS_0_8(3),
SP => N_5,
CK => refclk,
CD => reset,
Q => LAST_ALIGN_STATUS_0(3));
\LAST_ALIGN_STATUS_0[4]_REG_Z340\: FD1P3DX port map (
D => LAST_ALIGN_STATUS_0_8(4),
SP => N_5,
CK => refclk,
CD => reset,
Q => LAST_ALIGN_STATUS_0(4));
\LAST_ALIGN_STATUS_0[5]_REG_Z342\: FD1P3DX port map (
D => LAST_ALIGN_STATUS_0_8(5),
SP => N_5,
CK => refclk,
CD => reset,
Q => LAST_ALIGN_STATUS_0(5));
GOOD_INT_REG_Z344: FD1S3DX port map (
D => UN1_GOOD_INT_0_A2,
CK => refclk,
CD => reset,
Q => good_out);
\ALIGN_STATUS_FF[0]_REG_Z346\: FD1P3DX port map (
D => align_status(0),
SP => LOCK_REG,
CK => refclk,
CD => reset,
Q => ALIGN_STATUS_FF(0));
\ALIGN_STATUS_FF[1]_REG_Z348\: FD1P3DX port map (
D => align_status(1),
SP => LOCK_REG,
CK => refclk,
CD => reset,
Q => ALIGN_STATUS_FF(1));
N_61_I_I <= (not N_48 and not PHASE11_0_O2_0 and not UN1_STATE_4_I_O2_1 and not \PHASE_Q_\) or 
	(N_48 and \PHASE_Q_\) or 
	(PHASE11_0_O2_0 and \PHASE_Q_\) or 
	(UN1_STATE_4_I_O2_1 and \PHASE_Q_\);
N_31 <= (N_60 and not NEXT_STATE10 and STATE(5)) or 
	(STATE_NS_0_I_S_0(5));
UN1_GOOD_INT_0_A2 <= not N_50 and STATE(6) and TIMER(0);
N_21 <= (ERR_7 and not RESET_DATAPATH_FF) or 
	(N_40 and NEXT_STATE10);
N_258_0 <= not N_50 and not NEXT_STATE10 and STATE(5) and not TIMER(0);
N_29 <= (N_88) or 
	(N_89) or 
	(STATE_NS_0_I_A2_1_1(4) and STATE_NS_0_I_A2_1_2(4));
N_63_I_I <= (\PHASE_Q_\ and PHASE_Q_4 and PHASE_Q_5 and not PHASE_Q_6) or 
	(not PHASE_Q_5 and PHASE_Q_6) or 
	(not PHASE_Q_4 and PHASE_Q_6) or 
	(not \PHASE_Q_\ and PHASE_Q_6);
RST_DP_IN <= not N_48 and STATE(5) and not TIMER(3);
N_59_I_I <= (\PHASE_Q_\ and PHASE_Q_4 and not PHASE_Q_5) or 
	(not PHASE_Q_4 and PHASE_Q_5) or 
	(not \PHASE_Q_\ and PHASE_Q_5);
N_19 <= (not LOCK_REG and STATE(0)) or 
	(ALIGN_STATUS_FF(0) and LOCK_REG and STATE(6));
RETRY_CNT_LM(0) <= RETRY_CNT_S(0) and not STATE(0) and not STATE(4) and not STATE_6_REP1;
RETRY_CNT_LM(1) <= RETRY_CNT_S(1) and not STATE(0) and not STATE(4) and not STATE_6_REP1;
RETRY_CNT_LM(2) <= RETRY_CNT_S(2) and not STATE(0) and not STATE(4) and not STATE_6_REP1;
RETRY_CNT_LM(3) <= RETRY_CNT_S(3) and not STATE(0) and not STATE(4) and not STATE_6_REP1;
RETRY_CNT_LM(4) <= RETRY_CNT_S(4) and not STATE(0) and not STATE(4) and not STATE_6_REP1;
RETRY_CNT_LM(5) <= RETRY_CNT_S(5) and not STATE(0) and not STATE(4) and not STATE_6_REP1;
RETRY_CNT_LM(6) <= RETRY_CNT_S(6) and not STATE(0) and not STATE(4) and not STATE_6_REP1;
RETRY_CNT_LM(7) <= RETRY_CNT_S(7) and not STATE(0) and not STATE(4) and not STATE(6);
TIMER_LM(0) <= (STATE(1) and TIMER_S(0)) or 
	(STATE(5) and TIMER_S(0)) or 
	(STATE(6) and TIMER_S(0));
TIMER_LM(1) <= (STATE(1) and TIMER_S(1)) or 
	(STATE(5) and TIMER_S(1)) or 
	(STATE(6) and TIMER_S(1));
TIMER_LM(2) <= (STATE(1) and TIMER_S(2)) or 
	(STATE(5) and TIMER_S(2)) or 
	(STATE(6) and TIMER_S(2));
TIMER_LM(3) <= (STATE(1) and TIMER_S(3)) or 
	(STATE(5) and TIMER_S(3)) or 
	(STATE(6) and TIMER_S(3));
TIMER_LM(4) <= (STATE(1) and TIMER_S(4)) or 
	(STATE(5) and TIMER_S(4)) or 
	(STATE(6) and TIMER_S(4));
TIMER_LM(5) <= (STATE(1) and TIMER_S(5)) or 
	(STATE(5) and TIMER_S(5)) or 
	(STATE(6) and TIMER_S(5));
TIMER_LM(6) <= (STATE(1) and TIMER_S(6)) or 
	(STATE(5) and TIMER_S(6)) or 
	(STATE(6) and TIMER_S(6));
TIMER_LM(7) <= (STATE(1) and TIMER_S(7)) or 
	(STATE(5) and TIMER_S(7)) or 
	(STATE(6) and TIMER_S(7));
N_33 <= (not N_53 and not ALIGN_STATUS_FF(0) and STATE(6)) or 
	(STATE_NS_0_I_S_0(6));
RST_DP_IN_STOP <= (not N_48 and STATE(5) and not TIMER(3)) or 
	(not N_48 and STATE(5) and not TIMER(2));
N_89 <= N_53 and not ALIGN_STATUS_FF(0) and LOCK_REG and STATE_6_REP1;
STATE_NS_I_I_0(1) <= (not STATE(1) and not STATE(2) and not STATE_0_REP1) or 
	(not LOCK_REG and STATE_0_REP1);
N_88 <= (ERR_7 and RESET_DATAPATH_FF) or 
	(RESET_DATAPATH_FF and STATE(4));
STATE_NS_0_I_A2_1_2(4) <= not ALIGN_STATUS_FF(0) and LAST_ALIGN_STATUS_0(2) and LAST_ALIGN_STATUS_0(3) and LAST_ALIGN_STATUS_0(5);
STATE_NS_0_I_A2_1_1(4) <= not LAST_ALIGN_STATUS_0(0) and not LAST_ALIGN_STATUS_0(1) and LAST_ALIGN_STATUS_0(4) and STATE(2);
UN1_STATE_4_I_O2_1 <= (not STATE(1)) or 
	(TIMER(0)) or 
	(TIMER(3));
STATE_NS_0_I_S_0(6) <= (not ALIGN_STATUS_FF(1) and STATE(3)) or 
	(not LOCK_REG and STATE_6_REP1);
STATE_NS_0_I_S_0(5) <= (ALIGN_STATUS_FF(1) and STATE(3)) or 
	(not RESET_DATAPATH_FF and STATE(4));
LAST_ALIGN_STATUS_0_8(0) <= ALIGN_STATUS_FF(0) and not STATE(0);
N_53 <= (ALIGN_STATUS_FF(1)) or 
	(RESET_DATAPATH_FF);
LAST_ALIGN_STATUS_0_8(5) <= LAST_ALIGN_STATUS_0(4) and not STATE_FAST(0);
LAST_ALIGN_STATUS_0_8(4) <= LAST_ALIGN_STATUS_0(3) and not STATE(0);
LAST_ALIGN_STATUS_0_8(3) <= LAST_ALIGN_STATUS_0(2) and not STATE(0);
LAST_ALIGN_STATUS_0_8(2) <= LAST_ALIGN_STATUS_0(1) and not STATE(0);
LAST_ALIGN_STATUS_0_8(1) <= LAST_ALIGN_STATUS_0(0) and not STATE(0);
PHASE11_0_O2_0 <= (not TIMER(2)) or 
	(TIMER(1));
N_48 <= (TIMER(4)) or 
	(TIMER(5)) or 
	(TIMER(6)) or 
	(TIMER(7));
M11_E_4 <= RETRY_CNT(4) and RETRY_CNT(5) and RETRY_CNT(6) and RETRY_CNT(7);
M11_E_5 <= RETRY_CNT(0) and RETRY_CNT(1) and RETRY_CNT(2) and RETRY_CNT(3);
G_11_0_A3_5 <= TIMER(0) and not TIMER(1) and not TIMER(2) and not TIMER(3);
G_11_0_1 <= (STATE(4)) or 
	(STATE_0_REP1) or 
	(STATE_FAST(6));
G0_4 <= (not TIMER(7)) or 
	(not TIMER(6)) or 
	(not TIMER(5)) or 
	(not TIMER(4));
G0_5 <= (not TIMER(3)) or 
	(not TIMER(2)) or 
	(not TIMER(1)) or 
	(not TIMER(0));
N_40 <= (STATE(1)) or 
	(STATE(5));
NEXT_STATE10 <= G0_4_0 and G0_5_0;
G0_4_0 <= RETRY_CNT(0) and RETRY_CNT(1) and RETRY_CNT(2) and RETRY_CNT(3);
G0_5_0 <= RETRY_CNT(4) and RETRY_CNT(5) and RETRY_CNT(6) and RETRY_CNT(7);
N_82_0_0_0 <= G0_4_4 and G0_4_5 and RETRY_CNT(2) and RETRY_CNT(3);
G0_4_4 <= RETRY_CNT(0) and RETRY_CNT(1) and STATE(1);
G0_4_5 <= RETRY_CNT(4) and RETRY_CNT(5) and RETRY_CNT(6) and RETRY_CNT(7);
G0_0_1 <= LOCK_REG and STATE(1) and TIMER(0);
N_25_I <= (not G0_0_1 and G0_0_1_0) or 
	(N_50 and G0_0_1_0) or 
	(G0_0_1_0 and NEXT_STATE10);
G_11_0_1_1 <= (not M11_E_5 and STATE(1)) or 
	(not M11_E_4 and STATE(1)) or 
	(not M11_E_5 and STATE(5)) or 
	(not M11_E_4 and STATE(5));
N_19_FAST <= (ALIGN_STATUS_FF(0) and LOCK_REG and STATE(6)) or 
	(not LOCK_REG and STATE_FAST(0));
N_19_REP1 <= (ALIGN_STATUS_FF(0) and LOCK_REG and STATE(6)) or 
	(not LOCK_REG and STATE_0_REP1);
N_8 <= (G_11_0_1) or 
	(G_11_0_1_0 and G_11_0_1_1 and G_11_0_A3_5);
TIMER_RNI1DJP(5) <= (TIMER(5)) or 
	(TIMER(6)) or 
	(TIMER(7));
G_11_0_1_0 <= not TIMER(4) and not TIMER(5) and not TIMER(6) and not TIMER(7);
PHASEE_0(3) <= (N_63_I_I and TIMER_RNIND5J1(1) and not UN1_STATE_4_I_O2_1) or 
	(not TIMER_RNIND5J1(1) and PHASE_Q_6) or 
	(N_63_I_I and PHASE_Q_6) or 
	(UN1_STATE_4_I_O2_1 and PHASE_Q_6);
PHASEE_0(2) <= (N_59_I_I and TIMER_RNIND5J1(1) and not UN1_STATE_4_I_O2_1) or 
	(not TIMER_RNIND5J1(1) and PHASE_Q_5) or 
	(N_59_I_I and PHASE_Q_5) or 
	(UN1_STATE_4_I_O2_1 and PHASE_Q_5);
PHASEE_0(1) <= (TIMER_RNIND5J1(1) and not UN1_STATE_4_I_O2_1 and \PHASE_Q_\ and not PHASE_Q_4) or 
	(not \PHASE_Q_\ and PHASE_Q_4) or 
	(not TIMER_RNIND5J1(1) and PHASE_Q_4) or 
	(UN1_STATE_4_I_O2_1 and PHASE_Q_4);
G0_13_SX <= (not TIMER(7)) or 
	(not TIMER(6)) or 
	(not TIMER(5)) or 
	(not TIMER(1));
N_50 <= (not TIMER(4)) or 
	(not TIMER(3)) or 
	(not TIMER(2)) or 
	(G0_13_SX);
STATE_NS_0_I_O2_RNO(5) <= (not TIMER(4)) or 
	(not TIMER(3)) or 
	(not TIMER(2));
N_60 <= (STATE_NS_0_I_O2_RNO(5)) or 
	(G0_13_SX) or 
	(TIMER(0));
UN1_STATE_4_I_1 <= STATE(1) and not TIMER(0) and TIMER(1) and not TIMER(2);
N_5 <= (STATE_0_REP1) or 
	(not N_48 and not TIMER(3) and UN1_STATE_4_I_1);
G0_1 <= not STATE(1) and not STATE(5);
TIMERE_0_I <= (G0_1 and not STATE_FAST(6)) or 
	(G0_4) or 
	(G0_5);
G0_0_1_0 <= (not N_82_0_0_0 and not STATE_NS_0_I_A2_1_2(4) and not STATE_NS_I_I_0(1)) or 
	(not N_82_0_0_0 and G0_0_1_0_1 and not STATE_NS_I_I_0(1));
G0_0_1_0_1 <= (not LAST_ALIGN_STATUS_0_8(5)) or 
	(LAST_ALIGN_STATUS_0(0)) or 
	(LAST_ALIGN_STATUS_0(1)) or 
	(STATE(1));
N_33_FAST <= (not N_53 and not ALIGN_STATUS_FF(0) and STATE_FAST(6)) or 
	(STATE_NS_0_I_S_0(6));
N_33_REP1 <= (not N_53 and not ALIGN_STATUS_FF(0) and STATE_6_REP1) or 
	(STATE_NS_0_I_S_0(6));
N_256_0 <= (G0_0_1 and not N_50 and not G0_4_0) or 
	(G0_0_1 and not N_50 and not G0_5_0);
\TIMER_CRY_0[0]\: CCU2C 
generic map(
  INIT0 => X"0a0c",
  INIT1 => X"0600",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
A0 => GND,
B0 => VCC,
C0 => GND,
D0 => VCC,
A1 => TIMER(0),
B1 => GND,
C1 => GND,
D1 => VCC,
CIN => GND,
COUT => TIMER_CRY(0),
S0 => TIMER_CRY_0_S0(0),
S1 => TIMER_S(0));
\TIMER_CRY_0[1]\: CCU2C 
generic map(
  INIT0 => X"0600",
  INIT1 => X"0600",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
A0 => TIMER(1),
B0 => GND,
C0 => GND,
D0 => VCC,
A1 => TIMER(2),
B1 => GND,
C1 => GND,
D1 => VCC,
CIN => TIMER_CRY(0),
COUT => TIMER_CRY(2),
S0 => TIMER_S(1),
S1 => TIMER_S(2));
\TIMER_CRY_0[3]\: CCU2C 
generic map(
  INIT0 => X"0600",
  INIT1 => X"0600",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
A0 => TIMER(3),
B0 => GND,
C0 => GND,
D0 => VCC,
A1 => TIMER(4),
B1 => GND,
C1 => GND,
D1 => VCC,
CIN => TIMER_CRY(2),
COUT => TIMER_CRY(4),
S0 => TIMER_S(3),
S1 => TIMER_S(4));
\TIMER_CRY_0[5]\: CCU2C 
generic map(
  INIT0 => X"0600",
  INIT1 => X"0600",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
A0 => TIMER(5),
B0 => GND,
C0 => GND,
D0 => VCC,
A1 => TIMER(6),
B1 => GND,
C1 => GND,
D1 => VCC,
CIN => TIMER_CRY(4),
COUT => TIMER_CRY(6),
S0 => TIMER_S(5),
S1 => TIMER_S(6));
\TIMER_S_0[7]\: CCU2C 
generic map(
  INIT0 => X"060a",
  INIT1 => X"0a0c",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
A0 => TIMER(7),
B0 => GND,
C0 => GND,
D0 => VCC,
A1 => GND,
B1 => GND,
C1 => GND,
D1 => VCC,
CIN => TIMER_CRY(6),
COUT => TIMER_S_0_COUT(7),
S0 => TIMER_S(7),
S1 => TIMER_S_0_S1(7));
\RETRY_CNT_CRY_0[0]\: CCU2C 
generic map(
  INIT0 => X"0a0c",
  INIT1 => X"0600",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
A0 => GND,
B0 => VCC,
C0 => GND,
D0 => VCC,
A1 => RETRY_CNT(0),
B1 => GND,
C1 => GND,
D1 => VCC,
CIN => GND,
COUT => RETRY_CNT_CRY(0),
S0 => RETRY_CNT_CRY_0_S0(0),
S1 => RETRY_CNT_S(0));
\RETRY_CNT_CRY_0[1]\: CCU2C 
generic map(
  INIT0 => X"0600",
  INIT1 => X"0600",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
A0 => RETRY_CNT(1),
B0 => GND,
C0 => GND,
D0 => VCC,
A1 => RETRY_CNT(2),
B1 => GND,
C1 => GND,
D1 => VCC,
CIN => RETRY_CNT_CRY(0),
COUT => RETRY_CNT_CRY(2),
S0 => RETRY_CNT_S(1),
S1 => RETRY_CNT_S(2));
\RETRY_CNT_CRY_0[3]\: CCU2C 
generic map(
  INIT0 => X"0600",
  INIT1 => X"0600",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
A0 => RETRY_CNT(3),
B0 => GND,
C0 => GND,
D0 => VCC,
A1 => RETRY_CNT(4),
B1 => GND,
C1 => GND,
D1 => VCC,
CIN => RETRY_CNT_CRY(2),
COUT => RETRY_CNT_CRY(4),
S0 => RETRY_CNT_S(3),
S1 => RETRY_CNT_S(4));
\RETRY_CNT_CRY_0[5]\: CCU2C 
generic map(
  INIT0 => X"0600",
  INIT1 => X"0600",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
A0 => RETRY_CNT(5),
B0 => GND,
C0 => GND,
D0 => VCC,
A1 => RETRY_CNT(6),
B1 => GND,
C1 => GND,
D1 => VCC,
CIN => RETRY_CNT_CRY(4),
COUT => RETRY_CNT_CRY(6),
S0 => RETRY_CNT_S(5),
S1 => RETRY_CNT_S(6));
\RETRY_CNT_S_0[7]\: CCU2C 
generic map(
  INIT0 => X"060a",
  INIT1 => X"0a0c",
  INJECT1_0 => "NO",
  INJECT1_1 => "NO"
)
port map (
A0 => RETRY_CNT(7),
B0 => GND,
C0 => GND,
D0 => VCC,
A1 => GND,
B1 => GND,
C1 => GND,
D1 => VCC,
CIN => RETRY_CNT_CRY(6),
COUT => RETRY_CNT_S_0_COUT(7),
S0 => RETRY_CNT_S(7),
S1 => RETRY_CNT_S_0_S1(7));
RST_DP_OUT_INST_REG_Z443: FD1S3DX port map (
D => RST_DP_IN,
CK => refclk,
CD => reset,
Q => pll_reset_datapath);
RST_DP_STOP_INST_REG_Z445: FD1S3DX port map (
D => RST_DP_IN_STOP,
CK => refclk,
CD => reset,
Q => pll_stop);
GND_0 <= '0';
VCC_0 <= '1';
phase_Q(0) <= \PHASE_Q_\;
phase_Q(1) <= PHASE_Q_4;
phase_Q(2) <= PHASE_Q_5;
phase_Q(3) <= PHASE_Q_6;
err <= ERR_7;
end beh;

--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library synplify;
use synplify.components.all;
library ecp3;
use ecp3.components.all;

entity ddr3_clks is
port(
reset :  in std_logic;
reset_datapath :  in std_logic;
refclk :  in std_logic;
eclk :  out std_logic;
sclk :  in std_logic;
sclk2x :  in std_logic;
all_lock :  out std_logic;
reset_datapath_out :  out std_logic;
align_status : out std_logic_vector(1 downto 0);
good :  out std_logic;
err :  out std_logic;
uddcntln :  in std_logic;
dqsdel :  out std_logic;
pll_phase : out std_logic_vector(3 downto 0);
pll_lock :  in std_logic;
clkos :  in std_logic);
attribute syn_keep : boolean;
attribute syn_keep of eclk: signal is true;
attribute syn_keep of sclk: signal is true;
attribute syn_keep of sclk2x: signal is true;
end ddr3_clks;

architecture beh of ddr3_clks is
signal PHASE_Q : std_logic_vector(3 downto 0);
signal ALIGN_STATUS_SIG : std_logic_vector(1 downto 0);
signal ECLK_11 : std_logic ;
signal RESET_DATAPATH_OUT_13 : std_logic ;
signal DDRDLL_LOCK : std_logic ;
signal PLL_RESET_DATAPATH : std_logic ;
signal PLL_STOP : std_logic ;
signal GOOD_OUT : std_logic ;
signal CLKOS_1 : std_logic ;
signal STOP_0 : std_logic ;
signal STOP : std_logic ;
signal ECLK_I : std_logic ;
signal ALL_LOCK_12 : std_logic ;
signal RESET_FILTER_1_0_I : std_logic ;
signal \ALIGN_STATUS_\ : std_logic ;
signal ALIGN_STATUS_15 : std_logic ;
signal GND : std_logic ;
signal VCC : std_logic ;
signal GOOD_QN : std_logic ;
signal GND_0 : std_logic ;
signal VCC_0 : std_logic ;
component ECLKSYNCA
port(
ECLKI :  in std_logic;
STOP :  in std_logic;
ECLKO :  out std_logic  );
end component;
component DQSDLLB
generic (LOCK_SENSITIVITY : in string);
port(
CLK :  in std_logic;
RST :  in std_logic;
UDDCNTLN :  in std_logic;
LOCK :  out std_logic;
DQSDEL :  out std_logic  );
end component;
component ddr3_clks_pll_control
port(
align_status : in std_logic_vector(1 downto 0);
phase_Q : out std_logic_vector(3 downto 0);
pll_stop :  out std_logic;
pll_reset_datapath :  out std_logic;
GND :  in std_logic;
good_out :  out std_logic;
all_lock :  in std_logic;
reset_datapath :  in std_logic;
err :  out std_logic;
VCC :  in std_logic;
reset :  in std_logic;
refclk :  in std_logic  );
end component;
component ddr3_clks_clk_stop
port(
stop_0 :  out std_logic;
reset_filter_1_0_i :  out std_logic;
GND :  in std_logic;
pll_stop :  in std_logic;
reset_datapath_out :  out std_logic;
pll_reset_datapath :  in std_logic;
VCC :  in std_logic;
reset :  in std_logic;
clkos_1 :  in std_logic  );
end component;
component ddr3_clks_clk_phase
port(
align_status_sig : out std_logic_vector(1 downto 0);
sclk :  in std_logic;
clkos_1 :  in std_logic;
VCC :  in std_logic;
reset_datapath_out :  in std_logic;
eclk :  in std_logic  );
end component;
component ddr3_clks_jitter_filter
port(
align_status_sig : in std_logic_vector(0 downto 0);
align_status : out std_logic_vector(0 downto 0);
GND :  in std_logic;
VCC :  in std_logic;
reset :  in std_logic;
sclk :  in std_logic  );
end component;
component ddr3_clks_jitter_filter_1
port(
align_status_sig : in std_logic_vector(1 downto 1);
align_status : out std_logic_vector(1 downto 1);
GND :  in std_logic;
VCC :  in std_logic;
reset_filter_1_0_i :  in std_logic;
sclk :  in std_logic  );
end component;

attribute HGROUP : string;
attribute PBBOX : string;
attribute HGROUP of CLK_STOP : label is "clk_stop";
attribute PBBOX of CLK_STOP : label is "3,2";

begin
VCC_0_Z51: VHI port map (
Z => VCC);
GND_0_Z52: VLO port map (
Z => GND);
GOOD_REG_Z54: FD1S3DX port map (
D => GOOD_OUT,
CK => sclk,
CD => reset,
Q => good);
ALL_LOCK_12 <= DDRDLL_LOCK and pll_lock;
ECLK_11 <= ECLK_I;
pll_phase(3) <= PHASE_Q(3);
pll_phase(2) <= PHASE_Q(2);
pll_phase(1) <= PHASE_Q(1);
pll_phase(0) <= PHASE_Q(0);
STOP <= STOP_0;
CLKOS_1 <= clkos;
sync: ECLKSYNCA port map (
ECLKI => CLKOS_1,
STOP => STOP,
ECLKO => ECLK_I);
INST4_DQSDLLB: DQSDLLB 
generic map( 
  LOCK_SENSITIVITY => "LOW"
) 
port map (
CLK => sclk2x,
RST => reset,
UDDCNTLN => uddcntln,
LOCK => DDRDLL_LOCK,
DQSDEL => dqsdel);
PLL_CONTROL: ddr3_clks_pll_control port map (
align_status(0) => \ALIGN_STATUS_\,
align_status(1) => ALIGN_STATUS_15,
phase_Q(0) => PHASE_Q(0),
phase_Q(1) => PHASE_Q(1),
phase_Q(2) => PHASE_Q(2),
phase_Q(3) => PHASE_Q(3),
pll_stop => PLL_STOP,
pll_reset_datapath => PLL_RESET_DATAPATH,
GND => GND,
good_out => GOOD_OUT,
all_lock => ALL_LOCK_12,
reset_datapath => reset_datapath,
err => err,
VCC => VCC,
reset => reset,
refclk => refclk);
CLK_STOP: ddr3_clks_clk_stop port map (
stop_0 => STOP_0,
reset_filter_1_0_i => RESET_FILTER_1_0_I,
GND => GND,
pll_stop => PLL_STOP,
reset_datapath_out => RESET_DATAPATH_OUT_13,
pll_reset_datapath => PLL_RESET_DATAPATH,
VCC => VCC,
reset => reset,
clkos_1 => CLKOS_1);
CLK_PHASE: ddr3_clks_clk_phase port map (
align_status_sig(0) => ALIGN_STATUS_SIG(0),
align_status_sig(1) => ALIGN_STATUS_SIG(1),
sclk => sclk,
clkos_1 => CLKOS_1,
VCC => VCC,
reset_datapath_out => RESET_DATAPATH_OUT_13,
eclk => ECLK_11);
FILTER_0: ddr3_clks_jitter_filter port map (
align_status_sig(0) => ALIGN_STATUS_SIG(0),
align_status(0) => \ALIGN_STATUS_\,
GND => GND,
VCC => VCC,
reset => reset,
sclk => sclk);
FILTER_1: ddr3_clks_jitter_filter_1 port map (
align_status_sig(1) => ALIGN_STATUS_SIG(1),
align_status(1) => ALIGN_STATUS_15,
GND => GND,
VCC => VCC,
reset_filter_1_0_i => RESET_FILTER_1_0_I,
sclk => sclk);
GND_0 <= '0';
VCC_0 <= '1';
eclk <= ECLK_11;
all_lock <= ALL_LOCK_12;
reset_datapath_out <= RESET_DATAPATH_OUT_13;
align_status(0) <= \ALIGN_STATUS_\;
align_status(1) <= ALIGN_STATUS_15;
end beh;

