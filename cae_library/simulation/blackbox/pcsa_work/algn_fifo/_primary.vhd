library verilog;
use verilog.vl_types.all;
entity algn_fifo is
    generic(
        ADDR_WID        : integer := 6;
        DATA_WID        : integer := 12
    );
    port(
        BIST            : in     vl_logic;
        BFC             : in     vl_logic;
        BF0             : out    vl_logic;
        BC              : out    vl_logic;
        scan_mode       : in     vl_logic;
        scan_enable     : in     vl_logic;
        align_en        : in     vl_logic;
        align_pulse     : in     vl_logic;
        x4_done         : in     vl_logic;
        x2_done         : in     vl_logic;
        x4_fail         : in     vl_logic;
        x2_fail         : in     vl_logic;
        x4_rd_rst_n     : in     vl_logic;
        x2_rd_rst_n     : in     vl_logic;
        x4_mode         : in     vl_logic;
        x2_mode         : in     vl_logic;
        wr_clk          : in     vl_logic;
        wr_data         : in     vl_logic_vector;
        rd_clk          : in     vl_logic;
        rd_rst_n        : in     vl_logic;
        rd_data         : out    vl_logic_vector;
        align_edge      : out    vl_logic
    );
end algn_fifo;
