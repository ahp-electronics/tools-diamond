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
--                     U.S.A
--
--                     TEL: 1-800-Lattice (USA and Canada)
--                          408-826-6000 (other locations)
--
--                     web: http://www.latticesemi.com/
--                     email: techsupport@latticesemi.com
--
-- --------------------------------------------------------------------
--
-- Header files for ECP3 family.
--
-- --------------------------------------------------------------------

LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
PACKAGE components IS 
   attribute syn_black_box: boolean ;
   attribute syn_black_box of Components : package is true;
   attribute black_box_pad_pin: string;
   attribute syn_noprune : boolean;
   attribute syn_noprune of Components : package is true;
-- 
COMPONENT AGEB2
PORT(
        A1, A0: IN std_logic := 'X';
        B1, B0: IN std_logic := 'X';
        CI: IN std_logic := 'X';
        GE: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ALEB2
PORT( 
	A1, A0: IN std_logic := 'X';
	B1, B0: IN std_logic := 'X';
	CI: IN std_logic := 'X';
	LE: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ANEB2
PORT(
        A1, A0: IN std_logic := 'X';
        B1, B0: IN std_logic := 'X';
        CI: IN std_logic := 'X';
        NE: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT AND2
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT AND3
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT AND4
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	D: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT AND5
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	D: IN std_logic := 'X';
	E: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT BB
PORT(
        B:  INOUT std_logic := 'X';
        I:  IN std_logic := 'X';
        T:  IN std_logic := 'X';
        O:  OUT std_logic);
END COMPONENT;
   attribute black_box_pad_pin of bb : component is "b";
--
COMPONENT BBPD
PORT(
        B:  INOUT std_logic := 'X';
        I:  IN std_logic := 'X';
        T:  IN std_logic := 'X';
        O:  OUT std_logic);
END COMPONENT;
   attribute black_box_pad_pin of bbpd : component is "b";
--
COMPONENT BBPU
PORT(
        B:  INOUT std_logic := 'X';
        I:  IN std_logic := 'X';
        T:  IN std_logic := 'X';
        O:  OUT std_logic);
END COMPONENT;
   attribute black_box_pad_pin of bbpu : component is "b";
--
COMPONENT BBW
PORT(
        B:  INOUT std_logic := 'X';
        I:  IN std_logic := 'X';
        T:  IN std_logic := 'X';
        O:  OUT std_logic);
END COMPONENT;
   attribute black_box_pad_pin of bbw : component is "b";
--
COMPONENT CB2
PORT(
        CI : IN std_logic := 'X';
        PC1, PC0 : IN std_logic := 'X';
        CON: IN std_logic := 'X';
        CO : OUT std_logic := 'X';
        NC1, NC0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT CD2
PORT(
        CI : IN std_logic := 'X';
        PC1, PC0 : IN std_logic := 'X';
        CO : OUT std_logic := 'X';
        NC1, NC0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT CU2
PORT(
        CI : IN std_logic := 'X';
        PC1, PC0 : IN std_logic := 'X';
        CO : OUT std_logic := 'X';
        NC1, NC0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT DCS
GENERIC(
      DCSMODE         : String  := "NEG");
PORT(
        CLK1              : IN std_logic := 'X';
        CLK0              : IN std_logic := 'X';
        SEL               : IN std_logic := 'X';
        DCSOUT            : OUT std_logic);
END COMPONENT;
--
COMPONENT FADD2B
PORT(
        A1, A0 : IN std_logic := 'X';
        B1, B0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        COUT : OUT std_logic := 'X';
        S1, S0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT FADSU2
PORT(
        A1, A0 : IN std_logic := 'X';
        B1, B0 : IN std_logic := 'X';
        BCI: IN std_logic := 'X';
        CON: IN std_logic := 'X';
        BCO: OUT std_logic := 'X';
        S1, S0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT FD1P3AX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN std_logic := 'X';
	SP: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FD1P3AY
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN std_logic := 'X';
	SP: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FD1P3BX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN std_logic := 'X';
	SP: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	PD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FD1P3DX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN std_logic := 'X';
	SP: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	CD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FD1P3IX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN std_logic := 'X';
	SP: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	CD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FD1P3JX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN std_logic := 'X';
	SP: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	PD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FD1S3AX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN std_logic := 'X';
	CK: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FD1S3AY
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN std_logic := 'X';
	CK: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FD1S3BX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN std_logic := 'X';
	CK: IN std_logic := 'X';
	PD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FD1S3DX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	CD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FD1S3IX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN std_logic := 'X';
	CK: IN std_logic := 'X';
	CD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FD1S3JX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN std_logic := 'X';
	CK: IN std_logic := 'X';
	PD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1P3AY
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D1: IN std_logic := 'X';
	D0: IN std_logic := 'X';
	SP: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	SD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1P3AZ
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D1: IN std_logic := 'X';
	D0: IN std_logic := 'X';
	SP: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	SD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1P3BX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D1: IN std_logic := 'X';
	D0: IN std_logic := 'X';
	SP: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	SD: IN std_logic := 'X';
	PD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1P3DX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D1: IN std_logic := 'X';
	D0: IN std_logic := 'X';
	SP: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	SD: IN std_logic := 'X';
	CD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1P3IY
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D1: IN std_logic := 'X';
	D0: IN std_logic := 'X';
	SP: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	SD: IN std_logic := 'X';
	CD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1P3JY
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D1: IN std_logic := 'X';
	D0: IN std_logic := 'X';
	SP: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	SD: IN std_logic := 'X';
	PD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1S3AX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D1: IN std_logic := 'X';
	D0: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	SD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FL1S3AY
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D1: IN std_logic := 'X';
	D0: IN std_logic := 'X';
	CK: IN std_logic := 'X';
	SD: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT FSUB2B
PORT(
        A1, A0 : IN std_logic := 'X';
        B1, B0 : IN std_logic := 'X';
        BI: IN std_logic := 'X';
        BOUT : OUT std_logic := 'X';
        S1, S0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT GSR
PORT( 
      GSR: IN std_logic := 'X'
  );
END COMPONENT;
   attribute syn_noprune of gsr : component is true;
--
COMPONENT IB
PORT(
        I:  IN std_logic := 'X';
        O:  OUT std_logic);
END COMPONENT;
   attribute black_box_pad_pin of ib : component is "i";
--
COMPONENT IBPD
PORT(
        I:  IN std_logic := 'X';
        O:  OUT std_logic);
END COMPONENT;
   attribute black_box_pad_pin of ibpd : component is "i";
--
COMPONENT IBPU
PORT(
        I:  IN std_logic := 'X';
        O:  OUT std_logic);
END COMPONENT;
   attribute black_box_pad_pin of ibpu : component is "i";
--
COMPONENT IFS1P3BX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN std_logic := 'X';
	SP  : IN std_logic := 'X';
	SCLK: IN std_logic := 'X';
	PD  : IN std_logic := 'X';
	Q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT IFS1P3DX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN std_logic := 'X';
	SP  : IN std_logic := 'X';
	SCLK: IN std_logic := 'X';
	CD  : IN std_logic := 'X';
	Q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT IFS1P3IX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN std_logic := 'X';
	SP  : IN std_logic := 'X';
	SCLK: IN std_logic := 'X';
	CD  : IN std_logic := 'X';
	Q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT IFS1P3JX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN std_logic := 'X';
	SP  : IN std_logic := 'X';
	SCLK: IN std_logic := 'X';
	PD  : IN std_logic := 'X';
	Q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ILVDS
PORT(
        A : IN std_logic := 'X';
        AN: IN std_logic := 'X';
        Z : OUT std_logic
 );
END COMPONENT;
   attribute black_box_pad_pin of ilvds : component is "a,an";
--
COMPONENT INV
PORT( 
	A: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT L6MUX21
PORT(
        D1: IN std_logic := 'X';
        D0: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        Z : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT LB2P3AX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        CON: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LB2P3AY
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI : IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        CON: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LB2P3BX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        PD: IN std_logic := 'X';
        CON: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LB2P3DX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        CD: IN std_logic := 'X';
        CON: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LB2P3IX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        CD: IN std_logic := 'X';
        CON: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LB2P3JX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        PD: IN std_logic := 'X';
        CON: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LD2P3AX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LD2P3AY
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LD2P3BX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        PD: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LD2P3DX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        CD: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LD2P3IX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        CD: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LD2P3JX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        PD: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LU2P3AX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LU2P3AY
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LU2P3BX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        PD: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LU2P3DX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        CD: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LU2P3IX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        CD: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT LU2P3JX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D1, D0 : IN std_logic := 'X';
        CI: IN std_logic := 'X';
        SP: IN std_logic := 'X';
        CK: IN std_logic := 'X';
        SD: IN std_logic := 'X';
        PD: IN std_logic := 'X';
        CO: OUT std_logic := 'X';
        Q1, Q0 : OUT std_logic := 'X'
  );
END COMPONENT;
--
component MULT2
   port(
      A3                             :  in    STD_ULOGIC;
      A2                             :  in    STD_ULOGIC;
      A1                             :  in    STD_ULOGIC;
      A0                             :  in    STD_ULOGIC;
      B3                             :  in    STD_ULOGIC;
      B2                             :  in    STD_ULOGIC;
      B1                             :  in    STD_ULOGIC;
      B0                             :  in    STD_ULOGIC;
      CI                             :  in    STD_ULOGIC;
      P1                             :  out   STD_ULOGIC;
      P0                             :  out   STD_ULOGIC;
      CO                             :  out   STD_ULOGIC);
end component;
--
COMPONENT MUX161
PORT(
        D15: IN std_logic := 'X';
        D14: IN std_logic := 'X';
        D13: IN std_logic := 'X';
        D12: IN std_logic := 'X';
        D11: IN std_logic := 'X';
        D10: IN std_logic := 'X';
        D9:  IN std_logic := 'X';
        D8:  IN std_logic := 'X';
        D7:  IN std_logic := 'X';
        D6:  IN std_logic := 'X';
        D5:  IN std_logic := 'X';
        D4:  IN std_logic := 'X';
        D3:  IN std_logic := 'X';
        D2:  IN std_logic := 'X';
        D1:  IN std_logic := 'X';
        D0:  IN std_logic := 'X';
        SD4: IN std_logic := 'X';
        SD3: IN std_logic := 'X';
        SD2: IN std_logic := 'X';
        SD1: IN std_logic := 'X';
        Z : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT MUX21
PORT( 
	D1: IN std_logic := 'X';
	D0: IN std_logic := 'X';
	SD: IN std_logic := 'X';
	Z : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT MUX321
PORT(
        D31: IN std_logic := 'X';
        D30: IN std_logic := 'X';
        D29: IN std_logic := 'X';
        D28: IN std_logic := 'X';
        D27: IN std_logic := 'X';
        D26: IN std_logic := 'X';
        D25: IN std_logic := 'X';
        D24: IN std_logic := 'X';
        D23: IN std_logic := 'X';
        D22: IN std_logic := 'X';
        D21: IN std_logic := 'X';
        D20: IN std_logic := 'X';
        D19: IN std_logic := 'X';
        D18: IN std_logic := 'X';
        D17: IN std_logic := 'X';
        D16: IN std_logic := 'X';
        D15: IN std_logic := 'X';
        D14: IN std_logic := 'X';
        D13: IN std_logic := 'X';
        D12: IN std_logic := 'X';
        D11: IN std_logic := 'X';
        D10: IN std_logic := 'X';
        D9: IN std_logic := 'X';
        D8: IN std_logic := 'X';
        D7: IN std_logic := 'X';
        D6: IN std_logic := 'X';
        D5: IN std_logic := 'X';
        D4: IN std_logic := 'X';
        D3: IN std_logic := 'X';
        D2: IN std_logic := 'X';
        D1: IN std_logic := 'X';
        D0: IN std_logic := 'X';
        SD5: IN std_logic := 'X';
        SD4: IN std_logic := 'X';
        SD3: IN std_logic := 'X';
        SD2: IN std_logic := 'X';
        SD1: IN std_logic := 'X';
        Z : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT MUX41
PORT( 
	D3: IN std_logic := 'X';
	D2: IN std_logic := 'X';
	D1: IN std_logic := 'X';
	D0: IN std_logic := 'X';
	SD2: IN std_logic := 'X';
	SD1: IN std_logic := 'X';
	Z : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT MUX81
PORT( 
	D7: IN std_logic := 'X';
	D6: IN std_logic := 'X';
	D5: IN std_logic := 'X';
	D4: IN std_logic := 'X';
	D3: IN std_logic := 'X';
	D2: IN std_logic := 'X';
	D1: IN std_logic := 'X';
	D0: IN std_logic := 'X';
	SD3: IN std_logic := 'X';
	SD2: IN std_logic := 'X';
	SD1: IN std_logic := 'X';
	Z : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ND2
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ND3
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ND4
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	D: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ND5
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	D: IN std_logic := 'X';
	E: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT NR2
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT NR3
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT NR4
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	D: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT NR5
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	D: IN std_logic := 'X';
	E: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT OB
PORT(
        I:  IN std_logic := 'X';
        O:  OUT std_logic);
END COMPONENT;
   attribute black_box_pad_pin of ob : component is "o";
--
component OBCO
    port(
          I             :       in      STD_LOGIC;
          OT            :       out     STD_LOGIC;
          OC            :       out     STD_LOGIC
        );
end component;
   attribute black_box_pad_pin of OBCO : component is "OT,OC";
--
COMPONENT OBZ
PORT(
        I:  IN std_logic := 'X';
        T:  IN std_logic := 'X';
        O:  OUT std_logic);
END COMPONENT;
   attribute black_box_pad_pin of obz : component is "o";
--
COMPONENT OBZPU
PORT(
        I:  IN std_logic := 'X';
        T:  IN std_logic := 'X';
        O:  OUT std_logic);
END COMPONENT;
   attribute black_box_pad_pin of obzpu : component is "o";
-- 
COMPONENT OFD1S3AX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN std_logic := 'X';
	SCLK: IN std_logic := 'X';
	Q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT OFS1P3BX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D : IN std_logic := 'X';
        SP: IN std_logic := 'X';
        SCLK: IN std_logic := 'X';
        PD: IN std_logic := 'X';
        Q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT OFS1P3DX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D : IN std_logic := 'X';
        SP: IN std_logic := 'X';
        SCLK: IN std_logic := 'X';
        CD: IN std_logic := 'X';
        Q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT OFS1P3IX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D : IN std_logic := 'X';
        SP: IN std_logic := 'X';
        SCLK: IN std_logic := 'X';
        CD: IN std_logic := 'X';
        Q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT OFS1P3JX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D : IN std_logic := 'X';
        SP: IN std_logic := 'X';
        SCLK: IN std_logic := 'X';
        PD: IN std_logic := 'X';
        Q : OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT OLVDS
PORT(
        A  : IN std_logic := 'X';
        Z  : OUT std_logic ;
        ZN : OUT std_logic
 );
END COMPONENT;
   attribute black_box_pad_pin of olvds : component is "z,zn";
--
COMPONENT OR2
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT OR3
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT OR4
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	D: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT OR5
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	D: IN std_logic := 'X';
	E: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
------Component LUT4------
COMPONENT LUT4
    GENERIC(  init  : std_logic_vector );
    port(
          A             :       in      STD_ULOGIC;
          B             :       in      STD_ULOGIC;
          C             :       in      STD_ULOGIC;
          D             :       in      STD_ULOGIC;
          Z             :       out     STD_ULOGIC
        );
END COMPONENT;

------Component LUT5------
COMPONENT LUT5
    GENERIC(  init  : std_logic_vector );
    port(
          A             :       in      STD_ULOGIC;
          B             :       in      STD_ULOGIC;
          C             :       in      STD_ULOGIC;
          D             :       in      STD_ULOGIC;
          E             :       in      STD_ULOGIC;
          Z             :       out     STD_ULOGIC
        );
END COMPONENT;

------Component LUT6------
COMPONENT LUT6
    GENERIC(  init  : std_logic_vector );
    port(
          A             :       in      STD_ULOGIC;
          B             :       in      STD_ULOGIC;
          C             :       in      STD_ULOGIC;
          D             :       in      STD_ULOGIC;
          E             :       in      STD_ULOGIC;
          F             :       in      STD_ULOGIC;
          Z             :       out     STD_ULOGIC
        );
END COMPONENT;

------Component LUT7------
COMPONENT LUT7
    GENERIC(  init  : std_logic_vector );
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
END COMPONENT;

------Component LUT8------
COMPONENT LUT8
    GENERIC(  init  : std_logic_vector );
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
END COMPONENT;
--
COMPONENT PFUMX
PORT( 
	ALUT: IN std_logic := 'X';
	BLUT: IN std_logic := 'X';
	C0  : IN std_logic := 'X';
	Z   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT PUR
      GENERIC (RST_PULSE  : integer   := 1);
PORT(
      PUR: IN std_logic := 'X'
  );
END COMPONENT;
   attribute syn_noprune of pur : component is true;
--
COMPONENT ROM16X1A
GENERIC(
        initval : std_logic_vector(15 downto 0) := "0000000000000000"
  );
PORT( 
	AD3, AD2, AD1, AD0: IN std_logic := 'X';
	DO0: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT ROM32X1A
GENERIC(
        initval : std_logic_vector(31 downto 0) := "00000000000000000000000000000000"
  );
PORT( 
	AD4, AD3, AD2, AD1, AD0: IN std_logic := 'X';
	DO0: OUT std_logic := 'X'
  );
END COMPONENT;
-- 

COMPONENT ROM64X1A
GENERIC(
        initval : std_logic_vector(63 downto 0) := X"0000000000000000"
  );
PORT(
        AD5, AD4, AD3, AD2, AD1, AD0 : IN std_logic := 'X';
        DO0: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ROM128X1A
GENERIC(
        initval : std_logic_vector(127 downto 0) := X"00000000000000000000000000000000"
  );
PORT(
        AD6, AD5, AD4, AD3, AD2, AD1, AD0 : IN std_logic := 'X';
        DO0: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT ROM256X1A
GENERIC(
        initval : std_logic_vector(255 downto 0) := X"0000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        AD7, AD6, AD5, AD4, AD3, AD2, AD1, AD0 : IN std_logic := 'X';
        DO0: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT CCU2C
  GENERIC (
      INJECT1_0 : string := "YES";
      INJECT1_1 : string := "YES";
      INIT0: std_logic_vector(15 downto 0) := "0000000000000000" ;
      INIT1: std_logic_vector(15 downto 0) := "0000000000000000" );
   port (
      A1,B1,C1,D1 : in std_ulogic;
      A0,B0,C0,D0 : in std_ulogic;
      CIN : in std_ulogic;
      S0,S1 : out std_ulogic;
      COUT : out std_ulogic
   );
END COMPONENT;
--
COMPONENT VHI
PORT( 
	 Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT VLO
PORT( 
	 Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT XOR2
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT XOR3
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT XOR4
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	D: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT XOR5
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	D: IN std_logic := 'X';
	E: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT XOR11
PORT( 
        A, B, C, D, E, F, G, H, I, J, K: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT XOR21
PORT( 
	A, B, C, D, E, F, G, H, I, J, K: IN std_logic := 'X';
	L, M, N, O, P, Q, R, S, T, U: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT XNOR2
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT XNOR3
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT XNOR4
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	D: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT XNOR5
PORT( 
	A: IN std_logic := 'X';
	B: IN std_logic := 'X';
	C: IN std_logic := 'X';
	D: IN std_logic := 'X';
	E: IN std_logic := 'X';
	Z: OUT std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT IFS1S1B
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN std_logic := 'X';
	SCLK: IN std_logic := 'X';
	PD  : IN std_logic := 'X';
	Q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT IFS1S1D
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN std_logic := 'X';
	SCLK: IN std_logic := 'X';
	CD  : IN std_logic := 'X';
	Q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT IFS1S1I
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN std_logic := 'X';
	SCLK: IN std_logic := 'X';
	CD  : IN std_logic := 'X';
	Q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT IFS1S1J
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN std_logic := 'X';
	SCLK: IN std_logic := 'X';
	PD  : IN std_logic := 'X';
	Q   : OUT std_logic := 'X'
  );
END COMPONENT;
-- 
COMPONENT SPR16X4C
GENERIC(
        initval : string := "0x0000000000000000"
  );
PORT(
        DI3  : IN std_logic;
        DI2  : IN std_logic;
        DI1  : IN std_logic;
        DI0  : IN std_logic;
        CK  : IN std_logic;
        WRE  : IN std_logic;
        AD3 : IN std_logic;
        AD2 : IN std_logic;
        AD1 : IN std_logic;
        AD0 : IN std_logic;
        DO3 : OUT std_logic;
        DO2 : OUT std_logic;
        DO1 : OUT std_logic;
        DO0 : OUT std_logic);
END COMPONENT;
--
COMPONENT DPR16X4C
GENERIC(
        initval : string := "0x0000000000000000"
  );
PORT(
        DI3  : IN std_logic;
        DI2  : IN std_logic;
        DI1  : IN std_logic;
        DI0  : IN std_logic;
        WCK  : IN std_logic;
        WRE  : IN std_logic;
        RAD3 : IN std_logic;
        RAD2 : IN std_logic;
        RAD1 : IN std_logic;
        RAD0 : IN std_logic;
        WAD3 : IN std_logic;
        WAD2 : IN std_logic;
        WAD1 : IN std_logic;
        WAD0 : IN std_logic;
        DO3 : OUT std_logic;
        DO2 : OUT std_logic;
        DO1 : OUT std_logic;
        DO0 : OUT std_logic);
END COMPONENT;
--
COMPONENT SGSR
PORT(
      GSR: IN std_logic := 'X';
      CLK : IN std_logic := 'X'
  );
END COMPONENT;
   attribute syn_noprune of sgsr : component is true;
--
COMPONENT CLKDIVB
GENERIC(
      GSR         : String  := "ENABLED");
PORT(
          CLKI          :       in      STD_LOGIC;
          RST           :       in      STD_LOGIC;
          RELEASE       :       in      STD_LOGIC;
          CDIV1         :       out     STD_LOGIC;
          CDIV2         :       out     STD_LOGIC;
          CDIV4         :       out     STD_LOGIC;
          CDIV8         :       out     STD_LOGIC
        );
END COMPONENT;
--
COMPONENT OSCF
GENERIC(
      NOM_FREQ         : String  := "2.5");
PORT(
        OSC            : OUT std_logic);
END COMPONENT;
--
COMPONENT DCCA
PORT(
        CLKI            : IN std_logic;
        CE              : IN std_logic;
        CLKO            : OUT std_logic);
END COMPONENT;
--
COMPONENT JTAGE
   GENERIC(
      ER1             : String  := "ENABLED";
      ER2             : string  := "ENABLED" );
    port(
          TCK          :       in      STD_ULOGIC;
          TMS          :       in      STD_ULOGIC;
          TDI          :       in      STD_ULOGIC;
          JTDO2        :       in      STD_ULOGIC;
          JTDO1        :       in      STD_ULOGIC;
          TDO          :       out     STD_ULOGIC;
          JTDI         :       out     STD_ULOGIC;
          JTCK         :       out     STD_ULOGIC;
          JRTI2        :       out     STD_ULOGIC;
          JRTI1        :       out     STD_ULOGIC;
          JSHIFT       :       out     STD_ULOGIC;
          JUPDATE      :       out     STD_ULOGIC;
          JRSTN        :       out     STD_ULOGIC;
          JCE2         :       out     STD_ULOGIC;
          JCE1         :       out     STD_ULOGIC
        );
END COMPONENT;
--
COMPONENT SEDCA
   GENERIC(
      OSC_DIV       : integer := 1;
      CHECKALWAYS   : string  := "DISABLED";
      AUTORECONFIG  : string  := "OFF";
      MCCLK_FREQ    : string  := "2.5";
      DEV_DENSITY   : string  := "95K");
PORT(
          SEDENABLE    :       in      STD_LOGIC;
          SEDSTART     :       in      STD_LOGIC;
          SEDFRCERR    :       in      STD_LOGIC;
          SEDERR       :       out     STD_LOGIC;
          SEDDONE      :       out     STD_LOGIC;
          SEDINPROG    :       out     STD_LOGIC;
          SEDCLKOUT    :       out     STD_LOGIC);
END COMPONENT;
--
COMPONENT START
PORT( 
          STARTCLK : IN std_logic := 'X'
    );
END COMPONENT;
   attribute syn_noprune of START : component is true;
--
COMPONENT PERREGA
PORT(
          D15          :       in      STD_LOGIC;
          D14          :       in      STD_LOGIC;
          D13          :       in      STD_LOGIC;
          D12          :       in      STD_LOGIC;
          D11          :       in      STD_LOGIC;
          D10          :       in      STD_LOGIC;
          D9           :       in      STD_LOGIC;
          D8           :       in      STD_LOGIC;
          D7           :       in      STD_LOGIC;
          D6           :       in      STD_LOGIC;
          D5           :       in      STD_LOGIC;
          D4           :       in      STD_LOGIC;
          D3           :       in      STD_LOGIC;
          D2           :       in      STD_LOGIC;
          D1           :       in      STD_LOGIC;
          D0           :       in      STD_LOGIC;
          Q15          :       out     STD_LOGIC;
          Q14          :       out     STD_LOGIC;
          Q13          :       out     STD_LOGIC;
          Q12          :       out     STD_LOGIC;
          Q11          :       out     STD_LOGIC;
          Q10          :       out     STD_LOGIC;
          Q9           :       out     STD_LOGIC;
          Q8           :       out     STD_LOGIC;
          Q7           :       out     STD_LOGIC;
          Q6           :       out     STD_LOGIC;
          Q5           :       out     STD_LOGIC;
          Q4           :       out     STD_LOGIC;
          Q3           :       out     STD_LOGIC;
          Q2           :       out     STD_LOGIC;
          Q1           :       out     STD_LOGIC;
          Q0           :       out     STD_LOGIC);
END COMPONENT;
--
COMPONENT DP16KC
GENERIC(
        DATA_WIDTH_A : in Integer := 18;
        DATA_WIDTH_B : in Integer := 18;
        REGMODE_A    : String  := "NOREG";
        REGMODE_B    : String  := "NOREG";
        CSDECODE_A   : String  := "0b000";
        CSDECODE_B   : String  := "0b000";
        WRITEMODE_A  : String  := "NORMAL";
        WRITEMODE_B  : String  := "NORMAL";
        GSR : String  := "DISABLED";
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
        INITVAL_1F : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_20 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_21 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_22 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_23 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_24 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_25 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_26 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_27 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_28 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_29 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2A : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2B : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2C : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2D : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2E : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2F : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_30 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_31 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_32 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_33 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_34 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_35 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_36 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_37 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_38 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_39 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3A : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3B : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3C : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3D : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3E : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3F : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        DIA17, DIA16, DIA15, DIA14, DIA13, DIA12, DIA11, DIA10, DIA9    : in std_logic := 'X';
        DIA8, DIA7, DIA6, DIA5, DIA4, DIA3, DIA2, DIA1, DIA0            : in std_logic := 'X';
        ADA13, ADA12, ADA11, ADA10, ADA9, ADA8, ADA7, ADA6, ADA5            : in std_logic := 'X';
        ADA4, ADA3, ADA2, ADA1, ADA0                                : in std_logic := 'X';
        CEA, OCEA, CLKA, WEA, CSA2, CSA1, CSA0, RSTA             : in std_logic := 'X';
        DIB17, DIB16, DIB15, DIB14, DIB13, DIB12, DIB11, DIB10, DIB9    : in std_logic := 'X';
        DIB8, DIB7, DIB6, DIB5, DIB4, DIB3, DIB2, DIB1, DIB0            : in std_logic := 'X';
        ADB13, ADB12, ADB11, ADB10, ADB9, ADB8, ADB7, ADB6, ADB5            : in std_logic := 'X';
        ADB4, ADB3, ADB2, ADB1, ADB0                                : in std_logic := 'X';
        CEB, OCEB, CLKB, WEB, CSB2, CSB1, CSB0, RSTB             : in std_logic := 'X';

        DOA17, DOA16, DOA15, DOA14, DOA13, DOA12, DOA11, DOA10, DOA9    : out std_logic := 'X';
        DOA8, DOA7, DOA6, DOA5, DOA4, DOA3, DOA2, DOA1, DOA0            : out std_logic := 'X';
        DOB17, DOB16, DOB15, DOB14, DOB13, DOB12, DOB11, DOB10, DOB9    : out std_logic := 'X';
        DOB8, DOB7, DOB6, DOB5, DOB4, DOB3, DOB2, DOB1, DOB0            : out std_logic := 'X' );
END COMPONENT;
--
COMPONENT PDPW16KC
GENERIC(
        DATA_WIDTH_W : in Integer := 18;
        DATA_WIDTH_R : in Integer := 18;
        REGMODE      : String  := "NOREG";
        CSDECODE_W   : String  := "0b000";
        CSDECODE_R   : String  := "0b000";
        GSR : String  := "DISABLED";
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
        INITVAL_1F : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_20 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_21 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_22 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_23 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_24 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_25 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_26 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_27 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_28 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_29 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2A : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2B : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2C : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2D : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2E : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2F : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_30 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_31 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_32 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_33 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_34 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_35 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_36 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_37 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_38 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_39 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3a : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3b : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3c : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3d : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3e : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        DI35, DI34, DI33, DI32, DI31, DI30, DI29, DI28, DI27   : in std_logic := 'X';
        DI26, DI25, DI24, DI23, DI22, DI21, DI20, DI19, DI18, DI17   : in std_logic := 'X';
        DI16, DI15, DI14, DI13, DI12, DI11, DI10, DI9    : in std_logic := 'X';
        DI8, DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0            : in std_logic := 'X';
        ADW8, ADW7, ADW6, ADW5, ADW4, ADW3, ADW2, ADW1, ADW0   : in std_logic := 'X';
        BE3, BE2, BE1, BE0		                       : in std_logic := 'X';
        CEW, CLKW, CSW2, CSW1, CSW0                            : in std_logic := 'X';
        ADR13, ADR12, ADR11, ADR10, ADR9, ADR8, ADR7, ADR6, ADR5   : in std_logic := 'X';
        ADR4, ADR3, ADR2, ADR1, ADR0                           : in std_logic := 'X';
        CER, CLKR, CSR2, CSR1, CSR0, RST                       : in std_logic := 'X';
        DO35, DO34, DO33, DO32, DO31, DO30, DO29, DO28, DO27            : out std_logic := 'X';
        DO26, DO25, DO24, DO23, DO22, DO21, DO20, DO19, DO18    : out std_logic := 'X';
        DO17, DO16, DO15, DO14, DO13, DO12, DO11, DO10, DO9     : out std_logic := 'X';
        DO8, DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0   : out std_logic := 'X'
  );
END COMPONENT;
--
COMPONENT SP16KC
GENERIC(
        DATA_WIDTH   : in Integer := 18;
        REGMODE      : String  := "NOREG";
        CSDECODE     : String  := "0b000";
        WRITEMODE    : String  := "NORMAL";
        GSR : String  := "DISABLED";
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
        INITVAL_1F : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_20 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_21 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_22 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_23 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_24 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_25 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_26 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_27 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_28 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_29 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2A : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2B : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2C : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2D : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2E : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_2F : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_30 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_31 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_32 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_33 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_34 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_35 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_36 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_37 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_38 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_39 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3A : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3B : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3C : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3D : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3E : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        INITVAL_3F : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8            : in std_logic := 'X';
        DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17    : in std_logic := 'X';
        AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8            : in std_logic := 'X';
        AD9, AD10, AD11, AD12, AD13                            : in std_logic := 'X';
        CE, OCE, CLK, WE, CS0, CS1, CS2, RST             : in std_logic := 'X';

        DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8            : out std_logic := 'X';
        DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17    : out std_logic := 'X'
  );
END COMPONENT;
--
component EHXPLLF 
   GENERIC(
      FIN             : string   := "100.0";
      CLKI_DIV        : integer  := 1;
      CLKFB_DIV       : integer  := 1;
      CLKOP_DIV       : integer  := 8;
      CLKOK_DIV       : integer  := 2;
      PHASEADJ        : string   := "0.0";
      DUTY            : integer  := 8;
      FEEDBK_PATH : String := "CLKOP";
      PHASE_DELAY_CNTL : string   := "STATIC";
      CLKOP_BYPASS    : string  := "DISABLED";
      CLKOS_BYPASS    : string  := "DISABLED";
      CLKOK_BYPASS    : string  := "DISABLED";
      CLKOP_TRIM_POL  : string  := "RISING";
      CLKOP_TRIM_DELAY  : integer  := 0;
      CLKOS_TRIM_POL    : string := "RISING";
      CLKOS_TRIM_DELAY  : integer  := 0;
      DELAY_VAL         : integer := 0 ;
      DELAY_PWD         : string := "DISABLED";
      CLKOK_INPUT       : string := "CLKOP");
   port(
          CLKI          :       in      STD_ULOGIC;
          CLKFB         :       in      STD_ULOGIC;
          RST           :       in      STD_ULOGIC;
          RSTK          :       in      STD_ULOGIC;
          DRPAI3        :       in      STD_ULOGIC;
          DRPAI2        :       in      STD_ULOGIC;
          DRPAI1        :       in      STD_ULOGIC;
          DRPAI0        :       in      STD_ULOGIC;
          DFPAI3        :       in      STD_ULOGIC;
          DFPAI2        :       in      STD_ULOGIC;
          DFPAI1        :       in      STD_ULOGIC;
          DFPAI0        :       in      STD_ULOGIC;
          FDA3          :       in      STD_ULOGIC;
          FDA2          :       in      STD_ULOGIC;
          FDA1          :       in      STD_ULOGIC;
          FDA0          :       in      STD_ULOGIC;
          WRDEL         :       in      STD_ULOGIC;
          CLKOP         :       out     STD_ULOGIC;
          CLKOS         :       out     STD_ULOGIC;
          CLKOK         :       out     STD_ULOGIC;
          CLKOK2        :       out     STD_ULOGIC;
          LOCK          :       out     STD_ULOGIC;
          CLKINTFB      :       out     STD_ULOGIC
);
END COMPONENT;
--
COMPONENT TRDLLB
GENERIC(
      CLKOP_PHASE        : Integer   := 0;
      CLKOS_PHASE        : Integer   := 0;
      CLKOS_FPHASE       : Integer   := 0;
      CLKOS_DIV          : Integer   := 1;
      GSR                : String    := "DISABLED";
      CLKOS_FPHASE_ADJVAL : Integer  := 0;
      ALU_LOCK_CNT       : Integer   := 3;
      ALU_UNLOCK_CNT     : Integer   := 15;
      GLITCH_TOLERANCE   : Integer   := 2;
      LOCK_DELAY         : Integer   := 100;
      CLKOP_DUTY50       : String    := "DISABLED";
      CLKOS_DUTY50       : String    := "DISABLED"
  );
PORT(
        CLKI               : IN std_logic;
        RSTN               : IN std_logic;
        ALUHOLD            : IN std_logic;
        UDDCNTL            : IN std_logic;
        CLKOP              : OUT std_logic;
        CLKOS              : OUT std_logic;
        LOCK               : OUT std_logic;
        INCO               : OUT std_logic;
        DIFF               : OUT std_logic;
        GRAYO5             : OUT std_logic;
        GRAYO4             : OUT std_logic;
        GRAYO3             : OUT std_logic;
        GRAYO2             : OUT std_logic;
        GRAYO1             : OUT std_logic;
        GRAYO0             : OUT std_logic;
        DCNTL5             : OUT std_logic;
        DCNTL4             : OUT std_logic;
        DCNTL3             : OUT std_logic;
        DCNTL2             : OUT std_logic;
        DCNTL1             : OUT std_logic;
        DCNTL0             : OUT std_logic);
END COMPONENT;
--
COMPONENT TR1DLLB
GENERIC(
      CLKOP_PHASE         : Integer   := 0;
      CLKOS_PHASE         : Integer   := 0;
      CLKOS_FPHASE        : Integer   := 0;
      CLKOS_DIV           : Integer   := 1;
      GSR                 : String    := "DISABLED";
      CLKOS_FPHASE_ADJVAL : Integer  := 0;
      ALU_LOCK_CNT        : Integer   := 3;
      ALU_UNLOCK_CNT      : Integer   := 15;
      GLITCH_TOLERANCE    : Integer   := 2;
      LOCK_DELAY          : Integer   := 100;
      CLKOP_DUTY50        : String    := "DISABLED";
      CLKOS_DUTY50        : String    := "DISABLED"
  );
PORT(
        CLKI               : IN std_logic;
        RSTN               : IN std_logic;
        ALUHOLD            : IN std_logic;
        UDDCNTL            : IN std_logic;
        DELADJPOL          : IN std_logic;
        DELVAL4            : IN std_logic;
        DELVAL3            : IN std_logic;
        DELVAL2            : IN std_logic;
        DELVAL1            : IN std_logic;
        DELVAL0            : IN std_logic;
        CLKOP              : OUT std_logic;
        CLKOS              : OUT std_logic;
        LOCK               : OUT std_logic;
        INCO               : OUT std_logic;
        DIFF               : OUT std_logic;
        GRAYO5             : OUT std_logic;
        GRAYO4             : OUT std_logic;
        GRAYO3             : OUT std_logic;
        GRAYO2             : OUT std_logic;
        GRAYO1             : OUT std_logic;
        GRAYO0             : OUT std_logic;
        DCNTL5             : OUT std_logic;
        DCNTL4             : OUT std_logic;
        DCNTL3             : OUT std_logic;
        DCNTL2             : OUT std_logic;
        DCNTL1             : OUT std_logic;
        DCNTL0             : OUT std_logic);
END COMPONENT;
--
COMPONENT CIMDLLB
GENERIC(
      CLKOS_FPHASE       : Integer   := 0;
      CLKOS_DIV          : Integer   := 1;
      GSR                : String    := "DISABLED";
      ALU_LOCK_CNT       : Integer   := 3;
      ALU_UNLOCK_CNT     : Integer   := 15;
      GLITCH_TOLERANCE   : Integer   := 2;
      LOCK_DELAY         : Integer   := 100;
      CLKOS_FDEL_ADJ     : String    := "DISABLED"
  );
PORT(
        CLKI               : IN std_logic;
        CLKFB              : IN std_logic;
        RSTN               : IN std_logic;
        ALUHOLD            : IN std_logic;
        INCI               : IN std_logic;
        UDDCNTL            : IN std_logic;
        GRAYI5             : IN std_logic;
        GRAYI4             : IN std_logic;
        GRAYI3             : IN std_logic;
        GRAYI2             : IN std_logic;
        GRAYI1             : IN std_logic;
        GRAYI0             : IN std_logic;
        CLKOP              : OUT std_logic;
        CLKOS              : OUT std_logic;
        LOCK               : OUT std_logic;
        DIFF               : OUT std_logic;
        DCNTL5             : OUT std_logic;
        DCNTL4             : OUT std_logic;
        DCNTL3             : OUT std_logic;
        DCNTL2             : OUT std_logic;
        DCNTL1             : OUT std_logic;
        DCNTL0             : OUT std_logic);
END COMPONENT;
--
COMPONENT CIDDLLB
GENERIC(
      CLKOP_PHASE        : Integer   := 360;
      CLKOS_PHASE        : Integer   := 360;
      CLKOS_FPHASE       : Integer   := 0;
      CLKI_DIV           : Integer   := 1;
      CLKOS_DIV          : Integer   := 1;
      GSR                : String    := "DISABLED";
      ALU_LOCK_CNT       : Integer   := 3;
      ALU_UNLOCK_CNT     : Integer   := 15;
      GLITCH_TOLERANCE   : Integer   := 2;
      ALU_INIT_CNTVAL    : Integer   := 10;
      LOCK_DELAY         : Integer   := 100;
      CLKOP_DUTY50       : string    := "DISABLED";
      CLKOS_DUTY50       : string    := "DISABLED";
      DEL0_GRAY          : string    := "DISABLED";
      DEL1_GRAY          : string    := "DISABLED";
      DEL2_GRAY          : string    := "DISABLED";
      DEL3_GRAY          : string    := "DISABLED";
      DEL4_GRAY          : string    := "DISABLED"
  );
PORT(
        CLKI               : IN std_logic;
        CLKFB              : IN std_logic;
        RSTN               : IN std_logic;
        ALUHOLD            : IN std_logic;
        INCI               : IN std_logic;
        GRAYI5             : IN std_logic;
        GRAYI4             : IN std_logic;
        GRAYI3             : IN std_logic;
        GRAYI2             : IN std_logic;
        GRAYI1             : IN std_logic;
        GRAYI0             : IN std_logic;
        CLKOP              : OUT std_logic;
        CLKOS              : OUT std_logic;
        LOCK               : OUT std_logic);
END COMPONENT;
--
COMPONENT DLLDELB
PORT(
      CLKI            : IN std_logic;
      DCNTL5          : IN std_logic;
      DCNTL4          : IN std_logic;
      DCNTL3          : IN std_logic;
      DCNTL2          : IN std_logic;
      DCNTL1          : IN std_logic;
      DCNTL0          : IN std_logic;
      CLKO            : OUT std_logic);
END COMPONENT;
--
COMPONENT IDDRXD
  generic(
         SCLKLATENCY    : integer := 1;
         DELAYMODE    : string := "ALIGNED");
PORT(
        D               : IN std_logic;
        SCLK            : IN std_logic;
        ECLKDQSR        : IN std_logic;
        DDRCLKPOL       : IN std_logic;
        QA              : OUT std_logic;
        QB              : OUT std_logic);
END COMPONENT;
--
COMPONENT IDDRXD1
PORT(
        D               : IN std_logic;
        SCLK            : IN std_logic;
        QA              : OUT std_logic;
        QB              : OUT std_logic);
END COMPONENT;
--
COMPONENT IDDRX2D
  generic(
         SCLKLATENCY    : integer := 1;
         DELAYMODE    : string := "ALIGNED");
PORT(
        D               : IN std_logic;
        SCLK            : IN std_logic;
        ECLKDQSR        : IN std_logic;
        ECLK            : IN std_logic;
        DDRLAT          : IN std_logic;
        DDRCLKPOL       : IN std_logic;
        QA0             : OUT std_logic;
        QB0             : OUT std_logic;
        QA1             : OUT std_logic;
        QB1             : OUT std_logic);
END COMPONENT;
--
COMPONENT IDDRX2D1
  generic(
         DR_CONFIG        : string := "DISABLED");
PORT(
        D               : IN std_logic;
        SCLK            : IN std_logic;
        ECLK            : IN std_logic;
        QA0             : OUT std_logic;
        QB0             : OUT std_logic;
        QA1             : OUT std_logic;
        QB1             : OUT std_logic);
END COMPONENT;
--
COMPONENT ODDRXD
  generic(
         MEMMODE        : string := "DISABLED");
PORT(
          SCLK          :       in      STD_LOGIC;
          DA            :       in      STD_LOGIC;
          DB            :       in      STD_LOGIC;
          DQCLK1        :       in      STD_LOGIC;
          Q             :       out     STD_LOGIC);
END COMPONENT;
--
COMPONENT ODDRXD1
PORT(
          SCLK          :       in      STD_LOGIC;
          DA            :       in      STD_LOGIC;
          DB            :       in      STD_LOGIC;
          Q             :       out     STD_LOGIC);
END COMPONENT;
--
COMPONENT ODDRX2D
GENERIC(
      ISI_CAL         : String  := "BYPASS";
      MEMMODE         : string  := "DISABLED");
PORT(
          SCLK          :       in      STD_LOGIC;
          DA1           :       in      STD_LOGIC;
          DB1           :       in      STD_LOGIC;
          DA0           :       in      STD_LOGIC;
          DB0           :       in      STD_LOGIC;
          DQCLK1        :       in      STD_LOGIC;
          DQCLK0        :       in      STD_LOGIC;
          Q             :       out     STD_LOGIC);
END COMPONENT;
--
COMPONENT ODDRTDQA
PORT(
          TA            :       in      STD_LOGIC;
          SCLK          :       in      STD_LOGIC;
          DQCLK1        :       in      STD_LOGIC;
          DQCLK0        :       in      STD_LOGIC;
          Q             :       out     STD_LOGIC);
END COMPONENT;
--
COMPONENT ODDRXDQSA
  generic(
         MEMMODE        : string := "DISABLED");
PORT(
          SCLK          :       in      STD_LOGIC;
          DA            :       in      STD_LOGIC;
          DQSW          :       in      STD_LOGIC;
          DQCLK1        :       in      STD_LOGIC;
          Q             :       out     STD_LOGIC;
          DQSTCLK       :       out     STD_LOGIC);
END COMPONENT;
--
COMPONENT ODDRTDQSA
PORT(
          TA            :       in      STD_LOGIC;
          SCLK          :       in      STD_LOGIC;
          DQSTCLK       :       in      STD_LOGIC;
          DQSW          :       in      STD_LOGIC;
          DB            :       in      STD_LOGIC;
          Q             :       out     STD_LOGIC);
END COMPONENT;
--
COMPONENT ODDRX2DQSA
GENERIC(
      ISI_CAL         : String  := "BYPASS";
      MEMMODE         : string  := "DISABLED");
PORT(
          SCLK          :       in      STD_LOGIC;
          DB1           :       in      STD_LOGIC;
          DB0           :       in      STD_LOGIC;
          DQCLK1        :       in      STD_LOGIC;
          DQCLK0        :       in      STD_LOGIC;
          DQSW          :       in      STD_LOGIC;
          Q             :       out     STD_LOGIC;
          DQSTCLK       :       out     STD_LOGIC);
END COMPONENT;
--
COMPONENT DQSBUFD
   GENERIC(
      DYNDEL_TYPE    : string := "NORMAL";
      DYNDEL_VAL     : integer := 0;
      DYNDEL_CNTL    : string := "DYNAMIC";
      NRZMODE        : string := "DISABLED");
PORT(
          DQSI          :       IN      std_logic;
          SCLK          :       IN      std_logic;
          READ          :       IN      std_logic;
          DQSDEL        :       IN      std_logic;
          ECLK          :       IN      std_logic;
          ECLKW         :       IN      std_logic;
          RST           :       IN      std_logic;
          DYNDELPOL     :       IN      std_logic;
          DYNDELAY6     :       IN      std_logic;
          DYNDELAY5     :       IN      std_logic;
          DYNDELAY4     :       IN      std_logic;
          DYNDELAY3     :       IN      std_logic;
          DYNDELAY2     :       IN      std_logic;
          DYNDELAY1     :       IN      std_logic;
          DYNDELAY0     :       IN      std_logic;
          DQSW          :       OUT     std_logic;
          DDRCLKPOL     :       OUT     std_logic;
          PRMBDET       :       OUT     std_logic;
          DATAVALID     :       OUT     std_logic;
          DDRLAT        :       OUT     std_logic;
          ECLKDQSR      :       OUT     std_logic;
          DQCLK0        :       OUT     std_logic;
          DQCLK1        :       OUT     std_logic
        );
END COMPONENT;
--
COMPONENT DQSBUFE
   GENERIC(
      DYNDEL_TYPE       : string := "NORMAL";
      DYNDEL_VAL        : integer := 0;
      DYNDEL_CNTL       : string := "DYNAMIC");
PORT(

          ECLK          :       IN      std_logic;
          SCLK          :       IN      std_logic;
          ECLKW         :       IN      std_logic;
          RST           :       IN      std_logic;
          DYNDELPOL     :       IN      std_logic;
          DYNDELAY6     :       IN      std_logic;
          DYNDELAY5     :       IN      std_logic;
          DYNDELAY4     :       IN      std_logic;
          DYNDELAY3     :       IN      std_logic;
          DYNDELAY2     :       IN      std_logic;
          DYNDELAY1     :       IN      std_logic;
          DYNDELAY0     :       IN      std_logic;
          DQCLK0        :       OUT     std_logic;
          DQCLK1        :       OUT     std_logic;
          DDRCLKPOL     :       OUT     std_logic;
          DDRLAT        :       OUT     std_logic
        );
END COMPONENT;
--
COMPONENT DQSBUFE1
   GENERIC(
      DYNDEL_TYPE       : string := "NORMAL";
      DYNDEL_VAL        : integer := 0;
      DYNDEL_CNTL       : string := "DYNAMIC");
PORT(
          ECLKW         :       IN      std_logic;
          RST           :       IN      std_logic;
          DYNDELPOL     :       IN      std_logic;
          DYNDELAY6     :       IN      std_logic;
          DYNDELAY5     :       IN      std_logic;
          DYNDELAY4     :       IN      std_logic;
          DYNDELAY3     :       IN      std_logic;
          DYNDELAY2     :       IN      std_logic;
          DYNDELAY1     :       IN      std_logic;
          DYNDELAY0     :       IN      std_logic;
          DQCLK0        :       OUT     std_logic;
          DQCLK1        :       OUT     std_logic
        );
END COMPONENT;
--
COMPONENT DQSBUFF
PORT(
          DQSI          :       IN      std_logic;
          SCLK          :       IN      std_logic;
          READ          :       IN      std_logic;
          DQSDEL        :       IN      std_logic;
          DQSW          :       OUT     std_logic;
          DDRCLKPOL     :       OUT     std_logic;
          PRMBDET       :       OUT     std_logic;
          DATAVALID     :       OUT     std_logic;
          ECLKDQSR      :       OUT     std_logic;
          DQCLK1        :       OUT     std_logic
        );
END COMPONENT;
--
COMPONENT DQSBUFG
PORT(
          SCLK          :       IN      std_logic;
          DDRCLKPOL     :       OUT     std_logic;
          DQCLK1        :       OUT     std_logic
        );
END COMPONENT;
--
COMPONENT DQSDLLB
   GENERIC(
      LOCK_SENSITIVITY  : string := "LOW");
PORT(
          CLK           :       in      STD_ULOGIC;
          RST           :       in      STD_ULOGIC;
          UDDCNTLN      :       in      STD_ULOGIC;
          LOCK          :       out     STD_ULOGIC;
          DQSDEL        :       out     STD_ULOGIC
        );
END COMPONENT;
--
COMPONENT DELAYB
PORT(
      A             : IN std_logic;
      DEL3          : IN std_logic;
      DEL2          : IN std_logic;
      DEL1          : IN std_logic;
      DEL0          : IN std_logic;
      Z             : OUT std_logic);
END COMPONENT;
--
COMPONENT DELAYC
PORT(
      A             : IN std_logic;
      Z             : OUT std_logic);
END COMPONENT;
   attribute syn_black_box of DELAYC : Component is true;
--
COMPONENT ECLKSYNCA
PORT(
      ECLKI         : IN std_logic;
      STOP          : IN std_logic;
      ECLKO         : OUT std_logic);
END COMPONENT;
--

  component MULT18X18C
  GENERIC(
	 REG_INPUTA_CLK       : string     := "NONE";
	 REG_INPUTA_CE        : string     := "CE0";
	 REG_INPUTA_RST       : string     := "RST0";
	 REG_INPUTB_CLK       : string     := "NONE";
	 REG_INPUTB_CE        : string     := "CE0";
	 REG_INPUTB_RST       : string     := "RST0";
	 REG_PIPELINE_CLK     : string     := "NONE";
	 REG_PIPELINE_CE      : string     := "CE0";
	 REG_PIPELINE_RST     : string     := "RST0";
	 REG_OUTPUT_CLK       : string     := "NONE";
	 REG_OUTPUT_CE        : string     := "CE0";
	 REG_OUTPUT_RST       : string     := "RST0";
	 CAS_MATCH_REG        : string     := "FALSE";
	 MULT_BYPASS          : string     := "DISABLED";
         RESETMODE            : string     := "SYNC";
	 GSR                  : string     := "ENABLED");
  port (
        A17 : in STD_ULOGIC;
        A16 : in STD_ULOGIC;
        A15 : in STD_ULOGIC;
        A14 : in STD_ULOGIC;
        A13 : in STD_ULOGIC;
        A12 : in STD_ULOGIC;
        A11 : in STD_ULOGIC;
        A10 : in STD_ULOGIC;
        A9 : in STD_ULOGIC;
        A8 : in STD_ULOGIC;
        A7 : in STD_ULOGIC;
        A6 : in STD_ULOGIC;
        A5 : in STD_ULOGIC;
        A4 : in STD_ULOGIC;
        A3 : in STD_ULOGIC;
        A2 : in STD_ULOGIC;
        A1 : in STD_ULOGIC;
        A0 : in STD_ULOGIC;

        B17 : in STD_ULOGIC;
        B16 : in STD_ULOGIC;
        B15 : in STD_ULOGIC;
        B14 : in STD_ULOGIC;
        B13 : in STD_ULOGIC;
        B12 : in STD_ULOGIC;
        B11 : in STD_ULOGIC;
        B10 : in STD_ULOGIC;
        B9 : in STD_ULOGIC;
        B8 : in STD_ULOGIC;
        B7 : in STD_ULOGIC;
        B6 : in STD_ULOGIC;
        B5 : in STD_ULOGIC;
        B4 : in STD_ULOGIC;
        B3 : in STD_ULOGIC;
        B2 : in STD_ULOGIC;
        B1 : in STD_ULOGIC;
        B0 : in STD_ULOGIC;

        SIGNEDA : in STD_ULOGIC;
        SIGNEDB : in STD_ULOGIC;
        SOURCEA : in STD_ULOGIC;
        SOURCEB : in STD_ULOGIC;

        CE3 : in STD_ULOGIC;
        CE2 : in STD_ULOGIC;
        CE1 : in STD_ULOGIC;
        CE0 : in STD_ULOGIC;

        CLK3 : in STD_ULOGIC;
        CLK2 : in STD_ULOGIC;
        CLK1 : in STD_ULOGIC;
        CLK0 : in STD_ULOGIC;

        RST3 : in STD_ULOGIC;
        RST2 : in STD_ULOGIC;
        RST1 : in STD_ULOGIC;
        RST0 : in STD_ULOGIC;

        SRIA17 : in STD_ULOGIC;
        SRIA16 : in STD_ULOGIC;
        SRIA15 : in STD_ULOGIC;
        SRIA14 : in STD_ULOGIC;
        SRIA13 : in STD_ULOGIC;
        SRIA12 : in STD_ULOGIC;
        SRIA11 : in STD_ULOGIC;
        SRIA10 : in STD_ULOGIC;
        SRIA9 : in STD_ULOGIC;
        SRIA8 : in STD_ULOGIC;
        SRIA7 : in STD_ULOGIC;
        SRIA6 : in STD_ULOGIC;
        SRIA5 : in STD_ULOGIC;
        SRIA4 : in STD_ULOGIC;
        SRIA3 : in STD_ULOGIC;
        SRIA2 : in STD_ULOGIC;
        SRIA1 : in STD_ULOGIC;
        SRIA0 : in STD_ULOGIC;

        SRIB17 : in STD_ULOGIC;
        SRIB16 : in STD_ULOGIC;
        SRIB15 : in STD_ULOGIC;
        SRIB14 : in STD_ULOGIC;
        SRIB13 : in STD_ULOGIC;
        SRIB12 : in STD_ULOGIC;
        SRIB11 : in STD_ULOGIC;
        SRIB10 : in STD_ULOGIC;
        SRIB9 : in STD_ULOGIC;
        SRIB8 : in STD_ULOGIC;
        SRIB7 : in STD_ULOGIC;
        SRIB6 : in STD_ULOGIC;
        SRIB5 : in STD_ULOGIC;
        SRIB4 : in STD_ULOGIC;
        SRIB3 : in STD_ULOGIC;
        SRIB2 : in STD_ULOGIC;
        SRIB1 : in STD_ULOGIC;
        SRIB0 : in STD_ULOGIC;

        SROA17 : out STD_ULOGIC;
        SROA16 : out STD_ULOGIC;
        SROA15 : out STD_ULOGIC;
        SROA14 : out STD_ULOGIC;
        SROA13 : out STD_ULOGIC;
        SROA12 : out STD_ULOGIC;
        SROA11 : out STD_ULOGIC;
        SROA10 : out STD_ULOGIC;
        SROA9 : out STD_ULOGIC;
        SROA8 : out STD_ULOGIC;
        SROA7 : out STD_ULOGIC;
        SROA6 : out STD_ULOGIC;
        SROA5 : out STD_ULOGIC;
        SROA4 : out STD_ULOGIC;
        SROA3 : out STD_ULOGIC;
        SROA2 : out STD_ULOGIC;
        SROA1 : out STD_ULOGIC;
        SROA0 : out STD_ULOGIC;

        SROB17 : out STD_ULOGIC;
        SROB16 : out STD_ULOGIC;
        SROB15 : out STD_ULOGIC;
        SROB14 : out STD_ULOGIC;
        SROB13 : out STD_ULOGIC;
        SROB12 : out STD_ULOGIC;
        SROB11 : out STD_ULOGIC;
        SROB10 : out STD_ULOGIC;
        SROB9 : out STD_ULOGIC;
        SROB8 : out STD_ULOGIC;
        SROB7 : out STD_ULOGIC;
        SROB6 : out STD_ULOGIC;
        SROB5 : out STD_ULOGIC;
        SROB4 : out STD_ULOGIC;
        SROB3 : out STD_ULOGIC;
        SROB2 : out STD_ULOGIC;
        SROB1 : out STD_ULOGIC;
        SROB0 : out STD_ULOGIC;

        ROA17 : out STD_ULOGIC;
        ROA16 : out STD_ULOGIC;
        ROA15 : out STD_ULOGIC;
        ROA14 : out STD_ULOGIC;
        ROA13 : out STD_ULOGIC;
        ROA12 : out STD_ULOGIC;
        ROA11 : out STD_ULOGIC;
        ROA10 : out STD_ULOGIC;
        ROA9  : out STD_ULOGIC;
        ROA8  : out STD_ULOGIC;
        ROA7  : out STD_ULOGIC;
        ROA6  : out STD_ULOGIC;
        ROA5  : out STD_ULOGIC;
        ROA4  : out STD_ULOGIC;
        ROA3  : out STD_ULOGIC;
        ROA2  : out STD_ULOGIC;
        ROA1  : out STD_ULOGIC;
        ROA0  : out STD_ULOGIC;

        ROB17 : out STD_ULOGIC;
        ROB16 : out STD_ULOGIC;
        ROB15 : out STD_ULOGIC;
        ROB14 : out STD_ULOGIC;
        ROB13 : out STD_ULOGIC;
        ROB12 : out STD_ULOGIC;
        ROB11 : out STD_ULOGIC;
        ROB10 : out STD_ULOGIC;
        ROB9  : out STD_ULOGIC;
        ROB8  : out STD_ULOGIC;
        ROB7  : out STD_ULOGIC;
        ROB6  : out STD_ULOGIC;
        ROB5  : out STD_ULOGIC;
        ROB4  : out STD_ULOGIC;
        ROB3  : out STD_ULOGIC;
        ROB2  : out STD_ULOGIC;
        ROB1  : out STD_ULOGIC;
        ROB0  : out STD_ULOGIC;

        P35 : out STD_ULOGIC;
        P34 : out STD_ULOGIC;
        P33 : out STD_ULOGIC;
        P32 : out STD_ULOGIC;
        P31 : out STD_ULOGIC;
        P30 : out STD_ULOGIC;
        P29 : out STD_ULOGIC;
        P28 : out STD_ULOGIC;
        P27 : out STD_ULOGIC;
        P26 : out STD_ULOGIC;
        P25 : out STD_ULOGIC;
        P24 : out STD_ULOGIC;
        P23 : out STD_ULOGIC;
        P22 : out STD_ULOGIC;
        P21 : out STD_ULOGIC;
        P20 : out STD_ULOGIC;
        P19 : out STD_ULOGIC;
        P18 : out STD_ULOGIC;
        P17 : out STD_ULOGIC;
        P16 : out STD_ULOGIC;
        P15 : out STD_ULOGIC;
        P14 : out STD_ULOGIC;
        P13 : out STD_ULOGIC;
        P12 : out STD_ULOGIC;
        P11 : out STD_ULOGIC;
        P10 : out STD_ULOGIC;
        P9 : out STD_ULOGIC;
        P8 : out STD_ULOGIC;
        P7 : out STD_ULOGIC;
        P6 : out STD_ULOGIC;
        P5 : out STD_ULOGIC;
        P4 : out STD_ULOGIC;
        P3 : out STD_ULOGIC;
        P2 : out STD_ULOGIC;
        P1 : out STD_ULOGIC;
        P0 : out STD_ULOGIC;
        SIGNEDP : out STD_ULOGIC
       ); 
  end component;
--
  component MULT9X9C
  GENERIC(
         REG_INPUTA_CLK       : string     := "NONE";
         REG_INPUTA_CE        : string     := "CE0";
         REG_INPUTA_RST       : string     := "RST0";
         REG_INPUTB_CLK       : string     := "NONE";
         REG_INPUTB_CE        : string     := "CE0";
         REG_INPUTB_RST       : string     := "RST0";
         REG_PIPELINE_CLK     : string     := "NONE";
         REG_PIPELINE_CE      : string     := "CE0";
         REG_PIPELINE_RST     : string     := "RST0";
         REG_OUTPUT_CLK       : string     := "NONE";
         REG_OUTPUT_CE        : string     := "CE0";
         REG_OUTPUT_RST       : string     := "RST0";

         CAS_MATCH_REG        : string     := "FALSE";
         MULT_BYPASS          : string     := "DISABLED";
         RESETMODE            : string     := "SYNC";
         GSR                  : string     := "ENABLED");
  port (
        A8 : in STD_ULOGIC;
        A7 : in STD_ULOGIC;
        A6 : in STD_ULOGIC;
        A5 : in STD_ULOGIC;
        A4 : in STD_ULOGIC;
        A3 : in STD_ULOGIC;
        A2 : in STD_ULOGIC;
        A1 : in STD_ULOGIC;
        A0 : in STD_ULOGIC;

        B8 : in STD_ULOGIC;
        B7 : in STD_ULOGIC;
        B6 : in STD_ULOGIC;
        B5 : in STD_ULOGIC;
        B4 : in STD_ULOGIC;
        B3 : in STD_ULOGIC;
        B2 : in STD_ULOGIC;
        B1 : in STD_ULOGIC;
        B0 : in STD_ULOGIC;

        SIGNEDA : in STD_ULOGIC;
        SIGNEDB : in STD_ULOGIC;
        SOURCEA : in STD_ULOGIC;
        SOURCEB : in STD_ULOGIC;

        CE3 : in STD_ULOGIC;
        CE2 : in STD_ULOGIC;
        CE1 : in STD_ULOGIC;
        CE0 : in STD_ULOGIC;

        CLK3 : in STD_ULOGIC;
        CLK2 : in STD_ULOGIC;
        CLK1 : in STD_ULOGIC;
        CLK0 : in STD_ULOGIC;

        RST3 : in STD_ULOGIC;
        RST2 : in STD_ULOGIC;
        RST1 : in STD_ULOGIC;
        RST0 : in STD_ULOGIC;

        SRIA8 : in STD_ULOGIC;
        SRIA7 : in STD_ULOGIC;
        SRIA6 : in STD_ULOGIC;
        SRIA5 : in STD_ULOGIC;
        SRIA4 : in STD_ULOGIC;
        SRIA3 : in STD_ULOGIC;
        SRIA2 : in STD_ULOGIC;
        SRIA1 : in STD_ULOGIC;
        SRIA0 : in STD_ULOGIC;

        SRIB8 : in STD_ULOGIC;
        SRIB7 : in STD_ULOGIC;
        SRIB6 : in STD_ULOGIC;
        SRIB5 : in STD_ULOGIC;
        SRIB4 : in STD_ULOGIC;
        SRIB3 : in STD_ULOGIC;
        SRIB2 : in STD_ULOGIC;
        SRIB1 : in STD_ULOGIC;
        SRIB0 : in STD_ULOGIC;

        SROA8 : out STD_ULOGIC;
        SROA7 : out STD_ULOGIC;
        SROA6 : out STD_ULOGIC;
        SROA5 : out STD_ULOGIC;
        SROA4 : out STD_ULOGIC;
        SROA3 : out STD_ULOGIC;
        SROA2 : out STD_ULOGIC;
        SROA1 : out STD_ULOGIC;
        SROA0 : out STD_ULOGIC;

        SROB8 : out STD_ULOGIC;
        SROB7 : out STD_ULOGIC;
        SROB6 : out STD_ULOGIC;
        SROB5 : out STD_ULOGIC;
        SROB4 : out STD_ULOGIC;
        SROB3 : out STD_ULOGIC;
        SROB2 : out STD_ULOGIC;
        SROB1 : out STD_ULOGIC;
        SROB0 : out STD_ULOGIC;


        ROA8 : out STD_ULOGIC;
        ROA7 : out STD_ULOGIC;
        ROA6 : out STD_ULOGIC;
        ROA5 : out STD_ULOGIC;
        ROA4 : out STD_ULOGIC;
        ROA3 : out STD_ULOGIC;
        ROA2 : out STD_ULOGIC;
        ROA1 : out STD_ULOGIC;
        ROA0 : out STD_ULOGIC;

        ROB8 : out STD_ULOGIC;
        ROB7 : out STD_ULOGIC;
        ROB6 : out STD_ULOGIC;
        ROB5 : out STD_ULOGIC;
        ROB4 : out STD_ULOGIC;
        ROB3 : out STD_ULOGIC;
        ROB2 : out STD_ULOGIC;
        ROB1 : out STD_ULOGIC;
        ROB0 : out STD_ULOGIC;

        P17 : out STD_ULOGIC;
        P16 : out STD_ULOGIC;
        P15 : out STD_ULOGIC;
        P14 : out STD_ULOGIC;
        P13 : out STD_ULOGIC;
        P12 : out STD_ULOGIC;
        P11 : out STD_ULOGIC;
        P10 : out STD_ULOGIC;
        P9 : out STD_ULOGIC;
        P8 : out STD_ULOGIC;
        P7 : out STD_ULOGIC;
        P6 : out STD_ULOGIC;
        P5 : out STD_ULOGIC;
        P4 : out STD_ULOGIC;
        P3 : out STD_ULOGIC;
        P2 : out STD_ULOGIC;
        P1 : out STD_ULOGIC;
        P0 : out STD_ULOGIC;
        SIGNEDP : out STD_ULOGIC
       );
  end component;
--
  component ALU54A
  GENERIC(
         REG_INPUTC0_CLK      : string     := "NONE";
         REG_INPUTC0_CE       : string     := "CE0";
         REG_INPUTC0_RST      : string     := "RST0";
         REG_INPUTC1_CLK      : string     := "NONE";
         REG_INPUTC1_CE       : string     := "CE0";
         REG_INPUTC1_RST      : string     := "RST0";
         REG_OPCODEOP0_0_CLK  : string     := "NONE";
         REG_OPCODEOP0_0_CE   : string     := "CE0";
         REG_OPCODEOP0_0_RST  : string     := "RST0";
         REG_OPCODEOP1_0_CLK  : string     := "NONE";
         REG_OPCODEOP0_1_CLK  : string     := "NONE";
         REG_OPCODEOP0_1_CE   : string     := "CE0";
         REG_OPCODEOP0_1_RST  : string     := "RST0";
         REG_OPCODEOP1_1_CLK  : string     := "NONE";
         REG_OPCODEIN_0_CLK   : string     := "CE0";
         REG_OPCODEIN_0_CE    : string     := "RST0";
         REG_OPCODEIN_0_RST   : string     := "RST0";
         REG_OPCODEIN_1_CLK   : string     := "CE0";
         REG_OPCODEIN_1_CE    : string     := "RST0";
         REG_OPCODEIN_1_RST   : string     := "RST0";
         REG_OUTPUT0_CLK      : string     := "NONE";
         REG_OUTPUT0_CE       : string     := "CE0";
         REG_OUTPUT0_RST      : string     := "RST0";
         REG_OUTPUT1_CLK      : string     := "NONE";
         REG_OUTPUT1_CE       : string     := "CE0";
         REG_OUTPUT1_RST      : string     := "RST0";
         REG_FLAG_CLK         : string     := "NONE";
         REG_FLAG_CE          : string     := "CE0";
         REG_FLAG_RST         : string     := "RST0";
         MCPAT_SOURCE         : string     := "STATIC";
         MASKPAT_SOURCE       : string     := "STATIC";
         MASK01               : string     := "0x00000000000000";
         MCPAT                : string     := "0x00000000000000";
         MASKPAT              : string     := "0x00000000000000";
         RNDPAT               : string     := "0x00000000000000";
         RESETMODE            : string     := "SYNC";
         MULT9_MODE           : string     := "DISABLED";
         FORCE_ZERO_BARREL_SHIFT  : string     := "DISABLED";
         LEGACY               : string     := "DISABLED";
         GSR                  : string     := "ENABLED");
  port (

        CE3 : in STD_ULOGIC;
        CE2 : in STD_ULOGIC;
        CE1 : in STD_ULOGIC;
        CE0 : in STD_ULOGIC;

        CLK3 : in STD_ULOGIC;
        CLK2 : in STD_ULOGIC;
        CLK1 : in STD_ULOGIC;
        CLK0 : in STD_ULOGIC;

        RST3 : in STD_ULOGIC;
        RST2 : in STD_ULOGIC;
        RST1 : in STD_ULOGIC;
        RST0 : in STD_ULOGIC;

        SIGNEDIA : in STD_ULOGIC;
        SIGNEDIB : in STD_ULOGIC;


        A35 : in STD_ULOGIC;
        A34 : in STD_ULOGIC;
        A33 : in STD_ULOGIC;
        A32 : in STD_ULOGIC;
        A31 : in STD_ULOGIC;
        A30 : in STD_ULOGIC;
        A29 : in STD_ULOGIC;
        A28 : in STD_ULOGIC;
        A27 : in STD_ULOGIC;
        A26 : in STD_ULOGIC;
        A25 : in STD_ULOGIC;
        A24 : in STD_ULOGIC;
        A23 : in STD_ULOGIC;
        A22 : in STD_ULOGIC;
        A21 : in STD_ULOGIC;
        A20 : in STD_ULOGIC;
        A19 : in STD_ULOGIC;
        A18 : in STD_ULOGIC;
        A17 : in STD_ULOGIC;
        A16 : in STD_ULOGIC;
        A15 : in STD_ULOGIC;
        A14 : in STD_ULOGIC;
        A13 : in STD_ULOGIC;
        A12 : in STD_ULOGIC;
        A11 : in STD_ULOGIC;
        A10 : in STD_ULOGIC;
        A9 : in STD_ULOGIC;
        A8 : in STD_ULOGIC;
        A7 : in STD_ULOGIC;
        A6 : in STD_ULOGIC;
        A5 : in STD_ULOGIC;
        A4 : in STD_ULOGIC;
        A3 : in STD_ULOGIC;
        A2 : in STD_ULOGIC;
        A1 : in STD_ULOGIC;
        A0 : in STD_ULOGIC;

        B35 : in STD_ULOGIC;
        B34 : in STD_ULOGIC;
        B33 : in STD_ULOGIC;
        B32 : in STD_ULOGIC;
        B31 : in STD_ULOGIC;
        B30 : in STD_ULOGIC;
        B29 : in STD_ULOGIC;
        B28 : in STD_ULOGIC;
        B27 : in STD_ULOGIC;
        B26 : in STD_ULOGIC;
        B25 : in STD_ULOGIC;
        B24 : in STD_ULOGIC;
        B23 : in STD_ULOGIC;
        B22 : in STD_ULOGIC;
        B21 : in STD_ULOGIC;
        B20 : in STD_ULOGIC;
        B19 : in STD_ULOGIC;
        B18 : in STD_ULOGIC;
        B17 : in STD_ULOGIC;
        B16 : in STD_ULOGIC;
        B15 : in STD_ULOGIC;
        B14 : in STD_ULOGIC;
        B13 : in STD_ULOGIC;
        B12 : in STD_ULOGIC;
        B11 : in STD_ULOGIC;
        B10 : in STD_ULOGIC;
        B9 : in STD_ULOGIC;
        B8 : in STD_ULOGIC;
        B7 : in STD_ULOGIC;
        B6 : in STD_ULOGIC;
        B5 : in STD_ULOGIC;
        B4 : in STD_ULOGIC;
        B3 : in STD_ULOGIC;
        B2 : in STD_ULOGIC;
        B1 : in STD_ULOGIC;
        B0 : in STD_ULOGIC;

        C53 : in STD_ULOGIC;
        C52 : in STD_ULOGIC;
        C51 : in STD_ULOGIC;
        C50 : in STD_ULOGIC;
        C49 : in STD_ULOGIC;
        C48 : in STD_ULOGIC;
        C47 : in STD_ULOGIC;
        C46 : in STD_ULOGIC;
        C45 : in STD_ULOGIC;
        C44 : in STD_ULOGIC;
        C43 : in STD_ULOGIC;
        C42 : in STD_ULOGIC;
        C41 : in STD_ULOGIC;
        C40 : in STD_ULOGIC;
        C39 : in STD_ULOGIC;
        C38 : in STD_ULOGIC;
        C37 : in STD_ULOGIC;
        C36 : in STD_ULOGIC;
        C35 : in STD_ULOGIC;
        C34 : in STD_ULOGIC;
        C33 : in STD_ULOGIC;
        C32 : in STD_ULOGIC;
        C31 : in STD_ULOGIC;
        C30 : in STD_ULOGIC;
        C29 : in STD_ULOGIC;
        C28 : in STD_ULOGIC;
        C27 : in STD_ULOGIC;
        C26 : in STD_ULOGIC;
        C25 : in STD_ULOGIC;
        C24 : in STD_ULOGIC;
        C23 : in STD_ULOGIC;
        C22 : in STD_ULOGIC;
        C21 : in STD_ULOGIC;
        C20 : in STD_ULOGIC;
        C19 : in STD_ULOGIC;
        C18 : in STD_ULOGIC;
        C17 : in STD_ULOGIC;
        C16 : in STD_ULOGIC;
        C15 : in STD_ULOGIC;
        C14 : in STD_ULOGIC;
        C13 : in STD_ULOGIC;
        C12 : in STD_ULOGIC;
        C11 : in STD_ULOGIC;
        C10 : in STD_ULOGIC;
        C9 : in STD_ULOGIC;
        C8 : in STD_ULOGIC;
        C7 : in STD_ULOGIC;
        C6 : in STD_ULOGIC;
        C5 : in STD_ULOGIC;
        C4 : in STD_ULOGIC;
        C3 : in STD_ULOGIC;
        C2 : in STD_ULOGIC;
        C1 : in STD_ULOGIC;
        C0 : in STD_ULOGIC;

        MA35 : in STD_ULOGIC;
        MA34 : in STD_ULOGIC;
        MA33 : in STD_ULOGIC;
        MA32 : in STD_ULOGIC;
        MA31 : in STD_ULOGIC;
        MA30 : in STD_ULOGIC;
        MA29 : in STD_ULOGIC;
        MA28 : in STD_ULOGIC;
        MA27 : in STD_ULOGIC;
        MA26 : in STD_ULOGIC;
        MA25 : in STD_ULOGIC;
        MA24 : in STD_ULOGIC;
        MA23 : in STD_ULOGIC;
        MA22 : in STD_ULOGIC;
        MA21 : in STD_ULOGIC;
        MA20 : in STD_ULOGIC;
        MA19 : in STD_ULOGIC;
        MA18 : in STD_ULOGIC;
        MA17 : in STD_ULOGIC;
        MA16 : in STD_ULOGIC;
        MA15 : in STD_ULOGIC;
        MA14 : in STD_ULOGIC;
        MA13 : in STD_ULOGIC;
        MA12 : in STD_ULOGIC;
        MA11 : in STD_ULOGIC;
        MA10 : in STD_ULOGIC;
        MA9 : in STD_ULOGIC;
        MA8 : in STD_ULOGIC;
        MA7 : in STD_ULOGIC;
        MA6 : in STD_ULOGIC;
        MA5 : in STD_ULOGIC;
        MA4 : in STD_ULOGIC;
        MA3 : in STD_ULOGIC;
        MA2 : in STD_ULOGIC;
        MA1 : in STD_ULOGIC;
        MA0 : in STD_ULOGIC;

        MB35 : in STD_ULOGIC;
        MB34 : in STD_ULOGIC;
        MB33 : in STD_ULOGIC;
        MB32 : in STD_ULOGIC;
        MB31 : in STD_ULOGIC;
        MB30 : in STD_ULOGIC;
        MB29 : in STD_ULOGIC;
        MB28 : in STD_ULOGIC;
        MB27 : in STD_ULOGIC;
        MB26 : in STD_ULOGIC;
        MB25 : in STD_ULOGIC;
        MB24 : in STD_ULOGIC;
        MB23 : in STD_ULOGIC;
        MB22 : in STD_ULOGIC;
        MB21 : in STD_ULOGIC;
        MB20 : in STD_ULOGIC;
        MB19 : in STD_ULOGIC;
        MB18 : in STD_ULOGIC;
        MB17 : in STD_ULOGIC;
        MB16 : in STD_ULOGIC;
        MB15 : in STD_ULOGIC;
        MB14 : in STD_ULOGIC;
        MB13 : in STD_ULOGIC;
        MB12 : in STD_ULOGIC;
        MB11 : in STD_ULOGIC;
        MB10 : in STD_ULOGIC;
        MB9 : in STD_ULOGIC;
        MB8 : in STD_ULOGIC;
        MB7 : in STD_ULOGIC;
        MB6 : in STD_ULOGIC;
        MB5 : in STD_ULOGIC;
        MB4 : in STD_ULOGIC;
        MB3 : in STD_ULOGIC;
        MB2 : in STD_ULOGIC;
        MB1 : in STD_ULOGIC;
        MB0 : in STD_ULOGIC;

        CIN53 : in STD_ULOGIC;
        CIN52 : in STD_ULOGIC;
        CIN51 : in STD_ULOGIC;
        CIN50 : in STD_ULOGIC;
        CIN49 : in STD_ULOGIC;
        CIN48 : in STD_ULOGIC;
        CIN47 : in STD_ULOGIC;
        CIN46 : in STD_ULOGIC;
        CIN45 : in STD_ULOGIC;
        CIN44 : in STD_ULOGIC;
        CIN43 : in STD_ULOGIC;
        CIN42 : in STD_ULOGIC;
        CIN41 : in STD_ULOGIC;
        CIN40 : in STD_ULOGIC;
        CIN39 : in STD_ULOGIC;
        CIN38 : in STD_ULOGIC;
        CIN37 : in STD_ULOGIC;
        CIN36 : in STD_ULOGIC;
        CIN35 : in STD_ULOGIC;
        CIN34 : in STD_ULOGIC;
        CIN33 : in STD_ULOGIC;
        CIN32 : in STD_ULOGIC;
        CIN31 : in STD_ULOGIC;
        CIN30 : in STD_ULOGIC;
        CIN29 : in STD_ULOGIC;
        CIN28 : in STD_ULOGIC;
        CIN27 : in STD_ULOGIC;
        CIN26 : in STD_ULOGIC;
        CIN25 : in STD_ULOGIC;
        CIN24 : in STD_ULOGIC;
        CIN23 : in STD_ULOGIC;
        CIN22 : in STD_ULOGIC;
        CIN21 : in STD_ULOGIC;
        CIN20 : in STD_ULOGIC;
        CIN19 : in STD_ULOGIC;
        CIN18 : in STD_ULOGIC;
        CIN17 : in STD_ULOGIC;
        CIN16 : in STD_ULOGIC;
        CIN15 : in STD_ULOGIC;
        CIN14 : in STD_ULOGIC;
        CIN13 : in STD_ULOGIC;
        CIN12 : in STD_ULOGIC;
        CIN11 : in STD_ULOGIC;
        CIN10 : in STD_ULOGIC;
        CIN9 : in STD_ULOGIC;
        CIN8 : in STD_ULOGIC;
        CIN7 : in STD_ULOGIC;
        CIN6 : in STD_ULOGIC;
        CIN5 : in STD_ULOGIC;
        CIN4 : in STD_ULOGIC;
        CIN3 : in STD_ULOGIC;
        CIN2 : in STD_ULOGIC;
        CIN1 : in STD_ULOGIC;
        CIN0 : in STD_ULOGIC;

        OP10 : in STD_ULOGIC;
        OP9  : in STD_ULOGIC;
        OP8  : in STD_ULOGIC;
        OP7  : in STD_ULOGIC;
        OP6  : in STD_ULOGIC;
        OP5  : in STD_ULOGIC;
        OP4  : in STD_ULOGIC;
        OP3  : in STD_ULOGIC;
        OP2  : in STD_ULOGIC;
        OP1  : in STD_ULOGIC;
        OP0  : in STD_ULOGIC;

        SIGNEDCIN  : in STD_ULOGIC;

        R53  : out STD_ULOGIC;
        R52  : out STD_ULOGIC;
        R51  : out STD_ULOGIC;
        R50  : out STD_ULOGIC;
        R49  : out STD_ULOGIC;
        R48  : out STD_ULOGIC;
        R47  : out STD_ULOGIC;
        R46  : out STD_ULOGIC;
        R45  : out STD_ULOGIC;
        R44  : out STD_ULOGIC;
        R43  : out STD_ULOGIC;
        R42  : out STD_ULOGIC;
        R41  : out STD_ULOGIC;
        R40  : out STD_ULOGIC;
        R39  : out STD_ULOGIC;
        R38  : out STD_ULOGIC;
        R37  : out STD_ULOGIC;
        R36  : out STD_ULOGIC;
        R35  : out STD_ULOGIC;
        R34  : out STD_ULOGIC;
        R33  : out STD_ULOGIC;
        R32  : out STD_ULOGIC;
        R31  : out STD_ULOGIC;
        R30  : out STD_ULOGIC;
        R29  : out STD_ULOGIC;
        R28  : out STD_ULOGIC;
        R27  : out STD_ULOGIC;
        R26  : out STD_ULOGIC;
        R25  : out STD_ULOGIC;
        R24  : out STD_ULOGIC;
        R23  : out STD_ULOGIC;
        R22  : out STD_ULOGIC;
        R21  : out STD_ULOGIC;
        R20  : out STD_ULOGIC;
        R19  : out STD_ULOGIC;
        R18  : out STD_ULOGIC;
        R17  : out STD_ULOGIC;
        R16  : out STD_ULOGIC;
        R15  : out STD_ULOGIC;
        R14  : out STD_ULOGIC;
        R13  : out STD_ULOGIC;
        R12  : out STD_ULOGIC;
        R11  : out STD_ULOGIC;
        R10  : out STD_ULOGIC;
        R9   : out STD_ULOGIC;
        R8   : out STD_ULOGIC;
        R7   : out STD_ULOGIC;
        R6   : out STD_ULOGIC;
        R5   : out STD_ULOGIC;
        R4   : out STD_ULOGIC;
        R3   : out STD_ULOGIC;
        R2   : out STD_ULOGIC;
        R1   : out STD_ULOGIC;
        R0   : out STD_ULOGIC;

        EQZ  : out STD_ULOGIC;
        EQZM : out STD_ULOGIC;
        EQOM : out STD_ULOGIC;
        EQPAT       : out STD_ULOGIC;
        EQPATB      : out STD_ULOGIC;
        OVER        : out STD_ULOGIC;
        UNDER       : out STD_ULOGIC;
        OVERUNDER   : out STD_ULOGIC;
        SIGNEDR     : out STD_ULOGIC
       );
  end component;

  component ALU24A
  GENERIC(
         REG_OUTPUT_CLK       : string     := "NONE";
         REG_OUTPUT_CE        : string     := "CE0";
         REG_OUTPUT_RST       : string     := "RST0";
         REG_OPCODE_0_CLK     : string     := "NONE";
         REG_OPCODE_0_CE      : string     := "CE0";
         REG_OPCODE_0_RST     : string     := "RST0";
         REG_OPCODE_1_CLK     : string     := "NONE";
         REG_OPCODE_1_CE      : string     := "CE0";
         REG_OPCODE_1_RST     : string     := "RST0";
         RESETMODE            : string     := "SYNC";
         GSR                  : string     := "ENABLED");
  port (

        CE3 : in STD_ULOGIC;
        CE2 : in STD_ULOGIC;
        CE1 : in STD_ULOGIC;
        CE0 : in STD_ULOGIC;

        CLK3 : in STD_ULOGIC;
        CLK2 : in STD_ULOGIC;
        CLK1 : in STD_ULOGIC;
        CLK0 : in STD_ULOGIC;

        RST3 : in STD_ULOGIC;
        RST2 : in STD_ULOGIC;
        RST1 : in STD_ULOGIC;
        RST0 : in STD_ULOGIC;

        SIGNEDIA : in STD_ULOGIC;
        SIGNEDIB : in STD_ULOGIC;

        MA17 : in STD_ULOGIC;
        MA16 : in STD_ULOGIC;
        MA15 : in STD_ULOGIC;
        MA14 : in STD_ULOGIC;
        MA13 : in STD_ULOGIC;
        MA12 : in STD_ULOGIC;
        MA11 : in STD_ULOGIC;
        MA10 : in STD_ULOGIC;
        MA9 : in STD_ULOGIC;
        MA8 : in STD_ULOGIC;
        MA7 : in STD_ULOGIC;
        MA6 : in STD_ULOGIC;
        MA5 : in STD_ULOGIC;
        MA4 : in STD_ULOGIC;
        MA3 : in STD_ULOGIC;
        MA2 : in STD_ULOGIC;
        MA1 : in STD_ULOGIC;
        MA0 : in STD_ULOGIC;

        MB17 : in STD_ULOGIC;
        MB16 : in STD_ULOGIC;
        MB15 : in STD_ULOGIC;
        MB14 : in STD_ULOGIC;
        MB13 : in STD_ULOGIC;
        MB12 : in STD_ULOGIC;
        MB11 : in STD_ULOGIC;
        MB10 : in STD_ULOGIC;
        MB9 : in STD_ULOGIC;
        MB8 : in STD_ULOGIC;
        MB7 : in STD_ULOGIC;
        MB6 : in STD_ULOGIC;
        MB5 : in STD_ULOGIC;
        MB4 : in STD_ULOGIC;
        MB3 : in STD_ULOGIC;
        MB2 : in STD_ULOGIC;
        MB1 : in STD_ULOGIC;
        MB0 : in STD_ULOGIC;

        CIN23 : in STD_ULOGIC;
        CIN22 : in STD_ULOGIC;
        CIN21 : in STD_ULOGIC;
        CIN20 : in STD_ULOGIC;
        CIN19 : in STD_ULOGIC;
        CIN18 : in STD_ULOGIC;
        CIN17 : in STD_ULOGIC;
        CIN16 : in STD_ULOGIC;
        CIN15 : in STD_ULOGIC;
        CIN14 : in STD_ULOGIC;
        CIN13 : in STD_ULOGIC;
        CIN12 : in STD_ULOGIC;
        CIN11 : in STD_ULOGIC;
        CIN10 : in STD_ULOGIC;
        CIN9 : in STD_ULOGIC;
        CIN8 : in STD_ULOGIC;
        CIN7 : in STD_ULOGIC;
        CIN6 : in STD_ULOGIC;
        CIN5 : in STD_ULOGIC;
        CIN4 : in STD_ULOGIC;
        CIN3 : in STD_ULOGIC;
        CIN2 : in STD_ULOGIC;
        CIN1 : in STD_ULOGIC;
        CIN0 : in STD_ULOGIC;

        OPADDNSUB : in STD_ULOGIC;
        OPCINSEL  : in STD_ULOGIC;

        R23  : out STD_ULOGIC;
        R22  : out STD_ULOGIC;
        R21  : out STD_ULOGIC;
        R20  : out STD_ULOGIC;
        R19  : out STD_ULOGIC;
        R18  : out STD_ULOGIC;
        R17  : out STD_ULOGIC;
        R16  : out STD_ULOGIC;
        R15  : out STD_ULOGIC;
        R14  : out STD_ULOGIC;
        R13  : out STD_ULOGIC;
        R12  : out STD_ULOGIC;
        R11  : out STD_ULOGIC;
        R10  : out STD_ULOGIC;
        R9   : out STD_ULOGIC;
        R8   : out STD_ULOGIC;
        R7   : out STD_ULOGIC;
        R6   : out STD_ULOGIC;
        R5   : out STD_ULOGIC;
        R4   : out STD_ULOGIC;
        R3   : out STD_ULOGIC;
        R2   : out STD_ULOGIC;
        R1   : out STD_ULOGIC;
        R0   : out STD_ULOGIC
       );
  end component;

  component MULT18X18B
  GENERIC(
	 REG_INPUTA_CLK       : string     := "NONE";
	 REG_INPUTA_CE        : string     := "CE0";
	 REG_INPUTA_RST       : string     := "RST0";
	 REG_INPUTB_CLK       : string     := "NONE";
	 REG_INPUTB_CE        : string     := "CE0";
	 REG_INPUTB_RST       : string     := "RST0";
	 REG_PIPELINE_CLK     : string     := "NONE";
	 REG_PIPELINE_CE      : string     := "CE0";
	 REG_PIPELINE_RST     : string     := "RST0";
	 REG_OUTPUT_CLK       : string     := "NONE";
	 REG_OUTPUT_CE        : string     := "CE0";
	 REG_OUTPUT_RST       : string     := "RST0";
	 REG_SIGNEDA_CLK      : string     := "NONE";
	 REG_SIGNEDA_CE       : string     := "CE0";
	 REG_SIGNEDA_RST      : string     := "RST0";
         REG_SIGNEDB_CLK      : string     := "NONE";
         REG_SIGNEDB_CE       : string     := "CE0";
         REG_SIGNEDB_RST      : string     := "RST0";
	 GSR                  : string     := "ENABLED");
  port (
        A17 : in STD_ULOGIC;
        A16 : in STD_ULOGIC;
        A15 : in STD_ULOGIC;
        A14 : in STD_ULOGIC;
        A13 : in STD_ULOGIC;
        A12 : in STD_ULOGIC;
        A11 : in STD_ULOGIC;
        A10 : in STD_ULOGIC;
        A9 : in STD_ULOGIC;
        A8 : in STD_ULOGIC;
        A7 : in STD_ULOGIC;
        A6 : in STD_ULOGIC;
        A5 : in STD_ULOGIC;
        A4 : in STD_ULOGIC;
        A3 : in STD_ULOGIC;
        A2 : in STD_ULOGIC;
        A1 : in STD_ULOGIC;
        A0 : in STD_ULOGIC;

        SRIA17 : in STD_ULOGIC;
        SRIA16 : in STD_ULOGIC;
        SRIA15 : in STD_ULOGIC;
        SRIA14 : in STD_ULOGIC;
        SRIA13 : in STD_ULOGIC;
        SRIA12 : in STD_ULOGIC;
        SRIA11 : in STD_ULOGIC;
        SRIA10 : in STD_ULOGIC;
        SRIA9 : in STD_ULOGIC;
        SRIA8 : in STD_ULOGIC;
        SRIA7 : in STD_ULOGIC;
        SRIA6 : in STD_ULOGIC;
        SRIA5 : in STD_ULOGIC;
        SRIA4 : in STD_ULOGIC;
        SRIA3 : in STD_ULOGIC;
        SRIA2 : in STD_ULOGIC;
        SRIA1 : in STD_ULOGIC;
        SRIA0 : in STD_ULOGIC;

        B17 : in STD_ULOGIC;
        B16 : in STD_ULOGIC;
        B15 : in STD_ULOGIC;
        B14 : in STD_ULOGIC;
        B13 : in STD_ULOGIC;
        B12 : in STD_ULOGIC;
        B11 : in STD_ULOGIC;
        B10 : in STD_ULOGIC;
        B9 : in STD_ULOGIC;
        B8 : in STD_ULOGIC;
        B7 : in STD_ULOGIC;
        B6 : in STD_ULOGIC;
        B5 : in STD_ULOGIC;
        B4 : in STD_ULOGIC;
        B3 : in STD_ULOGIC;
        B2 : in STD_ULOGIC;
        B1 : in STD_ULOGIC;
        B0 : in STD_ULOGIC;

        SRIB17 : in STD_ULOGIC;
        SRIB16 : in STD_ULOGIC;
        SRIB15 : in STD_ULOGIC;
        SRIB14 : in STD_ULOGIC;
        SRIB13 : in STD_ULOGIC;
        SRIB12 : in STD_ULOGIC;
        SRIB11 : in STD_ULOGIC;
        SRIB10 : in STD_ULOGIC;
        SRIB9 : in STD_ULOGIC;
        SRIB8 : in STD_ULOGIC;
        SRIB7 : in STD_ULOGIC;
        SRIB6 : in STD_ULOGIC;
        SRIB5 : in STD_ULOGIC;
        SRIB4 : in STD_ULOGIC;
        SRIB3 : in STD_ULOGIC;
        SRIB2 : in STD_ULOGIC;
        SRIB1 : in STD_ULOGIC;
        SRIB0 : in STD_ULOGIC;

        SIGNEDA : in STD_ULOGIC;
        SIGNEDB : in STD_ULOGIC;
        SOURCEA : in STD_ULOGIC;
        SOURCEB : in STD_ULOGIC;

        CE3 : in STD_ULOGIC;
        CE2 : in STD_ULOGIC;
        CE1 : in STD_ULOGIC;
        CE0 : in STD_ULOGIC;

        CLK3 : in STD_ULOGIC;
        CLK2 : in STD_ULOGIC;
        CLK1 : in STD_ULOGIC;
        CLK0 : in STD_ULOGIC;

        RST3 : in STD_ULOGIC;
        RST2 : in STD_ULOGIC;
        RST1 : in STD_ULOGIC;
        RST0 : in STD_ULOGIC;

        SROA17 : out STD_ULOGIC;
        SROA16 : out STD_ULOGIC;
        SROA15 : out STD_ULOGIC;
        SROA14 : out STD_ULOGIC;
        SROA13 : out STD_ULOGIC;
        SROA12 : out STD_ULOGIC;
        SROA11 : out STD_ULOGIC;
        SROA10 : out STD_ULOGIC;
        SROA9 : out STD_ULOGIC;
        SROA8 : out STD_ULOGIC;
        SROA7 : out STD_ULOGIC;
        SROA6 : out STD_ULOGIC;
        SROA5 : out STD_ULOGIC;
        SROA4 : out STD_ULOGIC;
        SROA3 : out STD_ULOGIC;
        SROA2 : out STD_ULOGIC;
        SROA1 : out STD_ULOGIC;
        SROA0 : out STD_ULOGIC;

        SROB17 : out STD_ULOGIC;
        SROB16 : out STD_ULOGIC;
        SROB15 : out STD_ULOGIC;
        SROB14 : out STD_ULOGIC;
        SROB13 : out STD_ULOGIC;
        SROB12 : out STD_ULOGIC;
        SROB11 : out STD_ULOGIC;
        SROB10 : out STD_ULOGIC;
        SROB9 : out STD_ULOGIC;
        SROB8 : out STD_ULOGIC;
        SROB7 : out STD_ULOGIC;
        SROB6 : out STD_ULOGIC;
        SROB5 : out STD_ULOGIC;
        SROB4 : out STD_ULOGIC;
        SROB3 : out STD_ULOGIC;
        SROB2 : out STD_ULOGIC;
        SROB1 : out STD_ULOGIC;
        SROB0 : out STD_ULOGIC;

        P35 : out STD_ULOGIC;
        P34 : out STD_ULOGIC;
        P33 : out STD_ULOGIC;
        P32 : out STD_ULOGIC;
        P31 : out STD_ULOGIC;
        P30 : out STD_ULOGIC;
        P29 : out STD_ULOGIC;
        P28 : out STD_ULOGIC;
        P27 : out STD_ULOGIC;
        P26 : out STD_ULOGIC;
        P25 : out STD_ULOGIC;
        P24 : out STD_ULOGIC;
        P23 : out STD_ULOGIC;
        P22 : out STD_ULOGIC;
        P21 : out STD_ULOGIC;
        P20 : out STD_ULOGIC;
        P19 : out STD_ULOGIC;
        P18 : out STD_ULOGIC;
        P17 : out STD_ULOGIC;
        P16 : out STD_ULOGIC;
        P15 : out STD_ULOGIC;
        P14 : out STD_ULOGIC;
        P13 : out STD_ULOGIC;
        P12 : out STD_ULOGIC;
        P11 : out STD_ULOGIC;
        P10 : out STD_ULOGIC;
        P9 : out STD_ULOGIC;
        P8 : out STD_ULOGIC;
        P7 : out STD_ULOGIC;
        P6 : out STD_ULOGIC;
        P5 : out STD_ULOGIC;
        P4 : out STD_ULOGIC;
        P3 : out STD_ULOGIC;
        P2 : out STD_ULOGIC;
        P1 : out STD_ULOGIC;
        P0 : out STD_ULOGIC
       ); 
  end component;

  component MULT18X18ADDSUBB
  GENERIC(
	 REG_INPUTA0_CLK       : string     := "NONE";
	 REG_INPUTA0_CE        : string     := "CE0";
	 REG_INPUTA0_RST       : string     := "RST0";
	 REG_INPUTA1_CLK       : string     := "NONE";
	 REG_INPUTA1_CE        : string     := "CE0";
	 REG_INPUTA1_RST       : string     := "RST0";
	 REG_INPUTB0_CLK       : string     := "NONE";
	 REG_INPUTB0_CE        : string     := "CE0";
	 REG_INPUTB0_RST       : string     := "RST0";
	 REG_INPUTB1_CLK       : string     := "NONE";
	 REG_INPUTB1_CE        : string     := "CE0";
	 REG_INPUTB1_RST       : string     := "RST0";
	 REG_PIPELINE0_CLK     : string     := "NONE";
	 REG_PIPELINE0_CE      : string     := "CE0";
	 REG_PIPELINE0_RST     : string     := "RST0";
	 REG_PIPELINE1_CLK     : string     := "NONE";
	 REG_PIPELINE1_CE      : string     := "CE0";
	 REG_PIPELINE1_RST     : string     := "RST0";
	 REG_OUTPUT_CLK       : string     := "NONE";
	 REG_OUTPUT_CE        : string     := "CE0";
	 REG_OUTPUT_RST       : string     := "RST0";
	 REG_SIGNEDA_0_CLK   : string     := "NONE";
	 REG_SIGNEDA_0_CE    : string     := "CE0";
	 REG_SIGNEDA_0_RST   : string     := "RST0";
	 REG_SIGNEDA_1_CLK   : string     := "NONE";
	 REG_SIGNEDA_1_CE    : string     := "CE0";
	 REG_SIGNEDA_1_RST   : string     := "RST0";
         REG_SIGNEDB_0_CLK   : string     := "NONE";
         REG_SIGNEDB_0_CE    : string     := "CE0";
         REG_SIGNEDB_0_RST   : string     := "RST0";
         REG_SIGNEDB_1_CLK   : string     := "NONE";
         REG_SIGNEDB_1_CE    : string     := "CE0";
         REG_SIGNEDB_1_RST   : string     := "RST0";
	 REG_ADDNSUB_0_CLK    : string     := "NONE";
	 REG_ADDNSUB_0_CE     : string     := "CE0";
	 REG_ADDNSUB_0_RST    : string     := "RST0";
	 REG_ADDNSUB_1_CLK    : string     := "NONE";
	 REG_ADDNSUB_1_CE     : string     := "CE0";
	 REG_ADDNSUB_1_RST    : string     := "RST0";
	 GSR                  : string     := "ENABLED");
  port (
        A017 : in STD_ULOGIC;
        A016 : in STD_ULOGIC;
        A015 : in STD_ULOGIC;
        A014 : in STD_ULOGIC;
        A013 : in STD_ULOGIC;
        A012 : in STD_ULOGIC;
        A011 : in STD_ULOGIC;
        A010 : in STD_ULOGIC;
        A09 : in STD_ULOGIC;
        A08 : in STD_ULOGIC;
        A07 : in STD_ULOGIC;
        A06 : in STD_ULOGIC;
        A05 : in STD_ULOGIC;
        A04 : in STD_ULOGIC;
        A03 : in STD_ULOGIC;
        A02 : in STD_ULOGIC;
        A01 : in STD_ULOGIC;
        A00 : in STD_ULOGIC;

        A117 : in STD_ULOGIC;
        A116 : in STD_ULOGIC;
        A115 : in STD_ULOGIC;
        A114 : in STD_ULOGIC;
        A113 : in STD_ULOGIC;
        A112 : in STD_ULOGIC;
        A111 : in STD_ULOGIC;
        A110 : in STD_ULOGIC;
        A19 : in STD_ULOGIC;
        A18 : in STD_ULOGIC;
        A17 : in STD_ULOGIC;
        A16 : in STD_ULOGIC;
        A15 : in STD_ULOGIC;
        A14 : in STD_ULOGIC;
        A13 : in STD_ULOGIC;
        A12 : in STD_ULOGIC;
        A11 : in STD_ULOGIC;
        A10 : in STD_ULOGIC;

        SRIA17 : in STD_ULOGIC;
        SRIA16 : in STD_ULOGIC;
        SRIA15 : in STD_ULOGIC;
        SRIA14 : in STD_ULOGIC;
        SRIA13 : in STD_ULOGIC;
        SRIA12 : in STD_ULOGIC;
        SRIA11 : in STD_ULOGIC;
        SRIA10 : in STD_ULOGIC;
        SRIA9 : in STD_ULOGIC;
        SRIA8 : in STD_ULOGIC;
        SRIA7 : in STD_ULOGIC;
        SRIA6 : in STD_ULOGIC;
        SRIA5 : in STD_ULOGIC;
        SRIA4 : in STD_ULOGIC;
        SRIA3 : in STD_ULOGIC;
        SRIA2 : in STD_ULOGIC;
        SRIA1 : in STD_ULOGIC;
        SRIA0 : in STD_ULOGIC;

        B017 : in STD_ULOGIC;
        B016 : in STD_ULOGIC;
        B015 : in STD_ULOGIC;
        B014 : in STD_ULOGIC;
        B013 : in STD_ULOGIC;
        B012 : in STD_ULOGIC;
        B011 : in STD_ULOGIC;
        B010 : in STD_ULOGIC;
        B09 : in STD_ULOGIC;
        B08 : in STD_ULOGIC;
        B07 : in STD_ULOGIC;
        B06 : in STD_ULOGIC;
        B05 : in STD_ULOGIC;
        B04 : in STD_ULOGIC;
        B03 : in STD_ULOGIC;
        B02 : in STD_ULOGIC;
        B01 : in STD_ULOGIC;
        B00 : in STD_ULOGIC;

        B117 : in STD_ULOGIC;
        B116 : in STD_ULOGIC;
        B115 : in STD_ULOGIC;
        B114 : in STD_ULOGIC;
        B113 : in STD_ULOGIC;
        B112 : in STD_ULOGIC;
        B111 : in STD_ULOGIC;
        B110 : in STD_ULOGIC;
        B19 : in STD_ULOGIC;
        B18 : in STD_ULOGIC;
        B17 : in STD_ULOGIC;
        B16 : in STD_ULOGIC;
        B15 : in STD_ULOGIC;
        B14 : in STD_ULOGIC;
        B13 : in STD_ULOGIC;
        B12 : in STD_ULOGIC;
        B11 : in STD_ULOGIC;
        B10 : in STD_ULOGIC;

        SRIB17 : in STD_ULOGIC;
        SRIB16 : in STD_ULOGIC;
        SRIB15 : in STD_ULOGIC;
        SRIB14 : in STD_ULOGIC;
        SRIB13 : in STD_ULOGIC;
        SRIB12 : in STD_ULOGIC;
        SRIB11 : in STD_ULOGIC;
        SRIB10 : in STD_ULOGIC;
        SRIB9 : in STD_ULOGIC;
        SRIB8 : in STD_ULOGIC;
        SRIB7 : in STD_ULOGIC;
        SRIB6 : in STD_ULOGIC;
        SRIB5 : in STD_ULOGIC;
        SRIB4 : in STD_ULOGIC;
        SRIB3 : in STD_ULOGIC;
        SRIB2 : in STD_ULOGIC;
        SRIB1 : in STD_ULOGIC;
        SRIB0 : in STD_ULOGIC;

        SIGNEDA : in STD_ULOGIC;
        SIGNEDB : in STD_ULOGIC;
        SOURCEA1 : in STD_ULOGIC;
        SOURCEA0 : in STD_ULOGIC;
        SOURCEB1 : in STD_ULOGIC;
        SOURCEB0 : in STD_ULOGIC;
        ADDNSUB  : in STD_ULOGIC;

        CE3 : in STD_ULOGIC;
        CE2 : in STD_ULOGIC;
        CE1 : in STD_ULOGIC;
        CE0 : in STD_ULOGIC;

        CLK3 : in STD_ULOGIC;
        CLK2 : in STD_ULOGIC;
        CLK1 : in STD_ULOGIC;
        CLK0 : in STD_ULOGIC;

        RST3 : in STD_ULOGIC;
        RST2 : in STD_ULOGIC;
        RST1 : in STD_ULOGIC;
        RST0 : in STD_ULOGIC;

        SROA17 : out STD_ULOGIC;
        SROA16 : out STD_ULOGIC;
        SROA15 : out STD_ULOGIC;
        SROA14 : out STD_ULOGIC;
        SROA13 : out STD_ULOGIC;
        SROA12 : out STD_ULOGIC;
        SROA11 : out STD_ULOGIC;
        SROA10 : out STD_ULOGIC;
        SROA9 : out STD_ULOGIC;
        SROA8 : out STD_ULOGIC;
        SROA7 : out STD_ULOGIC;
        SROA6 : out STD_ULOGIC;
        SROA5 : out STD_ULOGIC;
        SROA4 : out STD_ULOGIC;
        SROA3 : out STD_ULOGIC;
        SROA2 : out STD_ULOGIC;
        SROA1 : out STD_ULOGIC;
        SROA0 : out STD_ULOGIC;

        SROB17 : out STD_ULOGIC;
        SROB16 : out STD_ULOGIC;
        SROB15 : out STD_ULOGIC;
        SROB14 : out STD_ULOGIC;
        SROB13 : out STD_ULOGIC;
        SROB12 : out STD_ULOGIC;
        SROB11 : out STD_ULOGIC;
        SROB10 : out STD_ULOGIC;
        SROB9 : out STD_ULOGIC;
        SROB8 : out STD_ULOGIC;
        SROB7 : out STD_ULOGIC;
        SROB6 : out STD_ULOGIC;
        SROB5 : out STD_ULOGIC;
        SROB4 : out STD_ULOGIC;
        SROB3 : out STD_ULOGIC;
        SROB2 : out STD_ULOGIC;
        SROB1 : out STD_ULOGIC;
        SROB0 : out STD_ULOGIC;

        SUM36 : out STD_ULOGIC;
        SUM35 : out STD_ULOGIC;
        SUM34 : out STD_ULOGIC;
        SUM33 : out STD_ULOGIC;
        SUM32 : out STD_ULOGIC;
        SUM31 : out STD_ULOGIC;
        SUM30 : out STD_ULOGIC;
        SUM29 : out STD_ULOGIC;
        SUM28 : out STD_ULOGIC;
        SUM27 : out STD_ULOGIC;
        SUM26 : out STD_ULOGIC;
        SUM25 : out STD_ULOGIC;
        SUM24 : out STD_ULOGIC;
        SUM23 : out STD_ULOGIC;
        SUM22 : out STD_ULOGIC;
        SUM21 : out STD_ULOGIC;
        SUM20 : out STD_ULOGIC;
        SUM19 : out STD_ULOGIC;
        SUM18 : out STD_ULOGIC;
        SUM17 : out STD_ULOGIC;
        SUM16 : out STD_ULOGIC;
        SUM15 : out STD_ULOGIC;
        SUM14 : out STD_ULOGIC;
        SUM13 : out STD_ULOGIC;
        SUM12 : out STD_ULOGIC;
        SUM11 : out STD_ULOGIC;
        SUM10 : out STD_ULOGIC;
        SUM9 : out STD_ULOGIC;
        SUM8 : out STD_ULOGIC;
        SUM7 : out STD_ULOGIC;
        SUM6 : out STD_ULOGIC;
        SUM5 : out STD_ULOGIC;
        SUM4 : out STD_ULOGIC;
        SUM3 : out STD_ULOGIC;
        SUM2 : out STD_ULOGIC;
        SUM1 : out STD_ULOGIC;
        SUM0 : out STD_ULOGIC
       ); 
  end component;

  component MULT18X18ADDSUBSUMB
  GENERIC(
	 REG_INPUTA0_CLK       : string     := "NONE";
	 REG_INPUTA0_CE        : string     := "CE0";
	 REG_INPUTA0_RST       : string     := "RST0";
	 REG_INPUTA1_CLK       : string     := "NONE";
	 REG_INPUTA1_CE        : string     := "CE0";
	 REG_INPUTA1_RST       : string     := "RST0";
	 REG_INPUTA2_CLK       : string     := "NONE";
	 REG_INPUTA2_CE        : string     := "CE0";
	 REG_INPUTA2_RST       : string     := "RST0";
	 REG_INPUTA3_CLK       : string     := "NONE";
	 REG_INPUTA3_CE        : string     := "CE0";
	 REG_INPUTA3_RST       : string     := "RST0";
	 REG_INPUTB0_CLK       : string     := "NONE";
	 REG_INPUTB0_CE        : string     := "CE0";
	 REG_INPUTB0_RST       : string     := "RST0";
	 REG_INPUTB1_CLK       : string     := "NONE";
	 REG_INPUTB1_CE        : string     := "CE0";
	 REG_INPUTB1_RST       : string     := "RST0";
	 REG_INPUTB2_CLK       : string     := "NONE";
	 REG_INPUTB2_CE        : string     := "CE0";
	 REG_INPUTB2_RST       : string     := "RST0";
	 REG_INPUTB3_CLK       : string     := "NONE";
	 REG_INPUTB3_CE        : string     := "CE0";
	 REG_INPUTB3_RST       : string     := "RST0";
	 REG_PIPELINE0_CLK     : string     := "NONE";
	 REG_PIPELINE0_CE      : string     := "CE0";
	 REG_PIPELINE0_RST     : string     := "RST0";
	 REG_PIPELINE1_CLK     : string     := "NONE";
	 REG_PIPELINE1_CE      : string     := "CE0";
	 REG_PIPELINE1_RST     : string     := "RST0";
	 REG_PIPELINE2_CLK     : string     := "NONE";
	 REG_PIPELINE2_CE      : string     := "CE0";
	 REG_PIPELINE2_RST     : string     := "RST0";
	 REG_PIPELINE3_CLK     : string     := "NONE";
	 REG_PIPELINE3_CE      : string     := "CE0";
	 REG_PIPELINE3_RST     : string     := "RST0";
	 REG_OUTPUT_CLK       : string     := "NONE";
	 REG_OUTPUT_CE        : string     := "CE0";
	 REG_OUTPUT_RST       : string     := "RST0";
	 REG_SIGNEDA_0_CLK   : string     := "NONE";
	 REG_SIGNEDA_0_CE    : string     := "CE0";
	 REG_SIGNEDA_0_RST   : string     := "RST0";
	 REG_SIGNEDA_1_CLK   : string     := "NONE";
	 REG_SIGNEDA_1_CE    : string     := "CE0";
	 REG_SIGNEDA_1_RST   : string     := "RST0";
         REG_SIGNEDB_0_CLK   : string     := "NONE";
         REG_SIGNEDB_0_CE    : string     := "CE0";
         REG_SIGNEDB_0_RST   : string     := "RST0";
         REG_SIGNEDB_1_CLK   : string     := "NONE";
         REG_SIGNEDB_1_CE    : string     := "CE0";
         REG_SIGNEDB_1_RST   : string     := "RST0";
	 REG_ADDNSUB1_0_CLK    : string     := "NONE";
	 REG_ADDNSUB1_0_CE     : string     := "CE0";
	 REG_ADDNSUB1_0_RST    : string     := "RST0";
	 REG_ADDNSUB1_1_CLK    : string     := "NONE";
	 REG_ADDNSUB1_1_CE     : string     := "CE0";
	 REG_ADDNSUB1_1_RST    : string     := "RST0";
	 REG_ADDNSUB3_0_CLK    : string     := "NONE";
	 REG_ADDNSUB3_0_CE     : string     := "CE0";
	 REG_ADDNSUB3_0_RST    : string     := "RST0";
	 REG_ADDNSUB3_1_CLK    : string     := "NONE";
	 REG_ADDNSUB3_1_CE     : string     := "CE0";
	 REG_ADDNSUB3_1_RST    : string     := "RST0";
	 GSR                  : string     := "ENABLED");
  port (
        A017 : in STD_ULOGIC;
        A016 : in STD_ULOGIC;
        A015 : in STD_ULOGIC;
        A014 : in STD_ULOGIC;
        A013 : in STD_ULOGIC;
        A012 : in STD_ULOGIC;
        A011 : in STD_ULOGIC;
        A010 : in STD_ULOGIC;
        A09 : in STD_ULOGIC;
        A08 : in STD_ULOGIC;
        A07 : in STD_ULOGIC;
        A06 : in STD_ULOGIC;
        A05 : in STD_ULOGIC;
        A04 : in STD_ULOGIC;
        A03 : in STD_ULOGIC;
        A02 : in STD_ULOGIC;
        A01 : in STD_ULOGIC;
        A00 : in STD_ULOGIC;

        A117 : in STD_ULOGIC;
        A116 : in STD_ULOGIC;
        A115 : in STD_ULOGIC;
        A114 : in STD_ULOGIC;
        A113 : in STD_ULOGIC;
        A112 : in STD_ULOGIC;
        A111 : in STD_ULOGIC;
        A110 : in STD_ULOGIC;
        A19 : in STD_ULOGIC;
        A18 : in STD_ULOGIC;
        A17 : in STD_ULOGIC;
        A16 : in STD_ULOGIC;
        A15 : in STD_ULOGIC;
        A14 : in STD_ULOGIC;
        A13 : in STD_ULOGIC;
        A12 : in STD_ULOGIC;
        A11 : in STD_ULOGIC;
        A10 : in STD_ULOGIC;

        A217 : in STD_ULOGIC;
        A216 : in STD_ULOGIC;
        A215 : in STD_ULOGIC;
        A214 : in STD_ULOGIC;
        A213 : in STD_ULOGIC;
        A212 : in STD_ULOGIC;
        A211 : in STD_ULOGIC;
        A210 : in STD_ULOGIC;
        A29 : in STD_ULOGIC;
        A28 : in STD_ULOGIC;
        A27 : in STD_ULOGIC;
        A26 : in STD_ULOGIC;
        A25 : in STD_ULOGIC;
        A24 : in STD_ULOGIC;
        A23 : in STD_ULOGIC;
        A22 : in STD_ULOGIC;
        A21 : in STD_ULOGIC;
        A20 : in STD_ULOGIC;

        A317 : in STD_ULOGIC;
        A316 : in STD_ULOGIC;
        A315 : in STD_ULOGIC;
        A314 : in STD_ULOGIC;
        A313 : in STD_ULOGIC;
        A312 : in STD_ULOGIC;
        A311 : in STD_ULOGIC;
        A310 : in STD_ULOGIC;
        A39 : in STD_ULOGIC;
        A38 : in STD_ULOGIC;
        A37 : in STD_ULOGIC;
        A36 : in STD_ULOGIC;
        A35 : in STD_ULOGIC;
        A34 : in STD_ULOGIC;
        A33 : in STD_ULOGIC;
        A32 : in STD_ULOGIC;
        A31 : in STD_ULOGIC;
        A30 : in STD_ULOGIC;

        SRIA17 : in STD_ULOGIC;
        SRIA16 : in STD_ULOGIC;
        SRIA15 : in STD_ULOGIC;
        SRIA14 : in STD_ULOGIC;
        SRIA13 : in STD_ULOGIC;
        SRIA12 : in STD_ULOGIC;
        SRIA11 : in STD_ULOGIC;
        SRIA10 : in STD_ULOGIC;
        SRIA9 : in STD_ULOGIC;
        SRIA8 : in STD_ULOGIC;
        SRIA7 : in STD_ULOGIC;
        SRIA6 : in STD_ULOGIC;
        SRIA5 : in STD_ULOGIC;
        SRIA4 : in STD_ULOGIC;
        SRIA3 : in STD_ULOGIC;
        SRIA2 : in STD_ULOGIC;
        SRIA1 : in STD_ULOGIC;
        SRIA0 : in STD_ULOGIC;

        B017 : in STD_ULOGIC;
        B016 : in STD_ULOGIC;
        B015 : in STD_ULOGIC;
        B014 : in STD_ULOGIC;
        B013 : in STD_ULOGIC;
        B012 : in STD_ULOGIC;
        B011 : in STD_ULOGIC;
        B010 : in STD_ULOGIC;
        B09 : in STD_ULOGIC;
        B08 : in STD_ULOGIC;
        B07 : in STD_ULOGIC;
        B06 : in STD_ULOGIC;
        B05 : in STD_ULOGIC;
        B04 : in STD_ULOGIC;
        B03 : in STD_ULOGIC;
        B02 : in STD_ULOGIC;
        B01 : in STD_ULOGIC;
        B00 : in STD_ULOGIC;

        B117 : in STD_ULOGIC;
        B116 : in STD_ULOGIC;
        B115 : in STD_ULOGIC;
        B114 : in STD_ULOGIC;
        B113 : in STD_ULOGIC;
        B112 : in STD_ULOGIC;
        B111 : in STD_ULOGIC;
        B110 : in STD_ULOGIC;
        B19 : in STD_ULOGIC;
        B18 : in STD_ULOGIC;
        B17 : in STD_ULOGIC;
        B16 : in STD_ULOGIC;
        B15 : in STD_ULOGIC;
        B14 : in STD_ULOGIC;
        B13 : in STD_ULOGIC;
        B12 : in STD_ULOGIC;
        B11 : in STD_ULOGIC;
        B10 : in STD_ULOGIC;

        B217 : in STD_ULOGIC;
        B216 : in STD_ULOGIC;
        B215 : in STD_ULOGIC;
        B214 : in STD_ULOGIC;
        B213 : in STD_ULOGIC;
        B212 : in STD_ULOGIC;
        B211 : in STD_ULOGIC;
        B210 : in STD_ULOGIC;
        B29 : in STD_ULOGIC;
        B28 : in STD_ULOGIC;
        B27 : in STD_ULOGIC;
        B26 : in STD_ULOGIC;
        B25 : in STD_ULOGIC;
        B24 : in STD_ULOGIC;
        B23 : in STD_ULOGIC;
        B22 : in STD_ULOGIC;
        B21 : in STD_ULOGIC;
        B20 : in STD_ULOGIC;

        B317 : in STD_ULOGIC;
        B316 : in STD_ULOGIC;
        B315 : in STD_ULOGIC;
        B314 : in STD_ULOGIC;
        B313 : in STD_ULOGIC;
        B312 : in STD_ULOGIC;
        B311 : in STD_ULOGIC;
        B310 : in STD_ULOGIC;
        B39 : in STD_ULOGIC;
        B38 : in STD_ULOGIC;
        B37 : in STD_ULOGIC;
        B36 : in STD_ULOGIC;
        B35 : in STD_ULOGIC;
        B34 : in STD_ULOGIC;
        B33 : in STD_ULOGIC;
        B32 : in STD_ULOGIC;
        B31 : in STD_ULOGIC;
        B30 : in STD_ULOGIC;

        SRIB17 : in STD_ULOGIC;
        SRIB16 : in STD_ULOGIC;
        SRIB15 : in STD_ULOGIC;
        SRIB14 : in STD_ULOGIC;
        SRIB13 : in STD_ULOGIC;
        SRIB12 : in STD_ULOGIC;
        SRIB11 : in STD_ULOGIC;
        SRIB10 : in STD_ULOGIC;
        SRIB9 : in STD_ULOGIC;
        SRIB8 : in STD_ULOGIC;
        SRIB7 : in STD_ULOGIC;
        SRIB6 : in STD_ULOGIC;
        SRIB5 : in STD_ULOGIC;
        SRIB4 : in STD_ULOGIC;
        SRIB3 : in STD_ULOGIC;
        SRIB2 : in STD_ULOGIC;
        SRIB1 : in STD_ULOGIC;
        SRIB0 : in STD_ULOGIC;

        SIGNEDA : in STD_ULOGIC;
        SIGNEDB : in STD_ULOGIC;
        SOURCEA3 : in STD_ULOGIC;
        SOURCEA2 : in STD_ULOGIC;
        SOURCEA1 : in STD_ULOGIC;
        SOURCEA0 : in STD_ULOGIC;
        SOURCEB3 : in STD_ULOGIC;
        SOURCEB2 : in STD_ULOGIC;
        SOURCEB1 : in STD_ULOGIC;
        SOURCEB0 : in STD_ULOGIC;
        ADDNSUB3  : in STD_ULOGIC;
        ADDNSUB1  : in STD_ULOGIC;

        CE3 : in STD_ULOGIC;
        CE2 : in STD_ULOGIC;
        CE1 : in STD_ULOGIC;
        CE0 : in STD_ULOGIC;

        CLK3 : in STD_ULOGIC;
        CLK2 : in STD_ULOGIC;
        CLK1 : in STD_ULOGIC;
        CLK0 : in STD_ULOGIC;

        RST3 : in STD_ULOGIC;
        RST2 : in STD_ULOGIC;
        RST1 : in STD_ULOGIC;
        RST0 : in STD_ULOGIC;

        SROA17 : out STD_ULOGIC;
        SROA16 : out STD_ULOGIC;
        SROA15 : out STD_ULOGIC;
        SROA14 : out STD_ULOGIC;
        SROA13 : out STD_ULOGIC;
        SROA12 : out STD_ULOGIC;
        SROA11 : out STD_ULOGIC;
        SROA10 : out STD_ULOGIC;
        SROA9 : out STD_ULOGIC;
        SROA8 : out STD_ULOGIC;
        SROA7 : out STD_ULOGIC;
        SROA6 : out STD_ULOGIC;
        SROA5 : out STD_ULOGIC;
        SROA4 : out STD_ULOGIC;
        SROA3 : out STD_ULOGIC;
        SROA2 : out STD_ULOGIC;
        SROA1 : out STD_ULOGIC;
        SROA0 : out STD_ULOGIC;

        SROB17 : out STD_ULOGIC;
        SROB16 : out STD_ULOGIC;
        SROB15 : out STD_ULOGIC;
        SROB14 : out STD_ULOGIC;
        SROB13 : out STD_ULOGIC;
        SROB12 : out STD_ULOGIC;
        SROB11 : out STD_ULOGIC;
        SROB10 : out STD_ULOGIC;
        SROB9 : out STD_ULOGIC;
        SROB8 : out STD_ULOGIC;
        SROB7 : out STD_ULOGIC;
        SROB6 : out STD_ULOGIC;
        SROB5 : out STD_ULOGIC;
        SROB4 : out STD_ULOGIC;
        SROB3 : out STD_ULOGIC;
        SROB2 : out STD_ULOGIC;
        SROB1 : out STD_ULOGIC;
        SROB0 : out STD_ULOGIC;

        SUM37 : out STD_ULOGIC;
        SUM36 : out STD_ULOGIC;
        SUM35 : out STD_ULOGIC;
        SUM34 : out STD_ULOGIC;
        SUM33 : out STD_ULOGIC;
        SUM32 : out STD_ULOGIC;
        SUM31 : out STD_ULOGIC;
        SUM30 : out STD_ULOGIC;
        SUM29 : out STD_ULOGIC;
        SUM28 : out STD_ULOGIC;
        SUM27 : out STD_ULOGIC;
        SUM26 : out STD_ULOGIC;
        SUM25 : out STD_ULOGIC;
        SUM24 : out STD_ULOGIC;
        SUM23 : out STD_ULOGIC;
        SUM22 : out STD_ULOGIC;
        SUM21 : out STD_ULOGIC;
        SUM20 : out STD_ULOGIC;
        SUM19 : out STD_ULOGIC;
        SUM18 : out STD_ULOGIC;
        SUM17 : out STD_ULOGIC;
        SUM16 : out STD_ULOGIC;
        SUM15 : out STD_ULOGIC;
        SUM14 : out STD_ULOGIC;
        SUM13 : out STD_ULOGIC;
        SUM12 : out STD_ULOGIC;
        SUM11 : out STD_ULOGIC;
        SUM10 : out STD_ULOGIC;
        SUM9 : out STD_ULOGIC;
        SUM8 : out STD_ULOGIC;
        SUM7 : out STD_ULOGIC;
        SUM6 : out STD_ULOGIC;
        SUM5 : out STD_ULOGIC;
        SUM4 : out STD_ULOGIC;
        SUM3 : out STD_ULOGIC;
        SUM2 : out STD_ULOGIC;
        SUM1 : out STD_ULOGIC;
        SUM0 : out STD_ULOGIC
       ); 
  end component;

  component MULT18X18MACB
  GENERIC(
	 REG_INPUTA_CLK       : string     := "NONE";
	 REG_INPUTA_CE        : string     := "CE0";
	 REG_INPUTA_RST       : string     := "RST0";
	 REG_INPUTB_CLK       : string     := "NONE";
	 REG_INPUTB_CE        : string     := "CE0";
	 REG_INPUTB_RST       : string     := "RST0";
	 REG_PIPELINE_CLK     : string     := "NONE";
	 REG_PIPELINE_CE      : string     := "CE0";
	 REG_PIPELINE_RST     : string     := "RST0";
	 REG_OUTPUT_CLK       : string     := "NONE";
	 REG_OUTPUT_CE        : string     := "CE0";
	 REG_OUTPUT_RST       : string     := "RST0";
	 REG_SIGNEDA_0_CLK   : string     := "NONE";
	 REG_SIGNEDA_0_CE    : string     := "CE0";
	 REG_SIGNEDA_0_RST   : string     := "RST0";
	 REG_SIGNEDA_1_CLK   : string     := "NONE";
	 REG_SIGNEDA_1_CE    : string     := "CE0";
	 REG_SIGNEDA_1_RST   : string     := "RST0";
         REG_SIGNEDB_0_CLK   : string     := "NONE";
         REG_SIGNEDB_0_CE    : string     := "CE0";
         REG_SIGNEDB_0_RST   : string     := "RST0";
         REG_SIGNEDB_1_CLK   : string     := "NONE";
         REG_SIGNEDB_1_CE    : string     := "CE0";
         REG_SIGNEDB_1_RST   : string     := "RST0";
	 REG_ACCUMSLOAD_0_CLK : string     := "NONE";
	 REG_ACCUMSLOAD_0_CE  : string     := "CE0";
	 REG_ACCUMSLOAD_0_RST : string     := "RST0";
	 REG_ACCUMSLOAD_1_CLK : string     := "NONE";
	 REG_ACCUMSLOAD_1_CE  : string     := "CE0";
	 REG_ACCUMSLOAD_1_RST : string     := "RST0";
	 REG_ADDNSUB_0_CLK    : string     := "NONE";
	 REG_ADDNSUB_0_CE     : string     := "CE0";
	 REG_ADDNSUB_0_RST    : string     := "RST0";
	 REG_ADDNSUB_1_CLK    : string     := "NONE";
	 REG_ADDNSUB_1_CE     : string     := "CE0";
	 REG_ADDNSUB_1_RST    : string     := "RST0";
	 GSR                  : string     := "ENABLED");
  port (
        A17 : in STD_ULOGIC;
        A16 : in STD_ULOGIC;
        A15 : in STD_ULOGIC;
        A14 : in STD_ULOGIC;
        A13 : in STD_ULOGIC;
        A12 : in STD_ULOGIC;
        A11 : in STD_ULOGIC;
        A10 : in STD_ULOGIC;
        A9 : in STD_ULOGIC;
        A8 : in STD_ULOGIC;
        A7 : in STD_ULOGIC;
        A6 : in STD_ULOGIC;
        A5 : in STD_ULOGIC;
        A4 : in STD_ULOGIC;
        A3 : in STD_ULOGIC;
        A2 : in STD_ULOGIC;
        A1 : in STD_ULOGIC;
        A0 : in STD_ULOGIC;

        SRIA17 : in STD_ULOGIC;
        SRIA16 : in STD_ULOGIC;
        SRIA15 : in STD_ULOGIC;
        SRIA14 : in STD_ULOGIC;
        SRIA13 : in STD_ULOGIC;
        SRIA12 : in STD_ULOGIC;
        SRIA11 : in STD_ULOGIC;
        SRIA10 : in STD_ULOGIC;
        SRIA9 : in STD_ULOGIC;
        SRIA8 : in STD_ULOGIC;
        SRIA7 : in STD_ULOGIC;
        SRIA6 : in STD_ULOGIC;
        SRIA5 : in STD_ULOGIC;
        SRIA4 : in STD_ULOGIC;
        SRIA3 : in STD_ULOGIC;
        SRIA2 : in STD_ULOGIC;
        SRIA1 : in STD_ULOGIC;
        SRIA0 : in STD_ULOGIC;

        B17 : in STD_ULOGIC;
        B16 : in STD_ULOGIC;
        B15 : in STD_ULOGIC;
        B14 : in STD_ULOGIC;
        B13 : in STD_ULOGIC;
        B12 : in STD_ULOGIC;
        B11 : in STD_ULOGIC;
        B10 : in STD_ULOGIC;
        B9 : in STD_ULOGIC;
        B8 : in STD_ULOGIC;
        B7 : in STD_ULOGIC;
        B6 : in STD_ULOGIC;
        B5 : in STD_ULOGIC;
        B4 : in STD_ULOGIC;
        B3 : in STD_ULOGIC;
        B2 : in STD_ULOGIC;
        B1 : in STD_ULOGIC;
        B0 : in STD_ULOGIC;

        SRIB17 : in STD_ULOGIC;
        SRIB16 : in STD_ULOGIC;
        SRIB15 : in STD_ULOGIC;
        SRIB14 : in STD_ULOGIC;
        SRIB13 : in STD_ULOGIC;
        SRIB12 : in STD_ULOGIC;
        SRIB11 : in STD_ULOGIC;
        SRIB10 : in STD_ULOGIC;
        SRIB9 : in STD_ULOGIC;
        SRIB8 : in STD_ULOGIC;
        SRIB7 : in STD_ULOGIC;
        SRIB6 : in STD_ULOGIC;
        SRIB5 : in STD_ULOGIC;
        SRIB4 : in STD_ULOGIC;
        SRIB3 : in STD_ULOGIC;
        SRIB2 : in STD_ULOGIC;
        SRIB1 : in STD_ULOGIC;
        SRIB0 : in STD_ULOGIC;

        LD51    : in STD_ULOGIC;
        LD50    : in STD_ULOGIC;
        LD49    : in STD_ULOGIC;
        LD48    : in STD_ULOGIC;
        LD47    : in STD_ULOGIC;
        LD46    : in STD_ULOGIC;
        LD45    : in STD_ULOGIC;
        LD44    : in STD_ULOGIC;
        LD43    : in STD_ULOGIC;
        LD42    : in STD_ULOGIC;
        LD41    : in STD_ULOGIC;
        LD40    : in STD_ULOGIC;
        LD39    : in STD_ULOGIC;
        LD38    : in STD_ULOGIC;
        LD37    : in STD_ULOGIC;
        LD36    : in STD_ULOGIC;
        LD35    : in STD_ULOGIC;
        LD34    : in STD_ULOGIC;
        LD33    : in STD_ULOGIC;
        LD32    : in STD_ULOGIC;
        LD31    : in STD_ULOGIC;
        LD30    : in STD_ULOGIC;
        LD29    : in STD_ULOGIC;
        LD28    : in STD_ULOGIC;
        LD27    : in STD_ULOGIC;
        LD26    : in STD_ULOGIC;
        LD25    : in STD_ULOGIC;
        LD24    : in STD_ULOGIC;
        LD23    : in STD_ULOGIC;
        LD22    : in STD_ULOGIC;
        LD21    : in STD_ULOGIC;
        LD20    : in STD_ULOGIC;
        LD19    : in STD_ULOGIC;
        LD18    : in STD_ULOGIC;
        LD17    : in STD_ULOGIC;
        LD16    : in STD_ULOGIC;
        LD15    : in STD_ULOGIC;
        LD14    : in STD_ULOGIC;
        LD13    : in STD_ULOGIC;
        LD12    : in STD_ULOGIC;
        LD11    : in STD_ULOGIC;
        LD10    : in STD_ULOGIC;
        LD9    : in STD_ULOGIC;
        LD8    : in STD_ULOGIC;
        LD7    : in STD_ULOGIC;
        LD6    : in STD_ULOGIC;
        LD5    : in STD_ULOGIC;
        LD4    : in STD_ULOGIC;
        LD3    : in STD_ULOGIC;
        LD2    : in STD_ULOGIC;
        LD1    : in STD_ULOGIC;
        LD0    : in STD_ULOGIC;

        SIGNEDA : in STD_ULOGIC;
        SIGNEDB : in STD_ULOGIC;
        SOURCEA : in STD_ULOGIC;
        SOURCEB : in STD_ULOGIC;
        ACCUMSLOAD : in STD_ULOGIC;
        ADDNSUB : in STD_ULOGIC;

        CE3 : in STD_ULOGIC;
        CE2 : in STD_ULOGIC;
        CE1 : in STD_ULOGIC;
        CE0 : in STD_ULOGIC;

        CLK3 : in STD_ULOGIC;
        CLK2 : in STD_ULOGIC;
        CLK1 : in STD_ULOGIC;
        CLK0 : in STD_ULOGIC;

        RST3 : in STD_ULOGIC;
        RST2 : in STD_ULOGIC;
        RST1 : in STD_ULOGIC;
        RST0 : in STD_ULOGIC;

        SROA17 : out STD_ULOGIC;
        SROA16 : out STD_ULOGIC;
        SROA15 : out STD_ULOGIC;
        SROA14 : out STD_ULOGIC;
        SROA13 : out STD_ULOGIC;
        SROA12 : out STD_ULOGIC;
        SROA11 : out STD_ULOGIC;
        SROA10 : out STD_ULOGIC;
        SROA9 : out STD_ULOGIC;
        SROA8 : out STD_ULOGIC;
        SROA7 : out STD_ULOGIC;
        SROA6 : out STD_ULOGIC;
        SROA5 : out STD_ULOGIC;
        SROA4 : out STD_ULOGIC;
        SROA3 : out STD_ULOGIC;
        SROA2 : out STD_ULOGIC;
        SROA1 : out STD_ULOGIC;
        SROA0 : out STD_ULOGIC;

        SROB17 : out STD_ULOGIC;
        SROB16 : out STD_ULOGIC;
        SROB15 : out STD_ULOGIC;
        SROB14 : out STD_ULOGIC;
        SROB13 : out STD_ULOGIC;
        SROB12 : out STD_ULOGIC;
        SROB11 : out STD_ULOGIC;
        SROB10 : out STD_ULOGIC;
        SROB9 : out STD_ULOGIC;
        SROB8 : out STD_ULOGIC;
        SROB7 : out STD_ULOGIC;
        SROB6 : out STD_ULOGIC;
        SROB5 : out STD_ULOGIC;
        SROB4 : out STD_ULOGIC;
        SROB3 : out STD_ULOGIC;
        SROB2 : out STD_ULOGIC;
        SROB1 : out STD_ULOGIC;
        SROB0 : out STD_ULOGIC;

        ACCUM51 : out STD_ULOGIC;
        ACCUM50 : out STD_ULOGIC;
        ACCUM49 : out STD_ULOGIC;
        ACCUM48 : out STD_ULOGIC;
        ACCUM47 : out STD_ULOGIC;
        ACCUM46 : out STD_ULOGIC;
        ACCUM45 : out STD_ULOGIC;
        ACCUM44 : out STD_ULOGIC;
        ACCUM43 : out STD_ULOGIC;
        ACCUM42 : out STD_ULOGIC;
        ACCUM41 : out STD_ULOGIC;
        ACCUM40 : out STD_ULOGIC;
        ACCUM39 : out STD_ULOGIC;
        ACCUM38 : out STD_ULOGIC;
        ACCUM37 : out STD_ULOGIC;
        ACCUM36 : out STD_ULOGIC;
        ACCUM35 : out STD_ULOGIC;
        ACCUM34 : out STD_ULOGIC;
        ACCUM33 : out STD_ULOGIC;
        ACCUM32 : out STD_ULOGIC;
        ACCUM31 : out STD_ULOGIC;
        ACCUM30 : out STD_ULOGIC;
        ACCUM29 : out STD_ULOGIC;
        ACCUM28 : out STD_ULOGIC;
        ACCUM27 : out STD_ULOGIC;
        ACCUM26 : out STD_ULOGIC;
        ACCUM25 : out STD_ULOGIC;
        ACCUM24 : out STD_ULOGIC;
        ACCUM23 : out STD_ULOGIC;
        ACCUM22 : out STD_ULOGIC;
        ACCUM21 : out STD_ULOGIC;
        ACCUM20 : out STD_ULOGIC;
        ACCUM19 : out STD_ULOGIC;
        ACCUM18 : out STD_ULOGIC;
        ACCUM17 : out STD_ULOGIC;
        ACCUM16 : out STD_ULOGIC;
        ACCUM15 : out STD_ULOGIC;
        ACCUM14 : out STD_ULOGIC;
        ACCUM13 : out STD_ULOGIC;
        ACCUM12 : out STD_ULOGIC;
        ACCUM11 : out STD_ULOGIC;
        ACCUM10 : out STD_ULOGIC;
        ACCUM9 : out STD_ULOGIC;
        ACCUM8 : out STD_ULOGIC;
        ACCUM7 : out STD_ULOGIC;
        ACCUM6 : out STD_ULOGIC;
        ACCUM5 : out STD_ULOGIC;
        ACCUM4 : out STD_ULOGIC;
        ACCUM3 : out STD_ULOGIC;
        ACCUM2 : out STD_ULOGIC;
        ACCUM1 : out STD_ULOGIC;
        ACCUM0 : out STD_ULOGIC;
        OVERFLOW : out STD_ULOGIC
       ); 
  end component;

  component MULT36X36B
  GENERIC(
	 REG_INPUTA_CLK       : string     := "NONE";
	 REG_INPUTA_CE        : string     := "CE0";
	 REG_INPUTA_RST       : string     := "RST0";
	 REG_INPUTB_CLK       : string     := "NONE";
	 REG_INPUTB_CE        : string     := "CE0";
	 REG_INPUTB_RST       : string     := "RST0";
	 REG_PIPELINE_CLK     : string     := "NONE";
	 REG_PIPELINE_CE      : string     := "CE0";
	 REG_PIPELINE_RST     : string     := "RST0";
	 REG_OUTPUT_CLK       : string     := "NONE";
	 REG_OUTPUT_CE        : string     := "CE0";
	 REG_OUTPUT_RST       : string     := "RST0";
	 REG_SIGNEDA_0_CLK   : string     := "NONE";
	 REG_SIGNEDA_0_CE    : string     := "CE0";
	 REG_SIGNEDA_0_RST   : string     := "RST0";
	 REG_SIGNEDA_1_CLK   : string     := "NONE";
	 REG_SIGNEDA_1_CE    : string     := "CE0";
	 REG_SIGNEDA_1_RST   : string     := "RST0";
         REG_SIGNEDB_0_CLK   : string     := "NONE";
         REG_SIGNEDB_0_CE    : string     := "CE0";
         REG_SIGNEDB_0_RST   : string     := "RST0";
         REG_SIGNEDB_1_CLK   : string     := "NONE";
         REG_SIGNEDB_1_CE    : string     := "CE0";
         REG_SIGNEDB_1_RST   : string     := "RST0";
	 GSR                  : string     := "ENABLED");
  port (
        A35 : in STD_ULOGIC;
        A34 : in STD_ULOGIC;
        A33 : in STD_ULOGIC;
        A32 : in STD_ULOGIC;
        A31 : in STD_ULOGIC;
        A30 : in STD_ULOGIC;
        A29 : in STD_ULOGIC;
        A28 : in STD_ULOGIC;
        A27 : in STD_ULOGIC;
        A26 : in STD_ULOGIC;
        A25 : in STD_ULOGIC;
        A24 : in STD_ULOGIC;
        A23 : in STD_ULOGIC;
        A22 : in STD_ULOGIC;
        A21 : in STD_ULOGIC;
        A20 : in STD_ULOGIC;
        A19 : in STD_ULOGIC;
        A18 : in STD_ULOGIC;
        A17 : in STD_ULOGIC;
        A16 : in STD_ULOGIC;
        A15 : in STD_ULOGIC;
        A14 : in STD_ULOGIC;
        A13 : in STD_ULOGIC;
        A12 : in STD_ULOGIC;
        A11 : in STD_ULOGIC;
        A10 : in STD_ULOGIC;
        A9 : in STD_ULOGIC;
        A8 : in STD_ULOGIC;
        A7 : in STD_ULOGIC;
        A6 : in STD_ULOGIC;
        A5 : in STD_ULOGIC;
        A4 : in STD_ULOGIC;
        A3 : in STD_ULOGIC;
        A2 : in STD_ULOGIC;
        A1 : in STD_ULOGIC;
        A0 : in STD_ULOGIC;

        B35 : in STD_ULOGIC;
        B34 : in STD_ULOGIC;
        B33 : in STD_ULOGIC;
        B32 : in STD_ULOGIC;
        B31 : in STD_ULOGIC;
        B30 : in STD_ULOGIC;
        B29 : in STD_ULOGIC;
        B28 : in STD_ULOGIC;
        B27 : in STD_ULOGIC;
        B26 : in STD_ULOGIC;
        B25 : in STD_ULOGIC;
        B24 : in STD_ULOGIC;
        B23 : in STD_ULOGIC;
        B22 : in STD_ULOGIC;
        B21 : in STD_ULOGIC;
        B20 : in STD_ULOGIC;
        B19 : in STD_ULOGIC;
        B18 : in STD_ULOGIC;
        B17 : in STD_ULOGIC;
        B16 : in STD_ULOGIC;
        B15 : in STD_ULOGIC;
        B14 : in STD_ULOGIC;
        B13 : in STD_ULOGIC;
        B12 : in STD_ULOGIC;
        B11 : in STD_ULOGIC;
        B10 : in STD_ULOGIC;
        B9 : in STD_ULOGIC;
        B8 : in STD_ULOGIC;
        B7 : in STD_ULOGIC;
        B6 : in STD_ULOGIC;
        B5 : in STD_ULOGIC;
        B4 : in STD_ULOGIC;
        B3 : in STD_ULOGIC;
        B2 : in STD_ULOGIC;
        B1 : in STD_ULOGIC;
        B0 : in STD_ULOGIC;

        SIGNEDA : in STD_ULOGIC;
        SIGNEDB : in STD_ULOGIC;

        CE3 : in STD_ULOGIC;
        CE2 : in STD_ULOGIC;
        CE1 : in STD_ULOGIC;
        CE0 : in STD_ULOGIC;

        CLK3 : in STD_ULOGIC;
        CLK2 : in STD_ULOGIC;
        CLK1 : in STD_ULOGIC;
        CLK0 : in STD_ULOGIC;

        RST3 : in STD_ULOGIC;
        RST2 : in STD_ULOGIC;
        RST1 : in STD_ULOGIC;
        RST0 : in STD_ULOGIC;

        P71 : out STD_ULOGIC;
        P70 : out STD_ULOGIC;
        P69 : out STD_ULOGIC;
        P68 : out STD_ULOGIC;
        P67 : out STD_ULOGIC;
        P66 : out STD_ULOGIC;
        P65 : out STD_ULOGIC;
        P64 : out STD_ULOGIC;
        P63 : out STD_ULOGIC;
        P62 : out STD_ULOGIC;
        P61 : out STD_ULOGIC;
        P60 : out STD_ULOGIC;
        P59 : out STD_ULOGIC;
        P58 : out STD_ULOGIC;
        P57 : out STD_ULOGIC;
        P56 : out STD_ULOGIC;
        P55 : out STD_ULOGIC;
        P54 : out STD_ULOGIC;
        P53 : out STD_ULOGIC;
        P52 : out STD_ULOGIC;
        P51 : out STD_ULOGIC;
        P50 : out STD_ULOGIC;
        P49 : out STD_ULOGIC;
        P48 : out STD_ULOGIC;
        P47 : out STD_ULOGIC;
        P46 : out STD_ULOGIC;
        P45 : out STD_ULOGIC;
        P44 : out STD_ULOGIC;
        P43 : out STD_ULOGIC;
        P42 : out STD_ULOGIC;
        P41 : out STD_ULOGIC;
        P40 : out STD_ULOGIC;
        P39 : out STD_ULOGIC;
        P38 : out STD_ULOGIC;
        P37 : out STD_ULOGIC;
        P36 : out STD_ULOGIC;
        P35 : out STD_ULOGIC;
        P34 : out STD_ULOGIC;
        P33 : out STD_ULOGIC;
        P32 : out STD_ULOGIC;
        P31 : out STD_ULOGIC;
        P30 : out STD_ULOGIC;
        P29 : out STD_ULOGIC;
        P28 : out STD_ULOGIC;
        P27 : out STD_ULOGIC;
        P26 : out STD_ULOGIC;
        P25 : out STD_ULOGIC;
        P24 : out STD_ULOGIC;
        P23 : out STD_ULOGIC;
        P22 : out STD_ULOGIC;
        P21 : out STD_ULOGIC;
        P20 : out STD_ULOGIC;
        P19 : out STD_ULOGIC;
        P18 : out STD_ULOGIC;
        P17 : out STD_ULOGIC;
        P16 : out STD_ULOGIC;
        P15 : out STD_ULOGIC;
        P14 : out STD_ULOGIC;
        P13 : out STD_ULOGIC;
        P12 : out STD_ULOGIC;
        P11 : out STD_ULOGIC;
        P10 : out STD_ULOGIC;
        P9 : out STD_ULOGIC;
        P8 : out STD_ULOGIC;
        P7 : out STD_ULOGIC;
        P6 : out STD_ULOGIC;
        P5 : out STD_ULOGIC;
        P4 : out STD_ULOGIC;
        P3 : out STD_ULOGIC;
        P2 : out STD_ULOGIC;
        P1 : out STD_ULOGIC;
        P0 : out STD_ULOGIC
       ); 
  end component;
--
  component MULT9X9B
  GENERIC(
         REG_INPUTA_CLK       : string     := "NONE";
         REG_INPUTA_CE        : string     := "CE0";
         REG_INPUTA_RST       : string     := "RST0";
         REG_INPUTB_CLK       : string     := "NONE";
         REG_INPUTB_CE        : string     := "CE0";
         REG_INPUTB_RST       : string     := "RST0";
         REG_PIPELINE_CLK     : string     := "NONE";
         REG_PIPELINE_CE      : string     := "CE0";
         REG_PIPELINE_RST     : string     := "RST0";
         REG_OUTPUT_CLK       : string     := "NONE";
         REG_OUTPUT_CE        : string     := "CE0";
         REG_OUTPUT_RST       : string     := "RST0";
         REG_SIGNEDA_CLK      : string     := "NONE";
         REG_SIGNEDA_CE       : string     := "CE0";
         REG_SIGNEDA_RST      : string     := "RST0";
         REG_SIGNEDB_CLK      : string     := "NONE";
         REG_SIGNEDB_CE       : string     := "CE0";
         REG_SIGNEDB_RST      : string     := "RST0";
         GSR                  : string     := "ENABLED");
  port (
        A8 : in STD_ULOGIC;
        A7 : in STD_ULOGIC;
        A6 : in STD_ULOGIC;
        A5 : in STD_ULOGIC;
        A4 : in STD_ULOGIC;
        A3 : in STD_ULOGIC;
        A2 : in STD_ULOGIC;
        A1 : in STD_ULOGIC;
        A0 : in STD_ULOGIC;

        SRIA8 : in STD_ULOGIC;
        SRIA7 : in STD_ULOGIC;
        SRIA6 : in STD_ULOGIC;
        SRIA5 : in STD_ULOGIC;
        SRIA4 : in STD_ULOGIC;
        SRIA3 : in STD_ULOGIC;
        SRIA2 : in STD_ULOGIC;
        SRIA1 : in STD_ULOGIC;
        SRIA0 : in STD_ULOGIC;

        B8 : in STD_ULOGIC;
        B7 : in STD_ULOGIC;
        B6 : in STD_ULOGIC;
        B5 : in STD_ULOGIC;
        B4 : in STD_ULOGIC;
        B3 : in STD_ULOGIC;
        B2 : in STD_ULOGIC;
        B1 : in STD_ULOGIC;
        B0 : in STD_ULOGIC;

        SRIB8 : in STD_ULOGIC;
        SRIB7 : in STD_ULOGIC;
        SRIB6 : in STD_ULOGIC;
        SRIB5 : in STD_ULOGIC;
        SRIB4 : in STD_ULOGIC;
        SRIB3 : in STD_ULOGIC;
        SRIB2 : in STD_ULOGIC;
        SRIB1 : in STD_ULOGIC;
        SRIB0 : in STD_ULOGIC;

        SIGNEDA : in STD_ULOGIC;
        SIGNEDB : in STD_ULOGIC;
        SOURCEA : in STD_ULOGIC;
        SOURCEB : in STD_ULOGIC;

        CE3 : in STD_ULOGIC;
        CE2 : in STD_ULOGIC;
        CE1 : in STD_ULOGIC;
        CE0 : in STD_ULOGIC;

        CLK3 : in STD_ULOGIC;
        CLK2 : in STD_ULOGIC;
        CLK1 : in STD_ULOGIC;
        CLK0 : in STD_ULOGIC;

        RST3 : in STD_ULOGIC;
        RST2 : in STD_ULOGIC;
        RST1 : in STD_ULOGIC;
        RST0 : in STD_ULOGIC;

        SROA8 : out STD_ULOGIC;
        SROA7 : out STD_ULOGIC;
        SROA6 : out STD_ULOGIC;
        SROA5 : out STD_ULOGIC;
        SROA4 : out STD_ULOGIC;
        SROA3 : out STD_ULOGIC;
        SROA2 : out STD_ULOGIC;
        SROA1 : out STD_ULOGIC;
        SROA0 : out STD_ULOGIC;

        SROB8 : out STD_ULOGIC;
        SROB7 : out STD_ULOGIC;
        SROB6 : out STD_ULOGIC;
        SROB5 : out STD_ULOGIC;
        SROB4 : out STD_ULOGIC;
        SROB3 : out STD_ULOGIC;
        SROB2 : out STD_ULOGIC;
        SROB1 : out STD_ULOGIC;
        SROB0 : out STD_ULOGIC;

        P17 : out STD_ULOGIC;
        P16 : out STD_ULOGIC;
        P15 : out STD_ULOGIC;
        P14 : out STD_ULOGIC;
        P13 : out STD_ULOGIC;
        P12 : out STD_ULOGIC;
        P11 : out STD_ULOGIC;
        P10 : out STD_ULOGIC;
        P9 : out STD_ULOGIC;
        P8 : out STD_ULOGIC;
        P7 : out STD_ULOGIC;
        P6 : out STD_ULOGIC;
        P5 : out STD_ULOGIC;
        P4 : out STD_ULOGIC;
        P3 : out STD_ULOGIC;
        P2 : out STD_ULOGIC;
        P1 : out STD_ULOGIC;
        P0 : out STD_ULOGIC
       );
  end component;

  component MULT9X9ADDSUBB
  GENERIC(
         REG_INPUTA0_CLK       : string     := "NONE";
         REG_INPUTA0_CE        : string     := "CE0";
         REG_INPUTA0_RST       : string     := "RST0";
         REG_INPUTA1_CLK       : string     := "NONE";
         REG_INPUTA1_CE        : string     := "CE0";
         REG_INPUTA1_RST       : string     := "RST0";
         REG_INPUTB0_CLK       : string     := "NONE";
         REG_INPUTB0_CE        : string     := "CE0";
         REG_INPUTB0_RST       : string     := "RST0";
         REG_INPUTB1_CLK       : string     := "NONE";
         REG_INPUTB1_CE        : string     := "CE0";
         REG_INPUTB1_RST       : string     := "RST0";
         REG_PIPELINE0_CLK     : string     := "NONE";
         REG_PIPELINE0_CE      : string     := "CE0";
         REG_PIPELINE0_RST     : string     := "RST0";
         REG_PIPELINE1_CLK     : string     := "NONE";
         REG_PIPELINE1_CE      : string     := "CE0";
         REG_PIPELINE1_RST     : string     := "RST0";
         REG_OUTPUT_CLK       : string     := "NONE";
         REG_OUTPUT_CE        : string     := "CE0";
         REG_OUTPUT_RST       : string     := "RST0";
         REG_SIGNEDA_0_CLK   : string     := "NONE";
         REG_SIGNEDA_0_CE    : string     := "CE0";
         REG_SIGNEDA_0_RST   : string     := "RST0";
         REG_SIGNEDA_1_CLK   : string     := "NONE";
         REG_SIGNEDA_1_CE    : string     := "CE0";
         REG_SIGNEDA_1_RST   : string     := "RST0";
         REG_SIGNEDB_0_CLK   : string     := "NONE";
         REG_SIGNEDB_0_CE    : string     := "CE0";
         REG_SIGNEDB_0_RST   : string     := "RST0";
         REG_SIGNEDB_1_CLK   : string     := "NONE";
         REG_SIGNEDB_1_CE    : string     := "CE0";
         REG_SIGNEDB_1_RST   : string     := "RST0";
         REG_ADDNSUB_0_CLK    : string     := "NONE";
         REG_ADDNSUB_0_CE     : string     := "CE0";
         REG_ADDNSUB_0_RST    : string     := "RST0";
         REG_ADDNSUB_1_CLK    : string     := "NONE";
         REG_ADDNSUB_1_CE     : string     := "CE0";
         REG_ADDNSUB_1_RST    : string     := "RST0";
         GSR                  : string     := "ENABLED");
  port (
        A08 : in STD_ULOGIC;
        A07 : in STD_ULOGIC;
        A06 : in STD_ULOGIC;
        A05 : in STD_ULOGIC;
        A04 : in STD_ULOGIC;
        A03 : in STD_ULOGIC;
        A02 : in STD_ULOGIC;
        A01 : in STD_ULOGIC;
        A00 : in STD_ULOGIC;

        A18 : in STD_ULOGIC;
        A17 : in STD_ULOGIC;
        A16 : in STD_ULOGIC;
        A15 : in STD_ULOGIC;
        A14 : in STD_ULOGIC;
        A13 : in STD_ULOGIC;
        A12 : in STD_ULOGIC;
        A11 : in STD_ULOGIC;
        A10 : in STD_ULOGIC;

        SRIA8 : in STD_ULOGIC;
        SRIA7 : in STD_ULOGIC;
        SRIA6 : in STD_ULOGIC;
        SRIA5 : in STD_ULOGIC;
        SRIA4 : in STD_ULOGIC;
        SRIA3 : in STD_ULOGIC;
        SRIA2 : in STD_ULOGIC;
        SRIA1 : in STD_ULOGIC;
        SRIA0 : in STD_ULOGIC;

        B08 : in STD_ULOGIC;
        B07 : in STD_ULOGIC;
        B06 : in STD_ULOGIC;
        B05 : in STD_ULOGIC;
        B04 : in STD_ULOGIC;
        B03 : in STD_ULOGIC;
        B02 : in STD_ULOGIC;
        B01 : in STD_ULOGIC;
        B00 : in STD_ULOGIC;

        B18 : in STD_ULOGIC;
        B17 : in STD_ULOGIC;
        B16 : in STD_ULOGIC;
        B15 : in STD_ULOGIC;
        B14 : in STD_ULOGIC;
        B13 : in STD_ULOGIC;
        B12 : in STD_ULOGIC;
        B11 : in STD_ULOGIC;
        B10 : in STD_ULOGIC;

        SRIB8 : in STD_ULOGIC;
        SRIB7 : in STD_ULOGIC;
        SRIB6 : in STD_ULOGIC;
        SRIB5 : in STD_ULOGIC;
        SRIB4 : in STD_ULOGIC;
        SRIB3 : in STD_ULOGIC;
        SRIB2 : in STD_ULOGIC;
        SRIB1 : in STD_ULOGIC;
        SRIB0 : in STD_ULOGIC;

        SIGNEDA : in STD_ULOGIC;
        SIGNEDB : in STD_ULOGIC;
        ADDNSUB  : in STD_ULOGIC;
        SOURCEA1 : in STD_ULOGIC;
        SOURCEA0 : in STD_ULOGIC;
        SOURCEB1 : in STD_ULOGIC;
        SOURCEB0 : in STD_ULOGIC;

        CE3 : in STD_ULOGIC;
        CE2 : in STD_ULOGIC;
        CE1 : in STD_ULOGIC;
        CE0 : in STD_ULOGIC;

        CLK3 : in STD_ULOGIC;
        CLK2 : in STD_ULOGIC;
        CLK1 : in STD_ULOGIC;
        CLK0 : in STD_ULOGIC;

        RST3 : in STD_ULOGIC;
        RST2 : in STD_ULOGIC;
        RST1 : in STD_ULOGIC;
        RST0 : in STD_ULOGIC;

        SROA8 : out STD_ULOGIC;
        SROA7 : out STD_ULOGIC;
        SROA6 : out STD_ULOGIC;
        SROA5 : out STD_ULOGIC;
        SROA4 : out STD_ULOGIC;
        SROA3 : out STD_ULOGIC;
        SROA2 : out STD_ULOGIC;
        SROA1 : out STD_ULOGIC;
        SROA0 : out STD_ULOGIC;

        SROB8 : out STD_ULOGIC;
        SROB7 : out STD_ULOGIC;
        SROB6 : out STD_ULOGIC;
        SROB5 : out STD_ULOGIC;
        SROB4 : out STD_ULOGIC;
        SROB3 : out STD_ULOGIC;
        SROB2 : out STD_ULOGIC;
        SROB1 : out STD_ULOGIC;
        SROB0 : out STD_ULOGIC;

        SUM18 : out STD_ULOGIC;
        SUM17 : out STD_ULOGIC;
        SUM16 : out STD_ULOGIC;
        SUM15 : out STD_ULOGIC;
        SUM14 : out STD_ULOGIC;
        SUM13 : out STD_ULOGIC;
        SUM12 : out STD_ULOGIC;
        SUM11 : out STD_ULOGIC;
        SUM10 : out STD_ULOGIC;
        SUM9 : out STD_ULOGIC;
        SUM8 : out STD_ULOGIC;
        SUM7 : out STD_ULOGIC;
        SUM6 : out STD_ULOGIC;
        SUM5 : out STD_ULOGIC;
        SUM4 : out STD_ULOGIC;
        SUM3 : out STD_ULOGIC;
        SUM2 : out STD_ULOGIC;
        SUM1 : out STD_ULOGIC;
        SUM0 : out STD_ULOGIC
       );
  end component;
--
component MULT9X9ADDSUBSUMB
  GENERIC(
	 REG_INPUTA0_CLK       : string     := "NONE";
	 REG_INPUTA0_CE        : string     := "CE0";
	 REG_INPUTA0_RST       : string     := "RST0";
	 REG_INPUTA1_CLK       : string     := "NONE";
	 REG_INPUTA1_CE        : string     := "CE0";
	 REG_INPUTA1_RST       : string     := "RST0";
	 REG_INPUTA2_CLK       : string     := "NONE";
	 REG_INPUTA2_CE        : string     := "CE0";
	 REG_INPUTA2_RST       : string     := "RST0";
	 REG_INPUTA3_CLK       : string     := "NONE";
	 REG_INPUTA3_CE        : string     := "CE0";
	 REG_INPUTA3_RST       : string     := "RST0";
	 REG_INPUTB0_CLK       : string     := "NONE";
	 REG_INPUTB0_CE        : string     := "CE0";
	 REG_INPUTB0_RST       : string     := "RST0";
	 REG_INPUTB1_CLK       : string     := "NONE";
	 REG_INPUTB1_CE        : string     := "CE0";
	 REG_INPUTB1_RST       : string     := "RST0";
	 REG_INPUTB2_CLK       : string     := "NONE";
	 REG_INPUTB2_CE        : string     := "CE0";
	 REG_INPUTB2_RST       : string     := "RST0";
	 REG_INPUTB3_CLK       : string     := "NONE";
	 REG_INPUTB3_CE        : string     := "CE0";
	 REG_INPUTB3_RST       : string     := "RST0";
	 REG_PIPELINE0_CLK     : string     := "NONE";
	 REG_PIPELINE0_CE      : string     := "CE0";
	 REG_PIPELINE0_RST     : string     := "RST0";
	 REG_PIPELINE1_CLK     : string     := "NONE";
	 REG_PIPELINE1_CE      : string     := "CE0";
	 REG_PIPELINE1_RST     : string     := "RST0";
	 REG_PIPELINE2_CLK     : string     := "NONE";
	 REG_PIPELINE2_CE      : string     := "CE0";
	 REG_PIPELINE2_RST     : string     := "RST0";
	 REG_PIPELINE3_CLK     : string     := "NONE";
	 REG_PIPELINE3_CE      : string     := "CE0";
	 REG_PIPELINE3_RST     : string     := "RST0";
	 REG_OUTPUT_CLK       : string     := "NONE";
	 REG_OUTPUT_CE        : string     := "CE0";
	 REG_OUTPUT_RST       : string     := "RST0";
	 REG_SIGNEDA_0_CLK   : string     := "NONE";
	 REG_SIGNEDA_0_CE    : string     := "CE0";
	 REG_SIGNEDA_0_RST   : string     := "RST0";
	 REG_SIGNEDA_1_CLK   : string     := "NONE";
	 REG_SIGNEDA_1_CE    : string     := "CE0";
	 REG_SIGNEDA_1_RST   : string     := "RST0";
         REG_SIGNEDB_0_CLK   : string     := "NONE";
         REG_SIGNEDB_0_CE    : string     := "CE0";
         REG_SIGNEDB_0_RST   : string     := "RST0";
         REG_SIGNEDB_1_CLK   : string     := "NONE";
         REG_SIGNEDB_1_CE    : string     := "CE0";
         REG_SIGNEDB_1_RST   : string     := "RST0";
	 REG_ADDNSUB1_0_CLK    : string     := "NONE";
	 REG_ADDNSUB1_0_CE     : string     := "CE0";
	 REG_ADDNSUB1_0_RST    : string     := "RST0";
	 REG_ADDNSUB1_1_CLK    : string     := "NONE";
	 REG_ADDNSUB1_1_CE     : string     := "CE0";
	 REG_ADDNSUB1_1_RST    : string     := "RST0";
	 REG_ADDNSUB3_0_CLK    : string     := "NONE";
	 REG_ADDNSUB3_0_CE     : string     := "CE0";
	 REG_ADDNSUB3_0_RST    : string     := "RST0";
	 REG_ADDNSUB3_1_CLK    : string     := "NONE";
	 REG_ADDNSUB3_1_CE     : string     := "CE0";
	 REG_ADDNSUB3_1_RST    : string     := "RST0";
	 GSR                  : string     := "ENABLED");
  port (
        A08 : in STD_ULOGIC;
        A07 : in STD_ULOGIC;
        A06 : in STD_ULOGIC;
        A05 : in STD_ULOGIC;
        A04 : in STD_ULOGIC;
        A03 : in STD_ULOGIC;
        A02 : in STD_ULOGIC;
        A01 : in STD_ULOGIC;
        A00 : in STD_ULOGIC;

        A18 : in STD_ULOGIC;
        A17 : in STD_ULOGIC;
        A16 : in STD_ULOGIC;
        A15 : in STD_ULOGIC;
        A14 : in STD_ULOGIC;
        A13 : in STD_ULOGIC;
        A12 : in STD_ULOGIC;
        A11 : in STD_ULOGIC;
        A10 : in STD_ULOGIC;

        A28 : in STD_ULOGIC;
        A27 : in STD_ULOGIC;
        A26 : in STD_ULOGIC;
        A25 : in STD_ULOGIC;
        A24 : in STD_ULOGIC;
        A23 : in STD_ULOGIC;
        A22 : in STD_ULOGIC;
        A21 : in STD_ULOGIC;
        A20 : in STD_ULOGIC;

        A38 : in STD_ULOGIC;
        A37 : in STD_ULOGIC;
        A36 : in STD_ULOGIC;
        A35 : in STD_ULOGIC;
        A34 : in STD_ULOGIC;
        A33 : in STD_ULOGIC;
        A32 : in STD_ULOGIC;
        A31 : in STD_ULOGIC;
        A30 : in STD_ULOGIC;

        SRIA8 : in STD_ULOGIC;
        SRIA7 : in STD_ULOGIC;
        SRIA6 : in STD_ULOGIC;
        SRIA5 : in STD_ULOGIC;
        SRIA4 : in STD_ULOGIC;
        SRIA3 : in STD_ULOGIC;
        SRIA2 : in STD_ULOGIC;
        SRIA1 : in STD_ULOGIC;
        SRIA0 : in STD_ULOGIC;

        B08 : in STD_ULOGIC;
        B07 : in STD_ULOGIC;
        B06 : in STD_ULOGIC;
        B05 : in STD_ULOGIC;
        B04 : in STD_ULOGIC;
        B03 : in STD_ULOGIC;
        B02 : in STD_ULOGIC;
        B01 : in STD_ULOGIC;
        B00 : in STD_ULOGIC;

        B18 : in STD_ULOGIC;
        B17 : in STD_ULOGIC;
        B16 : in STD_ULOGIC;
        B15 : in STD_ULOGIC;
        B14 : in STD_ULOGIC;
        B13 : in STD_ULOGIC;
        B12 : in STD_ULOGIC;
        B11 : in STD_ULOGIC;
        B10 : in STD_ULOGIC;

        B28 : in STD_ULOGIC;
        B27 : in STD_ULOGIC;
        B26 : in STD_ULOGIC;
        B25 : in STD_ULOGIC;
        B24 : in STD_ULOGIC;
        B23 : in STD_ULOGIC;
        B22 : in STD_ULOGIC;
        B21 : in STD_ULOGIC;
        B20 : in STD_ULOGIC;

        B38 : in STD_ULOGIC;
        B37 : in STD_ULOGIC;
        B36 : in STD_ULOGIC;
        B35 : in STD_ULOGIC;
        B34 : in STD_ULOGIC;
        B33 : in STD_ULOGIC;
        B32 : in STD_ULOGIC;
        B31 : in STD_ULOGIC;
        B30 : in STD_ULOGIC;

        SRIB8 : in STD_ULOGIC;
        SRIB7 : in STD_ULOGIC;
        SRIB6 : in STD_ULOGIC;
        SRIB5 : in STD_ULOGIC;
        SRIB4 : in STD_ULOGIC;
        SRIB3 : in STD_ULOGIC;
        SRIB2 : in STD_ULOGIC;
        SRIB1 : in STD_ULOGIC;
        SRIB0 : in STD_ULOGIC;

        SIGNEDA : in STD_ULOGIC;
        SIGNEDB : in STD_ULOGIC;
        ADDNSUB3  : in STD_ULOGIC;
        ADDNSUB1  : in STD_ULOGIC;
        SOURCEA3 : in STD_ULOGIC;
        SOURCEA2 : in STD_ULOGIC;
        SOURCEA1 : in STD_ULOGIC;
        SOURCEA0 : in STD_ULOGIC;
        SOURCEB3 : in STD_ULOGIC;
        SOURCEB2 : in STD_ULOGIC;
        SOURCEB1 : in STD_ULOGIC;
        SOURCEB0 : in STD_ULOGIC;

        CE3 : in STD_ULOGIC;
        CE2 : in STD_ULOGIC;
        CE1 : in STD_ULOGIC;
        CE0 : in STD_ULOGIC;

        CLK3 : in STD_ULOGIC;
        CLK2 : in STD_ULOGIC;
        CLK1 : in STD_ULOGIC;
        CLK0 : in STD_ULOGIC;

        RST3 : in STD_ULOGIC;
        RST2 : in STD_ULOGIC;
        RST1 : in STD_ULOGIC;
        RST0 : in STD_ULOGIC;

        SROA8 : out STD_ULOGIC;
        SROA7 : out STD_ULOGIC;
        SROA6 : out STD_ULOGIC;
        SROA5 : out STD_ULOGIC;
        SROA4 : out STD_ULOGIC;
        SROA3 : out STD_ULOGIC;
        SROA2 : out STD_ULOGIC;
        SROA1 : out STD_ULOGIC;
        SROA0 : out STD_ULOGIC;

        SROB8 : out STD_ULOGIC;
        SROB7 : out STD_ULOGIC;
        SROB6 : out STD_ULOGIC;
        SROB5 : out STD_ULOGIC;
        SROB4 : out STD_ULOGIC;
        SROB3 : out STD_ULOGIC;
        SROB2 : out STD_ULOGIC;
        SROB1 : out STD_ULOGIC;
        SROB0 : out STD_ULOGIC;

        SUM19 : out STD_ULOGIC;
        SUM18 : out STD_ULOGIC;
        SUM17 : out STD_ULOGIC;
        SUM16 : out STD_ULOGIC;
        SUM15 : out STD_ULOGIC;
        SUM14 : out STD_ULOGIC;
        SUM13 : out STD_ULOGIC;
        SUM12 : out STD_ULOGIC;
        SUM11 : out STD_ULOGIC;
        SUM10 : out STD_ULOGIC;
        SUM9 : out STD_ULOGIC;
        SUM8 : out STD_ULOGIC;
        SUM7 : out STD_ULOGIC;
        SUM6 : out STD_ULOGIC;
        SUM5 : out STD_ULOGIC;
        SUM4 : out STD_ULOGIC;
        SUM3 : out STD_ULOGIC;
        SUM2 : out STD_ULOGIC;
        SUM1 : out STD_ULOGIC;
        SUM0 : out STD_ULOGIC
       ); 
  end component;

component PCSD
   GENERIC( 
            CONFIG_FILE  : string  := "pcie_config.txt";
            QUAD_MODE    : string  := "SINGLE";
            PLL_SRC      : string  := "REFCLK_EXT";
            CH0_CDR_SRC  : string  := "REFCLK_EXT";
            CH1_CDR_SRC  : string  := "REFCLK_EXT";
            CH2_CDR_SRC  : string  := "REFCLK_EXT";
            CH3_CDR_SRC  : string  := "REFCLK_EXT"
   );
   port(
   SCISELCH0       : in STD_ULOGIC;
   SCIENCH0        : in STD_ULOGIC;
   FF_RXI_CLK_0    : in STD_ULOGIC;
   FF_TXI_CLK_0    : in STD_ULOGIC;
   FF_EBRD_CLK_0   : in STD_ULOGIC;
   FF_RX_F_CLK_0   : out STD_ULOGIC;
   FF_RX_H_CLK_0   : out STD_ULOGIC;
   FF_TX_D_0_0     : in STD_ULOGIC;
   FF_TX_D_0_1     : in STD_ULOGIC;
   FF_TX_D_0_2     : in STD_ULOGIC;
   FF_TX_D_0_3     : in STD_ULOGIC;
   FF_TX_D_0_4     : in STD_ULOGIC;
   FF_TX_D_0_5     : in STD_ULOGIC;
   FF_TX_D_0_6     : in STD_ULOGIC;
   FF_TX_D_0_7     : in STD_ULOGIC;
   FF_TX_D_0_8     : in STD_ULOGIC;
   FF_TX_D_0_9     : in STD_ULOGIC;
   FF_TX_D_0_10    : in STD_ULOGIC;
   FF_TX_D_0_11    : in STD_ULOGIC;
   FF_TX_D_0_12    : in STD_ULOGIC;
   FF_TX_D_0_13    : in STD_ULOGIC;
   FF_TX_D_0_14    : in STD_ULOGIC;
   FF_TX_D_0_15    : in STD_ULOGIC;
   FF_TX_D_0_16    : in STD_ULOGIC;
   FF_TX_D_0_17    : in STD_ULOGIC;
   FF_TX_D_0_18    : in STD_ULOGIC;
   FF_TX_D_0_19    : in STD_ULOGIC;
   FF_TX_D_0_20    : in STD_ULOGIC;
   FF_TX_D_0_21    : in STD_ULOGIC;
   FF_TX_D_0_22    : in STD_ULOGIC;
   FF_TX_D_0_23    : in STD_ULOGIC;
   FF_RX_D_0_0     : out STD_ULOGIC;
   FF_RX_D_0_1     : out STD_ULOGIC;
   FF_RX_D_0_2     : out STD_ULOGIC;
   FF_RX_D_0_3     : out STD_ULOGIC;
   FF_RX_D_0_4     : out STD_ULOGIC;
   FF_RX_D_0_5     : out STD_ULOGIC;
   FF_RX_D_0_6     : out STD_ULOGIC;
   FF_RX_D_0_7     : out STD_ULOGIC;
   FF_RX_D_0_8     : out STD_ULOGIC;
   FF_RX_D_0_9     : out STD_ULOGIC;
   FF_RX_D_0_10    : out STD_ULOGIC;
   FF_RX_D_0_11    : out STD_ULOGIC;
   FF_RX_D_0_12    : out STD_ULOGIC;
   FF_RX_D_0_13    : out STD_ULOGIC;
   FF_RX_D_0_14    : out STD_ULOGIC;
   FF_RX_D_0_15    : out STD_ULOGIC;
   FF_RX_D_0_16    : out STD_ULOGIC;
   FF_RX_D_0_17    : out STD_ULOGIC;
   FF_RX_D_0_18    : out STD_ULOGIC;
   FF_RX_D_0_19    : out STD_ULOGIC;
   FF_RX_D_0_20    : out STD_ULOGIC;
   FF_RX_D_0_21    : out STD_ULOGIC;
   FF_RX_D_0_22    : out STD_ULOGIC;
   FF_RX_D_0_23    : out STD_ULOGIC;
   FFC_RRST_0          : in STD_ULOGIC;
   FFC_SIGNAL_DETECT_0 : in STD_ULOGIC;
   FFC_SB_PFIFO_LP_0   : in STD_ULOGIC;
   FFC_SB_INV_RX_0     : in STD_ULOGIC;
   FFC_PFIFO_CLR_0     : in STD_ULOGIC;
   FFC_PCIE_CT_0       : in STD_ULOGIC;
   FFC_PCI_DET_EN_0    : in STD_ULOGIC;
   FFC_FB_LOOPBACK_0   : in STD_ULOGIC;
   FFC_ENABLE_CGALIGN_0 : in STD_ULOGIC;
   FFC_EI_EN_0          : in STD_ULOGIC;
   FFC_LANE_TX_RST_0    : in STD_ULOGIC;
   FFC_LANE_RX_RST_0    : in STD_ULOGIC;
   FFC_TXPWDNB_0        : in STD_ULOGIC;
   FFC_RXPWDNB_0        : in STD_ULOGIC;
   FFS_RLOS_LO_0        : out STD_ULOGIC;
   FFS_RLOS_HI_0        : out STD_ULOGIC;
   FFS_PCIE_DONE_0      : out STD_ULOGIC;
   FFS_PCIE_CON_0       : out STD_ULOGIC;
   FFS_LS_SYNC_STATUS_0 : out STD_ULOGIC;
   FFS_CC_UNDERRUN_0    : out STD_ULOGIC;
   FFS_CC_OVERRUN_0     : out STD_ULOGIC;
   FFS_RLOL_0           : out STD_ULOGIC;
   FFS_RXFBFIFO_ERROR_0 : out STD_ULOGIC;
   FFS_TXFBFIFO_ERROR_0 : out STD_ULOGIC;
   SCISELCH1             : in STD_ULOGIC;
   SCIENCH1              : in STD_ULOGIC;
   FF_RXI_CLK_1          : in STD_ULOGIC;
   FF_TXI_CLK_1          : in STD_ULOGIC;
   FF_EBRD_CLK_1         : in STD_ULOGIC;
   FF_RX_F_CLK_1         : out STD_ULOGIC;
   FF_RX_H_CLK_1         : out STD_ULOGIC;
   FF_TX_D_1_0           : in STD_ULOGIC;
   FF_TX_D_1_1           : in STD_ULOGIC;
   FF_TX_D_1_2           : in STD_ULOGIC;
   FF_TX_D_1_3           : in STD_ULOGIC;
   FF_TX_D_1_4           : in STD_ULOGIC;
   FF_TX_D_1_5           : in STD_ULOGIC;
   FF_TX_D_1_6           : in STD_ULOGIC;
   FF_TX_D_1_7           : in STD_ULOGIC;
   FF_TX_D_1_8           : in STD_ULOGIC;
   FF_TX_D_1_9           : in STD_ULOGIC;
   FF_TX_D_1_10          : in STD_ULOGIC;
   FF_TX_D_1_11          : in STD_ULOGIC;
   FF_TX_D_1_12          : in STD_ULOGIC;
   FF_TX_D_1_13          : in STD_ULOGIC; 
   FF_TX_D_1_14          : in STD_ULOGIC;
   FF_TX_D_1_15          : in STD_ULOGIC;
   FF_TX_D_1_16          : in STD_ULOGIC;
   FF_TX_D_1_17          : in STD_ULOGIC;
   FF_TX_D_1_18          : in STD_ULOGIC;
   FF_TX_D_1_19          : in STD_ULOGIC;
   FF_TX_D_1_20          : in STD_ULOGIC;
   FF_TX_D_1_21          : in STD_ULOGIC;
   FF_TX_D_1_22          : in STD_ULOGIC;
   FF_TX_D_1_23          : in STD_ULOGIC;
   FF_RX_D_1_0          : out STD_ULOGIC;
   FF_RX_D_1_1          : out STD_ULOGIC;
   FF_RX_D_1_2          : out STD_ULOGIC;
   FF_RX_D_1_3          : out STD_ULOGIC;
   FF_RX_D_1_4          : out STD_ULOGIC;
   FF_RX_D_1_5          : out STD_ULOGIC;
   FF_RX_D_1_6          : out STD_ULOGIC;
   FF_RX_D_1_7          : out STD_ULOGIC;
   FF_RX_D_1_8          : out STD_ULOGIC;
   FF_RX_D_1_9          : out STD_ULOGIC;
   FF_RX_D_1_10         : out STD_ULOGIC;
   FF_RX_D_1_11         : out STD_ULOGIC;
   FF_RX_D_1_12         : out STD_ULOGIC;
   FF_RX_D_1_13         : out STD_ULOGIC;
   FF_RX_D_1_14         : out STD_ULOGIC;
   FF_RX_D_1_15         : out STD_ULOGIC;
   FF_RX_D_1_16         : out STD_ULOGIC;
   FF_RX_D_1_17         : out STD_ULOGIC;
   FF_RX_D_1_18         : out STD_ULOGIC;
   FF_RX_D_1_19         : out STD_ULOGIC;
   FF_RX_D_1_20         : out STD_ULOGIC;
   FF_RX_D_1_21         : out STD_ULOGIC;
   FF_RX_D_1_22         : out STD_ULOGIC;
   FF_RX_D_1_23         : out STD_ULOGIC;
   FFC_RRST_1            : in STD_ULOGIC;
   FFC_SIGNAL_DETECT_1   : in STD_ULOGIC;
   FFC_SB_PFIFO_LP_1     : in STD_ULOGIC;
   FFC_SB_INV_RX_1       : in STD_ULOGIC;
   FFC_PFIFO_CLR_1       : in STD_ULOGIC;
   FFC_PCIE_CT_1         : in STD_ULOGIC;
   FFC_PCI_DET_EN_1      : in STD_ULOGIC;
   FFC_FB_LOOPBACK_1     : in STD_ULOGIC;
   FFC_ENABLE_CGALIGN_1  : in STD_ULOGIC;
   FFC_EI_EN_1           : in STD_ULOGIC;
   FFC_LANE_TX_RST_1     : in STD_ULOGIC;
   FFC_LANE_RX_RST_1     : in STD_ULOGIC;
   FFC_TXPWDNB_1         : in STD_ULOGIC;
   FFC_RXPWDNB_1         : in STD_ULOGIC;
   FFS_RLOS_LO_1        : out STD_ULOGIC;
   FFS_RLOS_HI_1        : out STD_ULOGIC;
   FFS_PCIE_DONE_1      : out STD_ULOGIC;
   FFS_PCIE_CON_1       : out STD_ULOGIC;
   FFS_LS_SYNC_STATUS_1 : out STD_ULOGIC;
   FFS_CC_UNDERRUN_1    : out STD_ULOGIC;
   FFS_CC_OVERRUN_1     : out STD_ULOGIC;
   FFS_RLOL_1           : out STD_ULOGIC;
   FFS_RXFBFIFO_ERROR_1 : out STD_ULOGIC;
   FFS_TXFBFIFO_ERROR_1 : out STD_ULOGIC;
   SCISELCH2             : in STD_ULOGIC;
   SCIENCH2              : in STD_ULOGIC;
   FF_RXI_CLK_2          : in STD_ULOGIC;
   FF_TXI_CLK_2          : in STD_ULOGIC;
   FF_EBRD_CLK_2         : in STD_ULOGIC;
   FF_RX_F_CLK_2         : out STD_ULOGIC;
   FF_RX_H_CLK_2         : out STD_ULOGIC;
   FF_TX_D_2_0           : in STD_ULOGIC;
   FF_TX_D_2_1           : in STD_ULOGIC;
   FF_TX_D_2_2           : in STD_ULOGIC;
   FF_TX_D_2_3           : in STD_ULOGIC;
   FF_TX_D_2_4           : in STD_ULOGIC;
   FF_TX_D_2_5           : in STD_ULOGIC;
   FF_TX_D_2_6           : in STD_ULOGIC;
   FF_TX_D_2_7           : in STD_ULOGIC;
   FF_TX_D_2_8           : in STD_ULOGIC;
   FF_TX_D_2_9           : in STD_ULOGIC;
   FF_TX_D_2_10          : in STD_ULOGIC;
   FF_TX_D_2_11          : in STD_ULOGIC;
   FF_TX_D_2_12          : in STD_ULOGIC;
   FF_TX_D_2_13          : in STD_ULOGIC;
   FF_TX_D_2_14          : in STD_ULOGIC;
   FF_TX_D_2_15          : in STD_ULOGIC;
   FF_TX_D_2_16          : in STD_ULOGIC;
   FF_TX_D_2_17          : in STD_ULOGIC;
   FF_TX_D_2_18          : in STD_ULOGIC;
   FF_TX_D_2_19          : in STD_ULOGIC;
   FF_TX_D_2_20          : in STD_ULOGIC;
   FF_TX_D_2_21          : in STD_ULOGIC;
   FF_TX_D_2_22          : in STD_ULOGIC;
   FF_TX_D_2_23          : in STD_ULOGIC;
   FF_RX_D_2_0          : out STD_ULOGIC;
   FF_RX_D_2_1          : out STD_ULOGIC;
   FF_RX_D_2_2          : out STD_ULOGIC;
   FF_RX_D_2_3          : out STD_ULOGIC;
   FF_RX_D_2_4          : out STD_ULOGIC;
   FF_RX_D_2_5          : out STD_ULOGIC;
   FF_RX_D_2_6          : out STD_ULOGIC;
   FF_RX_D_2_7          : out STD_ULOGIC;
   FF_RX_D_2_8          : out STD_ULOGIC;
   FF_RX_D_2_9          : out STD_ULOGIC;
   FF_RX_D_2_10         : out STD_ULOGIC;
   FF_RX_D_2_11         : out STD_ULOGIC;
   FF_RX_D_2_12         : out STD_ULOGIC;
   FF_RX_D_2_13         : out STD_ULOGIC;
   FF_RX_D_2_14         : out STD_ULOGIC;
   FF_RX_D_2_15         : out STD_ULOGIC;
   FF_RX_D_2_16         : out STD_ULOGIC;
   FF_RX_D_2_17         : out STD_ULOGIC;
   FF_RX_D_2_18         : out STD_ULOGIC;
   FF_RX_D_2_19         : out STD_ULOGIC;
   FF_RX_D_2_20         : out STD_ULOGIC;
   FF_RX_D_2_21         : out STD_ULOGIC;
   FF_RX_D_2_22         : out STD_ULOGIC;
   FF_RX_D_2_23         : out STD_ULOGIC;
   FFC_RRST_2            : in STD_ULOGIC;
   FFC_SIGNAL_DETECT_2   : in STD_ULOGIC;
   FFC_SB_PFIFO_LP_2     : in STD_ULOGIC;
   FFC_SB_INV_RX_2       : in STD_ULOGIC;
   FFC_PFIFO_CLR_2       : in STD_ULOGIC;
   FFC_PCIE_CT_2         : in STD_ULOGIC;
   FFC_PCI_DET_EN_2      : in STD_ULOGIC;
   FFC_FB_LOOPBACK_2     : in STD_ULOGIC;
   FFC_ENABLE_CGALIGN_2  : in STD_ULOGIC;
   FFC_EI_EN_2           : in STD_ULOGIC;
   FFC_LANE_TX_RST_2     : in STD_ULOGIC;
   FFC_LANE_RX_RST_2     : in STD_ULOGIC;
   FFC_TXPWDNB_2         : in STD_ULOGIC;
   FFC_RXPWDNB_2         : in STD_ULOGIC;
   FFS_RLOS_LO_2        : out STD_ULOGIC;
   FFS_RLOS_HI_2        : out STD_ULOGIC;
   FFS_PCIE_DONE_2      : out STD_ULOGIC;
   FFS_PCIE_CON_2       : out STD_ULOGIC;
   FFS_LS_SYNC_STATUS_2 : out STD_ULOGIC;
   FFS_CC_UNDERRUN_2    : out STD_ULOGIC;
   FFS_CC_OVERRUN_2     : out STD_ULOGIC;
   FFS_RLOL_2           : out STD_ULOGIC;
   FFS_RXFBFIFO_ERROR_2 : out STD_ULOGIC;
   FFS_TXFBFIFO_ERROR_2 : out STD_ULOGIC;
   SCISELCH3             : in STD_ULOGIC;
   SCIENCH3              : in STD_ULOGIC;
   FF_RXI_CLK_3  : in STD_ULOGIC;
   FF_TXI_CLK_3  : in STD_ULOGIC;
   FF_EBRD_CLK_3 : in STD_ULOGIC;
   FF_RX_F_CLK_3 : out STD_ULOGIC;
   FF_RX_H_CLK_3 : out STD_ULOGIC;
   FF_TX_D_3_0   : in STD_ULOGIC;
   FF_TX_D_3_1   : in STD_ULOGIC;
   FF_TX_D_3_2   : in STD_ULOGIC;
   FF_TX_D_3_3   : in STD_ULOGIC;
   FF_TX_D_3_4   : in STD_ULOGIC;
   FF_TX_D_3_5   : in STD_ULOGIC;
   FF_TX_D_3_6   : in STD_ULOGIC;
   FF_TX_D_3_7   : in STD_ULOGIC;
   FF_TX_D_3_8   : in STD_ULOGIC;
   FF_TX_D_3_9   : in STD_ULOGIC;
   FF_TX_D_3_10 : in STD_ULOGIC;
   FF_TX_D_3_11 : in STD_ULOGIC;
   FF_TX_D_3_12 : in STD_ULOGIC;
   FF_TX_D_3_13 : in STD_ULOGIC;
   FF_TX_D_3_14 : in STD_ULOGIC;
   FF_TX_D_3_15 : in STD_ULOGIC;
   FF_TX_D_3_16 : in STD_ULOGIC;
   FF_TX_D_3_17 : in STD_ULOGIC;
   FF_TX_D_3_18 : in STD_ULOGIC;
   FF_TX_D_3_19 : in STD_ULOGIC;
   FF_TX_D_3_20 : in STD_ULOGIC;
   FF_TX_D_3_21 : in STD_ULOGIC;
   FF_TX_D_3_22 : in STD_ULOGIC;
   FF_TX_D_3_23 : in STD_ULOGIC;
   FF_RX_D_3_0  : out STD_ULOGIC;
   FF_RX_D_3_1  : out STD_ULOGIC;
   FF_RX_D_3_2  : out STD_ULOGIC;
   FF_RX_D_3_3  : out STD_ULOGIC;
   FF_RX_D_3_4  : out STD_ULOGIC;
   FF_RX_D_3_5  : out STD_ULOGIC;
   FF_RX_D_3_6  : out STD_ULOGIC;
   FF_RX_D_3_7  : out STD_ULOGIC;
   FF_RX_D_3_8  : out STD_ULOGIC;
   FF_RX_D_3_9  : out STD_ULOGIC;
   FF_RX_D_3_10 : out STD_ULOGIC;
   FF_RX_D_3_11 : out STD_ULOGIC;
   FF_RX_D_3_12 : out STD_ULOGIC;
   FF_RX_D_3_13 : out STD_ULOGIC;
   FF_RX_D_3_14 : out STD_ULOGIC;
   FF_RX_D_3_15 : out STD_ULOGIC;
   FF_RX_D_3_16 : out STD_ULOGIC;
   FF_RX_D_3_17 : out STD_ULOGIC;
   FF_RX_D_3_18 : out STD_ULOGIC;
   FF_RX_D_3_19 : out STD_ULOGIC;
   FF_RX_D_3_20 : out STD_ULOGIC;
   FF_RX_D_3_21 : out STD_ULOGIC;
   FF_RX_D_3_22 : out STD_ULOGIC;
   FF_RX_D_3_23 : out STD_ULOGIC;
   FFC_RRST_3          : in STD_ULOGIC;
   FFC_SIGNAL_DETECT_3 : in STD_ULOGIC;
   FFC_SB_PFIFO_LP_3   : in STD_ULOGIC;
   FFC_SB_INV_RX_3     : in STD_ULOGIC;
   FFC_PFIFO_CLR_3     : in STD_ULOGIC;
   FFC_PCIE_CT_3       : in STD_ULOGIC;
   FFC_PCI_DET_EN_3    : in STD_ULOGIC;
   FFC_FB_LOOPBACK_3   : in STD_ULOGIC;
   FFC_ENABLE_CGALIGN_3 : in STD_ULOGIC;
   FFC_EI_EN_3          : in STD_ULOGIC;
   FFC_LANE_TX_RST_3    : in STD_ULOGIC;
   FFC_LANE_RX_RST_3    : in STD_ULOGIC;
   FFC_TXPWDNB_3        : in STD_ULOGIC;
   FFC_RXPWDNB_3        : in STD_ULOGIC;
   FFS_RLOS_LO_3        : out STD_ULOGIC;
   FFS_RLOS_HI_3        : out STD_ULOGIC;
   FFS_PCIE_DONE_3      : out STD_ULOGIC;
   FFS_PCIE_CON_3       : out STD_ULOGIC;
   FFS_LS_SYNC_STATUS_3 : out STD_ULOGIC;
   FFS_CC_UNDERRUN_3    : out STD_ULOGIC;
   FFS_CC_OVERRUN_3     : out STD_ULOGIC;
   FFS_RLOL_3           : out STD_ULOGIC;
   FFS_RXFBFIFO_ERROR_3 : out STD_ULOGIC;
   FFS_TXFBFIFO_ERROR_3 : out STD_ULOGIC;
   SCIWDATA0 : in STD_ULOGIC;
   SCIWDATA1 : in STD_ULOGIC;
   SCIWDATA2 : in STD_ULOGIC;
   SCIWDATA3 : in STD_ULOGIC;
   SCIWDATA4 : in STD_ULOGIC;
   SCIWDATA5 : in STD_ULOGIC;
   SCIWDATA6 : in STD_ULOGIC;
   SCIWDATA7 : in STD_ULOGIC;
   SCIADDR0 : in STD_ULOGIC;
   SCIADDR1 : in STD_ULOGIC;
   SCIADDR2 : in STD_ULOGIC;
   SCIADDR3 : in STD_ULOGIC;
   SCIADDR4 : in STD_ULOGIC;
   SCIADDR5 : in STD_ULOGIC;
   SCIENAUX : in STD_ULOGIC;
   SCISELAUX : in STD_ULOGIC;
   SCIRD     : in STD_ULOGIC;
   SCIWSTN   : in STD_ULOGIC;
   SCIRDATA0 : out STD_ULOGIC;
   SCIRDATA1 : out STD_ULOGIC;
   SCIRDATA2 : out STD_ULOGIC;
   SCIRDATA3 : out STD_ULOGIC;
   SCIRDATA4 : out STD_ULOGIC;
   SCIRDATA5 : out STD_ULOGIC;
   SCIRDATA6 : out STD_ULOGIC;
   SCIRDATA7 : out STD_ULOGIC;
   SCIINT    : out STD_ULOGIC;
   FFC_CK_CORE_RX_0 : in STD_ULOGIC;
   FFC_CK_CORE_RX_1 : in STD_ULOGIC;
   FFC_CK_CORE_RX_2 : in STD_ULOGIC;
   FFC_CK_CORE_RX_3 : in STD_ULOGIC;
   FFC_CK_CORE_TX : in STD_ULOGIC;
   FFC_MACRO_RST  : in STD_ULOGIC;
   FFC_QUAD_RST   : in STD_ULOGIC;
   FFC_TRST       : in STD_ULOGIC;
   FF_TX_F_CLK_0 : out STD_ULOGIC;
   FF_TX_F_CLK_1 : out STD_ULOGIC;
   FF_TX_F_CLK_2 : out STD_ULOGIC;
   FF_TX_F_CLK_3 : out STD_ULOGIC;
   FF_TX_H_CLK_0 : out STD_ULOGIC;
   FF_TX_H_CLK_1 : out STD_ULOGIC;
   FF_TX_H_CLK_2 : out STD_ULOGIC;
   FF_TX_H_CLK_3 : out STD_ULOGIC;
   CYAWSTN     : in STD_ULOGIC;
   REFCK2CORE  : out STD_ULOGIC;
   FFS_PLOL    : out STD_ULOGIC;
   CIN0 : in STD_ULOGIC;
   CIN1 : in STD_ULOGIC;
   CIN2 : in STD_ULOGIC;
   CIN3 : in STD_ULOGIC;
   CIN4 : in STD_ULOGIC;
   CIN5 : in STD_ULOGIC;
   CIN6 : in STD_ULOGIC;
   CIN7 : in STD_ULOGIC;
   CIN8 : in STD_ULOGIC;
   CIN9 : in STD_ULOGIC;
   CIN10 : in STD_ULOGIC;
   CIN11 : in STD_ULOGIC;
   COUT0 : out STD_ULOGIC;
   COUT1 : out STD_ULOGIC;
   COUT2 : out STD_ULOGIC;
   COUT3 : out STD_ULOGIC;
   COUT4 : out STD_ULOGIC;
   COUT5 : out STD_ULOGIC;
   COUT6 : out STD_ULOGIC;
   COUT7 : out STD_ULOGIC;
   COUT8 : out STD_ULOGIC;
   COUT9 : out STD_ULOGIC;
   COUT10 : out STD_ULOGIC; 
   COUT11 : out STD_ULOGIC;
   COUT12 : out STD_ULOGIC;
   COUT13 : out STD_ULOGIC;
   COUT14 : out STD_ULOGIC;
   COUT15 : out STD_ULOGIC;
   COUT16 : out STD_ULOGIC;
   COUT17 : out STD_ULOGIC;
   COUT18 : out STD_ULOGIC;
   COUT19 : out STD_ULOGIC;
   HDINP0 : in STD_ULOGIC;
   HDINP1 : in STD_ULOGIC;
   HDINP2 : in STD_ULOGIC;
   HDINP3 : in STD_ULOGIC;
   HDINN0 : in STD_ULOGIC;
   HDINN1 : in STD_ULOGIC;
   HDINN2 : in STD_ULOGIC;
   HDINN3 : in STD_ULOGIC;
   HDOUTP0 : out STD_ULOGIC;
   HDOUTP1 : out STD_ULOGIC;
   HDOUTP2 : out STD_ULOGIC;
   HDOUTP3 : out STD_ULOGIC;
   HDOUTN0 : out STD_ULOGIC;
   HDOUTN1 : out STD_ULOGIC;
   HDOUTN2 : out STD_ULOGIC;
   HDOUTN3 : out STD_ULOGIC;
   REFCLKP : in STD_ULOGIC;
   REFCLKN : in STD_ULOGIC;
   FFC_SYNC_TOGGLE   : in STD_ULOGIC;
   FFS_SKP_ADDED_0   : out STD_ULOGIC;
   FFS_SKP_ADDED_1   : out STD_ULOGIC;
   FFS_SKP_ADDED_2   : out STD_ULOGIC;
   FFS_SKP_ADDED_3   : out STD_ULOGIC;
   FFS_SKP_DELETED_0 : out STD_ULOGIC;
   FFS_SKP_DELETED_1 : out STD_ULOGIC;
   FFS_SKP_DELETED_2 : out STD_ULOGIC;
   FFS_SKP_DELETED_3 : out STD_ULOGIC;
   PCIE_TXDETRX_PR2TLB_0 : in STD_ULOGIC;
   PCIE_TXDETRX_PR2TLB_1 : in STD_ULOGIC;
   PCIE_TXDETRX_PR2TLB_2 : in STD_ULOGIC;
   PCIE_TXDETRX_PR2TLB_3 : in STD_ULOGIC;
   PCIE_TXCOMPLIANCE_0 : in STD_ULOGIC;
   PCIE_TXCOMPLIANCE_1 : in STD_ULOGIC;
   PCIE_TXCOMPLIANCE_2 : in STD_ULOGIC;
   PCIE_TXCOMPLIANCE_3 : in STD_ULOGIC;
   PCIE_RXPOLARITY_0 : in STD_ULOGIC;
   PCIE_RXPOLARITY_1 : in STD_ULOGIC;
   PCIE_RXPOLARITY_2 : in STD_ULOGIC;
   PCIE_RXPOLARITY_3 : in STD_ULOGIC;
   PCIE_POWERDOWN_0_0 : in STD_ULOGIC;
   PCIE_POWERDOWN_0_1 : in STD_ULOGIC;
   PCIE_POWERDOWN_1_0 : in STD_ULOGIC;
   PCIE_POWERDOWN_1_1 : in STD_ULOGIC;
   PCIE_POWERDOWN_2_0 : in STD_ULOGIC;
   PCIE_POWERDOWN_2_1 : in STD_ULOGIC;
   PCIE_POWERDOWN_3_0 : in STD_ULOGIC;
   PCIE_POWERDOWN_3_1 : in STD_ULOGIC;
   PCIE_PHYSTATUS_0 : out STD_ULOGIC;
   PCIE_PHYSTATUS_1 : out STD_ULOGIC;
   PCIE_PHYSTATUS_2 : out STD_ULOGIC;
   PCIE_PHYSTATUS_3 : out STD_ULOGIC;
   PCIE_RXVALID_0 : out STD_ULOGIC;
   PCIE_RXVALID_1 : out STD_ULOGIC;
   PCIE_RXVALID_2 : out STD_ULOGIC;
   PCIE_RXVALID_3 : out STD_ULOGIC;
   FFC_RATE_MODE_TX_0 : in STD_ULOGIC;
   FFC_RATE_MODE_TX_1 : in STD_ULOGIC;
   FFC_RATE_MODE_TX_2 : in STD_ULOGIC;
   FFC_RATE_MODE_TX_3 : in STD_ULOGIC;
   FFC_RATE_MODE_RX_0 : in STD_ULOGIC;
   FFC_RATE_MODE_RX_1 : in STD_ULOGIC;
   FFC_RATE_MODE_RX_2 : in STD_ULOGIC;
   FFC_RATE_MODE_RX_3 : in STD_ULOGIC;
   FFC_DIV11_MODE_RX_0 : in STD_ULOGIC;
   FFC_DIV11_MODE_RX_1 : in STD_ULOGIC;
   FFC_DIV11_MODE_RX_2 : in STD_ULOGIC;
   FFC_DIV11_MODE_RX_3 : in STD_ULOGIC;
   FFC_DIV11_MODE_TX_0 : in STD_ULOGIC;
   FFC_DIV11_MODE_TX_1 : in STD_ULOGIC;
   FFC_DIV11_MODE_TX_2 : in STD_ULOGIC;
   FFC_DIV11_MODE_TX_3 : in STD_ULOGIC;
   FFS_CDR_TRAIN_DONE_0 : out STD_ULOGIC;
   FFS_CDR_TRAIN_DONE_1 : out STD_ULOGIC;
   FFS_CDR_TRAIN_DONE_2 : out STD_ULOGIC;
   FFS_CDR_TRAIN_DONE_3 : out STD_ULOGIC;
   REFCLK_FROM_NQ : in STD_ULOGIC;
   REFCLK_TO_NQ : out STD_ULOGIC;
   LDR_CORE2TX_0 : in STD_ULOGIC;
   LDR_CORE2TX_1 : in STD_ULOGIC;
   LDR_CORE2TX_2 : in STD_ULOGIC;
   LDR_CORE2TX_3 : in STD_ULOGIC;
   LDR_RX2CORE_0 : out STD_ULOGIC;
   LDR_RX2CORE_1 : out STD_ULOGIC;
   LDR_RX2CORE_2 : out STD_ULOGIC;
   LDR_RX2CORE_3 : out STD_ULOGIC;
   FFC_LDR_CORE2TX_EN_0 : in STD_ULOGIC;
   FFC_LDR_CORE2TX_EN_1 : in STD_ULOGIC;
   FFC_LDR_CORE2TX_EN_2 : in STD_ULOGIC;
   FFC_LDR_CORE2TX_EN_3 : in STD_ULOGIC);
end component;
   attribute black_box_pad_pin of PCSD : component is "HDINP0,HDINN0,HDINP1,HDINN1,HDINP2,HDINN2,HDINP3,HDINN3,HDOUTP0,HDOUTN0,HDOUTP1,HDOUTN1,HDOUTP2,HDOUTN2,HDOUTP3,HDOUTN3,REFCLKP,REFCLKN";

COMPONENT DTSA
PORT(
        DTSI3             : IN std_logic;
        DTSI2             : IN std_logic;
        DTSI1             : IN std_logic;
        DTSI0             : IN std_logic;
        DTSO              : OUT std_logic);
END COMPONENT;
end Components;

