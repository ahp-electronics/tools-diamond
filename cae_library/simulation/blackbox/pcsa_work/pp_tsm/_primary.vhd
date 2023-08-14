library verilog;
use verilog.vl_types.all;
entity pp_tsm is
    generic(
        SEND_DATA       : integer := 0;
        SEND_A          : integer := 1;
        SEND_K          : integer := 2;
        SEND_Q          : integer := 3;
        SEND_RANDOM_R   : integer := 4;
        SEND_RANDOM_A   : integer := 5;
        SEND_RANDOM_K   : integer := 6;
        SEND_RANDOM_Q   : integer := 7;
        I               : integer := 7;
        A1              : integer := 124;
        A2              : integer := 251;
        R1              : integer := 28;
        R2              : integer := 253;
        K               : integer := 188;
        Q               : integer := 156
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        rio_mode        : in     vl_logic;
        txd_i           : in     vl_logic_vector(7 downto 0);
        txc_i           : in     vl_logic;
        txd_o           : out    vl_logic_vector(7 downto 0);
        txc_o           : out    vl_logic;
        slave           : in     vl_logic;
        idle_i          : in     vl_logic;
        a_count_i       : in     vl_logic_vector(4 downto 0);
        next_ifg_i      : in     vl_logic;
        code_sel_i      : in     vl_logic;
        seq_i           : in     vl_logic;
        idle_l          : out    vl_logic;
        a_count_l       : out    vl_logic_vector(4 downto 0);
        next_ifg_l      : out    vl_logic;
        code_sel_l      : out    vl_logic;
        seq_l           : out    vl_logic
    );
end pp_tsm;
