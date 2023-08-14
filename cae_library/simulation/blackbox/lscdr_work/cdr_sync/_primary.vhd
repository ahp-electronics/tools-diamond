library verilog;
use verilog.vl_types.all;
entity cdr_sync is
    port(
        L               : out    vl_logic_vector(3 downto 0);
        M               : out    vl_logic_vector(3 downto 0);
        CR              : in     vl_logic;
        RST_N           : in     vl_logic;
        GRAY_COUNT      : in     vl_logic_vector(3 downto 0)
    );
end cdr_sync;
