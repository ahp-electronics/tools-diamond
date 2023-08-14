library ieee;
use ieee.std_logic_1164.all;
library synplify;
use synplify.attributes.all;
package orcacomp is
   attribute syn_black_box of orcacomp : package is true;

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
component OEND2
 port (
   A : in std_logic;
   ECLK : in std_logic;
   Z : out std_logic
 );
end component;
attribute syn_black_box of OEND2 : component is true;
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
component MPIPPC
 port (
   CLK : in std_logic;
   CS0N : in std_logic;
   CS1 : in std_logic;
   RDWRN : in std_logic;
   TSN : in std_logic;
   A27 : in std_logic;
   A28 : in std_logic;
   A29 : in std_logic;
   A30 : in std_logic;
   A31 : in std_logic;
   DIN7 : in std_logic;
   DIN6 : in std_logic;
   DIN5 : in std_logic;
   DIN4 : in std_logic;
   DIN3 : in std_logic;
   DIN2 : in std_logic;
   DIN1 : in std_logic;
   DIN0 : in std_logic;
   UEND : in std_logic;
   UIRQN : in std_logic;
   UDOUT7 : in std_logic;
   UDOUT6 : in std_logic;
   UDOUT5 : in std_logic;
   UDOUT4 : in std_logic;
   UDOUT3 : in std_logic;
   UDOUT2 : in std_logic;
   UDOUT1 : in std_logic;
   UDOUT0 : in std_logic;
   IRQN : out std_logic;
   BIN : out std_logic;
   DDRVCTL : out std_logic;
   TAN : out std_logic;
   TANTS : out std_logic;
   DOUT7 : out std_logic;
   DOUT6 : out std_logic;
   DOUT5 : out std_logic;
   DOUT4 : out std_logic;
   DOUT3 : out std_logic;
   DOUT2 : out std_logic;
   DOUT1 : out std_logic;
   DOUT0 : out std_logic;
   MPGSR : out std_logic;
   URDWRN : out std_logic;
   USTART : out std_logic;
   UA3 : out std_logic;
   UA2 : out std_logic;
   UA1 : out std_logic;
   UA0 : out std_logic;
   UDIN7 : out std_logic;
   UDIN6 : out std_logic;
   UDIN5 : out std_logic;
   UDIN4 : out std_logic;
   UDIN3 : out std_logic;
   UDIN2 : out std_logic;
   UDIN1 : out std_logic;
   UDIN0 : out std_logic
 );
end component;
attribute syn_black_box of MPIPPC : component is true;
component MPI960
 port (
   CLK : in std_logic;
   CS0N : in std_logic;
   CS1 : in std_logic;
   WRRDN : in std_logic;
   ADSN : in std_logic;
   ALE : in std_logic;
   ADIN7 : in std_logic;
   ADIN6 : in std_logic;
   ADIN5 : in std_logic;
   ADIN4 : in std_logic;
   ADIN3 : in std_logic;
   ADIN2 : in std_logic;
   ADIN1 : in std_logic;
   ADIN0 : in std_logic;
   BE1N : in std_logic;
   BE0N : in std_logic;
   RRCVNIN : in std_logic;
   UEND : in std_logic;
   UIRQN : in std_logic;
   UDOUT7 : in std_logic;
   UDOUT6 : in std_logic;
   UDOUT5 : in std_logic;
   UDOUT4 : in std_logic;
   UDOUT3 : in std_logic;
   UDOUT2 : in std_logic;
   UDOUT1 : in std_logic;
   UDOUT0 : in std_logic;
   IRQN : out std_logic;
   DDRVCTL : out std_logic;
   RDYRCVN : out std_logic;
   RDRCVTS : out std_logic;
   DOUT7 : out std_logic;
   DOUT6 : out std_logic;
   DOUT5 : out std_logic;
   DOUT4 : out std_logic;
   DOUT3 : out std_logic;
   DOUT2 : out std_logic;
   DOUT1 : out std_logic;
   DOUT0 : out std_logic;
   MPGSR : out std_logic;
   URDWRN : out std_logic;
   USTART : out std_logic;
   UA3 : out std_logic;
   UA2 : out std_logic;
   UA1 : out std_logic;
   UA0 : out std_logic;
   UDIN7 : out std_logic;
   UDIN6 : out std_logic;
   UDIN5 : out std_logic;
   UDIN4 : out std_logic;
   UDIN3 : out std_logic;
   UDIN2 : out std_logic;
   UDIN1 : out std_logic;
   UDIN0 : out std_logic
 );
