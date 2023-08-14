library verilog;
use verilog.vl_types.all;
entity maco_tie is
    port(
        tie_nhi         : out    vl_logic;
        tie_shi         : out    vl_logic;
        tie_ehi         : out    vl_logic;
        tie_elo         : out    vl_logic
    );
end maco_tie;
