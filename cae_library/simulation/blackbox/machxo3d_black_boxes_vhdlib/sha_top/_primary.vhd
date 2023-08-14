library verilog;
use verilog.vl_types.all;
entity sha_top is
    generic(
        SRC_AC          : integer := 0;
        SRC_BUSIF       : integer := 2;
        SRC_HSP         : integer := 3
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        as_src_sel_b10  : in     vl_logic_vector(1 downto 0);
        wr_bus          : in     vl_logic;
        rd_bus          : in     vl_logic;
        offs_bus        : in     vl_logic_vector(7 downto 0);
        wdata_bus       : in     vl_logic_vector(31 downto 0);
        rdata_bus       : out    vl_logic_vector(31 downto 0);
        wr_risc         : in     vl_logic;
        rd_risc         : in     vl_logic;
        offs_risc       : in     vl_logic_vector(7 downto 0);
        wdata_risc      : in     vl_logic_vector(31 downto 0);
        rdata_risc      : out    vl_logic_vector(31 downto 0);
        infifo_empty    : in     vl_logic;
        infifo_rd       : out    vl_logic;
        infifo_rdata    : in     vl_logic_vector(31 downto 0);
        outfifo_full    : in     vl_logic;
        outfifo_wr      : out    vl_logic;
        outfifo_wdata   : out    vl_logic_vector(31 downto 0);
        ac_sha_init     : in     vl_logic;
        ac_write_en     : in     vl_logic;
        ac_last_cbyte   : in     vl_logic;
        ac_data_in      : in     vl_logic_vector(7 downto 0);
        rb_ready        : out    vl_logic;
        sha_done        : out    vl_logic;
        sha_digest      : out    vl_logic_vector(255 downto 0)
    );
end sha_top;
