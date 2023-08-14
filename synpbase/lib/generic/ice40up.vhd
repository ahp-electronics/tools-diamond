-- Radiant components

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
PACKAGE Components IS
	attribute syn_black_box: boolean ;
	attribute syn_black_box of Components : package is true;
	attribute black_box_pad_pin: string;
	attribute xc_map : string;
	attribute syn_lib_cell : boolean;
	attribute syn_lib_cell of Components : package is true;
COMPONENT MAC16
GENERIC (
	NEG_TRIGGER : String := "0b0";
	A_REG : String := "0b0";
	B_REG : String := "0b0";
	C_REG : String := "0b0";
	D_REG : String := "0b0";
	TOP_8x8_MULT_REG : String := "0b0";
	BOT_8x8_MULT_REG : String := "0b0";
	PIPELINE_16x16_MULT_REG1 : String := "0b0";
	PIPELINE_16x16_MULT_REG2 : String := "0b0";
	TOPOUTPUT_SELECT : String := "0b00";
	TOPADDSUB_LOWERINPUT : String := "0b00";
	TOPADDSUB_UPPERINPUT : String := "0b0";
	TOPADDSUB_CARRYSELECT : String := "0b00";
	BOTOUTPUT_SELECT : String := "0b00";
	BOTADDSUB_LOWERINPUT : String := "0b00";
	BOTADDSUB_UPPERINPUT : String := "0b0";
	BOTADDSUB_CARRYSELECT : String := "0b00";
	MODE_8x8 : String := "0b0";
	A_SIGNED : String := "0b0";
	B_SIGNED : String := "0b0");
