library verilog;
use verilog.vl_types.all;
entity rng is
    generic(
        RNG_IDLE        : integer := 0;
        RNG_SHIFT0      : integer := 1;
        RNG_SHIFT1      : integer := 2;
        RNG_WAIT        : integer := 3;
        RNG_RNUM_REG    : integer := 0;
        RNG_CTRL_REG    : integer := 1;
        RNG_ROEN_REG    : integer := 2
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        wb_adr_i        : in     vl_logic_vector(3 downto 2);
        wb_dat_i        : in     vl_logic_vector(31 downto 0);
        wb_we_i         : in     vl_logic;
        wb_sel_i        : in     vl_logic_vector(3 downto 0);
        wb_stb_i        : in     vl_logic;
        wb_dat_o        : out    vl_logic_vector(31 downto 0);
        wb_ack_o        : out    vl_logic;
        ringosc_rdy     : in     vl_logic;
        ringosc_data    : in     vl_logic;
        rng_start       : out    vl_logic;
        rng_rand_num    : out    vl_logic_vector(31 downto 0);
        rng_group_en    : out    vl_logic_vector(15 downto 0);
        rng_variant_en  : out    vl_logic_vector(15 downto 0)
    );
end rng;
