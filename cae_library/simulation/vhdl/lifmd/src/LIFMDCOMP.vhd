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
-- Simulation Library File for LIFMD
--
-- $Header: 
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

   signal MEM : out std_logic_vector(231 downto 0));

-- 
COMPONENT CCU2C
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
COMPONENT l6mux21
PORT(
        d0: IN std_logic := 'X';
        d1: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        z : OUT std_logic := 'X'
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
COMPONENT obz
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
--
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
--
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
--
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
--
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
COMPONENT MULT9X9C
GENERIC (
   REG_INPUTA_CLK	 : String := "NONE";
   REG_INPUTA_CE	 : String := "CE0";
   REG_INPUTA_RST	 : String := "RST0";
   REG_INPUTB_CLK	 : String := "NONE";
   REG_INPUTB_CE	 : String := "CE0";
   REG_INPUTB_RST	 : String := "RST0";
   REG_PIPELINE_CLK	 : String := "NONE";
   REG_PIPELINE_CE	 : String := "CE0";
   REG_PIPELINE_RST	 : String := "RST0";
   REG_OUTPUT_CLK	 : String := "NONE";
   REG_OUTPUT_CE	 : String := "CE0";
   REG_OUTPUT_RST	 : String := "RST0";
   GSR	 : String := "ENABLED";
   CAS_MATCH_REG	 : String := "FALSE";
   MULT_BYPASS	 : String := "DISABLED";
   RESETMODE	 : String := "SYNC" );
PORT (
   A8,A7,A6,A5,A4,A3,A2,A1,A0,
   B8,B7,B6,B5,B4,B3,B2,B1,B0,
   SIGNEDA, SIGNEDB, SOURCEA, SOURCEB,
   CLK3,CLK2,CLK1,CLK0,CE3,CE2,CE1,CE0,RST3,RST2,RST1,RST0,
   SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,
   SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0 : IN std_logic := 'X';
   SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,
   SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,
   ROA8,ROA7,ROA6,ROA5,ROA4,ROA3,ROA2,ROA1,ROA0,
   ROB8,ROB7,ROB6,ROB5,ROB4,ROB3,ROB2,ROB1,ROB0,
   P17,P16,P15,P14,P13,P12,P11,P10,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0,
   SIGNEDP  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT MULT9X9D
GENERIC (
   REG_INPUTA_CLK	 : String := "NONE";
   REG_INPUTA_CE	 : String := "CE0";
   REG_INPUTA_RST	 : String := "RST0";
   REG_INPUTB_CLK	 : String := "NONE";
   REG_INPUTB_CE	 : String := "CE0";
   REG_INPUTB_RST	 : String := "RST0";
   REG_INPUTC_CLK	 : String := "NONE";
   REG_INPUTC_CE	 : String := "CE0";
   REG_INPUTC_RST	 : String := "RST0";
   REG_PIPELINE_CLK	 : String := "NONE";
   REG_PIPELINE_CE	 : String := "CE0";
   REG_PIPELINE_RST	 : String := "RST0";
   REG_OUTPUT_CLK	 : String := "NONE";
   REG_OUTPUT_CE	 : String := "CE0";
   REG_OUTPUT_RST	 : String := "RST0";
   CLK0_DIV	 : String := "ENABLED";
   CLK1_DIV	 : String := "ENABLED";
   CLK2_DIV	 : String := "ENABLED";
   CLK3_DIV	 : String := "ENABLED";
   HIGHSPEED_CLK	 : String := "NONE";
   GSR	 : String := "ENABLED";
   CAS_MATCH_REG	 : String := "FALSE";
   SOURCEB_MODE	 : String := "B_SHIFT";
   MULT_BYPASS	 : String := "DISABLED";
   RESETMODE	 : String := "SYNC" );
PORT (
   A8,A7,A6,A5,A4,A3,A2,A1,A0,
   B8,B7,B6,B5,B4,B3,B2,B1,B0,
   C8,C7,C6,C5,C4,C3,C2,C1,C0,
   SIGNEDA, SIGNEDB, SOURCEA, SOURCEB,
   CLK3,CLK2,CLK1,CLK0,CE3,CE2,CE1,CE0,RST3,RST2,RST1,RST0,
   SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,
   SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0 : IN std_logic := 'X';
   SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,
   SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,
   ROA8,ROA7,ROA6,ROA5,ROA4,ROA3,ROA2,ROA1,ROA0,
   ROB8,ROB7,ROB6,ROB5,ROB4,ROB3,ROB2,ROB1,ROB0,
   ROC8,ROC7,ROC6,ROC5,ROC4,ROC3,ROC2,ROC1,ROC0,
   P17,P16,P15,P14,P13,P12,P11,P10,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0,
   SIGNEDP  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT MULT18X18C
GENERIC (
   REG_INPUTA_CLK	 : String := "NONE";
   REG_INPUTA_CE	 : String := "CE0";
   REG_INPUTA_RST	 : String := "RST0";
   REG_INPUTB_CLK	 : String := "NONE";
   REG_INPUTB_CE	 : String := "CE0";
   REG_INPUTB_RST	 : String := "RST0";
   REG_PIPELINE_CLK	 : String := "NONE";
   REG_PIPELINE_CE	 : String := "CE0";
   REG_PIPELINE_RST	 : String := "RST0";
   REG_OUTPUT_CLK	 : String := "NONE";
   REG_OUTPUT_CE	 : String := "CE0";
   REG_OUTPUT_RST	 : String := "RST0";
   CAS_MATCH_REG	 : String := "FALSE";
   MULT_BYPASS	 : String := "DISABLED";
   GSR	 : String := "ENABLED";
   RESETMODE	 : String := "SYNC" );
PORT (
   A17,A16,A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0,
   B17,B16,B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0,
   SIGNEDA, SIGNEDB, SOURCEA, SOURCEB,
   CLK3,CLK2,CLK1,CLK0,CE3,CE2,CE1,CE0,RST3,RST2,RST1,RST0,
   SRIA17,SRIA16,SRIA15,SRIA14,SRIA13,SRIA12,SRIA11,SRIA10,SRIA9,
   SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,
   SRIB17,SRIB16,SRIB15,SRIB14,SRIB13,SRIB12,SRIB11,SRIB10,SRIB9,
   SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0 : IN std_logic := 'X';
   SROA17,SROA16,SROA15,SROA14,SROA13,SROA12,SROA11,SROA10,SROA9,
   SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,
   SROB17,SROB16,SROB15,SROB14,SROB13,SROB12,SROB11,SROB10,SROB9,
   SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,
   ROA17,ROA16,ROA15,ROA14,ROA13,ROA12,ROA11,ROA10,ROA9,
   ROA8,ROA7,ROA6,ROA5,ROA4,ROA3,ROA2,ROA1,ROA0,
   ROB17,ROB16,ROB15,ROB14,ROB13,ROB12,ROB11,ROB10,ROB9,
   ROB8,ROB7,ROB6,ROB5,ROB4,ROB3,ROB2,ROB1,ROB0,
   P35,P34,P33,P32,P31,P30,P29,P28,P27,P26,P25,P24,P23,P22,P21,P20,P19,P18,
   P17,P16,P15,P14,P13,P12,P11,P10,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0,
   SIGNEDP  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT MULT18X18D
GENERIC (
   REG_INPUTA_CLK	 : String := "NONE";
   REG_INPUTA_CE	 : String := "CE0";
   REG_INPUTA_RST	 : String := "RST0";
   REG_INPUTB_CLK	 : String := "NONE";
   REG_INPUTB_CE	 : String := "CE0";
   REG_INPUTB_RST	 : String := "RST0";
   REG_INPUTC_CLK	 : String := "NONE";
   REG_INPUTC_CE	 : String := "CE0";
   REG_INPUTC_RST	 : String := "RST0";
   REG_PIPELINE_CLK	 : String := "NONE";
   REG_PIPELINE_CE	 : String := "CE0";
   REG_PIPELINE_RST	 : String := "RST0";
   REG_OUTPUT_CLK	 : String := "NONE";
   REG_OUTPUT_CE	 : String := "CE0";
   REG_OUTPUT_RST	 : String := "RST0";
   CLK0_DIV	 : String := "ENABLED";
   CLK1_DIV	 : String := "ENABLED";
   CLK2_DIV	 : String := "ENABLED";
   CLK3_DIV	 : String := "ENABLED";
   HIGHSPEED_CLK	 : String := "NONE";
   GSR	 : String := "ENABLED";
   CAS_MATCH_REG	 : String := "FALSE";
   SOURCEB_MODE	 : String := "B_SHIFT";
   MULT_BYPASS	 : String := "DISABLED";
   RESETMODE	 : String := "SYNC" );
PORT (
   A17,A16,A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0,
   B17,B16,B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0,
   C17,C16,C15,C14,C13,C12,C11,C10,C9,C8,C7,C6,C5,C4,C3,C2,C1,C0,
   SIGNEDA, SIGNEDB, SOURCEA, SOURCEB,
   CLK3,CLK2,CLK1,CLK0,CE3,CE2,CE1,CE0,RST3,RST2,RST1,RST0,
   SRIA17,SRIA16,SRIA15,SRIA14,SRIA13,SRIA12,SRIA11,SRIA10,SRIA9,
   SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,
   SRIB17,SRIB16,SRIB15,SRIB14,SRIB13,SRIB12,SRIB11,SRIB10,SRIB9,
   SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0 : IN std_logic := 'X';
   SROA17,SROA16,SROA15,SROA14,SROA13,SROA12,SROA11,SROA10,SROA9,
   SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,
   SROB17,SROB16,SROB15,SROB14,SROB13,SROB12,SROB11,SROB10,SROB9,
   SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,
   ROA17,ROA16,ROA15,ROA14,ROA13,ROA12,ROA11,ROA10,ROA9,
   ROA8,ROA7,ROA6,ROA5,ROA4,ROA3,ROA2,ROA1,ROA0,
   ROB17,ROB16,ROB15,ROB14,ROB13,ROB12,ROB11,ROB10,ROB9,
   ROB8,ROB7,ROB6,ROB5,ROB4,ROB3,ROB2,ROB1,ROB0,
   ROC17,ROC16,ROC15,ROC14,ROC13,ROC12,ROC11,ROC10,ROC9,
   ROC8,ROC7,ROC6,ROC5,ROC4,ROC3,ROC2,ROC1,ROC0,
   P35,P34,P33,P32,P31,P30,P29,P28,P27,P26,P25,P24,P23,P22,P21,P20,P19,P18,
   P17,P16,P15,P14,P13,P12,P11,P10,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0,
   SIGNEDP  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT ALU24A
GENERIC (
   REG_OUTPUT_CLK	 : String := "NONE";
   REG_OUTPUT_CE	 : String := "CE0";
   REG_OUTPUT_RST	 : String := "RST0";
   REG_OPCODE_0_CLK	 : String := "NONE";
   REG_OPCODE_0_CE	 : String := "CE0";
   REG_OPCODE_0_RST	 : String := "RST0";
   REG_OPCODE_1_CLK	 : String := "NONE";
   REG_OPCODE_1_CE	 : String := "CE0";
   REG_OPCODE_1_RST	 : String := "RST0";
   GSR	 : String := "ENABLED";
   RESETMODE	 : String := "SYNC" );
PORT (
   CE3,CE2,CE1,CE0,CLK3,CLK2,CLK1,CLK0,RST3,RST2,RST1,RST0,SIGNEDIA,SIGNEDIB,
   MA17,MA16,MA15,MA14,MA13,MA12,MA11,MA10,MA9,MA8,MA7,MA6,MA5,MA4,MA3,MA2,MA1,MA0,
   MB17,MB16,MB15,MB14,MB13,MB12,MB11,MB10,MB9,MB8,MB7,MB6,MB5,MB4,MB3,MB2,MB1,MB0,
   CIN23,CIN22,CIN21,CIN20,CIN19,CIN18,CIN17,CIN16,CIN15,CIN14,
   CIN13,CIN12,CIN11,CIN10,CIN9,CIN8,CIN7,CIN6,CIN5,CIN4,CIN3,CIN2,CIN1,CIN0,
   OPADDNSUB, OPCINSEL : IN std_logic := 'X';
   R23,R22,R21,R20,R19,R18,
   R17,R16,R15,R14,R13,R12,R11,R10,R9,R8,R7,R6,R5,R4,R3,R2,R1,R0  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT ALU54A
GENERIC (
   REG_INPUTC0_CLK	 : String := "NONE";
   REG_INPUTC0_CE	 : String := "CE0";
   REG_INPUTC0_RST	 : String := "RST0";
   REG_INPUTC1_CLK	 : String := "NONE";
   REG_INPUTC1_CE	 : String := "CE0";
   REG_INPUTC1_RST	 : String := "RST0";
   REG_OPCODEOP0_0_CLK	 : String := "NONE";
   REG_OPCODEOP0_0_CE	 : String := "CE0";
   REG_OPCODEOP0_0_RST	 : String := "RST0";
   REG_OPCODEOP1_0_CLK	 : String := "NONE";
   REG_OPCODEOP0_1_CLK	 : String := "NONE";
   REG_OPCODEOP0_1_CE	 : String := "CE0";
   REG_OPCODEOP0_1_RST	 : String := "RST0";
   REG_OPCODEOP1_1_CLK	 : String := "NONE";
   REG_OPCODEIN_0_CLK	 : String := "NONE";
   REG_OPCODEIN_0_CE	 : String := "CE0";
   REG_OPCODEIN_0_RST	 : String := "RST0";
   REG_OPCODEIN_1_CLK	 : String := "NONE";
   REG_OPCODEIN_1_CE	 : String := "CE0";
   REG_OPCODEIN_1_RST	 : String := "RST0";
   REG_OUTPUT0_CLK	 : String := "NONE";
   REG_OUTPUT0_CE	 : String := "CE0";
   REG_OUTPUT0_RST	 : String := "RST0";
   REG_OUTPUT1_CLK	 : String := "NONE";
   REG_OUTPUT1_CE	 : String := "CE0";
   REG_OUTPUT1_RST	 : String := "RST0";
   REG_FLAG_CLK	 : String := "NONE";
   REG_FLAG_CE	 : String := "CE0";
   REG_FLAG_RST	 : String := "RST0";
   MCPAT_SOURCE	 : String := "STATIC";
   MASKPAT_SOURCE	 : String := "STATIC";
   MASK01	 : String := "0x00000000000000";
   MCPAT	 : String := "0x00000000000000";
   MASKPAT	 : String := "0x00000000000000";
   RNDPAT	 : String := "0x00000000000000";
   GSR	 : String := "ENABLED";
   RESETMODE	 : String := "SYNC";
   MULT9_MODE	 : String := "DISABLED";
--   FORCE_ZERO_BARREL_SHIFT	 : String := "DISABLED";
   LEGACY	 : String := "DISABLED" );
PORT (
   CE3,CE2,CE1,CE0,CLK3,CLK2,CLK1,CLK0,RST3,RST2,RST1,RST0,SIGNEDIA,SIGNEDIB,SIGNEDCIN,
   A35,A34,A33,A32,A31,A30,A29,A28,A27,A26,A25,A24,A23,A22,A21,A20,A19,A18,
   A17,A16,A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0,
   B35,B34,B33,B32,B31,B30,B29,B28,B27,B26,B25,B24,B23,B22,B21,B20,B19,B18,
   B17,B16,B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0,
   C53,C52,C51,C50,C49,C48,C47,C46,C45,C44,C43,C42,C41,C40,C39,C38,C37,C36,
   C35,C34,C33,C32,C31,C30,C29,C28,C27,C26,C25,C24,C23,C22,C21,C20,C19,C18,
   C17,C16,C15,C14,C13,C12,C11,C10,C9,C8,C7,C6,C5,C4,C3,C2,C1,C0,
   MA35,MA34,MA33,MA32,MA31,MA30,MA29,MA28,MA27,MA26,MA25,MA24,MA23,MA22,MA21,MA20,MA19,MA18,
   MA17,MA16,MA15,MA14,MA13,MA12,MA11,MA10,MA9,MA8,MA7,MA6,MA5,MA4,MA3,MA2,MA1,MA0,
   MB35,MB34,MB33,MB32,MB31,MB30,MB29,MB28,MB27,MB26,MB25,MB24,MB23,MB22,MB21,MB20,MB19,MB18,
   MB17,MB16,MB15,MB14,MB13,MB12,MB11,MB10,MB9,MB8,MB7,MB6,MB5,MB4,MB3,MB2,MB1,MB0,
   CIN53,CIN52,CIN51,CIN50,CIN49,CIN48,CIN47,CIN46,CIN45,CIN44,CIN43,CIN42,CIN41,CIN40,CIN39,
   CIN38,CIN37,CIN36,CIN35,CIN34,CIN33,CIN32,CIN31,CIN30,CIN29,CIN28,
   CIN27,CIN26,CIN25,CIN24,CIN23,CIN22,CIN21,CIN20,CIN19,CIN18,CIN17,CIN16,CIN15,CIN14,
   CIN13,CIN12,CIN11,CIN10,CIN9,CIN8,CIN7,CIN6,CIN5,CIN4,CIN3,CIN2,CIN1,CIN0,
   OP10,OP9,OP8,OP7,OP6,OP5,OP4,OP3,OP2,OP1,OP0 : IN std_logic := 'X';
   R53,R52,R51,R50,R49,R48,R47,R46,R45,R44,R43,R42,R41,R40,R39,R38,R37,R36,
   R35,R34,R33,R32,R31,R30,R29,R28,R27,R26,R25,R24,R23,R22,R21,R20,R19,R18,
   R17,R16,R15,R14,R13,R12,R11,R10,R9,R8,R7,R6,R5,R4,R3,R2,R1,R0,
   EQZ,EQZM,EQOM,EQPAT,EQPATB,OVER,UNDER,OVERUNDER,
   SIGNEDR  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT ALU24B
GENERIC (
   REG_OUTPUT_CLK	 : String := "NONE";
   REG_OUTPUT_CE	 : String := "CE0";
   REG_OUTPUT_RST	 : String := "RST0";
   REG_OPCODE_0_CLK	 : String := "NONE";
   REG_OPCODE_0_CE	 : String := "CE0";
   REG_OPCODE_0_RST	 : String := "RST0";
   REG_OPCODE_1_CLK	 : String := "NONE";
   REG_OPCODE_1_CE	 : String := "CE0";
   REG_OPCODE_1_RST	 : String := "RST0";
   REG_INPUTCFB_CLK	 : String := "NONE";
   REG_INPUTCFB_CE	 : String := "CE0";
   REG_INPUTCFB_RST	 : String := "RST0";
   CLK0_DIV	 : String := "ENABLED";
   CLK1_DIV	 : String := "ENABLED";
   CLK2_DIV	 : String := "ENABLED";
   CLK3_DIV	 : String := "ENABLED";
   GSR	 : String := "ENABLED";
   RESETMODE	 : String := "SYNC" );
PORT (
   CE3,CE2,CE1,CE0,CLK3,CLK2,CLK1,CLK0,RST3,RST2,RST1,RST0,SIGNEDIA,SIGNEDIB,
   MA17,MA16,MA15,MA14,MA13,MA12,MA11,MA10,MA9,MA8,MA7,MA6,MA5,MA4,MA3,MA2,MA1,MA0,
   MB17,MB16,MB15,MB14,MB13,MB12,MB11,MB10,MB9,MB8,MB7,MB6,MB5,MB4,MB3,MB2,MB1,MB0,
   CFB23,CFB22,CFB21,CFB20,CFB19,CFB18,CFB17,CFB16,CFB15,CFB14,
   CFB13,CFB12,CFB11,CFB10,CFB9,CFB8,CFB7,CFB6,CFB5,CFB4,CFB3,CFB2,CFB1,CFB0,
   CIN23,CIN22,CIN21,CIN20,CIN19,CIN18,CIN17,CIN16,CIN15,CIN14,
   CIN13,CIN12,CIN11,CIN10,CIN9,CIN8,CIN7,CIN6,CIN5,CIN4,CIN3,CIN2,CIN1,CIN0,
   OPADDNSUB, OPCINSEL : IN std_logic := 'X';
   R23,R22,R21,R20,R19,R18,
   R17,R16,R15,R14,R13,R12,R11,R10,R9,R8,R7,R6,R5,R4,R3,R2,R1,R0,
   CO23,CO22,CO21,CO20,CO19,CO18,
   CO17,CO16,CO15,CO14,CO13,CO12,CO11,CO10,CO9,CO8,CO7,CO6,CO5,CO4,CO3,CO2,CO1,CO0  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT ALU54B
GENERIC (
   REG_INPUTC0_CLK	 : String := "NONE";
   REG_INPUTC0_CE	 : String := "CE0";
   REG_INPUTC0_RST	 : String := "RST0";
   REG_INPUTC1_CLK	 : String := "NONE";
   REG_INPUTC1_CE	 : String := "CE0";
   REG_INPUTC1_RST	 : String := "RST0";
   REG_OPCODEOP0_0_CLK	 : String := "NONE";
   REG_OPCODEOP0_0_CE	 : String := "CE0";
   REG_OPCODEOP0_0_RST	 : String := "RST0";
   REG_OPCODEOP1_0_CLK	 : String := "NONE";
   REG_OPCODEOP0_1_CLK	 : String := "NONE";
   REG_OPCODEOP0_1_CE	 : String := "CE0";
   REG_OPCODEOP0_1_RST	 : String := "RST0";
   REG_OPCODEOP1_1_CLK	 : String := "NONE";
   REG_OPCODEIN_0_CLK	 : String := "NONE";
   REG_OPCODEIN_0_CE	 : String := "CE0";
   REG_OPCODEIN_0_RST	 : String := "RST0";
   REG_OPCODEIN_1_CLK	 : String := "NONE";
   REG_OPCODEIN_1_CE	 : String := "CE0";
   REG_OPCODEIN_1_RST	 : String := "RST0";
   REG_OUTPUT0_CLK	 : String := "NONE";
   REG_OUTPUT0_CE	 : String := "CE0";
   REG_OUTPUT0_RST	 : String := "RST0";
   REG_OUTPUT1_CLK	 : String := "NONE";
   REG_OUTPUT1_CE	 : String := "CE0";
   REG_OUTPUT1_RST	 : String := "RST0";
   REG_FLAG_CLK	 : String := "NONE";
   REG_FLAG_CE	 : String := "CE0";
   REG_FLAG_RST	 : String := "RST0";
   MCPAT_SOURCE	 : String := "STATIC";
   MASKPAT_SOURCE	 : String := "STATIC";
   MASK01	 : String := "0x00000000000000";
   REG_INPUTCFB_CLK	 : String := "NONE";
   REG_INPUTCFB_CE	 : String := "CE0";
   REG_INPUTCFB_RST	 : String := "RST0";
   CLK0_DIV	 : String := "ENABLED";
   CLK1_DIV	 : String := "ENABLED";
   CLK2_DIV	 : String := "ENABLED";
   CLK3_DIV	 : String := "ENABLED";
   MCPAT	 : String := "0x00000000000000";
   MASKPAT	 : String := "0x00000000000000";
   RNDPAT	 : String := "0x00000000000000";
   GSR	 : String := "ENABLED";
   RESETMODE	 : String := "SYNC";
   MULT9_MODE	 : String := "DISABLED";
--   FORCE_ZERO_BARREL_SHIFT	 : String := "DISABLED";
   LEGACY	 : String := "DISABLED" );
PORT (
   CE3,CE2,CE1,CE0,CLK3,CLK2,CLK1,CLK0,RST3,RST2,RST1,RST0,SIGNEDIA,SIGNEDIB,SIGNEDCIN,
   A35,A34,A33,A32,A31,A30,A29,A28,A27,A26,A25,A24,A23,A22,A21,A20,A19,A18,
   A17,A16,A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0,
   B35,B34,B33,B32,B31,B30,B29,B28,B27,B26,B25,B24,B23,B22,B21,B20,B19,B18,
   B17,B16,B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0,
   C53,C52,C51,C50,C49,C48,C47,C46,C45,C44,C43,C42,C41,C40,C39,C38,C37,C36,
   C35,C34,C33,C32,C31,C30,C29,C28,C27,C26,C25,C24,C23,C22,C21,C20,C19,C18,
   C17,C16,C15,C14,C13,C12,C11,C10,C9,C8,C7,C6,C5,C4,C3,C2,C1,C0,
   CFB53,CFB52,CFB51,CFB50,CFB49,CFB48,CFB47,CFB46,CFB45,CFB44,CFB43,CFB42,CFB41,
   CFB40,CFB39,CFB38,CFB37,CFB36,CFB35,CFB34,CFB33,CFB32,CFB31,CFB30,CFB29,CFB28,
   CFB27,CFB26,CFB25,CFB24,CFB23,CFB22,CFB21,CFB20,CFB19,CFB18,CFB17,CFB16,CFB15,
   CFB14,CFB13,CFB12,CFB11,CFB10,CFB9,CFB8,CFB7,CFB6,CFB5,CFB4,CFB3,CFB2,CFB1,CFB0,
   MA35,MA34,MA33,MA32,MA31,MA30,MA29,MA28,MA27,MA26,MA25,MA24,MA23,MA22,MA21,MA20,MA19,MA18,
   MA17,MA16,MA15,MA14,MA13,MA12,MA11,MA10,MA9,MA8,MA7,MA6,MA5,MA4,MA3,MA2,MA1,MA0,
   MB35,MB34,MB33,MB32,MB31,MB30,MB29,MB28,MB27,MB26,MB25,MB24,MB23,MB22,MB21,MB20,MB19,MB18,
   MB17,MB16,MB15,MB14,MB13,MB12,MB11,MB10,MB9,MB8,MB7,MB6,MB5,MB4,MB3,MB2,MB1,MB0,
   CIN53,CIN52,CIN51,CIN50,CIN49,CIN48,CIN47,CIN46,CIN45,CIN44,CIN43,CIN42,CIN41,
   CIN40,CIN39,CIN38,CIN37,CIN36,CIN35,CIN34,CIN33,CIN32,CIN31,CIN30,CIN29,CIN28,
   CIN27,CIN26,CIN25,CIN24,CIN23,CIN22,CIN21,CIN20,CIN19,CIN18,CIN17,CIN16,CIN15,
   CIN14,CIN13,CIN12,CIN11,CIN10,CIN9,CIN8,CIN7,CIN6,CIN5,CIN4,CIN3,CIN2,CIN1,CIN0,
   OP10,OP9,OP8,OP7,OP6,OP5,OP4,OP3,OP2,OP1,OP0 : IN std_logic := 'X';
   R53,R52,R51,R50,R49,R48,R47,R46,R45,R44,R43,R42,R41,R40,R39,R38,R37,R36,
   R35,R34,R33,R32,R31,R30,R29,R28,R27,R26,R25,R24,R23,R22,R21,R20,R19,R18,
   R17,R16,R15,R14,R13,R12,R11,R10,R9,R8,R7,R6,R5,R4,R3,R2,R1,R0,
   CO53,CO52,CO51,CO50,CO49,CO48,CO47,CO46,CO45,CO44,CO43,CO42,CO41,CO40,CO39,CO38,CO37,CO36,
   CO35,CO34,CO33,CO32,CO31,CO30,CO29,CO28,CO27,CO26,CO25,CO24,CO23,CO22,CO21,CO20,CO19,CO18,
   CO17,CO16,CO15,CO14,CO13,CO12,CO11,CO10,CO9,CO8,CO7,CO6,CO5,CO4,CO3,CO2,CO1,CO0,
   EQZ,EQZM,EQOM,EQPAT,EQPATB,OVER,UNDER,OVERUNDER,
   SIGNEDR  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT PRADD9A
GENERIC (
   REG_INPUTA_CLK	 : String := "NONE";
   REG_INPUTA_CE	 : String := "CE0";
   REG_INPUTA_RST	 : String := "RST0";
   REG_INPUTB_CLK	 : String := "NONE";
   REG_INPUTB_CE	 : String := "CE0";
   REG_INPUTB_RST	 : String := "RST0";
   REG_INPUTC_CLK	 : String := "NONE";
   REG_INPUTC_CE	 : String := "CE0";
   REG_INPUTC_RST	 : String := "RST0";
   REG_OPPRE_CLK	 : String := "NONE";
   REG_OPPRE_CE	 : String := "CE0";
   REG_OPPRE_RST	 : String := "RST0";
   CLK0_DIV	 : String := "ENABLED";
   CLK1_DIV	 : String := "ENABLED";
   CLK2_DIV	 : String := "ENABLED";
   CLK3_DIV	 : String := "ENABLED";
   HIGHSPEED_CLK	 : String := "NONE";
   GSR	 : String := "ENABLED";
   CAS_MATCH_REG	 : String := "FALSE";
   SOURCEA_MODE	 : String := "A_SHIFT";
   SOURCEB_MODE	 : String := "SHIFT";
   FB_MUX	 : String := "SHIFT";
   RESETMODE	 : String := "SYNC";
   SYMMETRY_MODE	 : String := "DIRECT" );
PORT (
   PA8,PA7,PA6,PA5,PA4,PA3,PA2,PA1,PA0,
   PB8,PB7,PB6,PB5,PB4,PB3,PB2,PB1,PB0,
   SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,
   SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0,
   C8,C7,C6,C5,C4,C3,C2,C1,C0,
   SOURCEA,OPPRE,
   CLK3,CLK2,CLK1,CLK0,
   CE3,CE2,CE1,CE0,
   RST3,RST2,RST1,RST0 : IN std_logic := 'X';
   SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,
   SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,
   PO8,PO7,PO6,PO5,PO4,PO3,PO2,PO1,PO0  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT PRADD18A
GENERIC (
   REG_INPUTA_CLK	 : String := "NONE";
   REG_INPUTA_CE	 : String := "CE0";
   REG_INPUTA_RST	 : String := "RST0";
   REG_INPUTB_CLK	 : String := "NONE";
   REG_INPUTB_CE	 : String := "CE0";
   REG_INPUTB_RST	 : String := "RST0";
   REG_INPUTC_CLK	 : String := "NONE";
   REG_INPUTC_CE	 : String := "CE0";
   REG_INPUTC_RST	 : String := "RST0";
   REG_OPPRE_CLK	 : String := "NONE";
   REG_OPPRE_CE	 : String := "CE0";
   REG_OPPRE_RST	 : String := "RST0";
   CLK0_DIV	 : String := "ENABLED";
   CLK1_DIV	 : String := "ENABLED";
   CLK2_DIV	 : String := "ENABLED";
   CLK3_DIV	 : String := "ENABLED";
   HIGHSPEED_CLK	 : String := "NONE";
   GSR	 : String := "ENABLED";
   CAS_MATCH_REG	 : String := "FALSE";
   SOURCEA_MODE	 : String := "A_SHIFT";
   SOURCEB_MODE	 : String := "SHIFT";
   FB_MUX	 : String := "SHIFT";
   RESETMODE	 : String := "SYNC";
   SYMMETRY_MODE	 : String := "DIRECT" );
PORT (
   PA17,PA16,PA15,PA14,PA13,PA12,PA11,PA10,PA9,PA8,PA7,PA6,
   PA5,PA4,PA3,PA2,PA1,PA0,
   PB17,PB16,PB15,PB14,PB13,PB12,PB11,PB10,PB9,PB8,PB7,PB6,
   PB5,PB4,PB3,PB2,PB1,PB0,
   SRIA17,SRIA16,SRIA15,SRIA14,SRIA13,SRIA12,SRIA11,SRIA10,SRIA9,SRIA8,SRIA7,SRIA6,
   SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,
   SRIB17,SRIB16,SRIB15,SRIB14,SRIB13,SRIB12,SRIB11,SRIB10,SRIB9,SRIB8,SRIB7,SRIB6,
   SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0,
   C17,C16,C15,C14,C13,C12,C11,C10,C9,C8,C7,C6,C5,C4,C3,C2,C1,C0,
   SOURCEA,OPPRE,
   CLK3,CLK2,CLK1,CLK0,
   CE3,CE2,CE1,CE0,
   RST3,RST2,RST1,RST0 : IN std_logic := 'X';
   SROA17,SROA16,SROA15,SROA14,SROA13,SROA12,SROA11,SROA10,SROA9,SROA8,SROA7,SROA6,
   SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,
   SROB17,SROB16,SROB15,SROB14,SROB13,SROB12,SROB11,SROB10,SROB9,SROB8,SROB7,SROB6,
   SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,
   PO17,PO16,PO15,PO14,PO13,PO12,PO11,PO10,PO9,PO8,PO7,PO6,
   PO5,PO4,PO3,PO2,PO1,PO0  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT DP16KD
GENERIC (
   DATA_WIDTH_A	 : Integer := 18;
   DATA_WIDTH_B	 : Integer := 18;
   REGMODE_A	 : String := "NOREG";
   REGMODE_B	 : String := "NOREG";
   RESETMODE	 : String := "SYNC";
   ASYNC_RESET_RELEASE	 : String := "SYNC";
   WRITEMODE_A	 : String := "NORMAL";
   WRITEMODE_B	 : String := "NORMAL";
   CSDECODE_A	 : String := "0b000";
   CSDECODE_B	 : String := "0b000";
   GSR	 : String := "ENABLED";
   INITVAL_00	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_01	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_02	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_03	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_04	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_05	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_06	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_07	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_08	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_09	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_0A	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_0B	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_0C	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_0D	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_0E	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_0F	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_10	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_11	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_12	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_13	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_14	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_15	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_16	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_17	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_18	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_19	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_1A	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_1B	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_1C	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_1D	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_1E	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_1F	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_20	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_21	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_22	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_23	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_24	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_25	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_26	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_27	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_28	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_29	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_2A	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_2B	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_2C	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_2D	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_2E	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_2F	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_30	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_31	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_32	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_33	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_34	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_35	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_36	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_37	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_38	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_39	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_3A	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_3B	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_3C	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_3D	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_3E	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_3F	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INIT_DATA	 : String := "STATIC" );
PORT (
   DIA17, DIA16, DIA15, DIA14, DIA13, DIA12, DIA11, DIA10, DIA9,
   DIA8, DIA7, DIA6, DIA5, DIA4, DIA3, DIA2, DIA1, DIA0,
   ADA13, ADA12, ADA11, ADA10, ADA9, ADA8, ADA7, ADA6, ADA5,
   ADA4,  ADA3,  ADA2, ADA1, ADA0,
   CEA, OCEA, CLKA, WEA, CSA2, CSA1, CSA0, RSTA,
   DIB17, DIB16, DIB15, DIB14, DIB13, DIB12, DIB11, DIB10, DIB9,
   DIB8, DIB7, DIB6, DIB5, DIB4, DIB3, DIB2, DIB1, DIB0,
   ADB13, ADB12, ADB11, ADB10, ADB9, ADB8, ADB7, ADB6, ADB5,
   ADB4,  ADB3,  ADB2, ADB1, ADB0,
   CEB, OCEB, CLKB, WEB, CSB2, CSB1, CSB0, RSTB : IN std_logic := 'X';
   DOA17, DOA16, DOA15, DOA14, DOA13, DOA12, DOA11, DOA10, DOA9,
   DOA8, DOA7, DOA6, DOA5, DOA4, DOA3, DOA2, DOA1, DOA0,
   DOB17, DOB16, DOB15, DOB14, DOB13, DOB12, DOB11, DOB10, DOB9,
   DOB8, DOB7, DOB6, DOB5, DOB4, DOB3, DOB2, DOB1, DOB0  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT PDPW16KD
GENERIC (
   DATA_WIDTH_W	 : Integer := 36;
   DATA_WIDTH_R	 : Integer := 36;
   GSR	 : String := "ENABLED";
   REGMODE	 : String := "NOREG";
   RESETMODE	 : String := "SYNC";
   ASYNC_RESET_RELEASE	 : String := "SYNC";
   CSDECODE_W	 : String := "0b000";
   CSDECODE_R	 : String := "0b000";
   INITVAL_00	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_01	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_02	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_03	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_04	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_05	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_06	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_07	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_08	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_09	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_0A	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_0B	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_0C	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_0D	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_0E	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_0F	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_10	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_11	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_12	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_13	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_14	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_15	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_16	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_17	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_18	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_19	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_1A	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_1B	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_1C	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_1D	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_1E	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_1F	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_20	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_21	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_22	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_23	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_24	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_25	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_26	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_27	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_28	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_29	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_2A	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_2B	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_2C	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_2D	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_2E	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_2F	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_30	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_31	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_32	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_33	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_34	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_35	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_36	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_37	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_38	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_39	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_3A	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_3B	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_3C	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_3D	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_3E	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INITVAL_3F	 : String := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
   INIT_DATA	 : String := "STATIC" );
PORT (
   DI35, DI34, DI33, DI32, DI31, DI30, DI29, DI28, DI27,
   DI26, DI25, DI24, DI23, DI22, DI21, DI20, DI19, DI18,
   DI17, DI16, DI15, DI14, DI13, DI12, DI11, DI10, DI9,
   DI8, DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0,
   ADW8, ADW7, ADW6, ADW5, ADW4, ADW3, ADW2, ADW1, ADW0,
   BE3,  BE2,  BE1, BE0,
   CEW, CLKW, CSW2, CSW1, CSW0,
   ADR13, ADR12, ADR11, ADR10, ADR9, ADR8, ADR7, ADR6, ADR5,
   ADR4,  ADR3,  ADR2, ADR1, ADR0,
   CER, OCER, CLKR, CSR2, CSR1, CSR0, RST : IN std_logic := 'X';
   DO35, DO34, DO33, DO32, DO31, DO30, DO29, DO28, DO27,
   DO26, DO25, DO24, DO23, DO22, DO21, DO20, DO19, DO18,
   DO17, DO16, DO15, DO14, DO13, DO12, DO11, DO10, DO9,
   DO8, DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT DPR16X4C
GENERIC (
   initval	 : String := "0x0000000000000000" );
PORT (
   DI3, DI2, DI1, DI0, WAD3,WAD2,WAD1,WAD0, WCK, WRE,
   RAD3,RAD2,RAD1,RAD0 : IN std_logic := 'X';
   DO3, DO2, DO1, DO0  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT SPR16X4C
GENERIC (
   initval	 : String := "0x0000000000000000" );
PORT (
   DI3, DI2, DI1, DI0, AD3, AD2, AD1, AD0, CK, WRE : IN std_logic := 'X';
   DO3, DO2, DO1, DO0  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT DTR
GENERIC (
   DTR_TEMP	 : integer := 25 );
PORT (
   STARTPULSE : IN std_logic := 'X';
   DTROUT7,DTROUT6,DTROUT5,DTROUT4,DTROUT3,DTROUT2,DTROUT1,DTROUT0  : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT CLKDIVG
GENERIC (
   GSR   : String := "DISABLED";
   DIV   : String := "2.0" );
PORT (
   CLKI, RST, ALIGNWD : IN std_logic := 'X';
   CDIVX  : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT PCSCLKDIV
GENERIC (
   GSR   : String := "DISABLED" );
PORT (
   CLKI, RST, SEL2, SEL1,SEL0 : IN std_logic := 'X';
   CDIV1, CDIVX  : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT DCSC
GENERIC (
   DCSMODE       : String := "POS" );
PORT (
   CLK1, CLK0, SEL1, SEL0, MODESEL : IN std_logic := 'X';
   DCSOUT  : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT ECLKSYNCB
PORT (
   ECLKI, STOP : IN std_logic := 'X';
   ECLKO  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT ECLKBRIDGECS
PORT (
   CLK0, CLK1, SEL : IN std_logic := 'X';
   ECSOUT  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT DCCA
PORT (
   CLKI, CE : IN std_logic := 'X';
   CLKO  : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT OSCG
GENERIC (
   DIV   : Integer := 128 );
PORT (
   OSC  : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT EHXPLLL
GENERIC (
   CLKI_DIV      : Integer := 1;
   CLKFB_DIV     : Integer := 1;
   CLKOP_DIV     : Integer := 8;
   CLKOS_DIV     : Integer := 8;
   CLKOS2_DIV    : Integer := 8;
   CLKOS3_DIV    : Integer := 8;
   CLKOP_ENABLE  : String := "ENABLED";
   CLKOS_ENABLE  : String := "DISABLED";
   CLKOS2_ENABLE         : String := "DISABLED";
   CLKOS3_ENABLE         : String := "DISABLED";
   CLKOP_CPHASE  : Integer := 0;
   CLKOS_CPHASE  : Integer := 0;
   CLKOS2_CPHASE         : Integer := 0;
   CLKOS3_CPHASE         : Integer := 0;
   CLKOP_FPHASE  : Integer := 0;
   CLKOS_FPHASE  : Integer := 0;
   CLKOS2_FPHASE         : Integer := 0;
   CLKOS3_FPHASE         : Integer := 0;
   FEEDBK_PATH   : String := "CLKOP";
   CLKOP_TRIM_POL        : String := "RISING";
   CLKOP_TRIM_DELAY      : Integer := 0;
   CLKOS_TRIM_POL        : String := "RISING";
   CLKOS_TRIM_DELAY      : Integer := 0;
   OUTDIVIDER_MUXA       : String := "DIVA";
   OUTDIVIDER_MUXB       : String := "DIVB";
   OUTDIVIDER_MUXC       : String := "DIVC";
   OUTDIVIDER_MUXD       : String := "DIVD";
   PLL_LOCK_MODE         : Integer := 0;
   PLL_LOCK_DELAY        : Integer := 200;
   STDBY_ENABLE  : String := "DISABLED";
   REFIN_RESET   : String := "DISABLED";
   SYNC_ENABLE   : String := "DISABLED";
   INT_LOCK_STICKY       : String := "ENABLED";
   DPHASE_SOURCE         : String := "DISABLED";
   PLLRST_ENA    : String := "DISABLED";
   INTFB_WAKE    : String := "DISABLED" );
PORT (
   CLKI, CLKFB, PHASESEL1, PHASESEL0, PHASEDIR, PHASESTEP,
   PHASELOADREG, STDBY, PLLWAKESYNC, RST,
   ENCLKOP, ENCLKOS, ENCLKOS2, ENCLKOS3 : IN std_logic := 'X';
   CLKOP, CLKOS, CLKOS2, CLKOS3, LOCK, INTLOCK, REFCLK,
   CLKINTFB : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT PLLREFCS
PORT (
   CLK0,CLK1,SEL : IN std_logic := 'X';
   PLLCSOUT  : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT BCINRD
GENERIC (
   BANKID        : Integer := 2 );
PORT (
   INRDENI  : IN std_logic := 'X' );
END COMPONENT;


COMPONENT BCLVDSOB
GENERIC (
   BANKID        : Integer := 2 );
PORT (
   LVDSENI  : IN std_logic := 'X' );
END COMPONENT;
COMPONENT INRDB
PORT (
   D,
   E : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT LVDSOB
PORT (
   D,
   E : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT START
PORT (
   STARTCLK  : IN std_logic := 'X' );
END COMPONENT;
--
COMPONENT USRMCLK
PORT (
   USRMCLKI, USRMCLKTS  : IN std_logic := 'X' );
END COMPONENT;
--
COMPONENT DELAYF
GENERIC (
   DEL_MODE      : String := "USER_DEFINED";
   DEL_VALUE     : Integer := 0);
PORT (
   A, LOADN, MOVE, DIRECTION : IN std_logic := 'X';
   Z, CFLAG  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT DELAYG
GENERIC (
   DEL_MODE      : String := "USER_DEFINED";
   DEL_VALUE     : Integer := 0 );
PORT (
   A : IN std_logic := 'X';
   Z  : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT DQSBUFM
GENERIC (
   DQS_LI_DEL_VAL        : Integer := 4;
   DQS_LI_DEL_ADJ        : String := "PLUS";
   DQS_LO_DEL_VAL        : Integer := 0;
   DQS_LO_DEL_ADJ        : String := "PLUS";
   GSR   : String := "ENABLED" );
PORT (
   DQSI,READ1,READ0,READCLKSEL2,READCLKSEL1,READCLKSEL0,DDRDEL,ECLK,SCLK, RST,
   DYNDELAY7, DYNDELAY6, DYNDELAY5, DYNDELAY4, DYNDELAY3, DYNDELAY2, DYNDELAY1, DYNDELAY0,
   PAUSE,RDLOADN,RDMOVE,RDDIRECTION,WRLOADN,WRMOVE,WRDIRECTION : IN std_logic := 'X';
   DQSR90,DQSW,DQSW270,RDPNTR2,RDPNTR1,RDPNTR0,WRPNTR2,WRPNTR1,WRPNTR0,
   DATAVALID, BURSTDET,RDCFLAG,WRCFLAG  : OUT std_logic := 'X' );
END COMPONENT;


COMPONENT DDRDLLA
GENERIC (
   FORCE_MAX_DELAY	 : String := "NO";
   LOCK_CYC	 : Integer := 200;
   GSR	 : String := "ENABLED" );
PORT (
   CLK, RST, UDDCNTLN, FREEZE : IN std_logic := 'X';
   DDRDEL, LOCK,
   DCNTL7,DCNTL6,DCNTL5,DCNTL4,DCNTL3,DCNTL2,DCNTL1,DCNTL0  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT DLLDELD
PORT (
   A, DDRDEL,LOADN,MOVE,DIRECTION : IN std_logic := 'X';
   Z, CFLAG  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT IDDRX1F
GENERIC (
   GSR	 : String := "ENABLED" );
PORT (
   D, SCLK, RST : IN std_logic := 'X';
   Q0, Q1  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT IDDRX2F
GENERIC (
   GSR	 : String := "ENABLED" );
PORT (
   D, SCLK, ECLK, RST, ALIGNWD : IN std_logic := 'X';
   Q3, Q2, Q1, Q0  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT IDDR71B
GENERIC (
   GSR	 : String := "ENABLED" );
PORT (
   D, SCLK,ECLK,RST,ALIGNWD : IN std_logic := 'X';
   Q6,Q5,Q4,Q3,Q2,Q1,Q0  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT ODDRX1F
GENERIC (
   GSR	 : String := "ENABLED" );
PORT (
   SCLK, RST, D0, D1 : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT ODDRX2F
GENERIC (
   GSR	 : String := "ENABLED" );
PORT (
   SCLK,ECLK,RST,D3,D2,D1,D0 : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT ODDR71B
GENERIC (
   GSR	 : String := "ENABLED" );
PORT (
   SCLK,ECLK,RST,D6,D5,D4,D3,D2,D1,D0 : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT IMIPI
PORT (
   A, AN, HSSEL : IN std_logic := 'X';
   OHSOLS1, OLS0 : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT IDDRX2DQA
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   SCLK,ECLK,DQSR90,D,RST,
   RDPNTR2,RDPNTR1,RDPNTR0,WRPNTR2,WRPNTR1,WRPNTR0 : IN std_logic := 'X';
   Q3,Q2,Q1,Q0,QWL  : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT ODDRX2DQA
GENERIC (
   GSR   : String := "ENABLED");
PORT (
   D3,D2,D1,D0,DQSW270,SCLK,ECLK,RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT ODDRX2DQSB
GENERIC (
   GSR   : String := "ENABLED");
PORT (
   D3,D2,D1,D0,SCLK,ECLK,DQSW,RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT TSHX2DQA
GENERIC (
   GSR   : String := "ENABLED";
   REGSET        : String := "SET" );
PORT (
   T1,T0,SCLK,ECLK,DQSW270,RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT TSHX2DQSA
GENERIC (
   GSR   : String := "ENABLED";
   REGSET        : String := "SET" );
PORT (
   T1,T0,SCLK,ECLK,DQSW,RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
--
COMPONENT OSHX2A
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D1,D0,SCLK,ECLK,RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
--

COMPONENT JTAGG
GENERIC (
   ER1   : String := "ENABLED";
   ER2   : String := "ENABLED" );
PORT (
   TCK, TMS, TDI, JTDO2, JTDO1 : IN std_logic := 'X';
   TDO, JTDI, JTCK, JRTI2, JRTI1,
   JSHIFT, JUPDATE, JRSTN, JCE2, JCE1  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT SEDGA
GENERIC (
   SED_CLK_FREQ        : String := "2.4";
   CHECKALWAYS         : String := "DISABLED";
   DEV_DENSITY         : String := "85KUM" );
PORT (
   SEDENABLE, SEDSTART, SEDFRCERR : IN std_logic := 'X';
   SEDERR, SEDDONE, SEDINPROG, SEDCLKOUT  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT EXTREFB
   GENERIC (
      -- EXTREF Attr
      REFCK_PWDNB : String := "DONTCARE";
      REFCK_RTERM : String := "DONTCARE";
      REFCK_DCBIAS_EN : String := "DONTCARE"
   );
   PORT (
      -- EXTREF Pins
      REFCLKP, REFCLKN : IN std_logic := 'X';
      REFCLKO : OUT std_logic := 'X'
   );
END COMPONENT;

-- PUR
COMPONENT pur
   GENERIC (
      RST_PULSE          : Integer   := 1);
PORT(
      pur: IN std_logic := 'X'
  );
END COMPONENT;

-- Components for back-anno only
COMPONENT bufba
PORT(
        a: IN std_logic := 'X';
        z: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT obzpd
PORT(
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;

--
-- SLICE Model components --
--
COMPONENT SLOGICB IS
   GENERIC (
        -- miscellaneous vital GENERICs
        TimingChecksOn  : boolean := TRUE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := TRUE;
        InstancePath    : string  := "SLOGICB";

        GSR             : string := "ENABLED";
        SRMODE          : string := "LSR_OVER_CE";      -- "LSR_OVER_CE", "ASYNC"
        M1MUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        M0MUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        LSRMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        CEMUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        CLKMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        REG1_SD         : string := "VLO";      -- "VLO", "VHI", "SIG"
        REG0_SD         : string := "VLO";      -- "VLO", "VHI", "SIG"
        LUT1_INITVAL    : bit_vector := X"0000";
        LUT0_INITVAL    : bit_vector := X"0000";
        REG1_REGSET     : string := "RESET";  -- "RESET", "SET"
        REG0_REGSET     : string := "RESET";  -- "RESET", "SET"
        LSRONMUX        : string := "LSRMUX";  -- "LSRMUX", "OFF"

        -- timing check enable for each port
        check_M1        : boolean := FALSE;
        check_DI1       : boolean := FALSE;
        check_DI0       : boolean := FALSE;
        check_M0        : boolean := FALSE;
        check_CE        : boolean := FALSE;
        check_LSR       : boolean := FALSE
        );

   PORT(
        M1, FXA, FXB, A1, B1, C1, D1, DI1, DI0            : in std_ulogic := '0';
        A0, B0, C0, D0, M0, CE, CLK, LSR                  : in std_ulogic := '0';
        OFX1, F1, Q1, OFX0, F0, Q0                        : out std_ulogic := '0'
        );
END COMPONENT ;
--
COMPONENT SCCU2C IS
   GENERIC (
        TimingChecksOn  : boolean := TRUE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := TRUE;
        InstancePath    : string  := "SCCU2C";

        GSR             : string := "ENABLED";
        SRMODE          : string := "LSR_OVER_CE";      -- "LSR_OVER_CE", "ASYNC"
        M1MUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        M0MUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        LSRMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        CEMUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        CLKMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        REG1_SD         : string := "VLO";      -- "VLO", "VHI", "SIG"
        REG0_SD         : string := "VLO";      -- "VLO", "VHI", "SIG"
        REG1_REGSET     : string := "RESET";  -- "RESET", "SET"
        REG0_REGSET     : string := "RESET";  -- "RESET", "SET"
        LSRONMUX        : string := "LSRMUX";  -- "LSRMUX", "OFF"
        CCU2_INJECT1_0  : string := "YES";     -- "NO", "YES"
        CCU2_INJECT1_1  : string := "YES";     -- "NO", "YES"
        INIT0_INITVAL   : std_logic_vector(15 downto 0) := "0000000000000000";
        INIT1_INITVAL   : std_logic_vector(15 downto 0) := "0000000000000000";

        -- timing check enable for each port
        check_M1        : boolean := FALSE;
        check_DI1       : boolean := FALSE;
        check_DI0       : boolean := FALSE;
        check_M0        : boolean := FALSE;
        check_CE        : boolean := FALSE;
        check_LSR       : boolean := FALSE
        );

   PORT(
        M1, A1, B1, C1, D1, DI1, DI0                   : in std_ulogic := '0';
        A0, B0, C0, D0, FCI, M0, CE, CLK, LSR          : in std_ulogic := '0';
        FCO, F1, Q1, F0, Q0                            : out std_ulogic := '0'
        );
END COMPONENT ;
--
COMPONENT SRAMWB IS
   GENERIC (
        -- miscellaneous vital GENERICs
        TimingChecksOn  : boolean := TRUE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := TRUE;
        InstancePath    : string  := "SRAMWB";

        WD0MUX          : string := "VLO";      -- "SIG", "VLO", "VHI"
        WD1MUX          : string := "VLO";      -- "SIG", "VLO", "VHI"
        WD2MUX          : string := "VLO";      -- "SIG", "VLO", "VHI"
        WD3MUX          : string := "VLO";      -- "SIG", "VLO", "VHI"
        WAD0MUX         : string := "VLO";      -- "SIG", "VLO", "VHI"
        WAD1MUX         : string := "VLO";      -- "SIG", "VLO", "VHI"
        WAD2MUX         : string := "VLO";      -- "SIG", "VLO", "VHI"
        WAD3MUX         : string := "VLO"       -- "SIG", "VLO", "VHI"
        );

   PORT(
        A1, B1, C1, D1, A0, B0, C0, D0                     : in std_ulogic := 'X';
        WDO0, WDO1, WDO2, WDO3, WADO0, WADO1, WADO2, WADO3 : out std_ulogic := 'X'
        );
END COMPONENT ;
--
COMPONENT SDPRAME IS
   GENERIC (
        -- miscellaneous vital GENERICs
        TimingChecksOn  : boolean := TRUE;
        XOn             : boolean := FALSE;
        MsgOn           : boolean := TRUE;
        InstancePath    : string  := "SDPRAME";

        GSR             : string := "ENABLED";
        SRMODE          : string := "LSR_OVER_CE";      -- "LSR_OVER_CE", "ASYNC"
        M1MUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        M0MUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        LSRMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        CEMUX           : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        CLKMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        WREMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        WCKMUX          : string := "VLO";      -- "SIG", "INV", "VLO", "VHI"
        REG1_SD         : string := "VLO";      -- "VLO", "VHI", "SIG"
        REG0_SD         : string := "VLO";      -- "VLO", "VHI", "SIG"
        REG1_REGSET     : string := "RESET";  -- "RESET", "SET"
        REG0_REGSET     : string := "RESET";  -- "RESET", "SET"
        LSRONMUX        : string := "LSRMUX";  -- "LSRMUX", "OFF"
        initval : string := "0x0000000000000000";

        DPRAM_RAD0 : string := "SIG";            -- "SIG", "VLO", "VHI"
        DPRAM_RAD1 : string := "SIG";            -- "SIG", "VLO", "VHI"
        DPRAM_RAD2 : string := "SIG";            -- "SIG", "VLO", "VHI"
        DPRAM_RAD3 : string := "SIG";            -- "SIG", "VLO", "VHI"

        -- timing check enable for each port
        check_WD1       : boolean := FALSE;
        check_WD0       : boolean := FALSE;
        check_WAD0      : boolean := FALSE;
        check_WAD1      : boolean := FALSE;
        check_WAD2      : boolean := FALSE;
        check_WAD3      : boolean := FALSE;
        CHECK_WRE       : boolean := FALSE;
        check_M0        : boolean := FALSE;
        check_M1        : boolean := FALSE;
        check_CE        : boolean := FALSE;
        check_LSR       : boolean := FALSE;
        check_DI1       : boolean := FALSE;
        check_DI0       : boolean := FALSE
        );

   PORT(
        M1, RAD0, RAD1, RAD2, RAD3, WD1, WD0, WAD0, WAD1, WAD2, WAD3, WRE, WCK : in std_ulogic := 'X';
        M0, CE, CLK, LSR, DI1, DI0                                             : in std_ulogic := 'X';
        F0, Q0, F1, Q1                                                         : out std_ulogic := 'X'
        );
END COMPONENT ;
--


COMPONENT DCUA
   GENERIC (
      -- Channels and Quads Attr
    D_MACROPDB : String :=  "DONTCARE"; 
    D_IB_PWDNB : String :=  "DONTCARE"; 
    D_XGE_MODE : String :=  "DONTCARE"; 
    D_LOW_MARK : String :=  "DONTCARE"; 
    D_HIGH_MARK : String :=  "DONTCARE"; 
    D_BUS8BIT_SEL : String :=  "DONTCARE"; 
    D_CDR_LOL_SET : String :=  "DONTCARE"; 
    D_BITCLK_LOCAL_EN : String :=  "DONTCARE"; 
    D_BITCLK_ND_EN : String :=  "DONTCARE"; 
    D_BITCLK_FROM_ND_EN : String :=  "DONTCARE"; 
    D_SYNC_LOCAL_EN : String :=  "DONTCARE"; 
    D_SYNC_ND_EN : String :=  "DONTCARE"; 
    CH0_UC_MODE : String :=  "DONTCARE"; 
    CH1_UC_MODE : String :=  "DONTCARE"; 
    CH0_PCIE_MODE : String :=  "DONTCARE"; 
    CH1_PCIE_MODE : String :=  "DONTCARE"; 
    CH0_RIO_MODE : String :=  "DONTCARE"; 
    CH1_RIO_MODE : String :=  "DONTCARE"; 
    CH0_WA_MODE : String :=  "DONTCARE"; 
    CH1_WA_MODE : String :=  "DONTCARE"; 
    CH0_INVERT_RX : String :=  "DONTCARE"; 
    CH1_INVERT_RX : String :=  "DONTCARE"; 
    CH0_INVERT_TX : String :=  "DONTCARE"; 
    CH1_INVERT_TX : String :=  "DONTCARE"; 
    CH0_PRBS_SELECTION : String :=  "DONTCARE"; 
    CH1_PRBS_SELECTION : String :=  "DONTCARE"; 
    CH0_GE_AN_ENABLE : String :=  "DONTCARE"; 
    CH1_GE_AN_ENABLE : String :=  "DONTCARE"; 
    CH0_PRBS_LOCK : String :=  "DONTCARE"; 
    CH1_PRBS_LOCK : String :=  "DONTCARE"; 
    CH0_PRBS_ENABLE : String :=  "DONTCARE"; 
    CH1_PRBS_ENABLE : String :=  "DONTCARE"; 
    CH0_ENABLE_CG_ALIGN : String :=  "DONTCARE"; 
    CH1_ENABLE_CG_ALIGN : String :=  "DONTCARE"; 
    CH0_TX_GEAR_MODE : String :=  "DONTCARE"; 
    CH1_TX_GEAR_MODE : String :=  "DONTCARE"; 
    CH0_RX_GEAR_MODE : String :=  "DONTCARE"; 
    CH1_RX_GEAR_MODE : String :=  "DONTCARE"; 
    CH0_PCS_DET_TIME_SEL : String :=  "DONTCARE"; 
    CH1_PCS_DET_TIME_SEL : String :=  "DONTCARE"; 
    CH0_PCIE_EI_EN : String :=  "DONTCARE"; 
    CH1_PCIE_EI_EN : String :=  "DONTCARE"; 
    CH0_TX_GEAR_BYPASS : String :=  "DONTCARE"; 
    CH1_TX_GEAR_BYPASS : String :=  "DONTCARE"; 
    CH0_ENC_BYPASS : String :=  "DONTCARE"; 
    CH1_ENC_BYPASS : String :=  "DONTCARE"; 
    CH0_SB_BYPASS : String :=  "DONTCARE"; 
    CH1_SB_BYPASS : String :=  "DONTCARE"; 
    CH0_RX_SB_BYPASS : String :=  "DONTCARE"; 
    CH1_RX_SB_BYPASS : String :=  "DONTCARE"; 
    CH0_WA_BYPASS : String :=  "DONTCARE"; 
    CH1_WA_BYPASS : String :=  "DONTCARE"; 
    CH0_DEC_BYPASS : String :=  "DONTCARE"; 
    CH1_DEC_BYPASS : String :=  "DONTCARE"; 
    CH0_CTC_BYPASS : String :=  "DONTCARE"; 
    CH1_CTC_BYPASS : String :=  "DONTCARE"; 
    CH0_RX_GEAR_BYPASS : String :=  "DONTCARE"; 
    CH1_RX_GEAR_BYPASS : String :=  "DONTCARE"; 
    CH0_LSM_DISABLE : String :=  "DONTCARE"; 
    CH1_LSM_DISABLE : String :=  "DONTCARE"; 
    CH0_MATCH_2_ENABLE : String :=  "DONTCARE"; 
    CH1_MATCH_2_ENABLE : String :=  "DONTCARE"; 
    CH0_MATCH_4_ENABLE : String :=  "DONTCARE"; 
    CH1_MATCH_4_ENABLE : String :=  "DONTCARE"; 
    CH0_MIN_IPG_CNT : String :=  "DONTCARE"; 
    CH1_MIN_IPG_CNT : String :=  "DONTCARE"; 
    CH0_CC_MATCH_1 : String :=  "DONTCARE"; 
    CH1_CC_MATCH_1 : String :=  "DONTCARE"; 
    CH0_CC_MATCH_2 : String :=  "DONTCARE"; 
    CH1_CC_MATCH_2 : String :=  "DONTCARE"; 
    CH0_CC_MATCH_3 : String :=  "DONTCARE"; 
    CH1_CC_MATCH_3 : String :=  "DONTCARE"; 
    CH0_CC_MATCH_4 : String :=  "DONTCARE"; 
    CH1_CC_MATCH_4 : String :=  "DONTCARE"; 
    CH0_UDF_COMMA_MASK : String :=  "DONTCARE"; 
    CH1_UDF_COMMA_MASK : String :=  "DONTCARE"; 
    CH0_UDF_COMMA_A : String :=  "DONTCARE"; 
    CH1_UDF_COMMA_A : String :=  "DONTCARE"; 
    CH0_UDF_COMMA_B : String :=  "DONTCARE"; 
    CH1_UDF_COMMA_B : String :=  "DONTCARE"; 
    CH0_RX_DCO_CK_DIV : String :=  "DONTCARE"; 
    CH1_RX_DCO_CK_DIV : String :=  "DONTCARE"; 
    CH0_RCV_DCC_EN : String :=  "DONTCARE"; 
    CH1_RCV_DCC_EN : String :=  "DONTCARE"; 
    CH0_REQ_LVL_SET : String :=  "DONTCARE"; 
    CH1_REQ_LVL_SET : String :=  "DONTCARE"; 
    CH0_REQ_EN : String :=  "DONTCARE"; 
    CH1_REQ_EN : String :=  "DONTCARE"; 
    CH0_RTERM_RX : String :=  "DONTCARE"; 
    CH1_RTERM_RX : String :=  "DONTCARE"; 
    CH0_PDEN_SEL : String :=  "DONTCARE"; 
    CH1_PDEN_SEL : String :=  "DONTCARE"; 
    CH0_LDR_RX2CORE_SEL : String :=  "DONTCARE"; 
    CH1_LDR_RX2CORE_SEL : String :=  "DONTCARE"; 
    CH0_LDR_CORE2TX_SEL : String :=  "DONTCARE"; 
    CH1_LDR_CORE2TX_SEL : String :=  "DONTCARE"; 
    CH0_TPWDNB : String :=  "DONTCARE"; 
    CH1_TPWDNB : String :=  "DONTCARE"; 
    CH0_RATE_MODE_TX : String :=  "DONTCARE"; 
    CH1_RATE_MODE_TX : String :=  "DONTCARE"; 
    CH0_RTERM_TX : String :=  "DONTCARE"; 
    CH1_RTERM_TX : String :=  "DONTCARE"; 
    CH0_TX_CM_SEL : String := "DONTCARE"; 
    CH1_TX_CM_SEL : String := "DONTCARE"; 
    CH0_TDRV_PRE_EN : String :=  "DONTCARE"; 
    CH1_TDRV_PRE_EN : String :=  "DONTCARE"; 
    CH0_TDRV_SLICE0_SEL : String := "DONTCARE"; 
    CH1_TDRV_SLICE0_SEL : String := "DONTCARE"; 
    CH0_TDRV_SLICE1_SEL : String := "DONTCARE"; 
    CH1_TDRV_SLICE1_SEL : String := "DONTCARE"; 
    CH0_TDRV_SLICE2_SEL : String := "DONTCARE"; 
    CH1_TDRV_SLICE2_SEL : String := "DONTCARE"; 
    CH0_TDRV_SLICE3_SEL : String := "DONTCARE"; 
    CH1_TDRV_SLICE3_SEL : String := "DONTCARE"; 
    CH0_TDRV_SLICE4_SEL : String := "DONTCARE"; 
    CH1_TDRV_SLICE4_SEL : String := "DONTCARE"; 
    CH0_TDRV_SLICE5_SEL : String := "DONTCARE"; 
    CH1_TDRV_SLICE5_SEL : String := "DONTCARE"; 
    CH0_TDRV_SLICE0_CUR : String := "DONTCARE"; 
    CH1_TDRV_SLICE0_CUR : String := "DONTCARE"; 
    CH0_TDRV_SLICE1_CUR : String := "DONTCARE"; 
    CH1_TDRV_SLICE1_CUR : String := "DONTCARE"; 
    CH0_TDRV_SLICE2_CUR : String := "DONTCARE"; 
    CH1_TDRV_SLICE2_CUR : String := "DONTCARE"; 
    CH0_TDRV_SLICE3_CUR : String := "DONTCARE"; 
    CH1_TDRV_SLICE3_CUR : String := "DONTCARE"; 
    CH0_TDRV_SLICE4_CUR : String := "DONTCARE"; 
    CH1_TDRV_SLICE4_CUR : String := "DONTCARE"; 
    CH0_TDRV_SLICE5_CUR : String := "DONTCARE"; 
    CH1_TDRV_SLICE5_CUR : String := "DONTCARE"; 
    CH0_TDRV_DAT_SEL : String :=  "DONTCARE"; 
    CH1_TDRV_DAT_SEL : String :=  "DONTCARE"; 
    CH0_TX_DIV11_SEL : String :=  "DONTCARE"; 
    CH1_TX_DIV11_SEL : String :=  "DONTCARE"; 
    CH0_RPWDNB : String :=  "DONTCARE"; 
    CH1_RPWDNB : String :=  "DONTCARE"; 
    CH0_RATE_MODE_RX : String :=  "DONTCARE"; 
    CH1_RATE_MODE_RX : String :=  "DONTCARE"; 
    CH0_RLOS_SEL : String :=  "DONTCARE"; 
    CH1_RLOS_SEL : String :=  "DONTCARE"; 
    CH0_RX_LOS_LVL : String :=  "DONTCARE"; 
    CH1_RX_LOS_LVL : String :=  "DONTCARE"; 
    CH0_RX_LOS_CEQ : String :=  "DONTCARE"; 
    CH1_RX_LOS_CEQ : String :=  "DONTCARE"; 
    CH0_RX_LOS_HYST_EN : String :=  "DONTCARE"; 
    CH1_RX_LOS_HYST_EN : String :=  "DONTCARE"; 
    CH0_RX_LOS_EN : String :=  "DONTCARE"; 
    CH1_RX_LOS_EN : String :=  "DONTCARE"; 
    CH0_RX_DIV11_SEL : String :=  "DONTCARE"; 
    CH1_RX_DIV11_SEL : String :=  "DONTCARE"; 
    CH0_SEL_SD_RX_CLK : String :=  "DONTCARE"; 
    CH1_SEL_SD_RX_CLK : String :=  "DONTCARE"; 
    CH0_FF_RX_H_CLK_EN : String :=  "DONTCARE"; 
    CH1_FF_RX_H_CLK_EN : String :=  "DONTCARE"; 
    CH0_FF_RX_F_CLK_DIS : String :=  "DONTCARE"; 
    CH1_FF_RX_F_CLK_DIS : String :=  "DONTCARE"; 
    CH0_FF_TX_H_CLK_EN : String :=  "DONTCARE"; 
    CH1_FF_TX_H_CLK_EN : String :=  "DONTCARE"; 
    CH0_FF_TX_F_CLK_DIS : String :=  "DONTCARE"; 
    CH1_FF_TX_F_CLK_DIS : String :=  "DONTCARE"; 
    CH0_RX_RATE_SEL : String :=  "DONTCARE"; 
    CH1_RX_RATE_SEL : String :=  "DONTCARE"; 
    CH0_TDRV_POST_EN : String :=  "DONTCARE"; 
    CH1_TDRV_POST_EN : String :=  "DONTCARE"; 
    CH0_TX_POST_SIGN : String :=  "DONTCARE"; 
    CH1_TX_POST_SIGN : String :=  "DONTCARE"; 
    CH0_TX_PRE_SIGN : String :=  "DONTCARE"; 
    CH1_TX_PRE_SIGN : String :=  "DONTCARE"; 
    CH0_RXTERM_CM : String :=  "DONTCARE"; 
    CH1_RXTERM_CM : String :=  "DONTCARE"; 
    CH0_RXIN_CM : String :=  "DONTCARE"; 
    CH1_RXIN_CM : String :=  "DONTCARE"; 
    CH0_LEQ_OFFSET_SEL : String :=  "DONTCARE"; 
    CH1_LEQ_OFFSET_SEL : String :=  "DONTCARE"; 
    CH0_LEQ_OFFSET_TRIM : String :=  "DONTCARE"; 
    CH1_LEQ_OFFSET_TRIM : String :=  "DONTCARE"; 
    D_TX_MAX_RATE : String :=  "DONTCARE"; 
    CH0_CDR_MAX_RATE : String :=  "DONTCARE"; 
    CH1_CDR_MAX_RATE : String :=  "DONTCARE"; 
    CH0_TXAMPLITUDE : String :=  "DONTCARE"; 
    CH1_TXAMPLITUDE : String :=  "DONTCARE"; 
    CH0_TXDEPRE : String :=  "DONTCARE"; 
    CH1_TXDEPRE : String :=  "DONTCARE"; 
    CH0_TXDEPOST : String :=  "DONTCARE"; 
    CH1_TXDEPOST : String :=  "DONTCARE"; 
    CH0_PROTOCOL : String :=  "DONTCARE"; 
    CH1_PROTOCOL : String :=  "DONTCARE"; 
   
    D_ISETLOS : String :=  "DONTCARE"; 
    D_SETIRPOLY_AUX : String :=  "DONTCARE"; 
    D_SETICONST_AUX : String :=  "DONTCARE"; 
    D_SETIRPOLY_CH : String :=  "DONTCARE"; 
    D_SETICONST_CH : String :=  "DONTCARE"; 
    D_REQ_ISET : String :=  "DONTCARE"; 
    D_PD_ISET : String :=  "DONTCARE"; 
    D_DCO_CALIB_TIME_SEL : String :=  "DONTCARE"; 
    CH0_DCOCTLGI : String :=  "DONTCARE"; 
    CH1_DCOCTLGI : String :=  "DONTCARE"; 
    CH0_DCOATDDLY : String :=  "DONTCARE"; 
    CH1_DCOATDDLY : String :=  "DONTCARE"; 
    CH0_DCOATDCFG : String :=  "DONTCARE"; 
    CH1_DCOATDCFG : String :=  "DONTCARE"; 
    CH0_DCOBYPSATD : String :=  "DONTCARE"; 
    CH1_DCOBYPSATD : String :=  "DONTCARE"; 
    CH0_DCOSCALEI : String :=  "DONTCARE"; 
    CH1_DCOSCALEI : String :=  "DONTCARE"; 
    CH0_DCOITUNE4LSB : String :=  "DONTCARE"; 
    CH1_DCOITUNE4LSB : String :=  "DONTCARE"; 
    CH0_DCOIOSTUNE : String :=  "DONTCARE"; 
    CH1_DCOIOSTUNE : String :=  "DONTCARE"; 
    CH0_DCODISBDAVOID : String :=  "DONTCARE"; 
    CH1_DCODISBDAVOID : String :=  "DONTCARE"; 
    CH0_DCOCALDIV : String :=  "DONTCARE"; 
    CH1_DCOCALDIV : String :=  "DONTCARE"; 
    CH0_DCONUOFLSB : String :=  "DONTCARE"; 
    CH1_DCONUOFLSB : String :=  "DONTCARE"; 
    CH0_DCOIUPDNX2 : String :=  "DONTCARE"; 
    CH1_DCOIUPDNX2 : String :=  "DONTCARE"; 
    CH0_DCOSTEP : String :=  "DONTCARE"; 
    CH1_DCOSTEP : String :=  "DONTCARE"; 
    CH0_DCOSTARTVAL : String :=  "DONTCARE"; 
    CH1_DCOSTARTVAL : String :=  "DONTCARE"; 
    CH0_DCOFLTDAC : String :=  "DONTCARE"; 
    CH1_DCOFLTDAC : String :=  "DONTCARE"; 
    CH0_DCOITUNE : String :=  "DONTCARE"; 
    CH1_DCOITUNE : String :=  "DONTCARE"; 
    CH0_DCOFTNRG : String :=  "DONTCARE"; 
    CH1_DCOFTNRG : String :=  "DONTCARE"; 
    CH0_CDR_CNT4SEL : String :=  "DONTCARE"; 
    CH1_CDR_CNT4SEL : String :=  "DONTCARE"; 
    CH0_CDR_CNT8SEL : String :=  "DONTCARE"; 
    CH1_CDR_CNT8SEL : String :=  "DONTCARE"; 
    CH0_BAND_THRESHOLD : String :=  "DONTCARE"; 
    CH1_BAND_THRESHOLD : String :=  "DONTCARE"; 
    CH0_AUTO_FACQ_EN : String :=  "DONTCARE"; 
    CH1_AUTO_FACQ_EN : String :=  "DONTCARE"; 
    CH0_AUTO_CALIB_EN : String :=  "DONTCARE"; 
    CH1_AUTO_CALIB_EN : String :=  "DONTCARE"; 
    CH0_CALIB_CK_MODE : String :=  "DONTCARE"; 
    CH1_CALIB_CK_MODE : String :=  "DONTCARE"; 
    CH0_REG_BAND_OFFSET : String :=  "DONTCARE"; 
    CH1_REG_BAND_OFFSET : String :=  "DONTCARE"; 
    CH0_REG_BAND_SEL : String :=  "DONTCARE"; 
    CH1_REG_BAND_SEL : String :=  "DONTCARE"; 
    CH0_REG_IDAC_SEL : String :=  "DONTCARE"; 
    CH1_REG_IDAC_SEL : String :=  "DONTCARE"; 
    CH0_REG_IDAC_EN : String :=  "DONTCARE"; 
    CH1_REG_IDAC_EN : String :=  "DONTCARE"; 
    D_TXPLL_PWDNB : String :=  "DONTCARE"; 
    D_SETPLLRC : String :=  "DONTCARE"; 
    D_REFCK_MODE : String :=  "DONTCARE"; 
    D_TX_VCO_CK_DIV : String :=  "DONTCARE"; 
    D_PLL_LOL_SET : String :=  "DONTCARE"; 
    D_RG_EN : String :=  "DONTCARE"; 
    D_RG_SET : String :=  "DONTCARE"; 
    D_CMUSETISCL4VCO : String :=  "DONTCARE"; 
    D_CMUSETI4VCO : String :=  "DONTCARE"; 
    D_CMUSETINITVCT : String :=  "DONTCARE"; 
    D_CMUSETZGM : String :=  "DONTCARE"; 
    D_CMUSETP2AGM : String :=  "DONTCARE"; 
    D_CMUSETP1GM : String :=  "DONTCARE"; 
    D_CMUSETI4CPZ : String :=  "DONTCARE"; 
    D_CMUSETI4CPP : String :=  "DONTCARE"; 
    D_CMUSETICP4Z : String :=  "DONTCARE"; 
    D_CMUSETICP4P : String :=  "DONTCARE"; 
    D_CMUSETBIASI : String :=  "DONTCARE"
); 

   PORT (
   -- Channel and Dual Pins
        CH0_HDINP, CH1_HDINP, CH0_HDINN, CH1_HDINN, D_TXBIT_CLKP_FROM_ND, D_TXBIT_CLKN_FROM_ND, D_SYNC_ND, D_TXPLL_LOL_FROM_ND,
          CH0_RX_REFCLK, CH1_RX_REFCLK, CH0_FF_RXI_CLK, CH1_FF_RXI_CLK, CH0_FF_TXI_CLK, CH1_FF_TXI_CLK, CH0_FF_EBRD_CLK, CH1_FF_EBRD_CLK,
          CH0_FF_TX_D_0, CH1_FF_TX_D_0, CH0_FF_TX_D_1, CH1_FF_TX_D_1, CH0_FF_TX_D_2, CH1_FF_TX_D_2, CH0_FF_TX_D_3, CH1_FF_TX_D_3,
          CH0_FF_TX_D_4, CH1_FF_TX_D_4, CH0_FF_TX_D_5, CH1_FF_TX_D_5, CH0_FF_TX_D_6, CH1_FF_TX_D_6, CH0_FF_TX_D_7, CH1_FF_TX_D_7,
          CH0_FF_TX_D_8, CH1_FF_TX_D_8, CH0_FF_TX_D_9, CH1_FF_TX_D_9, CH0_FF_TX_D_10, CH1_FF_TX_D_10, CH0_FF_TX_D_11, CH1_FF_TX_D_11,
          CH0_FF_TX_D_12, CH1_FF_TX_D_12, CH0_FF_TX_D_13, CH1_FF_TX_D_13, CH0_FF_TX_D_14, CH1_FF_TX_D_14, CH0_FF_TX_D_15, CH1_FF_TX_D_15,
          CH0_FF_TX_D_16, CH1_FF_TX_D_16, CH0_FF_TX_D_17, CH1_FF_TX_D_17, CH0_FF_TX_D_18, CH1_FF_TX_D_18, CH0_FF_TX_D_19, CH1_FF_TX_D_19,
          CH0_FF_TX_D_20, CH1_FF_TX_D_20, CH0_FF_TX_D_21, CH1_FF_TX_D_21, CH0_FF_TX_D_22, CH1_FF_TX_D_22, CH0_FF_TX_D_23, CH1_FF_TX_D_23,
          CH0_FFC_EI_EN, CH1_FFC_EI_EN, CH0_FFC_PCIE_DET_EN, CH1_FFC_PCIE_DET_EN, CH0_FFC_PCIE_CT, CH1_FFC_PCIE_CT, CH0_FFC_SB_INV_RX, CH1_FFC_SB_INV_RX,
          CH0_FFC_ENABLE_CGALIGN, CH1_FFC_ENABLE_CGALIGN, CH0_FFC_SIGNAL_DETECT, CH1_FFC_SIGNAL_DETECT, CH0_FFC_FB_LOOPBACK, CH1_FFC_FB_LOOPBACK, CH0_FFC_SB_PFIFO_LP, CH1_FFC_SB_PFIFO_LP,
          CH0_FFC_PFIFO_CLR, CH1_FFC_PFIFO_CLR, CH0_FFC_RATE_MODE_RX, CH1_FFC_RATE_MODE_RX, CH0_FFC_RATE_MODE_TX, CH1_FFC_RATE_MODE_TX, CH0_FFC_DIV11_MODE_RX, CH1_FFC_DIV11_MODE_RX, CH0_FFC_RX_GEAR_MODE, CH1_FFC_RX_GEAR_MODE, CH0_FFC_TX_GEAR_MODE, CH1_FFC_TX_GEAR_MODE,
          CH0_FFC_DIV11_MODE_TX, CH1_FFC_DIV11_MODE_TX, CH0_FFC_LDR_CORE2TX_EN, CH1_FFC_LDR_CORE2TX_EN, CH0_FFC_LANE_TX_RST, CH1_FFC_LANE_TX_RST, CH0_FFC_LANE_RX_RST, CH1_FFC_LANE_RX_RST,
          CH0_FFC_RRST, CH1_FFC_RRST, CH0_FFC_TXPWDNB, CH1_FFC_TXPWDNB, CH0_FFC_RXPWDNB, CH1_FFC_RXPWDNB, CH0_LDR_CORE2TX, CH1_LDR_CORE2TX,
          D_SCIWDATA0, D_SCIWDATA1, D_SCIWDATA2, D_SCIWDATA3, D_SCIWDATA4, D_SCIWDATA5, D_SCIWDATA6, D_SCIWDATA7,
          D_SCIADDR0, D_SCIADDR1, D_SCIADDR2, D_SCIADDR3, D_SCIADDR4, D_SCIADDR5, D_SCIENAUX, D_SCISELAUX,
          CH0_SCIEN, CH1_SCIEN, CH0_SCISEL, CH1_SCISEL, D_SCIRD, D_SCIWSTN, D_CYAWSTN, D_FFC_SYNC_TOGGLE,
          D_FFC_DUAL_RST, D_FFC_MACRO_RST, D_FFC_MACROPDB, D_FFC_TRST, CH0_FFC_CDR_EN_BITSLIP, CH1_FFC_CDR_EN_BITSLIP, D_SCAN_ENABLE, D_SCAN_IN_0,
          D_SCAN_IN_1, D_SCAN_IN_2, D_SCAN_IN_3, D_SCAN_IN_4, D_SCAN_IN_5, D_SCAN_IN_6, D_SCAN_IN_7, D_SCAN_MODE,
          D_SCAN_RESET, D_CIN0, D_CIN1, D_CIN2, D_CIN3, D_CIN4, D_CIN5, D_CIN6,
          D_CIN7, D_CIN8, D_CIN9, D_CIN10, D_CIN11 : IN std_logic := 'X';

    CH0_HDOUTP, CH1_HDOUTP, CH0_HDOUTN, CH1_HDOUTN, D_TXBIT_CLKP_TO_ND, D_TXBIT_CLKN_TO_ND, D_SYNC_PULSE2ND, D_TXPLL_LOL_TO_ND,
          CH0_FF_RX_F_CLK, CH1_FF_RX_F_CLK, CH0_FF_RX_H_CLK, CH1_FF_RX_H_CLK, CH0_FF_TX_F_CLK, CH1_FF_TX_F_CLK, CH0_FF_TX_H_CLK, CH1_FF_TX_H_CLK,
          CH0_FF_RX_PCLK, CH1_FF_RX_PCLK, CH0_FF_TX_PCLK, CH1_FF_TX_PCLK, CH0_FF_RX_D_0, CH1_FF_RX_D_0, CH0_FF_RX_D_1, CH1_FF_RX_D_1,
          CH0_FF_RX_D_2, CH1_FF_RX_D_2, CH0_FF_RX_D_3, CH1_FF_RX_D_3, CH0_FF_RX_D_4, CH1_FF_RX_D_4, CH0_FF_RX_D_5, CH1_FF_RX_D_5,
          CH0_FF_RX_D_6, CH1_FF_RX_D_6, CH0_FF_RX_D_7, CH1_FF_RX_D_7, CH0_FF_RX_D_8, CH1_FF_RX_D_8, CH0_FF_RX_D_9, CH1_FF_RX_D_9,
          CH0_FF_RX_D_10, CH1_FF_RX_D_10, CH0_FF_RX_D_11, CH1_FF_RX_D_11, CH0_FF_RX_D_12, CH1_FF_RX_D_12, CH0_FF_RX_D_13, CH1_FF_RX_D_13,
          CH0_FF_RX_D_14, CH1_FF_RX_D_14, CH0_FF_RX_D_15, CH1_FF_RX_D_15, CH0_FF_RX_D_16, CH1_FF_RX_D_16, CH0_FF_RX_D_17, CH1_FF_RX_D_17,
          CH0_FF_RX_D_18, CH1_FF_RX_D_18, CH0_FF_RX_D_19, CH1_FF_RX_D_19, CH0_FF_RX_D_20, CH1_FF_RX_D_20, CH0_FF_RX_D_21, CH1_FF_RX_D_21,
          CH0_FF_RX_D_22, CH1_FF_RX_D_22, CH0_FF_RX_D_23, CH1_FF_RX_D_23, CH0_FFS_PCIE_DONE, CH1_FFS_PCIE_DONE, CH0_FFS_PCIE_CON, CH1_FFS_PCIE_CON,
          CH0_FFS_RLOS, CH1_FFS_RLOS, CH0_FFS_LS_SYNC_STATUS, CH1_FFS_LS_SYNC_STATUS, CH0_FFS_CC_UNDERRUN, CH1_FFS_CC_UNDERRUN, CH0_FFS_CC_OVERRUN, CH1_FFS_CC_OVERRUN,
          CH0_FFS_RXFBFIFO_ERROR, CH1_FFS_RXFBFIFO_ERROR, CH0_FFS_TXFBFIFO_ERROR, CH1_FFS_TXFBFIFO_ERROR, CH0_FFS_RLOL, CH1_FFS_RLOL, CH0_FFS_SKP_ADDED, CH1_FFS_SKP_ADDED,
          CH0_FFS_SKP_DELETED, CH1_FFS_SKP_DELETED, CH0_LDR_RX2CORE, CH1_LDR_RX2CORE, D_SCIRDATA0, D_SCIRDATA1, D_SCIRDATA2, D_SCIRDATA3,
          D_SCIRDATA4, D_SCIRDATA5, D_SCIRDATA6, D_SCIRDATA7, D_SCIINT, D_SCAN_OUT_0, D_SCAN_OUT_1, D_SCAN_OUT_2,
          D_SCAN_OUT_3, D_SCAN_OUT_4, D_SCAN_OUT_5, D_SCAN_OUT_6, D_SCAN_OUT_7, D_COUT0, D_COUT1, D_COUT2,
          D_COUT3, D_COUT4, D_COUT5, D_COUT6, D_COUT7, D_COUT8, D_COUT9, D_COUT10,
          D_COUT11, D_COUT12, D_COUT13, D_COUT14, D_COUT15, D_COUT16, D_COUT17, D_COUT18,
          D_COUT19 : OUT std_logic := 'X';

   -- No of ports = 157 inputs + 129 outputs = 286

   -- PLL Pins
     D_REFCLKI : IN std_logic := 'X';
     D_FFS_PLOL : OUT std_logic := 'X'

  ); 
END COMPONENT;


COMPONENT EHXPLLM
GENERIC (
   CLKI_DIV      : Integer := 1;
   CLKFB_DIV     : Integer := 1;
   CLKOP_DIV     : Integer := 8;
   CLKOS_DIV     : Integer := 8;
   CLKOS2_DIV    : Integer := 8;
   CLKOS3_DIV    : Integer := 8;
   CLKOP_ENABLE  : String := "ENABLED";
   CLKOS_ENABLE  : String := "DISABLED";
   CLKOS2_ENABLE         : String := "DISABLED";
   CLKOS3_ENABLE         : String := "DISABLED";
   CLKOP_CPHASE  : Integer := 0;
   CLKOS_CPHASE  : Integer := 0;
   CLKOS2_CPHASE         : Integer := 0;
   CLKOS3_CPHASE         : Integer := 0;
   CLKOP_FPHASE  : Integer := 0;
   CLKOS_FPHASE  : Integer := 0;
   CLKOS2_FPHASE         : Integer := 0;
   CLKOS3_FPHASE         : Integer := 0;
   FEEDBK_PATH   : String := "CLKOP";
   CLKOP_TRIM_POL        : String := "RISING";
   CLKOP_TRIM_DELAY      : Integer := 0;
   CLKOS_TRIM_POL        : String := "RISING";
   CLKOS_TRIM_DELAY      : Integer := 0;
   OUTDIVIDER_MUXA       : String := "DIVA";
   OUTDIVIDER_MUXB       : String := "DIVB";
   OUTDIVIDER_MUXC       : String := "DIVC";
   OUTDIVIDER_MUXD       : String := "DIVD";
   PLL_LOCK_MODE         : Integer := 0;
   PLL_LOCK_DELAY        : Integer := 200;
   STDBY_ENABLE  : String := "DISABLED";
   REFIN_RESET   : String := "DISABLED";
   SYNC_ENABLE   : String := "DISABLED";
   INT_LOCK_STICKY       : String := "ENABLED";
   DPHASE_SOURCE         : String := "DISABLED";
   PLLRST_ENA    : String := "DISABLED";
   INTFB_WAKE    : String := "DISABLED" );
PORT (
   CLKI, CLKFB, PHASESEL1, PHASESEL0, PHASEDIR, PHASESTEP, PHASELOADREG,
   USRSTDBY, PLLWAKESYNC,
   RST, ENCLKOP, ENCLKOS, ENCLKOS2, ENCLKOS3 : IN std_logic := 'X';
   CLKOP,CLKOS,CLKOS2,CLKOS3,LOCK,INTLOCK,
   REFCLK, CLKINTFB : OUT std_logic := 'X' );
END COMPONENT;


COMPONENT OSCI
GENERIC (
   HFCLKDIV   : Integer := 1 );
PORT (
     HFOUTEN : IN std_logic := 'X';
    HFCLKOUT, LFCLKOUT : OUT std_logic := 'X' );
END COMPONENT;


COMPONENT DP8KE
GENERIC(
        DATA_WIDTH_A : in Integer := 9;
        DATA_WIDTH_B : in Integer := 9;
        REGMODE_A    : String  := "NOREG";
        REGMODE_B    : String  := "NOREG";
        CSDECODE_A   : String  := "0b000";
        CSDECODE_B   : String  := "0b000";
        WRITEMODE_A  : String  := "NORMAL";
        WRITEMODE_B  : String  := "NORMAL";
        GSR : String  := "ENABLED";
        RESETMODE : String := "SYNC";
        ASYNC_RESET_RELEASE    : String  := "SYNC";
        INIT_DATA : String := "STATIC";
        INITVAL_00 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_01 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_02 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_03 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_04 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_05 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_06 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_07 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_08 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_09 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_0A : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_0B : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_0C : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_0D : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_0E : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_0F : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_10 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_11 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_12 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_13 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_14 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_15 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_16 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_17 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_18 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_19 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_1A : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_1B : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_1C : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_1D : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_1E : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_1F : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        DIA8, DIA7, DIA6, DIA5, DIA4, DIA3, DIA2, DIA1, DIA0     : in std_logic := 'X';
        ADA12, ADA11, ADA10, ADA9, ADA8, ADA7, ADA6, ADA5        : in std_logic := 'X';
        ADA4, ADA3, ADA2, ADA1, ADA0                             : in std_logic := 'X';
        CEA, OCEA, CLKA, WEA, CSA2, CSA1, CSA0, RSTA             : in std_logic := 'X';
        DIB8, DIB7, DIB6, DIB5, DIB4, DIB3, DIB2, DIB1, DIB0     : in std_logic := 'X';
        ADB12, ADB11, ADB10, ADB9, ADB8, ADB7, ADB6, ADB5        : in std_logic := 'X';
        ADB4, ADB3, ADB2, ADB1, ADB0                             : in std_logic := 'X';
        CEB, OCEB, CLKB, WEB, CSB2, CSB1, CSB0, RSTB             : in std_logic := 'X';

        DOA8, DOA7, DOA6, DOA5, DOA4, DOA3, DOA2, DOA1, DOA0     : out std_logic := 'X';
        DOB8, DOB7, DOB6, DOB5, DOB4, DOB3, DOB2, DOB1, DOB0     : out std_logic := 'X' );
END COMPONENT;

COMPONENT PDPW8KE
GENERIC(
        DATA_WIDTH_W : in Integer := 18;
        DATA_WIDTH_R : in Integer := 9;
        REGMODE      : String  := "NOREG";
        CSDECODE_W   : String  := "0b000";
        CSDECODE_R   : String  := "0b000";
        GSR : String  := "ENABLED";
        RESETMODE : String := "SYNC";
        ASYNC_RESET_RELEASE    : String  := "SYNC";
        INIT_DATA : String := "STATIC";
        INITVAL_00 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_01 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_02 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_03 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_04 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_05 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_06 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_07 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_08 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_09 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_0A : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_0B : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_0C : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_0D : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_0E : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_0F : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_10 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_11 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_12 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_13 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_14 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_15 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_16 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_17 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_18 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_19 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_1A : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_1B : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_1C : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_1D : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_1E : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_1F : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        DI17, DI16, DI15, DI14, DI13, DI12, DI11, DI10, DI9    : in std_logic := 'X';
        DI8, DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0            : in std_logic := 'X';
        ADW8, ADW7, ADW6, ADW5, ADW4, ADW3, ADW2, ADW1, ADW0   : in std_logic := 'X';
        BE1, BE0                                               : in std_logic := 'X';
        CEW, CLKW, CSW2, CSW1, CSW0                            : in std_logic := 'X';
        ADR12, ADR11, ADR10, ADR9, ADR8, ADR7, ADR6, ADR5      : in std_logic := 'X';
        ADR4, ADR3, ADR2, ADR1, ADR0                           : in std_logic := 'X';
        CER, OCER, CLKR, CSR2, CSR1, CSR0, RST                 : in std_logic := 'X';
        DO17, DO16, DO15, DO14, DO13, DO12, DO11, DO10, DO9    : out std_logic := 'X';
        DO8, DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0            : out std_logic := 'X'
  );
END COMPONENT;

COMPONENT I2CA
GENERIC(
   I2C_ID : string:= "I2C0";
   I2C_ADDRESSING : string:= "7BIT";
   I2C_SLAVE_ADDR : string:= "0b1000001";
   I2C_BUS_PERF : string:= "100kHz";
   I2C_CLK_DIVIDER : integer:= 1;
   I2C_GEN_CALL : string:= "DISABLED";
--   I2C_WAKEUP : string:= "DISABLED";

   I2C_INTR_ARBIT : string:= "DISABLED";
   I2C_INTR_TXRXRDY : string:= "DISABLED";
   I2C_INTR_NACK : string:= "DISABLED";
   I2C_INTR_GC : string:= "DISABLED";

   I2C_WAKEUP_SLAVE : string:= "DISABLED";
   I2C_WAKEUP_MASTER : string:= "DISABLED";
   SDA_I_DELAY : integer:= 0;
   SDA_O_DELAY : integer:= 0;

   I2C_FIFO_ENB : string:= "DISABLED";
   I2C_FIFO_CLKSTR : string:= "DISABLED";
   I2C_FIFO_RXALMOSTF : integer:= 30;
   I2C_FIFO_TXALMOSTE : integer:= 3;
   I2C_FIFO_INTR_GC : string:= "DISABLED";
   I2C_FIFO_INTR_NACK : string:= "DISABLED";
   I2C_FIFO_MRXRDY : string:= "DISABLED";
   I2C_FIFO_INTR_ARBIT : string:= "DISABLED";
   I2C_FIFO_TXSYNC : string:= "DISABLED";
   I2C_FIFO_TXUNDER : string:= "DISABLED";
   I2C_FIFO_RXOVER : string:= "DISABLED");
PORT(
 CSI, CLKI, STBI, WEI, ADRI3, ADRI2, ADRI1, ADRI0, DATI9, DATI8   : in std_logic := 'X';
 DATI7, DATI6, DATI5, DATI4, DATI3, DATI2, DATI1, DATI0      : in std_logic := 'X';
 FIFORST, SCLI, SDAI                                    : in std_logic := 'X';
 MRDCMPL, DATO9, DATO8, DATO7, DATO6, DATO5, DATO4, DATO3              : out std_logic := 'X';
 DATO2, DATO1, DATO0, ACKO, I2CIRQ, I2CWKUP, PMUWKUP             : out std_logic := 'X';
 SRDWR, TXFIFOAE,TXFIFOE, TXFIFOF, RXFIFOE, RXFIFOAF, RXFIFOF  : out std_logic := 'X';
 SCLO, SCLOEN, SDAO, SDAOEN            : out std_logic := 'X'
);
END COMPONENT;


COMPONENT PMUA
GENERIC(
 CLKSRC  : string:="INTCLK";
 UWDTEN  : string:= "DISABLED";
 UWDTMD  : string:= "COUNT_ONCE";
 UWDTINT  : string:= "ENABLED";
 EXTEN  : string:= "DISABLED";
 I2CEN  : string:= "ENABLED";
 WDTEN  : string:= "ENABLED";
 SLPCNT  : string:= "COUNTER_1";
 PMUWDTCNT1  : string:= "0x00000000";
 PMUWDTCNT2  : string:= "0x00000000";
 PMUWDTCNT3  : string:= "0x00000000");
PORT(
 USRWAKEUP,I2CWAKEUP,INTCLK,EXTCLK, USRCLK, USRCS : in std_logic := 'X';
 USRSTB, USRADR3, USRADR2, USRADR1, USRADR0      : in std_logic := 'X';
 USRDATA7, USRDATA6, USRDATA5, USRDATA4         : in std_logic := 'X';  
 USRDATA3, USRDATA2, USRDATA1, USRDATA0,SLEEP   : in std_logic := 'X';
 USRWDTDONE, USRWDTINT, SLEEPSTATUS              : out std_logic := 'X'
);
end component;


COMPONENT MIPIDPHYA
 GENERIC(				
   PLL_TST  : integer:= 9;  
   ENP_DESER  : integer:= 0;        
   HSEL : integer:= 1;
   HS_16BIT_EN : integer:= 1;
   CN : integer:= 1;
   CM : integer:= 1;
   CO : integer:= 1    
 );
PORT(
 CKP, CKN, DP0,DP1,DP2,DP3,DN0,DN1,DN2,DN3              : inout std_logic := 'X';
 CLKHSBYTE, CLKDRXLPP, CLKDRXLPN, LOCK,CLKDCDN, CLKDRXHS, HSBYTECLKD, HSBYTECLKS : out std_logic := 'X';
  LBEN,PDDPHY,PDBIAS, PDCKG, CLKREF,PDPLL,CLKRXHSEN,CLKRXLPEN,CLKCDEN,CLKDTXLPP,CLKTXLPEN,CLKDTXLPN,CLKTXHSEN,CLKTXHSGATE,CLKTXHSPD: in std_logic := 'X'; 
 
 D0DRXLPP,D0DRXLPN, D0DCDP, D0DCDN,D0HSRXDATA15,D0SYNC,D0ERRSYNC,D0NOSYNC,D0DRXHS : out std_logic := 'X';  
 D0HSRXDATA14, D0HSRXDATA13, D0HSRXDATA12, D0HSRXDATA11, D0HSRXDATA10: out std_logic := 'X';
 D0HSRXDATA9, D0HSRXDATA8, D0HSRXDATA7, D0HSRXDATA6, D0HSRXDATA5 : out std_logic := 'X';		
 D0HSRXDATA4, D0HSRXDATA3, D0HSRXDATA2, D0HSRXDATA1, D0HSRXDATA0 : out std_logic := 'X';																	
 
 D0RXLPEN,D0CDEN,D0DTXLPP,D0TXLPEN,D0DTXLPN,D0RXHSEN,D0HSDESEREN,D0TXHSEN,D0HSTXDATA15,D0HSSEREN,D0TXHSPD : in std_logic := 'X';															
 D0HSTXDATA14, D0HSTXDATA13, D0HSTXDATA12, D0HSTXDATA11, D0HSTXDATA10: in std_logic := 'X';	
 D0HSTXDATA9, D0HSTXDATA8, D0HSTXDATA7, D0HSTXDATA6, D0HSTXDATA5: in std_logic := 'X';		
 D0HSTXDATA4, D0HSTXDATA3, D0HSTXDATA2, D0HSTXDATA1, D0HSTXDATA0: in std_logic := 'X';	

 D1DRXLPP,D1DRXLPN, D1DCDP, D1DCDN,D1HSRXDATA15,D1SYNC,D1ERRSYNC,D1NOSYNC,D1DRXHS : out std_logic := 'X';  
 D1HSRXDATA14, D1HSRXDATA13, D1HSRXDATA12, D1HSRXDATA11, D1HSRXDATA10: out std_logic := 'X';
 D1HSRXDATA9, D1HSRXDATA8, D1HSRXDATA7, D1HSRXDATA6, D1HSRXDATA5 : out std_logic := 'X';		
 D1HSRXDATA4, D1HSRXDATA3, D1HSRXDATA2, D1HSRXDATA1, D1HSRXDATA0 : out std_logic := 'X';																	
 
 D1RXLPEN,D1CDEN,D1DTXLPP,D1TXLPEN,D1DTXLPN,D1RXHSEN,D1HSDESEREN,D1TXHSEN,D1HSTXDATA15,D1HSSEREN,D1TXHSPD : in std_logic := 'X';															
 D1HSTXDATA14, D1HSTXDATA13, D1HSTXDATA12, D1HSTXDATA11, D1HSTXDATA10: in std_logic := 'X';	
 D1HSTXDATA9, D1HSTXDATA8, D1HSTXDATA7, D1HSTXDATA6, D1HSTXDATA5: in std_logic := 'X';		
 D1HSTXDATA4, D1HSTXDATA3, D1HSTXDATA2, D1HSTXDATA1, D1HSTXDATA0: in std_logic := 'X'; 
 
  D2DRXLPP,D2DRXLPN, D2DCDP, D2DCDN,D2HSRXDATA15,D2SYNC,D2ERRSYNC,D2NOSYNC,D2DRXHS : out std_logic := 'X';  
 D2HSRXDATA14, D2HSRXDATA13, D2HSRXDATA12, D2HSRXDATA11, D2HSRXDATA10: out std_logic := 'X';
 D2HSRXDATA9, D2HSRXDATA8, D2HSRXDATA7, D2HSRXDATA6, D2HSRXDATA5 : out std_logic := 'X';		
 D2HSRXDATA4, D2HSRXDATA3, D2HSRXDATA2, D2HSRXDATA1, D2HSRXDATA0 : out std_logic := 'X';																	
 
 D2RXLPEN,D2CDEN,D2DTXLPP,D2TXLPEN,D2DTXLPN,D2RXHSEN,D2HSDESEREN,D2TXHSEN,D2HSTXDATA15,D2HSSEREN,D2TXHSPD : in std_logic := 'X';															
 D2HSTXDATA14, D2HSTXDATA13, D2HSTXDATA12, D2HSTXDATA11, D2HSTXDATA10: in std_logic := 'X';	
 D2HSTXDATA9, D2HSTXDATA8, D2HSTXDATA7, D2HSTXDATA6, D2HSTXDATA5: in std_logic := 'X';		
 D2HSTXDATA4, D2HSTXDATA3, D2HSTXDATA2, D2HSTXDATA1, D2HSTXDATA0: in std_logic := 'X';
 
  D3DRXLPP,D3DRXLPN, D3DCDP, D3DCDN,D3HSRXDATA15,D3SYNC,D3ERRSYNC,D3NOSYNC,D3DRXHS : out std_logic := 'X';  
 D3HSRXDATA14, D3HSRXDATA13, D3HSRXDATA12, D3HSRXDATA11, D3HSRXDATA10: out std_logic := 'X';
 D3HSRXDATA9, D3HSRXDATA8, D3HSRXDATA7, D3HSRXDATA6, D3HSRXDATA5 : out std_logic := 'X';		
 D3HSRXDATA4, D3HSRXDATA3, D3HSRXDATA2, D3HSRXDATA1, D3HSRXDATA0 : out std_logic := 'X';																	
 
 D3RXLPEN,D3CDEN,D3DTXLPP,D3TXLPEN,D3DTXLPN,D3RXHSEN,D3HSDESEREN,D3TXHSEN,D3HSTXDATA15,D3HSSEREN,D3TXHSPD : in std_logic := 'X';															
 D3HSTXDATA14, D3HSTXDATA13, D3HSTXDATA12, D3HSTXDATA11, D3HSTXDATA10: in std_logic := 'X';	
 D3HSTXDATA9, D3HSTXDATA8, D3HSTXDATA7, D3HSTXDATA6, D3HSTXDATA5: in std_logic := 'X';		
 D3HSTXDATA4, D3HSTXDATA3, D3HSTXDATA2, D3HSTXDATA1, D3HSTXDATA0: in std_logic := 'X' 	
 );
END COMPONENT;


COMPONENT MIPI
PORT(
AP : in std_logic := 'X';
AN  : in std_logic := 'X';
TP,TN,HSSEL      : in std_logic := 'X'; 
OLSP,OLSN,OHS		 : out std_logic := 'X';
BN,BP			 : inout std_logic := 'X'
);
END COMPONENT;


COMPONENT IDDRX4C
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
  D, ECLK, SCLK, RST, ALIGNWD : IN std_logic := 'X';
  Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7  : OUT std_logic := 'X' );
END COMPONENT;
  

COMPONENT IDDR141A
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D, SCLK, ECLK, RST, ALIGNWD : IN std_logic := 'X';
   Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13  : OUT std_logic := 'X' );
END COMPONENT;


COMPONENT IDDRX8A
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D, SCLK, ECLK, RST, ALIGNWD : IN std_logic := 'X';
   Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15  : OUT std_logic := 'X' );
END COMPONENT;
   
COMPONENT ODDRX4C
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D0, D1, D2, D3, D4, D5, D6, D7, ECLK , SCLK, RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
   


COMPONENT ODDR141A
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, ECLK , SCLK, RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;


COMPONENT ODDRX8A
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
    D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, ECLK , SCLK, RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;

COMPONENT ANEB2
PORT(
        A1, A0: IN std_logic := 'X';
        B1, B0: IN std_logic := 'X';
        CI: IN std_logic := 'X';
        NE: OUT std_logic := 'X'
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

      MEM(23) <= '0', '1' after 1.0 ns, '0' after 5.0 ns;

   END mem_initialize;

END components;


