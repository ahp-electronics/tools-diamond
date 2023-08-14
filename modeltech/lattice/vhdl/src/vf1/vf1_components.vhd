
----------------------------------------------------------------
-- 
-- FILE CONTENTS:    VITAL Component Package
-- DATE CREATED :    THUR OCT  6 1998
-- 
-- LIBRARY      :    VF1
-- REVISION     :    Rev 1.1 
-- TECHNOLOGY   :    cmos
-- TIME SCALE   :    1 ns
-- LOGIC SYSTEM :    IEEE-1164
-- NOTES        :    
-- HISTORY      :
-- Removed REN pin for RB_MS 
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


----- Component AND9 -----
component AND9
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      I8                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND10 -----
component AND10
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      I8                             :	in    STD_ULOGIC;
      I9                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND11 -----
component AND11
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      I8                             :	in    STD_ULOGIC;
      I9                             :	in    STD_ULOGIC;
      I10                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND12 -----
component AND12
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      I8                             :	in    STD_ULOGIC;
      I9                             :	in    STD_ULOGIC;
      I10                            :	in    STD_ULOGIC;
      I11                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND13 -----
component AND13
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      I8                             :	in    STD_ULOGIC;
      I9                             :	in    STD_ULOGIC;
      I10                            :	in    STD_ULOGIC;
      I11                            :	in    STD_ULOGIC;
      I12                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND14 -----
component AND14
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      I8                             :	in    STD_ULOGIC;
      I9                             :	in    STD_ULOGIC;
      I10                            :	in    STD_ULOGIC;
      I11                            :	in    STD_ULOGIC;
      I12                            :	in    STD_ULOGIC;
      I13                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND15 -----
component AND15
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      I8                             :	in    STD_ULOGIC;
      I9                             :	in    STD_ULOGIC;
      I10                            :	in    STD_ULOGIC;
      I11                            :	in    STD_ULOGIC;
      I12                            :	in    STD_ULOGIC;
      I13                            :	in    STD_ULOGIC;
      I14                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND16 -----
component AND16
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      I8                             :	in    STD_ULOGIC;
      I9                             :	in    STD_ULOGIC;
      I10                            :	in    STD_ULOGIC;
      I11                            :	in    STD_ULOGIC;
      I12                            :	in    STD_ULOGIC;
      I13                            :	in    STD_ULOGIC;
      I14                            :	in    STD_ULOGIC;
      I15                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND17 -----
component AND17
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      I8                             :	in    STD_ULOGIC;
      I9                             :	in    STD_ULOGIC;
      I10                            :	in    STD_ULOGIC;
      I11                            :	in    STD_ULOGIC;
      I12                            :	in    STD_ULOGIC;
      I13                            :	in    STD_ULOGIC;
      I14                            :	in    STD_ULOGIC;
      I15                            :	in    STD_ULOGIC;
      I16                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND18 -----
component AND18
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      I8                             :	in    STD_ULOGIC;
      I9                             :	in    STD_ULOGIC;
      I10                            :	in    STD_ULOGIC;
      I11                            :	in    STD_ULOGIC;
      I12                            :	in    STD_ULOGIC;
      I13                            :	in    STD_ULOGIC;
      I14                            :	in    STD_ULOGIC;
      I15                            :	in    STD_ULOGIC;
      I16                            :	in    STD_ULOGIC;
      I17                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND19 -----
component AND19
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      I8                             :	in    STD_ULOGIC;
      I9                             :	in    STD_ULOGIC;
      I10                            :	in    STD_ULOGIC;
      I11                            :	in    STD_ULOGIC;
      I12                            :	in    STD_ULOGIC;
      I13                            :	in    STD_ULOGIC;
      I14                            :	in    STD_ULOGIC;
      I15                            :	in    STD_ULOGIC;
      I16                            :	in    STD_ULOGIC;
      I17                            :	in    STD_ULOGIC;
      I18                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AND20 -----
