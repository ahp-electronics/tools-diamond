--***************************************************************
-- 8-bit decade up/down counters with asynchronous clear, synchronous clear, enable, and parallel data load.
-- -XiaoQiu ZHOU
--***************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY CDUD8 IS 
    PORT (
        D0 : IN std_logic;
        D1 : IN std_logic;
        D2 : IN std_logic;
        D3 : IN std_logic;
        D4 : IN std_logic;
        D5 : IN std_logic;
        D6 : IN std_logic;
        D7 : IN std_logic;
        CLK : IN std_logic;
        LD : IN std_logic;
        EN : IN std_logic;
        DNUP : IN std_logic;
        CD : IN std_logic;
        CS : IN std_logic;
        Q0 : OUT std_logic;
        Q1 : OUT std_logic;
        Q2 : OUT std_logic;
        Q3 : OUT std_logic;
        Q4 : OUT std_logic;
        Q5 : OUT std_logic;
        Q6 : OUT std_logic;
        Q7 : OUT std_logic
    );
END CDUD8;

ARCHITECTURE lattice_behav OF CDUD8 IS
    SIGNAL Q_i  : std_logic_vector(7 downto 0);
BEGIN

PROCESS (CLK, LD, D0, D1, D2, D3, D4, D5, D6, D7, EN, CD, CS, DNUP)
BEGIN
  IF (CD = '1') THEN
    Q_i <= "00000000";
  ELSIF rising_edge(CLK) THEN
    IF (CS = '1') THEN
      Q_i <= "00000000";
  	ELSIF (LD = '1') THEN
      Q_i <= D7&D6&D5&D4&D3&D2&D1&D0;	
	  ELSIF (EN = '1' AND ((Q_i(7)='0' AND Q_i(3)='0') OR (Q_i(7)='0' AND Q_i(2)='0' AND Q_i(1)='0' ) OR (Q_i(6)='0' AND Q_i(5)='0' AND Q_i(3)='0' ) OR (Q_i(6)='0' AND Q_i(5)='0' AND Q_i(2)='0'AND Q_i(1)='0'))) THEN
      IF (DNUP = '1') THEN 
	      IF(Q_i = "00000000") THEN
          Q_i <= "01100011";	
	      ELSE
	        Q_i <= Q_i - 1;
	      END IF;	
	    ELSE   
        IF(Q_i = "01100011") THEN
          Q_i <= "00000000";	
	      ELSE
	        Q_i <= Q_i + 1;
	      END IF;	
	    END IF;  
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

END lattice_behav;
