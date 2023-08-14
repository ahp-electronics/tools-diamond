#log _circuit_name.vhd
library IEEE;
use IEEE.std_logic_1164.all;
-- synopsys translate_off
#ifdef _ec
#if #_ec == "1"
library EC;
use EC.components.all;
#endif
#endif
#ifdef _ecp
#if #_ecp == "1"
library ECP;
use ECP.components.all;
#endif
#endif
#ifdef _xp
#if #_xp == "1"
library XP;
use XP.components.all;
#endif
#endif
-- synopsys translate_on
#define -r _DDR_MSB=_ddr_data_width-1
#define -r _DQS_MSB=_number_of_dqs-1
#if #_io_buffer_config == "SSTL25_I"
#define -r _clk_buffer_config SSTL25D_I
#endif
#if #_io_buffer_config == "SSTL25_II"
#define -r _clk_buffer_config SSTL25D_II
#endif
entity _circuit_name is 
  port (
	dq  : INOUT std_logic_vector (_DDR_MSB downto 0);
	#if #_number_of_dqs == "1"
	dqs : INOUT std_logic;
	#else
	dqs : INOUT std_logic_vector (_DQS_MSB downto 0);
	#endif
	clk : IN std_logic;
	clk90 : IN std_logic;
	reset : IN std_logic;
	uddcntl : IN std_logic;
	#if #_number_of_dqs == "1"
	read : IN std_logic ;
	#else
	read : IN std_logic_vector (_DQS_MSB downto 0);
	#endif
	#if #_clock_en_ddr_inreg == "ON"
	ddr_enable : IN std_logic;
	#endif
	dataout_p : IN std_logic_vector (_DDR_MSB downto 0);
	dataout_n : IN std_logic_vector (_DDR_MSB downto 0);
	#if #_tristate_data_outreg == "ON"
	datatri_p : IN std_logic;
	datatri_n : IN std_logic;
	#else
	datatri : IN std_logic;
	#endif
	#if #_tristate_dqs == "ON"
	dqstri_p : IN std_logic;
	dqstri_n : IN std_logic;
	#else
	dqstri : IN std_logic;
	#endif
	datain_p : OUT std_logic_vector (_DDR_MSB downto 0);
	datain_n : OUT std_logic_vector (_DDR_MSB downto 0);
	lock : OUT std_logic;
	#if #_number_of_dqs == "1"
	dqsc : OUT std_logic;
	prmbdet : OUT std_logic;
	ddrclkpol : OUT std_logic;
	#else
	dqsc : OUT std_logic_vector (_DQS_MSB downto 0);
	prmbdet : OUT std_logic_vector (_DQS_MSB downto 0);
	ddrclkpol : OUT std_logic_vector (_DQS_MSB downto 0);
	#endif
	ddrclk : OUT std_logic);

attribute IO_TYPE: string;
attribute IO_TYPE OF dq : signal is #_io_buffer_config;
attribute IO_TYPE OF dqs : signal is #_io_buffer_config;
attribute IO_TYPE OF ddrclk : signal is #_clk_buffer_config;
attribute dont_touch : string;
attribute dont_touch of _circuit_name : entity is "true";

	end _circuit_name;
architecture _circuit_name##_arch of _circuit_name is
attribute syn_black_box : boolean;
attribute syn_tpd1 : string;
attribute syn_noprune : boolean;
attribute syn_noprune of  _circuit_name##_arch : architecture is true;

component DQSBUFB
    port(
          DQSI		:	in	STD_LOGIC;
          CLK		:	in	STD_LOGIC;
          READ	        :	in	STD_LOGIC;
          DQSDEL        :	in	STD_LOGIC;
          DQSO		:	out	STD_LOGIC;
          DDRCLKPOL	:	out	STD_LOGIC;
          DQSC		:	out	STD_LOGIC;
          PRMBDET	:	out	STD_LOGIC
        );
