library verilog;
use verilog.vl_types.all;
entity state_toh is
    generic(
        st0             : integer := 0;
        st1             : integer := 1;
        st2             : integer := 2;
        st3             : integer := 3
    );
    port(
        clk             : in     vl_logic;
        shift_a1a2d     : in     vl_logic;
        a1timed         : in     vl_logic;
        en_pipe         : out    vl_logic;
        resetn          : in     vl_logic
    );
end state_toh;
