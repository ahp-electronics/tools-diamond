--***************************************************************
-- 2-bit down counters with asynchronous clear, enable, parallel data load, synchronous preset, CAI, and CAO.
-- -XiaoQiu ZHOU
--***************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY CBD32 IS 
  PORT (
    D0  : IN std_logic;
    D1  : IN std_logic;
    CAI : IN std_logic;
    CLK : IN std_logic;
    PS  : IN std_logic;
    LD  : IN std_logic;
    EN  : IN std_logic;
    CD  : IN std_logic;
    Q0  : OUT std_logic;
    Q1  : OUT std_logic;
    CAO : OUT std_logic
    );
END CBD32;

ARCHITECTURE lattice_behav OF CBD32 IS
    SIGNAL Q_i  : std_logic_vector(1 downto 0);
BEGIN

PROCESS (CLK, PS, LD, D0, D1, EN, CD, CAI)
BEGIN
  IF (CD = '1') THEN
    Q_i <= "00";
  --ELSIF (EN = '0') THEN
  --  Q_i <= Q_i;	
  --ELSIF (CAI = '0') THEN
  --  Q_i <= Q_i;
  ELSIF rising_edge(CLK) THEN
    IF (PS = '1') THEN
      Q_i <= "11";
    ELSIF (LD = '1') THEN
      Q_i <= D1&D0;	
    ELSIF (CAI= '1' AND EN= '1') THEN
	  Q_i <= Q_i - 1;
    END IF;  
  END IF;
end process;

Q0 <= Q_i(0);
Q1 <= Q_i(1);
CAO <= CAI AND EN AND (NOT Q_i(0)) AND (NOT Q_i(1)) ;

END lattice_behav;
