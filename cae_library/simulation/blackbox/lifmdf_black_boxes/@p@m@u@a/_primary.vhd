library verilog;
use verilog.vl_types.all;
entity PMUA is
    generic(
        UWDTEN          : string  := "DISABLED";
        UWDTMD          : string  := "COUNT_ONCE";
        UWDTINT         : string  := "ENABLED";
        EXTEN           : string  := "DISABLED";
        I2CEN           : string  := "ENABLED";
        WDTEN           : string  := "ENABLED";
        SLPCNT          : string  := "COUNTER_1";
        PMUWDTCNT1      : integer := 0;
        PMUWDTCNT2      : integer := 0;
        PMUWDTCNT3      : integer := 0;
        HEXLEN          : integer := 8
    );
    port(
        USRWKUPN        : in     vl_logic;
        PMUWKUP         : in     vl_logic;
        PMUCLK          : in     vl_logic;
        USRCLK          : in     vl_logic;
        USRCS           : in     vl_logic;
        USRSTB          : in     vl_logic;
        USRADR3         : in     vl_logic;
        USRADR2         : in     vl_logic;
        USRADR1         : in     vl_logic;
        USRADR0         : in     vl_logic;
        USRDATA7        : in     vl_logic;
        USRDATA6        : in     vl_logic;
        USRDATA5        : in     vl_logic;
        USRDATA4        : in     vl_logic;
        USRDATA3        : in     vl_logic;
        USRDATA2        : in     vl_logic;
        USRDATA1        : in     vl_logic;
        USRDATA0        : in     vl_logic;
        SLEEP           : in     vl_logic;
        USRWDTDONE      : out    vl_logic;
        USRWDTINT       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of UWDTEN : constant is 1;
    attribute mti_svvh_generic_type of UWDTMD : constant is 1;
    attribute mti_svvh_generic_type of UWDTINT : constant is 1;
    attribute mti_svvh_generic_type of EXTEN : constant is 1;
    attribute mti_svvh_generic_type of I2CEN : constant is 1;
    attribute mti_svvh_generic_type of WDTEN : constant is 1;
    attribute mti_svvh_generic_type of SLPCNT : constant is 1;
    attribute mti_svvh_generic_type of PMUWDTCNT1 : constant is 1;
    attribute mti_svvh_generic_type of PMUWDTCNT2 : constant is 1;
    attribute mti_svvh_generic_type of PMUWDTCNT3 : constant is 1;
    attribute mti_svvh_generic_type of HEXLEN : constant is 1;
end PMUA;
