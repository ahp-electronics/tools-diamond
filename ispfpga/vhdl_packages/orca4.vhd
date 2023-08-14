-- -------------------------------------------------------------------- 
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<< 
-- -------------------------------------------------------------------- 
-- Copyright (c) 2005 by Lattice Semiconductor Corporation 
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
-- Header files for orca4 family.
-- 
-- -------------------------------------------------------------------- 
-- 
-- Revision History : 
-- --------------------------------------------------------------------
--   Ver  :| Author            :| Mod. Date   :| Changes Made:
--   V5.0 :| LPA               :| 03/10/2005  :| Added Headers 
-- --------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
--library synplify;
--use synplify.attributes.all;
package orcacomp is
   attribute syn_black_box: boolean ;
   attribute syn_noprune: boolean;
   attribute black_box_tri_pins : string;
   attribute black_box_pad_pin : string;
   attribute syn_black_box of orcacomp : package is true;


component PFUMX41
 port (
 D0 : in std_logic;
 D1 : in std_logic;
 D2 : in std_logic;
 D3 : in std_logic;
 SD1 : in std_logic;
 SD2 : in std_logic;
 Z : out std_logic);
end component;
attribute syn_black_box of PFUMX41 : component is true;


component PLL1
 port (
 CLKIN : in std_logic;
 CLKOUT : out std_logic;
 LOCK : out std_logic);
end component;
attribute syn_black_box of PLL1 : component is true;


component PLL2
 port (
 CLKIN : in std_logic;
 CLKOUT : out std_logic;
 LOCK : out std_logic);
end component;
attribute syn_black_box of PLL2 : component is true;


component PPLL
 port (
 CLKIN : in std_logic;
 FB : in std_logic;
 INTFB : out std_logic;
 MCLK : out std_logic;
 NCLK : out std_logic;
 LOCK : out std_logic);
end component;
attribute syn_black_box of PPLL : component is true;


component HPPLL
PORT(
 CLKIN : in std_logic;
 FB : in std_logic;
 INTFB : out std_logic;
 MCLK : out std_logic;
 NCLK : out std_logic;
 LOCK : out std_logic);
 
end component;
attribute syn_black_box of HPPLL : component is true;


component BR512X18
 port (
 AW18 : in std_logic;
 AW17 : in std_logic;
 AW16 : in std_logic;
 AW15 : in std_logic;
 AW14 : in std_logic;
 AW13 : in std_logic;
 AW12 : in std_logic;
 AW11 : in std_logic;
 AW10 : in std_logic;
 AW08 : in std_logic;
 AW07 : in std_logic;
 AW06 : in std_logic;
 AW05 : in std_logic;
 AW04 : in std_logic;
 AW03 : in std_logic;
 AW02 : in std_logic;
 AW01 : in std_logic;
 AW00 : in std_logic;
 D117 : in std_logic;
 D116 : in std_logic;
 D115 : in std_logic;
 D114 : in std_logic;
 D113 : in std_logic;
 D112 : in std_logic;
 D111 : in std_logic;
 D110 : in std_logic;
 D19 : in std_logic;
 D18 : in std_logic;
 D17 : in std_logic;
 D16 : in std_logic;
 D15 : in std_logic;
 D14 : in std_logic;
 D13 : in std_logic;
 D12 : in std_logic;
 D11 : in std_logic;
 D10 : in std_logic;
 D017 : in std_logic;
 D016 : in std_logic;
 D015 : in std_logic;
 D014 : in std_logic;
 D013 : in std_logic;
 D012 : in std_logic;
 D011 : in std_logic;
 D010 : in std_logic;
 D09 : in std_logic;
 D08 : in std_logic;
 D07 : in std_logic;
 D06 : in std_logic;
 D05 : in std_logic;
 D04 : in std_logic;
 D03 : in std_logic;
 D02 : in std_logic;
 D01 : in std_logic;
 D00 : in std_logic;
 BW11 : in std_logic;
 BW10 : in std_logic;
 BW01 : in std_logic;
 BW00 : in std_logic;
 AR18 : in std_logic;
 AR17 : in std_logic;
 AR16 : in std_logic;
 AR15 : in std_logic;
 AR14 : in std_logic;
 AR13 : in std_logic;
 AR12 : in std_logic;
 AR11 : in std_logic;
 AR10 : in std_logic;
 AR08 : in std_logic;
 AR07 : in std_logic;
 AR06 : in std_logic;
 AR05 : in std_logic;
 AR04 : in std_logic;
 AR03 : in std_logic;
 AR02 : in std_logic;
 AR01 : in std_logic;
 AR00 : in std_logic;
 CKW0 : in std_logic;
 CKW1 : in std_logic;
 CKR1 : in std_logic;
 CKR0 : in std_logic;
 CSW0 : in std_logic;
 CSW1 : in std_logic;
 CSR1 : in std_logic;
 CSR0 : in std_logic;
 Q117 : out std_logic;
 Q116 : out std_logic;
 Q115 : out std_logic;
 Q114 : out std_logic;
 Q113 : out std_logic;
 Q112 : out std_logic;
 Q111 : out std_logic;
 Q110 : out std_logic;
 Q19 : out std_logic;
 Q18 : out std_logic;
 Q17 : out std_logic;
 Q16 : out std_logic;
 Q15 : out std_logic;
 Q14 : out std_logic;
 Q13 : out std_logic;
 Q12 : out std_logic;
 Q11 : out std_logic;
 Q10 : out std_logic;
 Q017 : out std_logic;
 Q016 : out std_logic;
 Q015 : out std_logic;
 Q014 : out std_logic;
 Q013 : out std_logic;
 Q012 : out std_logic;
 Q011 : out std_logic;
 Q010 : out std_logic;
 Q09 : out std_logic;
 Q08 : out std_logic;
 Q07 : out std_logic;
 Q06 : out std_logic;
 Q05 : out std_logic;
 Q04 : out std_logic;
 Q03 : out std_logic;
 Q02 : out std_logic;
 Q01 : out std_logic;
 Q00 : out std_logic;
 BUSY : out std_logic);
end component;
attribute syn_black_box of BR512X18 : component is true;


component MUX81
 port (
 D0 : in std_logic;
 D1 : in std_logic;
 D2 : in std_logic;
 D3 : in std_logic;
 D4 : in std_logic;
 D5 : in std_logic;
 D6 : in std_logic;
 D7 : in std_logic;
 SD1 : in std_logic;
 SD2 : in std_logic;
 SD3 : in std_logic;
 Z : out std_logic);
end component;
attribute syn_black_box of MUX81 : component is true;


component XOR5
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of XOR5 : component is true;
component XOR4
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of XOR4 : component is true;
component XOR21
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   F : in std_logic;
   G : in std_logic;
   H : in std_logic;
   I : in std_logic;
   J : in std_logic;
   K : in std_logic;
   L : in std_logic;
   M : in std_logic;
   N : in std_logic;
   O : in std_logic;
   P : in std_logic;
   Q : in std_logic;
   R : in std_logic;
   S : in std_logic;
   T : in std_logic;
   U : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of XOR21 : component is true;
component XOR2
 port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of XOR2 : component is true;
component XOR11
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   F : in std_logic;
   G : in std_logic;
   H : in std_logic;
   I : in std_logic;
   J : in std_logic;
   K : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of XOR11 : component is true;
component XNOR5
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of XNOR5 : component is true;
component XNOR4
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of XNOR4 : component is true;
component XNOR3
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of XNOR3 : component is true;
component XNOR2
 port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of XNOR2 : component is true;
component VLO
 port (
   Z : out std_logic
 );
end component;
attribute syn_black_box of VLO : component is true;
component VHI
 port (
   Z : out std_logic
 );
end component;
attribute syn_black_box of VHI : component is true;
component TSALL
 port (
   TSALL : in std_logic
 );
end component;
attribute syn_black_box of TSALL : component is true;
attribute syn_noprune of TSALL : component is true;
component TIBUF
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of TIBUF : component is true;
attribute black_box_tri_pins of TIBUF : component is "O";
component TBUF
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of TBUF : component is true;
attribute black_box_tri_pins of TBUF : component is "O";
component STRTUP
 port (
   UCLK : in std_logic
 );
end component;
attribute syn_black_box of STRTUP : component is true;
component SOR8
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   F : in std_logic;
   G : in std_logic;
   H : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of SOR8 : component is true;
component SOR6
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   F : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of SOR6 : component is true;
component SOR4
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of SOR4 : component is true;
component SOR2
 port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of SOR2 : component is true;
component SOR10
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   F : in std_logic;
   G : in std_logic;
   H : in std_logic;
   I : in std_logic;
   J : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of SOR10 : component is true;
component SAOI442
 port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   B4 : in std_logic;
   C1 : in std_logic;
   C2 : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of SAOI442 : component is true;
component SAOI44
 port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   B4 : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of SAOI44 : component is true;
component SAOI42
 port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of SAOI42 : component is true;
component SAND8
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   F : in std_logic;
   G : in std_logic;
   H : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of SAND8 : component is true;
component SAND6
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   F : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of SAND6 : component is true;
component SAND4
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of SAND4 : component is true;
component SAND2
 port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of SAND2 : component is true;
component SAND10
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   F : in std_logic;
   G : in std_logic;
   H : in std_logic;
   I : in std_logic;
   J : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of SAND10 : component is true;
component ROM32X4
 port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   AD4 : in std_logic;
   CK : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic;
   DO2 : out std_logic;
   DO3 : out std_logic;
   QDO0 : out std_logic;
   QDO1 : out std_logic;
   QDO2 : out std_logic;
   QDO3 : out std_logic
 );
end component;
attribute syn_black_box of ROM32X4 : component is true;
component ROM32X1
 port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   AD4 : in std_logic;
   DO0 : out std_logic
 );
end component;
attribute syn_black_box of ROM32X1 : component is true;
component ROM16X1
 port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DO0 : out std_logic
 );
end component;
attribute syn_black_box of ROM16X1 : component is true;
component READBK
 port (
   RDCFGN : in std_logic;
   CAPT : in std_logic;
   PRDDATA : out std_logic;
   RDBO : out std_logic
 );
end component;
attribute syn_black_box of READBK : component is true;
component RCE32X4
 port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   AD4 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   DI2 : in std_logic;
   DI3 : in std_logic;
   CK : in std_logic;
   WREN : in std_logic;
   WPE0 : in std_logic;
   WPE1 : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic;
   DO2 : out std_logic;
   DO3 : out std_logic;
   QDO0 : out std_logic;
   QDO1 : out std_logic;
   QDO2 : out std_logic;
   QDO3 : out std_logic
 );
end component;
attribute syn_black_box of RCE32X4 : component is true;
component PLLT
 port (
   CLKIN : in std_logic;
   FB:     in std_logic;
   ECLK : out std_logic;
   SCLK : out std_logic;
   LOCK : out std_logic
 );
end component;
attribute syn_black_box of PLLT : component is true;
attribute syn_noprune of PLLT: component is true;
component PLLB
 port (
   CLKIN : in std_logic;
   FB:     in std_logic;
   ECLK : out std_logic;
   SCLK : out std_logic;
   LOCK : out std_logic
 );
end component;
attribute syn_black_box of PLLB : component is true;
attribute syn_noprune of PLLB: component is true;
component PCMT
 port (
   CLKIN : in std_logic;
   FB:     in std_logic;
   WE:     in std_logic;
   RE:     in std_logic;
   A0:     in std_logic;
   A1:     in std_logic;
   A2:     in std_logic;
   DI0:    in std_logic;
   DI1:    in std_logic;
   DI2:    in std_logic;
   DI3:    in std_logic;
   DI4:    in std_logic;
   DI5:    in std_logic;
   DI6:    in std_logic;
   DI7:    in std_logic;
   DO0:    out std_logic;
   DO1:    out std_logic;
   DO2:    out std_logic;
   DO3:    out std_logic;
   DO4:    out std_logic;
   DO5:    out std_logic;
   DO6:    out std_logic;
   DO7:    out std_logic;
   ECLK :  out std_logic;
   SCLK :  out std_logic;
   LOCK :  out std_logic
 );
end component;
attribute syn_black_box of PCMT : component is true;
component PCMB
 port (
   CLKIN : in std_logic;
   FB:     in std_logic;
   WE:     in std_logic;
   RE:     in std_logic;
   A0:     in std_logic;
   A1:     in std_logic;
   A2:     in std_logic;
   DI0:    in std_logic;
   DI1:    in std_logic;
   DI2:    in std_logic;
   DI3:    in std_logic;
   DI4:    in std_logic;
   DI5:    in std_logic;
   DI6:    in std_logic;
   DI7:    in std_logic;
   DO0:    out std_logic;
   DO1:    out std_logic;
   DO2:    out std_logic;
   DO3:    out std_logic;
   DO4:    out std_logic;
   DO5:    out std_logic;
   DO6:    out std_logic;
   DO7:    out std_logic;
   ECLK :  out std_logic;
   SCLK :  out std_logic;
   LOCK :  out std_logic
 );
