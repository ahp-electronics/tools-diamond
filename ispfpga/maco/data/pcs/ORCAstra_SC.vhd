#log _circuit_name.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity _circuit_name is port
(   rstn        : in  std_logic;
		clk					: in std_logic;
		
		umi_rdata		: in  std_logic_vector( 35 downto 0);
		umi_ack			: in  std_logic;
		umi_retry		: in  std_logic;
		umi_err			: in  std_logic;
		
		umi_clk			: out std_logic;
		umi_addr		: out	std_logic_vector( 17 downto 0);
		umi_wdata		: out std_logic_vector( 35 downto 0);
		umi_size		: out	std_logic_vector( 1 downto 0);
		
		umi_rst_n		: out std_logic;
		umi_wr_n 		: out std_logic;
		umi_burst		: out std_logic;
		umi_rdy  		: out std_logic;
		umi_lock 		: out std_logic;
		umi_irq  		: out std_logic
);   
     
end _circuit_name;

architecture arch of _circuit_name is

component ORCAstra_sub port
(   rstn      : in  std_logic;
		clk				: in 	std_logic;
		jtck			: in 	std_logic;
		jtdi			: in 	std_logic;
		jshift		: in 	std_logic;
		jupdate		: in 	std_logic;
		jrstn			: in 	std_logic;
		jce2			: in 	std_logic;
		ip_enable	: in	std_logic;
		er2_tdo		: out	std_logic;
		
		umi_rdata	: in 	std_logic_vector (35 downto 0);
		umi_ack		: in	std_logic;
		umi_retry	: in	std_logic;
		umi_err		: in	std_logic;
		
		umi_clk		: out	std_logic;
		umi_addr	: out	std_logic_vector (17 downto 0);
		umi_wdata	: out	std_logic_vector (35 downto 0);
		umi_size	: out	std_logic_vector	(1 downto 0);
		umi_rst_n	: out	std_logic;
		umi_wr_n 	: out	std_logic;
		umi_burst	: out	std_logic;
		umi_rdy		: out	std_logic;
		umi_lock	: out	std_logic; 
		umi_irq		: out	std_logic 
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


signal jtck      : std_logic;
signal jtdi      : std_logic;
signal jshift    : std_logic;
signal jupdate   : std_logic;
signal jrstn     : std_logic;
signal jce2      : std_logic;
signal ip_enable : std_logic;
signal er2_tdo   : std_logic;

attribute syn_hier    : string;
attribute syn_noprune : boolean;
attribute JTAG_IP     : string;
attribute IP_ID       : string;
attribute HUB_ID      : string;
attribute syn_hier    of arch        : architecture is "hard" ;
attribute syn_noprune of ORCAstra_sub: component    is true   ;
attribute JTAG_IP     of jtagconn16_inst  : label    is "ORCA" ;
attribute IP_ID       of jtagconn16_inst  : label    is "0"    ;
attribute HUB_ID      of jtagconn16_inst  : label    is "0"    ;
attribute syn_noprune of jtagconn16_inst  : label    is true   ;

begin


jtagconn16_inst : jtagconn16 port map

(		er2_tdo => er2_tdo,
    jtck    =>  jtck,
    jtdi    =>  jtdi,
    jshift  =>  jshift,
    jupdate =>  jupdate,
    jrstn   =>  jrstn,
    jce2    =>  jce2,
    ip_enable => ip_enable
);

ORCAstra_sub_inst : ORCAstra_sub port map
(  	rstn		=>	rstn			,
		clk			=>	clk				,
   	jtck      => jtck     ,
   	jtdi      => jtdi     ,
   	jshift    => jshift   ,
   	jupdate   => jupdate  ,
   	jrstn     => jrstn    ,
   	jce2      => jce2     ,
   	ip_enable => ip_enable,
   	er2_tdo   => er2_tdo  ,
     
    umi_rdata =>	umi_rdata,
    umi_ack   =>	umi_ack  ,
    umi_retry =>	umi_retry,
    umi_err   =>	umi_err  ,
    umi_clk   =>	umi_clk  ,
    
    umi_addr  =>	umi_addr ,
    umi_wdata =>	umi_wdata,
    umi_size  =>	umi_size ,
    umi_rst_n => umi_rst_n,
    umi_wr_n  => umi_wr_n ,
    umi_burst => umi_burst,
    umi_rdy   => umi_rdy  ,
    umi_lock  => umi_lock ,
    umi_irq   =>	umi_irq  
);  
    
end arch;

--------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity ORCAstra_sub is port
(  rstn      : in  std_logic;
		clk				: in 	std_logic;
		jtck			: in 	std_logic;
		jtdi			: in 	std_logic;
		jshift		: in 	std_logic;
		jupdate		: in 	std_logic;
		jrstn			: in 	std_logic;
		jce2			: in 	std_logic;
		ip_enable	: in	std_logic;
		er2_tdo		: out	std_logic;
		
		umi_rdata	: in 	std_logic_vector (35 downto 0);
		umi_ack		: in	std_logic;
		umi_retry	: in	std_logic;
		umi_err		: in	std_logic;
		umi_clk		: out	std_logic;
		
		umi_addr	: out	std_logic_vector (17 downto 0);
		umi_wdata	: out	std_logic_vector (35 downto 0);
		umi_size	: out	std_logic_vector	(1 downto 0);
		umi_rst_n	: out	std_logic;
		umi_wr_n 	: out	std_logic;
		umi_burst	: out	std_logic;
		umi_rdy		: out	std_logic;
		umi_lock	: out	std_logic; 
		umi_irq		: out	std_logic  
);

end ORCAstra_sub;

architecture arch of ORCAstra_sub is

signal 	PC_Ready       : std_logic;
signal 	BS_Ring1       : std_logic_vector(31 downto 0);
signal 	DataInReg      : std_logic_vector(26 downto 0);
signal 	c              : std_logic_vector( 4 downto 0);

signal	UMackReg				: std_logic;
signal	UMretryReg			: std_logic;
signal	UMerrReg				: std_logic;
signal	UMready2				: std_logic;

signal	PCready2				: std_logic;
signal	PCready3				: std_logic;
signal	PCready4				: std_logic;
signal	UMset						: std_logic;
signal	UMclear					: std_logic;
signal	UMlockI					: std_logic;
signal	Enable_1				: std_logic;
signal	umi_rdy_dummy			: std_logic;--rag extra
signal  PC_Read					: std_logic;--rag extra

attribute syn_hier    : string;
attribute syn_hier    of arch        : architecture is "hard" ;

begin

umi_rdy <= umi_rdy_dummy; --rag
er2_tdo 	<= 	BS_Ring1(0);
umi_clk 	<= 	clk;
umi_addr 	<=	DataInReg(25 downto 8);
umi_wdata	<=	"0000" & DataInReg(7 downto 0) & DataInReg(7 downto 0) & DataInReg(7 downto 0) & DataInReg(7 downto 0);
umi_size 	<= 	"00";
umi_rst_n	<= 	rstn;
umi_burst <= 	'0';
umi_lock 	<=	'0';
umi_irq		<=	'0';
PC_Read	<=	DataInReg(26);

UMset 		<=	PCready3 and (not PCready4) ;
UMclear 	<= (not PCready3) and PCready4 ;

proc0: process(jtck)
begin
	if falling_edge(jtck) then
		Enable_1 <= jshift and ip_enable and jce2;
	end if;
end process proc0;
		
proc1:   process(jtck)                                     -- 2009-05-19
begin
    if rising_edge(jtck) then                              -- 2009-05-19
     if (Enable_1 = '0') then                              -- 2009-05-19
      c <= "00000";
      else                                                 -- 2009-05-19
        c <= c + 1;
      end if;
   end if;
end process proc1;

proc2:	process(jtck, rstn)
begin
	if (rstn = '0') then
			PC_Ready 	<= '0' ;
      DataInReg <= "000000000000000000000000000" ;
      BS_Ring1 	<= "00000000000000000000000000000000" ;		
      elsif rising_edge(jtck) then
--      	if ((jshift = '1') and (ip_enable = '1') and (jce2 = '1')) then
      	if (Enable_1 = '1') then
      		if (c = "11101") then
      			PC_Ready <= '0' ;
          	DataInReg <= BS_Ring1(29 downto 3) ;
          	elsif (c = "11110") then
          		PC_Ready <= BS_Ring1(30) ;
          		BS_Ring1 <= "0000000000000000000" & UMackReg & UMackReg & UMretryReg & UMerrReg & umi_rdata(7 downto 0) & '0' ;
          		else
          		BS_Ring1 <= jtdi & BS_Ring1(31 downto 1) ;
          end if;
        end if;
  end if;
end process proc2;
          		
proc3 :	process(clk, rstn)
begin
	 if (rstn = '0') then
	     PCready2 <= '0' ;
       PCready3 <= '0' ;
       PCready4 <= '0' ;
       umi_rdy_dummy 	<= '0' ;	
       elsif rising_edge(clk) then
       		PCready2 <= PC_Ready ;
     			PCready3 <= PCready2 ;
     			PCready4 <= PCready3 ;
     			umi_rdy_dummy <= UMlockI and umi_ack and (not UMready2) ;
     			
   end if;
end process proc3;

proc4 : process(clk, rstn)
begin
	if (rstn = '0') then
			UMready2 <= '0' ;
    	elsif rising_edge(clk) then
    		if (UMclear = '1') then
    			UMready2 <= '0' ;
    			elsif ((UMlockI = '1') and (umi_ack = '1')) then
    				UMready2 <= '1' ;
    				elsif ((umi_ack = '1') and (umi_rdy_dummy = '0') and (UMready2 = '1')) then
    					UMready2 <= '0' ;
				end if;
	end if;
end process proc4;       	

proc5	:	process(clk,rstn)
begin
	if (rstn = '0') then
			umi_wr_n 	<= '0' ;
      UMlockI 	<= '0' ;
      elsif rising_edge(clk) then
      	if (UMclear = '1') then
      		umi_wr_n <= '0' ;
         	UMlockI <= 	'0' ;
      			elsif (UMset = '1') then
      				umi_wr_n <= not PC_Read ;
         			UMlockI <= '1' ;
         			elsif ((umi_ack = '1') and (umi_rdy_dummy = '0') and (UMready2 = '1')) then
         				umi_wr_n 	<= '0' ;
         				UMlockI 	<= '0' ;	
       	end if;
	end if;				
end process proc5;

proc6 : process(clk,rstn)
begin
	if (rstn = '0') then
		UMackReg 		<= '0' ;
    UMretryReg 	<= '0' ;
    UMerrReg 		<= '0' ;
		elsif rising_edge(clk) then
      	if (UMclear = '1') then
      		UMackReg 		<= '0' ;
         	UMretryReg 	<= '0' ;
         	UMerrReg 		<= '0' ;
         	elsif ((umi_ack = '1') and (umi_rdy_dummy = '0') and (UMready2 = '1')) then
         		UMackReg 		<= '1' ;
         		UMretryReg 	<= umi_retry ;
         		UMerrReg 		<= umi_err ;
       	end if;
	end if;
end process proc6;

end arch;
--------------------------------------------------------------------------------------------
#include <pcs/ORCAstra.tft>





















