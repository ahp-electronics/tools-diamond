library verilog;
use verilog.vl_types.all;
entity BistCtrl_rom64kx32 is
    port(
        Tclk            : in     vl_logic;
        A_i             : in     vl_logic_vector(31 downto 0);
        bist_ctrl       : out    vl_logic_vector(14 downto 0);
        BistFail        : out    vl_logic;
        ShiftEnd        : out    vl_logic;
        SignatureOut    : out    vl_logic;
        SignatureParallel: out    vl_logic_vector(49 downto 0);
        Finish          : out    vl_logic;
        BistMode        : in     vl_logic
    );
end BistCtrl_rom64kx32;
