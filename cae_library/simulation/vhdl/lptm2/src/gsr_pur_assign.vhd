library ieee;
use ieee.std_logic_1164.all;
use work.global.gsrnet;
use work.global.purnet;

entity gsr_pur_assign is
   port (gsr_sig, pur_sig : out std_logic);
end gsr_pur_assign;

architecture v of gsr_pur_assign is
begin
   gsr_sig <= gsrnet;
   pur_sig <= purnet;
end v;
