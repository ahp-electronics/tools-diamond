library verilog;
use verilog.vl_types.all;
entity e3_aux_ch is
    generic(
        TX_LOL_DET      : integer := 1
    );
    port(
        REFCLKP         : in     vl_logic;
        REFCLKN         : in     vl_logic;
        mrstb           : in     vl_logic;
        trst            : in     vl_logic;
        macropdb        : in     vl_logic;
        bus8bit_sel     : in     vl_logic;
        refck_in_sel    : in     vl_logic_vector(1 downto 0);
        refck_out_en    : in     vl_logic;
        ck_core_tx      : in     vl_logic;
        refck25x        : in     vl_logic;
        refck_in        : in     vl_logic;
        refck_mode      : in     vl_logic_vector(1 downto 0);
        refck_out_sel   : in     vl_logic_vector(1 downto 0);
        pll_lol_set     : in     vl_logic_vector(1 downto 0);
        senrxref        : in     vl_logic;
        sync_pulse      : in     vl_logic;
        tx_refck_sel    : in     vl_logic;
        tx_vco_ck_div   : in     vl_logic_vector(2 downto 0);
        auto_band_enb   : in     vl_logic;
        band_threshold  : in     vl_logic_vector(3 downto 0);
        calib_ck_mode   : in     vl_logic;
        calib_time_sel  : in     vl_logic_vector(1 downto 0);
        reg_band_sel    : in     vl_logic_vector(3 downto 0);
        reg_calib_rst   : in     vl_logic;
        reg_calib_en    : in     vl_logic;
        ibias_a         : in     vl_logic_vector(7 downto 0);
        bsfpadref       : out    vl_logic;
        ck3g4tx         : out    vl_logic;
        plol            : out    vl_logic;
        refck2core      : out    vl_logic;
        refck_out       : out    vl_logic;
        rx_refck_local  : out    vl_logic;
        tck_full        : out    vl_logic;
        tie_low_out     : out    vl_logic
    );
end e3_aux_ch;
