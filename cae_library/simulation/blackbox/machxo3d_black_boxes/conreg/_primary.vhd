library verilog;
use verilog.vl_types.all;
entity conreg is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enc_enabled     : in     vl_logic;
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
        ri_ctrl4_0      : out    vl_logic;
        as_src_sel_2    : out    vl_logic;
        cr_seed         : out    vl_logic_vector(40 downto 0);
        as_src_sel_10   : out    vl_logic_vector(1 downto 0);
        gen_con_20      : out    vl_logic_vector(2 downto 0);
        uds_out         : out    vl_logic_vector(255 downto 0);
        uds_in          : in     vl_logic_vector(255 downto 0)
    );
end conreg;
