--***************************************************************
-- 16-bit up counters with asynchronous clear, enable, parallel data load and carry out.
-- XiaoQiu ZHOU
--***************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY CBU716 IS 
    PORT (
        CAI : IN std_logic;
        CD  : IN std_logic;
        CLK : IN std_logic;
        D0  : IN std_logic;
        D1  : IN std_logic;
        D2  : IN std_logic;
        D3  : IN std_logic;
        D4  : IN std_logic;
        D5  : IN std_logic;
        D6  : IN std_logic;
        D7  : IN std_logic;
        D8  : IN std_logic;
        D9  : IN std_logic;
        D10 : IN std_logic;
        D11 : IN std_logic;
        D12 : IN std_logic;
        D13 : IN std_logic;
        D14 : IN std_logic;
        D15 : IN std_logic;
        EN  : IN std_logic;
        LD  : IN std_logic;
        CAO : OUT std_logic;
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
        Q15 : OUT std_logic
    );
END CBU716;


ARCHITECTURE lattice_behav OF CBU716 IS
    SIGNAL Q_i  : std_logic_vector(15 downto 0);
BEGIN

PROCESS (CLK, CAI, LD, EN, CD) 
BEGIN
  IF (CD = '1') THEN
    Q_i <= "0000000000000000";
  ELSIF rising_edge(CLK) THEN
    IF (LD = '1') THEN
      Q_i <= D15&D14&D13&D12&D11&D10&D9&D8&D7&D6&D5&D4&D3&D2&D1&D0;
	  ELSIF (EN = '1' AND CAI = '1') THEN
	    Q_i <= Q_i + 1;
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
CAO <= CAI AND EN AND Q_i(0) AND Q_i(1) AND Q_i(2) AND Q_i(3) 
AND Q_i(4) AND Q_i(5) AND Q_i(6) AND Q_i(7)
AND Q_i(8) AND Q_i(9) AND Q_i(10) AND Q_i(11)
AND Q_i(12) AND Q_i(13) AND Q_i(14) AND Q_i(15);

END lattice_behav;
