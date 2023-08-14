library verilog;
use verilog.vl_types.all;
entity auto_toh is
    port(
        rst_n           : in     vl_logic;
        clk             : in     vl_logic;
        test_mode       : in     vl_logic;
        scan_mode       : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        frame_sync      : in     vl_logic;
        scrambler_disable: in     vl_logic;
        auto_toh        : in     vl_logic;
        sts_mode        : in     vl_logic;
        shift_a1a2      : in     vl_logic;
        auto_a1a2       : in     vl_logic;
        auto_b1         : in     vl_logic;
        tfi5_mode       : in     vl_logic;
        force_rdi_aisl  : in     vl_logic;
        rx_aisl_cond    : in     vl_logic;
        a1a2_error_reg  : in     vl_logic_vector(7 downto 0);
        b1_error_reg    : in     vl_logic_vector(7 downto 0);
        k2_error_reg    : in     vl_logic_vector(7 downto 0);
        a1a2_start_seq  : in     vl_logic;
        b1_start_seq    : in     vl_logic;
        k2_start_seq    : in     vl_logic;
        a1a2_mpi_wstr   : in     vl_logic;
        b1_mpi_wstr     : in     vl_logic;
        k2_mpi_wstr     : in     vl_logic;
        start_seq_wstr  : in     vl_logic;
        data_out        : out    vl_logic_vector(7 downto 0);
        count_done_int  : out    vl_logic
    );
end auto_toh;
