library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library lifmd;
use lifmd.components.all;

entity gddr_sync is
port(
  rst :  in std_logic;
  sync_clk :  in std_logic;
  start :  in std_logic;
  stop :  out std_logic;
  ddr_reset :  out std_logic;
  ready :  out std_logic);
end gddr_sync;

architecture beh of gddr_sync is
  signal STOP_ASSERT : std_logic_vector(2 downto 0);
  signal CS_GDDR_SYNC : std_logic_vector(1 to 1);
  signal CTRL_CNT : std_logic_vector(3 downto 0);
  signal CTRL_CNT_3 : std_logic_vector(3 downto 0);
  signal STOP_ASSERT_4 : std_logic_vector(2 downto 0);
  signal UN1_NS_GDDR_SYNC16 : std_logic_vector(0 to 0);
  signal CS_GDDR_SYNC_FAST : std_logic_vector(1 to 1);
  signal CTRL_CNT_3_MB_1 : std_logic_vector(1 downto 0);
  signal CS_GDDR_SYNC_QN : std_logic_vector(2 downto 0);
  signal CS_GDDR_SYNC_FAST_QN : std_logic_vector(1 to 1);
  signal CTRL_CNT_QN : std_logic_vector(3 downto 0);
  signal STOP_ASSERT_QN : std_logic_vector(2 downto 0);
  signal CS_GDDR_SYNC_RNO_1 : std_logic_vector(0 to 0);
  signal CS_GDDR_SYNC_RNO_0 : std_logic_vector(0 to 0);
  signal RESET_FLAG : std_logic ;
  signal DDR_RESET_D : std_logic ;
  signal UN1_NS_GDDR_SYNC36_1 : std_logic ;
  signal N_93 : std_logic ;
  signal N_79 : std_logic ;
  signal N_90 : std_logic ;
  signal CO0 : std_logic ;
  signal NS_GDDR_SYNC33_1 : std_logic ;
  signal CO0_0 : std_logic ;
  signal RESET_FLAG_1_SQMUXA_I : std_logic ;
  signal N_68_I : std_logic ;
  signal UN1_NS_GDDR_SYNC_1_SQMUXA_0_34_1 : std_logic ;
  signal RESET_FLAG_1_SQMUXA_I_1 : std_logic ;
  signal CO2_0_0_0_1 : std_logic ;
  signal N_79_FAST : std_logic ;
  signal G0_MB_1 : std_logic ;
  signal N_68_I_1_1 : std_logic ;
  signal STOP_3 : std_logic ;
  signal READY_4 : std_logic ;
  signal DDR_RESET_D_QN : std_logic ;
  signal RESET_FLAG_QN : std_logic ;
  signal READY_I : std_logic ;
begin
RESET_FLAG_RNO: INV port map (
    A => READY_4,
    Z => READY_I);
\CS_GDDR_SYNC_RNO[0]\: PFUMX port map (
    ALUT => CS_GDDR_SYNC_RNO_0(0),
    BLUT => CS_GDDR_SYNC_RNO_1(0),
    C0 => RESET_FLAG,
    Z => N_68_I);
CS_GDDR_SYNC_RNO_0(0) <= (not READY_4 and N_90 and STOP_3) or 
	(not READY_4 and CS_GDDR_SYNC(1) and STOP_3);
CS_GDDR_SYNC_RNO_1(0) <= (not READY_4 and STOP_3) or 
	(not READY_4 and STOP_ASSERT(1) and N_68_I_1_1);
\STOP_ASSERT[0]_REG_Z85\: FD1S3DX port map (
    D => STOP_ASSERT_4(0),
    CK => sync_clk,
    CD => rst,
    Q => STOP_ASSERT(0));
\STOP_ASSERT[1]_REG_Z87\: FD1S3DX port map (
    D => STOP_ASSERT_4(1),
    CK => sync_clk,
    CD => rst,
    Q => STOP_ASSERT(1));
