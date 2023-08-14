library verilog;
use verilog.vl_types.all;
entity sha_engine_top is
    generic(
        CF_WAIT         : integer := 0;
        CF_INIT         : integer := 1;
        CF_FEED         : integer := 2;
        CF_WVLD         : integer := 3;
        ED_S0           : integer := 0;
        ED_S1           : integer := 1;
        ED_S2           : integer := 2;
        ED_S3           : integer := 3
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        write_en        : in     vl_logic;
        last_cbyte      : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        sha_init        : in     vl_logic;
        rb_ready        : out    vl_logic;
        sha_done        : out    vl_logic;
        sha_digest      : out    vl_logic_vector(255 downto 0)
    );
end sha_engine_top;
