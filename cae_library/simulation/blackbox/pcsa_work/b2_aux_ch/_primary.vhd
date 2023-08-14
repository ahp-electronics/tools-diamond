library verilog;
use verilog.vl_types.all;
entity b2_aux_ch is
    generic(
        lock_step_time  : integer := 1538460
    );
    port(
        REFCLKP         : in     vl_logic;
        REFCLKN         : in     vl_logic;
        RXREFCLKP       : in     vl_logic;
        RXREFCLKN       : in     vl_logic;
        mrstb           : in     vl_logic;
        trst            : in     vl_logic;
        macropdb        : in     vl_logic;
        ck_core_tx      : in     vl_logic;
        ck_core_rx      : in     vl_logic;
        lock_diff       : in     vl_logic_vector(1 downto 0);
        senrxref        : in     vl_logic;
        senrxrref       : in     vl_logic;
        bus8bit_sel     : in     vl_logic;
        refck_mode      : in     vl_logic_vector(1 downto 0);
        refck_core_en   : in     vl_logic;
        rxrefck_en      : in     vl_logic;
        ibias_a         : in     vl_logic_vector(7 downto 0);
        pll_ctl_a       : in     vl_logic_vector(7 downto 0);
        pll_ctl_b       : in     vl_logic_vector(7 downto 0);
        pll_ctl_c       : in     vl_logic_vector(7 downto 0);
        pll_ctl_d       : in     vl_logic_vector(7 downto 0);
        pll_ctl_e       : in     vl_logic_vector(7 downto 0);
        pll_ctl_f       : in     vl_logic_vector(7 downto 0);
        pll_ctl_g       : in     vl_logic_vector(7 downto 0);
        ck3g4tx         : out    vl_logic;
        refck2core      : out    vl_logic;
        refck_rx        : out    vl_logic;
        rxrefck2core    : out    vl_logic;
        sync            : out    vl_logic;
        plol            : out    vl_logic;
        refloc          : out    vl_logic;
        rrefloc         : out    vl_logic;
        bsfpadref       : out    vl_logic;
        bsfpadrref      : out    vl_logic
    );
end b2_aux_ch;
