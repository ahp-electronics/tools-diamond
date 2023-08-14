library verilog;
use verilog.vl_types.all;
entity MPI_DELAYS is
    port(
        CS1             : in     vl_logic;
        CS0_N           : in     vl_logic;
        RD_N            : in     vl_logic;
        WR_N            : in     vl_logic;
        MPC_BURST       : in     vl_logic;
        MPC_BDIP        : in     vl_logic;
        MPC_WR_DATA     : in     vl_logic_vector(0 to 31);
        MPC_TSIZ        : in     vl_logic_vector(0 to 1);
        MPC_ADDR        : in     vl_logic_vector(14 to 31);
        MPC_WR_PARITY   : in     vl_logic_vector(0 to 3);
        DEL_CS1         : out    vl_logic;
        DEL_CS0_N       : out    vl_logic;
        DEL_RD_N        : out    vl_logic;
        DEL_WR_N        : out    vl_logic;
        DEL_MPC_BURST   : out    vl_logic;
        DEL_MPC_BDIP    : out    vl_logic;
        DEL_MPC_WR_DATA : out    vl_logic_vector(0 to 31);
        DEL_MPC_TSIZ    : out    vl_logic_vector(0 to 1);
        DEL_MPC_ADDR    : out    vl_logic_vector(14 to 31);
        DEL_MPC_WR_PARITY: out    vl_logic_vector(0 to 3)
    );
end MPI_DELAYS;
