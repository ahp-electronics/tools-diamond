-- This example shows one how to force
-- a particular pad type for maps to
-- lucent.


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity adder8 is
        generic (num_bits : integer := 8) ;
        port ( a,b:      in std_logic_vector (num_bits -1 downto 0);
               result:     out std_logic_vector(num_bits -1 downto 0) );
attribute orca_padtype : string;
attribute orca_padtype of a : signal is "IBT";

end adder8;

architecture behave of adder8 is

begin
        result <= a + b;
end;
