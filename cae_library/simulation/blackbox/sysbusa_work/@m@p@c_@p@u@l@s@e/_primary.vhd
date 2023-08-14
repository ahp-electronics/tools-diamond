library verilog;
use verilog.vl_types.all;
entity MPC_PULSE is
    port(
        RESET_N         : in     vl_logic;
        SYNC            : in     vl_logic;
        PULSE           : in     vl_logic;
        A               : in     vl_logic;
        CK              : in     vl_logic;
        SCANEN          : in     vl_logic;
        Z               : out    vl_logic
    );
end MPC_PULSE;
