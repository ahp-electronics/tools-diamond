library verilog;
use verilog.vl_types.all;
entity ac_top is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        wr_risc         : in     vl_logic;
        rd_risc         : in     vl_logic;
        offs_risc       : in     vl_logic_vector(7 downto 0);
        wdata_risc      : in     vl_logic_vector(31 downto 0);
        rdata_risc      : out    vl_logic_vector(31 downto 0);
        ac_alg_sel      : in     vl_logic_vector(1 downto 0);
        data_in         : in     vl_logic_vector(7 downto 0);
        write_en        : in     vl_logic;
        last_cbyte      : in     vl_logic;
        busy            : out    vl_logic_vector(1 downto 0);
        pass_fail       : out    vl_logic;
        pf_valid        : out    vl_logic;
        sha_init        : out    vl_logic;
        rb_ready        : in     vl_logic;
        data_out        : out    vl_logic_vector(7 downto 0);
        valid_out       : out    vl_logic;
        last_out        : out    vl_logic;
        sha_done        : in     vl_logic;
        sha_digest      : in     vl_logic_vector(255 downto 0)
    );
end ac_top;
