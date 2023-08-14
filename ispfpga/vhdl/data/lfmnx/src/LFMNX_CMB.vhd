-- --------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------
-- Copyright (c) 2005-2012 by Lattice Semiconductor Corporation
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
-- Simulation Library File for LFMNX
--
-- fpga\vhdl\pkg\vhdsclibs\data\machxo3l3l3l\src\MACHXO3L_CMB.vhd 1.8 13-APR-2012 20:11:57 IALMOHAN
--

--
----- cell ageb2 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY ageb2 IS

   PORT(
      a0              :	IN    std_logic;
      a1              :	IN    std_logic;
      b0              :	IN    std_logic;
      b1              :	IN    std_logic;
      ci              :	IN    std_logic := '1';
      ge              :	OUT   std_logic);

   ATTRIBUTE Vital_Level0 OF ageb2 : ENTITY IS TRUE;

END ageb2;

-- architecture body --
LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF ageb2 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a0, a1, b0, b1, ci)

   VARIABLE a, b    : std_logic_vector(0 to 1) := (others => 'X');

   BEGIN

      -------------------------
      --  functionality section
      -------------------------

      a := std_logic_vector'(a1, a0);
      b := std_logic_vector'(b1, b0);

      -- if a = b, then output carry-in (ge from the lower stage)
      -- note: carry-in on the first stage is tied high
      IF (a > b) THEN
	ge <= '1'; 
      ELSIF (a = b) THEN
	ge <= ci;
      ELSE
	ge <= '0';
      END IF;

   END PROCESS;

END v;



--
----- cell aleb2 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY aleb2 IS

   PORT(
      a0, a1   : IN std_logic;
      b0, b1   : IN std_logic;
      ci       : IN std_logic := '1';
      le       : OUT std_logic);

   ATTRIBUTE Vital_Level0 OF aleb2 : ENTITY IS TRUE;

END aleb2;

-- architecture body --
LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF aleb2 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a0, a1, b0, b1, ci) 

   VARIABLE a, b    : std_logic_vector(0 to 1) := (others => 'X');

   BEGIN

      -------------------------
      --  functionality section
      -------------------------

      a := std_logic_vector'(a1, a0);
      b := std_logic_vector'(b1, b0);

      -- if a = b, then output carry-in (le from the lower stage)
      -- note: carry-in on the first stage is tied high
      IF (a < b) THEN
	le <= '1'; 
      ELSIF (a = b) THEN
	le <= ci;
      ELSE
	le <= '0';
      END IF;

   END PROCESS;

END v;


--
----- cell aneb2 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY aneb2 IS

   PORT(
      a0              :	IN    std_logic;
      a1              :	IN    std_logic;
      b0              :	IN    std_logic;
      b1              :	IN    std_logic;
      ci              :	IN    std_logic := '0';
      ne              :	OUT   std_logic);

   ATTRIBUTE Vital_Level0 OF aneb2 : ENTITY IS TRUE;

END aneb2;

-- architecture body --
LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF aneb2 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a0, a1, b0, b1, ci)

   VARIABLE a, b    : std_logic_vector(0 to 1) := (others => 'X');

   BEGIN

      -------------------------
      --  functionality section
      -------------------------

      a := std_logic_vector'(a1, a0);
      b := std_logic_vector'(b1, b0);

      -- IF a = b, THEN pass on carry-in input (ne from the previous stage)
      -- note: carry-in on the first stage is tied low
      IF (a = b) THEN
	ne <= ci; 
      ELSE
	ne <= '1';
      END IF;

   END PROCESS;

END v;


--
----- cell and2 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY and2 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF and2 : ENTITY IS TRUE;

END and2;

-- architecture body --
LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF and2 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (a AND b);

   END PROCESS;

END v;


--
----- cell and3 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY and3 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      z               :	OUT   std_logic); 

   ATTRIBUTE Vital_Level0 OF and3 : ENTITY IS TRUE;

END and3;

-- architecture body --
LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF and3 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (a AND b AND c);

   END PROCESS;

END v;


--
----- cell and4 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY and4 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      d               :	IN    std_logic;
      z               :	OUT   std_logic);

   ATTRIBUTE Vital_Level0 OF and4 : ENTITY IS TRUE;

END and4;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF and4 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c, d)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (a AND b AND c AND d);

   END PROCESS;

