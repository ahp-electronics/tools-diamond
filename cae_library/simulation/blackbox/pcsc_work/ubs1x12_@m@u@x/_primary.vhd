library verilog;
use verilog.vl_types.all;
entity ubs1x12_MUX is
    generic(
        BUS_SIZE        : integer := 1
    );
    port(
        SEL             : in     vl_logic;
        DATA            : in     vl_logic_vector;
        Z               : out    vl_logic
    );
end ubs1x12_MUX;
