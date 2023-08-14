library verilog;
use verilog.vl_types.all;
entity aes_core is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        i_key_mode      : in     vl_logic_vector(1 downto 0);
        i_key           : in     vl_logic_vector(255 downto 0);
        i_start         : in     vl_logic;
        o_key_ready     : out    vl_logic;
        i_ende          : in     vl_logic;
        i_enable        : in     vl_logic;
        i_data          : in     vl_logic_vector(127 downto 0);
        i_data_valid    : in     vl_logic;
        o_ready         : out    vl_logic;
        o_data          : out    vl_logic_vector(127 downto 0);
        o_data_valid    : out    vl_logic
    );
end aes_core;
