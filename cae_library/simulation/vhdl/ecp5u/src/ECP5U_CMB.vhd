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
-- Simulation Library File for ECP5U/M
--
-- $Header:
--

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


