library verilog;
use verilog.vl_types.all;
entity dlatpqnx2v1s is
    port(
        CK              : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end dlatpqnx2v1s;