END v;


--
----- cell and5 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY and5 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      d               :	IN    std_logic;
      e               :	IN    std_logic;
      z               :	OUT   std_logic);

   ATTRIBUTE Vital_Level0 OF and5 : ENTITY IS TRUE;

END and5;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF and5 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c, d, e)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (a AND b AND c AND d AND e);

END PROCESS;

END v;



--
----- cell fadd2b -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY fadd2b IS

   PORT(
      a0              :	IN    std_logic;
      a1              :	IN    std_logic;
      b0              :	IN    std_logic;
      b1              :	IN    std_logic;
      ci              :	IN    std_logic;
      s0              :	OUT   std_logic;
      s1              :	OUT   std_logic;
      cout            :	OUT   std_logic);

   ATTRIBUTE Vital_Level0 OF fadd2b : ENTITY IS TRUE;

END fadd2b;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF fadd2b IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a0, a1, b0, b1, ci)

   -- functionality results
   VARIABLE results1 : std_logic_vector(1 to 2) := (others => 'X');
   VARIABLE results2 : std_logic_vector(1 to 2) := (others => 'X');
   ALIAS cout0_zd      : std_logic IS results1(1);
   ALIAS s0_zd      : std_logic IS results1(2);
   ALIAS cout_zd      : std_logic IS results2(1);
   ALIAS s1_zd      : std_logic IS results2(2);

--   constant add_table : vitaltruthtabletype := (
--   --------------------------------------------
--   --  a    b    ci   |   co   s
--   --------------------------------------------
--    ( '0', '0', '0',     '0', '0'),
--    ( '1', '0', '0',     '0', '1'),
--    ( '0', '1', '0',     '0', '1'),
--    ( '1', '1', '0',     '1', '0'),
--    ( '0', '0', '1',     '0', '1'),
--    ( '1', '0', '1',     '1', '0'),
--    ( '0', '1', '1',     '1', '0'),
--    ( '1', '1', '1',     '1', '1'));

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
--      results1 := vitaltruthtable (
--                truthtable => add_table,
--                datain => (a0, b0, ci)
--                );
--      results2 := vitaltruthtable (
--                truthtable => add_table,
--                datain => (a1, b1, cout0_zd)
--                );

      cout0_zd := (a0 and b0) or (a0 and ci) or (b0 and ci);
      s0_zd    := a0 xor b0 xor ci;

      cout_zd  := (a1 and b1) or (a1 and cout0_zd) or (b1 and cout0_zd);
      s1_zd    := a1 xor b1 xor cout0_zd;

      s0 <= s0_zd;
      s1 <= s1_zd;
      cout <= cout_zd;

   END PROCESS;

END v;


--
----- cell fsub2b -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY fsub2b IS

   PORT(
      a0                     :	IN    std_logic;
      a1                     :	IN    std_logic;
      b0                     :	IN    std_logic;
      b1                     :	IN    std_logic;
      bi                     :	IN    std_logic;
      bout                   :	OUT   std_logic;
      s0                     :	OUT   std_logic;
      s1                     :	OUT   std_logic);

   ATTRIBUTE Vital_Level0 OF fsub2b : ENTITY IS TRUE;

END fsub2b;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF fsub2b IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a0, a1, b0, b1, bi)

   -- functionality results
   VARIABLE results1 : std_logic_vector(1 to 2) := (others => 'X');
   VARIABLE results2 : std_logic_vector(1 to 2) := (others => 'X');
   ALIAS bout0_zd      : std_logic IS results1(1);
   ALIAS s0_zd      : std_logic IS results1(2);
   ALIAS bout_zd      : std_logic IS results2(1);
   ALIAS s1_zd      : std_logic IS results2(2);
	variable not_b0 : std_logic := 'X';
	variable not_b1 : std_logic := 'X';

