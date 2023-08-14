-- lower level counters

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.typepackage.all;

entity count16 is
  port (
  clk: in std_logic;
  reset: in std_logic;
  direction: in std_logic;
  count2: out std_logic_vector(15 downto 0));
end count16;

architecture rtl of count16 is
  signal count2ai: std16s;
  signal count2bi: std16t;
begin
  main1: process (clk, reset)
  begin
    if (reset = '1') then
      count2ai <= "0000000000000000";
      count2bi <= "0000000000000000";
    elsif (clk'event and clk = '1') then
      if (direction = '1') then
        count2ai <= std16s(unsigned(count2ai) + 1);
      else
        count2ai <= std16s(unsigned(count2ai) - 1);
      end if;
      count2bi <= std16st(count2ai);
      count2 <= std16ts(count2bi);
    end if;
  end process;
end rtl;

