library verilog;
use verilog.vl_types.all;
entity cfg_stm is
    port(
        mfg_scan_test_mode: out    vl_logic;
        scan_comp       : out    vl_logic;
        scan_spread     : out    vl_logic;
        scan_reset_sec  : out    vl_logic;
        mfg_scan_test_mode_pre: out    vl_logic;
        pwrup_pur_n     : in     vl_logic;
        smclk           : in     vl_logic;
        programn_pin    : in     vl_logic;
        lsc_iscan_en_cmd: in     vl_logic;
        isc_exec_d      : in     vl_logic;
        scan_comp_in    : in     vl_logic;
        scan_spread_in  : in     vl_logic;
        mc_scan_test_en : in     vl_logic_vector(3 downto 0)
    );
end cfg_stm;
