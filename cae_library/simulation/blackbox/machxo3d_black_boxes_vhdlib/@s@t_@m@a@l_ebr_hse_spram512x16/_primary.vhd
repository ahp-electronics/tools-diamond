library verilog;
use verilog.vl_types.all;
entity ST_MAL_ebr_hse_spram512x16 is
    port(
        Tclk            : in     vl_logic;
        mrst_n          : in     vl_logic;
        BistFail        : out    vl_logic;
        S16             : in     vl_logic;
        S17             : in     vl_logic_vector(15 downto 0);
        MemDo           : in     vl_logic_vector(15 downto 0);
        ErrMap          : out    vl_logic
    );
end ST_MAL_ebr_hse_spram512x16;
