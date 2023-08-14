#log chip.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity chip is port (dummy: in std_logic); -- dummy port added because VHDL requires at least one port

end chip;

architecture arch of chip is

component _circuit_name port
(   rstn      : in  std_logic;
    scirmxdata: in  std_logic_vector( 7 downto 0);
    sciwdata  : out std_logic_vector( 7 downto 0);
    sciaddr   : out std_logic_vector(17 downto 0);
    sciwstn   : out std_logic;
    scird     : out std_logic;
    jcex      : out std_logic
);
end component;

signal R0          : std_logic_vector( 7 downto 0);
signal R1          : std_logic_vector( 7 downto 0);
signal R2          : std_logic_vector( 7 downto 0);
signal R3          : std_logic_vector( 7 downto 0);
signal sciwdata    : std_logic_vector( 7 downto 0);
signal scirmxdata  : std_logic_vector( 7 downto 0);
signal sciaddr     : std_logic_vector(17 downto 0);
signal sciwstn     : std_logic;
signal rstn        : std_logic;
signal scird       : std_logic;
signal jcex        : std_logic;

attribute syn_hier    : string;
attribute syn_noprune : boolean;
attribute syn_hier    of arch                  : architecture is "hard" ;
attribute syn_noprune of _circuit_name: component    is true   ;
attribute syn_noprune of rstn, scirmxdata, sciwdata, sciaddr, sciwstn, scird, jcex : signal is true;

begin

rstn       <= '1';
scirmxdata <= "00010010" when (sciaddr = "000000000000000000") else "00000000" or
              "00110100" when (sciaddr = "000000000000000001") else "00000000" or
              "01010110" when (sciaddr = "000000000000000010") else "00000000" or
              "01111000" when (sciaddr = "000000000000000011") else "00000000" or
                  R0     when (sciaddr = "000000000000000100") else "00000000" or
                  R1     when (sciaddr = "000000000000000101") else "00000000" or
                  R2     when (sciaddr = "000000000000000110") else "00000000" or
                  R3     when (sciaddr = "000000000000000111") else "00000000" ;

ORCAstra_inst: _circuit_name port map
(  rstn       => rstn       ,
   scirmxdata => scirmxdata ,
   sciwdata   => sciwdata   ,
   sciaddr    => sciaddr    ,
   sciwstn    => sciwstn    ,
   scird      => scird      ,
   jcex       => jcex       
);

process(sciwstn)
begin
   if falling_edge (sciwstn) then
      if ((jcex = '1') and (sciaddr = "000000000000000100")) then R0 <= sciwdata; end if;
      if ((jcex = '1') and (sciaddr = "000000000000000101")) then R1 <= sciwdata; end if;
      if ((jcex = '1') and (sciaddr = "000000000000000110")) then R2 <= sciwdata; end if;
      if ((jcex = '1') and (sciaddr = "000000000000000111")) then R3 <= sciwdata; end if;
   end if;
end process;

end arch;

