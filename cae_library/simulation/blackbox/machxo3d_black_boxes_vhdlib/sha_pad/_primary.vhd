library verilog;
use verilog.vl_types.all;
entity sha_pad is
    generic(
        PAD_S0          : integer := 0;
        PAD_S1          : integer := 1;
        PAD_S2          : integer := 2;
        PAD_S3          : integer := 3;
        PAD_S4          : integer := 4;
        PAD_S5          : integer := 5
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        sha_init        : in     vl_logic;
        write_en        : in     vl_logic;
        last_cbyte      : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        rb_ready        : in     vl_logic;
        valid_out       : out    vl_logic;
        data_out        : out    vl_logic_vector(7 downto 0);
        done            : out    vl_logic
    );
end sha_pad;
