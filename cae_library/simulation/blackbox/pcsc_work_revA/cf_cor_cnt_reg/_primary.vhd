library verilog;
use verilog.vl_types.all;
entity cf_cor_cnt_reg is
    port(
        char_mode       : in     vl_logic;
        cor             : in     vl_logic;
        error           : in     vl_logic;
        resetn          : in     vl_logic;
        test_clk        : in     vl_logic;
        cnt_sts_reg     : out    vl_logic_vector(7 downto 0)
    );
end cf_cor_cnt_reg;
