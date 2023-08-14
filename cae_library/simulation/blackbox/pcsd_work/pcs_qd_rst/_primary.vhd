library verilog;
use verilog.vl_types.all;
entity pcs_qd_rst is
    port(
        tri_ion_reset   : in     vl_logic;
        qif_quad_rst    : in     vl_logic;
        qif_macro_rst   : in     vl_logic;
        qif_trst        : in     vl_logic;
        qif_rrst        : in     vl_logic_vector(3 downto 0);
        ffc_quad_rst    : in     vl_logic;
        ffc_macro_rst   : in     vl_logic;
        ffc_trst        : in     vl_logic;
        ffc_rrst        : in     vl_logic_vector(3 downto 0);
        quad_reset_all  : out    vl_logic;
        quad_reset_all_n: out    vl_logic;
        macro_rst       : out    vl_logic;
        trst            : out    vl_logic;
        rrst            : out    vl_logic_vector(3 downto 0)
    );
end pcs_qd_rst;
