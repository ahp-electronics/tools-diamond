-- -------------------------------------------------------------------- 
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<< 
-- -------------------------------------------------------------------- 
-- Copyright (c) 2002-2007 by Lattice Semiconductor Corporation 
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
-- Header files for ECP2M family.
-- 
-- -------------------------------------------------------------------- 

-- 
LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
PACKAGE components IS 
   attribute syn_black_box: boolean ;
   attribute syn_black_box of Components : package is true;
   attribute black_box_pad_pin: string;
   attribute syn_unconnected_inputs: string;
   attribute syn_noprune : boolean;
-- 
COMPONENT AGEB2
PORT(
        A0, A1: IN STD_LOGIC := 'X';
        B0, B1: IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        GE: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of AGEB2 : component is true;
-- 
COMPONENT ALEB2
PORT( 
	A0, A1: IN STD_LOGIC := 'X';
	B0, B1: IN STD_LOGIC := 'X';
	CI: IN STD_LOGIC := 'X';
	LE: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ALEB2 : component is true;
--
COMPONENT ANEB2
PORT(
        A0, A1: IN STD_LOGIC := 'X';
        B0, B1: IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        NE: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ANEB2  : component is true;
--
COMPONENT AND2
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of AND2  : component is true;
-- 
COMPONENT AND3
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of AND3 : component is true;
-- 
COMPONENT AND4
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	D: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of AND4 : component is true;
-- 
COMPONENT AND5
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	D: IN STD_LOGIC := 'X';
	E: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of AND5  : component is true;
-- 
COMPONENT CD2
PORT(
        CI : IN STD_LOGIC := 'X';
        PC0, PC1 : IN STD_LOGIC := 'X';
        CO : OUT STD_LOGIC := 'X';
        NC0, NC1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of CD2 : component is true;
--
COMPONENT CU2
PORT(
        CI : IN STD_LOGIC := 'X';
        PC0, PC1 : IN STD_LOGIC := 'X';
        CO : OUT STD_LOGIC := 'X';
        NC0, NC1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of CU2 : component is true;
--
COMPONENT CB2
PORT(
        CI : IN STD_LOGIC := 'X';
        PC0, PC1 : IN STD_LOGIC := 'X';
        CON: IN STD_LOGIC := 'X';
        CO : OUT STD_LOGIC := 'X';
        NC0, NC1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of CB2 : component is true;
--
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
   attribute syn_black_box of LB2P3AX : component is true;
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
   attribute syn_black_box of LB2P3AY  : component is true;
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
   attribute syn_black_box of LB2P3BX  : component is true;
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
   attribute syn_black_box of LB2P3DX  : component is true;
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
   attribute syn_black_box of LB2P3IX : component is true;
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
   attribute syn_black_box of LB2P3JX : component is true;
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
   attribute syn_black_box of LD2P3AX : component is true;
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
   attribute syn_black_box of LD2P3AY  : component is true;
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
   attribute syn_black_box of LD2P3BX : component is true;
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
   attribute syn_black_box of LD2P3DX  : component is true;
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
   attribute syn_black_box of LD2P3IX : component is true;
--
COMPONENT LD2P3JX
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
   attribute syn_black_box of LD2P3JX  : component is true;
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
   attribute syn_black_box of LU2P3AX : component is true;
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
   attribute syn_black_box of LU2P3AY  : component is true;
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
   attribute syn_black_box of LU2P3BX : component is true;
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
   attribute syn_black_box of LU2P3DX : component is true;
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
   attribute syn_black_box of LU2P3IX  : component is true;
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
   attribute syn_black_box of LU2P3JX  : component is true;
--
COMPONENT FADD2B
PORT(
        A0, A1 : IN STD_LOGIC := 'X';
        B0, B1 : IN STD_LOGIC := 'X';
        CI: IN STD_LOGIC := 'X';
        COUT : OUT STD_LOGIC := 'X';
        S0, S1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FADD2B  : component is true;
--
COMPONENT FSUB2B
PORT(
        A0, A1 : IN STD_LOGIC := 'X';
        B0, B1 : IN STD_LOGIC := 'X';
        BI: IN STD_LOGIC := 'X';
        BOUT : OUT STD_LOGIC := 'X';
        S0, S1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FSUB2B : component is true;
--
COMPONENT FADSU2
PORT(
        A0, A1 : IN STD_LOGIC := 'X';
        B0, B1 : IN STD_LOGIC := 'X';
        BCI: IN STD_LOGIC := 'X';
        CON: IN STD_LOGIC := 'X';
        BCO: OUT STD_LOGIC := 'X';
        S0, S1 : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FADSU2  : component is true;
--

COMPONENT CCU2B
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
      COUT : OUT STD_ULOGIC
   );
END COMPONENT;
   attribute syn_black_box of CCU2B : component is true;
   attribute syn_unconnected_inputs of CCU2B : component is "CIN";
--


COMPONENT FD1P3AX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN STD_LOGIC := 'X';
	SP: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FD1P3AX  : component is true;
-- 
COMPONENT FD1P3AY
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN STD_LOGIC := 'X';
	SP: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FD1P3AY  : component is true;
-- 
COMPONENT FD1P3BX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN STD_LOGIC := 'X';
	SP: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	PD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FD1P3BX  : component is true;
-- 
COMPONENT FD1P3DX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN STD_LOGIC := 'X';
	SP: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	CD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FD1P3DX  : component is true;
-- 
COMPONENT FD1P3IX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN STD_LOGIC := 'X';
	SP: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	CD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FD1P3IX : component is true;
-- 
COMPONENT FD1P3JX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN STD_LOGIC := 'X';
	SP: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	PD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FD1P3JX : component is true;
-- 
COMPONENT FD1S3AX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FD1S3AX  : component is true;
-- 
COMPONENT FD1S3AY
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FD1S3AY : component is true;
-- 
COMPONENT FD1S3BX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	PD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FD1S3BX : component is true;
-- 
COMPONENT FD1S3DX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	CD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FD1S3DX  : component is true;
-- 
COMPONENT FD1S3IX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	CD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FD1S3IX  : component is true;
-- 
COMPONENT FD1S3JX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D : IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	PD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FD1S3JX : component is true;
-- 
COMPONENT FL1P3AZ
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	SP: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FL1P3AZ  : component is true;
-- 
COMPONENT FL1P3AY
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	SP: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FL1P3AY : component is true;
-- 
COMPONENT FL1P3BX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	SP: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	PD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FL1P3BX  : component is true;
-- 
COMPONENT FL1P3DX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	SP: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	CD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FL1P3DX : component is true;
-- 
COMPONENT FL1P3IY
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	SP: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	CD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FL1P3IY  : component is true;
-- 
COMPONENT FL1P3JY
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	SP: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	PD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FL1P3JY  : component is true;
-- 
COMPONENT FL1S3AX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FL1S3AX  : component is true;
-- 
COMPONENT FL1S3AY
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	CK: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of FL1S3AY  : component is true;
-- 
COMPONENT GSR
PORT( 
      GSR: IN STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of GSR : component is true;
   attribute syn_noprune of GSR : COMPONENT is true;
--
COMPONENT SGSR
PORT(
      GSR: IN STD_LOGIC := 'X';
      CLK : IN STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of SGSR  : component is true;
   attribute syn_noprune of SGSR : COMPONENT is true;
--
COMPONENT EPLLD
   GENERIC(
      FIN                : string  := "100.0";
      CLKI_DIV           : Integer   := 1;
      CLKFB_DIV          : Integer   := 1;
      CLKOP_DIV          : Integer   := 8;
      CLKOK_DIV          : Integer   := 2;
      PHASEADJ           : String    := "0.0";
      DUTY               : Integer   := 8;
      PLLCAP             : String    := "DISABLED";
      PHASE_CNTL         : String    := "STATIC";
      CLKOP_BYPASS       : String    := "DISABLED";
      CLKOS_BYPASS       : String    := "DISABLED";
      CLKOK_BYPASS       : String    := "DISABLED";
      PLLTYPE            : String    := "AUTO");
    PORT(
          CLKI          :       IN      STD_ULOGIC;
          CLKFB         :       IN      STD_ULOGIC;
          RST           :       IN      STD_ULOGIC;
          RSTK          :       IN      STD_ULOGIC;
          DPAMODE       :       IN      STD_ULOGIC;
          DRPAI3        :       IN      STD_ULOGIC;
          DRPAI2        :       IN      STD_ULOGIC;
          DRPAI1        :       IN      STD_ULOGIC;
          DRPAI0        :       IN      STD_ULOGIC;
          DFPAI3        :       IN      STD_ULOGIC;
          DFPAI2        :       IN      STD_ULOGIC;
          DFPAI1        :       IN      STD_ULOGIC;
          DFPAI0        :       IN      STD_ULOGIC;
          CLKOP         :       OUT     STD_ULOGIC;
          CLKOS         :       OUT     STD_ULOGIC;
          CLKOK         :       OUT     STD_ULOGIC;
          LOCK          :       OUT     STD_ULOGIC;
          CLKINTFB      :       OUT     STD_ULOGIC
        );
END COMPONENT;
   attribute syn_black_box of EPLLD : component is true;
--
COMPONENT EHXPLLD 
   GENERIC(
      FIN                : string  := "100.0";
      CLKI_DIV           : Integer   := 1;
      CLKFB_DIV          : Integer   := 1;
      CLKOP_DIV          : Integer   := 8;
      CLKOK_DIV          : Integer   := 2;
      PHASEADJ           : String    := "0.0";
      FDEL               : Integer   := 0;
      DUTY               : Integer   := 8;
      PLLCAP             : String    := "DISABLED";
      DELAY_CNTL         : String    := "STATIC";
      PHASE_CNTL         : String    := "STATIC";
      CLKOP_BYPASS       : String    := "DISABLED";
      CLKOS_BYPASS       : String    := "DISABLED";
      CLKOK_BYPASS       : String    := "DISABLED");
   PORT(
          CLKI          :       IN      STD_ULOGIC;
          CLKFB         :       IN      STD_ULOGIC;
          RST           :       IN      STD_ULOGIC;
          RSTK          :       IN      STD_ULOGIC;
          DPAMODE       :       IN      STD_ULOGIC;
          DRPAI3        :       IN      STD_ULOGIC;
          DRPAI2        :       IN      STD_ULOGIC;
          DRPAI1        :       IN      STD_ULOGIC;
          DRPAI0        :       IN      STD_ULOGIC;
          DFPAI3        :       IN      STD_ULOGIC;
          DFPAI2        :       IN      STD_ULOGIC;
          DFPAI1        :       IN      STD_ULOGIC;
          DFPAI0        :       IN      STD_ULOGIC;
          DDAMODE       :       IN      STD_ULOGIC;
          DDAIZR        :       IN      STD_ULOGIC;
          DDAILAG       :       IN      STD_ULOGIC;
          DDAIDEL0      :       IN      STD_ULOGIC;
          DDAIDEL1      :       IN      STD_ULOGIC;
          DDAIDEL2      :       IN      STD_ULOGIC;
          CLKOP         :       OUT     STD_ULOGIC;
          CLKOS         :       OUT     STD_ULOGIC;
          CLKOK         :       OUT     STD_ULOGIC;
          LOCK          :       OUT     STD_ULOGIC;
          CLKINTFB      :       OUT     STD_ULOGIC
);
END COMPONENT;
   attribute syn_black_box of EHXPLLD : component is true;
--
COMPONENT TRDLLA
GENERIC(
      CLKOP_PHASE        : Integer   := 0;
      CLKOS_PHASE        : Integer   := 0;
      CLKOS_FPHASE       : Integer   := 0;
      CLKOS_DIV          : Integer   := 1;
      CLKOP_DUTY50       : String    := "DISABLED";
      CLKOS_DUTY50       : String    := "DISABLED";
      GSR                : String    := "DISABLED";
      CLKOS_FDEL_ADJVAL  : Integer   := 0;
      CLKOS_FPHASE_ADJVAL : Integer   := 0;
      ALU_LOCK_CNT       : Integer   := 3;
      ALU_UNLOCK_CNT     : Integer   := 3;
      GLITCH_TOLERANCE   : Integer   := 2;
      LOCK_DELAY         : Integer   := 100;
      SMI_OFFSET         : String    := "0x410";
      SMI_ADDR_DIS       : STD_LOGIC_vector(9 downto 0)  := "0000000000"
  );
PORT(
        CLKI               : IN STD_LOGIC;
        RSTN               : IN STD_LOGIC;
        ALUHOLD            : IN STD_LOGIC;
        UDDCNTL            : IN STD_LOGIC;
        SMIADDR9           : IN STD_LOGIC;
        SMIADDR8           : IN STD_LOGIC;
        SMIADDR7           : IN STD_LOGIC;
        SMIADDR6           : IN STD_LOGIC;
        SMIADDR5           : IN STD_LOGIC;
        SMIADDR4           : IN STD_LOGIC;
        SMIADDR3           : IN STD_LOGIC;
        SMIADDR2           : IN STD_LOGIC;
        SMIADDR1           : IN STD_LOGIC;
        SMIADDR0           : IN STD_LOGIC;
        SMIRD              : IN STD_LOGIC;
        SMIWR              : IN STD_LOGIC;
        SMICLK             : IN STD_LOGIC;
        SMIWDATA           : IN STD_LOGIC;
        SMIRSTN            : IN STD_LOGIC;
        CLKOP              : OUT STD_LOGIC;
        CLKOS              : OUT STD_LOGIC;
        LOCK               : OUT STD_LOGIC;
        DCNTL8             : OUT STD_LOGIC;
        DCNTL7             : OUT STD_LOGIC;
        DCNTL6             : OUT STD_LOGIC;
        DCNTL5             : OUT STD_LOGIC;
        DCNTL4             : OUT STD_LOGIC;
        DCNTL3             : OUT STD_LOGIC;
        DCNTL2             : OUT STD_LOGIC;
        DCNTL1             : OUT STD_LOGIC;
        DCNTL0             : OUT STD_LOGIC;
        SMIRDATA           : OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of TRDLLA : component is true;
--
COMPONENT CIMDLLA
GENERIC(
      CLKOS_FPHASE       : Integer   := 0;
      CLKOS_DIV          : Integer   := 1;
      GSR                : String    := "DISABLED";
      ALU_LOCK_CNT       : Integer   := 3;
      ALU_UNLOCK_CNT     : Integer   := 3;
      GLITCH_TOLERANCE   : Integer   := 2;
      LOCK_DELAY         : Integer   := 100;
      SMI_OFFSET         : String    := "0x410";
      SMI_ADDR_DIS       : STD_LOGIC_vector(9 downto 0)  := "0000000000"
  );
PORT(
        CLKI               : IN STD_LOGIC;
        CLKFB              : IN STD_LOGIC;
        RSTN               : IN STD_LOGIC;
        ALUHOLD            : IN STD_LOGIC;
        UDDCNTL            : IN STD_LOGIC;
        SMIADDR9           : IN STD_LOGIC;
        SMIADDR8           : IN STD_LOGIC;
        SMIADDR7           : IN STD_LOGIC;
        SMIADDR6           : IN STD_LOGIC;
        SMIADDR5           : IN STD_LOGIC;
        SMIADDR4           : IN STD_LOGIC;
        SMIADDR3           : IN STD_LOGIC;
        SMIADDR2           : IN STD_LOGIC;
        SMIADDR1           : IN STD_LOGIC;
        SMIADDR0           : IN STD_LOGIC;
        SMIRD              : IN STD_LOGIC;
        SMIWR              : IN STD_LOGIC;
        SMICLK             : IN STD_LOGIC;
        SMIWDATA           : IN STD_LOGIC;
        SMIRSTN            : IN STD_LOGIC;
        CLKOP              : OUT STD_LOGIC;
        CLKOS              : OUT STD_LOGIC;
        LOCK               : OUT STD_LOGIC;
        DCNTL8             : OUT STD_LOGIC;
        DCNTL7             : OUT STD_LOGIC;
        DCNTL6             : OUT STD_LOGIC;
        DCNTL5             : OUT STD_LOGIC;
        DCNTL4             : OUT STD_LOGIC;
        DCNTL3             : OUT STD_LOGIC;
        DCNTL2             : OUT STD_LOGIC;
        DCNTL1             : OUT STD_LOGIC;
        DCNTL0             : OUT STD_LOGIC;
        SMIRDATA           : OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of CIMDLLA : component is true;
--
COMPONENT CIDDLLA
GENERIC(
      CLKOP_PHASE        : Integer   := 0;
      CLKOS_PHASE        : Integer   := 0;
      CLKOS_FPHASE       : Integer   := 0;
      CLKI_DIV           : Integer   := 1;
      CLKOS_DIV          : Integer   := 1;
      CLKOP_DUTY50       : String    := "DISABLED";
      CLKOS_DUTY50       : String    := "DISABLED";
      GSR                : String    := "DISABLED";
      ALU_LOCK_CNT       : Integer   := 3;
      ALU_UNLOCK_CNT     : Integer   := 3;
      GLITCH_TOLERANCE   : Integer   := 2;
      ALU_INIT_CNTVAL    : Integer   := 0;
      LOCK_DELAY         : Integer   := 100;
      SMI_OFFSET         : String    := "0x410";
      smi_addr_dis       : STD_LOGIC_vector(9 downto 0)  := "0000000000"
  );
PORT(
        CLKI               : IN STD_LOGIC;
        CLKFB              : IN STD_LOGIC;
        RSTN               : IN STD_LOGIC;
        ALUHOLD            : IN STD_LOGIC;
        SMIADDR9           : IN STD_LOGIC;
        SMIADDR8           : IN STD_LOGIC;
        SMIADDR7           : IN STD_LOGIC;
        SMIADDR6           : IN STD_LOGIC;
        SMIADDR5           : IN STD_LOGIC;
        SMIADDR4           : IN STD_LOGIC;
        SMIADDR3           : IN STD_LOGIC;
        SMIADDR2           : IN STD_LOGIC;
        SMIADDR1           : IN STD_LOGIC;
        SMIADDR0           : IN STD_LOGIC;
        SMIRD              : IN STD_LOGIC;
        SMIWR              : IN STD_LOGIC;
        SMICLK             : IN STD_LOGIC;
        SMIWDATA           : IN STD_LOGIC;
        SMIRSTN            : IN STD_LOGIC;
        CLKOP              : OUT STD_LOGIC;
        CLKOS              : OUT STD_LOGIC;
        LOCK               : OUT STD_LOGIC;
        SMIRDATA           : OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of CIDDLLA  : component is true;
--
COMPONENT JTAGC
   GENERIC(
      ER1             : String  := "ENABLED";
      ER2             : string  := "ENABLED" );
    PORT(
          TCK          :       IN      STD_ULOGIC;
          TMS          :       IN      STD_ULOGIC;
          TDI          :       IN      STD_ULOGIC;
          ITCK         :       IN      STD_ULOGIC;
          ITMS         :       IN      STD_ULOGIC;
          ITDI         :       IN      STD_ULOGIC;
          IJTAGEN      :       IN      STD_ULOGIC;
          JTDO1        :       IN      STD_ULOGIC;
          JTDO2        :       IN      STD_ULOGIC;
          TDO          :       OUT     STD_ULOGIC;
          ITDO         :       OUT     STD_ULOGIC;
          JTDI         :       OUT     STD_ULOGIC;
          JTCK         :       OUT     STD_ULOGIC;
          JRTI1        :       OUT     STD_ULOGIC;
          JRTI2        :       OUT     STD_ULOGIC;
          JSHIFT       :       OUT     STD_ULOGIC;
          JUPDATE      :       OUT     STD_ULOGIC;
          JRSTN        :       OUT     STD_ULOGIC;
          JCE1         :       OUT     STD_ULOGIC;
          JCE2         :       OUT     STD_ULOGIC
        );
END COMPONENT;
   attribute syn_black_box of JTAGC : component is true;
--
COMPONENT INV
PORT( 
	A: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of INV : component is true;
-- 
COMPONENT IFS1P3BX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN STD_LOGIC := 'X';
	SP  : IN STD_LOGIC := 'X';
	SCLK: IN STD_LOGIC := 'X';
	PD  : IN STD_LOGIC := 'X';
	Q   : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of IFS1P3BX  : component is true;
-- 
COMPONENT IFS1P3DX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN STD_LOGIC := 'X';
	SP  : IN STD_LOGIC := 'X';
	SCLK: IN STD_LOGIC := 'X';
	CD  : IN STD_LOGIC := 'X';
	Q   : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of IFS1P3DX : component is true;
-- 
COMPONENT IFS1P3IX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN STD_LOGIC := 'X';
	SP  : IN STD_LOGIC := 'X';
	SCLK: IN STD_LOGIC := 'X';
	CD  : IN STD_LOGIC := 'X';
	Q   : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of IFS1P3IX  : component is true;
-- 
COMPONENT IFS1P3JX
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN STD_LOGIC := 'X';
	SP  : IN STD_LOGIC := 'X';
	SCLK: IN STD_LOGIC := 'X';
	PD  : IN STD_LOGIC := 'X';
	Q   : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of IFS1P3JX  : component is true;
-- 
COMPONENT IFS1S1B
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN STD_LOGIC := 'X';
	SCLK: IN STD_LOGIC := 'X';
	PD  : IN STD_LOGIC := 'X';
	Q   : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of IFS1S1B : component is true;
-- 
COMPONENT IFS1S1D
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN STD_LOGIC := 'X';
	SCLK: IN STD_LOGIC := 'X';
	CD  : IN STD_LOGIC := 'X';
	Q   : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of IFS1S1D  : component is true;
-- 
COMPONENT IFS1S1I
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN STD_LOGIC := 'X';
	SCLK: IN STD_LOGIC := 'X';
	CD  : IN STD_LOGIC := 'X';
	Q   : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of IFS1S1I  : component is true;
-- 
COMPONENT IFS1S1J
    GENERIC (GSR : String := "ENABLED");
PORT( 
	D   : IN STD_LOGIC := 'X';
	SCLK: IN STD_LOGIC := 'X';
	PD  : IN STD_LOGIC := 'X';
	Q   : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of IFS1S1J : component is true;
-- 
COMPONENT MUX21
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	SD: IN STD_LOGIC := 'X';
	Z : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of MUX21  : component is true;
--
COMPONENT L6MUX21
PORT(
        D0: IN STD_LOGIC := 'X';
        D1: IN STD_LOGIC := 'X';
        SD: IN STD_LOGIC := 'X';
        Z : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of L6MUX21  : component is true;
-- 
COMPONENT MUX41
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	D2: IN STD_LOGIC := 'X';
	D3: IN STD_LOGIC := 'X';
	SD1: IN STD_LOGIC := 'X';
	SD2: IN STD_LOGIC := 'X';
	Z : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of MUX41  : component is true;
-- 
COMPONENT MUX81
PORT( 
	D0: IN STD_LOGIC := 'X';
	D1: IN STD_LOGIC := 'X';
	D2: IN STD_LOGIC := 'X';
	D3: IN STD_LOGIC := 'X';
	D4: IN STD_LOGIC := 'X';
	D5: IN STD_LOGIC := 'X';
	D6: IN STD_LOGIC := 'X';
	D7: IN STD_LOGIC := 'X';
	SD1: IN STD_LOGIC := 'X';
	SD2: IN STD_LOGIC := 'X';
	SD3: IN STD_LOGIC := 'X';
	Z : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of MUX81 : component is true;
-- 
COMPONENT MUX161
PORT(
        D0: IN STD_LOGIC := 'X';
        D1: IN STD_LOGIC := 'X';
        D2: IN STD_LOGIC := 'X';
        D3: IN STD_LOGIC := 'X';
        D4: IN STD_LOGIC := 'X';
        D5: IN STD_LOGIC := 'X';
        D6: IN STD_LOGIC := 'X';
        D7: IN STD_LOGIC := 'X';
        D8: IN STD_LOGIC := 'X';
        D9: IN STD_LOGIC := 'X';
        D10: IN STD_LOGIC := 'X';
        D11: IN STD_LOGIC := 'X';
        D12: IN STD_LOGIC := 'X';
        D13: IN STD_LOGIC := 'X';
        D14: IN STD_LOGIC := 'X';
        D15: IN STD_LOGIC := 'X';
        SD1: IN STD_LOGIC := 'X';
        SD2: IN STD_LOGIC := 'X';
        SD3: IN STD_LOGIC := 'X';
        SD4: IN STD_LOGIC := 'X';
        Z : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of MUX161 : component is true;
--
COMPONENT MUX321
PORT(
        D0: IN STD_LOGIC := 'X';
        D1: IN STD_LOGIC := 'X';
        D2: IN STD_LOGIC := 'X';
        D3: IN STD_LOGIC := 'X';
        D4: IN STD_LOGIC := 'X';
        D5: IN STD_LOGIC := 'X';
        D6: IN STD_LOGIC := 'X';
        D7: IN STD_LOGIC := 'X';
        D8: IN STD_LOGIC := 'X';
        D9: IN STD_LOGIC := 'X';
        D10: IN STD_LOGIC := 'X';
        D11: IN STD_LOGIC := 'X';
        D12: IN STD_LOGIC := 'X';
        D13: IN STD_LOGIC := 'X';
        D14: IN STD_LOGIC := 'X';
        D15: IN STD_LOGIC := 'X';
        D16: IN STD_LOGIC := 'X';
        D17: IN STD_LOGIC := 'X';
        D18: IN STD_LOGIC := 'X';
        D19: IN STD_LOGIC := 'X';
        D20: IN STD_LOGIC := 'X';
        D21: IN STD_LOGIC := 'X';
        D22: IN STD_LOGIC := 'X';
        D23: IN STD_LOGIC := 'X';
        D24: IN STD_LOGIC := 'X';
        D25: IN STD_LOGIC := 'X';
        D26: IN STD_LOGIC := 'X';
        D27: IN STD_LOGIC := 'X';
        D28: IN STD_LOGIC := 'X';
        D29: IN STD_LOGIC := 'X';
        D30: IN STD_LOGIC := 'X';
        D31: IN STD_LOGIC := 'X';
        SD1: IN STD_LOGIC := 'X';
        SD2: IN STD_LOGIC := 'X';
        SD3: IN STD_LOGIC := 'X';
        SD4: IN STD_LOGIC := 'X';
        SD5: IN STD_LOGIC := 'X';
        Z : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of MUX321  : component is true;
--
COMPONENT ND2
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ND2  : component is true;
-- 
COMPONENT ND3
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ND3  : component is true;
-- 
COMPONENT ND4
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	D: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ND4 : component is true;
-- 
COMPONENT ND5
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	D: IN STD_LOGIC := 'X';
	E: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ND5 : component is true;
-- 
COMPONENT NR2
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of NR2  : component is true;
-- 
COMPONENT NR3
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of NR3 : component is true;
-- 
COMPONENT NR4
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	D: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of NR4 : component is true;
-- 
COMPONENT NR5
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	D: IN STD_LOGIC := 'X';
	E: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of NR5  : component is true;
-- 
COMPONENT OFE1P3BX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D : IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        ECLK: IN STD_LOGIC := 'X';
        PD: IN STD_LOGIC := 'X';
        Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of OFE1P3BX  : component is true;
--
COMPONENT OFE1P3DX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D : IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        ECLK: IN STD_LOGIC := 'X';
        CD: IN STD_LOGIC := 'X';
        Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of OFE1P3DX  : component is true;
--
COMPONENT OFE1P3IX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D : IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        ECLK: IN STD_LOGIC := 'X';
        CD: IN STD_LOGIC := 'X';
        Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of OFE1P3IX : component is true;
--
COMPONENT OFE1P3JX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D : IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        ECLK: IN STD_LOGIC := 'X';
        PD: IN STD_LOGIC := 'X';
        Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of OFE1P3JX  : component is true;
--
COMPONENT OFS1P3BX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D : IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        SCLK: IN STD_LOGIC := 'X';
        PD: IN STD_LOGIC := 'X';
        Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of OFS1P3BX  : component is true;
--
COMPONENT OFS1P3DX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D : IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        SCLK: IN STD_LOGIC := 'X';
        CD: IN STD_LOGIC := 'X';
        Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of OFS1P3DX  : component is true;
--
COMPONENT OFS1P3IX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D : IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        SCLK: IN STD_LOGIC := 'X';
        CD: IN STD_LOGIC := 'X';
        Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of OFS1P3IX : component is true;
--
COMPONENT OFS1P3JX
    GENERIC (GSR : String := "ENABLED");
PORT(
        D : IN STD_LOGIC := 'X';
        SP: IN STD_LOGIC := 'X';
        SCLK: IN STD_LOGIC := 'X';
        PD: IN STD_LOGIC := 'X';
        Q : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of OFS1P3JX : component is true;
--
COMPONENT OR2
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of OR2  : component is true;
-- 
COMPONENT OR3
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of OR3  : component is true;
-- 
COMPONENT OR4
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	D: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of OR4  : component is true;
-- 
COMPONENT OR5
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	D: IN STD_LOGIC := 'X';
	E: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of OR5  : component is true;
-- 
COMPONENT PFUMX
PORT( 
	ALUT: IN STD_LOGIC := 'X';
	BLUT: IN STD_LOGIC := 'X';
	C0  : IN STD_LOGIC := 'X';
	Z   : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of PFUMX : component is true;
-- 
COMPONENT PUR
   GENERIC (
      RST_PULSE          : Integer   := 1);
PORT(
      PUR: IN STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of PUR  : component is true;
   attribute syn_noprune of pur : COMPONENT is true;
--
COMPONENT ROM32X1
GENERIC(
        initval : string := "0x00000000"
  );
PORT( 
	AD0, AD1, AD2, AD3, AD4: IN STD_LOGIC := 'X';
	DO0: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ROM32X1  : component is true;
-- 
COMPONENT ROM16X1
GENERIC(
        initval : string := "0x0000"
  );
PORT( 
	AD0, AD1, AD2, AD3: IN STD_LOGIC := 'X';
	DO0: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ROM16X1 : component is true;
-- 
COMPONENT ROM64X1
GENERIC(
        initval : string := "0x0000000000000000"
  );
PORT(
        AD0, AD1, AD2, AD3, AD4, AD5 : IN STD_LOGIC := 'X';
        DO0: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ROM64X1  : component is true;
--
COMPONENT ROM128X1
GENERIC(
        initval : string := "0x00000000000000000000000000000000"
  );
PORT(
        AD0, AD1, AD2, AD3, AD4, AD5, AD6 : IN STD_LOGIC := 'X';
        DO0: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ROM128X1 : component is true;
--
COMPONENT ROM256X1
GENERIC(
        initval : string := "0x0000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7 : IN STD_LOGIC := 'X';
        DO0: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of ROM256X1  : component is true;
--
COMPONENT SPR16X4A
PORT(
        DI0  : IN STD_LOGIC;
        DI1  : IN STD_LOGIC;
        DI2  : IN STD_LOGIC;
        DI3  : IN STD_LOGIC;
        CK  : IN STD_LOGIC;
        WRE  : IN STD_LOGIC;
        AD0 : IN STD_LOGIC;
        AD1 : IN STD_LOGIC;
        AD2 : IN STD_LOGIC;
        AD3 : IN STD_LOGIC;
        DO0 : OUT STD_LOGIC;
        DO1 : OUT STD_LOGIC;
        DO2 : OUT STD_LOGIC;
        DO3 : OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of spr16X4A : component is true;
--
COMPONENT DPR16X4A
PORT(
        DI0  : IN STD_LOGIC;
        DI1  : IN STD_LOGIC;
        DI2  : IN STD_LOGIC;
        DI3  : IN STD_LOGIC;
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
        DO0 : OUT STD_LOGIC;
        DO1 : OUT STD_LOGIC;
        DO2 : OUT STD_LOGIC;
        DO3 : OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of DPR16X4A  : component is true;
--
--
COMPONENT STRTUP
PORT( 
	UCLK : IN STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of STRTUP  : component is true;
   attribute syn_noprune of strtup : COMPONENT is true;
--
-- 
COMPONENT VHI
PORT( 
	 Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of VHI : component is true;
-- 
COMPONENT VLO
PORT( 
	 Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of VLO  : component is true;
-- 
COMPONENT XOR2
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of XOR2  : component is true;
-- 
COMPONENT XOR3
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of XOR3 : component is true;
-- 
COMPONENT XOR4
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	D: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of XOR4 : component is true;
-- 
COMPONENT XOR5
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	D: IN STD_LOGIC := 'X';
	E: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of XOR5  : component is true;
-- 
COMPONENT XOR11
PORT( 
        A, B, C, D, E, F, G, H, I, J, K: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of XOR11 : component is true;
-- 
COMPONENT XOR21
PORT( 
	A, B, C, D, E, F, G, H, I, J, K: IN STD_LOGIC := 'X';
	L, M, N, O, P, Q, R, S, T, U: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of XOR21 : component is true;
-- 
COMPONENT XNOR2
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of XNOR2  : component is true;
-- 
COMPONENT XNOR3
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of XNOR3 : component is true;
-- 
COMPONENT XNOR4
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	D: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of XNOR4  : component is true;
-- 
COMPONENT XNOR5
PORT( 
	A: IN STD_LOGIC := 'X';
	B: IN STD_LOGIC := 'X';
	C: IN STD_LOGIC := 'X';
	D: IN STD_LOGIC := 'X';
	E: IN STD_LOGIC := 'X';
	Z: OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of XNOR5  : component is true;
-- 
COMPONENT BBW
PORT(
        B:  INOUT STD_LOGIC := 'X';
        I:  IN STD_LOGIC := 'X';
        T:  IN STD_LOGIC := 'X';
        O:  OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of BBW : component is true;
   attribute black_box_pad_pin of bbw : COMPONENT is "b";
--
COMPONENT OBW
PORT(
        I:  IN STD_LOGIC := 'X';
        T:  IN STD_LOGIC := 'X';
        O:  OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of OBW : component is true;
   attribute black_box_pad_pin of obw : COMPONENT is "o";
--
COMPONENT ILVDS
PORT(
        A : IN STD_LOGIC := 'X';
        AN: IN STD_LOGIC := 'X';
        Z : OUT STD_LOGIC
 );
END COMPONENT;
   attribute syn_black_box of ILVDS  : component is true;
   attribute black_box_pad_pin of ilvds : COMPONENT is "a,an";
--
COMPONENT OLVDS
PORT(
        A  : IN STD_LOGIC := 'X';
        Z  : OUT STD_LOGIC ;
        ZN : OUT STD_LOGIC
 );
END COMPONENT;
   attribute syn_black_box of OLVDS : component is true;
   attribute black_box_pad_pin of olvds : COMPONENT is "z,zn";
--
COMPONENT BB
PORT(
        B:  INOUT STD_LOGIC := 'X';
        I:  IN STD_LOGIC := 'X';
        T:  IN STD_LOGIC := 'X';
        O:  OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of BB  : component is true;
   attribute black_box_pad_pin of bb : COMPONENT is "b";
--
COMPONENT BBPD
PORT(
        B:  INOUT STD_LOGIC := 'X';
        I:  IN STD_LOGIC := 'X';
        T:  IN STD_LOGIC := 'X';
        O:  OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of BBPD  : component is true;
   attribute black_box_pad_pin of bbpd : COMPONENT is "b";
--
COMPONENT BBPU
PORT(
        B:  INOUT STD_LOGIC := 'X';
        I:  IN STD_LOGIC := 'X';
        T:  IN STD_LOGIC := 'X';
        O:  OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of BBPU  : component is true;
   attribute black_box_pad_pin of bbpu : COMPONENT is "b";
--
COMPONENT IB
PORT(
        I:  IN STD_LOGIC := 'X';
        O:  OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of IB : component is true;
   attribute black_box_pad_pin of ib : COMPONENT is "i";
--
COMPONENT IBPD
PORT(
        I:  IN STD_LOGIC := 'X';
        O:  OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of IBPD : component is true;
   attribute black_box_pad_pin of ibpd : COMPONENT is "i";
--
COMPONENT IBPU
PORT(
        I:  IN STD_LOGIC := 'X';
        O:  OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of IBPU : component is true;
   attribute black_box_pad_pin of ibpu : COMPONENT is "i";
--
COMPONENT OB
PORT(
        I:  IN STD_LOGIC := 'X';
        O:  OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of OB : component is true;
   attribute black_box_pad_pin of ob : COMPONENT is "o";
--
COMPONENT OBCO
    PORT(
          I		:   IN	STD_ULOGIC;
          OT		:   OUT	STD_ULOGIC;
          OC		:   OUT	STD_ULOGIC
        );
END COMPONENT;
   attribute syn_black_box of OBCO : component is true;
   attribute black_box_pad_pin of OBCO : COMPONENT is "OT,OC";
COMPONENT OBZ
PORT(
        I:  IN STD_LOGIC := 'X';
        T:  IN STD_LOGIC := 'X';
        O:  OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of OBZ : component is true;
   attribute black_box_pad_pin of obz : COMPONENT is "o";
--
COMPONENT OBZPD
PORT(
        I:  IN STD_LOGIC := 'X';
        T:  IN STD_LOGIC := 'X';
        O:  OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of OBZPD  : component is true;
   attribute black_box_pad_pin of obzpd : COMPONENT is "o";
--
COMPONENT OBZPU
PORT(
        I:  IN STD_LOGIC := 'X';
        T:  IN STD_LOGIC := 'X';
        O:  OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of OBZPU  : component is true;
   attribute black_box_pad_pin of obzpu : COMPONENT is "o";
--
COMPONENT DCS
GENERIC(
      DCSMODE         : String  := "NEG");
PORT(
        CLK0              : IN STD_LOGIC := 'X';
        CLK1              : IN STD_LOGIC := 'X';
        SEL               : IN STD_LOGIC := 'X';
        DCSOUT            : OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of DCS : component is true;
--
COMPONENT OSCD
GENERIC(
      NOM_FREQ         : String  := "2.5");
PORT(
        CFGCLK            : OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of OSCD  : component is true;
--
COMPONENT SEDAA
   GENERIC(
      OSC_DIV       : integer := 1;
      CHECKALWAYS   : string  := "DISABLED";
      AUTORECONFIG  : string  := "OFF";
      MCCLK_FREQ    : string  := "2.5";
      DEV_DENSITY   : string  := "35K";
      ENCRYPTION    : string  := "OFF");
PORT(
          SEDENABLE    :       IN      STD_LOGIC;
          SEDSTART     :       IN      STD_LOGIC;
          SEDFRCERR    :       IN      STD_LOGIC;
          SEDERR       :       OUT     STD_LOGIC;
          SEDDONE      :       OUT     STD_LOGIC;
          SEDINPROG    :       OUT     STD_LOGIC;
          SEDCLKOUT    :       OUT     STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of SEDAA : component is true;
--
COMPONENT SPIM
PORT(
          SEL          :       IN      STD_LOGIC;
          A0           :       IN      STD_LOGIC;
          A1           :       IN      STD_LOGIC;
          A2           :       IN      STD_LOGIC;
          A3           :       IN      STD_LOGIC;
          A4           :       IN      STD_LOGIC;
          A5           :       IN      STD_LOGIC;
          A6           :       IN      STD_LOGIC;
          A7           :       IN      STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of SPIM  : component is true;
--
COMPONENT ODDRXC
PORT(
          DA            :       IN      STD_LOGIC;
          DB            :       IN      STD_LOGIC;
          CLK           :       IN      STD_LOGIC;
          RST           :       IN      STD_LOGIC;
          Q             :       OUT     STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of ODDRXC  : component is true;
--
COMPONENT ODDRMXA
PORT(
          DA            :       IN      STD_LOGIC;
          DB            :       IN      STD_LOGIC;
          CLK           :       IN      STD_LOGIC;
          DQSXFER       :       IN      STD_LOGIC;
          RST           :       IN      STD_LOGIC;
          Q             :       OUT     STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of ODDRMXA : component is true;
--
COMPONENT ODDRX2B
PORT(
          DA0            :       IN      STD_LOGIC;
          DB0            :       IN      STD_LOGIC;
          DA1            :       IN      STD_LOGIC;
          DB1            :       IN      STD_LOGIC;
          ECLK           :       IN      STD_LOGIC;
          SCLK           :       IN      STD_LOGIC;
          RST           :       IN      STD_LOGIC;
          Q             :       OUT     STD_LOGIC
        );
END COMPONENT;
   attribute syn_black_box of ODDRX2B  : component is true;
--
COMPONENT IDDRXC
PORT(
        D               : IN STD_LOGIC;
        CLK             : IN STD_LOGIC;
        CE              : IN STD_LOGIC;
        RST             : IN STD_LOGIC;
        QA              : OUT STD_LOGIC;
        QB              : OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of IDDRXC  : component is true;
--
COMPONENT IDDRFXA
PORT(
        D               : IN STD_LOGIC;
        CLK1            : IN STD_LOGIC;
        CLK2            : IN STD_LOGIC;
        CE              : IN STD_LOGIC;
        RST             : IN STD_LOGIC;
        QA              : OUT STD_LOGIC;
        QB              : OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of IDDRFXA : component is true;
--
COMPONENT IDDRMX1A
PORT(
        D               : IN STD_LOGIC;
        ECLK             : IN STD_LOGIC;
        SCLK             : IN STD_LOGIC;
        CE              : IN STD_LOGIC;
        RST             : IN STD_LOGIC;
        DDRCLKPOL       : IN STD_LOGIC;
        QA              : OUT STD_LOGIC;
        QB              : OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of IDDRMX1A  : component is true;
--
COMPONENT IDDRMFX1A
PORT(
        D               : IN STD_LOGIC;
        ECLK             : IN STD_LOGIC;
        CLK1             : IN STD_LOGIC;
        CLK2             : IN STD_LOGIC;
        CE              : IN STD_LOGIC;
        RST             : IN STD_LOGIC;
        DDRCLKPOL       : IN STD_LOGIC;
        QA              : OUT STD_LOGIC;
        QB              : OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of IDDRMFX1A : component is true;
--
COMPONENT IDDRX2B
PORT(
        D               : IN STD_LOGIC;
        ECLK            : IN STD_LOGIC;
        SCLK            : IN STD_LOGIC;
        CE              : IN STD_LOGIC;
        RST             : IN STD_LOGIC;
        QA0              : OUT STD_LOGIC;
        QA1              : OUT STD_LOGIC;
        QB0              : OUT STD_LOGIC;
        QB1              : OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of IDDRX2B  : component is true;
--
COMPONENT DQSBUFC
   GENERIC(
      DQS_LI_DEL_ADJ : string  := "MINUS";
      DQS_LI_DEL_VAL : string := "4";
      DQS_LO_DEL_ADJ : string  := "PLUS";
      DQS_LO_DEL_VAL : string := "0");
PORT(
          DQSI          :       IN      STD_LOGIC;
          CLK           :       IN      STD_LOGIC;
          XCLK          :       IN      STD_LOGIC;
          READ          :       IN      STD_LOGIC;
          DQSDEL        :       IN      STD_LOGIC;
          DQSO          :       OUT     STD_LOGIC;
          DDRCLKPOL     :       OUT     STD_LOGIC;
          DQSC          :       OUT     STD_LOGIC;
          PRMBDET       :       OUT     STD_LOGIC;
          DQSXFER       :       OUT     STD_LOGIC;
          DATAVALID     :       OUT     STD_LOGIC
        );
END COMPONENT;
   attribute syn_black_box of DQSBUFC : component is true;
--
COMPONENT DQSDLL
    GENERIC(DEL_ADJ          : string  := "PLUS";
            DEL_VAL          : string  := "0";
            LOCK_SENSITIVITY : string  := "LOW");
PORT(
          CLK           :       IN      STD_ULOGIC;
          RST           :       IN      STD_ULOGIC;
          UDDCNTL       :       IN      STD_ULOGIC;
          LOCK          :       OUT     STD_ULOGIC;
          DQSDEL        :       OUT     STD_ULOGIC
        );
END COMPONENT;
   attribute syn_black_box of DQSDLL : component is true;
--
COMPONENT CLKDIVB
GENERIC(
      GSR         : String  := "DISABLED");
PORT(
          CLKI          :       IN      STD_ULOGIC;
          RST           :       IN      STD_ULOGIC;
          RELEASE       :       IN      STD_ULOGIC;
          CDIV1         :       OUT     STD_ULOGIC;
          CDIV2         :       OUT     STD_ULOGIC;
          CDIV4         :       OUT     STD_ULOGIC;
          CDIV8         :       OUT     STD_ULOGIC
        );
END COMPONENT;
   attribute syn_black_box of CLKDIVB  : component is true;
--
COMPONENT DELAYB
PORT(
      A             : IN STD_LOGIC;
      DEL0          : IN STD_LOGIC;
      DEL1          : IN STD_LOGIC;
      DEL2          : IN STD_LOGIC;
      DEL3          : IN STD_LOGIC;
      Z             : OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of DELAYB : component is true;
--
COMPONENT DLLDELA
PORT(
      CLKI            : IN STD_LOGIC;
      DCNTL0          : IN STD_LOGIC;
      DCNTL1          : IN STD_LOGIC;
      DCNTL2          : IN STD_LOGIC;
      DCNTL3          : IN STD_LOGIC;
      DCNTL4          : IN STD_LOGIC;
      DCNTL5          : IN STD_LOGIC;
      DCNTL6          : IN STD_LOGIC;
      DCNTL7          : IN STD_LOGIC;
      DCNTL8          : IN STD_LOGIC;
      CLKO            : OUT STD_LOGIC);
END COMPONENT;
   attribute syn_black_box of DLLDELA : component is true;
--
------COMPONENT ORCALUT4------
COMPONENT ORCALUT4
    GENERIC(  init      :       bit_vector);
    PORT(
          A             :       IN      STD_ULOGIC;
          B             :       IN      STD_ULOGIC;
          C             :       IN      STD_ULOGIC;
          D             :       IN      STD_ULOGIC;
          Z             :       OUT     STD_ULOGIC
        );
END COMPONENT;

------COMPONENT ORCALUT5------
COMPONENT ORCALUT5
    GENERIC(  init      :       bit_vector);
    PORT(
          A             :       IN      STD_ULOGIC;
          B             :       IN      STD_ULOGIC;
          C             :       IN      STD_ULOGIC;
          D             :       IN      STD_ULOGIC;
          E             :       IN      STD_ULOGIC;
          Z             :       OUT     STD_ULOGIC
        );
END COMPONENT;

------COMPONENT ORCALUT6------
COMPONENT ORCALUT6
    GENERIC(  init      :       bit_vector);
    PORT(
          A             :       IN      STD_ULOGIC;
          B             :       IN      STD_ULOGIC;
          C             :       IN      STD_ULOGIC;
          D             :       IN      STD_ULOGIC;
          E             :       IN      STD_ULOGIC;
          F             :       IN      STD_ULOGIC;
          Z             :       OUT     STD_ULOGIC
        );
END COMPONENT;

------COMPONENT ORCALUT7------
COMPONENT ORCALUT7
    GENERIC(  init      :       bit_vector);
    PORT(
          A             :       IN      STD_ULOGIC;
          B             :       IN      STD_ULOGIC;
          C             :       IN      STD_ULOGIC;
          D             :       IN      STD_ULOGIC;
          E             :       IN      STD_ULOGIC;
          F             :       IN      STD_ULOGIC;
          G             :       IN      STD_ULOGIC;
          Z             :       OUT     STD_ULOGIC
        );
END COMPONENT;

------COMPONENT ORCALUT8------
COMPONENT ORCALUT8
    GENERIC(  init      :       bit_vector);
    PORT(
          A             :       IN      STD_ULOGIC;
          B             :       IN      STD_ULOGIC;
          C             :       IN      STD_ULOGIC;
          D             :       IN      STD_ULOGIC;
          E             :       IN      STD_ULOGIC;
          F             :       IN      STD_ULOGIC;
          G             :       IN      STD_ULOGIC;
          H             :       IN      STD_ULOGIC;
          Z             :       OUT     STD_ULOGIC
        );
END COMPONENT;
--
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
   attribute syn_black_box of MULT2 : component is true;
--
  COMPONENT MULT9X9B
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
         REG_SIGNEDA_CLK   : string     := "NONE";
         REG_SIGNEDA_CE    : string     := "CE0";
         REG_SIGNEDA_RST   : string     := "RST0";
         REG_SIGNEDB_CLK   : string     := "NONE";
         REG_SIGNEDB_CE    : string     := "CE0";
         REG_SIGNEDB_RST   : string     := "RST0";
         GSR                  : string     := "ENABLED");
  PORT (
        A0 : IN STD_ULOGIC;
        A1 : IN STD_ULOGIC;
        A2 : IN STD_ULOGIC;
        A3 : IN STD_ULOGIC;
        A4 : IN STD_ULOGIC;
        A5 : IN STD_ULOGIC;
        A6 : IN STD_ULOGIC;
        A7 : IN STD_ULOGIC;
        A8 : IN STD_ULOGIC;

        SRIA0 : IN STD_ULOGIC;
        SRIA1 : IN STD_ULOGIC;
        SRIA2 : IN STD_ULOGIC;
        SRIA3 : IN STD_ULOGIC;
        SRIA4 : IN STD_ULOGIC;
        SRIA5 : IN STD_ULOGIC;
        SRIA6 : IN STD_ULOGIC;
        SRIA7 : IN STD_ULOGIC;
        SRIA8 : IN STD_ULOGIC;

        B0 : IN STD_ULOGIC;
        B1 : IN STD_ULOGIC;
        B2 : IN STD_ULOGIC;
        B3 : IN STD_ULOGIC;
        B4 : IN STD_ULOGIC;
        B5 : IN STD_ULOGIC;
        B6 : IN STD_ULOGIC;
        B7 : IN STD_ULOGIC;
        B8 : IN STD_ULOGIC;

        SRIB0 : IN STD_ULOGIC;
        SRIB1 : IN STD_ULOGIC;
        SRIB2 : IN STD_ULOGIC;
        SRIB3 : IN STD_ULOGIC;
        SRIB4 : IN STD_ULOGIC;
        SRIB5 : IN STD_ULOGIC;
        SRIB6 : IN STD_ULOGIC;
        SRIB7 : IN STD_ULOGIC;
        SRIB8 : IN STD_ULOGIC;

        SIGNEDA : IN STD_ULOGIC;
        SIGNEDB : IN STD_ULOGIC;
        SOURCEA : IN STD_ULOGIC;
        SOURCEB : IN STD_ULOGIC;

        CE0 : IN STD_ULOGIC;
        CE1 : IN STD_ULOGIC;
        CE2 : IN STD_ULOGIC;
        CE3 : IN STD_ULOGIC;

        CLK0 : IN STD_ULOGIC;
        CLK1 : IN STD_ULOGIC;
        CLK2 : IN STD_ULOGIC;
        CLK3 : IN STD_ULOGIC;

        RST0 : IN STD_ULOGIC;
        RST1 : IN STD_ULOGIC;
        RST2 : IN STD_ULOGIC;
        RST3 : IN STD_ULOGIC;

        SROA0 : OUT STD_ULOGIC;
        SROA1 : OUT STD_ULOGIC;
        SROA2 : OUT STD_ULOGIC;
        SROA3 : OUT STD_ULOGIC;
        SROA4 : OUT STD_ULOGIC;
        SROA5 : OUT STD_ULOGIC;
        SROA6 : OUT STD_ULOGIC;
        SROA7 : OUT STD_ULOGIC;
        SROA8 : OUT STD_ULOGIC;

        SROB0 : OUT STD_ULOGIC;
        SROB1 : OUT STD_ULOGIC;
        SROB2 : OUT STD_ULOGIC;
        SROB3 : OUT STD_ULOGIC;
        SROB4 : OUT STD_ULOGIC;
        SROB5 : OUT STD_ULOGIC;
        SROB6 : OUT STD_ULOGIC;
        SROB7 : OUT STD_ULOGIC;
        SROB8 : OUT STD_ULOGIC;

        P0 : OUT STD_ULOGIC;
        P1 : OUT STD_ULOGIC;
        P2 : OUT STD_ULOGIC;
        P3 : OUT STD_ULOGIC;
        P4 : OUT STD_ULOGIC;
        P5 : OUT STD_ULOGIC;
        P6 : OUT STD_ULOGIC;
        P7 : OUT STD_ULOGIC;
        P8 : OUT STD_ULOGIC;
        P9 : OUT STD_ULOGIC;
        P10 : OUT STD_ULOGIC;
        P11 : OUT STD_ULOGIC;
        P12 : OUT STD_ULOGIC;
        P13 : OUT STD_ULOGIC;
        P14 : OUT STD_ULOGIC;
        P15 : OUT STD_ULOGIC;
        P16 : OUT STD_ULOGIC;
        P17 : OUT STD_ULOGIC
       );
  END COMPONENT;
   attribute syn_black_box of MULT9X9B  : component is true;

  COMPONENT MULT9X9ADDSUBB
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
  PORT (
        A00 : IN STD_ULOGIC;
        A01 : IN STD_ULOGIC;
        A02 : IN STD_ULOGIC;
        A03 : IN STD_ULOGIC;
        A04 : IN STD_ULOGIC;
        A05 : IN STD_ULOGIC;
        A06 : IN STD_ULOGIC;
        A07 : IN STD_ULOGIC;
        A08 : IN STD_ULOGIC;

        A10 : IN STD_ULOGIC;
        A11 : IN STD_ULOGIC;
        A12 : IN STD_ULOGIC;
        A13 : IN STD_ULOGIC;
        A14 : IN STD_ULOGIC;
        A15 : IN STD_ULOGIC;
        A16 : IN STD_ULOGIC;
        A17 : IN STD_ULOGIC;
        A18 : IN STD_ULOGIC;

        SRIA0 : IN STD_ULOGIC;
        SRIA1 : IN STD_ULOGIC;
        SRIA2 : IN STD_ULOGIC;
        SRIA3 : IN STD_ULOGIC;
        SRIA4 : IN STD_ULOGIC;
        SRIA5 : IN STD_ULOGIC;
        SRIA6 : IN STD_ULOGIC;
        SRIA7 : IN STD_ULOGIC;
        SRIA8 : IN STD_ULOGIC;

        B00 : IN STD_ULOGIC;
        B01 : IN STD_ULOGIC;
        B02 : IN STD_ULOGIC;
        B03 : IN STD_ULOGIC;
        B04 : IN STD_ULOGIC;
        B05 : IN STD_ULOGIC;
        B06 : IN STD_ULOGIC;
        B07 : IN STD_ULOGIC;
        B08 : IN STD_ULOGIC;

        B10 : IN STD_ULOGIC;
        B11 : IN STD_ULOGIC;
        B12 : IN STD_ULOGIC;
        B13 : IN STD_ULOGIC;
        B14 : IN STD_ULOGIC;
        B15 : IN STD_ULOGIC;
        B16 : IN STD_ULOGIC;
        B17 : IN STD_ULOGIC;
        B18 : IN STD_ULOGIC;

        SRIB0 : IN STD_ULOGIC;
        SRIB1 : IN STD_ULOGIC;
        SRIB2 : IN STD_ULOGIC;
        SRIB3 : IN STD_ULOGIC;
        SRIB4 : IN STD_ULOGIC;
        SRIB5 : IN STD_ULOGIC;
        SRIB6 : IN STD_ULOGIC;
        SRIB7 : IN STD_ULOGIC;
        SRIB8 : IN STD_ULOGIC;

        SIGNEDA : IN STD_ULOGIC;
        SIGNEDB : IN STD_ULOGIC;
        ADDNSUB  : IN STD_ULOGIC;
        SOURCEA0 : IN STD_ULOGIC;
        SOURCEA1 : IN STD_ULOGIC;
        SOURCEB0 : IN STD_ULOGIC;
        SOURCEB1 : IN STD_ULOGIC;

        CE0 : IN STD_ULOGIC;
        CE1 : IN STD_ULOGIC;
        CE2 : IN STD_ULOGIC;
        CE3 : IN STD_ULOGIC;

        CLK0 : IN STD_ULOGIC;
        CLK1 : IN STD_ULOGIC;
        CLK2 : IN STD_ULOGIC;
        CLK3 : IN STD_ULOGIC;

        RST0 : IN STD_ULOGIC;
        RST1 : IN STD_ULOGIC;
        RST2 : IN STD_ULOGIC;
        RST3 : IN STD_ULOGIC;

        SROA0 : OUT STD_ULOGIC;
        SROA1 : OUT STD_ULOGIC;
        SROA2 : OUT STD_ULOGIC;
        SROA3 : OUT STD_ULOGIC;
        SROA4 : OUT STD_ULOGIC;
        SROA5 : OUT STD_ULOGIC;
        SROA6 : OUT STD_ULOGIC;
        SROA7 : OUT STD_ULOGIC;
        SROA8 : OUT STD_ULOGIC;

        SROB0 : OUT STD_ULOGIC;
        SROB1 : OUT STD_ULOGIC;
        SROB2 : OUT STD_ULOGIC;
        SROB3 : OUT STD_ULOGIC;
        SROB4 : OUT STD_ULOGIC;
        SROB5 : OUT STD_ULOGIC;
        SROB6 : OUT STD_ULOGIC;
        SROB7 : OUT STD_ULOGIC;
        SROB8 : OUT STD_ULOGIC;

        SUM0 : OUT STD_ULOGIC;
        SUM1 : OUT STD_ULOGIC;
        SUM2 : OUT STD_ULOGIC;
        SUM3 : OUT STD_ULOGIC;
        SUM4 : OUT STD_ULOGIC;
        SUM5 : OUT STD_ULOGIC;
        SUM6 : OUT STD_ULOGIC;
        SUM7 : OUT STD_ULOGIC;
        SUM8 : OUT STD_ULOGIC;
        SUM9 : OUT STD_ULOGIC;
        SUM10 : OUT STD_ULOGIC;
        SUM11 : OUT STD_ULOGIC;
        SUM12 : OUT STD_ULOGIC;
        SUM13 : OUT STD_ULOGIC;
        SUM14 : OUT STD_ULOGIC;
        SUM15 : OUT STD_ULOGIC;
        SUM16 : OUT STD_ULOGIC;
        SUM17 : OUT STD_ULOGIC;
        SUM18 : OUT STD_ULOGIC
       );
  END COMPONENT;
   attribute syn_black_box of MULT9X9ADDSUBB : component is true;
--
COMPONENT MULT9X9ADDSUBSUMB
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
  PORT (
        A00 : IN STD_ULOGIC;
        A01 : IN STD_ULOGIC;
        A02 : IN STD_ULOGIC;
        A03 : IN STD_ULOGIC;
        A04 : IN STD_ULOGIC;
        A05 : IN STD_ULOGIC;
        A06 : IN STD_ULOGIC;
        A07 : IN STD_ULOGIC;
        A08 : IN STD_ULOGIC;

        A10 : IN STD_ULOGIC;
        A11 : IN STD_ULOGIC;
        A12 : IN STD_ULOGIC;
        A13 : IN STD_ULOGIC;
        A14 : IN STD_ULOGIC;
        A15 : IN STD_ULOGIC;
        A16 : IN STD_ULOGIC;
        A17 : IN STD_ULOGIC;
        A18 : IN STD_ULOGIC;

        A20 : IN STD_ULOGIC;
        A21 : IN STD_ULOGIC;
        A22 : IN STD_ULOGIC;
        A23 : IN STD_ULOGIC;
        A24 : IN STD_ULOGIC;
        A25 : IN STD_ULOGIC;
        A26 : IN STD_ULOGIC;
        A27 : IN STD_ULOGIC;
        A28 : IN STD_ULOGIC;

        A30 : IN STD_ULOGIC;
        A31 : IN STD_ULOGIC;
        A32 : IN STD_ULOGIC;
        A33 : IN STD_ULOGIC;
        A34 : IN STD_ULOGIC;
        A35 : IN STD_ULOGIC;
        A36 : IN STD_ULOGIC;
        A37 : IN STD_ULOGIC;
        A38 : IN STD_ULOGIC;

        SRIA0 : IN STD_ULOGIC;
        SRIA1 : IN STD_ULOGIC;
        SRIA2 : IN STD_ULOGIC;
        SRIA3 : IN STD_ULOGIC;
        SRIA4 : IN STD_ULOGIC;
        SRIA5 : IN STD_ULOGIC;
        SRIA6 : IN STD_ULOGIC;
        SRIA7 : IN STD_ULOGIC;
        SRIA8 : IN STD_ULOGIC;

        B00 : IN STD_ULOGIC;
        B01 : IN STD_ULOGIC;
        B02 : IN STD_ULOGIC;
        B03 : IN STD_ULOGIC;
        B04 : IN STD_ULOGIC;
        B05 : IN STD_ULOGIC;
        B06 : IN STD_ULOGIC;
        B07 : IN STD_ULOGIC;
        B08 : IN STD_ULOGIC;

        B10 : IN STD_ULOGIC;
        B11 : IN STD_ULOGIC;
        B12 : IN STD_ULOGIC;
        B13 : IN STD_ULOGIC;
        B14 : IN STD_ULOGIC;
        B15 : IN STD_ULOGIC;
        B16 : IN STD_ULOGIC;
        B17 : IN STD_ULOGIC;
        B18 : IN STD_ULOGIC;

        B20 : IN STD_ULOGIC;
        B21 : IN STD_ULOGIC;
        B22 : IN STD_ULOGIC;
        B23 : IN STD_ULOGIC;
        B24 : IN STD_ULOGIC;
        B25 : IN STD_ULOGIC;
        B26 : IN STD_ULOGIC;
        B27 : IN STD_ULOGIC;
        B28 : IN STD_ULOGIC;

        B30 : IN STD_ULOGIC;
        B31 : IN STD_ULOGIC;
        B32 : IN STD_ULOGIC;
        B33 : IN STD_ULOGIC;
        B34 : IN STD_ULOGIC;
        B35 : IN STD_ULOGIC;
        B36 : IN STD_ULOGIC;
        B37 : IN STD_ULOGIC;
        B38 : IN STD_ULOGIC;

        SRIB0 : IN STD_ULOGIC;
        SRIB1 : IN STD_ULOGIC;
        SRIB2 : IN STD_ULOGIC;
        SRIB3 : IN STD_ULOGIC;
        SRIB4 : IN STD_ULOGIC;
        SRIB5 : IN STD_ULOGIC;
        SRIB6 : IN STD_ULOGIC;
        SRIB7 : IN STD_ULOGIC;
        SRIB8 : IN STD_ULOGIC;

        SIGNEDA : IN STD_ULOGIC;
        SIGNEDB : IN STD_ULOGIC;
        ADDNSUB1  : IN STD_ULOGIC;
        ADDNSUB3  : IN STD_ULOGIC;
        SOURCEA0 : IN STD_ULOGIC;
        SOURCEA1 : IN STD_ULOGIC;
        SOURCEA2 : IN STD_ULOGIC;
        SOURCEA3 : IN STD_ULOGIC;
        SOURCEB0 : IN STD_ULOGIC;
        SOURCEB1 : IN STD_ULOGIC;
        SOURCEB2 : IN STD_ULOGIC;
        SOURCEB3 : IN STD_ULOGIC;

        CE0 : IN STD_ULOGIC;
        CE1 : IN STD_ULOGIC;
        CE2 : IN STD_ULOGIC;
        CE3 : IN STD_ULOGIC;

        CLK0 : IN STD_ULOGIC;
        CLK1 : IN STD_ULOGIC;
        CLK2 : IN STD_ULOGIC;
        CLK3 : IN STD_ULOGIC;

        RST0 : IN STD_ULOGIC;
        RST1 : IN STD_ULOGIC;
        RST2 : IN STD_ULOGIC;
        RST3 : IN STD_ULOGIC;

        SROA0 : OUT STD_ULOGIC;
        SROA1 : OUT STD_ULOGIC;
        SROA2 : OUT STD_ULOGIC;
        SROA3 : OUT STD_ULOGIC;
        SROA4 : OUT STD_ULOGIC;
        SROA5 : OUT STD_ULOGIC;
        SROA6 : OUT STD_ULOGIC;
        SROA7 : OUT STD_ULOGIC;
        SROA8 : OUT STD_ULOGIC;

        SROB0 : OUT STD_ULOGIC;
        SROB1 : OUT STD_ULOGIC;
        SROB2 : OUT STD_ULOGIC;
        SROB3 : OUT STD_ULOGIC;
        SROB4 : OUT STD_ULOGIC;
        SROB5 : OUT STD_ULOGIC;
        SROB6 : OUT STD_ULOGIC;
        SROB7 : OUT STD_ULOGIC;
        SROB8 : OUT STD_ULOGIC;

        SUM0 : OUT STD_ULOGIC;
        SUM1 : OUT STD_ULOGIC;
        SUM2 : OUT STD_ULOGIC;
        SUM3 : OUT STD_ULOGIC;
        SUM4 : OUT STD_ULOGIC;
        SUM5 : OUT STD_ULOGIC;
        SUM6 : OUT STD_ULOGIC;
        SUM7 : OUT STD_ULOGIC;
        SUM8 : OUT STD_ULOGIC;
        SUM9 : OUT STD_ULOGIC;
        SUM10 : OUT STD_ULOGIC;
        SUM11 : OUT STD_ULOGIC;
        SUM12 : OUT STD_ULOGIC;
        SUM13 : OUT STD_ULOGIC;
        SUM14 : OUT STD_ULOGIC;
        SUM15 : OUT STD_ULOGIC;
        SUM16 : OUT STD_ULOGIC;
        SUM17 : OUT STD_ULOGIC;
        SUM18 : OUT STD_ULOGIC;
        SUM19 : OUT STD_ULOGIC
       ); 
  END COMPONENT;
   attribute syn_black_box of MULT9X9ADDSUBSUMB : component is true;

  COMPONENT MULT18X18B
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
	 REG_SIGNEDA_CLK   : string     := "NONE";
	 REG_SIGNEDA_CE    : string     := "CE0";
	 REG_SIGNEDA_RST   : string     := "RST0";
         REG_SIGNEDB_CLK   : string     := "NONE";
         REG_SIGNEDB_CE    : string     := "CE0";
         REG_SIGNEDB_RST   : string     := "RST0";
	 GSR                  : string     := "ENABLED");
  PORT (
        A0 : IN STD_ULOGIC;
        A1 : IN STD_ULOGIC;
        A2 : IN STD_ULOGIC;
        A3 : IN STD_ULOGIC;
        A4 : IN STD_ULOGIC;
        A5 : IN STD_ULOGIC;
        A6 : IN STD_ULOGIC;
        A7 : IN STD_ULOGIC;
        A8 : IN STD_ULOGIC;
        A9 : IN STD_ULOGIC;
        A10 : IN STD_ULOGIC;
        A11 : IN STD_ULOGIC;
        A12 : IN STD_ULOGIC;
        A13 : IN STD_ULOGIC;
        A14 : IN STD_ULOGIC;
        A15 : IN STD_ULOGIC;
        A16 : IN STD_ULOGIC;
        A17 : IN STD_ULOGIC;

        SRIA0 : IN STD_ULOGIC;
        SRIA1 : IN STD_ULOGIC;
        SRIA2 : IN STD_ULOGIC;
        SRIA3 : IN STD_ULOGIC;
        SRIA4 : IN STD_ULOGIC;
        SRIA5 : IN STD_ULOGIC;
        SRIA6 : IN STD_ULOGIC;
        SRIA7 : IN STD_ULOGIC;
        SRIA8 : IN STD_ULOGIC;
        SRIA9 : IN STD_ULOGIC;
        SRIA10 : IN STD_ULOGIC;
        SRIA11 : IN STD_ULOGIC;
        SRIA12 : IN STD_ULOGIC;
        SRIA13 : IN STD_ULOGIC;
        SRIA14 : IN STD_ULOGIC;
        SRIA15 : IN STD_ULOGIC;
        SRIA16 : IN STD_ULOGIC;
        SRIA17 : IN STD_ULOGIC;

        B0 : IN STD_ULOGIC;
        B1 : IN STD_ULOGIC;
        B2 : IN STD_ULOGIC;
        B3 : IN STD_ULOGIC;
        B4 : IN STD_ULOGIC;
        B5 : IN STD_ULOGIC;
        B6 : IN STD_ULOGIC;
        B7 : IN STD_ULOGIC;
        B8 : IN STD_ULOGIC;
        B9 : IN STD_ULOGIC;
        B10 : IN STD_ULOGIC;
        B11 : IN STD_ULOGIC;
        B12 : IN STD_ULOGIC;
        B13 : IN STD_ULOGIC;
        B14 : IN STD_ULOGIC;
        B15 : IN STD_ULOGIC;
        B16 : IN STD_ULOGIC;
        B17 : IN STD_ULOGIC;

        SRIB0 : IN STD_ULOGIC;
        SRIB1 : IN STD_ULOGIC;
        SRIB2 : IN STD_ULOGIC;
        SRIB3 : IN STD_ULOGIC;
        SRIB4 : IN STD_ULOGIC;
        SRIB5 : IN STD_ULOGIC;
        SRIB6 : IN STD_ULOGIC;
        SRIB7 : IN STD_ULOGIC;
        SRIB8 : IN STD_ULOGIC;
        SRIB9 : IN STD_ULOGIC;
        SRIB10 : IN STD_ULOGIC;
        SRIB11 : IN STD_ULOGIC;
        SRIB12 : IN STD_ULOGIC;
        SRIB13 : IN STD_ULOGIC;
        SRIB14 : IN STD_ULOGIC;
        SRIB15 : IN STD_ULOGIC;
        SRIB16 : IN STD_ULOGIC;
        SRIB17 : IN STD_ULOGIC;

        SIGNEDA : IN STD_ULOGIC;
        SIGNEDB : IN STD_ULOGIC;
        SOURCEA : IN STD_ULOGIC;
        SOURCEB : IN STD_ULOGIC;

        CE0 : IN STD_ULOGIC;
        CE1 : IN STD_ULOGIC;
        CE2 : IN STD_ULOGIC;
        CE3 : IN STD_ULOGIC;

        CLK0 : IN STD_ULOGIC;
        CLK1 : IN STD_ULOGIC;
        CLK2 : IN STD_ULOGIC;
        CLK3 : IN STD_ULOGIC;

        RST0 : IN STD_ULOGIC;
        RST1 : IN STD_ULOGIC;
        RST2 : IN STD_ULOGIC;
        RST3 : IN STD_ULOGIC;

        SROA0 : OUT STD_ULOGIC;
        SROA1 : OUT STD_ULOGIC;
        SROA2 : OUT STD_ULOGIC;
        SROA3 : OUT STD_ULOGIC;
        SROA4 : OUT STD_ULOGIC;
        SROA5 : OUT STD_ULOGIC;
        SROA6 : OUT STD_ULOGIC;
        SROA7 : OUT STD_ULOGIC;
        SROA8 : OUT STD_ULOGIC;
        SROA9 : OUT STD_ULOGIC;
        SROA10 : OUT STD_ULOGIC;
        SROA11 : OUT STD_ULOGIC;
        SROA12 : OUT STD_ULOGIC;
        SROA13 : OUT STD_ULOGIC;
        SROA14 : OUT STD_ULOGIC;
        SROA15 : OUT STD_ULOGIC;
        SROA16 : OUT STD_ULOGIC;
        SROA17 : OUT STD_ULOGIC;

        SROB0 : OUT STD_ULOGIC;
        SROB1 : OUT STD_ULOGIC;
        SROB2 : OUT STD_ULOGIC;
        SROB3 : OUT STD_ULOGIC;
        SROB4 : OUT STD_ULOGIC;
        SROB5 : OUT STD_ULOGIC;
        SROB6 : OUT STD_ULOGIC;
        SROB7 : OUT STD_ULOGIC;
        SROB8 : OUT STD_ULOGIC;
        SROB9 : OUT STD_ULOGIC;
        SROB10 : OUT STD_ULOGIC;
        SROB11 : OUT STD_ULOGIC;
        SROB12 : OUT STD_ULOGIC;
        SROB13 : OUT STD_ULOGIC;
        SROB14 : OUT STD_ULOGIC;
        SROB15 : OUT STD_ULOGIC;
        SROB16 : OUT STD_ULOGIC;
        SROB17 : OUT STD_ULOGIC;

        P0 : OUT STD_ULOGIC;
        P1 : OUT STD_ULOGIC;
        P2 : OUT STD_ULOGIC;
        P3 : OUT STD_ULOGIC;
        P4 : OUT STD_ULOGIC;
        P5 : OUT STD_ULOGIC;
        P6 : OUT STD_ULOGIC;
        P7 : OUT STD_ULOGIC;
        P8 : OUT STD_ULOGIC;
        P9 : OUT STD_ULOGIC;
        P10 : OUT STD_ULOGIC;
        P11 : OUT STD_ULOGIC;
        P12 : OUT STD_ULOGIC;
        P13 : OUT STD_ULOGIC;
        P14 : OUT STD_ULOGIC;
        P15 : OUT STD_ULOGIC;
        P16 : OUT STD_ULOGIC;
        P17 : OUT STD_ULOGIC;
        P18 : OUT STD_ULOGIC;
        P19 : OUT STD_ULOGIC;
        P20 : OUT STD_ULOGIC;
        P21 : OUT STD_ULOGIC;
        P22 : OUT STD_ULOGIC;
        P23 : OUT STD_ULOGIC;
        P24 : OUT STD_ULOGIC;
        P25 : OUT STD_ULOGIC;
        P26 : OUT STD_ULOGIC;
        P27 : OUT STD_ULOGIC;
        P28 : OUT STD_ULOGIC;
        P29 : OUT STD_ULOGIC;
        P30 : OUT STD_ULOGIC;
        P31 : OUT STD_ULOGIC;
        P32 : OUT STD_ULOGIC;
        P33 : OUT STD_ULOGIC;
        P34 : OUT STD_ULOGIC;
        P35 : OUT STD_ULOGIC
       ); 
  END COMPONENT;
   attribute syn_black_box of MULT18X18B : component is true;

  COMPONENT MULT18X18ADDSUBB
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
  PORT (
        A00 : IN STD_ULOGIC;
        A01 : IN STD_ULOGIC;
        A02 : IN STD_ULOGIC;
        A03 : IN STD_ULOGIC;
        A04 : IN STD_ULOGIC;
        A05 : IN STD_ULOGIC;
        A06 : IN STD_ULOGIC;
        A07 : IN STD_ULOGIC;
        A08 : IN STD_ULOGIC;
        A09 : IN STD_ULOGIC;
        A010 : IN STD_ULOGIC;
        A011 : IN STD_ULOGIC;
        A012 : IN STD_ULOGIC;
        A013 : IN STD_ULOGIC;
        A014 : IN STD_ULOGIC;
        A015 : IN STD_ULOGIC;
        A016 : IN STD_ULOGIC;
        A017 : IN STD_ULOGIC;

        A10 : IN STD_ULOGIC;
        A11 : IN STD_ULOGIC;
        A12 : IN STD_ULOGIC;
        A13 : IN STD_ULOGIC;
        A14 : IN STD_ULOGIC;
        A15 : IN STD_ULOGIC;
        A16 : IN STD_ULOGIC;
        A17 : IN STD_ULOGIC;
        A18 : IN STD_ULOGIC;
        A19 : IN STD_ULOGIC;
        A110 : IN STD_ULOGIC;
        A111 : IN STD_ULOGIC;
        A112 : IN STD_ULOGIC;
        A113 : IN STD_ULOGIC;
        A114 : IN STD_ULOGIC;
        A115 : IN STD_ULOGIC;
        A116 : IN STD_ULOGIC;
        A117 : IN STD_ULOGIC;

        SRIA0 : IN STD_ULOGIC;
        SRIA1 : IN STD_ULOGIC;
        SRIA2 : IN STD_ULOGIC;
        SRIA3 : IN STD_ULOGIC;
        SRIA4 : IN STD_ULOGIC;
        SRIA5 : IN STD_ULOGIC;
        SRIA6 : IN STD_ULOGIC;
        SRIA7 : IN STD_ULOGIC;
        SRIA8 : IN STD_ULOGIC;
        SRIA9 : IN STD_ULOGIC;
        SRIA10 : IN STD_ULOGIC;
        SRIA11 : IN STD_ULOGIC;
        SRIA12 : IN STD_ULOGIC;
        SRIA13 : IN STD_ULOGIC;
        SRIA14 : IN STD_ULOGIC;
        SRIA15 : IN STD_ULOGIC;
        SRIA16 : IN STD_ULOGIC;
        SRIA17 : IN STD_ULOGIC;

        B00 : IN STD_ULOGIC;
        B01 : IN STD_ULOGIC;
        B02 : IN STD_ULOGIC;
        B03 : IN STD_ULOGIC;
        B04 : IN STD_ULOGIC;
        B05 : IN STD_ULOGIC;
        B06 : IN STD_ULOGIC;
        B07 : IN STD_ULOGIC;
        B08 : IN STD_ULOGIC;
        B09 : IN STD_ULOGIC;
        B010 : IN STD_ULOGIC;
        B011 : IN STD_ULOGIC;
        B012 : IN STD_ULOGIC;
        B013 : IN STD_ULOGIC;
        B014 : IN STD_ULOGIC;
        B015 : IN STD_ULOGIC;
        B016 : IN STD_ULOGIC;
        B017 : IN STD_ULOGIC;

        B10 : IN STD_ULOGIC;
        B11 : IN STD_ULOGIC;
        B12 : IN STD_ULOGIC;
        B13 : IN STD_ULOGIC;
        B14 : IN STD_ULOGIC;
        B15 : IN STD_ULOGIC;
        B16 : IN STD_ULOGIC;
        B17 : IN STD_ULOGIC;
        B18 : IN STD_ULOGIC;
        B19 : IN STD_ULOGIC;
        B110 : IN STD_ULOGIC;
        B111 : IN STD_ULOGIC;
        B112 : IN STD_ULOGIC;
        B113 : IN STD_ULOGIC;
        B114 : IN STD_ULOGIC;
        B115 : IN STD_ULOGIC;
        B116 : IN STD_ULOGIC;
        B117 : IN STD_ULOGIC;

        SRIB0 : IN STD_ULOGIC;
        SRIB1 : IN STD_ULOGIC;
        SRIB2 : IN STD_ULOGIC;
        SRIB3 : IN STD_ULOGIC;
        SRIB4 : IN STD_ULOGIC;
        SRIB5 : IN STD_ULOGIC;
        SRIB6 : IN STD_ULOGIC;
        SRIB7 : IN STD_ULOGIC;
        SRIB8 : IN STD_ULOGIC;
        SRIB9 : IN STD_ULOGIC;
        SRIB10 : IN STD_ULOGIC;
        SRIB11 : IN STD_ULOGIC;
        SRIB12 : IN STD_ULOGIC;
        SRIB13 : IN STD_ULOGIC;
        SRIB14 : IN STD_ULOGIC;
        SRIB15 : IN STD_ULOGIC;
        SRIB16 : IN STD_ULOGIC;
        SRIB17 : IN STD_ULOGIC;

        SIGNEDA : IN STD_ULOGIC;
        SIGNEDB : IN STD_ULOGIC;
        SOURCEA0 : IN STD_ULOGIC;
        SOURCEA1 : IN STD_ULOGIC;
        SOURCEB0 : IN STD_ULOGIC;
        SOURCEB1 : IN STD_ULOGIC;
        ADDNSUB  : IN STD_ULOGIC;

        CE0 : IN STD_ULOGIC;
        CE1 : IN STD_ULOGIC;
        CE2 : IN STD_ULOGIC;
        CE3 : IN STD_ULOGIC;

        CLK0 : IN STD_ULOGIC;
        CLK1 : IN STD_ULOGIC;
        CLK2 : IN STD_ULOGIC;
        CLK3 : IN STD_ULOGIC;

        RST0 : IN STD_ULOGIC;
        RST1 : IN STD_ULOGIC;
        RST2 : IN STD_ULOGIC;
        RST3 : IN STD_ULOGIC;

        SROA0 : OUT STD_ULOGIC;
        SROA1 : OUT STD_ULOGIC;
        SROA2 : OUT STD_ULOGIC;
        SROA3 : OUT STD_ULOGIC;
        SROA4 : OUT STD_ULOGIC;
        SROA5 : OUT STD_ULOGIC;
        SROA6 : OUT STD_ULOGIC;
        SROA7 : OUT STD_ULOGIC;
        SROA8 : OUT STD_ULOGIC;
        SROA9 : OUT STD_ULOGIC;
        SROA10 : OUT STD_ULOGIC;
        SROA11 : OUT STD_ULOGIC;
        SROA12 : OUT STD_ULOGIC;
        SROA13 : OUT STD_ULOGIC;
        SROA14 : OUT STD_ULOGIC;
        SROA15 : OUT STD_ULOGIC;
        SROA16 : OUT STD_ULOGIC;
        SROA17 : OUT STD_ULOGIC;

        SROB0 : OUT STD_ULOGIC;
        SROB1 : OUT STD_ULOGIC;
        SROB2 : OUT STD_ULOGIC;
        SROB3 : OUT STD_ULOGIC;
        SROB4 : OUT STD_ULOGIC;
        SROB5 : OUT STD_ULOGIC;
        SROB6 : OUT STD_ULOGIC;
        SROB7 : OUT STD_ULOGIC;
        SROB8 : OUT STD_ULOGIC;
        SROB9 : OUT STD_ULOGIC;
        SROB10 : OUT STD_ULOGIC;
        SROB11 : OUT STD_ULOGIC;
        SROB12 : OUT STD_ULOGIC;
        SROB13 : OUT STD_ULOGIC;
        SROB14 : OUT STD_ULOGIC;
        SROB15 : OUT STD_ULOGIC;
        SROB16 : OUT STD_ULOGIC;
        SROB17 : OUT STD_ULOGIC;

        SUM0 : OUT STD_ULOGIC;
        SUM1 : OUT STD_ULOGIC;
        SUM2 : OUT STD_ULOGIC;
        SUM3 : OUT STD_ULOGIC;
        SUM4 : OUT STD_ULOGIC;
        SUM5 : OUT STD_ULOGIC;
        SUM6 : OUT STD_ULOGIC;
        SUM7 : OUT STD_ULOGIC;
        SUM8 : OUT STD_ULOGIC;
        SUM9 : OUT STD_ULOGIC;
        SUM10 : OUT STD_ULOGIC;
        SUM11 : OUT STD_ULOGIC;
        SUM12 : OUT STD_ULOGIC;
        SUM13 : OUT STD_ULOGIC;
        SUM14 : OUT STD_ULOGIC;
        SUM15 : OUT STD_ULOGIC;
        SUM16 : OUT STD_ULOGIC;
        SUM17 : OUT STD_ULOGIC;
        SUM18 : OUT STD_ULOGIC;
        SUM19 : OUT STD_ULOGIC;
        SUM20 : OUT STD_ULOGIC;
        SUM21 : OUT STD_ULOGIC;
        SUM22 : OUT STD_ULOGIC;
        SUM23 : OUT STD_ULOGIC;
        SUM24 : OUT STD_ULOGIC;
        SUM25 : OUT STD_ULOGIC;
        SUM26 : OUT STD_ULOGIC;
        SUM27 : OUT STD_ULOGIC;
        SUM28 : OUT STD_ULOGIC;
        SUM29 : OUT STD_ULOGIC;
        SUM30 : OUT STD_ULOGIC;
        SUM31 : OUT STD_ULOGIC;
        SUM32 : OUT STD_ULOGIC;
        SUM33 : OUT STD_ULOGIC;
        SUM34 : OUT STD_ULOGIC;
        SUM35 : OUT STD_ULOGIC;
        SUM36 : OUT STD_ULOGIC
       ); 
  END COMPONENT;
   attribute syn_black_box of MULT18X18ADDSUBB : component is true;

  COMPONENT MULT18X18ADDSUBSUMB
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
  PORT (
        A00 : IN STD_ULOGIC;
        A01 : IN STD_ULOGIC;
        A02 : IN STD_ULOGIC;
        A03 : IN STD_ULOGIC;
        A04 : IN STD_ULOGIC;
        A05 : IN STD_ULOGIC;
        A06 : IN STD_ULOGIC;
        A07 : IN STD_ULOGIC;
        A08 : IN STD_ULOGIC;
        A09 : IN STD_ULOGIC;
        A010 : IN STD_ULOGIC;
        A011 : IN STD_ULOGIC;
        A012 : IN STD_ULOGIC;
        A013 : IN STD_ULOGIC;
        A014 : IN STD_ULOGIC;
        A015 : IN STD_ULOGIC;
        A016 : IN STD_ULOGIC;
        A017 : IN STD_ULOGIC;

        A10 : IN STD_ULOGIC;
        A11 : IN STD_ULOGIC;
        A12 : IN STD_ULOGIC;
        A13 : IN STD_ULOGIC;
        A14 : IN STD_ULOGIC;
        A15 : IN STD_ULOGIC;
        A16 : IN STD_ULOGIC;
        A17 : IN STD_ULOGIC;
        A18 : IN STD_ULOGIC;
        A19 : IN STD_ULOGIC;
        A110 : IN STD_ULOGIC;
        A111 : IN STD_ULOGIC;
        A112 : IN STD_ULOGIC;
        A113 : IN STD_ULOGIC;
        A114 : IN STD_ULOGIC;
        A115 : IN STD_ULOGIC;
        A116 : IN STD_ULOGIC;
        A117 : IN STD_ULOGIC;

        A20 : IN STD_ULOGIC;
        A21 : IN STD_ULOGIC;
        A22 : IN STD_ULOGIC;
        A23 : IN STD_ULOGIC;
        A24 : IN STD_ULOGIC;
        A25 : IN STD_ULOGIC;
        A26 : IN STD_ULOGIC;
        A27 : IN STD_ULOGIC;
        A28 : IN STD_ULOGIC;
        A29 : IN STD_ULOGIC;
        A210 : IN STD_ULOGIC;
        A211 : IN STD_ULOGIC;
        A212 : IN STD_ULOGIC;
        A213 : IN STD_ULOGIC;
        A214 : IN STD_ULOGIC;
        A215 : IN STD_ULOGIC;
        A216 : IN STD_ULOGIC;
        A217 : IN STD_ULOGIC;

        A30 : IN STD_ULOGIC;
        A31 : IN STD_ULOGIC;
        A32 : IN STD_ULOGIC;
        A33 : IN STD_ULOGIC;
        A34 : IN STD_ULOGIC;
        A35 : IN STD_ULOGIC;
        A36 : IN STD_ULOGIC;
        A37 : IN STD_ULOGIC;
        A38 : IN STD_ULOGIC;
        A39 : IN STD_ULOGIC;
        A310 : IN STD_ULOGIC;
        A311 : IN STD_ULOGIC;
        A312 : IN STD_ULOGIC;
        A313 : IN STD_ULOGIC;
        A314 : IN STD_ULOGIC;
        A315 : IN STD_ULOGIC;
        A316 : IN STD_ULOGIC;
        A317 : IN STD_ULOGIC;

        SRIA0 : IN STD_ULOGIC;
        SRIA1 : IN STD_ULOGIC;
        SRIA2 : IN STD_ULOGIC;
        SRIA3 : IN STD_ULOGIC;
        SRIA4 : IN STD_ULOGIC;
        SRIA5 : IN STD_ULOGIC;
        SRIA6 : IN STD_ULOGIC;
        SRIA7 : IN STD_ULOGIC;
        SRIA8 : IN STD_ULOGIC;
        SRIA9 : IN STD_ULOGIC;
        SRIA10 : IN STD_ULOGIC;
        SRIA11 : IN STD_ULOGIC;
        SRIA12 : IN STD_ULOGIC;
        SRIA13 : IN STD_ULOGIC;
        SRIA14 : IN STD_ULOGIC;
        SRIA15 : IN STD_ULOGIC;
        SRIA16 : IN STD_ULOGIC;
        SRIA17 : IN STD_ULOGIC;

        B00 : IN STD_ULOGIC;
        B01 : IN STD_ULOGIC;
        B02 : IN STD_ULOGIC;
        B03 : IN STD_ULOGIC;
        B04 : IN STD_ULOGIC;
        B05 : IN STD_ULOGIC;
        B06 : IN STD_ULOGIC;
        B07 : IN STD_ULOGIC;
        B08 : IN STD_ULOGIC;
        B09 : IN STD_ULOGIC;
        B010 : IN STD_ULOGIC;
        B011 : IN STD_ULOGIC;
        B012 : IN STD_ULOGIC;
        B013 : IN STD_ULOGIC;
        B014 : IN STD_ULOGIC;
        B015 : IN STD_ULOGIC;
        B016 : IN STD_ULOGIC;
        B017 : IN STD_ULOGIC;

        B10 : IN STD_ULOGIC;
        B11 : IN STD_ULOGIC;
        B12 : IN STD_ULOGIC;
        B13 : IN STD_ULOGIC;
        B14 : IN STD_ULOGIC;
        B15 : IN STD_ULOGIC;
        B16 : IN STD_ULOGIC;
        B17 : IN STD_ULOGIC;
        B18 : IN STD_ULOGIC;
        B19 : IN STD_ULOGIC;
        B110 : IN STD_ULOGIC;
        B111 : IN STD_ULOGIC;
        B112 : IN STD_ULOGIC;
        B113 : IN STD_ULOGIC;
        B114 : IN STD_ULOGIC;
        B115 : IN STD_ULOGIC;
        B116 : IN STD_ULOGIC;
        B117 : IN STD_ULOGIC;

        B20 : IN STD_ULOGIC;
        B21 : IN STD_ULOGIC;
        B22 : IN STD_ULOGIC;
        B23 : IN STD_ULOGIC;
        B24 : IN STD_ULOGIC;
        B25 : IN STD_ULOGIC;
        B26 : IN STD_ULOGIC;
        B27 : IN STD_ULOGIC;
        B28 : IN STD_ULOGIC;
        B29 : IN STD_ULOGIC;
        B210 : IN STD_ULOGIC;
        B211 : IN STD_ULOGIC;
        B212 : IN STD_ULOGIC;
        B213 : IN STD_ULOGIC;
        B214 : IN STD_ULOGIC;
        B215 : IN STD_ULOGIC;
        B216 : IN STD_ULOGIC;
        B217 : IN STD_ULOGIC;

        B30 : IN STD_ULOGIC;
        B31 : IN STD_ULOGIC;
        B32 : IN STD_ULOGIC;
        B33 : IN STD_ULOGIC;
        B34 : IN STD_ULOGIC;
        B35 : IN STD_ULOGIC;
        B36 : IN STD_ULOGIC;
        B37 : IN STD_ULOGIC;
        B38 : IN STD_ULOGIC;
        B39 : IN STD_ULOGIC;
        B310 : IN STD_ULOGIC;
        B311 : IN STD_ULOGIC;
        B312 : IN STD_ULOGIC;
        B313 : IN STD_ULOGIC;
        B314 : IN STD_ULOGIC;
        B315 : IN STD_ULOGIC;
        B316 : IN STD_ULOGIC;
        B317 : IN STD_ULOGIC;

        SRIB0 : IN STD_ULOGIC;
        SRIB1 : IN STD_ULOGIC;
        SRIB2 : IN STD_ULOGIC;
        SRIB3 : IN STD_ULOGIC;
        SRIB4 : IN STD_ULOGIC;
        SRIB5 : IN STD_ULOGIC;
        SRIB6 : IN STD_ULOGIC;
        SRIB7 : IN STD_ULOGIC;
        SRIB8 : IN STD_ULOGIC;
        SRIB9 : IN STD_ULOGIC;
        SRIB10 : IN STD_ULOGIC;
        SRIB11 : IN STD_ULOGIC;
        SRIB12 : IN STD_ULOGIC;
        SRIB13 : IN STD_ULOGIC;
        SRIB14 : IN STD_ULOGIC;
        SRIB15 : IN STD_ULOGIC;
        SRIB16 : IN STD_ULOGIC;
        SRIB17 : IN STD_ULOGIC;

        SIGNEDA : IN STD_ULOGIC;
        SIGNEDB : IN STD_ULOGIC;
        SOURCEA0 : IN STD_ULOGIC;
        SOURCEA1 : IN STD_ULOGIC;
        SOURCEA2 : IN STD_ULOGIC;
        SOURCEA3 : IN STD_ULOGIC;
        SOURCEB0 : IN STD_ULOGIC;
        SOURCEB1 : IN STD_ULOGIC;
        SOURCEB2 : IN STD_ULOGIC;
        SOURCEB3 : IN STD_ULOGIC;
        ADDNSUB1  : IN STD_ULOGIC;
        ADDNSUB3  : IN STD_ULOGIC;

        CE0 : IN STD_ULOGIC;
        CE1 : IN STD_ULOGIC;
        CE2 : IN STD_ULOGIC;
        CE3 : IN STD_ULOGIC;

        CLK0 : IN STD_ULOGIC;
        CLK1 : IN STD_ULOGIC;
        CLK2 : IN STD_ULOGIC;
        CLK3 : IN STD_ULOGIC;

        RST0 : IN STD_ULOGIC;
        RST1 : IN STD_ULOGIC;
        RST2 : IN STD_ULOGIC;
        RST3 : IN STD_ULOGIC;

        SROA0 : OUT STD_ULOGIC;
        SROA1 : OUT STD_ULOGIC;
        SROA2 : OUT STD_ULOGIC;
        SROA3 : OUT STD_ULOGIC;
        SROA4 : OUT STD_ULOGIC;
        SROA5 : OUT STD_ULOGIC;
        SROA6 : OUT STD_ULOGIC;
        SROA7 : OUT STD_ULOGIC;
        SROA8 : OUT STD_ULOGIC;
        SROA9 : OUT STD_ULOGIC;
        SROA10 : OUT STD_ULOGIC;
        SROA11 : OUT STD_ULOGIC;
        SROA12 : OUT STD_ULOGIC;
        SROA13 : OUT STD_ULOGIC;
        SROA14 : OUT STD_ULOGIC;
        SROA15 : OUT STD_ULOGIC;
        SROA16 : OUT STD_ULOGIC;
        SROA17 : OUT STD_ULOGIC;

        SROB0 : OUT STD_ULOGIC;
        SROB1 : OUT STD_ULOGIC;
        SROB2 : OUT STD_ULOGIC;
        SROB3 : OUT STD_ULOGIC;
        SROB4 : OUT STD_ULOGIC;
        SROB5 : OUT STD_ULOGIC;
        SROB6 : OUT STD_ULOGIC;
        SROB7 : OUT STD_ULOGIC;
        SROB8 : OUT STD_ULOGIC;
        SROB9 : OUT STD_ULOGIC;
        SROB10 : OUT STD_ULOGIC;
        SROB11 : OUT STD_ULOGIC;
        SROB12 : OUT STD_ULOGIC;
        SROB13 : OUT STD_ULOGIC;
        SROB14 : OUT STD_ULOGIC;
        SROB15 : OUT STD_ULOGIC;
        SROB16 : OUT STD_ULOGIC;
        SROB17 : OUT STD_ULOGIC;

        SUM0 : OUT STD_ULOGIC;
        SUM1 : OUT STD_ULOGIC;
        SUM2 : OUT STD_ULOGIC;
        SUM3 : OUT STD_ULOGIC;
        SUM4 : OUT STD_ULOGIC;
        SUM5 : OUT STD_ULOGIC;
        SUM6 : OUT STD_ULOGIC;
        SUM7 : OUT STD_ULOGIC;
        SUM8 : OUT STD_ULOGIC;
        SUM9 : OUT STD_ULOGIC;
        SUM10 : OUT STD_ULOGIC;
        SUM11 : OUT STD_ULOGIC;
        SUM12 : OUT STD_ULOGIC;
        SUM13 : OUT STD_ULOGIC;
        SUM14 : OUT STD_ULOGIC;
        SUM15 : OUT STD_ULOGIC;
        SUM16 : OUT STD_ULOGIC;
        SUM17 : OUT STD_ULOGIC;
        SUM18 : OUT STD_ULOGIC;
        SUM19 : OUT STD_ULOGIC;
        SUM20 : OUT STD_ULOGIC;
        SUM21 : OUT STD_ULOGIC;
        SUM22 : OUT STD_ULOGIC;
        SUM23 : OUT STD_ULOGIC;
        SUM24 : OUT STD_ULOGIC;
        SUM25 : OUT STD_ULOGIC;
        SUM26 : OUT STD_ULOGIC;
        SUM27 : OUT STD_ULOGIC;
        SUM28 : OUT STD_ULOGIC;
        SUM29 : OUT STD_ULOGIC;
        SUM30 : OUT STD_ULOGIC;
        SUM31 : OUT STD_ULOGIC;
        SUM32 : OUT STD_ULOGIC;
        SUM33 : OUT STD_ULOGIC;
        SUM34 : OUT STD_ULOGIC;
        SUM35 : OUT STD_ULOGIC;
        SUM36 : OUT STD_ULOGIC;
        SUM37 : OUT STD_ULOGIC
       ); 
  END COMPONENT;
   attribute syn_black_box of MULT18X18ADDSUBSUMB : component is true;

  COMPONENT MULT18X18MACB
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
  PORT (
        A0 : IN STD_ULOGIC;
        A1 : IN STD_ULOGIC;
        A2 : IN STD_ULOGIC;
        A3 : IN STD_ULOGIC;
        A4 : IN STD_ULOGIC;
        A5 : IN STD_ULOGIC;
        A6 : IN STD_ULOGIC;
        A7 : IN STD_ULOGIC;
        A8 : IN STD_ULOGIC;
        A9 : IN STD_ULOGIC;
        A10 : IN STD_ULOGIC;
        A11 : IN STD_ULOGIC;
        A12 : IN STD_ULOGIC;
        A13 : IN STD_ULOGIC;
        A14 : IN STD_ULOGIC;
        A15 : IN STD_ULOGIC;
        A16 : IN STD_ULOGIC;
        A17 : IN STD_ULOGIC;

        SRIA0 : IN STD_ULOGIC;
        SRIA1 : IN STD_ULOGIC;
        SRIA2 : IN STD_ULOGIC;
        SRIA3 : IN STD_ULOGIC;
        SRIA4 : IN STD_ULOGIC;
        SRIA5 : IN STD_ULOGIC;
        SRIA6 : IN STD_ULOGIC;
        SRIA7 : IN STD_ULOGIC;
        SRIA8 : IN STD_ULOGIC;
        SRIA9 : IN STD_ULOGIC;
        SRIA10 : IN STD_ULOGIC;
        SRIA11 : IN STD_ULOGIC;
        SRIA12 : IN STD_ULOGIC;
        SRIA13 : IN STD_ULOGIC;
        SRIA14 : IN STD_ULOGIC;
        SRIA15 : IN STD_ULOGIC;
        SRIA16 : IN STD_ULOGIC;
        SRIA17 : IN STD_ULOGIC;

        B0 : IN STD_ULOGIC;
        B1 : IN STD_ULOGIC;
        B2 : IN STD_ULOGIC;
        B3 : IN STD_ULOGIC;
        B4 : IN STD_ULOGIC;
        B5 : IN STD_ULOGIC;
        B6 : IN STD_ULOGIC;
        B7 : IN STD_ULOGIC;
        B8 : IN STD_ULOGIC;
        B9 : IN STD_ULOGIC;
        B10 : IN STD_ULOGIC;
        B11 : IN STD_ULOGIC;
        B12 : IN STD_ULOGIC;
        B13 : IN STD_ULOGIC;
        B14 : IN STD_ULOGIC;
        B15 : IN STD_ULOGIC;
        B16 : IN STD_ULOGIC;
        B17 : IN STD_ULOGIC;

        SRIB0 : IN STD_ULOGIC;
        SRIB1 : IN STD_ULOGIC;
        SRIB2 : IN STD_ULOGIC;
        SRIB3 : IN STD_ULOGIC;
        SRIB4 : IN STD_ULOGIC;
        SRIB5 : IN STD_ULOGIC;
        SRIB6 : IN STD_ULOGIC;
        SRIB7 : IN STD_ULOGIC;
        SRIB8 : IN STD_ULOGIC;
        SRIB9 : IN STD_ULOGIC;
        SRIB10 : IN STD_ULOGIC;
        SRIB11 : IN STD_ULOGIC;
        SRIB12 : IN STD_ULOGIC;
        SRIB13 : IN STD_ULOGIC;
        SRIB14 : IN STD_ULOGIC;
        SRIB15 : IN STD_ULOGIC;
        SRIB16 : IN STD_ULOGIC;
        SRIB17 : IN STD_ULOGIC;

        LD0    : IN STD_ULOGIC;
        LD1    : IN STD_ULOGIC;
        LD2    : IN STD_ULOGIC;
        LD3    : IN STD_ULOGIC;
        LD4    : IN STD_ULOGIC;
        LD5    : IN STD_ULOGIC;
        LD6    : IN STD_ULOGIC;
        LD7    : IN STD_ULOGIC;
        LD8    : IN STD_ULOGIC;
        LD9    : IN STD_ULOGIC;
        LD10    : IN STD_ULOGIC;
        LD11    : IN STD_ULOGIC;
        LD12    : IN STD_ULOGIC;
        LD13    : IN STD_ULOGIC;
        LD14    : IN STD_ULOGIC;
        LD15    : IN STD_ULOGIC;
        LD16    : IN STD_ULOGIC;
        LD17    : IN STD_ULOGIC;
        LD18    : IN STD_ULOGIC;
        LD19    : IN STD_ULOGIC;
        LD20    : IN STD_ULOGIC;
        LD21    : IN STD_ULOGIC;
        LD22    : IN STD_ULOGIC;
        LD23    : IN STD_ULOGIC;
        LD24    : IN STD_ULOGIC;
        LD25    : IN STD_ULOGIC;
        LD26    : IN STD_ULOGIC;
        LD27    : IN STD_ULOGIC;
        LD28    : IN STD_ULOGIC;
        LD29    : IN STD_ULOGIC;
        LD30    : IN STD_ULOGIC;
        LD31    : IN STD_ULOGIC;
        LD32    : IN STD_ULOGIC;
        LD33    : IN STD_ULOGIC;
        LD34    : IN STD_ULOGIC;
        LD35    : IN STD_ULOGIC;
        LD36    : IN STD_ULOGIC;
        LD37    : IN STD_ULOGIC;
        LD38    : IN STD_ULOGIC;
        LD39    : IN STD_ULOGIC;
        LD40    : IN STD_ULOGIC;
        LD41    : IN STD_ULOGIC;
        LD42    : IN STD_ULOGIC;
        LD43    : IN STD_ULOGIC;
        LD44    : IN STD_ULOGIC;
        LD45    : IN STD_ULOGIC;
        LD46    : IN STD_ULOGIC;
        LD47    : IN STD_ULOGIC;
        LD48    : IN STD_ULOGIC;
        LD49    : IN STD_ULOGIC;
        LD50    : IN STD_ULOGIC;
        LD51    : IN STD_ULOGIC;

        SIGNEDA : IN STD_ULOGIC;
        SIGNEDB : IN STD_ULOGIC;
        SOURCEA : IN STD_ULOGIC;
        SOURCEB : IN STD_ULOGIC;
        ACCUMSLOAD : IN STD_ULOGIC;
        ADDNSUB : IN STD_ULOGIC;

        CE0 : IN STD_ULOGIC;
        CE1 : IN STD_ULOGIC;
        CE2 : IN STD_ULOGIC;
        CE3 : IN STD_ULOGIC;

        CLK0 : IN STD_ULOGIC;
        CLK1 : IN STD_ULOGIC;
        CLK2 : IN STD_ULOGIC;
        CLK3 : IN STD_ULOGIC;

        RST0 : IN STD_ULOGIC;
        RST1 : IN STD_ULOGIC;
        RST2 : IN STD_ULOGIC;
        RST3 : IN STD_ULOGIC;

        SROA0 : OUT STD_ULOGIC;
        SROA1 : OUT STD_ULOGIC;
        SROA2 : OUT STD_ULOGIC;
        SROA3 : OUT STD_ULOGIC;
        SROA4 : OUT STD_ULOGIC;
        SROA5 : OUT STD_ULOGIC;
        SROA6 : OUT STD_ULOGIC;
        SROA7 : OUT STD_ULOGIC;
        SROA8 : OUT STD_ULOGIC;
        SROA9 : OUT STD_ULOGIC;
        SROA10 : OUT STD_ULOGIC;
        SROA11 : OUT STD_ULOGIC;
        SROA12 : OUT STD_ULOGIC;
        SROA13 : OUT STD_ULOGIC;
        SROA14 : OUT STD_ULOGIC;
        SROA15 : OUT STD_ULOGIC;
        SROA16 : OUT STD_ULOGIC;
        SROA17 : OUT STD_ULOGIC;

        SROB0 : OUT STD_ULOGIC;
        SROB1 : OUT STD_ULOGIC;
        SROB2 : OUT STD_ULOGIC;
        SROB3 : OUT STD_ULOGIC;
        SROB4 : OUT STD_ULOGIC;
        SROB5 : OUT STD_ULOGIC;
        SROB6 : OUT STD_ULOGIC;
        SROB7 : OUT STD_ULOGIC;
        SROB8 : OUT STD_ULOGIC;
        SROB9 : OUT STD_ULOGIC;
        SROB10 : OUT STD_ULOGIC;
        SROB11 : OUT STD_ULOGIC;
        SROB12 : OUT STD_ULOGIC;
        SROB13 : OUT STD_ULOGIC;
        SROB14 : OUT STD_ULOGIC;
        SROB15 : OUT STD_ULOGIC;
        SROB16 : OUT STD_ULOGIC;
        SROB17 : OUT STD_ULOGIC;

        ACCUM0 : OUT STD_ULOGIC;
        ACCUM1 : OUT STD_ULOGIC;
        ACCUM2 : OUT STD_ULOGIC;
        ACCUM3 : OUT STD_ULOGIC;
        ACCUM4 : OUT STD_ULOGIC;
        ACCUM5 : OUT STD_ULOGIC;
        ACCUM6 : OUT STD_ULOGIC;
        ACCUM7 : OUT STD_ULOGIC;
        ACCUM8 : OUT STD_ULOGIC;
        ACCUM9 : OUT STD_ULOGIC;
        ACCUM10 : OUT STD_ULOGIC;
        ACCUM11 : OUT STD_ULOGIC;
        ACCUM12 : OUT STD_ULOGIC;
        ACCUM13 : OUT STD_ULOGIC;
        ACCUM14 : OUT STD_ULOGIC;
        ACCUM15 : OUT STD_ULOGIC;
        ACCUM16 : OUT STD_ULOGIC;
        ACCUM17 : OUT STD_ULOGIC;
        ACCUM18 : OUT STD_ULOGIC;
        ACCUM19 : OUT STD_ULOGIC;
        ACCUM20 : OUT STD_ULOGIC;
        ACCUM21 : OUT STD_ULOGIC;
        ACCUM22 : OUT STD_ULOGIC;
        ACCUM23 : OUT STD_ULOGIC;
        ACCUM24 : OUT STD_ULOGIC;
        ACCUM25 : OUT STD_ULOGIC;
        ACCUM26 : OUT STD_ULOGIC;
        ACCUM27 : OUT STD_ULOGIC;
        ACCUM28 : OUT STD_ULOGIC;
        ACCUM29 : OUT STD_ULOGIC;
        ACCUM30 : OUT STD_ULOGIC;
        ACCUM31 : OUT STD_ULOGIC;
        ACCUM32 : OUT STD_ULOGIC;
        ACCUM33 : OUT STD_ULOGIC;
        ACCUM34 : OUT STD_ULOGIC;
        ACCUM35 : OUT STD_ULOGIC;
        ACCUM36 : OUT STD_ULOGIC;
        ACCUM37 : OUT STD_ULOGIC;
        ACCUM38 : OUT STD_ULOGIC;
        ACCUM39 : OUT STD_ULOGIC;
        ACCUM40 : OUT STD_ULOGIC;
        ACCUM41 : OUT STD_ULOGIC;
        ACCUM42 : OUT STD_ULOGIC;
        ACCUM43 : OUT STD_ULOGIC;
        ACCUM44 : OUT STD_ULOGIC;
        ACCUM45 : OUT STD_ULOGIC;
        ACCUM46 : OUT STD_ULOGIC;
        ACCUM47 : OUT STD_ULOGIC;
        ACCUM48 : OUT STD_ULOGIC;
        ACCUM49 : OUT STD_ULOGIC;
        ACCUM50 : OUT STD_ULOGIC;
        ACCUM51 : OUT STD_ULOGIC;
        OVERFLOW : OUT STD_ULOGIC
       ); 
  END COMPONENT;
   attribute syn_black_box of MULT18X18MACB : component is true;

  COMPONENT MULT36X36B
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
  PORT (
        A0 : IN STD_ULOGIC;
        A1 : IN STD_ULOGIC;
        A2 : IN STD_ULOGIC;
        A3 : IN STD_ULOGIC;
        A4 : IN STD_ULOGIC;
        A5 : IN STD_ULOGIC;
        A6 : IN STD_ULOGIC;
        A7 : IN STD_ULOGIC;
        A8 : IN STD_ULOGIC;
        A9 : IN STD_ULOGIC;
        A10 : IN STD_ULOGIC;
        A11 : IN STD_ULOGIC;
        A12 : IN STD_ULOGIC;
        A13 : IN STD_ULOGIC;
        A14 : IN STD_ULOGIC;
        A15 : IN STD_ULOGIC;
        A16 : IN STD_ULOGIC;
        A17 : IN STD_ULOGIC;
        A18 : IN STD_ULOGIC;
        A19 : IN STD_ULOGIC;
        A20 : IN STD_ULOGIC;
        A21 : IN STD_ULOGIC;
        A22 : IN STD_ULOGIC;
        A23 : IN STD_ULOGIC;
        A24 : IN STD_ULOGIC;
        A25 : IN STD_ULOGIC;
        A26 : IN STD_ULOGIC;
        A27 : IN STD_ULOGIC;
        A28 : IN STD_ULOGIC;
        A29 : IN STD_ULOGIC;
        A30 : IN STD_ULOGIC;
        A31 : IN STD_ULOGIC;
        A32 : IN STD_ULOGIC;
        A33 : IN STD_ULOGIC;
        A34 : IN STD_ULOGIC;
        A35 : IN STD_ULOGIC;

        B0 : IN STD_ULOGIC;
        B1 : IN STD_ULOGIC;
        B2 : IN STD_ULOGIC;
        B3 : IN STD_ULOGIC;
        B4 : IN STD_ULOGIC;
        B5 : IN STD_ULOGIC;
        B6 : IN STD_ULOGIC;
        B7 : IN STD_ULOGIC;
        B8 : IN STD_ULOGIC;
        B9 : IN STD_ULOGIC;
        B10 : IN STD_ULOGIC;
        B11 : IN STD_ULOGIC;
        B12 : IN STD_ULOGIC;
        B13 : IN STD_ULOGIC;
        B14 : IN STD_ULOGIC;
        B15 : IN STD_ULOGIC;
        B16 : IN STD_ULOGIC;
        B17 : IN STD_ULOGIC;
        B18 : IN STD_ULOGIC;
        B19 : IN STD_ULOGIC;
        B20 : IN STD_ULOGIC;
        B21 : IN STD_ULOGIC;
        B22 : IN STD_ULOGIC;
        B23 : IN STD_ULOGIC;
        B24 : IN STD_ULOGIC;
        B25 : IN STD_ULOGIC;
        B26 : IN STD_ULOGIC;
        B27 : IN STD_ULOGIC;
        B28 : IN STD_ULOGIC;
        B29 : IN STD_ULOGIC;
        B30 : IN STD_ULOGIC;
        B31 : IN STD_ULOGIC;
        B32 : IN STD_ULOGIC;
        B33 : IN STD_ULOGIC;
        B34 : IN STD_ULOGIC;
        B35 : IN STD_ULOGIC;

        SIGNEDA : IN STD_ULOGIC;
        SIGNEDB : IN STD_ULOGIC;

        CE0 : IN STD_ULOGIC;
        CE1 : IN STD_ULOGIC;
        CE2 : IN STD_ULOGIC;
        CE3 : IN STD_ULOGIC;

        CLK0 : IN STD_ULOGIC;
        CLK1 : IN STD_ULOGIC;
        CLK2 : IN STD_ULOGIC;
        CLK3 : IN STD_ULOGIC;

        RST0 : IN STD_ULOGIC;
        RST1 : IN STD_ULOGIC;
        RST2 : IN STD_ULOGIC;
        RST3 : IN STD_ULOGIC;

        P0 : OUT STD_ULOGIC;
        P1 : OUT STD_ULOGIC;
        P2 : OUT STD_ULOGIC;
        P3 : OUT STD_ULOGIC;
        P4 : OUT STD_ULOGIC;
        P5 : OUT STD_ULOGIC;
        P6 : OUT STD_ULOGIC;
        P7 : OUT STD_ULOGIC;
        P8 : OUT STD_ULOGIC;
        P9 : OUT STD_ULOGIC;
        P10 : OUT STD_ULOGIC;
        P11 : OUT STD_ULOGIC;
        P12 : OUT STD_ULOGIC;
        P13 : OUT STD_ULOGIC;
        P14 : OUT STD_ULOGIC;
        P15 : OUT STD_ULOGIC;
        P16 : OUT STD_ULOGIC;
        P17 : OUT STD_ULOGIC;
        P18 : OUT STD_ULOGIC;
        P19 : OUT STD_ULOGIC;
        P20 : OUT STD_ULOGIC;
        P21 : OUT STD_ULOGIC;
        P22 : OUT STD_ULOGIC;
        P23 : OUT STD_ULOGIC;
        P24 : OUT STD_ULOGIC;
        P25 : OUT STD_ULOGIC;
        P26 : OUT STD_ULOGIC;
        P27 : OUT STD_ULOGIC;
        P28 : OUT STD_ULOGIC;
        P29 : OUT STD_ULOGIC;
        P30 : OUT STD_ULOGIC;
        P31 : OUT STD_ULOGIC;
        P32 : OUT STD_ULOGIC;
        P33 : OUT STD_ULOGIC;
        P34 : OUT STD_ULOGIC;
        P35 : OUT STD_ULOGIC;
        P36 : OUT STD_ULOGIC;
        P37 : OUT STD_ULOGIC;
        P38 : OUT STD_ULOGIC;
        P39 : OUT STD_ULOGIC;
        P40 : OUT STD_ULOGIC;
        P41 : OUT STD_ULOGIC;
        P42 : OUT STD_ULOGIC;
        P43 : OUT STD_ULOGIC;
        P44 : OUT STD_ULOGIC;
        P45 : OUT STD_ULOGIC;
        P46 : OUT STD_ULOGIC;
        P47 : OUT STD_ULOGIC;
        P48 : OUT STD_ULOGIC;
        P49 : OUT STD_ULOGIC;
        P50 : OUT STD_ULOGIC;
        P51 : OUT STD_ULOGIC;
        P52 : OUT STD_ULOGIC;
        P53 : OUT STD_ULOGIC;
        P54 : OUT STD_ULOGIC;
        P55 : OUT STD_ULOGIC;
        P56 : OUT STD_ULOGIC;
        P57 : OUT STD_ULOGIC;
        P58 : OUT STD_ULOGIC;
        P59 : OUT STD_ULOGIC;
        P60 : OUT STD_ULOGIC;
        P61 : OUT STD_ULOGIC;
        P62 : OUT STD_ULOGIC;
        P63 : OUT STD_ULOGIC;
        P64 : OUT STD_ULOGIC;
        P65 : OUT STD_ULOGIC;
        P66 : OUT STD_ULOGIC;
        P67 : OUT STD_ULOGIC;
        P68 : OUT STD_ULOGIC;
        P69 : OUT STD_ULOGIC;
        P70 : OUT STD_ULOGIC;
        P71 : OUT STD_ULOGIC
       ); 
  END COMPONENT;
   attribute syn_black_box of MULT36X36B : component is true;
--
COMPONENT SP16KB
GENERIC(
        DATA_WIDTH   : Integer := 18;
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
        initval_1f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_20 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_21 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_22 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_23 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_24 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_25 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_26 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_27 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_28 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_29 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2a : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2b : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2c : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2d : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2e : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_30 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_31 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_32 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_33 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_34 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_35 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_36 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_37 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_38 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_39 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3a : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3b : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3c : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3d : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3e : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8            : IN STD_LOGIC := 'X';
        DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17    : IN STD_LOGIC := 'X';
        AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8            : IN STD_LOGIC := 'X';
        AD9, AD10, AD11, AD12, AD13                            : IN STD_LOGIC := 'X';
        CE, CLK, WE, CS0, CS1, CS2, RST                        : IN STD_LOGIC := 'X';

        DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8            : OUT STD_LOGIC := 'X';
        DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17    : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of SP16KB : component is true;
--
COMPONENT DP16KB
GENERIC(
        DATA_WIDTH_A : Integer := 18;
        DATA_WIDTH_B : Integer := 18;
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
        initval_1f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_20 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_21 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_22 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_23 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_24 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_25 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_26 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_27 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_28 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_29 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2a : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2b : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2c : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2d : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2e : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_30 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_31 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_32 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_33 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_34 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_35 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_36 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_37 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_38 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_39 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3a : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3b : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3c : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3d : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3e : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        DIA0, DIA1, DIA2, DIA3, DIA4, DIA5, DIA6, DIA7, DIA8            : IN STD_LOGIC := 'X';
        DIA9, DIA10, DIA11, DIA12, DIA13, DIA14, DIA15, DIA16, DIA17    : IN STD_LOGIC := 'X';
        ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8            : IN STD_LOGIC := 'X';
        ADA9, ADA10, ADA11, ADA12, ADA13                                : IN STD_LOGIC := 'X';
        CEA, CLKA, WEA, CSA0, CSA1, CSA2, RSTA                         : IN STD_LOGIC := 'X';
        DIB0, DIB1, DIB2, DIB3, DIB4, DIB5, DIB6, DIB7, DIB8            : IN STD_LOGIC := 'X';
        DIB9, DIB10, DIB11, DIB12, DIB13, DIB14, DIB15, DIB16, DIB17    : IN STD_LOGIC := 'X';
        ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8            : IN STD_LOGIC := 'X';
        ADB9, ADB10, ADB11, ADB12, ADB13                                : IN STD_LOGIC := 'X';
        CEB, CLKB, WEB, CSB0, CSB1, CSB2, RSTB                         : IN STD_LOGIC := 'X';

        DOA0, DOA1, DOA2, DOA3, DOA4, DOA5, DOA6, DOA7, DOA8            : OUT STD_LOGIC := 'X';
        DOA9, DOA10, DOA11, DOA12, DOA13, DOA14, DOA15, DOA16, DOA17    : OUT STD_LOGIC := 'X';
        DOB0, DOB1, DOB2, DOB3, DOB4, DOB5, DOB6, DOB7, DOB8            : OUT STD_LOGIC := 'X';
        DOB9, DOB10, DOB11, DOB12, DOB13, DOB14, DOB15, DOB16, DOB17    : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of DP16KB : component is true;
--
COMPONENT PDPW16KB
GENERIC(
        DATA_WIDTH_W : Integer := 36;
        DATA_WIDTH_R : Integer := 36;
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
        initval_1f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_20 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_21 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_22 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_23 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_24 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_25 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_26 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_27 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_28 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_29 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2a : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2b : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2c : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2d : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2e : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_2f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_30 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_31 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_32 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_33 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_34 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_35 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_36 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_37 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_38 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_39 : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3a : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3b : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3c : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3d : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3e : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
        initval_3f : string := "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
PORT(
        DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8            : IN STD_LOGIC := 'X';
        DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17    : IN STD_LOGIC := 'X';
        DI18, DI19, DI20, DI21, DI22, DI23, DI24, DI25, DI26   : IN STD_LOGIC := 'X';
        DI27, DI28, DI29, DI30, DI31, DI32, DI33, DI34, DI35   : IN STD_LOGIC := 'X';
        ADW0, ADW1, ADW2, ADW3, ADW4, ADW5, ADW6, ADW7, ADW8   : IN STD_LOGIC := 'X';
        BE0, BE1, BE2, BE3		                      : IN STD_LOGIC := 'X';
        CEW, CLKW, CSW0, CSW1, CSW2                        : IN STD_LOGIC := 'X';
        ADR0, ADR1, ADR2, ADR3, ADR4, ADR5, ADR6, ADR7, ADR8   : IN STD_LOGIC := 'X';
        ADR9, ADR10, ADR11, ADR12, ADR13                       : IN STD_LOGIC := 'X';
        CER, CLKR, CSR0, CSR1, CSR2, RST                       : IN STD_LOGIC := 'X';

        DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8            : OUT STD_LOGIC := 'X';
        DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17    : OUT STD_LOGIC := 'X';
        DO18, DO19, DO20, DO21, DO22, DO23, DO24, DO25, DO26   : OUT STD_LOGIC := 'X';
        DO27, DO28, DO29, DO30, DO31, DO32, DO33, DO34, DO35   : OUT STD_LOGIC := 'X'
  );
END COMPONENT;
   attribute syn_black_box of PDPW16KB : component is true;

COMPONENT PCSC
   GENERIC( CONFIG_FILE        : string  := "xaui_config.txt");
   PORT(
   SCISELCH0 : IN STD_ULOGIC;
   SCIENCH0  : IN STD_ULOGIC;
   FF_RXI_CLK_0 : IN STD_ULOGIC;
   FF_TXI_CLK_0 : IN STD_ULOGIC;
   FF_EBRD_CLK_0 : IN STD_ULOGIC;
   FF_RX_F_CLK_0 : OUT STD_ULOGIC;
   FF_RX_H_CLK_0 : OUT STD_ULOGIC;
   FF_RX_Q_CLK_0 : OUT STD_ULOGIC;
   FF_TX_D_0_0 : IN STD_ULOGIC;
   FF_TX_D_0_1 : IN STD_ULOGIC;
   FF_TX_D_0_2 : IN STD_ULOGIC;
   FF_TX_D_0_3 : IN STD_ULOGIC;
   FF_TX_D_0_4 : IN STD_ULOGIC;
   FF_TX_D_0_5 : IN STD_ULOGIC;
   FF_TX_D_0_6 : IN STD_ULOGIC;
   FF_TX_D_0_7 : IN STD_ULOGIC;
   FF_TX_D_0_8 : IN STD_ULOGIC;
   FF_TX_D_0_9 : IN STD_ULOGIC;
   FF_TX_D_0_10 : IN STD_ULOGIC;
   FF_TX_D_0_11 : IN STD_ULOGIC;
   FF_TX_D_0_12 : IN STD_ULOGIC;
   FF_TX_D_0_13 : IN STD_ULOGIC;
   FF_TX_D_0_14 : IN STD_ULOGIC;
   FF_TX_D_0_15 : IN STD_ULOGIC;
   FF_TX_D_0_16 : IN STD_ULOGIC;
   FF_TX_D_0_17 : IN STD_ULOGIC;
   FF_TX_D_0_18 : IN STD_ULOGIC;
   FF_TX_D_0_19 : IN STD_ULOGIC;
   FF_TX_D_0_20 : IN STD_ULOGIC;
   FF_TX_D_0_21 : IN STD_ULOGIC;
   FF_TX_D_0_22 : IN STD_ULOGIC;
   FF_TX_D_0_23 : IN STD_ULOGIC;
   FF_RX_D_0_0 : OUT STD_ULOGIC;
   FF_RX_D_0_1 : OUT STD_ULOGIC;
   FF_RX_D_0_2 : OUT STD_ULOGIC;
   FF_RX_D_0_3 : OUT STD_ULOGIC;
   FF_RX_D_0_4 : OUT STD_ULOGIC;
   FF_RX_D_0_5 : OUT STD_ULOGIC;
   FF_RX_D_0_6 : OUT STD_ULOGIC;
   FF_RX_D_0_7 : OUT STD_ULOGIC;
   FF_RX_D_0_8 : OUT STD_ULOGIC;
   FF_RX_D_0_9 : OUT STD_ULOGIC;
   FF_RX_D_0_10 : OUT STD_ULOGIC;
   FF_RX_D_0_11 : OUT STD_ULOGIC;
   FF_RX_D_0_12 : OUT STD_ULOGIC;
   FF_RX_D_0_13 : OUT STD_ULOGIC;
   FF_RX_D_0_14 : OUT STD_ULOGIC;
   FF_RX_D_0_15 : OUT STD_ULOGIC;
   FF_RX_D_0_16 : OUT STD_ULOGIC;
   FF_RX_D_0_17 : OUT STD_ULOGIC;
   FF_RX_D_0_18 : OUT STD_ULOGIC;
   FF_RX_D_0_19 : OUT STD_ULOGIC;
   FF_RX_D_0_20 : OUT STD_ULOGIC;
   FF_RX_D_0_21 : OUT STD_ULOGIC;
   FF_RX_D_0_22 : OUT STD_ULOGIC;
   FF_RX_D_0_23 : OUT STD_ULOGIC;
   FFC_RRST_0          : IN STD_ULOGIC;
   FFC_SIGNAL_DETECT_0 : IN STD_ULOGIC;
   FFC_SB_PFIFO_LP_0   : IN STD_ULOGIC;
   FFC_SB_INV_RX_0     : IN STD_ULOGIC;
   FFC_PFIFO_CLR_0     : IN STD_ULOGIC;
   FFC_PCIE_CT_0       : IN STD_ULOGIC;
   FFC_PCI_DET_EN_0    : IN STD_ULOGIC;
   FFC_FB_LOOPBACK_0   : IN STD_ULOGIC;
   FFC_ENABLE_CGALIGN_0 : IN STD_ULOGIC;
   FFC_EI_EN_0 : IN STD_ULOGIC;
   FFC_LANE_TX_RST_0    : IN STD_ULOGIC;
   FFC_LANE_RX_RST_0    : IN STD_ULOGIC;
   FFC_TXPWDNB_0        : IN STD_ULOGIC;
   FFC_RXPWDNB_0        : IN STD_ULOGIC;
   FFS_RLOS_LO_0       : OUT STD_ULOGIC;
   FFS_PCIE_DONE_0     : OUT STD_ULOGIC;
   FFS_PCIE_CON_0       : OUT STD_ULOGIC;
   FFS_LS_SYNC_STATUS_0 : OUT STD_ULOGIC;
   FFS_CC_UNDERRUN_0    : OUT STD_ULOGIC;
   FFS_CC_OVERRUN_0     : OUT STD_ULOGIC;
   FFS_RLOL_0           : OUT STD_ULOGIC;
   FFS_RXFBFIFO_ERROR_0 : OUT STD_ULOGIC;
   FFS_TXFBFIFO_ERROR_0 : OUT STD_ULOGIC;
   OOB_OUT_0            : OUT STD_ULOGIC;
   SCISELCH1             : IN STD_ULOGIC;
   SCIENCH1              : IN STD_ULOGIC;
   FF_RXI_CLK_1          : IN STD_ULOGIC;
   FF_TXI_CLK_1          : IN STD_ULOGIC;
   FF_EBRD_CLK_1         : IN STD_ULOGIC;
   FF_RX_F_CLK_1        : OUT STD_ULOGIC;
   FF_RX_H_CLK_1        : OUT STD_ULOGIC;
   FF_RX_Q_CLK_1        : OUT STD_ULOGIC;
   FF_TX_D_1_0           : IN STD_ULOGIC;
   FF_TX_D_1_1           : IN STD_ULOGIC;
   FF_TX_D_1_2           : IN STD_ULOGIC;
   FF_TX_D_1_3           : IN STD_ULOGIC;
   FF_TX_D_1_4           : IN STD_ULOGIC;
   FF_TX_D_1_5           : IN STD_ULOGIC;
   FF_TX_D_1_6           : IN STD_ULOGIC;
   FF_TX_D_1_7           : IN STD_ULOGIC;
   FF_TX_D_1_8           : IN STD_ULOGIC;
   FF_TX_D_1_9           : IN STD_ULOGIC;
   FF_TX_D_1_10          : IN STD_ULOGIC;
   FF_TX_D_1_11          : IN STD_ULOGIC;
   FF_TX_D_1_12          : IN STD_ULOGIC;
   FF_TX_D_1_13          : IN STD_ULOGIC; 
   FF_TX_D_1_14          : IN STD_ULOGIC;
   FF_TX_D_1_15          : IN STD_ULOGIC;
   FF_TX_D_1_16          : IN STD_ULOGIC;
   FF_TX_D_1_17          : IN STD_ULOGIC;
   FF_TX_D_1_18          : IN STD_ULOGIC;
   FF_TX_D_1_19          : IN STD_ULOGIC;
   FF_TX_D_1_20          : IN STD_ULOGIC;
   FF_TX_D_1_21          : IN STD_ULOGIC;
   FF_TX_D_1_22          : IN STD_ULOGIC;
   FF_TX_D_1_23          : IN STD_ULOGIC;
   FF_RX_D_1_0          : OUT STD_ULOGIC;
   FF_RX_D_1_1          : OUT STD_ULOGIC;
   FF_RX_D_1_2          : OUT STD_ULOGIC;
   FF_RX_D_1_3          : OUT STD_ULOGIC;
   FF_RX_D_1_4          : OUT STD_ULOGIC;
   FF_RX_D_1_5          : OUT STD_ULOGIC;
   FF_RX_D_1_6          : OUT STD_ULOGIC;
   FF_RX_D_1_7          : OUT STD_ULOGIC;
   FF_RX_D_1_8          : OUT STD_ULOGIC;
   FF_RX_D_1_9          : OUT STD_ULOGIC;
   FF_RX_D_1_10         : OUT STD_ULOGIC;
   FF_RX_D_1_11         : OUT STD_ULOGIC;
   FF_RX_D_1_12         : OUT STD_ULOGIC;
   FF_RX_D_1_13         : OUT STD_ULOGIC;
   FF_RX_D_1_14         : OUT STD_ULOGIC;
   FF_RX_D_1_15         : OUT STD_ULOGIC;
   FF_RX_D_1_16         : OUT STD_ULOGIC;
   FF_RX_D_1_17         : OUT STD_ULOGIC;
   FF_RX_D_1_18         : OUT STD_ULOGIC;
   FF_RX_D_1_19         : OUT STD_ULOGIC;
   FF_RX_D_1_20         : OUT STD_ULOGIC;
   FF_RX_D_1_21         : OUT STD_ULOGIC;
   FF_RX_D_1_22         : OUT STD_ULOGIC;
   FF_RX_D_1_23         : OUT STD_ULOGIC;
   FFC_RRST_1            : IN STD_ULOGIC;
   FFC_SIGNAL_DETECT_1   : IN STD_ULOGIC;
   FFC_SB_PFIFO_LP_1     : IN STD_ULOGIC;
   FFC_SB_INV_RX_1       : IN STD_ULOGIC;
   FFC_PFIFO_CLR_1       : IN STD_ULOGIC;
   FFC_PCIE_CT_1         : IN STD_ULOGIC;
   FFC_PCI_DET_EN_1      : IN STD_ULOGIC;
   FFC_FB_LOOPBACK_1     : IN STD_ULOGIC;
   FFC_ENABLE_CGALIGN_1  : IN STD_ULOGIC;
   FFC_EI_EN_1           : IN STD_ULOGIC;
   FFC_LANE_TX_RST_1     : IN STD_ULOGIC;
   FFC_LANE_RX_RST_1     : IN STD_ULOGIC;
   FFC_TXPWDNB_1         : IN STD_ULOGIC;
   FFC_RXPWDNB_1         : IN STD_ULOGIC;
   FFS_RLOS_LO_1        : OUT STD_ULOGIC;
   FFS_PCIE_DONE_1      : OUT STD_ULOGIC;
   FFS_PCIE_CON_1       : OUT STD_ULOGIC;
   FFS_LS_SYNC_STATUS_1 : OUT STD_ULOGIC;
   FFS_CC_UNDERRUN_1    : OUT STD_ULOGIC;
   FFS_CC_OVERRUN_1     : OUT STD_ULOGIC;
   FFS_RLOL_1           : OUT STD_ULOGIC;
   FFS_RXFBFIFO_ERROR_1 : OUT STD_ULOGIC;
   FFS_TXFBFIFO_ERROR_1 : OUT STD_ULOGIC;
   OOB_OUT_1            : OUT STD_ULOGIC;
   SCISELCH2             : IN STD_ULOGIC;
   SCIENCH2              : IN STD_ULOGIC;
   FF_RXI_CLK_2          : IN STD_ULOGIC;
   FF_TXI_CLK_2          : IN STD_ULOGIC;
   FF_EBRD_CLK_2         : IN STD_ULOGIC;
   FF_RX_F_CLK_2        : OUT STD_ULOGIC;
   FF_RX_H_CLK_2        : OUT STD_ULOGIC;
   FF_RX_Q_CLK_2        : OUT STD_ULOGIC;
   FF_TX_D_2_0           : IN STD_ULOGIC;
   FF_TX_D_2_1           : IN STD_ULOGIC;
   FF_TX_D_2_2           : IN STD_ULOGIC;
   FF_TX_D_2_3           : IN STD_ULOGIC;
   FF_TX_D_2_4           : IN STD_ULOGIC;
   FF_TX_D_2_5           : IN STD_ULOGIC;
   FF_TX_D_2_6           : IN STD_ULOGIC;
   FF_TX_D_2_7           : IN STD_ULOGIC;
   FF_TX_D_2_8           : IN STD_ULOGIC;
   FF_TX_D_2_9           : IN STD_ULOGIC;
   FF_TX_D_2_10          : IN STD_ULOGIC;
   FF_TX_D_2_11          : IN STD_ULOGIC;
   FF_TX_D_2_12          : IN STD_ULOGIC;
   FF_TX_D_2_13          : IN STD_ULOGIC;
   FF_TX_D_2_14          : IN STD_ULOGIC;
   FF_TX_D_2_15          : IN STD_ULOGIC;
   FF_TX_D_2_16          : IN STD_ULOGIC;
   FF_TX_D_2_17          : IN STD_ULOGIC;
   FF_TX_D_2_18          : IN STD_ULOGIC;
   FF_TX_D_2_19          : IN STD_ULOGIC;
   FF_TX_D_2_20          : IN STD_ULOGIC;
   FF_TX_D_2_21          : IN STD_ULOGIC;
   FF_TX_D_2_22          : IN STD_ULOGIC;
   FF_TX_D_2_23          : IN STD_ULOGIC;
   FF_RX_D_2_0          : OUT STD_ULOGIC;
   FF_RX_D_2_1          : OUT STD_ULOGIC;
   FF_RX_D_2_2          : OUT STD_ULOGIC;
   FF_RX_D_2_3          : OUT STD_ULOGIC;
   FF_RX_D_2_4          : OUT STD_ULOGIC;
   FF_RX_D_2_5          : OUT STD_ULOGIC;
   FF_RX_D_2_6          : OUT STD_ULOGIC;
   FF_RX_D_2_7          : OUT STD_ULOGIC;
   FF_RX_D_2_8          : OUT STD_ULOGIC;
   FF_RX_D_2_9          : OUT STD_ULOGIC;
   FF_RX_D_2_10         : OUT STD_ULOGIC;
   FF_RX_D_2_11         : OUT STD_ULOGIC;
   FF_RX_D_2_12         : OUT STD_ULOGIC;
   FF_RX_D_2_13         : OUT STD_ULOGIC;
   FF_RX_D_2_14         : OUT STD_ULOGIC;
   FF_RX_D_2_15         : OUT STD_ULOGIC;
   FF_RX_D_2_16         : OUT STD_ULOGIC;
   FF_RX_D_2_17         : OUT STD_ULOGIC;
   FF_RX_D_2_18         : OUT STD_ULOGIC;
   FF_RX_D_2_19         : OUT STD_ULOGIC;
   FF_RX_D_2_20         : OUT STD_ULOGIC;
   FF_RX_D_2_21         : OUT STD_ULOGIC;
   FF_RX_D_2_22         : OUT STD_ULOGIC;
   FF_RX_D_2_23         : OUT STD_ULOGIC;
   FFC_RRST_2            : IN STD_ULOGIC;
   FFC_SIGNAL_DETECT_2   : IN STD_ULOGIC;
   FFC_SB_PFIFO_LP_2     : IN STD_ULOGIC;
   FFC_SB_INV_RX_2       : IN STD_ULOGIC;
   FFC_PFIFO_CLR_2       : IN STD_ULOGIC;
   FFC_PCIE_CT_2         : IN STD_ULOGIC;
   FFC_PCI_DET_EN_2      : IN STD_ULOGIC;
   FFC_FB_LOOPBACK_2     : IN STD_ULOGIC;
   FFC_ENABLE_CGALIGN_2  : IN STD_ULOGIC;
   FFC_EI_EN_2           : IN STD_ULOGIC;
   FFC_LANE_TX_RST_2     : IN STD_ULOGIC;
   FFC_LANE_RX_RST_2     : IN STD_ULOGIC;
   FFC_TXPWDNB_2         : IN STD_ULOGIC;
   FFC_RXPWDNB_2         : IN STD_ULOGIC;
   FFS_RLOS_LO_2        : OUT STD_ULOGIC;
   FFS_PCIE_DONE_2      : OUT STD_ULOGIC;
   FFS_PCIE_CON_2       : OUT STD_ULOGIC;
   FFS_LS_SYNC_STATUS_2 : OUT STD_ULOGIC;
   FFS_CC_UNDERRUN_2    : OUT STD_ULOGIC;
   FFS_CC_OVERRUN_2     : OUT STD_ULOGIC;
   FFS_RLOL_2           : OUT STD_ULOGIC;
   FFS_RXFBFIFO_ERROR_2 : OUT STD_ULOGIC;
   FFS_TXFBFIFO_ERROR_2 : OUT STD_ULOGIC;
   OOB_OUT_2            : OUT STD_ULOGIC;
   SCISELCH3             : IN STD_ULOGIC;
   SCIENCH3              : IN STD_ULOGIC;
   FF_RXI_CLK_3 : IN STD_ULOGIC;
   FF_TXI_CLK_3 : IN STD_ULOGIC;
   FF_EBRD_CLK_3 : IN STD_ULOGIC;
   FF_RX_F_CLK_3 : OUT STD_ULOGIC;
   FF_RX_H_CLK_3 : OUT STD_ULOGIC;
   FF_RX_Q_CLK_3 : OUT STD_ULOGIC;
   FF_TX_D_3_0 : IN STD_ULOGIC;
   FF_TX_D_3_1 : IN STD_ULOGIC;
   FF_TX_D_3_2 : IN STD_ULOGIC;
   FF_TX_D_3_3 : IN STD_ULOGIC;
   FF_TX_D_3_4 : IN STD_ULOGIC;
   FF_TX_D_3_5 : IN STD_ULOGIC;
   FF_TX_D_3_6 : IN STD_ULOGIC;
   FF_TX_D_3_7 : IN STD_ULOGIC;
   FF_TX_D_3_8 : IN STD_ULOGIC;
   FF_TX_D_3_9 : IN STD_ULOGIC;
   FF_TX_D_3_10 : IN STD_ULOGIC;
   FF_TX_D_3_11 : IN STD_ULOGIC;
   FF_TX_D_3_12 : IN STD_ULOGIC;
   FF_TX_D_3_13 : IN STD_ULOGIC;
   FF_TX_D_3_14 : IN STD_ULOGIC;
   FF_TX_D_3_15 : IN STD_ULOGIC;
   FF_TX_D_3_16 : IN STD_ULOGIC;
   FF_TX_D_3_17 : IN STD_ULOGIC;
   FF_TX_D_3_18 : IN STD_ULOGIC;
   FF_TX_D_3_19 : IN STD_ULOGIC;
   FF_TX_D_3_20 : IN STD_ULOGIC;
   FF_TX_D_3_21 : IN STD_ULOGIC;
   FF_TX_D_3_22 : IN STD_ULOGIC;
   FF_TX_D_3_23 : IN STD_ULOGIC;
   FF_RX_D_3_0 : OUT STD_ULOGIC;
   FF_RX_D_3_1 : OUT STD_ULOGIC;
   FF_RX_D_3_2 : OUT STD_ULOGIC;
   FF_RX_D_3_3 : OUT STD_ULOGIC;
   FF_RX_D_3_4 : OUT STD_ULOGIC;
   FF_RX_D_3_5 : OUT STD_ULOGIC;
   FF_RX_D_3_6 : OUT STD_ULOGIC;
   FF_RX_D_3_7 : OUT STD_ULOGIC;
   FF_RX_D_3_8 : OUT STD_ULOGIC;
   FF_RX_D_3_9 : OUT STD_ULOGIC;
   FF_RX_D_3_10 : OUT STD_ULOGIC;
   FF_RX_D_3_11 : OUT STD_ULOGIC;
   FF_RX_D_3_12 : OUT STD_ULOGIC;
   FF_RX_D_3_13 : OUT STD_ULOGIC;
   FF_RX_D_3_14 : OUT STD_ULOGIC;
   FF_RX_D_3_15 : OUT STD_ULOGIC;
   FF_RX_D_3_16 : OUT STD_ULOGIC;
   FF_RX_D_3_17 : OUT STD_ULOGIC;
   FF_RX_D_3_18 : OUT STD_ULOGIC;
   FF_RX_D_3_19 : OUT STD_ULOGIC;
   FF_RX_D_3_20 : OUT STD_ULOGIC;
   FF_RX_D_3_21 : OUT STD_ULOGIC;
   FF_RX_D_3_22 : OUT STD_ULOGIC;
   FF_RX_D_3_23 : OUT STD_ULOGIC;
   FFC_RRST_3 : IN STD_ULOGIC;
   FFC_SIGNAL_DETECT_3 : IN STD_ULOGIC;
   FFC_SB_PFIFO_LP_3 : IN STD_ULOGIC;
   FFC_SB_INV_RX_3 : IN STD_ULOGIC;
   FFC_PFIFO_CLR_3 : IN STD_ULOGIC;
   FFC_PCIE_CT_3 : IN STD_ULOGIC;
   FFC_PCI_DET_EN_3 : IN STD_ULOGIC;
   FFC_FB_LOOPBACK_3 : IN STD_ULOGIC;
   FFC_ENABLE_CGALIGN_3 : IN STD_ULOGIC;
   FFC_EI_EN_3 : IN STD_ULOGIC;
   FFC_LANE_TX_RST_3 : IN STD_ULOGIC;
   FFC_LANE_RX_RST_3 : IN STD_ULOGIC;
   FFC_TXPWDNB_3 : IN STD_ULOGIC;
   FFC_RXPWDNB_3 : IN STD_ULOGIC;
   FFS_RLOS_LO_3 : OUT STD_ULOGIC;
   FFS_PCIE_DONE_3 : OUT STD_ULOGIC;
   FFS_PCIE_CON_3 : OUT STD_ULOGIC;
   FFS_LS_SYNC_STATUS_3 : OUT STD_ULOGIC;
   FFS_CC_UNDERRUN_3 : OUT STD_ULOGIC;
   FFS_CC_OVERRUN_3 : OUT STD_ULOGIC;
   FFS_RLOL_3 : OUT STD_ULOGIC;
   FFS_RXFBFIFO_ERROR_3 : OUT STD_ULOGIC;
   FFS_TXFBFIFO_ERROR_3 : OUT STD_ULOGIC;
   OOB_OUT_3 : OUT STD_ULOGIC;
   SCIWDATA0 : IN STD_ULOGIC;
   SCIWDATA1 : IN STD_ULOGIC;
   SCIWDATA2 : IN STD_ULOGIC;
   SCIWDATA3 : IN STD_ULOGIC;
   SCIWDATA4 : IN STD_ULOGIC;
   SCIWDATA5 : IN STD_ULOGIC;
   SCIWDATA6 : IN STD_ULOGIC;
   SCIWDATA7 : IN STD_ULOGIC;
   SCIADDR0 : IN STD_ULOGIC;
   SCIADDR1 : IN STD_ULOGIC;
   SCIADDR2 : IN STD_ULOGIC;
   SCIADDR3 : IN STD_ULOGIC;
   SCIADDR4 : IN STD_ULOGIC;
   SCIADDR5 : IN STD_ULOGIC;
   SCIENAUX : IN STD_ULOGIC;
   SCISELAUX : IN STD_ULOGIC;
   SCIRD : IN STD_ULOGIC;
   SCIWSTN : IN STD_ULOGIC;
   SCIRDATA0 : OUT STD_ULOGIC;
   SCIRDATA1 : OUT STD_ULOGIC;
   SCIRDATA2 : OUT STD_ULOGIC;
   SCIRDATA3 : OUT STD_ULOGIC;
   SCIRDATA4 : OUT STD_ULOGIC;
   SCIRDATA5 : OUT STD_ULOGIC;
   SCIRDATA6 : OUT STD_ULOGIC;
   SCIRDATA7 : OUT STD_ULOGIC;
   SCIINT : OUT STD_ULOGIC;
   FFC_CK_CORE_RX : IN STD_ULOGIC;
   FFC_CK_CORE_TX : IN STD_ULOGIC;
   FFC_MACRO_RST : IN STD_ULOGIC;
   FFC_QUAD_RST : IN STD_ULOGIC;
   FFC_TRST : IN STD_ULOGIC;
   FF_TX_F_CLK : OUT STD_ULOGIC;
   FF_TX_H_CLK : OUT STD_ULOGIC;
   FF_TX_Q_CLK : OUT STD_ULOGIC;
   CYAWSTN : IN STD_ULOGIC;
   REFCK2CORE : OUT STD_ULOGIC;
   FFS_PLOL : OUT STD_ULOGIC;
   CIN0 : IN STD_ULOGIC;
   CIN1 : IN STD_ULOGIC;
   CIN2 : IN STD_ULOGIC;
   CIN3 : IN STD_ULOGIC;
   CIN4 : IN STD_ULOGIC;
   CIN5 : IN STD_ULOGIC;
   CIN6 : IN STD_ULOGIC;
   CIN7 : IN STD_ULOGIC;
   CIN8 : IN STD_ULOGIC;
   CIN9 : IN STD_ULOGIC;
   CIN10 : IN STD_ULOGIC;
   CIN11 : IN STD_ULOGIC;
   COUT0 : OUT STD_ULOGIC;
   COUT1 : OUT STD_ULOGIC;
   COUT2 : OUT STD_ULOGIC;
   COUT3 : OUT STD_ULOGIC;
   COUT4 : OUT STD_ULOGIC;
   COUT5 : OUT STD_ULOGIC;
   COUT6 : OUT STD_ULOGIC;
   COUT7 : OUT STD_ULOGIC;
   COUT8 : OUT STD_ULOGIC;
   COUT9 : OUT STD_ULOGIC;
   COUT10 : OUT STD_ULOGIC; 
   COUT11 : OUT STD_ULOGIC;
   COUT12 : OUT STD_ULOGIC;
   COUT13 : OUT STD_ULOGIC;
   COUT14 : OUT STD_ULOGIC;
   COUT15 : OUT STD_ULOGIC;
   COUT16 : OUT STD_ULOGIC;
   COUT17 : OUT STD_ULOGIC;
   COUT18 : OUT STD_ULOGIC;
   COUT19 : OUT STD_ULOGIC;
   HDINP0 : IN STD_ULOGIC;
   HDINP1 : IN STD_ULOGIC;
   HDINP2 : IN STD_ULOGIC;
   HDINP3 : IN STD_ULOGIC;
   HDINN0 : IN STD_ULOGIC;
   HDINN1 : IN STD_ULOGIC;
   HDINN2 : IN STD_ULOGIC;
   HDINN3 : IN STD_ULOGIC;
   HDOUTP0 : OUT STD_ULOGIC;
   HDOUTP1 : OUT STD_ULOGIC;
   HDOUTP2 : OUT STD_ULOGIC;
   HDOUTP3 : OUT STD_ULOGIC;
   HDOUTN0 : OUT STD_ULOGIC;
   HDOUTN1 : OUT STD_ULOGIC;
   HDOUTN2 : OUT STD_ULOGIC;
   HDOUTN3 : OUT STD_ULOGIC;
   REFCLKP : IN STD_ULOGIC;
   REFCLKN : IN STD_ULOGIC);
END COMPONENT;
   attribute syn_black_box of PCSC : component is true;
attribute black_box_pad_pin of PCSC : COMPONENT is "HDINP0,HDINN0,HDINP1,HDINN1,HDINP2,HDINN2,HDINP3,HDINN3,HDOUTP0,HDOUTN0,HDOUTP1,HDOUTN1,HDOUTP2,HDOUTN2,HDOUTP3,HDOUTN3,REFCLKP,REFCLKN";
END COMPONENTs;