end component;
attribute syn_black_box of MPI960 : component is true;
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
component DLL2XT
 port (
   CLKIN : in std_logic;
   ECLK : out std_logic;
   SCLK : out std_logic;
   LOCK : out std_logic
 );
end component;
attribute syn_black_box of DLL2XT : component is true;
component DLL2XB
 port (
   CLKIN : in std_logic;
   ECLK : out std_logic;
   SCLK : out std_logic;
   LOCK : out std_logic
 );
end component;
attribute syn_black_box of DLL2XB : component is true;
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
component CLKCNTLT
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTLT : component is true;
component CLKCNTLT_PUR
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   PUR : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTLT_PUR : component is true;
component CLKCNTLR
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTLR : component is true;
component CLKCNTLR_PUR
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   PUR : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTLR_PUR : component is true;
component CLKCNTLL
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTLL : component is true;
component CLKCNTLL_PUR
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   PUR : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTLL_PUR : component is true;
component CLKCNTLB
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTLB : component is true;
component CLKCNTLB_PUR
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   PUR : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTLB_PUR : component is true;
component CLKCNTHT
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTHT : component is true;
component CLKCNTHT_PUR
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   PUR : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTHT_PUR : component is true;
component CLKCNTHR
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTHR : component is true;
component CLKCNTHR_PUR
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   PUR : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTHR_PUR : component is true;
component CLKCNTHL
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTHL : component is true;
component CLKCNTHL_PUR
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   PUR : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTHL_PUR : component is true;
component CLKCNTHB
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTHB : component is true;
component CLKCNTHB_PUR
 port (
   CLKIN : in std_logic;
   SHUTOFF : in std_logic;
   PUR : in std_logic;
   CLKOUT : out std_logic
 );
end component;
attribute syn_black_box of CLKCNTHB_PUR : component is true;
component CFD1P3JZ
 port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic
 );
end component;
attribute syn_black_box of CFD1P3JZ : component is true;
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
 attribute black_box_pad_pin of BMZ6 : component is "O";
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
component INTRBUF
 port (
  ASBI : in std_logic;
  TOASB : in std_logic;
  TOASBM1 : in std_logic;
  TOASBM2 : in std_logic;
  TOASBM3 : in std_logic;
  FRASB : out std_logic;
  ASBO : out std_logic;
  ASBM1O : out std_logic;
  ASBM2O : out std_logic;
  ASBM3O : out std_logic
 );
end component;
attribute syn_black_box of INTRBUF : component is true;
component INTRBUFS
 port (
  ASBI : in std_logic;
  TOASB : in std_logic;
  TOASBM1 : in std_logic;
  TOASBM2 : in std_logic;
  TOASBM3 : in std_logic;
  FRASB : out std_logic;
  ASBO : out std_logic;
  ASBM1O : out std_logic;
  ASBM2O : out std_logic;
  ASBM3O : out std_logic
 );
end component;
attribute syn_black_box of INTRBUFS : component is true;

component TOASBCK
 port (
  CKTOASB : in std_logic;
  ASBCKO : out std_logic
);
end component;
attribute syn_black_box of TOASBCK : component is true;

component FRASBCK
 port (
  ASBCKI : in std_logic;
  CKFRASB : out std_logic
);
end component;
attribute syn_black_box of FRASBCK : component is true;

