library verilog;
use verilog.vl_types.all;
entity config_wakeup is
    port(
        done_pin_override: in     vl_logic;
        done_pin_low    : in     vl_logic;
        done_reg        : in     vl_logic;
        error           : in     vl_logic;
        unprogram       : in     vl_logic;
        done_phase      : in     vl_logic_vector(3 downto 0);
        goe_phase       : in     vl_logic_vector(2 downto 0);
        gwd_phase       : in     vl_logic_vector(2 downto 0);
        gsr_phase       : in     vl_logic_vector(2 downto 0);
        pll_set         : in     vl_logic_vector(7 downto 0);
        syn_ext_done    : in     vl_logic;
        ext_done        : in     vl_logic;
        pll_lock        : in     vl_logic_vector(7 downto 0);
        internal_done   : in     vl_logic;
        async_rst       : in     vl_logic;
        progen_o        : in     vl_logic;
        wakeup_clk      : in     vl_logic;
        not_edit        : in     vl_logic;
        wake_period     : in     vl_logic_vector(2 downto 0);
        forcearch       : in     vl_logic;
        pll_set2        : in     vl_logic_vector(5 downto 0);
        pll_lock2       : in     vl_logic_vector(5 downto 0);
        wakeup_adv      : out    vl_logic;
        wakeup          : out    vl_logic;
        wakeup_minus    : out    vl_logic;
        wakeup_minus_r  : out    vl_logic;
        goe_high_r      : out    vl_logic;
        gwd_high_r      : out    vl_logic;
        gsr_high_r      : out    vl_logic;
        jtag_unprogram_dly: out    vl_logic;
        done_high_all   : out    vl_logic
    );
end config_wakeup;
