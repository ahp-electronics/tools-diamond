--***************************************************************
-- 8-bit up counters with asynchronous preset, enable, CAI, and CAO.
-- XiaoQiu ZHOU
--***************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY CBU88 IS 
    PORT (
        CAI : IN std_logic;
        CLK : IN std_logic;
		EN  : IN std_logic;
        SD  : IN std_logic;
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
END CBU88;

ARCHITECTURE lattice_behav OF CBU88 IS
    SIGNAL Q_i  : std_logic_vector(7 downto 0);
BEGIN

PROCESS (CLK, EN, SD, CAI) 
BEGIN
  IF (SD = '1') THEN
    Q_i <= "11111111";
  ELSIF rising_edge(CLK) THEN
    IF (CAI = '1' AND EN = '1') THEN
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
CAO <= CAI AND EN AND Q_i(0) AND Q_i(1) AND Q_i(2) AND Q_i(3) 
AND Q_i(4) AND Q_i(5) AND Q_i(6) AND Q_i(7);

END lattice_behav;
