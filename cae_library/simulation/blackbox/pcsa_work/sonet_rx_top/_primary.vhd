library verilog;
use verilog.vl_types.all;
entity sonet_rx_top is
    port(
        stm_rx_data_out : out    vl_logic_vector(11 downto 0);
        rx_aisl_cond    : out    vl_logic;
        bip_error       : out    vl_logic_vector(7 downto 0);
        concat_ind      : out    vl_logic_vector(47 downto 0);
        rdi_state_out   : out    vl_logic;
        aligner_data_out: out    vl_logic_vector(11 downto 0);
        bf0             : out    vl_logic;
        bc              : out    vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        clk_pi          : in     vl_logic;
        rst_pi_n        : in     vl_logic;
        fast_frame_mode : in     vl_logic;
        serdes_data     : in     vl_logic_vector(7 downto 0);
        ptr_int_data_in_sel: in     vl_logic;
        oof_sel         : in     vl_logic_vector(2 downto 0);
        sts_mode        : in     vl_logic;
        oof_aisl        : in     vl_logic;
        force_aisl      : in     vl_logic;
        disable_descrambler: in     vl_logic;
        frame_pulse_on_a2: in     vl_logic;
        bist            : in     vl_logic;
        bfc             : in     vl_logic;
        scan_mode       : in     vl_logic;
        rx_data_out_sel : in     vl_logic_vector(1 downto 0);
        aligner_data_in : in     vl_logic_vector(11 downto 0)
    );
end sonet_rx_top;
