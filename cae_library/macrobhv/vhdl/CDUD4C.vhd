--***************************************************************
-- 4-bit decade up/down counters with asynchronous clear, synchronous clear, enable, parallel data load, CAI, and CAO.
-- -XiaoQiu ZHOU
--***************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY CDUD4C IS 
    PORT (
        D0 : IN std_logic;
        D1 : IN std_logic;
        D2 : IN std_logic;
        D3 : IN std_logic;
        CAI : IN std_logic;
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
        CAO : OUT std_logic
    );
END CDUD4C;

ARCHITECTURE lattice_behav OF CDUD4C IS
    SIGNAL Q_i  : std_logic_vector(3 downto 0);
BEGIN

PROCESS (CLK, LD, D0, D1, D2, D3, CAI, EN, CD, CS, DNUP)
BEGIN
  IF (CD = '1') THEN
    Q_i <= "0000";
  ELSIF rising_edge(CLK) THEN
    IF (CS = '1') THEN
      Q_i <= "0000";
	  ELSIF (LD = '1') THEN
      Q_i <= D3&D2&D1&D0;	
    ELSIF (EN = '1' AND CAI = '1' AND (Q_i(3)='0' OR ( Q_i(2)='0' AND Q_i(1)='0' ))) THEN
      IF (DNUP = '1') THEN
	      IF (Q_i = "0000") THEN
          Q_i <= "1001";	
        ELSE
          Q_i <= Q_i - 1;
	      END IF;
	    ELSE
	      IF (Q_i = "1001") THEN
          Q_i <= "0000";	
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
CAO <= CAI AND EN AND (
((NOT DNUP) AND Q_i(0) AND (NOT Q_i(1)) AND (NOT Q_i(2)) AND Q_i(3))
OR
(DNUP AND (NOT Q_i(0)) AND (NOT Q_i(1)) AND (NOT Q_i(2)) AND (NOT Q_i(3)))
) ;
END lattice_behav;
