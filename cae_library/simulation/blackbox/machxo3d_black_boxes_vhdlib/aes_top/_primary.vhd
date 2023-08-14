library verilog;
use verilog.vl_types.all;
entity aes_top is
    generic(
        KEY128B         : integer := 0;
        KEY256B         : integer := 1;
        SRC_BUSIF       : integer := 0;
        SRC_HSP         : integer := 1
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        cr_en           : in     vl_logic;
        cr_seed         : in     vl_logic_vector(40 downto 0);
        enable          : out    vl_logic;
        enc_enabled     : in     vl_logic;
        ri_ctl4_b0      : in     vl_logic;
        as_src_sel_b2   : in     vl_logic;
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
        outfifo_wdata   : out    vl_logic_vector(31 downto 0)
    );
end aes_top;