end component;
attribute syn_black_box of DQSBUFB: component is true;
attribute syn_tpd1 of DQSBUFB : component is "read->dqso=0.0";

component DQSDLL
    port(
          CLK		:	in	STD_LOGIC;
          RST	        :	in	STD_LOGIC;
          UDDCNTL       :	in	STD_LOGIC;
          LOCK		:	out	STD_LOGIC;
          DQSDEL	:	out	STD_LOGIC
        );
end component;
attribute syn_black_box of DQSDLL: component is true;
attribute syn_tpd1 of DQSDLL : component is "rst->lock=0.0";


component IDDRXB
    port(
          D		:	in	STD_LOGIC;
          ECLK	        :	in	STD_LOGIC;
          SCLK	        :	in	STD_LOGIC;
          LSR		:	in	STD_LOGIC;
          CE	        :	in	STD_LOGIC;
          DDRCLKPOL     :	in	STD_LOGIC;
          QA		:	out	STD_LOGIC;
          QB		:	out	STD_LOGIC
        );
end component;
attribute syn_black_box of IDDRXB: component is true;
attribute syn_tpd1 of IDDRXB : component is "LSR->QA=0.0";

component ODDRXB
    port(
          DA		:	in	STD_LOGIC;
          DB		:	in	STD_LOGIC;
          CLK	        :	in	STD_LOGIC;
          LSR	        :	in	STD_LOGIC;
          Q		:	out	STD_LOGIC
        );
end component;
attribute syn_black_box of ODDRXB: component is true;
attribute syn_tpd1 of ODDRXB : component is "LSR->Q=0.0";

component BB
    port(
          I             :       in      STD_LOGIC;
          T             :       in      STD_LOGIC;
          O             :       out     STD_LOGIC;
          B             :       inout   STD_LOGIC
        );
end component;
attribute syn_black_box of BB: component is true;

component VLO 
port (
   Z : out std_logic);
end component;
attribute syn_black_box of VLO: component is true;

component VHI 
port (
   Z : out std_logic);
end component;
attribute syn_black_box of VHI: component is true;

COMPONENT inv
PORT(
        a: IN std_logic;
        z: OUT std_logic
  );
END COMPONENT;
attribute syn_black_box of inv: component is true;


attribute	REGSET  : string;
attribute	LOCK_SENSITIVITY : string;
attribute	FREQUENCY_PIN_CLK : string;
attribute  syn_keep : boolean;

#for (i=0;i<=_DQS_MSB;i=i+1)
#define -r _DDR_MSB_TIMES=(j*8)
#define -r _DDR_MSB_TIMES1=_DDR_MSB_TIMES+1
#define -r _DDR_MSB_TIMES2=_DDR_MSB_TIMES+2
#define -r _DDR_MSB_TIMES3=_DDR_MSB_TIMES+3
#define -r _DDR_MSB_TIMES4=_DDR_MSB_TIMES+4
#define -r _DDR_MSB_TIMES5=_DDR_MSB_TIMES+5
#define -r _DDR_MSB_TIMES6=_DDR_MSB_TIMES+6
#define -r _DDR_MSB_TIMES7=_DDR_MSB_TIMES+7

attribute REGSET of IDDR_INST##i##0	: label is #_lsr_for_ddr_inreg;
attribute REGSET of IDDR_INST##i##1	: label is #_lsr_for_ddr_inreg;
attribute REGSET of IDDR_INST##i##2	: label is #_lsr_for_ddr_inreg;
attribute REGSET of IDDR_INST##i##3	: label is #_lsr_for_ddr_inreg;
attribute REGSET of IDDR_INST##i##4	: label is #_lsr_for_ddr_inreg;
attribute REGSET of IDDR_INST##i##5	: label is #_lsr_for_ddr_inreg;
attribute REGSET of IDDR_INST##i##6	: label is #_lsr_for_ddr_inreg;
attribute REGSET of IDDR_INST##i##7	: label is #_lsr_for_ddr_inreg;
#endfor
attribute LOCK_SENSITIVITY of MASTERDLLINST : label is #_lock_jitter_sensitivity;
attribute FREQUENCY_PIN_CLK of MASTERDLLINST : label is #_frquency_of_dqs;

