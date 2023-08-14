library verilog;
use verilog.vl_types.all;
entity cdrDlatch is
    port(
        RST             : in     vl_logic;
        D               : in     vl_logic;
        CK              : in     vl_logic;
        Q               : out    vl_logic
    );
end cdrDlatch;
