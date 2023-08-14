library verilog;
use verilog.vl_types.all;
entity sha_ring_buff is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        sha_init        : in     vl_logic;
        write_en        : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        read_en         : in     vl_logic;
        data_out        : out    vl_logic_vector(31 downto 0);
        full            : out    vl_logic;
        ready           : out    vl_logic;
        empty           : out    vl_logic
    );
end sha_ring_buff;
