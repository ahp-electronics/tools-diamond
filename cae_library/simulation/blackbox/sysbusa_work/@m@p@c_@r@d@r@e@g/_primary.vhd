library verilog;
use verilog.vl_types.all;
entity MPC_RDREG is
    port(
        reset_n         : in     vl_logic;
        clk             : in     vl_logic;
        rd_clk          : in     vl_logic;
        BUS_SIZE        : in     vl_logic_vector(2 downto 0);
        sync            : in     vl_logic;
        done            : in     vl_logic;
        tsiz            : in     vl_logic_vector(0 to 1);
        wr_sel          : in     vl_logic_vector(1 downto 0);
        data_in         : in     vl_logic_vector(35 downto 0);
        shift_en        : in     vl_logic;
        rd_sel          : in     vl_logic_vector(3 downto 0);
        rd_ef           : out    vl_logic;
        brdata_out      : out    vl_logic_vector(35 downto 0);
        srdata_out      : out    vl_logic_vector(35 downto 0)
    );
end MPC_RDREG;
