library verilog;
use verilog.vl_types.all;
entity scan_mpif_char is
    port(
        scan_mode       : out    vl_logic;
        scan_in_tx      : out    vl_logic;
        scan_in_rx      : out    vl_logic;
        scan_enable     : out    vl_logic;
        scan_rstn       : out    vl_logic;
        scan_mpif_char_out: out    vl_logic_vector(21 downto 0);
        scan_out_tx0    : in     vl_logic;
        scan_out_tx1    : in     vl_logic;
        scan_out_tx2    : in     vl_logic;
        scan_out_tx3    : in     vl_logic;
        scan_out_rx0    : in     vl_logic;
        scan_out_rx1    : in     vl_logic;
        scan_out_rx2    : in     vl_logic;
        scan_out_rx3    : in     vl_logic;
        mpif_rd_out     : in     vl_logic_vector(7 downto 0);
        char_scan_mode  : in     vl_logic;
        char_scan_in_tx : in     vl_logic;
        char_scan_in_rx : in     vl_logic;
        char_scan_enable: in     vl_logic;
        char_scan_rstn  : in     vl_logic;
        scan_mpif_quad_pair_sel: in     vl_logic;
        scan_mpif_char_out_prev: in     vl_logic_vector(21 downto 0);
        scan_mpif_test_mode: in     vl_logic;
        quad_id         : in     vl_logic_vector(1 downto 0)
    );
end scan_mpif_char;