end component;
attribute syn_black_box of PCMB : component is true;
component PFUMX
 port (
   ALUT : in std_logic;
   BLUT : in std_logic;
   C0 : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of PFUMX : component is true;
component PCMBUFT
 port (
   CLKIN : in std_logic;
   ECLK : out std_logic;
   SCLK : out std_logic
 );
end component;
attribute syn_black_box of PCMBUFT : component is true;
component PCMBUFB
 port (
   CLKIN : in std_logic;
   ECLK : out std_logic;
   SCLK : out std_logic
 );
end component;
attribute syn_black_box of PCMBUFB : component is true;
component OSXOR2
 port (
   A : in std_logic;
   SCLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OSXOR2 : component is true;
component OSXNOR2
 port (
   A : in std_logic;
   SCLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OSXNOR2 : component is true;
component OSOR2
 port (
   A : in std_logic;
   SCLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OSOR2 : component is true;
component OSNR2
 port (
   A : in std_logic;
   SCLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OSNR2 : component is true;
component OSND2
 port (
   A : in std_logic;
   SCLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OSND2 : component is true;
component OSMUX21
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   SCLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OSMUX21 : component is true;
component OSCIL
 port (
   TEST : in std_logic;
   OSC : out std_logic
 );
end component;
attribute syn_black_box of OSCIL : component is true;
component OSAND2
 port (
   A : in std_logic;
   SCLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OSAND2 : component is true;
component OR5
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OR5 : component is true;
component OR4
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OR4 : component is true;
component OR2
 port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OR2 : component is true;


component OFS1S1B
 port (
   D : IN std_logic;
   SCLK : IN std_logic;
   PD : IN std_logic;
   Q : OUT std_logic
        );
end component;
attribute syn_black_box of OFS1S1B : component is true;


component OFS1S1D
 port (
   D : IN std_logic;
   SCLK : IN std_logic;
   CD : IN std_logic;
   Q : OUT std_logic
        );
end component;
attribute syn_black_box of OFS1S1D : component is true;


component OFS1S1I
 port (
   D : IN std_logic;
   SCLK : IN std_logic;
   CD : IN std_logic;
   Q : OUT std_logic
        );
end component;
attribute syn_black_box of OFS1S1I : component is true;


component OFS1S1J
 port (
   D : IN std_logic;
   SCLK : IN std_logic;
   PD : IN std_logic;
   Q : OUT std_logic
        );
end component;
attribute syn_black_box of OFS1S1J : component is true;


component OFE1S1B
 port (
   D : IN std_logic;
   ECLK : IN std_logic;
   PD : IN std_logic;
   Q : OUT std_logic
        );
end component;
attribute syn_black_box of OFE1S1B : component is true;


component OFE1S1D
 port (
   D : IN std_logic;
   ECLK : IN std_logic;
   CD : IN std_logic;
   Q : OUT std_logic
        );
end component;
attribute syn_black_box of OFE1S1D : component is true;


component OFE1S1I
 port (
   D : IN std_logic;
   ECLK : IN std_logic;
   CD : IN std_logic;
   Q : OUT std_logic
        );
end component;
attribute syn_black_box of OFE1S1I : component is true;


component OFE1S1J
 port (
   D : IN std_logic;
   ECLK : IN std_logic;
   PD : IN std_logic;
   Q : OUT std_logic
        );
end component;
attribute syn_black_box of OFE1S1J : component is true;


component OFS1P3JZ
 port (
   D : in std_logic;
   SP : in std_logic;
   SCLK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of OFS1P3JZ : component is true;
component OFS1P3JX
 port (
   D : in std_logic;
   SP : in std_logic;
   SCLK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of OFS1P3JX : component is true;
component OFS1P3IZ
 port (
   D : in std_logic;
   SP : in std_logic;
   SCLK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of OFS1P3IZ : component is true;
component OFS1P3IX
 port (
   D : in std_logic;
   SP : in std_logic;
   SCLK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of OFS1P3IX : component is true;
component OFS1P3DX
 port (
   D : in std_logic;
   SP : in std_logic;
   SCLK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of OFS1P3DX : component is true;
component OFS1P3BX
 port (
   D : in std_logic;
   SP : in std_logic;
   SCLK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of OFS1P3BX : component is true;
component OFE1P3JZ
 port (
   D : in std_logic;
   SP : in std_logic;
   ECLK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of OFE1P3JZ : component is true;
component OFE1P3JX
 port (
   D : in std_logic;
   SP : in std_logic;
   ECLK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of OFE1P3JX : component is true;
component OFE1P3IZ
 port (
   D : in std_logic;
   SP : in std_logic;
   ECLK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of OFE1P3IZ : component is true;
component OFE1P3IX
 port (
   D : in std_logic;
   SP : in std_logic;
   ECLK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of OFE1P3IX : component is true;
component OFE1P3DX
 port (
   D : in std_logic;
   SP : in std_logic;
   ECLK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of OFE1P3DX : component is true;
component OFE1P3BX
 port (
   D : in std_logic;
   SP : in std_logic;
   ECLK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of OFE1P3BX : component is true;
component OEXOR2
 port (
   A : in std_logic;
   ECLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OEXOR2 : component is true;
component OEXNOR2
 port (
   A : in std_logic;
   ECLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OEXNOR2 : component is true;
component OEOR2
 port (
   A : in std_logic;
   ECLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OEOR2 : component is true;
component OENR2
 port (
   A : in std_logic;
   ECLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OENR2 : component is true;
component Oend2
 port (
   A : in std_logic;
   ECLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of Oend2 : component is true;
component OEMUX21
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   ECLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OEMUX21 : component is true;
component OEAND2
 port (
   A : in std_logic;
   ECLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OEAND2 : component is true;
component OBZ6PU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of OBZ6PU : component is true;
attribute black_box_pad_pin of OBZ6PU : component is "O";
component OBZ6PD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of OBZ6PD : component is true;
attribute black_box_pad_pin of OBZ6PD : component is "O";
component OBZ6
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of OBZ6 : component is true;
attribute black_box_pad_pin of OBZ6 : component is "O";
component OBZ12PU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of OBZ12PU : component is true;
attribute black_box_pad_pin of OBZ12PU : component is "O";
component OBZ12PD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of OBZ12PD : component is true;
attribute black_box_pad_pin of OBZ12PD : component is "O";
component OBZ12FPU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of OBZ12FPU : component is true;
attribute black_box_pad_pin of OBZ12FPU : component is "O";
component OBZ12FPD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of OBZ12FPD : component is true;
attribute black_box_pad_pin of OBZ12FPD : component is "O";
component OBZ12F
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of OBZ12F : component is true;
attribute black_box_pad_pin of OBZ12F : component is "O";
component OBZ12
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of OBZ12 : component is true;
attribute black_box_pad_pin of OBZ12 : component is "O";
component OB6
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of OB6 : component is true;
attribute black_box_pad_pin of OB6 : component is "O";
component OB12F
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of OB12F : component is true;
attribute black_box_pad_pin of OB12F : component is "O";
component OB12
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of OB12 : component is true;
attribute black_box_pad_pin of OB12 : component is "O";
component NR5
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of NR5 : component is true;
component NR4
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of NR4 : component is true;
component NR3
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of NR3 : component is true;
component NR2
 port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of NR2 : component is true;
component ND5
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of ND5 : component is true;
component ND4
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of ND4 : component is true;
component ND3
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of ND3 : component is true;
component ND2
 port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of ND2 : component is true;
component MUX41E
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   SD1 : in std_logic;
   SD2 : in std_logic;
   E : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of MUX41E : component is true;
component MUX41
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   SD1 : in std_logic;
   SD2 : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of MUX41 : component is true;
component MUX21E
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   SD : in std_logic;
   E : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of MUX21E : component is true;
component MUX21
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   SD : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of MUX21 : component is true;


component LU8P3JX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   D4 : in std_logic;
   D5 : in std_logic;
   D6 : in std_logic;
   D7 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of LU8P3JX : component is true;
component LU8P3IX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   D4 : in std_logic;
   D5 : in std_logic;
   D6 : in std_logic;
   D7 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of LU8P3IX : component is true;
component LU8P3DX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   D4 : in std_logic;
   D5 : in std_logic;
   D6 : in std_logic;
   D7 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of LU8P3DX : component is true;
component LU8P3BX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   D4 : in std_logic;
   D5 : in std_logic;
   D6 : in std_logic;
   D7 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of LU8P3BX : component is true;
component LU4P3JX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LU4P3JX : component is true;
component LU4P3IX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LU4P3IX : component is true;
component LU4P3DX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LU4P3DX : component is true;
component LU4P3BX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LU4P3BX : component is true;
component LU4P3AY
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LU4P3AY : component is true;
component LU4P3AX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LU4P3AX : component is true;
component LD8P3JX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   D4 : in std_logic;
   D5 : in std_logic;
   D6 : in std_logic;
   D7 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of LD8P3JX : component is true;
component LD8P3IX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   D4 : in std_logic;
   D5 : in std_logic;
   D6 : in std_logic;
   D7 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of LD8P3IX : component is true;
component LD8P3DX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   D4 : in std_logic;
   D5 : in std_logic;
   D6 : in std_logic;
   D7 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of LD8P3DX : component is true;
component LD8P3BX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   D4 : in std_logic;
   D5 : in std_logic;
   D6 : in std_logic;
   D7 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of LD8P3BX : component is true;
component LD4P3JX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LD4P3JX : component is true;
component LD4P3IX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LD4P3IX : component is true;
component LD4P3DX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LD4P3DX : component is true;
component LD4P3BX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LD4P3BX : component is true;
component LD4P3AY
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LD4P3AY : component is true;
component LD4P3AX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LD4P3AX : component is true;
component LB8P3JX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   D4 : in std_logic;
   D5 : in std_logic;
   D6 : in std_logic;
   D7 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of LB8P3JX : component is true;
component LB8P3IX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   D4 : in std_logic;
   D5 : in std_logic;
   D6 : in std_logic;
   D7 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of LB8P3IX : component is true;
component LB8P3DX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   D4 : in std_logic;
   D5 : in std_logic;
   D6 : in std_logic;
   D7 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of LB8P3DX : component is true;
component LB8P3BX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   D4 : in std_logic;
   D5 : in std_logic;
   D6 : in std_logic;
   D7 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of LB8P3BX : component is true;
component LB4P3JX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LB4P3JX : component is true;
component LB4P3IX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LB4P3IX : component is true;
component LB4P3DX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LB4P3DX : component is true;
component LB4P3BX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LB4P3BX : component is true;
component LB4P3AY
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LB4P3AY : component is true;
component LB4P3AX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of LB4P3AX : component is true;
component INV
 port (
   A : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of INV : component is true;
component INCDEC8
 port (
   CI : in std_logic;
   PC0 : in std_logic;
   PC1 : in std_logic;
   PC2 : in std_logic;
   PC3 : in std_logic;
   PC4 : in std_logic;
   PC5 : in std_logic;
   PC6 : in std_logic;
   PC7 : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   NC0 : out std_logic;
   NC1 : out std_logic;
   NC2 : out std_logic;
   NC3 : out std_logic;
   NC4 : out std_logic;
   NC5 : out std_logic;
   NC6 : out std_logic;
   NC7 : out std_logic
 );
end component;
attribute syn_black_box of INCDEC8 : component is true;
component INCDEC4
 port (
   CI : in std_logic;
   PC0 : in std_logic;
   PC1 : in std_logic;
   PC2 : in std_logic;
   PC3 : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   NC0 : out std_logic;
   NC1 : out std_logic;
   NC2 : out std_logic;
   NC3 : out std_logic
 );
end component;
attribute syn_black_box of INCDEC4 : component is true;
component INC8
 port (
   CI : in std_logic;
   PC0 : in std_logic;
   PC1 : in std_logic;
   PC2 : in std_logic;
   PC3 : in std_logic;
   PC4 : in std_logic;
   PC5 : in std_logic;
   PC6 : in std_logic;
   PC7 : in std_logic;
   CO : out std_logic;
   NC0 : out std_logic;
   NC1 : out std_logic;
   NC2 : out std_logic;
   NC3 : out std_logic;
   NC4 : out std_logic;
   NC5 : out std_logic;
   NC6 : out std_logic;
   NC7 : out std_logic
 );
end component;
attribute syn_black_box of INC8 : component is true;
component INC4
 port (
   CI : in std_logic;
   PC0 : in std_logic;
   PC1 : in std_logic;
   PC2 : in std_logic;
   PC3 : in std_logic;
   CO : out std_logic;
   NC0 : out std_logic;
   NC1 : out std_logic;
   NC2 : out std_logic;
   NC3 : out std_logic
 );
end component;
attribute syn_black_box of INC4 : component is true;
component ILF2P3JZ
 port (
   D : in std_logic;
   SP : in std_logic;
   ECLK : in std_logic;
   SCLK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of ILF2P3JZ : component is true;
component ILF2P3JX
 port (
   D : in std_logic;
   SP : in std_logic;
   ECLK : in std_logic;
   SCLK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of ILF2P3JX : component is true;
component ILF2P3IZ
 port (
   D : in std_logic;
   SP : in std_logic;
   ECLK : in std_logic;
   SCLK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of ILF2P3IZ : component is true;
component ILF2P3IX
 port (
   D : in std_logic;
   SP : in std_logic;
   ECLK : in std_logic;
   SCLK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of ILF2P3IX : component is true;
component ILF2P3DX
 port (
   D : in std_logic;
   SP : in std_logic;
   ECLK : in std_logic;
   SCLK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of ILF2P3DX : component is true;
component ILF2P3BX
 port (
   D : in std_logic;
   SP : in std_logic;
   ECLK : in std_logic;
   SCLK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of ILF2P3BX : component is true;
component IFS1S1J
 port (
   D : in std_logic;
   SCLK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of IFS1S1J : component is true;
component IFS1S1I
 port (
   D : in std_logic;
   SCLK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of IFS1S1I : component is true;
component IFS1S1D
 port (
   D : in std_logic;
   SCLK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of IFS1S1D : component is true;
component IFS1S1B
 port (
   D : in std_logic;
   SCLK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of IFS1S1B : component is true;
component IFS1P3JZ
 port (
   D : in std_logic;
   SP : in std_logic;
   SCLK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of IFS1P3JZ : component is true;
component IFS1P3JX
 port (
   D : in std_logic;
   SP : in std_logic;
   SCLK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of IFS1P3JX : component is true;
component IFS1P3IZ
 port (
   D : in std_logic;
   SP : in std_logic;
   SCLK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of IFS1P3IZ : component is true;
component IFS1P3IX
 port (
   D : in std_logic;
   SP : in std_logic;
   SCLK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of IFS1P3IX : component is true;
component IFS1P3DX
 port (
   D : in std_logic;
   SP : in std_logic;
   SCLK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of IFS1P3DX : component is true;
component IFS1P3BX
 port (
   D : in std_logic;
   SP : in std_logic;
   SCLK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of IFS1P3BX : component is true;
component IBTS
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of IBTS : component is true;
attribute black_box_pad_pin of IBTS : component is "I";
component IBTPUS
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of IBTPUS : component is true;
attribute black_box_pad_pin of IBTPUS : component is "I";
component IBTPU
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of IBTPU : component is true;
attribute black_box_pad_pin of IBTPU : component is "I";
component IBTPDS
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of IBTPDS : component is true;
attribute black_box_pad_pin of IBTPDS : component is "I";
component IBTPD
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of IBTPD : component is true;
attribute black_box_pad_pin of IBTPD : component is "I";
component IBT
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of IBT : component is true;
attribute black_box_pad_pin of IBT : component is "I";
component IBMS
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of IBMS : component is true;
attribute black_box_pad_pin of IBMS : component is "I";
component IBMPUS
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of IBMPUS : component is true;
attribute black_box_pad_pin of IBMPUS : component is "I";
component IBMPU
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of IBMPU : component is true;
attribute black_box_pad_pin of IBMPU : component is "I";
component IBMPDS
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of IBMPDS : component is true;
attribute black_box_pad_pin of IBMPDS : component is "I";
component IBMPD
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of IBMPD : component is true;
attribute black_box_pad_pin of IBMPD : component is "I";
component IBM
 port (
   I : in std_logic;
   O : out std_logic
 );
end component;
attribute syn_black_box of IBM : component is true;
attribute black_box_pad_pin of IBM : component is "I";
component FSUB8O
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   A5 : in std_logic;
   A6 : in std_logic;
   A7 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   B4 : in std_logic;
   B5 : in std_logic;
   B6 : in std_logic;
   B7 : in std_logic;
   BI : in std_logic;
   OFL : out std_logic;
   S0 : out std_logic;
   S1 : out std_logic;
   S2 : out std_logic;
   S3 : out std_logic;
   S4 : out std_logic;
   S5 : out std_logic;
   S6 : out std_logic;
   S7 : out std_logic
 );
end component;
attribute syn_black_box of FSUB8O : component is true;
component FSUB8
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   A5 : in std_logic;
   A6 : in std_logic;
   A7 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   B4 : in std_logic;
   B5 : in std_logic;
   B6 : in std_logic;
   B7 : in std_logic;
   BI : in std_logic;
   BO : out std_logic;
   S0 : out std_logic;
   S1 : out std_logic;
   S2 : out std_logic;
   S3 : out std_logic;
   S4 : out std_logic;
   S5 : out std_logic;
   S6 : out std_logic;
   S7 : out std_logic
 );
end component;
attribute syn_black_box of FSUB8 : component is true;
component FSUB4O
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   BI : in std_logic;
   OFL : out std_logic;
   S0 : out std_logic;
   S1 : out std_logic;
   S2 : out std_logic;
   S3 : out std_logic
 );
end component;
attribute syn_black_box of FSUB4O : component is true;
component FSUB4
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   BI : in std_logic;
   BO : out std_logic;
   S0 : out std_logic;
   S1 : out std_logic;
   S2 : out std_logic;
   S3 : out std_logic
 );
end component;
attribute syn_black_box of FSUB4 : component is true;
component FMULT81
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   A5 : in std_logic;
   A6 : in std_logic;
   A7 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   B4 : in std_logic;
   B5 : in std_logic;
   B6 : in std_logic;
   B7 : in std_logic;
   MULT : in std_logic;
   CI : in std_logic;
   CO : out std_logic;
   P0 : out std_logic;
   P1 : out std_logic;
   P2 : out std_logic;
   P3 : out std_logic;
   P4 : out std_logic;
   P5 : out std_logic;
   P6 : out std_logic;
   P7 : out std_logic
 );
end component;
attribute syn_black_box of FMULT81 : component is true;
component FMULT41
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   MULT : in std_logic;
   CI : in std_logic;
   CO : out std_logic;
   P0 : out std_logic;
   P1 : out std_logic;
   P2 : out std_logic;
   P3 : out std_logic
 );
end component;
attribute syn_black_box of FMULT41 : component is true;
component XOR3
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of XOR3 : component is true;
component OR3
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OR3 : component is true;
component FL1S3AY
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1S3AY : component is true;
component FL1S3AX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1S3AX : component is true;
component FL1S1J
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1S1J : component is true;
component FL1S1I
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1S1I : component is true;
component FL1S1D
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1S1D : component is true;
component FL1S1B
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1S1B : component is true;
component FL1S1AY
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1S1AY : component is true;
component FL1S1A
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1S1A : component is true;
component FL1P3JZ
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1P3JZ : component is true;
component FL1P3JY
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1P3JY : component is true;
component FL1P3IZ
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1P3IZ : component is true;
component FL1P3IY
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1P3IY : component is true;
component FL1P3DX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   CD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1P3DX : component is true;
component FL1P3BX
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   PD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1P3BX : component is true;
component FL1P3AZ
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1P3AZ : component is true;
component FL1P3AY
 port (
   D0 : in std_logic;
   D1 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FL1P3AY : component is true;
component FD1S3JX
 port (
   D : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1S3JX : component is true;
component FD1S3IX
 port (
   D : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1S3IX : component is true;
component FD1S3DX
 port (
   D : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1S3DX : component is true;
component FD1S3BX
 port (
   D : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1S3BX : component is true;
component FD1S3AY
 port (
   D : in std_logic;
   CK : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1S3AY : component is true;
component FD1S3AX
 port (
   D : in std_logic;
   CK : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1S3AX : component is true;
component FD1S1J
 port (
   D : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1S1J : component is true;
component FD1S1I
 port (
   D : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1S1I : component is true;
component FD1S1D
 port (
   D : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1S1D : component is true;
component FD1S1B
 port (
   D : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1S1B : component is true;
component FD1S1AY
 port (
   D : in std_logic;
   CK : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1S1AY : component is true;
component FD1S1A
 port (
   D : in std_logic;
   CK : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1S1A : component is true;
component FD1P3JZ
 port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1P3JZ : component is true;
component FD1P3JX
 port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1P3JX : component is true;
component FD1P3IZ
 port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1P3IZ : component is true;
component FD1P3IX
 port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1P3IX : component is true;
component FD1P3DX
 port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1P3DX : component is true;
component FD1P3BX
 port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1P3BX : component is true;
component FD1P3AY
 port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1P3AY : component is true;
component FADSU8O
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   A5 : in std_logic;
   A6 : in std_logic;
   A7 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   B4 : in std_logic;
   B5 : in std_logic;
   B6 : in std_logic;
   B7 : in std_logic;
   BCI : in std_logic;
   CON : in std_logic;
   OFL : out std_logic;
   S0 : out std_logic;
   S1 : out std_logic;
   S2 : out std_logic;
   S3 : out std_logic;
   S4 : out std_logic;
   S5 : out std_logic;
   S6 : out std_logic;
   S7 : out std_logic
 );
end component;
attribute syn_black_box of FADSU8O : component is true;
component FADSU8
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   A5 : in std_logic;
   A6 : in std_logic;
   A7 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   B4 : in std_logic;
   B5 : in std_logic;
   B6 : in std_logic;
   B7 : in std_logic;
   BCI : in std_logic;
   CON : in std_logic;
   BCO : out std_logic;
   S0 : out std_logic;
   S1 : out std_logic;
   S2 : out std_logic;
   S3 : out std_logic;
   S4 : out std_logic;
   S5 : out std_logic;
   S6 : out std_logic;
   S7 : out std_logic
 );
end component;
attribute syn_black_box of FADSU8 : component is true;
component FADSU4O
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   BCI : in std_logic;
   CON : in std_logic;
   OFL : out std_logic;
   S0 : out std_logic;
   S1 : out std_logic;
   S2 : out std_logic;
   S3 : out std_logic
 );
end component;
attribute syn_black_box of FADSU4O : component is true;
component FADSU4
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   BCI : in std_logic;
   CON : in std_logic;
   BCO : out std_logic;
   S0 : out std_logic;
   S1 : out std_logic;
   S2 : out std_logic;
   S3 : out std_logic
 );
end component;
attribute syn_black_box of FADSU4 : component is true;
component FADD8O
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   A5 : in std_logic;
   A6 : in std_logic;
   A7 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   B4 : in std_logic;
   B5 : in std_logic;
   B6 : in std_logic;
   B7 : in std_logic;
   CI : in std_logic;
   OFL : out std_logic;
   S0 : out std_logic;
   S1 : out std_logic;
   S2 : out std_logic;
   S3 : out std_logic;
   S4 : out std_logic;
   S5 : out std_logic;
   S6 : out std_logic;
   S7 : out std_logic
 );
end component;
attribute syn_black_box of FADD8O : component is true;
component FADD8
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   A5 : in std_logic;
   A6 : in std_logic;
   A7 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   B4 : in std_logic;
   B5 : in std_logic;
   B6 : in std_logic;
   B7 : in std_logic;
   CI : in std_logic;
   CO : out std_logic;
   S0 : out std_logic;
   S1 : out std_logic;
   S2 : out std_logic;
   S3 : out std_logic;
   S4 : out std_logic;
   S5 : out std_logic;
   S6 : out std_logic;
   S7 : out std_logic
 );
end component;
attribute syn_black_box of FADD8 : component is true;
component FADD4O
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   CI : in std_logic;
   OFL : out std_logic;
   S0 : out std_logic;
   S1 : out std_logic;
   S2 : out std_logic;
   S3 : out std_logic
 );
end component;
attribute syn_black_box of FADD4O : component is true;
component FADD4
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   CI : in std_logic;
   CO : out std_logic;
   S0 : out std_logic;
   S1 : out std_logic;
   S2 : out std_logic;
   S3 : out std_logic
 );
end component;
attribute syn_black_box of FADD4 : component is true;
component DLLPDT
 port (
   CLKIN : in std_logic;
   ECLK : out std_logic;
   SCLK : out std_logic;
   LOCK : out std_logic
 );
end component;
attribute syn_black_box of DLLPDT : component is true;
component DLLPDB
 port (
   CLKIN : in std_logic;
   ECLK : out std_logic;
   SCLK : out std_logic;
   LOCK : out std_logic
 );
end component;
attribute syn_black_box of DLLPDB : component is true;


component DLL1XT
 port (
   CLKIN : in std_logic;
   ECLK : out std_logic;
   SCLK : out std_logic;
   LOCK : out std_logic
 );
end component;
attribute syn_black_box of DLL1XT : component is true;
component DLL1XB
 port (
   CLKIN : in std_logic;
   ECLK : out std_logic;
   SCLK : out std_logic;
   LOCK : out std_logic
 );
end component;
attribute syn_black_box of DLL1XB : component is true;
component DEC8
 port (
   CI : in std_logic;
   PC0 : in std_logic;
   PC1 : in std_logic;
   PC2 : in std_logic;
   PC3 : in std_logic;
   PC4 : in std_logic;
   PC5 : in std_logic;
   PC6 : in std_logic;
   PC7 : in std_logic;
   CO : out std_logic;
   NC0 : out std_logic;
   NC1 : out std_logic;
   NC2 : out std_logic;
   NC3 : out std_logic;
   NC4 : out std_logic;
   NC5 : out std_logic;
   NC6 : out std_logic;
   NC7 : out std_logic
 );
end component;
attribute syn_black_box of DEC8 : component is true;
component DEC4
 port (
   CI : in std_logic;
   PC0 : in std_logic;
   PC1 : in std_logic;
   PC2 : in std_logic;
   PC3 : in std_logic;
   CO : out std_logic;
   NC0 : out std_logic;
   NC1 : out std_logic;
   NC2 : out std_logic;
   NC3 : out std_logic
 );
end component;
attribute syn_black_box of DEC4 : component is true;
component DCE32X4
 port (
   WAD0 : in std_logic;
   WAD1 : in std_logic;
   WAD2 : in std_logic;
   WAD3 : in std_logic;
   WAD4 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   DI2 : in std_logic;
   DI3 : in std_logic;
   CK : in std_logic;
   WREN : in std_logic;
   WPE0 : in std_logic;
   WPE1 : in std_logic;
   RAD0 : in std_logic;
   RAD1 : in std_logic;
   RAD2 : in std_logic;
   RAD3 : in std_logic;
   RAD4 : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic;
   DO2 : out std_logic;
   DO3 : out std_logic;
   QDO0 : out std_logic;
   QDO1 : out std_logic;
   QDO2 : out std_logic;
   QDO3 : out std_logic
 );
end component;
attribute syn_black_box of DCE32X4 : component is true;
component CU8P3JX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of CU8P3JX : component is true;
component CU8P3IX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of CU8P3IX : component is true;
component CU8P3DX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of CU8P3DX : component is true;
component CU8P3BX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of CU8P3BX : component is true;
component CU4P3JX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of CU4P3JX : component is true;
component CU4P3IX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of CU4P3IX : component is true;
component CU4P3DX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of CU4P3DX : component is true;
component CU4P3BX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of CU4P3BX : component is true;
component CU4
 port (
   CI : in std_logic;
   PC0 : in std_logic;
   PC1 : in std_logic;
   PC2 : in std_logic;
   PC3 : in std_logic;
   CO : out std_logic;
   NC0 : out std_logic;
   NC1 : out std_logic;
   NC2 : out std_logic;
   NC3 : out std_logic
 );
end component;
attribute syn_black_box of CU4 : component is true;


component CFD1P3JX
 port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of CFD1P3JX : component is true;
component CFD1P3IZ
 port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of CFD1P3IZ : component is true;
component CFD1P3IX
 port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of CFD1P3IX : component is true;
component CFD1P3DX
 port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of CFD1P3DX : component is true;
component CFD1P3BX
 port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of CFD1P3BX : component is true;
component CFD1P3JZ
PORT(
        d : IN std_logic := 'X';
        sp: IN std_logic := 'X';
        pd: IN std_logic := 'X';
        ck: IN std_logic := 'X';
        q : OUT std_logic := 'X'
  );
end component;
attribute syn_black_box of CFD1P3JZ : component is true;
component CD8P3JX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of CD8P3JX : component is true;
component CD8P3IX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of CD8P3IX : component is true;
component CD8P3DX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of CD8P3DX : component is true;
component CD8P3BX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of CD8P3BX : component is true;
component CD4P3JX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of CD4P3JX : component is true;
component CD4P3IX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of CD4P3IX : component is true;
component CD4P3DX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of CD4P3DX : component is true;
component CD4P3BX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of CD4P3BX : component is true;
component CD4
 port (
   CI : in std_logic;
   PC0 : in std_logic;
   PC1 : in std_logic;
   PC2 : in std_logic;
   PC3 : in std_logic;
   CO : out std_logic;
   NC0 : out std_logic;
   NC1 : out std_logic;
   NC2 : out std_logic;
   NC3 : out std_logic
 );
end component;
attribute syn_black_box of CD4 : component is true;
component CB8P3JX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of CB8P3JX : component is true;
component CB8P3IX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of CB8P3IX : component is true;
component CB8P3DX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of CB8P3DX : component is true;
component CB8P3BX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic;
   Q4 : out std_logic;
   Q5 : out std_logic;
   Q6 : out std_logic;
   Q7 : out std_logic
 );
end component;
attribute syn_black_box of CB8P3BX : component is true;
component CB4P3JX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of CB4P3JX : component is true;
component CB4P3IX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of CB4P3IX : component is true;
component CB4P3DX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of CB4P3DX : component is true;
component CB4P3BX
 port (
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic
 );
end component;
attribute syn_black_box of CB4P3BX : component is true;
component CB4
 port (
   CI : in std_logic;
   PC0 : in std_logic;
   PC1 : in std_logic;
   PC2 : in std_logic;
   PC3 : in std_logic;
   CON : in std_logic;
   CO : out std_logic;
   NC0 : out std_logic;
   NC1 : out std_logic;
   NC2 : out std_logic;
   NC3 : out std_logic
 );
end component;
attribute syn_black_box of CB4 : component is true;
component BTZ6PU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
 attribute black_box_pad_pin of BTZ6PU : component is "B";
attribute syn_black_box of BTZ6PU : component is true;
component BTZ6PD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
 attribute black_box_pad_pin of BTZ6PD : component is "B";
attribute syn_black_box of BTZ6PD : component is true;
component BTZ6
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
 attribute black_box_pad_pin of BTZ6 : component is "B";
attribute syn_black_box of BTZ6 : component is true;
component BTZ12PU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTZ12PU : component is true;
 attribute black_box_pad_pin of BTZ12PU : component is "B";
component BTZ12PD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTZ12PD : component is true;
 attribute black_box_pad_pin of BTZ12PD : component is "B";
component BTZ12FPU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTZ12FPU : component is true;
 attribute black_box_pad_pin of BTZ12FPU : component is "B";
component BTZ12FPD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTZ12FPD : component is true;
 attribute black_box_pad_pin of BTZ12FPD : component is "B";
component BTZ12F
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTZ12F : component is true;
 attribute black_box_pad_pin of BTZ12F : component is "B";
component BTZ12
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTZ12 : component is true;
 attribute black_box_pad_pin of BTZ12 : component is "B";
component BTS6PU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTS6PU : component is true;
 attribute black_box_pad_pin of BTS6PU : component is "B";
component BTS6PD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTS6PD : component is true;
 attribute black_box_pad_pin of BTS6PD : component is "B";
component BTS6
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTS6 : component is true;
 attribute black_box_pad_pin of BTS6 : component is "B";
component BTS12PU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTS12PU : component is true;
 attribute black_box_pad_pin of BTS12PU : component is "B";
component BTS12PD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTS12PD : component is true;
 attribute black_box_pad_pin of BTS12PD : component is "B";
component BTS12FPU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTS12FPU : component is true;
 attribute black_box_pad_pin of BTS12FPU : component is "B";
component BTS12FPD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTS12FPD : component is true;
 attribute black_box_pad_pin of BTS12FPD : component is "B";
component BTS12F
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTS12F : component is true;
 attribute black_box_pad_pin of BTS12F : component is "B";
component BTS12
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BTS12 : component is true;
 attribute black_box_pad_pin of BTS12 : component is "B";
component BMZ6PU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMZ6PU : component is true;
 attribute black_box_pad_pin of BMZ6PU : component is "B";
component BMZ6PD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMZ6PD : component is true;
 attribute black_box_pad_pin of BMZ6PD : component is "B";
component BMZ6
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMZ6 : component is true;
 attribute black_box_pad_pin of BMZ6 : component is "B";
 --attribute black_box_pad_pin of BMZ6 : component is "O";
component BMZ12PU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMZ12PU : component is true;
 attribute black_box_pad_pin of BMZ12PU : component is "B";
component BMZ12PD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMZ12PD : component is true;
 attribute black_box_pad_pin of BMZ12PD : component is "B";
component BMZ12FPU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMZ12FPU : component is true;
 attribute black_box_pad_pin of BMZ12FPU : component is "B";
component BMZ12FPD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMZ12FPD : component is true;
 attribute black_box_pad_pin of BMZ12FPD : component is "B";
component BMZ12F
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMZ12F : component is true;
 attribute black_box_pad_pin of BMZ12F : component is "B";
component BMZ12
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMZ12 : component is true;
 attribute black_box_pad_pin of BMZ12 : component is "B";
component BMS6PU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMS6PU : component is true;
 attribute black_box_pad_pin of BMS6PU : component is "B";
component BMS6PD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMS6PD : component is true;
 attribute black_box_pad_pin of BMS6PD : component is "B";
component BMS6
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMS6 : component is true;
 attribute black_box_pad_pin of BMS6 : component is "B";
component BMS12PU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMS12PU : component is true;
 attribute black_box_pad_pin of BMS12PU : component is "B";
component BMS12PD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMS12PD : component is true;
 attribute black_box_pad_pin of BMS12PD : component is "B";
component BMS12FPU
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMS12FPU : component is true;
 attribute black_box_pad_pin of BMS12FPU : component is "B";
component BMS12FPD
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMS12FPD : component is true;
 attribute black_box_pad_pin of BMS12FPD : component is "B";
component BMS12F
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMS12F : component is true;
 attribute black_box_pad_pin of BMS12F : component is "B";
component BMS12
 port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic
 );
end component;
attribute syn_black_box of BMS12 : component is true;
 attribute black_box_pad_pin of BMS12 : component is "B";
component ANEB8
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   A5 : in std_logic;
   A6 : in std_logic;
   A7 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   B4 : in std_logic;
   B5 : in std_logic;
   B6 : in std_logic;
   B7 : in std_logic;
   CI : in std_logic;
   NE : out std_logic
 );
end component;
attribute syn_black_box of ANEB8 : component is true;
component ANEB4
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   CI : in std_logic;
   NE : out std_logic
 );
end component;
attribute syn_black_box of ANEB4 : component is true;
component AND5
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of AND5 : component is true;
component AND4
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of AND4 : component is true;
component AND3
 port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of AND3 : component is true;
component AND2
 port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of AND2 : component is true;
component ALEB8
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   A5 : in std_logic;
   A6 : in std_logic;
   A7 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   B4 : in std_logic;
   B5 : in std_logic;
   B6 : in std_logic;
   B7 : in std_logic;
   CI : in std_logic;
   LE : out std_logic
 );
end component;
attribute syn_black_box of ALEB8 : component is true;
component ALEB4
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   CI : in std_logic;
   LE : out std_logic
 );
end component;
attribute syn_black_box of ALEB4 : component is true;
component AGEB8
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   A5 : in std_logic;
   A6 : in std_logic;
   A7 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   B4 : in std_logic;
   B5 : in std_logic;
   B6 : in std_logic;
   B7 : in std_logic;
   CI : in std_logic;
   GE : out std_logic
 );
end component;
attribute syn_black_box of AGEB8 : component is true;
component AGEB4
 port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   CI : in std_logic;
   GE : out std_logic
 );
end component;
attribute syn_black_box of AGEB4 : component is true;
component PUR
 port (
   PUR : in std_logic
 );
end component;
attribute syn_black_box of PUR : component is true;
component FD1P3AX
 port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   Q : out std_logic;
   QN : out std_logic
 );
end component;
attribute syn_black_box of FD1P3AX : component is true;
component GSR
 port (
   GSR : in std_logic
 );
end component;
attribute syn_black_box of GSR : component is true;
attribute syn_noprune of GSR: component is true;
component BNDSCAN
 port (
  PTDI : in std_logic;
  PTMS : in std_logic;
  PTCK : in std_logic;
  BSO1 : in std_logic;
  BSO2 : in std_logic;
  TDI  : out std_logic;
  TCK  : out std_logic;
  BSEN1 : out std_logic;
  BSEN2 : out std_logic;
  TDO : out std_logic);
end component;
attribute syn_black_box of BNDSCAN : component is true;
attribute syn_noprune of BNDSCAN: component is true;
component BUFBA
 port (
  A : in std_logic;
  Z : out std_logic
);
end component;
attribute syn_black_box of BUFBA : component is true;


COMPONENT BR1024X18
PORT(
        AW19, AW18, AW17, AW16, AW15, AW14, AW13, AW12, AW11, AW10   : in std_logic ;
        AW09, AW08, AW07, AW06, AW05, AW04, AW03, AW02, AW01, AW00   : in std_logic ;
        D117, D116, D115, D114, D113, D112, D111, D110, D19          : in std_logic ;
        D18, D17, D16, D15, D14, D13, D12, D11, D10                  : in std_logic ;
        D017, D016, D015, D014, D013, D012, D011, D010, D09          : in std_logic ;
        D08, D07, D06, D05, D04, D03, D02, D01, D00                  : in std_logic ;
        BW11, BW10, BW01, BW00                                       : in std_logic ;
        AR19, AR18, AR17, AR16, AR15, AR14, AR13, AR12, AR11, AR10   : in std_logic ;
        AR09, AR08, AR07, AR06, AR05, AR04, AR03, AR02, AR01, AR00   : in std_logic ;
        CKW1, CKW0, CKR1, CKR0, CSW1, CSW0, CSR1, CSR0               : in std_logic ;


        Q117, Q116, Q115, Q114, Q113, Q112, Q111, Q110, Q19          : out std_logic ;
        Q18, Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10                  : out std_logic ;
        Q017, Q016, Q015, Q014, Q013, Q012, Q011, Q010, Q09          : out std_logic ;
        Q08, Q07, Q06, Q05, Q04, Q03, Q02, Q01, Q00, BUSY            : out std_logic 
  );
END COMPONENT;
attribute syn_black_box of BR1024X18 : component is true;


COMPONENT FF512X18
PORT(
      D17, D16, D15, D14, D13, D12, D11, D10, D9        : in std_logic ;
      D8, D7, D6, D5, D4, D3, D2, D1, D0                : in std_logic ;
      CKW, CKR, WRE, RDE, RSTN                          : in std_logic ;
      PF8, PF7, PF6, PF5, PF4, PF3, PF2, PF1, PF0       : in std_logic ;
      PE8, PE7, PE6, PE5, PE4, PE3, PE2, PE1, PE0       : in std_logic ;


      Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, Q9        : out std_logic ;
      Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0                : out std_logic ;
      EF, FF, PEF, PFF                                  : out std_logic  
 );
END COMPONENT;
attribute syn_black_box of FF512X18 : component is true;


COMPONENT FF256X36
PORT(
      D35, D34, D33, D32, D31, D30, D29, D28, D27       : in std_logic ;
      D26, D25, D24, D23, D22, D21, D20, D19, D18       : in std_logic ;
      D17, D16, D15, D14, D13, D12, D11, D10, D9        : in std_logic ;
      D8, D7, D6, D5, D4, D3, D2, D1, D0                : in std_logic ;
      CKW, CKR, WRE, RDE, RSTN                          : in std_logic ;
      PF7, PF6, PF5, PF4, PF3, PF2, PF1, PF0            : in std_logic ;
      PE7, PE6, PE5, PE4, PE3, PE2, PE1, PE0            : in std_logic ;


      Q35, Q34, Q33, Q32, Q31, Q30, Q29, Q28, Q27       : out std_logic ;
      Q26, Q25, Q24, Q23, Q22, Q21, Q20, Q19, Q18       : out std_logic ;
      Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, Q9        : out std_logic ;
      Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0                : out std_logic ;
      EF, FF, PEF, PFF                                  : out std_logic 
 );
END COMPONENT;
attribute syn_black_box of ff256x36 : component is true;


COMPONENT FF1024X9
PORT(
      D8, D7, D6, D5, D4, D3, D2, D1, D0                : in std_logic ;
      CKW, CKR, WRE, RDE, RSTN                          : in std_logic ;
      PF9, PF8, PF7, PF6, PF5, PF4, PF3, PF2, PF1, PF0  : in std_logic ;
      PE9, PE8, PE7, PE6, PE5, PE4, PE3, PE2, PE1, PE0  : in std_logic ;


      Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0                : out std_logic ;
      EF, FF, PEF, PFF                                  : out std_logic 
 );
END COMPONENT;
attribute syn_black_box of FF1024X9 : component is true;


COMPONENT FF2X512X9
PORT(
      D18, D17, D16, D15, D14, D13, D12, D11, D10           : in std_logic ;
      CKW1, CKR1, WRE1, RDE1, RSTN1                         : in std_logic ;
      PF18, PF17, PF16, PF15, PF14, PF13, PF12, PF11, PF10  : in std_logic ;
      PE18, PE17, PE16, PE15, PE14, PE13, PE12, PE11, PE10  : in std_logic ;
      D08, D07, D06, D05, D04, D03, D02, D01, D00           : in std_logic ;
      CKW0, CKR0, WRE0, RDE0, RSTN0                         : in std_logic ;
      PF08, PF07, PF06, PF05, PF04, PF03, PF02, PF01, PF00  : in std_logic ;
      PE08, PE07, PE06, PE05, PE04, PE03, PE02, PE01, PE00  : in std_logic ;


      Q18, Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10           : out std_logic ;
      EF1, FF1, PEF1, PFF1                                  : out std_logic ;
      Q08, Q07, Q06, Q05, Q04, Q03, Q02, Q01, Q00           : out std_logic ;
      EF0, FF0, PEF0, PFF0                                  : out std_logic 
 );
END COMPONENT;
attribute syn_black_box of FF2X512X9 : component is true;


COMPONENT CMULT16
PORT(
      M15, M14, M13, M12, M11, M10, M9, M8                         : in std_logic ;
      M7, M6, M5, M4, M3, M2, M1, M0, MCK, EN                      : in std_logic ;
      AW08, AW07, AW06, AW05, AW04, AW03, AW02, AW01, AW00         : in std_logic ;
      D015, D014, D013, D012, D011, D010, D09, D08                 : in std_logic ;
      D07, D06, D05, D04, D03, D02, D01, D00, CKW0, CSW0           : in std_logic ;
      AW18, AW17, AW16, AW15, AW14, AW13, AW12, AW11, AW10         : in std_logic ;
      D115, D114, D113, D112, D111, D110, D19, D18                 : in std_logic ;
      D17, D16, D15, D14, D13, D12, D11, D10, CKW1, CSW1           : in std_logic ;


      P23, P22, P21, P20, P19, P18, P17, P16, P15, P14, P13        : out std_logic ;
      P12, P11, P10, P9, P8, P7, P6, P5, P4, P3, P2, P1, P0        : out std_logic  


 );
END COMPONENT;
attribute syn_black_box of CMULT16 : component is true;


COMPONENT MULT8X8
PORT(
      A7, A6, A5, A4, A3, A2, A1, A0         : in std_logic ;
      B7, B6, B5, B4, B3, B2, B1, B0         : in std_logic ;
      CK, EN                                 : in std_logic ;
      P15, P14, P13, P12, P11, P10, P9       : out std_logic ;
      P8, P7, P6, P5, P4, P3, P2, P1, P0     : out std_logic  
 );
END COMPONENT;
attribute syn_black_box of MULT8X8: component is true;


COMPONENT CAM2X256X16
PORT(
        DW17, DW16, DW15, DW14, DW13, DW12, DW11, DW10        : in std_logic ;
        AD13, AD12, AD11, AD10, CD1, SM1, WRE1, CKW1          : in std_logic ;
        DM17, DM16, DM15, DM14, DM13, DM12, DM11, DM10        : in std_logic ;
        RDE1, CKR1                                            : in std_logic ;
        DW07, DW06, DW05, DW04, DW03, DW02, DW01, DW00        : in std_logic ;
        AD03, AD02, AD01, AD00, CD0, SM0, WRE0, CKW0          : in std_logic ;
        DM07, DM06, DM05, DM04, DM03, DM02, DM01, DM00        : in std_logic ;
        RDE0, CKR0                                            : in std_logic ;


        Q115, Q114, Q113, Q112, Q111, Q110, Q19, Q18          : out std_logic ;
        Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10                : out std_logic ;
        Q015, Q014, Q013, Q012, Q011, Q010, Q09, Q08          : out std_logic ;
        Q07, Q06, Q05, Q04, Q03, Q02, Q01, Q00                : out std_logic  
 );
END COMPONENT;
attribute syn_black_box of CAM2X256X16 : component is true;


COMPONENT IOSR2
PORT(
        IND, OUTD0, OUTD1, CK, UPDATE       : in std_logic   ;
        INQ0, INQ1, OUTQ      : out std_logic 
 );
END COMPONENT;
attribute syn_black_box of IOSR2: component is true;


COMPONENT IOSR4
PORT(
        IND, OUTD0, OUTD1, OUTD2, OUTD3, CK, UPDATE       : in std_logic ;
        INQ0, INQ1, INQ2, INQ3, OUTQ      : out std_logic 
 );
END COMPONENT;
attribute syn_black_box of IOSR4: component is true;



COMPONENT IODDR
PORT(
        IND0, IND1, IND2, IND3, OUT1D0, OUT1D1             : in std_logic ;
        OUT2D0, OUT2D1, OUT3D0, OUT3D1, OUT4D0, OUT4D1, CK : in std_logic ;
        IN1Q0, IN1Q1, IN2Q0, IN2Q1, IN3Q0, IN3Q1           : out std_logic ;
        IN4Q0, IN4Q1, OUTQ0, OUTQ1, OUTQ2, OUTQ3           : out std_logic 
 );
END COMPONENT;
attribute syn_black_box of IODDR: component is true;


COMPONENT OSR2X2
PORT(
        D10, D11, D20, D21, CK, UPDATE       : in std_logic ;
        Q1, Q2      : out std_logic 
 );
END COMPONENT;
attribute syn_black_box of OSR2X2: component is true;


COMPONENT HOSR2X2
PORT(
        D10, D11, D20, D21, CK, UPDATE       : in std_logic ;
        Q1, Q2      : out std_logic 
 );
END COMPONENT;
attribute syn_black_box of HOSR2X2: component is true;


COMPONENT HIOSR2
PORT(
        IND, OUTD0, OUTD1, CK, UPDATE       : in std_logic   ;
        INQ0, INQ1, OUTQ      : out std_logic 
 );
END COMPONENT;
attribute syn_black_box of HIOSR2: component is true;


COMPONENT HIOSR4
PORT(
        IND, OUTD0, OUTD1, OUTD2, OUTD3, CK, UPDATE       : in std_logic ;
        INQ0, INQ1, INQ2, INQ3, OUTQ      : out std_logic 
 );
END COMPONENT;
attribute syn_black_box of HIOSR4: component is true;


COMPONENT HIODDR
PORT(
        IND0, IND1, IND2, IND3, OUT1D0, OUT1D1             : in std_logic ;
        OUT2D0, OUT2D1, OUT3D0, OUT3D1, OUT4D0, OUT4D1, CK : in std_logic ;
        IN1Q0, IN1Q1, IN2Q0, IN2Q1, IN3Q0, IN3Q1           : out std_logic ;
        IN4Q0, IN4Q1, OUTQ0, OUTQ1, OUTQ2, OUTQ3           : out std_logic 
 );
END COMPONENT;
attribute syn_black_box of HIODDR: component is true;


COMPONENT DDR
PORT(
        IND0, IND1, IND2, IND3, OUTD0, OUTD1, OUTD2, OUTD3, CK : in std_logic ;
        INQ0, INQ1, INQ2, INQ3, OUTQ0, OUTQ1, OUTQ2, OUTQ3     : out std_logic
 );
END COMPONENT;
attribute syn_black_box of DDR: component is true;


COMPONENT BMW6
PORT(
        B:  inout std_logic ;
        I:  in std_logic ;
        T:  in std_logic ;
        O:  out std_logic);
END COMPONENT;
attribute syn_black_box of BMW6: component is true;


COMPONENT OBW6
PORT(
        I:  in std_logic ;
        T:  in std_logic ;
        O:  out std_logic);
END COMPONENT;
attribute syn_black_box of OBW6: component is true;


COMPONENT ILVDS
PORT(
        A : in std_logic ;
        AN: in std_logic ;
        Z : out std_logic
 );
END COMPONENT;
attribute syn_black_box of ILVDS: component is true;


COMPONENT OLVDS
PORT(
        A  : in std_logic ;
        Z  : out std_logic ;
        ZN : out std_logic
 );
END COMPONENT;
attribute syn_black_box of olvds: component is true;


COMPONENT SBR512X18
PORT(
        AW0, AW1, AW2, AW3, AW4, AW5, AW6, AW7, AW8         : in std_logic ;
        AR0, AR1, AR2, AR3, AR4, AR5, AR6, AR7, AR8         : in std_logic ;
        D0, D1, D2, D3, D4, D5, D6, D7, D8, D9              : in std_logic ;
        D10, D11, D12, D13, D14, D15, D16, D17              : in std_logic ;
        BW0, BW1, CKW, CKR, CSW, CSR                        : in std_logic ;
        SQ0, SQ1, SQ2, SQ3, SQ4, SQ5, SQ6, SQ7, SQ8, SQ9    : in std_logic ;
        SQ10, SQ11, SQ12, SQ13, SQ14, SQ15, SQ16, SQ17      : in std_logic ;
        SBUSY                                               : in std_logic ;
        Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9              : out std_logic ;
        Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, BUSY        : out std_logic ;
        SAW0, SAW1, SAW2, SAW3, SAW4, SAW5, SAW6, SAW7, SAW8   : out std_logic ;
        SAR0, SAR1, SAR2, SAR3, SAR4, SAR5, SAR6, SAR7, SAR8   : out std_logic ;
        SD0, SD1, SD2, SD3, SD4, SD5, SD6, SD7, SD8, SD9    : out std_logic ;
        SD10, SD11, SD12, SD13, SD14, SD15, SD16, SD17      : out std_logic ;
        SBW0, SBW1, SCKW, SCKR, SCSW, SCSR                  : out std_logic ;
        MC0, MC1, ARBITER                                   : out std_logic 
 );
END COMPONENT;
attribute syn_black_box of SBR512X18: component is true;


COMPONENT SBR1024X18
PORT(
        AW0, AW1, AW2, AW3, AW4, AW5, AW6, AW7, AW8, AW9             : in std_logic ;
        AR0, AR1, AR2, AR3, AR4, AR5, AR6, AR7, AR8, AR9             : in std_logic ;
        D0, D1, D2, D3, D4, D5, D6, D7, D8, D9                       : in std_logic ;
        D10, D11, D12, D13, D14, D15, D16, D17                       : in std_logic ;
        BW0, BW1, CKW, CKR, CSW, CSR                                 : in std_logic ;
        SQ0, SQ1, SQ2, SQ3, SQ4, SQ5, SQ6, SQ7, SQ8, SQ9             : in std_logic ;
        SQ10, SQ11, SQ12, SQ13, SQ14, SQ15, SQ16, SQ17, SBUSY        : in std_logic ;


        Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9                       : out std_logic ;
        Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, BUSY                 : out std_logic ;
        SAW0, SAW1, SAW2, SAW3, SAW4, SAW5, SAW6, SAW7, SAW8, SAW9   : out std_logic ;
        SAR0, SAR1, SAR2, SAR3, SAR4, SAR5, SAR6, SAR7, SAR8, SAR9   : out std_logic ;
        SD0, SD1, SD2, SD3, SD4, SD5, SD6, SD7, SD8, SD9             : out std_logic ;
        SD10, SD11, SD12, SD13, SD14, SD15, SD16, SD17               : out std_logic ;
        SBW0, SBW1, SCKW, SCKR, SCSW, SCSR                           : out std_logic ;
        MC0, MC1, ARBITER                                            : out std_logic 
 );
END COMPONENT;
attribute syn_black_box of SBR1024X18: component is true;


COMPONENT ULIS
PORT(
        RDATA0, RDATA1, RDATA2, RDATA3, RDATA4, RDATA5, RDATA6, RDATA7        : in std_logic ;
        RDATA8, RDATA9, RDATA10, RDATA11, RDATA12, RDATA13, RDATA14           : in std_logic ;
        RDATA15, RDATA16, RDATA17, RDATA18, RDATA19, RDATA20, RDATA21         : in std_logic ;
        RDATA22, RDATA23, RDATA24, RDATA25, RDATA26, RDATA27, RDATA28         : in std_logic ;
        RDATA29, RDATA30, RDATA31, RDATA32, RDATA33, RDATA34, RDATA35         : in std_logic ;
        CLK, RESET, ACK, RETRY, ERR, IRQ, SWDATA0, SWDATA1                    : in std_logic ;
        SWDATA2, SWDATA3, SWDATA4, SWDATA5, SWDATA6, SWDATA7                  : in std_logic ;
        SWDATA8, SWDATA9, SWDATA10, SWDATA11, SWDATA12, SWDATA13, SWDATA14    : in std_logic ;
        SWDATA15, SWDATA16, SWDATA17, SWDATA18, SWDATA19, SWDATA20, SWDATA21  : in std_logic ;
        SWDATA22, SWDATA23, SWDATA24, SWDATA25, SWDATA26, SWDATA27, SWDATA28  : in std_logic ;
        SWDATA29, SWDATA30, SWDATA31, SWDATA32, SWDATA33, SWDATA34, SWDATA35  : in std_logic ;
        SADDR0, SADDR1, SADDR2, SADDR3, SADDR4, SADDR5, SADDR6, SADDR7        : in std_logic ;
        SADDR8, SADDR9, SADDR10, SADDR11, SADDR12, SADDR13, SADDR14           : in std_logic ;
        SADDR15, SADDR16, SADDR17, SBURST, SRDY, SWR, SSIZE0, SSIZE1          : in std_logic ;


        WDATA0, WDATA1, WDATA2, WDATA3, WDATA4, WDATA5, WDATA6, WDATA7        : out std_logic ;
        WDATA8, WDATA9, WDATA10, WDATA11, WDATA12, WDATA13, WDATA14           : out std_logic ;
        WDATA15, WDATA16, WDATA17, WDATA18, WDATA19, WDATA20, WDATA21         : out std_logic ;
        WDATA22, WDATA23, WDATA24, WDATA25, WDATA26, WDATA27, WDATA28         : out std_logic ;
        WDATA29, WDATA30, WDATA31, WDATA32, WDATA33, WDATA34, WDATA35         : out std_logic ;
        ADDR0, ADDR1, ADDR2, ADDR3, ADDR4, ADDR5, ADDR6, ADDR7, ADDR8, ADDR9  : out std_logic ;
        ADDR10, ADDR11, ADDR12, ADDR13, ADDR14, ADDR15, ADDR16, ADDR17        : out std_logic ;
        BURST, RDY, WR, SIZE0, SIZE1, SRDATA0, SRDATA1, SRDATA2               : out std_logic ;
        SRDATA3, SRDATA4, SRDATA5, SRDATA6, SRDATA7, SRDATA8, SRDATA9         : out std_logic ;
        SRDATA10, SRDATA11, SRDATA12, SRDATA13, SRDATA14, SRDATA15, SRDATA16  : out std_logic ;
        SRDATA17, SRDATA18, SRDATA19, SRDATA20, SRDATA21, SRDATA22, SRDATA23  : out std_logic ;
        SRDATA24, SRDATA25, SRDATA26, SRDATA27, SRDATA28, SRDATA29, SRDATA30  : out std_logic ;
        SRDATA31, SRDATA32, SRDATA33, SRDATA34, SRDATA35                      : out std_logic ;
        SCLK, SRESET, SACK, SRETRY, SERR, SIRQ                                : out std_logic
 );
end component;
attribute syn_black_box of ulis : component is true;


COMPONENT ULIM
PORT(
        ADDR0, ADDR1, ADDR2, ADDR3, ADDR4, ADDR5, ADDR6, ADDR7, ADDR8, ADDR9  : in std_logic ;
        ADDR10, ADDR11, ADDR12, ADDR13, ADDR14, ADDR15, ADDR16, ADDR17        : in std_logic ;
        WDATA0, WDATA1, WDATA2, WDATA3, WDATA4, WDATA5, WDATA6, WDATA7        : in std_logic ;
        WDATA8, WDATA9, WDATA10, WDATA11, WDATA12, WDATA13, WDATA14           : in std_logic ;
        WDATA15, WDATA16, WDATA17, WDATA18, WDATA19, WDATA20, WDATA21         : in std_logic ;
        WDATA22, WDATA23, WDATA24, WDATA25, WDATA26, WDATA27, WDATA28         : in std_logic ;
        WDATA29, WDATA30, WDATA31, WDATA32, WDATA33, WDATA34, WDATA35         : in std_logic ;
        CLK, RESET, WRITE, READ, BURST, RDY, SIZE0, SIZE1, LOCK, IRQ          : in std_logic ;
        SRDATA0, SRDATA1, SRDATA2, SRDATA3, SRDATA4, SRDATA5, SRDATA6, SRDATA7: in std_logic ;
        SRDATA8, SRDATA9, SRDATA10, SRDATA11, SRDATA12, SRDATA13, SRDATA14    : in std_logic ;
        SRDATA15, SRDATA16, SRDATA17, SRDATA18, SRDATA19, SRDATA20, SRDATA21  : in std_logic ;
        SRDATA22, SRDATA23, SRDATA24, SRDATA25, SRDATA26, SRDATA27, SRDATA28  : in std_logic ;
        SRDATA29, SRDATA30, SRDATA31, SRDATA32, SRDATA33, SRDATA34, SRDATA35  : in std_logic ;
        SGRANTED, SACK, SRETRY, SERR                                          : in std_logic ;


        RDATA0, RDATA1, RDATA2, RDATA3, RDATA4, RDATA5, RDATA6, RDATA7        : out std_logic ;
        RDATA8, RDATA9, RDATA10, RDATA11, RDATA12, RDATA13, RDATA14           : out std_logic ;
        RDATA15, RDATA16, RDATA17, RDATA18, RDATA19, RDATA20, RDATA21         : out std_logic ;
        RDATA22, RDATA23, RDATA24, RDATA25, RDATA26, RDATA27, RDATA28         : out std_logic ;
        RDATA29, RDATA30, RDATA31, RDATA32, RDATA33, RDATA34, RDATA35         : out std_logic ;
        GRANTED, ACK, RETRY, ERR, SADDR0, SADDR1, SADDR2, SADDR3              : out std_logic ;
        SADDR4, SADDR5, SADDR6, SADDR7, SADDR8, SADDR9, SADDR10, SADDR11      : out std_logic ;
        SADDR12, SADDR13, SADDR14, SADDR15, SADDR16, SADDR17                  : out std_logic ;
        SWDATA0, SWDATA1, SWDATA2, SWDATA3, SWDATA4, SWDATA5, SWDATA6         : out std_logic ;
        SWDATA7, SWDATA8, SWDATA9, SWDATA10, SWDATA11, SWDATA12, SWDATA13     : out std_logic ;
        SWDATA14, SWDATA15, SWDATA16, SWDATA17, SWDATA18, SWDATA19, SWDATA20  : out std_logic ;
        SWDATA21, SWDATA22, SWDATA23, SWDATA24, SWDATA25, SWDATA26, SWDATA27  : out std_logic ;
        SWDATA28, SWDATA29, SWDATA30, SWDATA31, SWDATA32, SWDATA33, SWDATA34  : out std_logic ;
        SWDATA35, SCLK, SRESET, SWRITE, SREAD, SBURST, SRDY                   : out std_logic ;
        SSIZE0, SSIZE1, SLOCK, SIRQ                                           : out std_logic
 );
END COMPONENT;
ATTRIBUTE SYN_BLACK_BOX OF ULIM : COMPONENT IS TRUE;


COMPONENT SYSBUS
        port (CS0_N: in  std_logic; CS1: in  std_logic; 
            MPC_CLK: in  std_logic; MPC_RW_N: in  std_logic; 
            MPC_STRB_N: in  std_logic; MPC_TSIZ_1: in  std_logic; 
            MPC_TSIZ_0: in  std_logic; MPC_BURST: in  std_logic; 
            MPC_BDIP: in  std_logic; MPC_ADDR_31: in  std_logic; 
            MPC_ADDR_30: in  std_logic; MPC_ADDR_29: in  std_logic; 
            MPC_ADDR_28: in  std_logic; MPC_ADDR_27: in  std_logic; 
            MPC_ADDR_26: in  std_logic; MPC_ADDR_25: in  std_logic; 
            MPC_ADDR_24: in  std_logic; MPC_ADDR_23: in  std_logic; 
            MPC_ADDR_22: in  std_logic; MPC_ADDR_21: in  std_logic; 
            MPC_ADDR_20: in  std_logic; MPC_ADDR_19: in  std_logic; 
            MPC_ADDR_18: in  std_logic; MPC_ADDR_17: in  std_logic; 
            MPC_ADDR_16: in  std_logic; MPC_ADDR_15: in  std_logic; 
            MPC_ADDR_14: in  std_logic; MPC_WR_DATA_31: in  std_logic; 
            MPC_WR_DATA_30: in  std_logic; MPC_WR_DATA_29: in  std_logic; 
            MPC_WR_DATA_28: in  std_logic; MPC_WR_DATA_27: in  std_logic; 
            MPC_WR_DATA_26: in  std_logic; MPC_WR_DATA_25: in  std_logic; 
            MPC_WR_DATA_24: in  std_logic; MPC_WR_DATA_23: in  std_logic; 
            MPC_WR_DATA_22: in  std_logic; MPC_WR_DATA_21: in  std_logic; 
            MPC_WR_DATA_20: in  std_logic; MPC_WR_DATA_19: in  std_logic; 
            MPC_WR_DATA_18: in  std_logic; MPC_WR_DATA_17: in  std_logic; 
            MPC_WR_DATA_16: in  std_logic; MPC_WR_DATA_15: in  std_logic; 
            MPC_WR_DATA_14: in  std_logic; MPC_WR_DATA_13: in  std_logic; 
            MPC_WR_DATA_12: in  std_logic; MPC_WR_DATA_11: in  std_logic; 
            MPC_WR_DATA_10: in  std_logic; MPC_WR_DATA_9: in  std_logic; 
            MPC_WR_DATA_8: in  std_logic; MPC_WR_DATA_7: in  std_logic; 
            MPC_WR_DATA_6: in  std_logic; MPC_WR_DATA_5: in  std_logic; 
            MPC_WR_DATA_4: in  std_logic; MPC_WR_DATA_3: in  std_logic; 
            MPC_WR_DATA_2: in  std_logic; MPC_WR_DATA_1: in  std_logic; 
            MPC_WR_DATA_0: in  std_logic; MPC_WR_PARITY_3: in  std_logic; 
            MPC_WR_PARITY_2: in  std_logic; 
            MPC_WR_PARITY_1: in  std_logic; 
            MPC_WR_PARITY_0: in  std_logic; USR_CLK: in  std_logic; 
            USR_IRQ_GENERAL: in  std_logic; FMADDR_0: in  std_logic; 
            FMADDR_1: in  std_logic; FMADDR_2: in  std_logic; 
            FMADDR_3: in  std_logic; FMADDR_4: in  std_logic; 
            FMADDR_5: in  std_logic; FMADDR_6: in  std_logic; 
            FMADDR_7: in  std_logic; FMADDR_8: in  std_logic; 
            FMADDR_9: in  std_logic; FMADDR_10: in  std_logic; 
            FMADDR_11: in  std_logic; FMADDR_12: in  std_logic; 
            FMADDR_13: in  std_logic; FMADDR_14: in  std_logic; 
            FMADDR_15: in  std_logic; FMADDR_16: in  std_logic; 
            FMADDR_17: in  std_logic; FMWDATA_0: in  std_logic; 
            FMWDATA_1: in  std_logic; FMWDATA_2: in  std_logic; 
            FMWDATA_3: in  std_logic; FMWDATA_4: in  std_logic; 
            FMWDATA_5: in  std_logic; FMWDATA_6: in  std_logic; 
            FMWDATA_7: in  std_logic; FMWDATA_8: in  std_logic; 
            FMWDATA_9: in  std_logic; FMWDATA_10: in  std_logic; 
            FMWDATA_11: in  std_logic; FMWDATA_12: in  std_logic; 
            FMWDATA_13: in  std_logic; FMWDATA_14: in  std_logic; 
            FMWDATA_15: in  std_logic; FMWDATA_16: in  std_logic; 
            FMWDATA_17: in  std_logic; FMWDATA_18: in  std_logic; 
            FMWDATA_19: in  std_logic; FMWDATA_20: in  std_logic; 
            FMWDATA_21: in  std_logic; FMWDATA_22: in  std_logic; 
            FMWDATA_23: in  std_logic; FMWDATA_24: in  std_logic; 
            FMWDATA_25: in  std_logic; FMWDATA_26: in  std_logic; 
            FMWDATA_27: in  std_logic; FMWDATA_28: in  std_logic; 
            FMWDATA_29: in  std_logic; FMWDATA_30: in  std_logic; 
            FMWDATA_31: in  std_logic; FMWDATA_32: in  std_logic; 
            FMWDATA_33: in  std_logic; FMWDATA_34: in  std_logic; 
            FMWDATA_35: in  std_logic; FMCLK: in  std_logic; 
            FMRESET: in  std_logic; FMWRITE: in  std_logic; 
            FMREAD: in  std_logic; FMBURST: in  std_logic; 
            FMRDY: in  std_logic; FMSIZE_0: in  std_logic; 
            FMSIZE_1: in  std_logic; FMLOCK: in  std_logic; 
            FMIRQI: in  std_logic; FSRDATA_0: in  std_logic; 
            FSRDATA_1: in  std_logic; FSRDATA_2: in  std_logic; 
            FSRDATA_3: in  std_logic; FSRDATA_4: in  std_logic; 
            FSRDATA_5: in  std_logic; FSRDATA_6: in  std_logic; 
            FSRDATA_7: in  std_logic; FSRDATA_8: in  std_logic; 
            FSRDATA_9: in  std_logic; FSRDATA_10: in  std_logic; 
            FSRDATA_11: in  std_logic; FSRDATA_12: in  std_logic; 
            FSRDATA_13: in  std_logic; FSRDATA_14: in  std_logic; 
            FSRDATA_15: in  std_logic; FSRDATA_16: in  std_logic; 
            FSRDATA_17: in  std_logic; FSRDATA_18: in  std_logic; 
            FSRDATA_19: in  std_logic; FSRDATA_20: in  std_logic; 
            FSRDATA_21: in  std_logic; FSRDATA_22: in  std_logic; 
            FSRDATA_23: in  std_logic; FSRDATA_24: in  std_logic; 
            FSRDATA_25: in  std_logic; FSRDATA_26: in  std_logic; 
            FSRDATA_27: in  std_logic; FSRDATA_28: in  std_logic; 
            FSRDATA_29: in  std_logic; FSRDATA_30: in  std_logic; 
            FSRDATA_31: in  std_logic; FSRDATA_32: in  std_logic; 
            FSRDATA_33: in  std_logic; FSRDATA_34: in  std_logic; 
            FSRDATA_35: in  std_logic; FSCLK: in  std_logic; 
            FSRESET: in  std_logic; FSACK: in  std_logic; 
            FSRETRY: in  std_logic; FSERR: in  std_logic; 
            FSIRQI: in  std_logic; A_AW0_0_TOP_0: in  std_logic; 
            A_AW0_0_TOP_1: in  std_logic; A_AW0_0_TOP_2: in  std_logic; 
            A_AW0_0_TOP_3: in  std_logic; A_AW0_0_TOP_4: in  std_logic; 
            A_AW0_0_TOP_5: in  std_logic; A_AW0_0_TOP_6: in  std_logic; 
            A_AW0_0_TOP_7: in  std_logic; A_AW0_0_TOP_8: in  std_logic; 
            A_AW0_0_TOP_9: in  std_logic; A_AR0_0_TOP_0: in  std_logic; 
            A_AR0_0_TOP_1: in  std_logic; A_AR0_0_TOP_2: in  std_logic; 
            A_AR0_0_TOP_3: in  std_logic; A_AR0_0_TOP_4: in  std_logic; 
            A_AR0_0_TOP_5: in  std_logic; A_AR0_0_TOP_6: in  std_logic; 
            A_AR0_0_TOP_7: in  std_logic; A_AR0_0_TOP_8: in  std_logic; 
            A_AR0_0_TOP_9: in  std_logic; A_D0_0_TOP_0: in  std_logic; 
            A_D0_0_TOP_1: in  std_logic; A_D0_0_TOP_2: in  std_logic; 
            A_D0_0_TOP_3: in  std_logic; A_D0_0_TOP_4: in  std_logic; 
            A_D0_0_TOP_5: in  std_logic; A_D0_0_TOP_6: in  std_logic; 
            A_D0_0_TOP_7: in  std_logic; A_D0_0_TOP_8: in  std_logic; 
            A_D0_0_TOP_9: in  std_logic; A_D0_0_TOP_10: in  std_logic; 
            A_D0_0_TOP_11: in  std_logic; A_D0_0_TOP_12: in  std_logic; 
            A_D0_0_TOP_13: in  std_logic; A_D0_0_TOP_14: in  std_logic; 
            A_D0_0_TOP_15: in  std_logic; A_D0_0_TOP_16: in  std_logic; 
            A_D0_0_TOP_17: in  std_logic; A_BW0_0_TOP_0: in  std_logic; 
            A_BW0_0_TOP_1: in  std_logic; A_CKW_0_TOP_0: in  std_logic; 
            A_CKR_0_TOP_0: in  std_logic; A_CSW_0_TOP_0: in  std_logic; 
            A_CSR_0_TOP_0: in  std_logic; B_AW0_0_TOP_0: in  std_logic; 
            B_AW0_0_TOP_1: in  std_logic; B_AW0_0_TOP_2: in  std_logic; 
            B_AW0_0_TOP_3: in  std_logic; B_AW0_0_TOP_4: in  std_logic; 
            B_AW0_0_TOP_5: in  std_logic; B_AW0_0_TOP_6: in  std_logic; 
            B_AW0_0_TOP_7: in  std_logic; B_AW0_0_TOP_8: in  std_logic; 
            B_AW0_0_TOP_9: in  std_logic; B_AR0_0_TOP_0: in  std_logic; 
            B_AR0_0_TOP_1: in  std_logic; B_AR0_0_TOP_2: in  std_logic; 
            B_AR0_0_TOP_3: in  std_logic; B_AR0_0_TOP_4: in  std_logic; 
            B_AR0_0_TOP_5: in  std_logic; B_AR0_0_TOP_6: in  std_logic; 
            B_AR0_0_TOP_7: in  std_logic; B_AR0_0_TOP_8: in  std_logic; 
            B_AR0_0_TOP_9: in  std_logic; B_D0_0_TOP_0: in  std_logic; 
            B_D0_0_TOP_1: in  std_logic; B_D0_0_TOP_2: in  std_logic; 
            B_D0_0_TOP_3: in  std_logic; B_D0_0_TOP_4: in  std_logic; 
            B_D0_0_TOP_5: in  std_logic; B_D0_0_TOP_6: in  std_logic; 
            B_D0_0_TOP_7: in  std_logic; B_D0_0_TOP_8: in  std_logic; 
            B_D0_0_TOP_9: in  std_logic; B_D0_0_TOP_10: in  std_logic; 
            B_D0_0_TOP_11: in  std_logic; B_D0_0_TOP_12: in  std_logic; 
            B_D0_0_TOP_13: in  std_logic; B_D0_0_TOP_14: in  std_logic; 
            B_D0_0_TOP_15: in  std_logic; B_D0_0_TOP_16: in  std_logic; 
            B_D0_0_TOP_17: in  std_logic; B_BW0_0_TOP_0: in  std_logic; 
            B_BW0_0_TOP_1: in  std_logic; B_CKW_0_TOP_0: in  std_logic; 
            B_CKR_0_TOP_0: in  std_logic; B_CSW_0_TOP_0: in  std_logic; 
            B_CSR_0_TOP_0: in  std_logic; MC1_0_TOP_0: in  std_logic; 
            MC1_0_TOP_1: in  std_logic; MC1_0_TOP_9: in  std_logic; 
            MC1_0_TOP_12: in  std_logic; MC1_0_TOP_13: in  std_logic; 
            MC1_0_TOP_19: in  std_logic; MC1_0_TOP_22: in  std_logic; 
            A_AW0_1_TOP_0: in  std_logic; A_AW0_1_TOP_1: in  std_logic; 
            A_AW0_1_TOP_2: in  std_logic; A_AW0_1_TOP_3: in  std_logic; 
            A_AW0_1_TOP_4: in  std_logic; A_AW0_1_TOP_5: in  std_logic; 
            A_AW0_1_TOP_6: in  std_logic; A_AW0_1_TOP_7: in  std_logic; 
            A_AW0_1_TOP_8: in  std_logic; A_AW0_1_TOP_9: in  std_logic; 
            A_AR0_1_TOP_0: in  std_logic; A_AR0_1_TOP_1: in  std_logic; 
            A_AR0_1_TOP_2: in  std_logic; A_AR0_1_TOP_3: in  std_logic; 
            A_AR0_1_TOP_4: in  std_logic; A_AR0_1_TOP_5: in  std_logic; 
            A_AR0_1_TOP_6: in  std_logic; A_AR0_1_TOP_7: in  std_logic; 
            A_AR0_1_TOP_8: in  std_logic; A_AR0_1_TOP_9: in  std_logic; 
            A_D0_1_TOP_0: in  std_logic; A_D0_1_TOP_1: in  std_logic; 
            A_D0_1_TOP_2: in  std_logic; A_D0_1_TOP_3: in  std_logic; 
            A_D0_1_TOP_4: in  std_logic; A_D0_1_TOP_5: in  std_logic; 
            A_D0_1_TOP_6: in  std_logic; A_D0_1_TOP_7: in  std_logic; 
            A_D0_1_TOP_8: in  std_logic; A_D0_1_TOP_9: in  std_logic; 
            A_D0_1_TOP_10: in  std_logic; A_D0_1_TOP_11: in  std_logic; 
            A_D0_1_TOP_12: in  std_logic; A_D0_1_TOP_13: in  std_logic; 
            A_D0_1_TOP_14: in  std_logic; A_D0_1_TOP_15: in  std_logic; 
            A_D0_1_TOP_16: in  std_logic; A_D0_1_TOP_17: in  std_logic; 
            A_BW0_1_TOP_0: in  std_logic; A_BW0_1_TOP_1: in  std_logic; 
            A_CKW_1_TOP_0: in  std_logic; A_CKR_1_TOP_0: in  std_logic; 
            A_CSW_1_TOP_0: in  std_logic; A_CSR_1_TOP_0: in  std_logic; 
            B_AW0_1_TOP_0: in  std_logic; B_AW0_1_TOP_1: in  std_logic; 
            B_AW0_1_TOP_2: in  std_logic; B_AW0_1_TOP_3: in  std_logic; 
            B_AW0_1_TOP_4: in  std_logic; B_AW0_1_TOP_5: in  std_logic; 
            B_AW0_1_TOP_6: in  std_logic; B_AW0_1_TOP_7: in  std_logic; 
            B_AW0_1_TOP_8: in  std_logic; B_AW0_1_TOP_9: in  std_logic; 
            B_AR0_1_TOP_0: in  std_logic; B_AR0_1_TOP_1: in  std_logic; 
            B_AR0_1_TOP_2: in  std_logic; B_AR0_1_TOP_3: in  std_logic; 
            B_AR0_1_TOP_4: in  std_logic; B_AR0_1_TOP_5: in  std_logic; 
            B_AR0_1_TOP_6: in  std_logic; B_AR0_1_TOP_7: in  std_logic; 
            B_AR0_1_TOP_8: in  std_logic; B_AR0_1_TOP_9: in  std_logic; 
            B_D0_1_TOP_0: in  std_logic; B_D0_1_TOP_1: in  std_logic; 
            B_D0_1_TOP_2: in  std_logic; B_D0_1_TOP_3: in  std_logic; 
            B_D0_1_TOP_4: in  std_logic; B_D0_1_TOP_5: in  std_logic; 
            B_D0_1_TOP_6: in  std_logic; B_D0_1_TOP_7: in  std_logic; 
            B_D0_1_TOP_8: in  std_logic; B_D0_1_TOP_9: in  std_logic; 
            B_D0_1_TOP_10: in  std_logic; B_D0_1_TOP_11: in  std_logic; 
            B_D0_1_TOP_12: in  std_logic; B_D0_1_TOP_13: in  std_logic; 
            B_D0_1_TOP_14: in  std_logic; B_D0_1_TOP_15: in  std_logic; 
            B_D0_1_TOP_16: in  std_logic; B_D0_1_TOP_17: in  std_logic; 
            B_BW0_1_TOP_0: in  std_logic; B_BW0_1_TOP_1: in  std_logic; 
            B_CKW_1_TOP_0: in  std_logic; B_CKR_1_TOP_0: in  std_logic; 
            B_CSW_1_TOP_0: in  std_logic; B_CSR_1_TOP_0: in  std_logic; 
            MC1_1_TOP_0: in  std_logic; MC1_1_TOP_1: in  std_logic; 
            MC1_1_TOP_9: in  std_logic; MC1_1_TOP_12: in  std_logic; 
            MC1_1_TOP_13: in  std_logic; MC1_1_TOP_19: in  std_logic; 
            MC1_1_TOP_22: in  std_logic; A_AW0_2_TOP_0: in  std_logic; 
            A_AW0_2_TOP_1: in  std_logic; A_AW0_2_TOP_2: in  std_logic; 
            A_AW0_2_TOP_3: in  std_logic; A_AW0_2_TOP_4: in  std_logic; 
            A_AW0_2_TOP_5: in  std_logic; A_AW0_2_TOP_6: in  std_logic; 
            A_AW0_2_TOP_7: in  std_logic; A_AW0_2_TOP_8: in  std_logic; 
            A_AW0_2_TOP_9: in  std_logic; A_AR0_2_TOP_0: in  std_logic; 
            A_AR0_2_TOP_1: in  std_logic; A_AR0_2_TOP_2: in  std_logic; 
            A_AR0_2_TOP_3: in  std_logic; A_AR0_2_TOP_4: in  std_logic; 
            A_AR0_2_TOP_5: in  std_logic; A_AR0_2_TOP_6: in  std_logic; 
            A_AR0_2_TOP_7: in  std_logic; A_AR0_2_TOP_8: in  std_logic; 
            A_AR0_2_TOP_9: in  std_logic; A_D0_2_TOP_0: in  std_logic; 
            A_D0_2_TOP_1: in  std_logic; A_D0_2_TOP_2: in  std_logic; 
            A_D0_2_TOP_3: in  std_logic; A_D0_2_TOP_4: in  std_logic; 
            A_D0_2_TOP_5: in  std_logic; A_D0_2_TOP_6: in  std_logic; 
            A_D0_2_TOP_7: in  std_logic; A_D0_2_TOP_8: in  std_logic; 
            A_D0_2_TOP_9: in  std_logic; A_D0_2_TOP_10: in  std_logic; 
            A_D0_2_TOP_11: in  std_logic; A_D0_2_TOP_12: in  std_logic; 
            A_D0_2_TOP_13: in  std_logic; A_D0_2_TOP_14: in  std_logic; 
            A_D0_2_TOP_15: in  std_logic; A_D0_2_TOP_16: in  std_logic; 
            A_D0_2_TOP_17: in  std_logic; A_BW0_2_TOP_0: in  std_logic; 
            A_BW0_2_TOP_1: in  std_logic; A_CKW_2_TOP_0: in  std_logic; 
            A_CKR_2_TOP_0: in  std_logic; A_CSW_2_TOP_0: in  std_logic; 
            A_CSR_2_TOP_0: in  std_logic; B_AW0_2_TOP_0: in  std_logic; 
            B_AW0_2_TOP_1: in  std_logic; B_AW0_2_TOP_2: in  std_logic; 
            B_AW0_2_TOP_3: in  std_logic; B_AW0_2_TOP_4: in  std_logic; 
            B_AW0_2_TOP_5: in  std_logic; B_AW0_2_TOP_6: in  std_logic; 
            B_AW0_2_TOP_7: in  std_logic; B_AW0_2_TOP_8: in  std_logic; 
            B_AW0_2_TOP_9: in  std_logic; B_AR0_2_TOP_0: in  std_logic; 
            B_AR0_2_TOP_1: in  std_logic; B_AR0_2_TOP_2: in  std_logic; 
            B_AR0_2_TOP_3: in  std_logic; B_AR0_2_TOP_4: in  std_logic; 
            B_AR0_2_TOP_5: in  std_logic; B_AR0_2_TOP_6: in  std_logic; 
            B_AR0_2_TOP_7: in  std_logic; B_AR0_2_TOP_8: in  std_logic; 
            B_AR0_2_TOP_9: in  std_logic; B_D0_2_TOP_0: in  std_logic; 
            B_D0_2_TOP_1: in  std_logic; B_D0_2_TOP_2: in  std_logic; 
            B_D0_2_TOP_3: in  std_logic; B_D0_2_TOP_4: in  std_logic; 
            B_D0_2_TOP_5: in  std_logic; B_D0_2_TOP_6: in  std_logic; 
            B_D0_2_TOP_7: in  std_logic; B_D0_2_TOP_8: in  std_logic; 
            B_D0_2_TOP_9: in  std_logic; B_D0_2_TOP_10: in  std_logic; 
            B_D0_2_TOP_11: in  std_logic; B_D0_2_TOP_12: in  std_logic; 
            B_D0_2_TOP_13: in  std_logic; B_D0_2_TOP_14: in  std_logic; 
            B_D0_2_TOP_15: in  std_logic; B_D0_2_TOP_16: in  std_logic; 
            B_D0_2_TOP_17: in  std_logic; B_BW0_2_TOP_0: in  std_logic; 
            B_BW0_2_TOP_1: in  std_logic; B_CKW_2_TOP_0: in  std_logic; 
            B_CKR_2_TOP_0: in  std_logic; B_CSW_2_TOP_0: in  std_logic; 
            B_CSR_2_TOP_0: in  std_logic; MC1_2_TOP_0: in  std_logic; 
            MC1_2_TOP_1: in  std_logic; MC1_2_TOP_9: in  std_logic; 
            MC1_2_TOP_12: in  std_logic; MC1_2_TOP_13: in  std_logic; 
            MC1_2_TOP_19: in  std_logic; MC1_2_TOP_22: in  std_logic; 
            A_AW0_3_TOP_0: in  std_logic; A_AW0_3_TOP_1: in  std_logic; 
            A_AW0_3_TOP_2: in  std_logic; A_AW0_3_TOP_3: in  std_logic; 
            A_AW0_3_TOP_4: in  std_logic; A_AW0_3_TOP_5: in  std_logic; 
            A_AW0_3_TOP_6: in  std_logic; A_AW0_3_TOP_7: in  std_logic; 
            A_AW0_3_TOP_8: in  std_logic; A_AW0_3_TOP_9: in  std_logic; 
            A_AR0_3_TOP_0: in  std_logic; A_AR0_3_TOP_1: in  std_logic; 
            A_AR0_3_TOP_2: in  std_logic; A_AR0_3_TOP_3: in  std_logic; 
            A_AR0_3_TOP_4: in  std_logic; A_AR0_3_TOP_5: in  std_logic; 
            A_AR0_3_TOP_6: in  std_logic; A_AR0_3_TOP_7: in  std_logic; 
            A_AR0_3_TOP_8: in  std_logic; A_AR0_3_TOP_9: in  std_logic; 
            A_D0_3_TOP_0: in  std_logic; A_D0_3_TOP_1: in  std_logic; 
            A_D0_3_TOP_2: in  std_logic; A_D0_3_TOP_3: in  std_logic; 
            A_D0_3_TOP_4: in  std_logic; A_D0_3_TOP_5: in  std_logic; 
            A_D0_3_TOP_6: in  std_logic; A_D0_3_TOP_7: in  std_logic; 
            A_D0_3_TOP_8: in  std_logic; A_D0_3_TOP_9: in  std_logic; 
            A_D0_3_TOP_10: in  std_logic; A_D0_3_TOP_11: in  std_logic; 
            A_D0_3_TOP_12: in  std_logic; A_D0_3_TOP_13: in  std_logic; 
            A_D0_3_TOP_14: in  std_logic; A_D0_3_TOP_15: in  std_logic; 
            A_D0_3_TOP_16: in  std_logic; A_D0_3_TOP_17: in  std_logic; 
            A_BW0_3_TOP_0: in  std_logic; A_BW0_3_TOP_1: in  std_logic; 
            A_CKW_3_TOP_0: in  std_logic; A_CKR_3_TOP_0: in  std_logic; 
            A_CSW_3_TOP_0: in  std_logic; A_CSR_3_TOP_0: in  std_logic; 
            B_AW0_3_TOP_0: in  std_logic; B_AW0_3_TOP_1: in  std_logic; 
            B_AW0_3_TOP_2: in  std_logic; B_AW0_3_TOP_3: in  std_logic; 
            B_AW0_3_TOP_4: in  std_logic; B_AW0_3_TOP_5: in  std_logic; 
            B_AW0_3_TOP_6: in  std_logic; B_AW0_3_TOP_7: in  std_logic; 
            B_AW0_3_TOP_8: in  std_logic; B_AW0_3_TOP_9: in  std_logic; 
            B_AR0_3_TOP_0: in  std_logic; B_AR0_3_TOP_1: in  std_logic; 
            B_AR0_3_TOP_2: in  std_logic; B_AR0_3_TOP_3: in  std_logic; 
            B_AR0_3_TOP_4: in  std_logic; B_AR0_3_TOP_5: in  std_logic; 
            B_AR0_3_TOP_6: in  std_logic; B_AR0_3_TOP_7: in  std_logic; 
            B_AR0_3_TOP_8: in  std_logic; B_AR0_3_TOP_9: in  std_logic; 
            B_D0_3_TOP_0: in  std_logic; B_D0_3_TOP_1: in  std_logic; 
            B_D0_3_TOP_2: in  std_logic; B_D0_3_TOP_3: in  std_logic; 
            B_D0_3_TOP_4: in  std_logic; B_D0_3_TOP_5: in  std_logic; 
            B_D0_3_TOP_6: in  std_logic; B_D0_3_TOP_7: in  std_logic; 
            B_D0_3_TOP_8: in  std_logic; B_D0_3_TOP_9: in  std_logic; 
            B_D0_3_TOP_10: in  std_logic; B_D0_3_TOP_11: in  std_logic; 
            B_D0_3_TOP_12: in  std_logic; B_D0_3_TOP_13: in  std_logic; 
            B_D0_3_TOP_14: in  std_logic; B_D0_3_TOP_15: in  std_logic; 
            B_D0_3_TOP_16: in  std_logic; B_D0_3_TOP_17: in  std_logic; 
            B_BW0_3_TOP_0: in  std_logic; B_BW0_3_TOP_1: in  std_logic; 
            B_CKW_3_TOP_0: in  std_logic; B_CKR_3_TOP_0: in  std_logic; 
            B_CSW_3_TOP_0: in  std_logic; B_CSR_3_TOP_0: in  std_logic; 
            MC1_3_TOP_0: in  std_logic; MC1_3_TOP_1: in  std_logic; 
            MC1_3_TOP_9: in  std_logic; MC1_3_TOP_12: in  std_logic; 
            MC1_3_TOP_13: in  std_logic; MC1_3_TOP_19: in  std_logic; 
            MC1_3_TOP_22: in  std_logic; A_AW0_0_BOT_0: in  std_logic; 
            A_AW0_0_BOT_1: in  std_logic; A_AW0_0_BOT_2: in  std_logic; 
            A_AW0_0_BOT_3: in  std_logic; A_AW0_0_BOT_4: in  std_logic; 
            A_AW0_0_BOT_5: in  std_logic; A_AW0_0_BOT_6: in  std_logic; 
            A_AW0_0_BOT_7: in  std_logic; A_AW0_0_BOT_8: in  std_logic; 
            A_AW0_0_BOT_9: in  std_logic; A_AR0_0_BOT_0: in  std_logic; 
            A_AR0_0_BOT_1: in  std_logic; A_AR0_0_BOT_2: in  std_logic; 
            A_AR0_0_BOT_3: in  std_logic; A_AR0_0_BOT_4: in  std_logic; 
            A_AR0_0_BOT_5: in  std_logic; A_AR0_0_BOT_6: in  std_logic; 
            A_AR0_0_BOT_7: in  std_logic; A_AR0_0_BOT_8: in  std_logic; 
            A_AR0_0_BOT_9: in  std_logic; A_D0_0_BOT_0: in  std_logic; 
            A_D0_0_BOT_1: in  std_logic; A_D0_0_BOT_2: in  std_logic; 
            A_D0_0_BOT_3: in  std_logic; A_D0_0_BOT_4: in  std_logic; 
            A_D0_0_BOT_5: in  std_logic; A_D0_0_BOT_6: in  std_logic; 
            A_D0_0_BOT_7: in  std_logic; A_D0_0_BOT_8: in  std_logic; 
            A_D0_0_BOT_9: in  std_logic; A_D0_0_BOT_10: in  std_logic; 
            A_D0_0_BOT_11: in  std_logic; A_D0_0_BOT_12: in  std_logic; 
            A_D0_0_BOT_13: in  std_logic; A_D0_0_BOT_14: in  std_logic; 
            A_D0_0_BOT_15: in  std_logic; A_D0_0_BOT_16: in  std_logic; 
            A_D0_0_BOT_17: in  std_logic; A_BW0_0_BOT_0: in  std_logic; 
            A_BW0_0_BOT_1: in  std_logic; A_CKW_0_BOT_0: in  std_logic; 
            A_CKR_0_BOT_0: in  std_logic; A_CSW_0_BOT_0: in  std_logic; 
            A_CSR_0_BOT_0: in  std_logic; B_AW0_0_BOT_0: in  std_logic; 
            B_AW0_0_BOT_1: in  std_logic; B_AW0_0_BOT_2: in  std_logic; 
            B_AW0_0_BOT_3: in  std_logic; B_AW0_0_BOT_4: in  std_logic; 
            B_AW0_0_BOT_5: in  std_logic; B_AW0_0_BOT_6: in  std_logic; 
            B_AW0_0_BOT_7: in  std_logic; B_AW0_0_BOT_8: in  std_logic; 
            B_AW0_0_BOT_9: in  std_logic; B_AR0_0_BOT_0: in  std_logic; 
            B_AR0_0_BOT_1: in  std_logic; B_AR0_0_BOT_2: in  std_logic; 
            B_AR0_0_BOT_3: in  std_logic; B_AR0_0_BOT_4: in  std_logic; 
            B_AR0_0_BOT_5: in  std_logic; B_AR0_0_BOT_6: in  std_logic; 
            B_AR0_0_BOT_7: in  std_logic; B_AR0_0_BOT_8: in  std_logic; 
            B_AR0_0_BOT_9: in  std_logic; B_D0_0_BOT_0: in  std_logic; 
            B_D0_0_BOT_1: in  std_logic; B_D0_0_BOT_2: in  std_logic; 
            B_D0_0_BOT_3: in  std_logic; B_D0_0_BOT_4: in  std_logic; 
            B_D0_0_BOT_5: in  std_logic; B_D0_0_BOT_6: in  std_logic; 
            B_D0_0_BOT_7: in  std_logic; B_D0_0_BOT_8: in  std_logic; 
            B_D0_0_BOT_9: in  std_logic; B_D0_0_BOT_10: in  std_logic; 
            B_D0_0_BOT_11: in  std_logic; B_D0_0_BOT_12: in  std_logic; 
            B_D0_0_BOT_13: in  std_logic; B_D0_0_BOT_14: in  std_logic; 
            B_D0_0_BOT_15: in  std_logic; B_D0_0_BOT_16: in  std_logic; 
            B_D0_0_BOT_17: in  std_logic; B_BW0_0_BOT_0: in  std_logic; 
            B_BW0_0_BOT_1: in  std_logic; B_CKW_0_BOT_0: in  std_logic; 
            B_CKR_0_BOT_0: in  std_logic; B_CSW_0_BOT_0: in  std_logic; 
            B_CSR_0_BOT_0: in  std_logic; MC1_0_BOT_0: in  std_logic; 
            MC1_0_BOT_1: in  std_logic; MC1_0_BOT_9: in  std_logic; 
            MC1_0_BOT_12: in  std_logic; MC1_0_BOT_13: in  std_logic; 
            MC1_0_BOT_19: in  std_logic; MC1_0_BOT_22: in  std_logic; 
            A_AW0_1_BOT_0: in  std_logic; A_AW0_1_BOT_1: in  std_logic; 
            A_AW0_1_BOT_2: in  std_logic; A_AW0_1_BOT_3: in  std_logic; 
            A_AW0_1_BOT_4: in  std_logic; A_AW0_1_BOT_5: in  std_logic; 
            A_AW0_1_BOT_6: in  std_logic; A_AW0_1_BOT_7: in  std_logic; 
            A_AW0_1_BOT_8: in  std_logic; A_AW0_1_BOT_9: in  std_logic; 
            A_AR0_1_BOT_0: in  std_logic; A_AR0_1_BOT_1: in  std_logic; 
            A_AR0_1_BOT_2: in  std_logic; A_AR0_1_BOT_3: in  std_logic; 
            A_AR0_1_BOT_4: in  std_logic; A_AR0_1_BOT_5: in  std_logic; 
            A_AR0_1_BOT_6: in  std_logic; A_AR0_1_BOT_7: in  std_logic; 
            A_AR0_1_BOT_8: in  std_logic; A_AR0_1_BOT_9: in  std_logic; 
            A_D0_1_BOT_0: in  std_logic; A_D0_1_BOT_1: in  std_logic; 
            A_D0_1_BOT_2: in  std_logic; A_D0_1_BOT_3: in  std_logic; 
            A_D0_1_BOT_4: in  std_logic; A_D0_1_BOT_5: in  std_logic; 
            A_D0_1_BOT_6: in  std_logic; A_D0_1_BOT_7: in  std_logic; 
            A_D0_1_BOT_8: in  std_logic; A_D0_1_BOT_9: in  std_logic; 
            A_D0_1_BOT_10: in  std_logic; A_D0_1_BOT_11: in  std_logic; 
            A_D0_1_BOT_12: in  std_logic; A_D0_1_BOT_13: in  std_logic; 
            A_D0_1_BOT_14: in  std_logic; A_D0_1_BOT_15: in  std_logic; 
            A_D0_1_BOT_16: in  std_logic; A_D0_1_BOT_17: in  std_logic; 
            A_BW0_1_BOT_0: in  std_logic; A_BW0_1_BOT_1: in  std_logic; 
            A_CKW_1_BOT_0: in  std_logic; A_CKR_1_BOT_0: in  std_logic; 
            A_CSW_1_BOT_0: in  std_logic; A_CSR_1_BOT_0: in  std_logic; 
            B_AW0_1_BOT_0: in  std_logic; B_AW0_1_BOT_1: in  std_logic; 
            B_AW0_1_BOT_2: in  std_logic; B_AW0_1_BOT_3: in  std_logic; 
            B_AW0_1_BOT_4: in  std_logic; B_AW0_1_BOT_5: in  std_logic; 
            B_AW0_1_BOT_6: in  std_logic; B_AW0_1_BOT_7: in  std_logic; 
            B_AW0_1_BOT_8: in  std_logic; B_AW0_1_BOT_9: in  std_logic; 
            B_AR0_1_BOT_0: in  std_logic; B_AR0_1_BOT_1: in  std_logic; 
            B_AR0_1_BOT_2: in  std_logic; B_AR0_1_BOT_3: in  std_logic; 
            B_AR0_1_BOT_4: in  std_logic; B_AR0_1_BOT_5: in  std_logic; 
            B_AR0_1_BOT_6: in  std_logic; B_AR0_1_BOT_7: in  std_logic; 
            B_AR0_1_BOT_8: in  std_logic; B_AR0_1_BOT_9: in  std_logic; 
            B_D0_1_BOT_0: in  std_logic; B_D0_1_BOT_1: in  std_logic; 
            B_D0_1_BOT_2: in  std_logic; B_D0_1_BOT_3: in  std_logic; 
            B_D0_1_BOT_4: in  std_logic; B_D0_1_BOT_5: in  std_logic; 
            B_D0_1_BOT_6: in  std_logic; B_D0_1_BOT_7: in  std_logic; 
            B_D0_1_BOT_8: in  std_logic; B_D0_1_BOT_9: in  std_logic; 
            B_D0_1_BOT_10: in  std_logic; B_D0_1_BOT_11: in  std_logic; 
            B_D0_1_BOT_12: in  std_logic; B_D0_1_BOT_13: in  std_logic; 
            B_D0_1_BOT_14: in  std_logic; B_D0_1_BOT_15: in  std_logic; 
            B_D0_1_BOT_16: in  std_logic; B_D0_1_BOT_17: in  std_logic; 
            B_BW0_1_BOT_0: in  std_logic; B_BW0_1_BOT_1: in  std_logic; 
            B_CKW_1_BOT_0: in  std_logic; B_CKR_1_BOT_0: in  std_logic; 
            B_CSW_1_BOT_0: in  std_logic; B_CSR_1_BOT_0: in  std_logic; 
            MC1_1_BOT_0: in  std_logic; MC1_1_BOT_1: in  std_logic; 
            MC1_1_BOT_9: in  std_logic; MC1_1_BOT_12: in  std_logic; 
            MC1_1_BOT_13: in  std_logic; MC1_1_BOT_19: in  std_logic; 
            MC1_1_BOT_22: in  std_logic; A_AW0_2_BOT_0: in  std_logic; 
            A_AW0_2_BOT_1: in  std_logic; A_AW0_2_BOT_2: in  std_logic; 
            A_AW0_2_BOT_3: in  std_logic; A_AW0_2_BOT_4: in  std_logic; 
            A_AW0_2_BOT_5: in  std_logic; A_AW0_2_BOT_6: in  std_logic; 
            A_AW0_2_BOT_7: in  std_logic; A_AW0_2_BOT_8: in  std_logic; 
            A_AW0_2_BOT_9: in  std_logic; A_AR0_2_BOT_0: in  std_logic; 
            A_AR0_2_BOT_1: in  std_logic; A_AR0_2_BOT_2: in  std_logic; 
            A_AR0_2_BOT_3: in  std_logic; A_AR0_2_BOT_4: in  std_logic; 
            A_AR0_2_BOT_5: in  std_logic; A_AR0_2_BOT_6: in  std_logic; 
            A_AR0_2_BOT_7: in  std_logic; A_AR0_2_BOT_8: in  std_logic; 
            A_AR0_2_BOT_9: in  std_logic; A_D0_2_BOT_0: in  std_logic; 
            A_D0_2_BOT_1: in  std_logic; A_D0_2_BOT_2: in  std_logic; 
            A_D0_2_BOT_3: in  std_logic; A_D0_2_BOT_4: in  std_logic; 
            A_D0_2_BOT_5: in  std_logic; A_D0_2_BOT_6: in  std_logic; 
            A_D0_2_BOT_7: in  std_logic; A_D0_2_BOT_8: in  std_logic; 
            A_D0_2_BOT_9: in  std_logic; A_D0_2_BOT_10: in  std_logic; 
            A_D0_2_BOT_11: in  std_logic; A_D0_2_BOT_12: in  std_logic; 
            A_D0_2_BOT_13: in  std_logic; A_D0_2_BOT_14: in  std_logic; 
            A_D0_2_BOT_15: in  std_logic; A_D0_2_BOT_16: in  std_logic; 
            A_D0_2_BOT_17: in  std_logic; A_BW0_2_BOT_0: in  std_logic; 
            A_BW0_2_BOT_1: in  std_logic; A_CKW_2_BOT_0: in  std_logic; 
            A_CKR_2_BOT_0: in  std_logic; A_CSW_2_BOT_0: in  std_logic; 
            A_CSR_2_BOT_0: in  std_logic; B_AW0_2_BOT_0: in  std_logic; 
            B_AW0_2_BOT_1: in  std_logic; B_AW0_2_BOT_2: in  std_logic; 
            B_AW0_2_BOT_3: in  std_logic; B_AW0_2_BOT_4: in  std_logic; 
            B_AW0_2_BOT_5: in  std_logic; B_AW0_2_BOT_6: in  std_logic; 
            B_AW0_2_BOT_7: in  std_logic; B_AW0_2_BOT_8: in  std_logic; 
            B_AW0_2_BOT_9: in  std_logic; B_AR0_2_BOT_0: in  std_logic; 
            B_AR0_2_BOT_1: in  std_logic; B_AR0_2_BOT_2: in  std_logic; 
            B_AR0_2_BOT_3: in  std_logic; B_AR0_2_BOT_4: in  std_logic; 
            B_AR0_2_BOT_5: in  std_logic; B_AR0_2_BOT_6: in  std_logic; 
            B_AR0_2_BOT_7: in  std_logic; B_AR0_2_BOT_8: in  std_logic; 
            B_AR0_2_BOT_9: in  std_logic; B_D0_2_BOT_0: in  std_logic; 
            B_D0_2_BOT_1: in  std_logic; B_D0_2_BOT_2: in  std_logic; 
            B_D0_2_BOT_3: in  std_logic; B_D0_2_BOT_4: in  std_logic; 
            B_D0_2_BOT_5: in  std_logic; B_D0_2_BOT_6: in  std_logic; 
            B_D0_2_BOT_7: in  std_logic; B_D0_2_BOT_8: in  std_logic; 
            B_D0_2_BOT_9: in  std_logic; B_D0_2_BOT_10: in  std_logic; 
            B_D0_2_BOT_11: in  std_logic; B_D0_2_BOT_12: in  std_logic; 
            B_D0_2_BOT_13: in  std_logic; B_D0_2_BOT_14: in  std_logic; 
            B_D0_2_BOT_15: in  std_logic; B_D0_2_BOT_16: in  std_logic; 
            B_D0_2_BOT_17: in  std_logic; B_BW0_2_BOT_0: in  std_logic; 
            B_BW0_2_BOT_1: in  std_logic; B_CKW_2_BOT_0: in  std_logic; 
            B_CKR_2_BOT_0: in  std_logic; B_CSW_2_BOT_0: in  std_logic; 
            B_CSR_2_BOT_0: in  std_logic; MC1_2_BOT_0: in  std_logic; 
            MC1_2_BOT_1: in  std_logic; MC1_2_BOT_9: in  std_logic; 
            MC1_2_BOT_12: in  std_logic; MC1_2_BOT_13: in  std_logic; 
            MC1_2_BOT_19: in  std_logic; MC1_2_BOT_22: in  std_logic; 
            A_AW0_3_BOT_0: in  std_logic; A_AW0_3_BOT_1: in  std_logic; 
            A_AW0_3_BOT_2: in  std_logic; A_AW0_3_BOT_3: in  std_logic; 
            A_AW0_3_BOT_4: in  std_logic; A_AW0_3_BOT_5: in  std_logic; 
            A_AW0_3_BOT_6: in  std_logic; A_AW0_3_BOT_7: in  std_logic; 
            A_AW0_3_BOT_8: in  std_logic; A_AW0_3_BOT_9: in  std_logic; 
            A_AR0_3_BOT_0: in  std_logic; A_AR0_3_BOT_1: in  std_logic; 
            A_AR0_3_BOT_2: in  std_logic; A_AR0_3_BOT_3: in  std_logic; 
            A_AR0_3_BOT_4: in  std_logic; A_AR0_3_BOT_5: in  std_logic; 
            A_AR0_3_BOT_6: in  std_logic; A_AR0_3_BOT_7: in  std_logic; 
            A_AR0_3_BOT_8: in  std_logic; A_AR0_3_BOT_9: in  std_logic; 
            A_D0_3_BOT_0: in  std_logic; A_D0_3_BOT_1: in  std_logic; 
            A_D0_3_BOT_2: in  std_logic; A_D0_3_BOT_3: in  std_logic; 
            A_D0_3_BOT_4: in  std_logic; A_D0_3_BOT_5: in  std_logic; 
            A_D0_3_BOT_6: in  std_logic; A_D0_3_BOT_7: in  std_logic; 
            A_D0_3_BOT_8: in  std_logic; A_D0_3_BOT_9: in  std_logic; 
            A_D0_3_BOT_10: in  std_logic; A_D0_3_BOT_11: in  std_logic; 
            A_D0_3_BOT_12: in  std_logic; A_D0_3_BOT_13: in  std_logic; 
            A_D0_3_BOT_14: in  std_logic; A_D0_3_BOT_15: in  std_logic; 
            A_D0_3_BOT_16: in  std_logic; A_D0_3_BOT_17: in  std_logic; 
            A_BW0_3_BOT_0: in  std_logic; A_BW0_3_BOT_1: in  std_logic; 
            A_CKW_3_BOT_0: in  std_logic; A_CKR_3_BOT_0: in  std_logic; 
            A_CSW_3_BOT_0: in  std_logic; A_CSR_3_BOT_0: in  std_logic; 
            B_AW0_3_BOT_0: in  std_logic; B_AW0_3_BOT_1: in  std_logic; 
            B_AW0_3_BOT_2: in  std_logic; B_AW0_3_BOT_3: in  std_logic; 
            B_AW0_3_BOT_4: in  std_logic; B_AW0_3_BOT_5: in  std_logic; 
            B_AW0_3_BOT_6: in  std_logic; B_AW0_3_BOT_7: in  std_logic; 
            B_AW0_3_BOT_8: in  std_logic; B_AW0_3_BOT_9: in  std_logic; 
            B_AR0_3_BOT_0: in  std_logic; B_AR0_3_BOT_1: in  std_logic; 
            B_AR0_3_BOT_2: in  std_logic; B_AR0_3_BOT_3: in  std_logic; 
            B_AR0_3_BOT_4: in  std_logic; B_AR0_3_BOT_5: in  std_logic; 
            B_AR0_3_BOT_6: in  std_logic; B_AR0_3_BOT_7: in  std_logic; 
            B_AR0_3_BOT_8: in  std_logic; B_AR0_3_BOT_9: in  std_logic; 
            B_D0_3_BOT_0: in  std_logic; B_D0_3_BOT_1: in  std_logic; 
            B_D0_3_BOT_2: in  std_logic; B_D0_3_BOT_3: in  std_logic; 
            B_D0_3_BOT_4: in  std_logic; B_D0_3_BOT_5: in  std_logic; 
            B_D0_3_BOT_6: in  std_logic; B_D0_3_BOT_7: in  std_logic; 
            B_D0_3_BOT_8: in  std_logic; B_D0_3_BOT_9: in  std_logic; 
            B_D0_3_BOT_10: in  std_logic; B_D0_3_BOT_11: in  std_logic; 
            B_D0_3_BOT_12: in  std_logic; B_D0_3_BOT_13: in  std_logic; 
            B_D0_3_BOT_14: in  std_logic; B_D0_3_BOT_15: in  std_logic; 
            B_D0_3_BOT_16: in  std_logic; B_D0_3_BOT_17: in  std_logic; 
            B_BW0_3_BOT_0: in  std_logic; B_BW0_3_BOT_1: in  std_logic; 
            B_CKW_3_BOT_0: in  std_logic; B_CKR_3_BOT_0: in  std_logic; 
            B_CSW_3_BOT_0: in  std_logic; B_CSR_3_BOT_0: in  std_logic; 
            MC1_3_BOT_0: in  std_logic; MC1_3_BOT_1: in  std_logic; 
            MC1_3_BOT_9: in  std_logic; MC1_3_BOT_12: in  std_logic; 
            MC1_3_BOT_13: in  std_logic; MC1_3_BOT_19: in  std_logic; 
            MC1_3_BOT_22: in  std_logic; HADDR_ASBI_0: in  std_logic; 
            HADDR_ASBI_1: in  std_logic; HADDR_ASBI_2: in  std_logic; 
            HADDR_ASBI_3: in  std_logic; HADDR_ASBI_4: in  std_logic; 
            HADDR_ASBI_5: in  std_logic; HADDR_ASBI_6: in  std_logic; 
            HADDR_ASBI_7: in  std_logic; HADDR_ASBI_8: in  std_logic; 
            HADDR_ASBI_9: in  std_logic; HADDR_ASBI_10: in  std_logic; 
            HADDR_ASBI_11: in  std_logic; HADDR_ASBI_12: in  std_logic; 
            HADDR_ASBI_13: in  std_logic; HADDR_ASBI_14: in  std_logic; 
            HADDR_ASBI_15: in  std_logic; HADDR_ASBI_16: in  std_logic; 
            HADDR_ASBI_17: in  std_logic; HTRANS_ASBI_0: in  std_logic; 
            HTRANS_ASBI_1: in  std_logic; HWRITE_ASBI: in  std_logic; 
            HSIZE_ASBI_0: in  std_logic; HSIZE_ASBI_1: in  std_logic; 
            HBURST_ASBI: in  std_logic; HWDATA_ASBI_0: in  std_logic; 
            HWDATA_ASBI_1: in  std_logic; HWDATA_ASBI_2: in  std_logic; 
            HWDATA_ASBI_3: in  std_logic; HWDATA_ASBI_4: in  std_logic; 
            HWDATA_ASBI_5: in  std_logic; HWDATA_ASBI_6: in  std_logic; 
            HWDATA_ASBI_7: in  std_logic; HWDATA_ASBI_8: in  std_logic; 
            HWDATA_ASBI_9: in  std_logic; HWDATA_ASBI_10: in  std_logic; 
            HWDATA_ASBI_11: in  std_logic; HWDATA_ASBI_12: in  std_logic; 
            HWDATA_ASBI_13: in  std_logic; HWDATA_ASBI_14: in  std_logic; 
            HWDATA_ASBI_15: in  std_logic; HWDATA_ASBI_16: in  std_logic; 
            HWDATA_ASBI_17: in  std_logic; HWDATA_ASBI_18: in  std_logic; 
            HWDATA_ASBI_19: in  std_logic; HWDATA_ASBI_20: in  std_logic; 
            HWDATA_ASBI_21: in  std_logic; HWDATA_ASBI_22: in  std_logic; 
            HWDATA_ASBI_23: in  std_logic; HWDATA_ASBI_24: in  std_logic; 
            HWDATA_ASBI_25: in  std_logic; HWDATA_ASBI_26: in  std_logic; 
            HWDATA_ASBI_27: in  std_logic; HWDATA_ASBI_28: in  std_logic; 
            HWDATA_ASBI_29: in  std_logic; HWDATA_ASBI_30: in  std_logic; 
            HWDATA_ASBI_31: in  std_logic; HWDATA_ASBI_32: in  std_logic; 
            HWDATA_ASBI_33: in  std_logic; HWDATA_ASBI_34: in  std_logic; 
            HWDATA_ASBI_35: in  std_logic; HBUSREQ_ASBI: in  std_logic; 
            HLOCK_ASBI: in  std_logic; HRDATA_ASBI_0: in  std_logic; 
            HRDATA_ASBI_1: in  std_logic; HRDATA_ASBI_2: in  std_logic; 
            HRDATA_ASBI_3: in  std_logic; HRDATA_ASBI_4: in  std_logic; 
            HRDATA_ASBI_5: in  std_logic; HRDATA_ASBI_6: in  std_logic; 
            HRDATA_ASBI_7: in  std_logic; HRDATA_ASBI_8: in  std_logic; 
            HRDATA_ASBI_9: in  std_logic; HRDATA_ASBI_10: in  std_logic; 
            HRDATA_ASBI_11: in  std_logic; HRDATA_ASBI_12: in  std_logic; 
            HRDATA_ASBI_13: in  std_logic; HRDATA_ASBI_14: in  std_logic; 
            HRDATA_ASBI_15: in  std_logic; HRDATA_ASBI_16: in  std_logic; 
            HRDATA_ASBI_17: in  std_logic; HRDATA_ASBI_18: in  std_logic; 
            HRDATA_ASBI_19: in  std_logic; HRDATA_ASBI_20: in  std_logic; 
            HRDATA_ASBI_21: in  std_logic; HRDATA_ASBI_22: in  std_logic; 
            HRDATA_ASBI_23: in  std_logic; HRDATA_ASBI_24: in  std_logic; 
            HRDATA_ASBI_25: in  std_logic; HRDATA_ASBI_26: in  std_logic; 
            HRDATA_ASBI_27: in  std_logic; HRDATA_ASBI_28: in  std_logic; 
            HRDATA_ASBI_29: in  std_logic; HRDATA_ASBI_30: in  std_logic; 
            HRDATA_ASBI_31: in  std_logic; HRDATA_ASBI_32: in  std_logic; 
            HRDATA_ASBI_33: in  std_logic; HRDATA_ASBI_34: in  std_logic; 
            HRDATA_ASBI_35: in  std_logic; 
            HREADY_OUT_ASBI: in  std_logic; HRESP_ASBI_0: in  std_logic; 
            HRESP_ASBI_1: in  std_logic; HCLK_FRA: in  std_logic; 
            GSR_FRA: in  std_logic; ASB_EN_SLI: in  std_logic; 
            ASB_IRQ_MRI: in  std_logic; ASB_IRQ_SLI: in  std_logic; 
            MPC_TA: out  std_logic; MPC_RETRY: out  std_logic; 
            MPC_TEA: out  std_logic; MPC_RD_DATA_31: out  std_logic; 
            MPC_RD_DATA_30: out  std_logic; 
            MPC_RD_DATA_29: out  std_logic; 
            MPC_RD_DATA_28: out  std_logic; 
            MPC_RD_DATA_27: out  std_logic; 
            MPC_RD_DATA_26: out  std_logic; 
            MPC_RD_DATA_25: out  std_logic; 
            MPC_RD_DATA_24: out  std_logic; 
            MPC_RD_DATA_23: out  std_logic; 
            MPC_RD_DATA_22: out  std_logic; 
            MPC_RD_DATA_21: out  std_logic; 
            MPC_RD_DATA_20: out  std_logic; 
            MPC_RD_DATA_19: out  std_logic; 
            MPC_RD_DATA_18: out  std_logic; 
            MPC_RD_DATA_17: out  std_logic; 
            MPC_RD_DATA_16: out  std_logic; 
            MPC_RD_DATA_15: out  std_logic; 
            MPC_RD_DATA_14: out  std_logic; 
            MPC_RD_DATA_13: out  std_logic; 
            MPC_RD_DATA_12: out  std_logic; 
            MPC_RD_DATA_11: out  std_logic; 
            MPC_RD_DATA_10: out  std_logic; 
            MPC_RD_DATA_9: out  std_logic; MPC_RD_DATA_8: out  std_logic; 
            MPC_RD_DATA_7: out  std_logic; MPC_RD_DATA_6: out  std_logic; 
            MPC_RD_DATA_5: out  std_logic; MPC_RD_DATA_4: out  std_logic; 
            MPC_RD_DATA_3: out  std_logic; MPC_RD_DATA_2: out  std_logic; 
            MPC_RD_DATA_1: out  std_logic; MPC_RD_DATA_0: out  std_logic; 
            PD2_0_TS: out  std_logic; PD7_3_TS: out  std_logic; 
            PD15_8_TS: out  std_logic; PD31_16_TS: out  std_logic; 
            MPC_RD_PARITY_3: out  std_logic; 
            MPC_RD_PARITY_2: out  std_logic; 
            MPC_RD_PARITY_1: out  std_logic; 
            MPC_RD_PARITY_0: out  std_logic; MPC_DP_TS_0: out  std_logic; 
            MPC_DP_TS_1: out  std_logic; MPC_DP_TS_2: out  std_logic; 
            MPC_IRQ: out  std_logic; MPC_CNTL_TS: out  std_logic; 
            USR_IRQ: out  std_logic; FMRDATA_0: out  std_logic; 
            FMRDATA_1: out  std_logic; FMRDATA_2: out  std_logic; 
            FMRDATA_3: out  std_logic; FMRDATA_4: out  std_logic; 
            FMRDATA_5: out  std_logic; FMRDATA_6: out  std_logic; 
            FMRDATA_7: out  std_logic; FMRDATA_8: out  std_logic; 
            FMRDATA_9: out  std_logic; FMRDATA_10: out  std_logic; 
            FMRDATA_11: out  std_logic; FMRDATA_12: out  std_logic; 
            FMRDATA_13: out  std_logic; FMRDATA_14: out  std_logic; 
            FMRDATA_15: out  std_logic; FMRDATA_16: out  std_logic; 
            FMRDATA_17: out  std_logic; FMRDATA_18: out  std_logic; 
            FMRDATA_19: out  std_logic; FMRDATA_20: out  std_logic; 
            FMRDATA_21: out  std_logic; FMRDATA_22: out  std_logic; 
            FMRDATA_23: out  std_logic; FMRDATA_24: out  std_logic; 
            FMRDATA_25: out  std_logic; FMRDATA_26: out  std_logic; 
            FMRDATA_27: out  std_logic; FMRDATA_28: out  std_logic; 
            FMRDATA_29: out  std_logic; FMRDATA_30: out  std_logic; 
            FMRDATA_31: out  std_logic; FMRDATA_32: out  std_logic; 
            FMRDATA_33: out  std_logic; FMRDATA_34: out  std_logic; 
            FMRDATA_35: out  std_logic; FMGRNTED: out  std_logic; 
            FMACK: out  std_logic; FMRETRY: out  std_logic; 
            FMERR: out  std_logic; FSWDATA_0: out  std_logic; 
            FSWDATA_1: out  std_logic; FSWDATA_2: out  std_logic; 
            FSWDATA_3: out  std_logic; FSWDATA_4: out  std_logic; 
            FSWDATA_5: out  std_logic; FSWDATA_6: out  std_logic; 
            FSWDATA_7: out  std_logic; FSWDATA_8: out  std_logic; 
            FSWDATA_9: out  std_logic; FSWDATA_10: out  std_logic; 
            FSWDATA_11: out  std_logic; FSWDATA_12: out  std_logic; 
            FSWDATA_13: out  std_logic; FSWDATA_14: out  std_logic; 
            FSWDATA_15: out  std_logic; FSWDATA_16: out  std_logic; 
            FSWDATA_17: out  std_logic; FSWDATA_18: out  std_logic; 
            FSWDATA_19: out  std_logic; FSWDATA_20: out  std_logic; 
            FSWDATA_21: out  std_logic; FSWDATA_22: out  std_logic; 
            FSWDATA_23: out  std_logic; FSWDATA_24: out  std_logic; 
            FSWDATA_25: out  std_logic; FSWDATA_26: out  std_logic; 
            FSWDATA_27: out  std_logic; FSWDATA_28: out  std_logic; 
            FSWDATA_29: out  std_logic; FSWDATA_30: out  std_logic; 
            FSWDATA_31: out  std_logic; FSWDATA_32: out  std_logic; 
            FSWDATA_33: out  std_logic; FSWDATA_34: out  std_logic; 
            FSWDATA_35: out  std_logic; FSADDR_0: out  std_logic; 
            FSADDR_1: out  std_logic; FSADDR_2: out  std_logic; 
            FSADDR_3: out  std_logic; FSADDR_4: out  std_logic; 
            FSADDR_5: out  std_logic; FSADDR_6: out  std_logic; 
            FSADDR_7: out  std_logic; FSADDR_8: out  std_logic; 
            FSADDR_9: out  std_logic; FSADDR_10: out  std_logic; 
            FSADDR_11: out  std_logic; FSADDR_12: out  std_logic; 
            FSADDR_13: out  std_logic; FSADDR_14: out  std_logic; 
            FSADDR_15: out  std_logic; FSADDR_16: out  std_logic; 
            FSADDR_17: out  std_logic; FSBURST: out  std_logic; 
            FSRDY: out  std_logic; FSWR: out  std_logic; 
            FSSIZE_0: out  std_logic; FSSIZE_1: out  std_logic; 
            A_Q0_0_TOP_0: out  std_logic; A_Q0_0_TOP_1: out  std_logic; 
            A_Q0_0_TOP_2: out  std_logic; A_Q0_0_TOP_3: out  std_logic; 
            A_Q0_0_TOP_4: out  std_logic; A_Q0_0_TOP_5: out  std_logic; 
            A_Q0_0_TOP_6: out  std_logic; A_Q0_0_TOP_7: out  std_logic; 
            A_Q0_0_TOP_8: out  std_logic; A_Q0_0_TOP_9: out  std_logic; 
            A_Q0_0_TOP_10: out  std_logic; A_Q0_0_TOP_11: out  std_logic; 
            A_Q0_0_TOP_12: out  std_logic; A_Q0_0_TOP_13: out  std_logic; 
            A_Q0_0_TOP_14: out  std_logic; A_Q0_0_TOP_15: out  std_logic; 
            A_Q0_0_TOP_16: out  std_logic; A_Q0_0_TOP_17: out  std_logic; 
            B_Q0_0_TOP_0: out  std_logic; B_Q0_0_TOP_1: out  std_logic; 
            B_Q0_0_TOP_2: out  std_logic; B_Q0_0_TOP_3: out  std_logic; 
            B_Q0_0_TOP_4: out  std_logic; B_Q0_0_TOP_5: out  std_logic; 
            B_Q0_0_TOP_6: out  std_logic; B_Q0_0_TOP_7: out  std_logic; 
            B_Q0_0_TOP_8: out  std_logic; B_Q0_0_TOP_9: out  std_logic; 
            B_Q0_0_TOP_10: out  std_logic; B_Q0_0_TOP_11: out  std_logic; 
            B_Q0_0_TOP_12: out  std_logic; B_Q0_0_TOP_13: out  std_logic; 
            B_Q0_0_TOP_14: out  std_logic; B_Q0_0_TOP_15: out  std_logic; 
            B_Q0_0_TOP_16: out  std_logic; B_Q0_0_TOP_17: out  std_logic; 
            A_BUSY0_0_TOP: out  std_logic; B_BUSY0_0_TOP: out  std_logic; 
            A_Q0_1_TOP_0: out  std_logic; A_Q0_1_TOP_1: out  std_logic; 
            A_Q0_1_TOP_2: out  std_logic; A_Q0_1_TOP_3: out  std_logic; 
            A_Q0_1_TOP_4: out  std_logic; A_Q0_1_TOP_5: out  std_logic; 
            A_Q0_1_TOP_6: out  std_logic; A_Q0_1_TOP_7: out  std_logic; 
            A_Q0_1_TOP_8: out  std_logic; A_Q0_1_TOP_9: out  std_logic; 
            A_Q0_1_TOP_10: out  std_logic; A_Q0_1_TOP_11: out  std_logic; 
            A_Q0_1_TOP_12: out  std_logic; A_Q0_1_TOP_13: out  std_logic; 
            A_Q0_1_TOP_14: out  std_logic; A_Q0_1_TOP_15: out  std_logic; 
            A_Q0_1_TOP_16: out  std_logic; A_Q0_1_TOP_17: out  std_logic; 
            B_Q0_1_TOP_0: out  std_logic; B_Q0_1_TOP_1: out  std_logic; 
            B_Q0_1_TOP_2: out  std_logic; B_Q0_1_TOP_3: out  std_logic; 
            B_Q0_1_TOP_4: out  std_logic; B_Q0_1_TOP_5: out  std_logic; 
            B_Q0_1_TOP_6: out  std_logic; B_Q0_1_TOP_7: out  std_logic; 
            B_Q0_1_TOP_8: out  std_logic; B_Q0_1_TOP_9: out  std_logic; 
            B_Q0_1_TOP_10: out  std_logic; B_Q0_1_TOP_11: out  std_logic; 
            B_Q0_1_TOP_12: out  std_logic; B_Q0_1_TOP_13: out  std_logic; 
            B_Q0_1_TOP_14: out  std_logic; B_Q0_1_TOP_15: out  std_logic; 
            B_Q0_1_TOP_16: out  std_logic; B_Q0_1_TOP_17: out  std_logic; 
            A_BUSY0_1_TOP: out  std_logic; B_BUSY0_1_TOP: out  std_logic; 
            A_Q0_2_TOP_0: out  std_logic; A_Q0_2_TOP_1: out  std_logic; 
            A_Q0_2_TOP_2: out  std_logic; A_Q0_2_TOP_3: out  std_logic; 
            A_Q0_2_TOP_4: out  std_logic; A_Q0_2_TOP_5: out  std_logic; 
            A_Q0_2_TOP_6: out  std_logic; A_Q0_2_TOP_7: out  std_logic; 
            A_Q0_2_TOP_8: out  std_logic; A_Q0_2_TOP_9: out  std_logic; 
            A_Q0_2_TOP_10: out  std_logic; A_Q0_2_TOP_11: out  std_logic; 
            A_Q0_2_TOP_12: out  std_logic; A_Q0_2_TOP_13: out  std_logic; 
            A_Q0_2_TOP_14: out  std_logic; A_Q0_2_TOP_15: out  std_logic; 
            A_Q0_2_TOP_16: out  std_logic; A_Q0_2_TOP_17: out  std_logic; 
            B_Q0_2_TOP_0: out  std_logic; B_Q0_2_TOP_1: out  std_logic; 
            B_Q0_2_TOP_2: out  std_logic; B_Q0_2_TOP_3: out  std_logic; 
            B_Q0_2_TOP_4: out  std_logic; B_Q0_2_TOP_5: out  std_logic; 
            B_Q0_2_TOP_6: out  std_logic; B_Q0_2_TOP_7: out  std_logic; 
            B_Q0_2_TOP_8: out  std_logic; B_Q0_2_TOP_9: out  std_logic; 
            B_Q0_2_TOP_10: out  std_logic; B_Q0_2_TOP_11: out  std_logic; 
            B_Q0_2_TOP_12: out  std_logic; B_Q0_2_TOP_13: out  std_logic; 
            B_Q0_2_TOP_14: out  std_logic; B_Q0_2_TOP_15: out  std_logic; 
            B_Q0_2_TOP_16: out  std_logic; B_Q0_2_TOP_17: out  std_logic; 
            A_BUSY0_2_TOP: out  std_logic; B_BUSY0_2_TOP: out  std_logic; 
            A_Q0_3_TOP_0: out  std_logic; A_Q0_3_TOP_1: out  std_logic; 
            A_Q0_3_TOP_2: out  std_logic; A_Q0_3_TOP_3: out  std_logic; 
            A_Q0_3_TOP_4: out  std_logic; A_Q0_3_TOP_5: out  std_logic; 
            A_Q0_3_TOP_6: out  std_logic; A_Q0_3_TOP_7: out  std_logic; 
            A_Q0_3_TOP_8: out  std_logic; A_Q0_3_TOP_9: out  std_logic; 
            A_Q0_3_TOP_10: out  std_logic; A_Q0_3_TOP_11: out  std_logic; 
            A_Q0_3_TOP_12: out  std_logic; A_Q0_3_TOP_13: out  std_logic; 
            A_Q0_3_TOP_14: out  std_logic; A_Q0_3_TOP_15: out  std_logic; 
            A_Q0_3_TOP_16: out  std_logic; A_Q0_3_TOP_17: out  std_logic; 
            B_Q0_3_TOP_0: out  std_logic; B_Q0_3_TOP_1: out  std_logic; 
            B_Q0_3_TOP_2: out  std_logic; B_Q0_3_TOP_3: out  std_logic; 
            B_Q0_3_TOP_4: out  std_logic; B_Q0_3_TOP_5: out  std_logic; 
            B_Q0_3_TOP_6: out  std_logic; B_Q0_3_TOP_7: out  std_logic; 
            B_Q0_3_TOP_8: out  std_logic; B_Q0_3_TOP_9: out  std_logic; 
            B_Q0_3_TOP_10: out  std_logic; B_Q0_3_TOP_11: out  std_logic; 
            B_Q0_3_TOP_12: out  std_logic; B_Q0_3_TOP_13: out  std_logic; 
            B_Q0_3_TOP_14: out  std_logic; B_Q0_3_TOP_15: out  std_logic; 
            B_Q0_3_TOP_16: out  std_logic; B_Q0_3_TOP_17: out  std_logic; 
            A_BUSY0_3_TOP: out  std_logic; B_BUSY0_3_TOP: out  std_logic; 
            A_Q0_0_BOT_0: out  std_logic; A_Q0_0_BOT_1: out  std_logic; 
            A_Q0_0_BOT_2: out  std_logic; A_Q0_0_BOT_3: out  std_logic; 
            A_Q0_0_BOT_4: out  std_logic; A_Q0_0_BOT_5: out  std_logic; 
            A_Q0_0_BOT_6: out  std_logic; A_Q0_0_BOT_7: out  std_logic; 
            A_Q0_0_BOT_8: out  std_logic; A_Q0_0_BOT_9: out  std_logic; 
            A_Q0_0_BOT_10: out  std_logic; A_Q0_0_BOT_11: out  std_logic; 
            A_Q0_0_BOT_12: out  std_logic; A_Q0_0_BOT_13: out  std_logic; 
            A_Q0_0_BOT_14: out  std_logic; A_Q0_0_BOT_15: out  std_logic; 
            A_Q0_0_BOT_16: out  std_logic; A_Q0_0_BOT_17: out  std_logic; 
            B_Q0_0_BOT_0: out  std_logic; B_Q0_0_BOT_1: out  std_logic; 
            B_Q0_0_BOT_2: out  std_logic; B_Q0_0_BOT_3: out  std_logic; 
            B_Q0_0_BOT_4: out  std_logic; B_Q0_0_BOT_5: out  std_logic; 
            B_Q0_0_BOT_6: out  std_logic; B_Q0_0_BOT_7: out  std_logic; 
            B_Q0_0_BOT_8: out  std_logic; B_Q0_0_BOT_9: out  std_logic; 
            B_Q0_0_BOT_10: out  std_logic; B_Q0_0_BOT_11: out  std_logic; 
            B_Q0_0_BOT_12: out  std_logic; B_Q0_0_BOT_13: out  std_logic; 
            B_Q0_0_BOT_14: out  std_logic; B_Q0_0_BOT_15: out  std_logic; 
            B_Q0_0_BOT_16: out  std_logic; B_Q0_0_BOT_17: out  std_logic; 
            A_BUSY0_0_BOT: out  std_logic; B_BUSY0_0_BOT: out  std_logic; 
            A_Q0_1_BOT_0: out  std_logic; A_Q0_1_BOT_1: out  std_logic; 
            A_Q0_1_BOT_2: out  std_logic; A_Q0_1_BOT_3: out  std_logic; 
            A_Q0_1_BOT_4: out  std_logic; A_Q0_1_BOT_5: out  std_logic; 
            A_Q0_1_BOT_6: out  std_logic; A_Q0_1_BOT_7: out  std_logic; 
            A_Q0_1_BOT_8: out  std_logic; A_Q0_1_BOT_9: out  std_logic; 
            A_Q0_1_BOT_10: out  std_logic; A_Q0_1_BOT_11: out  std_logic; 
            A_Q0_1_BOT_12: out  std_logic; A_Q0_1_BOT_13: out  std_logic; 
            A_Q0_1_BOT_14: out  std_logic; A_Q0_1_BOT_15: out  std_logic; 
            A_Q0_1_BOT_16: out  std_logic; A_Q0_1_BOT_17: out  std_logic; 
            B_Q0_1_BOT_0: out  std_logic; B_Q0_1_BOT_1: out  std_logic; 
            B_Q0_1_BOT_2: out  std_logic; B_Q0_1_BOT_3: out  std_logic; 
            B_Q0_1_BOT_4: out  std_logic; B_Q0_1_BOT_5: out  std_logic; 
            B_Q0_1_BOT_6: out  std_logic; B_Q0_1_BOT_7: out  std_logic; 
            B_Q0_1_BOT_8: out  std_logic; B_Q0_1_BOT_9: out  std_logic; 
            B_Q0_1_BOT_10: out  std_logic; B_Q0_1_BOT_11: out  std_logic; 
            B_Q0_1_BOT_12: out  std_logic; B_Q0_1_BOT_13: out  std_logic; 
            B_Q0_1_BOT_14: out  std_logic; B_Q0_1_BOT_15: out  std_logic; 
            B_Q0_1_BOT_16: out  std_logic; B_Q0_1_BOT_17: out  std_logic; 
            A_BUSY0_1_BOT: out  std_logic; B_BUSY0_1_BOT: out  std_logic; 
            A_Q0_2_BOT_0: out  std_logic; A_Q0_2_BOT_1: out  std_logic; 
            A_Q0_2_BOT_2: out  std_logic; A_Q0_2_BOT_3: out  std_logic; 
            A_Q0_2_BOT_4: out  std_logic; A_Q0_2_BOT_5: out  std_logic; 
            A_Q0_2_BOT_6: out  std_logic; A_Q0_2_BOT_7: out  std_logic; 
            A_Q0_2_BOT_8: out  std_logic; A_Q0_2_BOT_9: out  std_logic; 
            A_Q0_2_BOT_10: out  std_logic; A_Q0_2_BOT_11: out  std_logic; 
            A_Q0_2_BOT_12: out  std_logic; A_Q0_2_BOT_13: out  std_logic; 
            A_Q0_2_BOT_14: out  std_logic; A_Q0_2_BOT_15: out  std_logic; 
            A_Q0_2_BOT_16: out  std_logic; A_Q0_2_BOT_17: out  std_logic; 
            B_Q0_2_BOT_0: out  std_logic; B_Q0_2_BOT_1: out  std_logic; 
            B_Q0_2_BOT_2: out  std_logic; B_Q0_2_BOT_3: out  std_logic; 
            B_Q0_2_BOT_4: out  std_logic; B_Q0_2_BOT_5: out  std_logic; 
            B_Q0_2_BOT_6: out  std_logic; B_Q0_2_BOT_7: out  std_logic; 
            B_Q0_2_BOT_8: out  std_logic; B_Q0_2_BOT_9: out  std_logic; 
            B_Q0_2_BOT_10: out  std_logic; B_Q0_2_BOT_11: out  std_logic; 
            B_Q0_2_BOT_12: out  std_logic; B_Q0_2_BOT_13: out  std_logic; 
            B_Q0_2_BOT_14: out  std_logic; B_Q0_2_BOT_15: out  std_logic; 
            B_Q0_2_BOT_16: out  std_logic; B_Q0_2_BOT_17: out  std_logic; 
            A_BUSY0_2_BOT: out  std_logic; B_BUSY0_2_BOT: out  std_logic; 
            A_Q0_3_BOT_0: out  std_logic; A_Q0_3_BOT_1: out  std_logic; 
            A_Q0_3_BOT_2: out  std_logic; A_Q0_3_BOT_3: out  std_logic; 
            A_Q0_3_BOT_4: out  std_logic; A_Q0_3_BOT_5: out  std_logic; 
            A_Q0_3_BOT_6: out  std_logic; A_Q0_3_BOT_7: out  std_logic; 
            A_Q0_3_BOT_8: out  std_logic; A_Q0_3_BOT_9: out  std_logic; 
            A_Q0_3_BOT_10: out  std_logic; A_Q0_3_BOT_11: out  std_logic; 
            A_Q0_3_BOT_12: out  std_logic; A_Q0_3_BOT_13: out  std_logic; 
            A_Q0_3_BOT_14: out  std_logic; A_Q0_3_BOT_15: out  std_logic; 
            A_Q0_3_BOT_16: out  std_logic; A_Q0_3_BOT_17: out  std_logic; 
            B_Q0_3_BOT_0: out  std_logic; B_Q0_3_BOT_1: out  std_logic; 
            B_Q0_3_BOT_2: out  std_logic; B_Q0_3_BOT_3: out  std_logic; 
            B_Q0_3_BOT_4: out  std_logic; B_Q0_3_BOT_5: out  std_logic; 
            B_Q0_3_BOT_6: out  std_logic; B_Q0_3_BOT_7: out  std_logic; 
            B_Q0_3_BOT_8: out  std_logic; B_Q0_3_BOT_9: out  std_logic; 
            B_Q0_3_BOT_10: out  std_logic; B_Q0_3_BOT_11: out  std_logic; 
            B_Q0_3_BOT_12: out  std_logic; B_Q0_3_BOT_13: out  std_logic; 
            B_Q0_3_BOT_14: out  std_logic; B_Q0_3_BOT_15: out  std_logic; 
            B_Q0_3_BOT_16: out  std_logic; B_Q0_3_BOT_17: out  std_logic; 
            A_BUSY0_3_BOT: out  std_logic; B_BUSY0_3_BOT: out  std_logic; 
            HCLK_MR_ASBO: out  std_logic; 
            HRESET_N_MR_ASBO: out  std_logic; 
            HREADY_ASBO: out  std_logic; HRESP_ASBO_0: out  std_logic; 
            HRESP_ASBO_1: out  std_logic; HGRANT_ASBO: out  std_logic; 
            HRDATA_ASBO_0: out  std_logic; HRDATA_ASBO_1: out  std_logic; 
            HRDATA_ASBO_2: out  std_logic; HRDATA_ASBO_3: out  std_logic; 
            HRDATA_ASBO_4: out  std_logic; HRDATA_ASBO_5: out  std_logic; 
            HRDATA_ASBO_6: out  std_logic; HRDATA_ASBO_7: out  std_logic; 
            HRDATA_ASBO_8: out  std_logic; HRDATA_ASBO_9: out  std_logic; 
            HRDATA_ASBO_10: out  std_logic; 
            HRDATA_ASBO_11: out  std_logic; 
            HRDATA_ASBO_12: out  std_logic; 
            HRDATA_ASBO_13: out  std_logic; 
            HRDATA_ASBO_14: out  std_logic; 
            HRDATA_ASBO_15: out  std_logic; 
            HRDATA_ASBO_16: out  std_logic; 
            HRDATA_ASBO_17: out  std_logic; 
            HRDATA_ASBO_18: out  std_logic; 
            HRDATA_ASBO_19: out  std_logic; 
            HRDATA_ASBO_20: out  std_logic; 
            HRDATA_ASBO_21: out  std_logic; 
            HRDATA_ASBO_22: out  std_logic; 
            HRDATA_ASBO_23: out  std_logic; 
            HRDATA_ASBO_24: out  std_logic; 
            HRDATA_ASBO_25: out  std_logic; 
            HRDATA_ASBO_26: out  std_logic; 
            HRDATA_ASBO_27: out  std_logic; 
            HRDATA_ASBO_28: out  std_logic; 
            HRDATA_ASBO_29: out  std_logic; 
            HRDATA_ASBO_30: out  std_logic; 
            HRDATA_ASBO_31: out  std_logic; 
            HRDATA_ASBO_32: out  std_logic; 
            HRDATA_ASBO_33: out  std_logic; 
            HRDATA_ASBO_34: out  std_logic; 
            HRDATA_ASBO_35: out  std_logic; HCLK_SL_ASBO: out  std_logic; 
            HRESET_N_SL_ASBO: out  std_logic; 
            HADDR_ASBO_0: out  std_logic; HADDR_ASBO_1: out  std_logic; 
            HADDR_ASBO_2: out  std_logic; HADDR_ASBO_3: out  std_logic; 
            HADDR_ASBO_4: out  std_logic; HADDR_ASBO_5: out  std_logic; 
            HADDR_ASBO_6: out  std_logic; HADDR_ASBO_7: out  std_logic; 
            HADDR_ASBO_8: out  std_logic; HADDR_ASBO_9: out  std_logic; 
            HADDR_ASBO_10: out  std_logic; HADDR_ASBO_11: out  std_logic; 
            HADDR_ASBO_12: out  std_logic; HADDR_ASBO_13: out  std_logic; 
            HADDR_ASBO_14: out  std_logic; HADDR_ASBO_15: out  std_logic; 
            HADDR_ASBO_16: out  std_logic; HADDR_ASBO_17: out  std_logic; 
            HTRANS_ASBO_0: out  std_logic; HTRANS_ASBO_1: out  std_logic; 
            HWRITE_ASBO: out  std_logic; HSIZE_ASBO_0: out  std_logic; 
            HSIZE_ASBO_1: out  std_logic; HWDATA_ASBO_0: out  std_logic; 
            HWDATA_ASBO_1: out  std_logic; HWDATA_ASBO_2: out  std_logic; 
            HWDATA_ASBO_3: out  std_logic; HWDATA_ASBO_4: out  std_logic; 
            HWDATA_ASBO_5: out  std_logic; HWDATA_ASBO_6: out  std_logic; 
            HWDATA_ASBO_7: out  std_logic; HWDATA_ASBO_8: out  std_logic; 
            HWDATA_ASBO_9: out  std_logic; 
            HWDATA_ASBO_10: out  std_logic; 
            HWDATA_ASBO_11: out  std_logic; 
            HWDATA_ASBO_12: out  std_logic; 
            HWDATA_ASBO_13: out  std_logic; 
            HWDATA_ASBO_14: out  std_logic; 
            HWDATA_ASBO_15: out  std_logic; 
            HWDATA_ASBO_16: out  std_logic; 
            HWDATA_ASBO_17: out  std_logic; 
            HWDATA_ASBO_18: out  std_logic; 
            HWDATA_ASBO_19: out  std_logic; 
            HWDATA_ASBO_20: out  std_logic; 
            HWDATA_ASBO_21: out  std_logic; 
            HWDATA_ASBO_22: out  std_logic; 
            HWDATA_ASBO_23: out  std_logic; 
            HWDATA_ASBO_24: out  std_logic; 
            HWDATA_ASBO_25: out  std_logic; 
            HWDATA_ASBO_26: out  std_logic; 
            HWDATA_ASBO_27: out  std_logic; 
            HWDATA_ASBO_28: out  std_logic; 
            HWDATA_ASBO_29: out  std_logic; 
            HWDATA_ASBO_30: out  std_logic; 
            HWDATA_ASBO_31: out  std_logic; 
            HWDATA_ASBO_32: out  std_logic; 
            HWDATA_ASBO_33: out  std_logic; 
            HWDATA_ASBO_34: out  std_logic; 
            HWDATA_ASBO_35: out  std_logic; HBURST_ASBO: out  std_logic; 
            HSEL_ASBO: out  std_logic; HREADY_IN_ASBO: out  std_logic; 
            ASB_IRQ_TOA: out  std_logic; PWRUPRES_TOA: out  std_logic; 
            INITN_TOA: out  std_logic; TRIIO_TOA: out  std_logic; 
            DONE_TOA: out  std_logic; GSRN_TOA: out  std_logic);
    end component;
attribute syn_black_box of sysbus: component is true;
COMPONENT plldfb
PORT(
        clkin : IN std_logic ;
        eclk : OUT std_logic ;
        sclk : OUT std_logic ;
        lock : OUT std_logic 
  );
END COMPONENT;
attribute syn_black_box of plldfb : component is true;
COMPONENT plldft
PORT(
        clkin : IN std_logic ;
        eclk : OUT std_logic ;
        sclk : OUT std_logic ;
        lock : OUT std_logic 
  );
END COMPONENT;
attribute syn_black_box of plldft : component is true;
COMPONENT ioddrn
PORT(
        ind0, ind1, ind2, ind3, out1d0, out1d1             : in std_logic;
        out2d0, out2d1, out3d0, out3d1, out4d0, out4d1, ck : in std_logic;
        in1q0, in1q1, in2q0, in2q1, in3q0, in3q1           : out std_logic;
        in4q0, in4q1, outq0, outq1, outq2, outq3           : out std_logic 
 );
END COMPONENT;
attribute syn_black_box of ioddrn : component is true;
COMPONENT hioddrn
PORT(
        ind0, ind1, ind2, ind3, out1d0, out1d1             : in std_logic;
        out2d0, out2d1, out3d0, out3d1, out4d0, out4d1, ck : in std_logic;
        in1q0, in1q1, in2q0, in2q1, in3q0, in3q1           : out std_logic;
        in4q0, in4q1, outq0, outq1, outq2, outq3           : out std_logic
 );
END COMPONENT;
attribute syn_black_box of hioddrn : component is true;


end package orcacomp;
