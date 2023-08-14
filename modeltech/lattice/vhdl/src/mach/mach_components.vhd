
----------------------------------------------------------------
-- 
-- FILE CONTENTS:    MACH VITAL Component Package
-- DATE CREATED :    Wen Sept  15 1998
-- 
-- LIBRARY      :    MACH
-- REVISION     :    1.0 
-- TIME SCALE   :    1 ns
-- LOGIC SYSTEM :    IEEE-1164
-- NOTES        :    
-- HISTORY      :
-- 
----------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;

package Components is

constant DefaultTimingChecksOn : Boolean := True;
constant DefaultXon : Boolean := True;
constant DefaultMsgOn : Boolean := True;

----- Component AND2 -----
component AND2
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND3 -----
component AND3
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND4 -----
component AND4
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND5 -----
component AND5
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND6 -----
component AND6
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND7 -----
component AND7
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND8 -----
component AND8
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


component BI_DIR
   port(
      I0                             :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      IO                             :	inout STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component BUFF -----
component BUFF
   port(
      I0                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component BUFTH -----
component BUFTH
   port(
      I0                             :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;



----- Component BUFTL -----
component BUFTL
   port(
      I0                             :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component CLKI -----
component CLKI
   port(
      PAD                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component DFF -----
component DFF
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFC -----
component DFFC
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFCR -----
component DFFCR
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFCRH -----
component DFFCRH
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFCRS -----
component DFFCRS
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFCRSH -----
component DFFCRSH
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFCS -----
component DFFCS
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFCSH -----
component DFFCSH
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFR -----
component DFFR
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFRH -----
component DFFRH
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFRS -----
component DFFRS
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFRSH -----
component DFFRSH
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFS -----
component DFFS
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFSH -----
component DFFSH
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DLAT -----
component DLAT
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DLATR -----
component DLATR
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DLATRH -----
component DLATRH
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DLATRS -----
component DLATRS
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DLATRSH -----
component DLATRSH
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DLATS -----
component DLATS
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DLATSH -----
component DLATSH
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component GND -----
component GND
   port(
      X                              :	out   STD_ULOGIC := '0');
end component;


----- Component IBUF -----
component IBUF
   port(
      I0                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component INV -----
component INV
   port(
      I0                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component INVTH -----
component INVTH
   port(
      I0                             :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component INVTL -----
component INVTL
   port(
      I0                             :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component NAN2 -----
component NAN2
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component NAN3 -----
component NAN3
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component NAN4 -----
component NAN4
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component NAN5 -----
component NAN5
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component NAN6 -----
component NAN6
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component NAN7 -----
component NAN7
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component NAN8 -----
component NAN8
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component NOR2 -----
component NOR2
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component NOR3 -----
component NOR3
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component NOR4 -----
component NOR4
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component NOR5 -----
component NOR5
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component NOR6 -----
component NOR6
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component NOR7 -----
component NOR7
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component NOR8 -----
component NOR8
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component OBUF -----
component OBUF
   port(
      I0                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component OR2 -----
component OR2
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component OR3 -----
component OR3
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component OR4 -----
component OR4
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component OR5 -----
component OR5
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component OR6 -----
component OR6
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component OR7 -----
component OR7
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component OR8 -----
component OR8
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;



----- Component TFF -----
component TFF
   port(
      T                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component TFFR -----
component TFFR
   port(
      T                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component TFFRH -----
component TFFRH
   port(
      T                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component TFFRS -----
component TFFRS
   port(
      T                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component TFFRSH -----
component TFFRSH
   port(
      T                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component TFFS -----
component TFFS
   port(
      T                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component TFFSH -----
component TFFSH
   port(
      T                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component VCC -----
component VCC
   port(
      X                              :	out   STD_ULOGIC := '1');
end component;


----- Component XOR2 -----
component XOR2
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;

----- Component XORSOFT -----
component XORSOFT
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


end Components;

---- end of VITAL components library ----
