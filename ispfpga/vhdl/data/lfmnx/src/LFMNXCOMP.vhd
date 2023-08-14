-- --------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------
-- Copyright (c) 2005-2012 by Lattice Semiconductor Corporation
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
-- Simulation Library File for LFMNX
--
-- fpga\vhdl\pkg\vhdsclibs\data\LFMNX\src\LFMNXCOMP.vhd 1.36 06-FEB-2012 17:41:23 IALMOHAN
--

LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_arith.all;
PACKAGE components IS 
   function str2std(L: string) return std_logic_vector;
   function Str2int( L : string) return integer;
   function Str2real( L : string) return REAL;
--
-----functions for Multipliers----------
function INT2VEC(INT: INTEGER; BWIDTH: INTEGER) RETURN STD_LOGIC_VECTOR;
function VEC2INT(v: std_logic_vector) return integer;
function ADDVECT(A, B: STD_LOGIC_VECTOR ) RETURN STD_LOGIC_VECTOR;
function SUBVECT(A, B: STD_LOGIC_VECTOR ) RETURN STD_LOGIC_VECTOR;
function TSCOMP(VECT: STD_LOGIC_VECTOR ) RETURN STD_LOGIC_VECTOR;
function BITX              (VECT: std_logic) return boolean;
function VECX              (VECT: std_logic_vector) return boolean;
PROCEDURE mem_initialize (CLKI_DIV : in Integer; CLKFB_DIV : in Integer;
   CLKOP_DIV : in Integer; CLKOS_DIV : in Integer; CLKOS2_DIV : in Integer;
   CLKOS3_DIV : in Integer; CLKOP_ENABLE : in string; CLKOS_ENABLE : in string;
   CLKOS2_ENABLE : in string; CLKOS3_ENABLE : in string; CLKOP_FPHASE : in Integer;
   CLKOP_CPHASE : in Integer; CLKOS_FPHASE : in Integer; CLKOS_CPHASE : in Integer;
   CLKOS2_FPHASE : in Integer;
   CLKOS2_CPHASE : in Integer;
   CLKOS3_FPHASE : in Integer;
   CLKOS3_CPHASE : in Integer;
   CLKOP_TRIM_POL : in string;
   CLKOS_TRIM_POL : in string;
   CLKOP_TRIM_DELAY : in Integer;
   CLKOS_TRIM_DELAY : in Integer;
   VCO_BYPASS_A0 : in string;
   VCO_BYPASS_B0 : in string;
   VCO_BYPASS_C0 : in string;
   VCO_BYPASS_D0 : in string;
   PREDIVIDER_MUXA1 : in Integer;
   PREDIVIDER_MUXB1 : in Integer;
   PREDIVIDER_MUXC1 : in Integer;
   PREDIVIDER_MUXD1 : in Integer;
   OUTDIVIDER_MUXA2 : in string;
   OUTDIVIDER_MUXB2 : in string;
   OUTDIVIDER_MUXC2 : in string;
   OUTDIVIDER_MUXD2 : in string;
   STDBY_ENABLE     : in string;
   PLLRST_ENA     : in string;
   MRST_ENA     : in string;
   DCRST_ENA     : in string;
   DDRST_ENA     : in string;
   FRACN_ENABLE     : in string;
   FRACN_DIV     : in Integer;

   signal MEM : out std_logic_vector(231 downto 0));

