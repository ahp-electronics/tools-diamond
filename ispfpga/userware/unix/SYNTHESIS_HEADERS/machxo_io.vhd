-- -------------------------------------------------------------------- 
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<< 
-- --------------------------------------------------------------------.
-- Copyright (c) 2002-2010 by Lattice Semiconductor Corporation 
-- -------------------------------------------------------------------- 
-- 
-- 
--                     Lattice Semiconductor Corporation 
--                     5555 NE Moore Court 
--                     Hillsboro, OR 97214 
--                     U.S.A 
-- 
--                     TEL: 1-800-Lattice (USA and Canada) 
--                          408-826-6000 (other locations) 
-- 
--                     web: http:--www.latticesemi.com/ 
--                     email: techsupport@latticesemi.com 
-- 
-- -------------------------------------------------------------------- 
-- 
-- Header files for MachXO family.
-- 
-- -------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;
--library synplify;
--use synplify.attributes.all;

package Components is
   attribute syn_black_box: boolean ;
   attribute syn_black_box of Components : package is true;
   attribute black_box_pad_pin: string;
   attribute syn_tpd1: string;
   attribute syn_tpd2: string;
   attribute syn_tpd3: string;
   attribute syn_noprune: boolean ; --ct111505
   attribute syn_noprune of Components : package is true;

COMPONENT ILVDS
PORT(
        A : IN STD_LOGIC := 'X';
        AN: IN STD_LOGIC := 'X';
        Z : OUT STD_LOGIC
 );
END COMPONENT;
   attribute black_box_pad_pin of ILVDS : component is "A,AN";
--
COMPONENT OLVDS
PORT(
        A  : IN STD_LOGIC := 'X';
        Z  : OUT STD_LOGIC ;
        ZN : OUT STD_LOGIC
 );
END COMPONENT;
   attribute black_box_pad_pin of OLVDS : component is "Z,ZN";