--   constant sub_table : vitaltruthtabletype := (
--   --------------------------------------------
--   --  a    b    bi   |   bo   s
--   --------------------------------------------
--    ( '0', '0', '0',     '0', '1'),
--    ( '1', '0', '0',     '1', '0'),
--    ( '0', '1', '0',     '0', '0'),
--    ( '1', '1', '0',     '0', '1'),
--    ( '0', '0', '1',     '1', '0'),
--    ( '1', '0', '1',     '1', '1'),
--    ( '0', '1', '1',     '0', '1'),
--    ( '1', '1', '1',     '1', '0'));

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
--      results1 := vitaltruthtable (
--                truthtable => sub_table,
--                datain => (a0, b0, bi)
--                );
--      results2 := vitaltruthtable (
--                truthtable => sub_table,
--                datain => (a1, b1, bout0_zd)
--                );

      not_b0   := not b0;
      bout0_zd := (a0 and not_b0) or (a0 and bi) or (not_b0 and bi);
      s0_zd    := a0 xor not_b0 xor bi;

      not_b1   := not b1;
      bout_zd  := (a1 and not_b1) or (a1 and bout0_zd) or (not_b1 and bout0_zd);
      s1_zd    := a1 xor not_b1 xor bout0_zd;

      s0 <= s0_zd;
      s1 <= s1_zd;
      bout <= bout_zd;

   END PROCESS;

END v;



----- cell fadsu2 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY fadsu2 IS

   PORT(
      a0             :  IN    std_logic;
      a1             :  IN    std_logic;
      b0             :  IN    std_logic;
      b1             :  IN    std_logic;
      bci            :  IN    std_logic;
      con            :  IN    std_logic;
      bco            :  OUT   std_logic;
      s0             :  OUT   std_logic;
      s1             :  OUT   std_logic);

   ATTRIBUTE Vital_Level0 OF fadsu2 : ENTITY IS TRUE;

END fadsu2;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF fadsu2 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a0, a1, b0, b1, bci, con)

   -- functionality results
   VARIABLE results1 : std_logic_vector(1 to 2) := (others => 'X');
   VARIABLE results2 : std_logic_vector(1 to 2) := (others => 'X');
--   VARIABLE results3 : std_logic_vector(1 to 2) := (others => 'X');
--   VARIABLE results4 : std_logic_vector(1 to 2) := (others => 'X');
   ALIAS bc0_zd     : std_logic IS results1(1);
   ALIAS s0_zd      : std_logic IS results1(2);
   ALIAS bco_zd     : std_logic IS results2(1);
   ALIAS s1_zd      : std_logic IS results2(2);
	variable con_xnor_b0 : std_logic := 'X';
	variable con_xnor_b1 : std_logic := 'X';

--   constant adsu_table : vitaltruthtabletype := (
--   --------------------------------------------
--   --   a    b   bci  con  |   bco   s
--   --------------------------------------------
--      ('0', '0', '0', '1',     '0', '0'),
--      ('1', '0', '0', '1',     '0', '1'),
--      ('0', '1', '0', '1',     '0', '1'),
--      ('1', '1', '0', '1',     '1', '0'),
--      ('0', '0', '1', '1',     '0', '1'),
--      ('1', '0', '1', '1',     '1', '0'),
--      ('0', '1', '1', '1',     '1', '0'),
--      ('1', '1', '1', '1',     '1', '1'),
--      ('0', '0', '0', '0',     '0', '1'),
--      ('1', '0', '0', '0',     '1', '0'),
--      ('0', '1', '0', '0',     '0', '0'),
--      ('1', '1', '0', '0',     '0', '1'),
--      ('0', '0', '1', '0',     '1', '0'),
--      ('1', '0', '1', '0',     '1', '1'),
--      ('0', '1', '1', '0',     '0', '1'),
--      ('1', '1', '1', '0',     '1', '0'));

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
--      results1 := vitaltruthtable (
--                truthtable => adsu_table,
--                datain => (a0, b0, bci, con)
--                );
--      results2 := vitaltruthtable (
--                truthtable => adsu_table,
--                datain => (a1, b1, bc0_zd, con)
--                );

      con_xnor_b0 := not (con xor b0);
      bc0_zd := (a0 and con_xnor_b0) or (a0 and bci) or (con_xnor_b0 and bci);
      s0_zd  := a0 xor con_xnor_b0 xor bci;

      con_xnor_b1 := not (con xor b1);
      bco_zd := (a1 and con_xnor_b1) or (a1 and bc0_zd) or (con_xnor_b1 and bc0_zd);
      s1_zd  := a1 xor con_xnor_b1 xor bc0_zd;

      s0 <= s0_zd;
      s1 <= s1_zd;
      bco <= bco_zd;

   END PROCESS;