-- 
COMPONENT ageb2
PORT(
        a0, a1: IN std_logic := 'X';
        b0, b1: IN std_logic := 'X';
        ci: IN std_logic := 'X';
        ge: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT aleb2
PORT( 
	a0, a1: IN std_logic := 'X';
	b0, b1: IN std_logic := 'X';
	ci: IN std_logic := 'X';
	le: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT aneb2
PORT(
        a0, a1: IN std_logic := 'X';
        b0, b1: IN std_logic := 'X';
        ci: IN std_logic := 'X';
        ne: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT CCU2D
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
END COMPONENT;
--
COMPONENT and2
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT and3
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT and4
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT and5
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	e: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT cd2
PORT(
        ci : IN std_logic := 'X';
        pc0, pc1 : IN std_logic := 'X';
        co : OUT std_logic := 'X';
        nc0, nc1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT cu2
PORT(
        ci : IN std_logic := 'X';
        pc0, pc1 : IN std_logic := 'X';
        co : OUT std_logic := 'X';
        nc0, nc1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT cb2
PORT(
        ci : IN std_logic := 'X';
        pc0, pc1 : IN std_logic := 'X';
        con: IN std_logic := 'X';
        co : OUT std_logic := 'X';
        nc0, nc1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ehxpllj
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
      PLL_LOCK_MODE      : Integer   := 0);
PORT(
      clki                  : in std_logic;
      clkfb                 : in std_logic;
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
END COMPONENT;
--
COMPONENT lb2p3ax
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        con: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT lb2p3ay
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        con: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT lb2p3bx
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        pd: IN std_logic := 'X';
        con: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT lb2p3dx
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        cd: IN std_logic := 'X';
        con: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT lb2p3ix
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        cd: IN std_logic := 'X';
        con: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT lb2p3jx
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        pd: IN std_logic := 'X';
        con: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ld2p3ax
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ld2p3ay
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ld2p3bx
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        pd: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ld2p3dx
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        cd: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ld2p3ix
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        cd: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ld2p3jx
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        pd: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT lu2p3ax
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT lu2p3ay
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT lu2p3bx
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        pd: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT lu2p3dx
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        cd: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT lu2p3ix
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        cd: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT lu2p3jx
    GENERIC (gsr : String := "ENABLED");
PORT(
        d0, d1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        sp: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        pd: IN std_logic := 'X';
        co: OUT std_logic := 'X';
        q0, q1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT fadd2b
PORT(
        a0, a1 : IN std_logic := 'X';
        b0, b1 : IN std_logic := 'X';
        ci: IN std_logic := 'X';
        cout : OUT std_logic := 'X';
        s0, s1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT fsub2b
PORT(
        a0, a1 : IN std_logic := 'X';
        b0, b1 : IN std_logic := 'X';
        bi: IN std_logic := 'X';
        bout : OUT std_logic := 'X';
        s0, s1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT fadsu2
PORT(
        a0, a1 : IN std_logic := 'X';
        b0, b1 : IN std_logic := 'X';
        bci: IN std_logic := 'X';
        con: IN std_logic := 'X';
        bco: OUT std_logic := 'X';
        s0, s1 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT fd1p3ax
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fd1p3ay
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fd1p3bx
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	pd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fd1p3dx
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	cd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fd1p3ix
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	cd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fd1p3jx
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	pd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fd1s3ax
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	ck: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fd1s3ay
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	ck: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fd1s3bx
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	ck: IN std_logic := 'X';
	pd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fd1s3dx
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	cd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fd1s3ix
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	ck: IN std_logic := 'X';
	cd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fd1s3jx
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	ck: IN std_logic := 'X';
	pd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fd1s1a
    GENERIC (gsr : String := "ENABLED");
PORT(
   d : IN std_logic := 'X';
   ck: IN std_logic := 'X';
   q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT fd1s1ay
    GENERIC (gsr : String := "ENABLED");
PORT(
   d : IN std_logic := 'X';
   ck: IN std_logic := 'X';
   q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT fd1s1b
    GENERIC (gsr : String := "ENABLED");
PORT(
   d : IN std_logic := 'X';
   ck: IN std_logic := 'X';
   pd: IN std_logic := 'X';
   q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT fd1s1d
    GENERIC (gsr : String := "ENABLED");
PORT(
   d : IN std_logic := 'X';
   ck: IN std_logic := 'X';
   cd: IN std_logic := 'X';
   q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT fd1s1i
    GENERIC (gsr : String := "ENABLED");
PORT(
   d : IN std_logic := 'X';
   ck: IN std_logic := 'X';
   cd: IN std_logic := 'X';
   q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT fd1s1j
    GENERIC (gsr : String := "ENABLED");
PORT(
   d : IN std_logic := 'X';
   ck: IN std_logic := 'X';
   pd: IN std_logic := 'X';
   q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT fl1p3az
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fl1p3ay
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fl1p3bx
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	pd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fl1p3dx
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	cd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fl1p3iy
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	cd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fl1p3jy
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	pd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;

COMPONENT fl1s1a
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fl1s1ay
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fl1s1b
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	pd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fl1s1d
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	cd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fl1s1i
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	cd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fl1s1j
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	pd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fl1s3ax
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT fl1s3ay
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT gsr
PORT( 
      gsr: IN std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT sgsr
PORT(
      gsr: IN std_logic := 'X';
      clk : IN std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT inv
PORT( 
	a: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ifs1p3bx
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sp  : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	pd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ifs1p3dx
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sp  : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	cd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ifs1p3ix
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sp  : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	cd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ifs1p3jx
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sp  : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	pd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ifs1s1b
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	pd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ifs1s1d
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	cd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ifs1s1i
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	cd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ifs1s1j
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	pd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT mux21
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	z : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT dcma
PORT(
   clk0: IN std_logic := 'X';
   clk1: IN std_logic := 'X';
   sel: IN std_logic := 'X';
   dcmout : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT pllrefcs
PORT(
   clk0: IN std_logic := 'X';
   clk1: IN std_logic := 'X';
   sel: IN std_logic := 'X';
   pllcsout : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT dcca
PORT(
   clki: IN std_logic := 'X';
   ce: IN std_logic := 'X';
   clko : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT eclkbridgecs
PORT(
   clk0: IN std_logic := 'X';
   clk1: IN std_logic := 'X';
   sel: IN std_logic := 'X';
   ecsout : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT l6mux21
PORT(
        d0: IN std_logic := 'X';
        d1: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        z : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT mux41
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	d2: IN std_logic := 'X';
	d3: IN std_logic := 'X';
	sd1: IN std_logic := 'X';
	sd2: IN std_logic := 'X';
	z : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT mux81
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	d2: IN std_logic := 'X';
	d3: IN std_logic := 'X';
	d4: IN std_logic := 'X';
	d5: IN std_logic := 'X';
	d6: IN std_logic := 'X';
	d7: IN std_logic := 'X';
	sd1: IN std_logic := 'X';
	sd2: IN std_logic := 'X';
	sd3: IN std_logic := 'X';
	z : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT mux161
PORT(
        d0: IN std_logic := 'X';
        d1: IN std_logic := 'X';
        d2: IN std_logic := 'X';
        d3: IN std_logic := 'X';
        d4: IN std_logic := 'X';
        d5: IN std_logic := 'X';
        d6: IN std_logic := 'X';
        d7: IN std_logic := 'X';
        d8: IN std_logic := 'X';
        d9: IN std_logic := 'X';
        d10: IN std_logic := 'X';
        d11: IN std_logic := 'X';
        d12: IN std_logic := 'X';
        d13: IN std_logic := 'X';
        d14: IN std_logic := 'X';
        d15: IN std_logic := 'X';
        sd1: IN std_logic := 'X';
        sd2: IN std_logic := 'X';
        sd3: IN std_logic := 'X';
        sd4: IN std_logic := 'X';
        z : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT mux321
PORT(
        d0: IN std_logic := 'X';
        d1: IN std_logic := 'X';
        d2: IN std_logic := 'X';
        d3: IN std_logic := 'X';
        d4: IN std_logic := 'X';
        d5: IN std_logic := 'X';
        d6: IN std_logic := 'X';
        d7: IN std_logic := 'X';
        d8: IN std_logic := 'X';
        d9: IN std_logic := 'X';
        d10: IN std_logic := 'X';
        d11: IN std_logic := 'X';
        d12: IN std_logic := 'X';
        d13: IN std_logic := 'X';
        d14: IN std_logic := 'X';
        d15: IN std_logic := 'X';
        d16: IN std_logic := 'X';
        d17: IN std_logic := 'X';
        d18: IN std_logic := 'X';
        d19: IN std_logic := 'X';
        d20: IN std_logic := 'X';
        d21: IN std_logic := 'X';
        d22: IN std_logic := 'X';
        d23: IN std_logic := 'X';
        d24: IN std_logic := 'X';
        d25: IN std_logic := 'X';
        d26: IN std_logic := 'X';
        d27: IN std_logic := 'X';
        d28: IN std_logic := 'X';
        d29: IN std_logic := 'X';
        d30: IN std_logic := 'X';
        d31: IN std_logic := 'X';
        sd1: IN std_logic := 'X';
        sd2: IN std_logic := 'X';
        sd3: IN std_logic := 'X';
        sd4: IN std_logic := 'X';
        sd5: IN std_logic := 'X';
        z : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT nd2
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT nd3
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT nd4
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT nd5
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	e: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT nr2
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT nr3
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT nr4
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT nr5
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	e: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ofs1p3bx
    GENERIC (gsr : String := "ENABLED");
PORT(
        d : IN std_logic := 'X';
        sp: IN std_logic := 'X';
        sclk: IN std_logic := 'X';
        pd: IN std_logic := 'X';
        q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ofs1p3dx
    GENERIC (gsr : String := "ENABLED");
PORT(
        d : IN std_logic := 'X';
        sp: IN std_logic := 'X';
        sclk: IN std_logic := 'X';
        cd: IN std_logic := 'X';
        q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ofs1p3ix
    GENERIC (gsr : String := "ENABLED");
PORT(
        d : IN std_logic := 'X';
        sp: IN std_logic := 'X';
        sclk: IN std_logic := 'X';
        cd: IN std_logic := 'X';
        q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ofs1p3jx
    GENERIC (gsr : String := "ENABLED");
PORT(
        d : IN std_logic := 'X';
        sp: IN std_logic := 'X';
        sclk: IN std_logic := 'X';
        pd: IN std_logic := 'X';
        q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT or2
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT or3
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT or4
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT or5
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	e: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT pfumx
PORT( 
	alut: IN std_logic := 'X';
	blut: IN std_logic := 'X';
	c0  : IN std_logic := 'X';
	z   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT pur
   GENERIC (
      RST_PULSE          : Integer   := 1);
PORT(
      pur: IN std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT rom16x1a
GENERIC(
        initval : std_logic_vector(15 downto 0) := "0000000000000000"
  );
PORT( 
	ad0, ad1, ad2, ad3: IN std_logic := 'X';
	do0: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT rom32x1a
GENERIC(
        initval : std_logic_vector(31 downto 0) := "00000000000000000000000000000000"
  );
PORT( 
	ad0, ad1, ad2, ad3, ad4: IN std_logic := 'X';
	do0: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT rom64x1a
GENERIC(
        initval : std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        ad0, ad1, ad2, ad3, ad4, ad5 : IN std_logic := 'X';
        do0: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT rom128x1a
GENERIC(
        initval : std_logic_vector(127 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        ad0, ad1, ad2, ad3, ad4, ad5, ad6 : IN std_logic := 'X';
        do0: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT rom256x1a
GENERIC(
        initval : std_logic_vector(255 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        ad0, ad1, ad2, ad3, ad4, ad5, ad6, ad7 : IN std_logic := 'X';
        do0: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT spr16x4c
GENERIC(
        initval : string := "0x0000000000000000"
  );
PORT(
        di0  : IN std_logic;
        di1  : IN std_logic;
        di2  : IN std_logic;
        di3  : IN std_logic;
        ck  : IN std_logic;
        wre  : IN std_logic;
        ad0 : IN std_logic;
        ad1 : IN std_logic;
        ad2 : IN std_logic;
        ad3 : IN std_logic;
        do0 : OUT std_logic;
        do1 : OUT std_logic;
        do2 : OUT std_logic;
        do3 : OUT std_logic);
END COMPONENT;
--
COMPONENT dpr16x4c
GENERIC(
        initval : string := "0x0000000000000000"
  );
PORT(
        di0  : IN std_logic;
        di1  : IN std_logic;
        di2  : IN std_logic;
        di3  : IN std_logic;
        wck  : IN std_logic;
        wre  : IN std_logic;
        rad0 : IN std_logic;
        rad1 : IN std_logic;
        rad2 : IN std_logic;
        rad3 : IN std_logic;
        wad0 : IN std_logic;
        wad1 : IN std_logic;
        wad2 : IN std_logic;
        wad3 : IN std_logic;
        do0 : OUT std_logic;
        do1 : OUT std_logic;
        do2 : OUT std_logic;
        do3 : OUT std_logic);
END COMPONENT;
--
COMPONENT tsall
PORT( 
       tsall: IN std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT vhi
PORT( 
	 z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT vlo
PORT( 
	 z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT xor2
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT xor3
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT xor4
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT xor5
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	e: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT xor11
PORT( 
        a, b, c, d, e, f, g, h, i, j, k: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT xor21
PORT( 
	a, b, c, d, e, f, g, h, i, j, k: IN std_logic := 'X';
	l, m, n, o, p, q, r, s, t, u: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT xnor2
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT xnor3
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT xnor4
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT xnor5
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	e: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT bufba
PORT(
        a: IN std_logic := 'X';
        z: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ilvds
PORT(
        a : IN std_logic := 'X';
        an: IN std_logic := 'X';
        z : OUT std_logic
 );
END COMPONENT;
--
COMPONENT olvds
PORT(
        a  : IN std_logic := 'X';
        z  : OUT std_logic ;
        zn : OUT std_logic
 );
END COMPONENT;
--
COMPONENT bb
PORT(
        b:  INOUT std_logic := 'X';
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
--
COMPONENT bbw
PORT(
        b:  INOUT std_logic := 'X';
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
--
COMPONENT bbpd
PORT(
        b:  INOUT std_logic := 'X';
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
--
COMPONENT bbpu
PORT(
        b:  INOUT std_logic := 'X';
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
--
COMPONENT ib
PORT(
        i:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
--
COMPONENT ibpd
PORT(
        i:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
--
COMPONENT ibpu
PORT(
        i:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
--
COMPONENT ob
PORT(
        i:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
--
COMPONENT obco
PORT(
        i :  IN std_logic := 'X';
        ot:  OUT std_logic;
        oc:  OUT std_logic);
END COMPONENT;
--
COMPONENT obw
PORT(
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
--
COMPONENT obz
PORT(
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
--
COMPONENT obzpd
PORT(
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
--
COMPONENT obzpu
PORT(
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
--
------Component LUT4------
component LUT4
    generic(  INIT      :       std_logic_vector);
    port(
          A             :       in      STD_ULOGIC;
          B             :       in      STD_ULOGIC;
          C             :       in      STD_ULOGIC;
          D             :       in      STD_ULOGIC;
          Z             :       out     STD_ULOGIC
        );
end component;

------Component LUT5------
component LUT5
    generic(  INIT      :       std_logic_vector);
    port(
          A             :       in      STD_ULOGIC;
          B             :       in      STD_ULOGIC;
          C             :       in      STD_ULOGIC;
          D             :       in      STD_ULOGIC;
          E             :       in      STD_ULOGIC;
          Z             :       out     STD_ULOGIC
        );
end component;

------Component LUT6------
component LUT6
    generic(  INIT      :       std_logic_vector);
    port(
          A             :       in      STD_ULOGIC;
          B             :       in      STD_ULOGIC;
          C             :       in      STD_ULOGIC;
          D             :       in      STD_ULOGIC;
          E             :       in      STD_ULOGIC;
          F             :       in      STD_ULOGIC;
          Z             :       out     STD_ULOGIC
        );
end component;

------Component LUT7------
component LUT7
    generic(  INIT      :       std_logic_vector);
    port(
          A             :       in      STD_ULOGIC;
          B             :       in      STD_ULOGIC;
          C             :       in      STD_ULOGIC;
          D             :       in      STD_ULOGIC;
          E             :       in      STD_ULOGIC;
          F             :       in      STD_ULOGIC;
          G             :       in      STD_ULOGIC;
          Z             :       out     STD_ULOGIC
        );
end component;

------Component LUT8------
component LUT8
    generic(  INIT      :       std_logic_vector);
    port(
          A             :       in      STD_ULOGIC;
          B             :       in      STD_ULOGIC;
          C             :       in      STD_ULOGIC;
          D             :       in      STD_ULOGIC;
          E             :       in      STD_ULOGIC;
          F             :       in      STD_ULOGIC;
          G             :       in      STD_ULOGIC;
          H             :       in      STD_ULOGIC;
          Z             :       out     STD_ULOGIC
        );
end component;
--
component MULT2
   port(
      A0                             :  in    STD_ULOGIC;
      A1                             :  in    STD_ULOGIC;
      A2                             :  in    STD_ULOGIC;
      A3                             :  in    STD_ULOGIC;
      B0                             :  in    STD_ULOGIC;
      B1                             :  in    STD_ULOGIC;
      B2                             :  in    STD_ULOGIC;
      B3                             :  in    STD_ULOGIC;
      CI                             :  in    STD_ULOGIC;
      P0                             :  out   STD_ULOGIC;
      P1                             :  out   STD_ULOGIC;
      CO                             :  out   STD_ULOGIC);
end component;
--
COMPONENT ODDRXE
    GENERIC (gsr : String := "ENABLED");
PORT(
          d0            :       in      STD_LOGIC;
          d1            :       in      STD_LOGIC;
          sclk          :       in      STD_LOGIC;
          rst           :       in      STD_LOGIC;
          q             :       out     STD_LOGIC);
END COMPONENT;
--
COMPONENT ODDRX2E
    GENERIC (gsr : String := "ENABLED");
PORT(
          d0            :       in      STD_LOGIC;
          d1            :       in      STD_LOGIC;
          d2            :       in      STD_LOGIC;
          d3            :       in      STD_LOGIC;
          eclk          :       in      STD_LOGIC;
          sclk          :       in      STD_LOGIC;
          rst           :       in      STD_LOGIC;
          q             :       out     STD_LOGIC);
END COMPONENT;
--


COMPONENT ODDRX4B
    GENERIC (gsr : String := "ENABLED");
PORT(
          d0            :       in      STD_LOGIC;
          d1            :       in      STD_LOGIC;
          d2            :       in      STD_LOGIC;
          d3            :       in      STD_LOGIC;
          d4            :       in      STD_LOGIC;
          d5            :       in      STD_LOGIC;
          d6            :       in      STD_LOGIC;
          d7            :       in      STD_LOGIC;
          eclk          :       in      STD_LOGIC;
          sclk          :       in      STD_LOGIC;
          rst           :       in      STD_LOGIC;
          q             :       out     STD_LOGIC);
END COMPONENT;

--

COMPONENT ODDRX71A
    GENERIC (gsr : String := "ENABLED");
PORT(
          d0            :       in      STD_LOGIC;
          d1            :       in      STD_LOGIC;
          d2            :       in      STD_LOGIC;
          d3            :       in      STD_LOGIC;
          d4            :       in      STD_LOGIC;
          d5            :       in      STD_LOGIC;
          d6            :       in      STD_LOGIC;
          eclk          :       in      STD_LOGIC;
          sclk          :       in      STD_LOGIC;
          rst           :       in      STD_LOGIC;
          q             :       out     STD_LOGIC);
END COMPONENT;
--
COMPONENT IDDRXE
    GENERIC (gsr : String := "ENABLED");
PORT(
          d             :       in      STD_LOGIC;
          sclk          :       in      STD_LOGIC;
          rst           :       in      STD_LOGIC;
          q0            :       out     STD_LOGIC;
          q1            :       out     STD_LOGIC);
END COMPONENT;
--
COMPONENT IDDRX2E
    GENERIC (gsr : String := "ENABLED");
PORT(
          d             :       in      STD_LOGIC;
          eclk          :       in      STD_LOGIC;
          sclk          :       in      STD_LOGIC;
          alignwd       :       in      STD_LOGIC;
          rst           :       in      STD_LOGIC;
          q0            :       out     STD_LOGIC;
          q1            :       out     STD_LOGIC;
          q2            :       out     STD_LOGIC;
          q3            :       out     STD_LOGIC);
END COMPONENT;
--

COMPONENT IDDRX4B
    GENERIC (gsr : String := "ENABLED");
PORT(
          d             :       in      STD_LOGIC;
          eclk          :       in      STD_LOGIC;
          sclk          :       in      STD_LOGIC;
          alignwd       :       in      STD_LOGIC;
          rst           :       in      STD_LOGIC;
          q0            :       out     STD_LOGIC;
          q1            :       out     STD_LOGIC;
          q2            :       out     STD_LOGIC;
          q3            :       out     STD_LOGIC;
          q4            :       out     STD_LOGIC;
          q5            :       out     STD_LOGIC;
          q6            :       out     STD_LOGIC;
          q7            :       out     STD_LOGIC);
END COMPONENT;

COMPONENT IDDRX71A
    GENERIC (gsr : String := "ENABLED");
PORT(
          d             :       in      STD_LOGIC;
          eclk          :       in      STD_LOGIC;
          sclk          :       in      STD_LOGIC;
          alignwd       :       in      STD_LOGIC;
          rst           :       in      STD_LOGIC;
          q0            :       out     STD_LOGIC;
          q1            :       out     STD_LOGIC;
          q2            :       out     STD_LOGIC;
          q3            :       out     STD_LOGIC;
          q4            :       out     STD_LOGIC;
          q5            :       out     STD_LOGIC;
          q6            :       out     STD_LOGIC);
END COMPONENT;
--
COMPONENT DQSDLLC
  generic( DEL_ADJ : string := "PLUS";
           DEL_VAL : integer := 0;
           LOCK_SENSITIVITY : string := "LOW";
           FIN : string := "100";
           gsr : String := "ENABLED";
           FORCE_MAX_DELAY : string := "NO");
  PORT(
          CLK           :       in      STD_ULOGIC;
          RST           :       in      STD_ULOGIC;
          UDDCNTLN      :       in      STD_ULOGIC;
          FREEZE        :       in      STD_ULOGIC;
          LOCK          :       out     STD_ULOGIC;
          DQSDEL        :       out     STD_ULOGIC);
END COMPONENT;
--
COMPONENT delaye
  generic( DEL_MODE : string := "USER_DEFINED";
           DEL_VALUE : string := "DELAY0");
PORT(
      a             : IN std_logic;
      z             : OUT std_logic);
END COMPONENT;

--
COMPONENT clkfbbufa
PORT(
      a             : IN std_logic;
      z             : OUT std_logic);
END COMPONENT;
--
COMPONENT delayd
PORT(
      a             : IN std_logic;
      del0          : IN std_logic;
      del1          : IN std_logic;
      del2          : IN std_logic;
      del3          : IN std_logic;
      del4          : IN std_logic;
      z             : OUT std_logic);
END COMPONENT;
--
COMPONENT dlldelc
  generic( DEL_ADJ : string := "PLUS";
           DEL_VAL : integer := 0);
PORT(
      clki            : IN std_logic;
      dqsdel          : IN std_logic;
      clko            : OUT std_logic);
END COMPONENT;
--
component ECLKSYNCA
    port (ECLKI, STOP : in std_logic;
          ECLKO       : out std_logic);
end component;
--
component ICC
	port (	TXCLK	:   IN std_logic;
			TXREADY :   IN std_logic;
			TXVALID :   IN std_logic;
			TXDATA0 :   IN std_logic;
			TXDATA1 :   IN std_logic;
			TXDATA2 :   IN std_logic;
			TXDATA3 :   IN std_logic;
			TXDATA4 :   IN std_logic;
			TXDATA5 :   IN std_logic;
			TXDATA6 :   IN std_logic;
			TXDATA7 :   IN std_logic;
			INT     :   IN std_logic;
			AUX     :   IN std_logic;
			TXVIO0  :   IN std_logic;
			TXVIO1  :	IN std_logic;
			RXVIO0  :	OUT std_logic;
			RXVIO1  :	OUT std_logic;
			RXCLK   :   OUT std_logic;
			RXREADY :   OUT std_logic;
			RXVALID :   OUT std_logic;
			RXDATA0 :   OUT std_logic;
			RXDATA1 :   OUT std_logic;
			RXDATA2 :   OUT std_logic;
			RXDATA3 :   OUT std_logic;
			RXDATA4 :   OUT std_logic;
			RXDATA5 :   OUT std_logic;
			RXDATA6 :   OUT std_logic;
			RXDATA7 :   OUT std_logic
			);
end component;
--
COMPONENT ICC1
	port (	PFRPRMN	:   IN std_logic;
			PFRJTAGEN :   IN std_logic;
			PFRMCLKO :   IN std_logic;
			PFRMCLKOE :	IN std_logic;
			PFRMOSIO :	IN std_logic;
			PFRMOSIOE :	IN std_logic;
			PFRMISOO :	IN std_logic;
			PFRMISOOE :	IN std_logic;
			PFRCSNO :	IN std_logic;
			PFRCSNOE :	IN std_logic;
			PFRMCSN :	OUT std_logic;
			PFRMCLKI :	OUT std_logic;
			PFRMOSII :	OUT std_logic;
			PFRMISOI :	OUT std_logic;
			PFRCSNI :	OUT std_logic);
end component;
--
COMPONENT CLKDIVC
GENERIC(
      GSR         : String  := "DISABLED";
      DIV         : String  := "2.0");
PORT(
        clki             : IN std_logic;
        rst              : IN std_logic;
        alignwd          : IN std_logic;
        cdiv1            : OUT std_logic;
        cdivx            : OUT std_logic);
END COMPONENT;
--
COMPONENT OSCH
GENERIC(
      NOM_FREQ         : String  := "2.08");
PORT(
        STDBY          : IN std_logic;
        OSC, SEDSTDBY  : OUT std_logic);
END COMPONENT;
--
COMPONENT sp8kc
GENERIC(
        DATA_WIDTH   : Integer := 9;
        REGMODE      : String  := "NOREG";
        CSDECODE     : string  := "0b000";
        WRITEMODE    : String  := "NORMAL";
        GSR          : String  := "ENABLED";
        RESETMODE    : String  := "SYNC";
        ASYNC_RESET_RELEASE    : String  := "SYNC";
        INIT_DATA    : String  := "STATIC";
        initval_00 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_01 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_02 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_03 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_04 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_05 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_06 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_07 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_08 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_09 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0a : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0b : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0c : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0d : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0e : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_10 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_11 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_12 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_13 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_14 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_15 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_16 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_17 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_18 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_19 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1a : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1b : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1c : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1d : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1e : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        DI8, DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0         : in std_logic := 'X';
        AD12, AD11, AD10, AD9, AD8, AD7, AD6, AD5           : in std_logic := 'X';
        AD4, AD3,  AD2, AD1, AD0                            : in std_logic := 'X';
        CE, OCE, CLK, WE, CS2, CS1, CS0, RST                : in std_logic := 'X';
        DO8, DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0         : out std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT dp8kc
GENERIC(
        DATA_WIDTH_A : Integer := 9;
        DATA_WIDTH_B : Integer := 9;
        REGMODE_A    : String  := "NOREG";
        REGMODE_B    : String  := "NOREG";
        CSDECODE_A   : string  := "0b000";
        CSDECODE_B   : string  := "0b000";
        WRITEMODE_A  : String  := "NORMAL";
        WRITEMODE_B  : String  := "NORMAL";
        GSR          : String  := "ENABLED";
        RESETMODE    : String  := "SYNC";
        ASYNC_RESET_RELEASE    : String  := "SYNC";
        INIT_DATA    : String  := "STATIC";
        initval_00 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_01 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_02 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_03 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_04 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_05 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_06 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_07 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_08 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_09 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0a : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0b : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0c : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0d : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0e : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_10 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_11 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_12 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_13 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_14 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_15 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_16 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_17 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_18 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_19 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1a : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1b : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1c : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1d : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1e : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000"
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
END COMPONENT;
--
COMPONENT pdpw8kc
GENERIC(
        DATA_WIDTH_W : Integer := 18;
        DATA_WIDTH_R : Integer := 9;
        REGMODE      : String  := "NOREG";
        CSDECODE_W   : string  := "0b000";
        CSDECODE_R   : string  := "0b000";
        GSR          : String  := "ENABLED";
        RESETMODE    : String  := "SYNC";
        ASYNC_RESET_RELEASE    : String  := "SYNC";
        INIT_DATA    : String  := "STATIC";
        initval_00 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_01 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_02 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_03 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_04 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_05 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_06 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_07 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_08 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_09 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0a : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0b : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0c : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0d : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0e : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_0f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_10 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_11 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_12 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_13 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_14 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_15 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_16 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_17 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_18 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_19 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1a : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1b : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1c : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1d : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1e : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_1f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
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
END COMPONENT;
--
COMPONENT fifo8kb
GENERIC(
        DATA_WIDTH_W : Integer := 18;
        DATA_WIDTH_R : Integer := 18;
        REGMODE      : String  := "NOREG";
        CSDECODE_W   : string  := "0b00";
        CSDECODE_R   : string  := "0b00";
        GSR          : String  := "DISABLED";
        RESETMODE    : String  := "ASYNC";
        ASYNC_RESET_RELEASE    : String  := "SYNC";
        AEPOINTER    : String  := "0b00000000000000";
        AEPOINTER1   : String  := "0b00000000000000";
        AFPOINTER    : String  := "0b00000000000000";
        AFPOINTER1   : String  := "0b00000000000000";
        FULLPOINTER  : String  := "0b00000000000000";
        FULLPOINTER1 : String  := "0b00000000000000"
  );
PORT(
        di0, di1, di2, di3, di4, di5, di6, di7, di8            : in std_logic := 'X';
        di9, di10, di11, di12, di13, di14, di15, di16, di17    : in std_logic := 'X';
        csw0, csw1, csr0, csr1, fulli, emptyi                  : in std_logic := 'X';
        we, re, ore, clkw, clkr, rst, rprst                    : in std_logic := 'X';

        do0, do1, do2, do3, do4, do5, do6, do7, do8            : out std_logic := 'X';
        do9, do10, do11, do12, do13, do14, do15, do16, do17    : out std_logic := 'X';
        ef, aef, aff, ff                                       : out std_logic := 'X'
  );
END COMPONENT;
----- cell OSCJ -----
COMPONENT OSCJ
   generic (
      NOM_FREQ : string := "2.08"
   ); 
   port (
      STDBY : in std_ulogic;
      OSC   : out std_ulogic;
      SEDSTDBY : out std_ulogic;
      OSCESB : out std_ulogic 
   );
END COMPONENT;
----- cell BBI3C -----
COMPONENT BBI3C 
   port (
      I,T,RESEN,PULLUPEN : in std_ulogic;
      O : out std_ulogic;
      B : inout std_ulogic
   );
END COMPONENT;
--
COMPONENT BCSLEWRATEA
GENERIC (
   BANKID : string := "0" 
  );
PORT (
   SLEWRATEENI  : in std_ulogic 
  );
END COMPONENT;
--
COMPONENT BCINRD
GENERIC (
   BANKID : Integer := 0
  );
PORT (
   INRDENI  : in std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT BCLVDSO
PORT (
   LVDSENI  : in std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT INRDB
PORT (
   D, E : in std_logic := 'X';
   Q  : out std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LVDSOB
PORT (
   D, E : in std_logic := 'X';
   Q  : out std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT PG
PORT (
   D, E : in std_logic := 'X';
   Q  : out std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT START
PORT (
   STARTCLK  : in std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT JTAGF
GENERIC (
   ER1 : String := "ENABLED";
   ER2 : String := "ENABLED"
  );
PORT (
   TCK, TMS, TDI, JTDO1, JTDO2 : in std_logic := 'X';
   TDO, JTCK, JTDI, JSHIFT, JUPDATE, JRSTN,
   JCE1, JCE2, JRTI1, JRTI2 : out std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT SEDFA
GENERIC (
   SED_CLK_FREQ : String := "3.5";
   CHECKALWAYS : String := "DISABLED";
   DEV_DENSITY : String := "1200L"
  );
PORT (
   SEDSTDBY, SEDENABLE, SEDSTART, SEDFRCERR : in std_logic := 'X';
   SEDERR, SEDDONE, SEDINPROG, SEDCLKOUT  : out std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT SEDFB
PORT (
   SEDERR, SEDDONE, SEDINPROG, SEDCLKOUT  : out std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT PCNTR
GENERIC (
   STDBYOPT : String := "USER_CFG";
   TIMEOUT : String := "BYPASS";
   WAKEUP : String := "USER_CFG";
   POROFF : String := "FALSE";
   BGOFF : String := "FALSE"
  );
PORT (
   CLK, USERTIMEOUT, USERSTDBY, CLRFLAG, CFGWAKE, CFGSTDBY : in std_logic := 'X';
   STDBY, STOP, SFLAG  : out std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ESBA
GENERIC (
	UDS_TRN : String := "00000000000000000000000000000000";
	UDS_TRN_FORMAT : String := "HEX"
	 );
PORT(
	WBDATI31,
	WBDATI30,
	WBDATI29,
	WBDATI28,
	WBDATI27,
	WBDATI26,
	WBDATI25,
	WBDATI24,
	WBDATI23,
	WBDATI22,
	WBDATI21,
	WBDATI20,
	WBDATI19,
	WBDATI18,
	WBDATI17,
	WBDATI16,
	WBDATI15,
	WBDATI14,
	WBDATI13,
	WBDATI12,
	WBDATI11,
	WBDATI10,
	WBDATI9,
	WBDATI8,
	WBDATI7,
	WBDATI6,
	WBDATI5,
	WBDATI4,
	WBDATI3,
	WBDATI2,
	WBDATI1,
	WBDATI0,
	WBSTBI,
	WBCLKI,
	ASFCLKI,
	WBRSTI,
	ASFRESETI,
	WBADRI17,
	WBADRI16,
	WBADRI15,
	WBADRI14,
	WBADRI13,
	WBADRI12,
	WBADRI11,
	WBADRI10,
	WBADRI9,
	WBADRI8,
	WBADRI7,
	WBADRI6,
	WBADRI5,
	WBADRI4,
	WBADRI3,
	WBADRI2,
	WBADRI1,
	WBADRI0,
	WBCYCI,
	WBWEI,
	ASFWRI,
	ASFRDI,
	OSCCLK : IN std_logic := 'X';
	WBDATO31,
	WBDATO30,
	WBDATO29,
	WBDATO28,
	WBDATO27,
	WBDATO26,
	WBDATO25,
	WBDATO24,
	WBDATO23,
	WBDATO22,
	WBDATO21,
	WBDATO20,
	WBDATO19,
	WBDATO18,
	WBDATO17,
	WBDATO16,
	WBDATO15,
	WBDATO14,
	WBDATO13,
	WBDATO12,
	WBDATO11,
	WBDATO10,
	WBDATO9,
	WBDATO8,
	WBDATO7,
	WBDATO6,
	WBDATO5,
	WBDATO4,
	WBDATO3,
	WBDATO2,
	WBDATO1,
	WBDATO0,
	WBACKO,
	ASFFULLO,
	ASFEMPTYO : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT EFBB
GENERIC (
   EFB_I2C1 : String := "DISABLED";
   EFB_I2C2 : String := "DISABLED";
   EFB_SPI : String := "DISABLED";
   EFB_TC : String := "DISABLED";
   EFB_TC_PORTMODE : String := "NO_WB";
   EFB_UFM_BOOT : String := "INT_SINGLE_BOOT_CFG0";
   EFB_UFM : String := "DISABLED";
   EFB_UFM0 : String := "DISABLED";
   EFB_UFM1 : String := "DISABLED";
   EFB_UFM2 : String := "DISABLED";
   EFB_UFM3 : String := "DISABLED";
   EFB_CFG0 : String := "DISABLED";
   EFB_CFG1 : String := "DISABLED";
   EFB_WB_CLK_FREQ : String := "50.0";

   DEV_DENSITY : String := "9400L";
   UFM0_INIT_PAGES : Integer := 0;
   UFM0_INIT_START_PAGE : Integer := 0;
   UFM0_INIT_ALL_ZEROS : String := "ENABLED";
   UFM0_INIT_FILE_NAME : String := "NONE";
   UFM0_INIT_FILE_FORMAT : String := "HEX";

   UFM1_INIT_PAGES : Integer := 0;
   UFM1_INIT_START_PAGE : Integer := 0;
   UFM1_INIT_ALL_ZEROS : String := "ENABLED";
   UFM1_INIT_FILE_NAME : String := "NONE";
   UFM1_INIT_FILE_FORMAT : String := "HEX";

   UFM2_INIT_PAGES : Integer := 0;
   UFM2_INIT_START_PAGE : Integer := 0;
   UFM2_INIT_ALL_ZEROS : String := "ENABLED";
   UFM2_INIT_FILE_NAME : String := "NONE";
   UFM2_INIT_FILE_FORMAT : String := "HEX";

   UFM3_INIT_PAGES : Integer := 0;
   UFM3_INIT_START_PAGE : Integer := 0;
   UFM3_INIT_ALL_ZEROS : String := "ENABLED";
   UFM3_INIT_FILE_NAME : String := "NONE";
   UFM3_INIT_FILE_FORMAT : String := "HEX";

   CFG0_INIT_PAGES : Integer := 0;
   CFG0_INIT_START_PAGE : Integer := 0;
   CFG0_INIT_ALL_ZEROS : String := "ENABLED";
   CFG0_INIT_FILE_NAME : String := "NONE";
   CFG0_INIT_FILE_FORMAT : String := "HEX";

   CFG1_INIT_PAGES : Integer := 0;
   CFG1_INIT_START_PAGE : Integer := 0;
   CFG1_INIT_ALL_ZEROS : String := "ENABLED";
   CFG1_INIT_FILE_NAME : String := "NONE";
   CFG1_INIT_FILE_FORMAT : String := "HEX";

   I2C1_ADDRESSING : String := "7BIT";
   I2C2_ADDRESSING : String := "7BIT";
   I2C1_SLAVE_ADDR : String := "0b1000001";
   I2C2_SLAVE_ADDR : String := "0b1000010";
   I2C1_BUS_PERF : String := "100kHz";
   I2C2_BUS_PERF : String := "100kHz";
   I2C1_CLK_DIVIDER : Integer := 1;
   I2C2_CLK_DIVIDER : Integer := 1;
   I2C1_GEN_CALL : String := "DISABLED";
   I2C2_GEN_CALL : String := "DISABLED";
   I2C1_WAKEUP : String := "DISABLED";
   I2C2_WAKEUP : String := "DISABLED";

   SPI_MODE : String := "SLAVE";
   SPI_CLK_DIVIDER : Integer := 1;
   SPI_LSB_FIRST : String := "DISABLED";
   SPI_CLK_INV : String := "DISABLED";
   SPI_PHASE_ADJ : String := "DISABLED";
   SPI_SLAVE_HANDSHAKE : String := "DISABLED";
   SPI_INTR_TXRDY : String := "DISABLED";
   SPI_INTR_RXRDY : String := "DISABLED";
   SPI_INTR_TXOVR : String := "DISABLED";
   SPI_INTR_RXOVR : String := "DISABLED";
   SPI_WAKEUP : String := "DISABLED";

   TC_MODE : String := "CTCM";
   TC_SCLK_SEL : String := "PCLOCK";
   TC_CCLK_SEL : Integer := 1;
   GSR : String := "ENABLED";
   TC_TOP_SET : Integer := 65535;
   TC_OCR_SET : Integer := 32767;
   TC_OC_MODE : String := "TOGGLE";
   TC_RESETN : String := "ENABLED";
   TC_TOP_SEL : String := "ON";
   TC_OV_INT : String := "OFF";
   TC_OCR_INT : String := "OFF";
   TC_ICR_INT : String := "OFF";
   TC_OVERFLOW : String := "ENABLED";
   TC_ICAPTURE : String := "DISABLED";

   EFB_TAMPER_TYPE_PASSWORD : String := "DISABLED";
   EFB_TAMPER_TYPE_LOCKED_FLASH_SRAM  : String := "DISABLED";
   EFB_TAMPER_TYPE_MANUFACTURE_MODE  : String := "DISABLED";
   EFB_TAMPER_SRC_JTAG : String := "DISABLED";
   EFB_TAMPER_SRC_SSPI  : String := "DISABLED";
   EFB_TAMPER_SRC_SI2C  : String := "DISABLED";
   EFB_TAMPER_SRC_WB  : String := "DISABLED";
   EFB_TAMPER_PORT_LOCK  : String := "DISABLED";
   EFB_TAMPER_DETECTION_RESPONSE  : String := "DISABLED"
   
  );
PORT (
   WBCLKI, WBRSTI, WBCYCI, WBSTBI, WBWEI,
   WBADRI7, WBADRI6, WBADRI5, WBADRI4, WBADRI3, WBADRI2, WBADRI1, WBADRI0,
   WBDATI7, WBDATI6, WBDATI5, WBDATI4, WBDATI3, WBDATI2, WBDATI1, WBDATI0,
   PLL0DATI7, PLL0DATI6, PLL0DATI5, PLL0DATI4, PLL0DATI3, PLL0DATI2, PLL0DATI1, PLL0DATI0, PLL0ACKI,
   PLL1DATI7, PLL1DATI6, PLL1DATI5, PLL1DATI4, PLL1DATI3, PLL1DATI2, PLL1DATI1, PLL1DATI0, PLL1ACKI,
   I2C1SCLI, I2C1SDAI, I2C2SCLI, I2C2SDAI,
   SPISCKI, SPIMISOI, SPIMOSII, SPISCSN,
   TCCLKI, TCRSTN, TCIC, UFMSN, TAMPERDETEN, TAMPERLOCKSRC, TAMPERDETCLK: in std_logic := 'X';
   WBDATO7, WBDATO6, WBDATO5, WBDATO4, WBDATO3, WBDATO2, WBDATO1, WBDATO0, WBACKO,
   PLLCLKO, PLLRSTO, PLL0STBO, PLL1STBO, PLLWEO,
   PLLADRO4, PLLADRO3, PLLADRO2, PLLADRO1, PLLADRO0,
   PLLDATO7, PLLDATO6, PLLDATO5, PLLDATO4, PLLDATO3, PLLDATO2, PLLDATO1, PLLDATO0,
   I2C1SCLO, I2C1SCLOEN, I2C1SDAO, I2C1SDAOEN, I2C2SCLO, I2C2SCLOEN, I2C2SDAO, I2C2SDAOEN, I2C1IRQO, I2C2IRQO,
   SPISCKO, SPISCKEN, SPIMISOO, SPIMISOEN, SPIMOSIO, SPIMOSIEN,
   SPIMCSN0, SPIMCSN1, SPIMCSN2, SPIMCSN3, SPIMCSN4, SPIMCSN5, SPIMCSN6, SPIMCSN7, SPICSNEN, SPIIRQO,
   TCINT, TCOC, WBCUFMIRQ, CFGWAKE, CFGSTDBY, TAMPERDET, TAMPERTYPE0, TAMPERTYPE1, TAMPERSRC0, TAMPERSRC1: out std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT EFB
GENERIC (
   EFB_I2C1 : String := "DISABLED";
   EFB_I2C2 : String := "DISABLED";
   EFB_SPI : String := "DISABLED";
   EFB_TC : String := "DISABLED";
   EFB_TC_PORTMODE : String := "NO_WB";
   EFB_UFM : String := "DISABLED";
   EFB_WB_CLK_FREQ : String := "50.0";

   DEV_DENSITY : String := "1200L";
   UFM_INIT_PAGES : Integer := 0;
   UFM_INIT_START_PAGE : Integer := 0;
   UFM_INIT_ALL_ZEROS : String := "ENABLED";
   UFM_INIT_FILE_NAME : String := "NONE";
   UFM_INIT_FILE_FORMAT : String := "HEX";

   I2C1_ADDRESSING : String := "7BIT";
   I2C2_ADDRESSING : String := "7BIT";
   I2C1_SLAVE_ADDR : String := "0b1000001";
   I2C2_SLAVE_ADDR : String := "0b1000010";
   I2C1_BUS_PERF : String := "100kHz";
   I2C2_BUS_PERF : String := "100kHz";
   I2C1_CLK_DIVIDER : Integer := 1;
   I2C2_CLK_DIVIDER : Integer := 1;
   I2C1_GEN_CALL : String := "DISABLED";
   I2C2_GEN_CALL : String := "DISABLED";
   I2C1_WAKEUP : String := "DISABLED";
   I2C2_WAKEUP : String := "DISABLED";

   SPI_MODE : String := "SLAVE";
   SPI_CLK_DIVIDER : Integer := 1;
   SPI_LSB_FIRST : String := "DISABLED";
   SPI_CLK_INV : String := "DISABLED";
   SPI_PHASE_ADJ : String := "DISABLED";
   SPI_SLAVE_HANDSHAKE : String := "DISABLED";
   SPI_INTR_TXRDY : String := "DISABLED";
   SPI_INTR_RXRDY : String := "DISABLED";
   SPI_INTR_TXOVR : String := "DISABLED";
   SPI_INTR_RXOVR : String := "DISABLED";
   SPI_WAKEUP : String := "DISABLED";

   TC_MODE : String := "CTCM";
   TC_SCLK_SEL : String := "PCLOCK";
   TC_CCLK_SEL : Integer := 1;
   GSR : String := "ENABLED";
   TC_TOP_SET : Integer := 65535;
   TC_OCR_SET : Integer := 32767;
   TC_OC_MODE : String := "TOGGLE";
   TC_RESETN : String := "ENABLED";
   TC_TOP_SEL : String := "ON";
   TC_OV_INT : String := "OFF";
   TC_OCR_INT : String := "OFF";
   TC_ICR_INT : String := "OFF";
   TC_OVERFLOW : String := "ENABLED";
   TC_ICAPTURE : String := "DISABLED"
  );
PORT (
   WBCLKI, WBRSTI, WBCYCI, WBSTBI, WBWEI,
   WBADRI7, WBADRI6, WBADRI5, WBADRI4, WBADRI3, WBADRI2, WBADRI1, WBADRI0,
   WBDATI7, WBDATI6, WBDATI5, WBDATI4, WBDATI3, WBDATI2, WBDATI1, WBDATI0,
   PLL0DATI7, PLL0DATI6, PLL0DATI5, PLL0DATI4, PLL0DATI3, PLL0DATI2, PLL0DATI1, PLL0DATI0, PLL0ACKI,
   PLL1DATI7, PLL1DATI6, PLL1DATI5, PLL1DATI4, PLL1DATI3, PLL1DATI2, PLL1DATI1, PLL1DATI0, PLL1ACKI,
   I2C1SCLI, I2C1SDAI, I2C2SCLI, I2C2SDAI,
   SPISCKI, SPIMISOI, SPIMOSII, SPISCSN,
   TCCLKI, TCRSTN, TCIC, UFMSN : in std_logic := 'X';
   WBDATO7, WBDATO6, WBDATO5, WBDATO4, WBDATO3, WBDATO2, WBDATO1, WBDATO0, WBACKO,
   PLLCLKO, PLLRSTO, PLL0STBO, PLL1STBO, PLLWEO,
   PLLADRO4, PLLADRO3, PLLADRO2, PLLADRO1, PLLADRO0,
   PLLDATO7, PLLDATO6, PLLDATO5, PLLDATO4, PLLDATO3, PLLDATO2, PLLDATO1, PLLDATO0,
   I2C1SCLO, I2C1SCLOEN, I2C1SDAO, I2C1SDAOEN, I2C2SCLO, I2C2SCLOEN, I2C2SDAO, I2C2SDAOEN, I2C1IRQO, I2C2IRQO,
   SPISCKO, SPISCKEN, SPIMISOO, SPIMISOEN, SPIMOSIO, SPIMOSIEN,
   SPIMCSN0, SPIMCSN1, SPIMCSN2, SPIMCSN3, SPIMCSN4, SPIMCSN5, SPIMCSN6, SPIMCSN7, SPICSNEN, SPIIRQO,
   TCINT, TCOC, WBCUFMIRQ, CFGWAKE, CFGSTDBY : out std_logic := 'X'
  );
END COMPONENT;
--
end Components;

package body Components is
    function str2std(L: string) return std_logic_vector is
        variable vpos : integer := 0;   -- Index of last valid bit in val.
        variable lpos : integer;        -- Index of next unused char in L.
        variable val  : std_logic_vector(1 to L'right); -- lenth of the vector.
    begin
            lpos := L'left;
            while lpos <= L'right and vpos < VAL'length loop
                if L(lpos) = '0' then
                    vpos := vpos + 1;
                    val(vpos) := '0';
                elsif L(lpos) = '1' then
                    vpos := vpos + 1;
                    val(vpos) := '1';
                else
                    exit;       -- Bit values must be '0' or '1'.
                end if;
                lpos := lpos + 1;
            end loop;
        return val;
    end str2std;

 function str2int( L : string) return integer is
        variable ok:         boolean;
        variable pos:        integer:=1;
        variable sign: integer := 1;
        variable rval: integer := 0;
        variable value: integer := 0;
    begin
        ok := FALSE;
        if pos < L'right and (L(pos) = '-' or L(pos) = '+') then
            if L(pos) = '-' then
                sign := -1;
            end if;
            pos := pos + 1;
        end if;

        -- Once the optional leading sign is removed, an integer can
        --   contain only the digits '0' through '9' and the '_'
        --   (underscore) character.  VHDL disallows two successive
        --   underscores, and leading or trailing underscores.

        if pos <= L'right and L(pos) >= '0' and L(pos) <= '9' then
            while pos <= L'right loop
                if L(pos) >= '0' and L(pos) <= '9' then
                    rval := rval * 10
                            + character'pos(L(pos)) - character'pos('0');
                    ok := TRUE;
                elsif L(pos) = '_' then
                    if pos = L'right
                    or L(pos + 1) < '0'
                    or L(pos + 1) > '9' then
                        ok := FALSE;
                        exit;
                    end if;
                else
                    exit;
                end if;
                pos := pos + 1;
            end loop;
        end if;

        value := sign * rval;
        RETURN(value);
    end str2int;

    function str2real( L: string) return real is
        variable pos:        integer;
        variable value:      real;
        variable ok:         boolean;
        variable sign:       real := 1.0;
        variable rval:       real := 0.0;
        variable powerten:   real := 0.1;

        begin

        pos := L'left;
        if (pos <= L'right) and (L(pos) = '-') then
            sign := -1.0;
            pos := pos + 1;
        end if;

            ok := FALSE;
            rval := 0.0;
            if pos <= L'right and L(pos) >= '0' and L(pos) <= '9' then
                while pos <= L'right and L(pos) /= '.' and L(pos) /= ' ' and L(pos) /= HT
  loop
                    if L(pos) >= '0' and L(pos) <= '9' then
                        rval := rval*10.0 + real(character'pos(L(pos)) - character'pos('0'));
                        pos := pos+1;
                        ok := true;
                    else
                        ok := false;
                        exit;
                    end if;
                end loop;
            end if;

            if ok and pos <= L'right and L(pos) = '.' then
            pos := pos + 1;
            end if;

            if pos <= L'right then
               while pos <= L'right and ((L(pos) >= '0' and L(pos) <= '9') or L(pos) = '_') loop
                       rval := rval + (real(character'pos(L(pos))-character'pos('0'))*powerten);
                       powerten := powerten*0.1;
                      pos := pos+1;
                     ok := true;
            end loop;
        end if;

        if ok then
            value := rval * sign;
        end if;
        return (value);
      end str2real;

  function INT2VEC(INT: INTEGER; BWIDTH: INTEGER) RETURN STD_LOGIC_VECTOR is

     variable result : STD_LOGIC_VECTOR (BWIDTH-1 downto 0);
     variable tmp : integer := INT;
  begin
     tmp := INT;
     for i in 0 to BWIDTH-1 loop
         if (tmp mod 2) = 1 then
              result(i) := '1';
         else
              result(i) := '0';
         end if;
         if tmp > 0 then
             tmp := tmp /2 ;
         elsif (tmp > integer'low) then
             tmp := (tmp-1) / 2;
         else
             tmp := tmp / 2;
         end if;
     end loop;
     return result;
  end;

  function VEC2INT(v: std_logic_vector) return integer is
      variable result: integer := 0;
      variable addition: integer := 1;
  begin
      for b in v'reverse_range loop
         if v(b) = '1' then
            result := result + addition;
         end if;
         addition := addition * 2;
      end loop;
      return result;
  end VEC2INT;

  function VECX              (VECT: std_logic_vector) return boolean is
   begin
      for b in VECT'range loop
         if bitX (VECT (b)) then
            return true;
         end if;
      end loop;
      return false;
   end VECX;

  function TSCOMP(VECT: STD_LOGIC_VECTOR ) RETURN STD_LOGIC_VECTOR is
    variable result : STD_LOGIC_VECTOR (VECT'left downto 0);
    variable is1 : std_ulogic := '0';
  begin
    for i in 0 to VECT'left loop
      if (is1 = '0') then
        result(i) := VECT(i);
        if (VECT(i) = '1' ) then
           is1 := '1';
        end if;
      else
        result(i) := NOT VECT(i);
      end if;
    end loop;
    return result;
  end;

  function ADDVECT(A, B: STD_LOGIC_VECTOR ) RETURN STD_LOGIC_VECTOR is

    variable cout: STD_ULOGIC;
    variable BVect, result: STD_LOGIC_VECTOR(A'left downto 0);

  begin
    for i in 0 to A'left loop
    if (A(i) = 'X') then
       result := (others => 'X');
       return(result);
    end if;
    end loop;
    for i in 0 to B'left loop
    if (B(i) = 'X') then
       result := (others => 'X');
       return(result);
    end if;
    end loop;

    cout := '0';
    BVEct := B;

    for i in 0 to A'left loop
      result(i) := A(i) xor BVect(i) xor cout;
      cout := (A(i) and BVect(i)) or
              (A(i) and cout) or
              (cout and BVect(i));
    end loop;
    return result;
  end;

  function SUBVECT(A, B: STD_LOGIC_VECTOR ) RETURN STD_LOGIC_VECTOR is

    variable cout: STD_ULOGIC;
    variable result: STD_LOGIC_VECTOR(A'left downto 0);

  begin
    for i in 0 to A'left loop
    if (A(i) = 'X') then
       result := (others => 'X');
       return(result);
    end if;
    end loop;
    for i in 0 to B'left loop
    if (B(i) = 'X') then
       result := (others => 'X');
       return(result);
    end if;
    end loop;

    cout := '1';

    for i in 0 to A'left loop
      result(i) := A(i) xor not B(i) xor cout;
      cout := (A(i) and not B(i)) or
              (A(i) and cout) or
              (cout and not B(i));
    end loop;
    return result;
  end;

  function BITX              (VECT: std_logic) return boolean is
   begin
      case VECT is
         when 'X'    => return true;
         when others => return false;
      end case;
   end BITX;

PROCEDURE mem_initialize (CLKI_DIV : in Integer; CLKFB_DIV : in Integer;
   CLKOP_DIV : in Integer; CLKOS_DIV : in Integer; CLKOS2_DIV : in Integer;
   CLKOS3_DIV : in Integer; CLKOP_ENABLE : in string; CLKOS_ENABLE : in string;
   CLKOS2_ENABLE : in string; CLKOS3_ENABLE : in string; CLKOP_FPHASE : in Integer;
   CLKOP_CPHASE : in Integer; CLKOS_FPHASE : in Integer; CLKOS_CPHASE : in Integer;
   CLKOS2_FPHASE : in Integer;
   CLKOS2_CPHASE : in Integer;
   CLKOS3_FPHASE : in Integer;
   CLKOS3_CPHASE : in Integer;
   CLKOP_TRIM_POL : in string;
   CLKOS_TRIM_POL : in string;
   CLKOP_TRIM_DELAY : in Integer;
   CLKOS_TRIM_DELAY : in Integer;
   VCO_BYPASS_A0 : in string;
   VCO_BYPASS_B0 : in string;
   VCO_BYPASS_C0 : in string;
   VCO_BYPASS_D0 : in string;
   PREDIVIDER_MUXA1 : in Integer;
   PREDIVIDER_MUXB1 : in Integer;
   PREDIVIDER_MUXC1 : in Integer;
   PREDIVIDER_MUXD1 : in Integer;
   OUTDIVIDER_MUXA2 : in string;
   OUTDIVIDER_MUXB2 : in string;
   OUTDIVIDER_MUXC2 : in string;
   OUTDIVIDER_MUXD2 : in string;
   STDBY_ENABLE : in string;
   PLLRST_ENA     : in string;
   MRST_ENA     : in string;
   DCRST_ENA     : in string;
   DDRST_ENA     : in string;
   FRACN_ENABLE     : in string;
   FRACN_DIV     : in Integer;
   signal MEM : out std_logic_vector(231 downto 0)) IS

   BEGIN
      MEM(166 downto 160) <= conv_std_logic_vector((CLKI_DIV - 1), 7);
      MEM(174 downto 168) <= conv_std_logic_vector((CLKFB_DIV - 1), 7);
      MEM(54 downto 48) <= conv_std_logic_vector((CLKOP_DIV - 1), 7);
      MEM(62 downto 56) <= conv_std_logic_vector((CLKOS_DIV - 1), 7);
      MEM(70 downto 64) <= conv_std_logic_vector((CLKOS2_DIV - 1), 7);
      MEM(78 downto 72) <= conv_std_logic_vector((CLKOS3_DIV - 1), 7);

      IF (PLLRST_ENA = "ENABLED") THEN
         MEM(63) <= '1';
      ELSIF (PLLRST_ENA = "DISABLED") THEN
         MEM(63) <= '0';
      END IF;

      IF (MRST_ENA = "ENABLED") THEN
         MEM(71) <= '1';
      ELSIF (MRST_ENA = "DISABLED") THEN
         MEM(71) <= '0';
      END IF;

      IF (DCRST_ENA = "ENABLED") THEN
         MEM(95) <= '1';
      ELSIF (DCRST_ENA = "DISABLED") THEN
         MEM(95) <= '0';
      END IF;

      IF (DDRST_ENA = "ENABLED") THEN
         MEM(103) <= '1';
      ELSIF (DDRST_ENA = "DISABLED") THEN
         MEM(103) <= '0';
      END IF;

      IF (CLKOP_ENABLE = "ENABLED") THEN
         MEM(128) <= '1';
      ELSIF (CLKOP_ENABLE = "DISABLED") THEN
         MEM(128) <= '0';
      END IF;

      IF (CLKOS_ENABLE = "ENABLED") THEN
         MEM(129) <= '1';
      ELSIF (CLKOS_ENABLE = "DISABLED") THEN
         MEM(129) <= '0';
      END IF;

      IF (CLKOS2_ENABLE = "ENABLED") THEN
         MEM(130) <= '1';
      ELSIF (CLKOS2_ENABLE = "DISABLED") THEN
         MEM(130) <= '0';
      END IF;

      IF (CLKOS3_ENABLE = "ENABLED") THEN
         MEM(131) <= '1';
      ELSIF (CLKOS3_ENABLE = "DISABLED") THEN
         MEM(131) <= '0';
      END IF;

      MEM(82 downto 80) <= conv_std_logic_vector((CLKOP_FPHASE), 3);
      MEM(22 downto 16) <= conv_std_logic_vector((CLKOP_CPHASE), 7);
      MEM(86 downto 84) <= conv_std_logic_vector((CLKOS_FPHASE), 3);
      MEM(30 downto 24) <= conv_std_logic_vector((CLKOS_CPHASE), 7);
      MEM(90 downto 88) <= conv_std_logic_vector((CLKOS2_FPHASE), 3);
      MEM(38 downto 32) <= conv_std_logic_vector((CLKOS2_CPHASE), 7);
      MEM(94 downto 92) <= conv_std_logic_vector((CLKOS3_FPHASE), 3);
      MEM(46 downto 40) <= conv_std_logic_vector((CLKOS3_CPHASE), 7);


      IF (CLKOP_TRIM_POL = "RISING") THEN
         MEM(127) <= '1';
      ELSIF (CLKOP_TRIM_POL = "FALLING") THEN
         MEM(127) <= '0';
      END IF;

     MEM(126 downto 124) <= conv_std_logic_vector((CLKOP_TRIM_DELAY), 3);

      IF (CLKOS_TRIM_POL = "RISING") THEN
         MEM(123) <= '1';
      ELSIF (CLKOS_TRIM_POL = "FALLING") THEN
         MEM(123) <= '0';
      END IF;
                                                                                              
     MEM(122 downto 120) <= conv_std_logic_vector((CLKOS_TRIM_DELAY), 3);

      IF (VCO_BYPASS_A0 = "DISABLED") THEN
         MEM(208) <= '1';
      END IF;

      IF (VCO_BYPASS_B0 = "DISABLED") THEN
         MEM(209) <= '1';
      END IF;

      IF (VCO_BYPASS_C0 = "DISABLED") THEN
         MEM(210) <= '1';
      END IF;

      IF (VCO_BYPASS_D0 = "DISABLED") THEN
         MEM(211) <= '1';
      END IF;

     MEM(119 downto 118) <= conv_std_logic_vector((PREDIVIDER_MUXA1), 2);
     MEM(117 downto 116) <= conv_std_logic_vector((PREDIVIDER_MUXB1), 2);
     MEM(115 downto 114) <= conv_std_logic_vector((PREDIVIDER_MUXC1), 2);
     MEM(113 downto 112) <= conv_std_logic_vector((PREDIVIDER_MUXD1), 2);

      IF (OUTDIVIDER_MUXA2 = "DIVA") THEN
         MEM(98 downto 96) <= "000";
      ELSIF (OUTDIVIDER_MUXA2 = "DIVB") THEN
         MEM(98 downto 96) <= "001";
      ELSIF (OUTDIVIDER_MUXA2 = "DIVC") THEN
         MEM(98 downto 96) <= "010";
      ELSIF (OUTDIVIDER_MUXA2 = "DIVD") THEN
         MEM(98 downto 96) <= "011";
      ELSIF (OUTDIVIDER_MUXA2 = "REFCLK") THEN
         MEM(98 downto 96) <= "100";
      END IF;

      IF (OUTDIVIDER_MUXB2 = "DIVB") THEN
         MEM(102 downto 100) <= "000";
      ELSIF (OUTDIVIDER_MUXB2 = "DIVC") THEN
         MEM(102 downto 100) <= "001";
      ELSIF (OUTDIVIDER_MUXB2 = "DIVD") THEN
         MEM(102 downto 100) <= "010";
      ELSIF (OUTDIVIDER_MUXB2 = "DIVA") THEN
         MEM(102 downto 100) <= "011";
      ELSIF (OUTDIVIDER_MUXB2 = "REFCLK") THEN
         MEM(102 downto 100) <= "100";
      END IF;

      IF (OUTDIVIDER_MUXC2 = "DIVC") THEN
         MEM(109 downto 107) <= "000";
      ELSIF (OUTDIVIDER_MUXC2 = "DIVD") THEN
         MEM(109 downto 107) <= "001";
      ELSIF (OUTDIVIDER_MUXC2 = "DIVA") THEN
         MEM(109 downto 107) <= "010";
      ELSIF (OUTDIVIDER_MUXC2 = "DIVB") THEN
         MEM(109 downto 107) <= "011";
      ELSIF (OUTDIVIDER_MUXC2 = "REFCLK") THEN
         MEM(109 downto 107) <= "100";
      END IF;

      IF (OUTDIVIDER_MUXD2 = "DIVD") THEN
         MEM(106 downto 104) <= "000";
      ELSIF (OUTDIVIDER_MUXD2 = "DIVA") THEN
         MEM(106 downto 104) <= "001";
      ELSIF (OUTDIVIDER_MUXD2 = "DIVB") THEN
         MEM(106 downto 104) <= "010";
      ELSIF (OUTDIVIDER_MUXD2 = "DIVC") THEN
         MEM(106 downto 104) <= "011";
      ELSIF (OUTDIVIDER_MUXD2 = "REFCLK") THEN
         MEM(106 downto 104) <= "100";
      END IF;

      IF (STDBY_ENABLE = "ENABLED") THEN
         MEM(79) <= '1';
      END IF;

      IF (FRACN_ENABLE = "ENABLED") THEN
         MEM(47) <= '1';
      END IF;

      MEM(15 downto 0) <= conv_std_logic_vector((FRACN_DIV), 16);

      MEM(23) <= '0', '1' after 1.0 ns, '0' after 5.0 ns;

   END mem_initialize;

END components;
