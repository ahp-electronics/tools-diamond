
-- Copyright (c) 2000 Synplicity, Inc.
-- $Header: //synplicity/map202003lat/mappers/lattice/lib/lava1.vhd#1 $


-- library lava1;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
package COMPONENTS is

component BUFF
    port(
I0 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component AS_LSB
    port(
A0 		:in 	STD_ULOGIC;
B0 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
AS 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component BI_DIR
    port(
I0 		:in 	STD_ULOGIC;
OE 		:in 	STD_ULOGIC;
IO 		:inout 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component GCLKBUF
    port(
CI              :in STD_ULOGIC;
O               :out STD_ULOGIC);
end component;

component GCLKBUFI
    port(
I0              :in STD_ULOGIC;
O               :out STD_ULOGIC);
end component;

component BUFTH
    port(
I0 		:in 	STD_ULOGIC;
OE 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component BUFTI
    port(
I0 		:in 	STD_ULOGIC;
OE 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component BUFEI
    port(
I0 		:in 	STD_ULOGIC;
OE 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component BUFTL
    port(
I0 		:in 	STD_ULOGIC;
OE 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component CCU_ABS
    port(
D 		:in 	STD_ULOGIC;
PN 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_AGB
    port(
A0 		:in 	STD_ULOGIC;
B0 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_AGBS
    port(
A0 		:in 	STD_ULOGIC;
B0 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC);
end component;

component CCU_AS_LSB
    port(
A0 		:in 	STD_ULOGIC;
B0 		:in 	STD_ULOGIC;
AS 		:in 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC);
end component;

component CCU_AS
    port(
A0 		:in 	STD_ULOGIC;
B0 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
AS 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_ADD
    port(
A0 		:in 	STD_ULOGIC;
B0 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_SUB
    port(
A0 		:in 	STD_ULOGIC;
B0 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_UDCP
    port(
D 		:in 	STD_ULOGIC;
SD 		:in 	STD_ULOGIC;
LOAD 		:in 	STD_ULOGIC;
UD 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_UDC
    port(
D 		:in 	STD_ULOGIC;
UD 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_DC
    port(
D 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_UC
    port(
D 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component DC_LSB
    port(
D 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component UC_LSB
    port(
D 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component LSB_CY
    port(
I0 		:in 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component LSB_CYI
    port(
I0 		:in 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_BUF
    port(
CI 		:in 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_OUT
    port(
CI 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component UDC_LSB
    port(
D 		:in 	STD_ULOGIC;
UD 		:in 	STD_ULOGIC;
CYIBAR 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_UCP
    port(
D 		:in 	STD_ULOGIC;
SD 		:in 	STD_ULOGIC;
LOAD 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component UCP_LSB
    port(
D 		:in 	STD_ULOGIC;
SD 		:in 	STD_ULOGIC;
LOAD 		:in 	STD_ULOGIC;
CYI 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_DCP
    port(
D 		:in 	STD_ULOGIC;
SD 		:in 	STD_ULOGIC;
LOAD 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
S0 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_BTH
    port(
A0 		:in 	STD_ULOGIC;
A1 		:in 	STD_ULOGIC;
D0 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
AS 		:in 	STD_ULOGIC;
SH 		:in 	STD_ULOGIC;
NOP 		:in 	STD_ULOGIC;
P 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_BTH_TC_LSB
    port(
A0 		:in 	STD_ULOGIC;
A1 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
AS 		:in 	STD_ULOGIC;
SH 		:in 	STD_ULOGIC;
NOP 		:in 	STD_ULOGIC;
P 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_BTH_TC_MSB
    port(
A0 		:in 	STD_ULOGIC;
A1 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
AS 		:in 	STD_ULOGIC;
NOP 		:in 	STD_ULOGIC;
P 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_BTH_UNS_LSB
    port(
A0 		:in 	STD_ULOGIC;
A1 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
B0 		:in 	STD_ULOGIC;
B1 		:in 	STD_ULOGIC;
P 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_BTH_UNS_MSB
    port(
D 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
AS 		:in 	STD_ULOGIC;
NOP 		:in 	STD_ULOGIC;
P 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_BTH_LSTC
    port(
A0 		:in 	STD_ULOGIC;
A1 		:in 	STD_ULOGIC;
CIN 		:in 	STD_ULOGIC;
ADD 		:in 	STD_ULOGIC;
P 		:out 	STD_ULOGIC;
COUT 		:out 	STD_ULOGIC);
end component;

component CCU_RCD
    port(
B0 		:in 	STD_ULOGIC;
B1 		:in 	STD_ULOGIC;
B2 		:in 	STD_ULOGIC;
AS 		:out 	STD_ULOGIC;
SH 		:out 	STD_ULOGIC;
NOP 		:out 	STD_ULOGIC);
end component;

component CCU_RCD_LSB
    port(
B1 		:in 	STD_ULOGIC;
B2 		:in 	STD_ULOGIC;
AS 		:out 	STD_ULOGIC;
SH 		:out 	STD_ULOGIC;
NOP 		:out 	STD_ULOGIC);
end component;

component DFF
    port(
D 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFF_1
    port(
D 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFCB
    port(
CE 		:in 	STD_ULOGIC;
D 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFCB_1
    port(
CE 		:in 	STD_ULOGIC;
D 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFCBRH
    port(
CE 		:in 	STD_ULOGIC;
D 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
R 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFCBRH_1
    port(
CE 		:in 	STD_ULOGIC;
D 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
R 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFCBSRH
    port(
CE 		:in 	STD_ULOGIC;
D 		:in 	STD_ULOGIC;
SR 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFCBSRH_1
    port(
CE 		:in 	STD_ULOGIC;
D 		:in 	STD_ULOGIC;
SR 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFCBSH
    port(
CE 		:in 	STD_ULOGIC;
D 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
S 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFCBSH_1
    port(
CE 		:in 	STD_ULOGIC;
D 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
S 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFCBSSH
    port(
CE 		:in 	STD_ULOGIC;
D 		:in 	STD_ULOGIC;
SS 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFCBSSH_1
    port(
CE 		:in 	STD_ULOGIC;
D 		:in 	STD_ULOGIC;
SS 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFRH
    port(
D 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
R 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFRH_1
    port(
D 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
R 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFSRH
    port(
D 		:in 	STD_ULOGIC;
SR 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFSRH_1
    port(
D 		:in 	STD_ULOGIC;
SR 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFSH
    port(
D 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
S 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFSH_1
    port(
D 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
S 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFSSH
    port(
D 		:in 	STD_ULOGIC;
SS 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFSSH_1
    port(
D 		:in 	STD_ULOGIC;
SS 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFLSH
    port(
D 		:in 	STD_ULOGIC;
SD 		:in 	STD_ULOGIC;
LD 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFLSH_1
    port(
D 		:in 	STD_ULOGIC;
SD 		:in 	STD_ULOGIC;
LD 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFCBLSH
    port(
D 		:in 	STD_ULOGIC;
SD 		:in 	STD_ULOGIC;
CE 		:in 	STD_ULOGIC;
LD 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DFFCBLSH_1
    port(
D 		:in 	STD_ULOGIC;
SD 		:in 	STD_ULOGIC;
CE 		:in 	STD_ULOGIC;
LD 		:in 	STD_ULOGIC;
CLK 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DLAT
    port(
D 		:in 	STD_ULOGIC;
LAT 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DLAT_1
    port(
D 		:in 	STD_ULOGIC;
LAT 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DLATSRH
    port(
D 		:in 	STD_ULOGIC;
SR 		:in 	STD_ULOGIC;
LAT 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DLATSRH_1
    port(
D 		:in 	STD_ULOGIC;
SR 		:in 	STD_ULOGIC;
LAT 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DLATSSH
    port(
D 		:in 	STD_ULOGIC;
SS 		:in 	STD_ULOGIC;
LAT 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DLATSSH_1
    port(
D 		:in 	STD_ULOGIC;
SS 		:in 	STD_ULOGIC;
LAT 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DLATRH
    port(
D 		:in 	STD_ULOGIC;
LAT 		:in 	STD_ULOGIC;
R 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DLATRH_1
    port(
D 		:in 	STD_ULOGIC;
LAT 		:in 	STD_ULOGIC;
R 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DLATSH
    port(
D 		:in 	STD_ULOGIC;
LAT 		:in 	STD_ULOGIC;
S 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component DLATSH_1
    port(
D 		:in 	STD_ULOGIC;
LAT 		:in 	STD_ULOGIC;
S 		:in 	STD_ULOGIC;
Q 		:out 	STD_ULOGIC);
end component;

component GND
    port(
X 		:out 	STD_ULOGIC);
end component;

component GSRBUF
    port(
SRI 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component GSRBUFI
    port(
I0 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component IBUF
    port(
I0 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component LVDSIN
   port(
      P_IN                             :	in    STD_ULOGIC;
      N_IN                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;

component BLVDSIN
   port(
      P_IN                             :	in    STD_ULOGIC;
      N_IN                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;

----- Component LVDSOUT -----
component LVDSOUT
   port(
      I                             :	in    STD_ULOGIC;
      P_OUT                           :	out   STD_ULOGIC;
      N_OUT                           :	out   STD_ULOGIC);
end component;

----- Component BLVDSOUT -----
component BLVDSOUT
   port(
      I                             :	in    STD_ULOGIC;
      P_OUT                           :	out   STD_ULOGIC;
      N_OUT                           :	out   STD_ULOGIC);
end component;

component LVDSTRI
   port(
      I                             :	in    STD_ULOGIC;
      OE                            :	in    STD_ULOGIC;
      P_OUT                          :	out   STD_ULOGIC;
      N_OUT                          :	out   STD_ULOGIC);
end component;

component BLVDSTRI
   port(
      I                             :	in    STD_ULOGIC;
      OE                            :	in    STD_ULOGIC;
      P_OUT                          :	out   STD_ULOGIC;
      N_OUT                          :	out   STD_ULOGIC);
end component;

component LVDSIO
   port(
      I                             :	in    STD_ULOGIC;
      OE                            :	in    STD_ULOGIC;
      P_IO                           :	inout   STD_ULOGIC;
      N_IO                           :	inout   STD_ULOGIC;
      O                           :	out   STD_ULOGIC);
end component;

component BLVDSIO
   port(
      I                             :	in    STD_ULOGIC;
      OE                            :	in    STD_ULOGIC;
      P_IO                           :	inout   STD_ULOGIC;
      N_IO                           :	inout   STD_ULOGIC;
      O                           :	out   STD_ULOGIC);
end component;

component INVTH
    port(
I0 		:in 	STD_ULOGIC;
OE 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component INVTL
    port(
I0 		:in 	STD_ULOGIC;
OE 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component INV
    port(
I0 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component MUX2
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
S0 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component MUX2A
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
S0 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component MUX2B
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
S0 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component MUX4
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
I2 		:in 	STD_ULOGIC;
I3 		:in 	STD_ULOGIC;
S0 		:in 	STD_ULOGIC;
S1 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component MUX8
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
I2 		:in 	STD_ULOGIC;
I3 		:in 	STD_ULOGIC;
I4 		:in 	STD_ULOGIC;
I5 		:in 	STD_ULOGIC;
I6 		:in 	STD_ULOGIC;
I7 		:in 	STD_ULOGIC;
S0 		:in 	STD_ULOGIC;
S1 		:in 	STD_ULOGIC;
S2 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component MUX8C
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
I2 		:in 	STD_ULOGIC;
I3 		:in 	STD_ULOGIC;
I4 		:in 	STD_ULOGIC;
I5 		:in 	STD_ULOGIC;
I6 		:in 	STD_ULOGIC;
I7 		:in 	STD_ULOGIC;
MI 		:in 	STD_ULOGIC;
S0 		:in 	STD_ULOGIC;
S1 		:in 	STD_ULOGIC;
S2 		:in 	STD_ULOGIC;
S3 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component LUT2
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component LUT3
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
I2 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component LUT4
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
I2 		:in 	STD_ULOGIC;
I3 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component LUT5
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
I2 		:in 	STD_ULOGIC;
I3 		:in 	STD_ULOGIC;
I4 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component LUT6
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
I2 		:in 	STD_ULOGIC;
I3 		:in 	STD_ULOGIC;
I4 		:in 	STD_ULOGIC;
I5 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component CYAND2
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component CYOR2
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component MULTAND2
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component GSROR2
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component CYXOR2
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component MUXL5
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
S0 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component MUXL6
    port(
I0 		:in 	STD_ULOGIC;
I1 		:in 	STD_ULOGIC;
S0 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component OBUF
    port(
I0 		:in 	STD_ULOGIC;
O 		:out 	STD_ULOGIC);
end component;

component VCC
    port(
X 		:out 	STD_ULOGIC);
end component;

component SPLL
   generic (in_freq : string := "100.0";
	    clk_out_to_pin : string := "off";
	    wake_on_lock : string := "off");
   port(
      CLK_IN                         :	in    STD_ULOGIC;
      CLK_OUT                        :	out   STD_ULOGIC);
end component;

component STDPLL
   generic (in_freq  : string  := "100.0";
            mult     : string  := "1";
            div      : string  := "1";
            post     : string  := "1";
            secdiv   : string  := "1";
            clk_out_to_pin   : string  := "off";
            wake_on_lock   : string  := "off";
            lock_cyc : integer := 1;
            pll_dly  : string  := "0.0");
   port(
      CLK_IN                         :	in    STD_ULOGIC;
      CLK_OUT                        :	out   STD_ULOGIC;
      PLL_LOCK                       :	out   STD_ULOGIC);
end component;

component STDPLLX
   generic (in_freq  : string  := "100.0";
            mult     : string  := "1";
            div      : string  := "1";
            post     : string  := "1";
            secdiv   : string  := "1";
            lock_cyc : integer := 1;
            clk_out_to_pin   : string  := "off";
            wake_on_lock   : string  := "off";
            pll_dly  : string  := "1");
   port(
      CLK_IN                         :	in    STD_ULOGIC;
      PLL_FBK                        :	in    STD_ULOGIC;
      PLL_RST                        :	in    STD_ULOGIC;
      CLK_OUT                        :	out   STD_ULOGIC;
      SEC_OUT                        :	out   STD_ULOGIC;
      PLL_LOCK                       :	out   STD_ULOGIC);
end component;

 component CDRX_10B12B
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      LOCK_CYC : integer := 2;
      SYMPAT: STRING := "111111000000";
      PLL_DLY  : string  := "1");
   port(
      SIN               : in    STD_ULOGIC;
      REFCLK            : in    STD_ULOGIC;
      CDRRST            : in    STD_ULOGIC;
      SYDTRST           : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RXD6              : out   STD_ULOGIC;
      RXD7              : out   STD_ULOGIC;
      RXD8              : out   STD_ULOGIC;
      RXD9              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC;
      CDRLOCK           : out   STD_ULOGIC;
      LOSS              : out   STD_ULOGIC;
      SYDT              : out   STD_ULOGIC);
 end component;

----- Component CDRX_8B10B -----
 component CDRX_8B10B
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      LOCK_CYC : integer := 2;
      PLL_DLY  : string  := "1";
      SYMPAT   : string  := "11000001011100000101");
   port(
      SIN               : in    STD_ULOGIC;
      REFCLK            : in    STD_ULOGIC;
      CDRRST            : in    STD_ULOGIC;
      EXLOSS            : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RXD6              : out   STD_ULOGIC;
      RXD7              : out   STD_ULOGIC;
      RXD8              : out   STD_ULOGIC;
      RXD9              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC;
      CDRLOCK           : out   STD_ULOGIC;
      LOSS              : out   STD_ULOGIC;
      SYDT              : out   STD_ULOGIC);

 end component;

 component CDRX_SS_4
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      POST     : string  := "1";
      LOCK_CYC : integer := 2;
      SECDIV   : string  := "1";
      SYMPAT   : string  := "110011001100";
      PLL_DLY  : string  := "1");
   port(
      SIN               : in    STD_ULOGIC;
      CAL               : in    STD_ULOGIC;
      SS_CLKIN          : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC;
      CDRLOCK           : out   STD_ULOGIC;
      SYDT              : out   STD_ULOGIC);

 end component;

 component CDRX_SS_6
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      POST     : string  := "1";
      LOCK_CYC : integer := 2;
      SECDIV   : string   := "1";
      SYMPAT   : string  := "000011110000";
      PLL_DLY  : string  := "1");
   port(
      SIN               : in    STD_ULOGIC;
      CAL               : in    STD_ULOGIC;
      SS_CLKIN          : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC;
      CDRLOCK           : out   STD_ULOGIC;
      SYDT              : out   STD_ULOGIC);

 end component;

 component CDRX_SS_8
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      LOCK_CYC : integer := 2;
      SYMPAT   : string  := "000011110000";
      PLL_DLY  : string  := "1");
   port(
      SIN               : in    STD_ULOGIC;
      CAL               : in    STD_ULOGIC;
      SS_CLKIN          : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RXD6              : out   STD_ULOGIC;
      RXD7              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC;
      CDRLOCK           : out   STD_ULOGIC;
      SYDT              : out   STD_ULOGIC);

 end component;

 component HSLB_10B12B
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      LOCK_CYC : integer := 2;
      PLL_DLY  : string  := "1");
   port(
      REFCLK            : in    STD_ULOGIC;
      CDRRST            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      TXD4              : in    STD_ULOGIC;
      TXD5              : in    STD_ULOGIC;
      TXD6              : in    STD_ULOGIC;
      TXD7              : in    STD_ULOGIC;
      TXD8              : in    STD_ULOGIC;
      TXD9              : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RXD6              : out   STD_ULOGIC;
      RXD7              : out   STD_ULOGIC;
      RXD8              : out   STD_ULOGIC;
      RXD9              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;

 component HSLB_8B10B
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      LOCK_CYC : integer := 2;
      PLL_DLY  : string  := "1");
   port(
      REFCLK            : in    STD_ULOGIC;
      CDRRST            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      TXD4              : in    STD_ULOGIC;
      TXD5              : in    STD_ULOGIC;
      TXD6              : in    STD_ULOGIC;
      TXD7              : in    STD_ULOGIC;
      TXD8              : in    STD_ULOGIC;
      TXD9              : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RXD6              : out   STD_ULOGIC;
      RXD7              : out   STD_ULOGIC;
      RXD8              : out   STD_ULOGIC;
      RXD9              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;

 component RX_SS_4
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      LOCK_CYC : integer := 2;
      PHASE_ADJ  : string  := "1");
   port(
      SIN               : in    STD_ULOGIC;
      SS_CLKIN          : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);
 end component;

 component RX_SS_6
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      LOCK_CYC : integer := 2;
      PHASE_ADJ  : string  := "1");
   port(
      SIN               : in    STD_ULOGIC;
      SS_CLKIN          : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;

 component RX_SS_8 
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      LOCK_CYC : integer := 2;
      PHASE_ADJ  : string  := "1");
   port(
      SIN               : in    STD_ULOGIC;
      CAL               : in    STD_ULOGIC;
      SS_CLKIN          : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RXD6              : out   STD_ULOGIC;
      RXD7              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC;
      CDRLOCK           : out   STD_ULOGIC;
      SYDT              : out   STD_ULOGIC);

 end component;

 component TX_10B12B
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      LOCK_CYC : integer := 2;
      PLL_DLY  : string  := "1");
   port(
      REFCLK            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      TXD4              : in    STD_ULOGIC;
      TXD5              : in    STD_ULOGIC;
      TXD6              : in    STD_ULOGIC;
      TXD7              : in    STD_ULOGIC;
      TXD8              : in    STD_ULOGIC;
      TXD9              : in    STD_ULOGIC;
      SOUT              : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;

 component TX_8B10B
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      LOCK_CYC : integer := 2;
      PLL_DLY  : string  := "1");
   port(
      REFCLK            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      TXD4              : in    STD_ULOGIC;
      TXD5              : in    STD_ULOGIC;
      TXD6              : in    STD_ULOGIC;
      TXD7              : in    STD_ULOGIC;
      TXD8              : in    STD_ULOGIC;
      TXD9              : in    STD_ULOGIC;
      SOUT              : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;

 component TX_SS_4
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      LOCK_CYC : integer := 2;
      PLL_DLY  : string  := "1");
   port(
      REFCLK            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      SOUT              : out   STD_ULOGIC;
      SS_CLKOUT         : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;

 component TX_SS_6
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      LOCK_CYC : integer := 2;
      PLL_DLY  : string  := "1");
   port(
      REFCLK            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      TXD4              : in    STD_ULOGIC;
      TXD5              : in    STD_ULOGIC;
      TXD6              : in    STD_ULOGIC;
      TXD7              : in    STD_ULOGIC;
      SOUT              : out   STD_ULOGIC;
      SS_CLKOUT         : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;

 component TX_SS_8
   generic(
      IN_FREQ  : string  := "100.0";
      MULT     : string  := "1";
      DIV      : string  := "1";
      LOCK_CYC : integer := 2;
      PLL_DLY  : string  := "1");
   port(
      REFCLK            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      TXD4              : in    STD_ULOGIC;
      TXD5              : in    STD_ULOGIC;
      TXD6              : in    STD_ULOGIC;
      TXD7              : in    STD_ULOGIC;
      SOUT              : out   STD_ULOGIC;
      SS_CLKOUT         : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;

component RAMB16X1S
    port(
WE              :in    STD_ULOGIC;
WDATA           :in    STD_ULOGIC;
WCLK            :in    STD_ULOGIC;
AD0             :in    STD_ULOGIC;
AD1             :in    STD_ULOGIC;
AD2             :in    STD_ULOGIC;
AD3             :in    STD_ULOGIC;
RDATA           :out   STD_ULOGIC);
end component;

component RAMB16X1S_1
    port(
WE              :in    STD_ULOGIC;
WDATA           :in    STD_ULOGIC;
WCLK            :in    STD_ULOGIC;
AD0             :in    STD_ULOGIC;
AD1             :in    STD_ULOGIC;
AD2             :in    STD_ULOGIC;
AD3             :in    STD_ULOGIC;
RDATA           :out   STD_ULOGIC);
end component;

component RAMB32X1S
    port(
WE              :in    STD_ULOGIC;
WDATA           :in    STD_ULOGIC;
WCLK            :in    STD_ULOGIC;
AD0             :in    STD_ULOGIC;
AD1             :in    STD_ULOGIC;
AD2             :in    STD_ULOGIC;
AD3             :in    STD_ULOGIC;
AD4             :in    STD_ULOGIC;
RDATA           :out   STD_ULOGIC);
end component;

component RAMB32X1S_1
    port(
WE              :in    STD_ULOGIC;
WDATA           :in    STD_ULOGIC;
WCLK            :in    STD_ULOGIC;
AD0             :in    STD_ULOGIC;
AD1             :in    STD_ULOGIC;
AD2             :in    STD_ULOGIC;
AD3             :in    STD_ULOGIC;
AD4             :in    STD_ULOGIC;
RDATA           :out   STD_ULOGIC);
end component;

component RAMB64X1S
    port(
WE              :in    STD_ULOGIC;
WDATA           :in    STD_ULOGIC;
WCLK            :in    STD_ULOGIC;
AD0             :in    STD_ULOGIC;
AD1             :in    STD_ULOGIC;
AD2             :in    STD_ULOGIC;
AD3             :in    STD_ULOGIC;
AD4             :in    STD_ULOGIC;
AD5             :in    STD_ULOGIC;
RDATA           :out   STD_ULOGIC);
end component;

component RAMB64X1S_1
    port(
WE              :in    STD_ULOGIC;
WDATA           :in    STD_ULOGIC;
WCLK            :in    STD_ULOGIC;
AD0             :in    STD_ULOGIC;
AD1             :in    STD_ULOGIC;
AD2             :in    STD_ULOGIC;
AD3             :in    STD_ULOGIC;
AD4             :in    STD_ULOGIC;
AD5             :in    STD_ULOGIC;
RDATA           :out   STD_ULOGIC);
end component;

component RAMB16X1D
    port(
WE              :in    STD_ULOGIC;
WDATA           :in    STD_ULOGIC;
WCLK            :in    STD_ULOGIC;
AD0             :in    STD_ULOGIC;
AD1             :in    STD_ULOGIC;
AD2             :in    STD_ULOGIC;
AD3             :in    STD_ULOGIC;
DPAD0           :in    STD_ULOGIC;
DPAD1           :in    STD_ULOGIC;
DPAD2           :in    STD_ULOGIC;
DPAD3           :in    STD_ULOGIC;
RDATA           :out   STD_ULOGIC;
DPRDATA         :out   STD_ULOGIC);
end component;

component RAMB16X1D_1
    port(
WE              :in    STD_ULOGIC;
WDATA           :in    STD_ULOGIC;
WCLK            :in    STD_ULOGIC;
AD0             :in    STD_ULOGIC;
AD1             :in    STD_ULOGIC;
AD2             :in    STD_ULOGIC;
AD3             :in    STD_ULOGIC;
DPAD0           :in    STD_ULOGIC;
DPAD1           :in    STD_ULOGIC;
DPAD2           :in    STD_ULOGIC;
DPAD3           :in    STD_ULOGIC;
RDATA           :out   STD_ULOGIC;
DPRDATA         :out   STD_ULOGIC);
end component;

component RAMB32X1D
    port(
WE              :in    STD_ULOGIC;
WDATA           :in    STD_ULOGIC;
WCLK            :in    STD_ULOGIC;
AD0             :in    STD_ULOGIC;
AD1             :in    STD_ULOGIC;
AD2             :in    STD_ULOGIC;
AD3             :in    STD_ULOGIC;
AD4             :in    STD_ULOGIC;
DPAD0           :in    STD_ULOGIC;
DPAD1           :in    STD_ULOGIC;
DPAD2           :in    STD_ULOGIC;
DPAD3           :in    STD_ULOGIC;
DPAD4           :in    STD_ULOGIC;
RDATA           :out   STD_ULOGIC;
DPRDATA         :out   STD_ULOGIC);
end component;

component RAMB32X1D_1
    port(
WE              :in    STD_ULOGIC;
WDATA           :in    STD_ULOGIC;
WCLK            :in    STD_ULOGIC;
AD0             :in    STD_ULOGIC;
AD1             :in    STD_ULOGIC;
AD2             :in    STD_ULOGIC;
AD3             :in    STD_ULOGIC;
AD4             :in    STD_ULOGIC;
DPAD0           :in    STD_ULOGIC;
DPAD1           :in    STD_ULOGIC;
DPAD2           :in    STD_ULOGIC;
DPAD3           :in    STD_ULOGIC;
DPAD4           :in    STD_ULOGIC;
RDATA           :out   STD_ULOGIC;
DPRDATA         :out   STD_ULOGIC);
end component;

component SHIFT8
    port(
SI              :in    STD_ULOGIC;
A0              :in    STD_ULOGIC;
A1              :in    STD_ULOGIC;
A2              :in    STD_ULOGIC;
EN              :in    STD_ULOGIC;
CLK             :in    STD_ULOGIC;
SO              :out   STD_ULOGIC);
end component;

component RAMB256X18DSR
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
CE0             :in    STD_ULOGIC;
CE1             :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
DA8             :inout STD_ULOGIC;
DA9             :inout STD_ULOGIC;
DA10            :inout STD_ULOGIC;
DA11            :inout STD_ULOGIC;
DA12            :inout STD_ULOGIC;
DA13            :inout STD_ULOGIC;
DA14            :inout STD_ULOGIC;
DA15            :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
EDA1            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
DB8             :inout STD_ULOGIC;
DB9             :inout STD_ULOGIC;
DB10            :inout STD_ULOGIC;
DB11            :inout STD_ULOGIC;
DB12            :inout STD_ULOGIC;
DB13            :inout STD_ULOGIC;
DB14            :inout STD_ULOGIC;
DB15            :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC;
EDB1            :inout STD_ULOGIC);
end component;

component RAMB256X18DSR_1
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
CE0             :in    STD_ULOGIC;
CE1             :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
DA8             :inout STD_ULOGIC;
DA9             :inout STD_ULOGIC;
DA10            :inout STD_ULOGIC;
DA11            :inout STD_ULOGIC;
DA12            :inout STD_ULOGIC;
DA13            :inout STD_ULOGIC;
DA14            :inout STD_ULOGIC;
DA15            :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
EDA1            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
DB8             :inout STD_ULOGIC;
DB9             :inout STD_ULOGIC;
DB10            :inout STD_ULOGIC;
DB11            :inout STD_ULOGIC;
DB12            :inout STD_ULOGIC;
DB13            :inout STD_ULOGIC;
DB14            :inout STD_ULOGIC;
DB15            :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC;
EDB1            :inout STD_ULOGIC);
end component;

component RAMB256X18DSF
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
CE0             :in    STD_ULOGIC;
CE1             :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
DA8             :inout STD_ULOGIC;
DA9             :inout STD_ULOGIC;
DA10            :inout STD_ULOGIC;
DA11            :inout STD_ULOGIC;
DA12            :inout STD_ULOGIC;
DA13            :inout STD_ULOGIC;
DA14            :inout STD_ULOGIC;
DA15            :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
EDA1            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
DB8             :inout STD_ULOGIC;
DB9             :inout STD_ULOGIC;
DB10            :inout STD_ULOGIC;
DB11            :inout STD_ULOGIC;
DB12            :inout STD_ULOGIC;
DB13            :inout STD_ULOGIC;
DB14            :inout STD_ULOGIC;
DB15            :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC;
EDB1            :inout STD_ULOGIC);
end component;

component RAMB256X18DSF_1
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
CE0             :in    STD_ULOGIC;
CE1             :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
DA8             :inout STD_ULOGIC;
DA9             :inout STD_ULOGIC;
DA10            :inout STD_ULOGIC;
DA11            :inout STD_ULOGIC;
DA12            :inout STD_ULOGIC;
DA13            :inout STD_ULOGIC;
DA14            :inout STD_ULOGIC;
DA15            :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
EDA1            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
DB8             :inout STD_ULOGIC;
DB9             :inout STD_ULOGIC;
DB10            :inout STD_ULOGIC;
DB11            :inout STD_ULOGIC;
DB12            :inout STD_ULOGIC;
DB13            :inout STD_ULOGIC;
DB14            :inout STD_ULOGIC;
DB15            :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC;
EDB1            :inout STD_ULOGIC);
end component;

component RAMB256X18DAR
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
DA8             :inout STD_ULOGIC;
DA9             :inout STD_ULOGIC;
DA10            :inout STD_ULOGIC;
DA11            :inout STD_ULOGIC;
DA12            :inout STD_ULOGIC;
DA13            :inout STD_ULOGIC;
DA14            :inout STD_ULOGIC;
DA15            :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
EDA1            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
DB8             :inout STD_ULOGIC;
DB9             :inout STD_ULOGIC;
DB10            :inout STD_ULOGIC;
DB11            :inout STD_ULOGIC;
DB12            :inout STD_ULOGIC;
DB13            :inout STD_ULOGIC;
DB14            :inout STD_ULOGIC;
DB15            :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC;
EDB1            :inout STD_ULOGIC);
end component;

component RAMB256X18DAR_1
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
DA8             :inout STD_ULOGIC;
DA9             :inout STD_ULOGIC;
DA10            :inout STD_ULOGIC;
DA11            :inout STD_ULOGIC;
DA12            :inout STD_ULOGIC;
DA13            :inout STD_ULOGIC;
DA14            :inout STD_ULOGIC;
DA15            :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
EDA1            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
DB8             :inout STD_ULOGIC;
DB9             :inout STD_ULOGIC;
DB10            :inout STD_ULOGIC;
DB11            :inout STD_ULOGIC;
DB12            :inout STD_ULOGIC;
DB13            :inout STD_ULOGIC;
DB14            :inout STD_ULOGIC;
DB15            :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC;
EDB1            :inout STD_ULOGIC);
end component;

component RAMB256X18DAF
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
DA8             :inout STD_ULOGIC;
DA9             :inout STD_ULOGIC;
DA10            :inout STD_ULOGIC;
DA11            :inout STD_ULOGIC;
DA12            :inout STD_ULOGIC;
DA13            :inout STD_ULOGIC;
DA14            :inout STD_ULOGIC;
DA15            :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
EDA1            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
DB8             :inout STD_ULOGIC;
DB9             :inout STD_ULOGIC;
DB10            :inout STD_ULOGIC;
DB11            :inout STD_ULOGIC;
DB12            :inout STD_ULOGIC;
DB13            :inout STD_ULOGIC;
DB14            :inout STD_ULOGIC;
DB15            :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC;
EDB1            :inout STD_ULOGIC);
end component;

component RAMB256X18DAF_1
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
DA8             :inout STD_ULOGIC;
DA9             :inout STD_ULOGIC;
DA10            :inout STD_ULOGIC;
DA11            :inout STD_ULOGIC;
DA12            :inout STD_ULOGIC;
DA13            :inout STD_ULOGIC;
DA14            :inout STD_ULOGIC;
DA15            :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
EDA1            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
DB8             :inout STD_ULOGIC;
DB9             :inout STD_ULOGIC;
DB10            :inout STD_ULOGIC;
DB11            :inout STD_ULOGIC;
DB12            :inout STD_ULOGIC;
DB13            :inout STD_ULOGIC;
DB14            :inout STD_ULOGIC;
DB15            :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC;
EDB1            :inout STD_ULOGIC);
end component;

component RAMB512X9DSR
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
CE0             :in    STD_ULOGIC;
CE1             :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDA8           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
ADDB8           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC);
end component;

component RAMB512X9DSR_1
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
CE0             :in    STD_ULOGIC;
CE1             :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDA8           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
ADDB8           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC);
end component;

component RAMB512X9DSF
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
CE0             :in    STD_ULOGIC;
CE1             :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDA8           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
ADDB8           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC);
end component;

component RAMB512X9DSF_1
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
CE0             :in    STD_ULOGIC;
CE1             :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDA8           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
ADDB8           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC);
end component;

component RAMB512X9DAR
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDA8           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
ADDB8           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC);
end component;

component RAMB512X9DAR_1
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDA8           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
ADDB8           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC);
end component;

component RAMB512X9DAF
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDA8           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
ADDB8           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC);
end component;

component RAMB512X9DAF_1
    port(
WEN0            :in    STD_ULOGIC;
WEN1            :in    STD_ULOGIC;
RWCLK0          :in    STD_ULOGIC;
RWCLK1          :in    STD_ULOGIC;
OE0             :in    STD_ULOGIC;
OE1             :in    STD_ULOGIC;
ADDA0           :in    STD_ULOGIC;
ADDA1           :in    STD_ULOGIC;
ADDA2           :in    STD_ULOGIC;
ADDA3           :in    STD_ULOGIC;
ADDA4           :in    STD_ULOGIC;
ADDA5           :in    STD_ULOGIC;
ADDA6           :in    STD_ULOGIC;
ADDA7           :in    STD_ULOGIC;
ADDA8           :in    STD_ULOGIC;
ADDB0           :in    STD_ULOGIC;
ADDB1           :in    STD_ULOGIC;
ADDB2           :in    STD_ULOGIC;
ADDB3           :in    STD_ULOGIC;
ADDB4           :in    STD_ULOGIC;
ADDB5           :in    STD_ULOGIC;
ADDB6           :in    STD_ULOGIC;
ADDB7           :in    STD_ULOGIC;
ADDB8           :in    STD_ULOGIC;
DA0             :inout STD_ULOGIC;
DA1             :inout STD_ULOGIC;
DA2             :inout STD_ULOGIC;
DA3             :inout STD_ULOGIC;
DA4             :inout STD_ULOGIC;
DA5             :inout STD_ULOGIC;
DA6             :inout STD_ULOGIC;
DA7             :inout STD_ULOGIC;
EDA0            :inout STD_ULOGIC;
DB0             :inout STD_ULOGIC;
DB1             :inout STD_ULOGIC;
DB2             :inout STD_ULOGIC;
DB3             :inout STD_ULOGIC;
DB4             :inout STD_ULOGIC;
DB5             :inout STD_ULOGIC;
DB6             :inout STD_ULOGIC;
DB7             :inout STD_ULOGIC;
EDB0            :inout STD_ULOGIC);
end component;

component RAMB256X18SSR
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
CE              :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
D8              :inout STD_ULOGIC;
D9              :inout STD_ULOGIC;
D10             :inout STD_ULOGIC;
D11             :inout STD_ULOGIC;
D12             :inout STD_ULOGIC;
D13             :inout STD_ULOGIC;
D14             :inout STD_ULOGIC;
D15             :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC;
ED1             :inout STD_ULOGIC);
end component;

component RAMB256X18SSR_1
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
CE              :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
D8              :inout STD_ULOGIC;
D9              :inout STD_ULOGIC;
D10             :inout STD_ULOGIC;
D11             :inout STD_ULOGIC;
D12             :inout STD_ULOGIC;
D13             :inout STD_ULOGIC;
D14             :inout STD_ULOGIC;
D15             :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC;
ED1             :inout STD_ULOGIC);
end component;

component RAMB256X18SSF
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
CE              :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
D8              :inout STD_ULOGIC;
D9              :inout STD_ULOGIC;
D10             :inout STD_ULOGIC;
D11             :inout STD_ULOGIC;
D12             :inout STD_ULOGIC;
D13             :inout STD_ULOGIC;
D14             :inout STD_ULOGIC;
D15             :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC;
ED1             :inout STD_ULOGIC);
end component;

component RAMB256X18SSF_1
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
CE              :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
D8              :inout STD_ULOGIC;
D9              :inout STD_ULOGIC;
D10             :inout STD_ULOGIC;
D11             :inout STD_ULOGIC;
D12             :inout STD_ULOGIC;
D13             :inout STD_ULOGIC;
D14             :inout STD_ULOGIC;
D15             :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC;
ED1             :inout STD_ULOGIC);
end component;

component RAMB256X18SAR
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
D8              :inout STD_ULOGIC;
D9              :inout STD_ULOGIC;
D10             :inout STD_ULOGIC;
D11             :inout STD_ULOGIC;
D12             :inout STD_ULOGIC;
D13             :inout STD_ULOGIC;
D14             :inout STD_ULOGIC;
D15             :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC;
ED1             :inout STD_ULOGIC);
end component;

component RAMB256X18SAR_1
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
D8              :inout STD_ULOGIC;
D9              :inout STD_ULOGIC;
D10             :inout STD_ULOGIC;
D11             :inout STD_ULOGIC;
D12             :inout STD_ULOGIC;
D13             :inout STD_ULOGIC;
D14             :inout STD_ULOGIC;
D15             :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC;
ED1             :inout STD_ULOGIC);
end component;

component RAMB256X18SAF
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
D8              :inout STD_ULOGIC;
D9              :inout STD_ULOGIC;
D10             :inout STD_ULOGIC;
D11             :inout STD_ULOGIC;
D12             :inout STD_ULOGIC;
D13             :inout STD_ULOGIC;
D14             :inout STD_ULOGIC;
D15             :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC;
ED1             :inout STD_ULOGIC);
end component;

component RAMB256X18SAF_1
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
D8              :inout STD_ULOGIC;
D9              :inout STD_ULOGIC;
D10             :inout STD_ULOGIC;
D11             :inout STD_ULOGIC;
D12             :inout STD_ULOGIC;
D13             :inout STD_ULOGIC;
D14             :inout STD_ULOGIC;
D15             :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC;
ED1             :inout STD_ULOGIC);
end component;

component RAMB512X9SSR
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
CE              :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
ADD8            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC);
end component;

component RAMB512X9SSR_1
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
CE              :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
ADD8            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC);
end component;

component RAMB512X9SSF
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
CE              :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
ADD8            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC);
end component;

component RAMB512X9SSF_1
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
CE              :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
ADD8            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC);
end component;

component RAMB512X9SAR
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
ADD8            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC);
end component;

component RAMB512X9SAR_1
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
ADD8            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC);
end component;

component RAMB512X9SAF
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
ADD8            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC);
end component;

component RAMB512X9SAF_1
    port(
WEN             :in    STD_ULOGIC;
RWCLK           :in    STD_ULOGIC;
OE              :in    STD_ULOGIC;
ADD0            :in    STD_ULOGIC;
ADD1            :in    STD_ULOGIC;
ADD2            :in    STD_ULOGIC;
ADD3            :in    STD_ULOGIC;
ADD4            :in    STD_ULOGIC;
ADD5            :in    STD_ULOGIC;
ADD6            :in    STD_ULOGIC;
ADD7            :in    STD_ULOGIC;
ADD8            :in    STD_ULOGIC;
D0              :inout STD_ULOGIC;
D1              :inout STD_ULOGIC;
D2              :inout STD_ULOGIC;
D3              :inout STD_ULOGIC;
D4              :inout STD_ULOGIC;
D5              :inout STD_ULOGIC;
D6              :inout STD_ULOGIC;
D7              :inout STD_ULOGIC;
ED0             :inout STD_ULOGIC);
end component;

end COMPONENTS;