END v;



--
----- cell inv -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY inv IS

   PORT(
      a                              :	IN    std_logic;
      z                              :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF inv : ENTITY IS TRUE;

END inv;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF inv IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (NOT a);

   END PROCESS;

END v;


--
----- cell mux21 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY mux21 IS

   PORT(
      d0              :	IN    std_logic;
      d1              :	IN    std_logic;
      sd              :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF mux21 : ENTITY IS TRUE;

END mux21;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF mux21 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (d0, d1, sd)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= vitalmux
                 (data => (d1, d0),
                  dselect => (0 => sd));

   END PROCESS;

END v;



--
----- cell l6mux21 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY l6mux21 IS

   PORT(
      d0              :	IN    std_logic;
      d1              :	IN    std_logic;
      sd              :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF l6mux21 : ENTITY IS TRUE;

END l6mux21;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF l6mux21 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (d0, d1, sd)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= vitalmux
                 (data => (d1, d0),
                  dselect => (0 => sd));

   END PROCESS;

END v;


--
----- cell mux41 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;

ENTITY mux41 IS

   PORT(
      d0              :	IN    std_logic;
      d1              :	IN    std_logic;
      d2              :	IN    std_logic;
      d3              :	IN    std_logic;
      sd1             :	IN    std_logic;
      sd2             :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF mux41 : ENTITY IS TRUE;

END mux41;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF mux41 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (d0, d1, d2, d3, sd1, sd2)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= vitalmux
                 (data => (d3, d2, d1, d0),
                  dselect => (sd2, sd1));

   END PROCESS;

END v;


--
----- cell mux81 -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY mux81 IS

   PORT(
      d0              : IN    std_logic;
      d1              : IN    std_logic;
      d2              : IN    std_logic;
      d3              : IN    std_logic;
      d4              : IN    std_logic;
      d5              : IN    std_logic;
      d6              : IN    std_logic;
      d7              : IN    std_logic;
      sd1             : IN    std_logic;
      sd2             : IN    std_logic;
      sd3             : IN    std_logic;
      z               : OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF mux81 : ENTITY IS TRUE;

END mux81;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF mux81 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (d0, d1, d2, d3, d4, d5, d6, d7, sd1, sd2, sd3)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= vitalmux
                 (data => (d7, d6, d5, d4, d3, d2, d1, d0),
                  dselect => (sd3, sd2, sd1));

   END PROCESS;

END v;


--
----- cell mux161 -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY mux161 IS

   PORT(
      d0              : IN    std_logic;
      d1              : IN    std_logic;
      d2              : IN    std_logic;
      d3              : IN    std_logic;
      d4              : IN    std_logic;
      d5              : IN    std_logic;
      d6              : IN    std_logic;
      d7              : IN    std_logic;
      d8              : IN    std_logic;
      d9              : IN    std_logic;
      d10             : IN    std_logic;
      d11             : IN    std_logic;
      d12             : IN    std_logic;
      d13             : IN    std_logic;
      d14             : IN    std_logic;
      d15             : IN    std_logic;
      sd1             : IN    std_logic;
      sd2             : IN    std_logic;
      sd3             : IN    std_logic;
      sd4             : IN    std_logic;
      z               : OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF mux161 : ENTITY IS TRUE;

END mux161;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF mux161 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, sd1, sd2, sd3, sd4)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= vitalmux
                 (data => (d15, d14, d13, d12, d11, d10, d9, d8, d7, d6, d5, d4, d3, d2, d1, d0),
                  dselect => (sd4, sd3, sd2, sd1));

   END PROCESS;

END v;


--
----- cell mux321 -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY mux321 IS

   PORT(
      d0              : IN    std_logic;
      d1              : IN    std_logic;
      d2              : IN    std_logic;
      d3              : IN    std_logic;
      d4              : IN    std_logic;
      d5              : IN    std_logic;
      d6              : IN    std_logic;
      d7              : IN    std_logic;
      d8              : IN    std_logic;
      d9              : IN    std_logic;
      d10             : IN    std_logic;
      d11             : IN    std_logic;
      d12             : IN    std_logic;
      d13             : IN    std_logic;
      d14             : IN    std_logic;
      d15             : IN    std_logic;
      d16             : IN    std_logic;
      d17             : IN    std_logic;
      d18             : IN    std_logic;
      d19             : IN    std_logic;
      d20             : IN    std_logic;
      d21             : IN    std_logic;
      d22             : IN    std_logic;
      d23             : IN    std_logic;
      d24             : IN    std_logic;
      d25             : IN    std_logic;
      d26             : IN    std_logic;
      d27             : IN    std_logic;
      d28             : IN    std_logic;
      d29             : IN    std_logic;
      d30             : IN    std_logic;
      d31             : IN    std_logic;
      sd1             : IN    std_logic;
      sd2             : IN    std_logic;
      sd3             : IN    std_logic;
      sd4             : IN    std_logic;
      sd5             : IN    std_logic;
      z               : OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF mux321 : ENTITY IS TRUE;

END mux321;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF mux321 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, sd1, sd2, sd3, sd4, sd5)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= vitalmux
                 (data => (d31, d30, d29, d28, d27, d26, d25, d24, d23, d22, d21, d20, d19, d18, d17, d16, d15, d14, d13, d12, d11, d10, d9, d8, d7, d6, d5, d4, d3, d2, d1, d0),
                  dselect => (sd5, sd4, sd3, sd2, sd1));

   END PROCESS;

END v;



--
----- cell nd2 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY nd2 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF nd2 : ENTITY IS TRUE;

END nd2;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF nd2 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= NOT (a AND b);

   END PROCESS;

END v;


--
----- cell nd3 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY nd3 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF nd3 : ENTITY IS TRUE;

END nd3;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF nd3 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= NOT (a AND b AND c);

   END PROCESS;

END v;


--
----- cell nd4 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY nd4 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      d               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF nd4 : ENTITY IS TRUE;

END nd4;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF nd4 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c, d)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= NOT (a AND b AND c AND d);

   END PROCESS;

END v;


--
----- cell nd5 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY nd5 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      d               :	IN    std_logic;
      e               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF nd5 : ENTITY IS TRUE;

END nd5;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF nd5 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c, d, e)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= NOT (a AND b AND c AND d AND e);

   END PROCESS;

END v;


--
----- cell nr2 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY nr2 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF nr2 : ENTITY IS TRUE;

END nr2;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF nr2 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= NOT (a OR b);

   END PROCESS;

END v;


--
----- cell nr3 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY nr3 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF nr3 : ENTITY IS TRUE;

END nr3;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF nr3 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= NOT (a OR b OR c);

   END PROCESS;

END v;


--
----- cell nr4 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY nr4 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      d               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF nr4 : ENTITY IS TRUE;

END nr4;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF nr4 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c, d)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= NOT (a OR b OR c OR d);

   END PROCESS;

END v;


--
----- cell nr5 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY nr5 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      d               :	IN    std_logic;
      e               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF nr5 : ENTITY IS TRUE;

END nr5;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF nr5 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c, d, e)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= NOT (a OR b OR c OR d OR e);

   END PROCESS;

END v;


--
----- cell or2 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY or2 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF or2 : ENTITY IS TRUE;

END or2;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF or2 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (a OR b);

   END PROCESS;

END v;


--
----- cell or3 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY or3 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      z               :	OUT   std_logic);

   ATTRIBUTE Vital_Level0 OF or3 : ENTITY IS TRUE;

