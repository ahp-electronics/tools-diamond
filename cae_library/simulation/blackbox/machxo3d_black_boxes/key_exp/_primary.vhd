library verilog;
use verilog.vl_types.all;
entity key_exp is
    generic(
        IDLE            : integer := 0;
        START           : integer := 1;
        GENKEY1         : integer := 2;
        GENKEY_256      : integer := 3
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        key_in          : in     vl_logic_vector(255 downto 0);
        key_mode        : in     vl_logic_vector(1 downto 0);
        key_start       : in     vl_logic;
        wr              : out    vl_logic;
        wr_addr         : out    vl_logic_vector(4 downto 0);
        wr_data         : out    vl_logic_vector(63 downto 0);
        key_ready       : out    vl_logic
    );
end key_exp;
