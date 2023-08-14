--***************************************************************
-- 2-bit down counters with asynchronous clear, CAI, and CAO.
-- XiaoQiu ZHOU
--***************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY CBD12 IS 
    PORT (
        CAI : IN std_logic;
        CLK : IN std_logic;
        CD  : IN std_logic;
        Q0  : OUT std_logic;
        Q1  : OUT std_logic;
        CAO : OUT std_logic
    );
END CBD12;

ARCHITECTURE lattice_behav OF CBD12 IS
    SIGNAL Q_i  : std_logic_vector(1 downto 0);
BEGIN

PROCESS (CLK, CD, CAI) 
BEGIN
  IF (CD = '1') THEN
    Q_i <= "00";
  ELSIF rising_edge(CLK) THEN
    IF (CAI = '1') THEN
      Q_i <= Q_i - 1;
    END IF;  
  END IF;
end process;

Q0 <= Q_i(0);
Q1 <= Q_i(1);
CAO <= CAI AND (NOT Q_i(0)) AND (NOT Q_i(1)) ;

END lattice_behav;