signal clk_i : std_logic;
signal gnd_net : std_logic;
signal vcc_net : std_logic;
#if #_number_of_dqs == "1"
signal dqsin : std_logic;
signal dqsout : std_logic;
signal dqsbuf :  std_logic;
#else
signal dqsin : std_logic_vector (_DQS_MSB downto 0);
signal dqsout : std_logic_vector (_DQS_MSB downto 0);
signal dqsbuf :  std_logic_vector (_DQS_MSB downto 0);
#endif
signal dqsdel : std_logic;
#if #_number_of_dqs == "1"
signal ddrclkpol_sig : std_logic;
#else
signal ddrclkpol_sig : std_logic_vector (_DQS_MSB downto 0);
#endif
signal ddrin :  std_logic_vector (_DDR_MSB downto 0);
signal ddrout :  std_logic_vector (_DDR_MSB downto 0);
#if #_tristate_dqs == "ON"
#if #_number_of_dqs == "1"
signal	tridqs : std_logic;
#else
signal	tridqs : std_logic_vector (_DQS_MSB downto 0);
#endif
#endif
#if #_tristate_data_outreg == "ON"
signal	tridata :  std_logic_vector (_DDR_MSB downto 0);
#endif
signal	ce_net : std_logic;

attribute syn_keep of clk_i : signal is true;

begin

vlo_inst : VLO port map(Z => gnd_net);
vhi_inst : VHI port map(Z => vcc_net);

#if #_clock_en_ddr_inreg == "ON"
ce_net <= ddr_enable;
#else
ce_net <= vcc_net;
#endif
inv_inst : INV port map (A => clk, Z =>clk_i);

--Bidirectional Strobe, DQS
#for (j=0;j<=_DQS_MSB;j=j+1)
#define -r _DDR_MSB_TIMES=(j*8)
#define -r _DDR_MSB_TIMES1=_DDR_MSB_TIMES+1
#define -r _DDR_MSB_TIMES2=_DDR_MSB_TIMES+2
#define -r _DDR_MSB_TIMES3=_DDR_MSB_TIMES+3
#define -r _DDR_MSB_TIMES4=_DDR_MSB_TIMES+4
#define -r _DDR_MSB_TIMES5=_DDR_MSB_TIMES+5
#define -r _DDR_MSB_TIMES6=_DDR_MSB_TIMES+6
#define -r _DDR_MSB_TIMES7=_DDR_MSB_TIMES+7

#if #_number_of_dqs == "1"

SLAVE##j : DQSBUFB port map (
          DQSI=>dqsin,
          CLK=>clk,
          READ=>read,
          DQSDEL=>dqsdel,
          DQSO=>dqsbuf,
          DDRCLKPOL=>ddrclkpol_sig,
          DQSC=>dqsc,
          PRMBDET=>prmbdet
	  	);
		
IDDR_INST##j##0 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES),
	ECLK=>dqsbuf,
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig,
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES),
	QB=>datain_n(##_DDR_MSB_TIMES)
			);

IDDR_INST##j##1 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES1),
	ECLK=>dqsbuf,
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig,
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES1),
	QB=>datain_n(##_DDR_MSB_TIMES1)
			);
IDDR_INST##j##2 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES2),
	ECLK=>dqsbuf,
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig,
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES2),
	QB=>datain_n(##_DDR_MSB_TIMES2)
			);
IDDR_INST##j##3 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES3),
	ECLK=>dqsbuf,
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig,
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES3),
	QB=>datain_n(##_DDR_MSB_TIMES3)
			);
