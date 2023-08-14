library IEEE;
use IEEE.STD_LOGIC_1164.all;
package Components is
function Str2int( L : string) return integer;
function Str2real( L : string) return REAL;
function str2std(L: string) return std_logic_vector;
   attribute syn_black_box: boolean ;
   attribute syn_black_box of Components : package is true;
   attribute black_box_pad_pin: string;

---------------------------------------------------------------------------
----- Component SPLL -----
component SPLL
   generic (in_freq : string;
            clk_out_to_pin: STRING := "OFF";
            wake_on_lock: STRING := "OFF");
   port(
      CLK_IN                         :	in    STD_ULOGIC;
      CLK_OUT                        :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of SPLL : component is true;
   attribute black_box_pad_pin of SPLL : component is "CLK_IN"; 

----- Component STDPLL -----
component STDPLL
   generic (in_freq  : string  := "100.0";
            clk_out_to_pin: STRING := "OFF";
            wake_on_lock: STRING := "OFF";
            mult     : string  := "1";
            div      : string  := "1";
            post     : string  := "1";
            secdiv   : string  := "1";
            lock_cyc : integer := 1;
            pll_dly  : string  := "0.0");
   port(
      CLK_IN                         :	in    STD_ULOGIC;
      CLK_OUT                        :	out   STD_ULOGIC;
      PLL_LOCK                       :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of STDPLL : component is true;
   attribute black_box_pad_pin of STDPLL : component is "CLK_IN"; 

----- Component STDPLLX -----
component STDPLLX
   generic (in_freq  : string  := "100.0";
            clk_out_to_pin: STRING := "OFF";
            wake_on_lock: STRING := "OFF";
            mult     : string  := "1";
            div      : string  := "1";
            post     : string  := "1";
            secdiv   : string  := "1";
            lock_cyc : integer := 1;
            pll_dly  : string  := "0.0");
   port(
      CLK_IN                         :	in    STD_ULOGIC;
      PLL_FBK                        :	in    STD_ULOGIC;
      PLL_RST                        :	in    STD_ULOGIC;
      CLK_OUT                        :	out   STD_ULOGIC;
      SEC_OUT                        :	out   STD_ULOGIC;
      PLL_LOCK                       :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of STDPLLX : component is true;
   attribute black_box_pad_pin of STDPLLX : component is "CLK_IN"; 

----- Component AND2 -----
component AND2
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of AND2 : component is true;

----- Component AND3 -----
component AND3
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of AND3 : component is true;

----- Component AND4 -----
component AND4
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of AND4 : component is true;

----- Component AND5 -----
component AND5
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of AND5 : component is true;

----- Component AND6 -----
component AND6
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of AND6 : component is true;

----- Component AND7 -----
component AND7
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of AND7 : component is true;

----- Component AND8 -----
component AND8
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of AND8 : component is true;

----- Component BI_DIR -----
component BI_DIR
   generic (PULL   : string  := "Off";
            OUTOPEN : string := "Off");
   port(
      I0                             :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      IO                             :	inout STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of BI_DIR : component is true;
   attribute black_box_pad_pin of BI_DIR : component is "IO";

----- Component MUX2 -----
component MUX2
   port(
      I0                             :	in    STD_LOGIC;
      I1                             :	in    STD_LOGIC;
      S0                             :	in    STD_LOGIC;
      O                              :	out   STD_LOGIC);
end component;
   attribute syn_black_box of MUX2 : component is true;

----- Component MUX4 -----
component MUX4
   port(
      I0                             :	in    STD_LOGIC;
      I1                             :	in    STD_LOGIC;
      I2                             :	in    STD_LOGIC;
      I3                             :	in    STD_LOGIC;
      S0                             :	in    STD_LOGIC;
      S1                             :	in    STD_LOGIC;
      O                              :	out   STD_LOGIC);
end component;
   attribute syn_black_box of MUX4 : component is true;

----- Component BUFF -----
component BUFF
   port(
      I0                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of BUFF : component is true;

----- Component BUFTH -----
component BUFTH
   generic (OUTOPEN   : string  := "Off");
   port(
      I0                             :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of BUFTH : component is true;
   attribute black_box_pad_pin of BUFTH : component is "O";

----- Component BUFTL -----
component BUFTL
   generic (OUTOPEN   : string  := "Off");
   port(
      I0                             :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of BUFTL : component is true;
   attribute black_box_pad_pin of BUFTL : component is "O";

----- Component CLKI -----
component CLKI
   port(
      PAD                            :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of CLKI : component is true;
   attribute black_box_pad_pin of CLKI : component is "PAD";

----- Component DFF -----
component DFF
   generic (R_DELAY : TIME := 2 ns);
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DFF : component is true;

----- Component DFFC -----
component DFFC
   generic (R_DELAY : TIME := 2 ns);
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DFFC : component is true;

----- Component DFFCR -----
component DFFCR
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DFFCR : component is true;

----- Component DFFCRH -----
component DFFCRH
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DFFCRH : component is true;

----- Component DFFCRS -----
component DFFCRS
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DFFCRS : component is true;

----- Component DFFCRSH -----
component DFFCRSH
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DFFCRSH : component is true;

----- Component DFFCS -----
component DFFCS
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DFFCS : component is true;

----- Component DFFCSH -----
component DFFCSH
   port(
      CE                             :	in    STD_ULOGIC;
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DFFCSH : component is true;

----- Component DFFR -----
component DFFR
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DFFR : component is true;

----- Component DFFRH -----
component DFFRH
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DFFRH : component is true;

----- Component DFFRS -----
component DFFRS
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DFFRS : component is true;

----- Component DFFRSH -----
component DFFRSH
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DFFRSH : component is true;

----- Component DFFS -----
component DFFS
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DFFS : component is true;

----- Component DFFSH -----
component DFFSH
   port(
      D                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DFFSH : component is true;

----- Component DLAT -----
component DLAT
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DLAT : component is true;

----- Component DLATR -----
component DLATR
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DLATR : component is true;

----- Component DLATRH -----
component DLATRH
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DLATRH : component is true;

----- Component DLATRS -----
component DLATRS
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DLATRS : component is true;

----- Component DLATRSH -----
component DLATRSH
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DLATRSH : component is true;

----- Component DLATS -----
component DLATS
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DLATS : component is true;

----- Component DLATSH -----
component DLATSH
   port(
      D                              :	in    STD_ULOGIC;
      LAT                            :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of DLATSH : component is true;

----- Component GND -----
component GND
   port(
      X                              :	out   STD_ULOGIC := '0');
end component;
   attribute syn_black_box of GND : component is true;

----- Component IBUF -----
component IBUF
   generic (PULL   : string  := "Off");
   port(
      I0                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of IBUF : component is true;
   attribute black_box_pad_pin of IBUF : component is "I0";

----- Component LVDSIN -----
component LVDSIN
   port(
      P_IN                             :	in    STD_ULOGIC;
      N_IN                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of LVDSIN : component is true;
   attribute black_box_pad_pin of LVDSIN : component is "P_IN,N_IN";

----- Component BLVDSIN -----
component BLVDSIN
   port(
      P_IN                             :	in    STD_ULOGIC;
      N_IN                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of BLVDSIN : component is true;
   attribute black_box_pad_pin of BLVDSIN : component is "P_IN,N_IN";

----- Component LVPECLIN -----
component LVPECLIN
   port(
      P_IN                             :	in    STD_ULOGIC;
      N_IN                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of LVPECLIN : component is true;
   attribute black_box_pad_pin of LVPECLIN : component is "P_IN,N_IN";

----- Component INV -----
component INV
   port(
      I0                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of INV : component is true;

----- Component INVTH -----
component INVTH
   generic (OUTOPEN   : string  := "Off");
   port(
      I0                             :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of INVTH : component is true;
   attribute black_box_pad_pin of INVTH : component is "O";

----- Component INVTL -----
component INVTL
   generic (OUTOPEN   : string  := "Off");
   port(
      I0                             :	in    STD_ULOGIC;
      OE                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of INVTL : component is true;
   attribute black_box_pad_pin of INVTL : component is "O";

----- Component NAN2 -----
component NAN2
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of NAN2 : component is true;

----- Component NAN3 -----
component NAN3
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of NAN3 : component is true;

----- Component NAN4 -----
component NAN4
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of NAN4 : component is true;

----- Component NAN5 -----
component NAN5
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of NAN5 : component is true;

----- Component NAN6 -----
component NAN6
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of NAN6 : component is true;

----- Component NAN7 -----
component NAN7
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of NAN7 : component is true;

----- Component NAN8 -----
component NAN8
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of NAN8 : component is true;

----- Component NOR2 -----
component NOR2
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of NOR2 : component is true;

----- Component NOR3 -----
component NOR3
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of NOR3 : component is true;

----- Component NOR4 -----
component NOR4
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of NOR4 : component is true;

----- Component NOR5 -----
component NOR5
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of NOR5 : component is true;

----- Component NOR6 -----
component NOR6
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of NOR6 : component is true;

----- Component NOR7 -----
component NOR7
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of NOR7 : component is true;

----- Component NOR8 -----
component NOR8
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of NOR8 : component is true;

----- Component OBUF -----
component OBUF
   generic (OUTOPEN   : string  := "Off");
   port(
      I0                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of OBUF : component is true;
   attribute black_box_pad_pin of OBUF : component is "O";

----- Component LVDSOUT -----
component LVDSOUT
   port(
      I                             :	in    STD_ULOGIC;
      P_OUT                           :	out   STD_ULOGIC;
      N_OUT                           :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of LVDSOUT : component is true;
   attribute black_box_pad_pin of LVDSOUT : component is "P_OUT,N_OUT";

----- Component BLVDSOUT -----
component BLVDSOUT
   port(
      I                             :	in    STD_ULOGIC;
      P_OUT                           :	out   STD_ULOGIC;
      N_OUT                           :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of BLVDSOUT : component is true;
   attribute black_box_pad_pin of BLVDSOUT : component is "P_OUT,N_OUT";

----- Component LVPECLOUT -----
component LVPECLOUT
   port(
      I                             :	in    STD_ULOGIC;
      P_OUT                           :	out   STD_ULOGIC;
      N_OUT                           :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of LVPECLOUT : component is true;
   attribute black_box_pad_pin of LVPECLOUT : component is "P_OUT,N_OUT";

----- Component LVDSTRI -----
component LVDSTRI
   port(
      I                             :	in    STD_ULOGIC;
      OE                            :	in    STD_ULOGIC;
      P_OUT                          :	out   STD_ULOGIC;
      N_OUT                          :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of LVDSTRI : component is true;
   attribute black_box_pad_pin of LVDSTRI : component is "P_OUT,N_OUT";

----- Component BLVDSTRI -----
component BLVDSTRI
   port(
      I                             :	in    STD_ULOGIC;
      OE                            :	in    STD_ULOGIC;
      P_OUT                          :	out   STD_ULOGIC;
      N_OUT                          :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of BLVDSTRI : component is true;
   attribute black_box_pad_pin of BLVDSTRI : component is "P_OUT,N_OUT";

----- Component LVPECLTRI -----
component LVPECLTRI
   port(
      I                             :	in    STD_ULOGIC;
      OE                            :	in    STD_ULOGIC;
      P_OUT                          :	out   STD_ULOGIC;
      N_OUT                          :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of LVPECLTRI : component is true;
   attribute black_box_pad_pin of LVPECLTRI : component is "P_OUT,N_OUT";

----- Component LVDSIO -----
component LVDSIO
   port(
      I                             :	in    STD_ULOGIC;
      OE                            :	in    STD_ULOGIC;
      P_IO                           :	inout   STD_ULOGIC;
      N_IO                           :	inout   STD_ULOGIC;
      O                           :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of LVDSIO : component is true;
   attribute black_box_pad_pin of LVDSIO : component is "P_IO,N_IO"; 

----- Component BLVDSIO -----
component BLVDSIO
   port(
      I                             :	in    STD_ULOGIC;
      OE                            :	in    STD_ULOGIC;
      P_IO                           :	inout   STD_ULOGIC;
      N_IO                           :	inout   STD_ULOGIC;
      O                           :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of BLVDSIO : component is true;
   attribute black_box_pad_pin of BLVDSIO : component is "P_IO,N_IO"; 


----- Component OR2 -----
component OR2
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of OR2 : component is true;

----- Component OR3 -----
component OR3
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of OR3 : component is true;

----- Component OR4 -----
component OR4
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of OR4 : component is true;

----- Component OR5 -----
component OR5
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of OR5 : component is true;

----- Component OR6 -----
component OR6
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of OR6 : component is true;

----- Component OR7 -----
component OR7
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of OR7 : component is true;

----- Component OR8 -----
component OR8
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      I2                             :	in    STD_ULOGIC;
      I3                             :	in    STD_ULOGIC;
      I4                             :	in    STD_ULOGIC;
      I5                             :	in    STD_ULOGIC;
      I6                             :	in    STD_ULOGIC;
      I7                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of OR8 : component is true;


----- Component TFF -----
component TFF
   port(
      T                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of TFF : component is true;

----- Component TFFR -----
component TFFR
   port(
      T                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of TFFR : component is true;

----- Component TFFRH -----
component TFFRH
   port(
      T                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of TFFRH : component is true;

----- Component TFFRS -----
component TFFRS
   port(
      T                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of TFFRS : component is true;

----- Component TFFRSH -----
component TFFRSH
   port(
      T                              :	in    STD_ULOGIC;
      R                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of TFFRSH : component is true;

----- Component TFFS -----
component TFFS
   port(
      T                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of TFFS : component is true;

----- Component TFFSH -----
component TFFSH
   port(
      T                              :	in    STD_ULOGIC;
      S                              :	in    STD_ULOGIC;
      CLK                            :	in    STD_ULOGIC;
      Q                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of TFFSH : component is true;

----- Component VCC -----
component VCC
   port(
      X                              :	out   STD_ULOGIC := '1');
end component;
   attribute syn_black_box of VCC : component is true;

----- Component XOR2 -----
component XOR2
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of XOR2 : component is true;

----- Component XORSOFT -----
component XORSOFT
   port(
      I0                             :	in    STD_ULOGIC;
      I1                             :	in    STD_ULOGIC;
      O                              :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of XORSOFT : component is true;

----- Component FIFO15X10A -----
component FIFO15X10A
   generic(
      FIFO_FULL_FLAG     : integer  := 15;
      FIFO_AMFULL_FLAG   : integer :=  6);

   port(
      WE                              :	in    STD_ULOGIC;
      WCLK                            :	in    STD_ULOGIC;
      RE                              :	in    STD_ULOGIC;
      RCLK                            :	in    STD_ULOGIC;
      RST                             :	in    STD_ULOGIC;
      DI0                             :	in    STD_ULOGIC;
      DI1                             :	in    STD_ULOGIC;
      DI2                             :	in    STD_ULOGIC;
      DI3                             :	in    STD_ULOGIC;
      DI4                             :	in    STD_ULOGIC;
      DI5                             :	in    STD_ULOGIC;
      DI6                             :	in    STD_ULOGIC;
      DI7                             :	in    STD_ULOGIC;
      DI8                             :	in    STD_ULOGIC;
      DI9                             :	in    STD_ULOGIC;
      DO0                             :	out   STD_ULOGIC;
      DO1                             :	out   STD_ULOGIC;
      DO2                             :	out   STD_ULOGIC;
      DO3                             :	out   STD_ULOGIC;
      DO4                             :	out   STD_ULOGIC;
      DO5                             :	out   STD_ULOGIC;
      DO6                             :	out   STD_ULOGIC;
      DO7                             :	out   STD_ULOGIC;
      DO8                             :	out   STD_ULOGIC;
      DO9                             :	out   STD_ULOGIC;
      FULL                            :	out   STD_ULOGIC;
      EMPTY                           :	out   STD_ULOGIC;
      START_RD                        :	out   STD_ULOGIC);
end component;
   attribute syn_black_box of FIFO15X10A : component is true;

----- Component CDRX_10B12B -----
 component CDRX_10B12B
   generic(
      in_freq  : string  := "100.0";
      sympat: STRING := "111111000000"
	);
   port(
      SIN               : in    STD_ULOGIC;
      REFCLK            : in    STD_ULOGIC;
      CDRRST            : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RXD6              : out   STD_ULOGIC;
      RXD7              : out   STD_ULOGIC;
      RXD8              : out   STD_ULOGIC;
      RXD9              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC;
      SYDT              : out   STD_ULOGIC);
 end component;
   attribute syn_black_box of CDRX_10B12B : component is true;

----- Component CDRX_8B10B -----
 component CDRX_8B10B
   generic(
      in_freq  : string  := "100.0";
      sympat   : string  := "11000001011100000101");
   port(
      SIN               : in    STD_ULOGIC;
      REFCLK            : in    STD_ULOGIC;
      CDRRST            : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RXD6              : out   STD_ULOGIC;
      RXD7              : out   STD_ULOGIC;
      RXD8              : out   STD_ULOGIC;
      RXD9              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC;
      SYDT              : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of CDRX_8B10B : component is true;

----- Component CDRX_SS_4 -----
 component CDRX_SS_4
   generic(
      in_freq  : string  := "100.0";
      sympat   : string  := "110011001100"
      );
   port(
      SIN               : in    STD_ULOGIC;
      CAL               : in    STD_ULOGIC;
      SS_CLKIN          : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC;
      SYDT              : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of CDRX_SS_4 : component is true;

----- Component CDRX_SS_6 -----
 component CDRX_SS_6
   generic(
      in_freq  : string  := "100.0";
      sympat   : string  := "111000111000"
      );
   port(
      SIN               : in    STD_ULOGIC;
      CAL               : in    STD_ULOGIC;
      SS_CLKIN          : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC;
      SYDT              : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of CDRX_SS_6 : component is true;

----- Component CDRX_SS_8 -----
 component CDRX_SS_8
   generic(
      in_freq  : string  := "100.0";
      sympat   : string  := "000011110000");
   port(
      SIN               : in    STD_ULOGIC;
      CAL               : in    STD_ULOGIC;
      SS_CLKIN          : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RXD6              : out   STD_ULOGIC;
      RXD7              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC;
      SYDT              : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of CDRX_SS_8 : component is true;

----- Component CDRX_SS_10 -----
 component CDRX_SS_10
   generic(
      in_freq  : string  := "100.0";
      sympat   : string  := "001111100000"
      );
   port(
      SIN               : in    STD_ULOGIC;
      CAL               : in    STD_ULOGIC;
      SS_CLKIN          : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RXD6              : out   STD_ULOGIC;
      RXD7              : out   STD_ULOGIC;
      RXD8              : out   STD_ULOGIC;
      RXD9              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC;
      SYDT              : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of CDRX_SS_10 : component is true;

----- Component HSLB_10B12B -----
 component HSLB_10B12B
   generic(
      in_freq  : string  := "100.0"
      );
   port(
      REFCLK            : in    STD_ULOGIC;
      CDRRST            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      TXD4              : in    STD_ULOGIC;
      TXD5              : in    STD_ULOGIC;
      TXD6              : in    STD_ULOGIC;
      TXD7              : in    STD_ULOGIC;
      TXD8              : in    STD_ULOGIC;
      TXD9              : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RXD6              : out   STD_ULOGIC;
      RXD7              : out   STD_ULOGIC;
      RXD8              : out   STD_ULOGIC;
      RXD9              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of HSLB_10B12B : component is true;


----- Component HSLB_8B10B -----
 component HSLB_8B10B
   generic(
      in_freq  : string  := "100.0"
      );
   port(
      REFCLK            : in    STD_ULOGIC;
      CDRRST            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      TXD4              : in    STD_ULOGIC;
      TXD5              : in    STD_ULOGIC;
      TXD6              : in    STD_ULOGIC;
      TXD7              : in    STD_ULOGIC;
      TXD8              : in    STD_ULOGIC;
      TXD9              : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RXD6              : out   STD_ULOGIC;
      RXD7              : out   STD_ULOGIC;
      RXD8              : out   STD_ULOGIC;
      RXD9              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of HSLB_8B10B : component is true;

----- Component RX_SS_4 -----
 component RX_SS_4
   generic(
      in_freq  : string  := "100.0"
      );
   port(
      SIN               : in    STD_ULOGIC;
      SS_CLKIN          : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);
 end component;
   attribute syn_black_box of RX_SS_4 : component is true;

----- Component RX_SS_6 -----
 component RX_SS_6
   generic(
      in_freq  : string  := "100.0"
      );
   port(
      SIN               : in    STD_ULOGIC;
      SS_CLKIN          : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of RX_SS_6 : component is true;

----- Component RX_SS_8 -----
 component RX_SS_8 
   generic(
      in_freq  : string  := "100.0"
      );
   port(
      SIN               : in    STD_ULOGIC;
      CAL               : in    STD_ULOGIC;
      SS_CLKIN          : in    STD_ULOGIC;
      RXD0              : out   STD_ULOGIC;
      RXD1              : out   STD_ULOGIC;
      RXD2              : out   STD_ULOGIC;
      RXD3              : out   STD_ULOGIC;
      RXD4              : out   STD_ULOGIC;
      RXD5              : out   STD_ULOGIC;
      RXD6              : out   STD_ULOGIC;
      RXD7              : out   STD_ULOGIC;
      RECCLK            : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC;
      SYDT              : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of RX_SS_8 : component is true;

----- Component TX_10B12B -----
 component TX_10B12B
   generic(
      in_freq  : string  := "100.0"
      );
   port(
      REFCLK            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      TXD4              : in    STD_ULOGIC;
      TXD5              : in    STD_ULOGIC;
      TXD6              : in    STD_ULOGIC;
      TXD7              : in    STD_ULOGIC;
      TXD8              : in    STD_ULOGIC;
      TXD9              : in    STD_ULOGIC;
      SOUT              : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of TX_10B12B : component is true;

----- Component TX_8B10B -----
 component TX_8B10B
   generic(
      in_freq  : string  := "100.0"
      );
   port(
      REFCLK            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      TXD4              : in    STD_ULOGIC;
      TXD5              : in    STD_ULOGIC;
      TXD6              : in    STD_ULOGIC;
      TXD7              : in    STD_ULOGIC;
      TXD8              : in    STD_ULOGIC;
      TXD9              : in    STD_ULOGIC;
      SOUT              : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of TX_8B10B : component is true;

----- Component TX_SS_4 -----
 component TX_SS_4
   generic(
      in_freq  : string  := "100.0"
      );
   port(
      REFCLK            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      SOUT              : out   STD_ULOGIC;
      SS_CLKOUT         : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of TX_SS_4 : component is true;

----- Component TX_SS_6 -----
 component TX_SS_6
   generic(
      in_freq  : string  := "100.0"
      );
   port(
      REFCLK            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      TXD4              : in    STD_ULOGIC;
      TXD5              : in    STD_ULOGIC;
      TXD6              : in    STD_ULOGIC;
      TXD7              : in    STD_ULOGIC;
      SOUT              : out   STD_ULOGIC;
      SS_CLKOUT         : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of TX_SS_6 : component is true;

----- Component TX_SS_8 -----
 component TX_SS_8
   generic(
      in_freq  : string  := "100.0"
      );
   port(
      REFCLK            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      TXD4              : in    STD_ULOGIC;
      TXD5              : in    STD_ULOGIC;
      TXD6              : in    STD_ULOGIC;
      TXD7              : in    STD_ULOGIC;
      SOUT              : out   STD_ULOGIC;
      SS_CLKOUT         : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of TX_SS_8 : component is true;

----- Component TX_SS_10 -----
 component TX_SS_10
   generic(
      in_freq  : string  := "100.0"
      );
   port(
      REFCLK            : in    STD_ULOGIC;
      TXD0              : in    STD_ULOGIC;
      TXD1              : in    STD_ULOGIC;
      TXD2              : in    STD_ULOGIC;
      TXD3              : in    STD_ULOGIC;
      TXD4              : in    STD_ULOGIC;
      TXD5              : in    STD_ULOGIC;
      TXD6              : in    STD_ULOGIC;
      TXD7              : in    STD_ULOGIC;
      TXD8              : in    STD_ULOGIC;
      TXD9              : in    STD_ULOGIC;
      SOUT              : out   STD_ULOGIC;
      SS_CLKOUT         : out   STD_ULOGIC;
      CSLOCK            : out   STD_ULOGIC);

 end component;
   attribute syn_black_box of TX_SS_10 : component is true;

end components;

package body Components is 
 
 
 function str2int( L : string) return integer is
	variable ok:         boolean;
	variable pos:        integer:=1;
	variable sign: integer := 1;
	variable rval: integer := 0;
	variable value: integer := 0;
    begin
	ok := FALSE;
	if pos < L'right and (L(pos) = '-' or L(pos) = '+') then
	    if L(pos) = '-' then
		sign := -1;
	    end if;
	    pos := pos + 1;
	end if;

	-- Once the optional leading sign is removed, an integer can
	--   contain only the digits '0' through '9' and the '_'
	--   (underscore) character.  VHDL disallows two successive
	--   underscores, and leading or trailing underscores.

	if pos <= L'right and L(pos) >= '0' and L(pos) <= '9' then
	    while pos <= L'right loop
		if L(pos) >= '0' and L(pos) <= '9' then
		    rval := rval * 10
		            + character'pos(L(pos)) - character'pos('0');
		    ok := TRUE;
		elsif L(pos) = '_' then
		    if pos = L'right
		    or L(pos + 1) < '0'
		    or L(pos + 1) > '9' then
			ok := FALSE;
			exit;
		    end if;
		else
		    exit;
		end if;
		pos := pos + 1;
	    end loop;
	end if;

	value := sign * rval;
        RETURN(value);
    end str2int;

    function str2real( L: string) return real is
	variable pos:        integer;
	variable value:      real;
	variable value1:      real;
	variable ok:         boolean;
	variable sign:       real := 1.0;
	variable rval:       real := 0.0;
        variable powerten:   real := 0.1;

        begin

	pos := L'left;
	if (pos <= L'right) and (L(pos) = '-') then
	    sign := -1.0;
	    pos := pos + 1;
	end if;

            ok := FALSE;
            rval := 0.0;
            if pos <= L'right and L(pos) >= '0' and L(pos) <= '9' then
                while pos <= L'right and L(pos) /= '.' and L(pos) /= ' ' and L(pos) /= HT  loop
                    if L(pos) >= '0' and L(pos) <= '9' then
                        rval := rval*10.0 + real(character'pos(L(pos)) - character'pos('0'));
                        pos := pos+1;
                        ok := true;
                    else
                        ok := false;
                        exit;
                    end if;
                end loop;
            end if;

	    if ok and pos <= L'right and L(pos) = '.' then
	    pos := pos + 1;
            end if;

            if pos <= L'right then
               while pos <= L'right and ((L(pos) >= '0' and L(pos) <= '9') or L(pos) = '_') loop
                       rval := rval + (real(character'pos(L(pos))-character'pos('0'))*powerten);
                       powerten := powerten*0.1;
                      pos := pos+1;
                     ok := true;
            end loop;
        end if;

        if ok then
            value := rval * sign;
        end if;

        if (L'right <= 2) then
           value1 := 0.25 * value;
        else
           value1 := value;
        end if;

        return (value1);
      end str2real;

    function str2std(L: string) return std_logic_vector is 
	variable vpos : integer := 0;	-- Index of last valid bit in val.
	variable lpos : integer;	-- Index of next unused char in L.
	variable val  : std_logic_vector(1 to L'right); -- lenth of the vector. 
    begin
	    lpos := L'left;
	    while lpos <= L'right and vpos < VAL'length loop
		if L(lpos) = '0' then
		    vpos := vpos + 1;
		    val(vpos) := '0';
		elsif L(lpos) = '1' then
		    vpos := vpos + 1;
		    val(vpos) := '1';
		else
		    exit;	-- Bit values must be '0' or '1'.
		end if;
		lpos := lpos + 1;
	    end loop;
        return val;
    end str2std;
 
end components;

