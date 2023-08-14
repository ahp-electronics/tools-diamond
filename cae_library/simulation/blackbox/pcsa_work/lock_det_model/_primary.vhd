library verilog;
use verilog.vl_types.all;
entity lock_det_model is
    port(
        refclk          : in     vl_logic;
        divclk          : in     vl_logic;
        mrstb           : in     vl_logic;
        reset           : in     vl_logic;
        lock_diff       : in     vl_logic_vector(1 downto 0);
        pll_lol         : out    vl_logic
    );
end lock_det_model;