IDDR_INST##j##4 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES4),
	ECLK=>dqsbuf,
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig,
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES4),
	QB=>datain_n(##_DDR_MSB_TIMES4)
			);
IDDR_INST##j##5 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES5),
	ECLK=>dqsbuf,
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig,
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES5),
	QB=>datain_n(##_DDR_MSB_TIMES5)
			);
IDDR_INST##j##6 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES6),
	ECLK=>dqsbuf,
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig,
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES6),
	QB=>datain_n(##_DDR_MSB_TIMES6)
			);
IDDR_INST##j##7 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES7),
	ECLK=>dqsbuf,
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig,
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES7),
	QB=>datain_n(##_DDR_MSB_TIMES7)
			);

ddrclkpol <= ddrclkpol_sig;
#else
SLAVE##j : DQSBUFB port map (
          DQSI=>dqsin(##j),
          CLK=>clk,
          READ=>read(##j),
          DQSDEL=>dqsdel,
          DQSO=>dqsbuf(##j),
          DDRCLKPOL=>ddrclkpol_sig(##j),
          DQSC=>dqsc(##j),
          PRMBDET=>prmbdet(##j)
	  	);
		
IDDR_INST##j##0 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES),
	ECLK=>dqsbuf(##j),
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig(##j),
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES),
	QB=>datain_n(##_DDR_MSB_TIMES)
			);

IDDR_INST##j##1 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES1),
	ECLK=>dqsbuf(##j),
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig(##j),
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES1),
	QB=>datain_n(##_DDR_MSB_TIMES1)
			);
IDDR_INST##j##2 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES2),
	ECLK=>dqsbuf(##j),
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig(##j),
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES2),
	QB=>datain_n(##_DDR_MSB_TIMES2)
			);
IDDR_INST##j##3 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES3),
	ECLK=>dqsbuf(##j),
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig(##j),
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES3),
	QB=>datain_n(##_DDR_MSB_TIMES3)
			);
IDDR_INST##j##4 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES4),
	ECLK=>dqsbuf(##j),
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig(##j),
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES4),
	QB=>datain_n(##_DDR_MSB_TIMES4)
			);
IDDR_INST##j##5 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES5),
	ECLK=>dqsbuf(##j),
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig(##j),
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES5),
	QB=>datain_n(##_DDR_MSB_TIMES5)
			);
IDDR_INST##j##6 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES6),
	ECLK=>dqsbuf(##j),
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig(##j),
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES6),
	QB=>datain_n(##_DDR_MSB_TIMES6)
			);
IDDR_INST##j##7 : IDDRXB port map (
	D=>ddrin(##_DDR_MSB_TIMES7),
	ECLK=>dqsbuf(##j),
	SCLK=>clk,
	CE=>ce_net,
	DDRCLKPOL=>ddrclkpol_sig(##j),
	LSR=>reset,
	QA=>datain_p(##_DDR_MSB_TIMES7),
	QB=>datain_n(##_DDR_MSB_TIMES7)
			);

ddrclkpol(##j) <= ddrclkpol_sig(##j);
#endif
#endfor
	
-- Master DLL


MASTERDLLINST :	DQSDLL	port map (
			CLK=>clk,
			UDDCNTL=>uddcntl,
			RST=>reset,
			DQSDEL=>dqsdel,
			LOCK=>lock
			);

--TRISTATE Instantiations-----
#if #_tristate_data_outreg == "ON"
-- DDR Trisate for data, DQ
#for (k=0;k<=_DDR_MSB;k=k+1)
ODDR_DQ_TRI_INST##k : ODDRXB	port map (
				DA => datatri_p,
				DB => datatri_n,
				LSR => reset,
				CLK => clk_i,
				Q => tridata(##k)
				);


ODDR_DQ_INST##k : ODDRXB		port map (
				DA => dataout_p(##k),
				DB => dataout_n(##k),
				LSR => reset,
				CLK => clk_i,
				Q => ddrout(##k)
				);
			
-------Bidirectional Data Buffers -----
bidiInst##k 	: BB		port map (
				I=>ddrout(##k),
				T=>tridata(##k),
				O=>ddrin(##k),
				B=>dq(##k)
				);
#endfor
#else
#for (k=0;k<=_DDR_MSB;k=k+1)
-----------DQ output--------
ODDR_DQ_INST##k	: ODDRXB		port map (
				DA => dataout_p(##k),
				DB => dataout_n(##k),
				LSR => reset, 
				CLK => clk_i,
				Q => ddrout(##k)
				);
-------Bidirectional Data Buffers -----
bidiInst##k 	: BB		port map (
				I => ddrout(##k),
				T => datatri,
				O => ddrin(##k),
				B => dq(##k)
				);
#endfor
#endif

#if #_tristate_dqs == "ON"
--- DDR Trisate for strobe, DQS
#for (l=0;l<=_DQS_MSB;l=l+1)
#if #_number_of_dqs == "1"
ODDR_DQS_TRI_INST##l :	ODDRXB	port map (
				DA=>dqstri_p,
				DB=>dqstri_n,
				LSR=>reset,
				CLK=>clk90,
				Q=>tridqs
				);

--------------- DQS output-------------------
ODDR_DQS_INST##l :	ODDRXB port map (
				DA=>gnd_net,
				DB=>vcc_net,
				LSR=>reset,
				CLK=>clk90,
				Q=>dqsout
				);

-------Bidirectional DQS Buffers -----
bididqsInst##l :	BB	port map (
				I=>dqsout, 
				T=>tridqs, 
				O=>dqsin, 
				B=>dqs
				);
#else
ODDR_DQS_TRI_INST##l :	ODDRXB	port map (
				DA=>dqstri_p,
				DB=>dqstri_n,
				LSR=>reset,
				CLK=>clk90,
				Q=>tridqs(##l)
				);

--------------- DQS output-------------------
ODDR_DQS_INST##l :	ODDRXB port map (
				DA=>gnd_net,
				DB=>vcc_net,
				LSR=>reset,
				CLK=>clk90,
				Q=>dqsout(##l)
				);

-------Bidirectional DQS Buffers -----
bididqsInst##l :	BB	port map (
				I=>dqsout(##l), 
				T=>tridqs(##l), 
				O=>dqsin(##l), 
				B=>dqs(##l)
				);
#endif				
#endfor
#else
#for (l=0;l<=_DQS_MSB;l=l+1)
#if #_number_of_dqs == "1"
--------------- DQS output-------------------
ODDR_DQS_INST##l : 	ODDRXB 	port map (
				DA=>gnd_net,
				DB=>vcc_net,
				LSR=>reset,
				CLK=>clk90,
				Q=>dqsout
				);
-------Bidirectional DQS Buffers -----
bididqsInst##l :	BB 		port map (
				I=>dqsout, 
				T=>dqstri, 
				O=>dqsin, 
				B=>dqs
				);
#else
--------------- DQS output-------------------
ODDR_DQS_INST##l : 	ODDRXB 	port map (
				DA=>gnd_net,
				DB=>vcc_net,
				LSR=>reset,
				CLK=>clk90,
				Q=>dqsout(##l)
				);
-------Bidirectional DQS Buffers -----
bididqsInst##l :	BB 		port map (
				I=>dqsout(##l), 
				T=>dqstri, 
				O=>dqsin(##l), 
				B=>dqs(##l)
				);
#endif				
#endfor
#endif

--------------- CLKOUTP and CLKOUTN Generation-----------------
DDRCLKINST		:	ODDRXB		port map (
				DA=>gnd_net, 
				DB=>vcc_net, 
				LSR=>reset, 
				CLK=>clk90, 
				Q=>ddrclk
				);

end _circuit_name##_arch ;
	
	
