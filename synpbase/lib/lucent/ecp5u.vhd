-- --------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------
-- Copyright (c) 2002-2012 by Lattice Semiconductor Corporation
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
-- Header files for ECP5U family.
--
-- --------------------------------------------------------------------

LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
PACKAGE components IS 
   attribute syn_black_box: boolean ;
   attribute syn_black_box of Components : package is true;
   attribute black_box_pad_pin: string;
   attribute syn_lib_cell : boolean;
   attribute syn_unconnected_inputs: string;
   attribute syn_noprune : boolean;
   attribute syn_lib_cell of components : package is true;
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
   attribute syn_black_box of CCU2C : Component is true;
    attribute syn_unconnected_inputs of CCU2C : component is "CIN";
--
COMPONENT AND2
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of and2 : Component is true;
--
COMPONENT AND3
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of and3 : Component is true;
-- 
COMPONENT AND4
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of and4 : Component is true;
-- 
COMPONENT AND5
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	e: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of and5 : Component is true;
--
COMPONENT FD1P3AX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of fd1p3ax : Component is true;
-- 
COMPONENT FD1P3AY
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of fd1p3ay : Component is true;
-- 
COMPONENT FD1P3BX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	pd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of fd1p3bx : Component is true;
-- 
COMPONENT FD1P3DX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	cd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of fd1p3dx : Component is true;
-- 
COMPONENT FD1P3IX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	cd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of fd1p3ix : Component is true;
-- 
COMPONENT FD1P3JX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	sp: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	pd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of fd1p3jx : Component is true;
-- 
COMPONENT FD1S3AX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	ck: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of fd1s3ax : Component is true;
-- 
COMPONENT FD1S3AY
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	ck: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of fd1s3ay : Component is true;
-- 
COMPONENT FD1S3BX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	ck: IN std_logic := 'X';
	pd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of fd1s3bx : Component is true;
-- 
COMPONENT FD1S3DX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	cd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of fd1s3dx : Component is true;
-- 
COMPONENT FD1S3IX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	ck: IN std_logic := 'X';
	cd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of fd1s3ix : Component is true;
-- 
COMPONENT FD1S3JX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d : IN std_logic := 'X';
	ck: IN std_logic := 'X';
	pd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of fd1s3jx : Component is true;
-- 
COMPONENT FL1P3AZ
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
   attribute syn_black_box of fl1p3az : Component is true;
-- 
COMPONENT FL1P3AY
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
   attribute syn_black_box of fl1p3ay : Component is true;
-- 
COMPONENT FL1P3BX
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
   attribute syn_black_box of fl1p3bx : Component is true;
-- 
COMPONENT FL1P3DX
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
   attribute syn_black_box of fl1p3dx : Component is true;
-- 
COMPONENT FL1P3IY
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
   attribute syn_black_box of fl1p3iy : Component is true;
-- 
COMPONENT FL1P3JY
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
   attribute syn_black_box of fl1p3jy : Component is true;
-- 
COMPONENT FL1S3AX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of fl1s3ax : Component is true;
-- 
COMPONENT FL1S3AY
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	ck: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of fl1s3ay : Component is true;
-- 
COMPONENT PUR
      GENERIC (RST_PULSE  : integer   := 1);
