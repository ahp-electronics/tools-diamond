library verilog;
use verilog.vl_types.all;
entity i2cfifo_200psdly is
    port(
        dlyout          : out    vl_logic;
        dlyin           : in     vl_logic;
        sgnd            : in     vl_logic;
        spwr            : in     vl_logic
    );
end i2cfifo_200psdly;
