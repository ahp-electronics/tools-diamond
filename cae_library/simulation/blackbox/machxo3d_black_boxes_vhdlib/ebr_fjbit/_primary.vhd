library verilog;
use verilog.vl_types.all;
entity ebr_fjbit is
    port(
        Q               : inout  vl_logic;
        QB              : inout  vl_logic;
        ADDR            : in     vl_logic;
        D               : inout  vl_logic;
        DN              : inout  vl_logic;
        PWR             : in     vl_logic;
        GND             : in     vl_logic
    );
end ebr_fjbit;
