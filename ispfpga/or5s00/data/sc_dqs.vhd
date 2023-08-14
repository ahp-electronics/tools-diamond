#log _circuit_name.vhd
library IEEE;
use IEEE.std_logic_1164.all;
-- synopsys translate_off
library SC;
use SC.components.all;
-- synopsys translate_on
#define -r _DQS_MSB=_number_of_dqs-1
#define -r _DDR_MSB=(_number_of_dqs*8)-1
entity _circuit_name is 
  port (
  	#if #_number_of_dqs == "1"
	DQS	: INOUT std_logic;
	#else
	DQS	: INOUT std_logic_vector (_DQS_MSB downto 0);
	#endif
	CK	: IN std_logic;
	CK90	: IN std_logic;
	RST 	: IN std_logic;
	UPDATE_CNTL : IN std_logic;
#if #_postamble_solution == "Yes"
	CK_TURN_OFF : IN std_logic;
#endif
#if #_tristate_dqs == "ON"
	DQSTRI_POS : IN std_logic;
	DQSTRI_NEG : IN std_logic;
#else
	DQSTRI	: IN std_logic;	
#endif
#if #_postamble_solution == "Yes"
	#if #_number_of_dqs == "1"
	CK_OUT : OUT std_logic
	#else
	CK_OUT : OUT std_logic_vector (_DQS_MSB downto 0)
	#endif
#else
	#if #_number_of_dqs == "1"
	DQS_DEL: OUT std_logic
	#else
	DQS_DEL: OUT std_logic_vector (_DQS_MSB downto 0)
	#endif
#endif
	);
   attribute dont_touch : string;
   attribute dont_touch of _circuit_name : entity is "true";
	end _circuit_name;

architecture _circuit_name##_arch of _circuit_name is
attribute syn_black_box : boolean;
attribute syn_tpd1 : string;
attribute syn_noprune : boolean;
attribute syn_noprune of  _circuit_name##_arch : architecture is true;

COMPONENT bb
PORT(
        b:  INOUT std_logic ;
        i:  IN std_logic ;
        t:  IN std_logic ;
        o:  OUT std_logic);
END COMPONENT;
attribute syn_black_box of bb: component is true;

COMPONENT inv
PORT(
        a: IN std_logic;
        z: OUT std_logic
  );
END COMPONENT;
attribute syn_black_box of inv: component is true;

COMPONENT oddrxa
PORT(
        da              : IN std_logic;
        db              : IN std_logic;
        clk             : IN std_logic;
        rst             : IN std_logic;
        q               : OUT std_logic);
END COMPONENT;
attribute syn_black_box of oddrxa: component is true;
attribute syn_tpd1 of oddrxa : component is "rst->q=0.0";

COMPONENT delay
PORT(
        a                 : IN std_logic;
        dcntl0            : IN std_logic;
        dcntl1            : IN std_logic;
        dcntl2            : IN std_logic;
        dcntl3            : IN std_logic;
        dcntl4            : IN std_logic;
        dcntl5            : IN std_logic;
        dcntl6            : IN std_logic;
        dcntl7            : IN std_logic;
        dcntl8            : IN std_logic;
        z                 : OUT std_logic);
END COMPONENT;
attribute syn_black_box of delay: component is true;
attribute syn_tpd1 of delay : component is "a->z=0.0";

COMPONENT clkcntl
PORT(
        d               : IN std_logic;
        clk             : IN std_logic;
        ce              : IN std_logic;
        q               : OUT std_logic);
END COMPONENT;
attribute syn_black_box of clkcntl: component is true;
--attribute syn_tpd1 of clkcntl : component is "clk->q=0.0";

component VLO 
port (
   Z : out std_logic);
end component;
attribute syn_black_box of VLO : component is true;

component VHI 
port (
   Z : out std_logic);
end component;
attribute syn_black_box of VHI : component is true;

