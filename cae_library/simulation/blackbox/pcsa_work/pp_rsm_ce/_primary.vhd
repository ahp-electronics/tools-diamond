library verilog;
use verilog.vl_types.all;
entity pp_rsm_ce is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        rio_mode        : in     vl_logic;
        disparity_error_i: in     vl_logic;
        code_violation_i: in     vl_logic;
        rxd_i           : in     vl_logic_vector(7 downto 0);
        rxc_i           : in     vl_logic;
        disparity_error_o: out    vl_logic;
        code_violation_o: out    vl_logic;
        rxd_o           : out    vl_logic_vector(7 downto 0);
        rxc_o           : out    vl_logic;
        t_detect_dni    : in     vl_logic;
        t_detect_upi    : in     vl_logic;
        t_detect_dno    : out    vl_logic;
        t_detect_upo    : out    vl_logic
    );
end pp_rsm_ce;
