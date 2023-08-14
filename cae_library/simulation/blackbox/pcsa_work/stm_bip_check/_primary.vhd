library verilog;
use verilog.vl_types.all;
entity stm_bip_check is
    generic(
        max_num_col     : integer := 90
    );
    port(
        bip_err         : out    vl_logic_vector(7 downto 0);
        bip_err_vld     : out    vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        fram_data_in    : in     vl_logic_vector(7 downto 0);
        desc_data_out   : in     vl_logic_vector(7 downto 0);
        row_cnt         : in     vl_logic_vector(3 downto 0);
        colm_cnt        : in     vl_logic_vector(6 downto 0);
        sts_cnt         : in     vl_logic_vector(5 downto 0);
        sts_mode        : in     vl_logic
    );
end stm_bip_check;