component TRDLLA
    -- synopsys translate_off
        generic (CLKOS_DIV : in Integer; CLKOS_FPHASE : in Integer; 
		 CLKOS_PHASE : in Integer; CLKOP_PHASE : in Integer);
    -- synopsys translate_on
        port (CLKI: in  std_logic; RSTN: in  std_logic; 
            ALUHOLD: in  std_logic; UDDCNTL: in  std_logic; 
            SMIADDR9: in  std_logic; SMIADDR8: in  std_logic; 
            SMIADDR7: in  std_logic; SMIADDR6: in  std_logic; 
            SMIADDR5: in  std_logic; SMIADDR4: in  std_logic; 
            SMIADDR3: in  std_logic; SMIADDR2: in  std_logic; 
            SMIADDR1: in  std_logic; SMIADDR0: in  std_logic; 
            SMIRD: in  std_logic; SMIWR: in  std_logic; 
            SMICLK: in  std_logic; SMIWDATA: in  std_logic; 
            SMIRSTN: in  std_logic; CLKOP: out  std_logic; 
            CLKOS: out  std_logic; LOCK: out  std_logic; 
            DCNTL0: out  std_logic; DCNTL1: out  std_logic; 
            DCNTL2: out  std_logic; DCNTL3: out  std_logic; 
            DCNTL4: out  std_logic; DCNTL5: out  std_logic; 
            DCNTL6: out  std_logic; DCNTL7: out  std_logic; 
            DCNTL8: out  std_logic; SMIRDATA: out  std_logic);
    end component;
    attribute syn_black_box of TRDLLA: component is true;
    attribute syn_tpd1 of trdlla : component is "clki->clkop=0.0";

attribute DELAYTYPE : string;
#for (z=0;z<=_DQS_MSB;z=z+1)
attribute DELAYTYPE of U1##z##DELAY : label is "DLL";
#endfor

attribute syn_keep : boolean;
signal gnd_net : std_logic;
signal vcc_net : std_logic;
#if #_postamble_solution == "Yes"
 #if #_number_of_dqs == "1"
signal dqs_del	: std_logic;
 #else
signal dqs_del	: std_logic_vector (_DQS_MSB downto 0);
 #endif
#endif
signal dcntl_bus : std_logic_vector (8 downto 0);

 #if #_number_of_dqs == "1"
signal dqsin	: std_logic;
signal dqsout	: std_logic;
 #else
signal dqsin	: std_logic_vector (_DQS_MSB downto 0);
signal dqsout	: std_logic_vector (_DQS_MSB downto 0);
 #endif
#if #_tristate_dqs == "ON"
 #if #_number_of_dqs == "1"
signal	tridqs	: std_logic;
 #else
signal	tridqs	: std_logic_vector (_DQS_MSB downto 0);
 #endif
#endif
#if #_postamble_solution == "Yes"
 #if #_number_of_dqs == "1"
signal	CK_OUT_DEL : std_logic;
signal	CK_OUT_TEMP : std_logic;
 #else
signal	CK_OUT_DEL : std_logic_vector (_DQS_MSB downto 0);
signal	CK_OUT_TEMP : std_logic_vector (_DQS_MSB downto 0);
 #endif

attribute syn_keep of CK_OUT_DEL : signal is true;
#endif
signal	CK_t : std_logic;
signal NOTRST : std_logic;

attribute FREQUENCY : string; 
attribute FREQUENCY_PIN_CLKI : string; 
attribute GSR : string; 
attribute CLKFB_PDEL : string; 
attribute CLKI_PDEL : string; 
attribute DCNTL_ADJVAL : string; 
attribute CLKOS_FPHASE_ADJVAL : string; 
attribute CLKOS_FDEL_ADJVAL : string; 
attribute GLITCH_TOLERANCE : string; 
attribute ALU_UNLOCK_CNT : string; 
attribute ALU_LOCK_CNT : string; 
attribute CLKOS_DIV : string; 
attribute CLKOS_FPHASE : string; 
attribute CLKOS_PHASE : string; 
attribute CLKOP_PHASE : string; 
attribute FREQUENCY_PIN_CLKI of DLL0 : label is #_frquency_of_dqs;
attribute GSR of DLL0 : label is "DISABLED";
attribute CLKFB_PDEL of DLL0 : label is "DEL0";
attribute CLKI_PDEL of DLL0 : label is "DEL0";
attribute DCNTL_ADJVAL of DLL0 : label is "0";
attribute CLKOS_FPHASE_ADJVAL of DLL0 : label is "0";
attribute CLKOS_FDEL_ADJVAL of DLL0 : label is "0";
attribute GLITCH_TOLERANCE of DLL0 : label is "0";
attribute ALU_UNLOCK_CNT of DLL0 : label is "3";
attribute ALU_LOCK_CNT of DLL0 : label is "3";
attribute CLKOS_DIV of DLL0 : label is "1";
attribute CLKOS_FPHASE of DLL0 : label is "0";
attribute CLKOS_PHASE of DLL0 : label is "0";
attribute CLKOP_PHASE of DLL0 : label is "90";
attribute FREQUENCY of CK_t : signal is #_frquency_of_dqs;
attribute syn_keep of CK_t : signal is true;

