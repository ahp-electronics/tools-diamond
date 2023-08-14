library verilog;
use verilog.vl_types.all;
entity cpu is
    generic(
        PC_RESET_ADDR   : integer := 0;
        HAS_MULT        : integer := 0;
        UNSIGNED_MULT   : integer := 0
    );
    port(
        clk_i           : in     vl_logic;
        rst_i           : in     vl_logic;
        inst_rdata_i    : in     vl_logic_vector(31 downto 0);
        data_rdata_i    : in     vl_logic_vector(31 downto 0);
        ext_stall_i     : in     vl_logic;
        inst_raddr_o    : out    vl_logic_vector(31 downto 0);
        funct3_o        : out    vl_logic_vector(2 downto 0);
        data_addr_o     : out    vl_logic_vector(31 downto 0);
        data_wdata_o    : out    vl_logic_vector(31 downto 0);
        data_wr_en_o    : out    vl_logic
    );
end cpu;
