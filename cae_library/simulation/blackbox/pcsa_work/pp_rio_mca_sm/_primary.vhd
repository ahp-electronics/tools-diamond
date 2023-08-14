library verilog;
use verilog.vl_types.all;
entity pp_rio_mca_sm is
    generic(
        NOT_ALIGNED     : integer := 0;
        NOT_ALIGNED_2   : integer := 1;
        ALIGNED         : integer := 2;
        ALIGNED_2       : integer := 3
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        sync_status     : in     vl_logic;
        symbol_aligned  : in     vl_logic;
        deskew_error    : in     vl_logic;
        enable_deskew   : out    vl_logic;
        lanes_aligned   : out    vl_logic
    );
end pp_rio_mca_sm;
