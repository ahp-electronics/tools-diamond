library verilog;
use verilog.vl_types.all;
entity umfifo is
    port(
        SYNC            : in     vl_logic;
        WCLK            : in     vl_logic;
        WRST_N          : in     vl_logic;
        WCLR            : in     vl_logic;
        PUSH            : in     vl_logic;
        WD              : in     vl_logic_vector(35 downto 0);
        RCLK            : in     vl_logic;
        RRST_N          : in     vl_logic;
        RCLR            : in     vl_logic;
        POP             : in     vl_logic;
        RQ              : out    vl_logic_vector(35 downto 0);
        EF              : out    vl_logic
    );
end umfifo;
