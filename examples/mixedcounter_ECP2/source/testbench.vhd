-- Testbench for simplecount
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end testbench;

architecture simple of testbench is
  signal clk: std_logic;
  signal reset: std_logic;
  signal direction: std_logic;
  signal count: std_logic_vector(7 downto 0);
  signal count2: std_logic_vector(15 downto 0);
  signal count3: std_logic_vector(31 downto 0);
  component typecount
        port (
        clk: in std_logic;
        reset: in std_logic;
        direction: in std_logic;
        count: out std_logic_vector(7 downto 0);
        count2: out std_logic_vector(15 downto 0);
        count3: out std_logic_vector(31 downto 0));
  end component;
      
begin
  clk_process: process
    begin
      clk <= '0';
      wait for 50 ns;
      clk <= '1';
      wait for 50 ns;
  end process;
  rst_process: process
    begin
    if (now = 0 ns) then
      reset <= '0';
      wait for 25 ns;
      reset <= '1';
      wait for 200 ns;
      reset <= '0';
      wait;
    end if;
  end process;
  direction_process: process
    begin
    if (now = 0 ns) then
      direction <= '1';
      wait for 40000 ns;
      direction <= '0';
      wait for 40000 ns;
      wait;
    end if;
  end process;
  U1: typecount
      port map (clk, reset, direction, count, count2, count3);
end simple;
