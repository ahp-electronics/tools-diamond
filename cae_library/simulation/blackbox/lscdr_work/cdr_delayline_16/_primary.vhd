library verilog;
use verilog.vl_types.all;
entity cdr_delayline_16 is
    port(
        INCLK           : in     vl_logic;
        LS              : in     vl_logic_vector(3 downto 0);
        MS              : in     vl_logic_vector(3 downto 0);
        OUTCLK          : out    vl_logic;
        OUTCLK_FB       : out    vl_logic;
        OUTDEL          : out    vl_logic;
        OUTDEL_FB       : out    vl_logic;
        RST_N           : in     vl_logic
    );
end cdr_delayline_16;
