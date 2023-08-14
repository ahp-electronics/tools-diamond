#log _circuit_name.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity _circuit_name is port
(   rstn        : in  std_logic;
    scirmxdata  : in  std_logic_vector( 7 downto 0);
    sciwdata    : out std_logic_vector( 7 downto 0);
    sciaddr     : out std_logic_vector(17 downto 0);
    sciwstn     : out std_logic;
    scird       : out std_logic;
    jcex        : out std_logic
);

end _circuit_name;

architecture arch of _circuit_name is

component ORCAstra_JTAGE_Hub_sub port
(   rstn      : in  std_logic;
    scirmxdata: in  std_logic_vector( 7 downto 0);
    sciwdata  : out std_logic_vector( 7 downto 0);
    sciaddr   : out std_logic_vector(17 downto 0);
    sciwstn   : out std_logic;
    scird     : out std_logic;
    jcex      : out std_logic;
    jtck      : in  std_logic;
    jtdi      : in  std_logic;
    jshift    : in  std_logic;
    jupdate   : in  std_logic;
    jrstn     : in  std_logic;
    jce2      : in  std_logic;
    ip_enable : in  std_logic;
    er2_tdo   : out std_logic
);
end component;

component jtagconn16 port
(   er2_tdo  : in  std_logic;
    jtck     : out std_logic;
    jtdi     : out std_logic;
    jshift   : out std_logic;
    jupdate  : out std_logic;
    jrstn    : out std_logic;
    jce2     : out std_logic;
    ip_enable: out std_logic
);
end component;
attribute syn_black_box : boolean;
attribute syn_black_box of jtagconn16 : component is true; 

signal jtck_sig      : std_logic;
signal jtdi_sig      : std_logic;
signal jshift_sig    : std_logic;
signal jupdate_sig   : std_logic;
signal jrstn_sig     : std_logic;
signal jce2_sig      : std_logic;
signal ip_enable_sig : std_logic;
signal er2_tdo_sig   : std_logic;

attribute syn_hier      : string;
attribute syn_noprune   : boolean;
attribute JTAG_IP       : string;
attribute IP_ID         : string;
attribute HUB_ID        : string;
attribute syn_hier      of arch                  : architecture is "hard" ;
attribute syn_noprune   of ORCAstra_JTAGE_Hub_sub: component    is true   ;
attribute syn_noprune   of jtagconn16_inst            : label    is true   ;
attribute JTAG_IP       of jtagconn16_inst            : label    is "ORCA" ;
attribute IP_ID         of jtagconn16_inst            : label    is "0"    ;
attribute HUB_ID        of jtagconn16_inst            : label    is "0"    ;

begin

ORCAstra_sub_inst: ORCAstra_JTAGE_Hub_sub port map
(  rstn       => rstn       ,
   scirmxdata => scirmxdata ,
   sciwdata   => sciwdata   ,
   sciaddr    => sciaddr    ,
   sciwstn    => sciwstn    ,
   scird      => scird      ,
   jcex       => jcex       ,
   jtck       => jtck_sig       ,
   jtdi       => jtdi_sig       ,
   jshift     => jshift_sig     ,
   jupdate    => jupdate_sig    ,
   jrstn      => jrstn_sig      ,
   jce2       => jce2_sig       ,
   ip_enable  => ip_enable_sig  ,
   er2_tdo    => er2_tdo_sig    
);

jtagconn16_inst: jtagconn16 port map
(  er2_tdo   => er2_tdo_sig   ,
   jtck      => jtck_sig      ,
   jtdi      => jtdi_sig      ,
   jshift    => jshift_sig    ,
   jupdate   => jupdate_sig   ,
   jrstn     => jrstn_sig     ,
   jce2      => jce2_sig      ,
   ip_enable => ip_enable_sig 
);

end arch;

--------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity ORCAstra_JTAGE_Hub_sub is port
(  rstn         : in   std_logic;
   scirmxdata   : in   std_logic_vector( 7 downto 0);
   sciwdata     : out  std_logic_vector( 7 downto 0);
   sciaddr      : out  std_logic_vector(17 downto 0);
   sciwstn      : out  std_logic;
   scird        : out  std_logic;
   jcex         : out  std_logic;
   jtck         : in   std_logic;
   jtdi         : in   std_logic;
   jshift       : in   std_logic;
   jupdate      : in   std_logic;
   jrstn        : in   std_logic;
   jce2         : in   std_logic;
   ip_enable    : in   std_logic;
   er2_tdo      : out  std_logic
);

end ORCAstra_JTAGE_Hub_sub;

architecture arch of ORCAstra_JTAGE_Hub_sub is

signal bs_ring       : std_logic_vector(31 downto 0);
signal DataInReg     : std_logic_vector(25 downto 0);
signal shift_cnt     : std_logic_vector(4 downto 0);
signal scirmxdatareg : std_logic_vector(7 downto 0);

signal jtdi_reg      : std_logic;
signal shift_dr_reg  : std_logic;
signal jcex_reg      : std_logic;

attribute syn_noprune         : boolean;
attribute syn_hier            : string;
attribute syn_hier    of arch : architecture is "hard" ;

begin

jcex <= jcex_reg;
er2_tdo <= bs_ring(0);

process(jtck)
begin
    if falling_edge (jtck) then
        shift_dr_reg <= jshift;
        jcex_reg     <= jce2 and ip_enable;
        jtdi_reg     <= jtdi;
        if (shift_cnt = "11110") then
            scirmxdatareg <= scirmxdata;
        end if;
    elsif rising_edge (jtck) then
        if ((jcex_reg = '1') and (shift_dr_reg = '0')) then
            shift_cnt <= "00000";
        elsif ((jcex_reg = '1') and (shift_dr_reg = '1')) then
            shift_cnt <= shift_cnt + 1;
        end if;
    end if;
end process;

process(jtck,rstn)
begin
    if (rstn = '0') then
        scird            <= '1';
        DataInReg    <=    "00000000000000000000000000";
        bs_ring        <=    "00000000000000000000000000000000";
        scird            <=    '0';
        sciwstn        <=    '0';
    elsif rising_edge(jtck) then
        if ((jcex_reg = '1') and (shift_dr_reg = '1')) then
            if (shift_cnt = "11110") then
                DataInReg (25 downto 0) <= bs_ring (28 downto 3);
                if (bs_ring(30) = '1') then
                    scird    <=    bs_ring(29);
                    sciwstn <= not bs_ring(29);
                end if;
            else
                if (shift_cnt = "11111") then
                    bs_ring <= "000000000000000000001100" & scirmxdatareg;
                else
                    bs_ring <= jtdi_reg & bs_ring(31 downto 1);
                    sciwstn    <= '0';
                end if;
            end if;
        end if;
    end if;
    
end process;    

sciwdata <= DataInReg(7 downto 0);
sciaddr  <= DataInReg(25 downto 8);

end arch;

#include <pcs/chip.vhd>
#include <pcs/ORCAstra.tft>

