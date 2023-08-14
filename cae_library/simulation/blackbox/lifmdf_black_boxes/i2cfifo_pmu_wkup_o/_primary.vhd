library verilog;
use verilog.vl_types.all;
entity i2cfifo_pmu_wkup_o is
    port(
        wkup_o          : out    vl_logic;
        normal_wkup_i   : in     vl_logic;
        sel             : in     vl_logic;
        sgnd            : in     vl_logic;
        spwr            : in     vl_logic;
        wkup1_i         : in     vl_logic;
        wkup2_i         : in     vl_logic
    );
end i2cfifo_pmu_wkup_o;
