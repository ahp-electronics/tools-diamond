library verilog;
use verilog.vl_types.all;
entity osc_analog is
    generic(
        \process\       : integer := 1;
        hf_base         : integer := 10;
        lf_base         : integer := 3125
    );
    port(
        hf_osc_out      : out    vl_logic;
        lf_osc_out      : out    vl_logic;
        vgnda           : inout  vl_logic;
        vsupa           : inout  vl_logic;
        hf_on           : in     vl_logic;
        hf_trim         : in     vl_logic_vector(3 downto 0);
        lf_on           : in     vl_logic;
        lf_trim         : in     vl_logic_vector(3 downto 0);
        ref_on          : in     vl_logic;
        hf_therm_trim   : in     vl_logic_vector(14 downto 0);
        lf_therm_trim   : in     vl_logic_vector(14 downto 0);
        hf_trim_msb     : in     vl_logic;
        lf_trim_msb     : in     vl_logic;
        spwr            : inout  vl_logic;
        sgnd            : inout  vl_logic;
        gmbias_current_test: out    vl_logic;
        vref_lfosc      : out    vl_logic;
        vref_hfosc      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \process\ : constant is 1;
    attribute mti_svvh_generic_type of hf_base : constant is 1;
    attribute mti_svvh_generic_type of lf_base : constant is 1;
end osc_analog;