component AND20
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      I8                             :	in    STD_ULOGIC;
      I9                             :	in    STD_ULOGIC;
      I10                            :	in    STD_ULOGIC;
      I11                            :	in    STD_ULOGIC;
      I12                            :	in    STD_ULOGIC;
      I13                            :	in    STD_ULOGIC;
      I14                            :	in    STD_ULOGIC;
      I15                            :	in    STD_ULOGIC;
      I16                            :	in    STD_ULOGIC;
      I17                            :	in    STD_ULOGIC;
      I18                            :	in    STD_ULOGIC;
      I19                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AO21 -----
component AO21
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AO221 -----
component AO221
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AO321 -----
component AO321
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component AS_LSB -----
component AS_LSB
   port(
      A0                             :	in    STD_ULOGIC;
      B0                             :	in    STD_ULOGIC;
      CIN                            :	in    STD_ULOGIC;
      AS                             :	in    STD_ULOGIC;
      S0                             :	out   STD_ULOGIC;
      COUT                           :	out   STD_ULOGIC);
end component;


----- Component BIPAD -----
component BIPAD
   port(
      BIPAD                          :	inout STD_ULOGIC);
end component;


----- Component BI_DIR -----
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


----- Component BUFTI -----
component BUFTI
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


----- Component CCU_ABS -----
component CCU_ABS
   port(
      D                              :	in    STD_ULOGIC;
      PN                             :	in    STD_ULOGIC;
      CIN                            :	in    STD_ULOGIC;
      S0                             :	out   STD_ULOGIC;
      COUT                           :	out   STD_ULOGIC);
end component;


----- Component CCU_AGB -----
component CCU_AGB
   port(
      A0                             :	in    STD_ULOGIC;
      B0                             :	in    STD_ULOGIC;
      CIN                            :	in    STD_ULOGIC;
      COUT                           :	out   STD_ULOGIC);
end component;


----- Component CCU_AS -----
component CCU_AS
   port(
      A0                             :	in    STD_ULOGIC;
      B0                             :	in    STD_ULOGIC;
      CIN                            :	in    STD_ULOGIC;
      AS                             :	in    STD_ULOGIC;
      S0                             :	out   STD_ULOGIC;
      COUT                           :	out   STD_ULOGIC);
end component;


----- Component CCU_DCP -----
component CCU_DCP
   port(
      D                              :	in    STD_ULOGIC;
      LOAD                           :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CIN                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      COUT                           :	out   STD_ULOGIC);
end component;


----- Component CCU_UCP -----
component CCU_UCP
   port(
      D                              :	in    STD_ULOGIC;
      LOAD                           :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CIN                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      COUT                           :	out   STD_ULOGIC);
end component;


----- Component CCU_UDC -----
component CCU_UDC
   port(
      UD                             :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CIN                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      COUT                           :	out   STD_ULOGIC);
end component;


