library verilog;
use verilog.vl_types.all;
entity toh_pipe is
    port(
        clk             : in     vl_logic;
        resetn          : in     vl_logic;
        shift_a1a2      : in     vl_logic;
        a1time          : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        data_out        : out    vl_logic_vector(7 downto 0)
    );
end toh_pipe;
