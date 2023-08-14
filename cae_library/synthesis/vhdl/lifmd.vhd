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
-- Header files for SNOW family.
--
-- --------------------------------------------------------------------

LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
PACKAGE components IS 
   attribute syn_black_box: boolean ;
   attribute syn_black_box of Components : package is true;
   attribute black_box_pad_pin: string;
   attribute syn_unconnected_inputs: string;
   attribute syn_noprune : boolean;
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

COMPONENT CLKDIVG
GENERIC (
   GSR   : String := "DISABLED";
   DIV   : String := "2.0" );
PORT (
   CLKI, RST, ALIGNWD : IN std_logic := 'X';
   CDIVX  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of CLKDIVG : COMPONENT IS true;

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
   attribute syn_black_box of EHXPLLM : COMPONENT IS true;



COMPONENT OSCI
GENERIC (
   HFCLKDIV   : Integer := 1 );
PORT (
     HFOUTEN : IN std_logic := 'X';
    HFCLKOUT, LFCLKOUT : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of OSCI: COMPONENT IS true;



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
   attribute syn_black_box of DP8KE : Component is true;



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
   attribute syn_black_box of PDPW8KE : Component is true;

COMPONENT I2CA
GENERIC(
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
   I2C_WAKEUP_MASTER: string:= "DISABLED"; 	 
   SDA_I_DELAY : integer:= 0;  									 
   SDA_O_DELAY: integer:= 0;		 
	 
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
 DATO9, DATO8, DATO7, DATO6, DATO5, DATO4,MRDCMPL, DATO3              : out std_logic := 'X';
 DATO2, DATO1, DATO0, ACKO, PMUWKUP, I2CIRQ, I2CWKUP             : out std_logic := 'X';
 SRDWR, TXFIFOAE,TXFIFOE, TXFIFOF, RXFIFOE, RXFIFOAF, RXFIFOF  : out std_logic := 'X';
 SCLO, SCLOEN, SDAO, SDAOEN            : out std_logic := 'X'
);
END COMPONENT;
 attribute syn_black_box of I2CA : Component is true;


COMPONENT PMUA
GENERIC(
 --CLKSRC  : string:="INTCLK";
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
 USRWKUPN,PMUWKUP,PMUCLK, USRCLK, USRCS : in std_logic := 'X';
 USRSTB, USRADR3, USRADR2, USRADR1, USRADR0      : in std_logic := 'X';
 USRDATA7, USRDATA6, USRDATA5, USRDATA4         : in std_logic := 'X';  
 USRDATA3, USRDATA2, USRDATA1, USRDATA0,SLEEP   : in std_logic := 'X';
 USRWDTDONE, USRWDTINT              : out std_logic := 'X'
);
end component;
 attribute syn_black_box of PMUA : Component is true;

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
attribute syn_black_box of MIPIDPHYA : Component is true;
attribute black_box_pad_pin of MIPIDPHYA : component is "DP0, DN0, DP1, DN1, DP2, DN2, DP3, DN3, CKP, CKN";


COMPONENT MIPI
PORT(
AP : in std_logic := 'X';
AN  : in std_logic := 'X';
TP,TN,HSSEL      : in std_logic := 'X'; 
OLSP,OLSN,OHS		 : out std_logic := 'X';
BN,BP			 : inout std_logic := 'X'
);
END COMPONENT;
attribute syn_black_box of MIPI : Component is true;
attribute black_box_pad_pin of MIPI : component is "BP,BN";


COMPONENT LVDSOB
PORT(
D,E		 : in std_logic := 'X';
Q		 : out std_logic := 'X'
);
END COMPONENT;
attribute syn_black_box of LVDSOB : Component is true;

COMPONENT IDDRX4C
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
  D, ECLK, SCLK, RST, ALIGNWD : IN std_logic := 'X';
  Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of IDDRX4C : COMPONENT IS true;

COMPONENT IDDR141A
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D, SCLK, ECLK, RST, ALIGNWD : IN std_logic := 'X';
   Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of IDDR141A : COMPONENT IS true;

COMPONENT IDDRX8A
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D, SCLK, ECLK, RST, ALIGNWD : IN std_logic := 'X';
   Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of IDDRX8A : COMPONENT IS true;

COMPONENT ODDRX4C
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D0, D1, D2, D3, D4, D5, D6, D7, ECLK , SCLK, RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of ODDRX4C : COMPONENT IS true;


COMPONENT ODDR141A
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
   D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, ECLK , SCLK, RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of ODDR141A : COMPONENT IS true;

COMPONENT ODDRX8A
GENERIC (
   GSR   : String := "ENABLED" );
PORT (
    D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, ECLK , SCLK, RST : IN std_logic := 'X';
   Q  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of ODDRX8A : COMPONENT IS true;
--
end components;

