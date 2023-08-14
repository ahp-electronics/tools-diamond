library verilog;
use verilog.vl_types.all;
entity randGen is
    generic(
        SEEDWIDTH       : integer := 32
    );
    port(
        seedOut         : out    vl_logic_vector;
        enable          : in     vl_logic;
        mclk            : in     vl_logic;
        mrst            : in     vl_logic
    );
end randGen;
