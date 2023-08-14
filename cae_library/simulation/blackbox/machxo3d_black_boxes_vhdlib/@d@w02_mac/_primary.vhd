library verilog;
use verilog.vl_types.all;
entity DW02_mac is
    generic(
        a_width         : integer := 32;
        b_width         : integer := 32
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        C               : in     vl_logic_vector;
        TC              : in     vl_logic;
        MAC             : out    vl_logic_vector
    );
end DW02_mac;
