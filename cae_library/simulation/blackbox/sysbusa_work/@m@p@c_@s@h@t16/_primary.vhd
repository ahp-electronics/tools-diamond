library verilog;
use verilog.vl_types.all;
entity MPC_SHT16 is
    port(
        reset_n         : in     vl_logic;
        clk             : in     vl_logic;
        rd_clk          : in     vl_logic;
        BUS_SIZE        : in     vl_logic_vector(2 downto 0);
        done            : in     vl_logic;
        sync            : in     vl_logic;
        data_in         : in     vl_logic_vector(35 downto 0);
        shift_en        : in     vl_logic;
        rd_sel          : in     vl_logic_vector(3 downto 0);
        rd_ef           : out    vl_logic;
        data_out        : out    vl_logic_vector(35 downto 0)
    );
end MPC_SHT16;
