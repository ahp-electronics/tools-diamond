library verilog;
use verilog.vl_types.all;
entity toh_timing is
    port(
        rst_n           : in     vl_logic;
        clk             : in     vl_logic;
        frame_sync      : in     vl_logic;
        sts_mode        : in     vl_logic;
        sts_count       : out    vl_logic_vector(5 downto 0);
        row_count       : out    vl_logic_vector(3 downto 0);
        col_count       : out    vl_logic_vector(6 downto 0);
        sts_num         : out    vl_logic_vector(5 downto 0);
        default_time    : out    vl_logic;
        a1_time         : out    vl_logic;
        a2_time         : out    vl_logic;
        b1_time         : out    vl_logic;
        h1_time         : out    vl_logic;
        k2_time         : out    vl_logic;
        b1_time_a       : out    vl_logic;
        k2_time_a       : out    vl_logic;
        a1_tfi5         : out    vl_logic;
        a2_tfi5         : out    vl_logic;
        end_time        : out    vl_logic
    );
end toh_timing;