END or3;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF or3 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (a OR b OR c);

   END PROCESS;

END v;


--
----- cell or4 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY or4 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      d               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF or4 : ENTITY IS TRUE;

END or4;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF or4 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c, d)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (a OR b OR c OR d);

   END PROCESS;

END v;


--
----- cell or5 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY or5 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      d               :	IN    std_logic;
      e               :	IN    std_logic;
      z               :	OUT   std_logic);

   ATTRIBUTE Vital_Level0 OF or5 : ENTITY IS TRUE;

END or5;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF or5 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c, d, e)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (a OR b OR c OR d OR e);

   END PROCESS;

END v;


--
----- cell pfumx -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY pfumx IS

   PORT(
      alut            :	IN    std_logic;
      blut            :	IN    std_logic;
      c0              :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF pfumx : ENTITY IS TRUE;

END pfumx;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF pfumx IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (alut, blut, c0)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= vitalmux
                 (data => (alut, blut),
                  dselect => (0 => c0));

   END PROCESS;

END v;


--
----- cell vhi -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY vhi IS

   PORT(
      z               :	OUT  std_logic := '1');

   ATTRIBUTE Vital_Level0 OF vhi : ENTITY IS TRUE;

END vhi;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF vhi IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   z <= '1';

END v;


--
----- cell vlo -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY vlo IS

   PORT(
      z               :	OUT  std_logic := '0');

   ATTRIBUTE Vital_Level0 OF vlo : ENTITY IS TRUE;

END vlo;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF vlo IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   z <= '0';

END v;


--
----- cell xnor2 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY xnor2 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF xnor2 : ENTITY IS TRUE;

END xnor2;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF xnor2 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= NOT (a XOR b);

   END PROCESS;

END v;


--
----- cell xnor3 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY xnor3 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF xnor3 : ENTITY IS TRUE;

END xnor3;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF xnor3 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= NOT (a XOR b XOR c);

   END PROCESS;

END v;


--
----- cell xnor4 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY xnor4 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      d               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF xnor4 : ENTITY IS TRUE;

END xnor4;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF xnor4 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c, d)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= NOT (a XOR b XOR c XOR d);

   END PROCESS;

