library verilog;
use verilog.vl_types.all;
entity stm_descrambler is
    generic(
        max_num_col     : integer := 90
    );
    port(
        data_out        : out    vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        sts_mode        : in     vl_logic;
        disable_descrambler: in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        colm_cnt        : in     vl_logic_vector(6 downto 0);
        row_cnt         : in     vl_logic_vector(3 downto 0);
        sts_cnt         : in     vl_logic_vector(5 downto 0)
    );
end stm_descrambler;
