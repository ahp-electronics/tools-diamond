library verilog;
use verilog.vl_types.all;
entity pcs_qd_clk_rst is
    port(
        ff_tx_clk_sel   : in     vl_logic_vector(2 downto 0);
        ffc_macro_rst   : in     vl_logic;
        ffc_quad_rst    : in     vl_logic;
        ffc_rrst        : in     vl_logic_vector(3 downto 0);
        ffc_trst        : in     vl_logic;
        qif_macro_rst   : in     vl_logic;
        qif_quad_rst    : in     vl_logic;
        qif_rrst        : in     vl_logic_vector(3 downto 0);
        qif_trst        : in     vl_logic;
        tck_full        : in     vl_logic;
        tri_ion_reset   : in     vl_logic;
        ff_tx_f_clk     : out    vl_logic;
        ff_tx_h_clk     : out    vl_logic;
        ff_tx_q_clk     : out    vl_logic;
        macro_rst       : out    vl_logic;
        quad_reset_all  : out    vl_logic;
        quad_reset_all_n: out    vl_logic;
        rrst            : out    vl_logic_vector(3 downto 0);
        trst            : out    vl_logic
    );
end pcs_qd_clk_rst;
