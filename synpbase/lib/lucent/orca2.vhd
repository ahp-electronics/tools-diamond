--
-- This file defines the orca components
-- You will need the following statements in your VHDL
-- to access these components:
-- library orca;
-- use orca.orcacomp.all
-- $Header: //synplicity/map202003lat/mappers/att/lib/orca2.vhd#1 $
library ieee;
use ieee.std_logic_1164.all;
library synplify;
use synplify.attributes.all;
package orcacomp is
 attribute syn_black_box of orcacomp : package is true;
 attribute orca_area : integer;

 component ADD
  port (
   A : in std_logic;
   B : in std_logic;
   CI : in std_logic;
   CO : out std_logic;
   S : out std_logic);
 end component;
 attribute syn_black_box of ADD : component is true;
 component ADSU
  port (
   A : in std_logic;
   B : in std_logic;
   BCI : in std_logic;
   CON : in std_logic;
   BCO : out std_logic;
   S : out std_logic);
 end component;
 attribute syn_black_box of ADSU : component is true;
 component AND2
  port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND2 : component is true;
 component AND2B1
  port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND2B1 : component is true;
 component AND2B2
  port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND2B2 : component is true;
 component AND3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND3 : component is true;
 component AND3B1
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND3B1 : component is true;
 component AND3B2
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND3B2 : component is true;
 component AND3B3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND3B3 : component is true;
 component AND4
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND4 : component is true;
 component AND4B1
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND4B1 : component is true;
 component AND4B2
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND4B2 : component is true;
 component AND4B3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND4B3 : component is true;
 component AND4B4
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND4B4 : component is true;
 component AND5
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND5 : component is true;
 component AND5B1
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND5B1 : component is true;
 component AND5B2
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND5B2 : component is true;
 component AND5B3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND5B3 : component is true;
 component AND5B4
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND5B4 : component is true;
 component AND5B5
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND5B5 : component is true;
 component AND6
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   F : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AND6 : component is true;
 component AOI21
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI21 : component is true;
 component AOI211
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI211 : component is true;
 component AOI2111
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI2111 : component is true;
 component AOI22
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI22 : component is true;
 component AOI221
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI221 : component is true;
 component AOI2211
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI2211 : component is true;
 component AOI222
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   C1 : in std_logic;
   C2 : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI222 : component is true;
 component AOI31
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI31 : component is true;
 component AOI311
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI311 : component is true;
 component AOI3111
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI3111 : component is true;
 component AOI32
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI32 : component is true;
 component AOI321
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI321 : component is true;
 component AOI33
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI33 : component is true;
 component AOI41
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI41 : component is true;
 component AOI411
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI411 : component is true;
 component AOI42
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of AOI42 : component is true;
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
 component BMZ12
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BMZ12 : component is true;
 attribute black_box_pad_pin of BMZ12 : component is "B";
 attribute xc_alias of BMZ12 : component is "IBUF";
 component BMZ12F
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BMZ12F : component is true;
 attribute black_box_pad_pin of BMZ12F : component is "B";
 component BMZ12FPD
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BMZ12FPD : component is true;
 attribute black_box_pad_pin of BMZ12FPD : component is "B";
 component BMZ12FPU
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BMZ12FPU : component is true;
 attribute black_box_pad_pin of BMZ12FPU : component is "B";
 component BMZ12PD
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BMZ12PD : component is true;
 attribute black_box_pad_pin of BMZ12PD : component is "B";
 component BMZ12PU
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BMZ12PU : component is true;
 attribute black_box_pad_pin of BMZ12PU : component is "B";
 component BMZ6
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BMZ6 : component is true;
 attribute black_box_pad_pin of BMZ6 : component is "B";
 component BMZ6PD
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BMZ6PD : component is true;
 attribute black_box_pad_pin of BMZ6PD : component is "B";
 component BMZ6PU
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BMZ6PU : component is true;
 attribute black_box_pad_pin of BMZ6PU : component is "B";
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
 attribute syn_noprune of BNDSCAN : component is true;
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
 component BTZ12
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BTZ12 : component is true;
 attribute black_box_pad_pin of BTZ12 : component is "B";
 component BTZ12F
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BTZ12F : component is true;
 attribute black_box_pad_pin of BTZ12F : component is "B";
 component BTZ12FPD
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BTZ12FPD : component is true;
 attribute black_box_pad_pin of BTZ12FPD : component is "B";
 component BTZ12FPU
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BTZ12FPU : component is true;
 attribute black_box_pad_pin of BTZ12FPU : component is "B";
 component BTZ12PD
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BTZ12PD : component is true;
 attribute black_box_pad_pin of BTZ12PD : component is "B";
 component BTZ12PU
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BTZ12PU : component is true;
 attribute black_box_pad_pin of BTZ12PU : component is "B";
 component BTZ6
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BTZ6 : component is true;
 attribute black_box_pad_pin of BTZ6 : component is "B";
 component BTZ6PD
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BTZ6PD : component is true;
 attribute black_box_pad_pin of BTZ6PD : component is "B";
 component BTZ6PU
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic;
   B : inout std_logic);
 end component;
 attribute syn_black_box of BTZ6PU : component is true;
 attribute black_box_pad_pin of BTZ6PU : component is "B";
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
   NC3 : out std_logic);
 end component;
 attribute syn_black_box of CB4 : component is true;
 attribute orca_area of CB4 : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of CB4P3BX : component is true;
 attribute orca_area of CB4P3BX : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of CB4P3DX : component is true;
 attribute orca_area of CB4P3DX : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of CB4P3IX : component is true;
 attribute orca_area of CB4P3IX : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of CB4P3JX : component is true;
 attribute orca_area of CB4P3JX : component is 4;
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
   NC3 : out std_logic);
 end component;
 attribute syn_black_box of CD4 : component is true;
 attribute orca_area of CD4 : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of CD4P3BX : component is true;
 attribute orca_area of CD4P3BX : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of CD4P3DX : component is true;
 attribute orca_area of CD4P3DX : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of CD4P3IX : component is true;
 attribute orca_area of CD4P3IX : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of CD4P3JX : component is true;
 attribute orca_area of CD4P3JX : component is 4;
 component COMP
  port (
   A0 : in std_logic;
   A1 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   EQ : out std_logic);
 end component;
 attribute syn_black_box of COMP : component is true;
 attribute orca_area of COMP : component is 1;
 component COMP4
  port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   EQ : out std_logic);
 end component;
 attribute syn_black_box of COMP4 : component is true;
 attribute orca_area of COMP4 : component is 4;
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
   NC3 : out std_logic);
 end component;
 attribute syn_black_box of CU4 : component is true;
 attribute orca_area of CU4 : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of CU4P3BX : component is true;
 attribute orca_area of CU4P3BX : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of CU4P3DX : component is true;
 attribute orca_area of CU4P3DX : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of CU4P3IX : component is true;
 attribute orca_area of CU4P3IX : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of CU4P3JX : component is true;
 attribute orca_area of CU4P3JX : component is 4;
 component DMUX24
  port (
   A0 : in std_logic;
   A1 : in std_logic;
   Z0 : out std_logic;
   Z1 : out std_logic;
   Z2 : out std_logic;
   Z3 : out std_logic);
 end component;
 attribute syn_black_box of DMUX24 : component is true;
 attribute orca_area of DMUX24 : component is 4;
 component DMUX24E
  port (
   A0 : in std_logic;
   A1 : in std_logic;
   E : in std_logic;
   Z0 : out std_logic;
   Z1 : out std_logic;
   Z2 : out std_logic;
   Z3 : out std_logic);
 end component;
 attribute syn_black_box of DMUX24E : component is true;
 attribute orca_area of DMUX24E : component is 4;
 component DMUX38
  port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   Z0 : out std_logic;
   Z1 : out std_logic;
   Z2 : out std_logic;
   Z3 : out std_logic;
   Z4 : out std_logic;
   Z5 : out std_logic;
   Z6 : out std_logic;
   Z7 : out std_logic);
 end component;
 attribute syn_black_box of DMUX38 : component is true;
 attribute orca_area of DMUX38 : component is 8;
 component DMUX38E
  port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   E : in std_logic;
   Z0 : out std_logic;
   Z1 : out std_logic;
   Z2 : out std_logic;
   Z3 : out std_logic;
   Z4 : out std_logic;
   Z5 : out std_logic;
   Z6 : out std_logic;
   Z7 : out std_logic);
 end component;
 attribute syn_black_box of DMUX38E : component is true;
 attribute orca_area of DMUX38E : component is 8;
 component FAC4P3D
  port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   CI : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   CO : out std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of FAC4P3D : component is true;
 attribute orca_area of FAC4P3D : component is 4;
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
   S3 : out std_logic);
 end component;
 attribute syn_black_box of FADD4 : component is true;
 attribute orca_area of FADD4 : component is 4;
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
   S3 : out std_logic);
 end component;
 attribute syn_black_box of FADD4O : component is true;
 attribute orca_area of FADD4O : component is 4;
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
   S3 : out std_logic);
 end component;
 attribute syn_black_box of FADSU4 : component is true;
 attribute orca_area of FADSU4 : component is 4;
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
   S3 : out std_logic);
 end component;
 attribute syn_black_box of FADSU4O : component is true;
 attribute orca_area of FADSU4O : component is 4;
 component FD1P3AX
  port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1P3AX : component is true;
 component FD1P3AY
  port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1P3AY : component is true;
 component FD1P3BX
  port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1P3BX : component is true;
 component FD1P3DX
  port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1P3DX : component is true;
 component FD1P3IZ
  port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1P3IZ : component is true;
 component FD1P3JZ
  port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1P3JZ : component is true;
 component FD1S1A
  port (
   D : in std_logic;
   CK : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1S1A : component is true;
 component FD1S1AY
  port (
   D : in std_logic;
   CK : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1S1AY : component is true;
 component FD1S1B
  port (
   D : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1S1B : component is true;
 component FD1S1D
  port (
   D : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1S1D : component is true;
 component FD1S1I
  port (
   D : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1S1I : component is true;
 component FD1S1J
  port (
   D : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1S1J : component is true;
 component FD1S3AX
  port (
   D : in std_logic;
   CK : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1S3AX : component is true;
 component FD1S3AY
  port (
   D : in std_logic;
   CK : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1S3AY : component is true;
 component FD1S3BX
  port (
   D : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1S3BX : component is true;
 component FD1S3DX
  port (
   D : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1S3DX : component is true;
 component FD1S3IX
  port (
   D : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1S3IX : component is true;
 component FD1S3JX
  port (
   D : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FD1S3JX : component is true;
 component FJ1S3AX
  port (
   J : in std_logic;
   K : in std_logic;
   CK : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FJ1S3AX : component is true;
 component FJ1S3BX
  port (
   J : in std_logic;
   K : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FJ1S3BX : component is true;
 component FJ1S3DX
  port (
   J : in std_logic;
   K : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FJ1S3DX : component is true;
 component FL1P3AY
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FL1P3AY : component is true;
 component FL1P3AZ
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FL1P3AZ : component is true;
 component FL1S1A
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FL1S1A : component is true;
 component FL1S1AY
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FL1S1AY : component is true;
 component FL1S3AX
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FL1S3AX : component is true;
 component FL1S3AY
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FL1S3AY : component is true;
 component FMULT4
  port (
   A0 : in std_logic;
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   S0 : out std_logic;
   S1 : out std_logic;
   S2 : out std_logic;
   S3 : out std_logic;
   S4 : out std_logic;
   S5 : out std_logic;
   S6 : out std_logic;
   S7 : out std_logic);
 end component;
 attribute syn_black_box of FMULT4 : component is true;
 attribute orca_area of FMULT4 : component is 12;
 component FS1S1A
  port (
   S : in std_logic;
   R : in std_logic;
   CK : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FS1S1A : component is true;
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
   S3 : out std_logic);
 end component;
 attribute syn_black_box of FSUB4 : component is true;
 attribute orca_area of FSUB4 : component is 4;
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
   S3 : out std_logic);
 end component;
 attribute syn_black_box of FSUB4O : component is true;
 attribute orca_area of FSUB4O : component is 4;
 component FT1S3AX
  port (
   T : in std_logic;
   CK : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FT1S3AX : component is true;
 component FT1S3BX
  port (
   T : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FT1S3BX : component is true;
 component FT1S3DX
  port (
   T : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic := open;
   QN : out std_logic := open);
 end component;
 attribute syn_black_box of FT1S3DX : component is true;
 component GSR
  port (
   GSR : in std_logic);
 end component;
 attribute syn_black_box of GSR : component is true;
 attribute syn_noprune of GSR : component is true;
 component IBM
  port (
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of IBM : component is true;
 attribute black_box_pad_pin of IBM : component is "I";
 component IBMPD
  port (
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of IBMPD : component is true;
 attribute black_box_pad_pin of IBMPD : component is "I";
 component IBMPDS
  port (
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of IBMPDS : component is true;
 attribute black_box_pad_pin of IBMPDS : component is "I";
 component IBMPU
  port (
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of IBMPU : component is true;
 attribute black_box_pad_pin of IBMPU : component is "I";
 component IBMPUS
  port (
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of IBMPUS : component is true;
 attribute black_box_pad_pin of IBMPUS : component is "I";
 component IBMS
  port (
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of IBMS : component is true;
 attribute black_box_pad_pin of IBMS : component is "I";
 component IBT
  port (
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of IBT : component is true;
 attribute black_box_pad_pin of IBT : component is "I";
 component IBTPD
  port (
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of IBTPD : component is true;
 attribute black_box_pad_pin of IBTPD : component is "I";
 component IBTPDS
  port (
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of IBTPDS : component is true;
 attribute black_box_pad_pin of IBTPDS : component is "I";
 component IBTPU
  port (
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of IBTPU : component is true;
 attribute black_box_pad_pin of IBTPU : component is "I";
 component IBTPUS
  port (
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of IBTPUS : component is true;
 attribute black_box_pad_pin of IBTPUS : component is "I"; 
 component IBTS 
  port ( 
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of IBTS : component is true;
 attribute black_box_pad_pin of IBTS : component is "I";
 component INRB
  port (
   A : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of INRB : component is true;
 component INV
  port (
   A : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of INV : component is true;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of LB4P3AX : component is true;
 attribute orca_area of LB4P3AX : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of LB4P3AY : component is true;
 attribute orca_area of LB4P3AY : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of LD4P3AX : component is true;
 attribute orca_area of LD4P3AX : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of LD4P3AY : component is true;
 attribute orca_area of LD4P3AY :  component is 4;
 component LTGT
  port (
   A0 : in std_logic;
   A1 : in std_logic;
   B0 : in std_logic;
   B1 : in std_logic;
   GT : out std_logic;
   LT : out std_logic);
 end component;
 attribute syn_black_box of LTGT : component is true;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of LU4P3AX : component is true;
 attribute orca_area of LU4P3AX : component is 4;
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
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of LU4P3AY : component is true;
 attribute orca_area of LU4P3AY :  component is 4;
 component MUX21
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   SD : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of MUX21 : component is true;
 attribute orca_area of MUX21 : component is 1;
 component MUX21E
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   SD : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of MUX21E : component is true;
 attribute orca_area of MUX21E : component is 1;
 component MUX41
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   SD1 : in std_logic;
   SD2 : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of MUX41 : component is true;
 attribute orca_area of MUX41 : component is 4;
 component MUX41E
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   SD1 : in std_logic;
   SD2 : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of MUX41E : component is true;
 attribute orca_area of MUX41E : component is 4;
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
 attribute orca_area of MUX81 : component is 8;
 component MUX81E
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
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of MUX81E : component is true;
 attribute orca_area of MUX81E : component is 8;
 component ND2
  port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND2 : component is true;
 component ND2B1
  port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND2B1 : component is true;
 component ND2B2
  port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND2B2 : component is true;
 component ND3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND3 : component is true;
 component ND3B1
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND3B1 : component is true;
 component ND3B2
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND3B2 : component is true;
 component ND3B3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND3B3 : component is true;
 component ND4
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND4 : component is true;
 component ND4B1
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND4B1 : component is true;
 component ND4B2
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND4B2 : component is true;
 component ND4B3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND4B3 : component is true;
 component ND4B4
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND4B4 : component is true;
 component ND5
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND5 : component is true;
 component ND5B1
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND5B1 : component is true;
 component ND5B2
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND5B2 : component is true;
 component ND5B3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND5B3 : component is true;
 component ND5B4
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND5B4 : component is true;
 component ND5B5
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND5B5 : component is true;
 component ND6
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   F : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of ND6 : component is true;
 component NR2
  port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR2 : component is true;
 component NR2B1
  port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR2B1 : component is true;
 component NR2B2
  port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR2B2 : component is true;
 component NR3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR3 : component is true;
 component NR3B1
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR3B1 : component is true;
 component NR3B2
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR3B2 : component is true;
 component NR3B3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR3B3 : component is true;
 component NR4
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR4 : component is true;
 component NR4B1
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR4B1 : component is true;
 component NR4B2
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR4B2 : component is true;
 component NR4B3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR4B3 : component is true;
 component NR4B4
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR4B4 : component is true;
 component NR5
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR5 : component is true;
 component NR5B1
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR5B1 : component is true;
 component NR5B2
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR5B2 : component is true;
 component NR5B3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR5B3 : component is true;
 component NR5B4
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR5B4 : component is true;
 component NR5B5
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR5B5 : component is true;
 component NR6
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   F : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of NR6 : component is true;
 component OAI21
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI21 : component is true;
 component OAI211
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI211 : component is true;
 component OAI2111
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI2111 : component is true;
 component OAI22
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI22 : component is true;
 component OAI221
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI221 : component is true;
 component OAI2211
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI2211 : component is true;
 component OAI222
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   C1 : in std_logic;
   C2 : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI222 : component is true;
 component OAI31
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI31 : component is true;
 component OAI311
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI311 : component is true;
 component OAI3111
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI3111 : component is true;
 component OAI32
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI32 : component is true;
 component OAI321
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI321 : component is true;
 component OAI33
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   B3 : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI33 : component is true;
 component OAI41
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI41 : component is true;
 component OAI411
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI411 : component is true;
 component OAI42
  port (
   A1 : in std_logic;
   A2 : in std_logic;
   A3 : in std_logic;
   A4 : in std_logic;
   B1 : in std_logic;
   B2 : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OAI42 : component is true;
 component OB12
  port (
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of OB12 : component is true;
 attribute black_box_pad_pin of OB12 : component is "O";
 component OB12F
  port (
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of OB12F : component is true;
 attribute black_box_pad_pin of OB12F : component is "O";
 component OB6
  port (
   I : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of OB6 : component is true;
 attribute black_box_pad_pin of OB6 : component is "O";
 component OBZ12
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of OBZ12 : component is true;
 attribute black_box_pad_pin of OBZ12 : component is "O";
 component OBZ12F
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of OBZ12F : component is true;
 attribute black_box_pad_pin of OBZ12F : component is "O";
 component OBZ12FPD
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of OBZ12FPD : component is true;
 attribute black_box_pad_pin of OBZ12FPD : component is "O";
 component OBZ12FPU
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of OBZ12FPU : component is true;
 attribute black_box_pad_pin of OBZ12FPU : component is "O";
 component OBZ12PD
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of OBZ12PD : component is true;
 attribute black_box_pad_pin of OBZ12PD : component is "O";
 component OBZ12PU
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of OBZ12PU : component is true;
 attribute black_box_pad_pin of OBZ12PU : component is "O";
 component OBZ6
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of OBZ6 : component is true;
 attribute black_box_pad_pin of OBZ6 : component is "O";
 component OBZ6PD
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of OBZ6PD : component is true;
 attribute black_box_pad_pin of OBZ6PD : component is "O";
 component OBZ6PU
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of OBZ6PU : component is true;
 attribute black_box_pad_pin of OBZ6PU : component is "O";
 component OR2
  port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR2 : component is true;
 component OR2B1
  port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR2B1 : component is true;
 component OR2B2
  port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR2B2 : component is true;
 component OR3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR3 : component is true;
 component OR3B1
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR3B1 : component is true;
 component OR3B2
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR3B2 : component is true;
 component OR3B3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR3B3 : component is true;
 component OR4
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR4 : component is true;
 component OR4B1
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR4B1 : component is true;
 component OR4B2
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR4B2 : component is true;
 component OR4B3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR4B3 : component is true;
 component OR4B4
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR4B4 : component is true;
 component OR5
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR5 : component is true;
 component OR5B1
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR5B1 : component is true;
 component OR5B2
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR5B2 : component is true;
 component OR5B3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR5B3 : component is true;
 component OR5B4
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR5B4 : component is true;
 component OR5B5
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR5B5 : component is true;
 component OR6
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   F : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of OR6 : component is true;
 component OSCIL
  port (
   TEST : in std_logic;
   OSC : out std_logic);
 end component;
 attribute syn_black_box of OSCIL : component is true;
 attribute syn_noprune of OSCIL : component is true;
 component PFUMX
  port (
   ALUT : in std_logic;
   BLUT : in std_logic;
   C0 : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of PFUMX : component is true;
 component PFUND
  port (
   ALUT : in std_logic;
   BLUT : in std_logic;
   C0 : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of PFUND : component is true;
 component PFUND0
  port (
   ALUT : in std_logic;
   BLUT : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of PFUND0 : component is true;
 component PFUXR
  port (
   ALUT : in std_logic;
   BLUT : in std_logic;
   C0 : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of PFUXR : component is true;
 component PFUXR0
  port (
   ALUT : in std_logic;
   BLUT : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of PFUXR0 : component is true;
 component RD4P3A
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RD4P3A : component is true;
 component RD4P3B
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RD4P3B : component is true;
 component RD4P3D
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RD4P3D : component is true;
 component RD4P3I
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RD4P3I : component is true;
 component RD4P3J
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RD4P3J : component is true;
 component RD4S3A
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CK : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RD4S3A : component is true;
 component RD4S3B
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RD4S3B : component is true;
 component RD4S3D
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RD4S3D : component is true;
 component RD4S3I
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RD4S3I : component is true;
 component RD4S3J
  port (
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RD4S3J : component is true;
 component READBK
  port (
   RDCFGN : in std_logic;
   CAPT : in std_logic;
   PRDDATA : out std_logic;
   RDBO : out std_logic);
 end component;
 attribute syn_black_box of READBK : component is true;
 component RLS4P3A
  port (
   D : in std_logic;
   D0 : in std_logic;
   D1 : in std_logic;
   D2 : in std_logic;
   D3 : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   SD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RLS4P3A : component is true;
 component RPP16X2
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   WREN : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic);
 end component;
 attribute syn_black_box of RPP16X2 : component is true;
 attribute orca_area of RPP16X2 : component is 2;
 component RPP16X2Z
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   WREN : in std_logic;
   TRI : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic);
 end component;
 attribute syn_black_box of RPP16X2Z : component is true;
 attribute black_box_tri_pins of RPP16X2Z : component is "DO0,DO1";
 attribute orca_area of RPP16X2Z : component is 2;
 component RPP16X4
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   DI2 : in std_logic;
   DI3 : in std_logic;
   WREN : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic;
   DO2 : out std_logic;
   DO3 : out std_logic);
 end component;
 attribute syn_black_box of RPP16X4 : component is true;
 attribute orca_area of RPP16X4 : component is 4;
 component RPP16X4Z
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   DI2 : in std_logic;
   DI3 : in std_logic;
   WREN : in std_logic;
   TRI : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic;
   DO2 : out std_logic;
   DO3 : out std_logic);
 end component;
 attribute syn_black_box of RPP16X4Z : component is true;
 attribute black_box_tri_pins of RPP16X4Z : component is "DO0,DO1,DO2,DO3";
 attribute orca_area of RPP16X4Z : component is 4;
 component RS4P3A
  port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RS4P3A : component is true;
 component RS4P3B
  port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RS4P3B : component is true;
 component RS4P3D
  port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RS4P3D : component is true;
 component RS4P3I
  port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RS4P3I : component is true;
 component RS4P3J
  port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RS4P3J : component is true;
 component RS4S3A
  port (
   D : in std_logic;
   CK : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RS4S3A : component is true;
 component RS4S3B
  port (
   D : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RS4S3B : component is true;
 component RS4S3D
  port (
   D : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RS4S3D : component is true;
 component RS4S3I
  port (
   D : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RS4S3I : component is true;
 component RS4S3J
  port (
   D : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q0 : out std_logic;
   Q1 : out std_logic;
   Q2 : out std_logic;
   Q3 : out std_logic);
 end component;
 attribute syn_black_box of RS4S3J : component is true;
 component SUB
  port (
   A : in std_logic;
   B : in std_logic;
   BI : in std_logic;
   BO : out std_logic;
   S : out std_logic);
 end component;
 attribute syn_black_box of SUB : component is true;
 component TBUF
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of TBUF : component is true;
 attribute black_box_tri_pins of TBUF : component is "O";
 component TIBUF
  port (
   I : in std_logic;
   T : in std_logic;
   O : out std_logic);
 end component;
 attribute syn_black_box of TIBUF : component is true;
 attribute black_box_tri_pins of TIBUF : component is "O";
 component VHI
  port (
   Z : out std_logic);
 end component;
 attribute syn_black_box of VHI : component is true;
 component VLO
  port (
   Z : out std_logic);
 end component;
 attribute syn_black_box of VLO : component is true;
 component XNOR2
  port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of XNOR2 : component is true;
 component XNOR3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of XNOR3 : component is true;
 component XNOR4
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of XNOR4 : component is true;
 component XNOR5
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of XNOR5 : component is true;
 component XNOR6
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   F : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of XNOR6 : component is true;
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
 component XOR2
  port (
   A : in std_logic;
   B : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of XOR2 : component is true;
 component XOR3
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of XOR3 : component is true;
 component XOR4
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of XOR4 : component is true;
 component XOR5
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of XOR5 : component is true;
 component XOR6
  port (
   A : in std_logic;
   B : in std_logic;
   C : in std_logic;
   D : in std_logic;
   E : in std_logic;
   F : in std_logic;
   Z : out std_logic);
 end component;
 attribute syn_black_box of XOR6 : component is true;

--
-- 2A components
--
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
   GE : out std_logic);
 end component;
 attribute syn_black_box of AGEB4 : component is true;
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
   NE : out std_logic);
 end component;
 attribute syn_black_box of ANEB4 : component is true;
 component DCE16X2
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   CK : in std_logic;
   WREN : in std_logic;
   WPE : in std_logic;
   RAD0 : in std_logic;
   RAD1 : in std_logic;
   RAD2 : in std_logic;
   RAD3 : in std_logic;
   RDO0 : out std_logic;
   RDO1 : out std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic);
 end component;
 attribute syn_black_box of DCE16X2 : component is true;
 attribute orca_area of DCE16X2 : component is 4;
 component DCE16X2Z
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   CK : in std_logic;
   WREN : in std_logic;
   WPE : in std_logic;
   TRI : in std_logic;
   RAD0 : in std_logic;
   RAD1 : in std_logic;
   RAD2 : in std_logic;
   RAD3 : in std_logic;
   RDO0 : out std_logic;
   RDO1 : out std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic);
 end component;
 attribute syn_black_box of DCE16X2Z : component is true;
 attribute black_box_tri_pins of DCE16X2Z : component is "RDO0,RDO1";
 attribute orca_area of DCE16X2Z : component is 4;
 component DCF16X2
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   CK : in std_logic;
   WREN : in std_logic;
   WPE : in std_logic;
   RAD0 : in std_logic;
   RAD1 : in std_logic;
   RAD2 : in std_logic;
   RAD3 : in std_logic;
   RDO0 : out std_logic;
   RDO1 : out std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic);
 end component;
 attribute syn_black_box of DCF16X2 : component is true;
 attribute orca_area of DCF16X2 : component is 2;
 component DCF16X2Z
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   CK : in std_logic;
   WREN : in std_logic;
   WPE : in std_logic;
   TRI : in std_logic;
   RAD0 : in std_logic;
   RAD1 : in std_logic;
   RAD2 : in std_logic;
   RAD3 : in std_logic;
   RDO0 : out std_logic;
   RDO1 : out std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic);
 end component;
 attribute syn_black_box of DCF16X2Z : component is true;
 attribute black_box_tri_pins of DCF16X2Z : component is "RDO0,RDO1";
 attribute orca_area of DCF16X2 : component is 2;
 component FD1P3IX
  port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   CD : in std_logic;
   Q : out std_logic;
   QN : out std_logic);
 end component;
 attribute syn_black_box of FD1P3IX : component is true;
 component FD1P3JX
  port (
   D : in std_logic;
   SP : in std_logic;
   CK : in std_logic;
   PD : in std_logic;
   Q : out std_logic;
   QN : out std_logic);
 end component;
 attribute syn_black_box of FD1P3JX : component is true;
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
   P3 : out std_logic);
 end component;
 attribute syn_black_box of FMULT41 : component is true;
 attribute orca_area of FMULT41 : component is 4;
 component RCE16X4
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   DI2 : in std_logic;
   DI3 : in std_logic;
   CK : in std_logic;
   WREN : in std_logic;
   WPE : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic;
   DO2 : out std_logic;
   DO3 : out std_logic);
 end component;
 attribute syn_black_box of RCE16X4 : component is true;
 attribute orca_area of RCE16X4 : component is 4;
 component RCE16X4Z
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   DI2 : in std_logic;
   DI3 : in std_logic;
   CK : in std_logic;
   WREN : in std_logic;
   WPE : in std_logic;
   TRI : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic;
   DO2 : out std_logic;
   DO3 : out std_logic);
 end component;
 attribute syn_black_box of RCE16X4Z : component is true;
 attribute black_box_tri_pins of RCE16X4Z : component is "DO0,DO1,DO2,DO3";
 attribute orca_area of RCE16X4Z : component is 4;
 component RCF16X4
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   DI2 : in std_logic;
   DI3 : in std_logic;
   CK : in std_logic;
   WREN : in std_logic;
   WPE : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic;
   DO2 : out std_logic;
   DO3 : out std_logic);
 end component;
 attribute syn_black_box of RCF16X4 : component is true;
 attribute orca_area of RCF16X4 : component is 4;
 component RCF16X4Z
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   DI2 : in std_logic;
   DI3 : in std_logic;
   CK : in std_logic;
   WREN : in std_logic;
   WPE : in std_logic;
   TRI : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic;
   DO2 : out std_logic;
   DO3 : out std_logic);
 end component;
 attribute syn_black_box of RCF16X4Z : component is true;
 attribute black_box_tri_pins of RCF16X4Z : component is "DO0,DO1,DO2,DO3";
 attribute syn_tpd1 of RCF16X4Z : component is 
    "AD0,AD1,AD2,AD3->DO0,DO1,DO2,D03=2.1";
 attribute syn_tpd2 of RCF16X4Z: component is 
    "TRI->DO0,DO1,DO2,DO3=2.0";
 attribute syn_tsu1 of RCF16X4Z: component is "AD0,AD1,AD2,AD3->CK=1.2";
 attribute syn_tsu2 of RCF16X4Z: component is "WREN,WPE,DI0,DI1,DI2,DI3->CK=0.0";
 attribute orca_area of RCF16X4Z : component is 4;

 component RPE16X2
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   WREN : in std_logic;
   WPE : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic);
 end component;
 attribute syn_black_box of RPE16X2 : component is true;
 attribute orca_area of RPE16X2 : component is 2;
 component RPE16X2Z
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   WREN : in std_logic;
   WPE : in std_logic;
   TRI : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic);
 end component;
 attribute syn_black_box of RPE16X2Z : component is true;
 attribute black_box_tri_pins of RPE16X2Z : component is "DO0,DO1";
 attribute orca_area of RPE16X2Z : component is 2;
 component RPE16X4
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   DI2 : in std_logic;
   DI3 : in std_logic;
   WREN : in std_logic;
   WPE : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic;
   DO2 : out std_logic;
   DO3 : out std_logic);
 end component;
 attribute syn_black_box of RPE16X4 : component is true;
 attribute orca_area of RPE16X4 : component is 4;
 component RPE16X4Z
  port (
   AD0 : in std_logic;
   AD1 : in std_logic;
   AD2 : in std_logic;
   AD3 : in std_logic;
   DI0 : in std_logic;
   DI1 : in std_logic;
   DI2 : in std_logic;
   DI3 : in std_logic;
   WREN : in std_logic;
   WPE : in std_logic;
   TRI : in std_logic;
   DO0 : out std_logic;
   DO1 : out std_logic;
   DO2 : out std_logic;
   DO3 : out std_logic);
 end component;
 attribute syn_black_box of RPE16X4Z : component is true;
 attribute black_box_tri_pins of RPE16X4Z : component is "DO0,DO1,DO2,DO3";
 attribute orca_area of RPE16X4Z : component is 4;
 component STRTUP
  port (
   UCLK : in std_logic);
 end component;
 attribute syn_black_box of STRTUP : component is true;
 attribute syn_noprune of STRTUP : component is true;
 component TSALL
  port (
   TSALL : in std_logic);
 end component;
 attribute syn_black_box of TSALL : component is true;
 attribute syn_noprune of TSALL : component is true;
 component ROM16X1 
  port (
   AD0, AD1, AD2, AD3 : in std_logic;
   DO0 : out std_logic);
 end component;
 attribute syn_black_box of ROM16X1 : component is true;
 component ROM32X1 
  port (
   AD0, AD1, AD2, AD3, AD4 : in std_logic;
   DO0 : out std_logic);
 end component;
 attribute syn_black_box of ROM32X1 : component is true;
 component ROM32X4 
  port (
   AD0, AD1, AD2, AD3, AD4, CK : in std_logic;
   DO0, DO1, DO2, DO3, QDO0, QDO1, QDO2, QDO3 : out std_logic);
 end component;
 attribute syn_black_box of ROM32X4 : component is true;
end package orcacomp;
