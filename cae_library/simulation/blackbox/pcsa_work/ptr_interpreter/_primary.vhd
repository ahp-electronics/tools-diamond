library verilog;
use verilog.vl_types.all;
entity ptr_interpreter is
    generic(
        MAX_OFFSET      : integer := 782;
        MAX_NUM_STS     : integer := 48;
        MAX_NUM_ROW     : integer := 9;
        MAX_NUM_COL     : integer := 90;
        norm            : integer := 3;
        ais             : integer := 2;
        conc            : integer := 1;
        lop             : integer := 0
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        frame_pulse     : in     vl_logic;
        sts_mode        : in     vl_logic;
        scan_mode       : in     vl_logic;
        bist            : in     vl_logic;
        bfc             : in     vl_logic;
        data_out        : out    vl_logic_vector(7 downto 0);
        spe_vld         : out    vl_logic;
        j1_vld          : out    vl_logic;
        ptr_int_frame_pulse: out    vl_logic;
        a2_ptr_int_frame_pulse: out    vl_logic;
        concat_indicator: out    vl_logic_vector(47 downto 0);
        bf0             : out    vl_logic;
        bc              : out    vl_logic
    );
end ptr_interpreter;