END v;

--
----- cell xnor5 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY xnor5 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      d               :	IN    std_logic;
      e               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF xnor5 : ENTITY IS TRUE;

END xnor5;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF xnor5 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c, d, e)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= NOT (a XOR b XOR c XOR d XOR e);

   END PROCESS;

END v;


--
----- cell xor2 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY xor2 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      z               :	OUT   std_logic);

   ATTRIBUTE Vital_Level0 OF xor2 : ENTITY IS TRUE;

END xor2;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF xor2 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (a XOR b);

   END PROCESS;

END v;


--
----- cell xor3 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY xor3 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF xor3 : ENTITY IS TRUE;

END xor3;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF xor3 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (a XOR b XOR c);

   END PROCESS;

END v;


--
----- cell xor4 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY xor4 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      d               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF xor4 : ENTITY IS TRUE;

END xor4;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF xor4 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c, d)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (a XOR b XOR c XOR d);

   END PROCESS;

END v;


--
----- cell xor5 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY xor5 IS

   PORT(
      a               :	IN    std_logic;
      b               :	IN    std_logic;
      c               :	IN    std_logic;
      d               :	IN    std_logic;
      e               :	IN    std_logic;
      z               :	OUT  std_logic);

   ATTRIBUTE Vital_Level0 OF xor5 : ENTITY IS TRUE;

END xor5;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF xor5 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c, d, e)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (a XOR b XOR c XOR d XOR e);

   END PROCESS;

END v;


--
----- cell xor11 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY xor11 IS

   PORT(
      a, b, c, d, e, f, g, h, i, j, k : IN std_logic;
      z                               : OUT std_logic);

   ATTRIBUTE Vital_Level0 OF xor11 : ENTITY IS TRUE;

END xor11;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF xor11 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c, d, e, f, g, h, i, j, k)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (a XOR b XOR c XOR d XOR e xor f XOR g XOR h XOR i XOR j XOR k);

   END PROCESS;

END v;


--
----- cell xor21 -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;


-- entity declaration --
ENTITY xor21 IS

   PORT(
      a, b, c, d, e, f, g, h, i, j, k : IN std_logic;
      l, m, n, o, p, q, r, s, t, u    : IN std_logic;
      z				      :	OUT std_logic);

   ATTRIBUTE Vital_Level0 OF xor21 : ENTITY IS TRUE;

END xor21;

-- architecture body --

LIBRARY ieee;
USE ieee.vital_primitives.all;
ARCHITECTURE v OF xor21 IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= (a XOR b XOR c XOR d XOR e xor f XOR g XOR h XOR i XOR j XOR k XOR l XOR m XOR n XOR o xor p)
			XOR (q XOR r XOR s XOR t XOR u);

   END PROCESS;

END v;


--
----- cell bufba -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;

-- entity declaration --
ENTITY bufba IS
   GENERIC(
      tipd_a          : VitalDelayType01 := (0.0 ns, 0.0 ns));

   PORT(
      a               : IN   std_logic;
      z               : OUT  std_logic);

    ATTRIBUTE Vital_Level0 OF bufba : ENTITY IS TRUE;

