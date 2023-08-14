library verilog;
use verilog.vl_types.all;
entity i2cfifo_sleep_2buf4 is
    port(
        sleep_out_0     : out    vl_logic;
        sleep_out_1     : out    vl_logic;
        sgnd            : in     vl_logic;
        sleep_in        : in     vl_logic;
        spwr            : in     vl_logic
    );
end i2cfifo_sleep_2buf4;
