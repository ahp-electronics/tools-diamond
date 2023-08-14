library verilog;
use verilog.vl_types.all;
entity chk is
    port(
        b               : in     vl_logic_vector(31 downto 0);
        op              : in     vl_logic;
        eqi             : in     vl_logic;
        eqo             : out    vl_logic
    );
end chk;
