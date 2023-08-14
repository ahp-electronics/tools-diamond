library verilog;
use verilog.vl_types.all;
entity pcs_qd_clk is
    port(
        quad_reset_all_n: in     vl_logic;
        ff_tx_clk_sel   : in     vl_logic_vector(2 downto 0);
        tck_full        : in     vl_logic;
        ff_tx_f_clk     : out    vl_logic;
        ff_tx_h_clk     : out    vl_logic;
        ff_tx_q_clk     : out    vl_logic
    );
end pcs_qd_clk;
