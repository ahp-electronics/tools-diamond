library verilog;
use verilog.vl_types.all;
entity select_clocks is
    port(
        sysclk          : out    vl_logic;
        pcs_rxclk       : out    vl_logic;
        m_rxclk         : out    vl_logic;
        fb_rxclk        : out    vl_logic;
        txclk           : in     vl_logic;
        txclk_m         : in     vl_logic;
        rxclk           : in     vl_logic;
        rxclk_m         : in     vl_logic;
        cascade_clk     : in     vl_logic;
        test_clk        : in     vl_logic;
        tie_hi          : in     vl_logic;
        pcs_mode        : in     vl_logic;
        uc_mode         : in     vl_logic;
        cascade_en      : in     vl_logic;
        sb_loopback     : in     vl_logic;
        sblpbk_m        : in     vl_logic;
        test_mode       : in     vl_logic
    );
end select_clocks;
