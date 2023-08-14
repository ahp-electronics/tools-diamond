--***************************************************************
-- 16-bit down counters with asynchronous clear, enable and CAO.
-- XiaoQiu ZHOU
--***************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY CBD616 IS 
    PORT (
        CLK : IN std_logic;
        EN  : IN std_logic;
        CD  : IN std_logic;
        Q0  : OUT std_logic;
        Q1  : OUT std_logic;
        Q2  : OUT std_logic;
        Q3  : OUT std_logic;
        Q4  : OUT std_logic;
        Q5  : OUT std_logic;
        Q6  : OUT std_logic;
        Q7  : OUT std_logic;
        Q8  : OUT std_logic;
        Q9  : OUT std_logic;
        Q10 : OUT std_logic;
        Q11 : OUT std_logic;
        Q12 : OUT std_logic;
        Q13 : OUT std_logic;
        Q14 : OUT std_logic;
        Q15 : OUT std_logic;
        CAO : OUT std_logic
    );
END CBD616;


ARCHITECTURE lattice_behav OF CBD616 IS
    SIGNAL Q_i  : std_logic_vector(15 downto 0);
BEGIN

PROCESS (CLK, EN, CD) 
BEGIN
  IF (CD = '1') THEN
    Q_i <= "0000000000000000";
  ELSIF rising_edge(CLK) THEN
    IF (EN = '1') THEN
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
Q8 <= Q_i(8);
Q9 <= Q_i(9);
Q10 <= Q_i(10);
Q11 <= Q_i(11);
Q12 <= Q_i(12);
Q13 <= Q_i(13);
Q14 <= Q_i(14);
Q15 <= Q_i(15);
CAO <= EN AND (NOT Q_i(0)) AND (NOT Q_i(1)) AND (NOT Q_i(2)) AND (NOT Q_i(3)) 
AND (NOT Q_i(4)) AND (NOT Q_i(5)) AND (NOT Q_i(6)) AND (NOT Q_i(7))
AND (NOT Q_i(8)) AND (NOT Q_i(9)) AND (NOT Q_i(10)) AND (NOT Q_i(11))
AND (NOT Q_i(12)) AND (NOT Q_i(13)) AND (NOT Q_i(14)) AND (NOT Q_i(15));

END lattice_behav;
