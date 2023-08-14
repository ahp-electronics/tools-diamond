-- --------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------
-- Copyright (c) 2005-2011 by Lattice Semiconductor Corporation
-- --------------------------------------------------------------------
--
--
--                     Lattice Semiconductor Corporation
--                     5555 NE Moore Court
--                     Hillsboro, OR 97214
--                     U.S.A.
--
--                     TEL: 1-800-Lattice  (USA and Canada)
--                          1-408-826-6000 (other locations)
--
--                     web: http://www.latticesemi.com/
--                     email: techsupport@latticesemi.com
--
-- --------------------------------------------------------------------
--
-- Simulation Library File for MACHXO2
--
-- fpga\vhdl\pkg\vhdsclibs\data\machxo2\src\MACHXO2_MISC.vhd 1.40 02-MAR-2011 09:18:27 IALMOHAN
--
--

--
-----cell dp8kc----
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.vital_timing.all;
use ieee.vital_primitives.all;
use ieee.std_logic_unsigned.all;
use work.global.gsrnet;
use work.global.purnet;
use work.mem3.all;

-- entity declaration --
ENTITY dp8kc IS
   GENERIC (
        DATA_WIDTH_A               : Integer  := 9;
        DATA_WIDTH_B               : Integer  := 9;
        REGMODE_A                  : String  := "NOREG";
        REGMODE_B                  : String  := "NOREG";
        CSDECODE_A                 : string  := "0b000";
        CSDECODE_B                 : string  := "0b000";
        WRITEMODE_A                : String  := "NORMAL";
        WRITEMODE_B                : String  := "NORMAL";
        GSR                        : String  := "ENABLED";
        RESETMODE                  : String  := "SYNC";
        ASYNC_RESET_RELEASE        : String  := "SYNC";
        INIT_DATA                  : String  := "STATIC";
        initval_00 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_01 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_02 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_03 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_04 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_05 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_06 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_07 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_08 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_09 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0a : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0b : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0c : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0d : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0e : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0f : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_10 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_11 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_12 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_13 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_14 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_15 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_16 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_17 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_18 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_19 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1a : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1b : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1c : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1d : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1e : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1f : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";

        -- miscellaneous vital GENERICs
        TimingChecksOn  : boolean := FALSE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := FALSE;
        InstancePath    : string  := "dp8kc";

        -- input SIGNAL delays
        tipd_ada12 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ada11 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ada10 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ada9 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ada8 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ada7 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ada6 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ada5 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ada4 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ada3 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ada2 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ada1 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ada0 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dia8  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dia7  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dia6  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dia5  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dia4  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dia3  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dia2  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dia1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dia0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_clka  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_cea   : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ocea  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_wea  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_csa0 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_csa1 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_csa2 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rsta : VitalDelayType01 := (0.0 ns, 0.0 ns);

        tipd_adb12 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_adb11 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_adb10 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_adb9 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_adb8 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_adb7 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_adb6 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_adb5 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_adb4 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_adb3 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_adb2 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_adb1 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_adb0 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dib8  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dib7  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dib6  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dib5  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dib4  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dib3  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dib2  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dib1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dib0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_clkb  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ceb   : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_oceb  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_web  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_csb0 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_csb1 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_csb2 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rstb : VitalDelayType01 := (0.0 ns, 0.0 ns)
  );

   PORT(
        DIA8, DIA7, DIA6, DIA5, DIA4, DIA3, DIA2, DIA1, DIA0         : in std_logic := 'X';
        ADA12, ADA11, ADA10, ADA9, ADA8, ADA7, ADA6, ADA5            : in std_logic := 'X';
        ADA4,  ADA3,  ADA2, ADA1, ADA0                               : in std_logic := 'X';
        CEA, OCEA, CLKA, WEA, CSA2, CSA1, CSA0, RSTA                 : in std_logic := 'X';
        DIB8, DIB7, DIB6, DIB5, DIB4, DIB3, DIB2, DIB1, DIB0         : in std_logic := 'X';
        ADB12, ADB11, ADB10, ADB9, ADB8, ADB7, ADB6, ADB5            : in std_logic := 'X';
        ADB4,  ADB3,  ADB2, ADB1, ADB0                               : in std_logic := 'X';
        CEB, OCEB, CLKB, WEB, CSB2, CSB1, CSB0, RSTB                 : in std_logic := 'X';
        DOA8, DOA7, DOA6, DOA5, DOA4, DOA3, DOA2, DOA1, DOA0         : out std_logic := 'X';
        DOB8, DOB7, DOB6, DOB5, DOB4, DOB3, DOB2, DOB1, DOB0         : out std_logic := 'X'
  );

      ATTRIBUTE Vital_Level0 OF dp8kc : ENTITY IS TRUE;

END dp8kc ;

-- ARCHITECTURE body --
ARCHITECTURE V OF dp8kc IS
    ATTRIBUTE Vital_Level0 OF V : ARCHITECTURE IS TRUE;

--SIGNAL DECLARATIONS----

    SIGNAL ada_ipd   : std_logic_vector(12 downto 0) := (others => '0');
    SIGNAL dia_ipd   : std_logic_vector(8 downto 0) := (others => '0');
    SIGNAL clka_ipd  : std_logic := '0';
    SIGNAL cea_ipd   : std_logic := '0';
    SIGNAL ocea_ipd  : std_logic := '0';
    SIGNAL wrea_ipd  : std_logic := '0';
    SIGNAL csa_ipd   : std_logic_vector(2 downto 0) := "000";
    SIGNAL rsta_ipd  : std_logic := '0';
    SIGNAL adb_ipd   : std_logic_vector(12 downto 0) := "XXXXXXXXXXXXX";
    SIGNAL dib_ipd   : std_logic_vector(8 downto 0) := "XXXXXXXXX";
    SIGNAL clkb_ipd  : std_logic := '0';
    SIGNAL ceb_ipd   : std_logic := '0';
    SIGNAL oceb_ipd  : std_logic := '0';
    SIGNAL wreb_ipd  : std_logic := '0';
    SIGNAL csb_ipd   : std_logic_vector(2 downto 0) := "000";
    SIGNAL rstb_ipd  : std_logic := '0';
    SIGNAL csa_en    : std_logic := '0';
    SIGNAL csb_en    : std_logic := '0';
    SIGNAL csa_en_reg    : std_logic := '0';
    SIGNAL csb_en_reg    : std_logic := '0';
    SIGNAL g_reset   : std_logic := '0';
    SIGNAL pur_reset : std_logic := '0';
    CONSTANT ADDR_WIDTH_A : integer := data2addr_w(DATA_WIDTH_A); 
    CONSTANT ADDR_WIDTH_B : integer := data2addr_w(DATA_WIDTH_B); 
    CONSTANT new_data_width_a : integer := data2data_w(DATA_WIDTH_A); 
    CONSTANT new_data_width_b : integer := data2data_w(DATA_WIDTH_B); 
    CONSTANT div_a    : integer := data2data(DATA_WIDTH_A); 
    CONSTANT div_b    : integer := data2data(DATA_WIDTH_B); 
    SIGNAL dia_node   : std_logic_vector((new_data_width_a - 1) downto 0) := (others => '0');
    SIGNAL dib_node   : std_logic_vector((new_data_width_b - 1) downto 0) := (others => '0');
    SIGNAL ada_node   : std_logic_vector((ADDR_WIDTH_A - 1) downto 0);
    SIGNAL adb_node   : std_logic_vector((ADDR_WIDTH_B - 1) downto 0);
    SIGNAL diab_node  : std_logic_vector(17 downto 0) := (others => '0');
    SIGNAL rsta_int   : std_logic := '0';
    SIGNAL rstb_int   : std_logic := '0';
    SIGNAL rsta_reg   : std_logic := '0';
    SIGNAL rstb_reg   : std_logic := '0';
    SIGNAL reseta     : std_logic := '0';
    SIGNAL resetb     : std_logic := '0';
    SIGNAL dia_reg    : std_logic_vector((new_data_width_a - 1) downto 0) := (others => '0');
    SIGNAL dib_reg    : std_logic_vector((new_data_width_b - 1) downto 0) := (others => '0');
    SIGNAL ada_reg    : std_logic_vector((ADDR_WIDTH_A - 1) downto 0);
    SIGNAL adb_reg    : std_logic_vector((ADDR_WIDTH_B - 1) downto 0);
    SIGNAL diab_reg   : std_logic_vector(17 downto 0) := (others => '0');
    SIGNAL bwa0_reg   : std_logic := '0';
    SIGNAL bwa1_reg   : std_logic := '0';
    SIGNAL bwb_reg    : std_logic := '0';
    SIGNAL clka_valid : std_logic := '0';
    SIGNAL clkb_valid : std_logic := '0';
    SIGNAL clka_valid1 : std_logic := '0';
    SIGNAL clkb_valid1 : std_logic := '0';
    SIGNAL clka_valid2 : std_logic := '0';
    SIGNAL clkb_valid2 : std_logic := '0';
    SIGNAL wrena_reg  : std_logic := '0';
    SIGNAL wrena_reg1 : std_logic := '0';
    SIGNAL wrenb_reg  : std_logic := '0';
    SIGNAL wrenb_reg1 : std_logic := '0';
    SIGNAL rena_reg   : std_logic := '0';
    SIGNAL rena_reg1  : std_logic := '0';
    SIGNAL renb_reg   : std_logic := '0';
    SIGNAL renb_reg1  : std_logic := '0';
    SIGNAL rsta_sig   : std_logic := '0';
    SIGNAL rsta_sig1   : std_logic := '0';
    SIGNAL rsta_sig2   : std_logic := '0';
    SIGNAL rstb_sig   : std_logic := '0';
    SIGNAL rstb_sig1   : std_logic := '0';
    SIGNAL rstb_sig2   : std_logic := '0';
    SIGNAL rsta_node1   : std_logic := '0';
    SIGNAL rsta_node2   : std_logic := '0';
    SIGNAL rsta_node   : std_logic := '0';
    SIGNAL rstb_node1   : std_logic := '0';
    SIGNAL rstb_node2   : std_logic := '0';
    SIGNAL rstb_node   : std_logic := '0';
    SIGNAL doa_node   : std_logic_vector(8 downto 0) := (others => '0');
    SIGNAL doa_node_tr   : std_logic_vector(8 downto 0) := (others => '0');
    SIGNAL doa_node_wt   : std_logic_vector(8 downto 0) := (others => '0');
    SIGNAL doa_node_rbr   : std_logic_vector(8 downto 0) := (others => '0');
    SIGNAL dob_node   : std_logic_vector(8 downto 0) := (others => '0');
    SIGNAL dob_node_tr   : std_logic_vector(8 downto 0) := (others => '0');
    SIGNAL dob_node_wt   : std_logic_vector(8 downto 0) := (others => '0');
    SIGNAL dob_node_rbr   : std_logic_vector(8 downto 0) := (others => '0');
    SIGNAL doa_reg    : std_logic_vector(8 downto 0) := (others => '0');
    SIGNAL dob_reg    : std_logic_vector(8 downto 0) := (others => '0');
    SIGNAL doab_reg   : std_logic_vector(8 downto 0) := (others => '0');
    SIGNAL doa_int    : std_logic_vector(8 downto 0) := (others => '0');
    SIGNAL dob_int    : std_logic_vector(8 downto 0) := (others => '0');

	 --write & read/write collision flags
	 signal wr_a_wr_b_coll : std_logic := '0';
	 signal wr_a_rd_b_coll : std_logic := '0';
	 signal rd_a_wr_b_coll : std_logic := '0';
	 --lower & upper collision addresses
    signal dn_coll_addr, up_coll_addr : integer;

    CONSTANT initval   : string(2560 downto 1) := (
      initval_1f(3 to 82)&initval_1e(3 to 82)&initval_1d(3 to 82)&initval_1c(3 to 82)&
      initval_1b(3 to 82)&initval_1a(3 to 82)&initval_19(3 to 82)&initval_18(3 to 82)&
      initval_17(3 to 82)&initval_16(3 to 82)&initval_15(3 to 82)&initval_14(3 to 82)&
      initval_13(3 to 82)&initval_12(3 to 82)&initval_11(3 to 82)&initval_10(3 to 82)&
      initval_0f(3 to 82)&initval_0e(3 to 82)&initval_0d(3 to 82)&initval_0c(3 to 82)&
      initval_0b(3 to 82)&initval_0a(3 to 82)&initval_09(3 to 82)&initval_08(3 to 82)&
      initval_07(3 to 82)&initval_06(3 to 82)&initval_05(3 to 82)&initval_04(3 to 82)&
      initval_03(3 to 82)&initval_02(3 to 82)&initval_01(3 to 82)&initval_00(3 to 82));
    SIGNAL MEM       : std_logic_vector(9215 downto 0) := init_ram (initval);
    SIGNAL j         : integer := 0;
