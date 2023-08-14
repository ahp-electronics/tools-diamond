--***************************************************************
-- 4-bit up counters with synchronous clear, enable, parallel data load, synchronous preset, CAI, and CAO.
-- XiaoQiu ZHOU
--***************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY CBU44 IS 
    PORT (
        D0  : IN std_logic;
        D1  : IN std_logic;
        D2  : IN std_logic;
        D3  : IN std_logic;
        CAI : IN std_logic;
        CLK : IN std_logic;
        PS  : IN std_logic;
        LD  : IN std_logic;
        EN  : IN std_logic;
        CS  : IN std_logic;
        Q0  : OUT std_logic;
        Q1  : OUT std_logic;
        Q2  : OUT std_logic;
        Q3  : OUT std_logic;
        CAO : OUT std_logic
    );
END CBU44;

ARCHITECTURE lattice_behav OF CBU44 IS
    SIGNAL Q_i  : std_logic_vector(3 downto 0);
BEGIN

PROCESS (CLK, PS, LD, D0, D1, D2, D3, EN, CS, CAI)
BEGIN
  IF rising_edge(CLK) THEN
    IF (PS = '1') THEN
      Q_i <= "1111";
    ELSIF (CS = '1') THEN
      Q_i <= "0000";  
    ELSIF (LD = '1') THEN
      Q_i <= D3&D2&D1&D0;	
    ELSIF (EN = '1' AND CAI = '1') THEN
      Q_i <= Q_i + 1;
	  END IF;  
  END IF;
end process;

Q0 <= Q_i(0);
Q1 <= Q_i(1);
Q2 <= Q_i(2);
Q3 <= Q_i(3);
CAO <= CAI AND EN AND Q_i(0) AND Q_i(1) AND Q_i(2) AND Q_i(3);

END lattice_behav;
