library verilog;
use verilog.vl_types.all;
entity instructionFilter is
    generic(
        INVALIDINST     : integer := 1
    );
    port(
        instructionOut  : out    vl_logic_vector(7 downto 0);
        tck             : in     vl_logic;
        trst            : in     vl_logic;
        instr_cap_upir  : in     vl_logic;
        mode            : in     vl_logic_vector(1 downto 0);
        sd_sec_bspi     : in     vl_logic;
        sd_sec_bi2c     : in     vl_logic;
        instructionIn   : in     vl_logic_vector(7 downto 0)
    );
end instructionFilter;
