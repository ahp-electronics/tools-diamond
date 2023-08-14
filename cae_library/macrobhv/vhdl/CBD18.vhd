--***************************************************************
-- 8-bit down counters with asynchronous clear, CAI, and CAO.
-- XiaoQiu ZHOU
--***************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY CBD18 IS 
    PORT (
        CAI : IN std_logic;
        CLK : IN std_logic;
        CD  : IN std_logic;
        Q0  : OUT std_logic;
        Q1  : OUT std_logic;
        Q2  : OUT std_logic;
        Q3  : OUT std_logic;
        Q4  : OUT std_logic;
        Q5  : OUT std_logic;
        Q6  : OUT std_logic;
        Q7  : OUT std_logic;		
        CAO : OUT std_logic
    );
END CBD18;

ARCHITECTURE lattice_behav OF CBD18 IS
    SIGNAL Q_i  : std_logic_vector(7 downto 0);
BEGIN

PROCESS (CLK, CD, CAI) 
BEGIN
  IF (CD = '1') THEN
    Q_i <= "00000000";
  ELSIF rising_edge(CLK) THEN
    IF (CAI = '1') THEN
      Q_i <= Q_i - 1;
    END IF;  
  END IF;
end process;

Q0 <= Q_i(0);
Q1 <= Q_i(1);
Q2 <= Q_i(2);
Q3 <= Q_i(3);
Q4 <= Q_i(4);
Q5 <= Q_i(5);
Q6 <= Q_i(6);
Q7 <= Q_i(7);
CAO <= CAI AND (NOT Q_i(0)) AND (NOT Q_i(1)) AND (NOT Q_i(2)) AND (NOT Q_i(3)) 
AND (NOT Q_i(4)) AND (NOT Q_i(5)) AND (NOT Q_i(6)) AND (NOT Q_i(7));

END lattice_behav;
