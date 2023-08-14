library verilog;
use verilog.vl_types.all;
entity cfg_dec is
    generic(
        DEC_BUFSIZE     : integer := 18
    );
    port(
        CODE0           : in     vl_logic_vector(7 downto 0);
        CODE1           : in     vl_logic_vector(7 downto 0);
        CODE2           : in     vl_logic_vector(7 downto 0);
        CODE3           : in     vl_logic_vector(7 downto 0);
        CODE4           : in     vl_logic_vector(7 downto 0);
        CODE5           : in     vl_logic_vector(7 downto 0);
        CODE6           : in     vl_logic_vector(7 downto 0);
        CODE7           : in     vl_logic_vector(7 downto 0);
        IDCODE3         : in     vl_logic_vector(7 downto 0);
        IDCODE4         : in     vl_logic_vector(7 downto 0);
        IDCODE5         : in     vl_logic_vector(7 downto 0);
        IDCODE6         : in     vl_logic_vector(7 downto 0);
        IDCODE7         : in     vl_logic_vector(7 downto 0);
        DEC_EN          : in     vl_logic;
        SER_CCLK        : in     vl_logic;
        CFRONT_INIT_N   : in     vl_logic;
        P2S_DONE        : in     vl_logic;
        DEC_RDY         : in     vl_logic;
        DEC_DIN         : in     vl_logic_vector(7 downto 0);
        DEC_ACK         : out    vl_logic;
        DEC_LOAD        : out    vl_logic;
        DEC_DOUT        : out    vl_logic_vector(7 downto 0)
    );
end cfg_dec;
