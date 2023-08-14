library verilog;
use verilog.vl_types.all;
entity incdec is
    generic(
        width           : integer := 4
    );
    port(
        A               : in     vl_logic_vector;
        INC_DEC         : in     vl_logic;
        SUM             : out    vl_logic_vector
    );
end incdec;
