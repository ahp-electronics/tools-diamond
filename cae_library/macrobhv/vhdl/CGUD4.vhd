--***************************************************************
-- 4-bit gray code up/down counter with asynchronous clear, synchronous clear and preset, enable, and parallel data load.
-- XiaoQiu ZHOU
--***************************************************************
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY CGUD4 IS 
    PORT (
        D0 : IN std_logic;
        D1 : IN std_logic;
        D2 : IN std_logic;
        D3 : IN std_logic;
        CLK : IN std_logic;
        PS : IN std_logic;
        LD : IN std_logic;
        EN : IN std_logic;
        DNUP : IN std_logic;
        CD : IN std_logic;
        CS : IN std_logic;
        Q0 : OUT std_logic;
        Q1 : OUT std_logic;
        Q2 : OUT std_logic;
        Q3 : OUT std_logic
    );
END CGUD4;

ARCHITECTURE lattice_behav OF CGUD4 IS
    SIGNAL Q_i  : std_logic_vector(3 downto 0);
BEGIN

PROCESS (CLK, PS, LD, D0, D1, D2, D3, EN, CD, CS, DNUP)
BEGIN
  IF (CD = '1') THEN
    Q_i <= "0000";
  ELSIF rising_edge(CLK) THEN
    IF (PS = '1') THEN
      Q_i <= "1111";
    ELSIF (CS = '1') THEN
      Q_i <= "0000";
    ELSIF (LD = '1') THEN
      Q_i <= D3&D2&D1&D0;	
    ELSIF (EN = '1') THEN	      
      IF (DNUP = '1') THEN
      Case Q_i Is
	    When "0000" => Q_i <= "1000";
	    When "0001" => Q_i <= "0000";
	    When "0011" => Q_i <= "0001";
	    When "0010" => Q_i <= "0011";
	    When "0110" => Q_i <= "0010";
	    When "0111" => Q_i <= "0110";
	    When "0101" => Q_i <= "0111";
	    When "0100" => Q_i <= "0101";
	    When "1100" => Q_i <= "0100";
	    When "1101" => Q_i <= "1100";
	    When "1111" => Q_i <= "1101";
	    When "1110" => Q_i <= "1111";
	    When "1010" => Q_i <= "1110";
	    When "1011" => Q_i <= "1010";
	    When "1001" => Q_i <= "1011";
	    When "1000" => Q_i <= "1001";
	    When Others => Q_i <= "0000";
      end case;	   	
      ELSE
      Case Q_i Is
      When "0000" => Q_i <= "0001";
	    When "0001" => Q_i <= "0011";
	    When "0011" => Q_i <= "0010";
	    When "0010" => Q_i <= "0110";
	    When "0110" => Q_i <= "0111";
 	    When "0111" => Q_i <= "0101";
	    When "0101" => Q_i <= "0100";
	    When "0100" => Q_i <= "1100";
	    When "1100" => Q_i <= "1101";
	    When "1101" => Q_i <= "1111";
	    When "1111" => Q_i <= "1110";
	    When "1110" => Q_i <= "1010";
	    When "1010" => Q_i <= "1011";
	    When "1011" => Q_i <= "1001";
	    When "1001" => Q_i <= "1000";
	    When "1000" => Q_i <= "0000";
	    When Others => Q_i <= "0000";
      end case;	
      END IF;
    END IF;    
  END IF;
end process;

Q0 <= Q_i(0);
Q1 <= Q_i(1);
Q2 <= Q_i(2);
Q3 <= Q_i(3);

END lattice_behav;