PORT(
      PUR: IN std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of PUR  : Component is true;
   attribute syn_noprune of pur : component is true;
--
COMPONENT GSR
PORT( 
      gsr: IN std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of gsr : Component is true;
   attribute syn_noprune of gsr : component is true;
--
COMPONENT SGSR
PORT(
      gsr: IN std_logic := 'X';
      clk : IN std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of sgsr : Component is true;
   attribute syn_noprune of sgsr : component is true;
--
COMPONENT INV
PORT( 
	a: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of inv : Component is true;
-- 
COMPONENT IFS1P3BX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sp  : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	pd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ifs1p3bx : Component is true;
-- 
COMPONENT IFS1P3DX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sp  : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	cd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ifs1p3dx : Component is true;
-- 
COMPONENT IFS1P3IX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sp  : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	cd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ifs1p3ix : Component is true;
-- 
COMPONENT IFS1P3JX
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sp  : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	pd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ifs1p3jx : Component is true;
-- 
COMPONENT IFS1S1B
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	pd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ifs1s1b : Component is true;
-- 
COMPONENT IFS1S1D
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	cd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ifs1s1d : Component is true;
-- 
COMPONENT IFS1S1I
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	cd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ifs1s1i : Component is true;
-- 
COMPONENT IFS1S1J
    GENERIC (gsr : String := "ENABLED");
PORT( 
	d   : IN std_logic := 'X';
	sclk: IN std_logic := 'X';
	pd  : IN std_logic := 'X';
	q   : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ifs1s1j : Component is true;
-- 
COMPONENT L6MUX21
PORT(
        d0: IN std_logic := 'X';
        d1: IN std_logic := 'X';
        sd: IN std_logic := 'X';
        z : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of l6mux21 : Component is true;
-- 
COMPONENT MUX21
PORT( 
	d0: IN std_logic := 'X';
	d1: IN std_logic := 'X';
	sd: IN std_logic := 'X';
	z : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of mux21 : Component is true;
--
COMPONENT MUX41
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
   attribute syn_black_box of mux41 : Component is true;
-- 
COMPONENT MUX81
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
   attribute syn_black_box of mux81 : Component is true;
-- 
COMPONENT MUX161
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
   attribute syn_black_box of mux161 : Component is true;
--
COMPONENT MUX321
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
   attribute syn_black_box of mux321 : Component is true;
--
COMPONENT ND2
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of nd2 : Component is true;
-- 
COMPONENT ND3
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of nd3 : Component is true;
-- 
COMPONENT ND4
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of nd4 : Component is true;
-- 
COMPONENT ND5
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	e: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of nd5 : Component is true;
-- 
COMPONENT NR2
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of nr2 : Component is true;
-- 
COMPONENT NR3
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of nr3 : Component is true;
-- 
COMPONENT NR4
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of nr4 : Component is true;
-- 
COMPONENT NR5
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	e: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of nr5 : Component is true;
--
COMPONENT OFS1P3BX
    GENERIC (gsr : String := "ENABLED");
PORT(
        d : IN std_logic := 'X';
        sp: IN std_logic := 'X';
        sclk: IN std_logic := 'X';
        pd: IN std_logic := 'X';
        q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ofs1p3bx : Component is true;
--
COMPONENT OFS1P3DX
    GENERIC (gsr : String := "ENABLED");
PORT(
        d : IN std_logic := 'X';
        sp: IN std_logic := 'X';
        sclk: IN std_logic := 'X';
        cd: IN std_logic := 'X';
        q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ofs1p3dx : Component is true;
--
COMPONENT OFS1P3IX
    GENERIC (gsr : String := "ENABLED");
PORT(
        d : IN std_logic := 'X';
        sp: IN std_logic := 'X';
        sclk: IN std_logic := 'X';
        cd: IN std_logic := 'X';
        q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ofs1p3ix : Component is true;
--
COMPONENT OFS1P3JX
    GENERIC (gsr : String := "ENABLED");
PORT(
        d : IN std_logic := 'X';
        sp: IN std_logic := 'X';
        sclk: IN std_logic := 'X';
        pd: IN std_logic := 'X';
        q : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ofs1p3jx : Component is true;
--
COMPONENT OR2
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of or2 : Component is true;
-- 
COMPONENT OR3
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of or3 : Component is true;
-- 
COMPONENT OR4
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of or4 : Component is true;
-- 
COMPONENT OR5
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	e: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of or5 : Component is true;
-- 
COMPONENT PFUMX
PORT( 
	alut: IN std_logic := 'X';
	blut: IN std_logic := 'X';
	c0  : IN std_logic := 'X';
	z   : OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of pfumx : Component is true;
-- 
COMPONENT ROM16X1A
GENERIC(
        initval : std_logic_vector(15 downto 0) := "0000000000000000"
  );
PORT( 
	ad0, ad1, ad2, ad3: IN std_logic := 'X';
	do0: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of rom16x1a : Component is true;
-- 
COMPONENT ROM32X1A
GENERIC(
        initval : std_logic_vector(31 downto 0) := "00000000000000000000000000000000"
  );
PORT( 
	ad0, ad1, ad2, ad3, ad4: IN std_logic := 'X';
	do0: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of rom32x1a : Component is true;
-- 
COMPONENT ROM64X1A
GENERIC(
        initval : std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        ad0, ad1, ad2, ad3, ad4, ad5 : IN std_logic := 'X';
        do0: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of rom64x1a : Component is true;
--
COMPONENT ROM128X1A
GENERIC(
        initval : std_logic_vector(127 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        ad0, ad1, ad2, ad3, ad4, ad5, ad6 : IN std_logic := 'X';
        do0: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of rom128x1a : Component is true;
--
COMPONENT ROM256X1A
GENERIC(
        initval : std_logic_vector(255 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        ad0, ad1, ad2, ad3, ad4, ad5, ad6, ad7 : IN std_logic := 'X';
        do0: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of rom256x1a : Component is true;
--
COMPONENT VHI
PORT( 
	 z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of vhi : Component is true;
-- 
COMPONENT VLO
PORT( 
	 z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of vlo : Component is true;
-- 
COMPONENT XOR2
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of xor2 : Component is true;
-- 
COMPONENT XOR3
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of xor3 : Component is true;
-- 
COMPONENT XOR4
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of xor4 : Component is true;
-- 
COMPONENT XOR5
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	e: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of xor5 : Component is true;
-- 
COMPONENT XOR11
PORT( 
        a, b, c, d, e, f, g, h, i, j, k: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of xor11 : Component is true;
-- 
COMPONENT XOR21
PORT( 
	a, b, c, d, e, f, g, h, i, j, k: IN std_logic := 'X';
	l, m, n, o, p, q, r, s, t, u: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of xor21 : Component is true;
-- 
COMPONENT XNOR2
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of xnor2 : Component is true;
-- 
COMPONENT XNOR3
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of xnor3 : Component is true;
-- 
COMPONENT XNOR4
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of xnor4 : Component is true;
-- 
COMPONENT XNOR5
PORT( 
	a: IN std_logic := 'X';
	b: IN std_logic := 'X';
	c: IN std_logic := 'X';
	d: IN std_logic := 'X';
	e: IN std_logic := 'X';
	z: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of xnor5 : Component is true;
-- 
COMPONENT ILVDS
PORT(
        a : IN std_logic := 'X';
        an: IN std_logic := 'X';
        z : OUT std_logic
 );
END COMPONENT;
   attribute syn_black_box of ilvds : Component is true;
   attribute black_box_pad_pin of ilvds : component is "a,an";
--
COMPONENT OLVDS
PORT(
        a  : IN std_logic := 'X';
        z  : OUT std_logic ;
        zn : OUT std_logic
 );
END COMPONENT;
   attribute syn_black_box of olvds : Component is true;
   attribute black_box_pad_pin of olvds : component is "z,zn";
--
COMPONENT BB
PORT(
        b:  INOUT std_logic := 'X';
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
   attribute syn_black_box of bb : Component is true;
   attribute black_box_pad_pin of bb : component is "b";
--
COMPONENT BBW
PORT(
        b:  INOUT std_logic := 'X';
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
   attribute syn_black_box of bbw : Component is true;
   attribute black_box_pad_pin of bbw : component is "b";
--
COMPONENT BBPD
PORT(
        b:  INOUT std_logic := 'X';
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
   attribute syn_black_box of bbpd : Component is true;
   attribute black_box_pad_pin of bbpd : component is "b";
--
COMPONENT BBPU
PORT(
        b:  INOUT std_logic := 'X';
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
   attribute syn_black_box of bbpu : Component is true;
   attribute black_box_pad_pin of bbpu : component is "b";
--
COMPONENT IB
PORT(
        i:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
   attribute syn_black_box of ib : Component is true;
   attribute black_box_pad_pin of ib : component is "i";
--
COMPONENT IBPD
PORT(
        i:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
   attribute syn_black_box of ibpd : Component is true;
   attribute black_box_pad_pin of ibpd : component is "i";
--
COMPONENT IBPU
PORT(
        i:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
   attribute syn_black_box of ibpu : Component is true;
   attribute black_box_pad_pin of ibpu : component is "i";
--
COMPONENT OB
PORT(
        i:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
   attribute syn_black_box of ob : Component is true;
   attribute black_box_pad_pin of ob : component is "o";
--
COMPONENT OBCO
PORT(
        i :  IN std_logic := 'X';
        ot:  OUT std_logic;
        oc:  OUT std_logic);
END COMPONENT;
   attribute syn_black_box of obco : Component is true;
   attribute black_box_pad_pin of obco : component is "ot,oc";
--
COMPONENT OBZ
PORT(
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
   attribute syn_black_box of obz : Component is true;
   attribute black_box_pad_pin of obz : component is "o";
--
COMPONENT OBZPU
PORT(
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
   attribute syn_black_box of obzpu : Component is true;
   attribute black_box_pad_pin of obzpu : component is "o";
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
   attribute syn_black_box of LUT4 : Component is true;
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
   attribute syn_black_box of LUT5 : Component is true;
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
   attribute syn_black_box of LUT6 : Component is true;
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
   attribute syn_black_box of LUT7 : Component is true;
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
   attribute syn_black_box of LUT8 : Component is true;
--

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
   attribute syn_black_box of DP16KD : COMPONENT IS true;

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
   attribute syn_black_box of PDPW16KD : COMPONENT IS true;

COMPONENT DPR16X4C
GENERIC (
   initval	 : String := "0x0000000000000000" );
PORT (
   DI3, DI2, DI1, DI0, WAD3,WAD2,WAD1,WAD0, WCK, WRE,
   RAD3,RAD2,RAD1,RAD0 : IN std_logic := 'X';
   DO3, DO2, DO1, DO0  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of DPR16X4C : COMPONENT IS true;

COMPONENT SPR16X4C
GENERIC (
   initval	 : String := "0x0000000000000000" );
PORT (
   DI3, DI2, DI1, DI0, AD3, AD2, AD1, AD0, CK, WRE : IN std_logic := 'X';
   DO3, DO2, DO1, DO0  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of SPR16X4C : COMPONENT IS true;

COMPONENT IMIPI
PORT (
   A, AN, HSSEL : IN std_logic := 'X';
   OHSOLS1, OLS0 : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of IMIPI : COMPONENT IS true;
   attribute black_box_pad_pin of IMIPI : component is "A,AN";


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
   attribute syn_black_box of MULT9X9C : COMPONENT IS true;

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
   attribute syn_black_box of MULT9X9D : COMPONENT IS true;

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
   attribute syn_black_box of MULT18X18C : COMPONENT IS true;

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
   attribute syn_black_box of MULT18X18D : COMPONENT IS true;

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
   attribute syn_black_box of ALU24A : COMPONENT IS true;

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
   FORCE_ZERO_BARREL_SHIFT	 : String := "DISABLED";
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
   attribute syn_black_box of ALU54A : COMPONENT IS true;

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
   attribute syn_black_box of ALU24B : COMPONENT IS true;

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
   FORCE_ZERO_BARREL_SHIFT	 : String := "DISABLED";
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
   attribute syn_black_box of ALU54B : COMPONENT IS true;

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
   attribute syn_black_box of PRADD9A : COMPONENT IS true;

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
   attribute syn_black_box of PRADD18A : COMPONENT IS true;

COMPONENT BCINRD
GENERIC (
   BANKID        : Integer := 2 );
PORT (
   INRDENI  : IN std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of BCINRD : COMPONENT IS true;
   attribute syn_noprune of BCINRD : COMPONENT IS true;

COMPONENT BCLVDSOB
GENERIC (
   BANKID        : Integer := 2 );
PORT (
   LVDSENI  : IN std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of BCLVDSOB : COMPONENT IS true;
   attribute syn_noprune of BCLVDSOB : COMPONENT IS true;

COMPONENT INRDB
PORT (
   D,
   E : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of INRDB : COMPONENT IS true;

COMPONENT CLKDIVF
GENERIC (
   GSR   : String := "DISABLED";
   DIV   : String := "2.0" );
PORT (
   CLKI, RST, ALIGNWD : IN std_logic := 'X';
   CDIVX  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of CLKDIVF : COMPONENT IS true;

COMPONENT PCSCLKDIV
GENERIC (
   GSR   : String := "DISABLED" );
PORT (
   CLKI, RST, SEL2, SEL1,SEL0 : IN std_logic := 'X';
   CDIV1, CDIVX  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of PCSCLKDIV : COMPONENT IS true;

COMPONENT DCSC
GENERIC (
   DCSMODE       : String := "POS" );
PORT (
   CLK1, CLK0, SEL1, SEL0, MODESEL : IN std_logic := 'X';
   DCSOUT  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of DCSC : COMPONENT IS true;

COMPONENT DCCA
PORT (
   CLKI, CE : IN std_logic := 'X';
   CLKO  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of DCCA : COMPONENT IS true;

COMPONENT ECLKSYNCB
PORT (
   ECLKI, STOP : IN std_logic := 'X';
   ECLKO  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of ECLKSYNCB : COMPONENT IS true;

COMPONENT ECLKBRIDGECS
PORT (
   CLK0, CLK1, SEL : IN std_logic := 'X';
   ECSOUT  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of ECLKBRIDGECS : COMPONENT IS true;

COMPONENT PLLREFCS
PORT (
   CLK0,CLK1,SEL : IN std_logic := 'X';
   PLLCSOUT  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of PLLREFCS : COMPONENT IS true;

COMPONENT DELAYF
GENERIC (
   DEL_MODE      : String := "USER_DEFINED";
   DEL_VALUE     : Integer := 0);
PORT (
   A, LOADN, MOVE, DIRECTION : IN std_logic := 'X';
   Z, CFLAG  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of DELAYF : COMPONENT IS true;

COMPONENT DELAYG
GENERIC (
   DEL_MODE      : String := "USER_DEFINED";
   DEL_VALUE     : Integer := 0 );
PORT (
   A : IN std_logic := 'X';
   Z  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of DELAYG : COMPONENT IS true;

COMPONENT START
PORT (
   STARTCLK  : IN std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of START : COMPONENT IS true;
   attribute syn_noprune of START : COMPONENT IS true;

COMPONENT USRMCLK
PORT (
   USRMCLKI, USRMCLKTS  : IN std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of USRMCLK : COMPONENT IS true;
   attribute syn_noprune of USRMCLK : COMPONENT IS true;

COMPONENT DQSBUFM
GENERIC (
   DQS_LI_DEL_VAL        : Integer := 4;
   DQS_LI_DEL_ADJ        : String := "FACTORYONLY";
   DQS_LO_DEL_VAL        : Integer := 0;
   DQS_LO_DEL_ADJ        : String := "FACTORYONLY";
   GSR   : String := "ENABLED" );
PORT (
   DQSI,READ1,READ0,READCLKSEL2,READCLKSEL1,READCLKSEL0,DDRDEL,ECLK,SCLK, RST,
   DYNDELAY7, DYNDELAY6, DYNDELAY5, DYNDELAY4, DYNDELAY3, DYNDELAY2, DYNDELAY1, DYNDELAY0,
   PAUSE,RDLOADN,RDMOVE,RDDIRECTION,WRLOADN,WRMOVE,WRDIRECTION : IN std_logic := 'X';
   DQSR90,DQSW,DQSW270,RDPNTR2,RDPNTR1,RDPNTR0,WRPNTR2,WRPNTR1,WRPNTR0,
   DATAVALID, BURSTDET,RDCFLAG,WRCFLAG  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of DQSBUFM : COMPONENT IS true;

COMPONENT DDRDLLA
GENERIC (
   FORCE_MAX_DELAY       : String := "NO";
   GSR   : String := "ENABLED" );
PORT (
   CLK, RST, UDDCNTLN, FREEZE : IN std_logic := 'X';
   DDRDEL, LOCK,
   DCNTL7,DCNTL6,DCNTL5,DCNTL4,DCNTL3,DCNTL2,DCNTL1,DCNTL0  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of DDRDLLA : COMPONENT IS true;

COMPONENT DLLDELD
PORT (
   A, DDRDEL,LOADN,MOVE,DIRECTION : IN std_logic := 'X';
   Z, CFLAG  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of DLLDELD : COMPONENT IS true;

COMPONENT IDDRX1F
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D, SCLK, RST : IN std_logic := 'X';
   Q0, Q1  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of IDDRX1F : COMPONENT IS true;

COMPONENT IDDRX2F
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D, SCLK, ECLK, RST, ALIGNWD : IN std_logic := 'X';
   Q3, Q2, Q1, Q0  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of IDDRX2F : COMPONENT IS true;

COMPONENT IDDR71B
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D, SCLK,ECLK,RST,ALIGNWD : IN std_logic := 'X';
   Q6,Q5,Q4,Q3,Q2,Q1,Q0  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of IDDR71B : COMPONENT IS true;

COMPONENT IDDRX2DQA
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   SCLK,ECLK,DQSR90,D,RST,
   RDPNTR2,RDPNTR1,RDPNTR0,WRPNTR2,WRPNTR1,WRPNTR0 : IN std_logic := 'X';
   Q3,Q2,Q1,Q0,QWL  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of IDDRX2DQA : COMPONENT IS true;

COMPONENT ODDRX1F
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   SCLK, RST, D0, D1 : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of ODDRX1F : COMPONENT IS true;

COMPONENT ODDRX2F
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   SCLK,ECLK,RST,D3,D2,D1,D0 : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of ODDRX2F : COMPONENT IS true;

COMPONENT ODDR71B
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   SCLK,ECLK,RST,D6,D5,D4,D3,D2,D1,D0 : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of ODDR71B : COMPONENT IS true;

COMPONENT ODDRX2DQA
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D3,D2,D1,D0,DQSW270,SCLK,ECLK,RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of ODDRX2DQA : COMPONENT IS true;

COMPONENT ODDRX2DQSB
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D3,D2,D1,D0,SCLK,ECLK,DQSW,RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of ODDRX2DQSB : COMPONENT IS true;

COMPONENT OSHX2A
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D1,D0,SCLK,ECLK,RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of OSHX2A : COMPONENT IS true;

COMPONENT TSHX2DQA
GENERIC (
   GSR   : String := "ENABLED";
   REGSET        : String := "SET" );
PORT (
   T1,T0,SCLK,ECLK,DQSW270,RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of TSHX2DQA : COMPONENT IS true;

COMPONENT TSHX2DQSA
GENERIC (
   GSR   : String := "ENABLED";
   REGSET        : String := "SET" );
PORT (
   T1,T0,SCLK,ECLK,DQSW,RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of TSHX2DQSA : COMPONENT IS true;

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
   CLKI, CLKFB, PHASESEL1, PHASESEL0, PHASEDIR, PHASESTEP, PHASELOADREG,
   STDBY, PLLWAKESYNC,
   RST, ENCLKOP, ENCLKOS, ENCLKOS2, ENCLKOS3 : IN std_logic := 'X';
   CLKOP,CLKOS,CLKOS2,CLKOS3,LOCK,INTLOCK,
   REFCLK, CLKINTFB : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of EHXPLLL : COMPONENT IS true;

COMPONENT DTR
GENERIC (
   DTR_TEMP        : Integer := 25);
PORT (
   STARTPULSE : IN std_logic := 'X';
   DTROUT7,DTROUT6,DTROUT5,DTROUT4,DTROUT3,DTROUT2,DTROUT1,DTROUT0  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of DTR : COMPONENT IS true;

COMPONENT OSCG
GENERIC (
   DIV   : Integer := 128 );
PORT (
   OSC : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of OSCG : COMPONENT IS true;

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
   attribute syn_black_box of EXTREFB : COMPONENT IS true;
   attribute black_box_pad_pin of EXTREFB : component is "REFCLKP,REFCLKN";

COMPONENT JTAGG
GENERIC (
   ER1   : String := "ENABLED";
   ER2   : String := "ENABLED" );
PORT (
   TCK, TMS, TDI, JTDO2, JTDO1 : IN std_logic := 'X';
   TDO, JTDI, JTCK, JRTI2, JRTI1,
   JSHIFT, JUPDATE, JRSTN, JCE2, JCE1  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of JTAGG : COMPONENT IS true;

COMPONENT SEDGA
GENERIC (
   SED_CLK_FREQ   : String := "2.4";
   CHECKALWAYS   : String := "DISABLED";
   DEV_DENSITY   : String := "85KUM" );
PORT (
   SEDENABLE, SEDSTART, SEDFRCERR : IN std_logic := 'X';
   SEDCLKOUT, SEDDONE, SEDINPROG, SEDERR : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of SEDGA : COMPONENT IS true;


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
   attribute syn_black_box of DCUA : COMPONENT IS true;
   attribute black_box_pad_pin of DCUA : component is "CH0_HDINP, CH1_HDINP, CH0_HDINN, CH1_HDINN, CH0_HDOUTP, CH1_HDOUTP, CH0_HDOUTN, CH1_HDOUTN";  
   attribute syn_lib_cell of all : component is true;

end components;