--
COMPONENT FL1S1A
    GENERIC (GSR : string := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	Q: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1S1AY
    GENERIC (GSR : string := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	Q: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1S1B
    GENERIC (GSR : string := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	PD: IN STD_LOGIC := 'X';
	Q: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1S1D
    GENERIC (GSR : string := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	CD: IN STD_LOGIC := 'X';
	Q: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1S1I
    GENERIC (GSR : string := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	CD: IN STD_LOGIC := 'X';
	Q: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1S1J
    GENERIC (GSR : string := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	PD: IN STD_LOGIC := 'X';
	Q: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1S3AX
    GENERIC (GSR : string := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	Q: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1S3AY
    GENERIC (GSR : string := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	Q: OUT STD_LOGIC := 'X'
  );
END COMPONENT;

COMPONENT MULT2
   PORT(
      A0                             :  IN    STD_ULOGIC;
      A1                             :  IN    STD_ULOGIC;
      A2                             :  IN    STD_ULOGIC;
      A3                             :  IN    STD_ULOGIC;
      B0                             :  IN    STD_ULOGIC;
      B1                             :  IN    STD_ULOGIC;
      B2                             :  IN    STD_ULOGIC;
      B3                             :  IN    STD_ULOGIC;
      CI                             :  IN    STD_ULOGIC;
      P0                             :  OUT   STD_ULOGIC;
      P1                             :  OUT   STD_ULOGIC;
      CO                             :  OUT   STD_ULOGIC);
END COMPONENT;

COMPONENT CB2
  PORT (
    CI      : IN STD_LOGIC;
    PC0     : IN STD_LOGIC;
    PC1     : IN STD_LOGIC;
    CON     : IN STD_LOGIC;
    CO      : OUT STD_LOGIC;
    NC0     : OUT STD_LOGIC;
    NC1     : OUT STD_LOGIC);
END COMPONENT;

COMPONENT FADSU2
   PORT(
      A0             :  IN    STD_LOGIC;
      A1             :  IN    STD_LOGIC;
      B0             :  IN    STD_LOGIC;
      B1             :  IN    STD_LOGIC;
      BCI            :  IN    STD_LOGIC;
      CON            :  IN    STD_LOGIC;
      BCO            :  OUT   STD_LOGIC;
      S0             :  OUT   STD_LOGIC;
      S1             :  OUT   STD_LOGIC);
END COMPONENT;

COMPONENT AGEB2
    PORT(
          A0		:  IN	STD_ULOGIC;
          A1		:  IN	STD_ULOGIC;
          B0		:  IN	STD_ULOGIC;
          B1		:  IN	STD_ULOGIC;
          CI		:  IN	STD_ULOGIC;
          GE		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ALEB2
    PORT(
          A0		:  IN	STD_ULOGIC;
          A1		:  IN	STD_ULOGIC;
          B0		:  IN	STD_ULOGIC;
          B1		:  IN	STD_ULOGIC;
          CI		:  IN	STD_ULOGIC;
          LE		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT AND2
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT AND3
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT AND4
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT AND5
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          E		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ANEB2
    PORT(
          A0		:  IN	STD_ULOGIC;
          A1		:  IN	STD_ULOGIC;
          B0		:  IN	STD_ULOGIC;
          B1		:  IN	STD_ULOGIC;
          CI		:  IN	STD_ULOGIC;
          NE		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT BB
    PORT(
          I		:  IN	STD_ULOGIC;
          T		:  IN	STD_ULOGIC;
          O		:  OUT	STD_ULOGIC;
          B		:  INOUT	STD_ULOGIC
        );
END COMPONENT;
   attribute black_box_pad_pin of BB : COMPONENT is "B";

COMPONENT BBPD
    PORT(
          I		:  IN	STD_ULOGIC;
          T		:  IN	STD_ULOGIC;
          O		:  OUT	STD_ULOGIC;
          B		:  INOUT	STD_ULOGIC
        );
END COMPONENT;
   attribute black_box_pad_pin of BBPD : COMPONENT is "B";

COMPONENT BBPU
    PORT(
          I		:  IN	STD_ULOGIC;
          T		:  IN	STD_ULOGIC;
          O		:  OUT	STD_ULOGIC;
          B		:  INOUT	STD_ULOGIC
        );
END COMPONENT;
   attribute black_box_pad_pin of BBPU : COMPONENT is "B";

COMPONENT BBW
    PORT(
          I		:  IN	STD_ULOGIC;
          T		:  IN	STD_ULOGIC;
          O		:  OUT	STD_ULOGIC;
          B		:  INOUT	STD_ULOGIC
        );
END COMPONENT;
   attribute black_box_pad_pin of BBW : COMPONENT is "B";

COMPONENT CD2
    PORT(
          CI		:  IN	STD_ULOGIC;
          PC0		:  IN	STD_ULOGIC;
          PC1		:  IN	STD_ULOGIC;
          CO		:  OUT	STD_ULOGIC;
          NC0		:  OUT	STD_ULOGIC;
          NC1		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT CU2
    PORT(
          CI		:  IN	STD_ULOGIC;
          PC0		:  IN	STD_ULOGIC;
          PC1		:  IN	STD_ULOGIC;
          CO		:  OUT	STD_ULOGIC;
          NC0		:  OUT	STD_ULOGIC;
          NC1		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT DPR16X2B
  PORT (DI0  : IN STD_LOGIC;
        DI1  : IN STD_LOGIC;
        WCK  : IN STD_LOGIC;
        WRE  : IN STD_LOGIC;
        RAD0 : IN STD_LOGIC;
        RAD1 : IN STD_LOGIC;
        RAD2 : IN STD_LOGIC;
        RAD3 : IN STD_LOGIC;
        WAD0 : IN STD_LOGIC;
        WAD1 : IN STD_LOGIC;
        WAD2 : IN STD_LOGIC;
        WAD3 : IN STD_LOGIC;
        WDO0 : OUT STD_LOGIC;
        WDO1 : OUT STD_LOGIC;
        RDO0 : OUT STD_LOGIC;
        RDO1 : OUT STD_LOGIC);
END COMPONENT;

COMPONENT FADD2
    PORT(
          A0		:  IN	STD_ULOGIC;
          A1		:  IN	STD_ULOGIC;
          B0		:  IN	STD_ULOGIC;
          B1		:  IN	STD_ULOGIC;
          CI		:  IN	STD_ULOGIC;
          COUT0		:  OUT	STD_ULOGIC;
          COUT1		:  OUT	STD_ULOGIC;
          S0		:  OUT	STD_ULOGIC;
          S1		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT CCU2

   GENERIC (
      INJECT1_0 : string := "YES";
      INJECT1_1 : string := "YES";
      INIT0: string := "0x0000";
      INIT1: string := "0x0000"
   );

   PORT (
      A0,A1 : IN STD_ULOGIC;
      B0,B1 : IN STD_ULOGIC;
      C0,C1 : IN STD_ULOGIC;
      D0,D1 : IN STD_ULOGIC;
      CIN : IN STD_ULOGIC;
      S0,S1 : OUT STD_ULOGIC;
      COUT0,COUT1 : OUT STD_ULOGIC
   );

END COMPONENT;

COMPONENT FD1P3AX
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          SP		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1P3AY
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          SP		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1P3BX
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          SP		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          PD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1P3DX
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          SP		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          CD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1P3IX
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          SP		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          CD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1P3JX
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          SP		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          PD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1S1A
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1S1AY
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1S1B
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          PD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1S1D
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          CD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1S1I
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          CD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1S1J
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          PD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1S3AX
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1S3AY
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1S3BX
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          PD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1S3DX
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          CD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1S3IX
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          CD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FD1S3JX
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          PD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FL1P3AY
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D0		:  IN	STD_ULOGIC;
          D1		:  IN	STD_ULOGIC;
          SP		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          SD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FL1P3AZ
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D0		:  IN	STD_ULOGIC;
          D1		:  IN	STD_ULOGIC;
          SP		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          SD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FL1P3BX
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D0		:  IN	STD_ULOGIC;
          D1		:  IN	STD_ULOGIC;
          SP		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          SD		:  IN	STD_ULOGIC;
          PD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FL1P3DX
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D0		:  IN	STD_ULOGIC;
          D1		:  IN	STD_ULOGIC;
          SP		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          SD		:  IN	STD_ULOGIC;
          CD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FL1P3IY
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D0		:  IN	STD_ULOGIC;
          D1		:  IN	STD_ULOGIC;
          SP		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          SD		:  IN	STD_ULOGIC;
          CD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FL1P3JY
    GENERIC (GSR : string := "ENABLED");
    PORT(
          D0		:  IN	STD_ULOGIC;
          D1		:  IN	STD_ULOGIC;
          SP		:  IN	STD_ULOGIC;
          CK		:  IN	STD_ULOGIC;
          SD		:  IN	STD_ULOGIC;
          PD		:  IN	STD_ULOGIC;
          Q		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT FSUB2
    PORT(
          A0		:  IN	STD_ULOGIC;
          A1		:  IN	STD_ULOGIC;
          B0		:  IN	STD_ULOGIC;
          B1		:  IN	STD_ULOGIC;
          BI		:  IN	STD_ULOGIC;
          BOUT0		:  OUT	STD_ULOGIC;
          BOUT1		:  OUT	STD_ULOGIC;
          S0		:  OUT	STD_ULOGIC;
          S1		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT GSR
    PORT(
          GSR		:  IN	STD_ULOGIC
        );
END COMPONENT;

attribute syn_black_box of GSR : COMPONENT is true; --ct111505
attribute syn_noprune of GSR: COMPONENT is true;


COMPONENT JTAGD
   GENERIC(
      ER1        : string  := "ENABLED";
      ER2        : string  := "ENABLED"
      );
    PORT(
          TCK		:  IN	STD_ULOGIC;
          TMS		:  IN	STD_ULOGIC;
          TDI		:  IN	STD_ULOGIC;
          JTDO1		:  IN	STD_ULOGIC;
          JTDO2		:  IN	STD_ULOGIC;
          TDO		:  OUT	STD_ULOGIC;
          JTCK		:  OUT	STD_ULOGIC;
          JTDI		:  OUT	STD_ULOGIC;
          JSHIFT	:  OUT	STD_ULOGIC;
          JUPDATE	:  OUT	STD_ULOGIC;
          JRST    	:  OUT	STD_ULOGIC;
          JCE1  	:  OUT	STD_ULOGIC;
          JCE2  	:  OUT	STD_ULOGIC;
          JRTI1  	:  OUT	STD_ULOGIC;
          JRTI2		:  OUT	STD_ULOGIC
        );
END COMPONENT;
attribute syn_black_box of JTAGD : COMPONENT is true;
attribute syn_noprune of JTAGD: COMPONENT is true;

COMPONENT IB
    PORT(
          I		:  IN	STD_ULOGIC;
          O		:  OUT	STD_ULOGIC
        );
END COMPONENT;
  attribute black_box_pad_pin of IB : COMPONENT is "I";

COMPONENT IBPD
    PORT(
          I		:  IN	STD_ULOGIC;
          O		:  OUT	STD_ULOGIC
        );
END COMPONENT;
  attribute black_box_pad_pin of IBPD : COMPONENT is "I";


COMPONENT IBPU
    PORT(
          I		:  IN	STD_ULOGIC;
          O		:  OUT	STD_ULOGIC
        );
END COMPONENT;
  attribute black_box_pad_pin of IBPU : COMPONENT is "I";

COMPONENT INV
    PORT(

          A		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT L6MUX21
    PORT(

          D0		:  IN	STD_ULOGIC;
          D1		:  IN	STD_ULOGIC;
          SD		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT MUX161
    PORT(

          D0		:  IN	STD_ULOGIC;
          D1		:  IN	STD_ULOGIC;
          D2		:  IN	STD_ULOGIC;
          D3		:  IN	STD_ULOGIC;
          D4		:  IN	STD_ULOGIC;
          D5		:  IN	STD_ULOGIC;
          D6		:  IN	STD_ULOGIC;
          D7		:  IN	STD_ULOGIC;
          SD1		:  IN	STD_ULOGIC;
          SD2		:  IN	STD_ULOGIC;
          SD3		:  IN	STD_ULOGIC;
          SD4		:  IN	STD_ULOGIC;
          D8		:  IN	STD_ULOGIC;
          D9		:  IN	STD_ULOGIC;
          D10		:  IN	STD_ULOGIC;
          D11		:  IN	STD_ULOGIC;
          D12		:  IN	STD_ULOGIC;
          D13		:  IN	STD_ULOGIC;
          D14		:  IN	STD_ULOGIC;
          D15		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT MUX21
    PORT(

          D0		:  IN	STD_ULOGIC;
          D1		:  IN	STD_ULOGIC;
          SD		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT MUX321
    PORT(

          D0		:  IN	STD_ULOGIC;
          D1		:  IN	STD_ULOGIC;
          D2		:  IN	STD_ULOGIC;
          D3		:  IN	STD_ULOGIC;
          D4		:  IN	STD_ULOGIC;
          D5		:  IN	STD_ULOGIC;
          D6		:  IN	STD_ULOGIC;
          D7		:  IN	STD_ULOGIC;
          SD1		:  IN	STD_ULOGIC;
          SD2		:  IN	STD_ULOGIC;
          SD3		:  IN	STD_ULOGIC;
          SD4		:  IN	STD_ULOGIC;
          SD5		:  IN	STD_ULOGIC;
          D8		:  IN	STD_ULOGIC;
          D9		:  IN	STD_ULOGIC;
          D10		:  IN	STD_ULOGIC;
          D11		:  IN	STD_ULOGIC;
          D12		:  IN	STD_ULOGIC;
          D13		:  IN	STD_ULOGIC;
          D14		:  IN	STD_ULOGIC;
          D15		:  IN	STD_ULOGIC;
          D16		:  IN	STD_ULOGIC;
          D17		:  IN	STD_ULOGIC;
          D18		:  IN	STD_ULOGIC;
          D19		:  IN	STD_ULOGIC;
          D20		:  IN	STD_ULOGIC;
          D21		:  IN	STD_ULOGIC;
          D22		:  IN	STD_ULOGIC;
          D23		:  IN	STD_ULOGIC;
          D24		:  IN	STD_ULOGIC;
          D25		:  IN	STD_ULOGIC;
          D26		:  IN	STD_ULOGIC;
          D27		:  IN	STD_ULOGIC;
          D28		:  IN	STD_ULOGIC;
          D29		:  IN	STD_ULOGIC;
          D30		:  IN	STD_ULOGIC;
          D31		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT MUX41
    PORT(
          D0		:  IN	STD_ULOGIC;
          D1		:  IN	STD_ULOGIC;
          D2		:  IN	STD_ULOGIC;
          D3		:  IN	STD_ULOGIC;
          SD1		:  IN	STD_ULOGIC;
          SD2		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT MUX81
    PORT(
          D0		:  IN	STD_ULOGIC;
          D1		:  IN	STD_ULOGIC;
          D2		:  IN	STD_ULOGIC;
          D3		:  IN	STD_ULOGIC;
          D4		:  IN	STD_ULOGIC;
          D5		:  IN	STD_ULOGIC;
          D6		:  IN	STD_ULOGIC;
          D7		:  IN	STD_ULOGIC;
          SD1		:  IN	STD_ULOGIC;
          SD2		:  IN	STD_ULOGIC;
          SD3		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ND2
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ND3
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ND4
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ND5
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          E		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT NR2
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT NR3
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT NR4
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT NR5
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          E		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT OB
    PORT(
          I		:  IN	STD_ULOGIC;
          O		:  OUT	STD_ULOGIC
        );
END COMPONENT;
  attribute black_box_pad_pin of OB : COMPONENT is "O";

COMPONENT OBW
    PORT(
          I		:  IN	STD_ULOGIC;
          T		:  IN	STD_ULOGIC;
          O		:  OUT	STD_ULOGIC
        );
END COMPONENT;
  attribute black_box_pad_pin of OBW : COMPONENT is "O";

COMPONENT OBZ
    PORT(
          I		:  IN	STD_ULOGIC;
          T		:  IN	STD_ULOGIC;
          O		:  OUT	STD_ULOGIC
        );
END COMPONENT;
  attribute black_box_pad_pin of OBZ : COMPONENT is "O";

COMPONENT OBZPD
    PORT(
          I		:  IN	STD_ULOGIC;
          T		:  IN	STD_ULOGIC;
          O		:  OUT	STD_ULOGIC
        );
END COMPONENT;
  attribute black_box_pad_pin of OBZPD : COMPONENT is "O";

COMPONENT OBZPU
    PORT(
          I		:  IN	STD_ULOGIC;
          T		:  IN	STD_ULOGIC;
          O		:  OUT	STD_ULOGIC
        );
END COMPONENT;
  attribute black_box_pad_pin of OBZPU : COMPONENT is "O";

COMPONENT OR2
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT OR3
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT OR4
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT OR5
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          E		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ORCALUT4
    GENERIC(  init      :	bit_vector);
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ORCALUT5
    GENERIC(  init      :	bit_vector);
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          E		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ORCALUT6
    GENERIC(  init      :	bit_vector);
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          E		:  IN	STD_ULOGIC;
          F		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ORCALUT7
    GENERIC(  init      :	bit_vector);
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          E		:  IN	STD_ULOGIC;
          F		:  IN	STD_ULOGIC;
          G		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ORCALUT8
    GENERIC(  init      :	bit_vector);
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          E		:  IN	STD_ULOGIC;
          F		:  IN	STD_ULOGIC;
          G		:  IN	STD_ULOGIC;
          H		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT PFUMX
    PORT(
          ALUT		:  IN	STD_ULOGIC;
          BLUT		:  IN	STD_ULOGIC;
          C0		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT PUR
   GENERIC (
      RST_PULSE          : Integer   := 1);
    PORT(
          PUR		:  IN	STD_ULOGIC
        );
END COMPONENT;

attribute syn_black_box of PUR : COMPONENT is true; --ct111505
attribute syn_noprune of PUR : COMPONENT is true;

COMPONENT ROM128X1
GENERIC(
        initval : string := "0x00000000000000000000000000000000"
  );
    PORT(
          AD0		:  IN	STD_ULOGIC;
          AD1		:  IN	STD_ULOGIC;
          AD2		:  IN	STD_ULOGIC;
          AD3		:  IN	STD_ULOGIC;
          AD4		:  IN	STD_ULOGIC;
          AD5		:  IN	STD_ULOGIC;
          AD6		:  IN	STD_ULOGIC;
          DO0		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ROM16X1
GENERIC(
        initval : string := "0x0000"
  );
    PORT(
          AD0		:  IN	STD_ULOGIC;
          AD1		:  IN	STD_ULOGIC;
          AD2		:  IN	STD_ULOGIC;
          AD3		:  IN	STD_ULOGIC;
          DO0		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ROM256X1
GENERIC(
        initval : string := "0x0000000000000000000000000000000000000000000000000000000000000000"
  );
    PORT(
          AD0		:  IN	STD_ULOGIC;
          AD1		:  IN	STD_ULOGIC;
          AD2		:  IN	STD_ULOGIC;
          AD3		:  IN	STD_ULOGIC;
          AD4		:  IN	STD_ULOGIC;
          AD5		:  IN	STD_ULOGIC;
          AD6		:  IN	STD_ULOGIC;
          AD7		:  IN	STD_ULOGIC;
          DO0		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ROM32X1
GENERIC(
        initval : string := "0x00000000"
  );
    PORT(
          AD0		:  IN	STD_ULOGIC;
          AD1		:  IN	STD_ULOGIC;
          AD2		:  IN	STD_ULOGIC;
          AD3		:  IN	STD_ULOGIC;
          AD4		:  IN	STD_ULOGIC;
          DO0		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT ROM64X1
GENERIC(
        initval : string := "0x0000000000000000"
  );
    PORT(
          AD0		:  IN	STD_ULOGIC;
          AD1		:  IN	STD_ULOGIC;
          AD2		:  IN	STD_ULOGIC;
          AD3		:  IN	STD_ULOGIC;
          AD4		:  IN	STD_ULOGIC;
          AD5		:  IN	STD_ULOGIC;
          DO0		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT SPR16X2B
  PORT (DI0  : IN STD_LOGIC;
        DI1  : IN STD_LOGIC;
        CK   : IN STD_LOGIC;
        WRE  : IN STD_LOGIC;
        AD0  : IN STD_LOGIC;
        AD1  : IN STD_LOGIC;
        AD2  : IN STD_LOGIC;
        AD3  : IN STD_LOGIC;
        DO0  : OUT STD_LOGIC;
        DO1  : OUT STD_LOGIC);
END COMPONENT;

COMPONENT TSALL
    PORT(

          TSALL		:  IN	STD_ULOGIC
        );
END COMPONENT;

attribute syn_black_box of TSALL: COMPONENT is true;
attribute syn_noprune of TSALL: COMPONENT is true;

COMPONENT OSCC
    PORT(

          OSC	:  OUT	STD_ULOGIC
        );
END COMPONENT;

attribute syn_black_box of OSCC: COMPONENT is true; 
attribute syn_noprune of OSCC: COMPONENT is true;

COMPONENT VHI
    PORT(

          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT VLO
    PORT(

          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT XNOR2
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT XNOR3
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT XNOR4
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT XNOR5
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          E		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT XOR11
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          E		:  IN	STD_ULOGIC;
          F		:  IN	STD_ULOGIC;
          G		:  IN	STD_ULOGIC;
          H		:  IN	STD_ULOGIC;
          I		:  IN	STD_ULOGIC;
          J		:  IN	STD_ULOGIC;
          K		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT XOR2
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT XOR21
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          E		:  IN	STD_ULOGIC;
          F		:  IN	STD_ULOGIC;
          G		:  IN	STD_ULOGIC;
          H		:  IN	STD_ULOGIC;
          I		:  IN	STD_ULOGIC;
          J		:  IN	STD_ULOGIC;
          K		:  IN	STD_ULOGIC;
          L		:  IN	STD_ULOGIC;
          M		:  IN	STD_ULOGIC;
          N		:  IN	STD_ULOGIC;
          O		:  IN	STD_ULOGIC;
          P		:  IN	STD_ULOGIC;
          Q		:  IN	STD_ULOGIC;
          R		:  IN	STD_ULOGIC;
          S		:  IN	STD_ULOGIC;
          T		:  IN	STD_ULOGIC;
          U		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT XOR3
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT XOR4
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT XOR5
    PORT(
          A		:  IN	STD_ULOGIC;
          B		:  IN	STD_ULOGIC;
          C		:  IN	STD_ULOGIC;
          D		:  IN	STD_ULOGIC;
          E		:  IN	STD_ULOGIC;
          Z		:  OUT	STD_ULOGIC
        );
END COMPONENT;

COMPONENT PDP8KB
GENERIC(
        DATA_WIDTH_W : in Integer := 18;
        DATA_WIDTH_R : in Integer := 18;
        REGMODE      : String  := "NOREG";
        RESETMODE    : String  := "SYNC";
        CSDECODE_W   : STD_LOGIC_vector(2 downto 0)  := "000";
        CSDECODE_R   : STD_LOGIC_vector(2 downto 0)  := "000";
        GSR : String  := "DISABLED";
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
        DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8            : IN STD_LOGIC := 'X';
        DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17    : IN STD_LOGIC := 'X';
        DI18, DI19, DI20, DI21, DI22, DI23, DI24, DI25, DI26   : IN STD_LOGIC := 'X';
        DI27, DI28, DI29, DI30, DI31, DI32, DI33, DI34, DI35   : IN STD_LOGIC := 'X';
        ADW0, ADW1, ADW2, ADW3, ADW4, ADW5, ADW6, ADW7, ADW8   : IN STD_LOGIC := 'X';
        ADW9, ADW10, ADW11, ADW12                       : IN STD_LOGIC := 'X';
        CEW, CLKW, WE, CSW0, CSW1, CSW2                        : IN STD_LOGIC := 'X';
        ADR0, ADR1, ADR2, ADR3, ADR4, ADR5, ADR6, ADR7, ADR8   : IN STD_LOGIC := 'X';
        ADR9, ADR10, ADR11, ADR12                       : IN STD_LOGIC := 'X';
        CER, CLKR, CSR0, CSR1, CSR2, RST                       : IN STD_LOGIC := 'X';

        DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8            : OUT STD_LOGIC := 'X';
        DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17    : OUT STD_LOGIC := 'X';
        DO18, DO19, DO20, DO21, DO22, DO23, DO24, DO25, DO26   : OUT STD_LOGIC := 'X';
        DO27, DO28, DO29, DO30, DO31, DO32, DO33, DO34, DO35   : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
COMPONENT DP8KB
GENERIC(
        DATA_WIDTH_A : IN Integer := 18;
        DATA_WIDTH_B : IN Integer := 18;
        REGMODE_A    : String  := "NOREG";
        REGMODE_B    : String  := "NOREG";
        RESETMODE    : String  := "SYNC";
        CSDECODE_A   : STD_LOGIC_vector(2 downto 0)  := "000";
        CSDECODE_B   : STD_LOGIC_vector(2 downto 0)  := "000";
        WRITEMODE_A  : String  := "NORMAL";
        WRITEMODE_B  : String  := "NORMAL";
        GSR : String  := "DISABLED";
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
        DIA0, DIA1, DIA2, DIA3, DIA4, DIA5, DIA6, DIA7, DIA8            : IN STD_LOGIC := 'X';
        DIA9, DIA10, DIA11, DIA12, DIA13, DIA14, DIA15, DIA16, DIA17    : IN STD_LOGIC := 'X';
        ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8            : IN STD_LOGIC := 'X';
        ADA9, ADA10, ADA11, ADA12                                : IN STD_LOGIC := 'X';
        CEA, CLKA, WEA, CSA0, CSA1, CSA2, RSTA                         : IN STD_LOGIC := 'X';
        DIB0, DIB1, DIB2, DIB3, DIB4, DIB5, DIB6, DIB7, DIB8            : IN STD_LOGIC := 'X';
        DIB9, DIB10, DIB11, DIB12, DIB13, DIB14, DIB15, DIB16, DIB17    : IN STD_LOGIC := 'X';
        ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8            : IN STD_LOGIC := 'X';
        ADB9, ADB10, ADB11, ADB12                                : IN STD_LOGIC := 'X';
        CEB, CLKB, WEB, CSB0, CSB1, CSB2, RSTB                         : IN STD_LOGIC := 'X';

        DOA0, DOA1, DOA2, DOA3, DOA4, DOA5, DOA6, DOA7, DOA8            : OUT STD_LOGIC := 'X';
        DOA9, DOA10, DOA11, DOA12, DOA13, DOA14, DOA15, DOA16, DOA17    : OUT STD_LOGIC := 'X';
        DOB0, DOB1, DOB2, DOB3, DOB4, DOB5, DOB6, DOB7, DOB8            : OUT STD_LOGIC := 'X';
        DOB9, DOB10, DOB11, DOB12, DOB13, DOB14, DOB15, DOB16, DOB17    : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
COMPONENT SP8KB
GENERIC(
        DATA_WIDTH   : IN Integer := 18;
        REGMODE      : String  := "NOREG";
        RESETMODE    : String  := "SYNC";
        CSDECODE     : STD_LOGIC_vector(2 downto 0)  := "000";
        WRITEMODE    : String  := "NORMAL";
        GSR : String  := "DISABLED";
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
        DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8            : IN STD_LOGIC := 'X';
        DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17    : IN STD_LOGIC := 'X';
        AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8            : IN STD_LOGIC := 'X';
        AD9, AD10, AD11, AD12                            : IN STD_LOGIC := 'X';
        CE, CLK, WE, CS0, CS1, CS2, RST                             : IN STD_LOGIC := 'X';

        DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8            : OUT STD_LOGIC := 'X';
        DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17    : OUT STD_LOGIC := 'X'
  );
END COMPONENT;

COMPONENT FIFO8KA
GENERIC(
        DATA_WIDTH_W               : INteger  := 18;
        DATA_WIDTH_R               : INteger  := 18;
        REGMODE                    : String  := "NOREG";
        RESETMODE                  : String  := "SYNC";
        CSDECODE_W                 : STD_LOGIC_vector(1 downto 0)  := "00";
        CSDECODE_R                 : STD_LOGIC_vector(1 downto 0)  := "00";
        AEPOINTER                  : STD_LOGIC_vector(13 downto 0)  := "00000000000000";
        AEPOINTER1                 : STD_LOGIC_vector(13 downto 0)  := "00000000000000";
        AFPOINTER                  : STD_LOGIC_vector(13 downto 0)  := "00000000000000";
        AFPOINTER1                 : STD_LOGIC_vector(13 downto 0)  := "00000000000000";
        FULLPOINTER                : STD_LOGIC_vector(13 downto 0)  := "00000000000000";
        FULLPOINTER1               : STD_LOGIC_vector(13 downto 0)  := "00000000000000";
        GSR                        : String    := "DISABLED"
  );
PORT(
        DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8            : IN STD_LOGIC := 'X';
        DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17    : IN STD_LOGIC := 'X';
        DI18, DI19, DI20, DI21, DI22, DI23, DI24, DI25, DI26   : IN STD_LOGIC := 'X';
        DI27, DI28, DI29, DI30, DI31, DI32, DI33, DI34, DI35   : IN STD_LOGIC := 'X';
        FULLI, CSW0, CSW1, EMPTYI, CSR0, CSR1                  : IN STD_LOGIC := 'X';
        WE, RE, CLKW, CLKR, RST, RPRST                         : IN STD_LOGIC := 'X';

        DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8            : OUT STD_LOGIC := 'X';
        DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17    : OUT STD_LOGIC := 'X';
        DO18, DO19, DO20, DO21, DO22, DO23, DO24, DO25, DO26   : OUT STD_LOGIC := 'X';
        DO27, DO28, DO29, DO30, DO31, DO32, DO33, DO34, DO35   : OUT STD_LOGIC := 'X';
        EF, AEF, AFF, FF                                       : OUT STD_LOGIC := 'X'
  );
END COMPONENT;

COMPONENT EHXPLLC
GENERIC(
      FIN                : string  := "100.0";
      CLKI_DIV           : INteger   := 1;
      CLKFB_DIV          : INteger   := 1;
      CLKOP_DIV          : INteger   := 1;
      CLKOK_DIV          : INteger   := 1;
      PHASEADJ           : INteger   := 0;
      FDEL               : INteger   := 0;
      DUTY               : INteger   := 4;
      DELAY_CNTL         : String    := "STATIC";
      WAKE_ON_LOCK       : String    := "ON";
      LOCK_DELAY         : INteger   := 100;
      LOCK_CYC           : INteger   := 2
   );
   PORT(
      CLKI                  : IN STD_LOGIC;
      CLKFB                 : IN STD_LOGIC;
      RST                   : IN STD_LOGIC;
      DDAMODE               : IN STD_LOGIC;
      DDAIZR                : IN STD_LOGIC;
      DDAILAG               : IN STD_LOGIC;
      DDAIDEL0              : IN STD_LOGIC;
      DDAIDEL1              : IN STD_LOGIC;
      DDAIDEL2              : IN STD_LOGIC;
      CLKOS                 : OUT STD_LOGIC;
      CLKOP                 : OUT STD_LOGIC;
      CLKOK                 : OUT STD_LOGIC;
      LOCK                  : OUT STD_LOGIC;
      CLKINTFB              : OUT STD_LOGIC);
END COMPONENT;
attribute syn_tpd1 of ehxpllc : COMPONENT is
      "CLKI -> CLKOP = 0.1";
attribute syn_tpd2 of ehxpllc : COMPONENT is
      "RST -> LOCK = 0.1";

COMPONENT LB2P3AX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        CON: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LB2P3AY
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        CON: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LB2P3BX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        PD: IN STD_LOGIC := 'X';
        CON: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LB2P3DX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        CD: IN STD_LOGIC := 'X';
        CON: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LB2P3IX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        CD: IN STD_LOGIC := 'X';
        CON: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LB2P3JX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        PD: IN STD_LOGIC := 'X';
        CON: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LD2P3AX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LD2P3AY
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LD2P3BX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        PD: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LD2P3DX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        CD: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LD2P3IX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        CD: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LD2P3JX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        sp: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        PD: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LU2P3AX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LU2P3AY
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LU2P3BX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        PD: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LU2P3DX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        CD: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LU2P3IX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        CD: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
COMPONENT LU2P3JX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D0, D1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        CK: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        PD: IN STD_LOGIC := 'X';
        CO: OUT STD_LOGIC := 'X';
        Q0, Q1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
--
END COMPONENTs;


