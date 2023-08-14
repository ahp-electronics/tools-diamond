library verilog;
use verilog.vl_types.all;
entity pmu_fsm is
    generic(
        PMUST_IDLE      : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0)
    );
    port(
        pmu_state       : out    vl_logic_vector(2 downto 0);
        pmu_rst_async   : in     vl_logic;
        pmu_clk         : in     vl_logic;
        pmu_next        : in     vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of PMUST_IDLE : constant is 1;
end pmu_fsm;
