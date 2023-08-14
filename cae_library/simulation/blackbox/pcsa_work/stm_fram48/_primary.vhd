library verilog;
use verilog.vl_types.all;
entity stm_fram48 is
    generic(
        oof             : integer := 0;
        f6_1            : integer := 1;
        f6_2            : integer := 2;
        f6_3            : integer := 3;
        t8_1            : integer := 4;
        t8_2            : integer := 5;
        t8_3            : integer := 6;
        p_con1          : integer := 7;
        p_con2          : integer := 8;
        frame           : integer := 9;
        oof_1           : integer := 10;
        oof_2           : integer := 11;
        max_num_col     : integer := 90
    );
    port(
        row_cnt         : out    vl_logic_vector(3 downto 0);
        colm_cnt        : out    vl_logic_vector(6 downto 0);
        sts_cnt         : out    vl_logic_vector(5 downto 0);
        data_out        : out    vl_logic_vector(7 downto 0);
        frame_pulse     : out    vl_logic;
        frame_pulse_d1  : out    vl_logic;
        frame_pulse_d2  : out    vl_logic;
        oof_ind         : out    vl_logic;
        k2_byte_val     : out    vl_logic;
        a2_frame_d2     : out    vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        sts_mode        : in     vl_logic;
        fast_frame_mode : in     vl_logic;
        oof_sel         : in     vl_logic_vector(2 downto 0)
    );
end stm_fram48;
