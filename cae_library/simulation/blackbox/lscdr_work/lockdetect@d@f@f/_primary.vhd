library verilog;
use verilog.vl_types.all;
entity lockdetectDFF is
    port(
        RST             : in     vl_logic;
        CLK             : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end lockdetectDFF;
