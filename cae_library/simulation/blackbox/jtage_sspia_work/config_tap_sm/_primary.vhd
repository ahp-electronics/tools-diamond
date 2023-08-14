library verilog;
use verilog.vl_types.all;
entity config_tap_sm is
    port(
        tck             : in     vl_logic;
        tms             : in     vl_logic;
        por             : in     vl_logic;
        jtag_state      : out    vl_logic_vector(3 downto 0);
        tlreset         : out    vl_logic;
        capir           : out    vl_logic;
        upir            : out    vl_logic;
        rti             : out    vl_logic;
        shiftir         : out    vl_logic;
        seldr           : out    vl_logic;
        capdr           : out    vl_logic;
        updr            : out    vl_logic;
        selir           : out    vl_logic;
        shiftdr         : out    vl_logic
    );
end config_tap_sm;
