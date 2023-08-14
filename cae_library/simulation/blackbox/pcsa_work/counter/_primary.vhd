library verilog;
use verilog.vl_types.all;
entity counter is
    generic(
        st0             : integer := 0;
        st1             : integer := 1;
        st2             : integer := 2
    );
    port(
        pulse_i         : in     vl_logic;
        clk             : in     vl_logic;
        test_mode       : in     vl_logic;
        resetn          : in     vl_logic;
        load            : in     vl_logic;
        start_seq       : in     vl_logic;
        indata          : in     vl_logic_vector(7 downto 0);
        int             : out    vl_logic;
        do_err          : out    vl_logic
    );
end counter;
