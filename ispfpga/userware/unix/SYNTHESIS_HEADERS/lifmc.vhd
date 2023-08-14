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
-- Header files for RIALTO family.
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
COMPONENT I3CBB
PORT(
        b:  INOUT std_logic := 'X';
        i:  IN std_logic := 'X';
        t:  IN std_logic := 'X';
	resen: IN std_logic := 'X';
	pullupen: IN std_logic := 'X';
        o:  OUT std_logic);
END COMPONENT;
   attribute syn_black_box of i3cbb : Component is true;
   attribute black_box_pad_pin of i3cbb : component is "b";
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

COMPONENT DELAYH
GENERIC (
   DEL_MODE      : String := "USER_DEFINED";
   DEL_VALUE     : Integer := 0);
PORT (
   A, LOADN, MOVE, DIRECTION : IN std_logic := 'X';
   Z, CFLAG  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of DELAYH : COMPONENT IS true;

COMPONENT DELAYI
GENERIC (
   DEL_MODE      : String := "USER_DEFINED";
   DEL_VALUE     : Integer := 0 );
PORT (
   A : IN std_logic := 'X';
   Z  : OUT std_logic := 'X' );
END COMPONENT;
   attribute syn_black_box of DELAYI : COMPONENT IS true;


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



COMPONENT MIPIRX
PORT(
AP : in std_logic := 'X';
AN  : in std_logic := 'X';
TP,TN,HSSEL      : in std_logic := 'X'; 
OLSP,OLSN,OHS		 : out std_logic := 'X';
BN,BP			 : inout std_logic := 'X'
);
END COMPONENT;
attribute syn_black_box of MIPIRX : Component is true;
attribute black_box_pad_pin of MIPIRX : component is "BP,BN";


COMPONENT MIPITX
PORT(
AP : in std_logic := 'X';
AN  : in std_logic := 'X';
TP,TN,HSSEL      : in std_logic := 'X'; 
OLSP,OLSN		 : out std_logic := 'X';
BN,BP			 : inout std_logic := 'X'
);
END COMPONENT;
attribute syn_black_box of MIPITX : Component is true;
attribute black_box_pad_pin of MIPITX : component is "BP,BN";


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

COMPONENT ANEB2
PORT(
        A1, A0: IN std_logic := 'X';
        B1, B0: IN std_logic := 'X';
        CI: IN std_logic := 'X';
        NE: OUT std_logic := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ANEB2  : Component is true;


COMPONENT MIPICDPHYA
GENERIC (
	CPHY_CMTERM : String := "ENABLE";
	DESKW_EN : String := "ENABLE";
	LOCK_BYP : String := "ENABLE";
	PLLCLKBYPASS : String := "ENABLE";
	CPHY_DPHY : String := "ENABLE";
	CONT_CLK_MODE : String := "ENABLE";
	LANE0_SEL : String := "ENABLE";
	EN_PRGSEQ : String := "ENABLE";
	MASTER_SLAVE : String := "ENABLE";
	DSI_CSI : String := "ENABLE";
	RTERM_SEL : String := "ENABLE";
	AUTO_PD_EN : String := "ENABLE";
	DEC_BYPASS : String := "ENABLE";
	ENC_BYPASS : String := "ENABLE";
	UC_PRG_HS_PREPARE : String := "ENABLE";
	EN_CIL : String := "ENABLE";
	SOFTTRIM : String := "ENABLE";
	BIST_EN : String := "ENABLE";
	HSEL : String := "0b00";
	RSEL : String := "0b00";
	PRGSEQ_SYMBOLS : String := "0x00000000000";
	CFG_NUM_LANES : String := "0b00";
	TXDATAWIDTHHS : String := "0b00";
	RXDATAWIDTHHS : String := "0b00";
	UC_PRG_HS_ZERO : String := "0b0000000";
	UC_PRG_HS_TRAIL : String := "0b00000";
	U_PRG_RXHS_SETTLE : String := "0b000000";
	U_PRG_HS_PREPARE : String := "0b00";
	U_PRG_HS_ZERO : String := "0b000000";
	U_PRG_HS_TRAIL : String := "0b000000";
	EN_ALIGN : String := "0x0";
	CLK_DESKW_DLYCAL : String := "0b00000";
	CN : String := "0b00000";
	CM : String := "0x00";
	CO : String := "0b00";
	TST : String := "0x0"
	 );
PORT(
	UENABLE,
	P1,
	P2,
	P3,
	P4,
	P5,
	P6,
	P7,
	P8,
	P9,
	P10,
	P11,
	UTXREQUESTHS,
	UTXSKEWCALHS,
	UTXREQUESTESC,
	UTXLPDTESC,
	UTXULPSESC,
	UTXVALIDESC,
	UTXULPSEXIT,
	UTURNREQUEST,
	UTURNDISABLE,
	UTXTRIGESC0,
	UTXTRIGESC1,
	UTXTRIGESC2,
	UTXTRIGESC3,
	UFRCRXMOD,
	UFRCTXSTOPMOD,
	URXCLKINESC,
	UTXCLKESC,
	UTXDATAESC0,
	UTXDATAESC1,
	UTXDATAESC2,
	UTXDATAESC3,
	UTXDATAESC4,
	UTXDATAESC5,
	UTXDATAESC6,
	UTXDATAESC7,
	UTXWRDVALIDHS3,
	UTXWRDVALIDHS2,
	UTXWRDVALIDHS1,
	UTXWRDVALIDHS0,
	UTXSNDSYNCHS3,
	UTXSNDSYNCHS2,
	UTXSNDSYNCHS1,
	UTXSNDSYNCHS0,
	UTXDATAHS63,
	UTXDATAHS62,
	UTXDATAHS61,
	UTXDATAHS60,
	UTXDATAHS59,
	UTXDATAHS58,
	UTXDATAHS57,
	UTXDATAHS56,
	UTXDATAHS55,
	UTXDATAHS54,
	UTXDATAHS53,
	UTXDATAHS52,
	UTXDATAHS51,
	UTXDATAHS50,
	UTXDATAHS49,
	UTXDATAHS48,
	UTXDATAHS47,
	UTXDATAHS46,
	UTXDATAHS45,
	UTXDATAHS44,
	UTXDATAHS43,
	UTXDATAHS42,
	UTXDATAHS41,
	UTXDATAHS40,
	UTXDATAHS39,
	UTXDATAHS38,
	UTXDATAHS37,
	UTXDATAHS36,
	UTXDATAHS35,
	UTXDATAHS34,
	UTXDATAHS33,
	UTXDATAHS32,
	UTXDATAHS31,
	UTXDATAHS30,
	UTXDATAHS29,
	UTXDATAHS28,
	UTXDATAHS27,
	UTXDATAHS26,
	UTXDATAHS25,
	UTXDATAHS24,
	UTXDATAHS23,
	UTXDATAHS22,
	UTXDATAHS21,
	UTXDATAHS20,
	UTXDATAHS19,
	UTXDATAHS18,
	UTXDATAHS17,
	UTXDATAHS16,
	UTXDATAHS15,
	UTXDATAHS14,
	UTXDATAHS13,
	UTXDATAHS12,
	UTXDATAHS11,
	UTXDATAHS10,
	UTXDATAHS9,
	UTXDATAHS8,
	UTXDATAHS7,
	UTXDATAHS6,
	UTXDATAHS5,
	UTXDATAHS4,
	UTXDATAHS3,
	UTXDATAHS2,
	UTXDATAHS1,
	UTXDATAHS0,
	U1ENABLE,
	U1TXREQUESTHS,
	U1TXSKEWCALHS,
	U1TXREQUESTESC,
	U1TXLPDTESC,
	U1TXULPSESC,
	U1TXVALIDESC,
	U1TXULPSEXIT,
	U1TURNREQUEST,
	U1TURNDISABLE,
	U1TXTRIGESC0,
	U1TXTRIGESC1,
	U1TXTRIGESC2,
	U1TXTRIGESC3,
	U1FRCRXMOD,
	U1FRCTXSTOPMOD,
	U1TXDATAESC0,
	U1TXDATAESC1,
	U1TXDATAESC2,
	U1TXDATAESC3,
	U1TXDATAESC4,
	U1TXDATAESC5,
	U1TXDATAESC6,
	U1TXDATAESC7,
	U1TXWRDVLDHS3,
	U1TXWRDVLDHS2,
	U1TXWRDVLDHS1,
	U1TXWRDVLDHS0,
	U1TXSNDSYNCHS3,
	U1TXSNDSYNCHS2,
	U1TXSNDSYNCHS1,
	U1TXSNDSYNCHS0,
	U1TXDATAHS63,
	U1TXDATAHS62,
	U1TXDATAHS61,
	U1TXDATAHS60,
	U1TXDATAHS59,
	U1TXDATAHS58,
	U1TXDATAHS57,
	U1TXDATAHS56,
	U1TXDATAHS55,
	U1TXDATAHS54,
	U1TXDATAHS53,
	U1TXDATAHS52,
	U1TXDATAHS51,
	U1TXDATAHS50,
	U1TXDATAHS49,
	U1TXDATAHS48,
	U1TXDATAHS47,
	U1TXDATAHS46,
	U1TXDATAHS45,
	U1TXDATAHS44,
	U1TXDATAHS43,
	U1TXDATAHS42,
	U1TXDATAHS41,
	U1TXDATAHS40,
	U1TXDATAHS39,
	U1TXDATAHS38,
	U1TXDATAHS37,
	U1TXDATAHS36,
	U1TXDATAHS35,
	U1TXDATAHS34,
	U1TXDATAHS33,
	U1TXDATAHS32,
	U1TXDATAHS31,
	U1TXDATAHS30,
	U1TXDATAHS29,
	U1TXDATAHS28,
	U1TXDATAHS27,
	U1TXDATAHS26,
	U1TXDATAHS25,
	U1TXDATAHS24,
	U1TXDATAHS23,
	U1TXDATAHS22,
	U1TXDATAHS21,
	U1TXDATAHS20,
	U1TXDATAHS19,
	U1TXDATAHS18,
	U1TXDATAHS17,
	U1TXDATAHS16,
	U1TXDATAHS15,
	U1TXDATAHS14,
	U1TXDATAHS13,
	U1TXDATAHS12,
	U1TXDATAHS11,
	U1TXDATAHS10,
	U1TXDATAHS9,
	U1TXDATAHS8,
	U1TXDATAHS7,
	U1TXDATAHS6,
	U1TXDATAHS5,
	U1TXDATAHS4,
	U1TXDATAHS3,
	U1TXDATAHS2,
	U1TXDATAHS1,
	U1TXDATAHS0,
	U2ENABLE,
	U2TXREQUESTHS,
	U2TXSKEWCALHS,
	U2TXREQUESTESC,
	U2TXLPDTESC,
	U2TXULPSESC,
	U2TXVALIDESC,
	U2TXULPSEXIT,
	U2TURNREQUEST,
	U2TURNDISABLE,
	U2TXTRIGESC0,
	U2TXTRIGESC1,
	U2TXTRIGESC2,
	U2TXTRIGESC3,
	U2FRCRXMOD,
	U2FRCTXSTOPMOD,
	U2TXDATAESC0,
	U2TXDATAESC1,
	U2TXDATAESC2,
	U2TXDATAESC3,
	U2TXDATAESC4,
	U2TXDATAESC5,
	U2TXDATAESC6,
	U2TXDATAESC7,
	U2TXWRDVLDHS3,
	U2TXWRDVLDHS2,
	U2TXWRDVLDHS1,
	U2TXWRDVLDHS0,
	U2TXSNDSYNCHS3,
	U2TXSNDSYNCHS2,
	U2TXSNDSYNCHS1,
	U2TXSNDSYNCHS0,
	U2TXDATAHS31,
	U2TXDATAHS30,
	U2TXDATAHS29,
	U2TXDATAHS28,
	U2TXDATAHS27,
	U2TXDATAHS26,
	U2TXDATAHS25,
	U2TXDATAHS24,
	U2TXDATAHS23,
	U2TXDATAHS22,
	U2TXDATAHS21,
	U2TXDATAHS20,
	U2TXDATAHS19,
	U2TXDATAHS18,
	U2TXDATAHS17,
	U2TXDATAHS16,
	U2TXDATAHS15,
	U2TXDATAHS14,
	U2TXDATAHS13,
	U2TXDATAHS12,
	U2TXDATAHS11,
	U2TXDATAHS10,
	U2TXDATAHS9,
	U2TXDATAHS8,
	U2TXDATAHS7,
	U2TXDATAHS6,
	U2TXDATAHS5,
	U2TXDATAHS4,
	U2TXDATAHS3,
	U2TXDATAHS2,
	U2TXDATAHS1,
	U2TXDATAHS0,
	U3ENABLE,
	U3TXREQUESTHS,
	U3TXSKEWCALHS,
	U3TXREQUESTESC,
	U3TXTRIGESC0,
	U3TXTRIGESC1,
	U3TXTRIGESC2,
	U3TXTRIGESC3,
	U3FRCRXMOD,
	U3FRCTXSTOPMOD,
	U3TURNDISABLE,
	U3TURNREQUEST,
	U3TXVALIDESC,
	U3TXULPSESC,
	U3TXULPSEXIT,
	U3TXLPDTESC,
	U3TXDATAESC0,
	U3TXDATAESC1,
	U3TXDATAESC2,
	U3TXDATAESC3,
	U3TXDATAESC4,
	U3TXDATAESC5,
	U3TXDATAESC6,
	U3TXDATAESC7,
	U3TXWRDVLDHS3,
	U3TXWRDVLDHS2,
	U3TXWRDVLDHS1,
	U3TXWRDVLDHS0,
	U3TXDATAHS31,
	U3TXDATAHS30,
	U3TXDATAHS29,
	U3TXDATAHS28,
	U3TXDATAHS27,
	U3TXDATAHS26,
	U3TXDATAHS25,
	U3TXDATAHS24,
	U3TXDATAHS23,
	U3TXDATAHS22,
	U3TXDATAHS21,
	U3TXDATAHS20,
	U3TXDATAHS19,
	U3TXDATAHS18,
	U3TXDATAHS17,
	U3TXDATAHS16,
	U3TXDATAHS15,
	U3TXDATAHS14,
	U3TXDATAHS13,
	U3TXDATAHS12,
	U3TXDATAHS11,
	U3TXDATAHS10,
	U3TXDATAHS9,
	U3TXDATAHS8,
	U3TXDATAHS7,
	U3TXDATAHS6,
	U3TXDATAHS5,
	U3TXDATAHS4,
	U3TXDATAHS3,
	U3TXDATAHS2,
	U3TXDATAHS1,
	U3TXDATAHS0,
	UCENABLE,
	UCTXREQUESTHS,
	UCTXULPSCLK,
	UCRXCLKACTVHS,
	UCTXULPSEXIT,
	PDPLL,
	CLKREF,
	PDPHY,
	PDBIAS,
	SCANMODIN,
	SCANCLKIN,
	SCANRSTNIN,
	BITCLKEXT,
	TST3,
	TST2,
	TST1,
	TST0,
	CN4,
	CN3,
	CN2,
	CN1,
	CN0,
	CM7,
	CM6,
	CM5,
	CM4,
	CM3,
	CM2,
	CM1,
	CM0,
	CO1,
	CO0,
	C0MAPDATASEL,
	C1MAPDATASEL,
	C2MAPDATASEL,
	PDCKG,
	PDTXHS,
	LB,
	ENPDESER,
	P11CDEN,
	D0DTXHS,
	D1DTXHS,
	D2DTXHS,
	D3DTXHS,
	CLKDTXHS,
	C0DTXHSA,
	C0DTXHSB,
	C0DTXHSC,
	C1DTXHSA,
	C1DTXHSB,
	C1DTXHSC,
	C2DTXHSA,
	C2DTXHSB,
	C2DTXHSC,
	SLEEPN,
	STOP : IN std_logic := 'X';
	UTXREADYSKEW,
	URXSKEWCALHS,
	UERRESC,
	UERRSOTHS,
	UERRSOTSYNCHS,
	UTXREADYESC,
	UERRSYNCESC,
	UERRCONTROL,
	UDIRECTION,
	URXLPDTESC,
	URXULPSESC,
	URXVALIDESC,
	URXWORDCLKHS,
	UTXBYTECLKHS,
	UTXREADYHS,
	URXSKEWCALHSD,
	URXTRIGESC0,
	URXTRIGESC1,
	URXTRIGESC2,
	URXTRIGESC3,
	USTOPSTATE,
	URXVALIDHS3,
	URXVALIDHS2,
	URXVALIDHS1,
	URXVALIDHS0,
	URXINVLDCDHS3,
	URXINVLDCDHS2,
	URXINVLDCDHS1,
	URXINVLDCDHS0,
	URXACTVHS,
	URXSYNCHS3,
	URXSYNCHS2,
	URXSYNCHS1,
	URXSYNCHS0,
	URXCLKESC,
	URXDATAESC7,
	URXDATAESC6,
	URXDATAESC5,
	URXDATAESC4,
	URXDATAESC3,
	URXDATAESC2,
	URXDATAESC1,
	URXDATAESC0,
	UULPSACTVNOT,
	UERRCONTENLP0,
	UERRCONTENLP1,
	URXDATAHS63,
	URXDATAHS62,
	URXDATAHS61,
	URXDATAHS60,
	URXDATAHS59,
	URXDATAHS58,
	URXDATAHS57,
	URXDATAHS56,
	URXDATAHS55,
	URXDATAHS54,
	URXDATAHS53,
	URXDATAHS52,
	URXDATAHS51,
	URXDATAHS50,
	URXDATAHS49,
	URXDATAHS48,
	URXDATAHS47,
	URXDATAHS46,
	URXDATAHS45,
	URXDATAHS44,
	URXDATAHS43,
	URXDATAHS42,
	URXDATAHS41,
	URXDATAHS40,
	URXDATAHS39,
	URXDATAHS38,
	URXDATAHS37,
	URXDATAHS36,
	URXDATAHS35,
	URXDATAHS34,
	URXDATAHS33,
	URXDATAHS32,
	URXDATAHS31,
	URXDATAHS30,
	URXDATAHS29,
	URXDATAHS28,
	URXDATAHS27,
	URXDATAHS26,
	URXDATAHS25,
	URXDATAHS24,
	URXDATAHS23,
	URXDATAHS22,
	URXDATAHS21,
	URXDATAHS20,
	URXDATAHS19,
	URXDATAHS18,
	URXDATAHS17,
	URXDATAHS16,
	URXDATAHS15,
	URXDATAHS14,
	URXDATAHS13,
	URXDATAHS12,
	URXDATAHS11,
	URXDATAHS10,
	URXDATAHS9,
	URXDATAHS8,
	URXDATAHS7,
	URXDATAHS6,
	URXDATAHS5,
	URXDATAHS4,
	URXDATAHS3,
	URXDATAHS2,
	URXDATAHS1,
	URXDATAHS0,
	U1TXREADYSKEW,
	U1RXSKEWCALHS,
	U1ERRESC,
	U1ERRSOTHS,
	U1ERRSOTSYNCHS,
	U1TXREADYESC,
	U1ERRSYNCESC,
	U1ERRCONTROL,
	U1DIRECTION,
	U1RXLPDTESC,
	U1RXULPSESC,
	U1RXVALIDESC,
	U1ULPSACTVNOT,
	U1RXWORDCLKHS,
	U1TXREADYHS,
	U1RXSKEWCALHSD,
	U1RXTRIGESC0,
	U1RXTRIGESC1,
	U1RXTRIGESC2,
	U1RXTRIGESC3,
	U1STOPSTATE,
	U1RXVLDHS3,
	U1RXVLDHS2,
	U1RXVLDHS1,
	U1RXVLDHS0,
	U1RXINVLDCDHS3,
	U1RXINVLDCDHS2,
	U1RXINVLDCDHS1,
	U1RXINVLDCDHS0,
	U1RXACTVHS,
	U1RXSYNCHS3,
	U1RXSYNCHS2,
	U1RXSYNCHS1,
	U1RXSYNCHS0,
	U1RXCLKESC,
	U1RXDATAESC7,
	U1RXDATAESC6,
	U1RXDATAESC5,
	U1RXDATAESC4,
	U1RXDATAESC3,
	U1RXDATAESC2,
	U1RXDATAESC1,
	U1RXDATAESC0,
	U1ERRCONTENLP0,
	U1ERRCONTENLP1,
	U1RXDATAHS63,
	U1RXDATAHS62,
	U1RXDATAHS61,
	U1RXDATAHS60,
	U1RXDATAHS59,
	U1RXDATAHS58,
	U1RXDATAHS57,
	U1RXDATAHS56,
	U1RXDATAHS55,
	U1RXDATAHS54,
	U1RXDATAHS53,
	U1RXDATAHS52,
	U1RXDATAHS51,
	U1RXDATAHS50,
	U1RXDATAHS49,
	U1RXDATAHS48,
	U1RXDATAHS47,
	U1RXDATAHS46,
	U1RXDATAHS45,
	U1RXDATAHS44,
	U1RXDATAHS43,
	U1RXDATAHS42,
	U1RXDATAHS41,
	U1RXDATAHS40,
	U1RXDATAHS39,
	U1RXDATAHS38,
	U1RXDATAHS37,
	U1RXDATAHS36,
	U1RXDATAHS35,
	U1RXDATAHS34,
	U1RXDATAHS33,
	U1RXDATAHS32,
	U1RXDATAHS31,
	U1RXDATAHS30,
	U1RXDATAHS29,
	U1RXDATAHS28,
	U1RXDATAHS27,
	U1RXDATAHS26,
	U1RXDATAHS25,
	U1RXDATAHS24,
	U1RXDATAHS23,
	U1RXDATAHS22,
	U1RXDATAHS21,
	U1RXDATAHS20,
	U1RXDATAHS19,
	U1RXDATAHS18,
	U1RXDATAHS17,
	U1RXDATAHS16,
	U1RXDATAHS15,
	U1RXDATAHS14,
	U1RXDATAHS13,
	U1RXDATAHS12,
	U1RXDATAHS11,
	U1RXDATAHS10,
	U1RXDATAHS9,
	U1RXDATAHS8,
	U1RXDATAHS7,
	U1RXDATAHS6,
	U1RXDATAHS5,
	U1RXDATAHS4,
	U1RXDATAHS3,
	U1RXDATAHS2,
	U1RXDATAHS1,
	U1RXDATAHS0,
	U2TXREADYSKEW,
	U2RXSKEWCALHS,
	U2ERRESC,
	U2ERRSOTHS,
	U2ERRSOTSYNCHS,
	U2TXREADYESC,
	U2ERRSYNCESC,
	U2ERRCONTROL,
	U2DIRECTION,
	U2RXLPDTESC,
	U2RXULPSESC,
	U2RXVALIDESC,
	U2ULPSACTVNOT,
	U2RXWORDCLKHS,
	U2TXREADYHS,
	U2RXSKEWCALHSD,
	U2RXTRIGESC0,
	U2RXTRIGESC1,
	U2RXTRIGESC2,
	U2RXTRIGESC3,
	U2STOPSTATE,
	U2RXVALIDHS,
	U2RXINVLDCDHS3,
	U2RXINVLDCDHS2,
	U2RXINVLDCDHS1,
	U2RXINVLDCDHS0,
	U2RXACTVHS,
	U2RXSYNCHS3,
	U2RXSYNCHS2,
	U2RXSYNCHS1,
	U2RXSYNCHS0,
	U2RXCLKESC,
	U2RXDATAESC7,
	U2RXDATAESC6,
	U2RXDATAESC5,
	U2RXDATAESC4,
	U2RXDATAESC3,
	U2RXDATAESC2,
	U2RXDATAESC1,
	U2RXDATAESC0,
	U2ERRCONTENLP0,
	U2ERRCONTENLP1,
	U2RXDATAHS31,
	U2RXDATAHS30,
	U2RXDATAHS29,
	U2RXDATAHS28,
	U2RXDATAHS27,
	U2RXDATAHS26,
	U2RXDATAHS25,
	U2RXDATAHS24,
	U2RXDATAHS23,
	U2RXDATAHS22,
	U2RXDATAHS21,
	U2RXDATAHS20,
	U2RXDATAHS19,
	U2RXDATAHS18,
	U2RXDATAHS17,
	U2RXDATAHS16,
	U2RXDATAHS15,
	U2RXDATAHS14,
	U2RXDATAHS13,
	U2RXDATAHS12,
	U2RXDATAHS11,
	U2RXDATAHS10,
	U2RXDATAHS9,
	U2RXDATAHS8,
	U2RXDATAHS7,
	U2RXDATAHS6,
	U2RXDATAHS5,
	U2RXDATAHS4,
	U2RXDATAHS3,
	U2RXDATAHS2,
	U2RXDATAHS1,
	U2RXDATAHS0,
	U3TXREADYSKEW,
	U3RXSKEWCALHS,
	U3ERRESC,
	U3ERRSOTHS,
	U3ERRSOTSYNCHS,
	U3TXREADYESC,
	U3ULPSACTVNOT,
	U3RXTRIGESC0,
	U3RXTRIGESC1,
	U3RXTRIGESC2,
	U3RXTRIGESC3,
	U3TXREADYHS,
	U3RXVLDHS3,
	U3RXVLDHS2,
	U3RXVLDHS1,
	U3RXVLDHS0,
	U3RXACTVHS,
	U3RXSYNCHS3,
	U3RXSYNCHS2,
	U3RXSYNCHS1,
	U3RXSYNCHS0,
	U3RXSKEWCALHSD,
	U3RXCLKESC,
	U3RXLPDTESC,
	U3RXULPSESC,
	U3RXDATAESC7,
	U3RXDATAESC6,
	U3RXDATAESC5,
	U3RXDATAESC4,
	U3RXDATAESC3,
	U3RXDATAESC2,
	U3RXDATAESC1,
	U3RXDATAESC0,
	U3RXVALIDESC,
	U3DIRECTION,
	U3STOPSTATE,
	U3ERRSYNCESC,
	U3ERRCONTROL,
	U3ERRCONTENLP0,
	U3ERRCONTENLP1,
	U3RXDATAHS31,
	U3RXDATAHS30,
	U3RXDATAHS29,
	U3RXDATAHS28,
	U3RXDATAHS27,
	U3RXDATAHS26,
	U3RXDATAHS25,
	U3RXDATAHS24,
	U3RXDATAHS23,
	U3RXDATAHS22,
	U3RXDATAHS21,
	U3RXDATAHS20,
	U3RXDATAHS19,
	U3RXDATAHS18,
	U3RXDATAHS17,
	U3RXDATAHS16,
	U3RXDATAHS15,
	U3RXDATAHS14,
	U3RXDATAHS13,
	U3RXDATAHS12,
	U3RXDATAHS11,
	U3RXDATAHS10,
	U3RXDATAHS9,
	U3RXDATAHS8,
	U3RXDATAHS7,
	U3RXDATAHS6,
	U3RXDATAHS5,
	U3RXDATAHS4,
	U3RXDATAHS3,
	U3RXDATAHS2,
	U3RXDATAHS1,
	U3RXDATAHS0,
	U3RXBYTECLKHS,
	UCULPSACTVNOT,
	UCRXULPSCLKNOT,
	UCSTOPSTATE,
	D0LBPASS1,
	D0LBPASS0,
	D1LBPASS1,
	D1LBPASS0,
	D2LBPASS1,
	D2LBPASS0,
	D3LBPASS1,
	D3LBPASS0,
	D0LBERRCNT9,
	D0LBERRCNT8,
	D0LBERRCNT7,
	D0LBERRCNT6,
	D0LBERRCNT5,
	D0LBERRCNT4,
	D0LBERRCNT3,
	D0LBERRCNT2,
	D0LBERRCNT1,
	D0LBERRCNT0,
	D1LBERRCNT9,
	D1LBERRCNT8,
	D1LBERRCNT7,
	D1LBERRCNT6,
	D1LBERRCNT5,
	D1LBERRCNT4,
	D1LBERRCNT3,
	D1LBERRCNT2,
	D1LBERRCNT1,
	D1LBERRCNT0,
	D2LBERRCNT9,
	D2LBERRCNT8,
	D2LBERRCNT7,
	D2LBERRCNT6,
	D2LBERRCNT5,
	D2LBERRCNT4,
	D2LBERRCNT3,
	D2LBERRCNT2,
	D2LBERRCNT1,
	D2LBERRCNT0,
	D3LBERRCNT9,
	D3LBERRCNT8,
	D3LBERRCNT7,
	D3LBERRCNT6,
	D3LBERRCNT5,
	D3LBERRCNT4,
	D3LBERRCNT3,
	D3LBERRCNT2,
	D3LBERRCNT1,
	D3LBERRCNT0,
	D0LBBYTECNT9,
	D0LBBYTECNT8,
	D0LBBYTECNT7,
	D0LBBYTECNT6,
	D0LBBYTECNT5,
	D0LBBYTECNT4,
	D0LBBYTECNT3,
	D0LBBYTECNT2,
	D0LBBYTECNT1,
	D0LBBYTECNT0,
	D1LBBYTECNT9,
	D1LBBYTECNT8,
	D1LBBYTECNT7,
	D1LBBYTECNT6,
	D1LBBYTECNT5,
	D1LBBYTECNT4,
	D1LBBYTECNT3,
	D1LBBYTECNT2,
	D1LBBYTECNT1,
	D1LBBYTECNT0,
	D2LBBYTECNT9,
	D2LBBYTECNT8,
	D2LBBYTECNT7,
	D2LBBYTECNT6,
	D2LBBYTECNT5,
	D2LBBYTECNT4,
	D2LBBYTECNT3,
	D2LBBYTECNT2,
	D2LBBYTECNT1,
	D2LBBYTECNT0,
	D3LBBYTECNT9,
	D3LBBYTECNT8,
	D3LBBYTECNT7,
	D3LBBYTECNT6,
	D3LBBYTECNT5,
	D3LBBYTECNT4,
	D3LBBYTECNT3,
	D3LBBYTECNT2,
	D3LBBYTECNT1,
	D3LBBYTECNT0,
	D0LBACTV,
	D1LBACTV,
	D2LBACTV,
	D3LBACTV,
	DCTESTOUT9,
	DCTESTOUT8,
	DCTESTOUT7,
	DCTESTOUT6,
	DCTESTOUT5,
	DCTESTOUT4,
	DCTESTOUT3,
	DCTESTOUT2,
	DCTESTOUT1,
	DCTESTOUT0,
	LOCK,
	CLKHSBYTE : OUT std_logic := 'X' );
END COMPONENT;
	attribute syn_black_box of MIPICDPHYA : COMPONENT IS true;


end components;