\STOP_ASSERT[2]_REG_Z89\: FD1S3DX port map (
    D => STOP_ASSERT_4(2),
    CK => sync_clk,
    CD => rst,
    Q => STOP_ASSERT(2));
RESET_FLAG_REG_Z91: FD1P3DX port map (
    D => READY_I,
    SP => RESET_FLAG_1_SQMUXA_I,
    CK => sync_clk,
    CD => rst,
    Q => RESET_FLAG);
DDR_RESET_D_REG_Z93: FD1S3BX port map (
    D => '0',
    CK => sync_clk,
    PD => rst,
    Q => DDR_RESET_D);
\CTRL_CNT[0]_REG_Z95\: FD1S3DX port map (
    D => CTRL_CNT_3(0),
    CK => sync_clk,
    CD => rst,
    Q => CTRL_CNT(0));
\CTRL_CNT[1]_REG_Z97\: FD1S3DX port map (
    D => CTRL_CNT_3(1),
    CK => sync_clk,
    CD => rst,
    Q => CTRL_CNT(1));
\CTRL_CNT[2]_REG_Z99\: FD1S3DX port map (
    D => CTRL_CNT_3(2),
    CK => sync_clk,
    CD => rst,
    Q => CTRL_CNT(2));
\CTRL_CNT[3]_REG_Z101\: FD1S3DX port map (
    D => CTRL_CNT_3(3),
    CK => sync_clk,
    CD => rst,
    Q => CTRL_CNT(3));
\CS_GDDR_SYNC[0]_REG_Z103\: FD1P3DX port map (
    D => N_68_I,
    SP => UN1_NS_GDDR_SYNC36_1,
    CK => sync_clk,
    CD => rst,
    Q => STOP_3);
\CS_GDDR_SYNC[1]_REG_Z105\: FD1P3DX port map (
    D => N_79,
    SP => UN1_NS_GDDR_SYNC36_1,
    CK => sync_clk,
    CD => rst,
    Q => CS_GDDR_SYNC(1));
\CS_GDDR_SYNC_FAST[1]_REG_Z107\: FD1P3DX port map (
    D => N_79_FAST,
    SP => UN1_NS_GDDR_SYNC36_1,
    CK => sync_clk,
    CD => rst,
    Q => CS_GDDR_SYNC_FAST(1));
\CS_GDDR_SYNC[2]_REG_Z109\: FD1P3DX port map (
    D => N_93,
    SP => UN1_NS_GDDR_SYNC36_1,
    CK => sync_clk,
    CD => rst,
    Q => READY_4);
CTRL_CNT_3(2) <= (CO0 and CTRL_CNT(1) and not CTRL_CNT(2) and not UN1_NS_GDDR_SYNC16(0)) or 
	(not CTRL_CNT(1) and CTRL_CNT(2) and not UN1_NS_GDDR_SYNC16(0)) or 
	(not CO0 and CTRL_CNT(2) and not UN1_NS_GDDR_SYNC16(0));
N_79 <= (not N_90 and STOP_3 and not CS_GDDR_SYNC(1) and not RESET_FLAG) or 
	(N_90 and CS_GDDR_SYNC(1));
STOP_ASSERT_4(2) <= (CO0_0 and STOP_ASSERT(1) and not STOP_ASSERT(2)) or 
	(not STOP_ASSERT(1) and STOP_ASSERT(2)) or 
	(not CO0_0 and STOP_ASSERT(2));
STOP_ASSERT_4(1) <= (CO0_0 and not STOP_ASSERT(1)) or 
	(not CO0_0 and STOP_ASSERT(1));
STOP_ASSERT_4(0) <= (not RESET_FLAG and start and not STOP_ASSERT(0) and not STOP_ASSERT(2)) or 
	(not start and STOP_ASSERT(0)) or 
	(RESET_FLAG and STOP_ASSERT(0)) or 
	(STOP_ASSERT(0) and STOP_ASSERT(2));
