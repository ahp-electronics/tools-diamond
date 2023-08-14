library verilog;
use verilog.vl_types.all;
entity rsffrqnx2v1mce is
    port(
        CD              : in     vl_logic;
        R               : in     vl_logic;
        S               : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end rsffrqnx2v1mce;
