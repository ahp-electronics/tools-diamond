-- --------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------
-- Copyright (c) 2005-2010 by Lattice Semiconductor Corporation
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
-- Simulation Library File for LIFMDF
--
-- $Header:
--
--

--
---
library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;
--use work.components.all;


-- ************************************************************************
-- Entity definition
-- ************************************************************************

entity CCU2C is

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
      ATTRIBUTE Vital_Level0 OF CCU2C : ENTITY IS TRUE;

end CCU2C;

architecture bev of CCU2C is
    ATTRIBUTE Vital_Level0 OF bev : ARCHITECTURE IS TRUE;
   ------------------------------------------------------------------
--   signal init_vec0 : std_logic_vector( 15 downto 0);
--   signal init_vec1 : std_logic_vector( 15 downto 0);

--   signal lut2_init0 : std_logic_vector (3 downto 0);
--   signal lut2_init1 : std_logic_vector (3 downto 0);

--   signal lut2_sel0, lut2_sel1, lut4_sel0, lut4_sel1 : integer :=0;
   signal lut2_out0, lut2_out1 : std_ulogic;
   signal prop0, prop1, gen0, gen1, cout_sig0, cout_sig1 : std_ulogic;
   signal pass_cin0, pass_cin1 : std_ulogic;
   -----------------------------------------------------

begin

--   init_vec0 <= init0;
--   init_vec1 <= init1;

--   lut2_init0 <= init_vec0( 3 downto 0 ); --ecp2
--   lut2_init1 <= init_vec1( 3 downto 0 ); --ecp2

--   lut2_sel0 <= conv_integer (B0 & A0);
--   lut2_sel1 <= conv_integer (B1 & A1);
--   lut4_sel0 <= conv_integer (D0 & C0 & B0 & A0);
--   lut4_sel1 <= conv_integer (D1 & C1 & B1 & A1);

--   prop0 <= init_vec0(lut4_sel0) ;
--   prop1 <= init_vec1(lut4_sel1);

--   lut2_out0 <= lut2_init0(lut2_sel0);
--   lut2_out1 <= lut2_init1(lut2_sel1);

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (A0, A1, B0, B1, C0, C1, D0, D1)

     VARIABLE init_vec0  : std_logic_vector(15 downto 0) := init0;
     VARIABLE init_vec1  : std_logic_vector(15 downto 0) := init1;
     VARIABLE lut2_init0 : std_logic_vector(3 downto 0)  := init0(3 downto 0 );
     VARIABLE lut2_init1 : std_logic_vector(3 downto 0)  := init1(3 downto 0 );

   BEGIN

     ------------------------
     -- functionality section
     ------------------------
     prop0 <= VitalMUX (data => init_vec0, dselect => (D0, C0, B0, A0));
     prop1 <= VitalMUX (data => init_vec1, dselect => (D1, C1, B1, A1));

     lut2_out0 <= VitalMUX (data => lut2_init0, dselect => (B0, A0));
     lut2_out1 <= VitalMUX (data => lut2_init1, dselect => (B1, A1));

   END PROCESS;

   gen0 <= '0' when (inject1_0 = "YES") else
           '0' when (inject1_0 = "yes") else
           lut2_out0 ; --ecp2
   gen1 <= '0' when (inject1_1 = "YES") else
           '0' when (inject1_1 = "yes") else
           lut2_out1 ; --ecp2

   pass_cin0 <= '0' when (inject1_0 = "YES") else
           '0' when (inject1_0 = "yes") else
           '1' ; --ecp2
   pass_cin1 <= '0' when (inject1_1 = "YES") else
           '0' when (inject1_1 = "yes") else
           '1' ; --ecp2

   cout_sig0 <= (not(prop0) and gen0 ) or (prop0 and CIN);
   cout_sig1 <= (not(prop1) and gen1 ) or (prop1 and cout_sig0);

   COUT <= cout_sig1;

   S0 <=  prop0 xor (pass_cin0 and CIN);
   S1 <=  prop1 xor (pass_cin1 and cout_sig0);

end bev;