----- Component CLKI -----
component CLKI
   port(
      PAD                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component COM_UDCP -----
component COM_UDCP
   port(
      D                              :	in    STD_ULOGIC;
      LOAD                           :	in    STD_ULOGIC;
      CNTEN                          :	in    STD_ULOGIC;
      A                              :	in    STD_ULOGIC;
      UD                             :	in    STD_ULOGIC;
      CIN                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC;
      COUT                           :	out   STD_ULOGIC);
end component;


----- Component DEMUX2 -----
component DEMUX2
   port(
      EN                             :	in    STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      O0                             :	out   STD_ULOGIC;
      O1                             :	out   STD_ULOGIC);
end component;


----- Component DEMUX4 -----
component DEMUX4
   port(
      EN                             :	in    STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC;
      O0                             :	out   STD_ULOGIC;
      O1                             :	out   STD_ULOGIC;
      O2                             :	out   STD_ULOGIC;
      O3                             :	out   STD_ULOGIC);
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


----- Component DFFCRSS -----
component DFFCRSS
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFCRSSH -----
component DFFCRSSH
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


----- Component DFFRSS -----
component DFFRSS
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component DFFRSSH -----
component DFFRSSH
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


----- Component ENOR -----
component ENOR
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component EQ22 -----
component EQ22
   port(
      A0                             :	in    STD_ULOGIC;
      A1                             :	in    STD_ULOGIC;
      B0                             :	in    STD_ULOGIC;
      B1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component GND -----
component GND
   port(
      X                              :	out   STD_ULOGIC := '0');
end component;


----- Component GSRBUF -----
component GSRBUF
   port(
      SRI                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
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


----- Component IPAD -----
component IPAD
   port(
      IPAD                           :	in    STD_ULOGIC);
end component;


----- Component JKFF -----
component JKFF
   port(
      J                              :  in    STD_ULOGIC;
      K                              :  in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component JKFFR -----
component JKFFR
   port(
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component JKFFRH -----
component JKFFRH
   port(
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component JKFFRS -----
component JKFFRS
   port(
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component JKFFRSH -----
component JKFFRSH
   port(
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component JKFFRSS -----
component JKFFRSS
   port(
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component JKFFRSSH -----
component JKFFRSSH
   port(
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component JKFFS -----
component JKFFS
   port(
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component JKFFSH -----
component JKFFSH
   port(
      J                              :	in    STD_ULOGIC;
      K                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component JTAG -----
component JTAG
   port(
      TDI                            :	in    STD_ULOGIC;
      TCLK                           :	in    STD_ULOGIC;
      TMOD                           :	in    STD_ULOGIC;
      TDO                            :	out   STD_ULOGIC);
end component;


----- Component LI -----
component LI
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component LIR -----
component LIR
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component LIS -----
component LIS
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component MAJOR3 -----
component MAJOR3
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component MUX2 -----
component MUX2
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component MUX4 -----
component MUX4
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      S0                             :	in    STD_ULOGIC;
      S1                             :	in    STD_ULOGIC;
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


----- Component NEQ22 -----
component NEQ22
   port(
      A0                             :	in    STD_ULOGIC;
      A1                             :	in    STD_ULOGIC;
      B0                             :	in    STD_ULOGIC;
      B1                             :	in    STD_ULOGIC;
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


----- Component OA21 -----
component OA21
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component OA221 -----
component OA221
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component OA321 -----
component OA321
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component OBUF -----
component OBUF
   port(
      I0                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component OPAD -----
component OPAD
   port(
      OPAD                           :	out   STD_ULOGIC);
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


----- Component PUC -----
component PUC
end component;


----- Component RBC -----
component RBC
end component;


----- Component RB_DA -----
component RB_DA
   port(
      RDATA3                       :	out   STD_ULOGIC;
      RDATA2                       :	out   STD_ULOGIC;
      RDATA1                       :	out   STD_ULOGIC;
      RDATA0                       :	out   STD_ULOGIC;
      WRDATA3                      :	inout STD_ULOGIC;
      WRDATA2                      :	inout STD_ULOGIC;
      WRDATA1                      :	inout STD_ULOGIC;
      WRDATA0                      :	inout STD_ULOGIC;
      WRAD4                        :	in    STD_ULOGIC;
      WRAD3                        :	in    STD_ULOGIC;
      WRAD2                        :	in    STD_ULOGIC;
      WRAD1                        :	in    STD_ULOGIC;
      WRAD0                        :	in    STD_ULOGIC;
      RAD4                         :	in    STD_ULOGIC;
      RAD3                         :	in    STD_ULOGIC;
      RAD2                         :	in    STD_ULOGIC;
      RAD1                         :	in    STD_ULOGIC;
      RAD0                         :	in    STD_ULOGIC;
      WEN                            :	in    STD_ULOGIC;
      REN                            :	in    STD_ULOGIC;
      WRCLK                          :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC);
end component;


----- Component RB_DAR -----
component RB_DAR
   port(
      RDATA3                       :	out   STD_ULOGIC;
      RDATA2                       :	out   STD_ULOGIC;
      RDATA1                       :	out   STD_ULOGIC;
      RDATA0                       :	out   STD_ULOGIC;
      WRDATA3                      :	inout STD_ULOGIC;
      WRDATA2                      :	inout STD_ULOGIC;
      WRDATA1                      :	inout STD_ULOGIC;
      WRDATA0                      :	inout STD_ULOGIC;
      WRAD4                        :	in    STD_ULOGIC;
      WRAD3                        :	in    STD_ULOGIC;
      WRAD2                        :	in    STD_ULOGIC;
      WRAD1                        :	in    STD_ULOGIC;
      WRAD0                        :	in    STD_ULOGIC;
      RAD4                         :	in    STD_ULOGIC;
      RAD3                         :	in    STD_ULOGIC;
      RAD2                         :	in    STD_ULOGIC;
      RAD1                         :	in    STD_ULOGIC;
      RAD0                         :	in    STD_ULOGIC;
      WEN                            :	in    STD_ULOGIC;
      REN                            :	in    STD_ULOGIC;
      WRCLK                          :	in    STD_ULOGIC;
      ADRCLK                         :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC);
end component;


----- Component RB_DS -----
component RB_DS
   port(
      WRDATA3                      :	inout STD_ULOGIC;
      WRDATA2                      :	inout STD_ULOGIC;
      WRDATA1                      :	inout STD_ULOGIC;
      WRDATA0                      :	inout STD_ULOGIC;
      RDATA3                       :	out   STD_ULOGIC;
      RDATA2                       :	out   STD_ULOGIC;
      RDATA1                       :	out   STD_ULOGIC;
      RDATA0                       :	out   STD_ULOGIC;
      WRAD4                        :	in    STD_ULOGIC;
      WRAD3                        :	in    STD_ULOGIC;
      WRAD2                        :	in    STD_ULOGIC;
      WRAD1                        :	in    STD_ULOGIC;
      WRAD0                        :	in    STD_ULOGIC;
      RAD4                         :	in    STD_ULOGIC;
      RAD3                         :	in    STD_ULOGIC;
      RAD2                         :	in    STD_ULOGIC;
      RAD1                         :	in    STD_ULOGIC;
      RAD0                         :	in    STD_ULOGIC;
      WEN                            :	in    STD_ULOGIC;
      REN                            :	in    STD_ULOGIC;
      RCLK                           :	in    STD_ULOGIC;
      WRCLK                          :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC);
end component;


----- Component RB_MA -----
component RB_MA
   port(
      WRDATA3                      :	inout STD_ULOGIC;
      WRDATA2                      :	inout STD_ULOGIC;
      WRDATA1                      :	inout STD_ULOGIC;
      WRDATA0                      :	inout STD_ULOGIC;
      WRAD4                        :	in    STD_ULOGIC;
      WRAD3                        :	in    STD_ULOGIC;
      WRAD2                        :	in    STD_ULOGIC;
      WRAD1                        :	in    STD_ULOGIC;
      WRAD0                        :	in    STD_ULOGIC;
      WEN                            :	in    STD_ULOGIC;
      WRCLK                           :	in    STD_ULOGIC;
      ADRCLK                         :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC);
end component;

----- Component RB_MAR -----
component RB_MAR
   port(
      WRDATA3                      :  inout STD_ULOGIC;
      WRDATA2                      :  inout STD_ULOGIC;
      WRDATA1                      :  inout STD_ULOGIC;
      WRDATA0                      :  inout STD_ULOGIC;
      WRAD4                        :  in    STD_ULOGIC;
      WRAD3                        :  in    STD_ULOGIC;
      WRAD2                        :  in    STD_ULOGIC;
      WRAD1                        :  in    STD_ULOGIC;
      WRAD0                        :  in    STD_ULOGIC;
      WEN                            :  in    STD_ULOGIC;
      WRCLK                           :  in    STD_ULOGIC;
      ADRCLK                         :  in    STD_ULOGIC;
      OE                             :  in    STD_ULOGIC);
end component;

----- Component RB_MS -----
component RB_MS
   port(
      WRDATA3                      :	inout STD_ULOGIC;
      WRDATA2                      :	inout STD_ULOGIC;
      WRDATA1                      :	inout STD_ULOGIC;
      WRDATA0                      :	inout STD_ULOGIC;
      WRAD4                        :	in    STD_ULOGIC;
      WRAD3                        :	in    STD_ULOGIC;
      WRAD2                        :	in    STD_ULOGIC;
      WRAD1                        :	in    STD_ULOGIC;
      WRAD0                        :	in    STD_ULOGIC;
      WEN                            :	in    STD_ULOGIC;
      REN                            :	in    STD_ULOGIC;
      WRCLK                          :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC);
end component;


----- Component RB_SA -----
component RB_SA
   port(
      RDATA3                       :	out   STD_ULOGIC;
      RDATA2                       :	out   STD_ULOGIC;
      RDATA1                       :	out   STD_ULOGIC;
      RDATA0                       :	out   STD_ULOGIC;
      WEN                            :	in    STD_ULOGIC;
      REN                            :	in    STD_ULOGIC;
      WCLK                           :	in    STD_ULOGIC;
      WAD4                         :	in    STD_ULOGIC;
      WAD3                         :	in    STD_ULOGIC;
      WAD2                         :	in    STD_ULOGIC;
      WAD1                         :	in    STD_ULOGIC;
      WAD0                         :	in    STD_ULOGIC;
      RAD4                         :	in    STD_ULOGIC;
      RAD3                         :	in    STD_ULOGIC;
      RAD2                         :	in    STD_ULOGIC;
      RAD1                         :	in    STD_ULOGIC;
      RAD0                         :	in    STD_ULOGIC;
      WDATA3                       :	in    STD_ULOGIC;
      WDATA2                       :	in    STD_ULOGIC;
      WDATA1                       :	in    STD_ULOGIC;
      WDATA0                       :	in    STD_ULOGIC);
end component;


----- Component RB_SAR -----
component RB_SAR
   port(
      RDATA3                       :	out   STD_ULOGIC;
      RDATA2                       :	out   STD_ULOGIC;
      RDATA1                       :	out   STD_ULOGIC;
      RDATA0                       :	out   STD_ULOGIC;
      WDATA3                       :	in    STD_ULOGIC;
      WDATA2                       :	in    STD_ULOGIC;
      WDATA1                       :	in    STD_ULOGIC;
      WDATA0                       :	in    STD_ULOGIC;
      WAD4                         :	in    STD_ULOGIC;
      WAD3                         :	in    STD_ULOGIC;
      WAD2                         :	in    STD_ULOGIC;
      WAD1                         :	in    STD_ULOGIC;
      WAD0                         :	in    STD_ULOGIC;
      RAD4                         :	in    STD_ULOGIC;
      RAD3                         :	in    STD_ULOGIC;
      RAD2                         :	in    STD_ULOGIC;
      RAD1                         :	in    STD_ULOGIC;
      RAD0                         :	in    STD_ULOGIC;
      WEN                            :	in    STD_ULOGIC;
      REN                            :	in    STD_ULOGIC;
      WCLK                           :	in    STD_ULOGIC;
      ADRCLK                         :	in    STD_ULOGIC);
end component;


----- Component RB_SS -----
component RB_SS
   port(
      RAD4                         :	in    STD_ULOGIC;
      RAD3                         :	in    STD_ULOGIC;
      RAD2                         :	in    STD_ULOGIC;
      RAD1                         :	in    STD_ULOGIC;
      RAD0                         :	in    STD_ULOGIC;
      RDATA3                       :	out   STD_ULOGIC;
      RDATA2                       :	out   STD_ULOGIC;
      RDATA1                       :	out   STD_ULOGIC;
      RDATA0                       :	out   STD_ULOGIC;
      WAD4                         :	in    STD_ULOGIC;
      WAD3                         :	in    STD_ULOGIC;
      WAD2                         :	in    STD_ULOGIC;
      WAD1                         :	in    STD_ULOGIC;
      WAD0                         :	in    STD_ULOGIC;
      WDATA3                       :	in    STD_ULOGIC;
      WDATA2                       :	in    STD_ULOGIC;
      WDATA1                       :	in    STD_ULOGIC;
      WDATA0                       :	in    STD_ULOGIC;
      WEN                            :	in    STD_ULOGIC;
      REN                            :	in    STD_ULOGIC;
      RCLK                           :	in    STD_ULOGIC;
      WCLK                           :	in    STD_ULOGIC);
end component;


----- Component RI -----
component RI
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component RIR -----
component RIR
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component RIS -----
component RIS
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component ROLI -----
component ROLI
   port(
      D                              :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      IO                             :	inout STD_ULOGIC;
      O                              :	out   STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component ROLIR -----
component ROLIR
   port(
      D                              :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      IO                             :	inout STD_ULOGIC;
      O                              :	out   STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component ROLIS -----
component ROLIS
   port(
      D                              :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      IO                             :	inout STD_ULOGIC;
      O                              :	out   STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component RORI -----
component RORI
   port(
      D                              :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      CLKO                           :	in    STD_ULOGIC;
      CLKI                           :	in    STD_ULOGIC;
      IO                             :	inout STD_ULOGIC;
      O                              :	out   STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component RORIR -----
component RORIR
   port(
      D                              :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      CLKI                           :	in    STD_ULOGIC;
      CLKO                           :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      IO                             :	inout STD_ULOGIC;
      O                              :	out   STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component RORIS -----
component RORIS
   port(
      D                              :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      CLKO                           :	in    STD_ULOGIC;
      CLKI                           :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      IO                             :	inout STD_ULOGIC;
      O                              :	out   STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component ROT -----
component ROT
   port(
      D                              :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component ROTR -----
component ROTR
   port(
      D                              :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component ROTS -----
component ROTS
   port(
      D                              :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component RSFF -----
component RSFF
   port(
      RE                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component RSFFR -----
component RSFFR
   port(
      RE                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component RSFFRH -----
component RSFFRH
   port(
      RE                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component RSFFRS -----
component RSFFRS
   port(
      RE                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component RSFFRSH -----
component RSFFRSH
   port(
      RE                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component RSFFRSS -----
component RSFFRSS
   port(
      RE                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component RSFFRSSH -----
component RSFFRSSH
   port(
      RE                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component RSFFS -----
component RSFFS
   port(
      RE                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component RSFFSH -----
component RSFFSH
   port(
      RE                             :	in    STD_ULOGIC;
      SE                             :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component R_DA -----
component R_DA
   port(
      RDATA13                      :	out   STD_ULOGIC;
      RDATA12                      :	out   STD_ULOGIC;
      RDATA11                      :	out   STD_ULOGIC;
      RDATA10                      :	out   STD_ULOGIC;
      RDATA23                      :	out   STD_ULOGIC;
      RDATA22                      :	out   STD_ULOGIC;
      RDATA21                      :	out   STD_ULOGIC;
      RDATA20                      :	out   STD_ULOGIC;
      RAD14                        :	in    STD_ULOGIC;
      RAD13                        :	in    STD_ULOGIC;
      RAD12                        :	in    STD_ULOGIC;
      RAD11                        :	in    STD_ULOGIC;
      RAD10                        :	in    STD_ULOGIC;
      RAD24                        :	in    STD_ULOGIC;
      RAD23                        :	in    STD_ULOGIC;
      RAD22                        :	in    STD_ULOGIC;
      RAD21                        :	in    STD_ULOGIC;
      RAD20                        :	in    STD_ULOGIC;
      REN                            :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC);
end component;


----- Component R_DAR -----
component R_DAR
   port(
      RDATA13                      :  out   STD_ULOGIC;
      RDATA12                      :  out   STD_ULOGIC;
      RDATA11                      :  out   STD_ULOGIC;
      RDATA10                      :	out   STD_ULOGIC;
      RDATA23                      :	out   STD_ULOGIC;
      RDATA22                      :	out   STD_ULOGIC;
      RDATA21                      :	out   STD_ULOGIC;
      RDATA20                      :	out   STD_ULOGIC;
      RAD14                        :	in    STD_ULOGIC;
      RAD13                        :	in    STD_ULOGIC;
      RAD12                        :	in    STD_ULOGIC;
      RAD11                        :	in    STD_ULOGIC;
      RAD10                        :	in    STD_ULOGIC;
      RAD24                        :	in    STD_ULOGIC;
      RAD23                        :	in    STD_ULOGIC;
      RAD22                        :	in    STD_ULOGIC;
      RAD21                        :	in    STD_ULOGIC;
      RAD20                        :	in    STD_ULOGIC;
      REN                            :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      ADRCLK                         :	in    STD_ULOGIC);
end component;


----- Component R_DS -----
component R_DS
   port(
      RDATA13                      :	out   STD_ULOGIC;
      RDATA12                      :	out   STD_ULOGIC;
      RDATA11                      :	out   STD_ULOGIC;
      RDATA10                      :	out   STD_ULOGIC;
      RDATA23                      :	out   STD_ULOGIC;
      RDATA22                      :	out   STD_ULOGIC;
      RDATA21                      :	out   STD_ULOGIC;
      RDATA20                      :	out   STD_ULOGIC;
      RAD14                        :	in    STD_ULOGIC;
      RAD13                        :	in    STD_ULOGIC;
      RAD12                        :	in    STD_ULOGIC;
      RAD11                        :	in    STD_ULOGIC;
      RAD10                        :	in    STD_ULOGIC;
      RAD24                        :	in    STD_ULOGIC;
      RAD23                        :	in    STD_ULOGIC;
      RAD22                        :	in    STD_ULOGIC;
      RAD21                        :	in    STD_ULOGIC;
      RAD20                        :	in    STD_ULOGIC;
      REN                            :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      RCLK1                          :	in    STD_ULOGIC;
      RCLK2                          :	in    STD_ULOGIC);
end component;


----- Component R_SA -----
component R_SA
   port(
      RDATA3                       :	out   STD_ULOGIC;
      RDATA2                       :	out   STD_ULOGIC;
      RDATA1                       :	out   STD_ULOGIC;
      RDATA0                       :	out   STD_ULOGIC;
      RAD4                         :	in    STD_ULOGIC;
      RAD3                         :	in    STD_ULOGIC;
      RAD2                         :	in    STD_ULOGIC;
      RAD1                         :	in    STD_ULOGIC;
      RAD0                         :	in    STD_ULOGIC;
      REN                            :	in    STD_ULOGIC);
end component;


----- Component R_SAR -----
component R_SAR
   port(
      RDATA3                       :	out   STD_ULOGIC;
      RDATA2                       :	out   STD_ULOGIC;
      RDATA1                       :	out   STD_ULOGIC;
      RDATA0                       :	out   STD_ULOGIC;
      RAD4                         :	in    STD_ULOGIC;
      RAD3                         :	in    STD_ULOGIC;
      RAD2                         :	in    STD_ULOGIC;
      RAD1                         :	in    STD_ULOGIC;
      RAD0                         :	in    STD_ULOGIC;
      REN                            :	in    STD_ULOGIC;
      ADRCLK                         :	in    STD_ULOGIC);
end component;


----- Component R_SS -----
component R_SS
   port(
      RDATA3                       :	out   STD_ULOGIC;
      RDATA2                       :	out   STD_ULOGIC;
      RDATA1                       :	out   STD_ULOGIC;
      RDATA0                       :	out   STD_ULOGIC;
      RAD4                         :	in    STD_ULOGIC;
      RAD3                         :	in    STD_ULOGIC;
      RAD2                         :	in    STD_ULOGIC;
      RAD1                         :	in    STD_ULOGIC;
      RAD0                         :	in    STD_ULOGIC;
      REN                            :	in    STD_ULOGIC;
      RCLK                           :	in    STD_ULOGIC);
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


----- Component TFFRSS -----
component TFFRSS
   port(
      T                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;


----- Component TFFRSSH -----
component TFFRSSH
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


----- Component XNOR2 -----
component XNOR2
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component XNOR3 -----
component XNOR3
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component XNOR4 -----
component XNOR4
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component XNOR5 -----
component XNOR5
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component XNOR6 -----
component XNOR6
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component XOR2 -----
component XOR2
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component XOR3 -----
component XOR3
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component XOR4 -----
component XOR4
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component XOR5 -----
component XOR5
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;


----- Component XOR6 -----
component XOR6
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
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
