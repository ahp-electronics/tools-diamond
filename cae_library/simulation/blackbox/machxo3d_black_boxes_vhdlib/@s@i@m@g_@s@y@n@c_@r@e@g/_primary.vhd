library verilog;
use verilog.vl_types.all;
entity SIMG_SYNC_REG is
    port(
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        DIN             : in     vl_logic;
        QOUT            : out    vl_logic
    );
end SIMG_SYNC_REG;
