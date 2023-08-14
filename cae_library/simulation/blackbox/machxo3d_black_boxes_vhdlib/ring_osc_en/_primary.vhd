library verilog;
use verilog.vl_types.all;
entity ring_osc_en is
    port(
        rst             : in     vl_logic;
        start           : in     vl_logic;
        dly_sel         : in     vl_logic_vector(1 downto 0);
        dly_o           : out    vl_logic
    );
end ring_osc_en;
