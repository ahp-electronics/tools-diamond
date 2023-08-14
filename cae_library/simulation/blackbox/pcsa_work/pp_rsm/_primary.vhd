library verilog;
use verilog.vl_types.all;
entity pp_rsm is
    generic(
        A1              : integer := 124;
        A2              : integer := 251;
        K               : integer := 188;
        R1              : integer := 28;
        R2              : integer := 253;
        I               : integer := 7;
        K30_7           : integer := 254
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        rio_mode        : in     vl_logic;
        align_status    : in     vl_logic;
        lf              : in     vl_logic_vector(8 downto 0);
        disparity_error_i: in     vl_logic;
        code_violation_i: in     vl_logic;
        rxd_i           : in     vl_logic_vector(7 downto 0);
        rxc_i           : in     vl_logic;
        rxd_o           : out    vl_logic_vector(7 downto 0);
        rxc_o           : out    vl_logic;
        disparity_error_o: out    vl_logic;
        code_violation_o: out    vl_logic
    );
end pp_rsm;
