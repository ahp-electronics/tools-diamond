library verilog;
use verilog.vl_types.all;
entity usfifo is
    port(
        RS              : out    vl_logic_vector(1 downto 0);
        RA              : out    vl_logic_vector(17 downto 0);
        RQ              : out    vl_logic_vector(35 downto 0);
        PEF             : out    vl_logic;
        PFF             : out    vl_logic;
        FF              : out    vl_logic;
        EF              : out    vl_logic;
        SYNC            : in     vl_logic;
        PE              : in     vl_logic;
        WCLK            : in     vl_logic;
        WRST_N          : in     vl_logic;
        PUSH            : in     vl_logic;
        WD              : in     vl_logic_vector(35 downto 0);
        WA              : in     vl_logic_vector(17 downto 0);
        WS              : in     vl_logic_vector(1 downto 0);
        RCLK            : in     vl_logic;
        RRST_N          : in     vl_logic;
        POP             : in     vl_logic
    );
end usfifo;