begin

vlo_inst : VLO port map(Z => gnd_net);
vhi_inst : VHI port map(Z => vcc_net);
inv_inst : INV port map (A => RST, Z =>NOTRST);
#if #_postamble_solution == "Yes"
CK_OUT <= CK_OUT_TEMP;
CK_OUT_DEL <= CK_OUT_TEMP after 1 ns;
#endif

CK_t <= CK;
--Master DLL

DLL0		: TRDLLA
        -- synopsys translate_off
        generic map (CLKOS_DIV=> 1,
                     CLKOS_FPHASE=> 0,
                     CLKOS_PHASE=> 0,
                     CLKOP_PHASE=> 90)
        -- synopsys translate_on
	port map (
		CLKI=>CK_t,
		RSTN=>NOTRST,
		ALUHOLD=>gnd_net,
		UDDCNTL=>UPDATE_CNTL,
		SMIADDR9=>gnd_net,
		SMIADDR8=>gnd_net,
		SMIADDR7=>gnd_net,
		SMIADDR6=>gnd_net,
		SMIADDR5=>gnd_net,
		SMIADDR4=>gnd_net,
		SMIADDR3=>gnd_net,
		SMIADDR2=>gnd_net,
		SMIADDR1=>gnd_net,
		SMIADDR0=>gnd_net,
		SMIRD=>gnd_net, 
		SMIWR=>gnd_net, 
		SMICLK=>gnd_net, 
        	SMIWDATA=>gnd_net, 
		SMIRSTN=>gnd_net,
		CLKOP=>open,
		CLKOS=>open,
		DCNTL0=>dcntl_bus(0), 
		DCNTL1=>dcntl_bus(1), 
		DCNTL2=>dcntl_bus(2), 
        	DCNTL3=>dcntl_bus(3), 
		DCNTL4=>dcntl_bus(4), 
		DCNTL5=>dcntl_bus(5), 
        	DCNTL6=>dcntl_bus(6), 
		DCNTL7=>dcntl_bus(7), 
		DCNTL8=>dcntl_bus(8), 
		SMIRDATA=>open,
		LOCK=>open);

--SLAVE DLL
#for (j=0;j<=_DQS_MSB;j=j+1)
 #if #_number_of_dqs == "1"
U10DELAY	: DELAY
	port map (
		A=>dqsin,
		DCNTL0=>dcntl_bus(0), 
		DCNTL1=>dcntl_bus(1),
                DCNTL2=>dcntl_bus(2), 
		DCNTL3=>dcntl_bus(3), 
		DCNTL4=>dcntl_bus(4),
                DCNTL5=>dcntl_bus(5), 
		DCNTL6=>dcntl_bus(6), 
		DCNTL7=>dcntl_bus(7),
                DCNTL8=>dcntl_bus(8), 
		Z=>DQS_DEL);
 #else
