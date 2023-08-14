library verilog;
use verilog.vl_types.all;
entity BUFBUSX4 is
    generic(
        WIDTH           : integer := 16
    );
    port(
        z               : out    vl_logic_vector;
        a               : in     vl_logic_vector
    );
end BUFBUSX4;