PORT(
	CLK : IN std_logic := 'X';
	CE : IN std_logic := 'X';
	C15 : IN std_logic := 'X';
	C14 : IN std_logic := 'X';
	C13 : IN std_logic := 'X';
	C12 : IN std_logic := 'X';
	C11 : IN std_logic := 'X';
	C10 : IN std_logic := 'X';
	C9 : IN std_logic := 'X';
	C8 : IN std_logic := 'X';
	C7 : IN std_logic := 'X';
	C6 : IN std_logic := 'X';
	C5 : IN std_logic := 'X';
	C4 : IN std_logic := 'X';
	C3 : IN std_logic := 'X';
	C2 : IN std_logic := 'X';
	C1 : IN std_logic := 'X';
	C0 : IN std_logic := 'X';
	A15 : IN std_logic := 'X';
	A14 : IN std_logic := 'X';
	A13 : IN std_logic := 'X';
	A12 : IN std_logic := 'X';
	A11 : IN std_logic := 'X';
	A10 : IN std_logic := 'X';
	A9 : IN std_logic := 'X';
	A8 : IN std_logic := 'X';
	A7 : IN std_logic := 'X';
	A6 : IN std_logic := 'X';
	A5 : IN std_logic := 'X';
	A4 : IN std_logic := 'X';
	A3 : IN std_logic := 'X';
	A2 : IN std_logic := 'X';
	A1 : IN std_logic := 'X';
	A0 : IN std_logic := 'X';
	B15 : IN std_logic := 'X';
	B14 : IN std_logic := 'X';
	B13 : IN std_logic := 'X';
	B12 : IN std_logic := 'X';
	B11 : IN std_logic := 'X';
	B10 : IN std_logic := 'X';
	B9 : IN std_logic := 'X';
	B8 : IN std_logic := 'X';
	B7 : IN std_logic := 'X';
	B6 : IN std_logic := 'X';
	B5 : IN std_logic := 'X';
	B4 : IN std_logic := 'X';
	B3 : IN std_logic := 'X';
	B2 : IN std_logic := 'X';
	B1 : IN std_logic := 'X';
	B0 : IN std_logic := 'X';
	D15 : IN std_logic := 'X';
	D14 : IN std_logic := 'X';
	D13 : IN std_logic := 'X';
	D12 : IN std_logic := 'X';
	D11 : IN std_logic := 'X';
	D10 : IN std_logic := 'X';
	D9 : IN std_logic := 'X';
	D8 : IN std_logic := 'X';
	D7 : IN std_logic := 'X';
	D6 : IN std_logic := 'X';
	D5 : IN std_logic := 'X';
	D4 : IN std_logic := 'X';
	D3 : IN std_logic := 'X';
	D2 : IN std_logic := 'X';
	D1 : IN std_logic := 'X';
	D0 : IN std_logic := 'X';
	AHOLD : IN std_logic := 'X';
	BHOLD : IN std_logic := 'X';
	CHOLD : IN std_logic := 'X';
	DHOLD : IN std_logic := 'X';
	IRSTTOP : IN std_logic := 'X';
	IRSTBOT : IN std_logic := 'X';
	ORSTTOP : IN std_logic := 'X';
	ORSTBOT : IN std_logic := 'X';
	OLOADTOP : IN std_logic := 'X';
	OLOADBOT : IN std_logic := 'X';
	ADDSUBTOP : IN std_logic := 'X';
	ADDSUBBOT : IN std_logic := 'X';
	OHOLDTOP : IN std_logic := 'X';
	OHOLDBOT : IN std_logic := 'X';
	CI : IN std_logic := 'X';
	ACCUMCI : IN std_logic := 'X';
	SIGNEXTIN : IN std_logic := 'X';
	O31 : OUT std_logic := 'X';
	O30 : OUT std_logic := 'X';
	O29 : OUT std_logic := 'X';
	O28 : OUT std_logic := 'X';
	O27 : OUT std_logic := 'X';
	O26 : OUT std_logic := 'X';
	O25 : OUT std_logic := 'X';
	O24 : OUT std_logic := 'X';
	O23 : OUT std_logic := 'X';
	O22 : OUT std_logic := 'X';
	O21 : OUT std_logic := 'X';
	O20 : OUT std_logic := 'X';
	O19 : OUT std_logic := 'X';
	O18 : OUT std_logic := 'X';
	O17 : OUT std_logic := 'X';
	O16 : OUT std_logic := 'X';
	O15 : OUT std_logic := 'X';
	O14 : OUT std_logic := 'X';
	O13 : OUT std_logic := 'X';
	O12 : OUT std_logic := 'X';
	O11 : OUT std_logic := 'X';
	O10 : OUT std_logic := 'X';
	O9 : OUT std_logic := 'X';
	O8 : OUT std_logic := 'X';
	O7 : OUT std_logic := 'X';
	O6 : OUT std_logic := 'X';
	O5 : OUT std_logic := 'X';
	O4 : OUT std_logic := 'X';
	O3 : OUT std_logic := 'X';
	O2 : OUT std_logic := 'X';
	O1 : OUT std_logic := 'X';
	O0 : OUT std_logic := 'X';
	CO : OUT std_logic := 'X';
	ACCUMCO : OUT std_logic := 'X';
	SIGNEXTOUT : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of MAC16 : COMPONENT IS true;

COMPONENT EBR_B
GENERIC (
	INIT_0 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_1 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_2 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_3 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_4 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_5 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_6 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_7 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_8 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_9 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_A : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_B : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_C : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_D : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_E : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_F : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	DATA_WIDTH_W : String := "2";
	DATA_WIDTH_R : String := "2");
PORT(
	RADDR10 : IN std_logic := 'X';
	RADDR9 : IN std_logic := 'X';
	RADDR8 : IN std_logic := 'X';
	RADDR7 : IN std_logic := 'X';
	RADDR6 : IN std_logic := 'X';
	RADDR5 : IN std_logic := 'X';
	RADDR4 : IN std_logic := 'X';
	RADDR3 : IN std_logic := 'X';
	RADDR2 : IN std_logic := 'X';
	RADDR1 : IN std_logic := 'X';
	RADDR0 : IN std_logic := 'X';
	WADDR10 : IN std_logic := 'X';
	WADDR9 : IN std_logic := 'X';
	WADDR8 : IN std_logic := 'X';
	WADDR7 : IN std_logic := 'X';
	WADDR6 : IN std_logic := 'X';
	WADDR5 : IN std_logic := 'X';
	WADDR4 : IN std_logic := 'X';
	WADDR3 : IN std_logic := 'X';
	WADDR2 : IN std_logic := 'X';
	WADDR1 : IN std_logic := 'X';
	WADDR0 : IN std_logic := 'X';
	MASK_N15 : IN std_logic := 'X';
	MASK_N14 : IN std_logic := 'X';
	MASK_N13 : IN std_logic := 'X';
	MASK_N12 : IN std_logic := 'X';
	MASK_N11 : IN std_logic := 'X';
	MASK_N10 : IN std_logic := 'X';
	MASK_N9 : IN std_logic := 'X';
	MASK_N8 : IN std_logic := 'X';
	MASK_N7 : IN std_logic := 'X';
	MASK_N6 : IN std_logic := 'X';
	MASK_N5 : IN std_logic := 'X';
	MASK_N4 : IN std_logic := 'X';
	MASK_N3 : IN std_logic := 'X';
	MASK_N2 : IN std_logic := 'X';
	MASK_N1 : IN std_logic := 'X';
	MASK_N0 : IN std_logic := 'X';
	WDATA15 : IN std_logic := 'X';
	WDATA14 : IN std_logic := 'X';
	WDATA13 : IN std_logic := 'X';
	WDATA12 : IN std_logic := 'X';
	WDATA11 : IN std_logic := 'X';
	WDATA10 : IN std_logic := 'X';
	WDATA9 : IN std_logic := 'X';
	WDATA8 : IN std_logic := 'X';
	WDATA7 : IN std_logic := 'X';
	WDATA6 : IN std_logic := 'X';
	WDATA5 : IN std_logic := 'X';
	WDATA4 : IN std_logic := 'X';
	WDATA3 : IN std_logic := 'X';
	WDATA2 : IN std_logic := 'X';
	WDATA1 : IN std_logic := 'X';
	WDATA0 : IN std_logic := 'X';
	RCLKE : IN std_logic := 'X';
	RCLK : IN std_logic := 'X';
	RE : IN std_logic := 'X';
	WCLKE : IN std_logic := 'X';
	WCLK : IN std_logic := 'X';
	WE : IN std_logic := 'X';
	RDATA15 : OUT std_logic := 'X';
	RDATA14 : OUT std_logic := 'X';
	RDATA13 : OUT std_logic := 'X';
	RDATA12 : OUT std_logic := 'X';
	RDATA11 : OUT std_logic := 'X';
	RDATA10 : OUT std_logic := 'X';
	RDATA9 : OUT std_logic := 'X';
	RDATA8 : OUT std_logic := 'X';
	RDATA7 : OUT std_logic := 'X';
	RDATA6 : OUT std_logic := 'X';
	RDATA5 : OUT std_logic := 'X';
	RDATA4 : OUT std_logic := 'X';
	RDATA3 : OUT std_logic := 'X';
	RDATA2 : OUT std_logic := 'X';
	RDATA1 : OUT std_logic := 'X';
	RDATA0 : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of EBR_B : COMPONENT IS true;

COMPONENT FILTER
PORT(
	FILTERIN : IN std_logic := 'X';
	FILTEROUT : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of FILTER : COMPONENT IS true;

COMPONENT HSOSC_CORE 
GENERIC (
	CLKHF_DIV : String := "0b00";
	FABRIC_TRIME : String := "DISABLE");
PORT(
	CLKHFPU : IN std_logic := 'X';
	CLKHFEN : IN std_logic := 'X';
	TRIM9 : IN std_logic := 'X';
	TRIM8 : IN std_logic := 'X';
	TRIM7 : IN std_logic := 'X';
	TRIM6 : IN std_logic := 'X';
	TRIM5 : IN std_logic := 'X';
	TRIM4 : IN std_logic := 'X';
	TRIM3 : IN std_logic := 'X';
	TRIM2 : IN std_logic := 'X';
	TRIM1 : IN std_logic := 'X';
	TRIM0 : IN std_logic := 'X';
	CLKHF : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of HSOSC_CORE : COMPONENT IS true;

COMPONENT I2C_B
GENERIC (
	I2C_SLAVE_INIT_ADDR : String := "0b1111100001";
	BUS_ADDR74 : String := "0b0001";
	I2C_CLK_DIVIDER : String := "0";
	SDA_INPUT_DELAYED : String := "0";
	SDA_OUTPUT_DELAYED : String := "0";
	FREQUENCY_PIN_SBCLKI : String := "NONE");
PORT(
	SBCLKI : IN std_logic := 'X';
	SBRWI : IN std_logic := 'X';
	SBSTBI : IN std_logic := 'X';
	SBADRI7 : IN std_logic := 'X';
	SBADRI6 : IN std_logic := 'X';
	SBADRI5 : IN std_logic := 'X';
	SBADRI4 : IN std_logic := 'X';
	SBADRI3 : IN std_logic := 'X';
	SBADRI2 : IN std_logic := 'X';
	SBADRI1 : IN std_logic := 'X';
	SBADRI0 : IN std_logic := 'X';
	SBDATI7 : IN std_logic := 'X';
	SBDATI6 : IN std_logic := 'X';
	SBDATI5 : IN std_logic := 'X';
	SBDATI4 : IN std_logic := 'X';
	SBDATI3 : IN std_logic := 'X';
	SBDATI2 : IN std_logic := 'X';
	SBDATI1 : IN std_logic := 'X';
	SBDATI0 : IN std_logic := 'X';
	SCLI : IN std_logic := 'X';
	SDAI : IN std_logic := 'X';
	SBDATO7 : OUT std_logic := 'X';
	SBDATO6 : OUT std_logic := 'X';
	SBDATO5 : OUT std_logic := 'X';
	SBDATO4 : OUT std_logic := 'X';
	SBDATO3 : OUT std_logic := 'X';
	SBDATO2 : OUT std_logic := 'X';
	SBDATO1 : OUT std_logic := 'X';
	SBDATO0 : OUT std_logic := 'X';
	SBACKO : OUT std_logic := 'X';
	I2CIRQ : OUT std_logic := 'X';
	I2CWKUP : OUT std_logic := 'X';
	SCLO : OUT std_logic := 'X';
	SCLOE : OUT std_logic := 'X';
	SDAO : OUT std_logic := 'X';
	SDAOE : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of I2C_B : COMPONENT IS true;

COMPONENT BB_I3C
PORT(
	T_N : IN std_logic := 'X';
	I : IN std_logic := 'X';
	PU_ENB : IN std_logic := 'X';
	WEAK_PU_ENB : IN std_logic := 'X';
	O : OUT std_logic := 'X';
	B : INOUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of BB_I3C : COMPONENT IS true;
	attribute black_box_pad_pin of BB_I3C : COMPONENT IS "B";

COMPONENT IOL_B
GENERIC (
	LATCHIN : String := "NONE_REG";
	DDROUT : String := "NO");
PORT(
	PADDI : IN std_logic := 'X';
	DO1 : IN std_logic := 'X';
	DO0 : IN std_logic := 'X';
	CE : IN std_logic := 'X';
	IOLTO : IN std_logic := 'X';
	HOLD : IN std_logic := 'X';
	INCLK : IN std_logic := 'X';
	OUTCLK : IN std_logic := 'X';
	PADDO : OUT std_logic := 'X';
	PADDT : OUT std_logic := 'X';
	DI1 : OUT std_logic := 'X';
	DI0 : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of IOL_B : COMPONENT IS true;

COMPONENT RGBPWM
PORT(
	LEDDCS : IN std_logic := 'X';
	LEDDCLK : IN std_logic := 'X';
	LEDDDAT7 : IN std_logic := 'X';
	LEDDDAT6 : IN std_logic := 'X';
	LEDDDAT5 : IN std_logic := 'X';
	LEDDDAT4 : IN std_logic := 'X';
	LEDDDAT3 : IN std_logic := 'X';
	LEDDDAT2 : IN std_logic := 'X';
	LEDDDAT1 : IN std_logic := 'X';
	LEDDDAT0 : IN std_logic := 'X';
	LEDDADDR3 : IN std_logic := 'X';
	LEDDADDR2 : IN std_logic := 'X';
	LEDDADDR1 : IN std_logic := 'X';
	LEDDADDR0 : IN std_logic := 'X';
	LEDDDEN : IN std_logic := 'X';
	LEDDEXE : IN std_logic := 'X';
	PWMOUT2 : OUT std_logic := 'X';
	PWMOUT1 : OUT std_logic := 'X';
	PWMOUT0 : OUT std_logic := 'X';
	LEDDON : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of RGBPWM : COMPONENT IS true;

COMPONENT LSOSC_CORE 
GENERIC (
	FABRIC_TRIME : String := "DISABLE");
PORT(
	CLKLFPU : IN std_logic := 'X';
	CLKLFEN : IN std_logic := 'X';
	TRIM9 : IN std_logic := 'X';
	TRIM8 : IN std_logic := 'X';
	TRIM7 : IN std_logic := 'X';
	TRIM6 : IN std_logic := 'X';
	TRIM5 : IN std_logic := 'X';
	TRIM4 : IN std_logic := 'X';
	TRIM3 : IN std_logic := 'X';
	TRIM2 : IN std_logic := 'X';
	TRIM1 : IN std_logic := 'X';
	TRIM0 : IN std_logic := 'X';
	CLKLF : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of LSOSC_CORE : COMPONENT IS true;

COMPONENT BB_OD
PORT(
        T_N : IN std_logic := 'X';
        I : IN std_logic := 'X';
        O : OUT std_logic := 'X';
        B : INOUT std_logic := 'X');
END COMPONENT;
        attribute syn_black_box of BB_OD : COMPONENT IS true;
        attribute black_box_pad_pin of BB_OD : COMPONENT IS "B";

COMPONENT BB_B
PORT(
	T_N : IN std_logic := 'X';
	I : IN std_logic := 'X';
	O : OUT std_logic := 'X';
	B : INOUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of BB_B : COMPONENT IS true;
	attribute black_box_pad_pin of BB_B : COMPONENT IS "B";


COMPONENT PLL_B
GENERIC (
	FEEDBACK_PATH : String := "SIMPLE";
	DELAY_ADJUSTMENT_MODE_FEEDBACK : String := "FIXED";
	FDA_FEEDBACK : String := "0";
	DELAY_ADJUSTMENT_MODE_RELATIVE : String := "FIXED";
	FDA_RELATIVE : String := "0";
	SHIFTREG_DIV_MODE : String := "0";
	PLLOUT_SELECT_PORTA : String := "SHIFTREG_0deg";
	PLLOUT_SELECT_PORTB : String := "SHIFTREG_0deg";
	DIVR : String := "0";
	DIVF : String := "0";
	DIVQ : String := "1";
	FILTER_RANGE : String := "0";
	EXTERNAL_DIVIDE_FACTOR : String := "NONE";
	ENABLE_ICEGATE_PORTA : String := "0";
	ENABLE_ICEGATE_PORTB : String := "0";
	TEST_MODE : String := "0";
	FREQUENCY_PIN_REFERENCECLK : String := "NONE");
PORT(
	REFERENCECLK : IN std_logic := 'X';
	FEEDBACK : IN std_logic := 'X';
	DYNAMICDELAY7 : IN std_logic := 'X';
	DYNAMICDELAY6 : IN std_logic := 'X';
	DYNAMICDELAY5 : IN std_logic := 'X';
	DYNAMICDELAY4 : IN std_logic := 'X';
	DYNAMICDELAY3 : IN std_logic := 'X';
	DYNAMICDELAY2 : IN std_logic := 'X';
	DYNAMICDELAY1 : IN std_logic := 'X';
	DYNAMICDELAY0 : IN std_logic := 'X';
	BYPASS : IN std_logic := 'X';
	RESET_N : IN std_logic := 'X';
	SCLK : IN std_logic := 'X';
	SDI : IN std_logic := 'X';
	LATCH : IN std_logic := 'X';
	INTFBOUT : OUT std_logic := 'X';
	OUTCORE : OUT std_logic := 'X';
	OUTGLOBAL : OUT std_logic := 'X';
	OUTCOREB : OUT std_logic := 'X';
	OUTGLOBALB : OUT std_logic := 'X';
	SDO : OUT std_logic := 'X';
	LOCK : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of PLL_B : COMPONENT IS true;

COMPONENT PUR
GENERIC (
	RST_PULSE : String := "1");
PORT(
	PUR_N : IN std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of PUR : COMPONENT IS true;

COMPONENT RGB_CORE
GENERIC (
	CURRENT_MODE : String := "0";
	RGB0_CURRENT : String := "0b000000";
	RGB1_CURRENT : String := "0b000000";
	RGB2_CURRENT : String := "0b000000";
	FABRIC_TRIME : String := "DISABLE");
PORT(
	CURREN : IN std_logic := 'X';
	RGBLEDEN : IN std_logic := 'X';
	RGB0PWM : IN std_logic := 'X';
	RGB1PWM : IN std_logic := 'X';
	RGB2PWM : IN std_logic := 'X';
	TRIM9 : IN std_logic := 'X';
	TRIM8 : IN std_logic := 'X';
	TRIM7 : IN std_logic := 'X';
	TRIM6 : IN std_logic := 'X';
	TRIM5 : IN std_logic := 'X';
	TRIM4 : IN std_logic := 'X';
	TRIM3 : IN std_logic := 'X';
	TRIM2 : IN std_logic := 'X';
	TRIM1 : IN std_logic := 'X';
	TRIM0 : IN std_logic := 'X';
	RGB2 : OUT std_logic := 'X';
	RGB1 : OUT std_logic := 'X';
	RGB0 : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of RGB_CORE : COMPONENT IS true;

COMPONENT OB_RGB
PORT(
	T_N : IN std_logic := 'X';
	I : IN std_logic := 'X';
	O : OUT std_logic := 'X';
	B : INOUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of OB_RGB : COMPONENT IS true;
	attribute black_box_pad_pin of OB_RGB : COMPONENT IS "B";

COMPONENT FD1P3XZ
GENERIC (
	REGSET : String := "RESET";
	SRMODE : String := "CE_OVER_LSR");
PORT(
	D : IN std_logic := 'X';
	SP : IN std_logic := 'X';
	CK : IN std_logic := 'X';
	SR : IN std_logic := 'X';
	Q : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of FD1P3XZ : COMPONENT IS true;

COMPONENT LUT4
GENERIC (
	INIT : String := "0x0000");
PORT(
	A : IN std_logic := 'X';
	B : IN std_logic := 'X';
	C : IN std_logic := 'X';
	D : IN std_logic := 'X';
	Z : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of LUT4 : COMPONENT IS true;
	attribute xc_map of LUT4 : COMPONENT IS "lut";

COMPONENT FA2
	GENERIC (
			INIT0 : String := "0xc33c";
			INIT1 : String := "0xc33c" );
PORT(
	A0 : IN std_logic := 'X';
	B0 : IN std_logic := 'X';
	C0 : IN std_logic := 'X';
	D0 : IN std_logic := 'X';
	CI0 : IN std_logic := 'X';
	A1 : IN std_logic := 'X';
	B1 : IN std_logic := 'X';
	C1 : IN std_logic := 'X';
	D1 : IN std_logic := 'X';
	CI1 : IN std_logic := 'X';
	CO0 : OUT std_logic := 'X';
	CO1 : OUT std_logic := 'X';
	S0 : OUT std_logic := 'X';
	S1 : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of FA2 : COMPONENT IS true;

COMPONENT VHI
PORT(
	Z : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of VHI : COMPONENT IS true;

COMPONENT VLO
PORT(
	Z : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of VLO : COMPONENT IS true;

COMPONENT INV
PORT(
	A : IN std_logic := 'X';
	Z : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of INV : COMPONENT IS true;

COMPONENT BUF
PORT(
	A : IN std_logic := 'X';
	Z : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of BUF : COMPONENT IS true;

COMPONENT RGB
GENERIC (
	CURRENT_MODE : String := "0";
	RGB0_CURRENT : String := "0b000000";
	RGB1_CURRENT : String := "0b000000";
	RGB2_CURRENT : String := "0b000000");
PORT(
	CURREN : IN std_logic := 'X';
	RGBLEDEN : IN std_logic := 'X';
	RGB0PWM : IN std_logic := 'X';
	RGB1PWM : IN std_logic := 'X';
	RGB2PWM : IN std_logic := 'X';
	RGB2 : OUT std_logic := 'X';
	RGB1 : OUT std_logic := 'X';
	RGB0 : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of RGB : COMPONENT IS true;
	attribute black_box_pad_pin of RGB : COMPONENT IS "RGB2,RGB1,RGB0";

COMPONENT FD1P3BZ
PORT(
	D : IN std_logic := 'X';
	CK : IN std_logic := 'X';
	SP : IN std_logic := 'X';
	PD : IN std_logic := 'X';
	Q : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of FD1P3BZ : COMPONENT IS true;

COMPONENT FD1P3DZ
PORT(
	D : IN std_logic := 'X';
	CK : IN std_logic := 'X';
	SP : IN std_logic := 'X';
	CD : IN std_logic := 'X';
	Q : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of FD1P3DZ : COMPONENT IS true;

COMPONENT FD1P3IZ
PORT(
	D : IN std_logic := 'X';
	CK : IN std_logic := 'X';
	SP : IN std_logic := 'X';
	CD : IN std_logic := 'X';
	Q : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of FD1P3IZ : COMPONENT IS true;

COMPONENT FD1P3JZ
PORT(
	D : IN std_logic := 'X';
	CK : IN std_logic := 'X';
	SP : IN std_logic := 'X';
	PD : IN std_logic := 'X';
	Q : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of FD1P3JZ : COMPONENT IS true;

COMPONENT IB
PORT(
	I : IN std_logic := 'X';
	O : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of IB : COMPONENT IS true;
	attribute black_box_pad_pin of IB : COMPONENT IS "I";

COMPONENT OB
PORT(
	I : IN std_logic := 'X';
	O : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of OB : COMPONENT IS true;
	attribute black_box_pad_pin of OB : COMPONENT IS "O";


COMPONENT OBZ_B
PORT(
	I : IN std_logic := 'X';
	T_N : IN std_logic := 'X';
	O : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of OBZ_B : COMPONENT IS true;
	attribute black_box_pad_pin of OBZ_B : COMPONENT IS "O";


COMPONENT IFD1P3AZ
PORT(
	D : IN std_logic := 'X';
	SP : IN std_logic := 'X';
	CK : IN std_logic := 'X';
	Q : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of IFD1P3AZ : COMPONENT IS true;

COMPONENT OFD1P3AZ
PORT(
	D : IN std_logic := 'X';
	SP : IN std_logic := 'X';
	CK : IN std_logic := 'X';
	Q : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of OFD1P3AZ : COMPONENT IS true;

COMPONENT PDP4K
GENERIC (
	INITVAL_0 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_1 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_2 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_3 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_4 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_5 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_6 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_7 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_8 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_9 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_A : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_B : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_C : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_D : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_E : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INITVAL_F : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	DATA_WIDTH_W : String := "2";
	DATA_WIDTH_R : String := "2");
PORT(
	DI : IN std_logic_vector(15 downto 0);
	ADW : IN std_logic_vector(10 downto 0);
	ADR : IN std_logic_vector(10 downto 0);
	CKW : IN std_logic := 'X';
	CKR : IN std_logic := 'X';
	CEW : IN std_logic := 'X';
	WE	: IN std_logic := 'X';
	CER : IN std_logic := 'X';
	RE	: IN std_logic := 'X';
	MASK_N : IN std_logic_vector(15 downto 0);
	DO : OUT std_logic_vector(15 downto 0));
END COMPONENT;
	attribute syn_black_box of PDP4K : COMPONENT IS true;

COMPONENT CCU2_B
	GENERIC (
		INIT0 : String := "0xc33c";
		INIT1 : String := "0xc33c" );	
PORT(
	A0 : IN std_logic := 'X';
	B0 : IN std_logic := 'X';
	C0 : IN std_logic := 'X';
	CIN : IN std_logic := 'X';
	A1 : IN std_logic := 'X';
	B1 : IN std_logic := 'X';
	C1 : IN std_logic := 'X';
	COUT : OUT std_logic := 'X';
	S0 : OUT std_logic := 'X';
	S1 : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of CCU2_B : COMPONENT IS true;

COMPONENT SP256K
PORT(
	AD : IN std_logic_vector(13 downto 0);
	DI : IN std_logic_vector(15 downto 0);
	MASKWE : IN std_logic_vector(3 downto 0);
	WE : IN std_logic := 'X';
	CS : IN std_logic := 'X';
	CK : IN std_logic := 'X';
	STDBY : IN std_logic := 'X';
	SLEEP : IN std_logic := 'X';
	PWROFF_N : IN std_logic := 'X';
	DO : OUT std_logic_vector(15 downto 0));
END COMPONENT;
	attribute syn_black_box of SP256K : COMPONENT IS true;

COMPONENT SP4K
GENERIC (
	INIT_0 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_1 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_2 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_3 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_4 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_5 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_6 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_7 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_8 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_9 : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_A : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_B : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_C : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_D : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_E : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	INIT_F : String := "0x0000000000000000000000000000000000000000000000000000000000000000";
	DATA_WIDTH : String := "2");
PORT(
	DI : IN std_logic_vector(15 downto 0);
	CK : IN std_logic := 'X';
	CE : IN std_logic := 'X';
	AD : IN std_logic_vector(10 downto 0);
	WE : IN std_logic := 'X';
	MASK_N : IN std_logic_vector(15 downto 0);
	DO : OUT std_logic_vector(15 downto 0));
END COMPONENT;
	attribute syn_black_box of SP4K : COMPONENT IS true;

COMPONENT HSOSC
GENERIC (
	CLKHF_DIV : String := "0b00");
PORT(
	CLKHFPU : IN std_logic := 'X';
	CLKHFEN : IN std_logic := 'X';
	CLKHF : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of HSOSC : COMPONENT IS true;

COMPONENT LSOSC
PORT(
	CLKLFPU : IN std_logic := 'X';
	CLKLFEN : IN std_logic := 'X';
	CLKLF : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of LSOSC : COMPONENT IS true;

COMPONENT HSOSC1P8V
GENERIC (
	CLKHF_DIV : String := "0b00");
PORT(
	CLKHFPU : IN std_logic := 'X';
	CLKHFEN : IN std_logic := 'X';
	CLKHF : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of HSOSC1P8V : COMPONENT IS true;

COMPONENT LSOSC1P8V
PORT(
	CLKLFPU : IN std_logic := 'X';
	CLKLFEN : IN std_logic := 'X';
	CLKLF : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of LSOSC1P8V : COMPONENT IS true;

COMPONENT RGB1P8V
GENERIC (
	CURRENT_MODE : String := "0b0";
	RGB0_CURRENT : String := "0b000000";
	RGB1_CURRENT : String := "0b000000";
	RGB2_CURRENT : String := "0b000000");
PORT(
	CURREN : IN std_logic := 'X';
	RGBLEDEN : IN std_logic := 'X';
	RGB0PWM : IN std_logic := 'X';
	RGB1PWM : IN std_logic := 'X';
	RGB2PWM : IN std_logic := 'X';
	RGB2 : OUT std_logic := 'X';
	RGB1 : OUT std_logic := 'X';
	RGB0 : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of RGB1P8V : COMPONENT IS true;
	attribute black_box_pad_pin of RGB1P8V : COMPONENT IS "RGB2,RGB1,RGB0";
	
COMPONENT SPI_B
GENERIC (
	BUS_ADDR74 : String := "0b0000";
	SPI_CLK_DIVIDER : String := "0";
	FREQUENCY_PIN_SBCLKI : String := "NONE");
PORT(
	SBCLKI : IN std_logic := 'X';
	SBRWI : IN std_logic := 'X';
	SBSTBI : IN std_logic := 'X';
	SBADRI7 : IN std_logic := 'X';
	SBADRI6 : IN std_logic := 'X';
	SBADRI5 : IN std_logic := 'X';
	SBADRI4 : IN std_logic := 'X';
	SBADRI3 : IN std_logic := 'X';
	SBADRI2 : IN std_logic := 'X';
	SBADRI1 : IN std_logic := 'X';
	SBADRI0 : IN std_logic := 'X';
	SBDATI7 : IN std_logic := 'X';
	SBDATI6 : IN std_logic := 'X';
	SBDATI5 : IN std_logic := 'X';
	SBDATI4 : IN std_logic := 'X';
	SBDATI3 : IN std_logic := 'X';
	SBDATI2 : IN std_logic := 'X';
	SBDATI1 : IN std_logic := 'X';
	SBDATI0 : IN std_logic := 'X';
	MI : IN std_logic := 'X';
	SI : IN std_logic := 'X';
	SCKI : IN std_logic := 'X';
	SCSNI : IN std_logic := 'X';
	SBDATO7 : OUT std_logic := 'X';
	SBDATO6 : OUT std_logic := 'X';
	SBDATO5 : OUT std_logic := 'X';
	SBDATO4 : OUT std_logic := 'X';
	SBDATO3 : OUT std_logic := 'X';
	SBDATO2 : OUT std_logic := 'X';
	SBDATO1 : OUT std_logic := 'X';
	SBDATO0 : OUT std_logic := 'X';
	SBACKO : OUT std_logic := 'X';
	SPIIRQ : OUT std_logic := 'X';
	SPIWKUP : OUT std_logic := 'X';
	SO : OUT std_logic := 'X';
	SOE : OUT std_logic := 'X';
	MO : OUT std_logic := 'X';
	MOE : OUT std_logic := 'X';
	SCKO : OUT std_logic := 'X';
	SCKOE : OUT std_logic := 'X';
	MCSNO3 : OUT std_logic := 'X';
	MCSNO2 : OUT std_logic := 'X';
	MCSNO1 : OUT std_logic := 'X';
	MCSNO0 : OUT std_logic := 'X';
	MCSNOE3 : OUT std_logic := 'X';
	MCSNOE2 : OUT std_logic := 'X';
	MCSNOE1 : OUT std_logic := 'X';
	MCSNOE0 : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of SPI_B : COMPONENT IS true;

COMPONENT VFB_B
PORT(
	ADDRESS13 : IN std_logic := 'X';
	ADDRESS12 : IN std_logic := 'X';
	ADDRESS11 : IN std_logic := 'X';
	ADDRESS10 : IN std_logic := 'X';
	ADDRESS9 : IN std_logic := 'X';
	ADDRESS8 : IN std_logic := 'X';
	ADDRESS7 : IN std_logic := 'X';
	ADDRESS6 : IN std_logic := 'X';
	ADDRESS5 : IN std_logic := 'X';
	ADDRESS4 : IN std_logic := 'X';
	ADDRESS3 : IN std_logic := 'X';
	ADDRESS2 : IN std_logic := 'X';
	ADDRESS1 : IN std_logic := 'X';
	ADDRESS0 : IN std_logic := 'X';
	DATAIN15 : IN std_logic := 'X';
	DATAIN14 : IN std_logic := 'X';
	DATAIN13 : IN std_logic := 'X';
	DATAIN12 : IN std_logic := 'X';
	DATAIN11 : IN std_logic := 'X';
	DATAIN10 : IN std_logic := 'X';
	DATAIN9 : IN std_logic := 'X';
	DATAIN8 : IN std_logic := 'X';
	DATAIN7 : IN std_logic := 'X';
	DATAIN6 : IN std_logic := 'X';
	DATAIN5 : IN std_logic := 'X';
	DATAIN4 : IN std_logic := 'X';
	DATAIN3 : IN std_logic := 'X';
	DATAIN2 : IN std_logic := 'X';
	DATAIN1 : IN std_logic := 'X';
	DATAIN0 : IN std_logic := 'X';
	MASKWREN3 : IN std_logic := 'X';
	MASKWREN2 : IN std_logic := 'X';
	MASKWREN1 : IN std_logic := 'X';
	MASKWREN0 : IN std_logic := 'X';
	WREN : IN std_logic := 'X';
	CHIPSELECT : IN std_logic := 'X';
	CLOCK : IN std_logic := 'X';
	RDMARGINEN : IN std_logic := 'X';
	RDMARGIN3 : IN std_logic := 'X';
	RDMARGIN2 : IN std_logic := 'X';
	RDMARGIN1 : IN std_logic := 'X';
	RDMARGIN0 : IN std_logic := 'X';
	STANDBY : IN std_logic := 'X';
	SLEEP : IN std_logic := 'X';
	POWEROFF_N : IN std_logic := 'X';
	TEST : IN std_logic := 'X';
	DATAOUT15 : OUT std_logic := 'X';
	DATAOUT14 : OUT std_logic := 'X';
	DATAOUT13 : OUT std_logic := 'X';
	DATAOUT12 : OUT std_logic := 'X';
	DATAOUT11 : OUT std_logic := 'X';
	DATAOUT10 : OUT std_logic := 'X';
	DATAOUT9 : OUT std_logic := 'X';
	DATAOUT8 : OUT std_logic := 'X';
	DATAOUT7 : OUT std_logic := 'X';
	DATAOUT6 : OUT std_logic := 'X';
	DATAOUT5 : OUT std_logic := 'X';
	DATAOUT4 : OUT std_logic := 'X';
	DATAOUT3 : OUT std_logic := 'X';
	DATAOUT2 : OUT std_logic := 'X';
	DATAOUT1 : OUT std_logic := 'X';
	DATAOUT0 : OUT std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of VFB_B : COMPONENT IS true;

COMPONENT WARMBOOT
PORT(
	S1 : IN std_logic := 'X';
	S0 : IN std_logic := 'X';
	BOOT : IN std_logic := 'X');
END COMPONENT;
	attribute syn_black_box of WARMBOOT : COMPONENT IS true;

attribute syn_lib_cell of all : Component is true;
end Components;







