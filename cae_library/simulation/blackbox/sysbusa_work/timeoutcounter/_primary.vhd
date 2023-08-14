library verilog;
use verilog.vl_types.all;
entity timeoutcounter is
    port(
        HCLK            : in     vl_logic;
        HRESET_N        : in     vl_logic;
        Timeout_Enable  : in     vl_logic;
        Timeout_Index   : in     vl_logic_vector(3 downto 0);
        Timeout_Flag    : out    vl_logic
    );
end timeoutcounter;