UN1_NS_GDDR_SYNC36_1 <= (STOP_3 and not READY_4) or 
	(not STOP_3 and not CS_GDDR_SYNC(1));
CO0_0 <= not RESET_FLAG and start and STOP_ASSERT(0) and not STOP_ASSERT(2);
ddr_reset <= (CS_GDDR_SYNC(1)) or 
	(DDR_RESET_D);
CO0 <= CTRL_CNT(0) and not CTRL_CNT(3);
UN1_NS_GDDR_SYNC_1_SQMUXA_0_34_1 <= not STOP_3 and CTRL_CNT(1) and CTRL_CNT(2) and RESET_FLAG;
N_93 <= (READY_4 and start) or 
	(CO0 and start and UN1_NS_GDDR_SYNC_1_SQMUXA_0_34_1);
RESET_FLAG_1_SQMUXA_I_1 <= (READY_4 and not start) or 
	(not CS_GDDR_SYNC(1) and not READY_4) or 
	(not STOP_3 and not READY_4);
RESET_FLAG_1_SQMUXA_I <= (not N_90 and not READY_4 and not RESET_FLAG_1_SQMUXA_I_1) or 
	(READY_4 and NS_GDDR_SYNC33_1 and RESET_FLAG_1_SQMUXA_I_1);
UN1_NS_GDDR_SYNC16(0) <= (not READY_4 and NS_GDDR_SYNC33_1 and not RESET_FLAG) or 
	(not N_90 and not NS_GDDR_SYNC33_1) or 
	(not N_90 and READY_4);
CO2_0_0_0_1 <= CTRL_CNT(0) and CTRL_CNT(1) and CTRL_CNT(2) and not CTRL_CNT(3);
N_90 <= (not CTRL_CNT(1)) or 
	(not CTRL_CNT(0)) or 
	(CTRL_CNT(2)) or 
	(CTRL_CNT(3));
NS_GDDR_SYNC33_1 <= not STOP_3 and not CS_GDDR_SYNC_FAST(1);
N_79_FAST <= (not N_90 and STOP_3 and not CS_GDDR_SYNC_FAST(1) and not RESET_FLAG) or 
	(N_90 and CS_GDDR_SYNC_FAST(1));
CTRL_CNT_3_MB_1(1) <= (not READY_4 and NS_GDDR_SYNC33_1 and not RESET_FLAG) or 
	(not N_90 and not NS_GDDR_SYNC33_1) or 
	(not N_90 and READY_4);
CTRL_CNT_3(1) <= (CO0 and not CTRL_CNT(1) and not CTRL_CNT_3_MB_1(1)) or 
	(not CO0 and CTRL_CNT(1) and not CTRL_CNT_3_MB_1(1));
G0_MB_1 <= (not READY_4 and NS_GDDR_SYNC33_1 and not RESET_FLAG) or 
	(not N_90 and not NS_GDDR_SYNC33_1) or 
	(not N_90 and READY_4);
CTRL_CNT_3(3) <= (CO2_0_0_0_1 and not CTRL_CNT(3) and not G0_MB_1) or 
	(not CO2_0_0_0_1 and CTRL_CNT(3) and not G0_MB_1);
CTRL_CNT_3_MB_1(0) <= (not READY_4 and NS_GDDR_SYNC33_1 and not RESET_FLAG) or 
	(not N_90 and not NS_GDDR_SYNC33_1) or 
	(not N_90 and READY_4);
CTRL_CNT_3(0) <= (not CTRL_CNT(0) and not CTRL_CNT(3) and not CTRL_CNT_3_MB_1(0)) or 
	(CTRL_CNT(0) and CTRL_CNT(3) and not CTRL_CNT_3_MB_1(0));
N_68_I_1_1 <= start and STOP_ASSERT(0) and not STOP_ASSERT(2);
stop <= STOP_3;
ready <= READY_4;
end beh;