U1##j##DELAY	: DELAY
	port map (
		A=>dqsin(##j),
		DCNTL0=>dcntl_bus(0), 
		DCNTL1=>dcntl_bus(1),
                DCNTL2=>dcntl_bus(2), 
		DCNTL3=>dcntl_bus(3), 
		DCNTL4=>dcntl_bus(4),
                DCNTL5=>dcntl_bus(5), 
		DCNTL6=>dcntl_bus(6), 
		DCNTL7=>dcntl_bus(7),
                DCNTL8=>dcntl_bus(8), 
		Z=>DQS_DEL(##j));
 #endif
#if #_postamble_solution == "Yes"
--Clock Control Circuitary
 #if #_number_of_dqs == "1"
U00CLKCNTL	: CLKCNTL
	port map (
		 D=>DQS_DEL,
		 CLK=>CK_OUT_DEL,
		 CE=>CK_TURN_OFF,
		 Q=>CK_OUT_TEMP);
 #else		 
U0##j##CLKCNTL	: CLKCNTL
	port map (
		 D=>DQS_DEL(##j),
		 CLK=>CK_OUT_DEL(##j),
		 CE=>CK_TURN_OFF,
		 Q=>CK_OUT_TEMP(##j));
 #endif		 

#endif
#endfor

#if #_tristate_dqs == "ON"
#for (l=0;l<=_DQS_MSB;l=l+1)
 #if #_number_of_dqs == "1"
ODDR_DQS_TRI_INST##l : ODDRXA
	port map (
		DA=>DQSTRI_POS, 
		DB=>DQSTRI_NEG, 
		CLK=>CK90, 
		RST=>RST, 
		Q=>tridqs);

ODDR_DQS_INST##l : ODDRXA
	port map (
		DA=>gnd_net, 
		DB=>vcc_net, 
		CLK=>CK90, 
		RST=>RST, 
		Q=>dqsout);

bididqsInst##l : BB 
	port map (
		I=>dqsout, 
		T=>tridqs, 
		O=>dqsin, 
		B=>DQS);
 #else		
ODDR_DQS_TRI_INST##l : ODDRXA
	port map (
		DA=>DQSTRI_POS, 
		DB=>DQSTRI_NEG, 
		CLK=>CK90, 
		RST=>RST, 
		Q=>tridqs(##l));

ODDR_DQS_INST##l : ODDRXA
	port map (
		DA=>gnd_net, 
		DB=>vcc_net, 
		CLK=>CK90, 
		RST=>RST, 
		Q=>dqsout(##l));

bididqsInst##l : BB 
	port map (
		I=>dqsout(##l), 
		T=>tridqs(##l), 
		O=>dqsin(##l), 
		B=>DQS(##l));
 #endif

#endfor
#else
#for (l=0;l<=_DQS_MSB;l=l+1)
 #if #_number_of_dqs == "1"
ODDR_DQS_INST##l : ODDRXA 
	port map (
		DA=>gnd_net, 
		DB=>vcc_net, 
		CLK=>CK90, 
		RST=>RST, 
		Q=>dqsout);
bididqsInst##l : BB
	port map (
		I=>dqsout, 
		T=>DQSTRI, 
		O=>dqsin, 
		B=>DQS);
 #else
ODDR_DQS_INST##l : ODDRXA 
	port map (
		DA=>gnd_net, 
		DB=>vcc_net, 
		CLK=>CK90, 
		RST=>RST, 
		Q=>dqsout(##l));
bididqsInst##l : BB
	port map (
		I=>dqsout(##l), 
		T=>DQSTRI, 
		O=>dqsin(##l), 
		B=>DQS(##l));
 #endif		
#endfor
#endif
end _circuit_name##_arch ;

#log _circuit_name##_tmpl.vhd
-- VHDL module instantiation template
-- parameterized module component declaration
   component _circuit_name 
     port (
  	#if #_number_of_dqs == "1"
	DQS	: INOUT std_logic;
	#else
	DQS	: INOUT std_logic_vector (_DQS_MSB downto 0);
	#endif
	CK	: IN std_logic;
	CK90	: IN std_logic;
	RST 	: IN std_logic;
	UPDATE_CNTL : IN std_logic;
#if #_postamble_solution == "Yes"
	CK_TURN_OFF : IN std_logic;
#endif
#if #_tristate_dqs == "ON"
	DQSTRI_POS : IN std_logic;
	DQSTRI_NEG : IN std_logic;
#else
	DQSTRI	: IN std_logic;	
#endif
#if #_postamble_solution == "Yes"
	#if #_number_of_dqs == "1"
	CK_OUT : OUT std_logic
	#else
	CK_OUT : OUT std_logic_vector (_DQS_MSB downto 0)
	#endif
#else
	#if #_number_of_dqs == "1"
	DQS_DEL: OUT std_logic
	#else
	DQS_DEL: OUT std_logic_vector (_DQS_MSB downto 0)
	#endif
#endif
	);
   end component;
	
-- parameterized module component instance
__ : _circuit_name
    port map (
	DQS => __, CK => __, CK90 => __, RST => __, UPDATE_CNTL => __,	
#if #_postamble_solution == "Yes"
	CK_TURN_OFF => __,
#endif
#if #_tristate_dqs == "ON"
	DQSTRI_POS => __, DQSTRI_NEG => __,
#else
	DQSTRI => __,	
#endif
#if #_postamble_solution == "Yes"
	CK_OUT => __
#else
	DQS_DEL => __
#endif
	);

