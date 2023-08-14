library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ram_16x2 is
 generic (INIT_VAL : string := "00000000000000000000000000000000" );
 port (DO0, DO1 : out std_logic; 
       DI0, DI1, WREN, WPE, AD0, AD1, AD2, AD3: in std_logic);
end ram_16x2;

architecture arch1 of ram_16x2 is
component RPE16X2
 port (DO0, DO1 : out std_logic; 
       DI0, DI1, WREN, WPE, AD0, AD1, AD2, AD3: in std_logic);
end component;
attribute black_box: boolean;
attribute black_box of RPE16X2 : component is TRUE;
attribute INITVAL : string;
attribute INITVAL of u1 : label is INIT_VAL;
begin

	u1: RPE16X2 port map (DO0, DO1, DI0, DI1, WREN, WPE, AD0, AD1, AD2, AD3);
end arch1;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ram_16x8 is
 port (o: out std_logic_vector(7 downto 0);
       wpe, wren: in std_logic;
       d: in std_logic_vector(7 downto 0);
       a: in std_logic_vector(3 downto 0));
end ram_16x8;

architecture arch1 of ram_16x8 is

component ram_16x2 
   generic (INIT_VAL: string := "00000000000000000000000000000000");
 port (DO0, DO1 : out std_logic; 
       DI0, DI1, WREN, WPE, AD0, AD1, AD2, AD3: in std_logic);
end component;

begin
	U0: ram_16x2 generic map ("00001111000011110000111100001111")
		    port map (o(0),o(1),d(0),d(1),wpe,wren,a(3),a(2),a(1),a(0));

	U1: ram_16x2 generic map ("10101010101010101010101010101010")
		    port map (o(2),o(3),d(2),d(3),wpe,wren,a(3),a(2),a(1),a(0));

	U2: ram_16x2 generic map ("11111111111111111111111111111111")
		    port map (o(4),o(5),d(4),d(5),wpe,wren,a(3),a(2),a(1),a(0));

	U3: ram_16x2 generic map ("00000000000000000011111111100000")
		    port map (o(6),o(7),d(6),d(7),wpe,wren,a(3),a(2),a(1),a(0));
end arch1; 
