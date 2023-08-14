library verilog;
use verilog.vl_types.all;
entity pp_ge_mca_sm is
    generic(
        LOSS_OF_ALIGNMENT: integer := 0;
        ALIGN_DETECT_1  : integer := 1;
        ALIGN_DETECT_2  : integer := 2;
        ALIGN_DETECT_3  : integer := 3;
        ALIGN_ACQUIRED_1: integer := 4;
        ALIGN_ACQUIRED_2: integer := 5;
        ALIGN_ACQUIRED_3: integer := 6;
        ALIGN_ACQUIRED_4: integer := 7
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        sync_status     : in     vl_logic;
        symbol_aligned  : in     vl_logic;
        deskew_error    : in     vl_logic;
        enable_deskew   : out    vl_logic;
        align_status    : out    vl_logic
    );
end pp_ge_mca_sm;
