library verilog;
use verilog.vl_types.all;
entity pmu_creg_pos is
    generic(
        INIT_VAL        : vl_logic := Hi0
    );
    port(
        r_out           : out    vl_logic;
        pmu_rst_async   : in     vl_logic;
        pmu_clk         : in     vl_logic;
        r_set           : in     vl_logic;
        r_rst           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INIT_VAL : constant is 1;
end pmu_creg_pos;
