--***************************************************************
-- 1-bit down counters with asynchronous clear, CAI, and CAO.
-- -XiaoQiu ZHOU
--***************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY CBD11 IS 
    PORT (
        CAI : IN std_logic;
        CLK : IN std_logic;
        CD  : IN std_logic;
        Q0  : OUT std_logic;
        CAO : OUT std_logic
    );
END CBD11;

ARCHITECTURE lattice_behav OF CBD11 IS
    SIGNAL Q_i  : std_logic;
BEGIN

PROCESS (CLK, CD, CAI) 
BEGIN
  IF (CD = '1') THEN
    Q_i <= '0';
  ELSIF rising_edge(CLK) THEN
    IF (CAI = '1') THEN
      Q_i <= NOT Q_i;
    END IF;  
  END IF;
end process;

Q0 <= Q_i;
CAO <= CAI AND (NOT Q_i);

END lattice_behav;
