library verilog;
use verilog.vl_types.all;
entity sb_prbs is
    generic(
        W_EQ_8          : integer := 0;
        W_EQ_10         : integer := 1;
        W_EQ_16         : integer := 2;
        W_EQ_20         : integer := 3;
        PRBS_7          : integer := 0;
        PRBS_31         : integer := 1;
        PRBS_UNUSED     : integer := 2;
        PRBS_23         : integer := 3
    );
    port(
        data_out        : out    vl_logic_vector(9 downto 0);
        match_error     : out    vl_logic;
        data_in         : in     vl_logic_vector(9 downto 0);
        width10_not8    : in     vl_logic;
        polynomial31_not7: in     vl_logic;
        lock            : in     vl_logic;
        clock           : in     vl_logic;
        reset_n         : in     vl_logic;
        err_inj         : in     vl_logic
    );
end sb_prbs;
