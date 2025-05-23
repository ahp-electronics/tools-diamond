[ActiveSupport PAR]
; Global primary clocks
GLOBAL_PRIMARY_USED = 2;
; Global primary clock #0
GLOBAL_PRIMARY_0_SIGNALNAME = clk_c;
GLOBAL_PRIMARY_0_DRIVERTYPE = OSC;
GLOBAL_PRIMARY_0_LOADNUM = 284;
; Global primary clock #1
GLOBAL_PRIMARY_1_SIGNALNAME = TIME_INST/sec_clock;
GLOBAL_PRIMARY_1_DRIVERTYPE = SLICE;
GLOBAL_PRIMARY_1_LOADNUM = 13;
; # of global secondary clocks
GLOBAL_SECONDARY_USED = 3;
; Global secondary clock #0
GLOBAL_SECONDARY_0_SIGNALNAME = rst_n_c;
GLOBAL_SECONDARY_0_DRIVERTYPE = PIO;
GLOBAL_SECONDARY_0_LOADNUM = 52;
GLOBAL_SECONDARY_0_SIGTYPE = RST;
; Global secondary clock #1
GLOBAL_SECONDARY_1_SIGNALNAME = wb_rst;
GLOBAL_SECONDARY_1_DRIVERTYPE = SLICE;
GLOBAL_SECONDARY_1_LOADNUM = 11;
GLOBAL_SECONDARY_1_SIGTYPE = RST;
; Global secondary clock #2
GLOBAL_SECONDARY_2_SIGNALNAME = lm8_inst/u1_isp8/rst_n_reg;
GLOBAL_SECONDARY_2_DRIVERTYPE = SLICE;
GLOBAL_SECONDARY_2_LOADNUM = 45;
GLOBAL_SECONDARY_2_SIGTYPE = RST;
; I/O Bank 0 Usage
BANK_0_USED = 5;
BANK_0_AVAIL = 26;
BANK_0_VCCIO = 3.3V;
BANK_0_VREF1 = NA;
; I/O Bank 1 Usage
BANK_1_USED = 0;
BANK_1_AVAIL = 26;
BANK_1_VCCIO = NA;
BANK_1_VREF1 = NA;
; I/O Bank 2 Usage
BANK_2_USED = 7;
BANK_2_AVAIL = 28;
BANK_2_VCCIO = 3.3V;
BANK_2_VREF1 = NA;
; I/O Bank 3 Usage
BANK_3_USED = 14;
BANK_3_AVAIL = 25;
BANK_3_VCCIO = 3.3V;
BANK_3_VREF1 = NA;
