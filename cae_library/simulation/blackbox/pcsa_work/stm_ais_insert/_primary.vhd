library verilog;
use verilog.vl_types.all;
entity stm_ais_insert is
    port(
        data_out        : out    vl_logic_vector(7 downto 0);
        rx_aisl_cond    : out    vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        frame_pulse     : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        colm_cnt        : in     vl_logic_vector(6 downto 0);
        row_cnt         : in     vl_logic_vector(3 downto 0);
        sts_cnt         : in     vl_logic_vector(5 downto 0);
        oof_ind         : in     vl_logic;
        oof_aisl        : in     vl_logic;
        force_aisl      : in     vl_logic
    );
end stm_ais_insert;
