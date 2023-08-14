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

component ECP2M_ORCAstra_JTAG_Hub_sub port
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

attribute syn_hier    : string;
attribute syn_noprune : boolean;
attribute JTAG_IP     : string;
attribute IP_ID       : string;
attribute HUB_ID      : string;
attribute syn_hier    of arch        : architecture is "hard" ;
attribute syn_noprune of ECP2M_ORCAstra_JTAG_Hub_sub: component    is true   ;
attribute JTAG_IP     of jtagconn16_inst  : label    is "ORCA" ;
attribute IP_ID       of jtagconn16_inst  : label    is "0"    ;
attribute HUB_ID      of jtagconn16_inst  : label    is "0"    ;
attribute syn_noprune of jtagconn16_inst  : label    is true   ;

attribute syn_noprune of jupdate_sig, jrstn_sig : signal is true;

begin

ORCAstra_sub_inst: ECP2M_ORCAstra_JTAG_Hub_sub port map
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

entity ECP2M_ORCAstra_JTAG_Hub_sub is port
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

end ECP2M_ORCAstra_JTAG_Hub_sub;

architecture arch of ECP2M_ORCAstra_JTAG_Hub_sub is

signal PC_Ready       : std_logic;
signal BS_Ring        : std_logic_vector(31 downto 0);
signal DataInReg      : std_logic_vector(25 downto 0);
signal c              : std_logic_vector( 4 downto 0);

signal scirmxdatareg  : std_logic_vector( 7 downto 0);
signal scirmxdata_l1  : std_logic_vector( 7 downto 0);

signal Shift_DRa       : std_logic;
signal JCE_1a          : std_logic;
signal JTDIa         : std_logic;
signal BS_Ring_0      : std_logic;

attribute syn_hier    : string;
attribute syn_hier    of arch        : architecture is "hard" ;

begin

jcex <= JCE_1a and ip_enable ;
er2_tdo <= BS_Ring_0 ;

process(jtck)
begin
  if falling_edge(jtck) then
    Shift_DRa <= jshift;
    JCE_1a    <= jce2;
    JTDIa      <= jtdi;
    BS_Ring_0 <= BS_Ring(0);
  elsif rising_edge(jtck) then
    if ((JCE_1a = '1') and (Shift_DRa = '0')) then
      c <= "00000";
    elsif ((JCE_1a = '1') and (Shift_DRa = '1')) then
      c <= c + '1';
    end if;
  end if;
end process;

process(jtck, rstn)
begin
  if (rstn = '0') then
    PC_Ready      <= '0' ;
    DataInReg     <= "00000000000000000000000000" ;
    BS_Ring       <= "00000000000000000000000000000000" ;
    scirmxdatareg <= "00000000";
    scirmxdata_l1 <= "00000000";
    sciwstn       <= '0';
    scird         <= '0';
  elsif rising_edge(jtck) then
    if ((JCE_1a = '1') and (Shift_DRa = '1')) then
      scirmxdata_l1 <= scirmxdata;
      scirmxdatareg <= scirmxdata_l1;
      if (c = "11101") then
        DataInReg(25 downto 0) <= BS_Ring(29 downto 4) ;
      end if;
      
      if (c = "11110") then
        if ((BS_Ring(30) = '1')) then
          scird   <=     BS_Ring(29) ;
          sciwstn <= not BS_Ring(29) ;
        end if;   -- 8/24/08
      else
        sciwstn <= '0';
      --end if;   -- 8/24/08
      end if;
      
      if (c = "11110") then
        BS_Ring <= "00000000000000000000" & "1100" & scirmxdatareg ;
      else
        BS_Ring <= (JTDIa & BS_Ring(31 downto 1)) ;
      end if;
      
    end if;
  end if;
end process;

  sciwdata    <= DataInReg( 7 downto 0) ;
  sciaddr     <= DataInReg(25 downto 8) ;

end arch;
--------------------------------------------------------------------------------------------
#include <pcs/chip.vhd>
#include <pcs/ORCAstra.tft>





