BEGIN

   -----------------------
   -- input path delays
   -----------------------
   WireDelay : BLOCK
   BEGIN
   VitalWireDelay(ada_ipd(0), ada0, tipd_ada0);
   VitalWireDelay(ada_ipd(1), ada1, tipd_ada1);
   VitalWireDelay(ada_ipd(2), ada2, tipd_ada2);
   VitalWireDelay(ada_ipd(3), ada3, tipd_ada3);
   VitalWireDelay(ada_ipd(4), ada4, tipd_ada4);
   VitalWireDelay(ada_ipd(5), ada5, tipd_ada5);
   VitalWireDelay(ada_ipd(6), ada6, tipd_ada6);
   VitalWireDelay(ada_ipd(7), ada7, tipd_ada7);
   VitalWireDelay(ada_ipd(8), ada8, tipd_ada8);
   VitalWireDelay(ada_ipd(9), ada9, tipd_ada9);
   VitalWireDelay(ada_ipd(10), ada10, tipd_ada10);
   VitalWireDelay(ada_ipd(11), ada11, tipd_ada11);
   VitalWireDelay(ada_ipd(12), ada12, tipd_ada12);
   VitalWireDelay(dia_ipd(0), dia0, tipd_dia0);
   VitalWireDelay(dia_ipd(1), dia1, tipd_dia1);
   VitalWireDelay(dia_ipd(2), dia2, tipd_dia2);
   VitalWireDelay(dia_ipd(3), dia3, tipd_dia3);
   VitalWireDelay(dia_ipd(4), dia4, tipd_dia4);
   VitalWireDelay(dia_ipd(5), dia5, tipd_dia5);
   VitalWireDelay(dia_ipd(6), dia6, tipd_dia6);
   VitalWireDelay(dia_ipd(7), dia7, tipd_dia7);
   VitalWireDelay(dia_ipd(8), dia8, tipd_dia8);
   VitalWireDelay(clka_ipd, clka, tipd_clka);
   VitalWireDelay(wrea_ipd, wea, tipd_wea);
   VitalWireDelay(cea_ipd, cea, tipd_cea);
   VitalWireDelay(ocea_ipd, ocea, tipd_ocea);
   VitalWireDelay(csa_ipd(0), csa0, tipd_csa0);
   VitalWireDelay(csa_ipd(1), csa1, tipd_csa1);
   VitalWireDelay(csa_ipd(2), csa2, tipd_csa2);
   VitalWireDelay(rsta_ipd, rsta, tipd_rsta);
   VitalWireDelay(adb_ipd(0), adb0, tipd_adb0);
   VitalWireDelay(adb_ipd(1), adb1, tipd_adb1);
   VitalWireDelay(adb_ipd(2), adb2, tipd_adb2);
   VitalWireDelay(adb_ipd(3), adb3, tipd_adb3);
   VitalWireDelay(adb_ipd(4), adb4, tipd_adb4);
   VitalWireDelay(adb_ipd(5), adb5, tipd_adb5);
   VitalWireDelay(adb_ipd(6), adb6, tipd_adb6);
   VitalWireDelay(adb_ipd(7), adb7, tipd_adb7);
   VitalWireDelay(adb_ipd(8), adb8, tipd_adb8);
   VitalWireDelay(adb_ipd(9), adb9, tipd_adb9);
   VitalWireDelay(adb_ipd(10), adb10, tipd_adb10);
   VitalWireDelay(adb_ipd(11), adb11, tipd_adb11);
   VitalWireDelay(adb_ipd(12), adb12, tipd_adb12);
   VitalWireDelay(dib_ipd(0), dib0, tipd_dib0);
   VitalWireDelay(dib_ipd(1), dib1, tipd_dib1);
   VitalWireDelay(dib_ipd(2), dib2, tipd_dib2);
   VitalWireDelay(dib_ipd(3), dib3, tipd_dib3);
   VitalWireDelay(dib_ipd(4), dib4, tipd_dib4);
   VitalWireDelay(dib_ipd(5), dib5, tipd_dib5);
   VitalWireDelay(dib_ipd(6), dib6, tipd_dib6);
   VitalWireDelay(dib_ipd(7), dib7, tipd_dib7);
   VitalWireDelay(dib_ipd(8), dib8, tipd_dib8);
   VitalWireDelay(clkb_ipd, clkb, tipd_clkb);
   VitalWireDelay(wreb_ipd, web, tipd_web);
   VitalWireDelay(ceb_ipd, ceb, tipd_ceb);
   VitalWireDelay(oceb_ipd, oceb, tipd_oceb);
   VitalWireDelay(csb_ipd(0), csb0, tipd_csb0);
   VitalWireDelay(csb_ipd(1), csb1, tipd_csb1);
   VitalWireDelay(csb_ipd(2), csb2, tipd_csb2);
   VitalWireDelay(rstb_ipd, rstb, tipd_rstb);
   END BLOCK;

   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;

      pur_reset <= purnet;
    END PROCESS;

  rsta_sig1 <= rsta_ipd or (not g_reset);
  rstb_sig1 <= rstb_ipd or (not g_reset);

  rsta_node1 <= rsta_ipd or (not pur_reset);
  rstb_node1 <= rstb_ipd or (not pur_reset);

  P201 : PROCESS(clka_ipd, rsta_sig1)
  BEGIN
     IF (rsta_sig1 = '1') THEN
        rsta_sig2 <= '1';
     ELSIF (clka_ipd'event and clka_ipd = '1') THEN
        rsta_sig2 <= '0';
     END IF;
  END PROCESS;

  P202 : PROCESS(rsta_sig1, rsta_sig2)
  BEGIN
     IF ((ASYNC_RESET_RELEASE = "SYNC") and (RESETMODE = "ASYNC")) THEN
        rsta_sig <= rsta_sig2;
     ELSE
        rsta_sig <= rsta_sig1;
     END IF;
  END PROCESS;

  P203 : PROCESS(clkb_ipd, rstb_sig1)
  BEGIN
     IF (rstb_sig1 = '1') THEN
        rstb_sig2 <= '1';
     ELSIF (clkb_ipd'event and clkb_ipd = '1') THEN
        rstb_sig2 <= rstb_sig1;
     END IF;
  END PROCESS;
                                                                                              
  P204 : PROCESS(rstb_sig1, rstb_sig2)
  BEGIN
     IF ((ASYNC_RESET_RELEASE = "SYNC") and (RESETMODE = "ASYNC")) THEN
        rstb_sig <= rstb_sig2;
     ELSE
        rstb_sig <= rstb_sig1;
     END IF;
  END PROCESS;

  P205 : PROCESS(clka_ipd, rsta_node1)
  BEGIN
     IF (rsta_node1 = '1') THEN
        rsta_node2 <= '1';
     ELSIF (clka_ipd'event and clka_ipd = '1') THEN
        rsta_node2 <= '0';
     END IF;
  END PROCESS;
                                                                                   
  P206 : PROCESS(rsta_node1, rsta_node2)
  BEGIN
     IF ((ASYNC_RESET_RELEASE = "SYNC") and (RESETMODE = "ASYNC")) THEN
        rsta_node <= rsta_node1;
     ELSE
        rsta_node <= rsta_node1;
     END IF;
  END PROCESS;

  P207 : PROCESS(clkb_ipd, rstb_node1)
  BEGIN
     IF (rstb_node1 = '1') THEN
        rstb_node2 <= '1';
     ELSIF (clkb_ipd'event and clkb_ipd = '1') THEN
        rstb_node2 <= '0';
     END IF;
  END PROCESS;
                                                                                   
  P208 : PROCESS(rstb_node1, rstb_node2)
  BEGIN
     IF ((ASYNC_RESET_RELEASE = "SYNC") and (RESETMODE = "ASYNC")) THEN
        rstb_node <= rstb_node1;
     ELSE
        rstb_node <= rstb_node1;
     END IF;
  END PROCESS;

--   set_reset <= g_reset and (not reset_ipd);
  ada_node <= ada_ipd(12 downto (13 - ADDR_WIDTH_A));
  adb_node <= adb_ipd(12 downto (13 - ADDR_WIDTH_B));

-- chip select A decode
  P1 : PROCESS(csa_ipd)
  BEGIN
     IF (csa_ipd = "000" and CSDECODE_A = "0b000") THEN
        csa_en <= '1';
     ELSIF (csa_ipd = "001" and CSDECODE_A = "0b001") THEN
        csa_en <= '1';
     ELSIF (csa_ipd = "010" and CSDECODE_A = "0b010") THEN
        csa_en <= '1';
     ELSIF (csa_ipd = "011" and CSDECODE_A = "0b011") THEN
        csa_en <= '1';
     ELSIF (csa_ipd = "100" and CSDECODE_A = "0b100") THEN
        csa_en <= '1';
     ELSIF (csa_ipd = "101" and CSDECODE_A = "0b101") THEN
        csa_en <= '1';
     ELSIF (csa_ipd = "110" and CSDECODE_A = "0b110") THEN
        csa_en <= '1';
     ELSIF (csa_ipd = "111" and CSDECODE_A = "0b111") THEN
        csa_en <= '1';
     ELSE
        csa_en <= '0';
     END IF;
  END PROCESS;

  P2 : PROCESS(csb_ipd)
  BEGIN
     IF (csb_ipd = "000" and CSDECODE_B = "0b000") THEN
        csb_en <= '1';
     ELSIF (csb_ipd = "001" and CSDECODE_B = "0b001") THEN
        csb_en <= '1';
     ELSIF (csb_ipd = "010" and CSDECODE_B = "0b010") THEN
        csb_en <= '1';
     ELSIF (csb_ipd = "011" and CSDECODE_B = "0b011") THEN
        csb_en <= '1';
     ELSIF (csb_ipd = "100" and CSDECODE_B = "0b100") THEN
        csb_en <= '1';
     ELSIF (csb_ipd = "101" and CSDECODE_B = "0b101") THEN
        csb_en <= '1';
     ELSIF (csb_ipd = "110" and CSDECODE_B = "0b110") THEN
        csb_en <= '1';
     ELSIF (csb_ipd = "111" and CSDECODE_B = "0b111") THEN
        csb_en <= '1';
     ELSE
        csb_en <= '0';
     END IF;
  END PROCESS;

  P3 : PROCESS(dia_ipd)
  BEGIN
     CASE DATA_WIDTH_A IS
       WHEN 1 =>
        dia_node <= dia_ipd(1 downto 1);
       WHEN 2 =>
        dia_node <= (dia_ipd(5), dia_ipd(2));
       WHEN 4 =>
        dia_node <= dia_ipd(3 downto 0); 
       WHEN 9 =>
        dia_node <= dia_ipd(8 downto 0);
       WHEN 18 =>
        dia_node <= dia_ipd;
       WHEN others =>
          NULL;
     END CASE;
  END PROCESS;

  P4 : PROCESS(dib_ipd)
  BEGIN
     CASE DATA_WIDTH_B IS
       WHEN 1 =>
        dib_node <= dib_ipd(1 downto 1);
       WHEN 2 =>
        dib_node <= (dib_ipd(5), dib_ipd(2));
       WHEN 4 =>
        dib_node <= dib_ipd(3 downto 0); 
       WHEN 9 =>
        dib_node <= dib_ipd(8 downto 0);
       WHEN 18 =>
        dib_node <= dib_ipd;
       WHEN others =>
          NULL;
     END CASE;
  END PROCESS;

  diab_node <= (dib_ipd & dia_ipd);

  P107 : PROCESS(clka_ipd)
  BEGIN
     IF (clka_ipd'event and clka_ipd = '1') THEN
        IF ((g_reset = '0') or ((rsta_sig = '1') and (RESETMODE = "SYNC"))) THEN
           clka_valid2 <= '0';
        ELSE
           IF (cea_ipd = '1') THEN
              IF (csa_en = '1') THEN
                 clka_valid2 <= '1', '0' after 0.2 ns;
              ELSE
                 clka_valid2 <= '0';
              END IF;
           ELSE
              clka_valid2 <= '0';
           END IF;
        END IF;
     END IF;
  END PROCESS;
 
  P108 : PROCESS(clkb_ipd)
  BEGIN
     IF (clkb_ipd'event and clkb_ipd = '1') THEN
        IF ((g_reset = '0') or ((rstb_sig = '1') and (RESETMODE = "SYNC"))) THEN
           clkb_valid2 <= '0';
        ELSE
           IF (ceb_ipd = '1') THEN
              IF (csb_en = '1') THEN 
                 clkb_valid2 <= '1', '0' after 0.2 ns;
              ELSE
                 clkb_valid2 <= '0';
              END IF;
           ELSE
              clkb_valid2 <= '0';
           END IF;
        END IF;
     END IF;
  END PROCESS;

  clka_valid <= clka_valid2;
  clkb_valid <= clkb_valid2;
  clka_valid1 <= clka_valid;
  clkb_valid1 <= clkb_valid;

  P7 : PROCESS(pur_reset, rsta_node, rstb_node, clka_ipd, clkb_ipd)
  BEGIN
     IF (pur_reset = '0') THEN
        dia_reg <= (others => '0');
        diab_reg <= (others => '0');
        ada_reg <= (others => '0');
        bwa0_reg <= '0';
        bwa1_reg <= '0';
        wrena_reg1 <= '0';
        rena_reg1 <= '0';
        csa_en_reg <= '0';
     ELSE
        IF (clka_ipd'event and clka_ipd = '1') THEN
           IF (rsta_node = '1' and RESETMODE = "SYNC") THEN
              csa_en_reg <= '0';
           ELSIF (cea_ipd = '1') THEN
              dia_reg <= dia_node; 
              diab_reg <= diab_node; 
              ada_reg <= ada_node;
              bwa0_reg <= ada_ipd(0);
              bwa1_reg <= ada_ipd(1);
              wrena_reg1 <= wrea_ipd;
              rena_reg1 <= not wrea_ipd;
              csa_en_reg <= csa_en;
           END IF;
        END IF;
     END IF;

     IF (pur_reset = '0') THEN
        dib_reg <= (others => '0');
        adb_reg <= (others => '0');
        bwb_reg <= '0';
        wrenb_reg1 <= '0';
        renb_reg1 <= '0';
        csb_en_reg <= '0';
     ELSE
        IF (clkb_ipd'event and clkb_ipd = '1') THEN
           IF (rstb_node = '1' and RESETMODE = "SYNC") THEN
              csb_en_reg <= '0';
           ELSIF (ceb_ipd = '1') THEN
              dib_reg <= dib_node;
              adb_reg <= adb_node;
              bwb_reg <= adb_ipd(0);
              wrenb_reg1 <= wreb_ipd;
              renb_reg1 <= not wreb_ipd;
              csb_en_reg <= csb_en;
           END IF;
        END IF;
     END IF;
  END PROCESS;

     wrena_reg <= wrena_reg1 and csa_en_reg;
     rena_reg <= rena_reg1 and csa_en_reg;

     wrenb_reg <= wrenb_reg1 and csb_en_reg;
     renb_reg <= renb_reg1 and csb_en_reg;


-- Warning for collision

  PW : PROCESS(ada_reg, adb_reg, wrena_reg, wrenb_reg, clka_valid, clkb_valid, rena_reg, 
       renb_reg) 
  VARIABLE WADDR_A_VALID : boolean := TRUE;
  VARIABLE WADDR_B_VALID : boolean := TRUE;
  VARIABLE ADDR_A : integer := 0;
  VARIABLE ADDR_B : integer := 0;
  VARIABLE DN_ADDR_A : integer := 0;
  VARIABLE UP_ADDR_A : integer := 0;
  VARIABLE DN_ADDR_B : integer := 0;
  VARIABLE UP_ADDR_B : integer := 0;
  BEGIN
     WADDR_A_VALID := Valid_Address (ada_reg);
     WADDR_B_VALID := Valid_Address (adb_reg);

     IF (WADDR_A_VALID = TRUE) THEN
        ADDR_A := conv_integer(ada_reg);
     END IF;
     IF (WADDR_B_VALID = TRUE) THEN
        ADDR_B := conv_integer(adb_reg);
     END IF;
  
     --DN_ADDR_A := (ADDR_A * DATA_WIDTH_A);
     --UP_ADDR_A := (((ADDR_A + 1) * DATA_WIDTH_A) - 1);
     --DN_ADDR_B := (ADDR_B * DATA_WIDTH_B);
     --UP_ADDR_B := (((ADDR_B + 1) * DATA_WIDTH_B) - 1);

	  DN_ADDR_A := (ADDR_A * DATA_WIDTH_A) + (ADDR_A / div_a);
	  UP_ADDR_A := DN_ADDR_A + (DATA_WIDTH_A - 1);
	  DN_ADDR_B := (ADDR_B * DATA_WIDTH_B) + (ADDR_B / div_b);
	  UP_ADDR_B := DN_ADDR_B + (DATA_WIDTH_B - 1);

          IF (not((UP_ADDR_B < DN_ADDR_A) or (DN_ADDR_B > UP_ADDR_A))) THEN
             IF (wr_a_wr_b_coll = '1') THEN
                IF (clka_valid = '0' and clkb_valid = '0') THEN
                   wr_a_wr_b_coll <= '0';
                END IF;
             END IF;
          ELSE
             wr_a_wr_b_coll <= '0';
          END IF;

          IF (not((UP_ADDR_B < DN_ADDR_A) or (DN_ADDR_B > UP_ADDR_A))) THEN
             IF (wr_a_rd_b_coll = '1') THEN
                IF (clka_valid = '0' and clkb_valid = '0') THEN
                   wr_a_rd_b_coll <= '0';
                END IF;
             END IF;
          ELSE
             wr_a_rd_b_coll <= '0';
          END IF;

          IF (not((UP_ADDR_A < DN_ADDR_B) or (DN_ADDR_A > UP_ADDR_B))) THEN
             IF (rd_a_wr_b_coll = '1') THEN
                IF (clka_valid = '0' and clkb_valid = '0') THEN
                   rd_a_wr_b_coll <= '0';
                END IF;
             END IF;
          ELSE
             rd_a_wr_b_coll <= '0';
          END IF;

	  if (not((UP_ADDR_B < DN_ADDR_A) or (DN_ADDR_B > UP_ADDR_A))) then
		  if ((DN_ADDR_A > DN_ADDR_B) and (UP_ADDR_A < UP_ADDR_B)) then
			  dn_coll_addr <= DN_ADDR_A;
			  up_coll_addr <= UP_ADDR_A;
		  elsif ((DN_ADDR_B > DN_ADDR_A) and (UP_ADDR_B < UP_ADDR_A)) then
			  dn_coll_addr <= DN_ADDR_B;
			  up_coll_addr <= UP_ADDR_B;
		  elsif ((UP_ADDR_A - DN_ADDR_B) <= (UP_ADDR_B - DN_ADDR_A)) then
			  dn_coll_addr <= DN_ADDR_B;
			  up_coll_addr <= UP_ADDR_A;
		  else
			  dn_coll_addr <= DN_ADDR_A;
			  up_coll_addr <= UP_ADDR_B;
		  end if;
	  end if;

     IF ((wrena_reg = '1' and clka_valid = '1') and (wrenb_reg = '1' and clkb_valid = '1')) THEN 
        IF (not((UP_ADDR_B < DN_ADDR_A) or (DN_ADDR_B > UP_ADDR_A))) THEN
--           assert false
--           report " Write collision! Writing in the same memory location using Port A and Port B will cause the memory content invalid."
--           severity warning;
			  wr_a_wr_b_coll <= '1';
        END IF;
     END IF;

     IF ((wrena_reg = '1' and clka_valid = '1') and (renb_reg = '1' and clkb_valid = '1')) THEN 
        IF (not((UP_ADDR_B < DN_ADDR_A) or (DN_ADDR_B > UP_ADDR_A))) THEN
--           assert false
--           report " Write/Read collision! Writing through Port A and reading through Port B from the same memory location may give wrong output."
--           severity warning;
			  wr_a_rd_b_coll <= '1';
        END IF;
     END IF;

     IF ((rena_reg = '1' and clka_valid = '1') and (wrenb_reg = '1' and clkb_valid = '1')) THEN 
        IF (not((UP_ADDR_A < DN_ADDR_B) or (DN_ADDR_A > UP_ADDR_B))) THEN
--           assert false
--           report " Write/Read collision! Writing through Port B and reading through Port A from the same memory location may give wrong output."
--           severity warning;
			  rd_a_wr_b_coll <= '1';
        END IF;
     END IF;
  END PROCESS;

-- Writing to the memory

  P8 : PROCESS(ada_reg, dia_reg, diab_reg, bwa0_reg, bwa1_reg, wrena_reg, dib_reg, adb_reg,
               bwb_reg, wrenb_reg, clka_valid, clkb_valid,
					wr_a_wr_b_coll)
  VARIABLE WADDR_A_VALID : boolean := TRUE;
  VARIABLE WADDR_B_VALID : boolean := TRUE;
  VARIABLE WADDR_A : integer := 0;
  VARIABLE WADDR_B : integer := 0;
  VARIABLE dout_node_rbr : std_logic_vector(35 downto 0);
  BEGIN
     WADDR_A_VALID := Valid_Address (ada_reg);
     WADDR_B_VALID := Valid_Address (adb_reg);

     IF (WADDR_A_VALID = TRUE) THEN
        WADDR_A := conv_integer(ada_reg);
     END IF;
     IF (WADDR_B_VALID = TRUE) THEN
        WADDR_B := conv_integer(adb_reg);
     END IF;
    
     IF (DATA_WIDTH_A = 18) THEN
        IF (wrena_reg = '1' and clka_valid = '1') THEN
           FOR i IN 0 TO (DATA_WIDTH_A - 1) LOOP
              dout_node_rbr(i) := MEM((WADDR_A * DATA_WIDTH_A) + i);
           END LOOP;
           doa_node_rbr <= dout_node_rbr(8 downto 0);
           dob_node_rbr <= dout_node_rbr(17 downto 9);

           IF (bwa0_reg = '1') THEN
              FOR i IN 0 TO 8 LOOP
                 MEM((WADDR_A * DATA_WIDTH_A) + i) <= diab_reg(i);
              END LOOP;
           END IF;
           IF (bwa1_reg = '1') THEN
              FOR i IN 0 TO 8 LOOP
                 MEM((WADDR_A * DATA_WIDTH_A) + i + 9) <= diab_reg(i + 9);
              END LOOP;
           END IF;
        END IF;
     ELSE
        IF (DATA_WIDTH_A = 9) THEN
           IF (bwa0_reg = '1' and wrena_reg = '1' and clka_valid = '1') THEN
              FOR i IN 0 TO (DATA_WIDTH_A - 1) LOOP
              doa_node_rbr(i) <= MEM((WADDR_A * DATA_WIDTH_A) + (WADDR_A / div_a) + i);
              END LOOP;

              FOR i IN 0 TO (DATA_WIDTH_A - 1) LOOP
                 MEM((WADDR_A * DATA_WIDTH_A) + i) <= dia_reg(i);
					  if ( (wr_a_wr_b_coll = '1') and
							 (((WADDR_A * DATA_WIDTH_A) + i) >= dn_coll_addr) and
							 (((WADDR_A * DATA_WIDTH_A) + i) <= up_coll_addr) and
							 ( (DATA_WIDTH_B < 9) or
								( (DATA_WIDTH_B = 9) and
								    ((bwb_reg = '1') and (((WADDR_A * DATA_WIDTH_A) rem 9) = 0)) ) ) )  then
						  MEM((WADDR_A * DATA_WIDTH_A) + i) <= 'X';
					  end if;
              END LOOP;
           END IF;
        ELSE
           IF (wrena_reg = '1' and clka_valid = '1') THEN
              FOR i IN 0 TO (DATA_WIDTH_A - 1) LOOP
              doa_node_rbr(i) <= MEM((WADDR_A * DATA_WIDTH_A) + (WADDR_A / div_a) + i);
              END LOOP;

              FOR i IN 0 TO (DATA_WIDTH_A - 1) LOOP
                 MEM((WADDR_A * DATA_WIDTH_A) + (WADDR_A / div_a) + i) <= dia_reg(i);
					  if ( (wr_a_wr_b_coll = '1') and
						    (((WADDR_A * DATA_WIDTH_A) + (WADDR_A / div_a) + i) >= dn_coll_addr) and
						    (((WADDR_A * DATA_WIDTH_A) + (WADDR_A / div_a) + i) <= up_coll_addr) and
							  ( (DATA_WIDTH_B < 9) or
								 ( (DATA_WIDTH_B = 9) and
								     ((bwb_reg = '1') and ((((WADDR_A * DATA_WIDTH_A) + (WADDR_A / div_a)) rem 9) = 0))
									) ) )  then
						  MEM((WADDR_A * DATA_WIDTH_A) + (WADDR_A / div_a) + i) <= 'X';
					  end if;
              END LOOP;
           END IF;
        END IF;

        IF (DATA_WIDTH_B = 9) THEN
           IF (bwb_reg = '1' and wrenb_reg = '1' and clkb_valid = '1') THEN
              FOR i IN 0 TO (DATA_WIDTH_B - 1) LOOP
              dob_node_rbr(i) <= MEM((WADDR_B * DATA_WIDTH_B) + (WADDR_B / div_b) + i);
              END LOOP;

              FOR i IN 0 TO (DATA_WIDTH_B - 1) LOOP
                  MEM((WADDR_B * DATA_WIDTH_B) + i) <= dib_reg(i);
						if ( (wr_a_wr_b_coll = '1') and
							  (((WADDR_B * DATA_WIDTH_B) + i) >= dn_coll_addr) and
							  (((WADDR_B * DATA_WIDTH_B) + i) <= up_coll_addr) and
							  ( (DATA_WIDTH_A < 9) or
								 ( (DATA_WIDTH_A = 9) and
									  ((bwa0_reg = '1') and (((WADDR_B * DATA_WIDTH_B) rem 9) = 0)) ) ) )  then
							MEM((WADDR_B * DATA_WIDTH_B) + i) <= 'X';
						end if;
              END LOOP;
           END IF;
        ELSE
           IF (wrenb_reg = '1' and clkb_valid = '1') THEN
              FOR i IN 0 TO (DATA_WIDTH_B - 1) LOOP
              dob_node_rbr(i) <= MEM((WADDR_B * DATA_WIDTH_B) + (WADDR_B / div_b) + i);
              END LOOP;

              FOR i IN 0 TO (DATA_WIDTH_B - 1)  LOOP
                  MEM((WADDR_B * DATA_WIDTH_B) + (WADDR_B / div_b) + i) <= dib_reg(i);
						if ( (wr_a_wr_b_coll = '1') and
							  (((WADDR_B * DATA_WIDTH_B) + (WADDR_B / div_b) + i) >= dn_coll_addr) and
							  (((WADDR_B * DATA_WIDTH_B) + (WADDR_B / div_b) + i) <= up_coll_addr) and
							  ( (DATA_WIDTH_A < 9) or
								 ( (DATA_WIDTH_A = 9) and
									  ((bwa0_reg = '1') and ((((WADDR_B * DATA_WIDTH_B) + (WADDR_B / div_b)) rem 9) = 0))
									 ) ) ) then
							MEM((WADDR_B * DATA_WIDTH_B) + (WADDR_B / div_b) + i) <= 'X';
						end if;
              END LOOP;
           END IF;
        END IF;
     END IF;
  END PROCESS;

  P9 : PROCESS(ada_reg, rena_reg, adb_reg, renb_reg, MEM, clka_valid1, clkb_valid1, rsta_sig, rstb_sig,
               doa_node_rbr, dob_node_rbr,
					wr_a_rd_b_coll, rd_a_wr_b_coll) 
  VARIABLE RADDR_A_VALID : boolean := TRUE;
  VARIABLE RADDR_B_VALID : boolean := TRUE;
  VARIABLE RADDR_A : integer := 0;
  VARIABLE RADDR_B : integer := 0;
  VARIABLE dout_node_tr : std_logic_vector(17 downto 0);
  VARIABLE dout_node_wt : std_logic_vector(17 downto 0);
  BEGIN
     RADDR_A_VALID := Valid_Address (ada_reg);
     RADDR_B_VALID := Valid_Address (adb_reg);

     IF (RADDR_A_VALID = TRUE) THEN
        RADDR_A := conv_integer(ada_reg);
     END IF;
     IF (RADDR_B_VALID = TRUE) THEN
        RADDR_B := conv_integer(adb_reg);
     END IF;

     IF (DATA_WIDTH_B = 18) THEN
        IF (rstb_sig = '1') THEN
           IF (RESETMODE = "SYNC") THEN
              IF (clkb_ipd = '1') THEN
                 doa_node <= (others => '0');
                 dob_node <= (others => '0');
              END IF;
           ELSIF (RESETMODE = "ASYNC") THEN
              doa_node <= (others => '0');
              dob_node <= (others => '0');
           END IF;
        ELSIF (clkb_valid1'event and clkb_valid1 = '1') THEN
           IF (renb_reg = '1') THEN
              FOR i IN 0 TO (DATA_WIDTH_B - 1) LOOP
                 dout_node_tr(i) := MEM((RADDR_B * DATA_WIDTH_B) + i);
					  if ( (wr_a_rd_b_coll = '1') and
							 (((RADDR_B * DATA_WIDTH_B) + i) >= dn_coll_addr) and
							 (((RADDR_B * DATA_WIDTH_B) + i) <= up_coll_addr) and
							 ( (DATA_WIDTH_A < 9) or
								( (DATA_WIDTH_A = 9) and
								    ((bwa0_reg = '1') and ((((RADDR_B * DATA_WIDTH_B) + i) rem 9) < 9)) ) or
								( (DATA_WIDTH_A = 18) and
								  ( ((bwa0_reg = '1') and ((((RADDR_B * DATA_WIDTH_B) + i) rem 18) < 9)) or
								    ((bwa0_reg = '1') and ((((RADDR_B * DATA_WIDTH_B) + i) rem 18) >= 9)
								 )) ))) then
						  dout_node_tr(i) := 'X';
					  end if;
              END LOOP;
              doa_node <= dout_node_tr(8 downto 0);
              dob_node <= dout_node_tr(17 downto 9);
           ELSIF (renb_reg = '0') THEN
              IF (WRITEMODE_B = "WRITETHROUGH") THEN
                 FOR i IN 0 TO (DATA_WIDTH_B - 1) LOOP
                    dout_node_wt(i) := MEM((RADDR_B * DATA_WIDTH_B) + i);
                 END LOOP;
                 doa_node <= dout_node_wt(8 downto 0);
                 dob_node <= dout_node_wt(17 downto 9);
              ELSIF (WRITEMODE_B = "READBEFOREWRITE") THEN
                 doa_node <= doa_node_rbr;
                 dob_node <= dob_node_rbr;
              END IF;
           END IF;
        END IF;
     ELSE
        IF (rsta_sig = '1') THEN
           IF (RESETMODE = "SYNC") THEN
              IF (clka_ipd = '1') THEN
                 doa_node <= (others => '0');
              END IF;
           ELSIF (RESETMODE = "ASYNC") THEN
              doa_node <= (others => '0');
           END IF;
        ELSIF (clka_valid1 = '1') THEN
           IF (rena_reg = '1') THEN
              FOR i IN 0 TO (new_data_width_a - 1)  LOOP
                 doa_node(i) <= MEM((RADDR_A * DATA_WIDTH_A) + (RADDR_A / div_a) + i);
					  if ( (rd_a_wr_b_coll = '1') and
							 (((RADDR_A * DATA_WIDTH_A) + (RADDR_A / div_a) + i) >= dn_coll_addr) and
							 (((RADDR_A * DATA_WIDTH_A) + (RADDR_A / div_a) + i) <= up_coll_addr) and
							 ( (DATA_WIDTH_B < 9) or
								( (DATA_WIDTH_B = 9) and
									 ((bwb_reg = '1') and ((((RADDR_A * DATA_WIDTH_A) + (RADDR_A / div_a) + i) rem 9) = 0))
								   ) ) ) then
						  doa_node(i) <= 'X';
					  end if;
              END LOOP;
           ELSIF (rena_reg = '0') THEN
              IF (WRITEMODE_A = "WRITETHROUGH") THEN
                 IF (DATA_WIDTH_A <= 4) THEN
                    FOR i IN 0 TO (DATA_WIDTH_A - 1) LOOP
                       doa_node(i) <= MEM((RADDR_A * DATA_WIDTH_A) + (RADDR_A / div_a) + i);
                    END LOOP;
                 ELSIF (DATA_WIDTH_A = 9) THEN
                    IF (bwa0_reg = '1') THEN
                       FOR i IN 0 TO 8 LOOP
                       doa_node(i) <= MEM((RADDR_A * DATA_WIDTH_A) + (RADDR_A / div_a) + i);
                       END LOOP;
                    END IF;
                 END IF;
              ELSIF (WRITEMODE_A = "READBEFOREWRITE") THEN
                 doa_node <= doa_node_rbr;
              END IF;
           END IF;
        END IF;

        IF (rstb_sig = '1') THEN
           IF (RESETMODE = "SYNC") THEN
              IF (clkb_ipd = '1') THEN
                 dob_node <= (others => '0');
              END IF;
           ELSIF (RESETMODE = "ASYNC") THEN
              dob_node <= (others => '0');
           END IF;
        ELSIF (clkb_valid1 = '1') THEN
           IF (renb_reg = '1') THEN
              FOR i IN 0 TO (DATA_WIDTH_B - 1)  LOOP
                 dob_node(i) <= MEM((RADDR_B * DATA_WIDTH_B) + (RADDR_B / div_b) + i);
					  if ( (wr_a_rd_b_coll = '1') and
							 (((RADDR_B * DATA_WIDTH_B) + (RADDR_B / div_b) + i) >= dn_coll_addr) and
							 (((RADDR_B * DATA_WIDTH_B) + (RADDR_B / div_b) + i) <= up_coll_addr) and
							 ( (DATA_WIDTH_A < 9) or
								( (DATA_WIDTH_A = 9) and
								  ( ((bwa0_reg = '1') and ((((RADDR_B * DATA_WIDTH_B) + (RADDR_B / div_b) + i) rem 9) < 9)) 
								  ) ) or
								( (DATA_WIDTH_A = 18) and
								  ( ((bwa0_reg = '1') and ((((RADDR_B * DATA_WIDTH_B) + (RADDR_B / div_b) + i) rem 18) < 9)) or
								    ((bwa0_reg = '1') and ((((RADDR_B * DATA_WIDTH_B) + (RADDR_B / div_b) + i) rem 18) >= 9)
								  )) ) ) ) then
						  dob_node(i) <= 'X';
					  end if;
              END LOOP;
           ELSIF (renb_reg = '0') THEN
              IF (WRITEMODE_B = "WRITETHROUGH") THEN
                 IF (DATA_WIDTH_B <= 4) THEN
                    FOR i IN 0 TO (DATA_WIDTH_B - 1) LOOP
                       dob_node(i) <= MEM((RADDR_B * DATA_WIDTH_B) + (RADDR_B / div_b) + i);
                    END LOOP;
                 ELSIF (DATA_WIDTH_B = 9) THEN
                    IF (bwb_reg = '1') THEN
                       FOR i IN 0 TO 8 LOOP
                       dob_node(i) <= MEM((RADDR_B * DATA_WIDTH_B) + (RADDR_B / div_b) + i);
                       END LOOP;
                    END IF;
                 END IF;
              ELSIF (WRITEMODE_B = "READBEFOREWRITE") THEN
                 dob_node <= dob_node_rbr;
              END IF;
           END IF;
        END IF;
     END IF;
  END PROCESS;

  P10 : PROCESS(g_reset, rsta_node, rstb_node, clka_ipd, clkb_ipd)
  BEGIN
     IF (g_reset = '0') THEN
        doa_reg <= (others => '0');
     ELSIF (RESETMODE = "ASYNC") THEN
        IF (rsta_node = '1') THEN
           doa_reg <= (others => '0');
        ELSIF (clka_ipd'event and clka_ipd = '1') THEN
           IF (ocea_ipd = '1') THEN
              doa_reg <= doa_node;
           END IF;
        END IF;
     ELSIF (RESETMODE = "SYNC") THEN
        IF (clka_ipd'event and clka_ipd = '1') THEN
           IF (ocea_ipd = '1') THEN
              IF (rsta_node = '1') THEN
                 doa_reg <= (others => '0');
              ELSIF (rsta_node = '0') THEN
                 doa_reg <= doa_node;
              END IF;
           END IF;
        END IF;
     END IF;

     IF (g_reset = '0') THEN
        dob_reg <= (others => '0');
        doab_reg <= (others => '0');
     ELSIF (RESETMODE = "ASYNC") THEN
        IF (rstb_node = '1') THEN
           dob_reg <= (others => '0');
           doab_reg <= (others => '0');
        ELSIF (clkb_ipd'event and clkb_ipd = '1') THEN
           IF (oceb_ipd = '1') THEN
              dob_reg <= dob_node;
              doab_reg <= doa_node;
           END IF;
        END IF;
     ELSIF (RESETMODE = "SYNC") THEN
        IF (clkb_ipd'event and clkb_ipd = '1') THEN
           IF (oceb_ipd = '1') THEN
              IF (rstb_node = '1') THEN
                 dob_reg <= (others => '0');
                 doab_reg <= (others => '0');
              ELSIF (rstb_node = '0') THEN
                 dob_reg <= dob_node;
                 doab_reg <= doa_node;
              END IF;
           END IF;
        END IF;
     END IF;
  END PROCESS;

  P11 : PROCESS(doa_node, dob_node, doa_reg, dob_reg, doab_reg)
  BEGIN
     IF (REGMODE_A = "OUTREG") THEN 
        IF (DATA_WIDTH_B = 18) THEN
           doa_int <= doab_reg;
        ELSE
           doa_int <= doa_reg;
        END IF;
     ELSE
        doa_int <= doa_node;
     END IF;

     IF (REGMODE_B = "OUTREG") THEN 
        dob_int <= dob_reg;
     ELSE
        dob_int <= dob_node;
     END IF;
  END PROCESS;

  (doa8, doa7, doa6, doa5, doa4, doa3, doa2, doa1, doa0) <= doa_int;

  (dob8, dob7, dob6, dob5, dob4, dob3, dob2, dob1, dob0) <= dob_int;

END V;


--
-----cell sp8kc----
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.vital_timing.all;
use ieee.vital_primitives.all;
use ieee.std_logic_unsigned.all;
use work.global.gsrnet;
use work.global.purnet;
use work.mem3.all;

-- entity declaration --
ENTITY sp8kc IS
   GENERIC (
        DATA_WIDTH               : Integer  := 9;
        REGMODE                  : String  := "NOREG";
        CSDECODE                 : string  := "0b000";
        WRITEMODE                : String  := "NORMAL";
        GSR                      : String  := "ENABLED";
        RESETMODE                : String  := "SYNC";
        ASYNC_RESET_RELEASE      : String  := "SYNC";
        INIT_DATA                : String  := "STATIC";
        initval_00 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_01 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_02 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_03 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_04 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_05 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_06 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_07 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_08 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_09 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0a : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0b : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0c : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0d : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0e : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0f : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_10 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_11 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_12 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_13 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_14 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_15 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_16 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_17 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_18 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_19 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1a : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1b : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1c : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1d : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1e : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1f : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000");

   PORT(
        DI8, DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0         : in std_logic := 'X';
        AD12, AD11, AD10, AD9, AD8, AD7, AD6, AD5           : in std_logic := 'X';
        AD4, AD3,  AD2, AD1, AD0                            : in std_logic := 'X';
        CE, OCE, CLK, WE, CS2, CS1, CS0, RST                : in std_logic := 'X';
        DO8, DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0         : out std_logic := 'X'
  );

      ATTRIBUTE Vital_Level0 OF sp8kc : ENTITY IS TRUE;

END sp8kc ;

architecture V of sp8kc is

signal lo: std_logic := '0';
signal hi: std_logic := '1';

component dp8kc
GENERIC(
        DATA_WIDTH_A : in Integer;
        DATA_WIDTH_B : in Integer;
        REGMODE_A    : in String;
        REGMODE_B    : in String;
        CSDECODE_A   : in string;
        CSDECODE_B   : in string;
        WRITEMODE_A  : in String;
        WRITEMODE_B  : in String;
        GSR          : in String;
        RESETMODE    : in String;
        ASYNC_RESET_RELEASE    : in String;
        initval_00 : in string;
        initval_01 : in string;
        initval_02 : in string;
        initval_03 : in string;
        initval_04 : in string;
        initval_05 : in string;
        initval_06 : in string;
        initval_07 : in string;
        initval_08 : in string;
        initval_09 : in string;
        initval_0a : in string;
        initval_0b : in string;
        initval_0c : in string;
        initval_0d : in string;
        initval_0e : in string;
        initval_0f : in string;
        initval_10 : in string;
        initval_11 : in string;
        initval_12 : in string;
        initval_13 : in string;
        initval_14 : in string;
        initval_15 : in string;
        initval_16 : in string;
        initval_17 : in string;
        initval_18 : in string;
        initval_19 : in string;
        initval_1a : in string;
        initval_1b : in string;
        initval_1c : in string;
        initval_1d : in string;
        initval_1e : in string;
        initval_1f : in string);

PORT(
        DIA8, DIA7, DIA6, DIA5, DIA4, DIA3, DIA2, DIA1, DIA0         : in std_logic;
        ADA12, ADA11, ADA10, ADA9, ADA8, ADA7, ADA6, ADA5            : in std_logic;
        ADA4,  ADA3,  ADA2, ADA1, ADA0                               : in std_logic;
        CEA, OCEA, CLKA, WEA, CSA2, CSA1, CSA0, RSTA                 : in std_logic;
        DIB8, DIB7, DIB6, DIB5, DIB4, DIB3, DIB2, DIB1, DIB0         : in std_logic;
        ADB12, ADB11, ADB10, ADB9, ADB8, ADB7, ADB6, ADB5            : in std_logic;
        ADB4,  ADB3,  ADB2, ADB1, ADB0                               : in std_logic;
        CEB, OCEB, CLKB, WEB, CSB2, CSB1, CSB0, RSTB                 : in std_logic;
        DOA8, DOA7, DOA6, DOA5, DOA4, DOA3, DOA2, DOA1, DOA0         : out std_logic;
        DOB8, DOB7, DOB6, DOB5, DOB4, DOB3, DOB2, DOB1, DOB0         : out std_logic
  );
END COMPONENT;

begin
    -- component instantiation statements
  dp8kc_inst : dp8kc
  generic map (DATA_WIDTH_A => DATA_WIDTH,
               DATA_WIDTH_B => DATA_WIDTH,
               REGMODE_A    => REGMODE,
               REGMODE_B    => REGMODE,
               CSDECODE_A   => CSDECODE,
               CSDECODE_B   => CSDECODE,
               WRITEMODE_A  => WRITEMODE,
               WRITEMODE_B  => WRITEMODE,
               GSR => GSR,
               RESETMODE => RESETMODE,
               ASYNC_RESET_RELEASE => ASYNC_RESET_RELEASE,
        initval_00 => initval_00,
        initval_01 => initval_01,
        initval_02 => initval_02,
        initval_03 => initval_03,
        initval_04 => initval_04,
        initval_05 => initval_05,
        initval_06 => initval_06,
        initval_07 => initval_07,
        initval_08 => initval_08,
        initval_09 => initval_09,
        initval_0a => initval_0a,
        initval_0b => initval_0b,
        initval_0c => initval_0c,
        initval_0d => initval_0d,
        initval_0e => initval_0e,
        initval_0f => initval_0f,
        initval_10 => initval_10,
        initval_11 => initval_11,
        initval_12 => initval_12,
        initval_13 => initval_13,
        initval_14 => initval_14,
        initval_15 => initval_15,
        initval_16 => initval_16,
        initval_17 => initval_17,
        initval_18 => initval_18,
        initval_19 => initval_19,
        initval_1a => initval_1a,
        initval_1b => initval_1b,
        initval_1c => initval_1c,
        initval_1d => initval_1d,
        initval_1e => initval_1e,
        initval_1f => initval_1f)
  port map (dia0 => di0, dia1 => di1, dia2 => di2, dia3 => di3,
  dia4 => di4, dia5 => di5, dia6 => di6, dia7 => di7, dia8 => di8,
  dib0 => lo, dib1 => lo, dib2 => lo, dib3 => lo, dib4 => lo, dib5 => lo,
  dib6 => lo, dib7 => lo, dib8 => lo, 
  cea => ce, clka => clk, wea => we, csa0 => cs0, csa1 => cs1, csa2 => cs2,
  rsta => rst, ada0 => ad0, ada1 => ad1, ada2 => ad2, ada3 => ad3,
  ada4 => ad4, ada5 => ad5, ada6 => ad6, ada7 => ad7, ada8 => ad8,
  ada9 => ad9, ada10 => ad10, ada11 => ad11, ada12 => ad12, 
  ceb => lo, clkb => lo, web => lo, csb0 => lo, csb1 => lo, csb2 => lo,
  rstb => hi, adb0 => lo, adb1 => lo, adb2 => lo, adb3 => lo,
  adb4 => lo, adb5 => lo, adb6 => lo, adb7 => lo, adb8 => lo,
  adb9 => lo, adb10 => lo, adb11 => lo, adb12 => lo, 
  ocea => oce, oceb => lo,
  dob0 => open, dob1 => open, dob2 => open, dob3 => open,
  dob4 => open, dob5 => open, dob6 => open, dob7 => open, dob8 => open,
  doa0 => do0, doa1 => do1, doa2 => do2, doa3 => do3, doa4 => do4, doa5 => do5,
  doa6 => do6, doa7 => do7, doa8 => do8);

end V;

--
-----cell pdpw8kc----
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.vital_timing.all;
use ieee.vital_primitives.all;
use ieee.std_logic_unsigned.all;
use work.global.gsrnet;
use work.global.purnet;
use work.mem3.all;

-- entity declaration --
ENTITY pdpw8kc IS
   GENERIC (
        DATA_WIDTH_W              : Integer  := 18;
        DATA_WIDTH_R              : Integer  := 9;
        REGMODE                   : String  := "NOREG";
        CSDECODE_W                : string  := "0b000";
        CSDECODE_R                : string  := "0b000";
        GSR                       : String  := "ENABLED";
        RESETMODE                 : String  := "SYNC";
        ASYNC_RESET_RELEASE       : String  := "SYNC";
        INIT_DATA                 : String  := "STATIC";
        initval_00 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_01 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_02 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_03 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_04 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_05 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_06 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_07 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_08 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_09 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0a : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0b : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0c : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0d : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0e : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0f : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_10 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_11 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_12 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_13 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_14 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_15 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_16 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_17 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_18 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_19 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1a : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1b : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1c : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1d : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1e : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1f : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000");

   PORT(
        DI17, DI16, DI15, DI14, DI13, DI12, DI11, DI10, DI9      : in std_logic := 'X';
        DI8, DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0              : in std_logic := 'X';
        ADW8, ADW7, ADW6, ADW5, ADW4, ADW3, ADW2, ADW1, ADW0     : in std_logic := 'X';
        BE1, BE0                                                 : in std_logic := 'X';
        CEW, CLKW, CSW2, CSW1, CSW0                              : in std_logic := 'X';
        ADR12, ADR11, ADR10, ADR9, ADR8, ADR7, ADR6, ADR5        : in std_logic := 'X';
        ADR4,  ADR3,  ADR2, ADR1, ADR0                           : in std_logic := 'X';
        CER, OCER, CLKR, CSR2, CSR1, CSR0, RST                   : in std_logic := 'X';
        DO17, DO16, DO15, DO14, DO13, DO12, DO11, DO10, DO9      : out std_logic := 'X';
        DO8, DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0              : out std_logic := 'X'
  );

      ATTRIBUTE Vital_Level0 OF pdpw8kc : ENTITY IS TRUE;

END pdpw8kc ;

architecture V of pdpw8kc is

signal lo: std_logic := '0';
signal hi : std_logic := '1';

component dp8kc
GENERIC(
        DATA_WIDTH_A : in Integer;
        DATA_WIDTH_B : in Integer;
        REGMODE_A    : in String;
        REGMODE_B    : in String;
        CSDECODE_A   : in string;
        CSDECODE_B   : in string;
        GSR          : in String;
        RESETMODE    : in String;
        ASYNC_RESET_RELEASE    : in String;
        initval_00 : in string;
        initval_01 : in string;
        initval_02 : in string;
        initval_03 : in string;
        initval_04 : in string;
        initval_05 : in string;
        initval_06 : in string;
        initval_07 : in string;
        initval_08 : in string;
        initval_09 : in string;
        initval_0a : in string;
        initval_0b : in string;
        initval_0c : in string;
        initval_0d : in string;
        initval_0e : in string;
        initval_0f : in string;
        initval_10 : in string;
        initval_11 : in string;
        initval_12 : in string;
        initval_13 : in string;
        initval_14 : in string;
        initval_15 : in string;
        initval_16 : in string;
        initval_17 : in string;
        initval_18 : in string;
        initval_19 : in string;
        initval_1a : in string;
        initval_1b : in string;
        initval_1c : in string;
        initval_1d : in string;
        initval_1e : in string;
        initval_1f : in string);

PORT(
        DIA8, DIA7, DIA6, DIA5, DIA4, DIA3, DIA2, DIA1, DIA0         : in std_logic;
        ADA12, ADA11, ADA10, ADA9, ADA8, ADA7, ADA6, ADA5            : in std_logic;
        ADA4,  ADA3,  ADA2, ADA1, ADA0                               : in std_logic;
        CEA, OCEA, CLKA, WEA, CSA2, CSA1, CSA0, RSTA                 : in std_logic;
        DIB8, DIB7, DIB6, DIB5, DIB4, DIB3, DIB2, DIB1, DIB0         : in std_logic;
        ADB12, ADB11, ADB10, ADB9, ADB8, ADB7, ADB6, ADB5            : in std_logic;
        ADB4,  ADB3,  ADB2, ADB1, ADB0                               : in std_logic;
        CEB, OCEB, CLKB, WEB, CSB2, CSB1, CSB0, RSTB                 : in std_logic;
        DOA8, DOA7, DOA6, DOA5, DOA4, DOA3, DOA2, DOA1, DOA0         : out std_logic;
        DOB8, DOB7, DOB6, DOB5, DOB4, DOB3, DOB2, DOB1, DOB0         : out std_logic
  );
END COMPONENT;

begin
    -- component instantiation statements
  dp8kc_inst : dp8kc
  generic map (DATA_WIDTH_A => 18,
               DATA_WIDTH_B => DATA_WIDTH_R,
               REGMODE_A    => REGMODE,
               REGMODE_B    => REGMODE,
               CSDECODE_A   => CSDECODE_W,
               CSDECODE_B   => CSDECODE_R,
               GSR => GSR,
               RESETMODE => RESETMODE,
               ASYNC_RESET_RELEASE => ASYNC_RESET_RELEASE,
        initval_00 => initval_00,
        initval_01 => initval_01,
        initval_02 => initval_02,
        initval_03 => initval_03,
        initval_04 => initval_04,
        initval_05 => initval_05,
        initval_06 => initval_06,
        initval_07 => initval_07,
        initval_08 => initval_08,
        initval_09 => initval_09,
        initval_0a => initval_0a,
        initval_0b => initval_0b,
        initval_0c => initval_0c,
        initval_0d => initval_0d,
        initval_0e => initval_0e,
        initval_0f => initval_0f,
        initval_10 => initval_10,
        initval_11 => initval_11,
        initval_12 => initval_12,
        initval_13 => initval_13,
        initval_14 => initval_14,
        initval_15 => initval_15,
        initval_16 => initval_16,
        initval_17 => initval_17,
        initval_18 => initval_18,
        initval_19 => initval_19,
        initval_1a => initval_1a,
        initval_1b => initval_1b,
        initval_1c => initval_1c,
        initval_1d => initval_1d,
        initval_1e => initval_1e,
        initval_1f => initval_1f)
  port map (dia0 => di0, dia1 => di1, dia2 => di2, dia3 => di3,
  dia4 => di4, dia5 => di5, dia6 => di6, dia7 => di7, dia8 => di8,
  dib0 => di9, dib1 => di10, dib2 => di11, dib3 => di12, dib4 => di13,
  dib5 => di14, dib6 => di15, dib7 => di16, dib8 => di17, 
  cea => cew, clka => clkw, wea => hi, csa0 => csw0, csa1 => csw1, csa2 => csw2,
  rsta => rst, ada0 => be0, ada1 => be1, ada2 => lo, ada3 => lo,
  ada4 => adw0, ada5 => adw1, ada6 => adw2, ada7 => adw3,
  ada8 => adw4, ada9 => adw5, ada10 => adw6, ada11 => adw7, ada12 => adw8, 
  ceb => cer, clkb => clkr, web => lo, csb0 => csr0, csb1 => csr1, csb2 => csr2,
  rstb => rst, adb0 => adr0, adb1 => adr1, adb2 => adr2, adb3 => adr3,
  adb4 => adr4, adb5 => adr5, adb6 => adr6, adb7 => adr7, adb8 => adr8,
  adb9 => adr9, adb10 => adr10, adb11 => adr11, adb12 => adr12, 
  ocea => lo, oceb => ocer,
  dob0 => do0, dob1 => do1, dob2 => do2, dob3 => do3,
  dob4 => do4, dob5 => do5, dob6 => do6, dob7 => do7, dob8 => do8,
  doa0 => do9, doa1 => do10, doa2 => do11, doa3 => do12, doa4 => do13,
  doa5 => do14, doa6 => do15, doa7 => do16, doa8 => do17); 

end V;


--
-----cell fifo8kb----
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.vital_timing.all;
use ieee.vital_primitives.all;
use ieee.std_logic_unsigned.all;
use work.global.gsrnet;
use work.global.purnet;
use work.mem3.all;

-- entity declaration --
ENTITY fifo8kb IS
   GENERIC (
        DATA_WIDTH_W               : Integer  := 18;
        DATA_WIDTH_R               : Integer  := 18;
        REGMODE                    : String  := "NOREG";
        RESETMODE                  : String  := "ASYNC";
        ASYNC_RESET_RELEASE        : String  := "SYNC";
        CSDECODE_W                 : string  := "0b00";
        CSDECODE_R                 : string  := "0b00";
        AEPOINTER                  : String  := "0b00000000000000";
        AEPOINTER1                 : String  := "0b00000000000000";
        AFPOINTER                  : String  := "0b00000000000000";
        AFPOINTER1                 : String  := "0b00000000000000";
        FULLPOINTER                : String  := "0b00000000000000";
        FULLPOINTER1               : String  := "0b00000000000000";
        GSR                        : String  := "DISABLED";

        -- miscellaneous vital GENERICs
        TimingChecksOn  : boolean := TRUE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := TRUE;
        InstancePath    : string  := "fifo8kb";

        -- input SIGNAL delays
        tipd_di17 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di16 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di15 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di14 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di13 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di12 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di11 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di10 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di9  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di8  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di7  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di6  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di5  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di4  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di3  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di2  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di1  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_di0  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_clkw : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_clkr : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_we  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_re  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_fulli : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_csw0 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_csw1 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_emptyi : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_csr0 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_csr1 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rst  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rprst  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ore  : VitalDelayType01 := (0.0 ns, 0.0 ns);

        -- propagation delays

        -- setup and hold constraints

        -- pulse width constraints
        tperiod_clkw            : VitalDelayType := 0.001 ns;
        tpw_clkw_posedge        : VitalDelayType := 0.001 ns;
        tpw_clkw_negedge        : VitalDelayType := 0.001 ns;
        tperiod_clkr            : VitalDelayType := 0.001 ns;
        tpw_clkr_posedge        : VitalDelayType := 0.001 ns;
        tpw_clkr_negedge        : VitalDelayType := 0.001 ns);

   PORT(
        di0, di1, di2, di3, di4, di5, di6, di7, di8            : in std_logic := 'X';
        di9, di10, di11, di12, di13, di14, di15, di16, di17    : in std_logic := 'X';
        fulli, csw0, csw1, emptyi, csr0, csr1                  : in std_logic := 'X';
        we, re, clkw, clkr, rst, rprst, ore          : in std_logic := 'X';

        do0, do1, do2, do3, do4, do5, do6, do7, do8            : out std_logic := 'X';
        do9, do10, do11, do12, do13, do14, do15, do16, do17    : out std_logic := 'X';
        ef, aef, aff, ff                                       : out std_logic := 'X'
  );

      ATTRIBUTE Vital_Level0 OF fifo8kb : ENTITY IS TRUE;

END fifo8kb ;

-- ARCHITECTURE body --
ARCHITECTURE V OF fifo8kb IS
    ATTRIBUTE Vital_Level0 OF V : ARCHITECTURE IS TRUE;

--SIGNAL DECLARATIONS----

    SIGNAL di_ipd    : std_logic_vector(17 downto 0) := "XXXXXXXXXXXXXXXXXX";
    SIGNAL wclk_ipd  : std_logic := '0';
    SIGNAL we_ipd   : std_logic := '0';
    SIGNAL ore_ipd   : std_logic := '0';
    SIGNAL csw_ipd   : std_logic_vector(2 downto 0) := "000";
    SIGNAL rst_ipd   : std_logic := '0';
    SIGNAL rst_ipd1   : std_logic := '0';
    SIGNAL rst_ipd2   : std_logic := '0';
    SIGNAL rclk_ipd  : std_logic := '0';
    SIGNAL re_ipd   : std_logic := '0';
    SIGNAL csr_ipd   : std_logic_vector(2 downto 0) := "000";
    SIGNAL rprst_ipd : std_logic := '0';
    SIGNAL rprst_ipd1 : std_logic := '0';
    SIGNAL rprst_ipd2 : std_logic := '0';
    SIGNAL csw_en    : std_logic := '0';
    SIGNAL csr_en    : std_logic := '0';
    SIGNAL g_reset   : std_logic := '0';
    SIGNAL pur_reset   : std_logic := '0';
    CONSTANT ADDR_WIDTH_W : integer := data2addr_w(DATA_WIDTH_W); 
    CONSTANT ADDR_WIDTH_R : integer := data2addr_w(DATA_WIDTH_R); 
    CONSTANT div_a    : integer := data2data(DATA_WIDTH_W);
    CONSTANT div_b    : integer := data2data(DATA_WIDTH_R);
    SIGNAL di_node    : std_logic_vector((DATA_WIDTH_W - 1) downto 0) := (others => '0');
    SIGNAL adw_node   : std_logic_vector(ADDR_WIDTH_W downto 0) := (others => '1');
    SIGNAL adw_node_syncb   : std_logic_vector(ADDR_WIDTH_W downto 0) := (others => '1');
    SIGNAL adwf_node  : std_logic_vector(13 downto 0) := (others => '0');
    SIGNAL adwf_node_syncb  : std_logic_vector(13 downto 0) := (others => '0');
    SIGNAL adr_node   : std_logic_vector(ADDR_WIDTH_R downto 0) := (others => '1');
    SIGNAL adr_node_syncb   : std_logic_vector(ADDR_WIDTH_R downto 0) := (others => '1');
    SIGNAL adrf_node  : std_logic_vector(13 downto 0) := (others => '0');
    SIGNAL adrf_node_syncb  : std_logic_vector(13 downto 0) := (others => '0');
    SIGNAL fifo_words_used_syncw       : std_logic_vector(13 downto 0) := (others => '0');
    SIGNAL fifo_words_used_syncr       : std_logic_vector(13 downto 0) := (others => '0');
--    SIGNAL fifo_words_used_syncr       : signed(13 downto 0) := (others => '0');
    SIGNAL fifo_words_used       : std_logic_vector(13 downto 0) := (others => '0');
    SIGNAL diab_node  : std_logic_vector(8 downto 0) := "XXXXXXXXX";
    SIGNAL rsta_int   : std_logic := '0';
    SIGNAL rstb_int   : std_logic := '0';
    SIGNAL rsta_reg   : std_logic := '0';
    SIGNAL rstb_reg   : std_logic := '0';
    SIGNAL reseta     : std_logic := '0';
    SIGNAL resetb     : std_logic := '0';
    SIGNAL di_reg     : std_logic_vector((DATA_WIDTH_W - 1) downto 0) := (others => '0');
    SIGNAL adw_reg    : std_logic_vector((ADDR_WIDTH_W - 1) downto 0) := (others => '1');
    SIGNAL adr_reg    : std_logic_vector((ADDR_WIDTH_R - 1) downto 0) := (others => '1');
    SIGNAL adw_var_syncb_rst : std_logic_vector(ADDR_WIDTH_W downto 0) := (others => '0');
    SIGNAL empty_pointer_rst : std_logic_vector(ADDR_WIDTH_R downto 0) := (others => '0');
    SIGNAL empty_pointer : std_logic_vector(13 downto 0) := (others => '0');
    SIGNAL wrena_reg  : std_logic := '0';
    SIGNAL wrenb_reg  : std_logic := '0';
    SIGNAL rena_reg   : std_logic := '0';
    SIGNAL renb_reg   : std_logic := '0';
    SIGNAL do_node    : std_logic_vector((DATA_WIDTH_R - 1) downto 0) := (others => '0');
    SIGNAL do_reg     : std_logic_vector((DATA_WIDTH_R - 1) downto 0) := (others => '0');
    SIGNAL do_int     : std_logic_vector((DATA_WIDTH_R - 1) downto 0) := (others => '0');
    SIGNAL empty_pointer_reg  : integer := 0;
    SIGNAL pe_pointer_reg  : integer := 0;
    SIGNAL pf_pointer_reg  : integer := 0;
    SIGNAL full_pointer_reg  : integer := 0;
    SIGNAL RADDR_PTR  : integer := 0;
    SIGNAL WADDR_PTR  : integer := 0;
    SIGNAL ef_int     : std_logic := '1';
    SIGNAL pef_int    : std_logic := '1';
    SIGNAL pff_int    : std_logic := '0';
    SIGNAL ff_int     : std_logic := '0';
    SIGNAL ef_reg     : std_logic := '1';
    SIGNAL pef_reg    : std_logic := '1';
    SIGNAL pff_reg    : std_logic := '0';
    SIGNAL ff_reg     : std_logic := '0';
    SIGNAL addr_valid : std_logic := '0';
    CONSTANT aepoint : string(14 downto 1) := AEPOINTER(3 to 16);
    CONSTANT afpoint : string(14 downto 1) := AFPOINTER(3 to 16);
    CONSTANT fullpoint : string(14 downto 1) := FULLPOINTER(3 to 16);
    SIGNAL AEPOINTER_B : std_logic_vector(13 downto 0) := str2slv(aepoint);
    SIGNAL AFPOINTER_B : std_logic_vector(13 downto 0) := str2slv(afpoint);
    SIGNAL FULLPOINTER_B : std_logic_vector(13 downto 0) := str2slv(fullpoint);

    SIGNAL MEM       : std_logic_vector(9215 downto 0) := (others => '0');
BEGIN

   -----------------------
   -- input path delays
   -----------------------
   WireDelay : BLOCK
   BEGIN
   VitalWireDelay(di_ipd(0), di0, tipd_di0);
   VitalWireDelay(di_ipd(1), di1, tipd_di1);
   VitalWireDelay(di_ipd(2), di2, tipd_di2);
   VitalWireDelay(di_ipd(3), di3, tipd_di3);
   VitalWireDelay(di_ipd(4), di4, tipd_di4);
   VitalWireDelay(di_ipd(5), di5, tipd_di5);
   VitalWireDelay(di_ipd(6), di6, tipd_di6);
   VitalWireDelay(di_ipd(7), di7, tipd_di7);
   VitalWireDelay(di_ipd(8), di8, tipd_di8);
   VitalWireDelay(di_ipd(9), di9, tipd_di9);
   VitalWireDelay(di_ipd(10), di10, tipd_di10);
   VitalWireDelay(di_ipd(11), di11, tipd_di11);
   VitalWireDelay(di_ipd(12), di12, tipd_di12);
   VitalWireDelay(di_ipd(13), di13, tipd_di13);
   VitalWireDelay(di_ipd(14), di14, tipd_di14);
   VitalWireDelay(di_ipd(15), di15, tipd_di15);
   VitalWireDelay(di_ipd(16), di16, tipd_di16);
   VitalWireDelay(di_ipd(17), di17, tipd_di17);
   VitalWireDelay(wclk_ipd, clkw, tipd_clkw);
   VitalWireDelay(we_ipd, we, tipd_we);
   VitalWireDelay(csw_ipd(0), csw0, tipd_csw0);
   VitalWireDelay(csw_ipd(1), csw1, tipd_csw1);
   VitalWireDelay(csw_ipd(2), fulli, tipd_fulli);
   VitalWireDelay(rst_ipd1, rst, tipd_rst);
   VitalWireDelay(rclk_ipd, clkr, tipd_clkr);
   VitalWireDelay(re_ipd, re, tipd_re);
   VitalWireDelay(csr_ipd(0), csr0, tipd_csr0);
   VitalWireDelay(csr_ipd(1), csr1, tipd_csr1);
   VitalWireDelay(csr_ipd(2), emptyi, tipd_emptyi);
   VitalWireDelay(rprst_ipd1, rprst, tipd_rprst);
   VitalWireDelay(ore_ipd, ore, tipd_ore);
   END BLOCK;

   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;

      pur_reset <= purnet;
    END PROCESS;

  P201 : PROCESS(wclk_ipd, rst_ipd1)
  BEGIN
     IF (rst_ipd1 = '1') THEN
        rst_ipd2 <= '1';
     ELSIF (wclk_ipd'event and wclk_ipd = '1') THEN
        rst_ipd2 <= '0';
     END IF;
  END PROCESS;

  P202 : PROCESS(rst_ipd1, rst_ipd2)
  BEGIN
     IF ((ASYNC_RESET_RELEASE = "SYNC") and (RESETMODE = "ASYNC")) THEN
        rst_ipd <= rst_ipd2;
     ELSE
        rst_ipd <= rst_ipd1;
     END IF;
  END PROCESS;

  P203 : PROCESS(rclk_ipd, rprst_ipd1)
  BEGIN
     IF (rprst_ipd1 = '1') THEN
        rprst_ipd2 <= '1';
     ELSIF (rclk_ipd'event and rclk_ipd = '1') THEN
        rprst_ipd2 <= '0';
     END IF;
  END PROCESS;
                                                                                              
  P204 : PROCESS(rprst_ipd1, rprst_ipd2)
  BEGIN
     IF ((ASYNC_RESET_RELEASE = "SYNC") and (RESETMODE = "ASYNC")) THEN
        rprst_ipd <= rprst_ipd2;
     ELSE
        rprst_ipd <= rprst_ipd1;
     END IF;
  END PROCESS;


-- chip select A decode
  P1 : PROCESS(csw_ipd)
  BEGIN
     IF (csw_ipd = "000" and CSDECODE_W = "0b00") THEN
        csw_en <= '1';
     ELSIF (csw_ipd = "001" and CSDECODE_W = "0b01") THEN
        csw_en <= '1';
     ELSIF (csw_ipd = "010" and CSDECODE_W = "0b10") THEN
        csw_en <= '1';
     ELSIF (csw_ipd = "011" and CSDECODE_W = "0b11") THEN
        csw_en <= '1';
     ELSE
        csw_en <= '0';
     END IF;
  END PROCESS;

  P2 : PROCESS(csr_ipd)
  BEGIN
     IF (csr_ipd = "000" and CSDECODE_R = "0b00") THEN
        csr_en <= '1';
     ELSIF (csr_ipd = "001" and CSDECODE_R = "0b01") THEN
        csr_en <= '1';
     ELSIF (csr_ipd = "010" and CSDECODE_R = "0b10") THEN
        csr_en <= '1';
     ELSIF (csr_ipd = "011" and CSDECODE_R = "0b11") THEN
        csr_en <= '1';
     ELSE
        csr_en <= '0';
     END IF;
  END PROCESS;

  P3 : PROCESS(di_ipd)
  BEGIN
     CASE DATA_WIDTH_W IS
       WHEN 1 =>
        di_node <= di_ipd(1 downto 1);
       WHEN 2 =>
        di_node <= (di_ipd(5), di_ipd(2));
       WHEN 4 =>
        di_node <= di_ipd(3 downto 0); 
       WHEN 9 =>
        di_node <= di_ipd(8 downto 0);
       WHEN 18 =>
        di_node <= di_ipd(17 downto 0);
       WHEN others =>
          NULL;
     END CASE;
  END PROCESS;

  S1 : PROCESS(adw_node)
  VARIABLE  adw_var : std_logic_vector(ADDR_WIDTH_W downto 0);
  BEGIN
     adw_var := adw_node + '1';
     adwf_node <= (adw_var(ADDR_WIDTH_W downto 0) & ((12 - ADDR_WIDTH_W) downto 0 => '0'));
  END PROCESS;

  S11 : PROCESS(adw_node_syncb, rprst_ipd, addr_valid, rst_ipd)
  VARIABLE  adw_var_syncb : std_logic_vector(ADDR_WIDTH_W downto 0);
  BEGIN
     adw_var_syncb := adw_node_syncb + '1';

     IF (rst_ipd = '1') THEN
        adwf_node_syncb <= (others => '0');
     ELSIF (rprst_ipd = '1') THEN
        adwf_node_syncb <= (adw_var_syncb_rst(ADDR_WIDTH_W downto 0) & ((12 - ADDR_WIDTH_W) downto 0 => '0'));
     ELSIF (addr_valid'event) THEN 
        adwf_node_syncb <= (adw_var_syncb(ADDR_WIDTH_W downto 0) & ((12 - ADDR_WIDTH_W) downto 0 => '0'));
     END IF;
  END PROCESS;

  S2 : PROCESS(adr_node)
  VARIABLE  adr_var : std_logic_vector(ADDR_WIDTH_R downto 0);
  BEGIN
     adr_var := adr_node + '1';
     adrf_node <= (adr_var(ADDR_WIDTH_R downto 0) & ((12 - ADDR_WIDTH_R) downto 0 => '0'));
  END PROCESS;

  S21 : PROCESS(adr_node_syncb)
  VARIABLE  adr_var_syncb : std_logic_vector(ADDR_WIDTH_R downto 0);
  BEGIN
     adr_var_syncb := adr_node_syncb + '1';
     adrf_node_syncb <= (adr_var_syncb(ADDR_WIDTH_R downto 0) & ((12 - ADDR_WIDTH_R) downto 0 => '0'));
  END PROCESS;

  empty_pointer <= (empty_pointer_rst(ADDR_WIDTH_R downto 0) & ((12 - ADDR_WIDTH_R) downto 0 => '1'));

  empty_pointer_reg <= conv_integer(empty_pointer);
  pe_pointer_reg <= conv_integer(AEPOINTER_B);
  pf_pointer_reg <= conv_integer(AFPOINTER_B);
  full_pointer_reg <= conv_integer(FULLPOINTER_B);

fifo_words_used_syncr <= ((adwf_node_syncb(13) xor adrf_node(13)) & adwf_node_syncb(12 downto 0) - ('0' & adrf_node(12 downto 0)));

fifo_words_used_syncw <= ((adrf_node_syncb(13) xor adwf_node(13)) & adwf_node(12 downto 0) - ('0' & adrf_node_syncb(12 downto 0)));

ef_int <= '1' when (fifo_words_used_syncr <= empty_pointer_reg) else '0';
pef_int <= '1' when (fifo_words_used_syncr <= pe_pointer_reg) else '0';
pff_int <= '1' when (fifo_words_used_syncw >= pf_pointer_reg) else '0';
ff_int <= '1' when (fifo_words_used_syncw >= full_pointer_reg) else '0';

ef <= ef_int;
aef <= pef_int;
aff <= pff_int;
ff <= ff_int;

-- Reset Write and Read Counter

  P4 : PROCESS(pur_reset, rst_ipd, wclk_ipd)
  BEGIN
     IF (pur_reset = '0') THEN
        di_reg <= (others => '0');
     ELSE 
        IF (wclk_ipd'event and wclk_ipd = '1') THEN
           IF (csw_en = '1' and we_ipd = '1') THEN
              di_reg <= di_node;
           END IF;
        END IF;
     END IF;
  END PROCESS;

  P54 : PROCESS(g_reset, rst_ipd, wclk_ipd)
  BEGIN
     IF (g_reset = '0' or rst_ipd = '1') THEN
        adw_node <= (others => '1');
     ELSIF (wclk_ipd'event and wclk_ipd = '1') THEN
        IF (csw_en = '1' and we_ipd = '1') THEN
           adw_node <= adw_node + '1';
        END IF;
     END IF;
  END PROCESS;

  P55 : PROCESS(g_reset, rst_ipd, rclk_ipd)
  BEGIN
     IF (g_reset = '0' or rst_ipd = '1') THEN
        adw_node_syncb <= (others => '1');
        addr_valid <= not addr_valid;
     ELSIF (rclk_ipd'event and rclk_ipd = '1') THEN
        adw_node_syncb <= adw_node;
        addr_valid <= not addr_valid;
     END IF;
  END PROCESS;

  P5 : PROCESS(adw_node, di_reg)
  VARIABLE WADDR : integer;
  BEGIN
     WADDR := conv_integer(adw_node((ADDR_WIDTH_W-1) downto 0));
     WADDR_PTR <= (conv_integer(adw_node + '1') + 1);

     IF ((DATA_WIDTH_W = 18) or (DATA_WIDTH_W = 9)) THEN
        FOR i IN 0 TO (DATA_WIDTH_W - 1) LOOP
            MEM((WADDR * DATA_WIDTH_W) + i) <= di_reg(i);
        END LOOP;
     ELSE
        FOR i IN 0 TO (DATA_WIDTH_W - 1) LOOP
            MEM((WADDR * DATA_WIDTH_W) + (WADDR / div_a) + i) <= di_reg(i);
        END LOOP;
     END IF;
  END PROCESS;

  P6 : PROCESS(g_reset, rst_ipd, rprst_ipd, rclk_ipd)
  BEGIN
     IF (g_reset = '0' or rst_ipd = '1' or rprst_ipd = '1') THEN
        adr_node <= (others => '1');
     ELSIF (rclk_ipd'event and rclk_ipd = '1') THEN
        IF (csr_en = '1' and re_ipd = '1') THEN
           adr_node <= adr_node + '1';
        END IF;
     END IF;
  END PROCESS;

  P60 : PROCESS(g_reset, rst_ipd, rprst_ipd, wclk_ipd)
  BEGIN
--     IF (g_reset = '0' or rst_ipd = '1' or rprst_ipd = '1') THEN
--        adr_node_syncb <= (others => '1');
--     ELSIF (wclk_ipd'event and wclk_ipd = '1') THEN
--        adr_node_syncb <= adr_node;
--     END IF;
     IF (g_reset = '0' or rst_ipd = '1') THEN
        adr_node_syncb <= (others => '1');
     ELSIF (wclk_ipd'event and wclk_ipd = '1') THEN
        IF (rprst_ipd = '1') THEN
           adr_node_syncb <= (others => '1');
        ELSE
           adr_node_syncb <= adr_node;
        END IF;
     END IF;
  END PROCESS;

  P7 : PROCESS(adr_node, g_reset, rst_ipd, rprst_ipd)
  VARIABLE RADDR : integer;
  BEGIN
     RADDR := conv_integer(adr_node((ADDR_WIDTH_R-1) downto 0));
     RADDR_PTR <= (conv_integer(adr_node + '1') + 1);

     IF ((g_reset = '0') or (rst_ipd = '1') or (rprst_ipd = '1')) THEN
        do_node <= (others => '0');
     ELSIF (adr_node'event) THEN
--        IF ((g_reset = '1') and (rst_ipd = '0') and (rprst_ipd = '0')) THEN     
        FOR i IN 0 TO (DATA_WIDTH_R - 1)  LOOP
           do_node(i) <= MEM((RADDR * DATA_WIDTH_R) + (RADDR / div_b) + i);
        END LOOP;
     END IF;
  END PROCESS;

  P8 : PROCESS(g_reset, rst_ipd, rprst_ipd, rclk_ipd)
  BEGIN
     IF (g_reset = '0') THEN
        do_reg <= (others => '0');
     ELSIF (RESETMODE = "ASYNC") THEN
        IF ((rst_ipd = '1') or (rprst_ipd = '1'))THEN
           do_reg <= (others => '0');
        ELSIF (rclk_ipd'event and rclk_ipd = '1') THEN
           IF (ore_ipd = '1') THEN
              do_reg <= do_node;
           END IF;
        END IF;
     ELSIF (RESETMODE = "SYNC") THEN
        IF (rclk_ipd'event and rclk_ipd = '1') THEN
           IF ((rst_ipd = '1') or (rprst_ipd = '1')) THEN
              do_reg <= (others => '0');
           ELSIF (ore_ipd = '1') THEN 
              do_reg <= do_node;
           END IF;
        END IF;
     END IF;
  END PROCESS;

  P9 : PROCESS(do_node, do_reg)
  BEGIN
     IF (REGMODE = "OUTREG") THEN
        do_int <= do_reg;
     ELSE
        do_int <= do_node;
     END IF;
  END PROCESS;

  P10 : PROCESS(do_int)
  BEGIN
     CASE DATA_WIDTH_R IS
       WHEN 1 =>
        do0 <= do_int(0);
       WHEN 2 =>
        (do1, do0) <= do_int(1 downto 0);
       WHEN 4 =>
        (do3, do2, do1, do0) <= do_int(3 downto 0);
       WHEN 9 =>
        (do8, do7, do6, do5, do4, do3, do2, do1, do0) <= do_int(8 downto 0);
       WHEN 18 =>
        (do17, do16, do15, do14, do13, do12, do11, do10, do9) <= do_int(8 downto 0);
        (do8, do7, do6, do5, do4, do3, do2, do1, do0) <= do_int(17 downto 9);
       WHEN others =>
          NULL;
     END CASE;
  END PROCESS;


END V;



--*********************************************************************
----- CELL MULT2 -----
--*********************************************************************
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;

-- entity declaration --
entity MULT2 is

   port(
      A0                             :	in    STD_ULOGIC;
      A1                             :	in    STD_ULOGIC;
      A2                             :	in    STD_ULOGIC;
      A3                             :	in    STD_ULOGIC;
      B0                             :	in    STD_ULOGIC;
      B1                             :	in    STD_ULOGIC;
      B2                             :	in    STD_ULOGIC;
      B3                             :	in    STD_ULOGIC;
      CI                            :	in    STD_ULOGIC;
      P0                             :	out   STD_ULOGIC;
      P1                             :	out   STD_ULOGIC;
      CO                           :	out   STD_ULOGIC);

   attribute VITAL_LEVEL0 of MULT2 : entity is TRUE;
end MULT2;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
architecture V of MULT2 is
   attribute VITAL_LEVEL0 of V : architecture is TRUE;

begin

   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : process (A0, B0, A1, B1, A2, B2, A3, B3, CI)


   -- functionality results
   VARIABLE Results : STD_LOGIC_VECTOR(1 to 3) := (others => 'X');
   ALIAS P0_zd : STD_LOGIC is Results(1);
   ALIAS P1_zd : STD_LOGIC is Results(2);
   ALIAS CO_zd : STD_LOGIC is Results(3);

   VARIABLE C_int         : STD_LOGIC := 'X';

   begin

      -------------------------
      --  Functionality Section
      -------------------------
      P0_zd := ((B0) AND (A0)) XOR ((B1) AND (A1)) XOR (CI);
      C_int := (A0 AND B0 AND A1 AND B1) OR (A0 AND B0 AND CI) OR (A1 AND B1 AND CI);

      P1_zd := ((B2) AND (A2)) XOR ((B3) AND (A3)) XOR (C_int);
      CO_zd := (A2 AND B2 AND A3 AND B3) OR (A2 AND B2 AND C_int) OR (A3 AND B3 AND C_int);

      P0 <= P0_zd;
      P1 <= P1_zd;
      CO <= CO_zd;

   end process;

end V;

configuration CFG_MULT2_V of MULT2 is
   for V
   end for;
end CFG_MULT2_V;


--
---
library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
--use work.components.all;


-- ************************************************************************
-- Entity definition
-- ************************************************************************

entity CCU2D is

   generic (
      inject1_0 : string := "YES";
      inject1_1 : string := "YES";
      init0: std_logic_vector(15 downto 0) := "0000000000000000";
      init1: std_logic_vector(15 downto 0) := "0000000000000000"
   );

   port (
      A0,A1 : in std_ulogic;
      B0,B1 : in std_ulogic;
      C0,C1 : in std_ulogic;
      D0,D1 : in std_ulogic;
      CIN : in std_ulogic;
      S0,S1 : out std_ulogic;
      COUT : out std_ulogic
   );
      ATTRIBUTE Vital_Level0 OF CCU2D : ENTITY IS TRUE;

end CCU2D;

architecture bev of CCU2D is
    ATTRIBUTE Vital_Level0 OF bev : ARCHITECTURE IS TRUE;
   ------------------------------------------------------------------

--   signal init_vec0 : std_logic_vector( 15 downto 0);
--   signal init_vec1 : std_logic_vector( 15 downto 0);
                                                                                              
--   signal lut2_init0 : std_logic_vector (3 downto 0);
--   signal lut2_init1 : std_logic_vector (3 downto 0);
                                                                                              
--   signal lut2_sel0, lut2_sel1, lut4_sel0, lut4_sel1 : integer :=0;
   signal lut2_out0, lut2_out1 : std_ulogic;
   signal prop0, prop1, gen0, gen0_0, gen1, gen1_1, cout_sig0, cout_sig1 : std_ulogic;
   -----------------------------------------------------
                                                                                              
begin
                                                                                              
--   init_vec0 <= init0;
--   init_vec1 <= init1;
                                                                                              
--   lut2_init0 <= init_vec0( 15 downto 12 );
--   lut2_init1 <= init_vec1( 15 downto 12 );
                                                                                              
--   lut2_sel0 <= conv_integer (B0 & A0);
--   lut2_sel1 <= conv_integer (B1 & A1);
--   lut4_sel0 <= conv_integer (D0 & C0 & B0 & A0);
--   lut4_sel1 <= conv_integer (D1 & C1 & B1 & A1);

--   prop0 <= init_vec0(lut4_sel0) ;
--   prop1 <= init_vec1(lut4_sel1);


--   lut2_out0 <= lut2_init0(lut2_sel0);
--   lut2_out1 <= lut2_init1(lut2_sel1);

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (A0, A1, B0, B1, C0, C1, D0, D1)

     VARIABLE init_vec0  : std_logic_vector(15 downto 0) := init0;
     VARIABLE init_vec1  : std_logic_vector(15 downto 0) := init1;
     VARIABLE lut2_init0 : std_logic_vector(3 downto 0)  := init0(15 downto 12 );
     VARIABLE lut2_init1 : std_logic_vector(3 downto 0)  := init1(15 downto 12 );

   BEGIN

     ------------------------
     -- functionality section
     ------------------------
     prop0 <= VitalMUX (data => init_vec0, dselect => (D0, C0, B0, A0));
     prop1 <= VitalMUX (data => init_vec1, dselect => (D1, C1, B1, A1));

     lut2_out0 <= VitalMUX (data => lut2_init0, dselect => (B0, A0));
     lut2_out1 <= VitalMUX (data => lut2_init1, dselect => (B1, A1));

   END PROCESS;

   gen0 <= '1' when (inject1_0 = "YES") else
           '1' when (inject1_0 = "yes") else
           not(lut2_out0) ;
   gen1 <= '1' when (inject1_1 = "YES") else
           '1' when (inject1_1 = "yes") else
           not(lut2_out1) ;

   gen0_0 <= '0' when (inject1_0 = "YES") else
           '0' when (inject1_0 = "yes") else '1';
                                                                                              
   gen1_1 <= '0' when (inject1_1 = "YES") else
           '0' when (inject1_1 = "yes") else '1';

   cout_sig0 <= (not(prop0) and gen0 ) or (prop0 and CIN);
   cout_sig1 <= (not(prop1) and gen1 ) or (prop1 and cout_sig0);
                                                                                              
   COUT <= cout_sig1;
                                                                                              
   S0 <=  prop0 xor (CIN and gen0_0);
   S1 <=  prop1 xor (cout_sig0 and gen1_1);

end bev;


--
----- cell dcma -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
                                                                                    
                                                                                    
-- entity declaration --
ENTITY dcma IS
                                                                                    
   PORT(
      clk0              : IN    std_logic;
      clk1              : IN    std_logic;
      sel              : IN    std_logic;
      dcmout               : OUT  std_logic);
                                                                                    
   ATTRIBUTE Vital_Level0 OF dcma : ENTITY IS TRUE;
                                                                                    
END dcma;
                                                                                    
-- architecture body --
                                                                                    
LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF dcma IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;
                                                                                    
BEGIN
                                                                                    
   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (clk0, clk1, sel)
                                                                                    
   BEGIN
                                                                                    
      -------------------------
      --  functionality section
      -------------------------
      dcmout <= vitalmux
                 (data => (clk1, clk0),
                  dselect => (0 => sel));
                                                                                    
   END PROCESS;
                                                                                    
END v;
                                                                                    
                                                                                    

--
----- cell pllrefcs -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
                                                                                    
                                                                                    
-- entity declaration --
ENTITY pllrefcs IS
                                                                                    
   PORT(
      clk0              : IN    std_logic;
      clk1              : IN    std_logic;
      sel              : IN    std_logic;
      pllcsout               : OUT  std_logic);
                                                                                    
   ATTRIBUTE Vital_Level0 OF pllrefcs : ENTITY IS TRUE;
                                                                                    
END pllrefcs;
                                                                                    
-- architecture body --
                                                                                    
LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF pllrefcs IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;
                                                                                    
BEGIN
                                                                                    
   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (clk0, clk1, sel)
                                                                                    
   BEGIN
                                                                                    
      -------------------------
      --  functionality section
      -------------------------
      pllcsout <= vitalmux
                 (data => (clk1, clk0),
                  dselect => (0 => sel));
                                                                                    
   END PROCESS;
                                                                                    
END v;
                                                                                    
                                                                                    
--
----- cell dcca -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
                                                                                    
                                                                                    
-- entity declaration --
ENTITY dcca IS
                                                                                    
   PORT(
      clki              : IN    std_logic;
      ce              : IN    std_logic;
      clko               : OUT  std_logic);
                                                                                    
   ATTRIBUTE Vital_Level0 OF dcca : ENTITY IS TRUE;
                                                                                    
END dcca;
                                                                                    
-- architecture body --
                                                                                    
LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF dcca IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;
                                                                                    
BEGIN
                                                                                    
   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (clki)
   BEGIN
      IF (ce = '1') THEN
         clko <= clki;
      ELSE
         clko <= '0';
      END IF;                                                                                 
   END PROCESS;
                                                                                    
END v;
                                                                                    
                                                                                    

--
----- cell eclkbridgecs -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
                                                                                    
                                                                                    
-- entity declaration --
ENTITY eclkbridgecs IS
                                                                                    
   PORT(
      clk0              : IN    std_logic;
      clk1              : IN    std_logic;
      sel              : IN    std_logic;
      ecsout            : OUT  std_logic);
                                                                                    
   ATTRIBUTE Vital_Level0 OF eclkbridgecs : ENTITY IS TRUE;
                                                                                    
END eclkbridgecs;
                                                                                    
-- architecture body --
                                                                                    
LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF eclkbridgecs IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;
                                                                                    
BEGIN
                                                                                    
   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (clk0, clk1, sel)
                                                                                    
   BEGIN
                                                                                    
      -------------------------
      --  functionality section
      -------------------------
      ecsout <= vitalmux
                 (data => (clk1, clk0),
                  dselect => (0 => sel));
                                                                                    
   END PROCESS;
                                                                                    
END v;
                                                                                    

--
----- cell ehxpllj -----
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.vital_timing.all;
use ieee.vital_primitives.all;
use work.components.all;
                                                                                                
                                                                                                
-- entity declaration --
ENTITY ehxpllj IS
   GENERIC (
      FIN                : string    := "100.0";
      CLKI_DIV           : Integer   := 1;
      CLKFB_DIV          : Integer   := 1;
      CLKOP_DIV          : Integer   := 1;
      CLKOS_DIV          : Integer   := 1;
      CLKOS2_DIV         : Integer   := 1;
      CLKOS3_DIV         : Integer   := 1;
      CLKOP_ENABLE       : string    := "ENABLED";
      CLKOS_ENABLE       : string    := "ENABLED";
      CLKOS2_ENABLE      : string    := "ENABLED";
      CLKOS3_ENABLE      : string    := "ENABLED";
      CLKOP_CPHASE       : Integer   := 0;
      CLKOS_CPHASE       : Integer   := 0;
      CLKOS2_CPHASE      : Integer   := 0;
      CLKOS3_CPHASE      : Integer   := 0;
      CLKOP_FPHASE       : Integer   := 0;
      CLKOS_FPHASE       : Integer   := 0;
      CLKOS2_FPHASE      : Integer   := 0;
      CLKOS3_FPHASE      : Integer   := 0;
      FEEDBK_PATH        : string    := "CLKOP";
      FRACN_ENABLE       : string    := "DISABLED";
      FRACN_DIV          : Integer   := 0;
      PLL_USE_WB         : string    := "DISABLED";
      CLKOP_TRIM_POL     : string    := "RISING";
      CLKOP_TRIM_DELAY   : Integer   := 0;
      CLKOS_TRIM_POL     : string    := "RISING";
      CLKOS_TRIM_DELAY   : Integer   := 0;
      VCO_BYPASS_A0      : string    := "DISABLED";
      VCO_BYPASS_B0      : string    := "DISABLED";
      VCO_BYPASS_C0      : string    := "DISABLED";
      VCO_BYPASS_D0      : string    := "DISABLED";
      PREDIVIDER_MUXA1   : Integer   := 0;
      PREDIVIDER_MUXB1   : Integer   := 0;
      PREDIVIDER_MUXC1   : Integer   := 0;
      PREDIVIDER_MUXD1   : Integer   := 0;
      OUTDIVIDER_MUXA2   : string    := "DIVA";
      OUTDIVIDER_MUXB2   : string    := "DIVB";
      OUTDIVIDER_MUXC2   : string    := "DIVC";
      OUTDIVIDER_MUXD2   : string    := "DIVD";
      PLL_LOCK_DELAY     : Integer   := 100;
      PLL_LOCK_MODE      : Integer   := 0;
      REFIN_RESET        : string    := "DISABLED";
      SYNC_ENABLE        : string    := "DISABLED";
      INT_LOCK_STICKY    : string    := "ENABLED";
      DPHASE_SOURCE      : string    := "DISABLED";
      STDBY_ENABLE       : string    := "DISABLED";
      PLLRST_ENA         :  string   := "DISABLED";
      MRST_ENA           :  string   := "DISABLED";
      DCRST_ENA          :  string   := "DISABLED";
      DDRST_ENA          :  string   := "DISABLED";
      INTFB_WAKE         :  string   := "DISABLED";
      TimingChecksOn     : Boolean   := FALSE;
      XOn                : Boolean   := FALSE;
      MsgOn              : Boolean   := FALSE;
      tipd_clki                : VitalDelayType01 := (0 ns, 0 ns);
      tipd_clkfb               : VitalDelayType01 := (0 ns, 0 ns);
      tipd_phasesel1           : VitalDelayType01 := (0 ns, 0 ns);
      tipd_phasesel0           : VitalDelayType01 := (0 ns, 0 ns);
      tipd_phasedir             : VitalDelayType01 := (0 ns, 0 ns);
      tipd_phasestep             : VitalDelayType01 := (0 ns, 0 ns);
      tipd_loadreg             : VitalDelayType01 := (0 ns, 0 ns);
      tipd_stdby               : VitalDelayType01 := (0 ns, 0 ns);
      tipd_pllwakesync         : VitalDelayType01 := (0 ns, 0 ns);
      tipd_rst                 : VitalDelayType01 := (0 ns, 0 ns);
      tipd_resetm              : VitalDelayType01 := (0 ns, 0 ns);
      tipd_resetc              : VitalDelayType01 := (0 ns, 0 ns);
      tipd_resetd              : VitalDelayType01 := (0 ns, 0 ns);
      tipd_enclkop             : VitalDelayType01 := (0 ns, 0 ns);
      tipd_enclkos             : VitalDelayType01 := (0 ns, 0 ns);
      tipd_enclkos2            : VitalDelayType01 := (0 ns, 0 ns);
      tipd_enclkos3            : VitalDelayType01 := (0 ns, 0 ns);
      tipd_pllclk              : VitalDelayType01 := (0 ns, 0 ns);
      tipd_pllrst              : VitalDelayType01 := (0 ns, 0 ns);
      tipd_pllstb              : VitalDelayType01 := (0 ns, 0 ns);
      tipd_pllwe               : VitalDelayType01 := (0 ns, 0 ns);
      tipd_plladdr4            : VitalDelayType01 := (0 ns, 0 ns);
      tipd_plladdr3            : VitalDelayType01 := (0 ns, 0 ns);
      tipd_plladdr2            : VitalDelayType01 := (0 ns, 0 ns);
      tipd_plladdr1            : VitalDelayType01 := (0 ns, 0 ns);
      tipd_plladdr0            : VitalDelayType01 := (0 ns, 0 ns);
      tipd_plldati7            : VitalDelayType01 := (0 ns, 0 ns);
      tipd_plldati6            : VitalDelayType01 := (0 ns, 0 ns);
      tipd_plldati5            : VitalDelayType01 := (0 ns, 0 ns);
      tipd_plldati4            : VitalDelayType01 := (0 ns, 0 ns);
      tipd_plldati3            : VitalDelayType01 := (0 ns, 0 ns);
      tipd_plldati2            : VitalDelayType01 := (0 ns, 0 ns);
      tipd_plldati1            : VitalDelayType01 := (0 ns, 0 ns);
      tipd_plldati0            : VitalDelayType01 := (0 ns, 0 ns));

   PORT(
      clki                    : in std_logic;
      clkfb                   : in std_logic;
      phasesel1               : in std_logic;
      phasesel0               : in std_logic;
      phasedir                : in std_logic;
      phasestep               : in std_logic;
      loadreg                 : in std_logic;
      stdby                   : in std_logic;
      pllwakesync             : in std_logic;
      rst                     : in std_logic;
      resetm                  : in std_logic;
      resetc                  : in std_logic;
      resetd                  : in std_logic;
      enclkop                 : in std_logic;
      enclkos                 : in std_logic;
      enclkos2                : in std_logic;
      enclkos3                : in std_logic;
      pllclk                  : in std_logic;
      pllrst                  : in std_logic;
      pllstb                  : in std_logic;
      pllwe                   : in std_logic;
      plladdr4                : in std_logic;
      plladdr3                : in std_logic;
      plladdr2                : in std_logic;
      plladdr1                : in std_logic;
      plladdr0                : in std_logic;
      plldati7                : in std_logic;
      plldati6                : in std_logic;
      plldati5                : in std_logic;
      plldati4                : in std_logic;
      plldati3                : in std_logic;
      plldati2                : in std_logic;
      plldati1                : in std_logic;
      plldati0                : in std_logic;
      clkop                   : out std_logic;
      clkos                   : out std_logic;
      clkos2                  : out std_logic;
      clkos3                  : out std_logic;
      lock                    : out std_logic;
      refclk                  : out std_logic;
      intlock                 : out std_logic;
      dphsrc                  : out std_logic;
      clkintfb                : out std_logic;
      plldato7                : out std_logic;
      plldato6                : out std_logic;
      plldato5                : out std_logic;
      plldato4                : out std_logic;
      plldato3                : out std_logic;
      plldato2                : out std_logic;
      plldato1                : out std_logic;
      plldato0                : out std_logic;
      pllack                  : out std_logic);

    ATTRIBUTE Vital_Level0 OF ehxpllj : ENTITY IS TRUE;

END ehxpllj ;
                                                                                    
-- ARCHITECTURE body --
ARCHITECTURE V OF ehxpllj IS
    ATTRIBUTE Vital_Level0 OF V : ARCHITECTURE IS TRUE;
    SIGNAL  clki_ipd          : std_logic := '0';
    SIGNAL  clkfb_ipd         : std_logic := '0';
    SIGNAL  phasesel_ipd               : std_logic_vector(1 downto 0) := "00";
    SIGNAL  phasedir_ipd         : std_logic := '0';
    SIGNAL  phasestep_ipd         : std_logic := '0';
    SIGNAL  loadreg_ipd                 : std_logic := '0';
    SIGNAL  stdby_ipd                   : std_logic := '0';
    SIGNAL  pllwakesync_ipd             : std_logic := '0';
    SIGNAL  rst_ipd                     : std_logic := '0';
    SIGNAL  resetm_ipd                  : std_logic := '0';
    SIGNAL  resetc_ipd                  : std_logic := '0';
    SIGNAL  resetd_ipd                  : std_logic := '0';
    SIGNAL  enclkop_ipd                 : std_logic := '0';
    SIGNAL  enclkos_ipd                 : std_logic := '0';
    SIGNAL  enclkos2_ipd                 : std_logic := '0';
    SIGNAL  enclkos3_ipd                 : std_logic := '0';
    SIGNAL  pllclk_ipd                  : std_logic := '0';
    SIGNAL  pllrst_ipd                  : std_logic := '0';
    SIGNAL  pllstb_ipd                  : std_logic := '0';
    SIGNAL  pllwe_ipd                   : std_logic := '0';
    SIGNAL  plladdr_ipd                : std_logic_vector(4 downto 0) := "00000";
    SIGNAL  plldati_ipd                : std_logic_vector(7 downto 0) := "00000000";
    SIGNAL  plldati6_ipd                : std_logic := '0';
    SIGNAL  plldati5_ipd                : std_logic := '0';
    SIGNAL  plldati4_ipd                : std_logic := '0';
    SIGNAL  plldati3_ipd                : std_logic := '0';
    SIGNAL  plldati2_ipd                : std_logic := '0';
    SIGNAL  plldati1_ipd                : std_logic := '0';
    SIGNAL  MEM            : std_logic_vector(231 downto 0) := (others => '0');
    SIGNAL  false_clk          : std_logic := '0';
    SIGNAL  CLKOP_FPHASE_DYN          : Integer := CLKOP_FPHASE;
    SIGNAL  CLKOP_CPHASE_DYN          : Integer := CLKOP_CPHASE;
    SIGNAL  CLKOS_FPHASE_DYN          : Integer := CLKOS_FPHASE;
    SIGNAL  CLKOS_CPHASE_DYN          : Integer := CLKOS_CPHASE;
    SIGNAL  CLKOS2_FPHASE_DYN          : Integer := CLKOS2_FPHASE;
    SIGNAL  CLKOS2_CPHASE_DYN          : Integer := CLKOS2_CPHASE;
    SIGNAL  CLKOS3_FPHASE_DYN          : Integer := CLKOS3_FPHASE;
    SIGNAL  CLKOS3_CPHASE_DYN          : Integer := CLKOS3_CPHASE;
    SIGNAL  clkop_first_time          : std_logic := '1';
    SIGNAL  clock_valid          : std_logic := '0';
    SIGNAL  clock_invalid          : std_logic := '0';
    SIGNAL  out_clk_valid          : std_logic := '0';
    SIGNAL net_divide        : real := 1.0 ;
    SIGNAL net_divide1        : integer := 1 ;
    SIGNAL real_delay1        : time := 0 ps;
    SIGNAL intfb_out          : std_logic := '0';
    SIGNAL ratio1             : Integer   := 0;
    SIGNAL t_diva_clk        : time := 0 ps;
    SIGNAL t_divb_clk        : time := 0 ps;
    SIGNAL t_divc_clk        : time := 0 ps;
    SIGNAL t_divd_clk        : time := 0 ps;
    SIGNAL ha_clk_a_trim        : time := 0 ps;
    SIGNAL ha_clk_b_trim        : time := 0 ps;
    SIGNAL ha_clk_a        : time := 0 ps;
    SIGNAL ha_clk_b        : time := 0 ps;
    SIGNAL ha_vco_a        : time := 0 ps;
    SIGNAL ha_vco_b        : time := 0 ps;
    SIGNAL t_in_clk           : time := 0 ns;
    SIGNAL t_vco              : time := 0 ns;
    SIGNAL ha_vco1            : time := 0 ns;
    SIGNAL ha_vco             : time := 0 ns;
    SIGNAL duty_vco1          : time := 0 ns;
    SIGNAL duty_vco           : time := 0 ns;
    SIGNAL ha_vco_r1          : real := 0.0;
    SIGNAL round_err          : real := 0.0;
    SIGNAL t_in_clk1          : time := 0 ns;
    SIGNAL t_in_clk2          : time := 0 ns;
    SIGNAL t_in_clk3          : time := 0 ns;
    SIGNAL total_fb_delay     : time := 0 ps;
    SIGNAL t_fb_clk           : time := 0 ps;
    SIGNAL virtual_delay1     : time := 0 ps;
    SIGNAL vco_ph_del_a       : time := 0 ps;
    SIGNAL vco_ph_del_b       : time := 0 ps;
    SIGNAL vco_ph_del_c       : time := 0 ps;
    SIGNAL vco_ph_del_d       : time := 0 ps;
    SIGNAL diva_ph_del        : time := 0 ps;
    SIGNAL divb_ph_del        : time := 0 ps;
    SIGNAL divc_ph_del        : time := 0 ps;
    SIGNAL divd_ph_del        : time := 0 ps;
    SIGNAL op_ph_del        : time := 0 ps;
    SIGNAL os_ph_del        : time := 0 ps;
    SIGNAL os2_ph_del        : time := 0 ps;
    SIGNAL os3_ph_del        : time := 0 ps;
    SIGNAL lock_all           : std_logic := '0';
    SIGNAL first_time7        : std_logic := '1';
    SIGNAL lock_delay_reg     : time := 1 ns;
    SIGNAL lock1              : std_logic := '0';
    SIGNAL d_lock             : std_logic := '1';
    SIGNAL d1_lock            : std_logic := '1';
    SIGNAL d2_lock            : std_logic := '1';
    SIGNAL d3_lock            : std_logic := '1';
    SIGNAL d4_lock            : std_logic := '1';
    SIGNAL A0_OUT, B0_OUT, C0_OUT, D0_OUT            : std_logic := '0';
    SIGNAL PHA, PHB, PHC, PHD            : std_logic := '0';
    SIGNAL A1_OUT, B1_OUT, C1_OUT, D1_OUT            : std_logic := '0';
    SIGNAL DIVA_OUT_DEL, DIVB_OUT_DEL, DIVC_OUT_DEL, DIVD_OUT_DEL      : std_logic := '0';
    SIGNAL DIVA_OUT_DEL2, DIVB_OUT_DEL2, DIVC_OUT_DEL2, DIVD_OUT_DEL2      : std_logic := '0';
    SIGNAL DIVA_OUT_DEL1, DIVB_OUT_DEL1      : std_logic := '0';
    SIGNAL DIVA_OUT, DIVB_OUT, DIVC_OUT, DIVD_OUT : std_logic := '0'; 
    SIGNAL A2_OUT, B2_OUT, C2_OUT, D2_OUT    : std_logic := '0';
    SIGNAL CLKOP_OUT, CLKOS_OUT, CLKOS2_OUT, CLKOS3_OUT  : std_logic := '0';
    SIGNAL first_time_a, first_time_b, first_time_c, first_time_d  : std_logic := '1';
    SIGNAL CLKFB_DIV_REG     : Integer := 1;
    SIGNAL CLKI_DIV_REG     : Integer := 1;
    SIGNAL CLKOP_DIV_REG     : Integer := 1;
    SIGNAL CLKOS_DIV_REG     : Integer := 1;
    SIGNAL CLKOS2_DIV_REG     : Integer := 1;
    SIGNAL CLKOS3_DIV_REG     : Integer := 1;
    SIGNAL load_count_op     : Integer := 0;
    SIGNAL load_count_os     : Integer := 0;
    SIGNAL load_count_os2     : Integer := 0;
    SIGNAL load_count_os3     : Integer := 0;
    SIGNAL div0_reg1         : Integer := 0;
    SIGNAL vco_clk           : std_logic := '0';
    SIGNAL vco_clk_a           : std_logic := '0';
    SIGNAL vco_clk_b           : std_logic := '0';
    SIGNAL load_reg_en           : std_logic := '0';
    SIGNAL load_reg_en_op2           : std_logic := '0';
    SIGNAL load_reg_en_op1           : std_logic := '0';
    SIGNAL load_reg_en_op           : std_logic := '0';
    SIGNAL load_reg_en_os_2           : std_logic := '0';
    SIGNAL load_reg_en_os_1           : std_logic := '0';
    SIGNAL load_reg_en_os           : std_logic := '0';
    SIGNAL load_reg_en_os2_2           : std_logic := '0';
    SIGNAL load_reg_en_os2_1           : std_logic := '0';
    SIGNAL load_reg_en_os2           : std_logic := '0';
    SIGNAL load_reg_en_os3_2           : std_logic := '0';
    SIGNAL load_reg_en_os3_1           : std_logic := '0';
    SIGNAL load_reg_en_os3           : std_logic := '0';
    SIGNAL phase_dir           : std_logic := '0';
    SIGNAL phase_step           : std_logic := '0';
    SIGNAL phase_sel           : std_logic_vector(1 downto 0) := "00";
    SIGNAL step_p         : Integer := 0;
    SIGNAL step_s         : Integer := 0;
    SIGNAL step_s2         : Integer := 0;
    SIGNAL step_s3         : Integer := 0;
    SIGNAL step_op         : Integer := 0;
    SIGNAL step_op1         : Integer := 0;
    SIGNAL step_op2         : Integer := 0;
    SIGNAL step_os         : Integer := 0;
    SIGNAL step_os_1         : Integer := 0;
    SIGNAL step_os_2         : Integer := 0;
    SIGNAL step_os2         : Integer := 0;
    SIGNAL step_os2_1         : Integer := 0;
    SIGNAL step_os2_2         : Integer := 0;
    SIGNAL step_os3         : Integer := 0;
    SIGNAL step_os3_1         : Integer := 0;
    SIGNAL step_os3_2         : Integer := 0;
    SIGNAL RSTB_NEW           : std_logic := '0';
    SIGNAL vir_lock           : std_logic := '0';
    SIGNAL CLKOS3REG           : std_logic := '0';
    SIGNAL CLKOPREG           : std_logic := '0';
    SIGNAL CLKOSREG           : std_logic := '0';
    SIGNAL CLKOS2REG           : std_logic := '0';
    SIGNAL LOCKREG             : std_logic := '0';
    SIGNAL LOCKREG1             : std_logic := '0';
    SIGNAL LOCKREG2             : std_logic := '0';
    SIGNAL LOCKREG3             : std_logic := '0';
    SIGNAL wb_ack              : std_logic := '0';
    SIGNAL wrena               : std_logic := '0';
    SIGNAL pllackb             : std_logic := '0';
    SIGNAL pll_wdata           : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL PLLDATOB            : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL wb_dat              : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL muxdat              : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL pll_addr            : std_logic_vector(4 downto 0) := (others => '0');
    SIGNAL frac_value          : Integer := 0;
    SIGNAL  load_cnt_op          : Integer := 1;
    SIGNAL  load_cnt_os          : Integer := 1;
    SIGNAL  load_cnt_os2          : Integer := 1;
    SIGNAL  load_cnt_os3          : Integer := 1;
    SIGNAL  INTLOCKREG            : std_logic := '0';

BEGIN
   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : BLOCK
   BEGIN
   VitalWireDelay(rst_ipd, rst, tipd_rst);
   VitalWireDelay(resetm_ipd, resetm, tipd_resetm);
   VitalWireDelay(resetc_ipd, resetc, tipd_resetc);
   VitalWireDelay(resetd_ipd, resetd, tipd_resetd);
   VitalWireDelay(clki_ipd, clki, tipd_clki);
   VitalWireDelay(clkfb_ipd, clkfb, tipd_clkfb);
   VitalWireDelay(phasesel_ipd(1), phasesel1, tipd_phasesel1);
   VitalWireDelay(phasesel_ipd(0), phasesel0, tipd_phasesel0);
   VitalWireDelay(phasedir_ipd, phasedir, tipd_phasedir);
   VitalWireDelay(phasestep_ipd, phasestep, tipd_phasestep);
   VitalWireDelay(loadreg_ipd, loadreg, tipd_loadreg);
   VitalWireDelay(stdby_ipd, stdby, tipd_stdby);
   VitalWireDelay(enclkop_ipd, enclkop, tipd_enclkop);
   VitalWireDelay(enclkos_ipd, enclkos, tipd_enclkos);
   VitalWireDelay(enclkos2_ipd, enclkos2, tipd_enclkos2);
   VitalWireDelay(enclkos3_ipd, enclkos3, tipd_enclkos3);
   VitalWireDelay(pllclk_ipd, pllclk, tipd_pllclk);
   VitalWireDelay(pllrst_ipd, pllrst, tipd_pllrst);
   VitalWireDelay(pllstb_ipd, pllstb, tipd_pllstb);
   VitalWireDelay(pllwe_ipd, pllwe, tipd_pllwe);
   VitalWireDelay(pllwakesync_ipd, pllwakesync, tipd_pllwakesync);
   VitalWireDelay(plladdr_ipd(4), plladdr4, tipd_plladdr4);
   VitalWireDelay(plladdr_ipd(3), plladdr3, tipd_plladdr3);
   VitalWireDelay(plladdr_ipd(2), plladdr2, tipd_plladdr2);
   VitalWireDelay(plladdr_ipd(1), plladdr1, tipd_plladdr1);
   VitalWireDelay(plladdr_ipd(0), plladdr0, tipd_plladdr0);
   VitalWireDelay(plldati_ipd(7), plldati7, tipd_plldati7);
   VitalWireDelay(plldati_ipd(6), plldati6, tipd_plldati6);
   VitalWireDelay(plldati_ipd(5), plldati5, tipd_plldati5);
   VitalWireDelay(plldati_ipd(4), plldati4, tipd_plldati4);
   VitalWireDelay(plldati_ipd(3), plldati3, tipd_plldati3);
   VitalWireDelay(plldati_ipd(2), plldati2, tipd_plldati2);
   VitalWireDelay(plldati_ipd(1), plldati1, tipd_plldati1);
   VitalWireDelay(plldati_ipd(0), plldati0, tipd_plldati0);
   END BLOCK;

--------------------------------------------------------------------
-- Generate False Clocks
--------------------------------------------------------------------
                                                                                                
   false_clk <= not false_clk after 5 ns;
--------------------------------------------------------------------
   div0_reg1 <= CLKI_DIV;

   P1 : PROCESS(div0_reg1, wrena, pll_addr, pll_wdata) 
   BEGIN
      IF (NOW = 0 ns) THEN
         mem_initialize (CLKI_DIV => CLKI_DIV, CLKFB_DIV => CLKFB_DIV, 
         CLKOP_DIV => CLKOP_DIV,
         CLKOS_DIV => CLKOS_DIV,
         CLKOS2_DIV => CLKOS2_DIV,
         CLKOS3_DIV => CLKOS3_DIV,
         CLKOP_ENABLE => CLKOP_ENABLE,
         CLKOS_ENABLE => CLKOS_ENABLE,
         CLKOS2_ENABLE => CLKOS2_ENABLE,
         CLKOS3_ENABLE => CLKOS3_ENABLE,
         CLKOP_FPHASE => CLKOP_FPHASE,
         CLKOP_CPHASE => CLKOP_CPHASE,
         CLKOS_FPHASE => CLKOS_FPHASE,
         CLKOS_CPHASE => CLKOS_CPHASE,
         CLKOS2_FPHASE => CLKOS2_FPHASE,
         CLKOS2_CPHASE => CLKOS2_CPHASE,
         CLKOS3_FPHASE => CLKOS3_FPHASE,
         CLKOS3_CPHASE => CLKOS3_CPHASE,
         CLKOP_TRIM_POL => CLKOP_TRIM_POL,
         CLKOS_TRIM_POL => CLKOS_TRIM_POL,
         CLKOP_TRIM_DELAY => CLKOP_TRIM_DELAY,
         CLKOS_TRIM_DELAY => CLKOS_TRIM_DELAY,
         VCO_BYPASS_A0 => VCO_BYPASS_A0,
         VCO_BYPASS_B0 => VCO_BYPASS_B0,
         VCO_BYPASS_C0 => VCO_BYPASS_C0,
         VCO_BYPASS_D0 => VCO_BYPASS_D0,
         PREDIVIDER_MUXA1 => PREDIVIDER_MUXA1,
         PREDIVIDER_MUXB1 => PREDIVIDER_MUXB1,
         PREDIVIDER_MUXC1 => PREDIVIDER_MUXC1,
         PREDIVIDER_MUXD1 => PREDIVIDER_MUXD1,
         OUTDIVIDER_MUXA2 => OUTDIVIDER_MUXA2,
         OUTDIVIDER_MUXB2 => OUTDIVIDER_MUXB2,
         OUTDIVIDER_MUXC2 => OUTDIVIDER_MUXC2,
         OUTDIVIDER_MUXD2 => OUTDIVIDER_MUXD2,
         STDBY_ENABLE => STDBY_ENABLE,
         PLLRST_ENA => PLLRST_ENA,
         MRST_ENA => MRST_ENA,
         DCRST_ENA => DCRST_ENA,
         DDRST_ENA => DDRST_ENA,
         FRACN_ENABLE => FRACN_ENABLE,
         FRACN_DIV => FRACN_DIV,

         MEM => MEM);
      ELSE
         IF (wrena = '1') THEN
            CASE pll_addr is
               WHEN "00000" => MEM(7 downto 0) <= pll_wdata;
               WHEN "00001" => MEM(15 downto 8) <= pll_wdata;
               WHEN "00010" => MEM(23 downto 16) <= pll_wdata;
               WHEN "00011" => MEM(31 downto 24) <= pll_wdata;
               WHEN "00100" => MEM(39 downto 32) <= pll_wdata;
               WHEN "00101" => MEM(47 downto 40) <= pll_wdata;
               WHEN "00110" => MEM(55 downto 48) <= pll_wdata;
               WHEN "00111" => MEM(63 downto 56) <= pll_wdata;
               WHEN "01000" => MEM(71 downto 64) <= pll_wdata;
               WHEN "01001" => MEM(79 downto 72) <= pll_wdata;
               WHEN "01010" => MEM(87 downto 80) <= pll_wdata;
               WHEN "01011" => MEM(95 downto 88) <= pll_wdata;
               WHEN "01100" => MEM(103 downto 96) <= pll_wdata;
               WHEN "01101" => MEM(111 downto 104) <= pll_wdata;
               WHEN "01110" => MEM(119 downto 112) <= pll_wdata;
               WHEN "01111" => MEM(127 downto 120) <= pll_wdata;
               WHEN "10000" => MEM(135 downto 128) <= pll_wdata;
               WHEN "10001" => MEM(143 downto 136) <= pll_wdata;
               WHEN "10010" => MEM(151 downto 144) <= pll_wdata;
               WHEN "10011" => MEM(159 downto 152) <= pll_wdata;
               WHEN "10100" => MEM(167 downto 160) <= pll_wdata;
               WHEN "10101" => MEM(175 downto 168) <= pll_wdata;
               WHEN "10110" => MEM(183 downto 176) <= pll_wdata;
               WHEN "10111" => MEM(191 downto 184) <= pll_wdata;
               WHEN "11000" => MEM(199 downto 192) <= pll_wdata;
               WHEN "11001" => MEM(207 downto 200) <= pll_wdata;
               WHEN "11010" => MEM(215 downto 208) <= pll_wdata;
               WHEN "11011" => MEM(223 downto 216) <= pll_wdata;
               WHEN others => NULL;
            END CASE;
         END IF;

      IF (LOCKREG3 = '1') THEN
         MEM(224) <= '1';
      ELSE
         MEM(224) <= '0';
      END IF;

      END IF;
   END PROCESS;

   P101 : PROCESS (clki_ipd)
   BEGIN
      IF (DPHASE_SOURCE = "DISABLED") THEN
         dphsrc <= '0';
      ELSE
         dphsrc <= '1';
      END IF;
   END PROCESS;

   P2 : PROCESS (MEM, PHA, PHB, PHC, PHD, clki_ipd)
   BEGIN
      IF (MEM(208) = '1') THEN
         A0_OUT <= PHA;
      ELSIF (MEM(208) = '0') THEN
         A0_OUT <= clki_ipd;
      END IF;
 
      IF (MEM(209) = '1') THEN
         B0_OUT <= PHB;
      ELSIF (MEM(209) = '0') THEN
         B0_OUT <= clki_ipd;
      END IF;

      IF (MEM(210) = '1') THEN
         C0_OUT <= PHC;
      ELSIF (MEM(210) = '0') THEN
         C0_OUT <= clki_ipd;
      END IF;

      IF (MEM(211) = '1') THEN
         D0_OUT <= PHD;
      ELSIF (MEM(211) = '0') THEN
         D0_OUT <= clki_ipd;
      END IF;
   END PROCESS;    -- END MUXA0

   P3 : PROCESS (MEM, A0_OUT, DIVD_OUT_DEL, DIVB_OUT_DEL, DIVC_OUT_DEL)
   BEGIN
      CASE (MEM(119 downto 118)) IS
         WHEN "00" => A1_OUT <= A0_OUT; 
         WHEN "01" => A1_OUT <= DIVD_OUT_DEL; 
         WHEN "10" => A1_OUT <= DIVB_OUT_DEL; 
         WHEN "11" => A1_OUT <= DIVC_OUT_DEL; 
         WHEN others => NULL;
      END CASE;
  END PROCESS;

   P4 : PROCESS (MEM, B0_OUT, DIVA_OUT_DEL, DIVD_OUT_DEL, DIVC_OUT_DEL)
   BEGIN
      CASE (MEM(117 downto 116)) IS
         WHEN "00" => B1_OUT <= B0_OUT;
         WHEN "01" => B1_OUT <= DIVA_OUT_DEL;
         WHEN "10" => B1_OUT <= DIVD_OUT_DEL;
         WHEN "11" => B1_OUT <= DIVC_OUT_DEL;
         WHEN others => NULL;
      END CASE;
  END PROCESS;

   P5 : PROCESS (MEM, C0_OUT, DIVA_OUT_DEL, DIVB_OUT_DEL, DIVD_OUT_DEL)
   BEGIN
      CASE (MEM(115 downto 114)) IS
         WHEN "00" => C1_OUT <= C0_OUT;
         WHEN "01" => C1_OUT <= DIVA_OUT_DEL;
         WHEN "10" => C1_OUT <= DIVB_OUT_DEL;
         WHEN "11" => C1_OUT <= DIVD_OUT_DEL;
         WHEN others => NULL;
      END CASE;
  END PROCESS;

   P6 : PROCESS (MEM, D0_OUT, DIVA_OUT_DEL, DIVB_OUT_DEL, DIVC_OUT_DEL)
   BEGIN
      CASE (MEM(113 downto 112)) IS
         WHEN "00" => D1_OUT <= D0_OUT;
         WHEN "01" => D1_OUT <= DIVA_OUT_DEL;
         WHEN "10" => D1_OUT <= DIVB_OUT_DEL;
         WHEN "11" => D1_OUT <= DIVC_OUT_DEL;
         WHEN others => NULL;
      END CASE;
   END PROCESS;    -- END MUXA1

   P7 : PROCESS (MEM, clki_ipd, DIVA_OUT_DEL, DIVB_OUT_DEL, DIVC_OUT_DEL, DIVD_OUT_DEL)
   BEGIN
      CASE (MEM(98 downto 96)) IS
         WHEN "000" => A2_OUT <= DIVA_OUT_DEL;
         WHEN "001" => A2_OUT <= DIVB_OUT_DEL;
         WHEN "010" => A2_OUT <= DIVC_OUT_DEL;
         WHEN "011" => A2_OUT <= DIVD_OUT_DEL;
         WHEN "100" => A2_OUT <= clki_ipd;
         WHEN others => NULL;
      END CASE;

      CASE (MEM(102 downto 100)) IS
         WHEN "000" => B2_OUT <= DIVB_OUT_DEL;
         WHEN "001" => B2_OUT <= DIVC_OUT_DEL;
         WHEN "010" => B2_OUT <= DIVD_OUT_DEL;
         WHEN "011" => B2_OUT <= DIVA_OUT_DEL;
         WHEN "100" => B2_OUT <= clki_ipd;
         WHEN others => NULL;
      END CASE;

      CASE (MEM(109 downto 107)) IS
         WHEN "000" => C2_OUT <= DIVC_OUT_DEL;
         WHEN "001" => C2_OUT <= DIVD_OUT_DEL;
         WHEN "010" => C2_OUT <= DIVA_OUT_DEL;
         WHEN "011" => C2_OUT <= DIVB_OUT_DEL;
         WHEN "100" => C2_OUT <= clki_ipd;
         WHEN others => NULL;
      END CASE;

      CASE (MEM(106 downto 104)) IS
         WHEN "000" => D2_OUT <= DIVD_OUT_DEL;
         WHEN "001" => D2_OUT <= DIVA_OUT_DEL;
         WHEN "010" => D2_OUT <= DIVB_OUT_DEL;
         WHEN "011" => D2_OUT <= DIVC_OUT_DEL;
         WHEN "100" => D2_OUT <= clki_ipd;
         WHEN others => NULL;
      END CASE;
   END PROCESS;   -- END MUXA2 

   P8 : PROCESS (MEM, enclkop_ipd, enclkos_ipd, enclkos2_ipd, enclkos3_ipd, A2_OUT, B2_OUT, C2_OUT, D2_OUT)
   BEGIN
      IF (MEM(128) = '0' and enclkop_ipd = '0') THEN
         CLKOP_OUT <= '0';
      ELSE 
         CLKOP_OUT <= A2_OUT;
      END IF;

      IF (MEM(129) = '0' and enclkos_ipd = '0') THEN
         CLKOS_OUT <= '0';
      ELSE
         CLKOS_OUT <= B2_OUT;
      END IF;

      IF (MEM(130) = '0' and enclkos2_ipd = '0') THEN
         CLKOS2_OUT <= '0';
      ELSE
         CLKOS2_OUT <= C2_OUT;
      END IF;

      IF (MEM(131) = '0' and enclkos3_ipd = '0') THEN
         CLKOS3_OUT <= '0';
      ELSE
         CLKOS3_OUT <= D2_OUT;
      END IF;
   END PROCESS;  -- END CLOCK ENABLE

   P9 : PROCESS (A1_OUT, RSTB_NEW)
   VARIABLE index_diva : Integer := 0;
   BEGIN
	  IF (RSTB_NEW = '1') THEN
		  index_diva := 0;
		  first_time_a <= '1';
      ELSIF (first_time_a = '1') THEN
         IF (A1_OUT = '1') THEN
            index_diva := 0;
            first_time_a <= '0';
            DIVA_OUT <= '1';
         END IF;
      ELSE
         index_diva := index_diva + 1;     
         IF (index_diva = conv_integer(MEM(54 downto 48)) + 1) THEN
            DIVA_OUT <= not DIVA_OUT;
            index_diva := 0;
         END IF; 
      END IF; 
   END PROCESS;  
                                                                              
   P10 : PROCESS (B1_OUT, RSTB_NEW)    
   VARIABLE index_divb : Integer := 0;
   BEGIN
	  IF (RSTB_NEW = '1') THEN
		  index_divb := 0;
		  first_time_b <= '1';
      ELSIF (first_time_b = '1') THEN 
         IF (B1_OUT = '1') THEN 
            index_divb := 0;
            first_time_b <= '0'; 
            DIVB_OUT <= '1'; 
         END IF; 
      ELSE
         index_divb := index_divb + 1; 
         IF (index_divb = conv_integer(MEM(62 downto 56)) + 1) THEN  
            DIVB_OUT <= not DIVB_OUT; 
            index_divb := 0; 
         END IF;  
     END IF;
   END PROCESS;  

   P11 : PROCESS (C1_OUT, RSTB_NEW)
   VARIABLE index_divc : Integer := 0;
   BEGIN
	  IF (RSTB_NEW = '1') THEN
		  index_divc := 0;
		  first_time_c <= '1';
      ELSIF (first_time_c = '1') THEN
         IF (C1_OUT = '1') THEN
            index_divc := 0;
            first_time_c <= '0';
            DIVC_OUT <= '1';
         END IF;
      ELSE
         index_divc := index_divc + 1;
         IF (index_divc = conv_integer(MEM(70 downto 64)) + 1) THEN
            DIVC_OUT <= not DIVC_OUT;
            index_divc := 0;
         END IF;
     END IF;
   END PROCESS;  

   P12 : PROCESS (D1_OUT, RSTB_NEW)
   VARIABLE index_divd : Integer := 0;
   BEGIN						  
	  IF (RSTB_NEW = '1') THEN
		  index_divd := 0;
		  first_time_d <= '1';
      ELSIF (first_time_d = '1') THEN
         IF (D1_OUT = '1') THEN
            index_divd := 0;
            first_time_d <= '0';
            DIVD_OUT <= '1';
         END IF;
      ELSE
         index_divd := index_divd + 1;
         IF (index_divd = conv_integer(MEM(78 downto 72)) + 1) THEN
            DIVD_OUT <= not DIVD_OUT;
            index_divd := 0;
         END IF;
     END IF;
   END PROCESS;  

   CLKFB_DIV_REG <= conv_integer(MEM(174 downto 168)) + 1;
   CLKI_DIV_REG <= conv_integer(MEM(166 downto 160)) + 1;
   CLKOP_DIV_REG <= conv_integer(MEM(54 downto 48)) + 1;
   CLKOS_DIV_REG <= conv_integer(MEM(62 downto 56)) + 1;
   CLKOS2_DIV_REG <= conv_integer(MEM(70 downto 64)) + 1;
   CLKOS3_DIV_REG <= conv_integer(MEM(78 downto 72)) + 1;

   P13 : PROCESS (CLKFB_DIV_REG, CLKOP_DIV_REG, CLKOS_DIV_REG, CLKOS2_DIV_REG, CLKOS3_DIV_REG)
   BEGIN
      IF ((FEEDBK_PATH = "CLKOP") or (FEEDBK_PATH = "INT_DIVA") or (FEEDBK_PATH = "USERCLOCK")) THEN
         net_divide1 <= CLKOP_DIV_REG;
      ELSIF ((FEEDBK_PATH = "CLKOS") or (FEEDBK_PATH = "INT_DIVB")) THEN
         net_divide1 <= CLKOS_DIV_REG;
      ELSIF ((FEEDBK_PATH = "CLKOS2") or (FEEDBK_PATH = "INT_DIVC")) THEN
         net_divide1 <= CLKOS2_DIV_REG;
      ELSIF ((FEEDBK_PATH = "CLKOS3") or (FEEDBK_PATH = "INT_DIVD")) THEN
         net_divide1 <= CLKOS3_DIV_REG;
      END IF;
   END PROCESS;

   P_FRAC : PROCESS (MEM, net_divide1)
   BEGIN
      IF (MEM(47) = '1') THEN
         net_divide <= real(net_divide1) * (real(CLKFB_DIV_REG) + (real(conv_integer(MEM(15 downto 0))) / 65536.0));
      ELSE
         net_divide <= real(CLKFB_DIV_REG * net_divide1);
      END IF;
   END PROCESS;

------------------------------------------------
-- measure the feedback delay value
------------------------------------------------
   P100 : PROCESS (clkfb_ipd)
   VARIABLE fb_count : Integer := 0;
   BEGIN
      IF (clkfb_ipd'event and clkfb_ipd = '1') THEN
         fb_count := fb_count + 1;
         IF (fb_count = 6) THEN
            clkop_first_time <= '0';
            fb_count := 0;
         END IF;
      END IF;
   END PROCESS;

   GENERATE_FIRST_FB_EDGE : PROCESS (false_clk, clkfb_ipd)
   VARIABLE false_clk_first_time : boolean := true;
   VARIABLE fb_first_time : boolean := true;
   VARIABLE first_int_edge : time := 0 ps;
   VARIABLE first_fb_edge : time := 0 ps;
   BEGIN
      if (false_clk'event and false_clk'last_value = '0' and false_clk = '1') then
         if (false_clk_first_time) then
            first_int_edge := NOW;
            false_clk_first_time := false;
         end if;
      end if;
      if (clkfb_ipd'event and clkfb_ipd'last_value = '0' and clkfb_ipd = '1') then
         if (fb_first_time) then
            first_fb_edge := NOW;
            fb_first_time := false;
         end if;
      end if;
         total_fb_delay <= first_fb_edge - first_int_edge ;
   END PROCESS;

   FB_PERIOD : PROCESS (clkfb_ipd)
   VARIABLE last_clock_edge : time := 0 ps;
   VARIABLE next_clock_edge : time := 0 ps;
   VARIABLE first_time      : Boolean := true;
   BEGIN
      IF (clkfb_ipd'event and clkfb_ipd = '1') THEN
           last_clock_edge := next_clock_edge;
           next_clock_edge := NOW;
           IF (last_clock_edge > 0 ps) THEN
             IF (first_time) THEN
                t_fb_clk <= next_clock_edge - last_clock_edge;
                first_time := false;
             END IF;
           END IF;
      END IF;
   END PROCESS;

   CLKIN_PERIOD : PROCESS (clki_ipd)
   VARIABLE last_clock_edge, next_clock_edge : time := 0 ps;
   BEGIN
      IF (clki_ipd'event and clki_ipd = '1') THEN
           last_clock_edge := next_clock_edge;
           next_clock_edge := NOW;
           IF (last_clock_edge > 0 ps) THEN
                t_in_clk <= next_clock_edge - last_clock_edge;
                t_in_clk1 <= t_in_clk;
                t_in_clk2 <= t_in_clk1;
                t_in_clk3 <= t_in_clk2;
           END IF;
           IF (t_in_clk > 0 ps) THEN
             IF ((t_in_clk = t_in_clk1) and (t_in_clk = t_in_clk2) and (t_in_clk = t_in_clk3)) THEN
                  clock_valid <= '1';
             ELSE
                  clock_valid <= '0';
             END IF;
           END IF;
           IF (t_in_clk > 0 ps) THEN
             IF (t_in_clk = t_in_clk1) THEN
                  clock_invalid <= '0';
             ELSE
                  clock_invalid <= '1';
             END IF;
           END IF;
      END IF;
   END PROCESS;

   DELAY1 : PROCESS (total_fb_delay, t_in_clk, ratio1, virtual_delay1, clki_ipd)
   BEGIN
      IF ((total_fb_delay > 0 ps) and (t_in_clk > 0 ps)) THEN
          ratio1 <= total_fb_delay / t_in_clk;
          virtual_delay1 <= total_fb_delay - (t_in_clk * ratio1);
          real_delay1 <= t_in_clk - virtual_delay1 ;
      END IF;
   END PROCESS;

   P14 : PROCESS (t_in_clk, net_divide)
   BEGIN
      IF (net_divide > 0.0 and t_in_clk > 0 ps) THEN
         t_vco <= ((t_in_clk * CLKI_DIV_REG) / net_divide);  -- vco oscillating cycle
      END IF;
   END PROCESS;

   ha_vco1 <= (t_vco / 2.0);  -- vco oscillating half-cycle
   ha_clk_a <= (ha_vco1 * (conv_integer(MEM(54 downto 48)) + 1));
   ha_clk_b <= (ha_vco1 * (conv_integer(MEM(62 downto 56)) + 1));
   t_diva_clk <= 2 * ha_clk_a;
   t_divb_clk <= 2 * ha_clk_b;
   t_divc_clk <= (t_vco * (conv_integer(MEM(70 downto 64)) + 1));
   t_divd_clk <= (t_vco * (conv_integer(MEM(78 downto 72)) + 1));

   P106 : PROCESS (ha_vco1)
   BEGIN
      IF (ha_vco1 > 0 ps) THEN
         round_err <= (real(time'pos(t_in_clk)) - ((real(time'pos(ha_vco1)) * 2.0 * real(net_divide)) / real(CLKI_DIV_REG))) / 2.0;
      END IF;
   END PROCESS;

-- PHASE SHIFT
   P241 : PROCESS (loadreg_ipd, phasedir_ipd, phasestep_ipd, phasesel_ipd)
   BEGIN
      IF (DPHASE_SOURCE = "ENABLED") THEN
         load_reg_en <= loadreg_ipd;
         phase_dir <= phasedir_ipd;
         phase_step <= phasestep_ipd;
         phase_sel <= phasesel_ipd;
      ELSE
         load_reg_en <= MEM(23);
         phase_dir <= MEM(137);
         phase_step <= MEM(136);
         phase_sel <= MEM(139 downto 138);
      END IF;
   END PROCESS;

   P242 : PROCESS (RSTB_NEW, phase_step, phase_dir)
   BEGIN
      IF (RSTB_NEW = '1') THEN
         step_p <= 0;
         step_s <= 0;
         step_s2 <= 0;
         step_s3 <= 0;
      ELSIF (phase_sel = "11") THEN
         IF (phase_step'event and phase_step'last_value = '1' and phase_step = '0') THEN --neg
            IF (phase_dir = '0') THEN
               step_p <= step_p + 1;
            ELSE
               step_p <= step_p - 1;
            END IF;
         END IF;
      ELSIF (phase_sel = "00") THEN
         IF (phase_step'event and phase_step'last_value = '1' and phase_step = '0') THEN --neg
            IF (phase_dir = '0') THEN
               step_s <= step_s + 1;
            ELSE
               step_s <= step_s - 1;
            END IF;
         END IF;
      ELSIF (phase_sel = "01") THEN
         IF (phase_step'event and phase_step'last_value = '1' and phase_step = '0') THEN --neg
            IF (phase_dir = '0') THEN
               step_s2 <= step_s2 + 1;
            ELSE
               step_s2 <= step_s2 - 1;
            END IF;
         END IF;
      ELSIF (phase_sel = "10") THEN
         IF (phase_step'event and phase_step'last_value = '1' and phase_step = '0') THEN --neg
            IF (phase_dir = '0') THEN
               step_s3 <= step_s3 + 1;
            ELSE
               step_s3 <= step_s3 - 1;
            END IF;
         END IF;
      END IF;
   END PROCESS;

   P243 : PROCESS (DIVA_OUT)
   BEGIN
      IF (DIVA_OUT'event and DIVA_OUT'last_value = '0' and DIVA_OUT = '1') THEN  --pos
         step_op <= step_p;
         step_op1 <= step_op;
         load_reg_en_op2 <= load_reg_en;
         load_reg_en_op1 <= load_reg_en_op2;
      END IF;
   END PROCESS;

   P_CNT : PROCESS (load_reg_en_op2)
   BEGIN
      IF (phase_sel = "11") THEN
         IF (load_reg_en_op2'event and load_reg_en_op2'last_value = '0' and load_reg_en_op2 = '1') THEN  --pos
            load_cnt_op <= load_cnt_op + 1;
         END IF;
      END IF;
   END PROCESS;

   S_CNT : PROCESS (load_reg_en_os_2)
   BEGIN
      IF (phase_sel = "00") THEN
         IF (load_reg_en_os_2'event and load_reg_en_os_2'last_value = '0' and load_reg_en_os_2 = '1') THEN  --pos
            load_cnt_os <= load_cnt_os + 1;
         END IF;
      END IF;
   END PROCESS;

   S2_CNT : PROCESS (load_reg_en_os2_2)
   BEGIN
      IF (phase_sel = "01") THEN 
         IF (load_reg_en_os2_2'event and load_reg_en_os2_2'last_value = '0' and load_reg_en_os2_2 = '1') THEN  --pos
            load_cnt_os2 <= load_cnt_os2 + 1;
         END IF;
      END IF;
   END PROCESS;

   S3_CNT : PROCESS (load_reg_en_os3_2)
   BEGIN
      IF (phase_sel = "10") THEN 
         IF (load_reg_en_os3_2'event and load_reg_en_os3_2'last_value = '0' and load_reg_en_os3_2 = '1') THEN  --pos
            load_cnt_os3 <= load_cnt_os3 + 1;
         END IF;
      END IF;
   END PROCESS;

   P244 : PROCESS (DIVA_OUT_DEL1)
   BEGIN
      IF (DIVA_OUT_DEL1'event and DIVA_OUT_DEL1'last_value = '1' and DIVA_OUT_DEL1 = '0') THEN  --neg
         step_op2 <= step_op1;
         load_reg_en_op <= load_reg_en_op1;
      END IF;
   END PROCESS;

   P245 : PROCESS (DIVB_OUT)
   BEGIN
      IF (DIVB_OUT'event and DIVB_OUT'last_value = '0' and DIVB_OUT = '1') THEN  --pos
         step_os <= step_s;
         step_os_1 <= step_os;
         load_reg_en_os_2 <= load_reg_en;
         load_reg_en_os_1 <= load_reg_en_os_2;
      END IF;
   END PROCESS;
                                                                                              
   P246 : PROCESS (DIVB_OUT_DEL1)
   BEGIN
      IF (DIVB_OUT_DEL1'event and DIVB_OUT_DEL1'last_value = '1' and DIVB_OUT_DEL1 = '0') THEN  --neg
         step_os_2 <= step_os_1;
         load_reg_en_os <= load_reg_en_os_1;
      END IF;
   END PROCESS;

   P247 : PROCESS (DIVC_OUT)
   BEGIN
      IF (DIVC_OUT'event and DIVC_OUT'last_value = '0' and DIVC_OUT = '1') THEN  --pos
         step_os2 <= step_s2;
         step_os2_1 <= step_os2;
         load_reg_en_os2_2 <= load_reg_en;
         load_reg_en_os2_1 <= load_reg_en_os2_2;
      END IF;
   END PROCESS;
                                                                                              
   P248 : PROCESS (DIVC_OUT_DEL)
   BEGIN
      IF (DIVC_OUT_DEL'event and DIVC_OUT_DEL'last_value = '1' and DIVC_OUT_DEL = '0') THEN  --neg
         step_os2_2 <= step_os2_1;
         load_reg_en_os2 <= load_reg_en_os2_1;
      END IF;
   END PROCESS;

   P249 : PROCESS (DIVD_OUT)
   BEGIN
      IF (DIVD_OUT'event and DIVD_OUT'last_value = '0' and DIVD_OUT = '1') THEN  --pos
         step_os3 <= step_s3;
         step_os3_1 <= step_os3;
         load_reg_en_os3_2 <= load_reg_en;
         load_reg_en_os3_1 <= load_reg_en_os3_2;
      END IF;
   END PROCESS;
                                                                                              
   P250 : PROCESS (DIVD_OUT_DEL)
   BEGIN
      IF (DIVD_OUT_DEL'event and DIVD_OUT_DEL'last_value = '1' and DIVD_OUT_DEL = '0') THEN  --neg
         step_os3_2 <= step_os3_1;
         load_reg_en_os3 <= load_reg_en_os3_1;
      END IF;
   END PROCESS;

   P19 : PROCESS (t_diva_clk, t_divb_clk, t_divc_clk, t_divd_clk, CLKOP_FPHASE_DYN, 
   CLKOP_DIV_REG, CLKOS_FPHASE_DYN, CLKOS_DIV_REG, CLKOS2_FPHASE_DYN, CLKOS2_DIV_REG,
   CLKOS3_FPHASE_DYN, CLKOS3_DIV_REG, step_op2, step_os_2, step_os2_2, step_os3_2)
   BEGIN
--      IF (phase_sel = "11") THEN
         IF (t_diva_clk > 0 ps) THEN
            IF (step_op2 >= 0) THEN
               vco_ph_del_a <= ((CLKOP_FPHASE_DYN + step_op2) * t_diva_clk) / (8 * CLKOP_DIV_REG);
            ELSIF (step_op2 < 0) THEN
               vco_ph_del_a <= t_diva_clk - (((CLKOP_FPHASE_DYN - step_op2) * t_diva_clk) / (8 * CLKOP_DIV_REG));
            END IF;
         END IF;
--      ELSIF (phase_sel = "00") THEN
         IF (t_divb_clk > 0 ps) THEN
            IF (step_os_2 >= 0) THEN
               vco_ph_del_b <= ((CLKOS_FPHASE_DYN + step_os_2) * t_divb_clk) / (8 * CLKOS_DIV_REG);
            ELSIF (step_os_2 < 0) THEN
               vco_ph_del_b <= t_divb_clk - (((CLKOS_FPHASE_DYN - step_os_2) * t_divb_clk) / (8 * CLKOS_DIV_REG));
            END IF;
         END IF;
--      ELSIF (phase_sel = "01") THEN
         IF (t_divc_clk > 0 ps) THEN
            IF (step_os2_2 >= 0) THEN
               vco_ph_del_c <= ((CLKOS2_FPHASE_DYN + step_os2_2) * t_divc_clk) / (8 * CLKOS2_DIV_REG);
            ELSIF (step_os2_2 < 0) THEN
               vco_ph_del_c <= t_divc_clk - (((CLKOS2_FPHASE_DYN - step_os2_2) * t_divc_clk) / (8 * CLKOS2_DIV_REG));
            END IF;
         END IF;
--      ELSIF (phase_sel = "10") THEN
         IF (t_divd_clk > 0 ps) THEN
            IF (step_os3_2 >= 0) THEN
               vco_ph_del_d <= ((CLKOS3_FPHASE_DYN + step_os3_2) * t_divd_clk) / (8 * CLKOS3_DIV_REG);
            ELSIF (step_os3_2 < 0) THEN
               vco_ph_del_d <= t_divd_clk - (((CLKOS3_FPHASE_DYN - step_os3_2) * t_divd_clk) / (8 * CLKOS3_DIV_REG));
            END IF;
         END IF;
--      END IF;
   END PROCESS;

   P22 : PROCESS (t_diva_clk, CLKOP_CPHASE_DYN, CLKOP_DIV_REG, load_reg_en_op)
   BEGIN
      IF ((load_reg_en_op'event and load_reg_en_op'last_value = '1' and load_reg_en_op = '0') or (load_cnt_op = 1)) THEN
         IF (t_diva_clk > 0 ps) THEN
            IF ((CLKOP_DIV_REG - 1) > CLKOP_CPHASE_DYN) THEN
               diva_ph_del <= t_diva_clk - ((((CLKOP_DIV_REG -1) - CLKOP_CPHASE_DYN) * t_diva_clk) / CLKOP_DIV_REG);
            ELSIF (CLKOP_CPHASE_DYN > (CLKOP_DIV_REG - 1)) THEN
               diva_ph_del <= (((CLKOP_CPHASE_DYN - (CLKOP_DIV_REG -1)) * t_diva_clk) / CLKOP_DIV_REG);
            ELSE
               diva_ph_del <= 0 ps;
            END IF;
         END IF;
      END IF;
   END PROCESS;

   P23 : PROCESS (t_divb_clk, CLKOS_CPHASE_DYN, CLKOS_DIV_REG, load_reg_en_os)
   BEGIN
      IF ((load_reg_en_os'event and load_reg_en_os'last_value = '1' and load_reg_en_os = '0') or (load_cnt_os = 1)) THEN
         IF (t_divb_clk > 0 ps) THEN
            IF ((CLKOS_DIV_REG - 1) > CLKOS_CPHASE_DYN) THEN
               divb_ph_del <= t_divb_clk - ((((CLKOS_DIV_REG -1) - CLKOS_CPHASE_DYN) * t_divb_clk) / CLKOS_DIV_REG);
            ELSIF (CLKOS_CPHASE_DYN > (CLKOS_DIV_REG - 1)) THEN
               divb_ph_del <= (((CLKOS_CPHASE_DYN - (CLKOS_DIV_REG -1)) * t_divb_clk) / CLKOS_DIV_REG);
            ELSE
               divb_ph_del <= 0 ps;
            END IF;
         END IF;
      END IF;
   END PROCESS;

   P24 : PROCESS (t_divc_clk, CLKOS2_CPHASE_DYN, CLKOS2_DIV_REG, load_reg_en_os2)
   BEGIN
      IF ((load_reg_en_os2'event and load_reg_en_os2'last_value = '1' and load_reg_en_os2 = '0') or (load_cnt_os2 = 1)) THEN
         IF (t_divc_clk > 0 ps) THEN
            IF ((CLKOS2_DIV_REG - 1) > CLKOS2_CPHASE_DYN) THEN
               divc_ph_del <= t_divc_clk - ((((CLKOS2_DIV_REG -1) - CLKOS2_CPHASE_DYN) * t_divc_clk) / CLKOS2_DIV_REG);
            ELSIF (CLKOS2_CPHASE_DYN > (CLKOS2_DIV_REG - 1)) THEN
               divc_ph_del <= (((CLKOS2_CPHASE_DYN - (CLKOS2_DIV_REG -1)) * t_divc_clk) / CLKOS2_DIV_REG);
            ELSE
               divc_ph_del <= 0 ps;
            END IF;
         END IF;
      END IF;
   END PROCESS;

   P25 : PROCESS (t_divd_clk, CLKOS3_CPHASE_DYN, CLKOS3_DIV_REG, load_reg_en_os3)
   BEGIN
      IF ((load_reg_en_os3'event and load_reg_en_os3'last_value = '1' and load_reg_en_os3 = '0') or (load_cnt_os3 = 1)) THEN
         IF (t_divd_clk > 0 ps) THEN
            IF ((CLKOS3_DIV_REG - 1) > CLKOS3_CPHASE_DYN) THEN
               divd_ph_del <= t_divd_clk - ((((CLKOS3_DIV_REG -1) - CLKOS3_CPHASE_DYN) * t_divd_clk) / CLKOS3_DIV_REG);
            ELSIF (CLKOS3_CPHASE_DYN > (CLKOS3_DIV_REG - 1)) THEN
               divd_ph_del <= (((CLKOS3_CPHASE_DYN - (CLKOS3_DIV_REG -1)) * t_divd_clk) / CLKOS3_DIV_REG);
            ELSE
               divd_ph_del <= 0 ps;
            END IF;
         END IF;
      END IF;
   END PROCESS;

--   RSTB_NEW <= rst_ipd or resetm_ipd or resetc_ipd or resetd_ipd;
   RSTB_NEW <= (rst_ipd and MEM(63)) or (resetm_ipd and MEM(71));

--// LOCK GEN

   P26 : PROCESS (RSTB_NEW, clki_ipd)
   BEGIN
      IF (RSTB_NEW'event and RSTB_NEW = '1') THEN
         d_lock <= '0';
      ELSIF (clki_ipd'event and clki_ipd = '1') THEN
         IF (d_lock = '0') THEN
            d_lock <= '1';
         END IF;
      END IF;
   END PROCESS;

   P27 : PROCESS (clki_ipd)
   BEGIN
      IF (clki_ipd'event and clki_ipd = '1') THEN
         d1_lock <= d_lock;
         d3_lock <= d1_lock;
      END IF;
   END PROCESS;

   d2_lock <= d_lock and d1_lock;
   d4_lock <= d_lock and d1_lock and d3_lock;

   P28 : PROCESS (intfb_out)
   BEGIN
      IF (out_clk_valid  = '0') THEN
         vir_lock <= '0';
      ELSE
         vir_lock <= '1';
      END IF;
   END PROCESS;

-------------------------------------------------------
-- Generate LOCK signal
-------------------------------------------------------
   LOCK_IT : PROCESS (RSTB_NEW, vir_lock, out_clk_valid, clock_invalid)
   BEGIN
      IF (RSTB_NEW = '1') THEN
         lock_all <= '0';
      ELSE
        IF clock_invalid = '1' THEN
           lock_all <= '0';
        ELSIF out_clk_valid = '1' THEN
           lock_all <= transport vir_lock after (PLL_LOCK_DELAY * lock_delay_reg);
        END IF;
      END IF;
   END PROCESS;

   P29 : PROCESS (clki_ipd, RSTB_NEW, d_lock)
   BEGIN
      IF ((RSTB_NEW = '1') or (d_lock = '0')) THEN
         out_clk_valid <= '0';
      ELSIF (clki_ipd'event and clki_ipd = '1') THEN
         out_clk_valid <= clock_valid;
      END IF;
   END PROCESS;

   P30 : PROCESS (out_clk_valid, intfb_out)
      VARIABLE index : real := 0.0;
   BEGIN
      IF (out_clk_valid  = '0') THEN
         intfb_out <= '0';
         first_time7 <= '1';
         index := 0.0;
      ELSE
         IF (first_time7 = '1') THEN
            intfb_out <= '1';
            first_time7 <= '0';
            index := 0.0;
         ELSE
            index := index + 1.0;
            IF (index >= net_divide) THEN
               intfb_out <= not intfb_out after (ha_vco1 + time'val(integer(round_err)));
               index := 0.0;
            ELSE
               intfb_out <= not intfb_out after ha_vco1;
            END IF;
         END IF;
      END IF;
   END PROCESS;

   P33 : PROCESS (intfb_out)
   BEGIN
      IF (FEEDBK_PATH = "INT_DIVA" or FEEDBK_PATH = "INT_DIVB" or FEEDBK_PATH = "INT_DIVC" or FEEDBK_PATH = "INT_DIVD") THEN
         vco_clk <= intfb_out;
      ELSE
         vco_clk <= transport intfb_out after real_delay1;
      END IF;
   END PROCESS;
 
   vco_clk_a <= vco_clk;
   vco_clk_b <= vco_clk;

   PHA <= vco_clk_a ;
   PHB <= vco_clk_b ;
   PHC <= vco_clk ;
   PHD <= vco_clk ;

   DIVA_OUT_DEL2 <= transport DIVA_OUT after (vco_ph_del_a);

   P_L10 : PROCESS (load_reg_en_op)
   BEGIN
      IF (load_reg_en_op'event and load_reg_en_op'last_value = '1' and load_reg_en_op = '0') THEN
         op_ph_del <= load_cnt_op * diva_ph_del;
      END IF;
   END PROCESS;

   P_L1 : PROCESS (DIVA_OUT_DEL2)
   BEGIN
      IF (load_cnt_op = 1) THEN
         DIVA_OUT_DEL1 <= transport DIVA_OUT_DEL2 after (diva_ph_del);
      ELSE 
         DIVA_OUT_DEL1 <= transport DIVA_OUT_DEL2 after (op_ph_del);
      END IF;
   END PROCESS;

   DIVB_OUT_DEL2 <= transport DIVB_OUT after (vco_ph_del_b);

   P_L11 : PROCESS (load_reg_en_os)
   BEGIN
      IF (load_reg_en_os'event and load_reg_en_os'last_value = '1' and load_reg_en_os = '0') THEN
         os_ph_del <= load_cnt_os * divb_ph_del;
      END IF;
   END PROCESS;

   P_L2 : PROCESS (DIVB_OUT_DEL2)
   BEGIN
      IF (load_cnt_os = 1) THEN
         DIVB_OUT_DEL1 <= transport DIVB_OUT_DEL2 after (divb_ph_del);
      ELSE
         DIVB_OUT_DEL1 <= transport DIVB_OUT_DEL2 after (os_ph_del);
      END IF;
   END PROCESS;

   DIVC_OUT_DEL2 <= transport DIVC_OUT after (vco_ph_del_c);

   P_L12 : PROCESS (load_reg_en_os2)
   BEGIN
      IF (load_reg_en_os2'event and load_reg_en_os2'last_value = '1' and load_reg_en_os2 = '0') THEN
         os2_ph_del <= load_cnt_os2 * divc_ph_del;
      END IF;
   END PROCESS;

   P_L3 : PROCESS (DIVC_OUT_DEL2)
   BEGIN
      IF (load_cnt_os2 = 1) THEN
         DIVC_OUT_DEL <= transport DIVC_OUT_DEL2 after (divc_ph_del);
      ELSE
         DIVC_OUT_DEL <= transport DIVC_OUT_DEL2 after (os2_ph_del);
      END IF;
   END PROCESS;

   DIVD_OUT_DEL2 <= transport DIVD_OUT after (vco_ph_del_d);

   P_L13 : PROCESS (load_reg_en_os3)
   BEGIN
      IF (load_reg_en_os3'event and load_reg_en_os3'last_value = '1' and load_reg_en_os3 = '0') THEN
         os3_ph_del <= load_cnt_os3 * divd_ph_del;
      END IF;
   END PROCESS;

   P_L4 : PROCESS (DIVD_OUT_DEL2)
   BEGIN
      IF (load_cnt_os3 = 1) THEN
         DIVD_OUT_DEL <= transport DIVD_OUT_DEL2 after (divd_ph_del);
      ELSE
         DIVD_OUT_DEL <= transport DIVD_OUT_DEL2 after (os3_ph_del);      END IF;
   END PROCESS;

   P_TRIM_OP : PROCESS (DIVA_OUT_DEL1)
   BEGIN
      IF (MEM(127) = '1') THEN
         IF (DIVA_OUT_DEL1'event and DIVA_OUT_DEL1'last_value = '0' and DIVA_OUT_DEL1 = '1') THEN
            DIVA_OUT_DEL <= transport DIVA_OUT_DEL1 after (0.07 ns *(conv_integer(MEM(126 downto 124))));
         ELSIF (DIVA_OUT_DEL1'event and DIVA_OUT_DEL1'last_value = '1' and DIVA_OUT_DEL1 = '0') THEN
            DIVA_OUT_DEL <= DIVA_OUT_DEL1;
         END IF;
      ELSIF (MEM(127) = '0') THEN
         IF (DIVA_OUT_DEL1'event and DIVA_OUT_DEL1'last_value = '1' and DIVA_OUT_DEL1 = '0') THEN
            DIVA_OUT_DEL <= transport DIVA_OUT_DEL1 after (0.07 ns *(conv_integer(MEM(126 downto 124))));
         ELSIF (DIVA_OUT_DEL1'event and DIVA_OUT_DEL1'last_value = '0' and DIVA_OUT_DEL1 = '1') THEN
            DIVA_OUT_DEL <= DIVA_OUT_DEL1;
         END IF;
      END IF;
   END PROCESS;

   P_TRIM_OS : PROCESS (DIVB_OUT_DEL1)
   BEGIN
      IF (MEM(123) = '1') THEN
         IF (DIVB_OUT_DEL1'event and DIVB_OUT_DEL1'last_value = '0' and DIVB_OUT_DEL1 = '1') THEN
            DIVB_OUT_DEL <= transport DIVB_OUT_DEL1 after (0.07 ns *(conv_integer(MEM(122 downto 120))));
         ELSIF (DIVB_OUT_DEL1'event and DIVB_OUT_DEL1'last_value = '1' and DIVB_OUT_DEL1 = '0') THEN
            DIVB_OUT_DEL <= DIVB_OUT_DEL1;
         END IF;
      ELSIF (MEM(123) = '0') THEN          
         IF (DIVB_OUT_DEL1'event and DIVB_OUT_DEL1'last_value = '1' and DIVB_OUT_DEL1 = '0') THEN
            DIVB_OUT_DEL <= transport DIVB_OUT_DEL1 after (0.07 ns *(conv_integer(MEM(122 downto 120))));
         ELSIF (DIVB_OUT_DEL1'event and DIVB_OUT_DEL1'last_value = '0' and DIVB_OUT_DEL1 = '1') THEN
            DIVB_OUT_DEL <= DIVB_OUT_DEL1;
         END IF;
      END IF;
   END PROCESS;
  
   P34 : PROCESS (RSTB_NEW, CLKOP_OUT, false_clk, CLKOS_OUT, CLKOS2_OUT, CLKOS3_OUT)
   BEGIN
      IF (MEM(98 downto 96) = "100") THEN
         IF (RSTB_NEW = '1') THEN
            clkopreg <= '0';
         ELSE
            clkopreg <= CLKOP_OUT;
         END IF;
      ELSE
         IF (clkop_first_time = '1') THEN
            clkopreg <= false_clk;
         ELSIF (RSTB_NEW = '1') THEN
            clkopreg <= '0';
         ELSIF (out_clk_valid = '1') THEN
            clkopreg <= CLKOP_OUT;
         END IF;
      END IF;

      IF (MEM(102 downto 100) = "100") THEN
         IF (RSTB_NEW = '1') THEN
            clkosreg <= '0';
         ELSE
            clkosreg <= CLKOS_OUT; 
         END IF;
      ELSE
         IF (clkop_first_time = '1') THEN
            clkosreg <= false_clk;
         ELSIF (RSTB_NEW = '1') THEN
            clkosreg <= '0';
         ELSIF (out_clk_valid = '1') THEN
            clkosreg <= CLKOS_OUT;
         END IF;
      END IF;

      IF (MEM(109 downto 107) = "100") THEN
         IF (RSTB_NEW = '1') THEN
            clkos2reg <= '0';
         ELSE
            clkos2reg <= CLKOS2_OUT;
         END IF;
      ELSE
         IF (clkop_first_time = '1') THEN
            clkos2reg <= false_clk;
         ELSIF (RSTB_NEW = '1') THEN
            clkos2reg <= '0';
         ELSIF (out_clk_valid = '1') THEN
            clkos2reg <= CLKOS2_OUT;
         END IF;
      END IF;

      IF (MEM(106 downto 104) = "100") THEN
         IF (RSTB_NEW = '1') THEN
            clkos3reg <= '0';
         ELSE
            clkos3reg <= CLKOS3_OUT;
         END IF;
      ELSE
         IF (clkop_first_time = '1') THEN
            clkos3reg <= false_clk;
         ELSIF (RSTB_NEW = '1') THEN
            clkos3reg <= '0';
         ELSIF (out_clk_valid = '1') THEN
            clkos3reg <= CLKOS3_OUT;
         END IF;
      END IF;

      IF (clkop_first_time = '1') THEN
         LOCKREG <= '0';
      ELSIF (RSTB_NEW = '1') THEN
         LOCKREG <= '0';
      ELSIF (out_clk_valid = '1') THEN
         LOCKREG <= lock_all;
      END IF;
   END PROCESS;

   clkintfb <= false_clk;
   LOCKREG1 <= LOCKREG and d4_lock;

   PLOCK : PROCESS (LOCKREG1, LOCKREG2, RSTB_NEW)
   BEGIN
      IF (PLL_LOCK_MODE = 2) THEN
         IF (RSTB_NEW = '1') THEN
            LOCKREG2 <= LOCKREG1;
         ELSE
            LOCKREG2 <= LOCKREG1 or LOCKREG2;
         END IF;
      ELSE
         LOCKREG2 <= LOCKREG1;
      END IF;
   END PROCESS;

   PLOCK1 : PROCESS (MEM(79), stdby_ipd, pllwakesync_ipd, LOCKREG2, INTLOCKREG)
   BEGIN
      IF (MEM(79) = '1') THEN
         IF (INTFB_WAKE = "ENABLED") THEN
            IF (stdby_ipd = '1' and pllwakesync_ipd = '0') THEN
               INTLOCKREG <= '0';
               LOCKREG3 <= '0';
            ELSIF (stdby_ipd = '0' and pllwakesync_ipd = '1') THEN
               IF (INTLOCKREG = '1') THEN
                  LOCKREG3 <= transport LOCKREG2 after (PLL_LOCK_DELAY * lock_delay_reg);
               END IF;
            ELSIF (stdby_ipd = '0' and pllwakesync_ipd = '0') THEN
               INTLOCKREG <= LOCKREG2;
               LOCKREG3 <= '0';
            ELSIF (stdby_ipd = '1' and pllwakesync_ipd = '1') THEN
               INTLOCKREG <= LOCKREG2;
               LOCKREG3 <= LOCKREG2;
            END IF;
         ELSE
            IF (stdby_ipd = '1') THEN
               INTLOCKREG <= '0';
               LOCKREG3 <= '0';
            ELSIF (stdby_ipd = '0') THEN
               INTLOCKREG <= LOCKREG2;
               LOCKREG3 <= LOCKREG2;
            END IF;
         END IF;
      ELSE
         INTLOCKREG <= LOCKREG2;
         LOCKREG3 <= LOCKREG2;
      END IF;
   END PROCESS;

   lock <= LOCKREG3;
   intlock <= INTLOCKREG;

   clkop_1 : PROCESS (clkopreg)
   BEGIN
      IF (clkop_first_time = '1') THEN
         clkop <= clkopreg;
      ELSIF ((MEM(79) = '1') and (LOCKREG3 = '0') and (stdby_ipd = '1')) THEN
         clkop <= '0';
      ELSE
         clkop <= clkopreg;
      END IF;
   END PROCESS;

   clkos_1 : PROCESS (clkosreg)
   BEGIN
      IF (clkop_first_time = '1') THEN
         clkos <= clkosreg;
      ELSIF ((MEM(79) = '1') and (LOCKREG3 = '0') and (stdby_ipd = '1')) THEN
         clkos <= '0';
      ELSE
         clkos <= clkosreg;
      END IF;
   END PROCESS;

   clkos2_1 : PROCESS (clkos2reg)
   BEGIN
      IF (clkop_first_time = '1') THEN
         clkos2 <= clkos2reg;
      ELSIF ((MEM(79) = '1') and (LOCKREG3 = '0') and (stdby_ipd = '1')) THEN
         clkos2 <= '0';
      ELSE
         clkos2 <= clkos2reg;
      END IF;
   END PROCESS;

   clkos3_1 : PROCESS (clkos3reg)
   BEGIN
      IF (clkop_first_time = '1') THEN
         clkos3 <= clkos3reg;
      ELSIF ((MEM(79) = '1') and (LOCKREG3 = '0') and (stdby_ipd = '1')) THEN
         clkos3 <= '0';
      ELSE
         clkos3 <= clkos3reg;
      END IF;
   END PROCESS;


-- WISHBONE --

   P40 : PROCESS (pllclk_ipd)
   BEGIN
      IF (pllclk_ipd'event and pllclk_ipd = '1') THEN
         wb_ack <= pllstb_ipd and (not pllrst_ipd);

         IF (pllwe_ipd = '1') THEN
            pll_wdata <= plldati_ipd;
         END IF;

--         IF (wrena = '1') THEN
--            pll_addr <= plladdr_ipd;
--         END IF;
      END IF;
   END PROCESS;
 
   pll_addr <= plladdr_ipd;
   PLLACKB <= wb_ack and pllstb_ipd and (not pllrst_ipd);
   wrena <= pllwe_ipd and pllstb_ipd and (not pllrst_ipd);

   P41 : PROCESS (pllclk_ipd)
   BEGIN
      IF (pllclk_ipd'event and pllclk_ipd = '1') THEN
         IF ((pllstb_ipd and (not pllwe_ipd) and (not pllrst_ipd)) = '1') THEN
            wb_dat <= muxdat;
         ELSE
            wb_dat <= (others => '0'); 
         END IF;
      END IF;
   END PROCESS;

   P42 : PROCESS (pllstb_ipd, wb_dat)
   BEGIN
      IF (pllstb_ipd = '1') THEN
         PLLDATOB <= wb_dat;
      ELSE
         PLLDATOB <= (others => '0');
      END IF;
   END PROCESS;

--   P43 : PROCESS (wrena, pll_addr, pll_wdata)
--   BEGIN
--      IF (wrena = '1') THEN
--         CASE pll_addr is
--            WHEN "00000" => MEM(7 downto 0) <= pll_wdata;
--            WHEN "00001" => MEM(15 downto 8) <= pll_wdata;
--            WHEN "00010" => MEM(23 downto 16) <= pll_wdata;
--            WHEN "00011" => MEM(31 downto 24) <= pll_wdata;
--            WHEN "00100" => MEM(39 downto 32) <= pll_wdata;
--            WHEN "00101" => MEM(47 downto 40) <= pll_wdata;
--            WHEN "00110" => MEM(55 downto 48) <= pll_wdata;
--            WHEN "00111" => MEM(63 downto 56) <= pll_wdata;
--            WHEN "01000" => MEM(71 downto 64) <= pll_wdata;
--            WHEN "01001" => MEM(79 downto 72) <= pll_wdata;
--            WHEN "01010" => MEM(87 downto 80) <= pll_wdata;
--            WHEN "01011" => MEM(95 downto 88) <= pll_wdata;
--            WHEN "01100" => MEM(103 downto 96) <= pll_wdata;
--            WHEN "01101" => MEM(111 downto 104) <= pll_wdata;
--            WHEN "01110" => MEM(119 downto 112) <= pll_wdata;
--            WHEN "01111" => MEM(127 downto 120) <= pll_wdata;
--            WHEN "10000" => MEM(135 downto 128) <= pll_wdata;
--            WHEN "10001" => MEM(143 downto 136) <= pll_wdata;
--            WHEN "10010" => MEM(151 downto 144) <= pll_wdata;
--            WHEN "10011" => MEM(159 downto 152) <= pll_wdata;
--            WHEN "10100" => MEM(167 downto 160) <= pll_wdata;
--            WHEN "10101" => MEM(175 downto 168) <= pll_wdata;
--            WHEN "10110" => MEM(183 downto 176) <= pll_wdata;
--            WHEN "10111" => MEM(191 downto 184) <= pll_wdata;
--            WHEN "11000" => MEM(199 downto 192) <= pll_wdata;
--            WHEN "11001" => MEM(207 downto 200) <= pll_wdata;
--            WHEN "11010" => MEM(215 downto 208) <= pll_wdata;
--            WHEN "11011" => MEM(223 downto 216) <= pll_wdata;
--            WHEN others => NULL;
--         END CASE;
--      END IF;
--   END PROCESS;

   P44 : PROCESS (pll_addr, MEM)
   BEGIN
      CASE pll_addr is
         WHEN "00000" => muxdat <= MEM(7 downto 0);
         WHEN "00001" => muxdat <= MEM(15 downto 8);
         WHEN "00010" => muxdat <= MEM(23 downto 16);
         WHEN "00011" => muxdat <= MEM(31 downto 24);
         WHEN "00100" => muxdat <= MEM(39 downto 32);
         WHEN "00101" => muxdat <= MEM(47 downto 40);
         WHEN "00110" => muxdat <= MEM(55 downto 48);
         WHEN "00111" => muxdat <= MEM(63 downto 56);
         WHEN "01000" => muxdat <= MEM(71 downto 64);
         WHEN "01001" => muxdat <= MEM(79 downto 72);
         WHEN "01010" => muxdat <= MEM(87 downto 80);
         WHEN "01011" => muxdat <= MEM(95 downto 88);
         WHEN "01100" => muxdat <= MEM(103 downto 96);
         WHEN "01101" => muxdat <= MEM(111 downto 104);
         WHEN "01110" => muxdat <= MEM(119 downto 112);
         WHEN "01111" => muxdat <= MEM(127 downto 120);
         WHEN "10000" => muxdat <= MEM(135 downto 128);
         WHEN "10001" => muxdat <= MEM(143 downto 136);
         WHEN "10010" => muxdat <= MEM(151 downto 144);
         WHEN "10011" => muxdat <= MEM(159 downto 152);
         WHEN "10100" => muxdat <= MEM(167 downto 160);
         WHEN "10101" => muxdat <= MEM(175 downto 168);
         WHEN "10110" => muxdat <= MEM(183 downto 176);
         WHEN "10111" => muxdat <= MEM(191 downto 184);
         WHEN "11000" => muxdat <= MEM(199 downto 192);
         WHEN "11001" => muxdat <= MEM(207 downto 200);
         WHEN "11010" => muxdat <= MEM(215 downto 208);
         WHEN "11011" => muxdat <= MEM(223 downto 216);
         WHEN "11100" => muxdat <= MEM(231 downto 224);
         WHEN others => NULL;
      END CASE;
   END PROCESS;

   refclk <= clki_ipd;

  (plldato7, plldato6, plldato5, plldato4, plldato3, plldato2, plldato1, plldato0) <= PLLDATOB;

  pllack <= PLLACKB;
  
END V;
                                                                                    


------CELL ODDRXE------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.VITAL_Timing.all;
USE ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;

-- entity declaration --
entity ODDRXE is
    GENERIC (
        GSR             : String  := "ENABLED";
        TimingChecksOn  : boolean := FALSE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := FALSE;
        InstancePath    : string := "ODDRXE";
        -- input SIGNAL delays
        tipd_d0                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d1                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rst                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_sclk                : VitalDelayType01 := (0.0 ns, 0.0 ns));

    port(
          d0            :       in      STD_LOGIC;
          d1            :       in      STD_LOGIC;
          sclk          :       in      STD_LOGIC;
          rst           :       in      STD_LOGIC;
          q             :       out     STD_LOGIC
        );

attribute VITAL_LEVEL0 of ODDRXE : entity is TRUE;
end ODDRXE;

-- architecture body --

architecture V of ODDRXE is
  attribute VITAL_LEVEL0 of V : architecture is TRUE;
    SIGNAL d0_ipd    : std_logic := '0';
    SIGNAL d1_ipd    : std_logic := '0';
    SIGNAL sclk_ipd    : std_logic := '0';
    SIGNAL sclk1     : std_logic := '0';
    SIGNAL sclk2     : std_logic := '0';
    SIGNAL rst_ipd  : std_logic := '0';
    SIGNAL QP0       : std_logic := '0';
    SIGNAL QN1       : std_logic := '0';
    SIGNAL QN0       : std_logic := '0';
    SIGNAL g_reset      : std_logic := '1';
    SIGNAL rst_sig      : std_logic := '0';

begin
   ---------------------
   --  input path delays
   ---------------------
    WireDelay : BLOCK
    BEGIN
       VitalWireDelay(d0_ipd, d0, tipd_d0);
       VitalWireDelay(d1_ipd, d1, tipd_d1);
       VitalWireDelay(sclk_ipd, sclk, tipd_sclk);
       VitalWireDelay(rst_ipd, rst, tipd_rst);
    END BLOCK;

   --------------------
   --  behavior section
   --------------------

   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;
    END PROCESS;
                                                                                       
   rst_sig <= rst_ipd or (not g_reset);

  P1: PROCESS(sclk_ipd, rst_sig)
  BEGIN
     IF (rst_sig = '1') THEN
        QP0 <= '0';
        QN0 <= '0';
     ELSIF (sclk_ipd'event and sclk_ipd'last_value = '0' and sclk_ipd = '1') THEN
        QP0 <= d0_ipd;
        QN0 <= d1_ipd;
     END IF;
   END PROCESS;

  P2: PROCESS(sclk_ipd, rst_sig)
  BEGIN
     IF (rst_sig = '1') THEN
        QN1 <= '0';
     ELSIF (sclk_ipd'event and sclk_ipd'last_value = '1' and sclk_ipd = '0') THEN
        QN1 <= QN0;
     END IF;
  END PROCESS;

  sclk1 <= sclk_ipd;
  sclk2 <= sclk1;

   VitalBehavior : PROCESS (sclk2, QP0, QN1)

   BEGIN

    -----------------------------------
    -- functionality section.
    -----------------------------------
      q <= vitalmux
                 (data => (QP0, QN1),
                  dselect => (0 => sclk2));

   END PROCESS;

END v;


------CELL ODDRDQSX1A------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.VITAL_Timing.all;
USE ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;

-- entity declaration --
entity ODDRDQSX1A is
    GENERIC (
        GSR             : String  := "ENABLED";
        TimingChecksOn  : boolean := FALSE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := FALSE;
        InstancePath    : string := "ODDRDQSX1A";
        -- input SIGNAL delays
        tipd_d0                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d1                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rst                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dqsw90             : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_sclk               : VitalDelayType01 := (0.0 ns, 0.0 ns));

    port(
          d0            :       in      STD_LOGIC;
          d1            :       in      STD_LOGIC;
          sclk          :       in      STD_LOGIC;
          dqsw90        :       in      STD_LOGIC;
          rst           :       in      STD_LOGIC;
          q             :       out     STD_LOGIC
        );

attribute VITAL_LEVEL0 of ODDRDQSX1A : entity is TRUE;
end ODDRDQSX1A;

-- architecture body --

architecture V of ODDRDQSX1A is
  attribute VITAL_LEVEL0 of V : architecture is TRUE;
    SIGNAL d0_ipd    : std_logic := '0';
    SIGNAL d1_ipd    : std_logic := '0';
    SIGNAL sclk_ipd    : std_logic := '0';
    SIGNAL dqsw90_ipd    : std_logic := '0';
    SIGNAL rst_ipd  : std_logic := '0';
    SIGNAL QP0       : std_logic := '0';
    SIGNAL QN1       : std_logic := '0';
    SIGNAL QN0       : std_logic := '0';
   SIGNAL g_reset      : std_logic := '1';
   SIGNAL rst_sig      : std_logic := '0';

begin
   ---------------------
   --  input path delays
   ---------------------
    WireDelay : BLOCK
    BEGIN
       VitalWireDelay(d0_ipd, d0, tipd_d0);
       VitalWireDelay(d1_ipd, d1, tipd_d1);
       VitalWireDelay(sclk_ipd, sclk, tipd_sclk);
       VitalWireDelay(dqsw90_ipd, dqsw90, tipd_dqsw90);
       VitalWireDelay(rst_ipd, rst, tipd_rst);
    END BLOCK;

   --------------------
   --  behavior section
   --------------------
   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;
    END PROCESS;
                                                                                              
   rst_sig <= rst_ipd or (not g_reset);


  P1: PROCESS(sclk_ipd, rst_sig)
  BEGIN
     IF (rst_sig = '1') THEN
        QP0 <= '0';
        QN0 <= '0';
     ELSIF (sclk_ipd'event and sclk_ipd'last_value = '0' and sclk_ipd = '1') THEN
        QP0 <= d0_ipd;
        QN0 <= d1_ipd;
     END IF;
  END PROCESS;

  P2: PROCESS(sclk_ipd, rst_sig)
  BEGIN
     IF (rst_sig = '1') THEN
        QN1 <= '0';
     ELSIF (sclk_ipd'event and sclk_ipd'last_value = '1' and sclk_ipd = '0') THEN
        QN1 <= QN0;
     END IF;
   END PROCESS;

   VitalBehavior : PROCESS (dqsw90_ipd, QP0, QN1)

   BEGIN

    -----------------------------------
    -- functionality section.
    -----------------------------------
      q <= vitalmux
                 (data => (QP0, QN1),
                  dselect => (0 => dqsw90_ipd));

   END PROCESS;

END v;



------CELL ODDRX2E------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.VITAL_Timing.all;
USE ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;

-- entity declaration --
entity ODDRX2E is
    GENERIC (
        GSR             : String  := "ENABLED";
        TimingChecksOn  : boolean := FALSE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := FALSE;
        InstancePath    : string := "ODDRX2E";
        -- input SIGNAL delays
        tipd_d0                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d1                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d2                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d3                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rst                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_eclk                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_sclk                : VitalDelayType01 := (0.0 ns, 0.0 ns));

    port(
          d0            :       in      STD_LOGIC;
          d1            :       in      STD_LOGIC;
          d2            :       in      STD_LOGIC;
          d3            :       in      STD_LOGIC;
          eclk           :       in      STD_LOGIC;
          sclk           :       in      STD_LOGIC;
          rst           :       in      STD_LOGIC;
          q             :       out     STD_LOGIC
        );

attribute VITAL_LEVEL0 of ODDRX2E : entity is TRUE;
end ODDRX2E;

-- architecture body --

architecture V of ODDRX2E is
  attribute VITAL_LEVEL0 of V : architecture is TRUE;
    SIGNAL d0_ipd    : std_logic := '0';
    SIGNAL d1_ipd    : std_logic := '0';
    SIGNAL d2_ipd    : std_logic := '0';
    SIGNAL d3_ipd    : std_logic := '0';
    SIGNAL eclk_ipd    : std_logic := '0';
    SIGNAL eclk1     : std_logic := '0';
    SIGNAL eclk2     : std_logic := '0';
    SIGNAL sclk_ipd    : std_logic := '0';
    SIGNAL rst_ipd  : std_logic := '0';
   SIGNAL g_reset      : std_logic := '1';
   SIGNAL rst_sig      : std_logic := '0';
   SIGNAL rst_sig1      : std_logic := '0';
    SIGNAL F0       : std_logic := '0';
    SIGNAL F1       : std_logic := '0';
    SIGNAL F2       : std_logic := '0';
    SIGNAL T0       : std_logic := '0';
    SIGNAL T1       : std_logic := '0';
    SIGNAL T2       : std_logic := '0';
    SIGNAL T3       : std_logic := '0';
    SIGNAL S0       : std_logic := '0';
    SIGNAL S1       : std_logic := '0';
    SIGNAL S2       : std_logic := '0';
    SIGNAL S3       : std_logic := '0';
    SIGNAL R0       : std_logic := '0';
    SIGNAL R1       : std_logic := '0';
    SIGNAL UPDATE       : std_logic := '0';

begin
   ---------------------
   --  input path delays
   ---------------------
    WireDelay : BLOCK
    BEGIN
       VitalWireDelay(d0_ipd, d0, tipd_d0);     
       VitalWireDelay(d1_ipd, d1, tipd_d1);    
       VitalWireDelay(d2_ipd, d2, tipd_d2);   
       VitalWireDelay(d3_ipd, d3, tipd_d3);     
       VitalWireDelay(eclk_ipd, eclk, tipd_eclk);
       VitalWireDelay(sclk_ipd, sclk, tipd_sclk);
       VitalWireDelay(rst_ipd, rst, tipd_rst);
    END BLOCK;

   --------------------
   --  behavior section
   --------------------

   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;
    END PROCESS;
                                                                                              
   rst_sig1 <= rst_ipd or (not g_reset);

   U_rst : PROCESS (eclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         rst_sig <= '1';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         rst_sig <= '0';
      END IF;
   END PROCESS;

  U1: PROCESS(eclk_ipd, rst_sig)
  BEGIN
     IF (rst_sig = '1') THEN
        UPDATE <= '0';
     ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         UPDATE <= not UPDATE;
     END IF;
  END PROCESS;

  P1: PROCESS(sclk_ipd, rst_sig1)
  BEGIN
     IF (rst_sig1 = '1') THEN
        T0 <= '0';
        T1 <= '0';
        T2 <= '0';
        T3 <= '0';
     ELSIF (sclk_ipd'event and sclk_ipd'last_value = '0' and sclk_ipd = '1') THEN
        T0 <= d0_ipd;
        T1 <= d1_ipd;
        T2 <= d2_ipd;
        T3 <= d3_ipd;
     END IF;
  END PROCESS;

  P2: PROCESS(eclk_ipd, rst_sig1)
  BEGIN
     IF (rst_sig1 = '1') THEN
        S0 <= '0';
        S1 <= '0';
        S2 <= '0';
        S3 <= '0';
     ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
        IF (UPDATE = '1') THEN
           S0 <= T0;
           S1 <= T1;
           S2 <= T2;
           S3 <= T3;
        ELSIF (UPDATE = '0') THEN
           S0 <= S0;
           S1 <= S1;
           S2 <= S2;
           S3 <= S3;
        END IF;
     END IF;
  END PROCESS;

  P3: PROCESS(eclk_ipd, rst_sig1)
  BEGIN
     IF (rst_sig1 = '1') THEN
        R0 <= '0';
        R1 <= '0';
        F0 <= '0';
        F1 <= '0';
     ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
        IF (UPDATE = '1') THEN
           R0 <= S0;
           R1 <= S2;
           F0 <= S1;
           F1 <= S3;
        ELSIF (UPDATE = '0') THEN
           R0 <= R1;
           R1 <= '0';
           F0 <= F1;
           F1 <= '0';
        END IF;
     END IF;
  END PROCESS;

  P4: PROCESS(eclk_ipd, rst_sig1)
  BEGIN
     IF (rst_sig1 = '1') THEN
        F2 <= '0';
     ELSIF (eclk_ipd'event and eclk_ipd'last_value = '1' and eclk_ipd = '0') THEN
        F2 <= F0;
     END IF;
  END PROCESS;

  eclk1 <= eclk_ipd;
  eclk2 <= eclk1;

   VitalBehavior : PROCESS (eclk2, R0, F2)

   BEGIN

    -----------------------------------
    -- functionality section.
    -----------------------------------
      q <= vitalmux
                 (data => (R0, F2),
                  dselect => (0 => eclk2));

   END PROCESS;

END v;


------CELL ODDRX4B------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.VITAL_Timing.all;
USE ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;

-- entity declaration --
entity ODDRX4B is
    GENERIC (
        GSR             : String  := "ENABLED";
        TimingChecksOn  : boolean := FALSE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := FALSE;
        InstancePath    : string := "ODDRX4B";
        -- input SIGNAL delays
        tipd_d0                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d1                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d2                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d3                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d4                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d5                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d6                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d7                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rst                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_eclk                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_sclk                : VitalDelayType01 := (0.0 ns, 0.0 ns));

    port(
          d0            :       in      STD_LOGIC;
          d1            :       in      STD_LOGIC;
          d2            :       in      STD_LOGIC;
          d3            :       in      STD_LOGIC;
          d4            :       in      STD_LOGIC;
          d5            :       in      STD_LOGIC;
          d6            :       in      STD_LOGIC;
          d7            :       in      STD_LOGIC;
          eclk           :       in      STD_LOGIC;
          sclk           :       in      STD_LOGIC;
          rst           :       in      STD_LOGIC;
          q             :       out     STD_LOGIC
        );

attribute VITAL_LEVEL0 of ODDRX4B : entity is TRUE;
end ODDRX4B;

-- architecture body --

architecture V of ODDRX4B is
  attribute VITAL_LEVEL0 of V : architecture is TRUE;
    SIGNAL d0_ipd    : std_logic := '0';
    SIGNAL d1_ipd    : std_logic := '0';
    SIGNAL d2_ipd    : std_logic := '0';
    SIGNAL d3_ipd    : std_logic := '0';
    SIGNAL d4_ipd    : std_logic := '0';
    SIGNAL d5_ipd    : std_logic := '0';
    SIGNAL d6_ipd    : std_logic := '0';
    SIGNAL d7_ipd    : std_logic := '0';
    SIGNAL eclk_ipd    : std_logic := '0';
    SIGNAL eclk1     : std_logic := '0';
    SIGNAL eclk2     : std_logic := '0';
    SIGNAL sclk_ipd    : std_logic := '0';
    SIGNAL rst_ipd  : std_logic := '0';
   SIGNAL g_reset      : std_logic := '1';
   SIGNAL rst_sig      : std_logic := '0';
   SIGNAL rst_sig1      : std_logic := '0';
    SIGNAL F0       : std_logic := '0';
    SIGNAL F1       : std_logic := '0';
    SIGNAL F2       : std_logic := '0';
    SIGNAL F3       : std_logic := '0';
    SIGNAL F4       : std_logic := '0';
    SIGNAL T0       : std_logic := '0';
    SIGNAL T1       : std_logic := '0';
    SIGNAL T2       : std_logic := '0';
    SIGNAL T3       : std_logic := '0';
    SIGNAL T4       : std_logic := '0';
    SIGNAL T5       : std_logic := '0';
    SIGNAL T6       : std_logic := '0';
    SIGNAL T7       : std_logic := '0';
    SIGNAL S0       : std_logic := '0';
    SIGNAL S1       : std_logic := '0';
    SIGNAL S2       : std_logic := '0';
    SIGNAL S3       : std_logic := '0';
    SIGNAL S4       : std_logic := '0';
    SIGNAL S5       : std_logic := '0';
    SIGNAL S6       : std_logic := '0';
    SIGNAL S7       : std_logic := '0';
    SIGNAL R0       : std_logic := '0';
    SIGNAL R1       : std_logic := '0';
    SIGNAL R2       : std_logic := '0';
    SIGNAL R3       : std_logic := '0';
    SIGNAL UPDATE_set       : std_logic := '0';
    SIGNAL UPDATE       : std_logic := '0';
    SIGNAL CNT0       : std_logic := '0';
    SIGNAL CNT1       : std_logic := '0';

begin
   ---------------------
   --  input path delays
   ---------------------
    WireDelay : BLOCK
    BEGIN
       VitalWireDelay(d0_ipd, d0, tipd_d0);     
       VitalWireDelay(d1_ipd, d1, tipd_d1);    
       VitalWireDelay(d2_ipd, d2, tipd_d2);   
       VitalWireDelay(d3_ipd, d3, tipd_d3);     
       VitalWireDelay(d4_ipd, d4, tipd_d4);     
       VitalWireDelay(d5_ipd, d5, tipd_d5);     
       VitalWireDelay(d6_ipd, d6, tipd_d6);     
       VitalWireDelay(d7_ipd, d7, tipd_d7);     
       VitalWireDelay(eclk_ipd, eclk, tipd_eclk);
       VitalWireDelay(sclk_ipd, sclk, tipd_sclk);
       VitalWireDelay(rst_ipd, rst, tipd_rst);
    END BLOCK;

   --------------------
   --  behavior section
   --------------------
   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;
    END PROCESS;
                                                                                              
   rst_sig1 <= rst_ipd or (not g_reset);

   U_rst : PROCESS (eclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         rst_sig <= '1';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         rst_sig <= '0';
      END IF;
   END PROCESS;

  U1: PROCESS(eclk_ipd, rst_sig)
  BEGIN
     IF (rst_sig = '1') THEN
        CNT0 <= '0';
        CNT1 <= '0';
     ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         CNT0 <= not CNT0;
         CNT1 <= (CNT0 xor CNT1);
     END IF;
  END PROCESS;

  UPDATE_set <= (CNT0 and (not CNT1));

   U_update : PROCESS (eclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         UPDATE <= '0';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         IF (UPDATE_set = '1') THEN
            UPDATE <= '1' ;
         ELSIF (UPDATE_set = '0') THEN
            UPDATE <= '0' ;
         END IF;
      END IF;
   END PROCESS;

  P1: PROCESS(sclk_ipd, rst_sig1)
  BEGIN
     IF (rst_sig1 = '1') THEN
        T0 <= '0';
        T1 <= '0';
        T2 <= '0';
        T3 <= '0';
        T4 <= '0';
        T5 <= '0';
        T6 <= '0';
        T7 <= '0';
     ELSIF (sclk_ipd'event and sclk_ipd'last_value = '0' and sclk_ipd = '1') THEN
        T0 <= d0_ipd;
        T1 <= d1_ipd;
        T2 <= d2_ipd;
        T3 <= d3_ipd;
        T4 <= d4_ipd;
        T5 <= d5_ipd;
        T6 <= d6_ipd;
        T7 <= d7_ipd;
     END IF;
  END PROCESS;

  P2: PROCESS(eclk_ipd, rst_sig1)
  BEGIN
     IF (rst_sig1 = '1') THEN
        S0 <= '0';
        S1 <= '0';
        S2 <= '0';
        S3 <= '0';
        S4 <= '0';
        S5 <= '0';
        S6 <= '0';
        S7 <= '0';
     ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
        IF (UPDATE = '1') THEN
           S0 <= T0;
           S1 <= T1;
           S2 <= T2;
           S3 <= T3;
           S4 <= T4;
           S5 <= T5;
           S6 <= T6;
           S7 <= T7;
        ELSIF (UPDATE = '0') THEN
           S0 <= S0;
           S1 <= S1;
           S2 <= S2;
           S3 <= S3;
           S4 <= S4;
           S5 <= S5;
           S6 <= S6;
           S7 <= S7;
        END IF;
     END IF;
  END PROCESS;

  P3: PROCESS(eclk_ipd, rst_sig1)
  BEGIN
     IF (rst_sig1 = '1') THEN
        R0 <= '0';
        R1 <= '0';
        R2 <= '0';
        R3 <= '0';
        F0 <= '0';
        F1 <= '0';
        F2 <= '0';
        F3 <= '0';
     ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
        IF (UPDATE = '1') THEN
           R0 <= S0;
           R1 <= S2;
           R2 <= S4;
           R3 <= S6;
           F0 <= S1;
           F1 <= S3;
           F2 <= S5;
           F3 <= S7;
        ELSIF (UPDATE = '0') THEN
           R0 <= R1;
           R1 <= R2;
           R2 <= R3;
           R3 <= '0';
           F0 <= F1;
           F1 <= F2;
           F2 <= F3;
           F3 <= '0';
        END IF;
     END IF;
  END PROCESS;

  P4: PROCESS(eclk_ipd, rst_sig1)
  BEGIN
     IF (rst_sig1 = '1') THEN
        F4 <= '0';
     ELSIF (eclk_ipd'event and eclk_ipd'last_value = '1' and eclk_ipd = '0') THEN
        F4 <= F0;
     END IF;
  END PROCESS;

  eclk1 <= eclk_ipd;
  eclk2 <= eclk1;

   VitalBehavior : PROCESS (eclk2, R0, F4)

   BEGIN

    -----------------------------------
    -- functionality section.
    -----------------------------------
      q <= vitalmux
                 (data => (R0, F4),
                  dselect => (0 => eclk2));

   END PROCESS;

END v;


------CELL ODDRX71A------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.VITAL_Timing.all;
USE ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;

-- entity declaration --
entity ODDRX71A is
    GENERIC (
        GSR             : String  := "ENABLED";
        TimingChecksOn  : boolean := FALSE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := FALSE;
        InstancePath    : string := "ODDRX71A";
        -- input SIGNAL delays
        tipd_d0                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d1                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d2                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d3                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d4                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d5                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_d6                 : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rst                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_eclk                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_sclk                : VitalDelayType01 := (0.0 ns, 0.0 ns));

    port(
          d0            :       in      STD_LOGIC;
          d1            :       in      STD_LOGIC;
          d2            :       in      STD_LOGIC;
          d3            :       in      STD_LOGIC;
          d4            :       in      STD_LOGIC;
          d5            :       in      STD_LOGIC;
          d6            :       in      STD_LOGIC;
          eclk           :       in      STD_LOGIC;
          sclk           :       in      STD_LOGIC;
          rst           :       in      STD_LOGIC;
          q             :       out     STD_LOGIC
        );

attribute VITAL_LEVEL0 of ODDRX71A : entity is TRUE;
end ODDRX71A;

-- architecture body --

architecture V of ODDRX71A is
  attribute VITAL_LEVEL0 of V : architecture is TRUE;
    SIGNAL d0_ipd    : std_logic := '0';
    SIGNAL d1_ipd    : std_logic := '0';
    SIGNAL d2_ipd    : std_logic := '0';
    SIGNAL d3_ipd    : std_logic := '0';
    SIGNAL d4_ipd    : std_logic := '0';
    SIGNAL d5_ipd    : std_logic := '0';
    SIGNAL d6_ipd    : std_logic := '0';
    SIGNAL eclk_ipd    : std_logic := '0';
    SIGNAL eclk1    : std_logic := '0';
    SIGNAL eclk2    : std_logic := '0';
    SIGNAL sclk_ipd    : std_logic := '0';
    SIGNAL rst_ipd  : std_logic := '0';
   SIGNAL g_reset      : std_logic := '1';
   SIGNAL rst_sig      : std_logic := '0';
   SIGNAL rst_sig1      : std_logic := '0';
    SIGNAL F0       : std_logic := '0';
    SIGNAL F1       : std_logic := '0';
    SIGNAL F2       : std_logic := '0';
    SIGNAL F3       : std_logic := '0';
    SIGNAL F4       : std_logic := '0';
    SIGNAL M0       : std_logic := '0';
    SIGNAL M1       : std_logic := '0';
    SIGNAL M2       : std_logic := '0';
    SIGNAL M3       : std_logic := '0';
    SIGNAL M4       : std_logic := '0';
    SIGNAL M5       : std_logic := '0';
    SIGNAL M6       : std_logic := '0';
    SIGNAL M7       : std_logic := '0';
    SIGNAL T0       : std_logic := '0';
    SIGNAL T1       : std_logic := '0';
    SIGNAL T2       : std_logic := '0';
    SIGNAL T3       : std_logic := '0';
    SIGNAL T4       : std_logic := '0';
    SIGNAL T5       : std_logic := '0';
    SIGNAL T6       : std_logic := '0';
    SIGNAL S0       : std_logic := '0';
    SIGNAL S1       : std_logic := '0';
    SIGNAL S2       : std_logic := '0';
    SIGNAL S3       : std_logic := '0';
    SIGNAL S4       : std_logic := '0';
    SIGNAL S5       : std_logic := '0';
    SIGNAL S6       : std_logic := '0';
    SIGNAL S7       : std_logic := '0';
    SIGNAL R0       : std_logic := '0';
    SIGNAL R1       : std_logic := '0';
    SIGNAL R2       : std_logic := '0';
    SIGNAL R3       : std_logic := '0';
    SIGNAL UPDATE0_set       : std_logic := '0';
    SIGNAL UPDATE1_set       : std_logic := '0';
    SIGNAL UPDATE0       : std_logic := '0';
    SIGNAL UPDATE1       : std_logic := '0';
    SIGNAL CNT0       : std_logic := '0';
    SIGNAL CNT1       : std_logic := '0';
    SIGNAL SEL       : std_logic := '0';
    SIGNAL SEL_REG       : std_logic := '0';
    SIGNAL CNT_RSTN       : std_logic := '0';
    SIGNAL SEL_INVEN       : std_logic := '0';

begin
   ---------------------
   --  input path delays
   ---------------------
    WireDelay : BLOCK
    BEGIN
       VitalWireDelay(d0_ipd, d0, tipd_d0);     
       VitalWireDelay(d1_ipd, d1, tipd_d1);    
       VitalWireDelay(d2_ipd, d2, tipd_d2);   
       VitalWireDelay(d3_ipd, d3, tipd_d3);     
       VitalWireDelay(d4_ipd, d4, tipd_d4);     
       VitalWireDelay(d5_ipd, d5, tipd_d5);     
       VitalWireDelay(d6_ipd, d6, tipd_d6);     
       VitalWireDelay(eclk_ipd, eclk, tipd_eclk);
       VitalWireDelay(sclk_ipd, sclk, tipd_sclk);
       VitalWireDelay(rst_ipd, rst, tipd_rst);
    END BLOCK;

   --------------------
   --  behavior section
   --------------------
   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;
    END PROCESS;
                                                                                              
   rst_sig1 <= rst_ipd or (not g_reset);

   U_rst : PROCESS (eclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         rst_sig <= '1';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         rst_sig <= '0';
      END IF;
   END PROCESS;

  U1: PROCESS(eclk_ipd, rst_sig)
  BEGIN
     IF (rst_sig = '1') THEN
        CNT0 <= '0';
        CNT1 <= '0';
     ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         CNT0 <= ((not CNT0) and CNT_RSTN);
         CNT1 <= ((CNT0 xor CNT1) and CNT_RSTN);
     END IF;
  END PROCESS;

  U2: PROCESS(eclk_ipd, rst_sig)
  BEGIN
     IF (rst_sig = '1') THEN
        SEL_REG <= '0';
     ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
        IF (SEL_INVEN = '1') THEN
           SEL_REG <= not SEL_REG;
        END IF;
     END IF;
  END PROCESS;

  SEL <= SEL_REG;
  CNT_RSTN <= not (CNT1 and (not CNT0) and SEL_REG);
  SEL_INVEN <= (CNT1 and CNT0 and (not SEL_REG)) or (CNT1 and (not CNT0) and SEL_REG);
  UPDATE0_set <= ((not CNT1) and (not CNT0) and SEL_REG) or ((not CNT1) and CNT0 and (not SEL_REG));
  UPDATE1_set <= ((not CNT1) and CNT0 and SEL_REG) or (CNT1 and (not CNT0) and (not SEL_REG));

   U_update0 : PROCESS (eclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         UPDATE0 <= '0';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         IF (UPDATE0_set = '1') THEN
            UPDATE0 <= '1' ;
         ELSIF (UPDATE0_set = '0') THEN
            UPDATE0 <= '0' ;
         END IF;
      END IF;
   END PROCESS;

   U_update1 : PROCESS (eclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         UPDATE1 <= '0';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         IF (UPDATE1_set = '1') THEN
            UPDATE1 <= '1' ;
         ELSIF (UPDATE1_set = '0') THEN
            UPDATE1 <= '0' ;
         END IF;
      END IF;
   END PROCESS;

  P1: PROCESS(sclk_ipd, rst_sig1)
  BEGIN
     IF (rst_sig1 = '1') THEN
        T0 <= '0';
        T1 <= '0';
        T2 <= '0';
        T3 <= '0';
        T4 <= '0';
        T5 <= '0';
        T6 <= '0';
     ELSIF (sclk_ipd'event and sclk_ipd'last_value = '0' and sclk_ipd = '1') THEN
        T0 <= d0_ipd;
        T1 <= d1_ipd;
        T2 <= d2_ipd;
        T3 <= d3_ipd;
        T4 <= d4_ipd;
        T5 <= d5_ipd;
        T6 <= d6_ipd;
     END IF;
  END PROCESS;

   P2 : PROCESS (SEL, T6, T5)
   BEGIN
      M6 <= vitalmux
                 (data => (T5, T6),
                  dselect => (0 => SEL));
   END PROCESS;

   P3 : PROCESS (SEL, T4, T3)
   BEGIN
      M4 <= vitalmux
                 (data => (T3, T4),
                  dselect => (0 => SEL));
   END PROCESS;

   P4 : PROCESS (SEL, T2, T1)
   BEGIN
      M2 <= vitalmux
                 (data => (T1, T2),
                  dselect => (0 => SEL));
   END PROCESS;

   P5 : PROCESS (SEL, T0, S6)
   BEGIN
      M0 <= vitalmux
                 (data => (S6, T0),
                  dselect => (0 => SEL));
   END PROCESS;

   P6 : PROCESS (SEL, T0, T1)
   BEGIN
      M1 <= vitalmux
                 (data => (T0, T1),
                  dselect => (0 => SEL));
   END PROCESS;

   P7 : PROCESS (SEL, T3, T2)
   BEGIN
      M3 <= vitalmux
                 (data => (T2, T3),
                  dselect => (0 => SEL));
   END PROCESS;

   P8 : PROCESS (SEL, T5, T4)
   BEGIN
      M5 <= vitalmux
                 (data => (T4, T5),
                  dselect => (0 => SEL));
   END PROCESS;

   P81 : PROCESS (SEL, T6)
   BEGIN
      M7 <= vitalmux
                 (data => (T6, '0'),
                  dselect => (0 => SEL));
   END PROCESS;

  P9: PROCESS(eclk_ipd, rst_sig1)
  BEGIN
     IF (rst_sig1 = '1') THEN
        S0 <= '0';
        S1 <= '0';
        S2 <= '0';
        S3 <= '0';
        S4 <= '0';
        S5 <= '0';
        S6 <= '0';
        S7 <= '0';
     ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
        IF (UPDATE0 = '1') THEN
           S0 <= M0;
           S1 <= M1;
           S2 <= M2;
           S3 <= M3;
           S4 <= M4;
           S5 <= M5;
           S6 <= M6;
           S7 <= M7;
        ELSIF (UPDATE0 = '0') THEN
           S0 <= S0;
           S1 <= S1;
           S2 <= S2;
           S3 <= S3;
           S4 <= S4;
           S5 <= S5;
           S6 <= S6;
           S7 <= S7;
        END IF;
     END IF;
  END PROCESS;

  P10: PROCESS(eclk_ipd, rst_sig1)
  BEGIN
     IF (rst_sig1 = '1') THEN
        R0 <= '0';
        R1 <= '0';
        R2 <= '0';
        R3 <= '0';
        F0 <= '0';
        F1 <= '0';
        F2 <= '0';
        F3 <= '0';
     ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
        IF (UPDATE1 = '1') THEN
           R0 <= S0;
           R1 <= S2;
           R2 <= S4;
           R3 <= S6;
           F0 <= S1;
           F1 <= S3;
           F2 <= S5;
           F3 <= S7;
        ELSIF (UPDATE1 = '0') THEN
           R0 <= R1;
           R1 <= R2;
           R2 <= R3;
           R3 <= '0';
           F0 <= F1;
           F1 <= F2;
           F2 <= F3;
           F3 <= '0';
        END IF;
     END IF;
  END PROCESS;

  P11: PROCESS(eclk_ipd, rst_sig1)
  BEGIN
     IF (rst_sig1 = '1') THEN
        F4 <= '0';
     ELSIF (eclk_ipd'event and eclk_ipd'last_value = '1' and eclk_ipd = '0') THEN
        F4 <= F0;
     END IF;
  END PROCESS;

  eclk1 <= eclk_ipd;
  eclk2 <= eclk1;

   VitalBehavior : PROCESS (eclk2, R0, F4)

   BEGIN

    -----------------------------------
    -- functionality section.
    -----------------------------------
      q <= vitalmux
                 (data => (R0, F4),
                  dselect => (0 => eclk2));

   END PROCESS;

END v;

--
--
----- cell IDDRXE -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;

ENTITY IDDRXE IS
    GENERIC (
        GSR             : String  := "ENABLED";
        TimingChecksOn  : boolean := FALSE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := FALSE;
        InstancePath    : string := "IDDRXE";
        -- input SIGNAL delays
        tipd_d                  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rst                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_sclk                : VitalDelayType01 := (0.0 ns, 0.0 ns));

    PORT (
        d               : IN std_logic;
        sclk             : IN std_logic;
        rst             : IN std_logic;
        q0              : OUT std_logic;
        q1              : OUT std_logic);

    ATTRIBUTE Vital_Level0 OF IDDRXE : ENTITY IS TRUE;

END IDDRXE ;

-- architecture body --
ARCHITECTURE v OF IDDRXE IS
    ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

    SIGNAL d_ipd   : std_logic := '0';
    SIGNAL sclk_ipd  : std_logic := '0';
    SIGNAL rst_ipd : std_logic := '0';
   SIGNAL g_reset      : std_logic := '1';
   SIGNAL rst_sig      : std_logic := '0';
    SIGNAL IP  : std_logic := '0';
    SIGNAL IN0  : std_logic := '0';
    SIGNAL QN0  : std_logic := '0';
    SIGNAL QP0  : std_logic := '0';

BEGIN

   ---------------------
   --  input path delays
   ---------------------
    WireDelay : BLOCK
    BEGIN
       VitalWireDelay(d_ipd, d, tipd_d);
       VitalWireDelay(sclk_ipd, sclk, tipd_sclk);
       VitalWireDelay(rst_ipd, rst, tipd_rst);
    END BLOCK;

   --------------------
   --  behavior section
   --------------------
   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;
    END PROCESS;
                                                                                              
   rst_sig <= rst_ipd or (not g_reset);

   P1 : PROCESS (sclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         QP0 <= 'X';
         QN0 <= 'X';
      ELSIF (sclk_ipd'event and sclk_ipd'last_value = '0' and sclk_ipd = '1') THEN
         QP0 <= d_ipd;
      ELSIF (sclk_ipd'event and sclk_ipd'last_value = '1' and sclk_ipd = '0') THEN
         QN0 <= d_ipd;
      END IF;
   END PROCESS;

   P2 : PROCESS (sclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         IP <= 'X';
         IN0 <= 'X';
      ELSIF (sclk_ipd'event and sclk_ipd'last_value = '0' and sclk_ipd = '1') THEN
         IP <= QP0;
         IN0 <= QN0;
      END IF;
   END PROCESS;

   VitalBehavior : PROCESS (IP, IN0)

   BEGIN

    -----------------------------------
    -- functionality section.
    -----------------------------------
      q0 <= VitalBUF(IP);
      q1 <= VitalBUF(IN0);

   END PROCESS;

END v;


--
----- cell IDDRDQSX1A -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;

ENTITY IDDRDQSX1A IS
    GENERIC (
        GSR             : String  := "ENABLED";
        TimingChecksOn  : boolean := FALSE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := FALSE;
        InstancePath    : string := "IDDRDQSX1A";
        -- input SIGNAL delays
        tipd_d                  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rst                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dqsr90                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_sclk                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_ddrclkpol                : VitalDelayType01 := (0.0 ns, 0.0 ns));

    PORT (
        d               : IN std_logic;
        dqsr90          : IN std_logic;
        sclk            : IN std_logic;
        rst             : IN std_logic;
        ddrclkpol       : IN std_logic;
        q0              : OUT std_logic;
        q1              : OUT std_logic);

    ATTRIBUTE Vital_Level0 OF IDDRDQSX1A : ENTITY IS TRUE;

END IDDRDQSX1A ;

-- architecture body --
ARCHITECTURE v OF IDDRDQSX1A IS
    ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

    SIGNAL d_ipd   : std_logic := '0';
    SIGNAL dqsr90_ipd  : std_logic := '0';
    SIGNAL sclk_ipd  : std_logic := '0';
    SIGNAL rst_ipd : std_logic := '0';
   SIGNAL g_reset      : std_logic := '1';
   SIGNAL rst_sig      : std_logic := '0';
    SIGNAL ddrclkpol_ipd : std_logic := '0';
    SIGNAL IP  : std_logic := '0';
    SIGNAL IN0  : std_logic := '0';
    SIGNAL QN0  : std_logic := '0';
    SIGNAL QN1  : std_logic := '0';
    SIGNAL QN2  : std_logic := '0';
    SIGNAL QP0  : std_logic := '0';
    SIGNAL QP1  : std_logic := '0';
    SIGNAL QP2  : std_logic := '0';
    SIGNAL QP3  : std_logic := '0';
    SIGNAL sclk_pol  : std_logic := '0';

BEGIN

   ---------------------
   --  input path delays
   ---------------------
    WireDelay : BLOCK
    BEGIN
       VitalWireDelay(d_ipd, d, tipd_d);
       VitalWireDelay(dqsr90_ipd, dqsr90, tipd_dqsr90);
       VitalWireDelay(sclk_ipd, sclk, tipd_sclk);
       VitalWireDelay(rst_ipd, rst, tipd_rst);
       VitalWireDelay(ddrclkpol_ipd, ddrclkpol, tipd_ddrclkpol);
    END BLOCK;

   --------------------
   --  behavior section
   --------------------
   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;
    END PROCESS;
                                                                                              
   rst_sig <= rst_ipd or (not g_reset);

   S1 : PROCESS (sclk_ipd, ddrclkpol_ipd)
   BEGIN
      IF (ddrclkpol_ipd = '1') THEN
         sclk_pol <= not sclk_ipd;
      ELSIF (ddrclkpol_ipd = '0') THEN
         sclk_pol <= sclk_ipd;
      END IF;
   END PROCESS;

   P1 : PROCESS (dqsr90_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         QP0 <= '0';
      ELSIF (dqsr90_ipd'event and dqsr90_ipd'last_value = '0' and dqsr90_ipd = '1') THEN
         QP0 <= d_ipd;
      END IF;
   END PROCESS;

   P2 : PROCESS (dqsr90_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         QN0 <= '0';
         QP1 <= '0';
      ELSIF (dqsr90_ipd'event and dqsr90_ipd'last_value = '1' and dqsr90_ipd = '0') THEN
         QN0 <= d_ipd;
         QP1 <= QP0;
      END IF;
   END PROCESS;

   P3 : PROCESS (sclk_pol, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         QN1 <= '0';
         QP2 <= '0';
      ELSIF (sclk_pol'event and sclk_pol'last_value = '0' and sclk_pol = '1') THEN
         QN1 <= QN0;
         QP2 <= QP1;
      END IF;
   END PROCESS;

   P17 : PROCESS (sclk_ipd, rst_sig, QN1, QP2)    -- pos-latch
   BEGIN
      IF (rst_sig = '1') THEN
         QN2 <= '0';
         QP3 <= '0';
      ELSIF (sclk_ipd = '1') THEN
         QN2 <= QN1;
         QP3 <= QP2;
      END IF;
   END PROCESS;

   P5 : PROCESS (sclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         IN0 <= '0';
         IP <= '0';
      ELSIF (sclk_ipd'event and sclk_ipd'last_value = '0' and sclk_ipd = '1') THEN
         IN0 <= QN2;
         IP <= QP3;
      END IF;
   END PROCESS;

   VitalBehavior : PROCESS (IP, IN0)

   BEGIN

    -----------------------------------
    -- functionality section.
    -----------------------------------
      q0 <= VitalBUF(IP);
      q1 <= VitalBUF(IN0);

   END PROCESS;

END v;



--
----- cell TDDRA -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;

ENTITY TDDRA IS
    GENERIC (
        GSR             : String  := "ENABLED";
        DQSW90_INVERT   : string  := "DISABLED";
        TimingChecksOn  : boolean := FALSE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := FALSE;
        InstancePath    : string := "TDDRA";
        -- input SIGNAL delays
        tipd_td                  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rst                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_sclk                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_dqsw90                : VitalDelayType01 := (0.0 ns, 0.0 ns));

    PORT (
        td             : IN std_logic;
        sclk           : IN std_logic;
        rst            : IN std_logic;
        dqsw90         : IN std_logic;
        tq             : OUT std_logic);

    ATTRIBUTE Vital_Level0 OF TDDRA : ENTITY IS TRUE;

END TDDRA ;

-- architecture body --
ARCHITECTURE v OF TDDRA IS
    ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

    SIGNAL td_ipd   : std_logic := '0';
    SIGNAL sclk_ipd  : std_logic := '0';
    SIGNAL rst_ipd : std_logic := '0';
   SIGNAL g_reset      : std_logic := '1';
   SIGNAL rst_sig      : std_logic := '0';
    SIGNAL dqsw90_ipd : std_logic := '0';
    SIGNAL dqsw90_inv : std_logic := '0';
    SIGNAL QP  : std_logic := '0';
    SIGNAL QP1  : std_logic := '0';

BEGIN

   ---------------------
   --  input path delays
   ---------------------
    WireDelay : BLOCK
    BEGIN
       VitalWireDelay(td_ipd, td, tipd_td);
       VitalWireDelay(sclk_ipd, sclk, tipd_sclk);
       VitalWireDelay(rst_ipd, rst, tipd_rst);
       VitalWireDelay(dqsw90_ipd, dqsw90, tipd_dqsw90);
    END BLOCK;

   --------------------
   --  behavior section
   --------------------
   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;
    END PROCESS;
                                                                                              
   rst_sig <= rst_ipd or (not g_reset);
                                                                                              
   P1 : PROCESS (sclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         QP <= '0';
      ELSIF (sclk_ipd'event and sclk_ipd'last_value = '0' and sclk_ipd = '1') THEN
         QP <= td_ipd;
      END IF;
   END PROCESS;

   P3 : PROCESS (dqsw90_ipd)
   BEGIN
      IF (DQSW90_INVERT = "ENABLED") THEN
         dqsw90_inv<= not dqsw90_ipd;
      ELSIF (DQSW90_INVERT = "DISABLED") THEN
         dqsw90_inv <= dqsw90_ipd;
      END IF;
   END PROCESS;

   P2 : PROCESS (dqsw90_inv, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         QP1 <= '0';
      ELSIF (dqsw90_inv'event and dqsw90_inv'last_value = '0' and dqsw90_inv = '1') THEN
         QP1 <= QP;
      END IF;
   END PROCESS;

   VitalBehavior : PROCESS (QP1)

   BEGIN

    -----------------------------------
    -- functionality section.
    -----------------------------------
      tq <= VitalBUF(QP1);

   END PROCESS;

END v;



--
----- cell IDDRX2E -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;

ENTITY IDDRX2E IS
    GENERIC (
        GSR             : String  := "ENABLED";
        TimingChecksOn  : boolean := FALSE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := FALSE;
        InstancePath    : string := "IDDRX2E";
        -- input SIGNAL delays
        tipd_d                  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rst                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_alignwd             : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_eclk                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_sclk                : VitalDelayType01 := (0.0 ns, 0.0 ns));

    PORT (
        d               : IN std_logic;
        eclk            : IN std_logic;
        sclk            : IN std_logic;
        alignwd         : IN std_logic;
        rst             : IN std_logic;
        q0              : OUT std_logic;
        q1              : OUT std_logic;
        q2              : OUT std_logic;
        q3              : OUT std_logic);

    ATTRIBUTE Vital_Level0 OF IDDRX2E : ENTITY IS TRUE;

END IDDRX2E ;

-- architecture body --
ARCHITECTURE v OF IDDRX2E IS
    ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

    SIGNAL d_ipd   : std_logic := '0';
    SIGNAL eclk_ipd  : std_logic := '0';
    SIGNAL sclk_ipd  : std_logic := '0';
    SIGNAL rst_ipd : std_logic := '0';
   SIGNAL g_reset      : std_logic := '1';
   SIGNAL rst_sig      : std_logic := '0';
   SIGNAL rst_sig1      : std_logic := '0';
    SIGNAL alignwd_ipd : std_logic := '0';
    SIGNAL DATA4  : std_logic := '0';
    SIGNAL DATA5  : std_logic := '0';
    SIGNAL DATA6  : std_logic := '0';
    SIGNAL DATA7  : std_logic := '0';
    SIGNAL S4     : std_logic := '0';
    SIGNAL S5     : std_logic := '0';
    SIGNAL S6     : std_logic := '0';
    SIGNAL S7     : std_logic := '0';
    SIGNAL QP3  : std_logic := '0';
    SIGNAL QP2  : std_logic := '0';
    SIGNAL QP1  : std_logic := '0';
    SIGNAL QP0  : std_logic := '0';
    SIGNAL Q43  : std_logic := '0';
    SIGNAL Q65  : std_logic := '0';
    SIGNAL Q_6  : std_logic := '0';
    SIGNAL Q54  : std_logic := '0';
    SIGNAL UPDATE  : std_logic := '0';
    SIGNAL SEL  : std_logic := '0';
    SIGNAL slip_reg0  : std_logic := '0';
    SIGNAL slip_regn1  : std_logic := '0';
    SIGNAL slip_state  : std_logic := '0';
    SIGNAL slip_rst  : std_logic := '0';
    SIGNAL slip_trig  : std_logic := '0';
    SIGNAL cnt_en  : std_logic := '0';

BEGIN

   ---------------------
   --  input path delays
   ---------------------
    WireDelay : BLOCK
    BEGIN
       VitalWireDelay(d_ipd, d, tipd_d);
       VitalWireDelay(eclk_ipd, eclk, tipd_eclk);
       VitalWireDelay(sclk_ipd, sclk, tipd_sclk);
       VitalWireDelay(rst_ipd, rst, tipd_rst);
       VitalWireDelay(alignwd_ipd, alignwd, tipd_alignwd);
    END BLOCK;

   --------------------
   --  behavior section
   --------------------
   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;
    END PROCESS;
                                                                                              
   rst_sig1 <= rst_ipd or (not g_reset);

   U_rst : PROCESS (eclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         rst_sig <= '1';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         rst_sig <= '0';
      END IF;
   END PROCESS;

-- UPDATE and SEL signal generation

   U1 : PROCESS (eclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         slip_reg0 <= '0';
         slip_regn1 <= '1';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         slip_reg0 <= alignwd_ipd;
         slip_regn1 <= not slip_reg0;
      END IF;
   END PROCESS;

   slip_rst <= slip_reg0 and slip_regn1;
   slip_trig <= slip_rst;
   cnt_en <= not (slip_rst and slip_state);

   U2 : PROCESS (eclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         slip_state <= '0';
         UPDATE <= '0';
         SEL <= '0';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         IF (slip_rst = '1') THEN
            slip_state <= not slip_state;
         END IF;

         IF (cnt_en = '1') THEN
            UPDATE <= not UPDATE;
         END IF;

         IF (slip_rst = '1') THEN
            SEL <= not SEL;
         END IF;
      END IF;
   END PROCESS;
 
   P1 : PROCESS (eclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         Q43 <= '0';
         Q65 <= '0';
         Q_6 <= '0';
         Q54 <= '0';
      ELSE
         IF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
            Q65 <= d_ipd;
            Q43 <= Q65;
         END IF;
         IF (eclk_ipd'event and eclk_ipd'last_value = '1' and eclk_ipd = '0') THEN
            Q_6 <= d_ipd;
            Q54 <= Q_6;
         END IF;
      END IF;
   END PROCESS;

   P2 : PROCESS (SEL, Q43, Q54)
   BEGIN
      QP0 <= vitalmux
                 (data => (Q54, Q43),
                  dselect => (0 => SEL));
   END PROCESS;

   P3 : PROCESS (SEL, Q65, Q_6)
   BEGIN
      QP1 <= vitalmux
                 (data => (Q_6, Q65),
                  dselect => (0 => SEL));
   END PROCESS;

   P4 : PROCESS (SEL, Q65, Q54)
   BEGIN
      QP2 <= vitalmux
                 (data => (Q65, Q54),
                  dselect => (0 => SEL));
   END PROCESS;

   P41 : PROCESS (SEL, Q43, Q_6)
   BEGIN
      QP3 <= vitalmux
                 (data => (Q43, Q_6),
                  dselect => (0 => SEL));
   END PROCESS;

   P5 : PROCESS (eclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         S4 <= '0';
         S6 <= '0';
         S7 <= '0';
         S5 <= '0';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         IF (UPDATE = '1') THEN
            S4 <= QP0;
            S6 <= QP1;
            S7 <= QP3;
            S5 <= QP2;
         END IF;
      END IF;
   END PROCESS;

   P6 : PROCESS (sclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         DATA4 <= '0';
         DATA6 <= '0';
         DATA7 <= '0';
         DATA5 <= '0';
      ELSIF (sclk_ipd'event and sclk_ipd'last_value = '0' and sclk_ipd = '1') THEN
         DATA4 <= S4;
         DATA6 <= S6;
         DATA7 <= S7;
         DATA5 <= S5;
      END IF;
   END PROCESS;
                                                                          
   VitalBehavior : PROCESS (DATA4, DATA6, DATA7, DATA5)

   BEGIN

    -----------------------------------
    -- functionality section.
    -----------------------------------
      q0 <= VitalBUF(DATA4);
      q1 <= VitalBUF(DATA5);
      q2 <= VitalBUF(DATA6);
      q3 <= VitalBUF(DATA7);

   END PROCESS;

END v;


--
----- cell IDDRX4B -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;

ENTITY IDDRX4B IS
    GENERIC (
        GSR             : String  := "ENABLED";
        TimingChecksOn  : boolean := FALSE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := FALSE;
        InstancePath    : string := "IDDRX4B";
        -- input SIGNAL delays
        tipd_d                  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rst                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_alignwd             : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_eclk                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_sclk                : VitalDelayType01 := (0.0 ns, 0.0 ns));

    PORT (
        d               : IN std_logic;
        eclk            : IN std_logic;
        sclk            : IN std_logic;
        alignwd         : IN std_logic;
        rst             : IN std_logic;
        q0              : OUT std_logic;
        q1              : OUT std_logic;
        q2              : OUT std_logic;
        q3              : OUT std_logic;
        q4              : OUT std_logic;
        q5              : OUT std_logic;
        q6              : OUT std_logic;
        q7              : OUT std_logic);

    ATTRIBUTE Vital_Level0 OF IDDRX4B : ENTITY IS TRUE;

END IDDRX4B ;

-- architecture body --
ARCHITECTURE v OF IDDRX4B IS
    ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

    SIGNAL d_ipd   : std_logic := '0';
    SIGNAL eclk_ipd  : std_logic := '0';
    SIGNAL sclk_ipd  : std_logic := '0';
    SIGNAL rst_ipd : std_logic := '0';
   SIGNAL g_reset      : std_logic := '1';
   SIGNAL rst_sig      : std_logic := '0';
   SIGNAL rst_sig1      : std_logic := '0';
    SIGNAL alignwd_ipd : std_logic := '0';
    SIGNAL DATA0  : std_logic := '0';
    SIGNAL DATA1  : std_logic := '0';
    SIGNAL DATA2  : std_logic := '0';
    SIGNAL DATA3  : std_logic := '0';
    SIGNAL DATA4  : std_logic := '0';
    SIGNAL DATA5  : std_logic := '0';
    SIGNAL DATA6  : std_logic := '0';
    SIGNAL DATA7  : std_logic := '0';
    SIGNAL S0     : std_logic := '0';
    SIGNAL S1     : std_logic := '0';
    SIGNAL S2     : std_logic := '0';
    SIGNAL S3     : std_logic := '0';
    SIGNAL S4     : std_logic := '0';
    SIGNAL S5     : std_logic := '0';
    SIGNAL S6     : std_logic := '0';
    SIGNAL S7     : std_logic := '0';
    SIGNAL Q00  : std_logic := '0';
    SIGNAL Q10  : std_logic := '0';
    SIGNAL Q21  : std_logic := '0';
    SIGNAL Q32  : std_logic := '0';
    SIGNAL QP7  : std_logic := '0';
    SIGNAL QP6  : std_logic := '0';
    SIGNAL QP5  : std_logic := '0';
    SIGNAL QP4  : std_logic := '0';
    SIGNAL QP3  : std_logic := '0';
    SIGNAL QP2  : std_logic := '0';
    SIGNAL QP1  : std_logic := '0';
    SIGNAL QP0  : std_logic := '0';
    SIGNAL Q43  : std_logic := '0';
    SIGNAL Q65  : std_logic := '0';
    SIGNAL Q_6  : std_logic := '0';
    SIGNAL Q54  : std_logic := '0';
    SIGNAL UPDATE  : std_logic := '0';
    SIGNAL UPDATE_set  : std_logic := '0';
    SIGNAL SEL  : std_logic := '0';
    SIGNAL slip_reg0  : std_logic := '0';
    SIGNAL slip_regn1  : std_logic := '0';
    SIGNAL slip_state  : std_logic := '0';
    SIGNAL slip_rst  : std_logic := '0';
    SIGNAL slip_trig  : std_logic := '0';
    SIGNAL cnt_en  : std_logic := '0';
    SIGNAL CNT0  : std_logic := '0';
    SIGNAL CNT1  : std_logic := '0';

BEGIN

   ---------------------
   --  input path delays
   ---------------------
    WireDelay : BLOCK
    BEGIN
       VitalWireDelay(d_ipd, d, tipd_d);
       VitalWireDelay(eclk_ipd, eclk, tipd_eclk);
       VitalWireDelay(sclk_ipd, sclk, tipd_sclk);
       VitalWireDelay(rst_ipd, rst, tipd_rst);
       VitalWireDelay(alignwd_ipd, alignwd, tipd_alignwd);
    END BLOCK;

   --------------------
   --  behavior section
   --------------------
   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;
    END PROCESS;
                                                                                              
   rst_sig1 <= rst_ipd or (not g_reset);

   U_rst : PROCESS (eclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         rst_sig <= '1';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         rst_sig <= '0';
      END IF;
   END PROCESS;
                                                                                              
-- UPDATE and SEL signal generation

   U1 : PROCESS (eclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         slip_reg0 <= '0';
         slip_regn1 <= '1';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         slip_reg0 <= alignwd_ipd;
         slip_regn1 <= not slip_reg0;
      END IF;
   END PROCESS;

   slip_rst <= slip_reg0 and slip_regn1;
   slip_trig <= slip_rst;
   cnt_en <= not (slip_rst and slip_state);
   UPDATE_set <= CNT0 and (not CNT1);

   U_update : PROCESS (eclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         UPDATE <= '0';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         IF (UPDATE_set = '1') THEN
            UPDATE <= '1' ;
         ELSIF (UPDATE_set = '0') THEN
            UPDATE <= '0' ;
         END IF;
      END IF;
   END PROCESS;

   U2 : PROCESS (eclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         CNT0 <= '0';
         CNT1 <= '0';
         slip_state <= '0';
         SEL <= '0';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         IF (slip_rst = '1') THEN
            slip_state <= not slip_state;
         END IF;

         IF (cnt_en = '1') THEN
            CNT0 <= not CNT0;
            CNT1 <= (CNT0 xor CNT1);
         END IF;

         IF (slip_rst = '1') THEN
            SEL <= not SEL;
         END IF;
      END IF;
   END PROCESS;

-----
 
   P1 : PROCESS (eclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         Q00 <= '0';
         Q21 <= '0';
         Q43 <= '0';
         Q65 <= '0';
         Q_6 <= '0';
         Q54 <= '0';
         Q32 <= '0';
         Q10 <= '0';
      ELSE
         IF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
            Q00 <= Q21;
            Q21 <= Q43;
            Q43 <= Q65;
            Q65 <= d_ipd;
         END IF;
         IF (eclk_ipd'event and eclk_ipd'last_value = '1' and eclk_ipd = '0') THEN
            Q_6 <= d_ipd;
            Q54 <= Q_6;
            Q32 <= Q54;
            Q10 <= Q32;
         END IF;
      END IF;
   END PROCESS;

   P2 : PROCESS (SEL, Q00, Q10)
   BEGIN
      QP0 <= vitalmux
                 (data => (Q10, Q00),
                  dselect => (0 => SEL));
   END PROCESS;

   P3 : PROCESS (SEL, Q32, Q21)
   BEGIN
      QP1 <= vitalmux
                 (data => (Q32, Q21),
                  dselect => (0 => SEL));
   END PROCESS;

   P4 : PROCESS (SEL, Q43, Q54)
   BEGIN
      QP2 <= vitalmux
                 (data => (Q54, Q43),
                  dselect => (0 => SEL));
   END PROCESS;

   P5 : PROCESS (SEL, Q65, Q_6)
   BEGIN
      QP3 <= vitalmux
                 (data => (Q_6, Q65),
                  dselect => (0 => SEL));
   END PROCESS;

   P6 : PROCESS (SEL, Q65, Q54)
   BEGIN
      QP4 <= vitalmux
                 (data => (Q65, Q54),
                  dselect => (0 => SEL));
   END PROCESS;

   P7 : PROCESS (SEL, Q43, Q32)
   BEGIN
      QP5 <= vitalmux
                 (data => (Q43, Q32),
                  dselect => (0 => SEL));
   END PROCESS;

   P8 : PROCESS (SEL, Q10, Q21)
   BEGIN
      QP6 <= vitalmux
                 (data => (Q21, Q10),
                  dselect => (0 => SEL));
   END PROCESS;

   P81 : PROCESS (SEL, Q00, Q_6)
   BEGIN
      QP7 <= vitalmux
                 (data => (Q00, Q_6),
                  dselect => (0 => SEL));
   END PROCESS;

   P9 : PROCESS (eclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         S0 <= '0';
         S2 <= '0';
         S4 <= '0';
         S6 <= '0';
         S7 <= '0';
         S5 <= '0';
         S3 <= '0';
         S1 <= '0';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         IF (UPDATE = '1') THEN
            S0 <= QP0;
            S2 <= QP1;
            S4 <= QP2;
            S6 <= QP3;
            S7 <= QP7;
            S5 <= QP4;
            S3 <= QP5;
            S1 <= QP6;
         END IF;
      END IF;
   END PROCESS;

   P10 : PROCESS (sclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         DATA0 <= '0';
         DATA2 <= '0';
         DATA4 <= '0';
         DATA6 <= '0';
         DATA7 <= '0';
         DATA5 <= '0';
         DATA3 <= '0';
         DATA1 <= '0';
      ELSIF (sclk_ipd'event and sclk_ipd'last_value = '0' and sclk_ipd = '1') THEN
         DATA0 <= S0;
         DATA2 <= S2;
         DATA4 <= S4;
         DATA6 <= S6;
         DATA7 <= S7;
         DATA5 <= S5;
         DATA3 <= S3;
         DATA1 <= S1;
      END IF;
   END PROCESS;
                                                                          
   VitalBehavior : PROCESS (DATA0, DATA1, DATA2, DATA3, DATA4, DATA6, DATA7, DATA5)

   BEGIN

    -----------------------------------
    -- functionality section.
    -----------------------------------
      q0 <= VitalBUF(DATA0);
      q1 <= VitalBUF(DATA1);
      q2 <= VitalBUF(DATA2);
      q3 <= VitalBUF(DATA3);
      q4 <= VitalBUF(DATA4);
      q5 <= VitalBUF(DATA5);
      q6 <= VitalBUF(DATA6);
      q7 <= VitalBUF(DATA7);

   END PROCESS;

END v;


--
----- cell IDDRX71A -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;

ENTITY IDDRX71A IS
    GENERIC (
        GSR             : String  := "ENABLED";
        TimingChecksOn  : boolean := FALSE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := FALSE;
        InstancePath    : string := "IDDRX71A";
        -- input SIGNAL delays
        tipd_d                  : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_rst                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_alignwd             : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_eclk                : VitalDelayType01 := (0.0 ns, 0.0 ns);
        tipd_sclk                : VitalDelayType01 := (0.0 ns, 0.0 ns));

    PORT (
        d               : IN std_logic;
        eclk            : IN std_logic;
        sclk            : IN std_logic;
        alignwd         : IN std_logic;
        rst             : IN std_logic;
        q0              : OUT std_logic;
        q1              : OUT std_logic;
        q2              : OUT std_logic;
        q3              : OUT std_logic;
        q4              : OUT std_logic;
        q5              : OUT std_logic;
        q6              : OUT std_logic);

    ATTRIBUTE Vital_Level0 OF IDDRX71A : ENTITY IS TRUE;

END IDDRX71A ;

-- architecture body --
ARCHITECTURE v OF IDDRX71A IS
    ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

    SIGNAL d_ipd   : std_logic := '0';
    SIGNAL eclk_ipd  : std_logic := '0';
    SIGNAL sclk_ipd  : std_logic := '0';
    SIGNAL rst_ipd : std_logic := '0';
   SIGNAL g_reset      : std_logic := '1';
   SIGNAL rst_sig      : std_logic := '0';
   SIGNAL rst_sig1      : std_logic := '0';
    SIGNAL alignwd_ipd : std_logic := '0';
    SIGNAL DATA0  : std_logic := '0';
    SIGNAL DATA1  : std_logic := '0';
    SIGNAL DATA2  : std_logic := '0';
    SIGNAL DATA3  : std_logic := '0';
    SIGNAL DATA4  : std_logic := '0';
    SIGNAL DATA5  : std_logic := '0';
    SIGNAL DATA6  : std_logic := '0';
    SIGNAL S0     : std_logic := '0';
    SIGNAL S1     : std_logic := '0';
    SIGNAL S2     : std_logic := '0';
    SIGNAL S3     : std_logic := '0';
    SIGNAL S4     : std_logic := '0';
    SIGNAL S5     : std_logic := '0';
    SIGNAL S6     : std_logic := '0';
    SIGNAL Q00  : std_logic := '0';
    SIGNAL Q10  : std_logic := '0';
    SIGNAL Q21  : std_logic := '0';
    SIGNAL Q32  : std_logic := '0';
    SIGNAL QP6  : std_logic := '0';
    SIGNAL QP5  : std_logic := '0';
    SIGNAL QP4  : std_logic := '0';
    SIGNAL QP3  : std_logic := '0';
    SIGNAL QP2  : std_logic := '0';
    SIGNAL QP1  : std_logic := '0';
    SIGNAL QP0  : std_logic := '0';
    SIGNAL Q43  : std_logic := '0';
    SIGNAL Q65  : std_logic := '0';
    SIGNAL Q_6  : std_logic := '0';
    SIGNAL Q54  : std_logic := '0';
    SIGNAL UPDATE  : std_logic := '0';
    SIGNAL UPDATE_set  : std_logic := '0';
    SIGNAL SEL  : std_logic := '0';
    SIGNAL SEL_REG  : std_logic := '0';
    SIGNAL slip_reg0  : std_logic := '0';
    SIGNAL slip_regn1  : std_logic := '0';
    SIGNAL slip_rst  : std_logic := '0';
    SIGNAL cnt_en  : std_logic := '0';
    SIGNAL CNT0  : std_logic := '0';
    SIGNAL CNT1  : std_logic := '0';
    SIGNAL CNT_RSTN  : std_logic := '0';
    SIGNAL SEL_INVEN  : std_logic := '0';

BEGIN

   ---------------------
   --  input path delays
   ---------------------
    WireDelay : BLOCK
    BEGIN
       VitalWireDelay(d_ipd, d, tipd_d);
       VitalWireDelay(eclk_ipd, eclk, tipd_eclk);
       VitalWireDelay(sclk_ipd, sclk, tipd_sclk);
       VitalWireDelay(rst_ipd, rst, tipd_rst);
       VitalWireDelay(alignwd_ipd, alignwd, tipd_alignwd);
    END BLOCK;

   --------------------
   --  behavior section
   --------------------
   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;
    END PROCESS;
                                                                                              
   rst_sig1 <= rst_ipd or (not g_reset);

   U_rst : PROCESS (eclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         rst_sig <= '1';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         rst_sig <= '0';
      END IF;
   END PROCESS;
                                                                                              
-- UPDATE and SEL signal generation

   U1 : PROCESS (eclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         slip_reg0 <= '0';
         slip_regn1 <= '1';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         slip_reg0 <= alignwd_ipd;
         slip_regn1 <= not slip_reg0;
      END IF;
   END PROCESS;

   slip_rst <= slip_reg0 and slip_regn1;
   cnt_en <= not slip_rst;
   CNT_RSTN <= not (CNT1 and (not CNT0) and SEL_REG);
   SEL_INVEN <= (CNT1 and CNT0 and (not SEL_REG)) or ((CNT1 and (not CNT0) and SEL_REG) and (not slip_rst));
   UPDATE_set <= ((not CNT1) and (not CNT0) and SEL_REG) or ((not CNT1) and CNT0 and (not SEL_REG));
   SEL <= SEL_REG;

   U_update : PROCESS (eclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         UPDATE <= '0';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         IF (UPDATE_set = '1') THEN
            UPDATE <= '1' ;
         ELSIF (UPDATE_set = '0') THEN
            UPDATE <= '0' ;
         END IF;
      END IF;
   END PROCESS;

   U2 : PROCESS (eclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         CNT0 <= '0';
         CNT1 <= '0';
         SEL_REG <= '0';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         IF (cnt_en = '1') THEN
            CNT0 <= (CNT_RSTN and (not CNT0));
            CNT1 <= ((CNT0 xor CNT1) and CNT_RSTN);
         END IF;

         IF (SEL_INVEN = '1') THEN
            SEL_REG <= not SEL_REG;
         END IF;
      END IF;
   END PROCESS;

-----
 
   P1 : PROCESS (eclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         Q00 <= '0';
         Q21 <= '0';
         Q43 <= '0';
         Q65 <= '0';
         Q_6 <= '0';
         Q54 <= '0';
         Q32 <= '0';
         Q10 <= '0';
      ELSE
         IF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
            Q00 <= Q21;
            Q21 <= Q43;
            Q43 <= Q65;
            Q65 <= d_ipd;
         END IF;
         IF (eclk_ipd'event and eclk_ipd'last_value = '1' and eclk_ipd = '0') THEN
            Q_6 <= d_ipd;
            Q54 <= Q_6;
            Q32 <= Q54;
            Q10 <= Q32;
         END IF;
      END IF;
   END PROCESS;

   P2 : PROCESS (SEL, Q00, Q10)
   BEGIN
      QP0 <= vitalmux
                 (data => (Q10, Q00),
                  dselect => (0 => SEL));
   END PROCESS;

   P3 : PROCESS (SEL, Q32, Q21)
   BEGIN
      QP1 <= vitalmux
                 (data => (Q32, Q21),
                  dselect => (0 => SEL));
   END PROCESS;

   P4 : PROCESS (SEL, Q43, Q54)
   BEGIN
      QP2 <= vitalmux
                 (data => (Q54, Q43),
                  dselect => (0 => SEL));
   END PROCESS;

   P5 : PROCESS (SEL, Q65, Q_6)
   BEGIN
      QP3 <= vitalmux
                 (data => (Q_6, Q65),
                  dselect => (0 => SEL));
   END PROCESS;

   P6 : PROCESS (SEL, Q65, Q54)
   BEGIN
      QP4 <= vitalmux
                 (data => (Q65, Q54),
                  dselect => (0 => SEL));
   END PROCESS;

   P7 : PROCESS (SEL, Q43, Q32)
   BEGIN
      QP5 <= vitalmux
                 (data => (Q43, Q32),
                  dselect => (0 => SEL));
   END PROCESS;

   P8 : PROCESS (SEL, Q10, Q21)
   BEGIN
      QP6 <= vitalmux
                 (data => (Q21, Q10),
                  dselect => (0 => SEL));
   END PROCESS;

   P9 : PROCESS (eclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         S0 <= '0';
         S2 <= '0';
         S4 <= '0';
         S6 <= '0';
         S5 <= '0';
         S3 <= '0';
         S1 <= '0';
      ELSIF (eclk_ipd'event and eclk_ipd'last_value = '0' and eclk_ipd = '1') THEN
         IF (UPDATE = '1') THEN
            S0 <= QP0;
            S2 <= QP1;
            S4 <= QP2;
            S6 <= QP3;
            S5 <= QP4;
            S3 <= QP5;
            S1 <= QP6;
         END IF;
      END IF;
   END PROCESS;

   P10 : PROCESS (sclk_ipd, rst_sig1)
   BEGIN
      IF (rst_sig1 = '1') THEN
         DATA0 <= '0';
         DATA2 <= '0';
         DATA4 <= '0';
         DATA6 <= '0';
         DATA5 <= '0';
         DATA3 <= '0';
         DATA1 <= '0';
      ELSIF (sclk_ipd'event and sclk_ipd'last_value = '0' and sclk_ipd = '1') THEN
         DATA0 <= S0;
         DATA2 <= S2;
         DATA4 <= S4;
         DATA6 <= S6;
         DATA5 <= S5;
         DATA3 <= S3;
         DATA1 <= S1;
      END IF;
   END PROCESS;
                                                                          
   VitalBehavior : PROCESS (DATA0, DATA1, DATA2, DATA3, DATA4, DATA5, DATA6)

   BEGIN

    -----------------------------------
    -- functionality section.
    -----------------------------------
      q0 <= VitalBUF(DATA0);
      q1 <= VitalBUF(DATA1);
      q2 <= VitalBUF(DATA2);
      q3 <= VitalBUF(DATA3);
      q4 <= VitalBUF(DATA4);
      q5 <= VitalBUF(DATA5);
      q6 <= VitalBUF(DATA6);

   END PROCESS;

END v;


--*********************************************************************
------CELL DQSDLLC------
--*********************************************************************
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;
                                                                                          
-- entity declaration --
entity DQSDLLC is
    generic(DEL_ADJ         : string := "PLUS";
            DEL_VAL         : integer  := 0;
            LOCK_SENSITIVITY : string  := "LOW";
            FIN              : string  := "100";
            LOCK_CYC         : integer := 2;
            GSR             : String  := "ENABLED";
            FORCE_MAX_DELAY  : string  := "NO");
    port(
          CLK           :       in      STD_ULOGIC;
          RST           :       in      STD_ULOGIC;
          UDDCNTLN      :       in      STD_ULOGIC;
          FREEZE        :       in      STD_ULOGIC;
          LOCK          :       out     STD_ULOGIC;
          DQSDEL        :       out     STD_ULOGIC
        );
                                                                                          
attribute VITAL_LEVEL0 of DQSDLLC : entity is FALSE;
end DQSDLLC;
                                                                                          
-- architecture body --
architecture V of DQSDLLC is
  attribute VITAL_LEVEL0 of V : architecture is FALSE;
                                                                                          
  signal RST_int      :  std_logic := '0';
  signal UDDCNTL_int  : std_logic := '0';
  signal LOCK_int     : std_logic := '0';
  signal DQSDEL_int   : std_logic := '0';
  signal clkin_in     : std_logic := '0';
  signal clkin_out     : std_logic := '0';
  signal freeze_clk_sync     : std_logic := '0';
  signal freeze_clk_sync2n   : std_logic := '0';
  signal clk_rising_edge_count : integer := 0;
                                                                                          
begin
                                                                                          
  clkin_in <= VitalBUF(CLK);
  RST_int  <= VitalBUF(RST);
  UDDCNTL_int <= VitalINV(UDDCNTLN);
                                                                                          
  LOCK  <= VitalBUF(LOCK_int);
  DQSDEL <= VitalBUF(DQSDEL_int);

  process(clkin_in, RST_int)
  begin
    if (RST_int = '1') then
        freeze_clk_sync <= '0';
        freeze_clk_sync2n <= '0';
    elsif (clkin_in'event and clkin_in = '0') then
        freeze_clk_sync <= FREEZE;
        freeze_clk_sync2n <= not freeze_clk_sync;
    end if;
  end process;

  clkin_out <= clkin_in and freeze_clk_sync2n;                                                                                          
  process(clkin_out, RST_int)
  begin
    if (RST_int = '1') then
        clk_rising_edge_count <= 0;
    elsif (clkin_out'event and clkin_out = '1') then
        clk_rising_edge_count <= clk_rising_edge_count + 1;
    end if;
  end process;

  process(clk_rising_edge_count, RST_int)
  begin
    if (RST_int = '1') then
        LOCK_int <= '0';
    elsif (clk_rising_edge_count > LOCK_CYC) then
        LOCK_int <= '1';
    end if;
  end process;
                                                                                          
  process(LOCK_int, UDDCNTL_int, RST_int)
  begin
    if (RST_int = '1') then
        DQSDEL_int <= '0';
    elsif (UDDCNTL_int = '1') then
        DQSDEL_int <= LOCK_int;
    else
        DQSDEL_int <= DQSDEL_int;
    end if;
  end process;
                                                                                          
end V;


--
----- cell delayd -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
                                                                                          
                                                                                          
-- entity declaration --
ENTITY delayd IS
   GENERIC(
      TimingChecksOn  : boolean := FALSE;
      XOn             : boolean := FALSE;
      MsgOn           : boolean := FALSE;
      InstancePath    : string := "delayd";
      tipd_del0     : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_del1     : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_del2     : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_del3     : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_del4     : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_a          : VitalDelayType01 := (0.0 ns, 0.0 ns));
                                                                                          
   PORT(
      a             : IN std_logic;
      del0          : IN std_logic;
      del1          : IN std_logic;
      del2          : IN std_logic;
      del3          : IN std_logic;
      del4          : IN std_logic;
      z             : OUT std_logic);
                                                                                          
    ATTRIBUTE Vital_Level0 OF delayd : ENTITY IS TRUE;
                                                                                          
END delayd;
                                                                                          
-- architecture body --
ARCHITECTURE v OF delayd IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;
                                                                                          
   SIGNAL a_ipd  : std_logic := '0';
   SIGNAL del_ipd        : std_logic_vector(4 downto 0) := "00000";
   SIGNAL delta          : time  := 0.05 ns;
   SIGNAL cntl_delay     : time  := 0 ns;
   SIGNAL cntl_reg_int   : integer  := 0;
   SIGNAL a_delay        : std_logic := '0';
   SIGNAL a_man_del      : std_logic := '0';
                                                                                          
BEGIN
                                                                                          
   ---------------------
   --  input path delays
   ---------------------
   WireDelay : BLOCK
   BEGIN
   VitalWireDelay (a_ipd, a, tipd_a);
   VitalWireDelay (del_ipd(0), del0, tipd_del0);
   VitalWireDelay (del_ipd(1), del1, tipd_del1);
   VitalWireDelay (del_ipd(2), del2, tipd_del2);
   VitalWireDelay (del_ipd(3), del3, tipd_del3);
   VitalWireDelay (del_ipd(4), del4, tipd_del4);
   END BLOCK;
                                                                                          
   --------------------
   --  behavior section
   --------------------
   cntl_reg_int <= conv_integer(del_ipd);
                                                                                          
   cntl_delay <= (cntl_reg_int * delta);
                                                                                          
   a_delay <= transport a_ipd after cntl_delay;
                                                                                          
   VitalBehavior : PROCESS (a_delay)
                                                                                          
   BEGIN
                                                                                          
      -------------------------
      --  functionality section
      -------------------------
      z <= a_delay;
                                                                                          
   END PROCESS;
                                                                                          
END v;
                                                                                          
--
----- cell delaye -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
                                                                                          
                                                                                          
-- entity declaration --
ENTITY delaye IS
   GENERIC(
      DEL_MODE        : string := "USER_DEFINED";
      DEL_VALUE       : string := "DELAY0";
      TimingChecksOn  : boolean := FALSE;
      XOn             : boolean := FALSE;
      MsgOn           : boolean := FALSE;
      InstancePath    : string := "delaye";
      tipd_a          : VitalDelayType01 := (0.0 ns, 0.0 ns));
                                                                                          
   PORT(
      a             : IN std_logic;
      z             : OUT std_logic);
                                                                                          
    ATTRIBUTE Vital_Level0 OF delaye : ENTITY IS TRUE;
                                                                                          
END delaye;
                                                                                          
-- architecture body --
ARCHITECTURE v OF delaye IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;
                                                                                          
   SIGNAL a_ipd  : std_logic := '0';
                                                                                          
BEGIN
                                                                                          
   ---------------------
   --  input path delays
   ---------------------
   WireDelay : BLOCK
   BEGIN
   VitalWireDelay (a_ipd, a, tipd_a);
   END BLOCK;
                                                                                          
   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a_ipd)
                                                                                          
   BEGIN
                                                                                          
      -------------------------
      --  functionality section
      -------------------------
      z <= a_ipd;
                                                                                          
   END PROCESS;
                                                                                          
END v;
                                                                                          
--
----- cell clkfbbufa -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
                                                                                          
                                                                                          
-- entity declaration --
ENTITY clkfbbufa IS
   GENERIC(
      TimingChecksOn  : boolean := FALSE;
      XOn             : boolean := FALSE;
      MsgOn           : boolean := FALSE;
      InstancePath    : string := "clkfbbufa";
      tipd_a          : VitalDelayType01 := (0.0 ns, 0.0 ns));
                                                                                          
   PORT(
      a             : IN std_logic;
      z             : OUT std_logic);
                                                                                          
    ATTRIBUTE Vital_Level0 OF clkfbbufa : ENTITY IS TRUE;
                                                                                          
END clkfbbufa;
                                                                                          
-- architecture body --
ARCHITECTURE v OF clkfbbufa IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;
                                                                                          
   SIGNAL a_ipd  : std_logic := '0';
                                                                                          
BEGIN
                                                                                          
   ---------------------
   --  input path delays
   ---------------------
   WireDelay : BLOCK
   BEGIN
   VitalWireDelay (a_ipd, a, tipd_a);
   END BLOCK;
                                                                                          
   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a_ipd)
                                                                                          
   BEGIN
                                                                                          
      -------------------------
      --  functionality section
      -------------------------
      z <= a_ipd;
                                                                                          
   END PROCESS;
                                                                                          
END v;
                                                                                          
--
----- cell ECLKSYNCA -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
                                                                                          
-- entity declaration --
ENTITY ECLKSYNCA IS
   GENERIC(
      TimingChecksOn       : boolean := FALSE;
      XOn                  : boolean := FALSE;
      MsgOn                : boolean := FALSE;
      InstancePath         : string := "ECLKSYNCA";
      tipd_eclki            : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_stop             : VitalDelayType01 := (0.0 ns, 0.0 ns));
                                                                                          
   PORT(
      ECLKI, STOP    :   IN   std_logic;
      ECLKO          :   OUT  std_logic);
                                                                                          
    ATTRIBUTE Vital_Level0 OF ECLKSYNCA : ENTITY IS TRUE;
                                                                                          
END ECLKSYNCA;
                                                                                          
-- architecture body --
ARCHITECTURE v OF ECLKSYNCA IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;
                                                                                          
   SIGNAL eclki_ipd      : std_logic := 'X';
   SIGNAL stop_ipd       : std_logic := 'X';
   SIGNAL eclk1          : std_logic := '0';
   SIGNAL eclk2          : std_logic := '0';
                                                                                          
BEGIN
                                                                                          
   ---------------------
   --  input path delays
   ---------------------
   WireDelay : BLOCK
   BEGIN
   VitalWireDelay (eclki_ipd, eclki, tipd_eclki);
   VitalWireDelay (stop_ipd, stop, tipd_stop);
   END BLOCK;
                                                                                          
   --------------------
   --  behavior section
   --------------------
  P1 : PROCESS(eclki_ipd)
  BEGIN
     IF (eclki_ipd'event and eclki_ipd = '0') THEN
        IF (stop_ipd = '1') THEN
           eclk1 <= '0';
        ELSE
           eclk1 <= '1';
        END IF;
     END IF;
  END PROCESS;
                                                                                          
  P2 : PROCESS(eclki_ipd)
  BEGIN
     IF (eclki_ipd'event and eclki_ipd = '0') THEN
        IF (stop_ipd = '1') THEN
           eclk2 <= '0';
        ELSE
           eclk2 <= eclk1;
        END IF;
     END IF;
  END PROCESS;
                                                                                          
  eclko <= eclki_ipd and eclk2;
                                                                                          
END v;
                                                                                          
                                                                                          
--
----- cell dlldelc -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
                                                                                          
                                                                                          
-- entity declaration --
ENTITY dlldelc IS
   GENERIC(
      DEL_ADJ         : string := "PLUS";
      DEL_VAL         : integer := 0;
      TimingChecksOn  : boolean := FALSE;
      XOn             : boolean := FALSE;
      MsgOn           : boolean := FALSE;
      InstancePath    : string := "dlldelc";
      tipd_dqsdel     : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_clki       : VitalDelayType01 := (0.0 ns, 0.0 ns));
                                                                                          
   PORT(
      clki            : IN std_logic;
      dqsdel          : IN std_logic;
      clko            : OUT std_logic);
                                                                                          
    ATTRIBUTE Vital_Level0 OF dlldelc : ENTITY IS TRUE;
                                                                                          
END dlldelc;
                                                                                          
-- architecture body --
ARCHITECTURE v OF dlldelc IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;
                                                                                          
   SIGNAL clki_ipd       : std_logic := '0';
   SIGNAL dqsdel_ipd     : std_logic := '0';
   SIGNAL quarter_period          : time  := 0.05 ns;
   SIGNAL clk_last_rising_edge     : time  := 0 ns;
   SIGNAL clk_rising_edge_count   : integer  := 0;
   SIGNAL clki_delay     : std_logic := '0';
                                                                                          
BEGIN
                                                                                          
   ---------------------
   --  input path delays
   ---------------------
   WireDelay : BLOCK
   BEGIN
   VitalWireDelay (clki_ipd, clki, tipd_clki);
   VitalWireDelay (dqsdel_ipd, dqsdel, tipd_dqsdel);
   END BLOCK;
                                                                                         
   --------------------
   --  behavior section
   --------------------
   P1 : PROCESS (clki_ipd)
   BEGIN
      IF (clki_ipd'event and clki_ipd = '1') THEN
         clk_rising_edge_count <= clk_rising_edge_count + 1;
         clk_last_rising_edge <= NOW;
      END IF;
   END PROCESS;
                                                                                         
   P2 : PROCESS (clki_ipd)
   BEGIN
      IF (clki_ipd'event and clki_ipd = '0') THEN
         IF (clk_rising_edge_count >= 1) THEN
            quarter_period <= (NOW - clk_last_rising_edge) / 2;
         END IF;
      END IF;
   END PROCESS;

   P3 : PROCESS (clki_ipd, dqsdel_ipd)
   BEGIN
      IF (dqsdel_ipd = '1') THEN
         IF (quarter_period > 0 ps) THEN
            clki_delay <= transport clki_ipd after quarter_period;
         END IF;
      ELSE
         clki_delay <= clki_ipd;
      END IF;
   END PROCESS;

   VitalBehavior : PROCESS (clki_delay)
                                                                                         
   BEGIN
                                                                                         
      -------------------------
      --  functionality section
      -------------------------
      clko <= clki_delay;
                                                                                         
   END PROCESS;
                                                                                         
END v;


--
----- cell CLKDIVC -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
USE work.global.gsrnet;
USE work.global.purnet;
                                                                                         
                                                                                         
-- entity declaration --
ENTITY CLKDIVC IS
   GENERIC(
      GSR                  : String := "DISABLED";
      DIV                  : String := "2.0";
      TimingChecksOn       : boolean := FALSE;
      XOn                  : boolean := FALSE;
      MsgOn                : boolean := FALSE;
      InstancePath         : string := "CLKDIVC";
      tipd_clki            : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_alignwd         : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_rst             : VitalDelayType01 := (0.0 ns, 0.0 ns));
                                                                                         
   PORT(
      clki, rst, alignwd             :   IN   std_logic;
      cdiv1, cdivx                   :   OUT  std_logic);
                                                                                         
    ATTRIBUTE Vital_Level0 OF CLKDIVC : ENTITY IS TRUE;
                                                                                         
END CLKDIVC;
                                                                                         
-- architecture body --
ARCHITECTURE v OF CLKDIVC IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;
                                                                                         
   SIGNAL clki_ipd      : std_logic := 'X';
   SIGNAL rst_ipd      : std_logic := 'X';
   SIGNAL alignwd_ipd      : std_logic := 'X';
   SIGNAL cdiv_sigx      : std_logic := '0';
   SIGNAL cdiv_sig1      : std_logic := '0';
   SIGNAL g_reset      : std_logic := '1';
   SIGNAL rst_sig      : std_logic := '0';
   SIGNAL rst_reg0      : std_logic := '0';
   SIGNAL even_op      : std_logic := '0';
   SIGNAL mc1_div3p5      : std_logic := '0';
   SIGNAL rstn_reg0      : std_logic := '1';
   SIGNAL slip_reg0      : std_logic := '0';
   SIGNAL slipn_reg1      : std_logic := '0';
   SIGNAL rst_reg1      : std_logic := '0';
   SIGNAL slip_state_reg      : std_logic := '0';
   SIGNAL cnt_reg0      : std_logic := '0';
   SIGNAL cntn_reg0      : std_logic := '1';
   SIGNAL cnt_reg1      : std_logic := '0';
   SIGNAL cntn_reg1      : std_logic := '1';
   SIGNAL sel_reg      : std_logic := '0';
   SIGNAL sel_regn      : std_logic := '1';
   SIGNAL cdiv_out      : std_logic := '0';
   SIGNAL cnt_xfr      : std_logic := '0';
   SIGNAL cnt_rstn      : std_logic := '0';
   SIGNAL cnt_en      : std_logic := '0';
   SIGNAL sel_inven      : std_logic := '0';
   SIGNAL rst_reg2      : std_logic := '0';
   SIGNAL slip_rst      : std_logic := '0';
   SIGNAL slip_trig      : std_logic := '0';
                                                                                         
BEGIN
                                                                                         
   ---------------------
   --  input path delays
   ---------------------
   WireDelay : BLOCK
   BEGIN
   VitalWireDelay (clki_ipd, clki, tipd_clki);
   VitalWireDelay (rst_ipd, rst, tipd_rst);
   VitalWireDelay (alignwd_ipd, alignwd, tipd_alignwd);
   END BLOCK;
                                                                                         
   --------------------
   --  behavior section
   --------------------
                                                                                         
   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;
    END PROCESS;
                                                                                         
   rst_sig <= rst_ipd or (not g_reset);

  even_op <= '1' when (DIV = "2.0") or (DIV = "4.0") else '0';
  mc1_div3p5 <= '0' when (DIV = "2.0") or (DIV = "4.0") else '1';
                                                                                         
  P1 : PROCESS(clki_ipd, rst_sig)
  BEGIN
     IF (rst_sig = '1') THEN
        rst_reg0 <= '0';
        rstn_reg0 <= '1';
     ELSIF (clki_ipd'event and clki_ipd = '1') THEN
        rst_reg0 <= '1';
        rstn_reg0 <= '0';
     END IF;
  END PROCESS;
                                                                                         
  P2 : PROCESS(clki_ipd, rst_reg0)
  BEGIN
     IF (rst_reg0 = '0') THEN
        rst_reg1 <= '0';
     ELSIF (clki_ipd'event and clki_ipd = '1') THEN
        rst_reg1 <= '1';
     END IF;
  END PROCESS;

  rst_reg2 <= rst_reg0 and rst_reg1;

  P3 : PROCESS(clki_ipd, rst_reg2)
  BEGIN
     IF (rst_reg2 = '0') THEN
        cdiv_sig1 <= 'X';
     ELSE 
        cdiv_sig1 <= clki_ipd;
     END IF;
  END PROCESS;
                                                                                         
  P4 : PROCESS(clki_ipd, rstn_reg0)
  BEGIN
     IF (rstn_reg0 = '1') THEN
        slip_reg0 <= '0';
        slipn_reg1 <= '1';
     ELSIF (clki_ipd'event and clki_ipd = '1') THEN
        slip_reg0 <= alignwd_ipd;
        slipn_reg1 <= not slip_reg0;
     END IF;
  END PROCESS;
                                                                                         
  slip_rst <= (slip_reg0 and slipn_reg1);
  slip_trig <= even_op and slip_rst;

  P5 : PROCESS(clki_ipd, rstn_reg0)
  BEGIN
     IF (rstn_reg0 = '1') THEN
        slip_state_reg <= '1';
     ELSIF (clki_ipd'event and clki_ipd = '1') THEN
        IF (slip_trig = '1') THEN
           slip_state_reg <= not slip_state_reg;
        ELSE
           slip_state_reg <= not slip_state_reg;
        END IF;
     END IF;
  END PROCESS;

  P6 : PROCESS(clki_ipd, rstn_reg0)
  BEGIN
     IF (rstn_reg0 = '1') THEN
        cnt_reg0 <= '1';
        cntn_reg0 <= '0';
     ELSIF (clki_ipd'event and clki_ipd = '1') THEN
        IF (cnt_en = '1') THEN
           cnt_reg0 <= (cntn_reg0 and cnt_rstn);
           cntn_reg0 <= not (cntn_reg0 and cnt_rstn);
        ELSIF (cnt_en = '0') THEN
           cnt_reg0 <= cnt_reg0;
           cntn_reg0 <= not cnt_reg0;
        END IF;
     END IF;
  END PROCESS;

  P7 : PROCESS(clki_ipd, rstn_reg0)
  BEGIN
     IF (rstn_reg0 = '1') THEN
        cnt_reg1 <= '1';
        cntn_reg1 <= '0';
     ELSIF (clki_ipd'event and clki_ipd = '1') THEN
        IF (cnt_en = '1') THEN
           cnt_reg1 <= (cnt_reg0 xor cnt_reg1) and cnt_rstn;
           cntn_reg1 <= not ((cnt_reg0 xor cnt_reg1) and cnt_rstn);
        ELSIF (cnt_en = '0') THEN
           cnt_reg1 <= cnt_reg1;
           cntn_reg1 <= not cnt_reg1;
        END IF;
     END IF;
  END PROCESS;

  P8 : PROCESS(clki_ipd, rstn_reg0)
  BEGIN
     IF (rstn_reg0 = '1') THEN
        sel_reg <= '0';
        sel_regn <= '1';
     ELSIF (clki_ipd'event and clki_ipd = '1') THEN
        IF (sel_inven = '1') THEN
           sel_reg <= sel_regn;
           sel_regn <= not sel_regn;
        ELSIF (sel_inven = '0') THEN
           sel_reg <= sel_reg;
           sel_regn <= not sel_reg;
        END IF;
     END IF;
  END PROCESS;

  P9 : PROCESS(clki_ipd, rstn_reg0)
  BEGIN
     IF (rstn_reg0 = '1') THEN
        cnt_xfr <= '0';
     ELSIF (clki_ipd'event and clki_ipd = '0') THEN
        cnt_xfr <= cntn_reg1;
     END IF;
  END PROCESS;

  sel_inven <= (cnt_reg1 and cnt_reg0 and mc1_div3p5 and sel_reg) or ((cnt_reg1 and cntn_reg0 and sel_regn and mc1_div3p5) and (not slip_rst));
  cnt_rstn <= not (cnt_reg1 and cntn_reg0 and sel_regn and mc1_div3p5);
  cnt_en <= ((not slip_rst) and mc1_div3p5) or (not(slip_rst and (slip_state_reg)) and even_op);

  P10 : PROCESS(cntn_reg1, cnt_xfr, sel_reg)
  BEGIN
     IF (sel_reg = '1') THEN
        cdiv_out <= cnt_xfr;
     ELSE 
        cdiv_out <= cntn_reg1;
     END IF;
  END PROCESS;

  P11 : PROCESS(cdiv_out, cntn_reg0)
  BEGIN
     IF (DIV = "2.0") THEN
        cdiv_sigx <= cntn_reg0;
     ELSE 
        cdiv_sigx <= cdiv_out;
     END IF;
  END PROCESS;

  cdiv1 <= cdiv_sig1;
  cdivx <= cdiv_sigx;
                                                                                         
END v;



--
----- cell osch -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
                                                                                              
-- entity declaration --
ENTITY osch IS
    GENERIC (
        NOM_FREQ        : string := "2.08");
                                                                                              
    PORT (
        stdby         : IN std_logic;
        osc, sedstdby : OUT std_logic);
                                                                                              
    ATTRIBUTE Vital_Level0 OF osch : ENTITY IS TRUE;
                                                                                              
END osch ;
                                                                                              
-- architecture body --
ARCHITECTURE v OF osch IS
    ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;
                                                                                              
    SIGNAL test_ipd  : std_logic := '1';
    SIGNAL half_clk  : time := 0.0 ns;
                                                                                              
BEGIN
                                                                                              
   --------------------
   --  behavior section
   --------------------

  sedstdby <= stdby;
                                                    
   P1 : PROCESS
   BEGIN
      IF (NOM_FREQ = "2.08") THEN
         half_clk <= 240.38 ns;
      ELSIF (NOM_FREQ = "2.15") THEN
         half_clk <= 232.558 ns;
      ELSIF (NOM_FREQ = "2.22") THEN
         half_clk <= 225.22 ns;
      ELSIF (NOM_FREQ = "2.29") THEN
         half_clk <= 218.34 ns;
      ELSIF (NOM_FREQ = "2.38") THEN
         half_clk <= 210.08 ns;
      ELSIF (NOM_FREQ = "2.46") THEN
         half_clk <= 203.25 ns;
      ELSIF (NOM_FREQ = "2.56") THEN
         half_clk <= 195.31 ns;
      ELSIF (NOM_FREQ = "2.66") THEN
         half_clk <= 187.97 ns;
      ELSIF (NOM_FREQ = "2.77") THEN
         half_clk <= 180.5 ns;
      ELSIF (NOM_FREQ = "2.89") THEN
         half_clk <= 173.0 ns;
      ELSIF (NOM_FREQ = "3.02") THEN
         half_clk <= 165.56 ns;
      ELSIF (NOM_FREQ = "3.17") THEN
         half_clk <= 157.73 ns;
      ELSIF (NOM_FREQ = "3.33") THEN
         half_clk <= 150.1 ns;
      ELSIF (NOM_FREQ = "3.50") THEN
         half_clk <= 142.86 ns;
      ELSIF (NOM_FREQ = "3.69") THEN
         half_clk <= 135.5 ns;
      ELSIF (NOM_FREQ = "3.91") THEN
         half_clk <= 127.88 ns;
      ELSIF (NOM_FREQ = "4.16") THEN
         half_clk <= 120.19 ns;
      ELSIF (NOM_FREQ = "4.29") THEN
         half_clk <= 116.55 ns;
      ELSIF (NOM_FREQ = "4.43") THEN
         half_clk <= 112.866 ns;
      ELSIF (NOM_FREQ = "4.59") THEN
         half_clk <= 108.93 ns;
      ELSIF (NOM_FREQ = "4.75") THEN
         half_clk <= 105.26 ns;
      ELSIF (NOM_FREQ = "4.93") THEN
         half_clk <= 101.42 ns;
      ELSIF (NOM_FREQ = "5.12") THEN
         half_clk <= 97.656 ns;
      ELSIF (NOM_FREQ = "5.32") THEN
         half_clk <= 93.98 ns;
      ELSIF (NOM_FREQ = "5.54") THEN
         half_clk <= 90.25 ns;
      ELSIF (NOM_FREQ = "5.78") THEN
         half_clk <= 86.5 ns;
      ELSIF (NOM_FREQ = "6.05") THEN
         half_clk <= 82.64 ns;
      ELSIF (NOM_FREQ = "6.33") THEN
         half_clk <= 79.0 ns;
      ELSIF (NOM_FREQ = "6.65") THEN
         half_clk <= 75.19 ns;
      ELSIF (NOM_FREQ = "7.00") THEN
         half_clk <= 71.43 ns;
      ELSIF (NOM_FREQ = "7.39") THEN
         half_clk <= 67.66 ns;
      ELSIF (NOM_FREQ = "7.82") THEN
         half_clk <= 63.94 ns;
      ELSIF (NOM_FREQ = "8.31") THEN
         half_clk <= 60.17 ns;
      ELSIF (NOM_FREQ = "8.58") THEN
         half_clk <= 58.27 ns;
      ELSIF (NOM_FREQ = "8.87") THEN
         half_clk <= 56.37 ns;
      ELSIF (NOM_FREQ = "9.17") THEN
         half_clk <= 54.52 ns;
      ELSIF (NOM_FREQ = "9.50") THEN
         half_clk <= 52.63 ns;
      ELSIF (NOM_FREQ = "9.85") THEN
         half_clk <= 50.76 ns;
      ELSIF (NOM_FREQ = "10.23") THEN
         half_clk <= 48.875 ns;
      ELSIF (NOM_FREQ = "10.64") THEN
         half_clk <= 47.0 ns;
      ELSIF (NOM_FREQ = "11.08") THEN
         half_clk <= 45.12 ns;
      ELSIF (NOM_FREQ = "11.57") THEN
         half_clk <= 43.21 ns;
      ELSIF (NOM_FREQ = "12.09") THEN
         half_clk <= 41.35 ns;
      ELSIF (NOM_FREQ = "12.67") THEN
         half_clk <= 39.46 ns;
      ELSIF (NOM_FREQ = "13.30") THEN
         half_clk <= 37.59 ns;
      ELSIF (NOM_FREQ = "14.00") THEN
         half_clk <= 35.71 ns;
      ELSIF (NOM_FREQ = "14.78") THEN
         half_clk <= 33.83 ns;
      ELSIF (NOM_FREQ = "15.65") THEN
         half_clk <= 31.95 ns;
      ELSIF (NOM_FREQ = "16.63") THEN
         half_clk <= 30.06 ns;
      ELSIF (NOM_FREQ = "17.73") THEN
         half_clk <= 28.2 ns;
      ELSIF (NOM_FREQ = "19.00") THEN
         half_clk <= 26.31 ns;
      ELSIF (NOM_FREQ = "20.46") THEN
         half_clk <= 24.44 ns;
      ELSIF (NOM_FREQ = "22.17") THEN
         half_clk <= 22.55 ns;
      ELSIF (NOM_FREQ = "24.18") THEN
         half_clk <= 20.68 ns;
      ELSIF (NOM_FREQ = "26.60") THEN
         half_clk <= 18.8 ns;
      ELSIF (NOM_FREQ = "29.56") THEN
         half_clk <= 16.91 ns;
      ELSIF (NOM_FREQ = "33.25") THEN
         half_clk <= 15.04 ns;
      ELSIF (NOM_FREQ = "38.00") THEN
         half_clk <= 13.16 ns;
      ELSIF (NOM_FREQ = "44.33") THEN
         half_clk <= 11.28 ns;
      ELSIF (NOM_FREQ = "53.20") THEN
         half_clk <= 9.4 ns;
      ELSIF (NOM_FREQ = "66.50") THEN
         half_clk <= 7.52 ns;
      ELSIF (NOM_FREQ = "88.67") THEN
         half_clk <= 5.638 ns;
      ELSIF (NOM_FREQ = "133.00") THEN
         half_clk <= 3.76 ns;
      ELSE
         half_clk <= 240.38 ns;
      assert (false)
        report "Wrong oscillator frequency; default to 2.08 MHz!"
        severity Warning;
      END IF;

      wait;
   END PROCESS;

   test_ipd <= not test_ipd after half_clk;

  P2 : PROCESS(test_ipd, stdby)
  BEGIN
     IF (stdby = '1') THEN
        osc <= '0';
     ELSE
        osc <= test_ipd;
     END IF;
  END PROCESS;
                                                                                              
END v;

------cell DQSBUFH------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
use ieee.std_logic_unsigned.all;
USE work.components.all;
USE work.global.gsrnet;
USE work.global.purnet;
                                                                                       
-- entity declaration --
ENTITY DQSBUFH IS
   GENERIC(
      GSR             : String  := "ENABLED";
      TimingChecksOn  : boolean := FALSE;
      XOn             : boolean := FALSE;
      MsgOn           : boolean := FALSE;
      DQS_LI_DEL_ADJ     : string  := "MINUS";
      DQS_LI_DEL_VAL     : integer := 4;
      DQS_LO_DEL_ADJ     : string  := "MINUS";
      DQS_LO_DEL_VAL     : integer := 0;
      LPDDR              : string  := "DISABLEH";
      InstancePath    : string := "DQSBUFD";
      tipd_dqsi       : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_sclk        : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_read       : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_dqsdel     : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_rst       : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_readclksel1       : VitalDelayType01 := (0.0 ns, 0.0 ns);
      tipd_readclksel0       : VitalDelayType01 := (0.0 ns, 0.0 ns));

    PORT(
          dqsi          :       IN      std_logic;
          sclk          :       IN      std_logic;
          read          :       IN      std_logic;
          readclksel1   :       IN      std_logic;
          readclksel0   :       IN      std_logic;
          dqsdel        :       IN      std_logic;
          rst           :       IN      std_logic;
          ddrclkpol     :       OUT     std_logic;
          dqsr90        :       OUT     std_logic;
          dqsw90        :       OUT     std_logic;
          datavalid     :       OUT     std_logic;
          burstdet      :       OUT     std_logic
        );

ATTRIBUTE vital_level0 OF DQSBUFH : ENTITY IS TRUE;
END DQSBUFH;
                                                                                       
-- architecture body --
                                                                                       
architecture V of DQSBUFH is
  ATTRIBUTE vital_level0 OF v : ARCHITECTURE IS TRUE;
---

  SIGNAL dqsi_ipd                 : std_logic := '0';
  SIGNAL sclk_ipd                  : std_logic := '0';
  SIGNAL read_ipd                 : std_logic := '0';
  SIGNAL dqsdel_ipd               : std_logic := '0';
  SIGNAL readclksel_ipd           : std_logic_vector(1 downto 0) := "00";
  SIGNAL rst_ipd               : std_logic := '0';
  SIGNAL g_reset      : std_logic := '1';
  SIGNAL rst_sig      : std_logic := '0';
  SIGNAL quarter_period           : time := 0 ns;
  SIGNAL clk_last_rising_edge     : time := 0 ns;
  SIGNAL clk_rising_edge_count    : integer := 0;
  SIGNAL read_shift_clk               : std_logic := '0';
  SIGNAL read_q               : std_logic := '0';
  SIGNAL read_post               : std_logic := '0';
  SIGNAL read_pre               : std_logic := '0';
  SIGNAL dqs_ena               : std_logic := '0';
  SIGNAL node_c               : std_logic := '0';
  SIGNAL dqs_clean_int               : std_logic := '0';
  SIGNAL dqs_rise_cnt0               : std_logic := '0';
  SIGNAL dqs_rise_cnt1               : std_logic := '0';
  SIGNAL dqs_fall_cnt0               : std_logic := '0';
  SIGNAL dqs_fall_cnt1               : std_logic := '0';
  SIGNAL dqs_1st_fall_cnt0               : std_logic := '0';
  SIGNAL dqs_1st_fall_cnt1               : std_logic := '0';
  SIGNAL dqs_cnt_0               : std_logic := '0';
  SIGNAL dqs_cnt_1               : std_logic := '0';
  SIGNAL sclk2               : std_logic := '0';
  SIGNAL sclk2_cnt_0               : std_logic := '0';
  SIGNAL sclk2_cnt_1               : std_logic := '0';
  SIGNAL DDRCLKPOL_int               : std_logic := '0';
  SIGNAL DQSW90_int               : std_logic := '0';
  SIGNAL latch_cnt_0               : std_logic := '0';
  SIGNAL latch_cnt_1               : std_logic := '0';
  SIGNAL sclk_cnt_0               : std_logic := '0';
  SIGNAL sclk_cnt_1               : std_logic := '0';
  SIGNAL read_ena               : std_logic := '0';
  SIGNAL set_dqs_ena               : std_logic := '0';
  SIGNAL dqs_clean               : std_logic := '0';
  SIGNAL I1, I2, I3               : std_logic := '0';
  SIGNAL DQSR90_int               : std_logic := '0';
  SIGNAL dqs_ena_del               : std_logic := '0';
  SIGNAL cnt_rstn_pulse               : std_logic := '0';
  SIGNAL cnt_rstn               : std_logic := '0';
  SIGNAL dqs_rise_cnt_ok               : std_logic := '0';
  SIGNAL dqs_fall_cnt_ok               : std_logic := '0';
  SIGNAL dqs_1st_fall_cnt_ok               : std_logic := '0';
  SIGNAL BURSTDET_int               : std_logic := '0';
  SIGNAL diff_bit0               : std_logic := '0';
  SIGNAL diff_bit1               : std_logic := '0';
  SIGNAL new_data               : std_logic := '0';
  SIGNAL DATAVALID_int               : std_logic := '0';

begin
                                                                                       
   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : BLOCK
   BEGIN
   VitalWireDelay(dqsi_ipd, dqsi, tipd_dqsi);
   VitalWireDelay(sclk_ipd, sclk, tipd_sclk);
   VitalWireDelay(rst_ipd, rst, tipd_rst);
   VitalWireDelay(read_ipd, read, tipd_read);
   VitalWireDelay(dqsdel_ipd, dqsdel, tipd_dqsdel);
   VitalWireDelay(readclksel_ipd(1), readclksel1, tipd_readclksel1);
   VitalWireDelay(readclksel_ipd(0), readclksel0, tipd_readclksel0);
   END BLOCK;

   --------------------
   --  BEHAVIOR SECTION
   --------------------
   GLOBALRESET : PROCESS (purnet, gsrnet)
    BEGIN
      IF (GSR =  "DISABLED") THEN
         g_reset <= purnet;
      ELSE
         g_reset <= purnet AND gsrnet;
      END IF;
    END PROCESS;
                                                                                              
   rst_sig <= rst_ipd or (not g_reset);

   P1 : PROCESS (readclksel_ipd, sclk_ipd, DQSW90_int)
   BEGIN
      CASE readclksel_ipd is
         WHEN "00" => read_shift_clk <= DQSW90_int;
         WHEN "01" => read_shift_clk <= not sclk_ipd;
         WHEN "10" => read_shift_clk <= not DQSW90_int;
         WHEN "11" => read_shift_clk <= sclk_ipd;
         WHEN others  => null;
      END CASE;
   END PROCESS;

   P2 : PROCESS (sclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         read_q <= '0';
      ELSIF (sclk_ipd'event and sclk_ipd = '1') THEN
         read_q <= read_ipd;
      END IF;
   END PROCESS;

   P3 : PROCESS (read_shift_clk, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         read_post <= '0';
      ELSIF (read_shift_clk'event and read_shift_clk = '1') THEN
         read_post <= read_q;
      END IF;
   END PROCESS;

   P4 : PROCESS (read_shift_clk, rst_sig)   -- neg-edge
   BEGIN
      IF (rst_sig = '1') THEN
         read_pre <= '0';
      ELSIF (read_shift_clk'event and read_shift_clk = '0') THEN
         read_pre <= read_post;
      END IF;
   END PROCESS;

   read_ena <= read_pre and read_post;
   set_dqs_ena <= read_ena and (not rst_sig);

   P5 : PROCESS (dqs_clean, rst_sig, set_dqs_ena)   -- neg-edge
   BEGIN
      IF (rst_sig = '1') THEN
         dqs_ena <= '0';
      ELSIF (set_dqs_ena = '1') THEN
         dqs_ena <= '1';
      ELSIF (dqs_clean'event and dqs_clean'last_value = '1' and dqs_clean = '0') THEN
         dqs_ena <= read_ena;
      END IF;
   END PROCESS;

   dqs_clean <= dqs_ena and dqsi_ipd;

   P6 : PROCESS (dqs_clean, dqs_ena)   -- pos-edge
   BEGIN
      IF (dqs_ena = '0') THEN
         node_c <= '0';
      ELSIF (dqs_clean'event and dqs_clean'last_value = '0' and dqs_clean = '1') THEN
         node_c <= '1';
      END IF;
   END PROCESS;

   P7 : PROCESS (node_c, rst_sig)   -- pos-edge
   BEGIN
      IF (rst_sig = '1') THEN
         DDRCLKPOL_int <= '0';
      ELSIF (node_c'event and node_c'last_value = '0' and node_c = '1') THEN
         DDRCLKPOL_int <= sclk_ipd;
      END IF;
   END PROCESS;

   P8 : PROCESS (sclk_ipd)
   BEGIN
      IF (sclk_ipd'event and sclk_ipd = '1') THEN
         clk_rising_edge_count <= clk_rising_edge_count + 1;
         clk_last_rising_edge <= NOW;
      END IF;
   END PROCESS;
                                                                                       
   P9 : PROCESS (sclk_ipd)
   BEGIN
      IF (sclk_ipd'event and sclk_ipd = '0') THEN
         IF (clk_rising_edge_count >= 1) THEN
            quarter_period <= (NOW - clk_last_rising_edge) / 2;
         END IF;
      END IF;
   END PROCESS;

   P10 : PROCESS (dqs_clean, dqsdel_ipd, sclk_ipd)
   BEGIN
      IF (dqsdel_ipd = '1') THEN
         IF (quarter_period > 0 ps) THEN
            dqs_clean_int <= transport dqs_clean after quarter_period;
            DQSW90_int <= transport sclk_ipd after quarter_period;
         END IF;
      ELSE
         dqs_clean_int <= dqs_clean;
         DQSW90_int <= sclk_ipd;
      END IF;
   END PROCESS;

   I1 <= dqs_clean and DQSR90_int;
   I2 <= dqs_clean and dqs_clean_int;
   I3 <= DQSR90_int and dqs_clean_int;
   DQSR90_int <= I1 or I2 or I3;

-- burst-det

   dqs_ena_del <= transport (not dqs_ena) after 200 ps; 
   cnt_rstn_pulse <= not (dqs_ena_del and dqs_ena);
   cnt_rstn <= cnt_rstn_pulse and (not rst_sig);

   P11 : PROCESS (dqs_clean, cnt_rstn)
   BEGIN
      IF (cnt_rstn = '0') THEN
         dqs_rise_cnt0 <= '0';
         dqs_rise_cnt1 <= '0';
      ELSIF (dqs_clean'event and dqs_clean'last_value = '0' and dqs_clean = '1') THEN
         IF (dqs_ena = '1') THEN
            dqs_rise_cnt0 <= not dqs_rise_cnt0;
            dqs_rise_cnt1 <= dqs_rise_cnt0;
         END IF;
      END IF;
   END PROCESS;

   P12 : PROCESS (DQSR90_int, cnt_rstn)
   BEGIN
      IF (cnt_rstn = '0') THEN
         dqs_1st_fall_cnt0 <= '0';
         dqs_1st_fall_cnt1 <= '0';
      ELSIF (DQSR90_int'event and DQSR90_int'last_value = '1' and DQSR90_int = '0') THEN
         IF (read_ena = '1') THEN
            dqs_1st_fall_cnt0 <= not dqs_1st_fall_cnt0;
            dqs_1st_fall_cnt1 <= dqs_1st_fall_cnt0;
         END IF;
      END IF;
   END PROCESS;

   P13 : PROCESS (dqs_clean, cnt_rstn)
   BEGIN
      IF (cnt_rstn = '0') THEN
         dqs_fall_cnt0 <= '0';
         dqs_fall_cnt1 <= '0';
      ELSIF (dqs_clean'event and dqs_clean'last_value = '1' and dqs_clean = '0') THEN
         dqs_fall_cnt0 <= not dqs_fall_cnt0;
         dqs_fall_cnt1 <= dqs_fall_cnt0;
      END IF;
   END PROCESS;

   dqs_rise_cnt_ok <= dqs_rise_cnt1 and (not dqs_rise_cnt0);
   dqs_fall_cnt_ok <= dqs_fall_cnt1 and (not dqs_fall_cnt0);
   dqs_1st_fall_cnt_ok <= dqs_1st_fall_cnt0 and (not dqs_1st_fall_cnt1);
   BURSTDET_int <= dqs_rise_cnt_ok and dqs_1st_fall_cnt_ok and dqs_fall_cnt_ok and (not dqs_ena);

-- data-valid generation

   P14 : PROCESS (DQSR90_int, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         dqs_cnt_0 <= '0';
         dqs_cnt_1 <= '0';
      ELSIF (DQSR90_int'event and DQSR90_int'last_value = '1' and DQSR90_int = '0') THEN
         dqs_cnt_0 <= not dqs_cnt_1;
         dqs_cnt_1 <= dqs_cnt_0;
      END IF;
   END PROCESS;

   P15 : PROCESS (DDRCLKPOL_int, sclk_ipd)
   BEGIN
      IF (DDRCLKPOL_int = '0') THEN
         sclk2 <= sclk_ipd;
      ELSIF (DDRCLKPOL_int = '1') THEN
         sclk2 <= not sclk_ipd;
      END IF;
   END PROCESS;

   P16 : PROCESS (sclk2, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         sclk2_cnt_0 <= '0';
         sclk2_cnt_1 <= '0';
      ELSIF (sclk2'event and sclk2'last_value = '0' and sclk2 = '1') THEN
         sclk2_cnt_0 <= dqs_cnt_0;
         sclk2_cnt_1 <= dqs_cnt_1;
      END IF;
   END PROCESS;

   P17 : PROCESS (sclk_ipd, rst_sig, sclk2_cnt_0, sclk2_cnt_1)    -- pos-latch
   BEGIN
      IF (rst_sig = '1') THEN
         latch_cnt_0 <= '0';
         latch_cnt_1 <= '0';
      ELSIF (sclk_ipd = '1') THEN
         latch_cnt_0 <= sclk2_cnt_0;
         latch_cnt_1 <= sclk2_cnt_1;
      END IF;
   END PROCESS;

   P18 : PROCESS (sclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         sclk_cnt_0 <= '0';
         sclk_cnt_1 <= '0';
      ELSIF (sclk_ipd'event and sclk_ipd'last_value = '0' and sclk_ipd = '1') THEN
         sclk_cnt_0 <= latch_cnt_0;
         sclk_cnt_1 <= latch_cnt_1;
      END IF;
   END PROCESS;

   diff_bit0 <= sclk_cnt_0 xor latch_cnt_0;
   diff_bit1 <= sclk_cnt_1 xor latch_cnt_1;
   new_data <= diff_bit0 or diff_bit1;

   P19 : PROCESS (sclk_ipd, rst_sig)
   BEGIN
      IF (rst_sig = '1') THEN
         DATAVALID_int <= '0';
      ELSIF (sclk_ipd'event and sclk_ipd'last_value = '0' and sclk_ipd = '1') THEN
         DATAVALID_int <= new_data;
      END IF;
   END PROCESS;

   ddrclkpol <= DDRCLKPOL_int;
   dqsw90 <= DQSW90_int;
   dqsr90 <= DQSR90_int;
   burstdet <= BURSTDET_int;
   datavalid <= DATAVALID_int;

END v;
                                                                                       

