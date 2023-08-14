library verilog;
use verilog.vl_types.all;
entity pp_word_align is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        enable_cgalign  : in     vl_logic;
        rxd_i           : in     vl_logic_vector(9 downto 0);
        udf_comma_a     : in     vl_logic_vector(9 downto 0);
        udf_comma_b     : in     vl_logic_vector(9 downto 0);
        udf_mask        : in     vl_logic_vector(9 downto 0);
        rxd_o           : out    vl_logic_vector(9 downto 0);
        comma_detect    : out    vl_logic;
        align_sel_o     : out    vl_logic_vector(3 downto 0)
    );
end pp_word_align;
