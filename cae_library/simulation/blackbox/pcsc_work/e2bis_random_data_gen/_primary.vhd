library verilog;
use verilog.vl_types.all;
entity e2bis_random_data_gen is
    port(
        clk             : in     vl_logic;
        bist_ptn_sel    : in     vl_logic_vector(2 downto 0);
        bus8bit_sel     : in     vl_logic;
        start           : in     vl_logic;
        random_d        : out    vl_logic_vector(9 downto 0)
    );
end e2bis_random_data_gen;
