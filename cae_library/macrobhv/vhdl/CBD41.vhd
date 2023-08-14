--***************************************************************
-- 1-bit down counters with synchronous clear, enable, parallel data load, synchronous preset, CAI, and CAO.
-- XiaoQiu ZHOU
--***************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY CBD41 IS 
    PORT (
        D0  : IN std_logic;
        CAI : IN std_logic;
        CLK : IN std_logic;
	PS  : IN std_logic;
	LD  : IN std_logic;
        EN  : IN std_logic;
	CS  : IN std_logic;
        Q0  : OUT std_logic;
        CAO : OUT std_logic
    );
END CBD41;

ARCHITECTURE lattice_behav OF CBD41 IS
    SIGNAL Q_i  : std_logic;
BEGIN

PROCESS (CLK, PS, LD, D0, EN, CS, CAI) 
BEGIN
  IF rising_edge(CLK) THEN
    IF (PS = '1') THEN
      Q_i <= '1';
    ELSIF (CS = '1') THEN
      Q_i <= '0';
    ELSIF (LD = '1') THEN
      Q_i <= D0;	
    ELSIF ( EN = '1' AND CAI = '1') THEN
      Q_i <= NOT Q_i;
    END IF;
  END IF;
end process;

Q0 <= Q_i;
CAO <= CAI AND EN AND (NOT Q_i);

END lattice_behav;
