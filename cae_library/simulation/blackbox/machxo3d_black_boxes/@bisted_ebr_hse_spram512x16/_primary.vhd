library verilog;
use verilog.vl_types.all;
entity Bisted_ebr_hse_spram512x16 is
    port(
        mrst_n          : in     vl_logic;
        clock_gate_te   : in     vl_logic;
        clk             : in     vl_logic;
        ce              : in     vl_logic;
        we              : in     vl_logic;
        dout            : out    vl_logic_vector(15 downto 0);
        din             : in     vl_logic_vector(15 downto 0);
        addr            : in     vl_logic_vector(8 downto 0);
        por_n           : in     vl_logic;
        rst_n           : in     vl_logic;
        byte_enable     : in     vl_logic_vector(1 downto 0);
        retention_test_en: in     vl_logic;
        ByPass          : in     vl_logic;
        BistFail        : out    vl_logic;
        ErrMap          : out    vl_logic;
        Finish          : out    vl_logic;
        BistMode        : in     vl_logic
    );
end Bisted_ebr_hse_spram512x16;