component SPR128X1
 generic(INIT : bit_vector := X"00000000000000000000000000000000");
 port (
   DO0 : out std_logic;
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   AD4 : in std_logic;
   AD5 : in std_logic;
   AD6 : in std_logic;
   D : in std_logic;
   CK : in std_logic;
   WPE : in std_logic;
   WRE : in std_logic;
   GSR : in std_logic
 );
end component;
attribute syn_black_box of SPR128X1 : component is true;

component SPR64X1
  generic (INIT : bit_vector := X"0000000000000000");
 port (
   DO0 : out std_logic;
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   AD4 : in std_logic;
   AD5 : in std_logic;
   D : in std_logic;
   CK : in std_logic;
   WPE : in std_logic;
   WRE : in std_logic;
   GSR : in std_logic
 );
end component;
attribute syn_black_box of SPR64X1 : component is true;

component SPR32X1
 generic(INIT : bit_vector := X"00000000");
 port (
   DO0 : out std_logic;
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   AD4 : in std_logic;
   D : in std_logic;
   CK : in std_logic;
   WPE : in std_logic;
   WRE : in std_logic;
   GSR : in std_logic
 );
end component;
attribute syn_black_box of SPR32X1 : component is true;

component SPR16X1S
 generic(INIT : bit_vector := X"0000");
 port (
   O : out std_logic;
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   D : in std_logic;
   WCLK : in std_logic;
   WE : in std_logic
 );
end component;
attribute syn_black_box of SPR16X1S : component is true;

component DPR16X1
  generic (INIT : bit_vector := X"0000");
 port (
   DPO : out std_logic;
   SPO : out std_logic;
   WAD0 : in std_logic;
   WAD1 : in std_logic;
   WAD2 : in std_logic;
   WAD3 : in std_logic;
   D : in std_logic;
   RAD0 : in std_logic;
   RAD1 : in std_logic;
   RAD2 : in std_logic;
   RAD3 : in std_logic;
   WCLK : in std_logic;
   WE : in std_logic
 );
end component;
attribute syn_black_box of DPR16X1 : component is true;

component DPR32X1
 generic(INIT : bit_vector := X"00000000");
 port (
   RDO : out std_logic;
   WDO : out std_logic;
   WAD0 : in std_logic;
   WAD1 : in std_logic;
   WAD2 : in std_logic;
   WAD3 : in std_logic;
   WAD4 : in std_logic;
   D : in std_logic;
   RAD0 : in std_logic;
   RAD1 : in std_logic;
   RAD2 : in std_logic;
   RAD3 : in std_logic;
   RAD4 : in std_logic;
   CK : in std_logic;
   WRE : in std_logic;
   WPE : in std_logic;
   GSR : in std_logic
 );
end component;
attribute syn_black_box of DPR32X1 : component is true;

component DPR64X1
  generic (INIT : bit_vector := X"0000000000000000");
 port (
   RDO : out std_logic;
   WDO : out std_logic;
   WAD0 : in std_logic;
   WAD1 : in std_logic;
   WAD2 : in std_logic;
   WAD3 : in std_logic;
   WAD4 : in std_logic;
   WAD5 : in std_logic;
   D : in std_logic;
   RAD0 : in std_logic;
   RAD1 : in std_logic;
   RAD2 : in std_logic;
   RAD3 : in std_logic;
   RAD4 : in std_logic;
   RAD5 : in std_logic;
   CK : in std_logic;
   WRE : in std_logic;
   WPE : in std_logic;
   GSR : in std_logic
 );
end component;
attribute syn_black_box of DPR64X1 : component is true;

component SHIFT16
  generic (INIT : bit_vector := X"0000");
 port (
   DO  : out std_logic;
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   CE : in std_logic;
   CLK : in std_logic;
   SRI : in std_logic
 );
end component;
attribute syn_black_box of SHIFT16: component is true;

component PIPEBUF
 port (
   O : out std_logic;
   I : in std_logic
 );
end component;
attribute syn_black_box of PIPEBUF : component is true;
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
