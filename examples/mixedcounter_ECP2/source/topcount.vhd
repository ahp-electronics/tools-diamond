-- Simple selectable up or down counter

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.typepackage.all;

entity typecount is
  port (
  clk: in std_logic;
  reset: in std_logic;
  direction: in std_logic;
  count: out std_logic_vector(7 downto 0);
  count2: out std_logic_vector(15 downto 0);
  count3: out std_logic_vector(31 downto 0));
end typecount;

architecture rtl of typecount is
 signal count2t: std_logic_vector(15 downto 0);
 signal countt: std_logic_vector(7 downto 0);
 signal count3ai: std_logic_vector(0 to 31);

component count8 is
  port (
  clk: in std_logic;
  reset: in std_logic;
  direction: in std_logic;
  count: out std_logic_vector(7 downto 0));
end component;

component count16 is
  port (
  clk: in std_logic;
  reset: in std_logic;
  direction: in std_logic;
  count2: out std_logic_vector(15 downto 0));
end component;

attribute GSR : string;
attribute GSR of counter8: label is "DISABLED";

begin
  counter8: count8 port map (clk, reset, direction, countt);
  counter16: count16 port map (clk, reset, direction, count2t);
  count <= countt;
  count2 <= count2t;
  count3ai <= count2t & countt & countt;
  count3 <= count3ai;
end rtl;