END bufba;

-- architecture body --
ARCHITECTURE v OF bufba IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

   SIGNAL a_ipd  : std_logic := 'X';

BEGIN

   ---------------------
   --  input path delays
   ---------------------
   WireDelay : BLOCK
   BEGIN
   VitalWireDelay (a_ipd, a, tipd_a);
   END BLOCK;

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (a_ipd)

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      z <= VitalBUF(a_ipd);

   END PROCESS;

END v;


--
----- cell bcinrd -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;

-- entity declaration --
ENTITY bcinrd IS
GENERIC (
   BANKID : Integer := 0);

   PORT(
      inrdeni         : IN   std_logic);

    ATTRIBUTE Vital_Level0 OF bcinrd : ENTITY IS TRUE;

END bcinrd;

-- architecture body --
ARCHITECTURE v OF bcinrd IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

END v;


--
----- cell bclvdso -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;

-- entity declaration --
ENTITY bclvdso IS

   PORT(
      lvdseni         : IN   std_logic);

    ATTRIBUTE Vital_Level0 OF bclvdso : ENTITY IS TRUE;

END bclvdso;

-- architecture body --
ARCHITECTURE v OF bclvdso IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

END v;


--
----- cell inrdb -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;

-- entity declaration --
ENTITY inrdb IS

   PORT(
      d               : IN   std_logic;
      e               : IN   std_logic;
      q               : OUT  std_logic);

    ATTRIBUTE Vital_Level0 OF inrdb : ENTITY IS TRUE;

END inrdb;

-- architecture body --
ARCHITECTURE v OF inrdb IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (d, e)

   VARIABLE e_ipd : std_ulogic := 'X';
--   VARIABLE q_zd  : std_ulogic := 'X';

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      e_ipd := VitalIDENT (data => e,
                           resultmap => ('U','X','0','1','L'));

      q <= VitalBUFIF0 (data => d, enable => e_ipd,
                        resultmap => ('U','X','0','1','L'));

   END PROCESS;

END v;


--
----- cell lvdsob -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;

-- entity declaration --
ENTITY lvdsob IS

   PORT(
      d               : IN   std_logic;
      e               : IN   std_logic;
      q               : OUT  std_logic);

    ATTRIBUTE Vital_Level0 OF lvdsob : ENTITY IS TRUE;

END lvdsob;

-- architecture body --
ARCHITECTURE v OF lvdsob IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (d, e)

   VARIABLE e_ipd : std_ulogic := 'X';
--   VARIABLE q_zd  : std_ulogic := 'X';

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      e_ipd := VitalIDENT (data => e,
                           resultmap => ('U','X','0','1','L'));

      q <= VitalBUFIF0 (data => d, enable => e_ipd);

   END PROCESS;

END v;


--
----- cell pg -----
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;

-- entity declaration --
ENTITY pg IS

   PORT(
      d               : IN   std_logic;
      e               : IN   std_logic;
      q               : OUT  std_logic);

    ATTRIBUTE Vital_Level0 OF pg : ENTITY IS TRUE;

END pg;

-- architecture body --
ARCHITECTURE v OF pg IS
   ATTRIBUTE Vital_Level0 OF v : ARCHITECTURE IS TRUE;

BEGIN

   --------------------
   --  behavior section
   --------------------
   VitalBehavior : PROCESS (d, e)

   VARIABLE e_ipd : std_ulogic := 'X';
--   VARIABLE q_zd  : std_ulogic := 'X';

   BEGIN

      -------------------------
      --  functionality section
      -------------------------
      e_ipd := VitalIDENT (data => e,
                           resultmap => ('U','X','0','1','L'));

      q <= VitalBUFIF0 (data => d, enable => e_ipd,
                        resultmap => ('U','X','0','1','L'));

   END PROCESS;

END v;


--
----- cell start -----
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.vital_timing.all;
USE ieee.vital_primitives.all;


-- entity declaration --
ENTITY start IS

   PORT(
      startclk : in std_logic);

    ATTRIBUTE Vital_Level0 OF start : ENTITY IS TRUE;
 
END start ;

-- ARCHITECTURE body --
ARCHITECTURE V OF start IS
    ATTRIBUTE Vital_Level0 OF V : ARCHITECTURE IS TRUE;

BEGIN

END V;

