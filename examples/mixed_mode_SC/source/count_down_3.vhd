library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY count_down_3 IS
   PORT (
      clk                     : IN std_logic;   
      rst                     : IN std_logic;   
      c_down                  : OUT std_logic_vector(2 DOWNTO 0));   
END count_down_3;

ARCHITECTURE translated OF count_down_3 IS



BEGIN

   PROCESS (clk, rst)
      VARIABLE c_down_xhdl1_xhdl2  : unsigned(2 DOWNTO 0);
   variable c_down_xhdl1             :  unsigned(2 DOWNTO 0);   
   BEGIN
      IF (rst = '1') THEN
         c_down_xhdl1_xhdl2 := "111";    
      ELSIF (clk'EVENT AND clk = '1') THEN
         c_down_xhdl1_xhdl2 := c_down_xhdl1_xhdl2 - "011";    
      END IF;
      c_down_xhdl1 := c_down_xhdl1_xhdl2;
   c_down <= std_logic_vector(c_down_xhdl1);
   END PROCESS;

END translated;
