library verilog;
use verilog.vl_types.all;
entity reg_3efxx is
    generic(
        creg            : integer := 11;
        sreg            : integer := 1
    );
    port(
        q15_rdata       : out    vl_logic_vector(7 downto 0);
        q15_local_rdata : out    vl_logic_vector(7 downto 0);
        creg_0          : out    vl_logic_vector(7 downto 0);
        creg_1          : out    vl_logic_vector(7 downto 0);
        creg_2          : out    vl_logic_vector(7 downto 0);
        creg_3          : out    vl_logic_vector(7 downto 0);
        creg_4          : out    vl_logic_vector(7 downto 0);
        creg_5          : out    vl_logic_vector(7 downto 0);
        creg_6          : out    vl_logic_vector(7 downto 0);
        creg_7          : out    vl_logic_vector(7 downto 0);
        creg_8          : out    vl_logic_vector(7 downto 0);
        creg_9          : out    vl_logic_vector(7 downto 0);
        creg_A          : out    vl_logic_vector(7 downto 0);
        all_pcs_int     : out    vl_logic;
        PCS_TRI_ION     : out    vl_logic;
        PCS_M_TRI_ION   : out    vl_logic;
        LASB_PWRUPRES   : out    vl_logic;
        RASB_PWRUPRES   : out    vl_logic;
        pcs_rst_n       : out    vl_logic;
        LASB_INIT_N     : in     vl_logic;
        RASB_INIT_N     : in     vl_logic;
        LASB_TRI_ION    : in     vl_logic;
        RASB_TRI_ION    : in     vl_logic;
        rpcs_addr       : in     vl_logic_vector(7 downto 0);
        rpcs_wdata      : in     vl_logic_vector(7 downto 0);
        rpcs_wstb       : in     vl_logic;
        rpcs_rd         : in     vl_logic;
        rpcs_cs_q15     : in     vl_logic;
        rpcs_rdata      : in     vl_logic_vector(7 downto 0);
        sreg_0          : in     vl_logic_vector(7 downto 0)
    );
end reg_3efxx;
