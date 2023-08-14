library verilog;
use verilog.vl_types.all;
entity pp_tsm_fc is
    generic(
        K28_5           : integer := 444;
        D21_4           : integer := 149;
        D21_3           : integer := 117;
        D21_6           : integer := 213;
        D21_7           : integer := 245;
        D10_4           : integer := 138;
        D25_4           : integer := 153
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        txd_i           : in     vl_logic_vector(10 downto 0);
        txd_o           : out    vl_logic_vector(10 downto 0);
        correct_disp    : out    vl_logic
    );
end pp_tsm_fc;
