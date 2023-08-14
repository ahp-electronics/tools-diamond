library verilog;
use verilog.vl_types.all;
entity sb_tx is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data_i          : in     vl_logic_vector(9 downto 0);
        sb_mode         : in     vl_logic;
        sb_inv_tx       : in     vl_logic;
        sb_rev_tx       : in     vl_logic;
        prbs_select     : in     vl_logic;
        prbs_enable     : in     vl_logic;
        prbs_err_inj    : in     vl_logic;
        data_o          : out    vl_logic_vector(9 downto 0)
    );
end sb_tx;
